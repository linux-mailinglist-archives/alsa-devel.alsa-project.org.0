Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EF1B76D9
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 15:22:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80C211682;
	Fri, 24 Apr 2020 15:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80C211682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587734541;
	bh=+pL0V04blkjc3PbI44t46mcaQGx8eCsq/ecFQnVrFZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jv/MgDF9bejT8hTxkqYVqsctNpDRt54dfB1tX8znASmqjSuyP8nbxySpumtjdAj7j
	 QTB7cSE44S+4Pugl03KYoSoK9Yau3lsf+NmlZ0ix4zCHpsmr1iPxZQy/ay6JPDBOm2
	 QK/S+rRUSB+YYAy84+e2SNfL9YusKtFv1Eyyz484=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C078F8029A;
	Fri, 24 Apr 2020 15:19:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8098F802A0; Fri, 24 Apr 2020 15:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF2DFF80299
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 15:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF2DFF80299
IronPort-SDR: DiDR+ij7I1LhG2fxmlnpGKlAbG4e1RjQF7CpGVmxAtG2N1R76Qylt5sp6P5kwcgMTofSIghg/U
 iaVLlOvmVDfw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 06:18:59 -0700
IronPort-SDR: xHxrHssXoXp/7Ungj6PnRJGohwGuZ/wrxdPTltXO5C2t1eR+1mrv7FWx/1eCbwzExoxBUwMv6H
 ykX07MkqZ2oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="246589182"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2020 06:18:58 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 3/3] ASoC: Intel: Skylake: Automatic DMIC format
 configuration according to information from NHLT
Date: Fri, 24 Apr 2020 15:20:02 +0200
Message-Id: <20200424132002.3850-4-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
References: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
Cc: Mateusz Gorski <mateusz.gorski@linux.intel.com>, cezary.rojewski@intel.com,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

Automatically choose DMIC pipeline format configuration depending on
information included in NHLT.
Change the access rights of appropriate kcontrols to read-only in order
to prevent user interference.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
- removed <sound/soc-acpi.h> include (moved to patch 1/3)

Changes in v3:
--none--

Changes in v4:
- added comment about access rights for DMIC pipe configuration enums
- adjusted set and get functions for DMIC enums to use helper function
  introduced in patch 2/3

 include/uapi/sound/skl-tplg-interface.h |  1 +
 sound/soc/intel/skylake/skl-topology.c  | 64 +++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/include/uapi/sound/skl-tplg-interface.h b/include/uapi/sound/skl-tplg-interface.h
index f2711186c81f..a93c0decfdd5 100644
--- a/include/uapi/sound/skl-tplg-interface.h
+++ b/include/uapi/sound/skl-tplg-interface.h
@@ -19,6 +19,7 @@
 #define SKL_CONTROL_TYPE_BYTE_TLV	0x100
 #define SKL_CONTROL_TYPE_MIC_SELECT	0x102
 #define SKL_CONTROL_TYPE_MULTI_IO_SELECT	0x103
+#define SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC	0x104
 
 #define HDA_SST_CFG_MAX	900 /* size of copier cfg*/
 #define MAX_IN_QUEUE 8
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index f51eaf77aad3..a331e6451b99 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1404,6 +1404,18 @@ static int skl_tplg_multi_config_set(struct snd_kcontrol *kcontrol,
 	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, true);
 }
 
+static int skl_tplg_multi_config_get_dmic(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, false);
+}
+
+static int skl_tplg_multi_config_set_dmic(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, true);
+}
+
 static int skl_tplg_tlv_control_get(struct snd_kcontrol *kcontrol,
 			unsigned int __user *data, unsigned int size)
 {
@@ -1948,6 +1960,11 @@ static const struct snd_soc_tplg_kcontrol_ops skl_tplg_kcontrol_ops[] = {
 		.get = skl_tplg_multi_config_get,
 		.put = skl_tplg_multi_config_set,
 	},
+	{
+		.id = SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC,
+		.get = skl_tplg_multi_config_get_dmic,
+		.put = skl_tplg_multi_config_set_dmic,
+	}
 };
 
 static int skl_tplg_fill_pipe_cfg(struct device *dev,
@@ -3108,12 +3125,21 @@ static int skl_tplg_control_load(struct snd_soc_component *cmpnt,
 	case SND_SOC_TPLG_CTL_ENUM:
 		tplg_ec = container_of(hdr,
 				struct snd_soc_tplg_enum_control, hdr);
-		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READWRITE) {
+		if (kctl->access & SNDRV_CTL_ELEM_ACCESS_READ) {
 			se = (struct soc_enum *)kctl->private_value;
 			if (tplg_ec->priv.size)
-				return skl_init_enum_data(bus->dev, se,
-						tplg_ec);
+				skl_init_enum_data(bus->dev, se, tplg_ec);
 		}
+
+		/*
+		 * now that the control initializations are done, remove
+		 * write permission for the DMIC configuration enums to
+		 * avoid conflicts between NHLT settings and user interaction
+		 */
+
+		if (hdr->ops.get == SKL_CONTROL_TYPE_MULTI_IO_SELECT_DMIC)
+			kctl->access = SNDRV_CTL_ELEM_ACCESS_READ;
+
 		break;
 
 	default:
@@ -3583,6 +3609,37 @@ static int skl_manifest_load(struct snd_soc_component *cmpnt, int index,
 	return 0;
 }
 
+static void skl_tplg_complete(struct snd_soc_component *component)
+{
+	struct snd_soc_dobj *dobj;
+	struct snd_soc_acpi_mach *mach =
+		dev_get_platdata(component->card->dev);
+	int i;
+
+	list_for_each_entry(dobj, &component->dobj_list, list) {
+		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
+		struct soc_enum *se =
+			(struct soc_enum *)kcontrol->private_value;
+		char **texts = dobj->control.dtexts;
+		char chan_text[4];
+
+		if (dobj->type != SND_SOC_DOBJ_ENUM ||
+				dobj->control.kcontrol->put !=
+				skl_tplg_multi_config_set_dmic)
+			continue;
+		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
+
+		for (i = 0; i < se->items; i++) {
+			struct snd_ctl_elem_value val;
+
+			if (strstr(texts[i], chan_text)) {
+				val.value.enumerated.item[0] = i;
+				kcontrol->put(kcontrol, &val);
+			}
+		}
+	}
+}
+
 static struct snd_soc_tplg_ops skl_tplg_ops  = {
 	.widget_load = skl_tplg_widget_load,
 	.control_load = skl_tplg_control_load,
@@ -3592,6 +3649,7 @@ static struct snd_soc_tplg_ops skl_tplg_ops  = {
 	.io_ops_count = ARRAY_SIZE(skl_tplg_kcontrol_ops),
 	.manifest = skl_manifest_load,
 	.dai_load = skl_dai_load,
+	.complete = skl_tplg_complete,
 };
 
 /*
-- 
2.17.1

