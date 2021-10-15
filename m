Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97942FCB3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 22:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41BA21893;
	Fri, 15 Oct 2021 22:00:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41BA21893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634328066;
	bh=1wEAM8GE4Y0cDA65OFweRSVhCZXHuQuuP/KeTd0ep8s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ejjO5QZdb3Q2eXDq4tvaxyA1OuR8g33LQVXUG9Vz5WSmYV3b6YDpC/tXGFA5n448d
	 FZkX8XFkhf+e5JUHe+DJBK7cUuxzarkqbLDWB7+1R6VS9OOX1EbEwvo5GBoPh9s3OA
	 wfFrbL9w/lSnAjorMWogKsUkKXyOZpUD2CYwnhpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6438BF8012E;
	Fri, 15 Oct 2021 21:59:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F889F80269; Fri, 15 Oct 2021 21:59:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODY_21,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C82AAF8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82AAF8012E
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="228257928"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="228257928"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:40 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593081836"
Received: from ssureshc-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.190.93])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 0/4] ASoC: SOF: Intel: power optimizations with HDaudio
 SPIB register
Date: Fri, 15 Oct 2021 14:59:28 -0500
Message-Id: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
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

Changes since v2:
Added check on appl_ptr (Takashi)
Moved rewind detection to deal with SYNC_PTR (Takashi)

Pierre-Louis Bossart (2):
  ALSA: pcm: unconditionally check if appl_ptr is in 0..boundary range
  ALSA: pcm: introduce INFO_NO_REWINDS flag

Ranjani Sridharan (2):
  ASOC: SOF: pcm: add .ack callback support
  ASoC: SOF: Intel: add .ack support for HDaudio platforms

 include/uapi/sound/asound.h      |  2 +-
 sound/core/pcm_lib.c             | 17 +++++++++++++
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  1 +
 sound/soc/sof/intel/hda-pcm.c    | 41 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-stream.c |  2 ++
 sound/soc/sof/intel/hda.h        |  1 +
 sound/soc/sof/intel/tgl.c        |  1 +
 sound/soc/sof/ops.h              | 10 ++++++++
 sound/soc/sof/pcm.c              |  9 +++++++
 sound/soc/sof/sof-priv.h         |  3 +++
 11 files changed, 85 insertions(+), 3 deletions(-)

-- 
2.25.1

