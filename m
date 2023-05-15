Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A9702578
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:54:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14144A4A;
	Mon, 15 May 2023 08:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14144A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133678;
	bh=kjKTx32w9YdnZJ7K83qEoOALY8hrbkCtcZcfoAY0U2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S5RgDMDVkWzYmp7e9dclKpGYew/63YrkoDVOrsvxPb7rb2yep/lJ0TuQVXLMkWyx/
	 Utu4adQrQ+4REM+LSglvOnhAT62LaRE6+2nLKjuaDjvBHHg5r4yq4JHllGpj4GUNlT
	 V8ffeVl0Z3nCL34g+W1CCsIhwdB4VJgRTHjMWPr0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23C37F805FA; Mon, 15 May 2023 08:51:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22061F805F0;
	Mon, 15 May 2023 08:51:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0896F805AF; Mon, 15 May 2023 08:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCF51F805C0
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF51F805C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WFUt25Xd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133455; x=1715669455;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kjKTx32w9YdnZJ7K83qEoOALY8hrbkCtcZcfoAY0U2Q=;
  b=WFUt25XdRm7vpPAg5vCvw7YjeFgSbGHdaLF4tVCfUCVqyzEcjQE3RBWz
   aUMdUH78Z5i4HKnQSmtLdoS/Jfd2JhHrbDBSdya57OiJo8IylK2cdejzk
   QTwxiRpkHpKddHIqnadkG8ta7lDeG+ScVErtltwOEyNPimwSvbLr6iFHN
   LW7LVWRyfPbQ43IfdDTPDS5SI3OY6nkmJSQNFrUSbOgfkfqgZgwces/h8
   Cucpt9eOfpVCjvZ2b7QzjCleNlpby7vWu2bSqObra59cac/fFctCUR1Tg
   0A3suhfuZoj3oZ22GHY5E7H3iDtUI8QYDldhbA4b0tLTwBzLBBU5xxUIa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966410"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966410"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908716"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908716"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 13/26] soundwire: intel_ace2x: configure link PHY
Date: Mon, 15 May 2023 15:10:29 +0800
Message-Id: <20230515071042.2038-14-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KNPYTRQ7GZVQEYXQCMQT2HB7N7R63FHM
X-Message-ID-Hash: KNPYTRQ7GZVQEYXQCMQT2HB7N7R63FHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNPYTRQ7GZVQEYXQCMQT2HB7N7R63FHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Unlike previous hardware generations, the glue-to-master transition is
not managed by software, instead the transitions are managed as part
of the power-up/down sequences controlled by SPA/CPA bits.

The only thing that's required is to configure the link PHY for
'normal' operation instead of the PHY test mode.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 01668246b7ba..5deff32976f1 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -15,6 +15,22 @@
 #include "bus.h"
 #include "intel.h"
 
+/*
+ * shim vendor-specific (vs) ops
+ */
+
+static void intel_shim_vs_init(struct sdw_intel *sdw)
+{
+	void __iomem *shim_vs = sdw->link_res->shim_vs;
+	u16 act = 0;
+
+	u16p_replace_bits(&act, 0x1, SDW_SHIM2_INTEL_VS_ACTMCTL_DOAIS);
+	act |= SDW_SHIM2_INTEL_VS_ACTMCTL_DACTQE;
+	act |=  SDW_SHIM2_INTEL_VS_ACTMCTL_DODS;
+	intel_writew(shim_vs, SDW_SHIM2_INTEL_VS_ACTMCTL, act);
+	usleep_range(10, 15);
+}
+
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
 	struct sdw_bus *bus = &sdw->cdns.bus;
@@ -63,6 +79,9 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 	*shim_mask |= BIT(link_id);
 
 	sdw->cdns.link_up = true;
+
+	intel_shim_vs_init(sdw);
+
 out:
 	mutex_unlock(sdw->link_res->shim_lock);
 
-- 
2.25.1

