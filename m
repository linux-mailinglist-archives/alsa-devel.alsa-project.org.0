Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B5962527C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:26:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506C61674;
	Fri, 11 Nov 2022 05:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506C61674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140794;
	bh=rRCWr54MBfM38aSNFQijVwdAC/iSuunIyJ/8rXD9+Rw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eT90Da2AZoHfmZ9VkVj/l9PEcXGw9TGyDTIcCpvACmecJlVtuAD2PUgROqtjuin4t
	 QcMw1EgB8UsPO/WfHTefEkrj0RHVyZolIDKseesCAsXeGVqVZBgDzDdriMQXroShuf
	 vjVLm390KbaT2ZUHF9sC3JUodHr3u75PXurnZsS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 493E5F80548;
	Fri, 11 Nov 2022 05:25:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97ACBF80536; Fri, 11 Nov 2022 05:25:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C72AF80249
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C72AF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="m9SZi1YW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140710; x=1699676710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rRCWr54MBfM38aSNFQijVwdAC/iSuunIyJ/8rXD9+Rw=;
 b=m9SZi1YWli+uIfSbPziqoVA5LTXEaFBIqzE/N4ExCZIWeOIC3PdEWGIr
 CNOLYNUpglxVBj7WMNN9hYv6+Yzf0l55FHOy8MKy1MWrDGVKLmH5m54Vj
 hhZSOlJqobqEEf+eon9k9yDy+y6kYJdWURzXfXnI3bt3qs/mRuLEvZSKH
 wc6BGpfx+/bmGIOdGPQdkhFLhFp+ind0Nfa9C2oZSFaJXJs0WMrBog+j9
 R84cP/+F2nYX71kltikeD5JpTSONuP3A+FghjyqICWI8Jl+XodyhP4rFj
 ZVOWl3ll+aBCHHM9iWYSpctnHYNP9ttCvvpqlrJielbr1dP+aDPzBqdjw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923702"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923702"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440660"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440660"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:04 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/8] soundwire: intel_init: remove useless interrupt
 enablement in interrupt thread
Date: Fri, 11 Nov 2022 12:26:46 +0800
Message-Id: <20221111042653.45520-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
References: <20221111042653.45520-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

When the code reaches the SoundWire interrupt thread handling, the
interrupt was enabled already, and there is no code that disables it
-> this is a no-op sequence.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index d091513919df..8bd95c9cbcaf 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -157,7 +157,6 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
 	list_for_each_entry(link, &ctx->link_list, list)
 		sdw_cdns_irq(irq, link->cdns);
 
-	sdw_intel_enable_irq(ctx->mmio_base, true);
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS(sdw_intel_thread, SOUNDWIRE_INTEL_INIT);
-- 
2.25.1

