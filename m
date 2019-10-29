Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A1E89E0
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 14:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 955582057;
	Tue, 29 Oct 2019 14:46:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 955582057
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572356856;
	bh=LHTGR78OMmN2GqhY2hRXDudas8ZCp/lLA5xYG6WJrew=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJungONp5NITnFgeB1kp4wFu78TwtzbLjkHeayXyWxPfvjZwGqKAu2gCQEfQf5JV2
	 ZKWKRdHzeyXrK3LwKC5xRgwQY16OWJDP19ZUlxxZ1Wo4g8tWG8LV3j7C3UwGUGSA5a
	 vjkblmaU1o0ctuJ03wzrynE9TLEhxrKN2ZwVEQ2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0269EF80678;
	Tue, 29 Oct 2019 14:40:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BA22F80649; Tue, 29 Oct 2019 14:40:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0371DF80638
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 14:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0371DF80638
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 06:40:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="205472600"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 06:40:39 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Tue, 29 Oct 2019 15:40:16 +0200
Message-Id: <20191029134017.18901-9-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
References: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, julia.lawall@lip6.fr
Subject: [alsa-devel] [PATCH v8 8/9] ASoC: intel: sof_rt5682: common hdmi
	codec support
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
 sound/soc/intel/boards/Makefile     |  2 +-
 sound/soc/intel/boards/sof_rt5682.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index b36f44906c91..255cee8c7906 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -17,7 +17,7 @@ snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
-snd-soc-sof_rt5682-objs := sof_rt5682.o
+snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
 snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4f6e58c3954a..4ef9d1ae142d 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -21,6 +21,7 @@
 #include "../../codecs/rt5682.h"
 #include "../../codecs/hdac_hdmi.h"
 #include "../common/soc-intel-quirks.h"
+#include "hda_dsp_common.h"
 
 #define NAME_SIZE 32
 
@@ -53,6 +54,7 @@ struct sof_card_private {
 	struct clk *mclk;
 	struct snd_soc_jack sof_headset;
 	struct list_head hdmi_pcm_list;
+	bool common_hdmi_codec_drv;
 };
 
 static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
@@ -274,6 +276,13 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	if (is_legacy_cpu)
 		return 0;
 
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm,
+			       head);
+	component = pcm->codec_dai->component;
+
+	if (ctx->common_hdmi_codec_drv)
+		return hda_dsp_hdmi_build_controls(card, component);
+
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
@@ -651,6 +660,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
+
 	snd_soc_card_set_drvdata(&sof_audio_card_rt5682, ctx);
 
 	return devm_snd_soc_register_card(&pdev->dev,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
