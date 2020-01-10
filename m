Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90576137A66
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 01:00:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D8816B5;
	Sat, 11 Jan 2020 00:59:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D8816B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578700800;
	bh=ufedfE6Xbs+XrqzY34D/JJlijrg2Bpfce7Hh4b4PAqs=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FevZDxMCOfYc74MDEfIYuGkxnxbaXy30G24x1r/xG/LHvGk2huWmuaMJy5pmuCGR9
	 vsDsRzUzjYJN5IeQs60ZYqHna7YKEXB/cNOiSKbrj0SmYFfyEHzg73d9QAf6B61XvC
	 GWmFQawSoXczADEyGU+LKm9wtotsgxLYPcF+x7wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 360F8F80130;
	Sat, 11 Jan 2020 00:58:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C92DF800E4; Sat, 11 Jan 2020 00:58:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC300F800E4
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 00:58:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC300F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 15:58:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="224345288"
Received: from jrderube-mobl5.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.251])
 by orsmga003.jf.intel.com with ESMTP; 10 Jan 2020 15:58:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 17:57:43 -0600
Message-Id: <20200110235751.3404-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/8] ASOC: SOF: Intel: improvements for
	Broadwell, HDA, OSS
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

This patchset provides general improvements for SOF on Intel
platforms.

First we have good support for SOF on Broadwell now (DMA and stability
issues seem to be being us). The legacy driver remains the
recommendation until UCM and topologies are provided downstream, but
this is promising.

Kai also fixed a couple of user-reported bugs for HDaudio/HDMI support
when external graphics are enabled, and OSS emulation. Additional work
is needed for the case where the Intel internal graphics solution is
disabled.

Also included a change on error logs which apparently made some users
nervous.

Bard liao (1):
  ASoC: SOF: Intel: lower print level to dbg if we will reinit DSP

Kai Vehmanen (3):
  ASoC: SOF: fix PCM playback through ALSA OSS emulation
  ASoC: SOF: Intel: fix HDA codec driver probe with multiple controllers
  ASoC: hdac_hda: Fix error in driver removal after failed probe

Pan Xiuli (1):
  ASoC: Intel: broadwell: change cpu_dai and platform components for SOF

Pierre-Louis Bossart (3):
  ASoC: Intel: bdw-rt5677: fix Kconfig dependencies
  ASoC: Intel: bdw-rt5677: change cpu_dai and platform components for
    SOF
  ASoC: Intel: bdw-rt5650: change cpu_dai and platform components for
    SOF

 sound/soc/codecs/hdac_hda.c         |  4 ++-
 sound/soc/intel/boards/Kconfig      |  3 ++
 sound/soc/intel/boards/bdw-rt5650.c | 10 +++++-
 sound/soc/intel/boards/bdw-rt5677.c | 10 +++++-
 sound/soc/intel/boards/broadwell.c  | 10 +++++-
 sound/soc/sof/intel/hda-codec.c     | 19 +++++++----
 sound/soc/sof/intel/hda-loader.c    |  6 ++--
 sound/soc/sof/pcm.c                 | 53 +++++++++++++++++------------
 8 files changed, 79 insertions(+), 36 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
