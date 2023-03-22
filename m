Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2E76C513F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 17:51:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A88EA1;
	Wed, 22 Mar 2023 17:50:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A88EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679503907;
	bh=IP2dF9oBrEzN2lgHpgb1b2TaB84m9D5vd9M39Y5oOjk=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=K4A4BNaS7YEliLrwvlLfK02c2aS8tiI2pNMM8O0asg3uX55TkYSwBcJNCbE9sOgw5
	 mbN61h085WJLiQcuoHLmDEb+i52ks7dkHPizn7aJ5btqHMYWgyUvjaVmTttxlO4lRA
	 Vq8FiYYj8U5TR/YvqyeBpwkCKXUb1amME3Ax7M4k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F99CF80520;
	Wed, 22 Mar 2023 17:50:06 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH v2 2/3] soundwire: bus: Update kernel doc for no_pm functions
Date: Wed, 22 Mar 2023 16:49:47 +0000
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2DEHTFX3TA2WRAXUG5BNWOTDAA6UTS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167950380624.26.3384712627903703541@mailman-core.alsa-project.org>
From: Charles Keepax via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61C36F802E8; Wed, 22 Mar 2023 17:50:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0853BF8027B
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 17:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0853BF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=isjU5fty
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32MFCGu7005417;
	Wed, 22 Mar 2023 11:49:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=CvbpM7WR/Bt259MLfa0S+iPS8KiWtnrCFDI2DEjN9Mw=;
 b=isjU5ftyTyQItP4ozsULwY35Z3mk3JTyt+2b4qmIPHQWH9/Arwxce4b/YRNRQ46mThQo
 GUjAN0vv+g+THVnaqJLUeynewT2hrfzd7ykcKIVpW2+gzrhFpz8ha7YEWk2C6xhvrKHG
 PvivcE4QqMkBO3m2PAmFgcfuCKYeB8+Vk5GjNIOBuJ+CMHfx+SKOH+p8gBiBnGh8O1TI
 XSTfVaByZHfbGwhs42aljcsO8Dm2WViDd1BWurWOhbjKIvgM3+jhNjkwPrx80JePCVl1
 hpuhq2pcY2/Hz4U5B9jF1oyFmf/ZW2VceBMbmLsALdqYNUkp1zW8k+5PbVYkajywooCO Sg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pdaq35kas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 11:49:50 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Wed, 22 Mar
 2023 11:49:48 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 11:49:48 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9C50211D4;
	Wed, 22 Mar 2023 16:49:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <vkoul@kernel.org>
Subject: [PATCH v2 2/3] soundwire: bus: Update kernel doc for no_pm functions
Date: Wed, 22 Mar 2023 16:49:47 +0000
Message-ID: <20230322164948.566962-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
References: <20230322164948.566962-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: eiduvY9ibwKfy8BCiu322qMcjZXVzvqn
X-Proofpoint-GUID: eiduvY9ibwKfy8BCiu322qMcjZXVzvqn
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: T2DEHTFX3TA2WRAXUG5BNWOTDAA6UTS3
X-Message-ID-Hash: T2DEHTFX3TA2WRAXUG5BNWOTDAA6UTS3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2DEHTFX3TA2WRAXUG5BNWOTDAA6UTS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The kernel doc should really have been updated when the no_pm versions
of the sdw_write/read functions were exported in commits:

commit 167790abb90f ("soundwire: export sdw_write/read_no_pm functions")
commit 62dc9f3f2fd0 ("soundwire: bus: export sdw_nwrite_no_pm and
                      sdw_nread_no_pm functions")

Add the missing kernel doc.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

New since v1.

 drivers/soundwire/bus.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 3c67266f94834..f1ffb8e0839dd 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -386,6 +386,13 @@ int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
  * Read/Write IO functions.
  */
 
+/**
+ * sdw_nread_no_pm() - Read "n" contiguous SDW Slave registers with no PM
+ * @slave: SDW Slave
+ * @addr: Register address
+ * @count: length
+ * @val: Buffer for values to be read
+ */
 int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
 	struct sdw_msg msg;
@@ -403,6 +410,13 @@ int sdw_nread_no_pm(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 }
 EXPORT_SYMBOL(sdw_nread_no_pm);
 
+/**
+ * sdw_nwrite_no_pm() - Write "n" contiguous SDW Slave registers with no PM
+ * @slave: SDW Slave
+ * @addr: Register address
+ * @count: length
+ * @val: Buffer for values to be written
+ */
 int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
 	struct sdw_msg msg;
@@ -420,6 +434,12 @@ int sdw_nwrite_no_pm(struct sdw_slave *slave, u32 addr, size_t count, const u8 *
 }
 EXPORT_SYMBOL(sdw_nwrite_no_pm);
 
+/**
+ * sdw_write_no_pm() - Write a SDW Slave register with no PM
+ * @slave: SDW Slave
+ * @addr: Register address
+ * @value: Register value
+ */
 int sdw_write_no_pm(struct sdw_slave *slave, u32 addr, u8 value)
 {
 	return sdw_nwrite_no_pm(slave, addr, 1, &value);
@@ -492,6 +512,11 @@ int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 val
 }
 EXPORT_SYMBOL(sdw_bwrite_no_pm_unlocked);
 
+/**
+ * sdw_read_no_pm() - Read a SDW Slave register with no PM
+ * @slave: SDW Slave
+ * @addr: Register address
+ */
 int sdw_read_no_pm(struct sdw_slave *slave, u32 addr)
 {
 	u8 buf;
@@ -538,6 +563,9 @@ EXPORT_SYMBOL(sdw_update);
  * @addr: Register address
  * @count: length
  * @val: Buffer for values to be read
+ *
+ * This version of the function will take a PM reference to the slave
+ * device.
  */
 int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 {
@@ -562,6 +590,9 @@ EXPORT_SYMBOL(sdw_nread);
  * @addr: Register address
  * @count: length
  * @val: Buffer for values to be written
+ *
+ * This version of the function will take a PM reference to the slave
+ * device.
  */
 int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
 {
@@ -584,6 +615,9 @@ EXPORT_SYMBOL(sdw_nwrite);
  * sdw_read() - Read a SDW Slave register
  * @slave: SDW Slave
  * @addr: Register address
+ *
+ * This version of the function will take a PM reference to the slave
+ * device.
  */
 int sdw_read(struct sdw_slave *slave, u32 addr)
 {
@@ -603,6 +637,9 @@ EXPORT_SYMBOL(sdw_read);
  * @slave: SDW Slave
  * @addr: Register address
  * @value: Register value
+ *
+ * This version of the function will take a PM reference to the slave
+ * device.
  */
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value)
 {
-- 
2.30.2

