Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE0D10A82
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:02:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D59A16FE;
	Wed,  1 May 2019 18:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D59A16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556726521;
	bh=fS6XV2mxMQcsYZdTrGI9H23kfl014o2ButtJPL1sxxU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kga1yFMbbDkKgfLY80iilH7lPcNTA3C2Lx2e6SUHXV0+5cS65iHeKw+5PhN4/qkMp
	 mrdZu7wmIkcdfzWl0IrMq/xTkYCiyu1gZrn4FMqSaEyMUAStXlTzu+T7eXuqL8rB/j
	 LKlzpJQ7bHmU0XG98mvF1DaGQJbRWnzU9htJx10o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E5CF89730;
	Wed,  1 May 2019 17:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D93ABF896B9; Wed,  1 May 2019 17:58:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBCF4F8075A
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBCF4F8075A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115647"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:23 -0500
Message-Id: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com
Subject: [alsa-devel] [PATCH v4 00/22] soundwire: code cleanup
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SoundWire support will be provided in Linux with the Sound Open
Firmware (SOF) on Intel platforms. Before we start adding the missing
pieces, there are a number of warnings and style issues reported by
checkpatch, cppcheck and Coccinelle that need to be cleaned-up.

Changes since v3:
patch 1,3,4 were merged for 5.2-rc1
No code change, only split patch2 in 21 patches to make Vinod
happy. Each patch only fixes a specific issue. patch 5 is now patch22
and wasn't changed. Not sure why Vinod reported the patch didn't
apply.
Added Takashi's Reviewed-by tag in all patches since the code is
exactly the same as in v3.

Changes since v2:
fixed inversion of devm_kcalloc parameters, detected while rebasing
additional patches.

Changes since v1:
added missing newlines in new patch (suggested by Joe Perches)

Pierre-Louis Bossart (22):
  soundwire: Kconfig: fix help format
  soundwire: fix SPDX license for header files
  soundwire: fix alignment issues in header files
  soundwire: bus: fix alignment issues
  soundwire: bus: fix typos in comments
  soundwire: bus: remove useless parentheses
  soundwire: bus: fix boolean comparisons
  soundwire: bus: remove spurious newline
  soundwire: bus_type: fix alignment issues
  soundwire: mipi_disco: fix alignment issues
  soundwire: mipi_disco: fix boolean comparisons
  soundwire: stream: fix alignment issues
  soundwire: slave: fix alignment issues
  soundwire: intel_init: fix alignment issues
  soundwire: intel: fix alignment issues
  soundwire: intel: protect macro parameters
  soundwire: intel: fix boolean comparison
  soundwire: cadence_master: fix alignment issues
  soundwire: cadence_master: balance parentheses
  soundwire: cadence_master: fix boolean comparisons
  soundwire: cadence_master: remove spurious newline
  soundwire: add missing newlines in dynamic debug logs

 drivers/soundwire/Kconfig          |   2 +-
 drivers/soundwire/bus.c            | 135 ++++++++-------
 drivers/soundwire/bus.h            |  16 +-
 drivers/soundwire/bus_type.c       |   4 +-
 drivers/soundwire/cadence_master.c |  99 +++++------
 drivers/soundwire/cadence_master.h |  22 +--
 drivers/soundwire/intel.c          |  99 ++++++-----
 drivers/soundwire/intel.h          |   4 +-
 drivers/soundwire/intel_init.c     |  12 +-
 drivers/soundwire/mipi_disco.c     | 116 +++++++------
 drivers/soundwire/slave.c          |  10 +-
 drivers/soundwire/stream.c         | 265 +++++++++++++++--------------
 12 files changed, 401 insertions(+), 383 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
