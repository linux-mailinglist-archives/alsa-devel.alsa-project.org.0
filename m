Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D78A5A2FE
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:34:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26EB160692;
	Mon, 10 Mar 2025 19:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26EB160692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631645;
	bh=juMuTeyP+hnMq6gUtkv7WKjIJQMmeChABADlHmT/LlI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQAkeU2x3ODQjTyNe+kUUplO23jijbZuHBKgU6HkayXaCvSJYhtL3WDA7CGN2IHWi
	 5oA3CI4HFjkA1EIUkZFtLig42Vz2UQO39WcjIcopKKOVp6qZIhFzVXEiANsV2gpWrF
	 F3Oop1n/fZWHpODin5L4C3kAYSVPvcqaD6goh8hE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF0A0F80642; Mon, 10 Mar 2025 19:32:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EC4EF8064C;
	Mon, 10 Mar 2025 19:32:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FF0EF8061D; Mon, 10 Mar 2025 19:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1085F800ED
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1085F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pyxqQYoU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2yq5PRWBydIXZaq2dQ1MCWHIlUnvAo7ccbyryoPjiVfpmnYPJDdnKNqJIUvSGICJvbdg8JUzojAQgaDLBiXp894AgRikoe7XRnZapkYUGTELmXteF9waVI4QV1klSoOLWwBkpQW9iK0xaJjCsHXsjBxZNX6U/b6imzz82bVKZWJOKZ6mw6j2aOE7JuQpQqmCDY/qSv8XaGh3MsqLUQdWYKssi+MXD7XK4yt2iVLZ1jXfshaP+7WaxXzTvVag7RLBdQxhX2lj9wEggkGKJPi/QAxam2m6LM9SwQpbOi1mS4NEREgHOKLMYcLGtK84OPaDgig3WC899Uo629+mNhG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLkGmyTthe7acqzGPoN6+L6k2PMNXc3IrEnNVUa1EYc=;
 b=GPQis40JI1+GTVypL/+trGas1r2HUNAF2Z5KRDiZHN3i0pHs6i3WVqyWKlM5L7nlBFGfhGclUMmNMEhqqZkBVCIe8HUTZhkCdomr8MIzxX2dESpuftvdTdfkW/YH8mzgJ7Gl5on0VBVLsYuB3/hqG5sQS79YzGHHdDrN1L3KRvh9vtC1xRZJmyWZvdbs2670OdXdvkNOOroj/XHyRB6ZSVntFXnjXn/iVRnmokMGpi2EUvUhjSww5t9EIv56BgV3XEoUbz9fvYRgUlPWvCvhPt7dEaA2xkMb5a4PMT8p0B8QzS10x34bfHyb60ApvfShvKMStWTjDT0W6i8MH7xW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLkGmyTthe7acqzGPoN6+L6k2PMNXc3IrEnNVUa1EYc=;
 b=pyxqQYoUJtnCdWYDDop/MI+W19STmC9Gt/QAitTw4wnv+fcQiP9nEOd42jBCICNHf8jVH32L1MKwwH6z5NBtLQINluOBKe70mFDNSKKyxpS3uwBtvCt9f2IkrzCGlY375QX3lL8MRkQ7Bdd2OQ9w3XDs7CVy07lUmx7/dmrL66M=
Received: from BN9PR03CA0204.namprd03.prod.outlook.com (2603:10b6:408:f9::29)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:32:29 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::af) by BN9PR03CA0204.outlook.office365.com
 (2603:10b6:408:f9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:32:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:27 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:32:24 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Peter
 Zijlstra" <peterz@infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 04/14] ASoC: amd: acp: Refactor acp platform device
 creation
Date: Tue, 11 Mar 2025 00:01:51 +0530
Message-ID: <20250310183201.11979-5-venkataprasad.potturu@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac424d6-63bd-45c6-817a-08dd6001e976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dvcjkL5916BBN0AqX70xo1N5sBehkjYJRXaq9ycMfZJo53Mo/fiqA5h1Aghv?=
 =?us-ascii?Q?Ooo1rFTBlqZbCF4dUpsxiIkZlbLtkAoPcTd+XlTI1PKWNrCU2w0tOq1HLHrd?=
 =?us-ascii?Q?kA9RcZPQ1h4xyEPMOFAp64Pk2Foudcgpa1pj8lZE5XNqUEWOWZ3g2XIaNWq8?=
 =?us-ascii?Q?6NeyddaK0u2aRTLfYvNe56kFYVaheW3dn92bhkdNBCHU0mw8YdsxHu8uJOAy?=
 =?us-ascii?Q?CEq9vWoKmtnbTLCErwkrmCmo7t5pdNoBakIzdw5LIXI6VPfMymEuHAjUEZg6?=
 =?us-ascii?Q?4qCwtq05eaYu9eZZJgfSD+4i/3aXrGmlTGaMB1HvsQfEV/krmgutqrGeBdEe?=
 =?us-ascii?Q?GhN3mHXeGrhKmC09akuhLRIBx4zBCp3eepYjoUK2Ov1mHOT1AFz4Hp45KVQ8?=
 =?us-ascii?Q?2uUxiRTdnQ70TWTe6LMTV4d4tbJkGrgy60z3w70rTv5i5LST4LSJ69bW6B81?=
 =?us-ascii?Q?hcFFOQbEu61HH2hNsdRd8ZX27oFFu6hfkiPsEdyfN02RTxMJgFyAljTzDMPa?=
 =?us-ascii?Q?OIinAsqgKEK0EqD+/Vou4qOUPHtrz5/zIvV2Jx5NZdNdg9CxB43iylTREuhX?=
 =?us-ascii?Q?QBNbcDFl3ZwryyHDIPjqnFe53fXdIRfjQZb0sVdOnQSz6sK3N2ubVGoc2C6G?=
 =?us-ascii?Q?qztsWiDlKpSyOwy7nNqJfO3qPl+x/zBnw+9VKw7UjRDguIwkg9acVpW/Kv4v?=
 =?us-ascii?Q?yC/ufjQwhUBpXmt/zdQQSm0AjCrA/uBQ491Hp1MU+4UChJUBMKv/KIT4Zwuo?=
 =?us-ascii?Q?V32GmmOxhcMa6TVgKkpHyTuU8Au+FsFK1erJaq51hz21ppYAgTpGa31oObWJ?=
 =?us-ascii?Q?HjANOAgrDGZrJQbcZ5ToawvVqP2H486xNJBxeOB1pq0c8BUIvfK9es95Lfkj?=
 =?us-ascii?Q?IaFrHH650eySdwbPKfGQzAxnLYH3L7b/q7MjietAc0tnyRgUu5NF+b84+Cti?=
 =?us-ascii?Q?4xLNqq6AmHrrjEeubvyl5trZ2UmpDGMFfPacH+bm/mfQ+DAUQtXFfOqoGzNG?=
 =?us-ascii?Q?Mjkule4UmfEDqrpaleg6mSP5F/j0lVJSbW9gS1NjwK0+qPCP6r8lrQMAYc+8?=
 =?us-ascii?Q?Rh+31IF20LOe7ZPL5q3SKDG1XIF4k5BVLx1sGbojCKsHcl+8CBlQ7GDlx6DH?=
 =?us-ascii?Q?CZrS0F4jPFBMA8ghLV/ACVVj9rnRJNKK4D3KN9hPlbg+SfU9nKo62GPu5PGX?=
 =?us-ascii?Q?6YNveShrb5OrHsHyb7YiEg6vWqXs0oSXU1DSoor6+tY7wx5XxPziFxaqGXcQ?=
 =?us-ascii?Q?TtCNoxUDg7funE+7NZjC2LCN3wiLahkZtzDEACtfY9x+nkff2kJAPpm1Nxph?=
 =?us-ascii?Q?AjA7JRE+bHYwEdPDykcejaSeCkGCTmK9KgBaBxUPopawCnd12HxwgcLq2Ml7?=
 =?us-ascii?Q?FGGgWXgvk57+JL/q+dng77wsgCzngZl1s8sP3/WDXXJBVFEs5mfoLOJeZygV?=
 =?us-ascii?Q?s48IskqPsZ1jHYPLhVfqU8kxVj5O8gHq7geoKeZ3YbxPHLvmCDEJtDnWhrru?=
 =?us-ascii?Q?P/tR2hwcFMoWqYY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:32:28.4257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ac424d6-63bd-45c6-817a-08dd6001e976
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
Message-ID-Hash: SRPFZZLSKVCRNWWFGZQZFV5LPCAAN3TI
X-Message-ID-Hash: SRPFZZLSKVCRNWWFGZQZFV5LPCAAN3TI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRPFZZLSKVCRNWWFGZQZFV5LPCAAN3TI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor acp platform device creation logic and remove unused
acp resource (acp_res) structure.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 119 ++++++++++++++++++------------------
 sound/soc/amd/acp/amd.h     |   4 ++
 2 files changed, 62 insertions(+), 61 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 549e95415ab2..0ffef70ab979 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -26,27 +26,56 @@
 #define ACP3x_REG_START	0x1240000
 #define ACP3x_REG_END	0x125C000
 
-static struct platform_device *pdev;
-
-static const struct resource acp_res[] = {
-	{
-		.start = 0,
-		.end = ACP3x_REG_END - ACP3x_REG_START,
-		.name = "acp_mem",
-		.flags = IORESOURCE_MEM,
-	},
-	{
-		.start = 0,
-		.end = 0,
-		.name = "acp_dai_irq",
-		.flags = IORESOURCE_IRQ,
-	},
-};
+static void acp_fill_platform_dev_info(struct platform_device_info *pdevinfo,
+				       struct device *parent,
+				       struct fwnode_handle *fw_node,
+				       char *name, unsigned int id,
+				       const struct resource *res,
+				       unsigned int num_res,
+				       const void *data,
+				       size_t size_data)
+{
+	pdevinfo->name = name;
+	pdevinfo->id = id;
+	pdevinfo->parent = parent;
+	pdevinfo->num_res = num_res;
+	pdevinfo->res = res;
+	pdevinfo->data = data;
+	pdevinfo->size_data = size_data;
+	pdevinfo->fwnode = fw_node;
+}
 
-static int create_acp_platform_devs(struct pci_dev *pci, struct acp_chip_info *chip)
+static int create_acp_platform_devs(struct pci_dev *pci, struct acp_chip_info *chip, u32 addr)
 {
+	struct platform_device_info pdevinfo;
+	struct device *parent;
 	int ret;
 
+	parent = &pci->dev;
+
+	if (chip->is_i2s_config || chip->is_pdm_dev) {
+		chip->res = devm_kzalloc(&pci->dev, sizeof(struct resource), GFP_KERNEL);
+		if (!chip->res) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		chip->res->flags = IORESOURCE_MEM;
+		chip->res->start = addr;
+		chip->res->end = addr + (ACP3x_REG_END - ACP3x_REG_START);
+		memset(&pdevinfo, 0, sizeof(pdevinfo));
+	}
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	acp_fill_platform_dev_info(&pdevinfo, parent, NULL, chip->name,
+				   0, chip->res, 1, chip, sizeof(*chip));
+
+	chip->acp_plat_dev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(chip->acp_plat_dev)) {
+		dev_err(&pci->dev,
+			"cannot register %s device\n", pdevinfo.name);
+		ret = PTR_ERR(chip->acp_plat_dev);
+		goto err;
+	}
 	if (chip->is_pdm_dev && chip->is_pdm_config) {
 		chip->dmic_codec_dev = platform_device_register_data(&pci->dev,
 								     "dmic-codec",
@@ -55,22 +84,21 @@ static int create_acp_platform_devs(struct pci_dev *pci, struct acp_chip_info *c
 		if (IS_ERR(chip->dmic_codec_dev)) {
 			dev_err(&pci->dev, "failed to create DMIC device\n");
 			ret = PTR_ERR(chip->dmic_codec_dev);
-			goto err;
+			goto unregister_acp_plat_dev;
 		}
 	}
 	return 0;
+unregister_acp_plat_dev:
+	platform_device_unregister(chip->acp_plat_dev);
 err:
 	return ret;
 }
 
 static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
-	struct platform_device_info pdevinfo;
 	struct device *dev = &pci->dev;
-	const struct resource *res_acp;
 	struct acp_chip_info *chip;
-	struct resource *res;
-	unsigned int flag, addr, num_res, i;
+	unsigned int flag, addr;
 	int ret;
 
 	flag = snd_amd_acp_find_config(pci);
@@ -94,8 +122,6 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 
 	pci_set_master(pci);
 
-	res_acp = acp_res;
-	num_res = ARRAY_SIZE(acp_res);
 	chip->acp_rev = pci->revision;
 	switch (pci->revision) {
 	case 0x01:
@@ -129,6 +155,8 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		goto release_regions;
 	}
 
+	chip->addr = addr;
+
 	chip->acp_hw_ops_init(chip);
 	ret = acp_hw_init(chip);
 	if (ret)
@@ -138,48 +166,16 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (!chip->is_pdm_dev && !chip->is_i2s_config)
 		goto skip_pdev_creation;
 
-	ret = create_acp_platform_devs(pci, chip);
+	ret = create_acp_platform_devs(pci, chip, addr);
 	if (ret < 0) {
 		dev_err(&pci->dev, "ACP platform devices creation failed\n");
 		goto de_init;
 	}
 
-	res = devm_kcalloc(&pci->dev, num_res, sizeof(struct resource), GFP_KERNEL);
-	if (!res) {
-		ret = -ENOMEM;
-		goto de_init;
-	}
-
-	for (i = 0; i < num_res; i++, res_acp++) {
-		res[i].name = res_acp->name;
-		res[i].flags = res_acp->flags;
-		res[i].start = addr + res_acp->start;
-		res[i].end = addr + res_acp->end;
-		if (res_acp->flags == IORESOURCE_IRQ) {
-			res[i].start = pci->irq;
-			res[i].end = res[i].start;
-		}
-	}
-
-	memset(&pdevinfo, 0, sizeof(pdevinfo));
-
-	pdevinfo.name = chip->name;
-	pdevinfo.id = 0;
-	pdevinfo.parent = &pci->dev;
-	pdevinfo.num_res = num_res;
-	pdevinfo.res = &res[0];
-	pdevinfo.data = chip;
-	pdevinfo.size_data = sizeof(*chip);
-
-	pdev = platform_device_register_full(&pdevinfo);
-	if (IS_ERR(pdev)) {
-		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
-		ret = PTR_ERR(pdev);
-		goto de_init;
-	}
+	chip->chip_pdev = chip->acp_plat_dev;
+	chip->dev = &chip->acp_plat_dev->dev;
 
 skip_pdev_creation:
-	chip->chip_pdev = pdev;
 	dev_set_drvdata(&pci->dev, chip);
 	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
 	pm_runtime_use_autosuspend(&pci->dev);
@@ -244,8 +240,9 @@ static void acp_pci_remove(struct pci_dev *pci)
 	pm_runtime_get_noresume(&pci->dev);
 	if (chip->dmic_codec_dev)
 		platform_device_unregister(chip->dmic_codec_dev);
-	if (pdev)
-		platform_device_unregister(pdev);
+	if (chip->acp_plat_dev)
+		platform_device_unregister(chip->acp_plat_dev);
+
 	ret = acp_hw_deinit(chip);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 9511995da591..be1aa405a14a 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -140,12 +140,16 @@
 
 struct acp_chip_info {
 	char *name;		/* Platform name */
+	struct resource *res;
+	struct device *dev;
 	unsigned int acp_rev;	/* ACP Revision id */
 	void __iomem *base;	/* ACP memory PCI base */
 	struct snd_acp_hw_ops *acp_hw_ops;
 	int (*acp_hw_ops_init)(struct acp_chip_info *chip);
 	struct platform_device *chip_pdev;
 	struct platform_device *dmic_codec_dev;
+	struct platform_device *acp_plat_dev;
+	u32 addr;
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
 	bool is_pdm_config;	/* flag set to true when PDM configuration is selected from BIOS */
-- 
2.39.2

