Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A4A591C6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:50:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8628D60758;
	Mon, 10 Mar 2025 11:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8628D60758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603859;
	bh=iB2t9pXFURk/F/2uMiKSfkhm4pi3bVitsR7gBIBr7fA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jOF6jGO8zW/FamvmAwLoEzIh/M49HuiMfbSdAzs/YVjr2Fn8pZzEwahAhUgvxl98M
	 5X4nWnfMY7yqCbxjrmjmEwPURUU0WsgpZjq92TPBjJTxMhP5Wjf9Xoo5wQw1telg+S
	 dXQhOlHItkrv3VJpIxeC/mOXbmATESRIBrXchreI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1564F8074E; Mon, 10 Mar 2025 11:48:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD536F8074D;
	Mon, 10 Mar 2025 11:48:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0636EF80730; Mon, 10 Mar 2025 11:47:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::605])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DADDF80616
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DADDF80616
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0BPdbfJl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYqtlgd25cLf3lP/oh/6bp2Ia2lrfCw184GfwoNiA3S8P9TMyASJr9Dz4p9A7aprx/SztNqGn5mvXnBN9ITr1Pduf6Qw3IfqEBWKFcomAjpQymeuHQsLrti/P7Im2i4rD7BUvP/Jt9769CDGRmRb637J2x5sJScU7SQkY6t8gNV6KYl5QkeA3OL5GJ9yTUFmpi7ZEgDZdL3pzhr2/EnuJ4SMB6e6rH7v9KSEhpBpxAOdOWPNGJICtwsydap1FH6rTQjrNhYp9m/wnUk4qd4NpXOfEoUcjLAr5pjLGoNW+CH16wtpdbtn2NTlRVmsbp0EPP4rmQ8OUgN88WM6RlDFZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qdJd8btDNX0m8iv+SlQPUFAv2LDwGt/NQYFMd/sl6s=;
 b=lcmTVJuj3BfqHFEEFhTv+zZ5Zg20INZRjSVSF/rJp4Ik3zaz1JK0BZzvGPeoxDYTgsez5zfXFpEhg82aBthtn4xF2ytRaMPoCTnnxpoctno6n11GIoyKQJDpcUGGXh1OPDbAZZpPewJD2umhA9rNjx68aX1b5k+yCnlDrrBfpeGuca+fkdReQOVnfn0uM0E2w+MQ/KiADg5ZMvtNADClKo2tdrMby4Gfhk/G8xxbK4VnFdXzI2PE6pCM0kSnONUy6Z0GtRGT7xfj27gEAIL6qXr0K8fa+BJabXUDZQ8aU4YmuOhTU0DlfEoARbPyV0Z8cCcAuiXwtcPIeErQe2eQxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qdJd8btDNX0m8iv+SlQPUFAv2LDwGt/NQYFMd/sl6s=;
 b=0BPdbfJl9KXGqT/TqVslB1SysRsnQLCR0MLttqnC+GIdkKQF8ZjBQp/1pfPSXkja17VrSTX57rCG7fblSyq9rtUOtR9KwKGuQdkDCUsZBP+h0mVXMn/YfNNi0Z0eydyZHjxCcfK+MsJNDiTj76wZ8gqCcltaGdkcgdtxgU9qVLQ=
Received: from PH7P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::7)
 by PH0PR12MB8050.namprd12.prod.outlook.com (2603:10b6:510:26e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:47:51 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:510:338:cafe::7) by PH7P223CA0005.outlook.office365.com
 (2603:10b6:510:338::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.23 via Frontend Transport; Mon,
 10 Mar 2025 10:47:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:47:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:49 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:47:46 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, Greg KH <gregkh@linuxfoundation.org>, "Peter
 Zijlstra" <peterz@infradead.org>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 14/14] ASoC: amd: acp: Fix for enabling DMIC on acp platforms
 via _DSD entry
Date: Mon, 10 Mar 2025 16:16:01 +0530
Message-ID: <20250310104601.7325-15-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|PH0PR12MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a88ec52-c9df-4b1d-03cc-08dd5fc10128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qpYnYJLXb+fQWh8zSZ0Ffm1Xg+88M5KDnFnh4sZzNblZVdjSTTLpCI16uaFs?=
 =?us-ascii?Q?QukTq5EbEjLkbqQ0kTpCD9U3N1BL9YV+IxeyUZ1HxCczMqktq1RJhmo8+62N?=
 =?us-ascii?Q?aoG5xa0xcuy+oz4I23gTEAKVta9uA1aU/KFECTOyzn9eIkzwpfB8UgBwCw7R?=
 =?us-ascii?Q?zfI/TfHAfWDaX22i3tmum5JaKOKcpffgLBdvY6z2/Vz8NDnXM/Ciin9cle9H?=
 =?us-ascii?Q?pxSf8y+rbn275jIRxR0UNju9KhhRd9s49+OJg3q0K9itL3ix8PCsWTeoCCBS?=
 =?us-ascii?Q?f6PCewrPJ/tIViLHJyxO93Hua91sDPeZa+L2BMyf3hEEt0TMW9E+1Mj9LyOU?=
 =?us-ascii?Q?mhantDI2I81oUjYIc8i6ugzG+M3ICLV5IN3ijj3SWpQ1bipAVPyHYSqh5tbl?=
 =?us-ascii?Q?lzTif6g0WWpvsqKdoKeqcx1lCCD16m0URdu6UHeI1TkSy/Kjsn0glhWeGhwT?=
 =?us-ascii?Q?pU38ECFdTEqVKXxIiGdEE8LFhbMptIKhzEEmKFc9v968aHcXgYe0yy/RMV6k?=
 =?us-ascii?Q?uWWqIi0Nwl8sH3gkwOs4yOIyqLccYTle0kTuAbKoYDRwwXAjBUxl5HxzxI7e?=
 =?us-ascii?Q?vbfGmkLQV7ZFUotdBdK06AHoSC7mxtw64QQlwGt2BHBbKXpIKYfhpud+TK8K?=
 =?us-ascii?Q?a6cukfh8z9Tex6hjmvC5iD1U2s41XvWCXuWb1nuz6ZZKxXfPkzfPbuznM0nS?=
 =?us-ascii?Q?C8fQRyDzecwUUySOSeoNqJVU0f4F4IDAeemXVX+s7md+rS/ZlzTxDQVvdMUr?=
 =?us-ascii?Q?S9UQhKlD8l4bo841hoWtE5zl8TrnyYdClybEQDs87bkjpBp/hKsy7XmrqAiL?=
 =?us-ascii?Q?K2bcRWF+EfJW1/mb9PjlLjc5cyPfepdCBfUmEj1Hy1Vvsxf06dT1zBkotEuD?=
 =?us-ascii?Q?usri3Yvwp+oy19dOSwLavoKMKIGGPMR0WJNV4Tf6dPqfo8k9vmeX3DCVULdm?=
 =?us-ascii?Q?dmyCCvuxUQLX6TcPxKl/ALiQyFuBNsIvYOfmFuP4zwMTUltA7eeovzQuXOhk?=
 =?us-ascii?Q?qxsisNAviSrfdzX1puaG5pCyof9yPwRw+DRytygwQXXqhzaD6ffjYSVSdp3t?=
 =?us-ascii?Q?LpWciNv2vUjJgChjDwysPYxPcuBSFatPu4XLU4etyloqiWnONIm5dgttzupv?=
 =?us-ascii?Q?/hZ1qFtBn96I3o8yz0Qs0ZpRmNbtK1Qc5F2Egg6lCpb+Js1ILI/uAzbbnfSC?=
 =?us-ascii?Q?mwk7jZuydsVkKEz6yHxTYCCwFjEG/ylkDH1KMdHtJFHSfrQiNTGmiiSYMRco?=
 =?us-ascii?Q?l1qSRshhi37A/AvZSEKSh8GvkX55Pa7rYBE1uIx8ydStMqt3Zwc6JH4AUmWr?=
 =?us-ascii?Q?QA6ul2SZoz+iQLsUZuFkuTDEyURHqpIiBzpF3LMNlMHKk7Q0aND7JXfCPQFU?=
 =?us-ascii?Q?fOV2eZjD8T+Mlr29stWmFOeoGs0SgbsMxuXxljN63JyWwzbMyJXguCpd4Im6?=
 =?us-ascii?Q?Zav1ig40tYUZo98xVLpsru4P7Kd/59pPT0eQ+NEL1lU0E9XNoLK14UCtPrOg?=
 =?us-ascii?Q?RugIG6wyvU3xgds=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:47:50.7485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9a88ec52-c9df-4b1d-03cc-08dd5fc10128
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8050
Message-ID-Hash: WA62MYZEXN4G4YG7XA5FTHHW3HNWEQ2D
X-Message-ID-Hash: WA62MYZEXN4G4YG7XA5FTHHW3HNWEQ2D
X-MailFrom: venkataprasad.potturu@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WA62MYZEXN4G4YG7XA5FTHHW3HNWEQ2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add condition check to register ACP PDM sound card by reading
_WOV acpi entry.

Fixes: 09068d624c49 ("ASoC: amd: acp: fix for acp platform device creation failure")

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 988b7a17b2f4..255f90ca956a 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -13,6 +13,7 @@
  */
 
 #include "amd.h"
+#include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/export.h>
 
@@ -511,7 +512,9 @@ void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
 {
 	struct acpi_device *pdm_dev;
 	const union acpi_object *obj;
-	u32 pdm_addr;
+	acpi_handle handle;
+	acpi_integer dmic_status;
+	u32 pdm_addr, ret;
 
 	switch (chip->acp_rev) {
 	case ACP_RN_PCI_ID:
@@ -543,6 +546,11 @@ void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
 						   obj->integer.value == pdm_addr)
 				chip->is_pdm_dev = true;
 		}
+
+		handle = ACPI_HANDLE(&pci->dev);
+		ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
+		if (!ACPI_FAILURE(ret))
+			chip->is_pdm_dev = dmic_status;
 	}
 }
 EXPORT_SYMBOL_NS_GPL(check_acp_config, "SND_SOC_ACP_COMMON");
-- 
2.39.2

