Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0AACC6B7E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:11:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDBC46024B;
	Wed, 17 Dec 2025 10:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDBC46024B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962666;
	bh=0Hm3/88LcB7AlZRbOAzrgG5OMFQnurWV1feKa8BCu1Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EaOhFZ2ayJZTZIF+i7MTQOkpgVsQK/Lp9MHUk0ACGw58gNdk2oe/mY7aMZWeW1BFH
	 PN/tVFdec9Caixw8I/sUEOhdogFfBVzcLxXRPT26Q2e4xuhWoHhsgnt94COyWUt91b
	 4Ox197IZn5ObsRk7B+NUdALvvml5hjZmcyuzIdTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF76DF80621; Wed, 17 Dec 2025 10:10:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F984F8060F;
	Wed, 17 Dec 2025 10:10:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79E18F8045D; Mon, 15 Dec 2025 16:32:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06376F80107
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 16:32:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06376F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=w8u012o6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NgKnXM4py8vtILeOVihrNaQUrARc+aiMxIbP+VOnyVn7mN4TQfVKIOXyvoM0orn/tnN66tN7GoU74btEu5zKePlucG83woRiXJo8AG2fUkjXENW+e2dkuMjN3hHdCscT0qXkY3nJlCCA2/pVRYdfGj8QPVMe0NTCjI4wBuoRC7TrnTFpcqiLCwnHIG41VesG3gN9Ns0SQr6V0NP7fzwnJhjWVPWj1D4jOPpaKRuLIvLsZyy0/C9yjZ3A+MjmfrBZ94P8eL9ugOcjislrNTNzOCMFigPcTE1M0n8qJ2XTI8TDCTq8XMS/AkpMJwm/e8fuvVUpFuIevVLI6NM3jHxzVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flNysSOcVPtyvl6ZP/jaID7I3g7c9ik40dCX5qBEH7w=;
 b=Xc/KXEIrZ7A9hOr2cvUkwL7u/Pb2rl2ahCSeQADjMLtc0ZWIisWyhnYBQL+yRcMfY2fGDsMQ9+wsUwdYNma/qDUECd1Ce0pXPT4tomr3Op4JEgZI3NlFrSsTh6Im/kjaO2IQZoiLMu5bRJk4j73p4Ewjitf5jNsP5gZfvj1uYBx9oXadJvz2XfbvxQ+sbflP8weGyrCuK3UCejFu5hI7s+ch/eeNpq+6Wf+Fl+S2KC7mvf5ki43i9k+f4Jph6oBiAFQWbxO0LXGqQD7JoxFZyU94kwUvDt0C4CaAtjx1rdPguu4HCxlAp3XetKpKqw33pWMeRsqJsNdx5iZvp/npUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flNysSOcVPtyvl6ZP/jaID7I3g7c9ik40dCX5qBEH7w=;
 b=w8u012o65sHyKxlzZWjNyIaDRooToUeDGVRvNU/2qOAPyov0SqcFxKG6ems2tazkAIfFa64KEK0U67qQCx24T7bQyd2fDjgwy8JXJJ4je1SUNBGiwrEVbEo6SE/ZqM50Ns4JOcIU7qtC/yoKlKaxlstbvI804o8pvABlrZ1tmkU=
Received: from SJ0PR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:33b::28)
 by DM6PR10MB4282.namprd10.prod.outlook.com (2603:10b6:5:222::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:32:45 +0000
Received: from MWH0EPF000989E9.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::c3) by SJ0PR05CA0023.outlook.office365.com
 (2603:10b6:a03:33b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Mon,
 15 Dec 2025 15:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000989E9.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:32:44 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:41 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:32:41 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:32:41 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTtV2639809;
	Mon, 15 Dec 2025 09:32:36 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 2/8] ASoC: tas2783A: use custom firmware
Date: Mon, 15 Dec 2025 21:02:13 +0530
Message-ID: <20251215153219.810-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E9:EE_|DM6PR10MB4282:EE_
X-MS-Office365-Filtering-Correlation-Id: f4cbb09e-3bd6-46d3-2e60-08de3bef3179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6iZdeCGgI4KytDvRH0QbZIbJQOWOx0aplgJfxTwDmmRXM3csz+szMB4Cox2T?=
 =?us-ascii?Q?tkabqcFk0P8Ew59Cb1DKrRyENKQTEOwvp09PvZ8Izw2fdhWh60PxSbwkYzhz?=
 =?us-ascii?Q?V0lsuo39HUAhgcrQ2GDSnLLZ1z/KDPSkxqccck/I1+bAxvXvx6jrRZv6NgI1?=
 =?us-ascii?Q?dPIahIWa3D2byAMtqonCT3cyTyUmDMILKEoTOqnY9ir0bsrHJ9P3peqaDEDJ?=
 =?us-ascii?Q?nQTrlcYBbf4jVWG1aS3i0PYGh7XZkUWqXvqWMxVTV8Ku7JFCkaKfWRqgJeCc?=
 =?us-ascii?Q?J8jXpAp0dJADRCOJLqQU0tOpUhPsgXNgOalFPKEpyA/paZkRvuWnIE1IarRb?=
 =?us-ascii?Q?mgH7TzCVKifRTqPCBwsImyQcm12tEV+HoukLpdkcbt5YOYJggqxAsUE+5cXs?=
 =?us-ascii?Q?7gx9GX3Cxdgo1TUPZeTFqzsGXiMGOcJtfAvFzuBUx4jv6JAT92CGZfaXbLxF?=
 =?us-ascii?Q?BYePibTLvVyJPq38r2xYPzgcj18aC2yPsPM4Z2loe6Q/WyteJfBgjvgbns6a?=
 =?us-ascii?Q?IMfZ+lIIQZKO2T/CkI3S3+tYIgkVAxyW8ihirAcqQp7X7vdmP4J1PDaknz4O?=
 =?us-ascii?Q?1vBCLl2ttsZJlXDzHfpBfSytkDKpApwbfGHIUXr4zf9NDZIJiZTrGwqTb/Q+?=
 =?us-ascii?Q?x3CGFOhD96/4MNZLxgHsfb2Z881kiHi9/26oCjg0ta/3PBsSHNfIw7fu1ml7?=
 =?us-ascii?Q?iwtO8tpDOuH0gw0KK/b1I8n5c9CQLNA4MzwLsE1RgQeMnqB8Fy2uiDeVncik?=
 =?us-ascii?Q?ZkvOqWDTJqt7uDIE+SM2ebhCDLQSaThFso/GEgaEfgk6xyLzaix1XtRdhhm0?=
 =?us-ascii?Q?HPh+NBHucXlsIc6cTcM0Cqq4eA1J3GKTXbNyYudnC/mmr7pv14/ujn1k+60r?=
 =?us-ascii?Q?5CoqMs5NRtEGGXYdZ6NskI/nzXOEjVzUgiwoHniG3/1B7QTL4YS/K4kz6QcH?=
 =?us-ascii?Q?fdO2mwsqKH+XvxaJr0BVuthrg0W3aCrNHmsTVMpz96USBtewkl1xFoKTriHU?=
 =?us-ascii?Q?nrq1/NtApKysxz8Wx+f4TYs2+4KtDhZsJWDQOkojxYFHPwY9Z/EVwy1aeQPr?=
 =?us-ascii?Q?jm26Ty51neCznxOHTT5kDeRRltU+Yyw6YmjE9ZGlyUn6VGbd8cafgsLEqLFA?=
 =?us-ascii?Q?dYSCUl/ycOwyVzENGANKBquiv9ZWO/vqrzgYlMKYj349a03DfHNGBIEotxyu?=
 =?us-ascii?Q?yPPlWvs/7i1Q20bjP980zgAsj2eBhLMfXtL5tob+vrNFE6lHsnG9YW9d9Bq2?=
 =?us-ascii?Q?gAcL7uDHMJwsXI5KLXf5FFRr/3SeDNPGSO+ATXBxkg+B2h63ZgI0Wkrzhuri?=
 =?us-ascii?Q?A69sQulN/KYtLk7nMVmx7tXNekd4wDWSqJJhL4r+v2HJx52dRsXPKPljPGdd?=
 =?us-ascii?Q?cMM/et57YqNy6y4GFDzkV+1/2gA1lmioDpI1MkDMptGA6qB34abp8zzWgtTC?=
 =?us-ascii?Q?MtaKJzvljNFbqCTCcElgLUOvGRUl6VbM+xFw5zwgS+fdHWnAcUcnCJTGX6MZ?=
 =?us-ascii?Q?S0DRYzgj9msv5jcbXMsTT1BK+5mdmlL4oJOqSd1pLhrSh+5SZ+3iLbTUKY93?=
 =?us-ascii?Q?77hznGiYnDP2kkRIrZg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:32:44.5104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4cbb09e-3bd6-46d3-2e60-08de3bef3179
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4282
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OQ56D7PFB75JFDYKE7RICCLUWZD6ZUWE
X-Message-ID-Hash: OQ56D7PFB75JFDYKE7RICCLUWZD6ZUWE
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:09:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQ56D7PFB75JFDYKE7RICCLUWZD6ZUWE/>
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
v2:
- no change
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
2.43.0

