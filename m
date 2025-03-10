Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15508A5A2FC
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A62E9606EA;
	Mon, 10 Mar 2025 19:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A62E9606EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631626;
	bh=4kd4g3GxjV6bfj+dOc/L+olSEAk3JkCZNcoQWU3Mn0I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J8Ntpoj85mtwZgC0sZBV5xr1Is/lzqkSHUFGNdN/Zv7wTCRz6GJkvobKuLafV4QaC
	 VY5gDEwfmSkbS59nc+dCz3YS1zpBUqamh6mmJ1jqPzD5GRoWf8irHGHl9w1ZjCSzTA
	 SQUVAgnrqYFgscpflYBWHbLc74BRxwpCv9GpHC1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC379F8060C; Mon, 10 Mar 2025 19:32:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98DD0F80614;
	Mon, 10 Mar 2025 19:32:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13485F80606; Mon, 10 Mar 2025 19:32:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3EE7AF80604
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EE7AF80604
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uEpmx486
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWYx9QN3Rq8N8D/yJFzgAgoLpaQMUn+kys/bWHS0MtmwwP562RkuJmBojZAuZ8ojm4lsC2HQc88hcYHl1o3WqXxIDlUbYa5nNx76PrF6AWpkMtjws0QppbM86KD2P+Jk1BIuNJweFtDgEwho+umc9cqd2SLsopwBNXptXLZUuU+SEX4gTYAU5PFWCrK4gpdj5t+oXCsoffSXGLOKG2xCc1XdF2smSWDsMFyckKuiml/KzIV/hIpp1QSReNjZvUjjyaahc2PeRVMH12zKV5y9hBfZXBZT6N56Iuw0bksvXBM5I0RcI7gK2qEDS1DYrtSlI3fNCZ8N5ohceIKkK9IeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91rq8pQ8W96B26QRLhyZbdJ03P+k3QwS54zN46FhSK8=;
 b=xqHGLBcJs2CfhMkPD4FV61mhWoR+WjZSayXOrW28pbQpEqnXU9ARYqwXixnZkC1g5dzO40O6SeWPBc2hkMV60YAd/uUfK5WcZm5ZJzJJux4Fi3s71EnMEZo4unG1zo1ldrfX9vDSc9ou0YKZypBCVY2fGvxy8SIKnZXFJnw1xa8RFLMbWf1ZYzA5uzbT9nsB19DB4JZOS3hgcbzF1lAq31hoPI5KB6Mhb8at5rgnJfuW54+hPKGOetA1g7AWiTCYlPcMjIBrSj/tdeJkKp8ba7121VM3HfE8Rz31gISne+jYfQxgSylQSJa9wfcyhDfMLYgwJDIZJL7/9cP5GI0r/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91rq8pQ8W96B26QRLhyZbdJ03P+k3QwS54zN46FhSK8=;
 b=uEpmx486IktyCdfpcLrYu+FnlPWU4h6mJXKvtv8TYvTtyWrgGA/0RNUNZHBXsKNmZBFUucPnvgIi5HW1XJloElmvxO1IqS6nfi/A7w9w362h6qLG9iCgXSx6zjZ2VBXcvLs5fS9H16lw9h4ytYx4/bGGrFTmsofrZgn+jOr/Jjs=
Received: from BN0PR04CA0064.namprd04.prod.outlook.com (2603:10b6:408:ea::9)
 by CY8PR12MB7538.namprd12.prod.outlook.com (2603:10b6:930:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:32:23 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::19) by BN0PR04CA0064.outlook.office365.com
 (2603:10b6:408:ea::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:32:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:32:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:22 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:32:18 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, Peter Zijlstra <peterz@infradead.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 03/14] ASoC: amd: acp: Refactor dmic-codec platform device
 creation
Date: Tue, 11 Mar 2025 00:01:50 +0530
Message-ID: <20250310183201.11979-4-venkataprasad.potturu@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|CY8PR12MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: f8272731-e684-4b97-977d-08dd6001e5fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wsENIvKE2/+TTXPqIBH/dKNHy9hzRHKBm2VL2qSwBVXxuinZMHVF74rF4O0/?=
 =?us-ascii?Q?KxuewDeiJGeTAAEeMlsX391inFYweAka0O+HhIm9YwwuWgTzfeAXzVZSiW9c?=
 =?us-ascii?Q?IaOaeRiixJfZPjqIcsSRO0h6uBMqaUgCxxfrV/nC+VfxOqwTKT5cDL3z86Hz?=
 =?us-ascii?Q?xBlrE60pNSqduM5E80ZVjij+IR3Nyuy45gV0U64d+oWHPsxuXDgyDbjJT8xa?=
 =?us-ascii?Q?21HTXfY8eC3OysAo3Uw2/n1kuXQzCHcKycRV9hqgy6OrKqKkJolPHo0nT6IY?=
 =?us-ascii?Q?e/HLw4ilRgyaEKU0IUDhlh1v0SN8bNLF4hxbzVK7JndA4FmO2Dd66yQZh6RS?=
 =?us-ascii?Q?kfFDH+jwq8hx2p5O2BqLonwRX5zsANb+RlMaqdE+IoWTcmZAntGoblrwSEdu?=
 =?us-ascii?Q?86q28N+5jhZJzf6q1jwdkJBiwzZCABVUf4JwijhrVCDd5/2QlM7UyGCIF3hp?=
 =?us-ascii?Q?dcu3v5TznN3ZWUr75Ju0v0UmT81XIdRP8MCahFPUm3fMRDJliJOEkD/buJT7?=
 =?us-ascii?Q?3ywFO5QVNOioTSRmIK+EiidQ0zGfUUDkK9kFuC8uDd0W3tUDZsKLQC+jhIyT?=
 =?us-ascii?Q?n0KeMlkJ+L3NB1A2hxhz1ErvvyBNPuvuloaL3DiObw6jkDzMnXZX+AxUGPhK?=
 =?us-ascii?Q?j9Ub5bRipSLL1N4f4bnfe8bkgZxMckZgZdqs+X9u3Q347vDsmVKyIiLwqcaa?=
 =?us-ascii?Q?IHBMfwyyr5Q/+XTmoW9qvM9uoqT3jkbNVNVliRqoWcjDFArZOlGQa6VIhgn6?=
 =?us-ascii?Q?U1NpxwzIzHbRaxw/aa+ciGFMY9XDzU2bYqeDnszKL0gdUjtNl7Mx/CoL9SY1?=
 =?us-ascii?Q?qtAYHhLicfNuP+PuvtEMWpdJNI6YL+Vumh+nX/HYy7kSH1Jn+LLXU1A9L8R5?=
 =?us-ascii?Q?uUN9HqeHm7kUVfm9T2M2YZ9RPWF5MkcC2hhxIM0VL+MbnhCpp+CV3VV/yfmP?=
 =?us-ascii?Q?zK5c57OsujJIrndOZKThoIaCxbmQ6whiHOrNHSmAETDyuzrKoNWQtwtBeOb0?=
 =?us-ascii?Q?eeUB7mDA/Y3MwgKKuX1UYKoGjQyG2MTbdODfWMBiWuLkcjT8Tts3om0x7mXj?=
 =?us-ascii?Q?yEwIapJKhctX/pB6rXxv2VTZ3oeTD7Cjw4H4A6+3y7lP2Khvk7eERWLYQ4NW?=
 =?us-ascii?Q?KKj23bHdoZdSsFrXKVoALWH/KDJcZHwgN/e45dfz+thG6MGhWLc6i7tX13iE?=
 =?us-ascii?Q?Ea8Fyf6ZzvDF0HTiUwP4J7UmjDoM+vY7ZGVB2vM9NnQ/31Ua1wyN8W+q5g0C?=
 =?us-ascii?Q?kLRiP46H/C4rtjzIF/YpXNZaa5Re6FMcnl1DAi9i3DMdlkDPzyTckwXjpTpK?=
 =?us-ascii?Q?aiXrz0X3SAQ6PLfP0ZExHJpMnfUhPZp0YBeen9zVphwXy+OvAj4RxJtFQTBU?=
 =?us-ascii?Q?xcXSG4hh+5cNTf8z8vhaZM/PbRdkqeBnF6x25Tgef+nZYsWZZWTk75OUyizM?=
 =?us-ascii?Q?p0HnqxOZDR6KTpHNRxmzLw+Zhr2gnNNf26NPxe2bYqwTaFVP4t+MPn3Y5pqd?=
 =?us-ascii?Q?/yiqvIRO0ySiU0g=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:32:22.5910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8272731-e684-4b97-977d-08dd6001e5fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7538
Message-ID-Hash: IIHJILLS7EEFB6BONEAMVOKNB4RNX53Y
X-Message-ID-Hash: IIHJILLS7EEFB6BONEAMVOKNB4RNX53Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IIHJILLS7EEFB6BONEAMVOKNB4RNX53Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor dmic-codec platform driver creation using helper function.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 49 +++++++++++++++++++++++++------------
 sound/soc/amd/acp/amd.h     |  1 +
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index b5eabd0280bc..549e95415ab2 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -26,7 +26,6 @@
 #define ACP3x_REG_START	0x1240000
 #define ACP3x_REG_END	0x125C000
 
-static struct platform_device *dmic_dev;
 static struct platform_device *pdev;
 
 static const struct resource acp_res[] = {
@@ -44,6 +43,26 @@ static const struct resource acp_res[] = {
 	},
 };
 
+static int create_acp_platform_devs(struct pci_dev *pci, struct acp_chip_info *chip)
+{
+	int ret;
+
+	if (chip->is_pdm_dev && chip->is_pdm_config) {
+		chip->dmic_codec_dev = platform_device_register_data(&pci->dev,
+								     "dmic-codec",
+								     PLATFORM_DEVID_NONE,
+								     NULL, 0);
+		if (IS_ERR(chip->dmic_codec_dev)) {
+			dev_err(&pci->dev, "failed to create DMIC device\n");
+			ret = PTR_ERR(chip->dmic_codec_dev);
+			goto err;
+		}
+	}
+	return 0;
+err:
+	return ret;
+}
+
 static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 {
 	struct platform_device_info pdevinfo;
@@ -102,33 +121,33 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		goto release_regions;
 	}
 	chip->flag = flag;
-	dmic_dev = platform_device_register_data(dev, "dmic-codec", PLATFORM_DEVID_NONE, NULL, 0);
-	if (IS_ERR(dmic_dev)) {
-		dev_err(dev, "failed to create DMIC device\n");
-		ret = PTR_ERR(dmic_dev);
-		goto release_regions;
-	}
 
 	addr = pci_resource_start(pci, 0);
 	chip->base = devm_ioremap(&pci->dev, addr, pci_resource_len(pci, 0));
 	if (!chip->base) {
 		ret = -ENOMEM;
-		goto unregister_dmic_dev;
+		goto release_regions;
 	}
 
 	chip->acp_hw_ops_init(chip);
 	ret = acp_hw_init(chip);
 	if (ret)
-		goto unregister_dmic_dev;
+		goto release_regions;
 
 	check_acp_config(pci, chip);
 	if (!chip->is_pdm_dev && !chip->is_i2s_config)
 		goto skip_pdev_creation;
 
+	ret = create_acp_platform_devs(pci, chip);
+	if (ret < 0) {
+		dev_err(&pci->dev, "ACP platform devices creation failed\n");
+		goto de_init;
+	}
+
 	res = devm_kcalloc(&pci->dev, num_res, sizeof(struct resource), GFP_KERNEL);
 	if (!res) {
 		ret = -ENOMEM;
-		goto unregister_dmic_dev;
+		goto de_init;
 	}
 
 	for (i = 0; i < num_res; i++, res_acp++) {
@@ -156,7 +175,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (IS_ERR(pdev)) {
 		dev_err(&pci->dev, "cannot register %s device\n", pdevinfo.name);
 		ret = PTR_ERR(pdev);
-		goto unregister_dmic_dev;
+		goto de_init;
 	}
 
 skip_pdev_creation:
@@ -168,8 +187,8 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	pm_runtime_allow(&pci->dev);
 	return ret;
 
-unregister_dmic_dev:
-	platform_device_unregister(dmic_dev);
+de_init:
+	acp_hw_deinit(chip);
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -223,8 +242,8 @@ static void acp_pci_remove(struct pci_dev *pci)
 	chip = pci_get_drvdata(pci);
 	pm_runtime_forbid(&pci->dev);
 	pm_runtime_get_noresume(&pci->dev);
-	if (dmic_dev)
-		platform_device_unregister(dmic_dev);
+	if (chip->dmic_codec_dev)
+		platform_device_unregister(chip->dmic_codec_dev);
 	if (pdev)
 		platform_device_unregister(pdev);
 	ret = acp_hw_deinit(chip);
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 3c06567e112c..9511995da591 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -145,6 +145,7 @@ struct acp_chip_info {
 	struct snd_acp_hw_ops *acp_hw_ops;
 	int (*acp_hw_ops_init)(struct acp_chip_info *chip);
 	struct platform_device *chip_pdev;
+	struct platform_device *dmic_codec_dev;
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
 	bool is_pdm_config;	/* flag set to true when PDM configuration is selected from BIOS */
-- 
2.39.2

