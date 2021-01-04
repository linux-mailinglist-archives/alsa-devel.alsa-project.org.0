Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF882E96E2
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 15:11:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503F41683;
	Mon,  4 Jan 2021 15:10:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503F41683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609769480;
	bh=vg+U1MZE2bJ1iK5WR0lODeCthzfdntB59ViwW1nQG9I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k1SOjDl+jkbKqslphKPV3KFTD9xI+Mp/rOELzXJReP2P/a9IcqYM40NskSpNPkMqM
	 BKTvv7F0X2zpC3W1piMtlcV0Mi9RyvnZ+wtIOi8yWO/B5UlNp/z43PwmSgSVg0mwfe
	 0/W8Tmhk2y0+gtH+SYuHCPGuAJRGtGxfhklR84Y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A4EF804C3;
	Mon,  4 Jan 2021 15:09:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30A6EF80165; Mon,  4 Jan 2021 15:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75C4FF80165;
 Mon,  4 Jan 2021 15:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75C4FF80165
Received: from 36-229-96-78.dynamic-ip.hinet.net ([36.229.96.78]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kwQXk-0006pa-Mg; Mon, 04 Jan 2021 14:09:09 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com
Subject: [PATCH v2 2/3] ASoC: SOF: Intel: hda: Modify existing helper to
 disable WAKEEN
Date: Mon,  4 Jan 2021 22:08:51 +0800
Message-Id: <20210104140853.228448-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210104140853.228448-1-kai.heng.feng@canonical.com>
References: <20210104140853.228448-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Keyon Jie <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Rander Wang <rander.wang@intel.com>,
 Fred Oh <fred.oh@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
 Amery Song <chao.song@intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE SOF DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

Modify hda_codec_jack_wake_enable() to also support disable WAKEEN.
In addition, this patch also moves the WAKEEN disablement call out of
hda_codec_jack_check() into hda_codec_jack_wake_enable().

This is a preparation for next patch.

No functional change intended.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 Mention it moves the disabling part into another function.

 sound/soc/sof/intel/hda-codec.c | 16 +++++++---------
 sound/soc/sof/intel/hda-dsp.c   |  6 ++++--
 sound/soc/sof/intel/hda.h       |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index df59c79cfdfc..b7e9931ead57 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -63,16 +63,18 @@ static int hda_codec_load_module(struct hda_codec *codec)
 }
 
 /* enable controller wake up event for all codecs with jack connectors */
-void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev)
+void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 {
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hda_codec *codec;
 	unsigned int mask = 0;
 
-	list_for_each_codec(codec, hbus)
-		if (codec->jacktbl.used)
-			mask |= BIT(codec->core.addr);
+	if (enable) {
+		list_for_each_codec(codec, hbus)
+			if (codec->jacktbl.used)
+				mask |= BIT(codec->core.addr);
+	}
 
 	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
 }
@@ -81,12 +83,8 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev)
 void hda_codec_jack_check(struct snd_sof_dev *sdev)
 {
 	struct hda_bus *hbus = sof_to_hbus(sdev);
-	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hda_codec *codec;
 
-	/* disable controller Wake Up event*/
-	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, 0);
-
 	list_for_each_codec(codec, hbus)
 		/*
 		 * Wake up all jack-detecting codecs regardless whether an event
@@ -96,7 +94,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 			pm_request_resume(&codec->core.dev);
 }
 #else
-void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev) {}
+void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable) {}
 void hda_codec_jack_check(struct snd_sof_dev *sdev) {}
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2b001151fe37..7d00107cf3b2 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -617,7 +617,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	if (runtime_suspend)
-		hda_codec_jack_wake_enable(sdev);
+		hda_codec_jack_wake_enable(sdev, true);
 
 	/* power down all hda link */
 	snd_hdac_ext_bus_link_power_down_all(bus);
@@ -683,8 +683,10 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* check jack status */
-	if (runtime_resume)
+	if (runtime_resume) {
+		hda_codec_jack_wake_enable(sdev, false);
 		hda_codec_jack_check(sdev);
+	}
 
 	/* turn off the links that were off before suspend */
 	list_for_each_entry(hlink, &bus->hlink_list, list) {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 9ec8ae0fd649..a3b6f3e9121c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -650,7 +650,7 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
  */
 void hda_codec_probe_bus(struct snd_sof_dev *sdev,
 			 bool hda_codec_use_common_hdmi);
-void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev);
+void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
-- 
2.29.2

