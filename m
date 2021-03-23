Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D7345718
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 06:08:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A445F15E0;
	Tue, 23 Mar 2021 06:07:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A445F15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616476128;
	bh=XCJppjgfKhfQ0uVvDhmUaAztn901iBsfjkO8hZmiEuI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YNSiI43kF6KtSHGILZBkmhxudCQp58nzrgP0T0aLcrUXATPkq08pTYI73LmSCg0Ee
	 RjTzOh5rZL63cInmHSm7JrzII7QM4M5I9xOCOIOWIvJTgdq5R078LEoMcXW2/BzZ1U
	 zBTQ/9UO3t34m4LWPtFiIQ2VSt44AIgTH5QS813E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 528F1F80155;
	Tue, 23 Mar 2021 06:07:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7005F80268; Tue, 23 Mar 2021 06:07:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36646F80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 06:07:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36646F80155
IronPort-SDR: E/tDMzwEeHGMFuNUqTjKDIMci4T2+T3nNuXwZ+E4sJHACNtXbPyhGoLZA1j2AMEgS8hJ2bsA2o
 SwDfVSw2/mmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="189805376"
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="189805376"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 22:07:10 -0700
IronPort-SDR: tOsgc3BtFl5qVr7E0ignpugOAoXwAZGiasoF7KP/P7EEL6XRQ9jVqk7k1eHtSbh3ApSkAtnlB5
 eJktu3V66UNw==
X-IronPort-AV: E=Sophos;i="5.81,270,1610438400"; d="scan'208";a="414800900"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 22:07:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/2] soundwire: configure block packing mode with new
Date: Tue, 23 Mar 2021 13:06:59 +0800
Message-Id: <20210323050701.23760-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

The existing code multiply a channel number by zero (SDW_BLK_GRP_CNT_1),
and the result is used to configure the block packing mode. Sampling
grouping and channel packing are two separate concepts in SoundWire.

In addition, the bandwidth allocation allocates a vertical slice for
each stream, which makes the use of the PER_CHANNEL packing mode
irrelevant.

Let's use the proper definition for block packing mode (PER_PORT).

This change has no functional impact though since the net result is
the same configuration of the DPN_BlockCtrl3 register, when implemented.

Pierre-Louis Bossart (2):
  soundwire: add definition for DPn BlockPackingMode
  soundwire: generic_allocation: fix confusion between group and packing

 drivers/soundwire/generic_bandwidth_allocation.c | 7 +++----
 include/linux/soundwire/sdw.h                    | 6 ++++++
 2 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.17.1

