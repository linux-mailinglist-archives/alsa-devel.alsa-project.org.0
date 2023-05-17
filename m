Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3866706497
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 11:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84FF91FE;
	Wed, 17 May 2023 11:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84FF91FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684317135;
	bh=dp4AjByrGPPW2+s+Gu4zde9gjuLVVm2MN56x4f0uc3E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F+RL1Cm/0twaozcfmAz4ZO34N+bTfEcyv55+Hhtt+XzOKl/qpP9432+OSEPKG+9/A
	 0pEdtGoSlobB/+vq9gjPO/SppmPlCMV5wFHSC68z/58xWdP+eZy4X9DlKQnq08thUb
	 Brbbywk5OhaRpetOuzs1i26daJXaJUNxbklyA9jg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEC00F80580; Wed, 17 May 2023 11:51:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8611CF80579;
	Wed, 17 May 2023 11:51:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 801F6F80578; Wed, 17 May 2023 11:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A805F8024E;
	Wed, 17 May 2023 11:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A805F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=uaaSDLTc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684317058; x=1715853058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dp4AjByrGPPW2+s+Gu4zde9gjuLVVm2MN56x4f0uc3E=;
  b=uaaSDLTc22WxnAsf4m6tcRq+F5pQBb/bVymW0m6hYpxHVhewA6ZBW5Pm
   UfmkepeRt8IwPqcXIjSfzoAqKsQkFeWx5gZ8NQzIW1GqyZxT7vYqrcQDo
   6n1cb3HPbHt8i+RIcJPrHyiOW/ajdDANOfj7QMmGubV3vBsDB1PjK3nAw
   O3EklAWyNM5vhQ01zD2W/SpGriBVQhyHVp9SCx8D9nyn9z4zDIF7eKscx
   Zc812V6/kcA6IOJ8RtVKYaY39gfzaxbbjO8PCgVyghpgLVRMjTyvNdtA9
   H/h9FLPdRF9YUi5o3uRp5zIszT3cKCNciEg/QDgBfJUYhfdwMtWbsmzgW
   g==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600";
   d="scan'208";a="211699133"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 May 2023 02:50:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 02:50:49 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 17 May 2023 02:50:37 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <oder_chiou@realtek.com>, <shengjiu.wang@gmail.com>,
	<Xiubo.Lee@gmail.com>, <festevam@gmail.com>, <nicoleotsuka@gmail.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<linux-imx@nxp.com>, <cezary.rojewski@intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srinivas.kandagatla@linaro.org>,
	<bgoswami@quicinc.com>, <vkoul@kernel.org>, <daniel.baluta@nxp.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jarkko.nikula@bitmer.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-tegra@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 2/2] ASoC: use pm.h instead of runtime_pm.h
Date: Wed, 17 May 2023 12:49:03 +0300
Message-ID: <20230517094903.2895238-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
References: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 5EH46VJHUYCV6ONT74MBVFPGGIZSKSEK
X-Message-ID-Hash: 5EH46VJHUYCV6ONT74MBVFPGGIZSKSEK
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5EH46VJHUYCV6ONT74MBVFPGGIZSKSEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not include pm_runtime.h header in files where runtime PM support is
not implemented. Use pm.h instead as suspend to RAM specific
implementation is available.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/codecs/max98373-i2c.c | 2 +-
 sound/soc/qcom/lpass-sc7180.c   | 2 +-
 sound/soc/qcom/lpass-sc7280.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index 3d6da4f133de..0fa5ceca62a2 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -9,7 +9,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/pm_runtime.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/cdev.h>
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 41db6617e2ed..56db852f4eab 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -12,7 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
+#include <linux/pm.h>
 #include <dt-bindings/sound/sc7180-lpass.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index d43f480cbae3..bcf18fe8e14d 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -8,7 +8,7 @@
 #include <linux/module.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
-#include <linux/pm_runtime.h>
+#include <linux/pm.h>
 
 #include <dt-bindings/sound/sc7180-lpass.h>
 
-- 
2.34.1

