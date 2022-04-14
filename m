Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7485501B48
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:49:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CEB3180D;
	Thu, 14 Apr 2022 20:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CEB3180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962182;
	bh=7rUPTf+2G4GgpuL76SLI8EoFnSdA4te/yTI/KD9+zKM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OpYJrLjeuT9JBEKrZeefTlT8pYFrRxCisPs+VHq15lcVaAUfdkEbbA2bb5czIlKvO
	 idgx8AbdXqUdQ93FDYMxq4EdxcwHvS5D60d3MDKDOTB8TN3v7CqScEXCcCOd1GTMre
	 UoNm1vXwgIjtfNJTVx+1xpG4ptKI1mVo46BMi2Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5EC7F801F7;
	Thu, 14 Apr 2022 20:48:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 100ECF801F7; Thu, 14 Apr 2022 20:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB760F80114
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB760F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k90DNtGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962117; x=1681498117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7rUPTf+2G4GgpuL76SLI8EoFnSdA4te/yTI/KD9+zKM=;
 b=k90DNtGPkK14q/X9rgoUD1tJPU4b/3mMxIWZxNHd/mxfC68/hzd0LptB
 pEs06CFD3S/d0JJsePjNQkNVQ+LbIe6I+fROLBubLZyNR58S3NZ/r4CaS
 vB1S2H0NBCpg9pr5YALSwCw2JDAkxlk2k/1fUsb7di1voAMtTZTDflin3
 0BiHYGEItFqofYtoTiO/elSUq7mT0PWjLmWP0WM9tbq97MUmX5POP/ODw
 i+R+9CH7J3Ls4fffxWD1s8ZLg9ulxZGMO/YozxpmkoLJSXGOL4n38KSuq
 TL8tdpgEU2Ty7c/pFWJQVjuaTGj+nIzZiuu4sDBBH+yfjvqMGLhldFa4Y Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442331"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442331"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304591"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 00/15] ASoC: SOF: add INTEL_IPC4 plumbing
Date: Thu, 14 Apr 2022 13:48:02 -0500
Message-Id: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
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

Changes since v1:
Removed SKL/KBL code loader and initial hardware support. This will be
re-submitted as a follow-up patchset. The rest of the code is 100%
identical to v1.

Pierre-Louis Bossart (11):
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
  ASoC: SOF: Intel: add IP identifier

Ranjani Sridharan (4):
  ASoC: SOF: Intel: move HDA_CL_STREAM_FORMAT definition to header
  ASoC: SOF: Intel: hda: define check_ipc_irq op
  ASoC: SOF: Intel: hda: Define rom_status_reg in sof_intel_dsp_desc
  ASoC: SOF: Intel: hda: expose some codeloader functions

 include/sound/sof.h                    |  23 ++++-
 sound/soc/sof/amd/acp.h                |   2 +-
 sound/soc/sof/amd/pci-rn.c             |  14 ++-
 sound/soc/sof/amd/renoir.c             |   2 +-
 sound/soc/sof/core.c                   |   6 ++
 sound/soc/sof/debug.c                  |   2 +-
 sound/soc/sof/imx/imx8.c               |  32 +++++--
 sound/soc/sof/imx/imx8m.c              |  16 +++-
 sound/soc/sof/intel/Makefile           |   2 +-
 sound/soc/sof/intel/apl.c              | 107 +++++-----------------
 sound/soc/sof/intel/bdw.c              |  17 +++-
 sound/soc/sof/intel/byt.c              |  48 +++++++---
 sound/soc/sof/intel/cnl.c              | 112 ++++++-----------------
 sound/soc/sof/intel/hda-common-ops.c   | 107 ++++++++++++++++++++++
 sound/soc/sof/intel/hda-loader.c       |  43 ++++-----
 sound/soc/sof/intel/hda.c              |  23 ++++-
 sound/soc/sof/intel/hda.h              |  30 +++++--
 sound/soc/sof/intel/icl.c              | 111 +++++------------------
 sound/soc/sof/intel/pci-apl.c          |  36 ++++++--
 sound/soc/sof/intel/pci-cnl.c          |  54 +++++++++--
 sound/soc/sof/intel/pci-icl.c          |  36 ++++++--
 sound/soc/sof/intel/pci-tgl.c          |  91 +++++++++++++++----
 sound/soc/sof/intel/pci-tng.c          |  17 +++-
 sound/soc/sof/intel/shim.h             |  16 +++-
 sound/soc/sof/intel/tgl.c              | 120 +++++++------------------
 sound/soc/sof/mediatek/mt8195/mt8195.c |  16 +++-
 sound/soc/sof/ops.h                    |   8 ++
 sound/soc/sof/pcm.c                    |   2 +-
 sound/soc/sof/sof-acpi-dev.c           |   6 +-
 sound/soc/sof/sof-audio.c              |   3 +-
 sound/soc/sof/sof-of-dev.c             |   6 +-
 sound/soc/sof/sof-pci-dev.c            |  47 ++++++++--
 32 files changed, 671 insertions(+), 484 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-common-ops.c

-- 
2.30.2

