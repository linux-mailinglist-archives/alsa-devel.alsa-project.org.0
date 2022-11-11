Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05346625288
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 05:28:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26BD41633;
	Fri, 11 Nov 2022 05:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26BD41633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668140914;
	bh=vn9VwOhttQiEitLM6pjgFhOu+byBGsPJxmJqGvKBlLY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwXBjYTn1Uu2trTTopeQdlpAsaxe/pSCY0s6IzPvGBngZL9yi42ICLHjIsL/DTvA6
	 z/j2FmDjwfVu3usN4O03H5IZAlrozp1amxvqQ0LH0gFYepdRsWattotT5LbP6Vc5XS
	 lbmss0A+pYyTtRK4ZiGm6bIvTIXPrTFmyfC+R5wQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C36B6F8058C;
	Fri, 11 Nov 2022 05:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB40FF80588; Fri, 11 Nov 2022 05:25:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE32FF80536
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE32FF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iqv18lH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668140722; x=1699676722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vn9VwOhttQiEitLM6pjgFhOu+byBGsPJxmJqGvKBlLY=;
 b=iqv18lH7W+9rbHnFUfzrmQIRPA0SwnOSxRRpba0e8rMYbLuoNUldWXZM
 JvEVvpvqGLlvbCoqHH2pHv9L5d4H77BtNJupJjs94WX1q9p9QZPQoD+4u
 61L6/rIqInyK5j0fGaiWY5fMwcaQ0Q5pxG6OrhwZLRpr0pLyF3DIOi/7U
 6OFiK9Ad35z0Y4ZoT/tbx5eI50VhCgUkaa6xrLMeDxcRpJs+zCrV+BkE/
 U4h/aNGw9ptrMAh8sWwAAsX043zP/pzdouWdeLqBf74ZNvj0337G1JxCe
 yHz6iNBfZyyXHu36ZvW9flOFz6F9SSviaAAsXjrfvm7tvZTwlh4pdOw4j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291923742"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291923742"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="588440773"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="588440773"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 20:25:16 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 6/8] soundwire: intel_init: remove sdw_intel_enable_irq()
Date: Fri, 11 Nov 2022 12:26:51 +0800
Message-Id: <20221111042653.45520-7-yung-chuan.liao@linux.intel.com>
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

The functionality is implemented with per-chip callbacks, there are no
users of this symbol, remove the code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_init.c      | 24 ------------------------
 include/linux/soundwire/sdw_intel.h |  2 --
 2 files changed, 26 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 8bd95c9cbcaf..0df3cdd85793 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -125,30 +125,6 @@ static int sdw_intel_cleanup(struct sdw_intel_ctx *ctx)
 	return 0;
 }
 
-#define HDA_DSP_REG_ADSPIC2             (0x10)
-#define HDA_DSP_REG_ADSPIS2             (0x14)
-#define HDA_DSP_REG_ADSPIC2_SNDW        BIT(5)
-
-/**
- * sdw_intel_enable_irq() - enable/disable Intel SoundWire IRQ
- * @mmio_base: The mmio base of the control register
- * @enable: true if enable
- */
-void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable)
-{
-	u32 val;
-
-	val = readl(mmio_base + HDA_DSP_REG_ADSPIC2);
-
-	if (enable)
-		val |= HDA_DSP_REG_ADSPIC2_SNDW;
-	else
-		val &= ~HDA_DSP_REG_ADSPIC2_SNDW;
-
-	writel(val, mmio_base + HDA_DSP_REG_ADSPIC2);
-}
-EXPORT_SYMBOL_NS(sdw_intel_enable_irq, SOUNDWIRE_INTEL_INIT);
-
 irqreturn_t sdw_intel_thread(int irq, void *dev_id)
 {
 	struct sdw_intel_ctx *ctx = dev_id;
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 2e9fd91572d4..d2f581feed67 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -286,8 +286,6 @@ int sdw_intel_startup(struct sdw_intel_ctx *ctx);
 
 void sdw_intel_exit(struct sdw_intel_ctx *ctx);
 
-void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable);
-
 irqreturn_t sdw_intel_thread(int irq, void *dev_id);
 
 #define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
-- 
2.25.1

