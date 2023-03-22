Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5536C5141
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 17:51:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79B4DEAD;
	Wed, 22 Mar 2023 17:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79B4DEAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679503908;
	bh=Wjvaj4Q1DNsLS5JhNdWkktL6OlZ7R4Ran1Bpp8B9ykc=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=IQFM/bn2OoaP5jE/UV0ue6AzUom/x7OGrucD6L6UmVdnPqtrht9LfETRV9xaIzP0t
	 BjBLDV3WFLb7nY+bTxwDtcQs2L3rVPcxMPbOE7S/JMmfiixSaTNXacaNa2OPM+zLTN
	 TMvTaPYSfYngTT6rqZ4HtM3hmLY5qjr2xFaB2H78=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE83AF80527;
	Wed, 22 Mar 2023 17:50:10 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH v2 3/3] soundwire: bus: Update sdw_nread/nwrite_no_pm to
 handle page boundaries
Date: Wed, 22 Mar 2023 16:49:48 +0000
In-Reply-To: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
References: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUNW5OTDU3ZMZ2AOWCHMCJS2RHKJQTX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167950380993.26.14208364759735193730@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D540F8051B; Wed, 22 Mar 2023 17:50:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC1A4F80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 17:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC1A4F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZYchTHju
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MFCGu8005417;
	Wed, 22 Mar 2023 11:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=mquCtuwPBAYKtBO2y0kIfAC9f2JLfge3sJ7cZAhtsrg=;
 b=ZYchTHjuKLXj2UQmXz/84gs+JIC3qV3WlcoqXTjnv+CvI59bzawDnpWOPVRMSQpGEu4I
 fb6qTwByrNvKvYnTZ6d/KeD++Xue2+XZ7qilwCOlLr6gzHyttXgoES3cUt/0iC11pSAv
 Gt2dAWTRJPjGAJKNKuoB6cHgzfcffuVmnA/TWVsKGgG/l7ss8CuFXmKD9eRg6fYAy10t
 UT1prOMIkH0WD/Fqoow1qiAgRpeuIYkRh9HTGRg+mU1wsS30nPhdHHEHCQuTIBVRbMbQ
 u026Vhn8iSjNAH+TWu4A94kt+II0yzLaVx8ywKTTi7l46XtKC98h9qFpzsieeqtfCUGB yQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pdaq35kas-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 11:49:51 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 22 Mar
 2023 11:49:48 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 11:49:48 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A1EE12A1;
	Wed, 22 Mar 2023 16:49:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v2 3/3] soundwire: bus: Update sdw_nread/nwrite_no_pm to
 handle page boundaries
Date: Wed, 22 Mar 2023 16:49:48 +0000
Message-ID: <20230322164948.566962-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
References: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mkq9JCy9hJCyG5xSvx8VijlZbo0oKhb7
X-Proofpoint-GUID: mkq9JCy9hJCyG5xSvx8VijlZbo0oKhb7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EUNW5OTDU3ZMZ2AOWCHMCJS2RHKJQTX6
X-Message-ID-Hash: EUNW5OTDU3ZMZ2AOWCHMCJS2RHKJQTX6
X-MailFrom: prvs=8445e31b45=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUNW5OTDU3ZMZ2AOWCHMCJS2RHKJQTX6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently issuing a sdw_nread/nwrite_no_pm across a page boundary
will silently fail to write correctly as nothing updates the page
registers, meaning the same page of the chip will get rewritten
with each successive page of data.

As the sdw_msg structure contains page information it seems
reasonable that a single sdw_msg should always be within one
page. It is also mostly simpler to handle the paging at the
bus level rather than each master having to handle it in their
xfer_msg callback.

As such add handling to the bus code to split up a transfer into
multiple sdw_msg's when they go across page boundaries.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Switch from min to min_t to avoid the build issues on MIPs/i386
 - Added comments to the kernel doc to say that large transactions will
   be broken up.

Thanks,
Charles

 drivers/soundwire/bus.c | 63 +++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index f1ffb8e0839dd..e157a39a82ce5 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -386,27 +386,46 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
  * Read/Write IO functions.
  */
 
+static int sdw_ntransfer_no_pm(struct sdw_slave *slave, u32 addr, u8 flags,
+			       size_t count, u8 *val)
+{
+	struct sdw_msg msg;
+	size_t size;
+	int ret;
+
+	while (count) {
+		// Only handle bytes up to next page boundary
+		size = min_t(size_t, count, (SDW_REGADDR + 1) - (addr & SDW_REGADDR));
+
+		ret = sdw_fill_msg(&msg, slave, addr, size, slave->dev_num, flags, val);
+		if (ret < 0)
+			return ret;
+
+		ret = sdw_transfer(slave->bus, &msg);
+		if (ret < 0 && !slave->is_mockup_device)
+			return ret;
+
+		addr += size;
+		val += size;
+		count -= size;
+	}
+
+	return 0;
+}
+
 /**
  * sdw_nread_no_pm() - Read "n" contiguous SDW Slave registers with no PM
  * @slave: SDW Slave
  * @addr: Register address
  * @count: length
  * @val: Buffer for values to be read
+ *
+ * Note that if the message crosses a page boundary each page will be
+ * transferred under a separate invocation of the msg_lock.
  */
 int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
-	struct sdw_msg msg;
-	int ret;
-
-	ret = sdw_fill_msg(&msg, slave, addr, count,
-			   slave->dev_num, SDW_MSG_FLAG_READ, val);
-	if (ret < 0)
-		return ret;
-
-	ret = sdw_transfer(slave->bus, &msg);
-	if (slave->is_mockup_device)
-		ret = 0;
-	return ret;
+	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_READ, count, val);
 }
 EXPORT_SYMBOL(sdw_nread_no_pm);
 
@@ -416,21 +435,13 @@ EXPORT_SYMBOL(sdw_nread_no_pm);
  * @addr: Register address
  * @count: length
  * @val: Buffer for values to be written
+ *
+ * Note that if the message crosses a page boundary each page will be
+ * transferred under a separate invocation of the msg_lock.
  */
 int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
-	struct sdw_msg msg;
-	int ret;
-
-	ret = sdw_fill_msg(&msg, slave, addr, count,
-			   slave->dev_num, SDW_MSG_FLAG_WRITE, (u8 *)val);
-	if (ret < 0)
-		return ret;
-
-	ret = sdw_transfer(slave->bus, &msg);
-	if (slave->is_mockup_device)
-		ret = 0;
-	return ret;
+	return sdw_ntransfer_no_pm(slave, addr, SDW_MSG_FLAG_WRITE, count, (u8 *)val);
 }
 EXPORT_SYMBOL(sdw_nwrite_no_pm);
 
@@ -566,6 +577,8 @@ EXPORT_SYMBOL(sdw_update);
  *
  * This version of the function will take a PM reference to the slave
  * device.
+ * Note that if the message crosses a page boundary each page will be
+ * transferred under a separate invocation of the msg_lock.
  */
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
@@ -593,6 +606,8 @@ EXPORT_SYMBOL(sdw_nread);
  *
  * This version of the function will take a PM reference to the slave
  * device.
+ * Note that if the message crosses a page boundary each page will be
+ * transferred under a separate invocation of the msg_lock.
  */
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
-- 
2.30.2

