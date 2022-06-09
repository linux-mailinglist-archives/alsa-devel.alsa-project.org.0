Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F936544DE1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51091B19;
	Thu,  9 Jun 2022 15:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51091B19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654782004;
	bh=AmseWLKD4anTx0R1RGuTLqlgM0ICZkHNCXs4PhG8m7o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OASMbIpuctG+ZFyj123A7AsnpgafY+Kie/Ll1C7FgzduOa/6OA4BP0hr8cTKYQLY/
	 pMidFTtoJ5FsI/KwJB7LjzzhWF0PfKOKc42wtVvEXQ02e73QpYwRKG/Qoczo4wuAX9
	 A/4aWzYsQB7Br9N3cg7FGpzjf8voAT3aqr+UuZ0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F742F8055B;
	Thu,  9 Jun 2022 15:36:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7D38F8055B; Thu,  9 Jun 2022 15:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C40C7F8055B
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C40C7F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="liQCXWjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781764; x=1686317764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AmseWLKD4anTx0R1RGuTLqlgM0ICZkHNCXs4PhG8m7o=;
 b=liQCXWjpw9VdWQULDPEA8tyyR+WkzVlnxDgDmbz8ZCdq0Xrl7n6cgG4Z
 vSfuAtAa3WyBhJjS0dDi6L+h6ONARWSxLcFcaWKHXEMn2oCRsTSJABs+m
 IFH5MHdL6n5/tZPono/KPjwmPAo1PitKmXuyhSk5VzZmJgOKQI0EFEUAN
 3Z2KomjYRg0vSRwKVS7jgaLN4g9pjjP1pOoitMf3ccyF9PCCv672DJVHO
 zmR0BRC7Ghx0ubwfEvPgNpwpkRgTPReS+AeObzpNfyszL8RdfCa/zH4dF
 lz13zTa+78PSL4h+dcA3mv58z+f/AZsxblXL2B3XLp1NeEG1eaBE27pjI w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061428"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061428"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966203"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:36:00 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 11/11] ASoC: codecs: rt298: Fix jack detection
Date: Thu,  9 Jun 2022 15:35:41 +0200
Message-Id: <20220609133541.3984886-12-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

On our RVP platforms using rt298 with combojack we've seen issues with
controls being in incorrect state after suspend/resume cycle. This is
caused by codec driver not setting pins to correct state and causing
codec suspend method to not be called. Which on resume caused codec
registers to be in undefined state. Fix this by setting pins correctly
in jack detect function.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 2af037536bc9..f1c3dfdea5e7 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -330,36 +330,31 @@ static void rt298_jack_detect_work(struct work_struct *work)
 static int rt298_mic_detect(struct snd_soc_component *component,
 			    struct snd_soc_jack *jack, void *data)
 {
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm;
-	bool hp = false;
-	bool mic = false;
-	int status = 0;
 
 	rt298->jack = jack;
 
-	/* If jack in NULL, disable HS jack */
-	if (!jack) {
+	if (jack) {
+		/* enable IRQ */
+		if (rt298->jack->status & SND_JACK_HEADPHONE)
+			snd_soc_dapm_force_enable_pin(dapm, "LDO1");
+		if (rt298->jack->status & SND_JACK_MICROPHONE) {
+			snd_soc_dapm_force_enable_pin(dapm, "HV");
+			snd_soc_dapm_force_enable_pin(dapm, "VREF");
+		}
+		regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
+		enable_irq(rt298->i2c->irq);
+		snd_soc_jack_report(rt298->jack, rt298->jack->status,
+				    SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
+	} else {
 		disable_irq(rt298->i2c->irq);
 		regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x0);
-		dapm = snd_soc_component_get_dapm(component);
+		snd_soc_dapm_disable_pin(dapm, "HV");
+		snd_soc_dapm_disable_pin(dapm, "VREF");
 		snd_soc_dapm_disable_pin(dapm, "LDO1");
-		snd_soc_dapm_sync(dapm);
-		return 0;
 	}
-
-	regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
-	enable_irq(rt298->i2c->irq);
-
-	rt298_jack_detect(rt298, &hp, &mic);
-	if (hp)
-		status |= SND_JACK_HEADPHONE;
-
-	if (mic)
-		status |= SND_JACK_MICROPHONE;
-
-	snd_soc_jack_report(rt298->jack, status,
-		SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
+	snd_soc_dapm_sync(dapm);
 
 	return 0;
 }
-- 
2.25.1

