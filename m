Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C949D25C089
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 13:47:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFD01922;
	Thu,  3 Sep 2020 13:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFD01922
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599133675;
	bh=Kek5Oz57MUaen8zbUCuN97N6/Cjs9XyRQDy/tKkaBHk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j589Mls+evPRdqZAviDkQq7YK0PUGzp/gwL8lnZvx68v2TDmItPflWzkdXhmpLXu8
	 9NQ8LoKSYBjpEP5CLge9HCPmqT7NuAk7003jSdMnaMdF1X4qG5HAEgkwqfD1DR0QI6
	 8tD04yj3Luz0JnCKTUkIGJIBRdF+AgZH48CRYghw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B01F802DB;
	Thu,  3 Sep 2020 13:45:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17763F8021D; Thu,  3 Sep 2020 13:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D340DF8020D
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 13:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D340DF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eYC1GW1/"
Received: from localhost.localdomain (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB9152083B;
 Thu,  3 Sep 2020 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599133521;
 bh=Kek5Oz57MUaen8zbUCuN97N6/Cjs9XyRQDy/tKkaBHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eYC1GW1/iZfcMixcipBPWZEenchIk7AwunToHqEOt6r6UL7i3omjmyVkZyKFQm30Z
 48eyPQanfGJG7KmEqZ4QTCoK64JSDl3pM2oChJOI/V4CFr+VzBaW5+iYrRQ6D4BHJg
 vWsAHmjQaGM2bvwue05xqs2GUl7e3Rs2sdITEQTE=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/9] soundwire: define and use addr bit masks
Date: Thu,  3 Sep 2020 17:14:56 +0530
Message-Id: <20200903114504.1202143-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903114504.1202143-1-vkoul@kernel.org>
References: <20200903114504.1202143-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

Soundwire addr is a 52bit value encoding link, version, unique id,
mfg id, part id and class id. Define bit masks for these and use
FIELD_GET() to extract these fields.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/linux/soundwire/sdw.h | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 78f52cdeb2c9..1e9010c139f0 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -5,6 +5,7 @@
 #define __SOUNDWIRE_H
 
 #include <linux/mod_devicetable.h>
+#include <linux/bitfield.h>
 
 struct sdw_bus;
 struct sdw_slave;
@@ -456,13 +457,19 @@ struct sdw_slave_id {
  *
  * The MIPI DisCo for SoundWire defines in addition the link_id as bits 51:48
  */
-
-#define SDW_DISCO_LINK_ID(adr)	(((adr) >> 48) & GENMASK(3, 0))
-#define SDW_VERSION(adr)	(((adr) >> 44) & GENMASK(3, 0))
-#define SDW_UNIQUE_ID(adr)	(((adr) >> 40) & GENMASK(3, 0))
-#define SDW_MFG_ID(adr)		(((adr) >> 24) & GENMASK(15, 0))
-#define SDW_PART_ID(adr)	(((adr) >> 8) & GENMASK(15, 0))
-#define SDW_CLASS_ID(adr)	((adr) & GENMASK(7, 0))
+#define SDW_DISCO_LINK_ID_MASK	GENMASK_ULL(51, 48)
+#define SDW_VERSION_MASK	GENMASK_ULL(47, 44)
+#define SDW_UNIQUE_ID_MASK	GENMASK_ULL(43, 40)
+#define SDW_MFG_ID_MASK		GENMASK_ULL(39, 24)
+#define SDW_PART_ID_MASK	GENMASK_ULL(23, 8)
+#define SDW_CLASS_ID_MASK	GENMASK_ULL(7, 0)
+
+#define SDW_DISCO_LINK_ID(addr)	FIELD_GET(SDW_DISCO_LINK_ID_MASK, addr)
+#define SDW_VERSION(addr)	FIELD_GET(SDW_VERSION_MASK, addr)
+#define SDW_UNIQUE_ID(addr)	FIELD_GET(SDW_UNIQUE_ID_MASK, addr)
+#define SDW_MFG_ID(addr)	FIELD_GET(SDW_MFG_ID_MASK, addr)
+#define SDW_PART_ID(addr)	FIELD_GET(SDW_PART_ID_MASK, addr)
+#define SDW_CLASS_ID(addr)	FIELD_GET(SDW_CLASS_ID_MASK, addr)
 
 /**
  * struct sdw_slave_intr_status - Slave interrupt status
-- 
2.26.2

