Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CD7EB79E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 21:16:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 180DCE98;
	Tue, 14 Nov 2023 21:15:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 180DCE98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699993003;
	bh=/DT2AYyu+Qz3uwQDpyrR873wKiZMV4vSezxk2m3mjio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=igSrIYTLhQwgJNHx6h7OextabAEgK4tsHydnqM1cmMp7mfUL1hpzG1JfCxML4DcbV
	 k7YoBNkZiUMhw3TtTjo+HzLt9uiBB21YKCEaP+S8i9rseKT/knRX75RojFI0nPIKtt
	 LmBEdDwNyvCgt+io6OVmtUMKqD32SSt0EXJTB7m4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B42CFF80249; Tue, 14 Nov 2023 21:12:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D257F8016E;
	Tue, 14 Nov 2023 21:12:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E87F80564; Tue, 14 Nov 2023 21:12:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52208F80249
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 21:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52208F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ntbx1803
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992685; x=1731528685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/DT2AYyu+Qz3uwQDpyrR873wKiZMV4vSezxk2m3mjio=;
  b=ntbx1803eTyFYNFvUvqehw4fCaaqh4mF59dwNe2MI8DKMMY+EJRjM355
   aGRP9/1XZBiXDLSuBiTkNeHbOCdhYSogdXjDYdHppByCySbgEYb/g7laZ
   56m+7peKZd9OnAwPEpvKivnsLO7o66ZBVlhXOgl5FrtuCzanO11JVyNqe
   muRefqVAEjsWxFA/lQDirZoYKme20xMU7xWKUpaXBcvl1o7kur6yMQrtB
   uFBwDlABsScNqUpdoqcag7z4jV+ttc3VPnjqq7HJt5kL6gyQ0+zcqF9uu
   49emGWS1DWiBwzlciEC2XC9RNppHIk8ZJtFlU71VZX8CV7PUuMcobzwdd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134642"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="381134642"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 12:11:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422398"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="855422398"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:21 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 03/16] ASoC: pcm: Honor subformat when configuring runtime
Date: Tue, 14 Nov 2023 21:13:04 +0100
Message-Id: <20231114201317.1348066-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GI5PHGSKEFFKR34LUO76A6VO3Z3FTW4V
X-Message-ID-Hash: GI5PHGSKEFFKR34LUO76A6VO3Z3FTW4V
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GI5PHGSKEFFKR34LUO76A6VO3Z3FTW4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Subformat options are ignored when setting up hardware parameters and
assigning PCM stream capabilities. Account for them to allow for
granular format selection.

With introduction of subformats, copying hardware parameters becomes
a non-trivial operation. Implement a helper function to make things
simple.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7792c393e238..ccc31bc41e92 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -620,6 +620,7 @@ enum snd_soc_trigger_order {
 struct snd_soc_pcm_stream {
 	const char *stream_name;
 	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
+	u32 subformats;			/* for S32_LE format, SNDRV_PCM_SUBFMTBIT_* */
 	unsigned int rates;		/* SNDRV_PCM_RATE_* */
 	unsigned int rate_min;		/* min rate */
 	unsigned int rate_max;		/* max rate */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 323e4d7b6adf..9d688917cce2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -554,6 +554,12 @@ static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
 	hw->formats &= p->formats;
 }
 
+static void soc_pcm_hw_update_subformat(struct snd_pcm_hardware *hw,
+					struct snd_soc_pcm_stream *p)
+{
+	hw->subformats &= p->subformats;
+}
+
 /**
  * snd_soc_runtime_calc_hw() - Calculate hw limits for a PCM stream
  * @rtd: ASoC PCM runtime
@@ -592,6 +598,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 	cpu_chan_min = hw->channels_min;
 	cpu_chan_max = hw->channels_max;
@@ -613,6 +620,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, codec_stream);
 		soc_pcm_hw_update_rate(hw, codec_stream);
 		soc_pcm_hw_update_format(hw, codec_stream);
+		soc_pcm_hw_update_subformat(hw, codec_stream);
 	}
 
 	/* Verify both a valid CPU DAI and a valid CODEC DAI were found */
@@ -1713,6 +1721,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 
 }
@@ -1750,6 +1759,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			soc_pcm_hw_update_format(hw, codec_stream);
+			soc_pcm_hw_update_subformat(hw, codec_stream);
 		}
 	}
 }
-- 
2.25.1

