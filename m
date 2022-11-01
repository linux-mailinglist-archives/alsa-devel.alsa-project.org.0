Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE1614342
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 03:31:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77408167B;
	Tue,  1 Nov 2022 03:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77408167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667269903;
	bh=+VAcDu8nCS7WGVWXp6e7tdbtl+zUVq+Vu+cNVOMl7/0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WeWzV2Ye6SPlnedhfVPdxaififfOi0P02mh69DG0Xp4pbPMdCYHmQ6lzVTnc+mRhU
	 4483idYrd/Of4p/RftjCOcfLwaohSNob9kF8ZTP654j5OqGxw9pQNiCO9YAb7EqeJQ
	 UCtT3driBzSt4QbEkhmXnijz6C5XH6y66BLS0Jro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D802DF80155;
	Tue,  1 Nov 2022 03:30:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D54D7F804B1; Tue,  1 Nov 2022 03:30:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9C46F80249
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 03:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C46F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DfaXiOZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667269841; x=1698805841;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+VAcDu8nCS7WGVWXp6e7tdbtl+zUVq+Vu+cNVOMl7/0=;
 b=DfaXiOZFBbNOiFYsBgfGDdSm/Xr5e283S1ZIRzBu87I2p3y3SerZYafB
 Ne1uM8PCCIlMfnNR1Oknzrr48WGaeR6RoEz4+Iept06jJBVEoGSzOf5yY
 b5z3RiY8T7PjMWQgzJquzG+dgv3kro1u2Yar6k/+HQArSeaRMNctENZWm
 DuEirFgVYFWLOCPtOJ0tY8L37ZiQZWXStSYPto9mEzvKtLiLRP226cz0N
 0mo2GJqrtnSECSpxO96DRiW1uZfhrytaMnPWK5a3Hpn5G5cVq9E4PM1JL
 xvrad9E0tBVA8lsWl3KGMYqLeYvB3sDxdkzmQiVP5WrbeCgYYPIC60pB5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="371129611"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="371129611"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 19:30:34 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="611709363"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="611709363"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 19:30:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 0/2] soundwire: cadence: remove dma_data
Date: Tue,  1 Nov 2022 10:35:19 +0800
Message-Id: <20221101023521.2384586-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

The use of dma_data is problematic for two reasons for the Cadence IP.
a) the dai runtime data has nothing to do with DMAs in existing solutions
b) we will use the dma_data for DMA-management in the future. We cannot
share two separate pieces of information with the same dma_data pointer.

Pierre-Louis Bossart (2):
  soundwire: cadence: rename sdw_cdns_dai_dma_data as
    sdw_cdns_dai_runtime
  soundwire: cadence: use dai_runtime_array instead of dma_data

 drivers/soundwire/cadence_master.c |  50 +++++++------
 drivers/soundwire/cadence_master.h |   9 ++-
 drivers/soundwire/intel.c          | 111 ++++++++++++++---------------
 3 files changed, 86 insertions(+), 84 deletions(-)

-- 
2.25.1

