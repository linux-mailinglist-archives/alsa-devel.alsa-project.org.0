Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1274F52F4F7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 23:20:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65187175E;
	Fri, 20 May 2022 23:19:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65187175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653081647;
	bh=PWCXGav9poGCZON1xF+ElDF2R4PZzr1n5vglJtDMPmw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gB//ModYNL2ztgdtUxCF0DcxGhoDeA35hFs/rLXWUUBJaeUB4WMp+XZQQdupqJx0/
	 xq93xmc2bCbZvL2HDasTUVHyQJiZ9O+KB+1Po/KBlYeLK98Plohbs2rzHZvT0ZPtAG
	 41edNCt6/p8xGSsYg8StfwV9NbuhjRnCsP4GVags=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D61CF80549;
	Fri, 20 May 2022 23:17:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 376DAF804C1; Fri, 20 May 2022 23:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D25F804C1
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 23:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D25F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WDH+Ar6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653081461; x=1684617461;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWCXGav9poGCZON1xF+ElDF2R4PZzr1n5vglJtDMPmw=;
 b=WDH+Ar6/dG0HVB8oJEJNY7kkNVyZ5EVZB3F5jH2QfmezxYYHIA5EUue/
 p+cwHjF906jUVVHiTQBqgInGqUjUKxeFsjtuxC+nkQ65ZFbBMOyIV2qCz
 ZrAF5wNikTBUrznq5hnrMoLRPgKihnYUWt1+8QslA3ChI/cbrte9m2ZNX
 u1mxjf8Yt7T/Eo1b0UJ0GPDqznKY2d+zqQVYCBl62+zEVvjzDGFq1x3Tw
 eVSlYVz4hRle1Il1GOPK4zUqBHGGIF4ohNequcmFFVy3R5LQ/vAyMTQcS
 ZPK8zzfT2Rwwd1ZOskQwos5H1ev+Rv+MWturnlcDFCMv1RVMbyF4DgK/8 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="270324229"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="270324229"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; d="scan'208";a="674796020"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.181.190])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2022 14:17:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/16] ASoC: Intel: atom: sst: remove useless initialization
Date: Fri, 20 May 2022 16:17:08 -0500
Message-Id: <20220520211719.607543-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
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

cppcheck reports an invalid null pointer dereference but there's
indeed no need to initialize a loop variable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index 3a42d68c0247b..160b50f479fb4 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -114,7 +114,7 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 static irqreturn_t intel_sst_irq_thread_mrfld(int irq, void *context)
 {
 	struct intel_sst_drv *drv = (struct intel_sst_drv *) context;
-	struct ipc_post *__msg, *msg = NULL;
+	struct ipc_post *__msg, *msg;
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->rx_msg_lock, irq_flags);
-- 
2.30.2

