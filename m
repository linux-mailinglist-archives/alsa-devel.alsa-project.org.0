Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143B5B017F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:17:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F38A91650;
	Wed,  7 Sep 2022 12:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F38A91650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545822;
	bh=T6ndJyX1drIrGDeHhSDYxtwlLUPBYwfA+2oy9Xxh4qU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7IK7VZPMtT5yuNjqZVGC3zF085VwZHfOzfENF8gynhJP/G7JSFf0WDGAbitQAJkr
	 YWmFdQ/H7Mj8M4nKK1cNQRiwgUa9kIn4XP8SWwcrxp4WpkL9xwIlW6YamHX4/70XFN
	 iitg+/a4+IhdSRiDmCvlJ6CRNESVgKoiVtU5t4kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 844D6F80570;
	Wed,  7 Sep 2022 12:14:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83FB5F8054A; Wed,  7 Sep 2022 12:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD95F80118;
 Wed,  7 Sep 2022 12:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD95F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ql0LJ86b"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2877rCJu005930;
 Wed, 7 Sep 2022 05:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=B6nn0DMduRe/b0wPBE0kJZuYuyehQzIVtGN50L5g4Mk=;
 b=Ql0LJ86b71n/DDop36XiXMnZ657dfSJcMMDykbBtKO0u/RVnZs9tq+J+CFnZIlR5Imdw
 gjZweqYzLO8UpLYc83m+w41RagXRZ4jnbDRmpQMD0IKZfB2s8UIgzxWK/orMZuEUzXMx
 C1Ok+wVsbzHvLLaXmGe/EKCPHMZW2NCR3t1NanOCFAiyonWIoYcp/coeXtLqq/zEjWOP
 UDgws0DkMcT5B7GYl9FfO0Kba1liYYZ7IHPlW56ePfxFjxGaxyzN8kDPIT1hi1rC/4LF
 SN2+UQ0c2G6847OsHT5Fvv6utpi1RyUaZyfeb9d5ReJEZn1bU9YXcndkHb0Wc/EjuBHl 5Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bpw4sr-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 05:14:17 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 7 Sep
 2022 05:14:15 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Wed, 7 Sep 2022 05:14:15 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.149])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C3086B06;
 Wed,  7 Sep 2022 10:14:14 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
 <sanyog.r.kale@intel.com>, <broonie@kernel.org>
Subject: [PATCH 5/7] soundwire: intel: Don't disable interrupt until children
 are removed
Date: Wed, 7 Sep 2022 11:14:00 +0100
Message-ID: <20220907101402.4685-6-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907101402.4685-1-rf@opensource.cirrus.com>
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BS6SyyWSBXeYEESWKkhNzUK3mS-9E41G
X-Proofpoint-ORIG-GUID: BS6SyyWSBXeYEESWKkhNzUK3mS-9E41G
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

The cadence_master code needs the interrupt to complete message transfers.
When the bus driver is being removed child drivers are removed, and their
remove actions might need bus transactions.

Use the sdw_master_ops.remove callback to disable the interrupt handling
only after the child drivers have been removed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/intel.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 01be62fa6c83..d5e723a9c80b 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1255,6 +1255,13 @@ static int intel_prop_read(struct sdw_bus *bus)
 	return 0;
 }
 
+static void intel_bus_remove(struct sdw_bus *bus)
+{
+	struct sdw_cdns *cdns = bus_to_cdns(bus);
+
+	sdw_cdns_enable_interrupt(cdns, false);
+}
+
 static struct sdw_master_ops sdw_intel_ops = {
 	.read_prop = sdw_master_read_prop,
 	.override_adr = sdw_dmi_override_adr,
@@ -1264,6 +1271,7 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.set_bus_conf = cdns_bus_conf,
 	.pre_bank_switch = intel_pre_bank_switch,
 	.post_bank_switch = intel_post_bank_switch,
+	.remove = intel_bus_remove,
 };
 
 static int intel_init(struct sdw_intel *sdw)
@@ -1502,7 +1510,6 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	 */
 	if (!bus->prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
-		sdw_cdns_enable_interrupt(cdns, false);
 		snd_soc_unregister_component(dev);
 	}
 	sdw_bus_master_delete(bus);
-- 
2.30.2

