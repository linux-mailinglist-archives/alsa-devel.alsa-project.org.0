Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A944A5919C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:47:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC77606EA;
	Mon, 10 Mar 2025 11:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC77606EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603663;
	bh=clOvkzEVTMX1QHhl7KwArG8LULQOrKR0quUnRKr5tCk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XYeg2i5x+Aqag8E8EjHJxwFS3HiJqIahIZ9RGNmgKFbNs9KUy+fZIdVI0DR7Dwvw4
	 ON7SGoktCh9RFR0pyRYhgN2SGuoaM3QYxmZpVd0feTLJYWxvnpPuxgQPRU9ypC+J81
	 YA0eWF8+bhlNYIYKSk9brYe+VGRfoKo60JqZrmYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD185F8060E; Mon, 10 Mar 2025 11:46:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92FEDF8060E;
	Mon, 10 Mar 2025 11:46:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53728F805F7; Mon, 10 Mar 2025 11:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 649D0F805EA
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 649D0F805EA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FH07iLBp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ONiGhIROjDYDJJHOaje3Lucq2RfOZwsaeyb5mpvTfH6mP5vy2UuoAKeSjDq9zplwKpB8+P+2KMBOy1awz6/LtS8G/gO7cwMr9cq5FBMlXzjhifUTe6zJvkfxCpzDbf9DUKuqgd4kyVNZSMekPRW2GE64fNCsempMJFlvEi1Qx6wnGbugiBQhIpvus0t3v3kCOw6mGz0YscqliqB3k8+tJoRgJ8hbD8O4yucMnYnJcnkjBNqwVJRw8gGGtv92Pey3i6LYj112out5BKx7T/bYE1xEtdEvQip1YZQpHCrwy0y+CPiAYUPAsvxN65svCPBtWH9FPMSt2B98OYLnPycHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ggitv2kEHZX9JGTkY8Kt23hnVKZUO0zRWl5u5nZrRAo=;
 b=UOpaLSPTLtT3eAR9xxb61zghn9ZB4QRJVMrzbO9wDP2P+TmKWT5r6Wr42QgdkKcxP8tjw4eBiBkRhoQxpa+mGwgPM/YHGFI+n3lhQncUQfpXnIHRPFyLQKZDtXAkQKX4MoXHMJNMHduRWrXomQHvebT+CPaOsSOUwj9rWbByqu7aCF6mG24AyAouG+hlQlrlhXu4huPYArYob+CUFvLiapW6HEinkT6KVrgbtB1KrpfMJbuW1I37+6wrL2VEs+IhEbCKzB7/IHJ9xQgkHjpx9Wp9CrL3LJJDuk58rYDkHE5uhIOCkAWsNElv4spSlbOz0YXNTdugf28mQ0HoTPe8Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ggitv2kEHZX9JGTkY8Kt23hnVKZUO0zRWl5u5nZrRAo=;
 b=FH07iLBprYg7mgRESxtgYsFXydaRpK9eFOXBWONVCxxySzKnXEybp4teLy8qMqYtlv1wvo1EAFV0+AB+5Mw1JGPUQrOurBBcn+CkB4ENX04ydjnP2heG7+IyVKQShNYhyQr5idaMeq81x55cZXnOnGoX3wPVqZZ3FVf/CjGH/gw=
Received: from CH2PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:5a::18)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 10:46:23 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::72) by CH2PR08CA0008.outlook.office365.com
 (2603:10b6:610:5a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.22 via Frontend Transport; Mon,
 10 Mar 2025 10:46:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:46:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:46:23 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:46:19 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 03/14] ASoC: amd: acp: Refactor dmic-codec platform device
 creation
Date: Mon, 10 Mar 2025 16:15:50 +0530
Message-ID: <20250310104601.7325-4-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 63342228-0f12-4628-364d-08dd5fc0cd35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VTs8OhPbgjxTlPf815Axp2bBSqNJn0KMg+CROJ0YpFWkRkOGffeng7iD7gxm?=
 =?us-ascii?Q?/ZG2U43m5aaHxN6ey3EbcHLZTaenwm+X+SMIKlIDEyx5SYRPhottw1k0Z8gI?=
 =?us-ascii?Q?bZmo10tF1gB8uPkh/xLi3dALEQwnsjwnVumTOm/7AWfTwBowyCeO2IYqhrdI?=
 =?us-ascii?Q?Cb/4DESmJUvD0oqB9/A+esXNFZseMdK63Xwjh4mIs59/mx2zxXwfJSdr3wIq?=
 =?us-ascii?Q?Y116qRcgkpf9fp66mD2i2J+OG0ASQCow+lUheSTTXFC0FUIT7brzUXiyRmOp?=
 =?us-ascii?Q?c6NpDlR4VAWecM4cB7F2lt7OKhoO8L/8gHdpEiA01QXYeQK5yhsoMGkEy4qj?=
 =?us-ascii?Q?OjCmYUsnoUh78dt/Yw9R0kTdOao17C59/3w6wY8Ji5+SAR/wdA17xA9fvWLw?=
 =?us-ascii?Q?d37SL5gparyRCO5/wCwLzV8INiWi/wI5EekNe8plvLPC1npM7CMjypkwtaTb?=
 =?us-ascii?Q?Zn3nIVyTkuXDKt5xFC7jVMRp3jBl47WjhZAXPNkeepflM10MOv93WyxitsAd?=
 =?us-ascii?Q?NUs+H5Tv0Ly1+HiEchd8BdyvgkPwxLvV1LAn/icPPUjfJ6fLC5voRwdbsaU0?=
 =?us-ascii?Q?sxk1LUKrFp3Dj96QPbFZ4RfwFi72onTQl+R1XTMoc6spJIbFsvyZquO3R0lm?=
 =?us-ascii?Q?hbt3f2wvdjueqMpkA0ST+4FppGfYvzAT7nCksGj3pLW9ZEjznQ83vXFRX944?=
 =?us-ascii?Q?pdJMnHQpp4aCgj5G+RbG0VIY+oRPzQpoCCnE5LOC26VI4/13lcBwU3hhvi2y?=
 =?us-ascii?Q?wjWTxSa2kNIGfP97k5u4WmV3UxaCoKg8aHJ7Ja6LkwQhQOV6opD2YFS+F6Bq?=
 =?us-ascii?Q?/wS8I0pQhohETgmaTWzwh46hAMHquSpKHYb4ciNoOc75l0echTPIezGVYSPv?=
 =?us-ascii?Q?Pu3ZU6aRnuHFEm4HZ1n//CZGaodK+4yKoH6ljsqTunAeqpndRB0jeFhWx+p1?=
 =?us-ascii?Q?1kwaExm9olyHkFtDq9tcvLEl9WY5ig5kLhVGqstRixDqRsfnxHXIwFC6YGSu?=
 =?us-ascii?Q?qf3L5/qLODCyY7XefoJIaexwKCazPz5QRHZmrQuktjezrfRXlYvqzxjs/Nf1?=
 =?us-ascii?Q?MbLjZMRXUGV3IK7WvZT7Kf8jawLlrv99mJh2OFxBpN40JCQDyhB+dI9Kiofj?=
 =?us-ascii?Q?QrAJadEXJa/4aAQSHh3Q/Jjr1IQzYO+vZkWfVQdxB9dMl5aclbh8qhUuCL08?=
 =?us-ascii?Q?Gan+NX/X3nljgdMwP4DAN+R1APSMhs6GIXElyI7mtE719cYRgjhfI82jkbwi?=
 =?us-ascii?Q?7hJOAh5aRMyvBOqWr+4AaPrnAzk71m5FkGE98uvyD/L8V4mX/WxToVxddiIH?=
 =?us-ascii?Q?68UGojHYf1dFCtnfN9r3JoOpvfeB3WmdyHKISQGR75A4kOsoyVouW3KFGmdI?=
 =?us-ascii?Q?aB7Ct4XNagXc+L0cTH/lBLVEjbBo5d4/lAktGFKW09l7xf7S3gLS4fwgjezi?=
 =?us-ascii?Q?X/wT3n9Lm2dqXRJZFhRNUMv2zP6fLSsd6IhJ2V9770VcDqp1YlIQeZvswPyE?=
 =?us-ascii?Q?EFKJQWn+XVFgc9Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:46:23.6873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 63342228-0f12-4628-364d-08dd5fc0cd35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
Message-ID-Hash: VGMNLKQCOOBNX4I6K6NB6EMFJLJIXS3J
X-Message-ID-Hash: VGMNLKQCOOBNX4I6K6NB6EMFJLJIXS3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGMNLKQCOOBNX4I6K6NB6EMFJLJIXS3J/>
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
index b5eabd0280bc..95dbc9b01a70 100644
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
+	chip->acp_hw_ops->acp_deinit(chip);
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
index 2098afdddc60..d2b81a22638c 100644
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

