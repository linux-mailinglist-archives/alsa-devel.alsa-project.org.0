Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBCC63255B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Nov 2022 15:16:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6F3E1670;
	Mon, 21 Nov 2022 15:15:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6F3E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669040184;
	bh=O6vVvWh444zhFC14z+/sZaDEByH+7xxzgcMXcz4I9/o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWAETWLr9fRAcn8jHEx5wfuosBB8LUkve4DIIFXT8H+iaDil47J9ethU+WrB4Ojq5
	 GalNZiu/5ZNx5Bm/w7seoF7KvmpW2cBswggZDA5UN/d4Fgj2Q4k9uxep8KThQ7viQf
	 KqZKEqBdtUvKVbk4Bt51YXQzoraOEcKTZvYK6Hrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F69FF80567;
	Mon, 21 Nov 2022 15:14:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F0C8F800F3; Mon, 21 Nov 2022 15:14:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B1AEF800EC
 for <alsa-devel@alsa-project.org>; Mon, 21 Nov 2022 15:14:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B1AEF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ioerokhu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ALCtMm7002614; Mon, 21 Nov 2022 08:14:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=WILxXOGhVNe0I1FxujLIVVqB4+tPaZ++Vr7hhtDWbqs=;
 b=ioerokhuKZoqvR3K7pix02NpMfGyL5qqW/rEMGyoyPYhLNNWG8p5v0sUuylsvXhA3TGM
 WFLXnRTT/bEWsWraN17qyfuxjACGpxfJBH0Lv/85J3/viX27+UU7Oft2m/A12NsHkhHG
 lP3pVekYOm12/9iguPtag9SIMSU99db7quQThGvaTbh5uq6MYgVrv7WmWT0g+r6d5Gyv
 cD3jnkx2PfNtg0dB18yU+14vUZ1z1Sa2w2f6JxnCwkqKHuCRC4pQaEFTxBECh1l3AzWJ
 E8P/9fISQXJDtL+Ytrvtoa5FGqYeZAhGzhKrnZXItGlp0K4jmjBGU9LYtfqcbBzJzNSn NQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3kxwe6t7hc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Nov 2022 08:14:08 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 21 Nov
 2022 08:14:06 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Mon, 21 Nov 2022 08:14:06 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6CB70B12;
 Mon, 21 Nov 2022 14:14:06 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v3 1/4] soundwire: bus: export sdw_nwrite_no_pm and
 sdw_nread_no_pm functions
Date: Mon, 21 Nov 2022 14:14:03 +0000
Message-ID: <20221121141406.3840561-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221121141406.3840561-1-ckeepax@opensource.cirrus.com>
References: <20221121141406.3840561-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: T_-eze7Qsgl43ayYLL3p2fVkp_rWd3ob
X-Proofpoint-GUID: T_-eze7Qsgl43ayYLL3p2fVkp_rWd3ob
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com
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

From: Simon Trimmer <simont@opensource.cirrus.com>

The commit 167790abb90f ("soundwire: export sdw_write/read_no_pm
functions") exposed the single byte no_pm versions of the IO functions
that can be used without touching PM, export the multi byte no_pm
versions for the same reason.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v2:
 - Added Pierre's reviewed-by.

 drivers/soundwire/bus.c       | 8 ++++----
 include/linux/soundwire/sdw.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 76515c33e639e..ef4878258afad 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -414,8 +414,7 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
  * all clients need to use the pm versions
  */
 
-static int
-sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
+int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
 	struct sdw_msg msg;
 	int ret;
@@ -430,9 +429,9 @@ sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 		ret = 0;
 	return ret;
 }
+EXPORT_SYMBOL(sdw_nread_no_pm);
 
-static int
-sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
+int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
 	struct sdw_msg msg;
 	int ret;
@@ -447,6 +446,7 @@ sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 		ret = 0;
 	return ret;
 }
+EXPORT_SYMBOL(sdw_nwrite_no_pm);
 
 int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
 {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 9e4537f409c29..902ed46f76c80 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1047,7 +1047,9 @@ int sdw_write(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value);
 int sdw_read_no_pm(struct sdw_slave *slave, u32 addr);
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
+int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val);
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val);
+int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val);
 int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
 int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u8 val);
 
-- 
2.30.2

