Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ECC2FB2A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2019 13:52:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B38A615E0;
	Thu, 30 May 2019 13:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B38A615E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559217147;
	bh=QUwQwEliL1ZL5bWj5f6zg4S881lFgDpkvVDy9Dd45Sc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HLGwMKKBlRHCNwyqDploHkVKYsdOSJbnvj3CRg2MFBEzmhAq9G3DLEKGmrqmgfm8k
	 9QSptR34nMsiFKAWLf+gYPRfMjg6e7Qc2aMKJjZdFEhj3W2L2ynizgJGysriqMbdTp
	 uW75OhqvVFEKhzQnXUFv0uriRxMu6zmgYJ2Kh2wM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF97CF896F8;
	Thu, 30 May 2019 13:50:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E82DF89706; Thu, 30 May 2019 13:50:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7045EF8065A
 for <alsa-devel@alsa-project.org>; Thu, 30 May 2019 13:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7045EF8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 May 2019 04:50:33 -0700
X-ExtLoop1: 1
Received: from rjcavan-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.141.25])
 by FMSMGA003.fm.intel.com with ESMTP; 30 May 2019 04:50:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 30 May 2019 06:50:10 -0500
Message-Id: <20190530115015.5677-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/5] ASoC: Intel: fix
	cross-compilation/COMPILE_TEST issues
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

The Intel code has dependencies that aren't defined on all platforms
and prevent COMPILE_TEST from working.

The first patch was submitted as an RFC and includes Takashi
Reviewed-by tag. The second patch was submitted by Randy Dunlap, I
only corrected minor issues to make it more generic. The rest are just
simple fixes to remove useless asm/ headers, make sure all machine
drivers use COMPILE_TEST and add dependencies on CONFIG_PCI to let the
SOF code support COMPILE_TEST.

Tested for the following ARCH: x86_64, i386, ia64, arm, arm64, sh,
mips, openrisc, sparc, m68k, s390

Pierre-Louis Bossart (4):
  ASoC: Intel: use common helpers to detect CPUs
  ASoC: Intel: boards: remove dependency on asm/platform_sst_audio.h
  ASoC: Intel: boards: Add COMPILE_TEST for new machine drivers
  ASoC: SOF: add COMPILE_TEST for PCI options

Randy Dunlap (1):
  ASoc: fix sound/soc/intel/skylake/slk-ssp-clk.c build error on IA64

 sound/soc/intel/Kconfig                       |   9 ++
 sound/soc/intel/atom/sst/sst_acpi.c           |  65 +---------
 sound/soc/intel/boards/Kconfig                |   7 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  11 +-
 sound/soc/intel/boards/bytcht_cx2072x.c       |   1 -
 sound/soc/intel/boards/bytcht_da7213.c        |   1 -
 sound/soc/intel/boards/bytcht_es8316.c        |  13 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |  16 +--
 sound/soc/intel/boards/bytcr_rt5651.c         |  17 +--
 sound/soc/intel/boards/cht_bsw_rt5645.c       |  16 +--
 sound/soc/intel/boards/sof_rt5682.c           |  11 +-
 sound/soc/intel/common/soc-intel-quirks.h     | 115 ++++++++++++++++++
 sound/soc/sof/Kconfig                         |   2 +-
 sound/soc/sof/intel/hda.c                     |  13 +-
 sound/soc/sof/sof-acpi-dev.c                  |  57 +--------
 sound/soc/sof/sof-pci-dev.c                   |   4 +
 16 files changed, 164 insertions(+), 194 deletions(-)
 create mode 100644 sound/soc/intel/common/soc-intel-quirks.h

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
