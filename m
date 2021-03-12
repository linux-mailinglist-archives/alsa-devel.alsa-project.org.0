Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3214533966D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:28:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0C7B1783;
	Fri, 12 Mar 2021 19:27:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0C7B1783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573687;
	bh=Iv+wq/W+Q75aEl/4WxpNTuWMa3sH/T7Rrhxzdut3IXo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M6VZQ1inAW/fhzeDO0YNYqDrjXzEv3J5q/QFVCNEQTJfc7WJy5TwhalEoWAONChzF
	 Wtuwyntzgm24TEwW2lopw3z0kT9itHmsr8YbB8D88SXfuCDR0grrHhNiprt6Q1uJxY
	 NKZu4S64VQ+Tx6rmNzmav3z1MsLrTkwz/iyoCXbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F1E0F804EC;
	Fri, 12 Mar 2021 19:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C0AFF8032D; Fri, 12 Mar 2021 19:23:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B0A2F801D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B0A2F801D8
IronPort-SDR: Veu1CDns7wwLDoEQN909HeWsAdNRJrR/mG1yosisauG54XH70sPWvd3uDP0dXOPzsmyby9a4ST
 tg/F65eY8KqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515190"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515190"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:21 -0800
IronPort-SDR: EdXX+UIhDx5zqRs0FzvertwIfPOSL2SomPczBK0WLMNUuULzv6RwGrxv3BIJP8+pmSV4hitjBm
 iYKmBUUbR/Rw==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791944"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:19 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/23] ASoC: hdac_hdmi: remove useless initializations
Date: Fri, 12 Mar 2021 12:22:31 -0600
Message-Id: <20210312182246.5153-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

Cppcheck complains a lot about possible null pointer dereferences but
it's again a case of useless initializations to NULL.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 2c1305bf0572..66408a98298b 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -523,7 +523,7 @@ static struct hdac_hdmi_port *hdac_hdmi_get_port_from_cvt(
 			struct hdac_hdmi_cvt *cvt)
 {
 	struct hdac_hdmi_pcm *pcm;
-	struct hdac_hdmi_port *port = NULL;
+	struct hdac_hdmi_port *port;
 	int ret, i;
 
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
@@ -713,7 +713,7 @@ static struct hdac_hdmi_pcm *hdac_hdmi_get_pcm(struct hdac_device *hdev,
 					struct hdac_hdmi_port *port)
 {
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
-	struct hdac_hdmi_pcm *pcm = NULL;
+	struct hdac_hdmi_pcm *pcm;
 	struct hdac_hdmi_port *p;
 
 	list_for_each_entry(pcm, &hdmi->pcm_list, head) {
@@ -900,7 +900,7 @@ static int hdac_hdmi_set_pin_port_mux(struct snd_kcontrol *kcontrol,
 	struct hdac_hdmi_port *port = w->priv;
 	struct hdac_device *hdev = dev_to_hdac_dev(dapm->dev);
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
-	struct hdac_hdmi_pcm *pcm = NULL;
+	struct hdac_hdmi_pcm *pcm;
 	const char *cvt_name =  e->texts[ucontrol->value.enumerated.item[0]];
 
 	ret = snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
@@ -1693,7 +1693,7 @@ static void hdac_hdmi_eld_notify_cb(void *aptr, int port, int pipe)
 {
 	struct hdac_device *hdev = aptr;
 	struct hdac_hdmi_priv *hdmi = hdev_to_hdmi_priv(hdev);
-	struct hdac_hdmi_pin *pin = NULL;
+	struct hdac_hdmi_pin *pin;
 	struct hdac_hdmi_port *hport = NULL;
 	struct snd_soc_component *component = hdmi->component;
 	int i;
@@ -1958,7 +1958,7 @@ static int hdmi_codec_probe(struct snd_soc_component *component)
 	struct hdac_device *hdev = hdmi->hdev;
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
-	struct hdac_ext_link *hlink = NULL;
+	struct hdac_ext_link *hlink;
 	int ret;
 
 	hdmi->component = component;
@@ -2227,7 +2227,7 @@ static int hdac_hdmi_runtime_suspend(struct device *dev)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_bus *bus = hdev->bus;
-	struct hdac_ext_link *hlink = NULL;
+	struct hdac_ext_link *hlink;
 
 	dev_dbg(dev, "Enter: %s\n", __func__);
 
@@ -2263,7 +2263,7 @@ static int hdac_hdmi_runtime_resume(struct device *dev)
 {
 	struct hdac_device *hdev = dev_to_hdac_dev(dev);
 	struct hdac_bus *bus = hdev->bus;
-	struct hdac_ext_link *hlink = NULL;
+	struct hdac_ext_link *hlink;
 
 	dev_dbg(dev, "Enter: %s\n", __func__);
 
-- 
2.25.1

