Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF63640D77A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:33:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6809F1877;
	Thu, 16 Sep 2021 12:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6809F1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788424;
	bh=fzhj8FTmJol+2ZI411LWirZv7v32Zaz9Ac1SzPxIsxI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L9p7IEmnscAUCFcngNNM0PXgZGG+ICAE5NCIqmcKe0Clm9wIkSeTboh9/N2PDuf4j
	 1+f4C2df+U4Nayj/V8n8b+BDcm1i1CuKfg4c9rLYeDrZJbaV18dltkIJqTqetrI7DB
	 lxS+JMvrOBFEcPTMX02r2z/YdIV2AOr9UIl6OcoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA423F8027B;
	Thu, 16 Sep 2021 12:32:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19888F80271; Thu, 16 Sep 2021 12:32:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A0AF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A0AF800D3
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202031844"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202031844"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545473497"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 0/6] ASoC: SOF: Clean up the probe support
Date: Thu, 16 Sep 2021 13:32:05 +0300
Message-Id: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

The probe debug feature of SOF can be used to extract streams of data from a
given point of a pipeline for analysis.

The support is implemented by using the ALSA/ASoC compress support for the
capture stream, but the code can not be used by/for a normal compressed data
stream. It is a debug feature.

Merge the probe implementation in the core (compress.c/h and probe.c/h) into
one file: sof-probes.c/h

Rename the Intel HDA specific probe implementation from hda-compressc.c to
hda-probes.c

We also need to add IPC logging support for the probes messages and drop the
unused references to SOF compress to have reasonably clean code.

Regards,
Peter
---
Peter Ujfalusi (5):
  ASoC: SOF: ipc: Add probe message logging to ipc_log_header()
  ASoC: SOF: pcm: Remove non existent CONFIG_SND_SOC_SOF_COMPRESS
    reference
  ASoC: SOF: probe: Merge and clean up the probe and compress files
  ASoC: SOF: Intel: Rename hda-compress.c to hda-probes.c
  ASoC: SOF: sof-probes: Correct the function names used for
    snd_soc_cdai_ops

Ranjani Sridharan (1):
  ASoC: SOF: compress: move and export sof_probe_compr_ops

 sound/soc/sof/Makefile                        |   3 +-
 sound/soc/sof/compress.c                      | 147 ---------
 sound/soc/sof/compress.h                      |  32 --
 sound/soc/sof/core.c                          |   2 +-
 sound/soc/sof/debug.c                         |   2 +-
 sound/soc/sof/intel/Makefile                  |   2 +-
 sound/soc/sof/intel/hda-dai.c                 |  16 +-
 .../intel/{hda-compress.c => hda-probes.c}    |   0
 sound/soc/sof/ipc.c                           |  23 ++
 sound/soc/sof/pcm.c                           |   6 +-
 sound/soc/sof/probe.h                         |  85 ------
 sound/soc/sof/sof-priv.h                      |   5 -
 sound/soc/sof/{probe.c => sof-probes.c}       | 280 +++++++++++-------
 sound/soc/sof/sof-probes.h                    |  38 +++
 14 files changed, 248 insertions(+), 393 deletions(-)
 delete mode 100644 sound/soc/sof/compress.c
 delete mode 100644 sound/soc/sof/compress.h
 rename sound/soc/sof/intel/{hda-compress.c => hda-probes.c} (100%)
 delete mode 100644 sound/soc/sof/probe.h
 rename sound/soc/sof/{probe.c => sof-probes.c} (52%)
 create mode 100644 sound/soc/sof/sof-probes.h

-- 
2.33.0

