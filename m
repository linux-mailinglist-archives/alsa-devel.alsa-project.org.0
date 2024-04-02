Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0A89AF10
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F01AB207;
	Sun,  7 Apr 2024 09:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F01AB207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474381;
	bh=aEvLZ42Sz56/Mq00rxNsquYsuc4I6XXsq0WZKRms/uk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q2ZNPjWA26O6rSMShSGFbSF1Q1/d1wQItaSl8v4hfV1Nk2ClQfhboHCxxwtDiUgQn
	 OJvDNRIVRak04MeSywb03W+rkjIbwv6KwJEg5hmvlarfeQe/yBo/WbSeRd9ESH44nq
	 XskKIQHSYjepVyeEv+oxQlpNTqmTJVJuCMSNk99c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 446DCF806D5; Sun,  7 Apr 2024 09:17:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06748F806BC;
	Sun,  7 Apr 2024 09:17:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C3F7F805AB; Tue,  2 Apr 2024 09:13:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E915AF80007
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E915AF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dvS9r/61
Received: by mail.gandi.net (Postfix) with ESMTPA id C648CFF805;
	Tue,  2 Apr 2024 07:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kGgoavkWPYXIisQyOjz1zAZv2po0MrsfHiyY+MEsubo=;
	b=dvS9r/61DMhpSthZq/wkIW2aWqRag/BQv+j4bSdjOV/esteKS+egqrnc7QtqUWc8nibjmR
	j+AmfM0ylUJpWTKVJyDKowEaSb5gJaHegHh8+z8hzk7liatrp9emg4ARQDCM64Oaa+q6D6
	vrbagM0FUuDMfk1f67aHZzOgNkuKplfoWnPVdYpL7SRe+7hqT61c4A1oebNIHZgMAkj4L9
	Vp2N3oDvdfo7AUle6eKLeTEwmjPJGWJ1LTfPd5FfZrZi5vxdtUFvqPtY2qP7QskiGB9pSN
	ZPIDajAWHBsW3YsJr44/nHqUIUrbHo0y9jVrmDmFoBp2BayzJMdtbr3Oxkbh8A==
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
Subject: [PATCH v2 11/13] ASoC: ti: davinci-i2s: Add S24_LE to supported
 formats
Date: Tue,  2 Apr 2024 09:12:11 +0200
Message-ID: <20240402071213.11671-12-bastien.curutchet@bootlin.com>
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
Message-ID-Hash: DRK3UKXIVD4RM2YDDOYQZGORA4PITMYL
X-Message-ID-Hash: DRK3UKXIVD4RM2YDDOYQZGORA4PITMYL
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRK3UKXIVD4RM2YDDOYQZGORA4PITMYL/>
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
index 7fb41987175b..fb1e09c78bdf 100644
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
 
@@ -467,8 +465,23 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
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
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
 		spcr |= DAVINCI_MCBSP_SPCR_RINTM(3);
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
@@ -566,12 +579,6 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -710,6 +717,7 @@ static void davinci_i2s_shutdown(struct snd_pcm_substream *substream,
 
 #define DAVINCI_I2S_RATES	SNDRV_PCM_RATE_8000_96000
 #define DAVINCI_I2S_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+				 SNDRV_PCM_FMTBIT_S24_LE | \
 				 SNDRV_PCM_FMTBIT_S32_LE)
 
 static int davinci_i2s_dai_probe(struct snd_soc_dai *dai)
-- 
2.44.0

