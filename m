Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 002186101C7
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8819B1AF8;
	Thu, 27 Oct 2022 21:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8819B1AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899425;
	bh=aEMBOOAVWVzFmaVy2Xesokxw9Ix/2aoPkybnnAljzJw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eIXMvoL2Wf9eN7pxC6ch8/kca89kUu3dAy5u62EQ6waUWJ3mDDB9+oZKbq3VhjhO6
	 KOPy03nRT2VYMesW1GfxmiURLfdwsc3rZdBTNAzlpoSF45gBWLMBhPZLDLpn4n9BwA
	 X+W4wiSkyziu0StVsvljxSMQJsRcDqVtuWNjG42M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D70BCF804FE;
	Thu, 27 Oct 2022 21:36:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ED59F804AD; Thu, 27 Oct 2022 21:36:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE, 
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C64DDF80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C64DDF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="csqogxuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899366; x=1698435366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aEMBOOAVWVzFmaVy2Xesokxw9Ix/2aoPkybnnAljzJw=;
 b=csqogxuzE4wzX9wgQqR6NnB3NW95BI4yqDLa6Il33yrQfhFee1NsKvB3
 3dAq4LzoTBh3scfnOTte2njQLrDzA8MLMae0XEZtqpd/prJpCBrWqeFiO
 3TM4WFlvSqZbZGVXP2cgaTWD2ybXfPQu2lMAR83lhJm+WhlcrjZEeAKzI
 auAx2oiDNRa6X1+Wl1nCndj6K4AdNXERLDsIk2HB3gKmKFrdOBXKzx2fC
 ao5nFn9/7VQT2s4OUcL8MW877FAUuahxkQ2+MibDG9bSMnnw3oiGurP2Y
 MS6FH3Wfk4T3AIYhHmd+5V5bcoUr5fPJRbSTOxqfTLQnj+b7bwDCeiTFq A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957797"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957797"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632526935"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632526935"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/21] ASoC: SOF: Intel: HDA: refactor codec and multi-link
 suport
Date: Thu, 27 Oct 2022 15:35:19 -0400
Message-Id: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org,
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

Existing HDaudio controllers expose an HDAudio DMA which is used to
interface with HDaudio codecs. All other interfaces supported by Intel
(SoundWire, SSP, DMIC) rely for data transfers on another GP-DMA
managed by the DSP firmware - the HDaudio DMA is only used for
memory-to-DSP transfers.

New HDaudio extensions will enable the use of this HDaudio DMA for all
of SoundWire, SSP, DMIC. These extensions will be backwards-compatible
for HDaudio and iDISP codecs, but will require new programming
sequences and DAI callbacks for SoundWire, SSP and DMIC.

Before we add support for 'extended audio links' and the programming
sequences for the DMA, we need to refactor the code. All HDaudio codec
support needs to be well identified in a separate file, and likewise
all the 'multi-link' handling needs to be better split.

This patchset removes a number of 'old' Kconfig dependencies and
options, adds helpers with a fallback to remove IS_ENABLED checks in
the code and tries to simplify programming sequences when possible.

One indirect benefit from this refactoring is that developers can
switch with a kernel parameter from HDaudio support to a variant of
'nocodec' support. This proves extremely useful to test on existing
Intel RVPs and Up boards, where the same build can be used to check 3
interfaces (HDaudio, SSP, DMIC) by just removing modules, setting the
kernel parameter and reloading modules.

Pierre-Louis Bossart (21):
  ASoC: SOF: Intel: remove option to disable the common_hdmi handling
  ASoC: SOF: Intel: remove all dependencies on SND_SOC_HDAC_HDMI
  ASoC: SOF: Intel: hda-codec: simplify SND_SOC_SOF_HDA_AUDIO_CODEC
    handling
  ASoC: SOF: Intel: move codec state change to hda-codec.c
  ASoC: SOF: Intel: start moving multi-link handling in dedicated file
  ASoC: SOF: Intel: hda: add multi-link helper for LOSVID
  ASoC: SOF: Intel: move all RIRB/CMD_IO helpers to hda-codec.c
  ASoC: SOF: Intel: hda-ctrl: add codec wakeup helper
  ASoC: SOF: Intel: hda-codec: add hda_codec_device_remove() helper
  ASoC: SOF: Intel: hda-codec: add stop_cmd_io helper
  ASoC: SOF: Intel: hda-stream: always allocate CORB/RIRB buffer
  ASoC: SOF: Intel: hda-codec: add hda_codec_check_rirb_status() helper
  ASoC: SOF: Intel: hda-ctrl: use helper to clear RIRB status
  ASoC: SOF: Intel: hda-dsp: clarify dependencies on SND_SOC_SOF_HDA
  ASoC: SOF: Intel: hda-codec: add helpers to suspend and resume cmd_io
  ASoC: SOF: Intel: clarify bus_init and bus_exit sequences
  ASoC: SOF: Intel: hda-mlink: add helpers to suspend/resume links
  ASoC: SOF: Intel: add hda_bus_ml_free helper
  ASoC: SOF: Intel: hda: clarify Kconfig dependencies
  ASoC: SOF: Intel: hda-codec: use GPL-2.0-only license
  ASoC: SOF: introduce new DEBUG_NOCODEC mode

 sound/soc/sof/Kconfig            |  18 ++-
 sound/soc/sof/intel/Kconfig      |   2 +-
 sound/soc/sof/intel/Makefile     |   2 +-
 sound/soc/sof/intel/hda-bus.c    |  23 ++-
 sound/soc/sof/intel/hda-codec.c  | 252 +++++++++++++++++++++++++------
 sound/soc/sof/intel/hda-ctrl.c   |  63 ++------
 sound/soc/sof/intel/hda-dai.c    |  10 +-
 sound/soc/sof/intel/hda-dsp.c    |  44 ++----
 sound/soc/sof/intel/hda-mlink.c  |  89 +++++++++++
 sound/soc/sof/intel/hda-stream.c |  30 +---
 sound/soc/sof/intel/hda.c        |  62 ++------
 sound/soc/sof/intel/hda.h        |  63 ++++++--
 sound/soc/sof/sof-audio.c        |   5 +
 sound/soc/sof/sof-priv.h         |   3 +
 14 files changed, 438 insertions(+), 228 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-mlink.c

-- 
2.34.1

