Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE2C7578A
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:52:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E292660228;
	Thu, 20 Nov 2025 17:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E292660228
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657528;
	bh=QJINeZ1JjUq3xHFvQnlau7TuGqu0FlWrXLDLjruHQe8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oTDMYfpKESKLjJMiNWF5yX/yvwkkD6fftfajbPQq4ESubvqjEcErjWtIB5NkRwjY+
	 L901Qp1WMkXlfIe4yG8btgRIwjXE3tIkDtVtWqP9xTpmULYdtx1FwRgr0TrFRrOwTf
	 lONZyFdKf0QaNDJ3C/TA4mTa8dzF1uCfdsFMCAx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D6CBF805F0; Thu, 20 Nov 2025 17:51:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7F1F805F3;
	Thu, 20 Nov 2025 17:51:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1CA0F8021D; Thu, 20 Nov 2025 10:21:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012031.outbound.protection.outlook.com
 [40.107.200.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9390BF8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:21:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9390BF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=VFJrSRQY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGTMSZoJbzoi1ihM1y7k0U+McNN3Ewz83pnkt+nAJJGHBn/RZnDXsJVB4m0gxSIrM53VwiWtGu8d5kG/ODbapW4jWJGj8L+vUJpbXX+p5C180Jwp0lMqKuXcCKhwL31KY29vOEkzPH8bOEgV/APbKJ1MzYN2VpLDVlZ0a4AEaZgAnRRBGu4FwEXhhW4Ftg6AI0xV8axpagPPqPw/tttiA56ZzGsFVGhWDTEgAbThLC8AcqadU9Feqh4QVbgyUu8iyLkKgBPMKL1W5FwLh21CA9syH+0Pmh2mDCSzssY9vfw5+jVcvxgwiyW9DD3KJ8AuPFDDRNIiiSjG8jimwAv1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMidqFiYXvT/YbK3JP/8wiqj/Y/dyXJP/8GTT2m2suk=;
 b=MUKblLLPH6+D/u8rt+Qf6V13VJ2W7XkjvaOV3rTf36IdvHblWavRmHdj45HP+JBDzsXu11q3598o1VAUE3V+BoboGxPgbjU6H8QpWS24C68ainZFoysDGqLJ5Gc8MUkUFjqOTuC1phUuTu1BgpuzN2E1UXM2TddL3HRYGg2kWBfI0GkkPVjKNbUHQh+eCG4eueNB6RzzmleBkWueO+mkaQGYU0TYSqR9cXygsyYU3QgF5EsJDNmY/vpwQwRyzDLbBnn2C1WIulfZ72fKy8AfsbP3QryW+o0eAcvb1WPC6NYP95uWQnFMPIzZWgX1StHtp8vBRfhoDlzTLbPpYUXn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMidqFiYXvT/YbK3JP/8wiqj/Y/dyXJP/8GTT2m2suk=;
 b=VFJrSRQYeT8bwY3de5b8JKRxbQQVVNyEGGMusegx/aXxru6WbogMDyLjUrdDuCyogm6r6sGQdH9vsRl5pjmJYD9kTKM8cuW8gkT5TxW2qs4707N+OTw0ZEEq2EjARm2hvFUj8s9yAo1ipWVoeOx02Zw/+O/hcoQOP4+ABBRpY7Q=
Received: from CH2PR07CA0040.namprd07.prod.outlook.com (2603:10b6:610:5b::14)
 by SA3PR10MB7044.namprd10.prod.outlook.com (2603:10b6:806:31c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:21:20 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::6e) by CH2PR07CA0040.outlook.office365.com
 (2603:10b6:610:5b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:21:18 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:15 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:21:15 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c23383883;
	Thu, 20 Nov 2025 03:21:10 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <ckeepax@opensource.cirrus.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <navada@ti.com>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 2/8] ASoC: tas2783A: use custom firmware
Date: Thu, 20 Nov 2025 14:50:44 +0530
Message-ID: <20251120092050.1218-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251120092050.1218-1-niranjan.hy@ti.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SA3PR10MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 3caa45eb-e682-4bfe-ef26-08de281629a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EX8J6vrLe548WlcNRJuCTz0REv6XdqMTfuPw2EdPcx+6GhCokou4kQ4K3Vky?=
 =?us-ascii?Q?yzUi1UotJsXc7zX7zdJ5cfw95a3UGhg9zp2jMxC3HqnWCt45ZRflVbTRv3Ut?=
 =?us-ascii?Q?M8jwNIF/kzAs7IXecECw5Cz+QFQsTS6qFC0WzpaxJ6ThNQwwzl2fG53drHhY?=
 =?us-ascii?Q?cqK2xa4hxpe2Q4cGLPSm3uH+oDpdu6CbKDqN3BzykJ7A7G5AUrle1Tv7SH+3?=
 =?us-ascii?Q?hz6LtKKO5wyy7xhFM6eNH2sJeJ0mh4jTSdr6yxfTbqjzekMXCfnl6d1ZBokU?=
 =?us-ascii?Q?quxUCeZK4uZTBcnL9FiWXcxzOOwtypiUNi9lZQpjeCN5U8WOe9wuupPaFign?=
 =?us-ascii?Q?Xc+dDX4HRwGkJs+vvG59C1c2wSgLZEqwL08XZtg9D0XfnlxsAxcmIDDrqafI?=
 =?us-ascii?Q?Upr6FxcEEBu0gQVHEpHAYO2N9a6CMuf5ms5nW+WfXcqE08DQB2OO4ZucOplG?=
 =?us-ascii?Q?ihwrlabrOVRUuDIrCI0fbaHTlLqmqhe6JiEWDobeii/KCO8255BZa0eMYKkO?=
 =?us-ascii?Q?JchAkNW3JX0koqKiUe0N24ski8VT2onoAePR9gz4zkbYikYMn4alyslvdpLC?=
 =?us-ascii?Q?2J3X8lFXhDFdczuh2D7vvN8yX+m67cA+Cq8ue4zk+uGXiUptWuy2YNt5Agum?=
 =?us-ascii?Q?0hppIoQk0yYCHwk640XNBmbdkV2z6S37phbksBfCB/w1mZszGqUq/SDyWz45?=
 =?us-ascii?Q?/ywxZVsz1GJNTIczuyrkoNemteLPzr0RNxr6q/nJ5iCxKxLHDbUZPn8LRDjh?=
 =?us-ascii?Q?dj9Ea2WUblOg/28fv5BC8X0Yc3ALW9hoeTNCrI9+Han+58ZZ4qbRAXa3otEv?=
 =?us-ascii?Q?X4gbHO4gjN8B45lJT4VPakqmpo1qbtSsjjdnRILoAss5HjrUecKpgTkhwqLR?=
 =?us-ascii?Q?Hb7XDLAMlIWb5qMwU76pv2M+ElcNUnoNNYndwWyDbnWSpo4Xx9J6awmpiFLp?=
 =?us-ascii?Q?zID4m6Xo5awzpCVQ2/5bac0jzLjv61agkEF22NnDIcyU0lDP5WTnM/ZXzTLn?=
 =?us-ascii?Q?+8bvbCBE3gpcW8Fn9CR+EjJZYHzE8+Zba5frnCUf2HJ2WT/gXTMo71v3waEY?=
 =?us-ascii?Q?YubZX6ZohCdCNHOAeHygqU9V7HAUWlAP8DZGVYhf1fUqSWRgyjjY1+G6v0Vh?=
 =?us-ascii?Q?iKzVf23nkgPgW0vivJHRhzxR8U60sHr6rk7k5d4w5655hdx2Y0W6564U/wuT?=
 =?us-ascii?Q?l7jA3qR6IKbXyjmucmqHujJHxpBF3j2vF1aEzoRr1jB7TKUPYud2MDzPwJKw?=
 =?us-ascii?Q?W328f9IZI+lwA6pkwbk0vTiPcI0Si+Y86n+7z2U8hERev+ZzeP7QN6yqoihM?=
 =?us-ascii?Q?HHrx+qtRRyVcu4+YetIq9fbmswZKWdtsB/Y9W+0fsz1JQa/HrmjSX4G9SbeG?=
 =?us-ascii?Q?fLgID7gwQ8s5wKhEai9EyMfTES51cAdRfnW6kgnTYYr/TkOKRsP8XGq+GzLs?=
 =?us-ascii?Q?zZS8S5S406KJ/MS5JmaVVMq9tf0NEp8uo84gjPXSDIptozsqh8nIHB8TV2YP?=
 =?us-ascii?Q?LnyHbVxZR4PZ8hAgSKOwlGXVCv4GI9ZMF5zPgf96Enzct2GLXmVlFfW4+8Hz?=
 =?us-ascii?Q?Pl6g713O3mEBFCI56tI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:21:18.5671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3caa45eb-e682-4bfe-ef26-08de281629a6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7044
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: V6HK26UBG5FQOKYXHFK7OBSGFSBMUMMC
X-Message-ID-Hash: V6HK26UBG5FQOKYXHFK7OBSGFSBMUMMC
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6HK26UBG5FQOKYXHFK7OBSGFSBMUMMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the firmware version same as in Windows
projects. The firmware contains algorithm
parameters and some device configuration
writes which are part of the same firmware file.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 147 +++++++++++++++++++--------------
 sound/soc/codecs/tas2783.h     |   1 +
 2 files changed, 85 insertions(+), 63 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 43b779873..6a0644670 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -35,8 +35,8 @@
 #include "tas2783.h"
 
 #define TIMEOUT_FW_DL_MS (3000)
-#define FW_DL_OFFSET	36
-#define FW_FL_HDR	12
+#define FW_DL_OFFSET	84 /* binary file information */
+#define FW_FL_HDR	20 /* minimum number of bytes in one chunk */
 #define TAS2783_PROBE_TIMEOUT 5000
 #define TAS2783_CALI_GUID EFI_GUID(0x1f52d2a1, 0xbb3a, 0x457d, 0xbc, \
 				   0x09, 0x43, 0xa3, 0xf4, 0x31, 0x0a, 0x92)
@@ -49,11 +49,22 @@ static const u32 tas2783_cali_reg[] = {
 	TAS2783_CAL_TLIM,
 };
 
-struct bin_header_t {
-	u16 vendor_id;
-	u16 version;
+struct tas_fw_hdr {
+	u32 size;
+	u32 version_offset;
+	u32 plt_id;
+	u32 ppc3_ver;
+	u32 timestamp;
+	u8 ddc_name[64];
+};
+
+struct tas_fw_file {
+	u32 vendor_id;
 	u32 file_id;
+	u32 version;
 	u32 length;
+	u32 dest_addr;
+	u8 *fw_data;
 };
 
 struct calibration_data {
@@ -735,13 +746,28 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 	return ret;
 }
 
-static s32 read_header(const u8 *data, struct bin_header_t *hdr)
+static s32 tas_fw_read_hdr(const u8 *data, struct tas_fw_hdr *hdr)
+{
+	hdr->size = get_unaligned_le32(data);
+	hdr->version_offset = get_unaligned_le32(&data[4]);
+	hdr->plt_id = get_unaligned_le32(&data[8]);
+	hdr->ppc3_ver = get_unaligned_le32(&data[12]);
+	memcpy(hdr->ddc_name, &data[16], 64);
+	hdr->timestamp = get_unaligned_le32(&data[80]);
+
+	return 84;
+}
+
+static s32 tas_fw_get_next_file(const u8 *data, struct tas_fw_file *file)
 {
-	hdr->vendor_id = get_unaligned_le16(&data[0]);
-	hdr->file_id = get_unaligned_le32(&data[2]);
-	hdr->version = get_unaligned_le16(&data[6]);
-	hdr->length = get_unaligned_le32(&data[8]);
-	return 12;
+	file->vendor_id = get_unaligned_le32(&data[0]);
+	file->file_id = get_unaligned_le32(&data[4]);
+	file->version = get_unaligned_le32(&data[8]);
+	file->length = get_unaligned_le32(&data[12]);
+	file->dest_addr = get_unaligned_le32(&data[16]);
+	file->fw_data = (u8 *)&data[20];
+
+	return file->length + sizeof(u32) * 5;
 }
 
 static void tas2783_fw_ready(const struct firmware *fmw, void *context)
@@ -749,13 +775,20 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 	struct tas2783_prv *tas_dev =
 		(struct tas2783_prv *)context;
 	const u8 *buf = NULL;
-	s32 offset = 0, img_sz, file_blk_size, ret;
-	struct bin_header_t hdr;
+	s32  img_sz, ret = 0, cur_file = 0;
+	s32 offset = 0;
+
+	struct tas_fw_hdr *hdr __free(kfree) = kzalloc(sizeof(*hdr), GFP_KERNEL);
+	struct tas_fw_file *file __free(kfree) = kzalloc(sizeof(*file), GFP_KERNEL);
+	if (!file || !hdr) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	if (!fmw || !fmw->data) {
-		/* No firmware binary, devices will work in ROM mode. */
+		/* firmware binary not found*/
 		dev_err(tas_dev->dev,
-			"Failed to read %s, no side-effect on driver running\n",
+			"Failed to read fw binary %s\n",
 			tas_dev->rca_binaryname);
 		ret = -EINVAL;
 		goto out;
@@ -763,67 +796,47 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
 
 	img_sz = fmw->size;
 	buf = fmw->data;
-	offset += FW_DL_OFFSET;
-	if (offset >= (img_sz - FW_FL_HDR)) {
-		dev_err(tas_dev->dev,
-			"firmware is too small");
+	offset += tas_fw_read_hdr(buf, hdr);
+	if (hdr->size != img_sz) {
 		ret = -EINVAL;
+		dev_err(tas_dev->dev, "firmware size mismatch with header");
+		goto out;
+	}
+
+	if (img_sz < FW_DL_OFFSET) {
+		ret = -EINVAL;
+		dev_err(tas_dev->dev, "unexpected size, size is too small");
 		goto out;
 	}
 
 	mutex_lock(&tas_dev->pde_lock);
 	while (offset < (img_sz - FW_FL_HDR)) {
-		memset(&hdr, 0, sizeof(hdr));
-		offset += read_header(&buf[offset], &hdr);
+		offset += tas_fw_get_next_file(&buf[offset], file);
 		dev_dbg(tas_dev->dev,
-			"vndr=%d, file=%d, version=%d, len=%d, off=%d\n",
-			hdr.vendor_id, hdr.file_id, hdr.version,
-			hdr.length, offset);
-		/* size also includes the header */
-		file_blk_size = hdr.length - FW_FL_HDR;
-
-		/* make sure that enough data is there */
-		if (offset + file_blk_size > img_sz) {
-			ret = -EINVAL;
+			"v=%d, fid=%d, ver=%d, len=%d, daddr=0x%x, fw=%p",
+			file->vendor_id, file->file_id,
+			file->version, file->length,
+			file->dest_addr, file->fw_data);
+
+		ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
+				       file->dest_addr,
+				       file->length,
+				       file->fw_data);
+		if (ret < 0) {
 			dev_err(tas_dev->dev,
-				"corrupt firmware file");
+				"FW download failed: %d", ret);
 			break;
 		}
-
-		switch (hdr.file_id) {
-		case 0:
-			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
-					       PRAM_ADDR_START, file_blk_size,
-					       &buf[offset]);
-			if (ret < 0)
-				dev_err(tas_dev->dev,
-					"PRAM update failed: %d", ret);
-			break;
-
-		case 1:
-			ret = sdw_nwrite_no_pm(tas_dev->sdw_peripheral,
-					       YRAM_ADDR_START, file_blk_size,
-					       &buf[offset]);
-			if (ret < 0)
-				dev_err(tas_dev->dev,
-					"YRAM update failed: %d", ret);
-
-			break;
-
-		default:
-			ret = -EINVAL;
-			dev_err(tas_dev->dev, "Unsupported file");
-			break;
-		}
-
-		if (ret == 0)
-			offset += file_blk_size;
-		else
-			break;
+		cur_file++;
 	}
 	mutex_unlock(&tas_dev->pde_lock);
-	if (!ret)
+
+	if (cur_file == 0) {
+		dev_err(tas_dev->dev, "fw with no files");
+		ret = -EINVAL;
+	} else {
 		tas2783_update_calibdata(tas_dev);
+	}
 
 out:
 	if (!ret)
@@ -1211,6 +1224,14 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 
 	tas_dev->fw_dl_task_done = false;
 	tas_dev->fw_dl_success = false;
+
+	ret = regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
+	if (ret) {
+		dev_err(dev, "sw reset failed, err=%d", ret);
+		return ret;
+	}
+	usleep_range(2000, 2200);
+
 	scnprintf(tas_dev->rca_binaryname, sizeof(tas_dev->rca_binaryname),
 		  "tas2783-%01x.bin", unique_id);
 
diff --git a/sound/soc/codecs/tas2783.h b/sound/soc/codecs/tas2783.h
index 794333e0a..bf34319c9 100644
--- a/sound/soc/codecs/tas2783.h
+++ b/sound/soc/codecs/tas2783.h
@@ -28,6 +28,7 @@
 #define TASDEV_REG_SDW(book, page, reg)	(((book) * 256 * 128) + \
 		0x800000 + ((page) * 128) + (reg))
 
+#define TAS2783_SW_RESET	TASDEV_REG_SDW(0x0, 0x00, 0x01)
 /* Volume control */
 #define TAS2783_DVC_LVL		TASDEV_REG_SDW(0x0, 0x00, 0x1A)
 #define TAS2783_AMP_LEVEL	TASDEV_REG_SDW(0x0, 0x00, 0x03)
-- 
2.25.1

