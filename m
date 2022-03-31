Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D64EDB52
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 16:06:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86C931ABA;
	Thu, 31 Mar 2022 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86C931ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648735593;
	bh=24nGr+k7EAKl0lefqgTSojmZRyTE24N8d7RUg1qipbQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JmtAZMdGCSP9eoRPXLzG8vwhyZarcITVempSvo5YKiLsgqC7J9o5xUNnY9XFc7GXm
	 UqtRD/U+2AAj5wYSSqldJMZfK9YIs80xEZaf7H6FCeneIML6uu5dHtT7n+2Jicv7YZ
	 KEQ75dcM+kQX0tmeod/+v7CxAg55guNi15l8Vw8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B66F80528;
	Thu, 31 Mar 2022 16:04:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E28CAF80527; Thu, 31 Mar 2022 16:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F48DF80524
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 16:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F48DF80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="DhCwM771"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0IiH3tYX1K4ES6lpobGqLxiELlhhrZsJfL2vlyGm/FBEkLYTEterXVihsh5NtOIDbct6LXbPUGkrafLbmCVv9P8cWVhusAPblA2O8+oobtFaO574JYusv0PzuPNtcj/jeLHvBTbROjaCf9oUVRwQcFNbV4FmXV2a3oR30JAzr9Bu9JPRrJ4hvZCK5FizKDI80Bf17CA3amp4Gb/uaZzB18+RUwa880rGNltFgjOAc9eOUZqiU5N4j4QY4Q93nNVHVZJYSI+oiypK3LAgD2xOFXHUImJuQBVB9Ev+ytT/DpBSoOLLSZEHx8vLOfRisGy1Dnioyrs+suu5h5G+A2WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC6L2XdDaQF847syeS0jq7DiNVTyw430JpljyPB2jTQ=;
 b=WcL0vbwu8U5eJSeqidBvzahgXjbXEGGg1Q+Vc/KqlcSZg/D6jGs/JWhtUkzvrStk1Qx0RZIzz1ejMa2ffx27qrn7d0S95xSo6OnqizC/zH+HUSAh6FBtjTDKMNSs45+2O20sGMJDpJnK0IYXZgD26awmrm9NZ4anLqshC+gNxx0/OHq1zZ+YrfJ5FPh+uroHccsp+QDhagZYF/mJ52UKn042dSilojjZ2RnLQ6ClLBVSuh9NC7/3J2dJoXhpQqlqMYil1k2QuS6fIPUDyz0RBugX1VZAQRBoEf4JXvRfUZxCfFt1TmaHSbG84zO+j5q7C08clSWZmTkSj87kU87XIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC6L2XdDaQF847syeS0jq7DiNVTyw430JpljyPB2jTQ=;
 b=DhCwM771Xk3RYhCB5B55cmnPdEoILG1xE0gyo9bgWWdLIz1+ArtYhgszsqrLVSj7kecyQEUrqdMSTN7pFn03Ad/YO4GcF9q+O+UNFtMet2RSqCDRYl5HXUyh5EJ/j3UqtBA0ezqcaiAXnOLgELD8/3Zvy2DTJBuMQbT6428zvPmax3BCxj5mJXmMF3MeyX7xXhTBKm0TJW2KQx7bjyA1hdcmB8fQsxrm31HUNFPfRswtYu3e6ue02mjGCoRTXyLjPZfkDf52Zfg45pMh4bH0lQujDVDBSTmulfRPe62lMtREnRShgOWkIxnO6f4OoAavOo9MHRGMjhcM4W0AeTpw8Q==
Received: from BN9PR03CA0958.namprd03.prod.outlook.com (2603:10b6:408:108::33)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 14:04:12 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::7f) by BN9PR03CA0958.outlook.office365.com
 (2603:10b6:408:108::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23 via Frontend
 Transport; Thu, 31 Mar 2022 14:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 14:04:11 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 31 Mar 2022 14:04:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 31 Mar
 2022 07:04:03 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Thu, 31 Mar 2022 07:03:59 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 4/6] arm64: defconfig: Build Tegra ASRC module
Date: Thu, 31 Mar 2022 19:33:30 +0530
Message-ID: <1648735412-32220-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1648735412-32220-1-git-send-email-spujar@nvidia.com>
References: <1648735412-32220-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb37624a-19ae-470e-3240-08da131f54d6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4093:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4093C278DB3D40B78E95C021A7E19@MN2PR12MB4093.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o2Oyl/opd02ktkNrkiLm7iyTDSh0e8qROIdRh2woXMXr4CVHvIjijm78K51qcnjWK9HfXvWb/vfjVutn2l+xoKk/ZfXkdGSVfIOb5A4T03CVTom4OWb5kzxuc0gQ4qDy42uoxVpQmVgLOfShPjoqv7csHjaxZvBl5E+h9LDWMT5VxEfedmqiZdfngXsMWR7HRLAlWWx3MAh3Qknf+3dayqUPxHhxKtKEWCc2wwp1zcUw7Lou8tm1OadAGMAW1TNQZUkW3J8yJ6oVAPrHjUVnbltZ7CTs+6UVJuL5tmmGXWZYS08L2456GoxM7NdNjd3rfraQi3EDwxGa4ZLQt1h7/KX+ucb+lMZDRFCV3Dpkvy2YRf5UwneRnI5J0ZZTpdqS5TGsVLjYA9CJKSPb5VN4AlPMB5gOeuZCQS/OybZV1X5RGgL46WlK9JRbNYUSZKJXl80ICyUNCe5VZIdOIEovO/nF5PRTGEV5lChNf95CJiH5Y4qio/m8bjyzu6MFe/ZYMjuR71aco0ic57wg1dVfi/d2YA+2u9dgj6g9sH4ummuSU9piJa33cKXGwwPQ85ZzCVk3aJyiwDoG5MWknl46LyEqDgljIHfqdB1n6jWkGSQbzn8+b6OWmofISNlraJ3EJ48GYTmQ0xhLwewRGGI7UPsn9RsFimhEaYQtyT3usthaaxKMT0Xa6a0lZakP0tXTkCIeCTYfKFPUZ8pZOgiY3g==
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8676002)(36860700001)(70206006)(54906003)(7696005)(6666004)(70586007)(316002)(82310400004)(110136005)(508600001)(86362001)(40460700003)(426003)(2616005)(107886003)(26005)(186003)(336012)(7416002)(47076005)(2906002)(81166007)(356005)(36756003)(8936002)(4744005)(4326008)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 14:04:11.2709 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb37624a-19ae-470e-3240-08da131f54d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 catalin.marinas@arm.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, will@kernel.org,
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

Asynchronous Sample Rate Converter (ASRC) module is a client of AHUB on
Tegra186 and later SoCs. To use this module enable the driver build.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 813e644..7a8d9ad 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -798,6 +798,7 @@ CONFIG_SND_SOC_TEGRA=m
 CONFIG_SND_SOC_TEGRA210_AHUB=m
 CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
+CONFIG_SND_SOC_TEGRA186_ASRC=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
 CONFIG_SND_SOC_TEGRA210_MVC=m
-- 
2.7.4

