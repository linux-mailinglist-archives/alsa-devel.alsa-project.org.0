Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03D8ABB7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 02:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A5E1662;
	Tue, 13 Aug 2019 02:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A5E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565654506;
	bh=1PYsbg8V0AnyqI0n9+r8ly2/snGoKlRV65IyHiuAIcU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XuzCH2qUOkLF97RwGxsH+/C4u9v4aOvRO7B2sWXFog5wqrZqjONArHs5+62gfyPin
	 rexEWGmuhINOdWrJEovtoaldBCmXCYCZJnfuMBJdEQYXyVYK+0O3aVyKE5V9BEX3bc
	 JouZQORm7gPHGOlruZVvGQloVvcQ+geoe+WLbmDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D91F80213;
	Tue, 13 Aug 2019 02:00:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47FC9F801EB; Tue, 13 Aug 2019 01:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD36CF8015B
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:59:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD36CF8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 16:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,379,1559545200"; d="scan'208";a="177639013"
Received: from firin-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.205.59])
 by fmsmga007.fm.intel.com with ESMTP; 12 Aug 2019 16:59:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 12 Aug 2019 18:59:39 -0500
Message-Id: <20190812235942.7120-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com
Subject: [alsa-devel] [PATCH v2 0/3] soundwire: debugfs support for 5.4
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

Changes since v1 (Feedback from GKH)
Handle debugfs in a more self-contained way (no dentry as return or parameter)
Used CONFIG_DEBUG_FS in structures and code to make it easier to
remove if need be.
No functional change for register dumps.

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

 drivers/soundwire/Makefile         |   4 +
 drivers/soundwire/bus.c            |   6 ++
 drivers/soundwire/bus.h            |  16 +++
 drivers/soundwire/bus_type.c       |   3 +
 drivers/soundwire/cadence_master.c | 107 ++++++++++++++++++++
 drivers/soundwire/cadence_master.h |   4 +
 drivers/soundwire/debugfs.c        | 151 +++++++++++++++++++++++++++++
 drivers/soundwire/intel.c          | 121 +++++++++++++++++++++++
 drivers/soundwire/slave.c          |   1 +
 include/linux/soundwire/sdw.h      |   8 ++
 10 files changed, 421 insertions(+)
 create mode 100644 drivers/soundwire/debugfs.c

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
