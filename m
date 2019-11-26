Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A721099C1
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 08:56:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43081172C;
	Tue, 26 Nov 2019 08:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43081172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574754984;
	bh=k1AQKaxDj4XwdYKN9AnNV+aLt2cvNTZa+Ns3RRwQHzo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lGRhLHu5n5aIQ4Y5o7xdBtVoERPnxD6TkUk2/EMQnWTCBe26uIVMZrATuxZ9vZED1
	 IaDGWnV6/IPYb1IW/Mb73mTT/8h7o/X40x7AvmBP425FnIxwayI5dDa5ex6jkZ/eTo
	 iMJaApvT9WHTc5ARiYJSytV6GLUIO+iIo8m0XZCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10D0AF801ED;
	Tue, 26 Nov 2019 08:54:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C23EF80159; Tue, 26 Nov 2019 08:54:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B138F800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 08:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B138F800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IDpsxu5v"
Received: by mail-pg1-x542.google.com with SMTP id t3so8116483pgl.5
 for <alsa-devel@alsa-project.org>; Mon, 25 Nov 2019 23:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYZPHR0XrSUhALfClmZ9OBm8nT/qbgSchvFq1xCdm+s=;
 b=IDpsxu5vGx4jOJfXXC16eWB2IIc2WC2nO4G1IsmUgGSuecBLKNb9rzwJLACtBkLdRa
 F3/fWHWDfzjQBOPW9scgJ28T2pjC5zRQGrzPqEQ4mlKmzN68ANQs1UW61qDqHO6CiN54
 58/cS+NWnR2vnapXyZbdvA9iZGOPp7vs2lBoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AYZPHR0XrSUhALfClmZ9OBm8nT/qbgSchvFq1xCdm+s=;
 b=Q+nNl7AyRg1uc4/jt/PsJgO5st86J2LWVlbTkPbp9zjqee487omAAuOgw3NE6EqOsj
 7WmUyPgteUvvYOcB5kTYPbnXbb9SNWqY1bazpLQ7WjNycTAv+GgYgfwld7+P7lMYVjWd
 G3vCgqRAr+0WrHoy5nb8d5JuhBlSbsHZtS+jS84IgQq4tGj1a2aPySypam0d+kdVzdxz
 p+V5xBmOcKYAhF6O27adxm3NWw5I9hnqMPlUzxWdQwWDmvtIdqnypAkdHoJ88rMuu7/k
 PxcEIym0aOQPnMFX1Mkivq63+4h/zXunvyf1jlJX3KWz3KV0OFvFa0JXJyKkebHpT1Lo
 E/EQ==
X-Gm-Message-State: APjAAAU7UyE/ds/boLKQzyur8McBLjgfVjNJ9S2W4CGKluXlstPoAv/I
 AEdliEiSqANZRdKzdetFYf41Tw==
X-Google-Smtp-Source: APXvYqzg7jEx4NjEC6bym4272COb52LPGhJXuKp86gB3AyuTw96/R/XRdfPf+Zyhj/X+X1RODQ4Ywg==
X-Received: by 2002:a65:4c48:: with SMTP id l8mr36429991pgr.195.1574754870389; 
 Mon, 25 Nov 2019 23:54:30 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id w26sm11539748pfj.123.2019.11.25.23.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 23:54:29 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue, 26 Nov 2019 15:54:24 +0800
Message-Id: <20191126075424.80668-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Andi Kleen <ak@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Agrawal Akshu <Akshu.Agrawal@amd.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: AMD: Enable clk in startup intead of
	hw_params
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

Some usages only call startup and shutdown without setting hw_params
(e.g. arecord --dump-hw-params). If we don't enable clk in startup, it
will cause ref count error because the clk will be disabled in shutdown.
For this reason, we should move enabling clk from hw_params to startup.

In addition, the hw_params is fixed in this driver(48000 rate, 2
channels, S16_LE format) so we don't need to change the clk rate after
the hw_params is set.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/amd/acp-da7219-max98357a.c | 46 +++++++++-------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index f4ee6798154af5..7a5621e5e2330d 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -96,14 +96,19 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static int da7219_clk_enable(struct snd_pcm_substream *substream,
-			     int wclk_rate, int bclk_rate)
+static int da7219_clk_enable(struct snd_pcm_substream *substream)
 {
 	int ret = 0;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
-	clk_set_rate(da7219_dai_wclk, wclk_rate);
-	clk_set_rate(da7219_dai_bclk, bclk_rate);
+	/*
+	 * Set wclk to 48000 because the rate constraint of this driver is
+	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
+	 * minimum of 64x the LRCLK sample rate." DA7219 is the only clk
+	 * source so for all codecs we have to limit bclk to 64X lrclk.
+	 */
+	clk_set_rate(da7219_dai_wclk, 48000);
+	clk_set_rate(da7219_dai_bclk, 48000 * 64);
 	ret = clk_prepare_enable(da7219_dai_bclk);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't enable master clock %d\n", ret);
@@ -156,7 +161,7 @@ static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_SP_INSTANCE;
-	return 0;
+	return da7219_clk_enable(substream);
 }
 
 static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
@@ -178,7 +183,7 @@ static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
 	machine->capture_channel = CAP_CHANNEL1;
-	return 0;
+	return da7219_clk_enable(substream);
 }
 
 static int cz_max_startup(struct snd_pcm_substream *substream)
@@ -199,7 +204,7 @@ static int cz_max_startup(struct snd_pcm_substream *substream)
 				   &constraints_rates);
 
 	machine->play_i2s_instance = I2S_BT_INSTANCE;
-	return 0;
+	return da7219_clk_enable(substream);
 }
 
 static int cz_dmic0_startup(struct snd_pcm_substream *substream)
@@ -220,7 +225,7 @@ static int cz_dmic0_startup(struct snd_pcm_substream *substream)
 				   &constraints_rates);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
-	return 0;
+	return da7219_clk_enable(substream);
 }
 
 static int cz_dmic1_startup(struct snd_pcm_substream *substream)
@@ -242,25 +247,7 @@ static int cz_dmic1_startup(struct snd_pcm_substream *substream)
 
 	machine->cap_i2s_instance = I2S_SP_INSTANCE;
 	machine->capture_channel = CAP_CHANNEL0;
-	return 0;
-}
-
-static int cz_da7219_params(struct snd_pcm_substream *substream,
-				      struct snd_pcm_hw_params *params)
-{
-	int wclk, bclk;
-
-	wclk = params_rate(params);
-	bclk = wclk * params_channels(params) *
-		snd_pcm_format_width(params_format(params));
-	/* ADAU7002 spec: "The ADAU7002 requires a BCLK rate
-	 * that is minimum of 64x the LRCLK sample rate."
-	 * DA7219 is the only clk source so for all codecs
-	 * we have to limit bclk to 64X lrclk.
-	 */
-	if (bclk < (wclk * 64))
-		bclk = wclk * 64;
-	return da7219_clk_enable(substream, wclk, bclk);
+	return da7219_clk_enable(substream);
 }
 
 static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
@@ -271,31 +258,26 @@ static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
 static const struct snd_soc_ops cz_da7219_play_ops = {
 	.startup = cz_da7219_play_startup,
 	.shutdown = cz_da7219_shutdown,
-	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_da7219_cap_ops = {
 	.startup = cz_da7219_cap_startup,
 	.shutdown = cz_da7219_shutdown,
-	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_max_play_ops = {
 	.startup = cz_max_startup,
 	.shutdown = cz_da7219_shutdown,
-	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_dmic0_cap_ops = {
 	.startup = cz_dmic0_startup,
 	.shutdown = cz_da7219_shutdown,
-	.hw_params = cz_da7219_params,
 };
 
 static const struct snd_soc_ops cz_dmic1_cap_ops = {
 	.startup = cz_dmic1_startup,
 	.shutdown = cz_da7219_shutdown,
-	.hw_params = cz_da7219_params,
 };
 
 SND_SOC_DAILINK_DEF(designware1,
-- 
2.24.0.432.g9d3f5f5b63-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
