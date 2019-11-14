Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A2AFC043
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 07:39:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF071676;
	Thu, 14 Nov 2019 07:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF071676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573713594;
	bh=Zr9hzD1F4Ma+wxK6cVXI0nDIwBySYGfUEDDx1RgZ5aU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IS/O/bZdLbRaRHWVnz4AgJhupbgIs52vFBB70CvxRKKNdxaxUepU/o6qxoV0Ad0yf
	 DuiSEuKfXVvKxBFPttjXJz0kLXP0VrdVRufUniQxJijmhmofSDpy/9QpTEyzTC28Zt
	 pz2QuOnGOlXhrJgJhqJpJB8IjXktOnQAi7fsb6Mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D44FF80122;
	Thu, 14 Nov 2019 07:34:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9067AF800CD; Thu, 14 Nov 2019 04:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51E6CF8007E
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 04:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51E6CF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="JM/DdSLu"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcccc120000>; Wed, 13 Nov 2019 19:37:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 19:37:51 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 19:37:51 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 14 Nov 2019 03:37:49 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Thu, 14 Nov 2019 09:07:04 +0530
Message-ID: <20191114033704.18171-6-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191114033704.18171-1-nmahale@nvidia.com>
References: <20191114033704.18171-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573702674; bh=OCZ8JMuzwwvV8F5C0e8M0AdIs7ETfpMIyg7pI98erko=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=JM/DdSLu56alAiMK4CbZOHEHV3e37OQH9sXmdQGb+jsrlopz3PQwioP4Kh1XXp8lZ
 OVFhPjirbCAraCbdCpnLnhY0Z661rPB8E2O23QkT5gKD9IOEexwNtZdkWmIAJ5Hj0R
 Yz+Hh92Mf6ErSa9y7xoXssodoXvo7y8t25Cyy7TQhLAKspWkOeOxxsLVhxcVd5z6yR
 8vEGMIAH4pJEdnf0wDPFPYu5CB31dtGnrvD5Cqmb996hWWWcSTZb8/zVP8S3KmoBaG
 gJQ4JgkP/tAA25ditzd3FkBatNAlV4oVwNx2GoJHwv0SzTqTnLvHfLfPwUSDdEce5Z
 uInEPu9uu6oqw==
X-Mailman-Approved-At: Thu, 14 Nov 2019 07:34:48 +0100
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 5/5] ALSA: hda - Add DP-MST support for
	NVIDIA codecs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds DP-MST support for GK104+ NVIDIA codecs.

GK104+ NVIDIA codecs support DP-MST audio. These codecs have 4
output converters and 4 pin widgets, with 4 device entries per pin
widget for a total of 16 device entries.

This patch moves the existing patch_nvhdmi() definition to
patch_nvhdmi_legacy(), used by pre-GK104 NVIDIA codecs. Redefine
patch_nvhdmi() to enable DP-MST support by setting codec->dp_mst and
spec->dyn_pcm_assign.

Introduce NVIDIA-specific logic for dynamic pcm assignment, making
sure that new pcm assignments are compatible with the legacy static
per_pin-pmc assignment that existed in the days before DP-MST.

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 119 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 100 insertions(+), 19 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index fe58e711d259..326c68d8eb60 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -33,6 +33,8 @@
 #include "hda_local.h"
 #include "hda_jack.h"
 
+struct hdmi_spec;
+
 static bool static_hdmi_pcm;
 module_param(static_hdmi_pcm, bool, 0644);
 MODULE_PARM_DESC(static_hdmi_pcm, "Don't restrict PCM parameters per ELD info");
@@ -114,6 +116,9 @@ struct hdmi_ops {
 	void (*pin_cvt_fixup)(struct hda_codec *codec,
 			      struct hdmi_spec_per_pin *per_pin,
 			      hda_nid_t cvt_nid);
+	int (*find_pcm_slot)(struct hdmi_spec *spec,
+				struct hdmi_spec_per_pin *per_pin);
+
 };
 
 struct hdmi_pcm {
@@ -1353,7 +1358,7 @@ static void hdmi_attach_hda_pcm(struct hdmi_spec *spec,
 	/* pcm already be attached to the pin */
 	if (per_pin->pcm)
 		return;
-	idx = hdmi_find_pcm_slot(spec, per_pin);
+	idx = spec->ops.find_pcm_slot(spec, per_pin);
 	if (idx == -EBUSY)
 		return;
 	per_pin->pcm_idx = idx;
@@ -2386,6 +2391,7 @@ static const struct hdmi_ops generic_standard_hdmi_ops = {
 	.pin_setup_infoframe			= hdmi_pin_setup_infoframe,
 	.pin_hbr_setup				= hdmi_pin_hbr_setup,
 	.setup_stream				= hdmi_setup_stream,
+	.find_pcm_slot				= hdmi_find_pcm_slot,
 };
 
 /* allocate codec->spec and assign/initialize generic parser ops */
@@ -3494,11 +3500,86 @@ static const struct drm_audio_component_audio_ops nvhdmi_audio_ops = {
 	.master_unbind = generic_acomp_master_unbind,
 };
 
+static int nvhdmi_find_pcm_slot(struct hdmi_spec *spec,
+				struct hdmi_spec_per_pin *per_pin)
+{
+	int i;
+
+	/*
+	 * generic_hdmi_build_pcms() allocates (num_nids + dev_num - 1)
+	 * number of pcms.
+	 *
+	 * The per_pin of pin_nid_idx=n and dev_id=m prefers to get pcm-n if m==0.
+	 * This guarantees that dynamic pcm assignments are compatible with the
+	 * legacy static per_pin-pmc assignment that existed in the days before
+	 * DP-MST.
+	 *
+	 * per_pin of m!=0 prefers to get pcm=(num_nids + (m - 1)).
+	 */
+	if (per_pin->dev_id == 0 &&
+	    !test_bit(per_pin->pin_nid_idx, &spec->pcm_bitmap))
+		return per_pin->pin_nid_idx;
+
+	if (per_pin->dev_id != 0 &&
+	    !(test_bit(spec->num_nids + (per_pin->dev_id - 1),
+		&spec->pcm_bitmap))) {
+		return spec->num_nids + (per_pin->dev_id - 1);
+	}
+
+	/* have a second try; check the area over num_nids */
+	for (i = spec->num_nids; i < spec->pcm_used; i++) {
+		if (!test_bit(i, &spec->pcm_bitmap))
+			return i;
+	}
+
+	/* the last try; check the empty slots in pins */
+	for (i = 0; i < spec->num_nids; i++) {
+		if (!test_bit(i, &spec->pcm_bitmap))
+			return i;
+	}
+	return -EBUSY;
+}
+
 static int patch_nvhdmi(struct hda_codec *codec)
 {
 	struct hdmi_spec *spec;
 	int err;
 
+	err = alloc_generic_hdmi(codec);
+	if (err < 0)
+		return err;
+	codec->dp_mst = true;
+
+	spec = codec->spec;
+	spec->dyn_pcm_assign = true;
+	spec->ops.find_pcm_slot = nvhdmi_find_pcm_slot;
+
+	err = hdmi_parse_codec(codec);
+	if (err < 0) {
+		generic_spec_free(codec);
+		return err;
+	}
+
+	generic_hdmi_init_per_pins(codec);
+
+	spec->dyn_pin_out = true;
+
+	spec->chmap.ops.chmap_cea_alloc_validate_get_type =
+		nvhdmi_chmap_cea_alloc_validate_get_type;
+	spec->chmap.ops.chmap_validate = nvhdmi_chmap_validate;
+
+	codec->link_down_at_suspend = 1;
+
+	generic_acomp_init(codec, &nvhdmi_audio_ops, nvhdmi_port2pin);
+
+	return 0;
+}
+
+static int patch_nvhdmi_legacy(struct hda_codec *codec)
+{
+	struct hdmi_spec *spec;
+	int err;
+
 	err = patch_generic_hdmi(codec);
 	if (err)
 		return err;
@@ -4107,25 +4188,25 @@ HDA_CODEC_ENTRY(0x10de0004, "GPU 04 HDMI",	patch_nvhdmi_8ch_7x),
 HDA_CODEC_ENTRY(0x10de0005, "MCP77/78 HDMI",	patch_nvhdmi_8ch_7x),
 HDA_CODEC_ENTRY(0x10de0006, "MCP77/78 HDMI",	patch_nvhdmi_8ch_7x),
 HDA_CODEC_ENTRY(0x10de0007, "MCP79/7A HDMI",	patch_nvhdmi_8ch_7x),
-HDA_CODEC_ENTRY(0x10de0008, "GPU 08 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0009, "GPU 09 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de000a, "GPU 0a HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de000b, "GPU 0b HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de000c, "MCP89 HDMI",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de000d, "GPU 0d HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0010, "GPU 10 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0011, "GPU 11 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0012, "GPU 12 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0013, "GPU 13 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0014, "GPU 14 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0015, "GPU 15 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0016, "GPU 16 HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de0008, "GPU 08 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0009, "GPU 09 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de000a, "GPU 0a HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de000b, "GPU 0b HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de000c, "MCP89 HDMI",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de000d, "GPU 0d HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0010, "GPU 10 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0011, "GPU 11 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0012, "GPU 12 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0013, "GPU 13 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0014, "GPU 14 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0015, "GPU 15 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0016, "GPU 16 HDMI/DP",	patch_nvhdmi_legacy),
 /* 17 is known to be absent */
-HDA_CODEC_ENTRY(0x10de0018, "GPU 18 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de0019, "GPU 19 HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de001a, "GPU 1a HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de001b, "GPU 1b HDMI/DP",	patch_nvhdmi),
-HDA_CODEC_ENTRY(0x10de001c, "GPU 1c HDMI/DP",	patch_nvhdmi),
+HDA_CODEC_ENTRY(0x10de0018, "GPU 18 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de0019, "GPU 19 HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de001a, "GPU 1a HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de001b, "GPU 1b HDMI/DP",	patch_nvhdmi_legacy),
+HDA_CODEC_ENTRY(0x10de001c, "GPU 1c HDMI/DP",	patch_nvhdmi_legacy),
 HDA_CODEC_ENTRY(0x10de0020, "Tegra30 HDMI",	patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0022, "Tegra114 HDMI",	patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0028, "Tegra124 HDMI",	patch_tegra_hdmi),
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
