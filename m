Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED83D6E79
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 07:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5CB1EE6;
	Tue, 27 Jul 2021 07:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5CB1EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627365478;
	bh=lB+KsAIBY3q594Ue71J2ulA7vPT3vqUoswSoclH25aI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XoE/NjqBPJFEUUV0AW3SQFGdfkuY9RmAWVidYfRA8rfAt0Ex0N8UKmYnRYGmTYpSp
	 qbKGk+rkDaznobNpvz2pTuKX0sZWgcxKx1Ui83DEXhOT2xKgBz7xOHRPBIGjWsIAgs
	 mFLnxXz1TCkekBRa1kKSNrV5DsiY9Jb4E+wpWJnY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5391EF804B2;
	Tue, 27 Jul 2021 07:56:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2556EF8027C; Tue, 27 Jul 2021 07:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 381F3F80212
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 07:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 381F3F80212
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="276163937"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="276163937"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 22:56:17 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="474302603"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 22:56:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 0/4] soundwire: intel: exit clock-stop mode before system
 suspend
Date: Tue, 27 Jul 2021 13:56:04 +0800
Message-Id: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
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

Intel validation reported an issue where the HW_RST self-clearing bit
is not cleared in hardware, which as a ripple effect creates issues
with the clock stop mode.

This happens is a specific sequence where the Intel manager is
pm_runtime suspended with the clock-stop mode enabled. During the
system suspend, we currently do nothing, which can lead to potential
issues on system resume and the following pm_runtime suspend,
depending on the hardware state.

This patch suggests a full resume if the clock-stop mode is used. This
may require extra time but will make the suspend/resume flows
completely symmetric. This also removes a race condition where we
could not access SHIM registers if the parent was suspended as
well. Resuming the link also resumes the parent by construction.

BugLink: https://github.com/thesofproject/linux/issues/2606

Pierre-Louis Bossart (4):
  soundwire: intel: fix potential race condition during power down
  soundwire: intel: skip suspend/resume/wake when link was not started
  soundwire: intel: exit clock stop mode on system suspend
  soundwire: intel: simplify pm_runtime handling in suspend/resume

 drivers/soundwire/intel.c | 126 ++++++++++++++++++++++++++++----------
 drivers/soundwire/intel.h |   1 +
 2 files changed, 94 insertions(+), 33 deletions(-)

-- 
2.17.1

