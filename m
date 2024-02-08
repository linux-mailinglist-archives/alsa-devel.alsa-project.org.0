Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68884DE2B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 11:24:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873FD852;
	Thu,  8 Feb 2024 11:24:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873FD852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707387864;
	bh=oZ1Q6D6eujwVlJtp/IDnun4oIAVk7Apm420O/mQN+uc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NuG+fFL+vuxoNzC5Lhylwlgb9ev/QIeSigs3AsAXzyvWP0q4Dj0aMTdPWBs637ZAL
	 VHtdSaVqV93NgKUkC9XgPF9ugzozRv7hu/Cbgf+E7zQn8txpY2xz2rfYwVmisXgRyH
	 WSHIIJ8UkDSMWcpnlnO9uvAJN/khpInbgLsstZGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48463F805AF; Thu,  8 Feb 2024 11:23:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B5CF805A8;
	Thu,  8 Feb 2024 11:23:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90C5FF80567; Thu,  8 Feb 2024 11:23:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2CB8F80153
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 11:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2CB8F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VcaGIB8j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707387818; x=1738923818;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oZ1Q6D6eujwVlJtp/IDnun4oIAVk7Apm420O/mQN+uc=;
  b=VcaGIB8jNCLK1/owZgcNfYR/h09hLiPpGugKSopGhrnhRplbJyxhhOzF
   9tkS1EeFa40u9nslqCCgecZToWZziW7O2dgmZYtr76nIdfsdWTUvHJTPU
   LoUv5z/mFZw1KMZd3W5uD3p8TFA3bH0/I+9pgYLbzASt/gFxQYFCKEvop
   qXVkBXsFDkFfwQlmL5l5wKY6O3DyS0UL/xUyufP+kKtIMv0HeuUQ6h5FT
   RbKm6Lzob7Bcuz5j7NnTPfAA9IfGH4iP/SvE6PxggpAWWDd1gzBlozavL
   y2EuuF7JjtRdZZvyWHwYTeX8YEFnHnhGe3FOTQ2pKbqyGzJMSJI9sCxMF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18699104"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400";
   d="scan'208";a="18699104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 02:23:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400";
   d="scan'208";a="1913768"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 02:23:30 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 0/3] ASoC: Intel: avs: Add support for sending initial
 module config
Date: Thu,  8 Feb 2024 11:23:57 +0100
Message-Id: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3U3YAVPM26XID73425VS5GZFDZI35TP3
X-Message-ID-Hash: 3U3YAVPM26XID73425VS5GZFDZI35TP3
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3U3YAVPM26XID73425VS5GZFDZI35TP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In some cases it may be desirable to provide default initial
configuration for FW module using payload. To facilitate such solution
extend topology to contain initial config information, parse it and then
send data to FW if present.

Amadeusz Sławiński (3):
  ASoC: Intel: avs: UAPI: Add tokens for initial config feature
  ASoC: Intel: avs: Add topology parsing support for initial config
  ASoC: Intel: avs: Send initial config to module if present

 include/uapi/sound/intel/avs/tokens.h |   9 ++
 sound/soc/intel/avs/path.c            |  33 ++++++
 sound/soc/intel/avs/topology.c        | 164 +++++++++++++++++++++++++-
 sound/soc/intel/avs/topology.h        |  13 ++
 4 files changed, 217 insertions(+), 2 deletions(-)

-- 
2.34.1

