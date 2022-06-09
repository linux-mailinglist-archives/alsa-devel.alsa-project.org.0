Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCEB544DDE
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F61E1AD0;
	Thu,  9 Jun 2022 15:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F61E1AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781971;
	bh=OyfIkd1NAxDWdbHeK+79uCuF8wIkWKh2q8RH4+BP8Io=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rqLMlhy0JCugpXT/StaojV1RbMMNr10rzKWmucsVUrnkRy61GNoytGGzbQcGbQJLD
	 Y9NVu+OMCIagtIAe7+l+2mnTFX+7zlJ6cgmuwlQI+Zh5EK2fIqh9G4Yqbc2U19FqYO
	 QfwwcpxQpHPV1KsrxDO9ejnLKd4jzULy5beqWews=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2732FF80571;
	Thu,  9 Jun 2022 15:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B19F80557; Thu,  9 Jun 2022 15:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB6E7F80535
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB6E7F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cV6QsbmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781760; x=1686317760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OyfIkd1NAxDWdbHeK+79uCuF8wIkWKh2q8RH4+BP8Io=;
 b=cV6QsbmLglIiFNFDjcXqpgqfgE+ZYcAl5e8SN5PftS+izAdCsx0PMPXY
 uUHec4EgnuucJnoAt/CnIkQhmnk1iHMXBtGsvZzLFP/90uGw8ABtGD4iL
 2yxqADlGjfocgM19dtOePdu8zKLZcvzoDa1/dPu29y9Q5R6lF5W3ERBlb
 TC31POdLVCtQf487TnoWO2t0Q3InLUJtctLwf2K4vYBeJ5ZafXskvXa3L
 Y/s4azRa1X3kyFrlrF1TJN/kZZTDt5NxfZf9pdITXCo7ZddpyQlhnil0l
 ongDMRTqg4oRzNg7CP5BRhqvlooWuBgjquu1EsYBuAnFOYpzPFKoonzWI g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061418"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061418"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966187"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:56 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/11] ASoC: codecs: rt298: Enable irq only when needed
Date: Thu,  9 Jun 2022 15:35:39 +0200
Message-Id: <20220609133541.3984886-10-amadeuszx.slawinski@linux.intel.com>
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

Interrupt is only needed when jack detection is enabled, so enable it
then, similarly disable it when jack detection is being disabled.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 078810f2ec7b..3c13b6dc3be9 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -16,6 +16,7 @@
 #include <linux/spi/spi.h>
 #include <linux/dmi.h>
 #include <linux/acpi.h>
+#include <linux/irq.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -337,6 +338,7 @@ static int rt298_mic_detect(struct snd_soc_component *component,
 
 	/* If jack in NULL, disable HS jack */
 	if (!jack) {
+		disable_irq(rt298->i2c->irq);
 		regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x0);
 		dapm = snd_soc_component_get_dapm(component);
 		snd_soc_dapm_disable_pin(dapm, "LDO1");
@@ -346,6 +348,7 @@ static int rt298_mic_detect(struct snd_soc_component *component,
 
 	rt298->jack = jack;
 	regmap_update_bits(rt298->regmap, RT298_IRQ_CTRL, 0x2, 0x2);
+	enable_irq(rt298->i2c->irq);
 
 	rt298_jack_detect(rt298, &hp, &mic);
 	if (hp)
@@ -1015,6 +1018,9 @@ static int rt298_probe(struct snd_soc_component *component)
 	INIT_DELAYED_WORK(&rt298->jack_detect_work, rt298_jack_detect_work);
 
 	if (rt298->i2c->irq) {
+		/* irq will be enabled in rt298_mic_detect */
+		irq_set_status_flags(rt298->i2c->irq, IRQ_NOAUTOEN);
+
 		ret = request_threaded_irq(rt298->i2c->irq, NULL, rt298_irq,
 					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt298", rt298);
 		if (ret) {
-- 
2.25.1

