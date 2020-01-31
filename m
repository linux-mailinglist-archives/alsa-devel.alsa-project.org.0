Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB014EBEC
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 12:47:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F3841677;
	Fri, 31 Jan 2020 12:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F3841677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580471262;
	bh=mQaamh4DkrzCoA4GCmEiP3jtFBg2DrwV5STTtQoQeRk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rjfHvcNey3nSMWrD6NmoBdWoP3OhypU7moNq98bPOIml/NrbUBFIidDYmUWhRlkK/
	 TnVQIU2uhAMCJt3ldy+owWAM6soIeqR9iB5JIzyofqWcMI0VE9PhUraZa3ZUsUAjmo
	 cdHOlYY1SXSU+CRZzr/yK+h8PjtdoGL92R0ZdJE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15540F8028E;
	Fri, 31 Jan 2020 12:44:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E76F80273; Fri, 31 Jan 2020 12:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 182A3F80116;
 Fri, 31 Jan 2020 12:44:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 182A3F80116
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 03:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="430343390"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.38.16])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2020 03:44:00 -0800
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 31 Jan 2020 12:43:55 +0100
Message-Id: <20200131114355.17301-4-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
References: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Cc: sound-open-firmware@alsa-project.org
Subject: [alsa-devel] [PATCH 3/3] ASoC: export DPCM runtime update functions
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

This makes DPCM runtime update functions available for external
calling. As an example, virtualised ASoC component drivers may need
to call these when managing shared DAPM routes that are used by more
than one driver (i.e. when host driver and guest drivers have a DAPM
path from guest PCM to host DAI where some parts are owned by host
driver and others by guest driver).

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/soc-dpcm.h | 6 ++++--
 sound/soc/soc-dapm.c     | 8 ++++----
 sound/soc/soc-pcm.c      | 8 ++++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index d2ffe3e..4211130 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -157,10 +157,12 @@ enum snd_soc_dpcm_state
 void snd_soc_dpcm_be_set_state(struct snd_soc_pcm_runtime *be, int stream,
 	enum snd_soc_dpcm_state state);
 
+/* update audio routing between PCMs and any DAI links */
+int snd_soc_dpcm_runtime_update(struct snd_soc_card *card,
+				enum snd_soc_dpcm_update_mode mode);
+
 /* internal use only */
 int soc_dpcm_be_digital_mute(struct snd_soc_pcm_runtime *fe, int mute);
-int soc_dpcm_runtime_update(struct snd_soc_card *card,
-			    enum snd_soc_dpcm_update_mode mode);
 
 #ifdef CONFIG_DEBUG_FS
 void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 41543a4a..80710f8 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2286,7 +2286,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
@@ -2351,7 +2351,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
@@ -3394,7 +3394,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 	mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
@@ -3493,7 +3493,7 @@ static int __snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index afe7c16..6c82a7a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -117,6 +117,7 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
 		codec_dai->component->active++;
 	}
 }
+EXPORT_SYMBOL_GPL(snd_soc_runtime_activate);
 
 /**
  * snd_soc_runtime_deactivate() - Decrement active count for PCM runtime components
@@ -153,6 +154,7 @@ void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
 		codec_dai->active--;
 	}
 }
+EXPORT_SYMBOL_GPL(snd_soc_runtime_deactivate);
 
 /**
  * snd_soc_runtime_ignore_pmdown_time() - Check whether to ignore the power down delay
@@ -2774,8 +2776,8 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, bool new,
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
@@ -2819,6 +2821,8 @@ int soc_dpcm_runtime_update(struct snd_soc_card *card,
 	mutex_unlock(&card->mutex);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
+
 int soc_dpcm_be_digital_mute(struct snd_soc_pcm_runtime *fe, int mute)
 {
 	struct snd_soc_dpcm *dpcm;
-- 
1.9.3

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
