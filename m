Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AF330D825
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 12:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE43C174F;
	Wed,  3 Feb 2021 12:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE43C174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612350526;
	bh=qc0okGoq89bSO5Rh7sKr8aEHtm1IB4qYytN86cwBveA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gol5uikXyhmZzkxzz26IyT7l/SLjXcBk4ED4d3F5hkRfk07TIdNI3kAroVWZbJt7X
	 yGW5q+7xEERmxsBfzNLPMYw8gTIZ7u/jl5znU5BCauIkow/XsHub/s0T0lYX3poH5u
	 cHZPouUZSdazAL2t/SdCrrsDhU/pj65Pe5WqzwPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DF49F8013C;
	Wed,  3 Feb 2021 12:07:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9CBDF8013C; Wed,  3 Feb 2021 12:07:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0FEFF8013C
 for <alsa-devel@alsa-project.org>; Wed,  3 Feb 2021 12:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0FEFF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SSSYXeZs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 113B2ovL012450; Wed, 3 Feb 2021 05:07:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=WfsHBjJtjjULZPRCY0AJQfakOgO1ChuhQKEG2naI22I=;
 b=SSSYXeZs/JXJSaX9bOEbONOxQzST89ndYbrH6JrRqL8L5VsaRl2SpiV8YSfFuZLhSNbH
 jCetacQ6bhZbVXwMi6OJLBp1yizkXOZQXUjE4p7WjtXJZ2KMcC4RASW4CPaTAjhit/5v
 srMkm0RblQ19jviuaNC+ri4KtPu/Hg5yOsNx3VRzQU30aT6UZMpVSiUszuKcYWcuxl6E
 Jqyc295qXsVrv0NrlvAWxHIXca4jayPKzTSgp3LT+JE2o+aw2YMSSMEXCu9+Rk7tvycU
 Tyybk+lB4VjD/nWf1IcHTGrCUgj0/M+eAtrnmVWp1aNs8jZSDVuDvvkay1QggWKxXuxY Qg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 36d5r6d3ap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 03 Feb 2021 05:07:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 3 Feb 2021
 11:07:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 3 Feb 2021 11:07:00 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.44])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 52AC445;
 Wed,  3 Feb 2021 11:06:54 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH] soundwire: bus: Make sdw_nwrite() data pointer argument const
Date: Wed, 3 Feb 2021 11:06:50 +0000
Message-ID: <20210203110650.10907-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102030069
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

Idiomatically, write functions should take const pointers to the
data buffer, as they don't change the data. They are also likely to
be called from functions that receive a const data pointer.

Internally the pointer is passed to function/structs shared with
the read functions, requiring a cast, but this is an implementation
detail that should be hidden by the public API.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus.c       | 6 +++---
 include/linux/soundwire/sdw.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d9deafdcf495..4c76358416c5 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -394,13 +394,13 @@ sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 }
 
 static int
-sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
 	struct sdw_msg msg;
 	int ret;
 
 	ret = sdw_fill_msg(&msg, slave, addr, count,
-			   slave->dev_num, SDW_MSG_FLAG_WRITE, val);
+			   slave->dev_num, SDW_MSG_FLAG_WRITE, (u8 *)val);
 	if (ret < 0)
 		return ret;
 
@@ -524,7 +524,7 @@ EXPORT_SYMBOL(sdw_nread);
  * @count: length
  * @val: Buffer for values to be read
  */
-int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
 	int ret;
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f0b01b728640..18f5979d9a60 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1006,6 +1006,6 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
 int sdw_read(struct sdw_slave *slave, u32 addr);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
-int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
+int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val);
 
 #endif /* __SOUNDWIRE_H */
-- 
2.20.1

