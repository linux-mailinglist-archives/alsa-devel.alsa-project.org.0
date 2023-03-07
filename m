Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A66686AE19A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2F731471;
	Tue,  7 Mar 2023 15:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2F731471
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678197928;
	bh=xB2vBpjaxOS0TND67ZMDZF1U286XuGGT/20U2vh5NR0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BoKdzdakfNRo1CwbDS0Wd4FwEErCL56+GcbZcuadCvn/KpBpDu23yWmiOL4TPP7gG
	 wFKrBYTqgtX9feK/3eezJ30gvari6FS3Q+YgQMOZS46HdqjeLzRaSZ26tGRKEi2dMX
	 pbhuHUPcdenrNTxurDXFgbKx6AFCc9FPixKrUM1M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 956ABF80236;
	Tue,  7 Mar 2023 15:04:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65794F804B1; Tue,  7 Mar 2023 15:04:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC059F800C9
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC059F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cjn/KGN1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197867; x=1709733867;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xB2vBpjaxOS0TND67ZMDZF1U286XuGGT/20U2vh5NR0=;
  b=Cjn/KGN1F96q1kKxLILadfdK7QiXt/Acneuaor7vblimJtZwlMG0p/BY
   p0UtUeOwXCB5cYsbBCsWG64d1UdEXPnYT/1mPQu06govBjG/BNPsHTd+i
   KEukcJlci+eIB3QQdcT9wCTmZf5Qgg9Mbb14NEcHqmQtETBevnpV70nuA
   /HCDa+FSogS1w2l3PHk+sSGWTxyCY/7wSQM/evQOidQ8FTztffpoGfhA7
   W5huypKWqRzKxZba2EiRufeP0PvxHq6TzD0RZ8VH4zW+qZaWuXbpijkRg
   undcSVBIjf2EmBPwGfh4nSehvooAllFJkIshMC43ZhPHU5h+NKvUz0shg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255154"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706919"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706919"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:13 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 00/14] ASoC: SOF: Intel: hda: Introduce HDA DAI abstraction
Date: Tue,  7 Mar 2023 16:04:21 +0200
Message-Id: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CK3MAQAM4A2IPL67HRKXTEDSLGOJICKQ
X-Message-ID-Hash: CK3MAQAM4A2IPL67HRKXTEDSLGOJICKQ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CK3MAQAM4A2IPL67HRKXTEDSLGOJICKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series introduces an abstraction of the HDA DAI handling.

The motivation is to simplify and make the code more flexible regarding to IPC
versions, new features (ChainDMA (IPC4) and DSPless mode) and to pave the way for new
platforms.

For the first look the series might feels a bit too intrusive but it introduces
no functionality change (tested at each commit).

Regards,
Peter
---
Ranjani Sridharan (14):
  ASoC: SOF: Intel: hda-dai: Remove BE DAI DRV ops for SSP DAI's
  ASoC: SOF: Intel: hda-dai: Remove hda_link_dma_params()
  ASoC: SOF: Intel: hda-dai: remove struct hda_pipe_params
  ASoC: SOF: Intel: hda-dai: Modify the signature of
    hda_link_dma_cleanup()
  ASoC: SOF: Intel: hda-dai: Pass the CPU dai pointer
  ASoC: SOF: Intel: hda-dai: Use the dai argument in
    ipc4_hda_dai_trigger
  ASoC: SOF: Intel: hda-dai: Introduce DAI widget ops
  ASoC: SOF: Intel: hda-dai: Define and set the HDA DAI widget DMA ops
  ASoC: SOF: Intel: hda-dai: Add setup_hext_stream/reset_hext_stream DMA
    ops
  ASoC: SOF: Intel: hda-dai: Use the topology IPC dai_config op
  ASoC: SOF: Intel: hda-dai: Define DAI widget DMA trigger ops for IPC4
  ASoC: SOF: Intel: hda: Unify DAI drv ops for IPC3 and IPC4
  ASoC: SOF: Intel: hda: Remove hda_ctrl_dai_widget_setup/free()
  ASoC: SOF: Intel: hda: remove redundant DAI config during hw_free

 sound/soc/sof/intel/Makefile      |   2 +-
 sound/soc/sof/intel/hda-dai-ops.c | 343 +++++++++++++++
 sound/soc/sof/intel/hda-dai.c     | 688 ++++++++----------------------
 sound/soc/sof/intel/hda.c         |  88 +---
 sound/soc/sof/intel/hda.h         |  41 +-
 sound/soc/sof/sof-audio.h         |   2 +
 6 files changed, 554 insertions(+), 610 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-dai-ops.c

-- 
2.39.2

