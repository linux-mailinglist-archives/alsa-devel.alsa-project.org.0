Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A86F7A1D97
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 13:42:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F27FDF4;
	Fri, 15 Sep 2023 13:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F27FDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694778123;
	bh=P9HnBP7+Eik2r6HJ9nXJsJfSV4eqpYo/RlKEACt8z0Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=es0WGIwY+stL6UccuawQkwc/lxeWXhyKA/vK9+e2OU96QS2SNRbuyLBuZ4cA2XFY0
	 kN1P1GXKdlnrMmcfMD7hQ1cUPn/lSf1JeAJW8M4sxVwL/dqQL0qc9GOjYVzWqxeU7J
	 OpaSeAgguj6uSiGQASFUubM0p40SwK1pRwuJftXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94240F8047D; Fri, 15 Sep 2023 13:40:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DD78F80246;
	Fri, 15 Sep 2023 13:40:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 251BCF80431; Fri, 15 Sep 2023 13:40:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E39EF801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E39EF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EZ1w5U46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694778023; x=1726314023;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P9HnBP7+Eik2r6HJ9nXJsJfSV4eqpYo/RlKEACt8z0Q=;
  b=EZ1w5U4640fY/WZqjENLQfy2ywT8/TVIu6qGFtOmpKSniZd0EEz9PgEW
   I0czh2IGUGAOh2Fw+O4L1BmiiZ2UV7DmU0VfpZ3R7DG9xN9MQiwa/fCL/
   XB461/b3r+sAWC6Pj7MDwUsthSEXK0RAPOcsEi3iif/NkIaIfWKN3fSnA
   AGPxqQnEPNn2qG8s7ZhzElNJvDSfw8iX5tWYfHiTD2i9SyeE4JSrrzz9J
   uDOu/ZaCRjlx89+akxCC/KzOgCearYbz8L2k+9HhXzuS0fivXUtm3U5Hl
   sWVB9or1nWhQgTBFj8kntsmCiwdEKv6UA0kA9sPi4B87nz87Yj7t41SQU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358642911"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358642911"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721652880"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="721652880"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	guennadi.liakhovetski@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 0/4] ASoC: SOF: ipc4/Intel: Implement split fw library loading
Date: Fri, 15 Sep 2023 14:40:14 +0300
Message-ID: <20230915114018.1701-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MIKHHPS3KN75UAYYOH2TWL3G4IORNJNV
X-Message-ID-Hash: MIKHHPS3KN75UAYYOH2TWL3G4IORNJNV
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MIKHHPS3KN75UAYYOH2TWL3G4IORNJNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series implements support for split library loading to comply with the HDA
DMA programming sequence recommendation, which is:
1. DSP side DMA programming and GEN bit set to 1
2. host side DMA programming and RUN bit set to 1

The SOF support for library loading is based on this sequence, backwards
compatibility with older reference firmware is supported (where only the
LOAD_LIBRARY message is supported).

Regards,
Peter
---
Peter Ujfalusi (4):
  ASoC: SOF: ipc4: Convert status code 2 and 15 to -EOPNOTSUPP
  ASoC: SOF: Intel: hda: Add definition for SDxFIFOS.FIFOS mask
  ASoC: SOF: ipc4: Add new message type:
    SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE
  ASoC: SOF: Intel: hda-loader: Add support for split library loading

 include/sound/sof/ipc4/header.h  | 15 +++++++++---
 sound/soc/sof/intel/hda-loader.c | 42 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-stream.c |  2 +-
 sound/soc/sof/intel/hda.h        |  3 +++
 sound/soc/sof/ipc4.c             |  5 ++++
 5 files changed, 60 insertions(+), 7 deletions(-)

-- 
2.42.0

