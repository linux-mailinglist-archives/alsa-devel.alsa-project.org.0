Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A5289AF15
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:21:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9BF2BAA;
	Sun,  7 Apr 2024 09:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9BF2BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474461;
	bh=n8C2sMFznZ+aSgwy6VZZBdp6GtGS+ViwXxZAO/kOhSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dUSWzdPwKQbnZo3dMQKK6O5oMBUSt6uXWMGvXbEYe755WtSo0QDTGdRMR7GxMuPbl
	 AkBkuzqKZdvMlDA1f1TAQ6mLoL9vd0d/UjnX/EVDmYKH1+ReaPhmNyuQzWI2fT+BRR
	 ZidoWAKIgwPaIkKxOBxqodPbh/QMBTCeBk0uN1Uo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93A3EF8080A; Sun,  7 Apr 2024 09:17:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 840F7F807A6;
	Sun,  7 Apr 2024 09:17:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D10DF805B1; Tue,  2 Apr 2024 09:13:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6FA2F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FA2F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=H78MRbh1
Received: by mail.gandi.net (Postfix) with ESMTPA id 2DD34FF80B;
	Tue,  2 Apr 2024 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PE3YvX4Y16ibvrY87Lo5u2VWlVZ0kvZSV/V9W8+29Ew=;
	b=H78MRbh18HozjmvX6U8/RisNl1hxS6rRFIyRStLQwOFgG0EzwIze+ki3HBx0wMmJXZgzua
	KFN6OxHpXsXDDjjNAleJizhmSTi4pttKWeWArkxtULPfH2viNPhXZpg5deGc6AHPZeqInm
	D4B9jOJdIDDE2pXS+mZsFmjd059rX9kVoZXXx5TikWiDDlz/h3gOHa0lU5Caqhdncyz3Q/
	x29TNap5WlkPZH2B4MSQ0F9N6iCbvr60ogpdZ+ysBS5VNZFZ8UsOUWmeDVZH9larPRGx7A
	f9jIzh1n4x78gRTTfTCAgm7bMrZCaCl+n7h9lMlNJVWjRyiWCB7AG3CXScxCSg==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v2 13/13] ASoC: ti: davinci-i2s: Add T1 framing support
Date: Tue,  2 Apr 2024 09:12:13 +0200
Message-ID: <20240402071213.11671-14-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MK3EAHR7KI4IBSH4XSVJOY5XKB7QB64E
X-Message-ID-Hash: MK3EAHR7KI4IBSH4XSVJOY5XKB7QB64E
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MK3EAHR7KI4IBSH4XSVJOY5XKB7QB64E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

McBSP's data delay can be configured from 0 to 2 bit clock periods. 0 is
used for DSP_B format, 1 is used for DSP_A format, 2 is unused.

A data delay of 2 bit clock periods can be used to interface to
'T1 framing' devices where data stream is preceded by a 'framing bit'. On
transmission, McBSP inserts a blank period (high-impedance period)
before the first data bit to leave an opportunity for other devices to
set this 'framing bit'. On reception, McBSP discards the 'framing bit'
that precedes the data stream.

Add support for the 'framing bit' according to the
'ti,T1-framing-[tx/rx]' device-tree properties. If a flag is present,
the data delay is set to 2 bit clock periods regardless of the selected
DAI format.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index fb1e09c78bdf..0f15a743c798 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -161,6 +161,9 @@ struct davinci_mcbsp_dev {
 
 	int tdm_slots;
 	int slot_width;
+
+	bool tx_framing_bit;
+	bool rx_framing_bit;
 };
 
 static inline void davinci_mcbsp_write_reg(struct davinci_mcbsp_dev *dev,
@@ -580,6 +583,15 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(1);
 	}
 
+	if (dev->tx_framing_bit) {
+		xcr &= ~DAVINCI_MCBSP_XCR_XDATDLY(1);
+		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(2);
+	}
+	if (dev->rx_framing_bit) {
+		rcr &= ~DAVINCI_MCBSP_RCR_RDATDLY(1);
+		rcr |= DAVINCI_MCBSP_RCR_RDATDLY(2);
+	}
+
 	if (params_channels(params) == 2) {
 		element_cnt = 2;
 		if (double_fmt[fmt] && dev->enable_channel_combine) {
@@ -796,6 +808,9 @@ static int davinci_i2s_probe(struct platform_device *pdev)
 
 	dev->base = io_base;
 
+	dev->tx_framing_bit = of_property_read_bool(pdev->dev.of_node, "ti,T1-framing-tx");
+	dev->rx_framing_bit = of_property_read_bool(pdev->dev.of_node, "ti,T1-framing-rx");
+
 	/* setup DMA, first TX, then RX */
 	dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];
 	dma_data->addr = (dma_addr_t)(mem->start + DAVINCI_MCBSP_DXR_REG);
-- 
2.44.0

