Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F770201
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:15:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC78F17F9;
	Mon, 22 Jul 2019 16:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC78F17F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563804911;
	bh=Af7QqkN7X96aWJQ0aKLSOdlt2WrzGJGzp+zJoUfcosE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pZIsXdDY/lhavpu5F8KHdgR8mEpi36bz8sj9BwLZmzJUptuy2D5zX0t37Z53o2lhZ
	 HJPhl/O/yxuyK+ARTc8abpVp59AQSNxuiGniIjOnbQbvSEYNr5BSKa5Cjz5FEoHplv
	 HJDTpcE2ekP1tjvwVeF1CpD422x5wZ0rANkQk8mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB3D6F803D5;
	Mon, 22 Jul 2019 16:14:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 323D1F800E8; Mon, 22 Jul 2019 16:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33BE7F800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33BE7F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733269"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:41 -0500
Message-Id: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/21] ASoC: SOF: updates for 5.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Core updates for runtime-pm, loader extensions for i.MX support,
increased timeouts for QEMU tests and state machine fixes to make
PulseAudio happy.

I included in the same set Intel HDaudio patches, mostly about code
refactoring, jack detection and robustness improvements for IPC/DMA
handling. If Mark/Takashi prefer separate patchsets for core and Intel
stuff I can split the two.

This is a rather large set mostly due to Summer vacations and a peak
of product validation earlier in Q2, I expect more frequent/smaller
updates moving forward. We also have quite a few SoundWire-related
patches but they aren't strictly related to SOF.

Comments and feedback welcome!

Daniel Baluta (3):
  ASoC: SOF: Introduce snd_sof_dsp_get_bar_index ops
  ASoC: SOF: loader: Use the BAR provided by FW
  ASoC: SOF: loader: Don't ignore SRAM block types

Fred Oh (1):
  ASoC: SOF: remove unused state variable in suspend function

Guennadi Liakhovetski (1):
  ASoC: SOF: Intel: hda: add a parameter to disable MSI

Janusz Jankowski (1):
  ASoC: SOF: Intel: ssp: BCLK delay parameter

Kai Vehmanen (6):
  ASoC: SOF: reset DMA state in prepare
  ASoC: SOF: use common code to send PCM_FREE IPC
  ASoC: SOF: ipc: use timeout configured at probe
  ASoC: SOF: core: increase default IPC timeouts
  ASoC: SOF: Intel: hda: reset link DMA state in prepare
  ASoC: SOF: Intel: hda: remove misleading error trace from IRQ thread

Keyon Jie (1):
  ASoC: SOF: Intel: hda: correct ROM state mask

Pan Xiuli (1):
  ASoC: SOF: pci: mark last_busy value at runtime PM init

Rander Wang (4):
  ASoC: SOF: Intel: hda: reduce ifdef usage for hda
  ASoC: SOF: Intel: hda: Enable jack detection
  ASoC: SOF: Intel: hda: fix link DMA config
  ASoC: SOF: Intel: hda: fix stream id setting

Zhu Yingjiang (3):
  ASoC: SOF: Intel: hda: set position buffer in init chip
  ASoC: SOF: Intel: hda: use SOF defined init chip in resume
  ASoC: SOF: Intel: hda: remove duplicated clear WAKESTS

 include/sound/sof/dai-intel.h   |   3 +
 include/uapi/sound/sof/abi.h    |   2 +-
 include/uapi/sound/sof/tokens.h |   1 +
 sound/soc/sof/core.c            |   4 +-
 sound/soc/sof/intel/cnl.c       |   4 +-
 sound/soc/sof/intel/hda-codec.c |  44 +++++++++++++-
 sound/soc/sof/intel/hda-ctrl.c  |  21 ++++---
 sound/soc/sof/intel/hda-dai.c   |  38 +++++++-----
 sound/soc/sof/intel/hda-dsp.c   | 100 +++++++++++---------------------
 sound/soc/sof/intel/hda-ipc.c   |   4 +-
 sound/soc/sof/intel/hda.c       |  28 +++++----
 sound/soc/sof/intel/hda.h       |   9 +--
 sound/soc/sof/ipc.c             |   8 +--
 sound/soc/sof/loader.c          |  14 ++++-
 sound/soc/sof/ops.h             |  28 +++++++--
 sound/soc/sof/pcm.c             |  63 ++++++++++----------
 sound/soc/sof/pm.c              |   6 +-
 sound/soc/sof/sof-pci-dev.c     |   3 +
 sound/soc/sof/sof-priv.h        |  12 ++--
 sound/soc/sof/topology.c        |   3 +
 20 files changed, 229 insertions(+), 166 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
