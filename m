Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24932B3D08
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 07:23:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44D53177A;
	Mon, 16 Nov 2020 07:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44D53177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605507827;
	bh=NS9k3jWjpi4xGCcKkI+4l7RXuKJVFT6ZiTpQPV/Akqw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dJLN9ElTrspgT9H1iQgVGTH6jLqpEKM3fSLsxGOySfPrM/RskYCWTHWR5e5XpMGEo
	 DKfSi9t899fXw/1GnSvtcNBFtTYMX6mZvLc+HyhKn4TvLgAJmuD/MEBElSe9Nzl7Mz
	 sLVRGw7smLgnLaQa7HhoJXDN4ni4wIdT8sYU/oqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAD9FF802A9;
	Mon, 16 Nov 2020 07:22:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84C28F8016C; Mon, 16 Nov 2020 07:22:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64353F8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 07:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64353F8014A
IronPort-SDR: Cl1JfX+c5mZwQ5odVW/9fBfJXHYVeSoWp9oFhPdzD1DtUMDN6d1gkJwpdx2CO7QYJ7TniWtZWJ
 9Nk0rXxS0blQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="158482321"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="158482321"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 22:21:57 -0800
IronPort-SDR: CVgIKhvbCaTlWk7aAIt6VDt6cbajJv7nHoyyAlMhXb0//naOloyMt+0QTkDiBoIQGtuwaNj1FO
 PNELADhiaNyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="362020288"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2020 22:21:54 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] This patch series enables DMA mode on Intel Keem Bay
 platform
Date: Mon, 16 Nov 2020 14:14:47 +0800
Message-Id: <20201116061452.32347-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, vinod.koul@linux.intel.com,
 andriy.shevchenko@intel.com, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, lars@metafoo.de
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

v1: Initial patch version, which contains fix for S24_LE format and also enable
    DMA mode on Intel Keembay platform

Michael Sit Wei Hong (5):
  ASoC: Intel: KMB: Fix S24_LE configuration
  dt-bindings: sound: intel, keembay-i2s: Add info for device to use DMA
  ASoC: soc-generic-dmaengine-pcm: Add custom prepare and submit
    function
  ASoC: dmaengine_pcm: expose functions to header file for custom
    functions
  ASoC: Intel: KMB: Enable DMA transfer mode

 .../bindings/sound/intel,keembay-i2s.yaml     |  14 ++
 include/sound/dmaengine_pcm.h                 |  21 ++
 sound/core/pcm_dmaengine.c                    |  46 ++--
 sound/soc/intel/Kconfig                       |   2 +
 sound/soc/intel/keembay/kmb_platform.c        | 208 ++++++++++++++++--
 sound/soc/intel/keembay/kmb_platform.h        |   9 +
 sound/soc/soc-generic-dmaengine-pcm.c         |   8 +-
 7 files changed, 270 insertions(+), 38 deletions(-)

-- 
2.17.1

