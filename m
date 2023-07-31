Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A138676A30F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:39:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCC1383A;
	Mon, 31 Jul 2023 23:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCC1383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839554;
	bh=CDOcaJCPEbg083MllLvqwyy6nk9MbcvRUK/XVyDNKFU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=albTEnvndAhmXbBuSmnUTwU/XD7RRRXcSm0cHRJ1t4BVBhezuLwqYKMjUiLvrMWap
	 J60r5JXmEj3+ZowrO07N29LiVsl6OJ8eVsA6bxrzHsLmcaTB1g1uWeDsrh87LlNDd1
	 a3PJ8R2d9VA8Mjpk2yklL31ipTmCEbqrOLHWi/G4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9284F80557; Mon, 31 Jul 2023 23:38:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65CBCF80548;
	Mon, 31 Jul 2023 23:38:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BF62F80549; Mon, 31 Jul 2023 23:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9E63F8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E63F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AUePtqkt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839487; x=1722375487;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CDOcaJCPEbg083MllLvqwyy6nk9MbcvRUK/XVyDNKFU=;
  b=AUePtqktqtNeAg4dJLiUuiDG+jz9PagST6EkKVF6byiDoZJuOfGCvArZ
   RdhtNwCQPa+ujZhTY35BHDZGiof0tHFqcHCubQT+Tu/ik9qDBCyfbg52u
   oiOgg6xtjBZ1r0T5w8M0IUdNQwhnBWB0qkWqO49yZnhwYWCudkmzsiS7T
   CaATzbq3Axxk1SIlkOkr3ZXxlsperzi3Ycq94zrRG7kS+2j8L+yFNDxRn
   A2jDoEMnn+xw4+XFrlJ1Q7YeUvqWYXqCyWnsYRiiPc/H8Fu3WQ3/7Mr8A
   OpOUsMgLwek0BlUgnBcCpKiU8m9AWqvoNMTnffNZlX6GzrmP5e0vMgfFf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="366604087"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="366604087"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="793880006"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="793880006"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:38:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/8] ASoC/SOF/Intel/AMD: cleanups for GCC11 -fanalyzer checks
Date: Mon, 31 Jul 2023 16:37:40 -0500
Message-Id: <20230731213748.440285-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EUAWL4G44XBEI2A5NX74VTGQ2GRIZUDU
X-Message-ID-Hash: EUAWL4G44XBEI2A5NX74VTGQ2GRIZUDU
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUAWL4G44XBEI2A5NX74VTGQ2GRIZUDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

GCC11 provides an '-fanalyzer' static analysis option which does not
provide too many false-positives. This patch cleans-up known
problematic code paths to help enable this capability in CI. We've
used this for about a month already.

Pierre-Louis Bossart (8):
  ASoC: SOF: sof-client-probes-ipc4: add checks to prevent static
    analysis warnings
  ASoC: SOF: ipc3: add checks to prevent static analysis warnings
  ASoC: SOF: topology: simplify code to prevent static analysis warnings
  ASoC: SOF: imx: remove error checks on NULL ipc
  ASoC: SOF: mediatek: remove error checks on NULL ipc
  ASoC: Intel: bdw_rt286: add checks to avoid static analysis warnings
  ASoC: Intel: atom: remove static analysis false positive
  ASoC: amd: acp5x-mach:add checks to avoid static analysis warnings

 include/linux/firmware/imx/dsp.h               |  6 ------
 include/linux/firmware/mediatek/mtk-adsp-ipc.h |  6 ------
 sound/soc/amd/vangogh/acp5x-mach.c             |  3 +++
 sound/soc/intel/atom/sst/sst_stream.c          | 13 +++++++------
 sound/soc/intel/boards/bdw_rt286.c             |  6 ++++++
 sound/soc/sof/ipc3.c                           |  2 +-
 sound/soc/sof/sof-client-probes-ipc4.c         |  9 +++++++++
 sound/soc/sof/topology.c                       |  5 +++--
 8 files changed, 29 insertions(+), 21 deletions(-)

-- 
2.39.2

