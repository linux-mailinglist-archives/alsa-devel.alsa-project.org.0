Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8F243F9E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F1B810E;
	Thu, 13 Aug 2020 22:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F1B810E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349141;
	bh=d/cTnIuMK9tZ2SOtka+1N4wE/YSpAbaE1X8xSNy4kgA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxKblrfjQu/fB9byI5VWaF3jQB42eH4Lr0vPukaOX+xmA/xxHkZZt0W7RAGfTXcPi
	 LQeb0PXpvpluhVnQhwa0oD0h2wgeS59ZOOesr6c6MEs+XUZ/a4HoTVpPHsBfUFuJw8
	 vH9OEZnqZ84Ih0Z+IWvBxYvfSaF1nFklr135sP+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 487F7F802FB;
	Thu, 13 Aug 2020 22:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0967BF8027B; Thu, 13 Aug 2020 22:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEF70F80171
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEF70F80171
IronPort-SDR: IAVdW3Pigeh2V0B3KjXSwORhApE6W0wLGRYZzk8H8306+oxW2ai6kD8EtMX9I1YUp1k7Ouvy2J
 jVdw5LjbT6Rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="172360710"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="172360710"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:03 -0700
IronPort-SDR: zHiUcg23YXARh8HhjSinhN4evRk5ZHoEQMA2j3pbiAMamwDvXYfshX8b+K4Vk9rYW4SX9RWAau
 VWSMItHZHqJQ==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506273"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/21] ASoC: Intel: Atom: sst: remove useless NULL assignment
Date: Thu, 13 Aug 2020 15:01:30 -0500
Message-Id: <20200813200147.61990-5-pierre-louis.bossart@linux.intel.com>
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

sound/soc/intel/atom/sst/sst.c:373:2: warning: Assignment of function
parameter has no effect outside the function. Did you forget
dereferencing it? [uselessAssignmentPtrArg]
 ctx = NULL;
 ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index d6563985e008..1d1c58e48f42 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -370,7 +370,6 @@ void sst_context_cleanup(struct intel_sst_drv *ctx)
 	kfree(ctx->fw_in_mem);
 	ctx->fw_in_mem = NULL;
 	sst_memcpy_free_resources(ctx);
-	ctx = NULL;
 }
 EXPORT_SYMBOL_GPL(sst_context_cleanup);
 
-- 
2.25.1

