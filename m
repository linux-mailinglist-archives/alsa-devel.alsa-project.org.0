Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B7B5B0174
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B56171672;
	Wed,  7 Sep 2022 12:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B56171672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545743;
	bh=4hfie7G9uozS4KcCzfm//dtvshwoOBMfIlcrtYusoAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KOtpCxqkMdbuQoZ8YuteVY9e44Paa8XBw6phKPu0mSBTJV+MWVgrBXzO1QGwYwJjg
	 L1bW8a9/xrbjb0gyAnmhHiIa5SQF215jGoIWhZ588TYPGK6Mj161i1ozIRolXPFu4F
	 NFf2U7HKQqL2wYnMTbntV47T4bZmaSbetrMRJ8UM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69D43F80537;
	Wed,  7 Sep 2022 12:14:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6D0CF80249; Wed,  7 Sep 2022 12:14:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B653AF80249;
 Wed,  7 Sep 2022 12:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B653AF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="m3p88bZV"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2877rCJq005930;
 Wed, 7 Sep 2022 05:14:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Bl/hAN9eOUE5fEBUCRal2TYzv7rqHpfP3aY8V81esYM=;
 b=m3p88bZV2DgSjEeYXHsRxYNY+tfbxKb37WGlJ2IQvpNNvg+quYR3DYOy64bxzIye2KpH
 3GTN9ZMA0sR9USISojxYI8kuoKNLRK0skpch3BIT6c7DJ/kYG1FicG0NIi88FqH8EDMK
 NKVfcKZmMiGJdgJ7P7eNfnpJsrzU8O8UlNpKCrhgEISccSlcD5elOiNU4YhRVGngl80H
 cKOT3MlSPm85itEH2yM59GfwpaER21fjH4385W3xGteT5kZ44MW9kjJk5QpEDvogbUV+
 GXN8n92SlBdTPG4IvPJd5FgCARNvd1RNs7tD16cOuUHq0oJ+61wz7oSnm/a96Ko/dMOD iw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bpw4sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 05:14:14 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 7 Sep
 2022 05:14:12 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Wed, 7 Sep 2022 05:14:12 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.149])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4ECDC7C;
 Wed,  7 Sep 2022 10:14:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
 <sanyog.r.kale@intel.com>, <broonie@kernel.org>
Subject: [PATCH 1/7] soundwire: bus: Do not forcibly disable child pm_runtime
Date: Wed, 7 Sep 2022 11:13:56 +0100
Message-ID: <20220907101402.4685-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907101402.4685-1-rf@opensource.cirrus.com>
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jOtVSBGoI6flwsCrmA4vF34gVFAe56ZT
X-Proofpoint-ORIG-GUID: jOtVSBGoI6flwsCrmA4vF34gVFAe56ZT
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

Do not call pm_runtime_disable() of a child driver in
sdw_delete_slave(). We really should never be trying to disable
another driver's pm_runtime - it is up to the child driver to
disable it or the core driver framework cleanup. The driver core
will runtime-resume a driver before calling its remove() so we
shouldn't break that.

The patch that introduced this is
commit dff70572e9a3 ("soundwire: bus: disable pm_runtime in sdw_slave_delete")
which says:

"prevent any race condition with the resume being executed after the
bus and slave devices are removed"

The actual problem is that the bus driver is shutting itself down before
the child drivers have been removed, which is the wrong way around (see
for example I2C and SPI drivers). If this is fixed, the bus driver will
still be operational when the driver framework runtime_resumes the child
drivers to remove them. Then the bus driver will remove() and can shut
down safely.

Also note that the child drivers are not necessarily idle when the bus
driver is removed, so disabling their pm_runtime and stopping the bus
might break more than only their remove().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 0bcc2d161eb9..99429892221b 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -151,8 +151,6 @@ static int sdw_delete_slave(struct device *dev, void *data)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_bus *bus = slave->bus;
 
-	pm_runtime_disable(dev);
-
 	sdw_slave_debugfs_exit(slave);
 
 	mutex_lock(&bus->bus_lock);
-- 
2.30.2

