Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EDAFFC9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 17:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264D216E2;
	Wed, 11 Sep 2019 17:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264D216E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568215177;
	bh=laOaf4s8jzxT1vubYGDShgVVzpBm7l/BJdmeVklJnoU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u3hIVEGF7iK0AyH8yqyKTtTGAsnvLlZ4zLaaKBFEqFxQCGSswXKawS1hdU7da6cKy
	 myyouI4ekD/naczpwD0JSXZLlUEyRDa7FduRk7sXYfrbVDAbUEbYQiuTW0YZNRGhPO
	 68+v0I4CtAEnt3j3Q5uB8vvzQ5bYJqArTkR8BwfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10CFBF805FC;
	Wed, 11 Sep 2019 17:16:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59C2EF804CF; Mon,  9 Sep 2019 19:45:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57C9DF800C9
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 19:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C9DF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M9XjvkCU"
Received: by mail-pl1-x643.google.com with SMTP id b10so6864994plr.4
 for <alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 10:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=NyVhJPPTs6wJnDV91iq2gfn2ADsla6hIU5GumREy3IU=;
 b=M9XjvkCU8U0uc2A2HXkCDBumTsIS6nsgiD4PpQon98qdueFJ/bxdz8ON6SfMx3hgFN
 aOOL0CBopLJ0Bdf6qem737wLy+F7G7ZNTprUazDp/KwTQXuO04EMFI8PggDeqxj/7b+B
 oA7mU5eRAqRtD5NpqHTuV3kgdTPWRR1E2SlG8z8CuD29EFxUo6Pyh3Te+pg6HqWIgKPD
 WhPaF6JmubDLd+fHXvT1S16wM6vcI9DTrMhs62+65QZ0Lk08dyWqwGKQKY13p6LwrYiJ
 EA38F/qILGOCkDmfsnWUYehYUYIdbErBOUD/AP8VOevLr6+lCc6/ARFwKkqMAiWdQTG3
 miYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=NyVhJPPTs6wJnDV91iq2gfn2ADsla6hIU5GumREy3IU=;
 b=Mk00gCqOjnMJoCxwdLurpEcq2FLwQw4Dtx1FU3l9otq6BwS6NVqZrf7fzxl5id6I4N
 FV6z1DWD+8IHTCC5bULwkttmYyhPw2h6mpTe1ftXRZqmnNH4bJHUHdDhkiVO9OrefZU1
 p5D6kagUuARqADXr1gJ22TJ+y5TQUDVEpALCc18ru2hJwfxRBrwLgTL3fQxT86BupRf5
 bsCwYsaz5fuqfgWg+t9jKnxbwp3TUw5BM2oMtjYl5Lyuf8BExmdLTEJZJ0ut2T3QvhrH
 VrCP306SbIiI7ny7fAsOWRUT+yk/gmvzCsRJtH7EO5Xd9SgvV4otiU9mAfauFnHixnkV
 rAZw==
X-Gm-Message-State: APjAAAUOxXeBVfKp+0BG8qTGuaQnC7qy8xvB+GTQNfUCxKC5N1xRSuzh
 J9q3iiWZGvA6VUOg/aFI77I=
X-Google-Smtp-Source: APXvYqxneiElM9L6z2oc9GIFmEdOmZXAESGHesiUPjLlmzl0qWX+82SU80jLw2IpeN/5P0XxDrUsqw==
X-Received: by 2002:a17:902:b201:: with SMTP id
 t1mr25927892plr.144.1568051153805; 
 Mon, 09 Sep 2019 10:45:53 -0700 (PDT)
Received: from SD ([2405:204:810e:f33:a5a3:6372:2e94:6aea])
 by smtp.gmail.com with ESMTPSA id u9sm162507pjb.4.2019.09.09.10.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 10:45:53 -0700 (PDT)
Date: Mon, 9 Sep 2019 23:15:41 +0530
From: Saiyam Doshi <saiyamdoshi.in@gmail.com>
To: broonie@kernel.org, srinivas.kandagatla@linaro.org
Message-ID: <20190909174541.GA22718@SD>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Wed, 11 Sep 2019 17:16:13 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: wcd9335: remove redundant use of ret
	variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All these functions declares and initializes variable ret with
'0' and without modifying 'ret' variable, it is returned.

This patch removes this redundancy and returns '0' directly.

Signed-off-by: Saiyam Doshi <saiyamdoshi.in@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 03f8a94bba2f..f318403133e9 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3022,7 +3022,6 @@ static int wcd9335_codec_enable_slim(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = snd_soc_component_get_drvdata(comp);
 	struct wcd_slim_codec_dai_data *dai = &wcd->dai[w->shift];
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -3034,7 +3033,7 @@ static int wcd9335_codec_enable_slim(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
@@ -3539,7 +3538,6 @@ static int wcd9335_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 	int hph_mode = wcd->hph_mode;
 	u8 dem_inp;
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3579,7 +3577,7 @@ static int wcd9335_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_lineout_dac_event(struct snd_soc_dapm_widget *w,
@@ -3607,7 +3605,6 @@ static int wcd9335_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3621,7 +3618,7 @@ static int wcd9335_codec_ear_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static void wcd9335_codec_hph_post_pa_config(struct wcd9335_codec *wcd,
@@ -3692,7 +3689,6 @@ static int wcd9335_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 	int hph_mode = wcd->hph_mode;
 	u8 dem_inp;
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3731,7 +3727,7 @@ static int wcd9335_codec_hphr_dac_event(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
@@ -3741,7 +3737,6 @@ static int wcd9335_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 	int hph_mode = wcd->hph_mode;
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3780,7 +3775,7 @@ static int wcd9335_codec_enable_hphl_pa(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_enable_lineout_pa(struct snd_soc_dapm_widget *w,
@@ -3789,7 +3784,6 @@ static int wcd9335_codec_enable_lineout_pa(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	int vol_reg = 0, mix_vol_reg = 0;
-	int ret = 0;
 
 	if (w->reg == WCD9335_ANA_LO_1_2) {
 		if (w->shift == 7) {
@@ -3837,7 +3831,7 @@ static int wcd9335_codec_enable_lineout_pa(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static void wcd9335_codec_init_flyback(struct snd_soc_component *component)
@@ -3892,7 +3886,6 @@ static int wcd9335_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	struct wcd9335_codec *wcd = dev_get_drvdata(comp->dev);
 	int hph_mode = wcd->hph_mode;
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -3930,14 +3923,13 @@ static int wcd9335_codec_enable_hphr_pa(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
 				       struct snd_kcontrol *kc, int event)
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
-	int ret = 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -3967,7 +3959,7 @@ static int wcd9335_codec_enable_ear_pa(struct snd_soc_dapm_widget *w,
 		break;
 	};
 
-	return ret;
+	return 0;
 }
 
 static irqreturn_t wcd9335_slimbus_irq(int irq, void *data)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
