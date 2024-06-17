Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2FA90A734
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 09:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C8A847;
	Mon, 17 Jun 2024 09:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C8A847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718609575;
	bh=zstUqW0O9iyGwmgmUj/fo5AIT5C2CiL9XT1ogom/D5g=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gukVcqnFJae8Gs/eu8XNtAC7FSBIzLjzqRc6c3qpEjRU8Xcm1D45pRox8r2c86l6H
	 XXwwobDYOU4KBiID0u5yJEAN5NFpLcobRAiEV9i9if5xwWc8UdDjXCxb5/08x8sCsM
	 OV/Vj0lHGzJeYVArcLLZIaLtzB7NkFlhX0erAgAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41EF1F805B3; Mon, 17 Jun 2024 09:32:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25172F805DA;
	Mon, 17 Jun 2024 09:32:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B86DDF8023A; Mon, 17 Jun 2024 09:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DF9DF800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 09:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DF9DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=vyCyQtyd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrilXAXz0s7Ej++EGw1K/6BVnyy99RT7wKipBsGe2V0tvxMGW29dcyUIuJumA8y9Fb3GvVGURCYy1DY3d4Pr+L3cy7G4YsY0CYRC9PKyFmlz6TkOzTLxfIuXZSQFTsev+0nQ2EU/BBH2I9Af/7JZYBpsFdWQtGt4WkIgcIhmglLaDyzWrLE8vWyJ8puiij/MngAuu/2lP/K5Q2bjt2+6au1g7U5DpbJJYN1/iosesnUQ3Cas5te7d4GS8MQDNf8gJw+ccvhApq+pdy5JiOp/HM/y8keU5CmdpHW4DrC+miTDlC+NQF7My6Y+xW6l1upofc/iml0kDoBQyCT6ytI6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XZg0p/QGUq5x7BRVUEh9zpe9JOJie1jgoF6ipXy9YU=;
 b=TAdFuzU8Df8LfvNwQbrr+j3XM3RSFq5Zjfxh3+BrzXKzlvt5urfFPHxgdT6LXkBhrXHBi40OpxR1Nrjz3oy7RZsGizZ+YrByecqwk3OLkAurFhRDADxy42n4idlGMYds+Isdri1NXcMxQXOj0Pt03/RJxSnx2rWozA+8krMO13/Ag64J1GygV7l42oUW1Yc4RZByGMF9eHr1mSzcqerVDbHy33pCCm7mlNKNcdgMxpYc97kcDzfbAKRy/avJ3044PYJjW5Z+Ngbg4fCEz3KS6PolqSoJWI9XKZhS0g10cW6i5PVmj5xFj85EaoYuOf/5uRhVslam0td3f6gBW0qwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XZg0p/QGUq5x7BRVUEh9zpe9JOJie1jgoF6ipXy9YU=;
 b=vyCyQtydebcK48pl+T+j0WhLskGiGPd5i1WtuT8BjkC+nYPZIF/09UW6VtM3u9NGKmjvOdyNRO71tOwStiSB6r24vF8k3iaW74xTjDiORJGL57+Rr6QImsyoro3EKFcTQMdY4oAG2qtgCKb8QEbMddK0PD4SLhiA3oed8rs0vEw=
Received: from BYAPR06CA0072.namprd06.prod.outlook.com (2603:10b6:a03:14b::49)
 by CH3PR12MB9453.namprd12.prod.outlook.com (2603:10b6:610:1c9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 07:28:50 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::98) by BYAPR06CA0072.outlook.office365.com
 (2603:10b6:a03:14b::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 07:28:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 07:28:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 02:28:48 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 17 Jun 2024 02:28:45 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <venkataprasad.potturu@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/8] ASoC: amd: acp: add a null check for chip_pdev structure
Date: Mon, 17 Jun 2024 12:58:34 +0530
Message-ID: <20240617072844.871468-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CH3PR12MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e953331-0078-4f72-7c24-08dc8e9f21be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?w3EVr2N9d4O72QbAoqm/Jd8cI4KDeOxR8tCHXAYMLSBI105efVdT+L2RhlOU?=
 =?us-ascii?Q?bMHEGUxof62aR6d9vg2L7qYopcU2WaZisGpTyjXUdXbPRjY6i851YSi3xh+6?=
 =?us-ascii?Q?bfbzmDQzWTa0h18rujXtv2raDS5eIiIs9KjlyUXsvAjPGt5kA6QO9172kfpx?=
 =?us-ascii?Q?YtX4FCS1dRvg5eEB30+Tt6g8SsumBCgW653ki4S3+SkyjW6U7sRQm4OEPWtt?=
 =?us-ascii?Q?H8KjEdtx2s/p3l00AfHI/QrQNYzRYktOGxhHH5kR0NQOZp/wWA6ltwzlWaVX?=
 =?us-ascii?Q?d4H51w26lf7cI94Z7AfJLeKBiadZ9nnnFfv5FOSf5j+P8V6w85cw5D93oZpo?=
 =?us-ascii?Q?FUl4mZwPet+bBbLwzctCTKpbYce89v/31KL+zSSeZI6D3UdRWcmD8jx8KboI?=
 =?us-ascii?Q?4Oc7bsuJadvtw1lmCN7Ry8F0tzU1g1OAqhC5Jw9/F0nqAtTQ5jZQbMQCgebO?=
 =?us-ascii?Q?UPzTEmgh4WQiYWv1ehuwU/TkiR4MGkuX1B3IjXGdfNoGVkyMfiD064EmZWRa?=
 =?us-ascii?Q?o39eKdEUIszy6ecXvJjKsUBpFt4aztPsui3PX/2W5Msnbff4m5fTDUx0ZhnR?=
 =?us-ascii?Q?ujcjPwKxpNnFU3UJcVlfMde8m1qc77NEWB6lfFxNcwJ78penzjmhH4T+pRQE?=
 =?us-ascii?Q?+wJjq1FruYk/W251futbjHVXPbgprrPxldDHuuRk3bftA4/u06N6Vz6FOhKB?=
 =?us-ascii?Q?gSiPA/oWwdilsyIWPU3+/87wHoMtLzNSoZIR+e3+SrzNBLhUYbMPCSMaGYkh?=
 =?us-ascii?Q?x+TuHHZs5QMpHfJRPFiyOveeyt5oxwhLZwYoUkdN+6kgCQI6iT8qH06+Mt+B?=
 =?us-ascii?Q?B0mQtOvlQEBEVUHy94YzxY49atn8UiwNCNgsfFSvRKybvAuWIQgzQ3d5bnnb?=
 =?us-ascii?Q?70v3MTgGjpTiPRwx5+4EL6udikN9GOU8kEppZtJo8/GANhoBfWIccB3LnTCN?=
 =?us-ascii?Q?FhPMIV6/HrhXjsjaUdQoGPBxdz+R9D5TDNFtJikggXztPnxGKlu8/WdXJA2c?=
 =?us-ascii?Q?Hc2KCSJ2qCnqzU9inPbD1kp/kt2+vAEnhdIVTaExdtxLyPcq8phAbOswm8iB?=
 =?us-ascii?Q?b5qrAZheuXHF1PvGFJLdZf4C7vpBXOefe4uEbBZOgsb6sOI5o0+0TYj0/T4i?=
 =?us-ascii?Q?VmH9zxV8YDALlRk/O1RFsAXA8UPWBD4e8p3Q67PVSyC/Dw7uiofRtUW07fQQ?=
 =?us-ascii?Q?afZNn6LzteQDxoRcjbqvFTSy9VdZxSjhDuc6gEwx/uz23m7K+Pjp0Rq257Jc?=
 =?us-ascii?Q?9+fVcbKS9t7CulNNc20AYmru7Edltm8m6qQqj5IToVB3pxPQacRYlCRyZkC8?=
 =?us-ascii?Q?41Zkk64+5ZAY5rQhYnEPlO2iDgVJMnyViBJ0QjLtZhWeRqejxC956YncZFHU?=
 =?us-ascii?Q?aXHYmJ0YnOez6xi4lcV5bRTZwtSs2SL3vh7Hcuxz0YQypEs4qA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 07:28:49.5437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5e953331-0078-4f72-7c24-08dc8e9f21be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9453
Message-ID-Hash: 7LG6UZP4F653KRB5TWWOU24FNAU7E26F
X-Message-ID-Hash: 7LG6UZP4F653KRB5TWWOU24FNAU7E26F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LG6UZP4F653KRB5TWWOU24FNAU7E26F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When acp platform device creation is skipped, chip->chip_pdev value will
remain NULL. Add NULL check for chip->chip_pdev structure in
snd_acp_resume() function to avoid null pointer dereference.

Fixes: 088a40980efb ("ASoC: amd: acp: add pm ops support for acp pci driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-pci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index ad320b29e87d..aa3e72d13451 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -199,10 +199,12 @@ static int __maybe_unused snd_acp_resume(struct device *dev)
 	ret = acp_init(chip);
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
-	child = chip->chip_pdev->dev;
-	adata = dev_get_drvdata(&child);
-	if (adata)
-		acp_enable_interrupts(adata);
+	if (chip->chip_pdev) {
+		child = chip->chip_pdev->dev;
+		adata = dev_get_drvdata(&child);
+		if (adata)
+			acp_enable_interrupts(adata);
+	}
 	return ret;
 }
 
-- 
2.34.1

