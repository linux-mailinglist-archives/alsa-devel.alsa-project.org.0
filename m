Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E87212374A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 21:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D533E1671;
	Tue, 17 Dec 2019 21:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D533E1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576614484;
	bh=2Iu/j82jgOZyMObpKYxSXfewQ2RUqNlog0Y5shWI89Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJOzzeN0+RiXiiKBNTDaKEw+whSAiz49uat914vH3rhWAKVzqNcOasCe7stNOWNOs
	 YvMFLHbKHoCSKTHFadFZU40fARzNjyaQK6CeE5yt1K+LJ+YXkrJ8oo/HZE+r2NNTYU
	 UJAWTxJsN3p4cJb91RyzMIXraI2K84p02FKVmGJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F07A4F8029A;
	Tue, 17 Dec 2019 21:23:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E629FF80278; Tue, 17 Dec 2019 21:23:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E21A1F8025A
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 21:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21A1F8025A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 12:22:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="266679235"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 12:22:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 14:22:29 -0600
Message-Id: <20191217202231.18259-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
References: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/8] ASoC: SOF: Intel: hda: add namespace for
	hda-codec functionality
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

Define namespaces (one generic and one dedicated for i915) and include
them in HDaudio top-level module.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 14 +++++++-------
 sound/soc/sof/intel/hda.c       |  2 ++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index d7855b1f8e2e..5514e6191ba4 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -76,8 +76,8 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev) {}
 void hda_codec_jack_check(struct snd_sof_dev *sdev) {}
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
-EXPORT_SYMBOL(hda_codec_jack_wake_enable);
-EXPORT_SYMBOL(hda_codec_jack_check);
+EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 /* probe individual codec */
 static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
@@ -160,7 +160,7 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev,
 		}
 	}
 }
-EXPORT_SYMBOL(hda_codec_probe_bus);
+EXPORT_SYMBOL_NS(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 #if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
 	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
@@ -172,7 +172,7 @@ void hda_codec_i915_get(struct snd_sof_dev *sdev)
 	dev_dbg(bus->dev, "Turning i915 HDAC power on\n");
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 }
-EXPORT_SYMBOL(hda_codec_i915_get);
+EXPORT_SYMBOL_NS(hda_codec_i915_get, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 void hda_codec_i915_put(struct snd_sof_dev *sdev)
 {
@@ -181,7 +181,7 @@ void hda_codec_i915_put(struct snd_sof_dev *sdev)
 	dev_dbg(bus->dev, "Turning i915 HDAC power off\n");
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
 }
-EXPORT_SYMBOL(hda_codec_i915_put);
+EXPORT_SYMBOL_NS(hda_codec_i915_put, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 int hda_codec_i915_init(struct snd_sof_dev *sdev)
 {
@@ -197,7 +197,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL(hda_codec_i915_init);
+EXPORT_SYMBOL_NS(hda_codec_i915_init, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 {
@@ -210,7 +210,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL(hda_codec_i915_exit);
+EXPORT_SYMBOL_NS(hda_codec_i915_exit, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 #endif
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8d27846d9048..e47bf4d303c2 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -795,3 +795,5 @@ void hda_machine_select(struct snd_sof_dev *sdev)
 }
 
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
