Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A352B3D0F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 07:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09143179E;
	Mon, 16 Nov 2020 07:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09143179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605507975;
	bh=NS9k3jWjpi4xGCcKkI+4l7RXuKJVFT6ZiTpQPV/Akqw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bFC7nmVfWszV3nfTExnGwdHGSLvmmmWAFGV0+oZl9hJGKl3wkZtuVS5puGVUw3sHa
	 U84XvICU1RGfNrsXr23zSI7innm6fsj0tonMOSLan5f1DqzhaWa6flCNP3W7OcWlx7
	 4dUxdBRZbxAJR00melt0YFXjvCbuw1y66MDfOfPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8670EF802A9;
	Mon, 16 Nov 2020 07:25:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C40A9F8016C; Mon, 16 Nov 2020 07:25:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0590F8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 07:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0590F8014A
IronPort-SDR: J/xPn+1D0e1aYEEhPjoXuZewCWMjJLLB4AqwBQhw6mM0uDFUDGMVip82A65qmRjpayLwOcQgz4
 elvbDwGqT4UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="150555403"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="150555403"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 22:25:11 -0800
IronPort-SDR: 3PcZawxPwP0VIiF3FlNYvPmcp5DEdKE550gfCIFIoX15RnmkM0SwSlwcII0RUMK+stjhbjR2e3
 NUtvoWf8Hh5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="310297893"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2020 22:25:08 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/5] This patch series enables DMA mode on Intel Keem Bay
 platform
Date: Mon, 16 Nov 2020 14:19:00 +0800
Message-Id: <20201116061905.32431-1-michael.wei.hong.sit@intel.com>
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

