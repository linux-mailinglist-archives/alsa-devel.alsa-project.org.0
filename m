Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAAB17E571
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 18:11:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BB1F16A9;
	Mon,  9 Mar 2020 18:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BB1F16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583773892;
	bh=5TxXd40w79SpHBhDtveGOT9RS6i/KtBzQEDIP4UMl2E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tu4uA6XRONnULgJkszBQoQLR2rpilOBsg0L4ps2zY6v/HmnJJzNPmKJlU9XgruPou
	 u4UUg7hobMqL9eRsPq4TMyuMTwLPvc2qLNdlNlxrtmrhnEil/PcSR1wAiMDwnS0oYy
	 jv6DuFR1VoxtUpyNlNQ5+yaaWy5EOD1Xi6XriLag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A98CF802A7;
	Mon,  9 Mar 2020 18:08:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BE9CF8028D; Mon,  9 Mar 2020 18:08:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2985CF800B5;
 Mon,  9 Mar 2020 18:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2985CF800B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 10:07:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="353408531"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga001.fm.intel.com with ESMTP; 09 Mar 2020 10:07:56 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: export DPCM runtime update functions
Date: Mon,  9 Mar 2020 18:07:49 +0100
Message-Id: <20200309170749.32313-4-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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

This makes DPCM runtime update functions available for external
calling. As an example, virtualised ASoC component drivers may need
to call these when managing shared DAPM routes that are used by more
than one driver (i.e. when host driver and guest drivers have a DAPM
path from guest PCM to host DAI where some parts are owned by host
driver and others by guest driver).

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/soc-dpcm.h | 6 +++---
 sound/soc/soc-dapm.c     | 8 ++++----
 sound/soc/soc-pcm.c      | 7 +++++--
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index aa56118..b961c06 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -149,9 +149,9 @@ int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
 struct snd_pcm_substream *
 	snd_soc_dpcm_get_substream(struct snd_soc_pcm_runtime *be, int stream);
 
-/* internal use only */
-int soc_dpcm_runtime_update(struct snd_soc_card *card,
-			    enum snd_soc_dpcm_update_mode mode);
+/* update audio routing between PCMs and any DAI links */
+int snd_soc_dpcm_runtime_update(struct snd_soc_card *card,
+				enum snd_soc_dpcm_update_mode mode);
 
 #ifdef CONFIG_DEBUG_FS
 void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f496c53..3b91d7c 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2292,7 +2292,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
@@ -2357,7 +2357,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
@@ -3397,7 +3397,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 	mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
@@ -3502,7 +3502,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5b3bc3f..d373148 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -295,6 +295,7 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
 {
 	snd_soc_runtime_action(rtd, stream, 1);
 }
+EXPORT_SYMBOL_GPL(snd_soc_runtime_activate);
 
 /**
  * snd_soc_runtime_deactivate() - Decrement active count for PCM runtime components
@@ -310,6 +311,7 @@ void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
 {
 	snd_soc_runtime_action(rtd, stream, -1);
 }
+EXPORT_SYMBOL_GPL(snd_soc_runtime_deactivate);
 
 /**
  * snd_soc_runtime_ignore_pmdown_time() - Check whether to ignore the power down delay
@@ -2974,8 +2976,8 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, bool new,
 /* Called by DAPM mixer/mux changes to update audio routing between PCMs and
  * any DAI links.
  */
-int soc_dpcm_runtime_update(struct snd_soc_card *card,
-			    enum snd_soc_dpcm_update_mode mode)
+int snd_soc_dpcm_runtime_update(struct snd_soc_card *card,
+				enum snd_soc_dpcm_update_mode mode)
 {
 	struct snd_soc_pcm_runtime *fe;
 	int ret = 0;
@@ -3019,6 +3021,7 @@ int soc_dpcm_runtime_update(struct snd_soc_card *card,
 	mutex_unlock(&card->mutex);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
 
 static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
 {
-- 
1.9.3

