Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD61553EC9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 00:58:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00841287B;
	Wed, 22 Jun 2022 00:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00841287B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655852298;
	bh=CxXPtEW5e1uUGi2JZOJqB6xQiXiupMBZIw/yEArO8jo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ibHg6zz3zR7VxR9MdaUn3XGYBfuXcZm7vfzcJGaQidSXqPOW2DfmzPmYPO/3w3zsp
	 c2HQ/B4SFb3ZmIdO358ol0me4kSVMM7WaFcFQ68+ZVaAlsFmovM8iFPxQtW0Z5e9xt
	 VJ9ZKPyW4avIxsI1BhXO1iusrmxMGYy7P6jx4bmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8001CF80104;
	Wed, 22 Jun 2022 00:57:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43C06F80104; Wed, 22 Jun 2022 00:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B2A6F80104
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 00:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B2A6F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QvAoWOmE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655852233; x=1687388233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CxXPtEW5e1uUGi2JZOJqB6xQiXiupMBZIw/yEArO8jo=;
 b=QvAoWOmES6T0/OcDLfInFO+2ktMaG22blCckDvEGQ9qO5E83xVMUZeL8
 /ABRXmGArjW3NyrZXy4hlUusjdmHpZiqTZqc5tDkeCAQe6lRSdmEXFJOo
 GeArZeuuB5gVBwnfnmVtXkiMH7Jd+Nd7nNaJrgcrDCJvT/dBa/UrgKd8X
 aWozJTM1nHwxyUhW1N2Or4InnzbX3kcsyxB4u7GtM4jh6gK//G9P2rVit
 jbAKw7Loy9mqxRaAll7sXIExkvYPXKvKp0DvWrRDrLZQzOkjSDsPiEjA6
 xAxA/pNv4V6HVIJRF/IrdTUxtGUCpa6C5RS7MjxYbIpP0T4lDK5wnpI0q w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="263292318"
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="263292318"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 15:57:01 -0700
X-IronPort-AV: E=Sophos;i="5.92,210,1650956400"; d="scan'208";a="914354215"
Received: from dpasupul-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.178.35])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 15:57:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] soundwire: revisit peripheral driver bind/unbind
Date: Tue, 21 Jun 2022 17:56:37 -0500
Message-Id: <20220621225641.221170-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

This patchset fixes the driver bind/unbind cases which are not
well-supported today. I initially reported a race condition in March
2022 [1] and the more tests I ran the more timing assumptions crept to
the surface.

With this patchset, I've been able to bind the drivers in any order,
and when all dependencies were available the card is
created/registered. Likewise I was able to remove codec drivers while
the bus was still running. The initial suggestion to use
device_lock()/unlock() led to system hangs in suspend-resume that I
was unable to root-cause after weeks of tests, hence this patchset
relies on a SoundWire-specific lock doesn't interfere with other core
device locking.

I think it's a pretty important set of changes that would ideally be
merged in this kernel cycle, so that we can finally add the inclusive
'manager/peripheral' language change in the next kernel cycle.

Feedback and comments welcome.

[1] https://lore.kernel.org/alsa-devel/d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com/

Pierre-Louis Bossart (3):
  soundwire: revisit driver bind/unbind and callbacks
  soundwire: peripheral: remove useless ops pointer
  soundwire: intel: use pm_runtime_resume() on component probe

 drivers/soundwire/bus.c       | 75 ++++++++++++++++++++---------------
 drivers/soundwire/bus_type.c  | 30 +++++++++++---
 drivers/soundwire/intel.c     | 18 +++++++++
 drivers/soundwire/slave.c     |  3 +-
 drivers/soundwire/stream.c    | 53 ++++++++++++++++---------
 include/linux/soundwire/sdw.h |  8 +---
 6 files changed, 124 insertions(+), 63 deletions(-)

-- 
2.34.1

