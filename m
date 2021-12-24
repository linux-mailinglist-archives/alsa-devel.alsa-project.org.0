Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6747EA8C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 03:14:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E321917;
	Fri, 24 Dec 2021 03:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E321917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640312052;
	bh=Tp7GqhhwHEXg3w8FjsN24iohvHF8ZeybsXyMcoeX3M0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MiPgZdN3xS64ljdHUIZOIPu3Az5ao3eHeReXhbGST0TsifAdNFmpq0KBEDPTBQHSJ
	 8pmuNum8FIOwKemRA90qh1bQ5URytLqotehlLdcjbkw0c9zN79icSnDQTawSg6dDDg
	 Igyd/sg5rZBFiut59s9TIYoJEHA9bIQrnZosGGvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68381F8051D;
	Fri, 24 Dec 2021 03:11:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B13F80084; Fri, 24 Dec 2021 03:11:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E120EF80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 03:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E120EF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AoWu2xLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640311889; x=1671847889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tp7GqhhwHEXg3w8FjsN24iohvHF8ZeybsXyMcoeX3M0=;
 b=AoWu2xLa/OBUqWC5s7YHTclAHYuYFe7G7LWJBrjv2Z4anjw8m4D4RNdt
 R3wOQYaUXUZDA2ZHsoQvl93SvAOOzJ4IvPyQhzHogJPOmSskdL5e9RlU8
 gIn/7wBVFE03K+uvLygZa4ywBLR7XS/sdJ0IgA2n3WzkMKYl2CcS+oJaS
 sUbaIu704Or3ogUFGAqYmYZUczQovHlDYAkXkXi/9CvYEwpia+vq1RdMP
 ebpIfs9Ol1b4fWHVsPy3VzTd2D63tppTPNiELWpt8fGkI2YnNRI9JuyDY
 W342nM/HgCNTaja4/QaMOqEm1ChnHPervauONCBCEETlj3IyF/USJyp49 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="265127379"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="265127379"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:11:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="467156236"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:11:10 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 6/7] soundwire: intel: remove unnecessary init
Date: Fri, 24 Dec 2021 10:10:33 +0800
Message-Id: <20211224021034.26635-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
References: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

cppcheck warning:

drivers/soundwire/intel.c:1487:10: style: Variable 'ret' is assigned a
value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Acked-By: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 70d164372a2b..0d1c86e6ac2e 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1613,7 +1613,7 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 	u32 clock_stop_quirks;
-	int ret = 0;
+	int ret;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
 		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-- 
2.17.1

