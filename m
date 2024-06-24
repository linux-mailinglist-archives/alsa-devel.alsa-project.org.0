Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6078A91499F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:16:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B753CDEE;
	Mon, 24 Jun 2024 14:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B753CDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231418;
	bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nt0tIsIb/GHV/FpIq+YnOrUvHOvMdzwhMGK6x7jAJaSjR4bMV7DWoq7q3XAo+ASYK
	 49mUbFZHdTmCSrHUYQ0t1WuhBRBDkZIYEOPDzsrcMNh16SJtpmVmxnGcVryoqTmbHE
	 UCcx+ITIAPVbnRZRBhjLCA5Pnr45dbY+Dja3oyUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E16BF80624; Mon, 24 Jun 2024 14:15:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2142F80623;
	Mon, 24 Jun 2024 14:15:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1388F805EA; Mon, 24 Jun 2024 14:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BF1AF805BE
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BF1AF805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=R8CZG+LZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231345; x=1750767345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
  b=R8CZG+LZ3r4bsQdvPKSM16YQDDE9NCkUPp9H4oQDuZpk0jUB3lixLnCE
   B0i3+ntyE5oyFVEnKpgU1lyDBH8ZSk6Eu7/df+9JR/YA2u/uEhrNmvkA5
   v5btWMGN0PUD83FFffzXZiFqdvy8EX2rXpGPcsUxX30X6YwjACOc8bZAX
   d6JgjNLbDJqa/KsS8xyrmWdXfo2+6A8dfdy/BhkAAxQI6qiBk1NYUbA2l
   ETwf2twYBjwYZgTuwPhGKP2WXir0qs2Qm3pe+wAGG4ePMnlGskvmgPevS
   7yBu9/UsgvVVBAaj7liDz1sXah2HCTr0/BiZ8l8WnsN0MRN+0DyU7/M88
   g==;
X-CSE-ConnectionGUID: 6oDdRbriQ/2LQ71BWXRdzA==
X-CSE-MsgGUID: YqHalXbgSdiK8vf9mJXKng==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15888072"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15888072"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:42 -0700
X-CSE-ConnectionGUID: BQXIczlQRNGMoBOAxdFsqw==
X-CSE-MsgGUID: Xk9pZY6uSsy89wuLuxk1zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43358850"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 3/3] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of
 periods by MAX_BDL_ENTRIES
Date: Mon, 24 Jun 2024 14:15:19 +0200
Message-ID: <20240624121519.91703-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XPEZTCFCQD3OXIZG4EZPGR4LS2BKBWNN
X-Message-ID-Hash: XPEZTCFCQD3OXIZG4EZPGR4LS2BKBWNN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XPEZTCFCQD3OXIZG4EZPGR4LS2BKBWNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The HDaudio specification Section 3.6.2 limits the number of BDL entries to 256.

Make sure we don't allow more periods than this normative value.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-pcm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 9fb8521b896b..f6e24edd7adb 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -258,6 +258,12 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
+	/* Limit the maximum number of periods to not exceed the BDL entries count */
+	if (runtime->hw.periods_max > HDA_DSP_MAX_BDL_ENTRIES)
+		snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIODS,
+					     runtime->hw.periods_min,
+					     HDA_DSP_MAX_BDL_ENTRIES);
+
 	/* Only S16 and S32 supported by HDA hardware when used without DSP */
 	if (sdev->dspless_mode_selected)
 		snd_pcm_hw_constraint_mask64(substream->runtime, SNDRV_PCM_HW_PARAM_FORMAT,
-- 
2.43.0

