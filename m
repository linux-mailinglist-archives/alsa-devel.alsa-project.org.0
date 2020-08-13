Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1AC243FB3
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 22:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DFCD1685;
	Thu, 13 Aug 2020 22:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DFCD1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597349548;
	bh=EPmLBtS08wUr2Mxx1OtHYr4I6Rl1X4TTQ/JoCxXak2M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ApZpU17gJjJah4ce8+4rOV9AvjsVF3nd1G9P7sglpMUXJG+74h2zIPVTaqTpcXLLV
	 pbbiX8c8BkpivRiYKVV7V0zxCjDgGQGwh9ZqLRapCprVto4YZAb4w8/nPwn7crWi01
	 eZ83KHAnCRGTPHhUuh7Ml4rPReHeeNVi3IhuKpyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD89AF8034B;
	Thu, 13 Aug 2020 22:02:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D30BF80321; Thu, 13 Aug 2020 22:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86B6FF802E0
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 22:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86B6FF802E0
IronPort-SDR: badikRoU+Nx4NR9TQf+gy1pSCzgGQzKc4uMAAkkWkHPUvSOrmYAURvRqF9UmIpjkerzfJ1g3iT
 T/Fr7S6q0AgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="141940384"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="141940384"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:06 -0700
IronPort-SDR: ZvKFD7V1+x4zQf6ENsZ5Dgq/Sg0DLMJQ+z9oYRKkb+t3bcMXFPptzhe0if2suMcR5EFjkXkSMD
 4AHKG+F10jGg==
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; d="scan'208";a="495506292"
Received: from jctorres-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.137.200])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2020 13:02:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/21] ASoC: Intel: Atom: remove useless assignment
Date: Thu, 13 Aug 2020 15:01:34 -0500
Message-Id: <20200813200147.61990-9-pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warning:

sound/soc/intel/atom/sst/sst.c:52:20: style: Variable 'size' is
assigned a value that is never used. [unreadVariable]
 unsigned int size = 0;
                   ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index 1900a37d03cc..d450b9848028 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -49,7 +49,7 @@ static irqreturn_t intel_sst_interrupt_mrfld(int irq, void *context)
 	union ipc_header_mrfld header;
 	union sst_imr_reg_mrfld imr;
 	struct ipc_post *msg = NULL;
-	unsigned int size = 0;
+	unsigned int size;
 	struct intel_sst_drv *drv = (struct intel_sst_drv *) context;
 	irqreturn_t retval = IRQ_HANDLED;
 
-- 
2.25.1

