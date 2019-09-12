Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807CB111A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 16:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA9F41757;
	Thu, 12 Sep 2019 16:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA9F41757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568298489;
	bh=1dH4e8Xt2dePNcH3fhCKbu3NJZJ31gF/hI2nItDiMa0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S91d9vGBIscm66kij0CPxWJeIq2Kj4QhWd9SSuiRSk7QSIIQNvhkpMjGR3FXFcc0d
	 P0C3L20B8umgUWZgJcve6Q72bGwSzyyKI8Nxq9bfhz3oVN8LkWMmXsf3yLk9HL/ZcQ
	 bArsy9pFVyoNLBN9HsXLYeMxygFe1RPQPywSCBfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 034AEF80649;
	Thu, 12 Sep 2019 16:22:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B38ACF80638; Thu, 12 Sep 2019 16:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2A00F80638
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 16:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A00F80638
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Sep 2019 07:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="190008233"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga006.jf.intel.com with ESMTP; 12 Sep 2019 07:22:26 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 12 Sep 2019 17:21:57 +0300
Message-Id: <20190912142200.8031-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912142200.8031-1-kai.vehmanen@linux.intel.com>
References: <20190912142200.8031-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v4 6/9] ASoC: Intel: bxt-da7219-max98357a:
	common hdmi codec support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for using snd-hda-codec-hdmi driver for HDMI/DP
instead of ASoC hdac-hdmi. This is aligned with how other
HDA codecs are already handled.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index ac1dea5f9d11..5873abb46441 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -21,6 +21,7 @@
 #include "../../codecs/da7219.h"
 #include "../../codecs/da7219-aad.h"
 #include "../common/soc-intel-quirks.h"
+#include "hda_dsp_common.h"
 
 #define BXT_DIALOG_CODEC_DAI	"da7219-hifi"
 #define BXT_MAXIM_CODEC_DAI	"HiFi"
@@ -38,6 +39,7 @@ struct bxt_hdmi_pcm {
 
 struct bxt_card_private {
 	struct list_head hdmi_pcm_list;
+	bool common_hdmi_codec_drv;
 };
 
 enum {
@@ -615,6 +617,13 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 		snd_soc_dapm_add_routes(&card->dapm, broxton_map,
 					ARRAY_SIZE(broxton_map));
 
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct bxt_hdmi_pcm,
+			       head);
+	component = pcm->codec_dai->component;
+
+	if (ctx->common_hdmi_codec_drv)
+		return hda_dsp_hdmi_build_controls(card, component);
+
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
@@ -720,6 +729,8 @@ static int broxton_audio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
+
 	return devm_snd_soc_register_card(&pdev->dev, &broxton_audio_card);
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
