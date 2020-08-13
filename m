Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98904243FA0
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D7A10E;
	Thu, 13 Aug 2020 22:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D7A10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349202;
	bh=Sot0P/M+WBuqQh+xZeBcqpRv1BvZcdVmCXv4bNg3/wI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3+EvwK1sgckYae9ORQ7GjWgTn6S8NLdxyAv5tkDEQIcwibL0Nnk7kh4RlAXDdSpG
	 fBIZtHN292SW1/kZ9ABm9qrHBYJ4PwWECWkxR1lmVsP8IvYi1WXXekp5Kl7pyBPpZK
	 wOEFHKSrqNbCepmXLeEZPXtnn49Q0fPbCD2DJXcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4504F80305;
	Thu, 13 Aug 2020 22:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35B80F802E3; Thu, 13 Aug 2020 22:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92FC5F80161
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92FC5F80161
IronPort-SDR: N84Wna4pTy47bpD1i/TII1R5yd+rd604mJ5MBbtObh1um6PnfsxHBdH5qd5obemAaX2cXlP1Jl
 MU992ZebqLww==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="153542154"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="153542154"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:03 -0700
IronPort-SDR: zrQdlmlgyGEsvPvhP18xKjB/lzOeacbpCh2hX3wJnf72bFktDnQaliTwPB3IHLB4PdD4GsCCHM
 Ul5r4rnC8hyg==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506279"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/21] ASoC: Intel: Atom: remove redundant initialization
Date: Thu, 13 Aug 2020 15:01:31 -0500
Message-Id: <20200813200147.61990-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
References: <20200813200147.61990-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warnings:

sound/soc/intel/atom/sst/sst.c:427:13: style: Variable 'ret' is
assigned a value that is never used. [unreadVariable]
 int i, ret = 0;
            ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index 1d1c58e48f42..1900a37d03cc 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -423,7 +423,7 @@ static int intel_sst_suspend(struct device *dev)
 {
 	struct intel_sst_drv *ctx = dev_get_drvdata(dev);
 	struct sst_fw_save *fw_save;
-	int i, ret = 0;
+	int i, ret;
 
 	/* check first if we are already in SW reset */
 	if (ctx->sst_state == SST_RESET)
-- 
2.25.1

