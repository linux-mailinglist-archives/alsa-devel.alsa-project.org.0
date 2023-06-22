Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3670739FAF
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 13:36:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DDE482B;
	Thu, 22 Jun 2023 13:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DDE482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687433795;
	bh=Co+6t32ifwUs0+wNsOFKXTRfff6uqscWL+stBOUqqAY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Arr77v766JsuYoRE5rHE7y9fyfIYeRHRW6ma+YuN55fHTA0M9APfAmymSNfFK6/ds
	 jh6wm5xMfJVmEy/0QT90H6aU+opcFdKkPN171IxW0jt6CAEUogYiY0YkyvRZFJX85L
	 NHVI7xDvMESdw6OUAQN/yfWLT48tl6pBAsl9obU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 795F8F80169; Thu, 22 Jun 2023 13:35:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E86F80169;
	Thu, 22 Jun 2023 13:35:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44346F80552; Thu, 22 Jun 2023 13:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5090CF80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 13:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5090CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=PD8dEx84
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niU2U/wVirjqNP60lGC/WklJghK521Nxj65nAgX7jUxvVWyZNJUBLTzJjXdp3VBxxmK55FaeMC44Y7iaq/LYovYImTzETic2XCNTGV3frzK8gILo3v1qNd+gD/KmSJrc99I4XZsa16kcNGPvor1Ep1xBNv7UGfPxXmq7G3eAodk7v1+uWE0g3IodrlasVJSMDGzbFfym7xoedXkyKHjc+zYLKurFqnTUUPtksFT/n22hMU1r300GR+2hNdIsyXUnhEbOSMZGUk/YV/CIF+ah59r6vyDcVyf9IpzZr+bRxUQxXZ9m4PLR+73EU8E+iYFo3tQQ5PlKDr6xA961IQwt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEQsmQLzDILFpD+48COHhMUR9Q9jyAoHdI0QjJXHQyI=;
 b=gQu7cYVVwrZi65nt/8FdwkgaVik3gsN/8psH11RNMJ/lIKRC4HAVUue3Te1VzsFge9bWZOrAg2bJ1TdTcg4n4asY4dseBMwtuM5HWJ/JEH8McQ/yRe/qQGrVAnI5p5fSsHCZjh5YngWUnQHITpGscpCLRw9sLkyg6asmczB70PUFOEooo2Qm86y86eyj20aIxORi/91TRCF4p9JYbZKgUlmRvP+/87WGPw9IM5h117zl2Qbgi5jFAEuJa9wziHR+MX4a3jIk5z2pJXUZ/pyFLw5p0cvRUuegTQkrnsoPIMDf35E9FkvYAPnhdbIQcDj4rc3azMF6DjkelnUOFMJkgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CEQsmQLzDILFpD+48COHhMUR9Q9jyAoHdI0QjJXHQyI=;
 b=PD8dEx84U5pwFIzGpZxeatxDjQ3fplbxfq1asjwg2CDHSZdWFQXHwSI8mS+u/cPwaxbwFgwn9hUvAimW7EGwaUbamW/bXR/5uFT75fE9iIBgblC/6TVFVCBj8s51D8JBGFcYYjnR+yb4hLQgNgcnijx8Z6ML9LknEbnYIT/a1qvPGPRW8jwQp0sA35gKmiYB9/yk9zqasjQHw0HDCVCUpGGoEkCESSspECrL1CoN6qSDYx4TYxeEsSWZJawzCBrCDd6PIyf42eUmE/SLwwcFE2Gx9R/TTbnpBd8Yz8CmsL8Pn5SmPxHU7uwxp+uID/RwxYfrJNGC2egX7cwh0LJLoA==
Received: from CY5PR22CA0046.namprd22.prod.outlook.com (2603:10b6:930:1d::28)
 by CH0PR12MB5267.namprd12.prod.outlook.com (2603:10b6:610:d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 11:34:37 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::6c) by CY5PR22CA0046.outlook.office365.com
 (2603:10b6:930:1d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 11:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.146) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 11:34:37 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 22 Jun 2023
 04:34:29 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 22 Jun
 2023 04:34:29 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Thu, 22 Jun
 2023 04:34:25 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <jonathanh@nvidia.com>, <mkumard@nvidia.com>, <sheetal@nvidia.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH 1/8] ASoC: tegra: Fix SFC conversion for few rates
Date: Thu, 22 Jun 2023 17:04:09 +0530
Message-ID: <1687433656-7892-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|CH0PR12MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: e443e6dc-2704-4ffc-17d1-08db7314a91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ur0C9B7ctux0FimLFv0adNJRlZHg+Z8dCoD+TLDoGh5cqeKUcE8EfGQpMR5bjanLbFYup4ZKiqEB73sNYLEYe7sLL5btlwDtE/VNGsKOLaUTzIoEITw/hbiHag7kGgJT0gNifP8doPQtYe10W5s1IqEjeq7Pipb/Pef1BBQgx2e+CxxynGAFdxQcTRKZ4fG5u7PQ5Oon02bexvFRBgnquhyVfu6w8EzmS82aCLqRNjIIi6MQo16FYMetPeg1+famWkscUbiYuM0zITc1kK3IbwpSauAvaB5BSmoViqNy0Ad3yt5ZtZNtY+BvIijhQMhdplkplsgpLFN+D+hWsJVKAzAHinJ0/7FMPsaRNUzyaPHR/c20b/HgV3DFA9wQpOrJ5LA0UhDuf7VdH0AmC2F/zHt/RRuTF7D1gT9fJIbBRirIZYyE8y/E/QBidwbDuGaYHWhOi/FZ/QjYEPRxLklSZ2//xP6WipZariAD5Y7gkNImzDfusPPKFkpKOWVQPbJa4fmMU9EveR+WQeUwgaSW9usxIQ+h8hvJqxTUmcQ2xDA4QlDu+WWPLXdsKI4fx1OZsaEpBEfZJ57i9o5r8cICthQxdVllLUl2MmwsWjYvFm5SEo4TpU7UXw8sQoUQ6xhCFWHBM1MU9ZCQjg9VtJElKFnr9DwVAbIrnkmqUKlYGVwbJ9c7Ydk0Sa+MKwohtddUPFpbxDjmYrkOfu+Awb1aA9kkno0/WoSKQXVdQPlyMtz4PJLgXZiBO+8QmBUwoNAL
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(70206006)(70586007)(4326008)(316002)(8676002)(8936002)(41300700001)(26005)(186003)(2616005)(54906003)(110136005)(40460700003)(6666004)(426003)(336012)(7696005)(82310400005)(2906002)(5660300002)(478600001)(7416002)(40480700001)(356005)(7636003)(82740400003)(47076005)(36860700001)(83380400001)(36756003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 11:34:37.5981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e443e6dc-2704-4ffc-17d1-08db7314a91e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5267
Message-ID-Hash: 4XNU5VCKPMCAMD4LSYJWT7T6WTT6NYKO
X-Message-ID-Hash: 4XNU5VCKPMCAMD4LSYJWT7T6WTT6NYKO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XNU5VCKPMCAMD4LSYJWT7T6WTT6NYKO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Sheetal <sheetal@nvidia.com>

Sample rate conversions for rates greater than 48kHz are found to be
failing. It means x->y conversions fail when either x or y is greater
than 48kHz.

This happens because, tegra210_sfc_rate_to_idx() returns incorrect
index for rates greater than 48kHz. This actually depends on the
tegra210_sfc_rates[] array and it is not in sync with frequency
values of SFC TX/RX register. To be precise, 64kHz entry is missing
in above array defined in the driver. Due to this wrong index is
returned and this results in incorrect programming of coefficients.

To fix this, align the tegra210_sfc_rates[] array with SFC register
specification and thus add 64kHz entry to it. Also, the coefficient
table is updated to reflect that none of the conversions are supported
for 64kHz.

Fixes: b2f74ec53a6c ("ASoC: tegra: Add Tegra210 based SFC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sheetal <sheetal@nvidia.com>
Reviewed-by: Mohan Kumar D <mkumard@nvidia.com>
Reviewed-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_sfc.c | 31 ++++++++++++++++++++++++++++++-
 sound/soc/tegra/tegra210_sfc.h |  4 ++--
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index e9df1ff..c2240bab 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -2,7 +2,7 @@
 //
 // tegra210_sfc.c - Tegra210 SFC driver
 //
-// Copyright (c) 2021 NVIDIA CORPORATION.  All rights reserved.
+// Copyright (c) 2021-2023 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -42,6 +42,7 @@ static const int tegra210_sfc_rates[TEGRA210_SFC_NUM_RATES] = {
 	32000,
 	44100,
 	48000,
+	64000,
 	88200,
 	96000,
 	176400,
@@ -2857,6 +2858,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_8to32,
 		coef_8to44,
 		coef_8to48,
+		UNSUPP_CONV,
 		coef_8to88,
 		coef_8to96,
 		UNSUPP_CONV,
@@ -2872,6 +2874,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_11to32,
 		coef_11to44,
 		coef_11to48,
+		UNSUPP_CONV,
 		coef_11to88,
 		coef_11to96,
 		UNSUPP_CONV,
@@ -2887,6 +2890,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_16to32,
 		coef_16to44,
 		coef_16to48,
+		UNSUPP_CONV,
 		coef_16to88,
 		coef_16to96,
 		coef_16to176,
@@ -2902,6 +2906,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_22to32,
 		coef_22to44,
 		coef_22to48,
+		UNSUPP_CONV,
 		coef_22to88,
 		coef_22to96,
 		coef_22to176,
@@ -2917,6 +2922,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_24to32,
 		coef_24to44,
 		coef_24to48,
+		UNSUPP_CONV,
 		coef_24to88,
 		coef_24to96,
 		coef_24to176,
@@ -2932,6 +2938,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		BYPASS_CONV,
 		coef_32to44,
 		coef_32to48,
+		UNSUPP_CONV,
 		coef_32to88,
 		coef_32to96,
 		coef_32to176,
@@ -2947,6 +2954,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_44to32,
 		BYPASS_CONV,
 		coef_44to48,
+		UNSUPP_CONV,
 		coef_44to88,
 		coef_44to96,
 		coef_44to176,
@@ -2962,11 +2970,28 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_48to32,
 		coef_48to44,
 		BYPASS_CONV,
+		UNSUPP_CONV,
 		coef_48to88,
 		coef_48to96,
 		coef_48to176,
 		coef_48to192,
 	},
+	/* Convertions from 64 kHz */
+	{
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+		UNSUPP_CONV,
+	},
 	/* Convertions from 88.2 kHz */
 	{
 		coef_88to8,
@@ -2977,6 +3002,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_88to32,
 		coef_88to44,
 		coef_88to48,
+		UNSUPP_CONV,
 		BYPASS_CONV,
 		coef_88to96,
 		coef_88to176,
@@ -2991,6 +3017,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_96to32,
 		coef_96to44,
 		coef_96to48,
+		UNSUPP_CONV,
 		coef_96to88,
 		BYPASS_CONV,
 		coef_96to176,
@@ -3006,6 +3033,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_176to32,
 		coef_176to44,
 		coef_176to48,
+		UNSUPP_CONV,
 		coef_176to88,
 		coef_176to96,
 		BYPASS_CONV,
@@ -3021,6 +3049,7 @@ static s32 *coef_addr_table[TEGRA210_SFC_NUM_RATES][TEGRA210_SFC_NUM_RATES] = {
 		coef_192to32,
 		coef_192to44,
 		coef_192to48,
+		UNSUPP_CONV,
 		coef_192to88,
 		coef_192to96,
 		coef_192to176,
diff --git a/sound/soc/tegra/tegra210_sfc.h b/sound/soc/tegra/tegra210_sfc.h
index 5a6b66e..a4c993d7 100644
--- a/sound/soc/tegra/tegra210_sfc.h
+++ b/sound/soc/tegra/tegra210_sfc.h
@@ -2,7 +2,7 @@
 /*
  * tegra210_sfc.h - Definitions for Tegra210 SFC driver
  *
- * Copyright (c) 2021 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2021-2023 NVIDIA CORPORATION.  All rights reserved.
  *
  */
 
@@ -47,7 +47,7 @@
 #define TEGRA210_SFC_EN_SHIFT			0
 #define TEGRA210_SFC_EN				(1 << TEGRA210_SFC_EN_SHIFT)
 
-#define TEGRA210_SFC_NUM_RATES 12
+#define TEGRA210_SFC_NUM_RATES 13
 
 /* Fields in TEGRA210_SFC_COEF_RAM */
 #define TEGRA210_SFC_COEF_RAM_EN		BIT(0)
-- 
2.7.4

