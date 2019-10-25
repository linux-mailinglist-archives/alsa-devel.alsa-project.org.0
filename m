Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E0E568D
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4810218DA;
	Sat, 26 Oct 2019 00:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4810218DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043410;
	bh=AByIvX/JF+KwewRMCxh4q1nUDFaQwzVKzg9+NZK+eLc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ui6cRAYKthEdjDd/mbkgAHbRyA/cBUZJbg23bGQXECq+XG/HN1XIjrMPessiIJ/Ff
	 tYYTKXSeXrOvVlpYj0IsjuKZOd95NHyVrRPX3N3e3bdS7Ytoh9R95JPJGrUgW0V1RI
	 jpG0osWgm3nO6anHHWG+I3++d7x0WVEOrzs/FhA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D06F805FF;
	Sat, 26 Oct 2019 00:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2429FF803D7; Sat, 26 Oct 2019 00:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C753DF802A0
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C753DF802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458173"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:40:56 -0500
Message-Id: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/26] ASoC: SOF: enable S0ix support for Intel
	platforms
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

In S0ix (aka S0 Idle), the audio DSP can enter the D0i3 substate and
keep some of the pipelines and processing active for e.g. Hotwording
and other acoustic event detection while optimizing power
consumption. This patchset mainly adds flags and state machines to
track which streams may remain active (tagged as such in the topology
file), and keep them active when the ALSA core tries to suspend
everything.

The Intel specific parts are limited to the changes in the IPC, where
instead of using an SRAM window, the IPC commands needed to enter and
exit D0i3 are sent in a compressed form using IPC registers
themselves.

This patchset is made of 26 patches, which is rather large, but each
change is rather small and contained. The code was initially reviewed
on GitHub, with 165+ comments provided and no regressions found
[1]. The S0ix mode was tested on a CometLake platform.

Future improvements will consist in an additional idle detection so
that the D0i3 mode can be entered even on devices where S0ix is not
enabled.

[1] https://github.com/thesofproject/linux/pull/1337

Keyon Jie (26):
  ASoC: SOF: add a field to store the current D0 substate of DSP
  ASoC: SOF: reset default d0_substate at probe() and resume()
  ASoC: SOF: add set_power_state() to dsp_ops for power state update
  ASoC: SOF: Intel: hda-dsp: Add helper for setting DSP D0ix substate
  ASoC: SOF: Intel: CNL: add set_power_state() ops
  ASoC: SOF: Intel: APL: add set_power_state() ops
  ASoC: SOF: add flag to snd_sof_pcm_stream for D0i3 compatible stream
  ASoC: SOF: token: add tokens for PCM compatible with D0i3 substate
  ASoC: SOF: topology: parse and store d0i3_compatible flag
  ASoC: SOF: Intel: hda-dsp: align the comments for D0I3C update
  ASoC: SOF: Intel: HDA: use macro for register polling retry count
  ASoC: SOF: PM: rename sof_send_pm_ipc to sof_send_pm_ctx_ipc
  ASoC: SOF: ipc: introduce message for DSP power gating
  ASoC: SOF: Intel: hda-ipc: Don't read mailbox for PM_GATE reply
  ASoC: SOF: Intel: HDA: add cAVS specific compact IPC header file
  ASoC: SOF: configure D0ix IPC flags in set_power_state
  ASoC: SOF: PM: add helpers for setting D0 substate for ADSP
  ASoC: SOF: Intel: CNL: add support for sending compact IPC
  ASoC: SOF: add a flag to indicate the system suspend target
  ASoC: SOF: add a flag suspend_ignored for sof stream
  ASoC: SOF: PM: implement prepare/complete callbacks
  ASoC: SOF: ignore suspend/resume for D0ix compatible streams
  ASoC: SOF: Intel: hda-dsp: implement suspend/resume for S0ix<->S0
    transition
  ASoC: SOF: return -ENOTSUPP if D0I3 is not supported
  ASoC: SOF: PM: Add support for DSP D0i3 state when entering S0ix
  ASoC: SOF: pci: Add prepare/complete PM callbacks

 include/sound/sof/header.h      |  1 +
 include/sound/sof/pm.h          |  8 +++
 include/uapi/sound/sof/tokens.h |  4 ++
 sound/soc/sof/core.c            |  3 ++
 sound/soc/sof/intel/apl.c       |  1 +
 sound/soc/sof/intel/cnl.c       | 43 +++++++++++++--
 sound/soc/sof/intel/hda-dsp.c   | 91 +++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda-ipc.c   |  6 ++-
 sound/soc/sof/intel/hda-ipc.h   | 51 ++++++++++++++++++
 sound/soc/sof/intel/hda.h       | 12 +++++
 sound/soc/sof/ops.h             | 10 ++++
 sound/soc/sof/pcm.c             | 31 +++++++++++
 sound/soc/sof/pm.c              | 95 +++++++++++++++++++++++++++++++--
 sound/soc/sof/sof-pci-dev.c     |  2 +
 sound/soc/sof/sof-priv.h        | 23 ++++++++
 sound/soc/sof/topology.c        | 43 ++++++++++++++-
 16 files changed, 413 insertions(+), 11 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-ipc.h

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
