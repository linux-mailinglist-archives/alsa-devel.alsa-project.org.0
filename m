Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC75AA798
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 08:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 849891661;
	Fri,  2 Sep 2022 08:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 849891661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662098674;
	bh=/xaH0mk6taEZO6M8kViEcaG4rbIkTWxMhINJ72BLoZ8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=llQQQz8AdY5OxREbw1B6gGNPoMiyegn2Mi+dHtSfjkkpqa38z7f5oKrW0JIK+Bl8d
	 fCQ2SzM2T7ZLMuDP1oRD9m8qWUwiGwUoXb0pB6+1sCgNwWPvWD01d+1I4PEQZQ108g
	 0WfvMpmyS5REmrLuaR4/ifUga5MyLOYCKxPC3FhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CA8DF80533;
	Fri,  2 Sep 2022 08:02:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 226B5F8026D; Thu,  1 Sep 2022 16:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36FCF80163
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 16:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36FCF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="iBNu0BAJ"
Received: by mail-pg1-x52e.google.com with SMTP id q63so16566328pga.9
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 07:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=fbvLaxBSrUU1twip21pfwSPLgyOYXUmDr/PBKjQl9Hk=;
 b=iBNu0BAJj/GpEUqQRjnaHH1UAVKM0yqNr+vLtcPE94fECJjuF6vBMeoGPa5BqbF31d
 aCdf1DE9mIPgnNBkJCcVS5e9oT+mAhFu6N85WXBEU4D42jTaTdR/FTe9a9R/l5c16W96
 x8Ps2dkMZ/jFStSqosO9ss1JRD7GN2Nvz6GjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=fbvLaxBSrUU1twip21pfwSPLgyOYXUmDr/PBKjQl9Hk=;
 b=oTq1PB6CJaLgklTIgSze925pTnBgEbQrGqwQeOtklEJrbvk2vp6dnHXdBGs5SYzbxv
 osrfmyKpQzXWLiFLCjdawHLTq1yn/0bOi1Ojgpzhp1mUyodmGLcEx1+wjAjV2d2RGFdz
 bp2qahFebktxXj3SiF7A2sSZH8muujr7atoCMqdoyNOLj4hhO9Ez/HEOqG1HIeF17xni
 OgJwGiB9MuByXtfLH4UmHikBRVURMDtXwLG/6xr6NvU42nZxjVwPKzPK2WBLX69hnTeJ
 87+dgQhd3BgLoBv39BqTA3fGP2cbBC/s5hvwSGLIdZ9jhvWuQwaGXGwty2wePEUPzj4D
 GZAA==
X-Gm-Message-State: ACgBeo02Q0bfvZVW5Ncw3DbtRHLc909GqttnfDD49KCUUCSYgWJ9E9vb
 2AdF06zE2jb10ur3SyuxS0nyoanfIo2JhyM5
X-Google-Smtp-Source: AA6agR6BfX/F1wz6XflLFLFd19euXTh7VtM19NzJrOeQTVd832Lr0ExH5kSESTiAQwpUNn2ABOJ4Wg==
X-Received: by 2002:a63:1a46:0:b0:42c:414a:95ee with SMTP id
 a6-20020a631a46000000b0042c414a95eemr14901158pgm.386.1662043361169; 
 Thu, 01 Sep 2022 07:42:41 -0700 (PDT)
Received: from pteerapong.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a170903019200b001709b9d292esm4238112plg.268.2022.09.01.07.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:42:40 -0700 (PDT)
From: Pattara Teerapong <pteerapong@chromium.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: aloop: Fix random zeros in capture data when using
 jiffies timer
Date: Thu,  1 Sep 2022 14:40:36 +0000
Message-Id: <20220901144036.4049060-1-pteerapong@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Sep 2022 08:02:51 +0200
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Pattara Teerapong <pteerapong@chromium.org>
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

In loopback_jiffies_timer_pos_update(), we are getting jiffies twice.
First time for playback, second time for capture. Jiffies can be updated
between these two calls and if the capture jiffies is larger, extra zeros
will be filled in the capture buffer.

Change to get jiffies once and use it for both playback and capture.

Signed-off-by: Pattara Teerapong <pteerapong@chromium.org>
---

 sound/drivers/aloop.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 9b4a7cdb103a..12f12a294df5 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -605,17 +605,18 @@ static unsigned int loopback_jiffies_timer_pos_update
 			cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	struct loopback_pcm *dpcm_capt =
 			cable->streams[SNDRV_PCM_STREAM_CAPTURE];
-	unsigned long delta_play = 0, delta_capt = 0;
+	unsigned long delta_play = 0, delta_capt = 0, cur_jiffies;
 	unsigned int running, count1, count2;
 
+	cur_jiffies = jiffies;
 	running = cable->running ^ cable->pause;
 	if (running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) {
-		delta_play = jiffies - dpcm_play->last_jiffies;
+		delta_play = cur_jiffies - dpcm_play->last_jiffies;
 		dpcm_play->last_jiffies += delta_play;
 	}
 
 	if (running & (1 << SNDRV_PCM_STREAM_CAPTURE)) {
-		delta_capt = jiffies - dpcm_capt->last_jiffies;
+		delta_capt = cur_jiffies - dpcm_capt->last_jiffies;
 		dpcm_capt->last_jiffies += delta_capt;
 	}
 
-- 
2.37.2.789.g6183377224-goog

