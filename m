Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945424193D2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:07:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 058CA16BF;
	Mon, 27 Sep 2021 14:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 058CA16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744442;
	bh=gQfyz+7aLIPTPbIx4RxywgJelJUMZrXpc6XN6IWwHLU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QSRo+LpVvffkVmwR+6fFYyQeRm/ZuZGInUSc1UhPlGO9vXOH2RjRox8v2FITLD7m1
	 UvAVjvFjOSrKsx7n8AAEQ35hwOg+BJn6wIEUZc5FnvSdO3I+j2/LbGKJw6i7OVscrN
	 k43QNNiqRkpVCb2RVTy+6gGlZ24PLmQW77H/XApM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A808F804E5;
	Mon, 27 Sep 2021 14:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4412F80301; Mon, 27 Sep 2021 14:05:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AD61F801F7
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AD61F801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260445"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260445"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164349"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 00/12] Add support for on demand pipeline setup/destroy
Date: Mon, 27 Sep 2021 15:05:05 +0300
Message-Id: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The previous, v2 of this series was sent by Daniel Baluta:
https://lore.kernel.org/alsa-devel/20210917143659.401102-1-daniel.baluta@oss.nxp.com/

We have agreed that it might be better that someone from Intel is going to take it
from here as we already have the infrastructure up to test and verify the
dynamic pipelines support.

Changes since v2 (sent by Daniel Baluta):
- patch 10: Fix NULL point dereference in hda_dai_update_config()
- I have kept Daniel's SoB for the series.

Changes since v1:
- Signed-off-by tag added by Daniel

This series implements initial support for dynamic pipelines to setup/teardown
pipeline as needed when a PCM is open/closed.

Initially dynamic pipelines are only supported with single core setup which will
be expanded with a follow-up series.

Review with SOF community at
https://github.com/thesofproject/linux/pull/2794

The feature has been merged on 1st of April to sof-dev, all issues found since
has been fixed and squashed to this upstream series.

Regards,
Peter
---
Ranjani Sridharan (12):
  ASoC: topology: change the complete op in snd_soc_tplg_ops to return
    int
  ASoC: SOF: control: Add access field in struct snd_sof_control
  ASoC: SOF: topology: Add new token for dynamic pipeline
  ASoC: SOF: sof-audio: add helpers for widgets, kcontrols and dai
    config set up
  AsoC: dapm: export a couple of functions
  ASoC: SOF: Add new fields to snd_sof_route
  ASoC: SOF: restore kcontrols for widget during set up
  ASoC: SOF: Don't set up widgets during topology parsing
  ASoC: SOF: Introduce widget use_count
  ASoC: SOF: Intel: hda: make sure DAI widget is set up before IPC
  ASoC: SOF: Add support for dynamic pipelines
  ASoC: SOF: topology: Add kernel parameter for topology verification

 include/sound/soc-dpcm.h               |   1 +
 include/sound/soc-topology.h           |   2 +-
 include/uapi/sound/sof/tokens.h        |   1 +
 sound/soc/intel/skylake/skl-topology.c |   6 +-
 sound/soc/soc-dapm.c                   |   2 +
 sound/soc/soc-pcm.c                    |   4 +-
 sound/soc/soc-topology.c               |  10 +-
 sound/soc/sof/intel/hda-dai.c          | 174 +++---
 sound/soc/sof/intel/hda.c              | 177 ++++--
 sound/soc/sof/intel/hda.h              |   5 +
 sound/soc/sof/ipc.c                    |  22 +
 sound/soc/sof/pcm.c                    |  58 +-
 sound/soc/sof/pm.c                     |   4 +-
 sound/soc/sof/sof-audio.c              | 709 +++++++++++++++++++------
 sound/soc/sof/sof-audio.h              |  32 +-
 sound/soc/sof/sof-priv.h               |   1 +
 sound/soc/sof/topology.c               | 362 +++++--------
 17 files changed, 1032 insertions(+), 538 deletions(-)

-- 
2.33.0

