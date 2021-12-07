Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854E46B313
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 07:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9339212C;
	Tue,  7 Dec 2021 07:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9339212C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638859197;
	bh=O5sR+gusTPgAuX0Jg9RtLsND4v0cbxAGXn14Qt32S4M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kae0DsKDwJAsPB8cLcxR/+fXD1olE8Mh2m84HojUpbgJt1QCKo3KA7ACY4gLY6Mhb
	 tp3k34t67Dg63RrLiUV1HNboiFBS17qRH6Tumyq19vn1kDcUC0Uy6uvWRJjB/h8rol
	 x+8RVi+vixOKvZ06Q1y33LYyssU5HwejPBUnnqPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DAF8F80507;
	Tue,  7 Dec 2021 07:37:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC18F80515; Tue,  7 Dec 2021 07:37:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DED4CF80507
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 07:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED4CF80507
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="RoV5gQk3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxqHAkXSWZMKr0O6XofPOgITboOKIFsQEp4jhapNG12oPBkr5hH1r++bz1e5R+VWev7CTEnnRHDgac2TLSegHFn1e0khGFhQMBY0FD0ijjpvMHb89DidJGyemT+FyeyGoVssnZSfmEJwas+x/gmDjTFu8VtIgrQupwN/NvA1ymRYbB2eF6e1MUjItHhqWUrsRCE7Tl81vee5u2dhcVbEsPUZWbDDha2a2aOxxiXApFYgJOt6kQfGZ0lR4HGL1CDByGRY994eEbHq/GgNwz29xKjOCSGmg/D/W3kamhu9yR0+rja7i9p3vn74eSGyb2ggJOfoO9vZzHh0gtPKxLH4Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rW2CBw1ZqgMzRjVYduwvq7BT9NVzCPU6/lpqXt4Mmzw=;
 b=iM7of2d5fbgt3L6QApA+41pOs3poWW4Seclka3LyZRDeQinAHFF5Utx0edw7fe50tloBSN5WL3UW/MZU52K+hmqOmIKCH2fncLNDzDUcbbwlXdPr90Mr+M/Xy7yFRToN7afzoJBbQ1Uh/hX9ww2QLjoklVIZks7bGgUPwlHAqa49PO/bxNdK+b602mhjEI9U9BuPwKw9WFUURpCHXOTMlyZCrSWt123U6g60KG8422fSHrDgjSVL49V2yoU0uRzrwYoZzrYphaeh6g5xgzwYaIXzgCHICEh+MpOPf5WUsxsL2w5CEDlU7IiP67M+TNRYjXaIqIikD3ocFCd1VAz/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rW2CBw1ZqgMzRjVYduwvq7BT9NVzCPU6/lpqXt4Mmzw=;
 b=RoV5gQk3wRxbAygBmzQrdbJDj2M2v8/V7RksaTyxrjXnp8jmBHjVYyVOBep1ZWqeCDl8ItaZ7vq8GG0ZUjVJswKcPjioUuqKNYix/RxwykjZ0pGuv0Gz3HWCJWCAzvv9XRiWuGZzUjK3mu9BG9Su3g/dsYi8vvVOIXV2Q2+ezZJp5YAxHxDmZm6SVGkfMpPmP3OqNLeE+Mz7jGjZuUCRE+Z+0GRxTMXAkK1ETeMLpNLfwHG67h7c1wDbkcg9XsJoyX3OI8l6vpDRyqJA38jyliWvOnVn7biy4K/kuzx10ntFjPsvWEVZh+2C4VAiewO3H1qMHc35l0eBrzWJflDiAA==
Received: from BN1PR14CA0025.namprd14.prod.outlook.com (2603:10b6:408:e3::30)
 by DM6PR12MB4895.namprd12.prod.outlook.com (2603:10b6:5:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 06:37:36 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::6) by BN1PR14CA0025.outlook.office365.com
 (2603:10b6:408:e3::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Tue, 7 Dec 2021 06:37:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 06:37:36 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 6 Dec
 2021 22:37:24 -0800
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 6 Dec 2021 22:37:21 -0800
From: Sameer Pujar <spujar@nvidia.com>
To: <tiwai@suse.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <perex@perex.cz>
Subject: [PATCH 3/3] arm64: tegra: Remove non existent Tegra194 reset
Date: Tue, 7 Dec 2021 12:02:50 +0530
Message-ID: <1638858770-22594-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
References: <1638858770-22594-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1670f76f-f165-437d-63fb-08d9b94c0e9d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4895:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB48955067DC81BE52A8D8DB04A76E9@DM6PR12MB4895.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LttAvFrAwr2Tk/vNM1w9jRsm+ZwGeZFpU4IJOYBJTPCBxnYRKWnDPclVhx83lEiRT6zJPHIKXlTyghD7v+y9Bxs4styhXYhqPJORySeOnFeHshCOrrgSBIX5P38lAGayylOqndetM2dcu1NDLN5BEbJ0KB8nKm7oIiK3iLbsFy9lca71kyMLVyTZeHeSLq2RkpEhqKXfwlGfueVK4LQIg6ncd6wJn0n4ygeGgEsPFIQSIB+fN04dSgqipO8kH9Emg6nOWlQYFzN88348BSk4EYzZmAsJVAi/tbThAwxQ5EHQJiZVF+5Z4y1XpdUjqDjZSjU9O74KL5buU411XEEHiCIHnO7ONr7v5OJxXWsx4bfx9UZ5BVtR4SnteW346Ge72LfZk/aH/StBk5P06orkSrJRC3to7x4yerBSKqXcOmi4Ni4YYVIZlG6fZQ54zoqNpv0zTSKXQtn0LwsZhcjqqntiLqqF1/emHZDJSjDvj3GoUflKNN8gK67pQiiL1tWtYo2NOs/PUPsEv8OWIhCgAc6433IoWSCQvlDbxsrBFfoC+Ep8YE9SZi3ZuxrW8lzLDkqlP2gG+NUbT6RVi1sZdVbtWJ34ilPqs302UdYORfEsYFypJzPB5nAsCiKan9lKiA/KtrQpCGIRODwmLT0J10WMFi1OuLBmEfCT4j/wsD7u3duAZcluBX8YphqDmY4Q4k5oFmAe2R7sJEfzm7SYBTXvAcTkke83X5EeJRmL6i1IMy94820mpRx9b6sHCUZhy8Er5UMZ9Ni2FRRVZH+gRyYtsM7zqJ3hZ25F4lAFMRc=
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(110136005)(54906003)(83380400001)(36756003)(2616005)(34070700002)(82310400004)(86362001)(2906002)(36860700001)(40460700001)(8936002)(508600001)(356005)(4326008)(26005)(7636003)(107886003)(426003)(336012)(5660300002)(6666004)(70586007)(316002)(7416002)(70206006)(8676002)(7696005)(47076005)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 06:37:36.1766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1670f76f-f165-437d-63fb-08d9b94c0e9d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4895
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com
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

