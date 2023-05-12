Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42308700E86
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:19:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8FCCE98;
	Fri, 12 May 2023 20:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8FCCE98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915549;
	bh=rxLOUWoSmo3G5JaX/UUJneK3WSRlJ7bfgI6i+AQ1l9s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TaFNAp0JXp+7HLhLdEgeBFTDWUqE564XCB0/dgzQ7NBWGwG7lLso/FUD3zE4THRED
	 nuWfGrXRknIH7FLhxpOzjPQcRbcDrrwq/K8ZOQWAspSXoO5rw6NxthtCfQnndVrxIS
	 3RZAQikV9wbqffLfqyRgKB/cCBJBnK94plhDnaes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD608F80534; Fri, 12 May 2023 20:17:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 197E9F80544;
	Fri, 12 May 2023 20:17:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11CDDF8053D; Fri, 12 May 2023 20:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B7E1F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B7E1F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ggDsXU4v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915459; x=1715451459;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rxLOUWoSmo3G5JaX/UUJneK3WSRlJ7bfgI6i+AQ1l9s=;
  b=ggDsXU4vU7/N2gl/pS7or/qY+QrTC1i4893PWyXPmcOH2gDhS8VjUk1K
   TxjOGQNYYxhRMnPGmGnzuuMxzh/H89oRkiPlTZxKwH4EZBBPfchr2FLB1
   oMuFKHG9H9G/c4Pqh6sjXQy1yfjK2QxdI7Vd61kRzulX3wdgQ1zwve44Y
   wjCmPI8RDBhk5M9m7YoZaFaCKTCnlsVok/aLU/uAmi3grdicknzCXjrLn
   vFmFcSXpmcf9BHy7hxDMlToBAW4IJ1DnXyX7zFMyHD1TnOLzsaIaDquI1
   K15fiqk9T8/Bvqdl3AxcFs6ypV7atebo5VAYOCmXGaxVQBgPzpO9NG9BG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223184"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223184"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895029"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895029"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 0/9] ASoC: SOF: Intel: hda-dai: prepare LNL support
Date: Fri, 12 May 2023 13:16:53 -0500
Message-Id: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QMSHWUETYFZYXC4OYME6ZUT7G27VUF4B
X-Message-ID-Hash: QMSHWUETYFZYXC4OYME6ZUT7G27VUF4B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMSHWUETYFZYXC4OYME6ZUT7G27VUF4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The HDAudio support has not changed much since CometLake/2019: the
code was reshuffled for IPC4 support and we used hdac_hda for external
and Display Audio codec, but the hda-dai code was only used for
HDAudio codecs.

In the LunarLake architecture, all endpoints (HDaudio, SSP, DMIC,
SoundWire) are handled with the HDaudio DMA, which requires us to
revisit the definitions of HDA_LINK, and remove the mutual exclusion
between NOCODEC and HDA_LINK: we do want the ability to test SSP/DMIC
in NOCODEC mode even with an HDA DMA.

This code change exposed a number of issues, with a useless .prepare
callback, a DAI number mismatch and the need to support SoundWire
which is handled by a different component in
drivers/soundwire/intel_ace2.c.

Pierre-Louis Bossart (9):
  ASoC: SOF: Intel: hda-dai: simplify .prepare callback
  ASoC: SOF: Intel: hda-dai: remove use of cpu_dai->component drvdata
  ASoC: SOF: Intel: fix DAI number mismatch
  ASoC: SOF: Intel: clarify initialization when HDA_AUDIO_CODEC is not
    used
  ASoC: SOF: Intel: Kconfig: move selection of PROBE_WORK_QUEUE
  ASoC: SOF: Intel: hda-dai: move hda_dai_prepare() code
  ASoC: SOF: Intel: hda-dai: mark functions as __maybe_unused
  ASoC: SOF: Intel: hda-dai: use HDA_LINK instead of HDA_AUDIO_CODEC
  ASoC: SOF: Intel: remove mutual exclusion between NOCODEC and HDA_LINK

 sound/soc/sof/intel/Kconfig       |   3 +-
 sound/soc/sof/intel/hda-bus.c     |  11 +++-
 sound/soc/sof/intel/hda-dai-ops.c |   4 +-
 sound/soc/sof/intel/hda-dai.c     | 104 +++++++++++++++---------------
 sound/soc/sof/intel/hda.h         |   2 +-
 5 files changed, 63 insertions(+), 61 deletions(-)

-- 
2.37.2

