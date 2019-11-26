Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4394610A048
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:31:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2B8B16FC;
	Tue, 26 Nov 2019 15:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2B8B16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574778669;
	bh=hveW8VYWNGVRSrNDZzlQDnsxYGDo5tqZs7eaqHhVSZU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pcpie2ZdNmoh6VZ7aw4CdV7dJfnKVmL5nev0kiJ+ngZ8P/+tXeEHM0asyYz3lExo/
	 Kf+/8Q/liMBBVWEvHYBVG+vqAJG/hNwooWwkrBNMkRwwUy9ehPErCRKYuDI1VLU1iW
	 HWXpzp3m+lPsPrtPr2SiKWD7kY2hHL33yExliRqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60CAAF80216;
	Tue, 26 Nov 2019 15:28:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CB2BF80159; Tue, 26 Nov 2019 15:28:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 866E4F800AB
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:28:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 866E4F800AB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="206473446"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.193])
 by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2019 06:28:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 26 Nov 2019 08:28:05 -0600
Message-Id: <20191126142815.21856-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 00/10] ASoC: SOF: initial cleanup for DT and
	multi-client support
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

This series does not add new functionality but introduces a better
code partition to support machine drivers in Device Tree, as well as a
'componentization' of the PCM/topology parts needed for multi-client
support.

This cleanup was merged in the SOF tree and tested extensively with no
regressions identified. Thanks Ranjani and Daniel for combining your
proposals in a single change.

Daniel Baluta (2):
  ASoC: SOF: Make creation of machine device from SOF core optional
  ASoC: SOF: Remove unused drv_name in sof_pdata

Ranjani Sridharan (8):
  ASoC: SOF: topology: remove snd_sof_init_topology()
  ASoC: SOF: core: modify the signature for snd_sof_create_page_table
  ASoC: SOF: core: move check for runtime callbacks to core
  ASoC: SOF: Introduce default_fw_filename member in sof_dev_desc
  ASoC: SOF: partition audio-related parts from SOF core
  ASoC: SOF: intel: hda: Modify signature for hda_codec_probe_bus()
  ASoC: SOF: remove nocodec_fw_filename
  ASoC: SOF: nocodec: Amend arguments for sof_nocodec_setup()

 include/sound/sof.h              |   8 +-
 sound/soc/sof/Makefile           |   2 +-
 sound/soc/sof/control.c          |  55 ++--
 sound/soc/sof/core.c             | 244 +----------------
 sound/soc/sof/intel/apl.c        |   7 +
 sound/soc/sof/intel/bdw.c        |  33 +++
 sound/soc/sof/intel/byt.c        |  45 ++++
 sound/soc/sof/intel/cnl.c        |   7 +
 sound/soc/sof/intel/hda-codec.c  |  16 +-
 sound/soc/sof/intel/hda-dai.c    |   1 +
 sound/soc/sof/intel/hda-pcm.c    |   4 +-
 sound/soc/sof/intel/hda-stream.c |   1 +
 sound/soc/sof/intel/hda.c        | 227 +++++++++-------
 sound/soc/sof/intel/hda.h        |   8 +-
 sound/soc/sof/ipc.c              |  16 +-
 sound/soc/sof/nocodec.c          |  12 -
 sound/soc/sof/ops.h              |  34 +++
 sound/soc/sof/pcm.c              | 131 +++++----
 sound/soc/sof/pm.c               | 219 +--------------
 sound/soc/sof/sof-acpi-dev.c     |  39 +--
 sound/soc/sof/sof-audio.c        | 445 +++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h        | 211 +++++++++++++++
 sound/soc/sof/sof-of-dev.c       |  24 +-
 sound/soc/sof/sof-pci-dev.c      |  47 +---
 sound/soc/sof/sof-priv.h         | 202 +-------------
 sound/soc/sof/topology.c         | 374 +++++++++++++-------------
 sound/soc/sof/trace.c            |   4 +-
 sound/soc/sof/utils.c            |  60 +++++
 28 files changed, 1321 insertions(+), 1155 deletions(-)
 create mode 100644 sound/soc/sof/sof-audio.c
 create mode 100644 sound/soc/sof/sof-audio.h

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
