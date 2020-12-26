Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6627E2E2F37
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Dec 2020 22:40:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9A571702;
	Sat, 26 Dec 2020 22:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9A571702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609018845;
	bh=Hzj6xnYe63R73qHUWihRlSAzV2X0NQe2n/6kP4p0sOY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sP0yzXBVrkn/DqdLZV7+Sm938lNRC+Iz7GlvHkauaWmeXCFUSGmLHMLq5sd+fIU+7
	 Ei2Fj8f0mhATf49HPpFAwxx1ebLxNu6fjQbLRG+ZMli9AmbtRlYZk7NbKOqaPjetiz
	 bFvdMtyN12wzdDlOkTqJJXYgUE9L2haU85GfAYmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C77F804E6;
	Sat, 26 Dec 2020 22:36:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B558F804C1; Sat, 26 Dec 2020 22:36:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4B55F80264
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 22:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B55F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kJVJiWFJ"
Received: by mail-pg1-x535.google.com with SMTP id n25so5062358pgb.0
 for <alsa-devel@alsa-project.org>; Sat, 26 Dec 2020 13:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oajtaJ1FloWvs72o5/QEQmodzlTCJh0yoUH5HVvg/Fs=;
 b=kJVJiWFJlxsTUXloKmBgCGFt9DBIxkxM1MExxYV0KRQ0aqPbC67+trBaE7Of+PyRkh
 RRYy83E4R8YN7RtqAOOZGxDUO9Kl9iXoiW2sXut0ezUnEpduIofBlkTVLJF8psLQsDqk
 lYq/juNemsPlnnEHibs11cjVIrPVBDW6TzsctLljJRTVl5k1L7rEXQYapaXEElfuF/RY
 IPiaMTKrLQph61bmQppFTMGHsRlJ3yy1qBbVUKw52/BTiQBSQ9540IakzB0g39JHm76S
 X3MCnqAS2YtMSMuO6nKC0JDpX4Xb3smajVdDbb5fQT3T+jfd/DYfx4P5cWM+MPsYlS9W
 H5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oajtaJ1FloWvs72o5/QEQmodzlTCJh0yoUH5HVvg/Fs=;
 b=U9OxXfh64qIST9xRLh1yN5A/w7rGw0zuHajS+iOTBRMlXMElBfwtHQe7bWk/dWq6Ug
 7A+VQigSyCjEwyxax1XJqW7gdpVFIysOHANPIBfRCLxbGZsLSrheWrzOmb9ClxTb9tmA
 wSnRdyHIE6JCrbefh/abefrsLZQlLNxJ+khmyLfzlCTtWpOANZe23vkk3BzmWVi++tsq
 D9Xah9BFD0IKARM+X177BgYj7nPhYP/LNDDl5zPX+ecgmPtWF3czlHK/fS4lDQvrJqqu
 lMmD/SqbEIthMKBdoI1nQO2zCcdMzrfRzsgxaCrxzqODCNJnwd/V6H5eiGsTUjAfBCru
 +p4g==
X-Gm-Message-State: AOAM533y5+uf+3SeN911M7xLmvTnrEHjtyDP2EKUxYeZEIjVSySDV8Xb
 kAVotRn3MRO8jhuTtS+ZXvqKdXE4xhjYDQ==
X-Google-Smtp-Source: ABdhPJwuh3hoRRu7ExKAyZj3sO6z91On5890vdcUYd/j/TZPgEN5FMDBiwRq+mWiZePq/hX30FP+2g==
X-Received: by 2002:a05:6a00:230d:b029:18b:9cb:dead with SMTP id
 h13-20020a056a00230db029018b09cbdeadmr35032867pfh.24.1609018594040; 
 Sat, 26 Dec 2020 13:36:34 -0800 (PST)
Received: from viper.bn-i.net ([2001:470:b:65c:b92f:8d47:b3dd:6388])
 by smtp.gmail.com with ESMTPSA id b12sm30990560pft.114.2020.12.26.13.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 13:36:33 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: alsa-devel@alsa-project.org,
	perex@perex.cz,
	tiwai@suse.de
Subject: [PATCH 6/9] pcm: remove dead assignments from
 snd_pcm_rate_(commit_area|grab_next_period)
Date: Sat, 26 Dec 2020 14:35:44 -0700
Message-Id: <20201226213547.175071-7-alexhenrie24@gmail.com>
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
 src/pcm/pcm_rate.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
index 5bf7dbb9..dc38e95e 100644
--- a/src/pcm/pcm_rate.c
+++ b/src/pcm/pcm_rate.c
@@ -746,7 +746,6 @@ static int snd_pcm_rate_commit_area(snd_pcm_t *pcm, snd_pcm_rate_t *rate,
 		if (result < 0)
 			return result;
 	      __partial:
-		xfer = 0;
 		cont = slave_frames;
 		if (cont > slave_size)
 			cont = slave_size;
@@ -846,7 +845,6 @@ static int snd_pcm_rate_grab_next_period(snd_pcm_t *pcm, snd_pcm_uframes_t hw_of
 		if (result < 0)
 			return result;
 	      __partial:
-		xfer = 0;
 		cont = slave_frames;
 		if (cont > rate->gen.slave->period_size)
 			cont = rate->gen.slave->period_size;
-- 
2.29.2.368.ge46b91665e.dirty

