Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5446687DCB2
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:03:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 072392367;
	Sun, 17 Mar 2024 10:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 072392367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666222;
	bh=AwAqDOZzz46Ed6tx9rUXvHKRqYi8N1dzTDMvRTXZYWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nhk9tlopof7hSR/t0ft+Tb57kjr4utTtayvzKDYM/VjWfKdPb410qiZGsZQqgw2KF
	 zbJYKxTw2mXs35SnhbmeDgt4mXB/SSXfOWxHZx4H8Nur/ukDNIgoTO/9xoFOFS7Reo
	 Oz8DkKmV0id57pEXDTlEZ6b4VoCbkNKpkvYf4DHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A016F80564; Sun, 17 Mar 2024 10:02:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA39F80633;
	Sun, 17 Mar 2024 10:02:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89C98F804E7; Fri, 15 Mar 2024 12:28:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 34CC0F80571
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CC0F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=f1mkYBOY
Received: by mail.gandi.net (Postfix) with ESMTPA id F0518E0008;
	Fri, 15 Mar 2024 11:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esZKn+SlazHXsQkGa0+kdlqCRWQZg4hF1p4IJ88VcZA=;
	b=f1mkYBOYCtNZ7HhGkubtHbUKhGnUYVSZ3KcO56/kpibDdUQ4NRvccmSm6ViJmBJOyD+aCR
	5SnTQabldHU02Ky9VeqcY/o26cmeNLeS10I6LjC6VNAyNexFPiD7hIRm1/lA7V6d/++QSR
	pNwq3ucoQKHmXfhtAmk13mDMM/f92NqJoXjRQwKPXAk+YD+VJ+B5tMeznnds1fdRm00K4O
	JojzL00fbfKulO/hnFZRZU2CXHGO6+gLZu4F7RwzIRbE+BIDsrb+z0Nz23dFtKSxLMDjAB
	XN9D7MM8IfBUhffvLDebl2rNOPFRL1Ys2S5cDGX/ILm2j1lHsdMdETphHozCDw==
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
Subject: [PATCH 11/13] ASoC: ti: davinci-i2s: Add S24_LE to supported formats
Date: Fri, 15 Mar 2024 12:27:43 +0100
Message-ID: <20240315112745.63230-12-bastien.curutchet@bootlin.com>
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
Message-ID-Hash: 2EUGINJ7DUCDUJMLMPZGPTIPTPV5VSXI
X-Message-ID-Hash: 2EUGINJ7DUCDUJMLMPZGPTIPTPV5VSXI
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EUGINJ7DUCDUJMLMPZGPTIPTPV5VSXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

S24_LE is supported by McBSP but not by the driver.

Add S24_LE to driver's supported formats. Using it enables the sign
extension in DRR (Data Receive Register). The other formats are kept
with the zero extension in DRR.

Remove data_type table as it is no longer used.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 67307e75f2a8..13e349e7a6ec 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -61,6 +61,9 @@
 
 #define DAVINCI_MCBSP_SPCR_RRST		(1 << 0)
 #define DAVINCI_MCBSP_SPCR_RINTM(v)	((v) << 4)
+#define DAVINCI_MCBSP_SPCR_RJUST(v)	((v) << 13)
+#define DAVINCI_MCBSP_SPCR_RJUST_Z_LE	DAVINCI_MCBSP_SPCR_RJUST(0)
+#define DAVINCI_MCBSP_SPCR_RJUST_S_LE	DAVINCI_MCBSP_SPCR_RJUST(1)
 #define DAVINCI_MCBSP_SPCR_XRST		(1 << 16)
 #define DAVINCI_MCBSP_SPCR_XINTM(v)	((v) << 20)
 #define DAVINCI_MCBSP_SPCR_GRST		(1 << 22)
@@ -107,15 +110,10 @@ enum {
 	DAVINCI_MCBSP_WORD_32,
 };
 
-static const unsigned char data_type[SNDRV_PCM_FORMAT_S32_LE + 1] = {
-	[SNDRV_PCM_FORMAT_S8]		= 1,
-	[SNDRV_PCM_FORMAT_S16_LE]	= 2,
-	[SNDRV_PCM_FORMAT_S32_LE]	= 4,
-};
-
 static const unsigned char asp_word_length[SNDRV_PCM_FORMAT_S32_LE + 1] = {
 	[SNDRV_PCM_FORMAT_S8]		= DAVINCI_MCBSP_WORD_8,
 	[SNDRV_PCM_FORMAT_S16_LE]	= DAVINCI_MCBSP_WORD_16,
+	[SNDRV_PCM_FORMAT_S24_LE]	= DAVINCI_MCBSP_WORD_24,
 	[SNDRV_PCM_FORMAT_S32_LE]	= DAVINCI_MCBSP_WORD_32,
 };
 
@@ -443,8 +441,23 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_format_t fmt;
 	unsigned element_cnt = 1;
 
-	/* general line settings */
 	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
+
+	/* Determine xfer data type */
+	fmt = params_format(params);
+	switch (fmt) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		spcr |= DAVINCI_MCBSP_SPCR_RJUST_S_LE;
+		break;
+	default:
+		dev_warn(dev->dev, "davinci-i2s: unsupported PCM format\n");
+		return -EINVAL;
+	}
+
+	/* general line settings */
 	if (dev->free_run)
 		spcr |= DAVINCI_MCBSP_SPCR_FREE;
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
@@ -548,12 +561,6 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 		rcr |= DAVINCI_MCBSP_RCR_RDATDLY(1);
 		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(1);
 	}
-	/* Determine xfer data type */
-	fmt = params_format(params);
-	if ((fmt > SNDRV_PCM_FORMAT_S32_LE) || !data_type[fmt]) {
-		printk(KERN_WARNING "davinci-i2s: unsupported PCM format\n");
-		return -EINVAL;
-	}
 
 	if (params_channels(params) == 2) {
 		element_cnt = 2;
@@ -692,6 +699,7 @@ static void davinci_i2s_shutdown(struct snd_pcm_substream *substream,
 
 #define DAVINCI_I2S_RATES	SNDRV_PCM_RATE_8000_96000
 #define DAVINCI_I2S_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+				 SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S32_LE)
 
 static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
-- 
2.43.2

