Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2817A63A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:19:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 483741660;
	Thu,  5 Mar 2020 14:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 483741660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583414344;
	bh=KOksV8eVyBP8koJL1LGAUBzTM6x0CS5AIJrBtFiNDbc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=G4kpNJdWygzAtshJo0rUTyMXbjY90boMQys/gkwlK8nHwtNi8hUD5BF2FYm0WdTL9
	 thVMk7NnhJhEZJ4HS2nEvnNT2KHi7OZvOSC7mYE0nS91/SmCzoc4i/t9QrzjscjUtq
	 XzUQ0C84Jkls85vOZlnSH94y9ha0ppFacKraF2ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC6A5F8028D;
	Thu,  5 Mar 2020 14:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21515F8028F; Thu,  5 Mar 2020 14:15:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 30F41F8028D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30F41F8028D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4EE04B2;
 Thu,  5 Mar 2020 05:15:42 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39CE13F6CF;
 Thu,  5 Mar 2020 05:15:42 -0800 (PST)
Date: Thu, 05 Mar 2020 13:15:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Applied "ASoC: tlv320adcx140: Fix mic_bias and vref device tree
 verification" to the asoc tree
In-Reply-To: <20200304193427.16886-1-dmurphy@ti.com>
Message-Id: <applied-20200304193427.16886-1-dmurphy@ti.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: tlv320adcx140: Fix mic_bias and vref device tree verification

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 2e4249f58074ec93746df3a902d1835b7edfef49 Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Wed, 4 Mar 2020 13:34:27 -0600
Subject: [PATCH] ASoC: tlv320adcx140: Fix mic_bias and vref device tree
 verification

Fix the range verification check for the mic_bias and vref device tree
entries.

Fixes 37bde5acf040 ("ASoC: tlv320adcx140: Add the tlv320adcx140 codec driver family")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20200304193427.16886-1-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320adcx140.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 93a0cb8e662c..38897568ee96 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -748,9 +748,8 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		bias_source = ADCX140_MIC_BIAS_VAL_VREF;
 
-	if (bias_source != ADCX140_MIC_BIAS_VAL_VREF &&
-	    bias_source != ADCX140_MIC_BIAS_VAL_VREF_1096 &&
-	    bias_source != ADCX140_MIC_BIAS_VAL_AVDD) {
+	if (bias_source < ADCX140_MIC_BIAS_VAL_VREF ||
+	    bias_source > ADCX140_MIC_BIAS_VAL_AVDD) {
 		dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
 		return -EINVAL;
 	}
@@ -760,9 +759,8 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 	if (ret)
 		vref_source = ADCX140_MIC_BIAS_VREF_275V;
 
-	if (vref_source != ADCX140_MIC_BIAS_VREF_275V &&
-	    vref_source != ADCX140_MIC_BIAS_VREF_25V &&
-	    vref_source != ADCX140_MIC_BIAS_VREF_1375V) {
+	if (vref_source < ADCX140_MIC_BIAS_VREF_275V ||
+	    vref_source > ADCX140_MIC_BIAS_VREF_1375V) {
 		dev_err(adcx140->dev, "Mic Bias source value is invalid\n");
 		return -EINVAL;
 	}
-- 
2.20.1

