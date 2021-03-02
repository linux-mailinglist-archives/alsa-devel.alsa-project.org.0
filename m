Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B309132AC6C
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 22:57:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D22D1ADA;
	Tue,  2 Mar 2021 22:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D22D1ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614722238;
	bh=G+E+Ltfjc8kJYyqzQmh9EP1lw9WYG5c6nvcp7P97K1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aV92xj/dS0twm/2sitdDso4ruT0uoz24La0IGR3LTjwVybCqXarKqDRwlnupoOxKn
	 hZHtvInKibpqWnv9pvH5+NZtttbGMtj/t5HYjYVlgs/Hsk0iyU56PzkxIciGvJPBeR
	 hSPFu0au7iZn/Y25fHnr0rtrXWUqLt74iBn/lQDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D475F80227;
	Tue,  2 Mar 2021 22:55:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A91F80425; Tue,  2 Mar 2021 22:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5585F80269
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 22:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5585F80269
IronPort-SDR: bIelYrrnDZQFjCuVStGmuceC9FlbQjcR6HxlCkti//OJS8V0OnGIkmziMVgfI6CboBXxynRsWB
 XObUNuT1k3nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9911"; a="166248702"
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="166248702"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:46 -0800
IronPort-SDR: 48DQ+GeLB9l5sIZ17yJnMZHnXmg/k4cH7gV9cX1DGGkbtGc8GOZI4hSP6pcbWGwE9lx0dYv35O
 KJ4WDjLBS+wQ==
X-IronPort-AV: E=Sophos;i="5.81,217,1610438400"; d="scan'208";a="518014312"
Received: from btucker-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.60.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 13:54:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: pci: mixart: fix kernel-doc warning
Date: Tue,  2 Mar 2021 15:54:29 -0600
Message-Id: <20210302215430.87309-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302215430.87309-1-pierre-louis.bossart@linux.intel.com>
References: <20210302215430.87309-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

make W=1 warning:

sound/pci/mixart/mixart_hwdep.c:36: warning: expecting prototype for
exit with a timeout(). Prototype was for
mixart_wait_nice_for_register_value() instead

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/pci/mixart/mixart_hwdep.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/mixart/mixart_hwdep.c b/sound/pci/mixart/mixart_hwdep.c
index 13dcb2fd0a85..f579f7698bba 100644
--- a/sound/pci/mixart/mixart_hwdep.c
+++ b/sound/pci/mixart/mixart_hwdep.c
@@ -22,7 +22,8 @@
 
 
 /**
- * wait for a value on a peudo register, exit with a timeout
+ * mixart_wait_nice_for_register_value - wait for a value on a peudo register,
+ * exit with a timeout
  *
  * @mgr: pointer to miXart manager structure
  * @offset: unsigned pseudo_register base + offset of value
-- 
2.25.1

