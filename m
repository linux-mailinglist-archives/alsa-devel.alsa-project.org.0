Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F66C0C5E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 156B6166E;
	Fri, 27 Sep 2019 22:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 156B6166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569614868;
	bh=C2XiA2NXuO8foVehqXBMn+4XVe0Gz9RkbrCmJYkN2uc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oyIMeNj+0CgGSNZUr8e8Gmtq6wP4obbMG8YnPeE7+daI7JmLMKDsdESCF5Pcdm08k
	 5HTTbG5oRM9NBwU/DiJelf2hNug5JJv64F5py2pQCo+AFMHjRZcfd1BYftj6LyOnHS
	 O1Lk6jFkdFwPNx3tgZu4XAiekJbP/f8dYG+0pD6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52133F8044C;
	Fri, 27 Sep 2019 22:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD11F8049C; Fri, 27 Sep 2019 22:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19B29F80140
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19B29F80140
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="190444246"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by fmsmga007.fm.intel.com with ESMTP; 27 Sep 2019 13:05:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:05:25 -0500
Message-Id: <20190927200538.660-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/13] ASoC: SOF: fixes and improvements
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

No new features in this patchset but fixes and improvements identified
during validation/product hardening/SoundWire development.

I realize we are at the end of the merge window so will let
Takashi/Mark decide if this series can be provided as fixes for v5.4
or queued for later.

Kai Vehmanen (2):
  ASoC: SOF: pcm: fix resource leak in hw_free
  ASoC: SOF: Intel: hda: fix warnings during FW load

Keyon Jie (1):
  ASoC: SOF: topology: fix parse fail issue for byte/bool tuple types

Liam Girdwood (3):
  ASoC: SOF: ipc: retain DSP context after FW exception.
  ASoC: SOF: Intel: initialise and verify FW crash dump data.
  ASoC: SOF: Intel: Add context data to any IPC timeout.

Marcin Rajwa (2):
  ASoC: SOF: ipc: introduce no_stream_position in sof_ipc_stream_params
    struct
  ASoC: SOF: Intel: hda: fix reset of host_period_bytes

Pan Xiuli (1):
  ASoC: SOF: pcm: harden PCM STOP sequence

Pierre-Louis Bossart (2):
  ASoC: SOF: loader: fix kernel oops on firmware boot failure
  ASoC: SOF: trace: move to opt-in with Kconfig and module parameter

Ranjani Sridharan (2):
  ASoC: SOF: core: check for mandatory fw_ready op during SOF probe
  ASoC: SOF: Intel: hda: Disable DMI L1 entry during capture

 include/sound/sof/stream.h       |  4 +--
 sound/soc/sof/Kconfig            | 16 ++++++++++++
 sound/soc/sof/core.c             | 28 +++++++++++++++-----
 sound/soc/sof/debug.c            | 16 ++++++++++++
 sound/soc/sof/intel/Kconfig      | 10 +++++++
 sound/soc/sof/intel/bdw.c        | 29 +++++++++++++++++++-
 sound/soc/sof/intel/byt.c        | 29 +++++++++++++++++++-
 sound/soc/sof/intel/hda-ctrl.c   | 12 +++------
 sound/soc/sof/intel/hda-loader.c |  1 +
 sound/soc/sof/intel/hda-pcm.c    | 15 ++++++++---
 sound/soc/sof/intel/hda-stream.c | 45 +++++++++++++++++++++++++++-----
 sound/soc/sof/intel/hda.c        |  7 +++++
 sound/soc/sof/intel/hda.h        |  5 +++-
 sound/soc/sof/ipc.c              | 10 +------
 sound/soc/sof/loader.c           |  4 +--
 sound/soc/sof/pcm.c              | 35 +++++++++++++++++--------
 sound/soc/sof/sof-priv.h         | 17 ++++++++----
 sound/soc/sof/topology.c         |  4 ++-
 sound/soc/sof/trace.c            | 17 +++++++++++-
 19 files changed, 245 insertions(+), 59 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
