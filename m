Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF01231A77
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 09:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EB641747;
	Wed, 29 Jul 2020 09:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EB641747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596008471;
	bh=ErQsObe3Q+lDTNkvmyn0xB1uRJWOBs783b0/zS7rnIM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kjzcc9+xGqIomSojBrMdZnnYKujGpKS4T4v/jIFIw6EcaFmradFifwpmeCK38L+RV
	 jieFJJLYmaFRQGlG/R16RlYu3obV5nQFxmrMqZn6LKwdRURXpzQjaLiclNfZg1dTTl
	 FoZCjlC8HZEb++oBMDgPzBQuMBmAZ1KLnxWN4Duc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D84F8029B;
	Wed, 29 Jul 2020 09:38:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3A30F80171; Wed, 29 Jul 2020 09:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F101F80125
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 09:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F101F80125
IronPort-SDR: 2D/HNhKExYcFAuvKSn49ecaHxMe/HRfD58UC699QIY0FdM9u/3AolQD3zrBX8vN6lePsOwuyv1
 wXx/WNDLiWOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="149216432"
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="149216432"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 00:38:09 -0700
IronPort-SDR: ig3veScUJyXG6klwqotwrz7PvrvzmRpcHpR0xVPOLAk9IrB57K8wAMoT3WQOJ7DfCe6X1+CHT8
 lusrH/UPzWFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,409,1589266800"; d="scan'208";a="434604228"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga004.jf.intel.com with ESMTP; 29 Jul 2020 00:38:06 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: codec: tlv3204: Increased maximum supported channels
Date: Wed, 29 Jul 2020 15:32:55 +0800
Message-Id: <20200729073256.24028-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
References: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
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

Increased maximum supported channel to 8 channels for audio capture
running in TDM mode.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 8534f9006e6a..5af438a00f95 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -887,7 +887,7 @@ static struct snd_soc_dai_driver aic32x4_dai = {
 	.capture = {
 			.stream_name = "Capture",
 			.channels_min = 1,
-			.channels_max = 2,
+			.channels_max = 8,
 			.rates = AIC32X4_RATES,
 			.formats = AIC32X4_FORMATS,},
 	.ops = &aic32x4_ops,
-- 
2.17.1

