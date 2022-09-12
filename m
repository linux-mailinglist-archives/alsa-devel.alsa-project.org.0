Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BC5B5562
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635CD16D7;
	Mon, 12 Sep 2022 09:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635CD16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662967892;
	bh=MJLYooimvlYyFXUd7oBnJ06IF6G4qiNiOJBKWew7nZQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EhW5bTI1B/QRmenEMpzgbIC0a8akVimEP8UM+nSBIgGhZYGtAOXsqcFywzkYK1zr8
	 dwnF0ry4d/m4WUOf7aZnVgq6Ws90tZJWvUG594p9qMWx5ER0jZgNpHqKa0jIxn9Fiv
	 8eAH0ljqFuuPlBKaAcuqUW4FTUGjDZJIsLeoTDV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE6CF8030F;
	Mon, 12 Sep 2022 09:30:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65CD7F8027B; Mon, 12 Sep 2022 09:30:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1752F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1752F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Hcmq27NH"
Received: by mail-pj1-x102a.google.com with SMTP id
 n23-20020a17090a091700b00202a51cc78bso5225965pjn.2
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=CK6XIpefy3/wH7x7ijKJf8zjoreJxucwMJjlvPQYCqM=;
 b=Hcmq27NHAy3z+4cG0SVQQd+fZ1/jc2GeejYyOfYCsFBqXYIbMXAR5thORHA1NDWlZO
 qnFRghwY11MQyO7syFahFHur08dpjCHZMDWn/ll+xTA2UPk2eQOh/NTRBUPZ4Z/+SlmA
 NLwf04AXksZltPBJtDg2BTZVfaMrnzcVuSq0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=CK6XIpefy3/wH7x7ijKJf8zjoreJxucwMJjlvPQYCqM=;
 b=rMYp7OA9HeIFfJwSsexfi55+q3hFwTydMcVvkn+IlB+QXFnsLu83NjywYYD8GNZVlB
 I0nfpckCVMExdADE0KKSkFIf++b675V/9mO+mbG5BkLy+hVW1LqV86qEDs5DhFMG8o4s
 1rmri6LLuWKFh53Gi+KW2aOW9vqbc0zIBht+JgCV2YTtig6FH6a+8/8+PloxB+dYNZdZ
 WR/zVJyZQYeN789LnAXRJ8S2wgRm1+HWbh99WqgpxbBtKJ1BPVHnxy9RAYCGgiWatkvc
 Q1kDUAkgcDfnLYjhgL3fiWUnSR/clxrVxaxd0RfeMskY75UMCjFfEnklAaKLlQcUGohg
 CvnA==
X-Gm-Message-State: ACgBeo2D4mPrrpvjG1NTPEF4Tj+8jhsEmrTt1/83pmbkjGmkqa4Gfx9b
 Io8yLqOst0fbacTros8+Zx9iew==
X-Google-Smtp-Source: AA6agR6vFVlg3Lae6dq+F8i18SG9dsYYmiCNbnuMk+cD9kBQUAPWJAESM62XMzfoJND/WN79EeYTtA==
X-Received: by 2002:a17:90a:1786:b0:202:856e:29bf with SMTP id
 q6-20020a17090a178600b00202856e29bfmr16907426pja.134.1662967822211; 
 Mon, 12 Sep 2022 00:30:22 -0700 (PDT)
Received: from yjscloudtop.c.googlers.com.com
 (21.160.199.104.bc.googleusercontent.com. [104.199.160.21])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a63f204000000b00438eaf65766sm1962955pgh.73.2022.09.12.00.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 00:30:20 -0700 (PDT)
From: YJ Lee <yunjunlee@chromium.org>
To: 
Subject: [PATCH v1] ALSA: dummy: Add customizable volume min/max.
Date: Mon, 12 Sep 2022 15:29:45 +0800
Message-Id: <20220912072945.760949-1-yunjunlee@chromium.org>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, YJ Lee <yunjunlee@chromium.org>,
 whalechang@chromium.org, yuhsuan@chromium.org
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

Add module parameters to support customized min/max volume leveling,
which will be useful to test devices with different volume granularity.

Signed-off-by: YJ Lee <yunjunlee@chromium.org>
---
 sound/drivers/dummy.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 2a7fc49c1a7c5..64fb2778f1e9a 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -42,6 +42,8 @@ MODULE_LICENSE("GPL");
 #define USE_CHANNELS_MAX 	2
 #define USE_PERIODS_MIN 	1
 #define USE_PERIODS_MAX 	1024
+#define USE_MIXER_VOLUME_LEVEL_MIN	-50
+#define USE_MIXER_VOLUME_LEVEL_MAX	100
 
 static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* Index 0-MAX */
 static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
@@ -50,6 +52,8 @@ static char *model[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = NULL};
 static int pcm_devs[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 1};
 static int pcm_substreams[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 8};
 //static int midi_devs[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 2};
+static int mixer_volume_level_min = USE_MIXER_VOLUME_LEVEL_MIN;
+static int mixer_volume_level_max = USE_MIXER_VOLUME_LEVEL_MAX;
 #ifdef CONFIG_HIGH_RES_TIMERS
 static bool hrtimer = 1;
 #endif
@@ -69,6 +73,10 @@ module_param_array(pcm_substreams, int, NULL, 0444);
 MODULE_PARM_DESC(pcm_substreams, "PCM substreams # (1-128) for dummy driver.");
 //module_param_array(midi_devs, int, NULL, 0444);
 //MODULE_PARM_DESC(midi_devs, "MIDI devices # (0-2) for dummy driver.");
+module_param(mixer_volume_level_min, int, 0444);
+MODULE_PARM_DESC(mixer_volume_level_min, "Minimum mixer volume level for dummy driver. Default: -50");
+module_param(mixer_volume_level_max, int, 0444);
+MODULE_PARM_DESC(mixer_volume_level_max, "Maximum mixer volume level for dummy driver. Default: 100");
 module_param(fake_buffer, bool, 0444);
 MODULE_PARM_DESC(fake_buffer, "Fake buffer allocations.");
 #ifdef CONFIG_HIGH_RES_TIMERS
@@ -713,8 +721,8 @@ static int snd_dummy_volume_info(struct snd_kcontrol *kcontrol,
 {
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 2;
-	uinfo->value.integer.min = -50;
-	uinfo->value.integer.max = 100;
+	uinfo->value.integer.min = mixer_volume_level_min;
+	uinfo->value.integer.max = mixer_volume_level_max;
 	return 0;
 }
  
@@ -739,15 +747,15 @@ static int snd_dummy_volume_put(struct snd_kcontrol *kcontrol,
 	int left, right;
 
 	left = ucontrol->value.integer.value[0];
-	if (left < -50)
-		left = -50;
-	if (left > 100)
-		left = 100;
+	if (left < mixer_volume_level_min)
+		left = mixer_volume_level_min;
+	if (left > mixer_volume_level_max)
+		left = mixer_volume_level_max;
 	right = ucontrol->value.integer.value[1];
-	if (right < -50)
-		right = -50;
-	if (right > 100)
-		right = 100;
+	if (right < mixer_volume_level_min)
+		right = mixer_volume_level_min;
+	if (right > mixer_volume_level_max)
+		right = mixer_volume_level_max;
 	spin_lock_irq(&dummy->mixer_lock);
 	change = dummy->mixer_volume[addr][0] != left ||
 	         dummy->mixer_volume[addr][1] != right;
@@ -1076,6 +1084,12 @@ static int snd_dummy_probe(struct platform_device *devptr)
 			dummy->pcm_hw.channels_max = m->channels_max;
 	}
 
+	if (mixer_volume_level_min > mixer_volume_level_max) {
+		pr_warn("snd-dummy: Invalid mixer volume level: min=%d, max=%d. Fall back to default value.\n",
+		mixer_volume_level_min, mixer_volume_level_max);
+		mixer_volume_level_min = USE_MIXER_VOLUME_LEVEL_MIN;
+		mixer_volume_level_max = USE_MIXER_VOLUME_LEVEL_MAX;
+	}
 	err = snd_card_dummy_new_mixer(dummy);
 	if (err < 0)
 		return err;
-- 
2.31.0

