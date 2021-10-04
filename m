Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 076094215B7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 19:57:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 645A51676;
	Mon,  4 Oct 2021 19:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 645A51676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633370231;
	bh=kv0QnjxGy9puaBX2xNVruJMx3/LV3CwS1c0VlWlqT28=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C5dkeMFR09iRK8VJmM1VuPE7GFrmEWVPfRvKhwFP2+PtaMkzdptuZsWN4uk9lVljq
	 AsPCZIOngt1BcfXS5OAULm9y1GcDmfts+8AaYRY4DrzOw59f5CtF4u9QCFYMK2anN+
	 zSkVr0VUjfy3Ra4LjQs9x2tCWjhC1bpFUD3455Fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE6CAF8025C;
	Mon,  4 Oct 2021 19:55:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2608AF800BA; Mon,  4 Oct 2021 19:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODY_21,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1C3BF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 19:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C3BF800BA
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206334026"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206334026"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:24:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="558594207"
Received: from mbrescia-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.4])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:24:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/3] ASoC: SOF: Intel: power optimizations with HDaudio
 SPIB register
Date: Mon,  4 Oct 2021 11:24:20 -0500
Message-Id: <20211004162423.85323-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

This patchset was initially provided in a larger series that was split
in two [1]. This part only provides support for the SPIB register
support, added on Intel platforms since Skylake (2015).

The use of the SPIB register helps reduce power consumption - though
to a smaller degree than DMI_L1. This hardware capability is however
incompatible with userspace-initiated rewinds typically used by
PulseAudio.

In the past (2015..2017) Intel suggested an API extension to let
applications disable rewinds. At the time the feedback was that such a
capability was too Intel-specific and SPIB remained unused except for
loading DSP code. We now see devices with smaller batteries being
released, and it's time to revisit Linux support for SPIB to extend
battery life.

In this update the rewinds are disabled via an opt-in kernel
parameter. In the previous reviews, there was consensus that a Kconfig
option was too complicated for distributions to set, and we are
missing a TBD API to expose such capabilities to user-space.

The debate on whether or not to use rewinds, and the impact of
disabling rewinds, will likely be closed when Intel releases the
'deep-buffer' support, currently under development [2][3]. With this
solution, rewinds will not be needed, ever. When an application deals
with content that is not latency-sensitive (e.g. music playback), it
will be able to reduce power consumption by selecting a different PCM
device with increased buffering capabilities.  Low-latency streams
will be handled by the 'regular' path. In other words, the impossible
compromise between power and latency will be handled with different
PCM devices/profiles for the same endpoint, and we can push the design
of capability negotiation to a later time when all the building blocks
(firmware topology, kernel, userspace) are ready - we still have
firmware xruns, DPCM race conditions to solve, and a need to describe
these alternate PCM devices with UCM using 'modifiers'.

[1] https://lore.kernel.org/alsa-devel/20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com/
[2] https://github.com/thesofproject/linux/pull/3146
[3] https://github.com/thesofproject/sof/pull/4611

Pierre-Louis Bossart (1):
  ALSA: pcm: introduce INFO_NO_REWINDS flag

Ranjani Sridharan (2):
  ASOC: SOF: pcm: add .ack callback support
  ASoC: SOF: Intel: add .ack support for HDaudio platforms

 include/uapi/sound/asound.h      |  2 +-
 sound/core/pcm_native.c          |  2 ++
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  1 +
 sound/soc/sof/intel/hda-pcm.c    | 41 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-stream.c |  2 ++
 sound/soc/sof/intel/hda.h        |  1 +
 sound/soc/sof/intel/tgl.c        |  1 +
 sound/soc/sof/ops.h              | 10 ++++++++
 sound/soc/sof/pcm.c              |  9 +++++++
 sound/soc/sof/sof-priv.h         |  3 +++
 11 files changed, 70 insertions(+), 3 deletions(-)

-- 
2.25.1

