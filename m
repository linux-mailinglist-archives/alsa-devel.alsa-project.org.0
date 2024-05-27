Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B668D0E61
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED3F950;
	Mon, 27 May 2024 21:46:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED3F950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716839192;
	bh=g6ehXmb+MxBrSwhLcG3A4IbL2l2zT+9EQAgfCA1Rtac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IveJSmAVeGVDl8ESh74DX4Wnb98QSZ2uxrTQRdcR+NT6JgK83OySqRe+xaibnM4UD
	 NPlTFr7frN4nBX7ysYYGwPE5CJCHLi7JVtnM8hIiSfZQELd33Uu4w9BMoeFCL327ol
	 h441DL8j2DQHgwkZbfYotFtNuZNeykkEP41tOGuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED55FF80608; Mon, 27 May 2024 21:45:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79851F8060F;
	Mon, 27 May 2024 21:45:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6449DF805DA; Mon, 27 May 2024 21:45:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B39C4F8026D
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:45:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B39C4F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZVaGEC1M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716839108; x=1748375108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g6ehXmb+MxBrSwhLcG3A4IbL2l2zT+9EQAgfCA1Rtac=;
  b=ZVaGEC1MQYQu9SEF+CS/5GjWUgCXenIdcB+Zo+OaVlyMC1V+/Gx/SuY0
   j6LHRUJTkH6VWaov3tCTmDMARJ+ANGfJ9EhTKpG9jkKiCMU2w3s52TbEb
   uBaXD9WhNkGK2uU0gYYbiPCfjH73ZgkkqzQLHVOMHvFtQfZBeavo7yS2Z
   6Ko8EAv5zWmIlr9usHsZHv/AqOUZ5GWqcBEX1w4oya4FuXcmGDGJ7eudh
   fHJ5na2jYvw9bfYaBf8mnMbr4RUI8Bcn5y1uKHQ0ZFJsPrfGIefH4LJUz
   FFTAzu1xSDeCMP6nm0zDrPhh4w215qyE1iaESFlKp3ctRebppkpKr5UG/
   A==;
X-CSE-ConnectionGUID: dwgW+7V9TQe9FG6KzX8CeQ==
X-CSE-MsgGUID: Zf5v0UMfSTKoDt6EELmy+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30679483"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="30679483"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:03 -0700
X-CSE-ConnectionGUID: n/n1pM2ARvGlWwbW3vYxYA==
X-CSE-MsgGUID: QyjO9/0+T6WP68UcP/pZFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="39280542"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:45:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 1/4] ASoC: SOF: stream-ipc: remove unnecessary MODULE_LICENSE
Date: Mon, 27 May 2024 14:44:11 -0500
Message-ID: <20240527194414.166156-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
References: <20240527194414.166156-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DAQTPSEODNMPJ55AARUEYA3V2UFE76HI
X-Message-ID-Hash: DAQTPSEODNMPJ55AARUEYA3V2UFE76HI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAQTPSEODNMPJ55AARUEYA3V2UFE76HI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This file is part of the snd-sof module, there's no reason to re-add the
MODULE_LICENSE here.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/stream-ipc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index eb71303aa24c..794c7bbccbaf 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -125,5 +125,3 @@ int sof_stream_pcm_close(struct snd_sof_dev *sdev,
 	return 0;
 }
 EXPORT_SYMBOL(sof_stream_pcm_close);
-
-MODULE_LICENSE("Dual BSD/GPL");
-- 
2.43.0

