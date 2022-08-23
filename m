Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C759D039
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 06:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E7CC1686;
	Tue, 23 Aug 2022 06:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E7CC1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661230127;
	bh=aOGj0K2ETS0PToUhNjSmBRGkI427Kgkon4oqhCsUotM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S59m5i5wFo6JoyRbhd3p8TF1wnjDo8R8wSMF7SAr78BGh3UvEVkQGa+eEpXT3RggI
	 VYCeigXbCcbg0lBi5zDp4SiY9c57CXqDaIew0TzKhDCR3GjX16DDxRZ4eTiqqE1nod
	 zLFkKOaCwdiJsma1Az9PEuw6VPLeWExMXqLeOMqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D180F80529;
	Tue, 23 Aug 2022 06:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1347BF800C9; Tue, 23 Aug 2022 06:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A2BCF8020D
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 06:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A2BCF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XcsQLvBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661230009; x=1692766009;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aOGj0K2ETS0PToUhNjSmBRGkI427Kgkon4oqhCsUotM=;
 b=XcsQLvBDW3zAJeOkUGtCvwqIsfg1Nkj1LiGiUjS3J3ZNImJFCujrQBX1
 7JBU+/vxEJwxIEnV1J8Leig5bXPXSCXEg7v9r2jgY2m8L7/jEmtoHnt/H
 NpnQj61+GTyFmGD4+xAVZ7ReufcUAFJ0VtfjUu6HQx/uid2/HOzqO5OBl
 eFpE+ioas3sZ9eU9zIicLeOJx9n5nJ0HMC1KHXh33kMIAK++nvzvjIBpZ
 VIN0Bf6vsOgpVltAQyo9JFH1jGPIj/e51CPppevA5cOqU6M/mv0FjA5Aj
 uoFp5ICR3dE8eJ/bXvKTHhCJMoVrKiKEquSBCcsekXykJN4s+d+dNEAlM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="319629728"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="319629728"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:46:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="669855112"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 21:46:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/3] soundwire: intel: set dev_num_ida_min
Date: Tue, 23 Aug 2022 12:50:04 +0800
Message-Id: <20220823045004.2670658-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
References: <20220823045004.2670658-1-yung-chuan.liao@linux.intel.com>
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
index 89d1d0d021fc..3e372599a8c3 100644
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
 
@@ -1307,6 +1310,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 	cdns->msg_count = 0;
 
 	bus->link_id = auxdev->id;
+	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
 
 	sdw_cdns_probe(cdns);
 
-- 
2.25.1

