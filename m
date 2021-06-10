Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DA13A352D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 22:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A5317C4;
	Thu, 10 Jun 2021 22:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A5317C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623358533;
	bh=YVGVk87+wtn1byP2+KUsfylky8ydrOqnbmfVbttDrps=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UUduxQS327rwcKj5vPhMoW5A8KzQfpufhEWAz2YS9SJJ7ySAayzrhvSOBmytwUNNL
	 gFq5uxLUtFOs8rToblcR435Vc7oF/oX4E8uPNF5KocyNFJPJUgF2OYeXQrc296D+BS
	 pTmmWrCVL8iHwEC/Ng9pT4be+QjrNrdfqF7MmYDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60D0AF804AD;
	Thu, 10 Jun 2021 22:54:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A825F800FC; Thu, 10 Jun 2021 22:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODY_21,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF08EF800FC
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 22:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF08EF800FC
IronPort-SDR: tUAnPfkdpzHwNI6PvNzGWxsZiUPTI/20601r5W69zLUVVfBV1e6tB8TjS65arFXDcCdLBle1P3
 AUJ6dpCeabmA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="226812408"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="226812408"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:48 -0700
IronPort-SDR: +kzqVS1jaQPPIB6dn3t83zZJ62e+MjSVQlbYYiq/Q3nVue3kEH1iBEQ0hBgF+R7Ne4sjqbAdjA
 z7rRmpoVayHQ==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="620183618"
Received: from umedepal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.170.65])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 13:53:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ASoC: SOF: power optimizations for HDaudio platforms
Date: Thu, 10 Jun 2021 15:53:18 -0500
Message-Id: <20210610205326.1176400-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

This patchset provides two optimizations that result in significant power
savings on Intel HDAudio platforms using SOF (Sound Open Firmware).

a) We previously prevented the Intel DSP from enabling the DMI_L1
capability to work-around issues with pause on capture streams. It
turns out that this also prevented the platform from entering high C
states in full-duplex usages such as videoconferencing - a rather
basic use case since the start of the pandemic. The support for
pause_push/release was already a bit controversial for Intel
platforms, in theory platforms should only enable PAUSE if they can
resume on the same sample, which is not the case on any Intel
platform. Since we didn't want to disable a capability that could
impact existing users, the suggestion is to optionally disable
pause_push/release at build time or via a kernel parameter, in which
case DMI_L1 is enabled. In practice very few applications make use of
pause_push/release so there should be a limited impact when disabling
this ALSA capability.

b) The use of the SPIB register also helps reduce power consumption,
though to a smaller degree than DMI_L1. This hardware capability is
however incompatible with userspace-initiated rewinds typically used
by PulseAudio. In the past (2015..2017) Intel suggested an API
extension to let applications disable rewinds. At the time the
feedback was that such a capability was too Intel-specific and SPIB
remained unused except for loading DSP code. We now see devices with
smaller batteries being released, and it's time to revisit Linux
support for SPIB to extend battery life. In this update the rewinds
are disabled either at build-time or via a kernel parameter. As
suggested by Takashi, a new SDNDRV_PCM_INFO flag is needed though to
make sure the appl_ptr value is provided to the driver through the
.ack callback. Distributions using PipeWire (Fedora34) and CRAS
(ChromeOS/Chromium) can safely enable this option. Distributions using
PulseAudio should probably avoid enabling it, although nothing is
really fundamentally broken if they do. While in theory volume updates
and mixing of notifications could be delayed, in practice
distributions use small ring buffers that make such delays difficult
to notice.

Again both of these updates are opt-in to avoid any impact on existing
solutions or users: someone updating their kernel source but using
'make olddefconfig' will see the same results. Distributions that care
neither about pause_push/release or rewinds should enable both
options, in case of issues users will still be able to override
these build-time choices with a simple module parameter.

Pierre-Louis Bossart (6):
  ASoC: SOF: Intel: Kconfig: clarify DMI L1 option description
  ASoC: SOF: Intel: simplify logic for DMI_L1 handling
  ASoC: SOF: pcm: add mechanisms to disable ALSA pause_push/release
  ASoC: SOF: Intel: add kernel parameter to set DMI L1 configuration
  ASoC: SOF: Intel: enable DMI L1 when pause is not supported
  ALSA: pcm: conditionally avoid mmap of control data

Ranjani Sridharan (2):
  ASOC: SOF: pcm: add .ack callback support
  ASoC: SOF: Intel: add .ack support for HDaudio platforms

 include/sound/hdaudio_ext.h      |  5 ++-
 include/uapi/sound/asound.h      |  1 +
 sound/core/pcm_native.c          | 17 ++++++++
 sound/soc/sof/Kconfig            |  9 ++++
 sound/soc/sof/intel/Kconfig      | 14 +++---
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/cnl.c        |  1 +
 sound/soc/sof/intel/hda-pcm.c    | 74 ++++++++++++++++++++++++++++++--
 sound/soc/sof/intel/hda-stream.c | 13 +++---
 sound/soc/sof/intel/hda.h        |  1 +
 sound/soc/sof/intel/tgl.c        |  1 +
 sound/soc/sof/ops.h              | 10 +++++
 sound/soc/sof/pcm.c              | 16 +++++++
 sound/soc/sof/sof-priv.h         |  3 ++
 14 files changed, 148 insertions(+), 18 deletions(-)

-- 
2.25.1

