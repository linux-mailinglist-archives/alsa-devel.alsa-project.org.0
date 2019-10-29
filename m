Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D2E89DF
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 14:46:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6030A1AE6;
	Tue, 29 Oct 2019 14:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6030A1AE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572356813;
	bh=QK1SsNiKJeZTIDjSekrUsLUnUTXXCsKvAFO3PxY0tqk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+UGQGTBBcIQiRUsW1JJr5HpCupcAATv9yP44UNLxLEZiMb67vw8/BnM8wt2VxdOl
	 JEOoIyj1NDNBu++Onx/z2Q0UZ6lCFrplYv14W+IFcwJpifBXPuLjAiQnA/5UB2P3gE
	 lRIiCdrfnm66NL3PUiVrgQJol30YhnAcdrl/S5Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D44F80673;
	Tue, 29 Oct 2019 14:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8131AF8063A; Tue, 29 Oct 2019 14:40:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 792DFF80610
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 14:40:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792DFF80610
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 06:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="205472592"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 06:40:35 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Tue, 29 Oct 2019 15:40:14 +0200
Message-Id: <20191029134017.18901-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
References: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, julia.lawall@lip6.fr
Subject: [alsa-devel] [PATCH v8 6/9] ASoC: Intel: bxt-da7219-max98357a:
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
 sound/soc/intel/boards/Makefile               |  2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 52e990b16b0d..0cf4a984f083 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -4,7 +4,7 @@ snd-soc-sst-byt-rt5640-mach-objs := byt-rt5640.o
 snd-soc-sst-byt-max98090-mach-objs := byt-max98090.o
 snd-soc-sst-bdw-rt5677-mach-objs := bdw-rt5677.o
 snd-soc-sst-broadwell-objs := broadwell.o
-snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o
+snd-soc-sst-bxt-da7219_max98357a-objs := bxt_da7219_max98357a.o hda_dsp_common.o
 snd-soc-sst-bxt-rt298-objs := bxt_rt298.o
 snd-soc-sst-glk-rt5682_max98357a-objs := glk_rt5682_max98357a.o
 snd-soc-sst-bytcr-rt5640-objs := bytcr_rt5640.o
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
