Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A43515AA4
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Apr 2022 07:42:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3121851;
	Sat, 30 Apr 2022 07:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3121851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651297368;
	bh=qv5r8b0bYy/lyV2MOFMsQEXo0E15w292MkMCf3UG1SE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UA8Rhip6gJWY9A2I0GpNPh9LJRgD3jRr6ftGFUK43vi5YBbG0gtYFF/C4pUNTbAL2
	 cu6MrglqssWo+xxIAIZ2BgNUSyeaohvBUFW07lRz1KpuLyE5KohfMoP0/kj2J+72Ne
	 Cyl8Bu0+mUIOGBVUtxo+a09D+JKwhATi43ipAN8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 044A8F8012B;
	Sat, 30 Apr 2022 07:41:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63A5FF8012A; Sat, 30 Apr 2022 07:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-m121145.qiye.163.com (mail-m121145.qiye.163.com
 [115.236.121.145])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36542F80121
 for <alsa-devel@alsa-project.org>; Sat, 30 Apr 2022 07:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36542F80121
Received: from localhost.localdomain (unknown [58.22.7.114])
 by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 9308D80019E;
 Sat, 30 Apr 2022 13:41:29 +0800 (CST)
From: Sugar Zhang <sugar.zhang@rock-chips.com>
To: broonie@kernel.org
Subject: [PATCH v2] ASoC: hdmi-codec: Add option for ELD bypass
Date: Sat, 30 Apr 2022 13:41:18 +0800
Message-Id: <20220430134006.v2.1.Ide2a04ad0c123cc6990a63632e6f9bb7d7f9be13@changeid>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWUNIQ0JWQhhNGkIaTk
 JOSENCVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NiI6CBw5Dz08SRZNKSEfHlE#
 MRRPChVVSlVKTU5KSUJMSUJLSUpPVTMWGhIXVQgOHBoJVQETGhUcOwkUGBBWGBMSCwhVGBQWRVlX
 WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBT05NSjcG
X-HM-Tid: 0a8078fd0692b03akuuu9308d80019e
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 Maxime Ripard <maxime@cerno.tech>, Dmitry Osipenko <digetx@gmail.com>
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

This patch allow users to enable "ELD Bypass" who don't
care anything from EDID Link Data.

Currently, this driver gets ELD(from EDID) to constraint
channels and rates.

Unfortunately, EDID is not always valid, maybe caused by
the fragile HDMI port or cable, in this situation, the max
features are limited to 48kHz stereo.

So, add this option to allow user to select the manual way
to output audio as expected. such as multi-channels LPCM(7.1),
or HBR bitstream for these sink devices.

Signed-off-by: Sugar Zhang <sugar.zhang@rock-chips.com>
---

Changes in v2:
- Use MACRO SOC_SINGLE_BOOL_EXT to simplify code.
  Fix event_missing checked by mixer-test.
  Add suffix "Switch" for "ELD Bypass".

 sound/soc/codecs/hdmi-codec.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index b07607a..be46fbd 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -275,6 +275,7 @@ struct hdmi_codec_priv {
 	unsigned int chmap_idx;
 	struct mutex lock;
 	bool busy;
+	bool eld_bypass;
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
 	u8 iec_status[AES_IEC958_STATUS_SIZE];
@@ -427,6 +428,31 @@ static int hdmi_codec_iec958_mask_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int hdmi_codec_eld_bypass_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = hcp->eld_bypass;
+
+	return 0;
+}
+
+static int hdmi_codec_eld_bypass_put(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+
+	if (hcp->eld_bypass == ucontrol->value.integer.value[0])
+		return 0;
+
+	hcp->eld_bypass = ucontrol->value.integer.value[0];
+
+	return 1;
+}
+
 static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
@@ -447,7 +473,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			goto err;
 	}
 
-	if (tx && hcp->hcd.ops->get_eld) {
+	if (tx && !hcp->eld_bypass && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
@@ -770,6 +796,8 @@ static struct snd_kcontrol_new hdmi_codec_controls[] = {
 		.info	= hdmi_eld_ctl_info,
 		.get	= hdmi_eld_ctl_get,
 	},
+	SOC_SINGLE_BOOL_EXT("ELD Bypass Switch", 0,
+			    hdmi_codec_eld_bypass_get, hdmi_codec_eld_bypass_put),
 };
 
 static int hdmi_codec_pcm_new(struct snd_soc_pcm_runtime *rtd,
@@ -854,7 +882,7 @@ static void plugged_cb(struct device *dev, bool plugged)
 	struct hdmi_codec_priv *hcp = dev_get_drvdata(dev);
 
 	if (plugged) {
-		if (hcp->hcd.ops->get_eld) {
+		if (!hcp->eld_bypass && hcp->hcd.ops->get_eld) {
 			hcp->hcd.ops->get_eld(dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		}
-- 
2.7.4

