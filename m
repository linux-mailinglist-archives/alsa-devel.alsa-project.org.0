Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E212B67E469
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35F1CE7B;
	Fri, 27 Jan 2023 13:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35F1CE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674820896;
	bh=FXTSBC0gzf4aaWOnx8Ym+A4uT6Tq66uATumPGXTDNAY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=b1dw5A0LulDfGz6StvqIpVQ7l52dk5YNcb8eDZfEeZnjAfaecHJyLJWubyyltuAJy
	 Ehp31LJ0/Kdlt2CSX0BU6BSyYgdYG/dhEYzjTKol1OTycN411505WikPZ3y95zFiqQ
	 uxcOfmyspU1/wKJvFr4CJ5c7LZGuukYU9jcu6tNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93018F804A9;
	Fri, 27 Jan 2023 13:00:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88D0CF804C2; Fri, 27 Jan 2023 13:00:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF79CF80224
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF79CF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HoZ8hVle
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820831; x=1706356831;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FXTSBC0gzf4aaWOnx8Ym+A4uT6Tq66uATumPGXTDNAY=;
 b=HoZ8hVleEKfgTdltlBSjjxeBAmAJhxE11mLCFbVKWv9i8m7AsKctaX9l
 SMvUMgfHWGK4S+r2zqNspV9/CpGqyXiPF/5CXWqy8MiiRRQTvLXGAL42U
 RUqSR3HwbW0kDvMPuzT7YwMj8qS014eJ18QmgGE+Z3Fl3FX4GrqDLFI6z
 RAdQey/bQlG60IfYSCJHtGCFD3rHIVQNE4ph5DqHe6/+Q5ObIHVlcVqKz
 q2V0wHnSMms6vz9mCf98sR5NGBq24z+JxniQ+E8mNcAznaSNhVn39xZFH
 Y5UFFZ3wgpQqHwfYIyw4FsQ5Pg0Csnp0OaAiD1q9K/qHAxyMRKhqJHMwB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091775"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091775"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782060"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782060"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:24 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: ﻿From 644473b181f0f310e428301a2ed459f912eec7ea Mon Sep 17 00:00:00 2001
Date: Fri, 27 Jan 2023 14:00:13 +0200
Message-Id: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

The following series will enable multi-stream support for playback and capture
streams.
Currently only a single PCM can be connected to a DAI, with the multi-stream
support it is possible to connect multiple PCMs to a single DAI.

To achieve this we need to make sure that DAIs/AIF are only set up once since
other stream could be connected to it later.

We also need to introduce reference or use counting for widgets to make sure
that they are not going to be destroyed while other streams are still using
them.

With the multi-stream support we also need to extend our current locking scheme
which worked well for simple paths.

The first patch was sent to the mailing list, but it is not yet applied and I
have included in this series as it is a direct dependency:
https://lore.kernel.org/alsa-devel/20230117121615.25690-1-peter.ujfalusi@linux.intel.com/

Regards,
Peter
---
Peter Ujfalusi (3):
  ASoC: SOF: Avoid double decrementing use_count in sof_widget_setup on
    error
  ASoC: SOF: Protect swidget->use_count with mutex for kcontrol access
    race
  ASoC: SOF: ipc4-pcm: Do not run the trigger pipelines if no spipe is
    stored

Ranjani Sridharan (15):
  ASoC: SOF: ipc4-topology: No need to unbind routes within a pipeline
  ASoC: soc-pcm: Export widget_in_list()
  ASoC: SOF: sof-audio: Set up/free DAI/AIF widgets only once
  ASoC: SOF: sof-audio: Only process widgets in the connected widget
    list
  ASoC: SOF: pcm: do not free widgets during suspend trigger
  ASoC: SOF: topology: Set IPC-specific trigger order for DAI links
  ASoC: SOF: Introduce PCM setup/free PCM IPC ops
  ASoC: SOF: ipc4-pcm: Define pcm_setup/free ops
  ASoC: SOF: ipc4: Add flag to skip triggering pipelines during FE DAI
    trigger
  ASoC: SOF: sof-audio: Populate the PCM stream pipeline_info
  ASoC: SOF: ipc4-pcm: Use the PCM stream's pipeline_info during trigger
  ASoC: SOF: Introduce struct snd_sof_pipeline
  ASoC: SOF: ipc4-pcm: Rename 'data' variable to trigger_list
  ASoC: SOF: ipc4-pcm: Implement pipeline trigger reference counting
  ASoC: SOF: ipc4-topology: Protect pipeline free with mutex

 include/sound/soc-dpcm.h        |   2 +
 include/sound/sof/ipc4/header.h |   3 +
 sound/soc/soc-pcm.c             |   3 +-
 sound/soc/sof/core.c            |   1 +
 sound/soc/sof/intel/hda-dai.c   |  92 ++-------
 sound/soc/sof/ipc3-control.c    |  46 +++--
 sound/soc/sof/ipc3-topology.c   |  32 ++-
 sound/soc/sof/ipc4-control.c    |  33 ++-
 sound/soc/sof/ipc4-pcm.c        | 343 +++++++++++++++++++++++++-------
 sound/soc/sof/ipc4-priv.h       |   2 +
 sound/soc/sof/ipc4-topology.c   |  48 ++++-
 sound/soc/sof/ipc4-topology.h   |  12 ++
 sound/soc/sof/ipc4.c            |   2 +
 sound/soc/sof/pcm.c             |   5 +-
 sound/soc/sof/sof-audio.c       | 226 ++++++++++++++-------
 sound/soc/sof/sof-audio.h       |  54 ++++-
 sound/soc/sof/sof-priv.h        |   1 +
 sound/soc/sof/topology.c        | 114 +++++++----
 18 files changed, 714 insertions(+), 305 deletions(-)

-- 
2.39.1

