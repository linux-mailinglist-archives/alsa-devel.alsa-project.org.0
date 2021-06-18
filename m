Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48F3ACDDE
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 16:49:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B181717;
	Fri, 18 Jun 2021 16:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B181717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624027767;
	bh=U9l3EBioyreZQY4NYNW0cauqIEOY9/dKgOwbe7GJmgc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I2k2i+5KJt6Y+9LrVj3Sn27ftTwXX6fkQ9Rwsxmh5E9bGoAmWJXHLAFe5jWQb7aEz
	 qPOKcaYVPu49KAeztQwY8C9zOegGCcZU/SSJFHjumJXoM3029oXk8KaxgZWNuTpxIp
	 +Ky7qZsFJepbyFelCwKXy+xB5qgsu9PRZD7ds8oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 231B3F80084;
	Fri, 18 Jun 2021 16:48:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9FBBF8032D; Fri, 18 Jun 2021 16:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D22FBF80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 16:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D22FBF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="co6LQ7aD"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15IEkBCZ012726; Fri, 18 Jun 2021 09:47:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=7iQjQe++wWGoO7R/YbIdASwb2/mpDN1SfTlBbTs/qB8=;
 b=co6LQ7aDeUDwnRNCVCADw8l23PTidruMWJ0YnSvtxgu0MwOXAC/MMw9/eZaJ4vpDurw/
 1EFCOPuZvz5A7IwsUKh0sgnQJ+iLOaxkYjr2JpTgWL22GAnln1KEJ0CHfOOpNNizytXH
 UlAv1mCqeC/EUO0miP+XeyNZtKDynwcMGJDaJbcaFj3+TBV6SCJpoTZYJKdDvPfiPoV9
 CC4D/pv9j3oGQW1HczdW0bK/IQB/ibzUV3ZIRg392mpK7+/xaeIBuuwwW/P+bsDCH9Kl
 irx7yPDLn0rgMN24Nn0ATxXAW5BK5hDc2biHBIK442KCYM4NnmyEd4xarBpBMKTcLpfW Gg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 398qj8gkj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Jun 2021 09:47:49 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 18 Jun
 2021 15:47:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 18 Jun 2021 15:47:47 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.68])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 64FB92B2;
 Fri, 18 Jun 2021 14:47:47 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: stream: Fix test for DP prepare complete
Date: Fri, 18 Jun 2021 15:47:45 +0100
Message-ID: <20210618144745.30629-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: B_pmV6x3EuB3inHcs9sadnPYReqKVlUv
X-Proofpoint-ORIG-GUID: B_pmV6x3EuB3inHcs9sadnPYReqKVlUv
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106180087
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

In sdw_prep_deprep_slave_ports(), after the wait_for_completion()
the DP prepare status register is read. If this indicates that the
port is now prepared, the code should continue with the port setup.
It is irrelevant whether the wait_for_completion() timed out if the
port is now ready.

The previous implementation would always fail if the
wait_for_completion() timed out, even if the port was reporting
successful prepare.

This patch also fixes a minor bug where the return from sdw_read()
was not checked for error - any error code with LSBits clear could
be misinterpreted as a successful port prepare.

Fixes: 79df15b7d37c ("soundwire: Add helpers for ports operations")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/stream.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 1eaedaaba094..1a18308f4ef4 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -422,7 +422,6 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	struct completion *port_ready;
 	struct sdw_dpn_prop *dpn_prop;
 	struct sdw_prepare_ch prep_ch;
-	unsigned int time_left;
 	bool intr = false;
 	int ret = 0, val;
 	u32 addr;
@@ -479,15 +478,15 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 
 		/* Wait for completion on port ready */
 		port_ready = &s_rt->slave->port_ready[prep_ch.num];
-		time_left = wait_for_completion_timeout(port_ready,
-				msecs_to_jiffies(dpn_prop->ch_prep_timeout));
+		wait_for_completion_timeout(port_ready,
+			msecs_to_jiffies(dpn_prop->ch_prep_timeout));
 
 		val = sdw_read(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
-		val &= p_rt->ch_mask;
-		if (!time_left || val) {
+		if ((val < 0) || (val & p_rt->ch_mask)) {
+			ret = (val < 0) ? val : -ETIMEDOUT;
 			dev_err(&s_rt->slave->dev,
-				"Chn prep failed for port:%d\n", prep_ch.num);
-			return -ETIMEDOUT;
+				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
+			return ret;
 		}
 	}
 
-- 
2.20.1

