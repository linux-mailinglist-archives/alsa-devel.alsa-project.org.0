Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0342A6C5F0E
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:38:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EFFEDB;
	Thu, 23 Mar 2023 06:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EFFEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549919;
	bh=Dypjg8PFg6rfCWgJzAX1z/pRx6Y007Vaip829IVJOYA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=msXY5sHPGxkF6Pnb8NdUXGinr24b3BgOvLpiFB35CRrxL/MmlQUXevwYpUjkJLjJd
	 vTTZW/TvNjt4Dy8m/oLoiKoPk8ZmDpSMN3NyTFRYvizoZwkgVwNLRlT6mRkWafzdzA
	 YOICruoH8sO0dvhEi21gd+VYwEMOzYsNgZzgqen8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF27F80533;
	Thu, 23 Mar 2023 06:33:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34EFDF8027B; Thu, 23 Mar 2023 06:33:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C448BF80533
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C448BF80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=STAeZofY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549425; x=1711085425;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dypjg8PFg6rfCWgJzAX1z/pRx6Y007Vaip829IVJOYA=;
  b=STAeZofYDWKCFVN11xxOkajVLlTxUynQVuZNvrUabiv1zHOV90BoxnHj
   kIHDel6KquBaCalz044qlipAtiKyCkzbG3V6TAO8L2vPlc4s5Cuvu4mS1
   KeVvvVOfuiKED4g1YuvDyjBgTnOEeAkiuHfZ5Vs/qYOH5n7B+o6YyKu5g
   JPqwKSlZBnBwElMQZ+oOUMTnYnp/owG+NHQYLpkmF4zkVEBLuktnuzIhm
   NqsV2ZMBMf9MXQ+L/WeiNaPK2akgKmHkSGKwNvA1tk/37Euet5mvPnwX7
   GTFxpkfXetVQ6MGUcKXZ3QIMdXo90XYxYd2ZC8C2EQ6GNaEQfzZTDw0z2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779386"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779386"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675567073"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675567073"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:30:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 09/20] soundwire: intel_init: use eml_lock parameter
Date: Thu, 23 Mar 2023 13:44:41 +0800
Message-Id: <20230323054452.1543233-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ZE46IYFIVSZCAP2HJLJOOE6EXPAUBVA
X-Message-ID-Hash: 7ZE46IYFIVSZCAP2HJLJOOE6EXPAUBVA
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZE46IYFIVSZCAP2HJLJOOE6EXPAUBVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Now that the ASoC/SOF/HDAudio parts has retrieved the mutex and set
the parameter, we can use it to share the same synchronization across
the two domains.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_init.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index c918d2b81cc3..534c8795e7e8 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -69,18 +69,19 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 		link->ip_offset = 0;
 		link->shim = res->mmio_base + res->shim_base;
 		link->alh = res->mmio_base + res->alh_base;
+		link->shim_lock = &ctx->shim_lock;
 	} else {
 		link->registers = res->mmio_base + SDW_IP_BASE(link_id);
 		link->ip_offset = SDW_CADENCE_MCP_IP_OFFSET;
 		link->shim = res->mmio_base +  SDW_SHIM2_GENERIC_BASE(link_id);
 		link->shim_vs = res->mmio_base + SDW_SHIM2_VS_BASE(link_id);
+		link->shim_lock = res->eml_lock;
 	}
 
 	link->ops = res->ops;
 	link->dev = res->dev;
 
 	link->clock_stop_quirks = res->clock_stop_quirks;
-	link->shim_lock = &ctx->shim_lock;
 	link->shim_mask = &ctx->shim_mask;
 	link->link_mask = ctx->link_mask;
 
-- 
2.25.1

