Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FBC898EA1
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 21:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12B1A2CB3;
	Thu,  4 Apr 2024 21:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12B1A2CB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712257539;
	bh=kpEVEkeUvSQHtIiwegnx0xTZnOZz10AbI8oxN1072Tk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pmbUtQVZcP6bzRcP0UqL1xR6Co+ekTQuL3Dn4/BT2KHMJsFJ0WM5m3tSk4xmhfL8E
	 41JOXPtYrsy6rR4CPck3QG72+yuKXlp4QxQgfOaOpg6ir9W7HFpMHwAYJXbm61AzlW
	 L9z3p3zl74jjTOpefFQG/P2i/kdfSdfBJ9Yq5Wgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E76EF80624; Thu,  4 Apr 2024 21:04:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF116F8060C;
	Thu,  4 Apr 2024 21:04:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C9F7F805C3; Thu,  4 Apr 2024 21:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B947F8016E
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 21:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B947F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eBZl+TUj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257450; x=1743793450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kpEVEkeUvSQHtIiwegnx0xTZnOZz10AbI8oxN1072Tk=;
  b=eBZl+TUjBM1Ulbkk95+qXp+ZRj6xHzxTIJCCer1ftDWAjVxvuaTgrG43
   PqFGqCuwmPSscMvtFMDDS9kYC0mkTzVSgVL+/xxq11vGUs9tito8BuR3r
   gynLvGCtKDataCEm++Ne+VbsFcgGW4wFi8eFLFbSTMmqBe0JkxoAMaKbw
   KSLVpg/1mTHCUV75BoYyDX6cXaeSWSlPCGMhT+d+xExTf3bRJJ2T5IJ4O
   gt8MIUhrvgjdG26C7sXEo8tjDx8OXG0qTqx+wC6p3dOvKgum5wF79qAdh
   r9SgF7caiacq0PmpirS3v1H+52okG6j7Lc6tAqc1n6GOmuQn0J2vlp16l
   g==;
X-CSE-ConnectionGUID: D/J8IEBJQtuRTZ2gNBlHpw==
X-CSE-MsgGUID: ASnfGcXES1K8AFMnS3MmGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433870"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7433870"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:04:06 -0700
X-CSE-ConnectionGUID: yDlEFBh0QCy3ihaz907/og==
X-CSE-MsgGUID: cdvmRj1QQnKO6vMm2LFLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="19492314"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:04:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Keqiao Zhang <keqiao.zhang@intel.com>
Subject: [PATCH 3/4] ASoC: SOF: Intel: hda-codec: preserve WAKEEN values
Date: Thu,  4 Apr 2024 14:03:56 -0500
Message-Id: <20240404190357.138073-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HBZXQYW35F4NWKH4BA4KEOEXJ2MO6NYB
X-Message-ID-Hash: HBZXQYW35F4NWKH4BA4KEOEXJ2MO6NYB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HBZXQYW35F4NWKH4BA4KEOEXJ2MO6NYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since LunarLake, we use the HDadio WAKEEN/WAKESTS to detect wakes for
SoundWire codecs. Unfortunately, the existing code in
hda_codec_jack_wake_enable() unconditionally resets the WAKEEN bits.

This patch changes the initialization to preserve SoundWire WAKEEN
bits. For HDAudio codecs the same strategy is used, WAKEEN is only set
when the jacktbl.used property is set.

Closes: https://github.com/thesofproject/linux/issues/4687
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Keqiao Zhang <keqiao.zhang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 9f84b0d287a5..6a13f38a8d21 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -79,18 +79,27 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hda_codec *codec;
 	unsigned int mask = 0;
+	unsigned int val = 0;
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
 	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
 		return;
 
 	if (enable) {
-		list_for_each_codec(codec, hbus)
+		list_for_each_codec(codec, hbus) {
+			/* only set WAKEEN when needed for HDaudio codecs */
+			mask |= BIT(codec->core.addr);
 			if (codec->jacktbl.used)
-				mask |= BIT(codec->core.addr);
+				val |= BIT(codec->core.addr);
+		}
+	} else {
+		list_for_each_codec(codec, hbus) {
+			/* reset WAKEEN only HDaudio codecs */
+			mask |= BIT(codec->core.addr);
+		}
 	}
 
-	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
+	snd_hdac_chip_updatew(bus, WAKEEN, mask & STATESTS_INT_MASK, val);
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
-- 
2.40.1

