Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2847E25D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC794181F;
	Thu, 23 Dec 2021 12:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC794181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259448;
	bh=M0IwaPhl3BqiEdRYfE8bly7TbYhb9CatK8IH7aOpS70=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CSQyR1/0+ndoNRe6QrQJmoxEHkE+sUq2jEDrSYrs6vn0zSbGI8Jn6yA6pJ+7l9mBi
	 fo7i7EaXRWjorxCqCnqtWDs3MlvHv4pfmpE6tlnge9lao6S8B3cpyZWElc5Bcx8jOe
	 j8tSLwul132uwAB3KAL3k6ZceDBK76ao7aug9N4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF55F80153;
	Thu, 23 Dec 2021 12:36:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68498F80084; Thu, 23 Dec 2021 12:36:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA9C9F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA9C9F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QEKR6JwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259379; x=1671795379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M0IwaPhl3BqiEdRYfE8bly7TbYhb9CatK8IH7aOpS70=;
 b=QEKR6JwK+EhsYFjtojWZRoUnTSUU5Gl+nW8IeFg9VhWZe/PZ5H82KWCh
 8KMZVZjlHIsOESfYZxQN409uBoUqYR3XFYCRfAqX+9KjeBMpf3EkWWiMo
 +vpdvvKDrho6RaFgbc/2sRsfSyfQXUcSmymz14qLV5FVVeCvgsW07rP2T
 KT6CZEI+UENtaVFmLnGleorvwT39c43saNt5deHJFHcVb/OaF3yDrr/zx
 Q61sPb98aqSZNhyL7h4+zTx4C7SSkMJZ01OHfPlZohpNBrg9fId2zypL4
 mO9SdVkxCO47lDZqVQCaXhVVXkHzM63sMIL6wI6rH24IOiw6rRh0kywVY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180784"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180784"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065028"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:07 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 00/20] ASoC: SOF: Re-visit firmware state and panic
 tracking/handling
Date: Thu, 23 Dec 2021 13:36:08 +0200
Message-Id: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

this series will improve how we are tracking the firmware's state to be able to
avoid communication with it when it is not going to answer due to a panic and
we will attempt to force power cycle the DSP to recover at the next runtime
suspend time.

The state handling brings in other improvements on the way the kernel reports
errors and DSP panics to reduce the printed lines for normal users, but at the
same time allowing developers (or for bug reports) to have more precise
information available to track down the issue.

We can now place messages easily in the correct debug level and not bound to the
static ERROR for some of the print chains, causing excess amount or partial
information to be printed, confusing users and machines (CI).

I would have prefered to split this series up, but it was developed together to
achieve a single goal to reduce the noise, but also provide the details we need
to be able to rootcause issues.

Regards,
Peter
---
Peter Ujfalusi (20):
  ASoC: SOF: ops: Use dev_warn() if the panic offsets differ
  ASoC: SOF: Intel: hda-loader: Avoid re-defining the
    HDA_FW_BOOT_ATTEMPTS
  ASoC: SOF: core: Add simple wrapper to check flags in sof_core_debug
  ASoC: SOF: Use sof_debug_check_flag() instead of sof_core_debug
    directly
  ASoC: SOF: Add 'non_recoverable' parameter to snd_sof_dsp_panic()
  ASoC: SOF: Add a 'message' parameter to snd_sof_dsp_dbg_dump()
  ASoC: SOF: Introduce new firmware state: SOF_FW_CRASHED
  ASoC: SOF: Introduce new firmware state: SOF_FW_BOOT_READY_OK
  ASoC: SOF: Move the definition of enum snd_sof_fw_state to global
    header
  ASoC: SOF: Rename 'enum snd_sof_fw_state' to 'enum sof_fw_state'
  ASoC: SOF: ipc: Only allow sending of an IPC in SOF_FW_BOOT_COMPLETE
    state
  ASoC: SOF: Set SOF_FW_BOOT_FAILED in case we have failure during boot
  ASoC: SOF: pm: Force DSP off on suspend in BOOT_FAILED state also
  ASoc: SOF: core: Update the FW boot state transition diagram
  ASoC: SOF: ops: Always print DSP Panic message but use different
    message
  ASoC: SOF: dsp_arch_ops: add kernel log level parameter for oops and
    stack
  ASoC: SOF: Rename snd_sof_get_status() and add kernel log level
    parameter
  ASoC: SOF: Add clarifying comments for sof_core_debug and DSP dump
    flags
  ASoC: SOF: debug: Use DEBUG log level for optional prints
  ASoC: SOF: Intel: hda: Use DEBUG log level for optional prints

 include/sound/sof.h              |  22 ++++++
 sound/soc/sof/core.c             | 119 +++++++++++++++++++------------
 sound/soc/sof/debug.c            |  35 +++++----
 sound/soc/sof/imx/imx-common.c   |   4 +-
 sound/soc/sof/imx/imx8.c         |   2 +-
 sound/soc/sof/imx/imx8m.c        |   2 +-
 sound/soc/sof/intel/atom.c       |   8 +--
 sound/soc/sof/intel/bdw.c        |   8 +--
 sound/soc/sof/intel/cnl.c        |  21 +++++-
 sound/soc/sof/intel/hda-ipc.c    |  19 ++++-
 sound/soc/sof/intel/hda-loader.c |  24 ++++---
 sound/soc/sof/intel/hda.c        |  20 +++---
 sound/soc/sof/intel/hda.h        |   2 +-
 sound/soc/sof/ipc.c              |   4 +-
 sound/soc/sof/loader.c           |  16 ++---
 sound/soc/sof/ops.c              |  47 ++++++++----
 sound/soc/sof/ops.h              |   4 +-
 sound/soc/sof/pm.c               |  10 +++
 sound/soc/sof/sof-priv.h         |  44 +++++-------
 sound/soc/sof/topology.c         |  12 ++--
 sound/soc/sof/xtensa/core.c      |  44 +++++++-----
 21 files changed, 299 insertions(+), 168 deletions(-)

-- 
2.34.1

