Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C010327
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:11:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5518116B6;
	Wed,  1 May 2019 01:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5518116B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556665906;
	bh=BuJjG/PfpjEyvNgIAkIULHP51OBZCb+P8nc0hjcTeG0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BY4sqVRwcBOj9VQloh8xieCCATZoOnhhmYrrHNEhnvVQalHppLpZ0CaIoE1vxc6eB
	 zU9gdSKl3aBy98GRj/6hTOcMohw2X+O0OlSnIY6egbeXk/JtdRrlH9F2UAVFN6oz+g
	 qWX8Fq2lcYIFt12XwWS01tuwEFmalAu6km3i+hwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA5C0F89722;
	Wed,  1 May 2019 01:10:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF867F80C0D; Wed,  1 May 2019 01:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57FEBF80C0D
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57FEBF80C0D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:09:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540860"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:09:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:15 -0500
Message-Id: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/19] ASoC: SOF: improvements for ABI checks
	and Intel code
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This series is a set of relatively small SOF changes after the big
batch merged last week (Thanks!). Since we are very close to the merge
window and in May where most of the world takes time off, it'd be
perfectly understandable if those patches were queued for 5.3, after
feedback and corrections as needed.

First we added optional stricter ABI checks when the firmware,
topology and kernel ABI levels differ, which can happen when patches
are merged at different times on Github. This is mainly for developers
and the Github CI to track disconnects, should they happen despite our
new process to keep evolutions under control. This option has no
impact on the usual problem of updating the kernel without updating
the firmware files.

The Intel changes are mainly
a) fixes for the slave mode suppport
b) clean-ups such as removal of a static index for HDAudio support or
removal of unneeded include file
c) use of a workqueue to defer period elapsed events after the
IPC completion.
d) simplification of the IRQ code
e) fixes to deal with resume on HDaudio links. In the previous
patchset we removed the RESUME_INFO flag but missed the need to
explicitly set the hw_params on resume.
f) a set of routines to dump the Intel IPC registers, mainly for early
platform enablement.

Keyon Jie (7):
  ASoC: SOF: Intel: cnl: add pointer ops to use DPIB position
  ASoC: SOF: PCM: add period_elapsed work to fix race condition in
    interrupt context
  ASoC: SOF: Intel: use snd_sof_pcm_period_elapsed
  ASoC: SOF: ipc: use snd_sof_pcm_period_elapsed
  ASoC: SOF: Intel: hda-ipc: simplify handling of IPC IRQ
  ASoC: SOF: Intel: hda-stream: store stream capabilities
  ASoC: SOF: Intel: hda-stream: handle real stream interrupts only

Pan Xiuli (3):
  ASoC: SOF: IPC: add ipc dump function
  ASoC: SOF: Intel: APL: add ipc dump function
  ASoC: SOF: Intel: CNL: add ipc dump function

Pierre-Louis Bossart (4):
  ASoC: SOF: add Kconfig option for strict ABI checks
  ASOC: SOF: ipc: add support for stricter ABI checks
  ASoC: SOF: topology: add support for stricter ABI checks
  ASoC: SOF: Intel: hda-pcm: remove useless dependency on hdac_ext

Ranjani Sridharan (1):
  ASoC: SOF: intel: hda: add hw_params_upon_resume flag for hda stream

Zhu Yingjiang (4):
  ASoC: SOF: Intel: hda: add the SSP Host Device memory space
  ASoC: SOF: Intel: hda: add SSP info to the chip info struct
  ASoC: SOF: Intel: hda: set I2S slave before enabling DSP
  ASoC: SOF: Intel: hda: set bus->idx as 0

 sound/soc/sof/Kconfig            | 15 ++++++++++
 sound/soc/sof/intel/apl.c        |  4 +++
 sound/soc/sof/intel/cnl.c        | 27 +++++++++++++++---
 sound/soc/sof/intel/hda-bus.c    |  9 ++++--
 sound/soc/sof/intel/hda-dai.c    | 23 +++++++++------
 sound/soc/sof/intel/hda-dsp.c    | 16 +++++++++++
 sound/soc/sof/intel/hda-ipc.c    | 13 ++++-----
 sound/soc/sof/intel/hda-loader.c | 11 ++++++++
 sound/soc/sof/intel/hda-pcm.c    |  1 -
 sound/soc/sof/intel/hda-stream.c | 15 ++++++++--
 sound/soc/sof/intel/hda.c        | 18 ++++++++++++
 sound/soc/sof/intel/hda.h        | 23 +++++++++++++++
 sound/soc/sof/intel/shim.h       |  2 ++
 sound/soc/sof/ipc.c              | 12 +++++++-
 sound/soc/sof/ops.h              | 12 ++++++++
 sound/soc/sof/pcm.c              | 48 ++++++++++++++++++++++++++++++++
 sound/soc/sof/pm.c               |  3 ++
 sound/soc/sof/sof-priv.h         |  5 +++-
 sound/soc/sof/topology.c         | 43 +++++++++++++++++++---------
 19 files changed, 257 insertions(+), 43 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
