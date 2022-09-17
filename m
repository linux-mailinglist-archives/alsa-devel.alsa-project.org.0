Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3595BB8A0
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Sep 2022 16:04:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF6291630;
	Sat, 17 Sep 2022 16:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF6291630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663423462;
	bh=z5j24JqwCo7kd73PhpCUuGwIomFeiz8UZXPj1RUJB6A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=afPLNnEI7ALGHlhaYB71uYbIB82Mdl4taGL8odfkxTZ0OhLb1HlpM6QO5u+tkTnPo
	 riH3I/LQeRrvoHh8AvExw9xWIiDBDmpc7Jz8fXr4gT7SG3JmcofM8E9hk5fr883I0n
	 4hRlaD5s7JwbgFEvRD5yiQKW3pFSoWpIVcp55wY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D0DF80423;
	Sat, 17 Sep 2022 16:03:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC6ABF80134; Sat, 17 Sep 2022 16:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BF31F80134
 for <alsa-devel@alsa-project.org>; Sat, 17 Sep 2022 16:03:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BF31F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="d+i7lvHI"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28HDswAC031443;
 Sat, 17 Sep 2022 09:03:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=lKY8j0vzKxC7NFBZD8JvtgkQHrhbXHdKGnrRODBlXW4=;
 b=d+i7lvHIPmIFmVDH8w8AjoEDw7g87Bjwo02CXaz4sFeNQ9Woe4dsTxpBWe4Wmo8bWqf6
 JZLbNe1t1lwp5z+8rY4e0ApXoK6xkulnwLVXoRrYsUBN1ebRZZ2rePPWBnuIa0/tlsjg
 hMKCf9X7vDsLVF6V6gbaFBUWxtYyyexT55gmN55tLpt7uHlsW/uZZc43aujpzfZrCNG9
 Ho5EoQM/oAitMvOvpuFczpdGyQrRLFHdkpv8K1dMJ2nvQCVUFBNXufHpc2QCu99wT3nl
 lTGSUCTSxcFbQznBmA6UM0FEj4QkBDmi4TK8HzrkRmS07X2ob8TwPLVQZFkQ2zCyRypd Yw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jnanmg86h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Sep 2022 09:03:07 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Sat, 17 Sep
 2022 09:03:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Sat, 17 Sep 2022 09:03:05 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.112])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D3B112BA;
 Sat, 17 Sep 2022 14:02:58 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: bus: Fix wrong port number in
 sdw_handle_slave_alerts()
Date: Sat, 17 Sep 2022 15:02:56 +0100
Message-ID: <20220917140256.689678-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _oA7DauQ6_eVTiTbkbYThvi38yUvu3GH
X-Proofpoint-ORIG-GUID: _oA7DauQ6_eVTiTbkbYThvi38yUvu3GH
X-Proofpoint-Spam-Reason: safe
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

for_each_set_bit() gives the bit-number counting from 0 (LSbit==0).
When processing INTSTAT2, bit 0 is DP4 so the port number is (bit + 4).
Likewise for INTSTAT3 bit 0 is DP11 so port number is (bit + 11).

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 8eded1a55227..df0ae869ee51 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1622,7 +1622,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			port = buf2[0] & SDW_SCP_INTSTAT2_PORT4_10;
 			for_each_set_bit(bit, &port, 8) {
 				/* scp2 ports start from 4 */
-				port_num = bit + 3;
+				port_num = bit + 4;
 				sdw_handle_port_interrupt(slave,
 						port_num,
 						&port_status[port_num]);
@@ -1634,7 +1634,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			port = buf2[1] & SDW_SCP_INTSTAT3_PORT11_14;
 			for_each_set_bit(bit, &port, 8) {
 				/* scp3 ports start from 11 */
-				port_num = bit + 10;
+				port_num = bit + 11;
 				sdw_handle_port_interrupt(slave,
 						port_num,
 						&port_status[port_num]);
-- 
2.30.2

