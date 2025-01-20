Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2022A16A4E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:05:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EDF160237;
	Mon, 20 Jan 2025 11:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EDF160237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367552;
	bh=kPeGUWLoMGON9sgzE3h3LlPzvRTnBVEwPLnyUTjAYno=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OgWUNhqduaTigC9Vg6VyfLZnGK5KI/6ih3YeIoXkFbQ/9Hf8SSOUkt1NrZxL1+q51
	 9WEaFpIvaELaM4V0D6uDT43yjJNxJoabNpP7uZgKmvpARxf7bY3M+5Fbg79/nq/CFk
	 38qzAf1NIHJ6XVu/3ZYxwMty6KFFH0ydAWsCRAgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC4E8F80635; Mon, 20 Jan 2025 11:04:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55132F80632;
	Mon, 20 Jan 2025 11:04:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04E50F8065C; Mon, 20 Jan 2025 11:02:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C4CCF80571
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C4CCF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Ngz3qBHH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qy4HqHi9odqCS2ezkF9WncaiR3a/2Meff97JavJRVZAaRo35UhiT8oScFJEMoA1+VF6wtBxh/s9ANDRGIFqsjhs1FT+cKLnxKq8TiRKEukryDLOYpBIowXqG6N1vcj0xqOCWqgrh4WRrfwhwJr8Jbd+ErMuLFRz6l6KnpYarIqrmbCUu9nEC2uH1n+lRBUAGX/UjgWzkkNYASLV79EO5AbFhXnD/ysYWSdrvLQpReQ76Hasbpzmuw6kR5qPeLivKVd0+yoWx9UI33jI/cCcnKGncyf+dHLItpnyUM7tJReqlWGL/XMaUYm9Zr0+EIbTMkmPvmizy685q6dFL47bRwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiZXgo/BylCXVwTY9zoE9ZR62TFoA5NpnfbUzgC4bDc=;
 b=dt7FNYmD6rAUBTfJAVUXxCCNBsWuBN2LtkhrSwtIt6eoEF0N25R75b7zuP+xbVeKNei6Ranefq1e+x6wjf43Gw6PAJZPTKFk3ulJfLghymdsQcZfoclyPfuH2TTQTD537sW2WQQXqyM8OYLzn4Hz9rNji8LQbHiZGQm81J4VaPAiF0jqRVRd4ObdAsuhpZBTBzHYtq0VIjhHAy0WDdoUb8jjvIL2Q5gyMl9cshDjX369uqyytknyFoN8++yT3zuXInTCBm0n4ZsmgNVdA0QDzcUBdHmelljpveHuvC6TXEHvIgP/wUhUDrXLWEnKC0ZWoKIuY5+dnzgpO9zFXsmVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiZXgo/BylCXVwTY9zoE9ZR62TFoA5NpnfbUzgC4bDc=;
 b=Ngz3qBHHnz8E4EKhbnp3oQA9tB0FXSxPTjfQ/AdhJsq3iZmoq4Z3vysK5qrDvSrcfUfwIE1SiKPQ3U4B+iKnqE4UpNdg4VaVje1OjrkPQ41goBmpoPFO1xlWtZTY8exShjgQ55i/IO0fiOn4sZdBw3Sy4uhtXOfSxCPIvq+aP10=
Received: from CH0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:610:b1::32)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 10:02:20 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::a7) by CH0PR13CA0027.outlook.office365.com
 (2603:10b6:610:b1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.13 via Frontend Transport; Mon,
 20 Jan 2025 10:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:20 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:16 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 10/23] ASoC: amd: update ACP7.0 KConfig option description
Date: Mon, 20 Jan 2025 15:31:17 +0530
Message-ID: <20250120100130.3710412-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df1d4a7-28bb-43a7-e740-08dd39398759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z7jP2b8/NNGZBGVNurVc5vDMDznskOsWLZ36Im2fq3OZ306MFdvBi1rvdLOO?=
 =?us-ascii?Q?dMnOjTnH2/45bDL/C9B2kpqSHIVWEo7U4Kn55MJfXkzzkbBSAp2BDIKiWQGG?=
 =?us-ascii?Q?F07usVc7cMQba/LB6lHnUuU+Wai1lNvxeImyS3DdliJgNvEyHhh1vTwGZuVw?=
 =?us-ascii?Q?CsmBhKrNDhn29dA7P64rWoVQybTo9n4fN+B5OA9kOOLDGGAZGmG5VJY9/Hen?=
 =?us-ascii?Q?ZQjllouROzvMoE3Cou3i4W2tBsYldwwc9g5kYlpyvhyW5YrLGqulvy+c2KVD?=
 =?us-ascii?Q?qwQOo+btQDfnejpkWWDwOiQ8HMzGGaGbl22on04UMtaRCrEtVzCGqOWWW4y0?=
 =?us-ascii?Q?NK4FW3FBw/vENt6+vvsa6LfnQ+ciB9Xfn4TEvGyS4DPrAoWimh35d+2Kc6kG?=
 =?us-ascii?Q?qB9fuDodbhB5BP7uzbFxMljuEdzLQTaE/CvZHvjfPvaCShxs3NGnc+VJPNl4?=
 =?us-ascii?Q?FdzASdyau3czFu1vEL85k9aSyboRjD4g22MeYG8X3+OgrnAB/81yKglDaVMU?=
 =?us-ascii?Q?bZ7NaUH/MPxb2jApSRm33WsObGJa6rkDrlYzhlZ/npTpzSAjjXNl6lns9CXm?=
 =?us-ascii?Q?MvzNDuq61y0ZyuRPMsLC9Ya/6haVmpm4nyXJa2cKczLdVdJAPKr96MROCdE8?=
 =?us-ascii?Q?MEVxrllPZNxHnXqBXqLjuxOFsej796O25CB1PH+7E32/gvkaG5RH66OmwBS8?=
 =?us-ascii?Q?nafKOEda48D9H4i05uJWSzSE65PBNZLv2MigEzQ4iPKmf8yzZf4PqlQq3i9R?=
 =?us-ascii?Q?/so/Pla0tJOKxM2wg1LneIQSwH61jJjLrnP1KPbAs+NT7Ii1yuK1F64cp+QT?=
 =?us-ascii?Q?ngC2D6mViloAt2lNRVkPcYgYFFAqLc/KsOD0hTRZC1zdfUKPlnCDozAnWxoc?=
 =?us-ascii?Q?sWiMZgnqY1anbzd5vqzvIpWTw7MK7212tjHBlxR/KJ4pAnTuHa1klVKAzKHc?=
 =?us-ascii?Q?2stk4E3ENz/q/vxRcCcod/w89O00a9aRqN4QhLoeXPVXsdwKTJGdjqXSd4fP?=
 =?us-ascii?Q?SUCqaXIWLSoczestGU10/hvZPARlQYSdRrNfBYxGDg+oJFB8h1WaG3ZC/TFp?=
 =?us-ascii?Q?hkkotzQ/cwaP2e1teVMdbDHQIDO4gwOhU4kioqwy5goA++6i+vZmgsxadvdn?=
 =?us-ascii?Q?pRI+n0xQsq34C5QiR7cev8441sknDWST3dLQeg0riXP+qStfNiqV5npytWPv?=
 =?us-ascii?Q?+o+twvv/MsKhFWz1eeVahZqxSa0vOGPbew5pDz7k15PoNHh2vvQRxsuZivOB?=
 =?us-ascii?Q?gkH3WueMEIihu9c8rc5ulw4BGLo3tlViuSJWqURgufLRkHHWDVP34Nak9oCE?=
 =?us-ascii?Q?YQFWyOeH6mZLFXVqFAAvrPVbOf9xxg5bu2Oj4M/VUPhd4VhhM1ktR2nZBuQv?=
 =?us-ascii?Q?LNuqNYBO8USf6VETz6pwG4XUevXjFomlNjr+gkI0/hKeKt55wvL+5ag44ByW?=
 =?us-ascii?Q?pjvgFjZtg4Oj7ByUv5xYF5xVEUVT0onyhkCMm6pHPOAyrcf9iV0uWCgG1xL6?=
 =?us-ascii?Q?+6kPZ5f2v+QHOVc=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:20.2432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1df1d4a7-28bb-43a7-e740-08dd39398759
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252
Message-ID-Hash: YDKXSSAXVHSQ54S7J2Z67QVRLV4OHAYF
X-Message-ID-Hash: YDKXSSAXVHSQ54S7J2Z67QVRLV4OHAYF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDKXSSAXVHSQ54S7J2Z67QVRLV4OHAYF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update Kconfig option description for "SND_SOC_AMD_ACP70".

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
index bc0bceee9494..c7339acb8370 100644
--- a/sound/soc/amd/Kconfig
+++ b/sound/soc/amd/Kconfig
@@ -190,7 +190,8 @@ config SND_SOC_AMD_ACP70
 	depends on X86 && PCI && ACPI
 	help
 	  This option enables Audio Coprocessor i.e ACP v7.0 support.
-	  By enabling this flag build will be triggered for ACP PCI driver.
+	  By enabling this flag build will be triggered for ACP PCI driver,
+	  ACP PDM DMA driver, ACP SoundWire DMA driver.
 	  Say m if you have such a device.
 	  If unsure select "N".
 
-- 
2.34.1

