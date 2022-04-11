Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840004FC59E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 22:18:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B011704;
	Mon, 11 Apr 2022 22:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B011704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649708339;
	bh=+hCtwa9UazuxFW707mqmGUMhshOgO1b2suvk5s07VUA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G7nSWvAXT5s0CeutttDPvOKLluSBwi+IF1cPWZe1vbUu2cJa2wWJOkPglQya0i71q
	 dcwjwZOkWp4ZsSb/z3IL2e3nRa3q9bF6aKCSsOufSL6ZjIk6FaInhCm/wxNxeyzGSH
	 DP3XIwub1i26U9yLVo+F8HV/wyiVflyh9yytIs5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 925D6F8047D;
	Mon, 11 Apr 2022 22:17:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D92B6F800E8; Mon, 11 Apr 2022 22:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33A9EF8020D
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 22:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A9EF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hy+i8Aif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649708275; x=1681244275;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+hCtwa9UazuxFW707mqmGUMhshOgO1b2suvk5s07VUA=;
 b=Hy+i8AifWao92ku4/m9XfDl7cW+EeUcwbrYtqpMYlm0knfQsDu4rw/iF
 L3EzPuYuRyQF/Rqdysx7ZGrjXW1qrjPwR8bY03m7OP3oQ+wLorFq3J3gt
 yTCrQa5piy+Ie6QFIdOxLGcmaeL0IerxyMuxZujh3VTSHpTpBQ6M8Fup7
 33QrnaEb9VKWuvnt0Jb3DnyidzSI770r1vI00qaX9YF4feDp432Gz0IIz
 VCGsmAS414vGXAeJl6s8X5QO2+aFprd9fCtUL9pEwzMUfRBDK6AdDUyLJ
 jV3A5+9nnIhrWOCihhBaz6LzEVST6pKxyLD8p0mlw+NFZ5gScz6uoXK9y g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244090818"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244090818"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="526135636"
Received: from prposam-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.162.151])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 13:17:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/16] ASoC: SOF: add INTEL_IPC4 plumbing
Date: Mon, 11 Apr 2022 15:17:11 -0500
Message-Id: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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

The INTEL_IPC4 protocol and firmware architecture will rely on
different sets of firmware binary and topology files. Some platforms
will only support INTEL_IPC4, some will support both INTEL_IPC4 and
SOF_IPC for development, and some will stay with the existing SOF_IPC.

This patchset adds new IPC definitions, and search paths for firmware
and topology files, along with means to override the default IPC type
and search paths for development. The firmware binary names are
aligned with those used by the Intel AVS driver to avoid duplicate
firmware installs, but the topology will have to differ due to driver
architecture differences.

In addition, this patchset adds basic hardware support for SKL/KBL
with HDaudio codecs, which requires a dedicated code loader and
manifest support. Plain HDAudio was tested on Dell XPS 9350 and Intel
NUC devices. HDAudio+DMIC support was tested on more recent UpExtreme
(WHL and TGL variants).

Pierre-Louis Bossart (12):
  ASoC: SOF: add definitions for different IPC types
  ASoC: SOF: add path indirection to each IPC type
  ASoC: SOF: add default IPC capability and file paths
  ASoC: SOF: add IPC-dependent file names
  ASoC: SOF: sof-pci-dev: add parameter to override firmware filename
  ASoC: SOF: sof-pci-dev: add parameter to override topology filename
  ASoC: SOF: sof-audio: preserve topology filename override in nocodec
    mode
  ASoC: SOF: remove const qualifier for 'struct snd_sof_dsp_ops'
  ASoC: SOF: Intel: hda: use common ops across platforms
  ASoC: SOF: Intel: hda: use BIT() macros for consistency
  ASoC: SOF: Intel: add initial SKL/KBL hardware support
  ASoC: SOF: Intel: add IP identifier

Ranjani Sridharan (4):
  ASoC: SOF: Intel: move HDA_CL_STREAM_FORMAT definition to header
  ASoC: SOF: Intel: hda: define check_ipc_irq op
  ASoC: SOF: Intel: hda: Define rom_status_reg in sof_intel_dsp_desc
  ASoC: SOF: Intel: hda: expose some codeloader functions

 include/sound/sof.h                    |  23 +-
 sound/soc/sof/amd/acp.h                |   2 +-
 sound/soc/sof/amd/pci-rn.c             |  14 +-
 sound/soc/sof/amd/renoir.c             |   2 +-
 sound/soc/sof/core.c                   |   6 +
 sound/soc/sof/debug.c                  |   2 +-
 sound/soc/sof/imx/imx8.c               |  32 +-
 sound/soc/sof/imx/imx8m.c              |  16 +-
 sound/soc/sof/intel/Kconfig            |  24 +
 sound/soc/sof/intel/Makefile           |   6 +-
 sound/soc/sof/intel/apl.c              | 107 +----
 sound/soc/sof/intel/bdw.c              |  17 +-
 sound/soc/sof/intel/byt.c              |  48 +-
 sound/soc/sof/intel/cnl.c              | 112 ++---
 sound/soc/sof/intel/hda-common-ops.c   | 107 +++++
 sound/soc/sof/intel/hda-dsp.c          |   4 +-
 sound/soc/sof/intel/hda-ipc.c          |   8 +
 sound/soc/sof/intel/hda-loader-skl.c   | 583 +++++++++++++++++++++++++
 sound/soc/sof/intel/hda-loader.c       |  43 +-
 sound/soc/sof/intel/hda.c              |  25 +-
 sound/soc/sof/intel/hda.h              |  42 +-
 sound/soc/sof/intel/icl.c              | 111 +----
 sound/soc/sof/intel/pci-apl.c          |  36 +-
 sound/soc/sof/intel/pci-cnl.c          |  54 ++-
 sound/soc/sof/intel/pci-icl.c          |  36 +-
 sound/soc/sof/intel/pci-skl.c          |  89 ++++
 sound/soc/sof/intel/pci-tgl.c          |  91 +++-
 sound/soc/sof/intel/pci-tng.c          |  17 +-
 sound/soc/sof/intel/shim.h             |  16 +-
 sound/soc/sof/intel/skl.c              |  70 +++
 sound/soc/sof/intel/tgl.c              | 120 ++---
 sound/soc/sof/mediatek/mt8195/mt8195.c |  16 +-
 sound/soc/sof/ops.h                    |   8 +
 sound/soc/sof/pcm.c                    |   2 +-
 sound/soc/sof/sof-acpi-dev.c           |   6 +-
 sound/soc/sof/sof-audio.c              |   3 +-
 sound/soc/sof/sof-of-dev.c             |   6 +-
 sound/soc/sof/sof-pci-dev.c            |  47 +-
 38 files changed, 1465 insertions(+), 486 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-common-ops.c
 create mode 100644 sound/soc/sof/intel/hda-loader-skl.c
 create mode 100644 sound/soc/sof/intel/pci-skl.c
 create mode 100644 sound/soc/sof/intel/skl.c

-- 
2.30.2

