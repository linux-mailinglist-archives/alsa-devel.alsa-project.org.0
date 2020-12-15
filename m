Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0507B2DA7C2
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 06:41:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA1B17B7;
	Tue, 15 Dec 2020 06:40:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA1B17B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608010874;
	bh=WSUhMO+a5KTzKt8C61JBxK7/Z4tIaEqtG2wZ2OlyBRc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LH6A7gOzTC/AsIaT64KwIOrN3Xnk17AKibe0FhIUPobwuEYx4vJaHRAA3PMEyRLby
	 eiwp6UhEpB8zgSA7ZiAd2p+Pm1hns6vBeuzaGnXx1fFxApVsBaSskFFC4IrSeOKUNV
	 YMY+fKSTtnD5+NU1pigik3HDqDYNwbVpt+Ykv1MA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F8CF80278;
	Tue, 15 Dec 2020 06:39:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26A0AF80278; Tue, 15 Dec 2020 06:39:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0082CF8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 06:39:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0082CF8014B
IronPort-SDR: kpgWb7Dtey+61u75cqTHDAzDLv7rZNyB3JUDjzLNs8rH1kRjYv5tBnJDoXFnMi2P2ZdOG9G1di
 NJhFWJsS3cBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="236414220"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="236414220"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 21:39:28 -0800
IronPort-SDR: 4TiTHIGGizS4EfteCBGtwHqfimnBShbEe7TvrWXhsyWwr8G4fD9fxYS10KFOtbE8Z3BSHsGfFk
 Rr0ddENLdt/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="341384666"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga006.jf.intel.com with ESMTP; 14 Dec 2020 21:39:25 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/2] Enable DMA mode on Intel Keem Bay platform
Date: Tue, 15 Dec 2020 13:33:05 +0800
Message-Id: <20201215053307.24128-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, lars@metafoo.de, tiwai@suse.com,
 jee.heng.sia@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

v1: Initial patch version, to enable DMA mode on Intel Keembay platform.

Michael Sit Wei Hong (2):
  dt-bindings: sound: intel, keembay-i2s: Add info for device to use DMA
  ASoC: Intel: KMB: Enable DMA transfer mode

 .../bindings/sound/intel,keembay-i2s.yaml     |  14 ++
 sound/soc/intel/Kconfig                       |   2 +
 sound/soc/intel/keembay/kmb_platform.c        | 157 ++++++++++++++++--
 sound/soc/intel/keembay/kmb_platform.h        |   9 +
 4 files changed, 167 insertions(+), 15 deletions(-)

-- 
2.17.1

