Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7EC88630
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 00:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE2015E0;
	Sat, 10 Aug 2019 00:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE2015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565390740;
	bh=1fS1TD12A+4GrPw3uL4OredbGcnN4HkA+uBqLYo8viA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pAkRPxGPZwHrgTFveEeoa0qMw2uMShh2Woz3ua8fyrUy/+NBgNTvVW/ROP/P0dx3N
	 28yvlRkFiVT5+MuTLW8m1JwF4nVgr1j23KzNcSqaDQfdhtmesJqg+2GX4g6xXdMpso
	 kwAvhaQRbZ+9JMcqXi52NrfiLjg7gakHJAbbfMaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEC0F80483;
	Sat, 10 Aug 2019 00:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618E7F803F3; Sat, 10 Aug 2019 00:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40A55F800E4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 00:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A55F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,367,1559545200"; d="scan'208";a="175279558"
Received: from rmmeyer-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.138.140])
 by fmsmga008.fm.intel.com with ESMTP; 09 Aug 2019 15:43:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 17:43:38 -0500
Message-Id: <20190809224341.15726-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com
Subject: [alsa-devel] [PATCH 0/3] soundwire: debugfs support for 5.4
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

This patchset enables debugfs support and corrects all the feedback
provided on an earlier RFC ('soundwire: updates for 5.4')

There is one remaining hard-coded value in intel.c that will need to
be fixed in a follow-up patchset not specific to debugfs: we need to
remove hard-coded Intel-specific configurations from cadence_master.c
(PDI offsets, etc).

Changes since RFC (Feedback from GKH, Vinod, Guennadi, Cezary, Sanyog):
removed error checks
used DEFINE_SHOW_ATTRIBUTE and seq_file
fixed copyright dates
fixed SPDX license info to use GPL2.0 only
fixed Makefile to include debugfs only if CONFIG_DEBUG_FS is selected
used static inlines for fallback compilation
removed intermediate variables
removed hard-coded constants in loops (used registers offsets and
hardware capabilities)
squashed patch 3

Pierre-Louis Bossart (3):
  soundwire: add debugfs support
  soundwire: cadence_master: add debugfs register dump
  soundwire: intel: add debugfs register dump

 drivers/soundwire/Makefile         |   5 +
 drivers/soundwire/bus.c            |   6 ++
 drivers/soundwire/bus.h            |  24 +++++
 drivers/soundwire/bus_type.c       |   3 +
 drivers/soundwire/cadence_master.c | 104 ++++++++++++++++++++
 drivers/soundwire/cadence_master.h |   2 +
 drivers/soundwire/debugfs.c        | 151 +++++++++++++++++++++++++++++
 drivers/soundwire/intel.c          | 114 ++++++++++++++++++++++
 drivers/soundwire/slave.c          |   1 +
 include/linux/soundwire/sdw.h      |   4 +
 10 files changed, 414 insertions(+)
 create mode 100644 drivers/soundwire/debugfs.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
