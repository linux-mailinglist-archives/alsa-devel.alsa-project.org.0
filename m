Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 704C65738CE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71FFC1730;
	Wed, 13 Jul 2022 16:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71FFC1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722449;
	bh=tYwVi73XEXhFXoO6kNb2ZMDbR48obx7haFf1QGVKu6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nu51eqsqgQzXcsLko1bcG7DTsDv6ks17f1qqZPsQ+8Kd8SUWoLBJIyO0h8/dwM8df
	 iWQC3peAHWrUfw3JpyRq2dfiWrSH1Deagl4jdFpAZu9EHD5oJqu5YvB4+Jo/Z/2kVF
	 tfWyBHxOG1a0twiE96ldYuCeJzvslR1oYAujX20E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83A3AF80249;
	Wed, 13 Jul 2022 16:25:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AD7AF80249; Wed, 13 Jul 2022 16:25:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82CA7F80249
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:25:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82CA7F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="naNLSpaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657722346; x=1689258346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tYwVi73XEXhFXoO6kNb2ZMDbR48obx7haFf1QGVKu6o=;
 b=naNLSpaMCiScAmgrlDBo2jwFW7vKukWrCmWW2cP5s5Pul4w4fRUQbuQU
 D11zklJNnMu8yu8r0rads1hSAg+adKtCy5YenfmqPE31VS4pyLt1B2wWJ
 zfGR6/QxR6ZeDfUkICPjBu2/Aaz0EinhT+sZ94X+jPWweAV4shICM1FeP
 Kt8FwCf3kglM81C1UAAiEK5JtJ8ArYEaihMtrZLA6VECGLYhI0li8/lPG
 1rJQrEu90O0DI4f2YJjGokguMpKnDIq3Nn7KzWM4SXiOIJm6IU669+ujb
 RsgstrFlLZnJ4UevBxG6YUwT50Y+4gkRQT3B895OXTa2M2bXu94JmX2Hd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="349195686"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="349195686"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:25:44 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="570643761"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:25:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: intel: set dev_num_ida_min
Date: Wed, 13 Jul 2022 22:25:29 +0800
Message-Id: <20220713142529.17323-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713142529.17323-1-yung-chuan.liao@linux.intel.com>
References: <20220713142529.17323-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

The allowed values for SoundWire device numbers are between 1 and 11
(inclusive). HDaudio/iDISP codecs typically use SDI values 0..3
(inclusive). To allow for a unique peripheral SDI/dev_number across
HDaudio and SoundWire buses, we set the minimum base to 4. This still
allows for 8 SoundWire peripherals in the system, currently more than
needed in actual products.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 95ce292994cc..85d4268eea65 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -22,6 +22,9 @@
 #include "bus.h"
 #include "intel.h"
 
+/* IDA min selected to avoid conflicts with HDaudio/iDISP SDI values */
+#define INTEL_DEV_NUM_IDA_MIN           4
+
 #define INTEL_MASTER_SUSPEND_DELAY_MS	3000
 #define INTEL_MASTER_RESET_ITERATIONS	10
 
@@ -1297,6 +1300,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	cdns->msg_count = 0;
 
 	bus->link_id = auxdev->id;
+	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
 
 	sdw_cdns_probe(cdns);
 
-- 
2.25.1

