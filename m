Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF592729D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 11:02:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41EEEAB;
	Thu,  4 Jul 2024 11:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41EEEAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720083739;
	bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B2z9ZevHQNpkxEOkKZ+2NXVnpT0TZKWu6MMcmuAJ+03BlBw2KuAZjpomvn76UY8EO
	 P+mf6twepqSj8e3Om/yRGCwT+p1zYSaK8tLG+4W8rllRUQkLtFX6npaY3med+pMFIC
	 vTUxqEE5UM/H4TfnlBZeMIHRlLm+BqNrXhF9hqTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D99CF80508; Thu,  4 Jul 2024 11:01:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73627F805BF;
	Thu,  4 Jul 2024 11:01:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA72F805A9; Thu,  4 Jul 2024 11:01:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA610F805E1
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 11:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA610F805E1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RUyz9hJJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083691; x=1751619691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BOPqb+hr+MZ44Y3ZgaO8aUjGSpet7jahVHcXhP9ems8=;
  b=RUyz9hJJKeijlbzFVqU8Wl5AwlKwd1o5Hu1E3yrrDeBzyloMx2Rl+7Df
   6hE3u9RzuuXpsDEt7RDMnHcKkCmOkvi4idU3hJqFvg5Fss3kx1O068C9U
   TX+2X4QJJ9dJNNjsMVXCYIogegk7liCY/tSp06cGEBuZaALVNJWOgYhda
   gVh9J67GkZJQdjnZwfWZ+yPVFT0gmG8YkjPMEY4bl9FaUR+N0w+D4lW2/
   /YDQOAQKg3IsmSyUPBa1oRrIMAsDqyRAhcbOxhpCZ7FQxuG9mA9sYyMs0
   yE7p/1PePW7M8OBgaN+ehP36kKhV5USgSasLhHO6wC1lZ2oWRvZNZONzV
   Q==;
X-CSE-ConnectionGUID: D3xVwlWTQq2MyASWcOho4g==
X-CSE-MsgGUID: r3scyMYGTSOej0U8IoQPpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34799433"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="34799433"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 02:01:25 -0700
X-CSE-ConnectionGUID: 05o/pgpkQSuVbSCGnGLoRQ==
X-CSE-MsgGUID: QlC7CNToTlW7imCFZ5SMQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="50980484"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.90])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 02:01:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: hda-pcm: Limit the maximum number of
 periods by MAX_BDL_ENTRIES
Date: Thu,  4 Jul 2024 11:01:06 +0200
Message-ID: <20240704090106.371497-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AQAXZ2Q3VM4DMFSHUEHFHWHAMVBIZ5FZ
X-Message-ID-Hash: AQAXZ2Q3VM4DMFSHUEHFHWHAMVBIZ5FZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQAXZ2Q3VM4DMFSHUEHFHWHAMVBIZ5FZ/>
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

