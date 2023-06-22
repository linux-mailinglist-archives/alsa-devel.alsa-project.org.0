Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61560739FB4
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 13:37:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA62886;
	Thu, 22 Jun 2023 13:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA62886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687433851;
	bh=71TnWl5vQ1VYhptihx4gdwhha/gx2FUtS8hn2aWfnsE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YW2yYIK777LrlVTxTUPBhKXyAePog6E42g226h8Q2snA7F77ofF2KDil7kBeFfnoC
	 fwZfggu1M3wgIRYAHDNFpHuE4R3dwLqB/yg2lmFg+ESlYJvnAGeE/OxzVCQfYHvln3
	 li9csfoVgTi4Qd2kkP1VEbCuf9TLeY2Mvx8i6B18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3D90F805AA; Thu, 22 Jun 2023 13:35:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E99AF805AA;
	Thu, 22 Jun 2023 13:35:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77239F8057D; Thu, 22 Jun 2023 13:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B163BF8055C
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 13:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B163BF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=t3S1t7I3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ltl2E3sUcRhX9T9RJEQxf9B9j8cQ4iUUVPw6y/xTRnNWO25DlrduO0kcleml3rSCUGD/a2CN7pVSdNy93XKSk7VoBGMiKl1UKhmwwwTPnc4NxLeENzxmjn75MxXa/WF0R/+bboeZGowWBnis3fOmSPPSnAwresApAQmnUXdjn3ePyBnjrBz6yl+1fJTPH+jR7CNBR7ivodcG/32aI9KVPBmLElKwzADXoJubVL2bEj56aP0KbtBx641l/iI8G5qyAJ7sP/yO+2Riq9O3rhYenkz3xfkk5frZSgPjRErNYg3G/jQXwRtJqAC7eOMwOVqrY9NjyFyZTnjMckU0+0sdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/MTBmM+BlPZEZwreOoShm91y/mQbL3reRecZ01CQuk=;
 b=NYj4JvBbAQi91aviKFArEbGmt6L7bs6ZvppXaWfiK344phc/H9rTxrWPi/wSXymLU9/LDCDe0RF1GS0tjrRw4hhgKBbT1gpX4rG91z+CWMv+ezK6LaBNKoXg0ZbPiYGyKYy33L2e+OU+NovaDAF5IWzpeH4FJVYY1v9tWPa/MAuDxRkunsXc8QhbrYL5FuD981veRIWMd9h4x2uM3J92KOowxDJ5zCCppBGHgzDU1kZ5/xDcPhe2yMe0/ZDdx+JOjx/Q/w5n07F2dQraY4fV+J2xnJX1DwkALQPgEwIVKIQyuOANHMvb0fUcJU9aOoiZu+AgjjPazaPanaYtqGVkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/MTBmM+BlPZEZwreOoShm91y/mQbL3reRecZ01CQuk=;
 b=t3S1t7I3kaoS6GbHhop63KrGm0UROr3oW26AvQ1t9JTbEzrS3ERL1h67SNCaAnZQRr5Z9nbzIeVOHa8nKMfgSBkqq3k26J28krb2ZoeMAp6agnAGef74YZZDDTMhoFh7EPMt0UejAd7OPNRFv8UaPK6ZyM9kEWzip7IYJj1qOGCaYhm35cN9lRCl3twgHY5YWhecsJa87TiN5qlXi442Sn5tjWMfUD8HjWb49wxhcDzdq7as2pPhvvjEkrjKUX4Yt942nhbd9Pvp0v2zSpInEm976vCNk4mrPaCDdCP5h3mEdKwDUnzPm6aGHA2sLMG1+7TIL9b+2/gkwsll/+Z13A==
Received: from CY5PR18CA0021.namprd18.prod.outlook.com (2603:10b6:930:5::9) by
 BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:3b3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Thu, 22 Jun 2023 11:34:59 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:5:cafe::8c) by CY5PR18CA0021.outlook.office365.com
 (2603:10b6:930:5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 11:34:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 11:34:58 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 22 Jun 2023
 04:34:46 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 22 Jun
 2023 04:34:46 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Thu, 22 Jun
 2023 04:34:42 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <jonathanh@nvidia.com>, <mkumard@nvidia.com>, <sheetal@nvidia.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sameer Pujar
	<spujar@nvidia.com>
Subject: [PATCH 5/8] ASoC: tegra: Use normal system sleep for ASRC
Date: Thu, 22 Jun 2023 17:04:13 +0530
Message-ID: <1687433656-7892-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 948ac7c4-0452-42d3-22a6-08db7314b58f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W02ExsHH2v0fnMNhyE1Hi/LraW/oK1egK8A8jeV01WQaTMo+lqguZrUw9zmhRUKwqxjlTlZm6E9lz4fcWKT/57+qlMIezPg+r8it2aUb6nA0d2qiFhcT9bcN2UmrFRuwZIP8szIa32kum3kVuPbTdRcRD3CjPBYuGRfj/LNe381M5BZxtQ5aIUyzTG9TVv4Ay6EBzhT8m0dhIIoljvsyl9bSo4m/zy/O7jDfnqjCIDHvsSHC8QU+EEQNF0KFviAAA7PyYUmLEeFHnwdSmtQBGiTo+TCoHbu+4PQJyISpC7aMEQ2Dr6HPmNhQVNvGD0xTDspMpyrgleuJdZVBxkw9UHuH5HTSC8d1FSQ+54cgdzQlg/B8oXBVsPvIINr2F+EEzv3CtbwFoznDiIlT7aMbdjPO4bzS46arG/5+QsJO+zMUV6vIMXgnMwFX3nrQFZ0sf6XRZ8bF4U4gtQkp6udcyxN1k/5flowxa8/HpgmDAWHNdDlx30Q3BWyS2/nvUjctskcmkTXLSHpH4twgMKEc6jtzNcoI6nSdWrskszwItHqQkxMt/Iy7JR3/50ax3nfPLDRfl8mGFMhtmh4OAUl/Xg5MhDnQ8ct3b72yI109IyPdDaucf2MzwcWhEAXcQovLrOJWhLTxQgZcr+6479Q4delM05cwiPEh+BBVwxy8NxV2luQIN5v3awrFZH+m9qLilI0u8ahJX4EIWwdOq0aMJZc4XQBKh8TEHbGoCEAHpnFFDAB6SSj12nf6TlY2uDEj
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(4744005)(40480700001)(2906002)(6666004)(8676002)(8936002)(316002)(41300700001)(5660300002)(7416002)(70586007)(70206006)(40460700003)(426003)(7696005)(478600001)(36756003)(54906003)(336012)(82310400005)(86362001)(82740400003)(7636003)(2616005)(356005)(186003)(4326008)(47076005)(83380400001)(110136005)(107886003)(26005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 11:34:58.4560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 948ac7c4-0452-42d3-22a6-08db7314b58f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380
Message-ID-Hash: MR4QB4M4Y4TC5FJ67NT7GGTBQ3KGUSUF
X-Message-ID-Hash: MR4QB4M4Y4TC5FJ67NT7GGTBQ3KGUSUF
X-MailFrom: spujar@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MR4QB4M4Y4TC5FJ67NT7GGTBQ3KGUSUF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Align with other AHUB module drivers and use normal system
sleep for ASRC as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra186_asrc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index e016a6a..208e2fc 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -1024,8 +1024,8 @@ static void tegra186_asrc_platform_remove(struct platform_device *pdev)
 static const struct dev_pm_ops tegra186_asrc_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra186_asrc_runtime_suspend,
 			   tegra186_asrc_runtime_resume, NULL)
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				     pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra186_asrc_driver = {
-- 
2.7.4

