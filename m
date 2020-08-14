Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 360B7244696
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 10:48:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB81166D;
	Fri, 14 Aug 2020 10:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB81166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597394918;
	bh=KCOnbv2i2UHSjeS1FWBrqnjv9AfihkNNTOM7CRci7uU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KhCllQOb/zEw2IsQCgwr5iq7oqrcsrZUmi32ZfsJDektlYE3X9j+p0xoLx4/+wYeA
	 fnIEoovVzBpaI23NTLV0uNnPeQGHHCjBx2MJjSb0yhSuudnF0zssL62PFOCFexcmTt
	 CfzggWuOyPS+mQi+sBptIhMlnCSvBrxGEd56OWwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E986DF8022D;
	Fri, 14 Aug 2020 10:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4B21F8022B; Fri, 14 Aug 2020 10:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 825DDF80146
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 10:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 825DDF80146
IronPort-SDR: DuF/gdNYnRKgQ+O4+hHuHv9yIjuCugE/tSSwEMZOoexxSxI86+dfmDy3lKvMUnIBIYjmP34PTp
 J4NRUXdaz1nQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="154339015"
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="154339015"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 01:46:42 -0700
IronPort-SDR: 7SUjLnKdtkf6mm5php99netnUFQYhe5d3szIy6e3H89YsXzBJU9rK2Y+SUoHsiXPGga/vkIg80
 56Qz9/kj1T5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,311,1592895600"; d="scan'208";a="291678153"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga003.jf.intel.com with ESMTP; 14 Aug 2020 01:46:40 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: hdac_hdmi: support 'ELD' mixer
Date: Fri, 14 Aug 2020 16:34:36 +0800
Message-Id: <20200814083436.19845-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

Add an binary mixer 'ELD' to each HDMI PCM device so user space
could read the ELD data of external HDMI display.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 139 +++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index f26b77faed59..83656bbf22a7 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -9,6 +9,7 @@
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
+
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -107,6 +108,7 @@ struct hdac_hdmi_pcm {
 	unsigned char chmap[8]; /* ALSA API channel-map */
 	struct mutex lock;
 	int jack_event;
+	struct snd_kcontrol *eld_ctl;
 };
 
 struct hdac_hdmi_dai_port_map {
@@ -1248,6 +1250,7 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 	struct hdac_hdmi_pcm *pcm;
 	int size = 0;
 	int port_id = -1;
+	bool eld_valid, eld_changed;
 
 	if (!hdmi)
 		return;
@@ -1273,6 +1276,8 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 			size = -EINVAL;
 	}
 
+	eld_valid = port->eld.eld_valid;
+
 	if (size > 0) {
 		port->eld.eld_valid = true;
 		port->eld.eld_size = size;
@@ -1281,6 +1286,8 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 		port->eld.eld_size = 0;
 	}
 
+	eld_changed = (eld_valid != port->eld.eld_valid);
+
 	pcm = hdac_hdmi_get_pcm(hdev, port);
 
 	if (!port->eld.monitor_present || !port->eld.eld_valid) {
@@ -1313,6 +1320,12 @@ static void hdac_hdmi_present_sense(struct hdac_hdmi_pin *pin,
 
 	}
 	mutex_unlock(&hdmi->pin_mutex);
+
+	if (eld_changed && pcm)
+		snd_ctl_notify(hdmi->card,
+			       SNDRV_CTL_EVENT_MASK_VALUE |
+			       SNDRV_CTL_EVENT_MASK_INFO,
+			       &pcm->eld_ctl->id);
 }
 
 static int hdac_hdmi_add_ports(struct hdac_device *hdev,
@@ -1411,6 +1424,122 @@ static void hdac_hdmi_skl_enable_dp12(struct hdac_device *hdev)
 
 }
 
+static int hdac_hdmi_eld_ctl_info(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdac_hdmi_priv *hdmi = snd_soc_component_get_drvdata(component);
+	struct hdac_hdmi_pcm *pcm;
+	struct hdac_hdmi_port *port;
+	struct hdac_hdmi_eld *eld;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
+	uinfo->count = 0;
+
+	pcm = get_hdmi_pcm_from_id(hdmi, kcontrol->id.device);
+	if (!pcm) {
+		dev_dbg(component->dev, "%s: no pcm, device %d\n", __func__,
+			kcontrol->id.device);
+		return 0;
+	}
+
+	if (list_empty(&pcm->port_list)) {
+		dev_dbg(component->dev, "%s: empty port list, device %d\n",
+			__func__, kcontrol->id.device);
+		return 0;
+	}
+
+	mutex_lock(&hdmi->pin_mutex);
+
+	list_for_each_entry(port, &pcm->port_list, head) {
+		eld = &port->eld;
+
+		if (eld->eld_valid) {
+			uinfo->count = eld->eld_size;
+			break;
+		}
+	}
+
+	mutex_unlock(&hdmi->pin_mutex);
+
+	return 0;
+}
+
+static int hdac_hdmi_eld_ctl_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct hdac_hdmi_priv *hdmi = snd_soc_component_get_drvdata(component);
+	struct hdac_hdmi_pcm *pcm;
+	struct hdac_hdmi_port *port;
+	struct hdac_hdmi_eld *eld;
+
+	memset(ucontrol->value.bytes.data, 0, ARRAY_SIZE(ucontrol->value.bytes.data));
+
+	pcm = get_hdmi_pcm_from_id(hdmi, kcontrol->id.device);
+	if (!pcm) {
+		dev_dbg(component->dev, "%s: no pcm, device %d\n", __func__,
+			kcontrol->id.device);
+		return 0;
+	}
+
+	if (list_empty(&pcm->port_list)) {
+		dev_dbg(component->dev, "%s: empty port list, device %d\n",
+			__func__, kcontrol->id.device);
+		return 0;
+	}
+
+	mutex_lock(&hdmi->pin_mutex);
+
+	list_for_each_entry(port, &pcm->port_list, head) {
+		eld = &port->eld;
+
+		if (!eld->eld_valid)
+			continue;
+
+		if (eld->eld_size > ARRAY_SIZE(ucontrol->value.bytes.data) ||
+		    eld->eld_size > ELD_MAX_SIZE) {
+			mutex_unlock(&hdmi->pin_mutex);
+
+			dev_err(component->dev, "%s: buffer too small, device %d eld_size %d\n",
+				__func__, kcontrol->id.device, eld->eld_size);
+			snd_BUG();
+			return -EINVAL;
+		}
+
+		memcpy(ucontrol->value.bytes.data, eld->eld_buffer,
+		       eld->eld_size);
+		break;
+	}
+
+	mutex_unlock(&hdmi->pin_mutex);
+
+	return 0;
+}
+
+static int hdac_hdmi_create_eld_ctl(struct snd_soc_component *component, struct hdac_hdmi_pcm *pcm)
+{
+	struct snd_kcontrol *kctl;
+	struct snd_kcontrol_new hdmi_eld_ctl = {
+		.access	= SNDRV_CTL_ELEM_ACCESS_READ |
+			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.iface	= SNDRV_CTL_ELEM_IFACE_PCM,
+		.name	= "ELD",
+		.info	= hdac_hdmi_eld_ctl_info,
+		.get	= hdac_hdmi_eld_ctl_get,
+		.device	= pcm->pcm_id,
+	};
+
+	/* add ELD ctl with the device number corresponding to the PCM stream */
+	kctl = snd_ctl_new1(&hdmi_eld_ctl, component);
+	if (!kctl)
+		return -ENOMEM;
+
+	pcm->eld_ctl = kctl;
+
+	return snd_ctl_add(component->card->snd_card, kctl);
+}
+
 static const struct snd_soc_dai_ops hdmi_dai_ops = {
 	.startup = hdac_hdmi_pcm_open,
 	.shutdown = hdac_hdmi_pcm_close,
@@ -1784,6 +1913,16 @@ int hdac_hdmi_jack_init(struct snd_soc_dai *dai, int device,
 		}
 	}
 
+	/* add control for ELD Bytes */
+	err = hdac_hdmi_create_eld_ctl(component, pcm);
+	if (err < 0) {
+		dev_err(&hdev->dev,
+			"eld control add failed with err: %d for pcm: %d\n",
+			err, device);
+		kfree(pcm);
+		return err;
+	}
+
 	list_add_tail(&pcm->head, &hdmi->pcm_list);
 
 	return 0;
-- 
2.17.1

