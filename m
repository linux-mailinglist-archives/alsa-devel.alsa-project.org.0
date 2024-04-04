Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2263898EA5
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 21:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF3F2CD1;
	Thu,  4 Apr 2024 21:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF3F2CD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712257562;
	bh=B0x6Qj2oJDAKQ1Pdrq4ENFEU6JUEvp6eTkcc5HdjsWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mlkfyDZoCwNE9MxaynTwfvMDkDAPdGr5cN1Nl3lIW8OEf0Lrr6htcrAReIWC3auWm
	 BtKzks4mG+051t6nqG7cGJ+xC94iZSB2hSaK/xhhsSgXWdFxfKelXtWziyFfCd+I7L
	 CuqF6ORuaGwnm66hBQ2c0hL1CUSgEQYsmfoPPXmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F060BF80636; Thu,  4 Apr 2024 21:04:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A5DF80635;
	Thu,  4 Apr 2024 21:04:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85B69F805C6; Thu,  4 Apr 2024 21:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFE50F80236
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 21:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE50F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FbhWEjBG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257451; x=1743793451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B0x6Qj2oJDAKQ1Pdrq4ENFEU6JUEvp6eTkcc5HdjsWg=;
  b=FbhWEjBGyrkwAUVNtMPYiI0+PN1Pyb08JvcKsMfwzjRimSbJUbRPlr4V
   O0QnRAvOvIyYYud2oEk4kdmmRWItbdxjZ6EmMN3UcHy/qt/UQLCHxG9Iq
   AGlrG7QzEXIhXXfRxFVN6FM+C4C+oQNN0BupurAvHKzFebtmIMDkJVAN6
   Z9FS7FSHndc8RRKJfbzQ+5te2yzjsHqPmydbPYbPCM50BOmAdQJ60lyQm
   OJhmAm0rqxggialCaPONrIj98psPbH1MIfHOHp+ES68JU+pTDjk8ZSSgR
   kgR2LtzoUzdtMO9yciRJ4CrAV7pFVd9podOV7MDN3xbbojrMsGZ8sJeY1
   Q==;
X-CSE-ConnectionGUID: w86In1cHQae7ZJWfY35Z+A==
X-CSE-MsgGUID: aJFETTWIRuuRnHffCRbstg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433876"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7433876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 12:04:07 -0700
X-CSE-ConnectionGUID: 0c2LHNSvR/2Me+42bP4DTA==
X-CSE-MsgGUID: n9hlvTysRp+tGEPcu0YZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="19492318"
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
Subject: [PATCH 4/4] ASoC: SOF: Intel: hda-ctrl: only clear WAKESTS for
 HDaudio codecs
Date: Thu,  4 Apr 2024 14:03:57 -0500
Message-Id: <20240404190357.138073-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZNZMTTB74NHNCUU7JFB5T6O43HFDMTD2
X-Message-ID-Hash: ZNZMTTB74NHNCUU7JFB5T6O43HFDMTD2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNZMTTB74NHNCUU7JFB5T6O43HFDMTD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When a PME wake happens due to a SoundWire wake, we currently clear
all WAKESTS bits during the resume operation initiated by the PCI
subsystem. As a result, we are unable to identify which SoundWire
links need to be resumed and don't properly handle jack detection.

This patch only clears the WAKESTS bits for the HDaudio codecs
detected earlier.

Note that we still clear all WAKESTS bits unconditionally in
hda_dsp_ctrl_stop_chip(). The existing behavior is potentially racy if
e.g. a jack event happens during a suspend routine, but there's a risk
of breaking shutdown or reboot sequences so the code is left as is for
now.

Closes: https://github.com/thesofproject/linux/issues/4687
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Keqiao Zhang <keqiao.zhang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index b4f0756e21f6..6d941209847f 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -228,7 +228,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 
 	/* clear WAKESTS */
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_WAKESTS,
-			  SOF_HDA_WAKESTS_INT_MASK);
+			  bus->codec_mask);
 
 	hda_codec_rirb_status_clear(sdev);
 
-- 
2.40.1

