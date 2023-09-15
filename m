Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F987A1AA5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 11:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D500E1E0;
	Fri, 15 Sep 2023 11:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D500E1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694770568;
	bh=TRdlvKHz2CV0OR2u+o7kzEq/brGP5+cv9zxfi/nnz4w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a1HTSgv91fHaB1AXj83MAAc5cG+WNsW9Vtl0OY9SqYCYEH0zJvqbx+4O8Xv8wfueo
	 F8ejCNMv9LKOAtXWp+73MiXjHYwbCWfRw8qqR9gLct0V4GxRah605PUoXJvjTziMdd
	 k3PY8MPdAArV2/DIiE+vMEcYRx0+8UtWh0H5neoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22210F80551; Fri, 15 Sep 2023 11:35:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE2ACF80425;
	Fri, 15 Sep 2023 11:35:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F5AF8007C; Fri, 15 Sep 2023 11:35:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFBCDF8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 11:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFBCDF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MelwPa8O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694770513; x=1726306513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TRdlvKHz2CV0OR2u+o7kzEq/brGP5+cv9zxfi/nnz4w=;
  b=MelwPa8OESBEt93RUbXCbLE2QTSlNVy+4nXj0HlpEvhs1tswInjoC2XI
   tFzHPp89YcyPTdWar8JKe11S81iynD9ojQBaxNlQBb8LLoMW3M1xE991k
   3LmDHUdz9EB7kG2ymQwWu4ammAMbjgnsXkpdUCmYP+FluiqhevonZj5nj
   RYzK5kvitg5uEwu+QZ3niVZvlb3AQsIk+54EkEODSJJpt+zbUMe9LqUZD
   VpFHsuqe/k1t/2wP6+KuT7wTvUn9lKpUlr5F03XEO7R/Y5MFwakXH7r7W
   qAg6HwHbguyzNeHr2tpFia7HvfgchRNpGhpani3yxT4dynVMXV93Fx2kR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445666656"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="445666656"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868646120"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="868646120"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 02:35:01 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 0/2] ASoC: SOF: ipc4: Fixup dailink format based on copier
Date: Fri, 15 Sep 2023 12:35:05 +0300
Message-ID: <20230915093507.7242-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6WMZ2WM33WX2CAMVGEPFSACAEWXRAUKB
X-Message-ID-Hash: 6WMZ2WM33WX2CAMVGEPFSACAEWXRAUKB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WMZ2WM33WX2CAMVGEPFSACAEWXRAUKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

If the copier supports a single format on the DAI side we should fixup the BE
dailink to use this single format.

Regards,
Peter
---
Bard Liao (2):
  ASoC: SOF: ipc4-topology: export sof_ipc4_copier_is_single_format
  ASoC: SOF: ipc4-pcm: fixup dailink based on copier format

 sound/soc/sof/ipc4-pcm.c      | 55 ++++++++++++++++++++++++++++++-----
 sound/soc/sof/ipc4-topology.c |  8 ++---
 sound/soc/sof/ipc4-topology.h |  3 ++
 3 files changed, 54 insertions(+), 12 deletions(-)

-- 
2.42.0

