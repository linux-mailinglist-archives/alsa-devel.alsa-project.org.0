Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA3D3E8C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 13:35:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B5C51664;
	Fri, 11 Oct 2019 13:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B5C51664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570793746;
	bh=iAOF6xa31pbw/QNXIK2AljB3Qao+rrqOPKcQBh++kaM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iwY1ok3Dan70Tv7wVSbQut1ixoBCMDivR3HLkqx1eA1iROpT6XpphkWxMkRSnxpwE
	 jLgVMzuTQZJCHEpRUN8LCT5clxwpxubWjimi1HPqUsQz8wELAAMww8QB4lLaDJhIYc
	 H5VxW+jUrraYmrqZ4q9bKltOBOf7BxGFFJG3UPxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8976F8067C;
	Fri, 11 Oct 2019 13:28:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1C3AF8063C; Fri, 11 Oct 2019 13:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93226F80633
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 13:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93226F80633
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 04:28:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="394382825"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2019 04:28:13 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri, 11 Oct 2019 14:27:45 +0300
Message-Id: <20191011112745.25800-10-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
References: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v6 9/9] ASoC: Intel: bxt_rt298: common hdmi
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
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bxt_rt298.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index adf416a49b48..eabf9d8468ae 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -18,6 +18,7 @@
 #include <sound/pcm_params.h>
 #include "../../codecs/hdac_hdmi.h"
 #include "../../codecs/rt298.h"
+#include "hda_dsp_common.h"
 
 /* Headset jack detection DAPM pins */
 static struct snd_soc_jack broxton_headset;
@@ -31,6 +32,7 @@ struct bxt_hdmi_pcm {
 
 struct bxt_rt286_private {
 	struct list_head hdmi_pcm_list;
+	bool common_hdmi_codec_drv;
 };
 
 enum {
@@ -527,6 +529,13 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 	int err, i = 0;
 	char jack_name[NAME_SIZE];
 
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
@@ -626,6 +635,8 @@ static int broxton_audio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
+
 	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
