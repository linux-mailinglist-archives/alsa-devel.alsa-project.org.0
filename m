Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2287DCB4
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:03:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8AA7233E;
	Sun, 17 Mar 2024 10:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8AA7233E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666235;
	bh=e9C6b7wBIvVr5D8OgogHyChIqRw3FYo/8ckm6eoEVCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rF7TThoZTx0zLzOwb9WhAKCJwhy3M9XstoFT/g/tubA5FZNRrMIFVMCny4nxXf1T1
	 IMeYAafXgtEwf3RzE56MDng07u6VxzxeDm+OcPK5B99txeJY6+GVNgoEiQCEA7n054
	 2IKASkCa6CN9w6sCHljqJUYnyqe9z0YjP3VEAOj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2CA0F805A9; Sun, 17 Mar 2024 10:02:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60AC1F8058C;
	Sun, 17 Mar 2024 10:02:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D948DF80563; Fri, 15 Mar 2024 12:28:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 329C4F8057C
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 329C4F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=C1EqRKWR
Received: by mail.gandi.net (Postfix) with ESMTPA id 73A2BE0002;
	Fri, 15 Mar 2024 11:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ByKbg1sHmU9IHih5m1OFO59QL3ayS3Id0H8zj9ZFbU=;
	b=C1EqRKWRRoWpb0hvc0NO337oFmlSlDZdxBdCKsGzwwGF5Csq8sqOm+720fvcsDajIciV51
	nfa9uLgkJ09294QyRHP2nu6lzF4L9of/FhpstMKQg+xhdB464nkivpPBIXM+TUCvPThgsJ
	G8oPMcRTvFNdWYrpmDybK7s1T8sW4byz6dgvkuJOyfc31TM/YvyE6iENg8ygMlDsAFAYU+
	ThQ9Q3VevjUx6GXpOD0tG202TZ3Js3XIduW0M9iQXJpoM2TQKF/NBwvcuSKRc3apWO29YQ
	YVdZcEQA5SN6lEc+JdXn3KKzK5X/H0AtWqGOU+Ivq/TZFSlexqZ0M72fAT33Yw==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH 13/13] ASoC: ti: davinci-i2s: Opitonally drive DX pin during
 capture streams
Date: Fri, 15 Mar 2024 12:27:45 +0100
Message-ID: <20240315112745.63230-14-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CBTLM7MQA6GJFMMO2SPP7IXOVFC6HCLE
X-Message-ID-Hash: CBTLM7MQA6GJFMMO2SPP7IXOVFC6HCLE
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The McBSP's DX pin that outputs serial data during playback streams can
be used during capture streams to repeatedly output a chosen pattern.
For instance, this can be useful to drive an active-low signal during
captures (by choosing <0> as output pattern).

Enable this behaviour when the device-tree property 'ti,drive-dx' is
present. DX pin is driven with the provided pattern every time a
capture stream is launched.

This property is not compatible with classic playback stream so
davinci_i2s_trigger() returns an error if a playback stream is started
while 'ti,drive-dx' flag is present.

This has been tested on a board designed of a DAVINCI/OMAP-L138 where
the DX pin is linked to the chip select pin of the converters of the
capture side.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 74 ++++++++++++++++++++++++++++++++------
 1 file changed, 63 insertions(+), 11 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 13e349e7a6ec..e289a84bdd6a 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -101,6 +101,9 @@
 #define DAVINCI_MCBSP_PCR_FSRM		(1 << 10)
 #define DAVINCI_MCBSP_PCR_FSXM		(1 << 11)
 
+#define PLAYBACK_CLOCK			1
+#define CAPTURE_CLOCK			0
+
 enum {
 	DAVINCI_MCBSP_WORD_8 = 0,
 	DAVINCI_MCBSP_WORD_12,
@@ -164,6 +167,8 @@ struct davinci_mcbsp_dev {
 
 	bool sync_err;
 	bool free_run;
+	bool drive_dx;
+	u32 dx_val;
 };
 
 static inline void davinci_mcbsp_write_reg(struct davinci_mcbsp_dev *dev,
@@ -187,6 +192,19 @@ static void toggle_clock(struct davinci_mcbsp_dev *dev, int playback)
 	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_PCR_REG, dev->pcr);
 }
 
+static int davinci_drive_dx(struct davinci_mcbsp_dev *dev)
+{
+	unsigned int spcr;
+
+	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_DXR_REG, dev->dx_val);
+
+	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
+	spcr |= DAVINCI_MCBSP_SPCR_XRST;
+	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
+
+	return 0;
+}
+
 static void davinci_mcbsp_start(struct davinci_mcbsp_dev *dev,
 		struct snd_pcm_substream *substream)
 {
@@ -194,6 +212,9 @@ static void davinci_mcbsp_start(struct davinci_mcbsp_dev *dev,
 	u32 spcr;
 	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
 
+	if (!playback && dev->drive_dx)
+		davinci_drive_dx(dev);
+
 	/* Enable transmitter or receiver */
 	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
 	spcr |= mask;
@@ -212,9 +233,17 @@ static void davinci_mcbsp_stop(struct davinci_mcbsp_dev *dev, int playback)
 	/* Reset transmitter/receiver and sample rate/frame sync generators */
 	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
 	spcr &= ~(DAVINCI_MCBSP_SPCR_GRST | DAVINCI_MCBSP_SPCR_FRST);
-	spcr &= playback ? ~DAVINCI_MCBSP_SPCR_XRST : ~DAVINCI_MCBSP_SPCR_RRST;
-	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
-	toggle_clock(dev, playback);
+
+	if (!playback) {
+		spcr &= ~DAVINCI_MCBSP_SPCR_RRST;
+		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
+		toggle_clock(dev, CAPTURE_CLOCK);
+	}
+	if (playback || dev->drive_dx) {
+		spcr &= ~DAVINCI_MCBSP_SPCR_XRST;
+		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
+		toggle_clock(dev, PLAYBACK_CLOCK);
+	}
 }
 
 static int davinci_i2s_tdm_word_length(int tdm_slot_width)
@@ -408,6 +437,10 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	}
 	if (inv_fs == true)
 		pcr ^= (DAVINCI_MCBSP_PCR_FSXP | DAVINCI_MCBSP_PCR_FSRP);
+
+	if (dev->drive_dx)
+		pcr |= DAVINCI_MCBSP_PCR_CLKRP;
+
 	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SRGR_REG, srgr);
 	dev->pcr = pcr;
 	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_PCR_REG, pcr);
@@ -562,6 +595,9 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(1);
 	}
 
+	if (dev->drive_dx)
+		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(2);
+
 	if (params_channels(params) == 2) {
 		element_cnt = 2;
 		if (double_fmt[fmt] && dev->enable_channel_combine) {
@@ -611,9 +647,9 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	xcr |= DAVINCI_MCBSP_XCR_XWDLEN1(mcbsp_word_length) |
 		DAVINCI_MCBSP_XCR_XWDLEN2(mcbsp_word_length);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK || dev->drive_dx)
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_XCR_REG, xcr);
-	else
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_RCR_REG, rcr);
 
 	pr_debug("%s - %d  srgr=%X\n", __func__, __LINE__, srgr);
@@ -628,16 +664,21 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
 	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 	u32 spcr;
-	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
 
 	davinci_mcbsp_stop(dev, playback);
 
 	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
-	if (spcr & mask) {
+	if (spcr & DAVINCI_MCBSP_SPCR_XRST) {
 		/* start off disabled */
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG,
-					spcr & ~mask);
-		toggle_clock(dev, playback);
+					spcr & ~DAVINCI_MCBSP_SPCR_XRST);
+		toggle_clock(dev, PLAYBACK_CLOCK);
+	}
+	if (spcr & DAVINCI_MCBSP_SPCR_RRST) {
+		/* start off disabled */
+		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG,
+					spcr & ~DAVINCI_MCBSP_SPCR_RRST);
+		toggle_clock(dev, CAPTURE_CLOCK);
 	}
 	if (dev->pcr & (DAVINCI_MCBSP_PCR_FSXM | DAVINCI_MCBSP_PCR_FSRM |
 			DAVINCI_MCBSP_PCR_CLKXM | DAVINCI_MCBSP_PCR_CLKRM)) {
@@ -646,7 +687,7 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
 	}
 
-	if (playback) {
+	if (playback || dev->drive_dx) {
 		/* Enable the transmitter */
 		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
 		spcr |= DAVINCI_MCBSP_SPCR_XRST;
@@ -659,7 +700,7 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
 		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
 		spcr &= ~DAVINCI_MCBSP_SPCR_XRST;
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
-		toggle_clock(dev, playback);
+		toggle_clock(dev, PLAYBACK_CLOCK);
 	}
 
 	return 0;
@@ -672,6 +713,11 @@ static int davinci_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0;
 	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
 
+	if (playback && dev->drive_dx) {
+		dev_err(dev->dev, "Playback is not allowed when drive-cs flag is set\n");
+		return -EINVAL;
+	}
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -779,6 +825,12 @@ static int davinci_i2s_probe(struct platform_device *pdev)
 
 	dev->free_run = !of_property_read_bool(pdev->dev.of_node, "ti,disable-free-run");
 	dev->sync_err = of_property_read_bool(pdev->dev.of_node, "ti,enable-sync-err");
+	dev->drive_dx = false;
+	ret = of_property_read_u32(pdev->dev.of_node, "ti,drive-dx", &dev->dx_val);
+	if (ret && ret != -EINVAL)
+		return ret;
+	if (!ret)
+		dev->drive_dx = true;
 
 	/* setup DMA, first TX, then RX */
 	dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
-- 
2.43.2

