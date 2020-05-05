Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E6F1C4C7B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 05:07:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 839A11731;
	Tue,  5 May 2020 05:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 839A11731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588648034;
	bh=3nkDqiJnCNQdB5hSSsBGr3vOgftD6mC98IfBU0KeUuY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDE039BKDQhhe93yGn5HqLsytLCXKfxgKCGlzjQlBXU7lbrkMdyzs3rsM+L+6SQ7Y
	 Mms+k9QyXcAy20f2cBH9OaP2FQ/oB3uzoY7dysAUqd5BiH4f2Q307Nulwgat8Tllv7
	 Cg1FOVTUUjO54Yx0GjdaQq2GO4IM+tshcSr6mDAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F421F80246;
	Tue,  5 May 2020 05:04:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24B34F801D9; Tue,  5 May 2020 05:04:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4C1AF80162
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 05:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4C1AF80162
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jVnsR-0003MR-F8; Tue, 05 May 2020 03:04:12 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH 2/2] ALSA: hda: Use hdac_to_hda_codec macro
Date: Tue,  5 May 2020 11:03:53 +0800
Message-Id: <20200505030357.28004-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200505030357.28004-1-kai.heng.feng@canonical.com>
References: <20200505030357.28004-1-kai.heng.feng@canonical.com>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikhil Mahale <nmahale@nvidia.com>, Jairaj Arava <jairaj.arava@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Aaron Plattner <aplattner@nvidia.com>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>
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

Use hdac_to_hda_codec() instead of container_of().

No functional change intended.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 include/sound/hda_codec.h   |  4 ++++
 sound/pci/hda/patch_hdmi.c  | 12 ++++++------
 sound/soc/codecs/hdac_hda.h |  4 ----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 225154a4f2ed..8a32060e3d8d 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -288,6 +288,10 @@ struct hda_codec {
 #define dev_to_hda_codec(_dev)	container_of(_dev, struct hda_codec, core.dev)
 #define hda_codec_dev(_dev)	(&(_dev)->core.dev)
 
+#define hdac_to_hda_priv(_hdac) \
+			container_of(_hdac, struct hdac_hda_priv, codec.core)
+#define hdac_to_hda_codec(_hdac) container_of(_hdac, struct hda_codec, core)
+
 #define list_for_each_codec(c, bus) \
 	list_for_each_entry(c, &(bus)->core.codec_list, core.list)
 #define list_for_each_codec_safe(c, n, bus)				\
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4eff16053bd5..f21b66abb271 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2022,7 +2022,7 @@ static const struct hda_pcm_ops generic_ops = {
 
 static int hdmi_get_spk_alloc(struct hdac_device *hdac, int pcm_idx)
 {
-	struct hda_codec *codec = container_of(hdac, struct hda_codec, core);
+	struct hda_codec *codec = hdac_to_hda_codec(hdac);
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_pin *per_pin = pcm_idx_to_pin(spec, pcm_idx);
 
@@ -2035,7 +2035,7 @@ static int hdmi_get_spk_alloc(struct hdac_device *hdac, int pcm_idx)
 static void hdmi_get_chmap(struct hdac_device *hdac, int pcm_idx,
 					unsigned char *chmap)
 {
-	struct hda_codec *codec = container_of(hdac, struct hda_codec, core);
+	struct hda_codec *codec = hdac_to_hda_codec(hdac);
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_pin *per_pin = pcm_idx_to_pin(spec, pcm_idx);
 
@@ -2049,7 +2049,7 @@ static void hdmi_get_chmap(struct hdac_device *hdac, int pcm_idx,
 static void hdmi_set_chmap(struct hdac_device *hdac, int pcm_idx,
 				unsigned char *chmap, int prepared)
 {
-	struct hda_codec *codec = container_of(hdac, struct hda_codec, core);
+	struct hda_codec *codec = hdac_to_hda_codec(hdac);
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_pin *per_pin = pcm_idx_to_pin(spec, pcm_idx);
 
@@ -2065,7 +2065,7 @@ static void hdmi_set_chmap(struct hdac_device *hdac, int pcm_idx,
 
 static bool is_hdmi_pcm_attached(struct hdac_device *hdac, int pcm_idx)
 {
-	struct hda_codec *codec = container_of(hdac, struct hda_codec, core);
+	struct hda_codec *codec = hdac_to_hda_codec(hdac);
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_pin *per_pin = pcm_idx_to_pin(spec, pcm_idx);
 
@@ -3783,7 +3783,7 @@ static int atihdmi_paired_chmap_validate(struct hdac_chmap *chmap,
 static int atihdmi_pin_set_slot_channel(struct hdac_device *hdac,
 		hda_nid_t pin_nid, int hdmi_slot, int stream_channel)
 {
-	struct hda_codec *codec = container_of(hdac, struct hda_codec, core);
+	struct hda_codec *codec = hdac_to_hda_codec(hdac);
 	int verb;
 	int ati_channel_setup = 0;
 
@@ -3819,7 +3819,7 @@ static int atihdmi_pin_set_slot_channel(struct hdac_device *hdac,
 static int atihdmi_pin_get_slot_channel(struct hdac_device *hdac,
 				hda_nid_t pin_nid, int asp_slot)
 {
-	struct hda_codec *codec = container_of(hdac, struct hda_codec, core);
+	struct hda_codec *codec = hdac_to_hda_codec(hdac);
 	bool was_odd = false;
 	int ati_asp_slot = asp_slot;
 	int verb;
diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
index 598b07d9b6fe..d0efc5e254ae 100644
--- a/sound/soc/codecs/hdac_hda.h
+++ b/sound/soc/codecs/hdac_hda.h
@@ -28,10 +28,6 @@ struct hdac_hda_priv {
 	bool need_display_power;
 };
 
-#define hdac_to_hda_priv(_hdac) \
-			container_of(_hdac, struct hdac_hda_priv, codec.core)
-#define hdac_to_hda_codec(_hdac) container_of(_hdac, struct hda_codec, core)
-
 struct hdac_ext_bus_ops *snd_soc_hdac_hda_get_ops(void);
 
 #endif /* __HDAC_HDA_H__ */
-- 
2.17.1

