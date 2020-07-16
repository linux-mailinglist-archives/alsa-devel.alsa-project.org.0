Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A7223175
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 05:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC751661;
	Fri, 17 Jul 2020 05:05:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC751661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594955160;
	bh=wLCOU7SVsCweDaMEzae2EQWuThOuw8cXnEaqjyC4md0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O8xuo+S6ToRk9djrUufShcPbfxM5ViIKpc6FGpADx05udVn8CMoj/9EaQd1VvEjvE
	 y/QaWJSJ1XLymaD03N77jfYrKeEFlb7nNakxS2RKFE8kNSA7/1tVeyZvSqlXEGRymp
	 iTn2oBosos/cngqGSqc9UuijdpxgknX28naqa+5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EF8EF80229;
	Fri, 17 Jul 2020 05:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6CE4F80227; Fri, 17 Jul 2020 05:04:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FC2FF8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 05:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FC2FF8014E
IronPort-SDR: 2sfHNNV3fkpRfRjrVUsiyT4DXIGfMKE3lKz/jx5lZha70w8hUKZ34UI02JW7kX9usvWwkOpfpg
 fCaYbErUHzqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="147518668"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="147518668"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:04:02 -0700
IronPort-SDR: ywMe01TW6qSUwlNgupdvLxqbSS99qKFod0EJeccht8t5JvVg2itmSmWQ1VSFYNV67ZviM9LxNF
 YF4LPmAOGlEA==
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="460699609"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:03:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 0/9] soundwire: intel: revisit SHIM programming
Date: Thu, 16 Jul 2020 23:09:38 +0800
Message-Id: <20200716150947.22119-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

This series does some cleanup, revisits SHIM programming sequences,
and merges Soundwire interrupt handlers/threads.

changes in v2:
 - Resume M device instead of S device in intel_master_process_wakeen_event
   function. See the comment in intel_master_process_wakeen_event() in
   detail.

Bard Liao (2):
  soundwire: intel/cadence: merge Soundwire interrupt handlers/threads
  Soundwire: intel_init: save Slave(s) _ADR info in sdw_intel_ctx

Pierre-Louis Bossart (6):
  soundwire: intel: reuse code for wait loops to set/clear bits
  soundwire: intel: revisit SHIM programming sequences.
  soundwire: intel: introduce a helper to arm link synchronization
  soundwire: intel: introduce helper for link synchronization
  soundwire: intel_init: add implementation of sdw_intel_enable_irq()
  soundwire: intel_init: use EXPORT_SYMBOL_NS

Rander Wang (1):
  soundwire: intel: add wake interrupt support

 drivers/soundwire/cadence_master.c  |  18 +-
 drivers/soundwire/cadence_master.h  |   4 +
 drivers/soundwire/intel.c           | 381 +++++++++++++++++++++-------
 drivers/soundwire/intel.h           |   9 +
 drivers/soundwire/intel_init.c      | 101 +++++++-
 include/linux/soundwire/sdw_intel.h |   2 +
 6 files changed, 417 insertions(+), 98 deletions(-)

-- 
2.17.1

