﻿CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    ProfilePicture NVARCHAR(255),
    Bio NVARCHAR(500),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Posts (
    PostID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,  
    Content NVARCHAR(MAX) NOT NULL,
    DateCreated DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Posts_Users FOREIGN KEY (UserID) REFERENCES Users(Id) ON DELETE CASCADE
);
GO

CREATE TABLE Comments (
    CommentID INT PRIMARY KEY IDENTITY(1,1),
    PostID INT FOREIGN KEY REFERENCES Posts(PostID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    Content NVARCHAR(MAX) NOT NULL,
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Likes (
    LikeID INT PRIMARY KEY IDENTITY(1,1),
    PostID INT FOREIGN KEY REFERENCES Posts(PostID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Friendships (
    FriendshipID INT PRIMARY KEY IDENTITY(1,1),
    UserID1 INT FOREIGN KEY REFERENCES Users(Id),
    UserID2 INT FOREIGN KEY REFERENCES Users(Id),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE FriendRequests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT FOREIGN KEY REFERENCES Users(Id),
    ReceiverID INT FOREIGN KEY REFERENCES Users(Id),
    Status NVARCHAR(50) NOT NULL,
    DateRequested DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Follows (
    FollowID INT PRIMARY KEY IDENTITY(1,1),
    FollowerID INT FOREIGN KEY REFERENCES Users(Id),
    FollowingID INT FOREIGN KEY REFERENCES Users(Id),
    DateFollowed DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    Message NVARCHAR(MAX) NOT NULL,
    IsRead BIT DEFAULT 0,
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE Groups (
    GroupID INT PRIMARY KEY IDENTITY(1,1),
    GroupName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE GroupMembers (
    GroupMemberID INT PRIMARY KEY IDENTITY(1,1),
    GroupID INT FOREIGN KEY REFERENCES Groups(GroupID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    DateJoined DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE GroupPosts (
    GroupPostID INT PRIMARY KEY IDENTITY(1,1),
    GroupID INT FOREIGN KEY REFERENCES Groups(GroupID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    Content NVARCHAR(MAX) NOT NULL,
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE GroupPostLikes (
    GroupPostLikeID INT PRIMARY KEY IDENTITY(1,1),
    GroupPostID INT FOREIGN KEY REFERENCES GroupPosts(GroupPostID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

CREATE TABLE GroupPostComments (
    GroupPostCommentID INT PRIMARY KEY IDENTITY(1,1),
    GroupPostID INT FOREIGN KEY REFERENCES GroupPosts(GroupPostID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    Content NVARCHAR(MAX) NOT NULL,
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

-- جدول الإعدادات
CREATE TABLE Settings (
    SettingID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    SettingName NVARCHAR(100) NOT NULL,
    SettingValue NVARCHAR(255) NOT NULL
);
GO


CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    EventDate DATETIME NOT NULL,
    CreatedByUserID INT FOREIGN KEY REFERENCES Users(Id),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE EventParticipants (
    EventParticipantID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    DateJoined DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE Activities (
    ActivityID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    ActivityType NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO

-- جدول رسائل المجموعات
CREATE TABLE GroupMessages (
    GroupMessageID INT PRIMARY KEY IDENTITY(1,1),
    GroupID INT FOREIGN KEY REFERENCES Groups(GroupID),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    Content NVARCHAR(MAX) NOT NULL,
    DateSent DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE Interactions (
    InteractionID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(Id),
    InteractionType NVARCHAR(50) NOT NULL,
    TargetID INT,
    TargetType NVARCHAR(50),
    DateCreated DATETIME DEFAULT GETDATE()
);
GO


CREATE TABLE Messages (
    MessageID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT,
    ReceiverID INT,
    Content TEXT NOT NULL,
    Timestamp DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (SenderID) REFERENCES Users(Id),
    FOREIGN KEY (ReceiverID) REFERENCES Users(Id)
);
GO