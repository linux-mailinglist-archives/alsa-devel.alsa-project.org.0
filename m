Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6897D90A751
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99FDE850;
	Mon, 17 Jun 2024 09:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99FDE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609706;
	bh=rTWwRqkKpBVqpE5QLSm6YPJ6TaDJ5OR8u+UjfyROwCU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PMuF2Uk6Qfc0Ge+d01OlOAC/3/CJb0/Sjvp4Jw0WX6hQHa0Meaej7BpIhzyFIswTg
	 1bNUcVZ08Zb41GKnDiQzdnJqxKLKEjv3gnhoapqz29fhxXNa4XeT5GYUCr+9l82SWM
	 kXkh08vkwJo+mICJS5saO6OjOED8eRNlbEHiSIAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B85EF80682; Mon, 17 Jun 2024 09:33:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B723F80687;
	Mon, 17 Jun 2024 09:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63407F80266; Mon, 17 Jun 2024 09:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5868F8016E
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5868F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WG1Rg/K6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHkvv4tIpKRAQNUIiZRatoulLw+sIWC+fIJxa6qEZrwgB+IIP5SSGnSHcRP0YzZ+TZElmTvghPZkZbpHv/8To80DQObrJCTVAVlWH9e5BMd4TdJUPfzpk6buHVHk8gNiARHeX7woVbwA7x19Gesaug0yZuzbDe80huYtH4Gs5ohZm2kL/dHC+1LXILb/ceAOxvmcmJS5QscG0qzMtsXtvkm91in80nMHYHc16Z8Vcw94hXOKtIWdRbCOxZxzHWIMx8MYrQGM+1DRZ4ZV/VhytLx4JDL7eRJoBBwQD76hTIu9IthdUdhlOZVyX9IHETt5TRT4YBMCknh0A9R43lx/cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9nORu10sitJPP6VOYhI1H4DJoOq3U3LrYpiy5JMAos=;
 b=TtzPiRvasqJPkvRZKyBl7boIDJIUsrifwQ5qarqnrjWHPxrN+NWtM4vi9VAKIxZ7ONFW+E8tdj4r4aY6MkoPmy4B63hdx3iDhhDxBrmq3Qww31lYhUDwy210/5bhg3xJ8zWBbyZLS1+wGZXQE0oh2XGKxPXovitHYRBCWVPvdDxMymlACE4iPsLEWsO/C1xjVb4fl4fyfWyErt2eL6+ecqXiPWnFl7Yd+XLGuByM1YjtaWzkUVgtFkRo/BAHnLyNJvVb9Izy8zRUC2cqkcy1A6w2pIp23W/pxK/axyW6BMILrMEqIVT7c4E3IpNkVxzHwLtySe9jMcPVgjZV+X4dIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9nORu10sitJPP6VOYhI1H4DJoOq3U3LrYpiy5JMAos=;
 b=WG1Rg/K6BK4clA8zs9gAAkR93KePiqaLwjnwYxIdrmXxRSqEPvtUYC/mhkotMSxQo+oHxhYT5LLTOkcrd3dVfC+HZxitp9njjDY73breKszhc1Hn+MC+8HuglJT7+6CnQkLGjwEwgoBE/YCV19ncAEEkUVmusVMNdCeTdzVOVUM=
Received: from PH8PR05CA0015.namprd05.prod.outlook.com (2603:10b6:510:2cc::16)
 by CY5PR12MB6273.namprd12.prod.outlook.com (2603:10b6:930:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Mon, 17 Jun
 2024 07:29:03 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::5a) by PH8PR05CA0015.outlook.office365.com
 (2603:10b6:510:2cc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Mon, 17 Jun 2024 07:29:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:29:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:29:01 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:28:58 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/8] ASoC: amd: acp: move chip->flag variable assignment
Date: Mon, 17 Jun 2024 12:58:36 +0530
Message-ID: <20240617072844.871468-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
References: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|CY5PR12MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 11146ae1-d1a8-4d59-8f26-08dc8e9f2975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|82310400023|1800799021|376011|36860700010;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?R1bgmWLSBLrrWeQhM9E4nAfkwh2OfstV6GquudJBmhkcktOm9u0QHzxIUZyg?=
 =?us-ascii?Q?RQpSGixYKH8rmOD0em8JPGFc4788vMCbjW5x2kgmx6TB8DSzrU1pXddT34lB?=
 =?us-ascii?Q?TJT7AQMtTjsy55E/rcpiw8Flr5hxv4fq22kFuoCV0v0mEudCg6enbUjXiS1P?=
 =?us-ascii?Q?YZReNAxKj9F778xdv7iPb/rgoN42ceH/G7UEyI+7LtYvu4dpQcgK3kXzWbIr?=
 =?us-ascii?Q?m/zykgxT+LK4xnRF++9S0AsXPNHCzU9veRnAkQtGwQ//6BeX2BWnHYHByo5V?=
 =?us-ascii?Q?CkI0T3jLp0PVA4eYXq/MMbdevox95sz4AYv7BXoJhFOLZRNjW4mKrlGntgGN?=
 =?us-ascii?Q?wcQIk4C2eeY9ELzqEiQpYd3NQn5NAK94AjszdeP+M/XqhtWk0wDhonDa6MvD?=
 =?us-ascii?Q?t3CeZAZs6ofliOZBf2sW7DKtv4Gvn6RLq5QWVNelSUZ/vaJhiNKWaYJeMxgS?=
 =?us-ascii?Q?DMNeuz0/5IM/SVIHxnsgDokWQS2Xx66DGMj1rY/COELsplaLQILqTWZgY5Ra?=
 =?us-ascii?Q?JmsSzeidWluUjJClElUlTXPOy+WHf4ftBVNYNcJf9Nbz9U6Ml2d0Tg8vNLyV?=
 =?us-ascii?Q?ZnRKgQoI8U/n4J6OmEDZfbHSowVNHGHpPPyP28e4rUSDfnc/pB1jH8bWKqm3?=
 =?us-ascii?Q?RgCgPQDqmUlrKvrR0OOGjWfzRQ3jVr2yxlv3NJFo/j7h18DIUklYIhx4TpUF?=
 =?us-ascii?Q?98vya+ls6K/MJihtTwc1MHR68fXxJat3MSq0xCxjax8CMzerGa89D0b72kQp?=
 =?us-ascii?Q?KOIO933TT2zhBkhLm6leNJu9ppRY4+B7cownkvmnUZyWgxj51/5vDCBVweGD?=
 =?us-ascii?Q?e13VGncPpH9OTItK0Auz5Gt6ZdUD/3hkxZp46kxi3CO5G/IQFRdty1TOZQ/e?=
 =?us-ascii?Q?6x9kksPPdjnY+NZSQ3cfNu2cEU5e4pJ73KC86lSbv/0Ga7noMnyXrXvWLccI?=
 =?us-ascii?Q?UdRy9ddM03fd+AQi6nazE91kiAj0HpnNXfgQl46LsUpAhGw0kJZQB/6tEm1t?=
 =?us-ascii?Q?jDE2TigTZxbdEPnLYNLssAyzlRg7C9PJuJGnq91M5IL7hZR4fojA7AIvsqqH?=
 =?us-ascii?Q?HJWEMoTin0Ec8WREszwe09a32QFuM//XHwo7aZDW3SIhNg+v9OvPrUWraEd9?=
 =?us-ascii?Q?c6/z1az4Wg2U/JFME6QZJq4NHlehZvp6YD7sBN76mI/WB/Wl0FLl2Kxb8GFg?=
 =?us-ascii?Q?tJYOL/ydtqtE5STzY7W1TjkH5hqq90wXaN7wDc0CogiV/iyS3bciMHsCsivj?=
 =?us-ascii?Q?m1baCZmdUZQrjIkBhKxgqar3SF2ptecVh1TYDfKvy3XzNarUqrnn1FkYvFyF?=
 =?us-ascii?Q?cz2z6dldM0gBdrtVjgEODwm1aM8JILvW6qXY0YWIjDeYN6tJUO7rTbj/ggD/?=
 =?us-ascii?Q?PbP5ZqVVI1POLL8aeS11Lg61vbNZlGOuzILewCuiCtkdOP/Qig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(82310400023)(1800799021)(376011)(36860700010);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:29:02.5032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 11146ae1-d1a8-4d59-8f26-08dc8e9f2975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6273
Message-ID-Hash: XLIUPC6ARZZ5Z4XRWTFXVREHNNMNSBXE
X-Message-ID-Hash: XLIUPC6ARZZ5Z4XRWTFXVREHNNMNSBXE
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLIUPC6ARZZ5Z4XRWTFXVREHNNMNSBXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

chip->flag variable assignment will be skipped when acp platform device
creation is skipped. In this case chip>flag value will not be set.
chip->flag variable should be assigned along with other structure
variables for 'chip' structure. Move chip->flag variable assignment
prior to acp platform device creation.

Fixes: 3a94c8ad0aae ("ASoC: amd: acp: add code for scanning acp pdm controller")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index aa3e72d13451..777b5a78d8a9 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -100,6 +100,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		ret = -EINVAL;
 		goto release_regions;
 	}
+	chip->flag = flag;
 	dmic_dev = platform_device_register_data(dev, "dmic-codec", PLATFORM_DEVID_NONE, NULL, 0);
 	if (IS_ERR(dmic_dev)) {
 		dev_err(dev, "failed to create DMIC device\n");
@@ -139,7 +140,6 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		}
 	}
 
-	chip->flag = flag;
 	memset(&pdevinfo, 0, sizeof(pdevinfo));
 
 	pdevinfo.name = chip->name;
-- 
2.34.1

