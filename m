Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E172374E
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 08:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5E3827;
	Tue,  6 Jun 2023 08:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5E3827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686031893;
	bh=0rv1Y1zXeWwWc0yYkL9UadtjSomkDZm2Gt4MQdIMc9c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l6vQZjzkucVoAQE1I8l3yCz3HWYK0q81zOvC/YyDQ+GAtCFJzToZtap0gC57dnSO6
	 QCs7fVETOMrR+hZ7HbkX3zqy+b5zcoJULeQOoC+BpU0V3Qozi5GvrOFxsF43tHgsmo
	 +84IEKpBRcp3j9B6k422PzEgYxApjtTwHlM2pqNQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2653F805B4; Tue,  6 Jun 2023 08:09:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 194B1F80580;
	Tue,  6 Jun 2023 08:09:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73731F80544; Tue,  6 Jun 2023 08:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8FA9F8016C
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 08:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FA9F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2+gvkwMM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W37iaPuE4/AUUlmPVAf7IXQ03gNcsptkU49U0kJ/GN7NnUhr6+ayJ0uicOh7hiqOiXU8tq0jxrucNkxvzkvwDV5mR5ODHnVK6O1jU2LkgvRR97Nr7fmX1cM1wywgI9HpVwlmi5mlzdE+TVPR0SPTx5QkKJ9nHVVyhdgUIOTLh+CzKMgvg50bxBPD2hK9ICQuXN23u+kVViEkL6qNUTTk+/3mUJUMDsO7A/x1dZTIz5yq369JrdysMl9ZE2zr5pArE68H09mXZahaDVxtgLCH3er6ndvIHqnce6tI1008FD0VYuRWODoB7Zy33tyIXKeFfHOsYzMWzQ/PVCy+Ean2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJPO76LeVbRLT6xdNfAEfol9vXoNWf/MqxjxFnE4yls=;
 b=UCIFglv1UF5hZxnj84kq+ZYaBesH75Vj6nM6knsPNhMLdVI+3E57P69Qyx4P+iZvy7YOzTrgFcG5adCvnxyo0njxN5H0s2BIZg4GO8Ue3yML0skQhjsvOLZqqOIV8uxs99T1BOibasKPwP+S/JISAGDyoxU4xPjLv4XH7j9pWnrKSo9Z52LyPKnM5Vg9JFg28sMOTs6ioCJ0MPgR5Stx6Ry66puKtXdSnmUm8ILRxZ+5PEuqT/LNKIIPlWlGYinZCmvH489HYDxVCdg9VmwF0fGPEBPW3JMjYjAAb/DgozQAH5SAAvwd9yxOj1jNWlihZ2pZvhxPC5z8bWya35MQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJPO76LeVbRLT6xdNfAEfol9vXoNWf/MqxjxFnE4yls=;
 b=2+gvkwMMQU5wVAetx7WjCouJjEZjSQA8ZPSCGPIhPr323nwZ8T2GDtEXNgtMm4didI7+Bgus4XLeLFj9d61BlQ/Lp5SWi5OlbDNEbPlK0yNJ4nn+WfTkrXQaxKyhrB4TaPbm5ecUxgacz9+4X/23ZEoPq3TuADNqCMTixp3mgic=
Received: from DM6PR07CA0087.namprd07.prod.outlook.com (2603:10b6:5:337::20)
 by SJ2PR12MB8829.namprd12.prod.outlook.com (2603:10b6:a03:4d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 06:03:29 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:337:cafe::ab) by DM6PR07CA0087.outlook.office365.com
 (2603:10b6:5:337::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 06:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Tue, 6 Jun 2023 06:03:28 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 01:03:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 23:03:27 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 6 Jun 2023 01:03:23 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V3 7/9] ASoC: amd: ps: enable SoundWire dma driver build
Date: Tue, 6 Jun 2023 11:37:22 +0530
Message-ID: <20230606060724.2038680-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
References: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|SJ2PR12MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b13bec-ad8c-4cf4-82bc-08db6653bf92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QuvxfK9gkBuPpZhKJAhsV+mhSgsEWrMfqvVUdwZcjIcULjCBVK32e0HMBXEiUOnLPvkiB7gJiVDfoD2b7VC5PERGx+CQ49qHIIAGwKcrXnULSnVWoLO0SVJgyO0K7aYzN0u6ehuim2JD+8zxuw6JfjHJezVdk5JKvEiGiU06qgsNQMDsbtVID6YhWANvqoMhaE8vbftqJHM0mA/Bf2BikwFWVraan1E0SnuRBzTv+Fved8BXyGEB1ToUVV3YIfFTmTG/mTDMyhb1NFVEcawiBxkJsoewgSTsATnCTv3hydSqVR4v63C2Y7lrBsAgBCzZT56vTdG/lrsNur1RuGtTEK/mxDIPbfSwBD8yMAUysWxtYeH2JulsyjCrYTgQnynFF9VrO+VfSrfn4J1QUmQtoL+XKglUU3IlhU5ja0lUBK9fmhs7sVBXUuwb5YKx0zptS53RX8xCsD17UdtYJm9Tm/XgWeLgR0HbDhvpMfIphTuEAoeH4jWYDMuAOM+Mx+2tBOPvAnNf2q/b+Ajcd/lfma95CHUj06e9e1EHRU9HRMAgjOG2i9CxV/2o3J7IXi1Q8b6FCEsiRWX0JLloUG6IhkFgIgAlfgdI/quPHw/nw7zcnz47eOUsOzaFf2smuuKTC9fBGGQRTAWgb7THj5JFohon3anfp1mdOO7nQEL7fTM5zP38NmzxpB3vO8JUCYAVWE7pUHlXjLa7iGP1mT1fnMKcnfN+pZGDnbNDbKcXeNEqQDREDEohmRM4t/92v4X2QyUg4oBpSnTaS7oqYB//VA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(426003)(336012)(4744005)(2906002)(47076005)(2616005)(36756003)(82310400005)(86362001)(356005)(81166007)(82740400003)(36860700001)(40480700001)(7696005)(41300700001)(316002)(5660300002)(8936002)(8676002)(54906003)(478600001)(70206006)(4326008)(70586007)(26005)(1076003)(6916009)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 06:03:28.4488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99b13bec-ad8c-4cf4-82bc-08db6653bf92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8829
Message-ID-Hash: Q2MQBM6WQELETX2TQTI4V5UAXN6H7YBN
X-Message-ID-Hash: Q2MQBM6WQELETX2TQTI4V5UAXN6H7YBN
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2MQBM6WQELETX2TQTI4V5UAXN6H7YBN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable SoundWire dma driver build for PS platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/ps/Makefile b/sound/soc/amd/ps/Makefile
index 383973a12f6a..f2a5eaf2fa4d 100644
--- a/sound/soc/amd/ps/Makefile
+++ b/sound/soc/amd/ps/Makefile
@@ -3,7 +3,9 @@
 snd-pci-ps-objs := pci-ps.o
 snd-ps-pdm-dma-objs := ps-pdm-dma.o
 snd-soc-ps-mach-objs := ps-mach.o
+snd-ps-sdw-dma-objs := ps-sdw-dma.o
 
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-pci-ps.o
 obj-$(CONFIG_SND_SOC_AMD_PS) += snd-ps-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_PS) += snd-ps-sdw-dma.o
 obj-$(CONFIG_SND_SOC_AMD_PS_MACH)   += snd-soc-ps-mach.o
-- 
2.34.1

