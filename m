Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4CBA5A321
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEFB460677;
	Mon, 10 Mar 2025 19:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEFB460677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631821;
	bh=iB2t9pXFURk/F/2uMiKSfkhm4pi3bVitsR7gBIBr7fA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UCeOGdQLWhcZZqieXwf3olgesu4I/OfzJFMRvcSRcaYcaPLpCtCq0WowryYuZqwV0
	 oE8jTvW9/29mQdSi3hVNNFZ4W0aMFIz/hPkmij1SKhvWmYUlvGSWcNRuE6vxHWFsjx
	 83l7xLSwQn+cP21kV5fn3CSrVg1KkmEpIDfb46C4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B3EF80635; Mon, 10 Mar 2025 19:33:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16115F80794;
	Mon, 10 Mar 2025 19:33:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA6E6F80766; Mon, 10 Mar 2025 19:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0DE1F80613
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DE1F80613
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pFVqczec
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mneAx4XWoQkQYz/GIgpg3K656vUIoEvx2tzAsnIFfElFoiwW7LwZyPh8dRSpgXKd0RcGBswGoTZ4qJp5bgdonWC3Qjznr/AVb7lNZtdE2tvsEsCxjgOSzZ+suOwY57Dqw0JqoF+6sw8BVOkwpjv7441zTIeYrQJ3ynt14c+R15WO9SQ6xKtaemEo8KQ5+odUVhbmP69LIawGP/HavO1MAotb3CP9IMeEH4DBicepiNzbJ0eZB8Itf7LsWe0/+0qBYmGHTScnYvJkZZILgKDHOOQFxoQO6M1Haibj5iyYgAjEBkaa//oH4/9W+nDNoCoRhNHizN38SaQfUJ14ezAcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qdJd8btDNX0m8iv+SlQPUFAv2LDwGt/NQYFMd/sl6s=;
 b=c4iMYG8SdLVUipK269Riw2B2BSpqSjHrP1nqSySvxuASJfX6Ow/NTiMZMrfvG3QbBejgiKU3pO8YLlUVEwd/WoFPTbQbaVTt7m4ZtAMhdiF6NKdnQIv12YJt/y0zc6ytymiDHCUOR7DG+y+9GZV8/qyybf/jGFvQxSfMuSOznjwUotHdX4nbTt64+xltxDkiPH87dat5HK4bbzZBnubWcpLMyG+ia9ZBdp936SHO5DLciET3iSQKFO37RGAPOJWnbbcSh9BY3PuWBWulfmK4U0QpS12OfOHQ0E4vCfrrIqiXE+wej6L6meoLrcPwPUthaMEKI/jm/g60FCuaWyi4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qdJd8btDNX0m8iv+SlQPUFAv2LDwGt/NQYFMd/sl6s=;
 b=pFVqczeccgZ4ZbSFLqHHEMaMWEi0TMHnvYcJeUuf/nEfpJUzAo+FfqhvnYXz96nVueOPi0GkiuG2IVwGXyqUkXiSOqWgyGPMor36O+d+v6M/bcJ4f7hN/YBG8d079GeH4fLac6V6mhM2zkyjbM8tvIxuAg40q+ff4cACi4RTmgE=
Received: from MN2PR05CA0058.namprd05.prod.outlook.com (2603:10b6:208:236::27)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Mon, 10 Mar 2025 18:33:48 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::3) by MN2PR05CA0058.outlook.office365.com
 (2603:10b6:208:236::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via Frontend Transport; Mon,
 10 Mar 2025 18:33:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:33:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:47 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:33:43 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH
	<gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 14/14] ASoC: amd: acp: Fix for enabling DMIC on acp
 platforms via _DSD entry
Date: Tue, 11 Mar 2025 00:02:01 +0530
Message-ID: <20250310183201.11979-15-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0839fd-d990-429c-a79c-08dd60021902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?72/hbedPtLOQ65Zb8avANYQ53iJLit17hCq5FkNbcwmoK0eWW79musU/2XZJ?=
 =?us-ascii?Q?ebSsaE1V9BGwEcuQ0qDZWP717BjRdubNdL6KxtMiY2UYwq2OORxUVDA/8thR?=
 =?us-ascii?Q?G8BSU+pZqkWoMV14qxOFpg+QNG+0WP07n63qYCBxRgrBKBVlzEEDYCVCTEE+?=
 =?us-ascii?Q?JrH1NyzcsVyYliKdeJLgNe/+NnLNmnnNYweNeespJ8fQem1uunCHzESs4Ksi?=
 =?us-ascii?Q?RL2ro1YmLxlfHemRShr6QrYgKet6zUw1G8AszTYGMQjBk9V4InDivvBQkLXd?=
 =?us-ascii?Q?sCFJ0HO09rlueD2HGn/61m4evUEzWGaxF8UTkDczub51VFxIfcbGE0ENEHBO?=
 =?us-ascii?Q?p5zSFDwg6A83f9svbYnIApY5O3W/QlDw1pLPIQa9ZDwxVGlVpoGwBpN9cPOR?=
 =?us-ascii?Q?MlFavm5rGTG5MvuNBDtC1M6+sMipBm0qH2sIE+0HkTdum+NbFOGAbVeJ1OaD?=
 =?us-ascii?Q?uXOVu7iD3IFQ2RUiHO3/aTMZ8KKnZqvU64C8nEVzV+qj2pzO6vIUWbNxFNiD?=
 =?us-ascii?Q?gJp5REy4bCY1LGISvgfELjpzGMAvILquQ+K6qH/I42t7j6sUXeYnKuQk5O+S?=
 =?us-ascii?Q?IPeoH/qGnagK238/mCN2mIvld95cZc1v88yz3YnwZKCrz/LfkazC7cVIWWOO?=
 =?us-ascii?Q?/WG8/KKDbnnYMyDCqNin1t8LvKcgzcBkgFUM2fXLjbEvOFo/SMoNVnnmUPIb?=
 =?us-ascii?Q?MKqz63bku3/3ghhTtvdRxITRfuPUyhg2sz4xV/ebCjtVEmfL/iwUNmpwvvWn?=
 =?us-ascii?Q?beoeomXHTONwyB9Hjq3yer3i3lhEAHo8z6WZtJqDHpSbm7L/GqcNajWwykn6?=
 =?us-ascii?Q?CAhl8C/BoDLTQEXvz7hCiTNmIw/m+Dw35WeL+jMGX6JNtgibWgTWL5t2cFfl?=
 =?us-ascii?Q?IROokDNoZIVBJwxKLYK0H1Gq1CZF+rkvRAFW5JswrcfQuvNg9HzAbOHvu3gV?=
 =?us-ascii?Q?yEeFnsVd3jcRffriNx3kpA0HaLZIqGSIUpV0FYZFlqHvUQz2TtkNiaQcHukU?=
 =?us-ascii?Q?EmQWdHwM+Y0BQwSo+qrQzcRQwhKHaOD8vv7yUg6MwvpO4PPHkAtNBOt30CM8?=
 =?us-ascii?Q?L9zH6x9ESDR5wUWsJ5QIt/IigXmUe05e9htgSzTqr5t5ATbc81tPCA6ET/No?=
 =?us-ascii?Q?ZDyhB5+zywNVuKy1GpO3bYm+6pk1khDSdBH94kb9a+WGUAGGy0qH+Ud9779l?=
 =?us-ascii?Q?0S1hdwumPhDebvVtfZjAvZDXSP0Ipqm77lNBSTR9uc4iklaeEgX6re7OI97J?=
 =?us-ascii?Q?ESj29cqskwfqjTV9PFfiCrEtgOgHv4PIQTzf44BlezTdVQwaFfalVedNflRl?=
 =?us-ascii?Q?xQBpHI6mvRymX01xSJOF9QaEbfJdgXN+4iI6H4dLVh2CPuOUltEHxA6vwz2h?=
 =?us-ascii?Q?7YLwR763MIVTwG9oLuXYH8maauetM69eW4AdRO6V5mN9FYxEjIFf2tXic/Q5?=
 =?us-ascii?Q?1kat1g4R2n19KSIdojZ6ikD6WeBl4Y1meWpCc+sYzTNvdSHU3vHkJGGUXTGH?=
 =?us-ascii?Q?JXJeUq5AUTG/fxE=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:33:48.1815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a0839fd-d990-429c-a79c-08dd60021902
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892
Message-ID-Hash: UYTFIE6NAJTSXTWFSA73W3C5ZQYGIJJG
X-Message-ID-Hash: UYTFIE6NAJTSXTWFSA73W3C5ZQYGIJJG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYTFIE6NAJTSXTWFSA73W3C5ZQYGIJJG/>
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

