Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A9D2B3D15
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 07:27:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70EFD17AF;
	Mon, 16 Nov 2020 07:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70EFD17AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605508024;
	bh=QZzZCEPWx2WPVEgcDnmjd2/mglF95zUwF80CtXt4vRw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q1Fei/tM5mD2uRzcnmd79odq96dyaCGrwrG9tLK6nu1OJbQB94SXbE6W1CkACrYao
	 B70KaAB7NcZ+N2gHt+sbf58jpJH40Byq4H5bvbnvVa7tyiHejJ8xHFb+ydrQRvSjme
	 wOimFEBSdiRYFQzmw4BTA8mNmZ09vmBqEFn1PVKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F13DF804CB;
	Mon, 16 Nov 2020 07:25:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD7A1F8010A; Mon, 16 Nov 2020 07:25:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D7DF8010A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 07:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D7DF8010A
IronPort-SDR: xHoMKn8Jm6ebTEIfrdao4jQGgr3YiLKhYVhz3hhyz1HIAkmFL5EA/8QNcnjYNP8E6KVdwyRW1Y
 xwObyk+eTwSg==
X-IronPort-AV: E=McAfee;i="6000,8403,9806"; a="150555404"
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="150555404"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2020 22:25:13 -0800
IronPort-SDR: 4Lxh4/MmNOcktu83ZDv7N3ID7mdlHAZHcwyvFihEC5qgiwf1tbRaWKka43upeU/Zz6U9F2aZxh
 uBiwd+7XqSTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,481,1596524400"; d="scan'208";a="310297898"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga007.fm.intel.com with ESMTP; 15 Nov 2020 22:25:11 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: Intel: KMB: Fix S24_LE configuration
Date: Mon, 16 Nov 2020 14:19:01 +0800
Message-Id: <20201116061905.32431-2-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116061905.32431-1-michael.wei.hong.sit@intel.com>
References: <20201116061905.32431-1-michael.wei.hong.sit@intel.com>
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

S24_LE is 24 bit audio in 32 bit container configuration
Fixing the configuration to match the data arrangement of
this audio format.

Fixes: c5477e966728 ("ASoC: Intel: Add KeemBay platform driver")

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index f54b710ee1c2..291a686568c2 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -487,9 +487,9 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 		kmb_i2s->xfer_resolution = 0x02;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
-		config->data_width = 24;
-		kmb_i2s->ccr = 0x08;
-		kmb_i2s->xfer_resolution = 0x04;
+		config->data_width = 32;
+		kmb_i2s->ccr = 0x14;
+		kmb_i2s->xfer_resolution = 0x05;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		config->data_width = 32;
-- 
2.17.1

