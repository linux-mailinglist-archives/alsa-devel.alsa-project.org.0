Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4769332AC68
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A9B1AAF;
	Tue,  2 Mar 2021 22:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A9B1AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614722187;
	bh=i/syeSFuIItY8osjrzTSUpdAILIGdx8xg3XoZG86Hk4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kab9sG/QshMfl5F0lZfKgCO+JZ3LSiHYX0g+4FLE///T4QaR5mCG+paaGljjwiehb
	 6H850Dj6BRwc3HPSjbi6Bi54RjggslBdYH6AmI6eBgZwTPtf5g9oJYzzXoIEO6Jm/U
	 my1qLY1MZPYCrCfpI5FbZaL0b2MqOZjNKaB5xmAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4A5F802A9;
	Tue,  2 Mar 2021 22:54:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 678C3F80273; Tue,  2 Mar 2021 22:54:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C3A7F80088
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C3A7F80088
IronPort-SDR: 7j9zvpRO1UhsDK/BSpebld1Ab+y1mEhClKZbgmu4ZQXRpqlNMUXusU843UPlv4H2s6ikIs5Xv9
 Ig1MUFnzmOSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="174131658"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="174131658"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:45 -0800
IronPort-SDR: LISzl3pfcIN8KVXq7V7ZajaG64sdEHJnaMhp34aqsg3wNyTTKXMRKSxI15/uQqykAn0NC49O0O
 Xgiz9JgaTngg==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="518014307"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: digigram: fix kernel-doc warnings
Date: Tue,  2 Mar 2021 15:54:27 -0600
Message-Id: <20210302215430.87309-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

make W=1 reports these warnings with v5.12-rc1.

Pierre-Louis Bossart (3):
  ALSA: vx: fix kernel-doc warning
  ALSA: pci: mixart: fix kernel-doc warning
  ALSA: pci: vx222: fix kernel-doc warning

 sound/drivers/vx/vx_core.c      |  2 +-
 sound/pci/mixart/mixart_hwdep.c |  3 ++-
 sound/pci/vx222/vx222_ops.c     | 10 +++++-----
 3 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.25.1

