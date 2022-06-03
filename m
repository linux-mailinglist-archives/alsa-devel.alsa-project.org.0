Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D391D53C51A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 08:38:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D82D1887;
	Fri,  3 Jun 2022 08:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D82D1887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654238336;
	bh=9VR/b9lQ/IJgt8T/cH+co1tovv+QXxmxr2p9zKKEXX4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AUE9kL1vepyBB6ZmI361j/ElfzHuUQm7f0I+uCKZZiVUCA0Aw7FrAX94u6kY9vZJ4
	 DUJt4/DnxPWIo2nvXRduzguaaHu39wfrEZyaRcdHu37YU2j8cU9LiEn8HQEeGGWEm5
	 YVjR9+00L/YaUgbmy04AeEkFgczoxbZWNlrBkl0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C940F8053C;
	Fri,  3 Jun 2022 08:36:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C239F8053A; Fri,  3 Jun 2022 08:36:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::619])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B220F80529
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 08:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B220F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="ANfGiplP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jB09AXilL32fx1HNmZewo3Tf1yL1BnVWWyFacckYi2rQ560/fiL+2ufbzLHho2eI03+eWSK6HqaViM+YhxnwfmIhS8uzajFOrXN1gIriDvOubm348G269VkLoxLegF+Ts/PgRKSrajLpPPUNyCAtAYwIfuPADTveJa2A/ijPrNuzQIdm/g5w3nsB29RMA4p4Iul9iebbn/fwPqcYd9l8hetuT3n3SfEhk9bn9LH8cmc5kOtqgeDfh8KGJFq5YxNq5sL/fbWmmO2ADNT4hioYpkFDhY1ZpBpoJnRO6W1I4Eq5rbVEPy/js6SkCOCShUinOu7pT0OdyZtATaqtVwqvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2OB4KP4HPqBeNN7TQwLpJSiJbmDC/7/zpPMKNArzKE=;
 b=Xe22/sWN63SLxAEJnR3UhKOsiiRzyHym5o7iSKn3DGL7Bj0fS0H5un9x1OeMmWTOvH27PIMxGI0B5AbjmZrYkuQcJ7mLBwPkxXYbY17zU9FDg1+CDlq70/4IJRF+i0PMUmWlCK3boxyBqnZSc5dG+aaM/d71mTuF9S7jWlf10eUgq/lKeKVVVAMjgGwWNDKI+5My9H2uruI9K+ehuItcUUbyF0L3ozP8kCYfhmwmoE8I1cOpIT4DZWUmV/ToEDyccSA+U1hNo5wzEm48z9Tlys1hbCgTWywMPrCofPIA+076MTffVM/dke+glHGOKE4n/fW4/Raef0BO43SAZJGWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2OB4KP4HPqBeNN7TQwLpJSiJbmDC/7/zpPMKNArzKE=;
 b=ANfGiplPc8kjcDZ3+3PqwHNfkpszirfTxyQySQ0s5jTToxghlx64PnMeTqMuyLhp7uxewGLnDIC6NxyiUpFelr2kqG75n8sm9teX/z/VoXeTAwqXU4n7f3Akf/1ze0pEQnk7eiB6yRhMEVZiS27b6epXzhkiY5AEmC1a/y7hxcewgt7xnbX4brK+hwbSgGUQD/JKNIN8Q/KeGDHpT2SdVjIXX6grwp4iO8DEu9AwLOffg+p656+DR/94XFqg6V92Ea+wLDQYKEOLK7Ds1IdDMPotCxnSgrydeZqrH9wgDOpyDMRXyUKImiRdJuyMfmXkS5H4Epj8jigm4GBgGPHKgg==
Received: from DM6PR14CA0045.namprd14.prod.outlook.com (2603:10b6:5:18f::22)
 by BYAPR12MB3047.namprd12.prod.outlook.com (2603:10b6:a03:d9::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Fri, 3 Jun
 2022 06:36:43 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::4c) by DM6PR14CA0045.outlook.office365.com
 (2603:10b6:5:18f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13 via Frontend
 Transport; Fri, 3 Jun 2022 06:36:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5314.12 via Frontend Transport; Fri, 3 Jun 2022 06:36:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 3 Jun 2022 06:36:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 23:36:41 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Thu, 2 Jun 2022 23:36:37 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 4/6] arm64: defconfig: Build Tegra OPE module
Date: Fri, 3 Jun 2022 12:06:10 +0530
Message-ID: <1654238172-16293-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654238172-16293-1-git-send-email-spujar@nvidia.com>
References: <1654238172-16293-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a954745-0f49-44e7-6711-08da452b6c67
X-MS-TrafficTypeDiagnostic: BYAPR12MB3047:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB30474463EB0EDD2109D901E4A7A19@BYAPR12MB3047.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12IkG0qsWPeRWiZuSCLbFxy9bF9AMf52VKaO87hIvAFU0ovKTHR4d3Mn3iI6m/uVVzDeoKdPHbif4cueZAAVvCJr+/OZzY5EvDoNaNhW9QgUCOA3sAo97sh0EQTnognIlUbXMQp+cITz4iqB71DcC911V15D5NXGuwyYnVdGLpCgRADvVSG7bHNdbVnj0hPmvzHJY2H1/97zzimJL151iO1OCiqAHU/3MJISEZUT3tmb6Fb8Hp9T0OVFD17KGi69cQKRmdElfXNpzby+QZ2ocY3RqRrR4cDnkn06BiLSuf302SkqeL1F+dIwBETaNGjevNUEuzg7sJzP0ZU0zOHM6YCLre+0I0dO2xeV8LIFQ4ZgbPIKeTC46tnbPusQGKnFXSfybRZYBc1XyIZrzesvGA9uGKPJvC9L15ivtTDeAgvGCcEp4vOc9ep+yMVinEdNEuBfCyTLZEpHBoixzVVAyacfkuGKFc/dyb0YzzXS6PAMcMHyVeVYv2iK2eL2RvrPScVI6qPal+xdzmD/xI/KQBxLpPnmFCu7RvTsElVenf2R78biKp6QEn5rPz7+mWrrejidkmONGq5sqnb434NIcghLXmCFRN5Lx70dpjRoYK65RkY5MKI7D2TeWF8gH7X2a9atu6Tnf3Oya/zJK4sS2Ly4WAyMSU9DabJ+U+k0zemUWK2TRrDT3PccF8yl8PLEUqb1FFOG2fnXSfBUSZpQFg==
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(186003)(54906003)(2616005)(47076005)(107886003)(336012)(7416002)(36756003)(356005)(4326008)(4744005)(8676002)(8936002)(2906002)(5660300002)(110136005)(70206006)(86362001)(316002)(7696005)(36860700001)(426003)(26005)(6666004)(40460700003)(81166007)(82310400005)(508600001)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 06:36:42.9722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a954745-0f49-44e7-6711-08da452b6c67
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3047
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Output Processing Engine (OPE) module is a client of AHUB on Tegra210
and later generations of Tegra SoCs. Enable the driver build to use
this in audio path.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d11053..3e154cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -808,6 +808,7 @@ CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA210_AHUB=m
 CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
+CONFIG_SND_SOC_TEGRA210_OPE=m
 CONFIG_SND_SOC_TEGRA186_ASRC=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
-- 
2.7.4

