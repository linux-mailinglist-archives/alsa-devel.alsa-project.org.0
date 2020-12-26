Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF742E2F3A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 22:41:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90E881855;
	Sat, 26 Dec 2020 22:40:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90E881855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609018899;
	bh=OtJwW2dEDE9yvmdjhTCGV7+lk7O5ntp8OkFUMCAIGlE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWYmvLj9i481Ugy9YgA9C0B0UPei693FRnqfjDUC6lmQUNAga1Dgig6tSk55gxrTS
	 akAyPNAtY4NNCI20Jt0YgT2JvC4GPF6y7az4oMUATqZOj09aIQZGvlhYsvgWU0SdDj
	 l6i623fWAxt+HHaBzMNQSjOVMVxoub4PfMc4bv60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88206F804FE;
	Sat, 26 Dec 2020 22:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCAA0F804CA; Sat, 26 Dec 2020 22:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4B9BF800C8
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 22:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4B9BF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uWk2fmKX"
Received: by mail-pj1-x1030.google.com with SMTP id iq13so3977299pjb.3
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 13:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SGvZhjq5QthoZWs63qADXvtqQZNJI6Nm2I7oDs2JzP8=;
 b=uWk2fmKXwSvrqYS5a+lcHPZFPlb7ZzcLF3hOVyx+bgenNq5vrfJAoYNcf5rei5eC/9
 Keg8VdcpkQLt1dQpHjONrIdhVBYA+0ZQl0zciQU/StQCfA7TSomEqsSLcj2eJfCC1qkm
 PZspiDA4WrFsKNOpXBZGCnKw26/ifoYTcCY1ObNYYT0nZuKpKEpoqqgpg+1E+iQoku+4
 KIzTBpwdyuXC0RHF9okbj+MZWA2Zk6idNPDzQtbTDbVkwCIHMV3VFBSg2dsaWu4M8Iu9
 Na36HqSCzt0Hl8+EwN56Kc5dE8a20yLv1JYwqdwjqgDYD5rut7rMLABwmTnIuwzSR/uZ
 sCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SGvZhjq5QthoZWs63qADXvtqQZNJI6Nm2I7oDs2JzP8=;
 b=F/VFxpqYYs/aOhdLrqJfPJaOkJ51kxyhGfquoYulH5462of1c5UQw46/DK1R6BFFwm
 dXKFHrbntw/2thwhEkG1tbcV3/zkPerWd3temf+5xe6Ptz0shl3iMWuI46WWuvUSv2iL
 SkQSbfgD8MtP25ksVjQrazYvt6eowsxvn7Z6WXj6FYebdUtM7Aovwe0wCe6n5y7g0dhx
 0oXy8JTSZRhJ3Wts93Q7NNqxGHxjsX2j6tRb2PVg7I0LzaUqxgFX4OVHOOuYlbTTch+h
 vo2geYe4Qi4nq23B3lAFC0UAaB7wkg5LGJ+gX5BhAQgkwZOlzTxVYUebL8M+N6vkCUmc
 josw==
X-Gm-Message-State: AOAM532sY+G7W2SyY3aNYcL09hFH35mXlbwajp8MI7OXoOyQqCu8m37o
 4Dxa76SoC367lejOyQlVpzlyFRQqSLdj8A==
X-Google-Smtp-Source: ABdhPJyhB2/PnmlaWcmPctU560N3oVfw9Mu0GVJFVgAPnXN294POfrBfg2yDjxRvTo66gGwMDovOvQ==
X-Received: by 2002:a17:90a:be0a:: with SMTP id
 a10mr14385329pjs.139.1609018598228; 
 Sat, 26 Dec 2020 13:36:38 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm30990560pft.114.2020.12.26.13.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 13:36:37 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH 9/9] conf: remove dead code from get_hexachar
Date: Sat, 26 Dec 2020 14:35:47 -0700
Message-Id: <20201226213547.175071-10-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.29.2.368.ge46b91665e.dirty
In-Reply-To: <20201226213547.175071-1-alexhenrie24@gmail.com>
References: <20201226213547.175071-1-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Henrie <alexhenrie24@gmail.com>
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

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 src/conf.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/src/conf.c b/src/conf.c
index 44d1bfde..970ad643 100644
--- a/src/conf.c
+++ b/src/conf.c
@@ -877,16 +877,9 @@ static int get_nonwhite(input_t *input)
 
 static inline int get_hexachar(input_t *input)
 {
-	int c, num = 0;
-
+	int c;
 	c = get_char(input);
-	if (c >= '0' && c <= '9') num |= (c - '0') << 4;
-	else if (c >= 'a' && c <= 'f') num |= (c - 'a') << 4;
-	else if (c >= 'A' && c <= 'F') num |= (c - 'A') << 4;
 	c = get_char(input);
-	if (c >= '0' && c <= '9') num |= (c - '0') << 0;
-	else if (c >= 'a' && c <= 'f') num |= (c - 'a') << 0;
-	else if (c >= 'A' && c <= 'F') num |= (c - 'A') << 0;
 	return c;
 }
 
-- 
2.29.2.368.ge46b91665e.dirty

