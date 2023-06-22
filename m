Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C89739FB1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 13:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C87EB86E;
	Thu, 22 Jun 2023 13:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C87EB86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687433818;
	bh=wB2PKeNE2FSCf+LJnzL4YCJTrxZywmGWy9Wq9UA8lVQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ugnpt7YszMRmym6kKDLHsJa6YDQBjR6WoE/n6BW5MZzAKOU/UcP503vBxLH5dagl8
	 3IAD28h+T2qKeNe8lD0vEnFnXAcmnHJzRMPMhBVZnvfBhXHQUccrX0oIJ1HNP9AYMQ
	 9s+UE9GJX/WZLHU7DGX60uqmXPrMU/Ix5WaFvVUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 241C9F8057C; Thu, 22 Jun 2023 13:35:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6935FF8057B;
	Thu, 22 Jun 2023 13:35:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AA27F80124; Thu, 22 Jun 2023 13:35:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31124F80124
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 13:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31124F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ZNUt73vI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDiv+1+XSkQa9YMcaPxiCI6k8p9SzEbhhK9SrHKyD6Pi1mrLklh3hHG/Ycodrq8Xn5Q7m5ij5MAILBNX+VyqLmC50Fo5jPR4Qq3c1++WckacRi0b5VGN3nIQVkRjVLOKrqATfHq2AiQETwKW1V+dwdRPv6mTW1FFHtY+HYYW6ZJNryB3Vu0RlloUKob0uiP4SlOVrZIGpUkiHXnH78wrKJWcqjCDgawtxNy7KWBOd+En64o2v0aN1Fudfj0sapA+CavJ47qSJg0SkqbsFiHEfv6asl5yFfPres8EhdUzCVn2bzC2oA/AB509A9OeEl1iWp6NlVMe+MMyIWYz9GLHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOOEk07t4kRzna0D9TEOHF5B3wQ4vCIjlzV1k6C6SrE=;
 b=D0MgwCiTWMj9d1cAYO704v9NkJq6fwpbSpMfYbLPngRsOpWCD+X+y4toKQq6Xyh5pqTR83AeNygtJEGpFUebriNwyy2tS2QH6s1kl6wNeCBXJl8o9V+fv/SC536WCi84j+I6BOmbiL50hNyZgkpQXc/JylRTsxpjpSRRxULqeDQbkq29qj/DbsYu/6E/jDI6/O1qnTAxBLTE5N6L4Yje0hg95PWz7FVgVqTzDkumWFTuQPgjiBZLU15j5fWTjBCvM9NXdRL6kXREum7Iqr8/5pavmwAYn8kzJmmZ3t3NlmnbUP+8w70Pkw8bdK6y1OCp8o2Dz+Ih+FoUT2roqdmxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOOEk07t4kRzna0D9TEOHF5B3wQ4vCIjlzV1k6C6SrE=;
 b=ZNUt73vI6RSWBIC1TJEu9SLb4A/SsvB1iZeKSU2qBK/Xgh1mv1hM4QdzFhqzF+tTWwZoxVL6atBe5iO+lLI17vWLa1EjEbhq7HRh/cQS0HPQHrbyp+pvg00XMSEDl8teEumosEChYoMuEI59Wzc/RN5GDoVNxzu2kOHDEsBMMYtGj+Z9/59tT8ocln573OEvN+LVU/JoxLbUQBAGJHqla7WW613eOg95Dk7Kmyp/5bCldykLK8aUCHi7AAG5u1xTnevgAnaMbqh+Le/sZDjM5Qfw3sSvPJ02MTsMgMWBrLfLSk49z5oSPkDJVI7VogHbgmsJL2UuSxdowBtlkUySIg==
Received: from CY5PR22CA0034.namprd22.prod.outlook.com (2603:10b6:930:1d::10)
 by PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 11:34:49 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::7c) by CY5PR22CA0034.outlook.office365.com
 (2603:10b6:930:1d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 11:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Thu, 22 Jun 2023 11:34:48 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 22 Jun 2023
 04:34:38 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Thu, 22 Jun
 2023 04:34:37 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Thu, 22 Jun
 2023 04:34:34 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<thierry.reding@gmail.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <jonathanh@nvidia.com>, <mkumard@nvidia.com>, <sheetal@nvidia.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH 3/8] ASoC: tegra: Fix ADX byte map
Date: Thu, 22 Jun 2023 17:04:11 +0530
Message-ID: <1687433656-7892-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
References: <1687433656-7892-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: d94bf0b3-4db9-4ca6-2095-08db7314afca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cCHUG8nL0Gu6uZP+GhmXo2HUhCHe/pFnHEhaR9DLD0/U7bUkvQvq8TZ9NN+W7xrYMEyWJVZp1qVCgVnJmMnNKUe7ruFlaq/ANQslAlxtU/hDW3U8bpCgDDauEeDjqBUpy2PFngv4GeIpyhDiR5fWB78SQF6LZwFQYFULDeGT4BbAcNB/IArALn7kBx18QVRWqKpMaBAEaaJrpE8GaA83XuRbY26/ElVDZ144rhT0yodvmUgo77fvKOldfgubspFKbq0ixmv8DG0FTerlLhfNvO66zSNfC8pfSekO247D4KdCsdl/Tu2uk+V82Kh0R/YzS9/N6qKHin35ZIYiT1UFJC6OyAncjqgHcm0/TRetN0QvQ4bX8Bgwj9eaXnq0geb4ZNVL8QnHKcCO2KXX5o3Iw9aXebKTQwE6818lrxDPcD13QNUu7HDAaQU+WfBEV2L2l1qI5TEyByIJIjRt8hUwLLKy+bvGGScbBbdRy26b8siUxK3XoDt6G1IiZbnDmcpS7tGSw5LzuRTO1btvbEQ5dJc3DeZ0RgFnrSb05pgp+hCyhzmfWfZrWqK2jA4HCJ60l1ppR+bIKLR4pCSqbYbC610UYx7iZJJSxz3058iwZsVu5f7G3aixStO6ErSbz/Qq3xfQmiOEMV2zBlTq6eGwDNOwSIsOSletASuw4/Hmh/5o0OkzVfXlIaxLq05MzHVivAs9KvJuzVdksM7ptNpSYec8fMM2UAeh3IoHiJdOuu4oPZPCeVKomfJHgbLnT2cJ
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(186003)(26005)(5660300002)(86362001)(7696005)(6666004)(8936002)(8676002)(7416002)(2906002)(478600001)(40460700003)(110136005)(54906003)(36756003)(36860700001)(4326008)(83380400001)(47076005)(41300700001)(82740400003)(7636003)(356005)(2616005)(336012)(40480700001)(70206006)(426003)(70586007)(82310400005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 11:34:48.7919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d94bf0b3-4db9-4ca6-2095-08db7314afca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
Message-ID-Hash: J2YJU7QOAVBVWF5VINYLI5SHUET3QXT5
X-Message-ID-Hash: J2YJU7QOAVBVWF5VINYLI5SHUET3QXT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2YJU7QOAVBVWF5VINYLI5SHUET3QXT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Sheetal <sheetal@nvidia.com>

Byte mask for channel-1 of stream-1 is not getting enabled and this
causes failures during ADX use cases. The enable bit is not set during
put() callback of byte map mixer control.

This happens because the byte map value 0 matches the initial state
of byte map array and put() callback returns without doing anything.

Fix the put() callback by actually looking at the byte mask array
to identify if any change is needed and update the fields accordingly.
Also update get() callback to return 256 if the byte map is disabled.

Fixes: 3c97881b8c8a ("ASoC: tegra: Fix kcontrol put callback in ADX")
Cc: stable@vger.kernel.org
Signed-off-by: Sheetal <sheetal@nvidia.com>
Reviewed-by: Mohan Kumar D <mkumard@nvidia.com>
Reviewed-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_adx.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index bd0b10c..6894b11 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -2,7 +2,7 @@
 //
 // tegra210_adx.c - Tegra210 ADX driver
 //
-// Copyright (c) 2021 NVIDIA CORPORATION.  All rights reserved.
+// Copyright (c) 2021-2023 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -178,7 +178,7 @@ static int tegra210_adx_get_byte_map(struct snd_kcontrol *kcontrol,
 	if (enabled)
 		ucontrol->value.integer.value[0] = bytes_map[mc->reg];
 	else
-		ucontrol->value.integer.value[0] = 0;
+		ucontrol->value.integer.value[0] = 256;
 
 	return 0;
 }
@@ -192,19 +192,19 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 	int value = ucontrol->value.integer.value[0];
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int mask_val = adx->byte_mask[mc->reg / 32];
 
-	if (value == bytes_map[mc->reg])
+	if (value >= 0 && value <= 255)
+		mask_val |= (1 << (mc->reg % 32));
+	else
+		mask_val &= ~(1 << (mc->reg % 32));
+
+	if (mask_val == adx->byte_mask[mc->reg / 32])
 		return 0;
 
-	if (value >= 0 && value <= 255) {
-		/* update byte map and enable slot */
-		bytes_map[mc->reg] = value;
-		adx->byte_mask[mc->reg / 32] |= (1 << (mc->reg % 32));
-	} else {
-		/* reset byte map and disable slot */
-		bytes_map[mc->reg] = 0;
-		adx->byte_mask[mc->reg / 32] &= ~(1 << (mc->reg % 32));
-	}
+	/* Update byte map and slot */
+	bytes_map[mc->reg] = value % 256;
+	adx->byte_mask[mc->reg / 32] = mask_val;
 
 	return 1;
 }
-- 
2.7.4

