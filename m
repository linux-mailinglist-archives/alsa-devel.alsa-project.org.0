Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CF82E2F2A
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 22:38:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE28917BB;
	Sat, 26 Dec 2020 22:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE28917BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609018699;
	bh=GTTK4V9m8/VcLg1E9jpOQxTRRaO3nhdjwOEbxA2Z0tw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKedPV/RGxVn9Xrl3vbK9GPeidKw8HFmPc8w6PQ0hbIqOqT2cZQMHcfgCcCMfe9pE
	 NEvg40Qr/TfrMnevfHkj586AsIvNiA4qyJx7fG12jF5InZK/xu9a4bAsjrWhrMv/iU
	 9PEjlvZuEk97/6mcUVq6MpaHQAfVlkRdHD8DIhII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B50F8023E;
	Sat, 26 Dec 2020 22:36:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B96CFF80232; Sat, 26 Dec 2020 22:36:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BB77F800C8
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 22:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BB77F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QsftzD5G"
Received: by mail-pf1-x432.google.com with SMTP id c12so4222747pfo.10
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 13:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tKmMbrBI0IoiaJom1wtr6FnlcmMntFbvrNWGv7RBWXY=;
 b=QsftzD5GK+21TCNx7gXfh5ibIbsAoETRAZOBRWYEZj0BAEBtfj2fLvk76YP3IRvUMQ
 NVmc6MhJ7WLxb8aS3dnPSTpcKH7v7FeqoOVzqUY/qN2HXSmx8lF3s1QvhSvVcjDBLGwX
 JvTNkyiLZW0VmBTU0ZdNnaFUn0w9kU4i4Akr0m9KZhX3r69T0zRFso08oC7R+y2XLjnt
 /sOg2Wnq2Szc2TrNyhQz5Z2QfFPiIrLQyGurWFFwUXsVU5AkBRwo0x2L+Rpxv/BPXzlr
 8PjgVd3W6IBmiRxvN476m7C27mWhxVUSmbW77QVtQHJWbazmQi56DuRmGssXzp17Hraw
 D/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tKmMbrBI0IoiaJom1wtr6FnlcmMntFbvrNWGv7RBWXY=;
 b=NXu1FidV/74CZ1abKvnYSLlHTlgcMxajnX+63qqyLRU5KSbkK7u8MjREMXsxJs4me6
 SJGCMtJTAyzleMCnH7Ytmp+tJoI4ORgUKHdTlAzdz8FFRb3uQm8E02Bpid+TkeY7wfH3
 GO/ReUANC/ID+UHt1Vjav1uyHBqC4uowHXzuVaIXvxm0TqQTrxaL6TMH2Ud6enqRrdsA
 TH6A7Lrf5YVchpf61OhF5DEFImfOQS993WmeBBJ4xhIkdaWsc9qQ2So2YA5NtBfIw3Jr
 G9QXU6PnwT8kyhA7YJGLmYKXbNVw2wqxPaoWMyspi25HEXOTnqnSdECtaIhZTgm5q3sG
 BWlA==
X-Gm-Message-State: AOAM531s4DJrotGnW6ZlxNBDU5Kp1XP6T/M7g3MdA2+nibbG3Af2dQIP
 8hfE6KhjZURzRb2urrfrcRpPPmQuTLJrSA==
X-Google-Smtp-Source: ABdhPJwE3Q/Rit2oqMEgWyyZO5mbQIJjOlCj9kQHPnhErJbtMbx6r36lbHN+klaPMZNtVhF2xcQ2ZA==
X-Received: by 2002:a63:d18:: with SMTP id c24mr36942046pgl.442.1609018588006; 
 Sat, 26 Dec 2020 13:36:28 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm30990560pft.114.2020.12.26.13.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 13:36:27 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH 2/9] ucm: fix bad frees in get_list0 and get_list20
Date: Sat, 26 Dec 2020 14:35:40 -0700
Message-Id: <20201226213547.175071-3-alexhenrie24@gmail.com>
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
 src/ucm/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/ucm/main.c b/src/ucm/main.c
index 3871d5aa..754b967e 100644
--- a/src/ucm/main.c
+++ b/src/ucm/main.c
@@ -666,7 +666,7 @@ static int get_list0(struct list_head *list,
 	}
 	return cnt;
       __fail:
-        snd_use_case_free_list((const char **)res, cnt);
+        snd_use_case_free_list(*result, cnt);
         return -ENOMEM;
 }
 
@@ -724,7 +724,7 @@ static int get_list20(struct list_head *list,
 	}
 	return cnt;
       __fail:
-        snd_use_case_free_list((const char **)res, cnt);
+        snd_use_case_free_list(*result, cnt);
         return -ENOMEM;
 }
 
-- 
2.29.2.368.ge46b91665e.dirty

