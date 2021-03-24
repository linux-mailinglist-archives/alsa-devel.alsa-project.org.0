Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC13471EC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 07:56:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70B851685;
	Wed, 24 Mar 2021 07:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70B851685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616568964;
	bh=39Kqs/LuUaZO9E/WD6+Ou1FqisadsD1jiibJQqE1jBg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l/d8jzzglcnskfnXPP/u7qskjL/gjWWDh8hoyhowrXp2+4muBnmTNTDB0GQ7rjr9S
	 nJXADvIK6bHxi1YaVDEGWojHGHSGNAq2wHdWPNTW7v6lA9QBMSYeE3qc13/NGKm/mm
	 5uEkd7FKju0hgZvetMda0ePUwv1+07gfpqM8KNgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB87F800FF;
	Wed, 24 Mar 2021 07:54:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 650AAF8016B; Wed, 24 Mar 2021 07:54:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 502D6F800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 07:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 502D6F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lfyIEa2O"
Received: by mail-qt1-x82c.google.com with SMTP id c6so16861667qtc.1
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4R/MGKyN4C47IKNV5TQKdwyHLk8O1Lq8WRqX8AYrH4=;
 b=lfyIEa2OhXSN5XPjKhJ2Nr6udYswvPAqWOuA+4u7n4Rm/uKnxaj8LAZjTu17ncNuwc
 789Exa8onpDlbxIBJ6JxNgvs9Cw2GRrum2JcyW0tY5vPrYwOhazpPL7p08NIx+EONF/E
 LymnT4k9WucJWvWg1McADIekt+9jlNumVoJq4ZDj06E34ZhxLjnayFEYLljZUHtvJ3rm
 hCv4bIsxbICJYC0Jx14kgzRc8jUGTa4ZELUj15gmUGpKeSD8BSijpBQarNA1RJ7KJbgr
 6I15ejsNaER/stVBf6JBTLNl6JLLw+pXvBpleTOo/MwpCcTkxOv21fs4C5HmbFYtYtiW
 H3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n4R/MGKyN4C47IKNV5TQKdwyHLk8O1Lq8WRqX8AYrH4=;
 b=ddzw+IDbTts82L6Ad9Z0t9SYJqvQSEn4fjoFHwDux5TazlmaqKkNVYu3O6wzcgRswl
 dXpo4jsnnX4McQdYPpaInUNr7eKZyzEJF3n0IuaOP7Yg4cG7916bs/cTmu+SB6+62Cbk
 ajBjHOfnuueii1Uw3KT3grzCoL4Kw3C+C3nYXnoC7suAqc+c4/iiwSAaLFpY90S7/w2Z
 UWYwRS1DM0ApI1EU7GRHhao1VAO6WsvsN/GFK86giwNrPli4lrWW1+IaZpMsMooIKdUh
 N2RMb4xsJNtCWOqCrwXKCp3If1GhTp581Agm2Dmzk6Ht8Zlmd9Ox8n14VkVCT8c6Cv6f
 KZhw==
X-Gm-Message-State: AOAM531H9LLWESutdAXk+jJjU21cQGZJPwnEq2/eyZLC6X8CoSSTqkSf
 2Q/1Rx2KxAcOelmbewFpw00=
X-Google-Smtp-Source: ABdhPJwN4YKz4zEJj/rZmEbgmjNbOJ19KhK30xYDe7erSOUVmllCe+LX9/n7UImLHVXAhGm+P5LaKQ==
X-Received: by 2002:ac8:4e51:: with SMTP id e17mr1735507qtw.204.1616568871952; 
 Tue, 23 Mar 2021 23:54:31 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.37.194])
 by smtp.gmail.com with ESMTPSA id n6sm846413qtx.22.2021.03.23.23.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 23:54:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: perex@perex.cz, tiwai@suse.com, broonie@kernel.org,
 mirq-linux@rere.qmqm.pl, unixbhaskar@gmail.com, lars@metafoo.de,
 joe@perches.com, huawei@kernel.org, viro@zeniv.linux.org.uk,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: A typo fix
Date: Wed, 24 Mar 2021 12:26:12 +0530
Message-Id: <20210324065612.31362-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rdunlap@infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


s/unconditonally/unconditionally/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 sound/core/pcm_native.c | 80 ++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 17a85f4815d5..9884961bca7d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c

-	return 0; /* unconditonally stop all substreams */
+	return 0; /* unconditionally stop all substreams */
 }

--
2.30.1

