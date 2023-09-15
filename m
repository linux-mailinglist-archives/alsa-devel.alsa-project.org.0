Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6E17A1D93
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 13:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AB5DEC;
	Fri, 15 Sep 2023 13:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AB5DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694778074;
	bh=iXPCYcT4FXNNSbDM2bk+ID/REq63Xzzblt6xNu6xPrI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RKBBvJ405eTgfQ/ipPiCkYL2y4l81bK4JiA4PglN5D0wNr4cNLo376/26Aq+hl6yi
	 1M/T2PURUbaOmIIqprrWqah/EmFCJ09CZT9Gz2eIGQiEYnTPtSTomFCjdQpCbEWYku
	 1Ha81KD9DRH9tWVskme36kUiF4hhD7jAXDDySlKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64D92F8057E; Fri, 15 Sep 2023 13:39:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D55A7F80558;
	Fri, 15 Sep 2023 13:39:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04E97F80425; Fri, 15 Sep 2023 13:39:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B661F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B661F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=irFfKlpd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694777960; x=1726313960;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iXPCYcT4FXNNSbDM2bk+ID/REq63Xzzblt6xNu6xPrI=;
  b=irFfKlpdf6c6QU0f86C6abX8N0nX0OcWWGEGLcZgAB6ZuBqvTZeKt74W
   bwHUMDShamYvLa+mZWo7iffzfF8Onvou2Pa/TZtU3C2FAq7W6xZqSoFJJ
   Ni79krcrgV1XmWMuM/+88xZ8sOArt3GonthFx0LMSDTggRrR2tTcDDk8+
   bmCKsyps+PFsdba9suGhTjCxHCqKhGs3Uf1bVeg0BPGVfi9RoTu9CbnYQ
   ahZbApLMrcz2asGwHIPZIXdTo88oj0XRB6/UDBbeloN0b5jaIGSQIBndd
   +sts+cpy1Ul3N4mrQIudEX6vImOfoCtJcJ+oaoQIUvxGm1JeJ1TMJLFdh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465590992"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="465590992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918629460"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="918629460"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:39:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	guennadi.liakhovetski@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 0/3] ASoC: SOF: ipc4/Intel: Implement split fw library loading
Date: Fri, 15 Sep 2023 14:39:09 +0300
Message-ID: <20230915113912.1405-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AXLD2SXRP2NOGIHHS4MCDUDROMTVNL3Z
X-Message-ID-Hash: AXLD2SXRP2NOGIHHS4MCDUDROMTVNL3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXLD2SXRP2NOGIHHS4MCDUDROMTVNL3Z/>
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
Peter Ujfalusi (3):
  ASoC: SOF: Intel: hda: Add definition for SDxFIFOS.FIFOS mask
  ASoC: SOF: ipc4: Add new message type:
    SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE
  ASoC: SOF: Intel: hda-loader: Add support for split library loading

 include/sound/sof/ipc4/header.h  | 15 +++++++++---
 sound/soc/sof/intel/hda-loader.c | 42 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-stream.c |  2 +-
 sound/soc/sof/intel/hda.h        |  3 +++
 sound/soc/sof/ipc4.c             |  1 +
 5 files changed, 56 insertions(+), 7 deletions(-)

-- 
2.42.0

