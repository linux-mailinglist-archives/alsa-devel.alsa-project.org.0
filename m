Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FC983E1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 21:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87F815E2;
	Wed, 21 Aug 2019 20:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87F815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566414031;
	bh=gRdn5wSAR9KtDZOw0S3Vbo3hhvqjgv4A45RdbY9YwAU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SRDQdDpk7pTYFzuGYYwO03ObWb3zxN4hk6cBAG2PE7kX8rIIWUtHlkjoNeH9tZAM+
	 v9GTXW6ZH6+Cz3rNIeM2AI+XcTXHy/ICSrxRWcM8nTvhKfzXCCCTh7daCqpXDzE2g6
	 N3MZ3RsN4Sx5/Vy7w9mGJR9IqHl0wCsahDBSpjso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F3DAF80306;
	Wed, 21 Aug 2019 20:58:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E81D3F80322; Wed, 21 Aug 2019 20:58:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89EFBF802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 20:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89EFBF802E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 11:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="262586595"
Received: from dbarua-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.252.198.189])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2019 11:58:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 13:58:17 -0500
Message-Id: <20190821185821.12690-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 0/4] soundwire: debugfs support for 5.4
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

Changes since v2:
No code change, just rebase to soundwire/next
Added GKH and Sanyog's tags 
Also added patch4 submitted earlier in another series which depends on
debugfs

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

Pierre-Louis Bossart (4):
  soundwire: add debugfs support
  soundwire: cadence_master: add debugfs register dump
  soundwire: intel: add debugfs register dump
  soundwire: intel: handle disabled links

 drivers/soundwire/Makefile         |   4 +
 drivers/soundwire/bus.c            |   6 ++
 drivers/soundwire/bus.h            |  16 +++
 drivers/soundwire/bus_type.c       |   3 +
 drivers/soundwire/cadence_master.c | 107 ++++++++++++++++++++
 drivers/soundwire/cadence_master.h |   4 +
 drivers/soundwire/debugfs.c        | 151 +++++++++++++++++++++++++++++
 drivers/soundwire/intel.c          | 145 ++++++++++++++++++++++++++-
 drivers/soundwire/slave.c          |   1 +
 include/linux/soundwire/sdw.h      |  10 ++
 10 files changed, 444 insertions(+), 3 deletions(-)
 create mode 100644 drivers/soundwire/debugfs.c


base-commit: 183c7687802e4132eb782808a8bf80689a9219c1
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
