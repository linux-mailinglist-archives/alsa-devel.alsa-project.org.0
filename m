Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7C8B9C0D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 16:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30DDE85;
	Thu,  2 May 2024 16:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30DDE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714658935;
	bh=QWzEkSdjvnADCmIvbRWb8cssbIqca65gv7G5OZVLxc8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fM838P3jOD92k7V++Hy8DeJV2XbGzE//wZSpGdS2pYgjyQl0A6DlKx24jTzgwDpbD
	 724U/TvbBRrgn0YTkvXTruk2Iz+U7ROruzr90s/IiQAUJfVDtZcHeQQ0rgEJGEnRoB
	 uBrGWZaADBh2svhgZ9vBRdoAJMWJMfkiHWarP+ok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4321F80578; Thu,  2 May 2024 16:08:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F39F804F2;
	Thu,  2 May 2024 16:08:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 208C5F80269; Thu,  2 May 2024 16:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1211F8025D
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 16:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1211F8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=07mEspSr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZln+5apSyZZkmARBh1ELGEqMOY5J7sA6syFbwb3ifGh8dlrbJ7cL4ZF1EwUxtMcM80zversdAhqxgypHHJ5a1zMWqsO+2c45+9ASfW3sDYktRdaXRhJhNz0/VoseAjxttHeK6P8T/ZKD2MFWaphCYi1f6QIc8N/sL3Rhybg1sRkFGN0C2xE/JDKqI3cjXVZtDaMoJGP5T0x40mrDiKzemKGIxa95ScjtRmA+CXGMZ66Dg51SVFHEk34TAISog8WbIq4YRLJLh/keao8Rs8mkgoEmJHFaiV+cY375K6nId2iVMlB8Zl1hPHP80Nx1dMT0kjqrik5O+1cDMiyWWyL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3orPfhOIf2ez8ZcEx0FaEOr17YZzaq39myVFLiquxiE=;
 b=Isak8mMRrOvXUrgYqFtF6yhLNH2dhMXsVUofr1Kj2/di6EbAsWwW6tsDiRLQXecuNJC3ke4eOEru24q+xD3RyPn9znlAZRfMdk2F/Dr1wEln0NgKLZ/tGjt61NR81H2XfXZPmIQThycE5IGdvIF9jJ1o1/W0wWpvWpZEUj00l43LlxEYWB515ECi2X4pp+3U+TbFrNye43HVZ0N180Lb77N2Yh1J8JNYFC6R7qsyrMjh/xTKxEGGqUdovf2zTd/iGczzMc9Nqa8nXRg803nuaO6SGRf3OAbwAahBOE5J5XH05CoZvF01tQx2rFXio0mzhWf5v9eXxSiezR1fxgcIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3orPfhOIf2ez8ZcEx0FaEOr17YZzaq39myVFLiquxiE=;
 b=07mEspSrqX/kmFMW7OMz/tAOHB1/XrCoGUwiNIK7CwatE7nw/xqvMO8AFhAdmbuwsvtzQYEA2J7JPPwOK/OfbmgE8jOLt80VRcSsumOcEBLF/4jV2IKAvzzaXyJp4OimEJHfA0JbnhAQb36Rcm2ooKqdmrZq47Ql//Bnix7Bqio=
Received: from BL1P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::32)
 by DM4PR12MB5988.namprd12.prod.outlook.com (2603:10b6:8:6b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Thu, 2 May
 2024 14:03:56 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::12) by BL1P221CA0002.outlook.office365.com
 (2603:10b6:208:2c5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Thu, 2 May 2024 14:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Thu, 2 May 2024 14:03:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 2 May
 2024 09:03:52 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 2 May 2024 09:03:49 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: amd: acp: move chip->flag variable assignment
Date: Thu, 2 May 2024 19:33:26 +0530
Message-ID: <20240502140340.4049021-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502140340.4049021-1-Vijendar.Mukunda@amd.com>
References: <20240502140340.4049021-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DM4PR12MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 77bc2d8f-db02-4243-3db3-08dc6ab0b4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?piUdzXVFDhctGW8e2l+TUCST7jll1z+JnmuBzuBr0tsqZaYvCtMZEkbB9zeV?=
 =?us-ascii?Q?yLvJhnZ2qh2Jyw3wbujt0U5UV0KByZ5rRg70/fjnwLukAplF7TxKbmxGy7dB?=
 =?us-ascii?Q?faoHM0lX2/GYRP0mvyYT6ozYciEcYUZWRB46476WOOtqDvfrfXwTgHAaJYhc?=
 =?us-ascii?Q?s6ihJmWXZmMOprsGX3QTgsnQhGGSZWGCT+lKYlnjhZo9UmYuXR9biPIfwwsg?=
 =?us-ascii?Q?DEwNQ5h6pTxwTFmwhDYpR+WBRvvP19xG6HvvGvkFpOSv4S8fqb2RMEZWcAEZ?=
 =?us-ascii?Q?lC5bwQqRaIBt84Qo6g6YhNxTqLqECwoX12NHEqi26GNRNB5RyaDWs9iLkU+/?=
 =?us-ascii?Q?bDwdLSGfa+lpJ9Rw90nhdGBmg203ZsEgjsf1zYFXU34URkXy4VPx8esDc6MI?=
 =?us-ascii?Q?RHg1ZCsmDj9kzKbo1RhveBKRN6Y6nxo9GJWb4lHGqCRUPHz6Rf1ogvPo4z+p?=
 =?us-ascii?Q?ACzHovy+/fqq988SiMYeQCrAATXqZ2hdB4cPreBP2mJiQyZKaCZ0h0IrNbmo?=
 =?us-ascii?Q?06N1oe0c7a8MfP6PlAr2ae01DSe64tahwFIIwNmqL8lwn3S8ZOHPwz7Gem+u?=
 =?us-ascii?Q?jCEnCzoZo+e1XwFG7jT7eWFMLnIDE4hn0XciET6DzwkO60/zhkmygvzq3aws?=
 =?us-ascii?Q?Of76ujDaC8nL/UxLBoSk1cASw228Z4b/HOjB89ETIZxmXFqUmkIjlCO5UEgy?=
 =?us-ascii?Q?vvYCM06NFj75VOOmkH5dILFIBri2Jid5CJvcuIay8wac9wCyXk5xISCwMss7?=
 =?us-ascii?Q?Ydqkh4gnPINbCaEo7wGdwW5b24k7+oEJmt3KrSXekQiwIApEu4LwFEv0mjWt?=
 =?us-ascii?Q?fThrnaYRJhJxuWibXSTFt/+XtBNxV68RKeNkv04+dvfO/XKgVQA+LCoCxcEi?=
 =?us-ascii?Q?BWsLdONR+37QfffYMysI2lG16IHZK3U+BsN/BOfcKsBoBhjZUeGh9nAzIonW?=
 =?us-ascii?Q?znh6JZ0Y51pPr3BHEqSlJCKwCB7qHdsugaCqHniGSnM6GUoXbHMRANEI9z+G?=
 =?us-ascii?Q?SJRwzindFmDePnWJS66aiPh9dP5eY01AjsCliegGGWmVlRnb3CIhxa27Bb+C?=
 =?us-ascii?Q?oDUcI0u+NbZMxJlmqBXgjJZgw/f39ZZRPgb62zAExYKsvRt1YDs3OvXkEI5w?=
 =?us-ascii?Q?B1zlqW5Ie41sEYN9Ziox7rc7QMtIXyX2Tdb97d7rziF1QFF/+gQ8YNlHgpa7?=
 =?us-ascii?Q?ES1FaKAx/dPqgNzW7Aqi+vLwU3Y6ALn82MT/U7Hk7WTJKDvzsFnIRHBXjkDx?=
 =?us-ascii?Q?KNgMO6sOdiCxfZZBtJrB2gBpwsa6DOJY7pbQQOIhiZ6ChVczoeYqz6OiGeAr?=
 =?us-ascii?Q?1ff7HjJicKhGtQtywrM1idoAbjuPTkf5VvKV/OfdbBgbxuTE91CpXc+389MV?=
 =?us-ascii?Q?TtCFfAP1Opbaic41P6O56mGq54GZ?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 14:03:55.9068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77bc2d8f-db02-4243-3db3-08dc6ab0b4c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5988
Message-ID-Hash: 4IFPHFJSEZQVDHGYM4ZM2J27EB3W7BIT
X-Message-ID-Hash: 4IFPHFJSEZQVDHGYM4ZM2J27EB3W7BIT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IFPHFJSEZQVDHGYM4ZM2J27EB3W7BIT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

chip->flag variable should be assigned along with other structure
variables for 'chip' structure. Move the variable assignment.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index ad320b29e87d..20c824d8a323 100644
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

