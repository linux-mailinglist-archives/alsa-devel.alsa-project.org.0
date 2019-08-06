Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EDE828ED
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 02:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56F82167E;
	Tue,  6 Aug 2019 02:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56F82167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053040;
	bh=QIeaAuY0rOb6khBJGhM6VWSfadKsZYKNLTOFyizBhoY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oJ28ZKn4MMTydlNXOX4q/cORZmrPbRLf7nmEkwVRGh/1MPzRGDuvcJI5Mx256yK4r
	 smj3jNqzx7kcMbbD7igrR7TtLDHDL3kTCvOgL8QOWdoDZgsg7XOOhGDVOdzhDyL7VQ
	 CjjGbRECz5fD1Kvgcj6ZzWpydG6eYSu82syV7FgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A346FF80535;
	Tue,  6 Aug 2019 02:55:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AC9AF80534; Tue,  6 Aug 2019 02:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01ECAF800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01ECAF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153100"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:05 -0500
Message-Id: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>
Subject: [alsa-devel] [PATCH 00/17] soundwire: fixes for 5.4
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

This series provides an update on the initial RFC. Debugfs and Intel
updates will be provided in follow-up patches. The order of patches
was changed since the RFC so detailed change logs are provided below.

Changes since RFC:

patch1: feedback from Vinod and Cezary
use local variable to reduce number of de-references
document that first argument is mandatory

patch2: feedback from Vinod
document that the work-around is required for all existing controllers

patch 3: feedback from Vinod
clarify comment that MCP_INT_IRQ ungates all other settings.
use MCP_INT_SLAVE_MASK instead of all individual settings ORed.

Patch 4: feedback from Vinod:
demote dynamic debug log to dev_dbg (was dev_err)

patch5:
clarify commit message that the helpers will be used in the Cadence
parts as well.

patch 6: feedback from Vinod
s/BIOS/firmware
remove magic numbers, introduce macros

patch 7:
add kbuild warning message in commit message

patch 8:
no change

patch 9: feedback from Guennadi
remove unnecessary initializations

patch 10/11/12: feedback from Vinod
split initial patch in 3 (prototype, Intel, Cadence)
add explanations on what mclk_freq is in commit messages
remove pr_err logs missed in RFC

patch 13: feedback from Bard
remove unecessary reads before update

patch 14:
no change

patch 15:
update commit message

patch 16:
update commit message
remove unnecessary dynamic debug log

patch 17:
no change

Bard liao (1):
  soundwire: include mod_devicetable.h to avoid compiling warnings

Pierre-Louis Bossart (15):
  soundwire: intel: prevent possible dereference in hw_params
  soundwire: intel: fix channel number reported by hardware
  soundwire: cadence_master: revisit interrupt settings
  soundwire: bus: improve dynamic debug comments for enumeration
  soundwire: export helpers to find row and column values
  soundwire: cadence_master: use firmware defaults for frame shape
  soundwire: stream: fix disable sequence
  soundwire: stream: remove unnecessary variable initializations
  soundwire: add new mclk_freq field for properties
  soundwire: intel: read mclk_freq property from firmware
  soundwire: cadence_master: make use of mclk_freq property
  soundwire: intel: handle disabled links
  soundwire: intel_init: add kernel module parameter to filter out links
  soundwire: cadence_master: add kernel parameter to override interrupt
    mask
  soundwire: intel: move shutdown() callback and don't export symbol

Rander Wang (1):
  soundwire: cadence_master: fix divider setting in clock register

 drivers/soundwire/bus.c             |   5 +-
 drivers/soundwire/bus.h             |   7 +-
 drivers/soundwire/cadence_master.c  | 102 +++++++++++++++++++---------
 drivers/soundwire/cadence_master.h  |   2 -
 drivers/soundwire/intel.c           |  83 ++++++++++++++++++++--
 drivers/soundwire/intel_init.c      |  11 +++
 drivers/soundwire/stream.c          |  93 ++++++++++++++++---------
 include/linux/soundwire/sdw.h       |   6 ++
 include/linux/soundwire/sdw_intel.h |   1 +
 9 files changed, 236 insertions(+), 74 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
