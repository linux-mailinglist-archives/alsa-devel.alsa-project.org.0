Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00821248AC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 09:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63BDE166D;
	Tue, 21 May 2019 09:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63BDE166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558422422;
	bh=VZtZVnjjL3mz6kqxtGrmiyZIAcYqRxfQZWJacG6R6vI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qs8wvC/b/3ikiEPHFLxeRlOt2MN6UyMCi0T2GyVXI5rUaR9dYTaRzgisxUxnhvPE5
	 tHwQ9eX2itggbNi7ZgI6l1Nw/+wjJ2LtfiGVMo/9zKS2hrWe25foWmBpn73BZHrN0n
	 +4M2VDfE9eSLlHJvZcL1clX989OyktrEM0A0aoPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B9B1F89633;
	Tue, 21 May 2019 09:05:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6F36F89674; Tue, 21 May 2019 09:05:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECDE3F806E7
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 09:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECDE3F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 May 2019 00:05:08 -0700
X-ExtLoop1: 1
Received: from rander-i9.sh.intel.com ([10.239.14.114])
 by FMSMGA003.fm.intel.com with ESMTP; 21 May 2019 00:05:07 -0700
From: Rander Wang <rander.wang@linux.intel.com>
To: broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
Date: Tue, 21 May 2019 15:07:41 +0800
Message-Id: <20190521070741.65866-1-rander.wang@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Cc: Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC] ASoC: Intel: skl_hda_dsp_common: set long name
	for skl_hda_card
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

skl_hda_generic machine driver is used by many different devices
and userspace uses the card long name to differentiate devices.
The card long name is figured out by DMI info and is in format
of "vendor-product-version-board". Ucm file is searched by this
card long name and one problem is different devices can't share
one ucm file based on this type of long name. We have three different
product devices with the same codecs and audio settings, and these
devices can share the same ucm setting, but now we need to provide
three ucm files with different long names, because we can't get a
same long name from DMI info.

The solution is to provide card long name in machine driver like
bytcr_rt5640 and ASoC will use this long name to generate final long
name. The card long name is composed of codec name, input and output
enabled by devices. The long name should be initialized after hda codec
is initialized and before sound card checking long name which is done
after dai link initialization, so the long name is set in codec dai
link initialization function.

Possible card long names may be:
skl-hda-ALC233-config135440
skl-hda-ALC700-config69649
skl-hda-ALC3204-config135185

Tested on intel hda platform whiskylake with SOF driver and gemilake
with intel SST driver

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c | 54 +++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 8b68f41a5b88..0193d2138e16 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -11,11 +11,18 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/hda_codec.h>
+#include "../../../pci/hda/hda_jack.h"
+#include "../../../pci/hda/hda_local.h"
+#include "../../../pci/hda/hda_auto_parser.h"
+#include "../../../pci/hda/hda_generic.h"
 #include "../../codecs/hdac_hdmi.h"
+#include "../../codecs/hdac_hda.h"
 #include "../skylake/skl.h"
 #include "skl_hda_dsp_common.h"
 
 #define NAME_SIZE	32
+static char skl_hda_long_name[NAME_SIZE];
 
 int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
 {
@@ -39,6 +46,52 @@ int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
 	return 0;
 }
 
+int skl_hda_long_name_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_rtdcom_list *new_rtdcom;
+	struct snd_soc_component *component;
+	struct hdac_hda_priv *hda_pvt;
+	struct auto_pin_cfg *autocfg;
+	struct hda_gen_spec *spec;
+	struct snd_soc_card *card;
+	const char *name;
+	int config;
+
+	name = rtd->dai_link->codecs->name;
+	card = rtd->card;
+
+	list_for_each_entry(new_rtdcom, &rtd->component_list, list) {
+		component = new_rtdcom->component;
+		if (name && strcmp(component->name, name) == 0) {
+			hda_pvt = snd_soc_component_get_drvdata(component);
+
+			if (!hda_pvt)
+				return -EINVAL;
+
+			spec = hda_pvt->codec.spec;
+			autocfg = &spec->autocfg;
+
+			/*
+			 * config is figured out by combining the number of
+			 * enabled input and output.
+			 */
+			config = autocfg->speaker_outs | (autocfg->hp_outs << 4)
+				| (autocfg->dig_outs << 8)
+				| (autocfg->line_outs << 12)
+				| (autocfg->num_inputs << 16);
+			snprintf(skl_hda_long_name, sizeof(skl_hda_long_name),
+				 "skl-hda-%s-config%d",
+				 hda_pvt->codec.core.chip_name,
+				 config);
+
+			card->long_name = skl_hda_long_name;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 /* skl_hda_digital audio interface glue - connects codec <--> CPU */
 struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 	/* Back End DAI links */
@@ -79,6 +132,7 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.no_pcm = 1,
+		.init = skl_hda_long_name_init,
 	},
 	{
 		.name = "Digital Playback and Capture",
-- 
2.14.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
