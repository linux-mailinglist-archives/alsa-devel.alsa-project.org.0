Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06F87DCB1
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68E6E23E1;
	Sun, 17 Mar 2024 10:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68E6E23E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666207;
	bh=UUEMGYTWx7hSbIotL4/4C7MIZafTER3ZfeVzf1vYOUs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vKi/fAKSJFJVSnLWfL97Z38ExM3JG3k7TTJ/+TBsCFzed3SEQlTc3SA2mgSrfTNfn
	 8Sab26sxYSXIxlDSsVg2pg30llb6x2ubUv1t4O9VhDChU+8hJe5lit0Fq1gwS6xIuo
	 5l4TAqg041EfeSgV1HqT+/ZmMZHrB00f5XIK5lWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4DF5F80619; Sun, 17 Mar 2024 10:02:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E165F80612;
	Sun, 17 Mar 2024 10:02:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BA31F80564; Fri, 15 Mar 2024 12:28:34 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E2F11F80570
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F11F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EiiBBzN9
Received: by mail.gandi.net (Postfix) with ESMTPA id 54481E0002;
	Fri, 15 Mar 2024 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HVFVDw+1H0r8Xsrvu6KZ3OKr5htVuJOvlACpebRa/Dc=;
	b=EiiBBzN95HqvkJVIx018Xh4otOv/gqgzfN6yZ94Kt4PHXhlq9JEosn/xu6UFUnKbljyv3C
	d0JCnQkmekizZ208iSbdvbfBnwfIoNit9aQLFyb+9WhtzMXFpAaOsl0oH4KuxVxL7t8omr
	KZU8Bbc5LZcVFaOA9f1s6/okWfCUAebbzTv8duG6mrdssmpDg9Oum1eN/D5cprdwC8+DoB
	yAz1xpTGEe3BsUTJWSym2KWuSHU8PMZnsrock1eB/7yQM8HSGowbYos+FOXFRMBQd6ekgA
	Qeq6nSG9y8z5PirFvKnBKRzoVCdOZ7vuqfoyS0t4qznc1aC4Mf4OA+V5zRZSPg==
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
Subject: [PATCH 09/13] ASoC: ti: davinci-i2s: Enable unexpected frame pulses
 detection
Date: Fri, 15 Mar 2024 12:27:41 +0100
Message-ID: <20240315112745.63230-10-bastien.curutchet@bootlin.com>
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
Message-ID-Hash: GVB7Y4ATLGL6FWVPBM4YCIUKQTY4CYDT
X-Message-ID-Hash: GVB7Y4ATLGL6FWVPBM4YCIUKQTY4CYDT
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:02 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVB7Y4ATLGL6FWVPBM4YCIUKQTY4CYDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

McBSP can generate an SYNCERR when unexpected frame pulses are
detected. The driver always disables this feature and ignore the
unexpected frame pulses.

Enable the generation of SYNCERR by the McBSP according to the
'ti,enable-sync-err' device-tree property.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 7cdd86f47ead..2c19e45b6b54 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -163,6 +163,8 @@ struct davinci_mcbsp_dev {
 
 	int tdm_slots;
 	int slot_width;
+
+	bool sync_err;
 };
 
 static inline void davinci_mcbsp_write_reg(struct davinci_mcbsp_dev *dev,
@@ -432,8 +434,10 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
 	struct snd_interval *i = NULL;
 	int mcbsp_word_length, master;
-	unsigned int rcr, xcr, clk_div, freq, framesize;
+	unsigned int clk_div, freq, framesize;
 	unsigned int srgr = 0;
+	unsigned int rcr = 0;
+	unsigned int xcr = 0;
 	u32 spcr;
 	snd_pcm_format_t fmt;
 	unsigned element_cnt = 1;
@@ -530,8 +534,10 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SRGR_REG, srgr);
 
-	rcr = DAVINCI_MCBSP_RCR_RFIG;
-	xcr = DAVINCI_MCBSP_XCR_XFIG;
+	if (!dev->sync_err) {
+		rcr |= DAVINCI_MCBSP_RCR_RFIG;
+		xcr |= DAVINCI_MCBSP_XCR_XFIG;
+	}
 	if (dev->mode == MOD_DSP_B) {
 		rcr |= DAVINCI_MCBSP_RCR_RDATDLY(0);
 		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(0);
@@ -760,6 +766,8 @@ static int davinci_i2s_probe(struct platform_device *pdev)
 
 	dev->base = io_base;
 
+	dev->sync_err = of_property_read_bool(pdev->dev.of_node, "ti,enable-sync-err");
+
 	/* setup DMA, first TX, then RX */
 	dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
 	dma_data->addr = (dma_addr_t)(mem->start + DAVINCI_MCBSP_DXR_REG);
-- 
2.43.2

