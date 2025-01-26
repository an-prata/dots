#!/usr/bin/env runhaskell

{-# LANGUAGE ViewPatterns #-}

import System.IO
import Data.List
import Data.Char
import Data.Maybe
import System.Environment

main :: IO ()
main = do
    pipe <- getContents'
    f <- fallback
    let title = cutExcess $ makeReplacements $ fromMaybe f $ findTitle pipe
    putStrLn title
    return ()

findTitle :: String -> Maybe String
findTitle = listToMaybe . mapMaybe parseTitle . lines 

parseTitle :: String -> Maybe String
parseTitle (stripPrefix "title: " . dropWhile isSpace -> title) = title

makeReplacements :: String -> String
makeReplacements "helix" = "Helix"
makeReplacements "kitty-scratch" = "Scratch Pad"
makeReplacements s = s

lengthLimit :: Int
lengthLimit = 72

cutExcess :: String -> String
cutExcess s | length s > lengthLimit = (take (lengthLimit - 1) s) ++ "…"
cutExcess s = s

fallback :: IO String
fallback = do
    passwd <- readFile "/etc/passwd"
    user <- getEnv "USER"
    case findUserName user passwd of
        Just name -> return name
        Nothing -> return ""

findUserName :: String -> String -> Maybe String
findUserName user passwd = case find ((== user) . fst) $ findUserNames passwd of
    Just (_, name) -> Just name
    Nothing -> Nothing

findUserNames :: String -> [(String, String)]
findUserNames = mapMaybe getUserName . fmap parsePasswdLine . lines
  where
    getUserName s = do
        user <- s !? 0
        name <- s !? 4
        return (user, name)

parsePasswdLine :: String -> [String]
parsePasswdLine (':':l) = [] : parsePasswdLine l
parsePasswdLine s = s' : parsePasswdLine (drop 1 s'')
  where
    (s', s'') = break (== ':') s
