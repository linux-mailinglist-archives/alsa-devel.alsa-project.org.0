Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC9434788
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 11:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DCD316BC;
	Wed, 20 Oct 2021 11:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DCD316BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634720523;
	bh=EAhhmcVnkW2X+YJBxLB/GJySTH1vUN6NqykRSe3qtSU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQPGWBU3aegNeliHkFL8C30f5np1hdGfhHqYiTTwWzuIJ0PqJ/22CKdeYMpD31VvP
	 qN34XyzJNIBdcbbHXF2ryF0XR1W/BzJ4/DSTrODEDorVFv1moOpx6LVSechPY0gZhO
	 nBzmdWBlFMdXRmx44LsXtGrdTL2jElrYFHt7FNsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E1AF80300;
	Wed, 20 Oct 2021 11:00:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D80E9F804CA; Wed, 20 Oct 2021 11:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF440F80300
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 11:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF440F80300
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cQMveaC/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19K5NeVX008304; 
 Wed, 20 Oct 2021 04:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=LvOjljNd4EoCQbyz8d+C/xA3gJjHOztj6tZLEGZnz+g=;
 b=cQMveaC/Eehrljas/h/CQrZydoJYunRY9/Bz883i/tqsITuqrHCmaa9jfnxt/Xt3K3W7
 q442CXmj4ul6s8cjLFFeHrizE/ZmI6Sotuxr1u+y2ZQ5JMdb19aIRCwUn7sE4iifDBSG
 E58bC0Wno3cw75AjRkZw5U+dUSBdkJPi9GaJsycCA7GOe0NuPo/zN+cglwPaLY6QzrvI
 W0xXp5tBDn7V/1oB/v1S9owmEXwxlCQKXNuW/4GwWjaviwGDTpjR+C5sFB37LrQnFjfo
 /cIWUjW8sV5498NiDoTVcHRtNdkoKVVn+DBbJpyaH1ffJ2RvhxdwXm8P++9S82ra7TPs Tw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bt9k0gcqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 20 Oct 2021 04:00:01 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 20 Oct
 2021 09:59:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 20 Oct 2021 09:59:47 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.166])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E309E11AF;
 Wed, 20 Oct 2021 08:59:46 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Len Brown <lenb@kernel.org>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [RFC PATCH v2 2/3] ALSA: hda/realtek: Add support for Legion 7
 16ACHg6 laptop Speakers
Date: Wed, 20 Oct 2021 09:59:43 +0100
Message-ID: <20211020085944.17577-3-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020085944.17577-1-tanureal@opensource.cirrus.com>
References: <20211020085944.17577-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: A9LQYSZE32GhD-lsnMc66up9xPYGMGr3
X-Proofpoint-ORIG-GUID: A9LQYSZE32GhD-lsnMc66up9xPYGMGr3
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com
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

Find the associated Amps by dai name, and use dai ops to configure it.
Disable support for Amps if ASoC not built.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 109 +++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4407f7da57c4..9a6fe6048b60 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -21,6 +21,7 @@
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/hda_codec.h>
+#include <sound/soc.h>
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
@@ -74,6 +75,11 @@ struct alc_coef_led {
 	unsigned int off;
 };
 
+struct alc_soc_dai_node {
+	struct list_head node;
+	struct snd_soc_dai *dai;
+};
+
 struct alc_spec {
 	struct hda_gen_spec gen; /* must be at head */
 
@@ -126,6 +132,9 @@ struct alc_spec {
 	unsigned int coef0;
 	struct input_dev *kb_dev;
 	u8 alc_mute_keycode_map[1];
+
+	/* ASoC DAIs used to init ASoC components in this sound card */
+	struct list_head soc_dais;
 };
 
 /*
@@ -6443,6 +6452,96 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 	}
 }
 
+static void alc_soc_dai_clear_list(struct alc_spec *spec)
+{
+	struct alc_soc_dai_node *n, *tmp;
+
+	if (list_empty(&spec->soc_dais))
+		return;
+
+	list_for_each_entry_safe(n, tmp, &spec->soc_dais, node) {
+		list_del(&n->node);
+		kfree(n);
+	}
+}
+
+static int alc_add_soc_dai_list(struct alc_spec *spec, const char *dai_name)
+{
+#if IS_ENABLED(CONFIG_SND_SOC)
+	struct snd_soc_dai_link_component dlc;
+	struct alc_soc_dai_node *dai_node;
+	//struct snd_soc_component *comp;
+	struct snd_soc_dai *dai;
+
+	dlc.dai_name = dai_name;
+	dlc.of_node = NULL;
+	dlc.name = NULL;
+
+	dai = snd_soc_find_dai(&dlc);
+	if (!dai)
+		return -EPROBE_DEFER;
+
+	dai_node = kmalloc(sizeof(*dai_node), GFP_KERNEL);
+	if (!dai_node)
+		return -ENOMEM;
+	dai_node->dai = dai;
+
+	list_add(&dai_node->node, &spec->soc_dais);
+
+	return 0;
+#else
+	return -EPERM;
+#endif
+}
+
+void lenovo_y760_pcm_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *cdc,
+				   struct snd_pcm_substream *sub, int act)
+{
+	struct alc_spec *spec = cdc->spec;
+	struct alc_soc_dai_node *dai_node;
+	struct snd_soc_dai *dai;
+	unsigned int rx_slots[2] = {1, 0};
+	int i = 0;
+
+	list_for_each_entry(dai_node, &spec->soc_dais, node) {
+		dai = dai_node->dai;
+		if (!dai->driver->ops)
+			continue;
+		switch (act) {
+		case HDA_GEN_PCM_ACT_PREPARE:
+			if (dai->driver->ops->set_channel_map)
+				dai->driver->ops->set_channel_map(dai, 0, NULL, 1, &rx_slots[i++]);
+			if (dai->driver->ops->prepare)
+				dai->driver->ops->prepare(sub, dai);
+			break;
+		case HDA_GEN_PCM_ACT_CLOSE:
+			if (dai->driver->ops->shutdown)
+				dai->driver->ops->shutdown(sub, dai);
+			break;
+		}
+	}
+
+}
+
+static void alc287_fixup_lenovo_y760(struct hda_codec *codec, const struct hda_fixup *fix, int act)
+{
+	struct alc_spec *spec = codec->spec;
+	int ret;
+
+	INIT_LIST_HEAD(&spec->soc_dais);
+
+	ret = alc_add_soc_dai_list(spec, "i2c-CLSA0100:00-cs35l41.0");
+	if (ret)
+		return;
+
+	ret = alc_add_soc_dai_list(spec, "i2c-CLSA0100:00-cs35l41.1");
+	if (ret) {
+		alc_soc_dai_clear_list(spec);
+		return;
+	}
+	spec->gen.pcm_playback_hook = lenovo_y760_pcm_playback_hook;
+}
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -6663,7 +6762,8 @@ enum {
 	ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS,
 	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
-	ALC287_FIXUP_13S_GEN2_SPEAKERS
+	ALC287_FIXUP_13S_GEN2_SPEAKERS,
+	ALC287_FIXUP_LENOVO_Y760
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8361,6 +8461,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE,
 	},
+	[ALC287_FIXUP_LENOVO_Y760] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_y760,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8755,6 +8859,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
+	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion Y760", ALC287_FIXUP_LENOVO_Y760),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
@@ -9499,6 +9604,8 @@ static int patch_alc269(struct hda_codec *codec)
 	spec->shutup = alc_default_shutup;
 	spec->init_hook = alc_default_init;
 
+	INIT_LIST_HEAD(&spec->soc_dais);
+
 	switch (codec->core.vendor_id) {
 	case 0x10ec0269:
 		spec->codec_variant = ALC269_TYPE_ALC269VA;
-- 
2.33.1

