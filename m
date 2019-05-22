Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4326E7F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 21:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F6C1616;
	Wed, 22 May 2019 21:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F6C1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558554619;
	bh=ag4brwLz8OnOzo4LqZKDXMip2GnBZspWelXdwJGKHkE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oH0qERZsxGjh4PgqOP8+Zg798S0qSYEl8CQwtv3nm2oV5U91rBH9S6PnFRmoSG+Ix
	 5rjvhBDCbjS+0HUI53jqxY8/450t5JANtBjId7lE33VF3le6P0vs2JNr0NCnjfVzPG
	 h/4Hmkuz4Gkgw510fHjsSiS+trbwTBRfDWUr7g/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9975F8962C;
	Wed, 22 May 2019 21:47:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91957F8963E; Wed, 22 May 2019 21:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D12F9F8962C
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 21:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D12F9F8962C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 12:47:47 -0700
X-ExtLoop1: 1
Received: from cjpowell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.154.39])
 by fmsmga008.fm.intel.com with ESMTP; 22 May 2019 12:47:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 14:47:16 -0500
Message-Id: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com
Subject: [alsa-devel] [PATCH v2 00/15] soundwire: corrections to
	ACPI/DisCo/Intel support
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

Now that we are done with cleanups, we can start fixing the code with
actual semantic or functional changes.

This patchset corrects issues with Intel BIOS and hardware properties
that prevented a successful init, aligns the code with the MIPI DisCo
spec, adds rate-limiting for frequent errors and adds checks on number
of links and PDIs.

With all these changes, the hardware can be initialized correctly and
modules can be added/removed without issues on WhiskyLake and
IceLake.

Parts of this code was initially written by my Intel colleagues Vinod
Koul, Sanyog Kale, Shreyas Nc and Hardik Shah, who are either no
longer with Intel or no longer involved in SoundWire development. When
relevant, I explictly added a note in commit messages to give them
credit for their hard work, but I removed their signed-off-by tags to
avoid email bounces and avoid spamming them forever with SoundWire
patches.

Changes since v2:
Feedback from Vinod:
1. improve the SoundWire controller search without magic values
2. split patches as needed
Other additions
rate-limiting to avoid flooding dmesg logs
provide better Slave status on errors
more checks on links and PDIs

Pierre-Louis Bossart (15):
  soundwire: intel: filter SoundWire controller device search
  soundwire: mipi_disco: fix master/link error
  soundwire: add port-related definitions
  soundwire: remove master data port properties
  soundwire: mipi-disco: remove master_count property for masters
  soundwire: rename 'freq' fields
  soundwire: mipi-disco: fix clock stop modes
  soundwire: clarify comment
  soundwire: rename/clarify MIPI DisCo properties
  soundwire: cadence_master: use rate_limited dynamic debug
  soundwire: cadence_master: log Slave status mask on errors
  soundwire: cadence_master: check the number of bidir PDIs
  soundwire: Intel: add log for number of PCM and PDM PDIs
  soundwire: fix typo in comments
  soundwire: intel_init: add checks on link numbers

 drivers/soundwire/bus.c            |  6 +-
 drivers/soundwire/cadence_master.c | 29 +++++-----
 drivers/soundwire/intel.c          | 17 ++++--
 drivers/soundwire/intel.h          |  2 +-
 drivers/soundwire/intel_init.c     | 25 ++++++++-
 drivers/soundwire/mipi_disco.c     | 35 ++++++------
 drivers/soundwire/stream.c         |  8 +--
 include/linux/soundwire/sdw.h      | 88 +++++++++++++++++++++++-------
 8 files changed, 147 insertions(+), 63 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
