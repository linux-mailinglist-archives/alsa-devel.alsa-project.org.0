Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C913447E2BD
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:56:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E6D18E6;
	Thu, 23 Dec 2021 12:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E6D18E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640260586;
	bh=O5sR+gusTPgAuX0Jg9RtLsND4v0cbxAGXn14Qt32S4M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n2Gw2tw+porh1DxlCa6i//v0rA56DyIo2O9eMLiRi1i37FtQ9fQ0KT53OvnTSROQa
	 bn/NbwxDAaKJF4A942t+FP1uyf3ggcvR/L+Z66CJM/UpaqBBsFs9h1ty4o6o9x1xjJ
	 gdpMfwu8b+Wg6PwamKXin8nvHcV0YoVPuz3JtYtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67F9EF80511;
	Thu, 23 Dec 2021 12:54:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B91C5F80510; Thu, 23 Dec 2021 12:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3381F804FE
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3381F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="SYtcnZ5K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS7rSn1RDrs41FvSG6Hhj2fYb0mlEJPSrwNBgP5yIXTMVGNgFW2A5F4hXjCAeqh8BFxh5XeklVFzL5aIvVBWn1UQEShfUnJT2Of47kIRjswirhTjf67Wb5RRw07qi06JSDOqu1DFx17p+CVTW8c08ZcQTI0Bw5/dvgX8UADkvYk/MBsLUP+41u1VYhBh3432nQVLdON+sFBUNbJPmYOo/e9rfgw8axUpmeblEnO0FavpfMPEGRl1jMIyS30KG8sI4zBFHJcAF5y7fkh5uhqkNuWceZbGq6lOYRTPV9QMj0TL7qC0kngb0aM3G5U+WCKKXAKMlG+y8x38kKbzCf7UUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rW2CBw1ZqgMzRjVYduwvq7BT9NVzCPU6/lpqXt4Mmzw=;
 b=IrGZqoUIWzfiWdoyZh+ePfK+oPHDn7HB/aW2LVe1+be+Sz+36Z2r8oYnYE9qBKJtkE1k40v3cBq3pLjttKuiOPuaD5Nr/7yKKSycCY7/+WwMrOKhIaIP8PT2Z97/K5KNYZH/H73HVjtf7m97WldbtAlViI6n7bhPFzoovXbVrQWRdiQTqnlDzEqrcVEaGcx66vDd8hiw0OlQxjX8V1IEV8m9LEe4i2tYx+7hCz1MfSV5C9nsAdpfwSqONwMcu5ZGptQXQWFGGsebu8zqOnY6Iw2zemhlrNTulkj2LSUvpnbiSA7+ItQW+wUPTPT9inpkBKh1UDoUK3LyHNhHOrYgAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rW2CBw1ZqgMzRjVYduwvq7BT9NVzCPU6/lpqXt4Mmzw=;
 b=SYtcnZ5KNFBHQEAoo26VVHFfbttAEuKE8ga5UZYvLrem92Xu+1MfqPMimZLGVZtJCI1+9FpcGN5b+pM/UFRhP5Gg5TLaBNW0G1fbm5PX9GDAOI08sQggFA/x98Ovdz20ZjIkVWahF4mNLld8bykMZU3jBRQEGVuhq8tbIDbTihjoxO9OJ3x6ADBH287bHp2zsM99KXpNpHeO6cKFKSLH64p8if9StM9zLZWRw4ypXVBBLoAxXlqZN4DJ8YlITxyqlV1w58lQ2Cac2b5lV9D8AS2tLOTsvop9vsbss2ri1fDDy7n9zK6j5Hi2ltDGSisQEQmSUCLyrYed6/OuiPSMDg==
Received: from MWHPR01CA0046.prod.exchangelabs.com (2603:10b6:300:101::32) by
 SN1PR12MB2543.namprd12.prod.outlook.com (2603:10b6:802:2a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18; Thu, 23 Dec 2021 11:54:11 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:101:cafe::d5) by MWHPR01CA0046.outlook.office365.com
 (2603:10b6:300:101::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19 via Frontend
 Transport; Thu, 23 Dec 2021 11:54:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 11:54:11 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 23 Dec 2021 11:54:09 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 23 Dec
 2021 11:54:09 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 23 Dec 2021 11:54:06 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <perex@perex.cz>
Subject: [PATCH v4 3/3] arm64: tegra: Remove non existent Tegra194 reset
Date: Thu, 23 Dec 2021 17:23:51 +0530
Message-ID: <1640260431-11613-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1640260431-11613-1-git-send-email-spujar@nvidia.com>
References: <1640260431-11613-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87787131-0c7e-4842-0b8c-08d9c60aef0a
X-MS-TrafficTypeDiagnostic: SN1PR12MB2543:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2543C1BAAD018D942A4D6C88A77E9@SN1PR12MB2543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QlDi0I6ChjjdNLGahh2zAmFAMoT8Riot4rzPr60uy9tHPdqlgEpyTNABaO/6gtgU8x7cHTBUz7FKyMcfW8aGbWlY7OiodGQKuX3FklzVa8XfyCJsPf7E3IBV6cNsMl/neadHNUbHiku0/IuVZkMS0Q2sXb7PX/q1YYlZUSBVecy4LdW0JenfgDEVTHel0K0b/8VaaCiY3WqI/ewfZM10XYzOoOIpU9G6Sv4e7NxDYxr1lcT1ZQ4Q6+l1Qr/OZMmMcc0hWbQm+z2Vp7hbs8xsRq2MnYL6Q5fn5YkLOQw6HpcXU8XbQGi5cGEDzSCP7WyTJRvs92VBp7JwilEb1QRXCk/lnU0pRK8v9EvKJw4hAnGZn7mq8b6u0mmhkUhuFYoXhkKhFP0+sLDZWOdXDJAGAQ1x7R7efO8PfSqGbBL5qkeP0PcF15zt7JvOuFjUjiL28nYVgPaf0xIIdiT7Yceye18EIE7rdmyUB+Ex1esvt/YclJUkz2WUPe4VmN99qVms3YA2cAi5SnH0p3k6eCkmtJMsXCa+oYX7VXQGGXd47eQUqgpnG6NtoG+LK4FbpeTQmCRdu2meurLoY4MzYU2IxJmERSPX1tqShl4UFynY4SAVzj9sJ3Bxs6mGkTd36NFtrwjWcnRBjoE92Sj0a5KDPSLvWBzDf5Ctqc1oWQzyDzx2xifQAbsFzvGXhHn809VteZWxwjoTR1scq5fvR1BKgLNf9Qxb74crkB9ZEI+k96cdw8RjfLEw/Hx7HzCReIEfsLlY7b3RE45RHQjc5iTgXLFTWa8I4E22PK7sLkNic6s=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(70206006)(70586007)(36860700001)(336012)(26005)(7696005)(83380400001)(5660300002)(8676002)(356005)(54906003)(316002)(110136005)(508600001)(86362001)(40460700001)(36756003)(47076005)(186003)(82310400004)(81166007)(107886003)(8936002)(2906002)(7416002)(2616005)(6666004)(426003)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 11:54:11.0927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87787131-0c7e-4842-0b8c-08d9c60aef0a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2543
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 mkumard@nvidia.com
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

Tegra194 does not really have "hda2codec_2x" related reset. Hence drop
this entry to reflect actual HW.

Fixes: 4878cc0c9fab ("arm64: tegra: Add HDA controller on Tegra194")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 8d29b7f..6a1d896 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -976,9 +976,8 @@
 				 <&bpmp TEGRA194_CLK_HDA2CODEC_2X>;
 			clock-names = "hda", "hda2hdmi", "hda2codec_2x";
 			resets = <&bpmp TEGRA194_RESET_HDA>,
-				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>,
-				 <&bpmp TEGRA194_RESET_HDA2CODEC_2X>;
-			reset-names = "hda", "hda2hdmi", "hda2codec_2x";
+				 <&bpmp TEGRA194_RESET_HDA2HDMICODEC>;
+			reset-names = "hda", "hda2hdmi";
 			power-domains = <&bpmp TEGRA194_POWER_DOMAIN_DISP>;
 			interconnects = <&mc TEGRA194_MEMORY_CLIENT_HDAR &emc>,
 					<&mc TEGRA194_MEMORY_CLIENT_HDAW &emc>;
-- 
2.7.4

