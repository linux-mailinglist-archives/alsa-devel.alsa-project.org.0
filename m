Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA6A739FB5
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 13:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3162082B;
	Thu, 22 Jun 2023 13:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3162082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687433866;
	bh=mB2WeoU3wq+v6eUvWuwNq4WJNibMZkGv1dYdVhYvhzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QYtrrmm1VBp8jXc/GV7eBuoLCqeZyNhnaLzV60dN76lVs+lviojtcgBB/y9COdnke
	 /FSEuNmF9G6YeoAG+4pVLFGNEKR9+wIK3kEc8cjtrOj/6kls3YY0dtaf2J2Eulx+em
	 acK+W+nJwuAw6zlmWnaZzvk/a2oq4+ZMfzGyP8Pc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59F4BF805B5; Thu, 22 Jun 2023 13:35:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 930C3F805B2;
	Thu, 22 Jun 2023 13:35:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A27CF805A1; Thu, 22 Jun 2023 13:35:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 282F7F80141
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 13:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 282F7F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=gTvMrZod
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP4tYwuD9/dMUNF+MQy27gQ+5GrwrwJ3Uisfzw4SySX2RJXGkchl4HM/8dCYhMWg81YV+RMDmNkb1KApYwpGuV62EuFzoEj2iFmr8ogmTGfQ8KgPme71dQNSV73omPaZ9MahKgyoc/SIZ+OpdZV7Y2Sqfif2iP8e65XCliAsUe/9PFC71Hht/yLvbuRV8+Qz7NOe02rpiXV/wqbveFD1mWd0IghbFGUJJVRr5iM2gLPKHz574OGINgu+i75YKm5SnNv75cA6kQ0GMEGcJMusgkNI9HuC7sL3vibhqnvzUpt4HAZR1qa9soo+/lCx4jWg4/xZPf4rpGi6BDPqKZF2/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkxqy/MuPBKrFxC3rb5vuwr5GhxPJZyxVr1KdKBwpUc=;
 b=EIX073bxskkNZQCX2IDuTT4VQf/WKTf5sR04Sh7+jQdCsh5WARZ1Xon2n8E89i/sTKtgBe9jpTg4SCW6nCqyqRMnzRJ8RffZPRbb2zscPi5oI5TaveAn74qPNUV7hoAlZSxJ8JV6oGKQV89gTb6o1rIg22wtCL3C5474UwsGBbYfLCSZTel9XBqIyjnnyYRk4yi0SCksLsjqjLqagYdIkEeZb+9n1fwNiKNKzWZlKc4D0Gx7wyHYKUGsyB2eVD2GDU6mnTYzYH46tNxXxgkj5IWunzxywSEpJ4fkGI46bRfjYJHO119RADwbDO6wbcvLMVdoyKCpZ+C9QvxMRT4zeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkxqy/MuPBKrFxC3rb5vuwr5GhxPJZyxVr1KdKBwpUc=;
 b=gTvMrZodM/b5idBev0v9C3l01m4LnS6QIDU3C44EZMxViLQ7EVcif8fcdMQ/qRmMe5KZgWMHJY+i6sBOwr/rNp+o9hQqpwolkoehqhQ60CzaEp443kuEZ2dIMVwTN5/MJs7inpKtXeeRsoLlwUpgKGdllVMb+/WRSDo5xShLD5XqGOGEbmtoPG51hUalKGDBxZ9gOJxDa6Y+jZSTJw8ypC2d2y8AQyv6usm1iLlxLUFRpeBQaG6/TnfhyN0eXoCHhr7wdffCBeWMvlgmil+bLrxc46fY+WEEja8XFBW+Vke5gDE61JmN1xG3f0RFHSeFu4zUDa4nZ9VkvLEl4chglg==
Received: from CYZPR19CA0022.namprd19.prod.outlook.com (2603:10b6:930:8e::25)
 by SN7PR12MB7978.namprd12.prod.outlook.com (2603:10b6:806:34b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 11:35:03 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:8e:cafe::39) by CYZPR19CA0022.outlook.office365.com
 (2603:10b6:930:8e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 11:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23 via Frontend Transport; Thu, 22 Jun 2023 11:35:02 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 22 Jun 2023
 04:34:51 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 22 Jun
 2023 04:34:50 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Thu, 22 Jun
 2023 04:34:47 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <jonathanh@nvidia.com>, <mkumard@nvidia.com>, <sheetal@nvidia.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sameer Pujar
	<spujar@nvidia.com>
Subject: [PATCH 6/8] ASoC: tegra: Remove stale comments in AHUB
Date: Thu, 22 Jun 2023 17:04:14 +0530
Message-ID: <1687433656-7892-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SN7PR12MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 1734b9f8-aac4-4575-7bd4-08db7314b825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a1KePkMOJsm+ofOIzLvU/pI7NcS/anfbu7+C6gs1oNY3XhEsx7J+k5GKzXVM1dMZKCH3QnrXy/2qkAWCTQKddI87HqYZUZC4+jc+uGiyoY66TB3CVr3tbRr0o3YgBqhKA6CARmkYOzR6ANltPBr6afEnpiNAmURNWJfS7Spn3TvmROMaNFt8I1C/4y9Pi4ExDK0VGQ5M9fwYHB9RVSlq2WBanrp2Hn4Pvhu3dVuyLf/0uwy7kQBIaezvL9CZRI6Bvn1iSB7cSDguKrIWWTOYBPis6tLASRPOYnC0CgkyipdsH9fTIHTGDZDvpK+69RyQwUWAz5g8KaWiEnH3B+HGtalwXIbYfbrQBUz+ZrSoVqNmbyvrchZSJ/7ROb/HRNxsFwwgMqO65+NjW1LYd15G2cl20p3Q+C1TYw48cDL2iEgTst40LFVFlF8LR2YMu69akbrGa2CiMFdOg5YkzX1nDDwVM56moL2N3AC6L/MSDUqm2L6djKzEZp7TeeWaVfTU7+aAyniG+c9CWOrjtHarPzda+kK70AQdADfyQZDigOKQNutEOTsSupQRxjCKsAH3+6bugPOWcNHQEvacAF/Djkr3OYQrDIFgOdUcXhca/J84wefGtxQhbLOBG2Zj7m2SDu6KFCTCZ5dNO3MOClj41apdX3Iskbi4ZBuxvK5IvWkGbWV58siGxTC/19H9+9L5PXs4v3UuoONz19yuAba0glX83i04bJCepWjtXPGcT5fcxukxjIaoVPN+xJJ03LcT
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(46966006)(36840700001)(40470700004)(7696005)(356005)(36756003)(7636003)(82740400003)(86362001)(82310400005)(4326008)(40460700003)(41300700001)(8676002)(40480700001)(5660300002)(26005)(107886003)(8936002)(7416002)(478600001)(83380400001)(186003)(2616005)(2906002)(47076005)(426003)(336012)(316002)(70586007)(6666004)(54906003)(70206006)(110136005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 11:35:02.8124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1734b9f8-aac4-4575-7bd4-08db7314b825
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7978
Message-ID-Hash: RKL5NQW2OBVGKAY6Y2KKIR7ELGTYPIQR
X-Message-ID-Hash: RKL5NQW2OBVGKAY6Y2KKIR7ELGTYPIQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKL5NQW2OBVGKAY6Y2KKIR7ELGTYPIQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove stale comments in AHUB driver which is related to DAPM
widgets and routes. This is misleading otherwise.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 8c00c09..3f114a2 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -712,11 +712,6 @@ MUX_ENUM_CTRL_DECL_234(t234_asrc15_tx, 0x68);
 MUX_ENUM_CTRL_DECL_234(t234_asrc16_tx, 0x69);
 MUX_ENUM_CTRL_DECL_234(t234_asrc17_tx, 0x6a);
 
-/*
- * The number of entries in, and order of, this array is closely tied to the
- * calculation of tegra210_ahub_codec.num_dapm_widgets near the end of
- * tegra210_ahub_probe()
- */
 static const struct snd_soc_dapm_widget tegra210_ahub_widgets[] = {
 	WIDGETS("ADMAIF1", t210_admaif1_tx),
 	WIDGETS("ADMAIF2", t210_admaif2_tx),
@@ -1092,11 +1087,6 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	{ name " XBAR-Capture",		NULL,	name " XBAR-TX" },      \
 	{ name " Capture",		NULL,	name " XBAR-Capture" },
 
-/*
- * The number of entries in, and order of, this array is closely tied to the
- * calculation of tegra210_ahub_codec.num_dapm_routes near the end of
- * tegra210_ahub_probe()
- */
 static const struct snd_soc_dapm_route tegra210_ahub_routes[] = {
 	TEGRA_FE_ROUTES("ADMAIF1")
 	TEGRA_FE_ROUTES("ADMAIF2")
-- 
2.7.4

