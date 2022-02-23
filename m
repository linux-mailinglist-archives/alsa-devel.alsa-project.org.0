Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41C14C0767
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 02:51:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 634AC192B;
	Wed, 23 Feb 2022 02:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 634AC192B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645581066;
	bh=gNnEZLNzVGjn9zsz1hYY56rJEUExMF3fuctvS2FB9jI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e9mCWWYkFKYGtt50ITPd7I5Unmm7OTn1QupdIZyS+awNQsGopjNrIhldl70FlhRhc
	 1R5AOIOMogpXn7j5X7SGJCuUtCiW2JwqnmOc7eTnYH9AKZ34cvXON7NzeVHTTFPNi1
	 eXwgh8/hfpYX/jrxYMaKfuayB3YxpmF4+i3+tHGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08E8DF804F2;
	Wed, 23 Feb 2022 02:49:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C064BF80517; Wed, 23 Feb 2022 02:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13F5FF804F2
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 02:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13F5FF804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Frw1SJ4l"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7FF3614C1;
 Wed, 23 Feb 2022 01:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB63C340E8;
 Wed, 23 Feb 2022 01:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645580934;
 bh=gNnEZLNzVGjn9zsz1hYY56rJEUExMF3fuctvS2FB9jI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Frw1SJ4lxuJ3emCqGuza1JBz8aTsLGBcmGyINuNx/PBOje4D2m1gNOrBGUBCBtc3N
 QGCS21SuFmVTiVDgzEszSyt80q3ujdt27I9KsLBuX0MCXKajTAmybgpsixwkEGri0x
 SGOoikVdBG8ra2cn/U88B4FpC6j5ifPa6kpQXmt7GjNzsAYYOBQMvyzPjZ+Q8/mzRn
 oggUysNHFbkQdFYc5qtT1cX1/gort83MBp/qMbZwGiiIxS+kZFPcfpQUPHYmv9WXRi
 8V+rf/1h9l8D1CS4Zzqs79+YsU7BVzMHCC3WKLz/zW3poT66J6wwYzofVppXNH1t10
 RH56yoLUBGFYQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/4] ASoC: pcm3168a: Use modern ASoC DAI format terminology
Date: Wed, 23 Feb 2022 01:48:45 +0000
Message-Id: <20220223014846.2765382-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223014846.2765382-1-broonie@kernel.org>
References: <20220223014846.2765382-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4012; h=from:subject;
 bh=gNnEZLNzVGjn9zsz1hYY56rJEUExMF3fuctvS2FB9jI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiFZJoU4VjJlMSoO1WMd1//jSrG2jbpJKKFJNgh+xy
 Ek599UGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYhWSaAAKCRAk1otyXVSH0I4HB/
 0UX09/DuSpf2LfHvzZhHdZsWQOpHmQqHPMKOFlS40ksILeIVkSPGGCWpJhCZel7xuWXtLpHC4D1UK9
 H5x15wQeMgL/O2fEDaZVLDmUzuPJwc34tYge3tocl7yb2qdMLlaJ/qK7WS1IDvwx68dDjiN6dUGS5d
 yuaFTwz65Gw1rlH0c0sx8clDVqh0Vm6LPN2f54VJ6RLdj6pC+IbMMiXDou0K6wQ3VSoCgQwSRSIy8d
 dcBPCayOKKEtO0oAsQ3wKciIzS2GHKUeB/YWrhx3ZNHSFtqp9/9Sikt081plhw/n10ywA+7FNGvolR
 bdMopamVgvOQLSFfyknm62JQ3xPwk1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

As part of moving to remove the old style defines for the bus clocks update
the pcm3168a driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm3168a.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 7417cf45d916..cf27f05dc46a 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -48,7 +48,7 @@ static const char *const pcm3168a_supply_names[] = {
 
 /* ADC/DAC side parameters */
 struct pcm3168a_io_params {
-	bool master_mode;
+	bool provider_mode;
 	unsigned int format;
 	int tdm_slots;
 	u32 tdm_mask;
@@ -357,7 +357,7 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
 	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
-	bool master_mode;
+	bool provider_mode;
 
 	switch (format & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_LEFT_J:
@@ -371,15 +371,15 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 		return -EINVAL;
 	}
 
-	switch (format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		master_mode = false;
+	switch (format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		provider_mode = false;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
-		master_mode = true;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		provider_mode = true;
 		break;
 	default:
-		dev_err(component->dev, "unsupported master/slave mode\n");
+		dev_err(component->dev, "unsupported provider mode\n");
 		return -EINVAL;
 	}
 
@@ -390,7 +390,7 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 		return -EINVAL;
 	}
 
-	io_params->master_mode = master_mode;
+	io_params->provider_mode = provider_mode;
 	io_params->format = format & SND_SOC_DAIFMT_FORMAT_MASK;
 
 	pcm3168a_update_fixup_pcm_stream(dai);
@@ -440,7 +440,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
 	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
-	bool master_mode, tdm_mode;
+	bool provider_mode, tdm_mode;
 	unsigned int format;
 	unsigned int reg, mask, ms, ms_shift, fmt, fmt_shift, ratio, tdm_slots;
 	int i, num_scki_ratios, slot_width;
@@ -459,9 +459,9 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		fmt_shift = PCM3168A_ADC_FMTAD_SHIFT;
 	}
 
-	master_mode = io_params->master_mode;
+	provider_mode = io_params->provider_mode;
 
-	if (master_mode) {
+	if (provider_mode) {
 		ratio = pcm3168a->sysclk / params_rate(params);
 
 		for (i = 0; i < num_scki_ratios; i++) {
@@ -488,15 +488,15 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 
 	switch (slot_width) {
 	case 16:
-		if (master_mode || (format != SND_SOC_DAIFMT_RIGHT_J)) {
-			dev_err(component->dev, "16-bit slots are supported only for slave mode using right justified\n");
+		if (provider_mode || (format != SND_SOC_DAIFMT_RIGHT_J)) {
+			dev_err(component->dev, "16-bit slots are supported only for consumer mode using right justified\n");
 			return -EINVAL;
 		}
 		break;
 	case 24:
-		if (master_mode || (format == SND_SOC_DAIFMT_DSP_A) ||
-				   (format == SND_SOC_DAIFMT_DSP_B)) {
-			dev_err(component->dev, "24-bit slots not supported in master mode, or slave mode using DSP\n");
+		if (provider_mode || (format == SND_SOC_DAIFMT_DSP_A) ||
+		    		     (format == SND_SOC_DAIFMT_DSP_B)) {
+			dev_err(component->dev, "24-bit slots not supported in provider mode, or consumer mode using DSP\n");
 			return -EINVAL;
 		}
 		break;
-- 
2.30.2

