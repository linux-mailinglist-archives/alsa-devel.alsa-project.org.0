Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466EC1369A
	for <lists+alsa-devel@lfdr.de>; Sat,  4 May 2019 02:31:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F8D51863;
	Sat,  4 May 2019 02:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F8D51863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556929898;
	bh=wXI82PJuKhOacNdKgtIIUb2xnqW4u8PtUeYJsQZ76sQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UTHAmC7Jwe10QZTH6/fwtlszgtoKfv4p48k4e1/OQIKdKkPfVWn+MsO/12NRZPzwY
	 ujHwByKkMN9mqGWfFA22bnAIa1lZT6CQ6UFKzY1UYmvk6e6EzghHZCLznAjKgrnw7w
	 ejp9e+5dqFX8CFvJPGrQqr37YTaunE+Awi2yrHUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 803AAF896E2;
	Sat,  4 May 2019 02:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53B5AF896E2; Sat,  4 May 2019 02:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0E2EF80722
 for <alsa-devel@alsa-project.org>; Sat,  4 May 2019 02:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E2EF80722
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 May 2019 17:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,427,1549958400"; d="scan'208";a="170430416"
Received: from jlwhitty-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.28.45])
 by fmsmga001.fm.intel.com with ESMTP; 03 May 2019 17:29:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  3 May 2019 19:29:18 -0500
Message-Id: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com
Subject: [alsa-devel] [PATCH 0/8] soundwire: corrections to ACPI and DisCo
	properties
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

Now that we are done with cleanups, we can start fixing the code with
actual semantic or functional changes.

This patchset applies on top of everything Vinod and I contributed
this week.

The fist patch correct a simplifying assumption made earlier. With the
IceLake BIOS the existing code is fooled by the presence of a second
child device and the namespace walk needs to be filtered. This was not
needed on previous generations.

The second patch fixes a long-standing misalignment between code and
DisCo specification, preventing MIPI DisCo properties from being
parsed successfully.

The third and fourth patch remove restrictions preventing codec
drivers from reading DisCo properties.

The fifth patch adds definitions from the SoundWire spec that were
missed somehow, but will be very much needed for dynamic bandwidth
allocation.

The last 3 patches realign the code with the MIPI specification. The
existing code exposes properties that don't exist, or exposes them
with ambiguous wording. Sticking to the specification helps avoid
interpretation issues for integrators, and will make sure the
follow-up sysfs support is self-explanatory.

Parts of this code was initially written by my Intel colleagues Vinod
Koul, Sanyog Kale, Shreyas Nc and Hardik Shah, who are either no
longer with Intel or no longer involved in SoundWire development. When
relevant, I explictly added a note in commit messages to give them
credit for their hard work, but I removed their signed-off-by tags to
avoid email bounces and avoid spamming them forever with SoundWire
patches.

Pierre-Louis Bossart (8):
  soundwire: intel: filter SoundWire controller device search
  soundwire: mipi_disco: fix master/link error
  soundwire: mipi_disco: expose sdw_slave_read_dpn as symbol
  soundwire: mipi_disco: expose sdw_slave_read_dp0 as symbol
  soundwire: add port-related definitions
  soundwire: remove master data port properties
  soundwire: fix master properties
  soundwire: rename/clarify MIPI DisCo properties

 drivers/soundwire/bus.c        |  6 +--
 drivers/soundwire/intel.c      | 11 ++--
 drivers/soundwire/intel_init.c | 19 ++++++-
 drivers/soundwire/mipi_disco.c | 49 +++++++++---------
 drivers/soundwire/stream.c     |  8 +--
 include/linux/soundwire/sdw.h  | 94 +++++++++++++++++++++++++++-------
 6 files changed, 132 insertions(+), 55 deletions(-)

-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
