Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AAA45D832
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 11:24:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F41C1867;
	Thu, 25 Nov 2021 11:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F41C1867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637835867;
	bh=0NAwRyice6m3txgwZuOIyhudNLH1SQml2VwpMDYy1Ug=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i01mO05+AS+AetEpftsOctXMrzfPPZWj+PA6lbJClLIIy4h2cMFnfLuRfeezHGllS
	 Zo45gXAw4hYLZY/R3Up5N0BqJarlWC1dnQEwmdhS7jQJ7m7qSNIdjcT6WzWmuDkzeU
	 w5EOddyj74boqn+QXqUXnpl0P4sFiCCdl6yW5SbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 127F8F80430;
	Thu, 25 Nov 2021 11:23:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3567F8049E; Thu, 25 Nov 2021 11:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38C06F8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 11:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38C06F8007E
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="259387175"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="259387175"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 02:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="741671682"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2021 02:22:54 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 00/10] ASoC: SOF: Fixes for Intel HD-Audio DMA stopping
Date: Thu, 25 Nov 2021 12:15:10 +0200
Message-Id: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Implement an updated programming sequence to handle DMA stop for Intel
HD-Audio DMA.

The new flow is only used if the firmware is sufficiently new to support
the feature. SOF1.9.2 is the first release with the updated flow. The kernel
changes are backwards compatible with old firmware releases. Likewise new
firmware releases will work with old kernel.

Series reviewed originally at:
https://github.com/thesofproject/linux/pull/3167

Buglink: https://github.com/thesofproject/sof/issues/4779

Ranjani Sridharan (10):
  ASoC: SOF: Intel: hda: clear stream before freeing the DAI widget
  ASoC: SOF: Intel: hda: Add a helper function for stream reset
  ASoC: SOF: Intel: hda: reset stream before coupling host and link
    DMA's
  ASoC: SOF: pcm: invoke platform hw_free for STOP/SUSPEND triggers
  ASoC: SOF: call platform hw_free for paused streams during suspend
  ASoC: SOF: Add a helper for freeing PCM stream
  ASoC: SOF: pcm: move the check for prepared flag
  ASoC: SOF: align the hw_free sequence with stop
  ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags
  ASoC: SOF: Intel: hda: send DAI_CONFIG IPC during pause

 include/sound/sof/dai.h          | 25 +++++++---
 sound/soc/sof/intel/hda-dai.c    | 53 +++++++++++++++++----
 sound/soc/sof/intel/hda-stream.c | 81 +++++++++++++++++++-------------
 sound/soc/sof/intel/hda.c        | 26 ++++++----
 sound/soc/sof/intel/hda.h        |  6 ++-
 sound/soc/sof/pcm.c              | 36 +++++++-------
 sound/soc/sof/sof-audio.c        | 35 ++++++++++----
 sound/soc/sof/sof-audio.h        |  2 +
 8 files changed, 180 insertions(+), 84 deletions(-)


base-commit: cd2f33e93d578e9e1c47ef8981ec69298da9cb38
-- 
2.33.0
