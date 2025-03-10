Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D1A5A310
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0CE060791;
	Mon, 10 Mar 2025 19:35:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0CE060791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631751;
	bh=z4fOU4L0BMY1vCUnlAaFVwvZCUV1hCBN6Fwti30y2ok=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qeckXg9ih8M1ebJv5i4DNBl3RTRR0U+ustoKsEJFGcY8z/BnjsjcZRqICR6iBGVIi
	 0t64gu6P9gyb2OJ7fti8iT3dYoP4N8GDKn+ZUALZjAZq8Hz3WsAYnH+XYWa922qXEM
	 QE+l0JqWWcfxN1ScMdbXdPi295kntdc2u6WhGdwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C04F806DB; Mon, 10 Mar 2025 19:33:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC64CF806DA;
	Mon, 10 Mar 2025 19:33:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3ECFF805FE; Mon, 10 Mar 2025 19:33:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBCAAF805EF
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:33:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBCAAF805EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=X4C6Xiek
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDjnJcFjwye+RQRqZzjP/zwl3+c0zUD+/MQgdWSPlKQF4y1D633TavtCpRbOKk67SkrB/IBwMobWAuZ92eX8O7zAYd8pog2KidEGxNGmM+iQZPyUbRXzh2wCbouCDGaZSyQ9RuTfirk/LL3gjpmzipzcbUt3js/4tZ7lTueV4RZ1O6Nk849MXYNGiF6YXJZkPK301ra23ZjOR4RaAJkkYLvyxtesO5xizxPJR1ZIY8iWP0jwx1HQWr0KjJ+Ti48edL3cDlUA1e9eVX3rY3vFRjXz2qWmnoDsWJikbi7a5EL+/ED/RjbXRWuwDPnr4EpvKfZ4tfIR2LSO4qu0DLTnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJEjU5e1lVSzJeZ9adGpYCA5xs4oJmTjbO62QbpmBGo=;
 b=tiGPQW+k+g76Rz/lOlzPj+6AQiG4DKlKOVTOizIXXpRjZL67cHihx/D9UV8HnaUyWV4+f7dW8eBWbpzFrlJlhoRyhRTTC5xVu/VHsEB2yiZ/as6vcEchUPKWu/zYyK8ffJIdl8+oHusxqpnhLg9aZAcEvmjorZV7yIV82R1FqB1fA2iJs4W3Tv/XgApCJzmLpUjbwgI517etNokHxk7/WdvtVohRlJ3YaCyyQxFjARgOPBM6PR50WMzQyd/1uhGqDuwypAk9rq1CEdWyAi7KmdB1+Trq5bqQza3rlFZEHJFEibI0J4jCxLqG4p7a5Zznj9/MF76HbOvs99qoyK877Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJEjU5e1lVSzJeZ9adGpYCA5xs4oJmTjbO62QbpmBGo=;
 b=X4C6XiekmAodydFRxNNoZRNLhCjcRSLfM9jVMJj5qT6x9DAhupeEKGvjoGFZXdOHerDkUnBpd4OSP4h/ffeQVpfXninRgEStbALBJEwxgKG6CJ4vxtrbD22WzEquvK5DNzqlQn+J8uXkuWc2H5BFjcI8971YEq8ecOq90Qo7bSA=
Received: from BN0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:408:e6::9)
 by CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:33:23 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::f5) by BN0PR03CA0004.outlook.office365.com
 (2603:10b6:408:e6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:33:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:33:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:22 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:33:18 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, Greg
 KH <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 10/14] ASoC: amd: acp: Refactor acp70 platform resource
 structure
Date: Tue, 11 Mar 2025 00:01:57 +0530
Message-ID: <20250310183201.11979-11-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|CYYPR12MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 30cc4fce-d159-4388-c896-08dd60020a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?luZXunrDxlO/Z6CKiSQvGKad5qAKhIggyS/NPIeUp/j2r3n5Jioy7GcNqBry?=
 =?us-ascii?Q?mPFDBYuRUOItBcnn6Tg7pLaDno6K1zYPujpxakoWlAXRyRRNtIydhJ3APwq2?=
 =?us-ascii?Q?AVtR51wv0SFrboa3SgEPY4zHQVstmdPa2UFqHrcTMcetVQIJgrYglh6oW1oq?=
 =?us-ascii?Q?+4INyec5IZe1ZUL8e4sG0LuWBy0oPaRi1sS4wFgXe822NUipNsrxMzIfssgP?=
 =?us-ascii?Q?ocVP4/dXILir2IADEeBqUEe0uXdpdeSsIpO6HsfkG4/b7/l0FlS7HLw/pDZ4?=
 =?us-ascii?Q?JtTAfH2xHj/cw9Rct26M6vF/a6q/S+wqACbZDH2cFAy4O8ZaL3sJIVqO0qTG?=
 =?us-ascii?Q?GSvLVQWs9LBSO0XSQCFy3+3L4dYPQ1Cbr/xmQgX5K48iOVVCXdbOnrpysiCr?=
 =?us-ascii?Q?rWfo83+E2apcJL1xvrWKuz8A7Ol8UdW3S9P8legi5cmJDCWrYjNl0nznQSRA?=
 =?us-ascii?Q?Gtlbt3rZOvxoZGzz+glFr2/8LCB0QWhHrd1aYbm5tGyPL7aVv8mM5KmUmt/x?=
 =?us-ascii?Q?uV0kWMiKwVehq6l0pdO48MU9C+u5RCkL+9fMjNTaOQzsjbAeL1N5X4xu+Vy9?=
 =?us-ascii?Q?xcEugv2ZlgOaOoajquRSicvTF8H9no5xw2mH75ARVG5AikfozNY/Lntck3y1?=
 =?us-ascii?Q?LJaGyP7no/o3BJY6J/oQizO1bR8bo0NE/LfF8+u4nu3rJ308eAr+JknpigBz?=
 =?us-ascii?Q?UpK7/60Jtw0AfTWeiJLnb8h0ZStRsw793UWoh3D0unNzRx1qi8fC5uUqWiZ0?=
 =?us-ascii?Q?vLG+TdGSrwPOZEMVxNbLsHzJwIm+TnFCUupzgDeAevrlFzb+hIa7+MV1FaJf?=
 =?us-ascii?Q?9npEhzqSwDE33hd0LbG74diAzMxXEZP9Qm84klKAVQvd0Og1EPafPtGnEnBK?=
 =?us-ascii?Q?t4b1VAZByCUGR+IzbFT8/rgwI3a2t7dGmzQ4J/NIv8P2UHSbpMgab+o9jqbj?=
 =?us-ascii?Q?r5fePVyyiiOjGw6A5F7tnJAxoyODymgKO1BWHPOb84R25KpboyKqvOH0wD1Q?=
 =?us-ascii?Q?EaCbfo1MyOMTyeyiVVZYhWZFSmkLaEcnO2jJrycZN3346mCQijygzwVZvDyZ?=
 =?us-ascii?Q?qoDtg2wrMqi8T3uxRINPyaAFLqQuYBa3TgYVevXf9owqjzHpMK2M0x227cCG?=
 =?us-ascii?Q?4Ghl4poEJ/s+xIV3BMAPyDjGxEo50CsE7xgK5Y0wFl+bpJIGnmRPj+kM8I4e?=
 =?us-ascii?Q?rERaG0oYfqkJefdM47gEQ0WSldw73GuT2Zl6nhoFBcft9TUKKR+RLDxeJPBC?=
 =?us-ascii?Q?hnodiv8jW06LiVsWAYYblszFgBTa8j8dl+rwzGZTnuPcksnPeJ270Ko/sDkS?=
 =?us-ascii?Q?H3/0jsAnv67+gs6fd+p4B8oy3QKN92zP2aOJzcjf1FTyl+E+AG5OzasQ3K0x?=
 =?us-ascii?Q?elneYyYSGr2TzrzKUa//O6J7oBG0KCrIjQoAApWXRWgvb+FdxRq8s3i2mn/l?=
 =?us-ascii?Q?eeEvr7rcoL2MIHSPgvwhw6tgieYfke7h8i1VgZGzc6t2NYymlwFqRdFckago?=
 =?us-ascii?Q?V1cHs0BLBiMQMZU=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:33:23.2196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30cc4fce-d159-4388-c896-08dd60020a21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8962
Message-ID-Hash: NTD2YLISSFQ56CQKXDRHFKY77R3GEFHQ
X-Message-ID-Hash: NTD2YLISSFQ56CQKXDRHFKY77R3GEFHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTD2YLISSFQ56CQKXDRHFKY77R3GEFHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor acp70 platform resource private structure to amd.h
header file.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c |  1 +
 sound/soc/amd/acp/acp70.c   | 11 -----------
 sound/soc/amd/acp/amd.h     | 10 ++++++++++
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 8bb93ca18053..6728eee29993 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -151,6 +151,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	case 0x70:
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
+		chip->rsrc = &acp70_rsrc;
 		chip->acp_hw_ops_init = acp70_hw_ops_init;
 		chip->machines = snd_soc_acpi_amd_acp70_acp_machines;
 		break;
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index c1b546df5e67..1a89f8a3724f 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -30,16 +30,6 @@
 #define CLK7_CLK0_DFS_CNTL_N1		0X0006C1A4
 #define CLK0_DIVIDER			0X19
 
-static struct acp_resource rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x10000,
-	.sram_pte_offset = 0x03800000,
-};
-
 static struct snd_soc_dai_driver acp70_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -153,7 +143,6 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	}
 
 	chip->dev = dev;
-	chip->rsrc = &rsrc;
 	chip->dai_driver = acp70_dai;
 	chip->num_dai = ARRAY_SIZE(acp70_dai);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 084d9db1b65c..979d8b8801a3 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -238,6 +238,16 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct acp_resource acp70_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x10000,
+	.sram_pte_offset = 0x03800000,
+};
+
 struct snd_soc_acpi_codecs amp_rt1019 = {
 	.num_codecs = 1,
 	.codecs = {"10EC1019"}
-- 
2.39.2

