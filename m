Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C39512427EC
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 11:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BC661671;
	Wed, 12 Aug 2020 11:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BC661671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597226061;
	bh=f2fetly2MlgGTK+0wmWT3AKPKWJVB3Um8hGHZVRbk00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3DlOWUBKZO24x17i/iYRgPHoo0umR0k2DRKpFUidy/9frg41dp/ylj9tRD0iw3Cd
	 VfE91fRvcz57Yz99I3qGz3wVVKBbJu7926x3gBXGMIvVBljnjovXjHBs9q9M1xJAtv
	 QSURpLitb0Hix7Tb6x6lTr91VmzTe10VT9HeYnBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6EC0F8025E;
	Wed, 12 Aug 2020 11:52:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D405F80259; Wed, 12 Aug 2020 11:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45D6BF8022D
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 11:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45D6BF8022D
IronPort-SDR: YUvxBF1R1u9RHPQO+bLkvTvTwpYuRJVJ5P6T37rWAffPuqQ7FF8adsrSeMkfL7OL+knEFzqreU
 3h8RNuqBCS9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="215446647"
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="215446647"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 02:52:19 -0700
IronPort-SDR: 3AQHn2VJbNq7zeIj7Owf1Dx3GkZ/dthuQDaFsVsDVtTXGu2EG2lb+9HUOCcABhovp2GBNfIL+k
 aodV3Jj89ElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; d="scan'208";a="290983641"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga003.jf.intel.com with ESMTP; 12 Aug 2020 02:52:16 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/3] ASoC: codec: tlv3204: Enable 24 bit audio support
Date: Wed, 12 Aug 2020 17:46:29 +0800
Message-Id: <20200812094631.4698-2-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
References: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
Cc: cezary.rojewski@intel.com, a-estrada@ti.com, andriy.shevchenko@intel.com,
 zakkaye@ti.com, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, dmurphy@ti.com
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

Enable 24 bit in 32 bit container audio support.
Using the params_physical_width to differentiate
24 bit in 32 bit container and 24 bit in 24 bit container modes.
Use the sample rate, bit depth and channel parameters to
calculate the bit clock needed.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 467802875c13..e3d12a7ea07a 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -665,7 +665,8 @@ static int aic32x4_set_processing_blocks(struct snd_soc_component *component,
 }
 
 static int aic32x4_setup_clocks(struct snd_soc_component *component,
-				unsigned int sample_rate)
+			unsigned int sample_rate, unsigned int channel,
+			unsigned int bit_depth)
 {
 	u8 aosr;
 	u16 dosr;
@@ -753,7 +754,8 @@ static int aic32x4_setup_clocks(struct snd_soc_component *component,
 							dosr);
 
 						clk_set_rate(clocks[5].clk,
-							sample_rate * 32);
+							sample_rate * channel *
+							bit_depth);
 						return 0;
 					}
 				}
@@ -775,9 +777,11 @@ static int aic32x4_hw_params(struct snd_pcm_substream *substream,
 	u8 iface1_reg = 0;
 	u8 dacsetup_reg = 0;
 
-	aic32x4_setup_clocks(component, params_rate(params));
+	aic32x4_setup_clocks(component, params_rate(params),
+			     params_channels(params),
+			     params_physical_width(params));
 
-	switch (params_width(params)) {
+	switch (params_physical_width(params)) {
 	case 16:
 		iface1_reg |= (AIC32X4_WORD_LEN_16BITS <<
 				   AIC32X4_IFACE1_DATALEN_SHIFT);
@@ -862,7 +866,8 @@ static int aic32x4_set_bias_level(struct snd_soc_component *component,
 
 #define AIC32X4_RATES	SNDRV_PCM_RATE_8000_192000
 #define AIC32X4_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE \
-			 | SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+			 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_3LE \
+			 | SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops aic32x4_ops = {
 	.hw_params = aic32x4_hw_params,
-- 
2.17.1

