Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE27334C4
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:20:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7581689;
	Mon,  3 Jun 2019 18:19:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7581689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559578820;
	bh=yhdOf3L+0qOU5FNupZBazCM3hDcHRV5psgefmB0OCCA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fi57g00rEQJxqC9gBdMVJ5Y+CYc8hRLlOM+h/sOCfsewm1Xz3nug1hU8I0Ejt+5mn
	 qR5OMYor4l5hmTIsvT1w6gPbEOn0pb0I5lGTd7QkI9drmGFo+aUEld0GegJhJSOtAF
	 T8/U1YZQZgf3OpcZ68IzYOr4CJOTtSbJjDN0FtL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F23ADF896CE;
	Mon,  3 Jun 2019 18:18:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9973BF80CC4; Mon,  3 Jun 2019 18:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1632F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1632F80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:18:27 -0700
X-ExtLoop1: 1
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2019 09:18:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:18:12 -0500
Message-Id: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/9] ASoC: SOF: new functionality with MINOR
	ABI changes
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

The first patches are to align with firmware, we unfortunately had a
couple of misses before the new ABI change process was introduced [1].

The new functionality added after the initial cleanup is:

1. sending the kernel time to firmware so that the trace logs use the
same base across suspend-resume cycles.

2. introducing an IPC flood mechanism which already helped harden the
IPC sequences, be it with QEMU or on real hardware.

3. support for mux/demux component

4. initial SoundWire support

This patchset is independent from the IPC changes submitted on
alsa-devel, but will only apply if previous trace related changes are
applied. ([PATCH 3/5] ASoC: SOF: trace: move to opt-in with Kconfig
and module parameter)

[1] https://github.com/orgs/thesofproject/projects/2


Bard liao (1):
  ASoC: SOF: send time stamp to FW for alignment

Jaska Uimonen (1):
  ASoC: SOF: topology: add support for mux/demux component

Kai Vehmanen (1):
  ASoC: SOF: fix DSP oops definitions in FW ABI

Pan Xiuli (1):
  ASoC: SOF: soundwire: add initial soundwire support

Pierre-Louis Bossart (2):
  ASoC: SOF: uapi: mirror firmware changes
  ASoC: SOF: bump to ABI 3.6

Ranjani Sridharan (3):
  ASoC: SOF: add mode parameter for snd_sof_debugfs_buf_item
  ASoC: SOF: ipc: Introduce SOF_IPC_GLB_TEST_MSG IPC command
  ASoC: SOF: debug: add new debugfs entries for IPC flood test

 include/sound/sof/dai.h      |   1 +
 include/sound/sof/header.h   |  30 ++++-
 include/sound/sof/topology.h |   3 +
 include/sound/sof/trace.h    |  10 ++
 include/sound/sof/xtensa.h   |   9 +-
 include/uapi/sound/sof/abi.h |   2 +-
 sound/soc/sof/Kconfig        |   8 ++
 sound/soc/sof/debug.c        | 247 ++++++++++++++++++++++++++++++++++-
 sound/soc/sof/intel/bdw.c    |  17 ++-
 sound/soc/sof/intel/byt.c    |  15 ++-
 sound/soc/sof/intel/hda.c    |  16 ++-
 sound/soc/sof/ipc.c          |   9 ++
 sound/soc/sof/loader.c       |   4 +-
 sound/soc/sof/sof-priv.h     |   8 +-
 sound/soc/sof/topology.c     |   2 +
 sound/soc/sof/trace.c        |  16 ++-
 sound/soc/sof/xtensa/core.c  |   2 +-
 17 files changed, 366 insertions(+), 33 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
