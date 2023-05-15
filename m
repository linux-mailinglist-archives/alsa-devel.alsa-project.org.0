Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73012702570
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A059EAE9;
	Mon, 15 May 2023 08:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A059EAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133614;
	bh=Dypjg8PFg6rfCWgJzAX1z/pRx6Y007Vaip829IVJOYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U84jl2qVkuWk983UeOebUwbHjqo52uq2q4esI8u4yBkCCnLXJC4nJvZ4ch5S3Yb4c
	 cBsHwST5K1pLT7H6Ch3RyisXxDFP/ms0RC35FD7/R/rSppsELxVwF6Wn4nOfrVBta7
	 UOYR/rzvH4neLlL8f+3wTnPBqp2xO/bvfxD/ptKo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9760FF805C0; Mon, 15 May 2023 08:50:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88CBDF805BB;
	Mon, 15 May 2023 08:50:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 628D4F805A1; Mon, 15 May 2023 08:50:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5047F8057D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5047F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jmf9OMQ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133446; x=1715669446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dypjg8PFg6rfCWgJzAX1z/pRx6Y007Vaip829IVJOYA=;
  b=jmf9OMQ7uKtPrWJNxaXvo2FyfcUbeIRE3Ui7j71r0Wd/nvVyNpVljkKp
   eIUnZNiMzfSZGvPx8sVlzQondHdWDWQBR1d4mI95YbiyHYrQQ2SAPCwy2
   jE50s84+RZU9DUNFUa6z7Qhcu+JIa0D4RGIUdqmzAjHobVjlG3EocidDn
   84xFGSEuH9M7lw/LCdrUDzI0WaVfnQKM/LDrqu9FoBYvL9Qgh8DCVbDNr
   DU9hnzO5Cje+8Ry57RY8Bf0xAJq0HYcSFeLENjbh7xGASeYa0XLI71spa
   BFE/Ss2ypkspST5TTPt2c6HERvNahIafSrIiAj/fM2Xv8Z7ptUmPIQrVn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966360"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908670"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908670"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 09/26] soundwire: intel_init: use eml_lock parameter
Date: Mon, 15 May 2023 15:10:25 +0800
Message-Id: <20230515071042.2038-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T4BAIZZPVRFZDFV4AENWJAG7PVPO2I3M
X-Message-ID-Hash: T4BAIZZPVRFZDFV4AENWJAG7PVPO2I3M
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4BAIZZPVRFZDFV4AENWJAG7PVPO2I3M/>
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

