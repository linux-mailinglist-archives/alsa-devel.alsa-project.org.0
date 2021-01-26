Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA60303832
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 09:40:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 543691758;
	Tue, 26 Jan 2021 09:39:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 543691758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611650438;
	bh=pYD7VJWw9DpnyAjHStKDOz+Obw2fqQtg1PScaHU+v1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFBYQgU/I4ejtWa1Kju/Br2pmszFZWOqe2r7+JmhoaxjlFihKgYpDhudrwiI4QZM5
	 oODN6GC0UUlezySzuWNDsbfDFIQqI/krIuKyYd8WMjucM7rOXJrKX25CF+Yls365vj
	 Y9BY6NhZ3OBymuOed8x07zr6MRiYhsTbLP2q9CpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44F8DF804C2;
	Tue, 26 Jan 2021 09:38:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C40C9F804B4; Tue, 26 Jan 2021 09:38:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B92ECF8015B
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 09:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B92ECF8015B
IronPort-SDR: hJlAI4xsPBpV10PxqdJAUrcijtMB5OAd7qyMikSp5GA92yN0I2R+Wu7l2QVZ6GS5tNJemLQfxg
 CztPiaQgLuMA==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198653716"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="198653716"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:38:02 -0800
IronPort-SDR: y0edbAUzfmdnuDr9NgUYYHiPQIKnrIy+RDtFJeHKWNm0l8iOSsKCXBZh3oZryM8m7h1dYvChZs
 GjAiCFNzZ2vA==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="577731234"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:37:59 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/3] soundwire: intel: add
 SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH quirk
Date: Tue, 26 Jan 2021 16:37:45 +0800
Message-Id: <20210126083746.3238-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

There is nothing we can do to handle the bus clash interrupt before
interrupt mask is enabled.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index a2d5cdaa9998..f7ba1a77a1df 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1286,6 +1286,8 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
 		prop->hw_disabled = true;
 
+	prop->quirks = SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH;
+
 	return 0;
 }
 
-- 
2.17.1

