Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 345632EEBD3
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 04:22:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C15AB1689;
	Fri,  8 Jan 2021 04:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C15AB1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610076115;
	bh=CTlKH8xcfGYPOLc4su4wmhkD5iap7mHkUs8MDpJWphk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f2BK1Wh/RfB2R4p7KsZfmqizuugxuvN6iDWo2B9wTdxG/YXUSUAM8aXUGktI7Mge5
	 PUeRpBOPuDDSg3EFWk1X0v7onwc1rasQskIoNx/61MuWuS5oDNUAvzfGC2xr3Waa3C
	 9eKwyhpKN0D46Je34CiewEAxFIsAmcJ9Sck3Rbd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C3CF8016A;
	Fri,  8 Jan 2021 04:20:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C4D2F80166; Fri,  8 Jan 2021 04:20:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 528ADF800EE
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 04:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 528ADF800EE
IronPort-SDR: 5d6SJ5o0MTlKXrFT+S7eofe43J4vMuqrYwjRDx+7k3JRmyd3oex1Sn5yXgcHAA6Il74g47UBxF
 TmGfnhfR5Vqw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="174955180"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="174955180"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2021 19:20:10 -0800
IronPort-SDR: DBpkYoX+1rsZh7iSNEehwxVbtd5B+LBaSEWpIsllSKOPij+KiVsyUeTTSFLz3pFuLS3YQ4jpeO
 MT/eLTH673Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="362197160"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga002.jf.intel.com with ESMTP; 07 Jan 2021 19:20:07 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 0/2] Enable DMA mode on Intel Keem Bay platform
Date: Fri,  8 Jan 2021 11:12:46 +0800
Message-Id: <20210108031248.20520-4-michael.wei.hong.sit@intel.com>
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

v2: Update patch to align with latest kernel release.
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

