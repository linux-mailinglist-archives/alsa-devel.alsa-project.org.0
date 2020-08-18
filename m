Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC52487BA
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:37:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054271769;
	Tue, 18 Aug 2020 16:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054271769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761425;
	bh=n5ANTfr5FI3/tK6gZ2jAimf8xHv0BqCTttY7rQZL4zI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lPBsinDp/Zwkk/BlK/1RjKNT6xaqAps0mY9v0OD4KWYRvTLS25y6mmEdwFz0x4yFS
	 raeJP+yn5t5gANF3jQ2/n/3ZSRI/NMUqd+JkNApB4r4nc5y+wLjKaJKeEoQ1kuCAbm
	 E6wsqjIOge1qc4ToVuUyvR4/HhY+YAdYEID7xFRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAE28F80279;
	Tue, 18 Aug 2020 16:35:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC3FF8023F; Tue, 18 Aug 2020 16:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 269D7F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 269D7F800D3
IronPort-SDR: +QbgXCnGjG4PiFRUaKqv7ArXu4cjDzYD0CCHgOAxvj3MfMNdEEHGSo1+Bpvd3TA9NptWRB0FEw
 Dw+sLosgibhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="154885421"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="154885421"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:12 -0700
IronPort-SDR: wocKKZzVhI3sF2f0xlsRaWqstQJiY0+OiFswM4jwM6bZ5waBkYSJGHqaIJuDxcp0uGPmQy3II1
 +/vC68wElUog==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830239"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 00/11] soundwire: intel: add multi-link support
Date: Tue, 18 Aug 2020 10:41:09 +0800
Message-Id: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This series enables multi-link support for Intel platforms.

Bard Liao (1):
  soundwire: intel: Only call sdw stream APIs for the first cpu_dai

Pierre-Louis Bossart (10):
  soundwire: intel: disable shim wake on suspend
  soundwire: intel: ignore software command retries
  soundwire: intel: add multi-link support
  soundwire: intel: add missing support for all clock stop modes
  soundwire: bus: update multi-link definition with hw sync details
  soundwire: intel: add multi-link hw_synchronization information
  soundwire: stream: enable hw_sync as needed by hardware
  soundwire: intel: add dynamic debug trace for clock-stop invalid
    configs
  soundwire: intel: pass link_mask information to each master
  soundwire: intel: don't manage link power individually

 drivers/soundwire/intel.c      | 309 ++++++++++++++++++++++++++++-----
 drivers/soundwire/intel.h      |   2 +
 drivers/soundwire/intel_init.c |   1 +
 drivers/soundwire/stream.c     |  15 +-
 include/linux/soundwire/sdw.h  |   6 +
 5 files changed, 282 insertions(+), 51 deletions(-)

-- 
2.17.1

