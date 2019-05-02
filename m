Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77578117C4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:02:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEDEB179C;
	Thu,  2 May 2019 13:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEDEB179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556794927;
	bh=jyZZ+ZNhruUqv/o+uvhTS3KUuC59w5yoHsuKo6s9IfI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KRoXeAyBPX2qXk8IdEfedU8P+GyEfqTwZV1aNPPfDzABbMfLnmcikqdDH559XUZ6x
	 16NjRqDISWJ8VNFj3nRbVLJ5HZL660M4fDDSxTXl1L89sptCeMTbingPBJymedpz0q
	 AU3vqVz5ZPxc8BUmE0a7p2ZXZ5Ac0yZ45ypkXids=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A840BF896EC;
	Thu,  2 May 2019 13:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4F78F896E3; Thu,  2 May 2019 13:00:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F8D7F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F8D7F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q3IM/1YB"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C95E020656;
 Thu,  2 May 2019 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794811;
 bh=YZanXKxb/sfRlqEzr2oSUnDXUcGp0tsNkiv1D8YcX2A=;
 h=From:To:Cc:Subject:Date:From;
 b=q3IM/1YBrAVLpvHLuMIOb6YzcR/7rQYEJ0KF2BgP+GDml/UbNmLNLs3ocCgs2SdL9
 ZRVK/zE4gqJ1kqsCNtYohgtes0UMS8Apu9gQoYLCvcLfUpFeCwSK8a89B/7ObhXCKm
 Cdpjh0Mi8r3jZNOpgfUY3iRw7rC6Py2NiwgNXx9I=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:16 +0530
Message-Id: <20190502105930.9889-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 00/14] soundwire: more code cleanups
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

After applying cleanup from Pierre, I realized few more things can be
cleaned up as well, so fixing these instance in the subsystem.

Looks like bool is no longer encouraged, but I have skipped those and few
alignment as they caused code to look worse.

Greg,
if you are okay I would like to add this as well (i know it is late, but
they are cosmetic changes and no logic ones, let me know and I can
send a updated PR)

Vinod Koul (14):
  soundwire: fix kconfig help format
  soundwire: fix SPDX license for header files
  soundwire: intel: fix SPDX license for header file
  soundwire: remove empty line before/after braces
  soundwire: cadence: remove empty line after braces
  soundwire: intel: remove empty line after braces
  soundwire: add argument to function definition
  soundwire: more alignment fixes
  soundwire: intel: more alignment fixes
  soundwire: avoid multiple assignments
  soundwire: fix more typos
  soundwire: wrap macro argument in parenthesis
  soundwire: add a blank line between functions
  soundwire: remove multiple blank lines

 drivers/soundwire/Kconfig               |  2 +-
 drivers/soundwire/bus.c                 | 17 +++++-------
 drivers/soundwire/cadence_master.c      |  1 -
 drivers/soundwire/intel.c               | 36 ++++++++++++-------------
 drivers/soundwire/intel_init.c          |  1 -
 drivers/soundwire/mipi_disco.c          |  6 -----
 drivers/soundwire/stream.c              | 28 +++++++++----------
 include/linux/soundwire/sdw.h           | 16 +++++------
 include/linux/soundwire/sdw_intel.h     |  6 ++---
 include/linux/soundwire/sdw_registers.h |  5 ++--
 include/linux/soundwire/sdw_type.h      |  6 ++---
 11 files changed, 54 insertions(+), 70 deletions(-)

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
