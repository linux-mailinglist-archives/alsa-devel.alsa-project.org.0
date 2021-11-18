Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB0D455546
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:12:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BCA218CC;
	Thu, 18 Nov 2021 08:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BCA218CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219567;
	bh=og/kH9vK5xWax+RDT4g1/B+KP4y5sTVyd9VoKd6VJ6A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rexo12er5aVyUPMwPYTKMVQtU6G0HhHz1JSagjrIaE3kABGdcp3vrcfxrPeJTOnn8
	 1iV98Kw2YU6JWNc7GXcO3F5FShNIfykr/aPf8PzLd4ZilZOubZiiOf/AiW3AteM1rB
	 INddSNC//uAEfSaJkiR3RGqCF2FnpcQgUrThQFXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21EBAF80551;
	Thu, 18 Nov 2021 08:08:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3B3CF80524; Thu, 18 Nov 2021 08:08:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E29BF80526
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E29BF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="AKF7PRMV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8fDT2QEqpknlRQOMgfjMusOVmu6yEn9jBXs3vB830y9QMTndF4jl45LvliLSrSmSKO4VapmcvueorkRLt+GjZMokj70g4nT+2af1/2dzb8ASCq6C1VX9EHbWORHyd7HT6ni2puKr3/oolMuPlqOePmxL/y3n7q9QkFxh52HMjtQJX5euBsFu88OyYpAZPqQK/74Zu9mc8OfoKEmBj5EzK4ffl+s/Cn/w0teqlRWqDYCrQWEGdTHsQMtKac28fQjDe3KxKWLble6LV0DJmBq1WDDhSCHRznm4/HbNVXbI41px7sCB2tBGEgXeKdLIP9/meCtOG+UFPoyDCg7OpU5EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PktcI9cavefHccx9wJ7xoNYt427yPivaSQDVB9VDtMs=;
 b=Ur1zucmw5RuI+vatBTj62p2LHD5C3jlltSGcd4WZLN5DTzv/PufdbLwH/vAtqbLcZJGPIfQ7x5uBuc4IVy1YYPIJjOC07A3M7Q4LwT/2pgStbrNqWKaQKyHcx/ICqLxqxqKZCFlQZOH1e0DmoO3LOuqWYQ1Ps2pWe5ZG0cOAO4tliDk8h0e8P/NyuwuhqX7sx1RRsl0soVO7m+D+Cv3pAvz6KwIreoc2bkbJx8rjbQPtuh0vs5R17blvSuOLOALWs6NIxUAh8AjK4sIHYG/pXq80EGvx9lXD6DtglsS+0k6qboNJ9DftqnT72s1Icnl4eMYubgd/9FoRiHDJz3EvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PktcI9cavefHccx9wJ7xoNYt427yPivaSQDVB9VDtMs=;
 b=AKF7PRMVRW3W4H3zDjYOSgDcCYy4euvL1T/Tp2PaGfbH3xU07eIWWwEnPdAsX5GnW07oObfld0OU1/bfRMAWozIwMrkFwCKURpCnP0KVFNuFiF6wFyJFfjmelbG8IA2KLBE6zd28D43bus2wmvTIl85iqLUZMTGEvtHbIncX2qupgYeK6QMz6g6zCzZLYObxz8njnPKv/WJKMp3zcGUHl8FPLPmwz79FOWndhK9qO+rT83z4NY5wtI1OOXklQE6/Zi0KacSDAED9JnumATp/bL0UpUC7Xg6NmfJ2S5mL1fozgpZGQPCsDQBtXCxDDYRbhCl5kksyWcwYgDP8/9bzwA==
Received: from CO1PR15CA0075.namprd15.prod.outlook.com (2603:10b6:101:20::19)
 by MN2PR12MB3968.namprd12.prod.outlook.com (2603:10b6:208:16f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 07:08:07 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::66) by CO1PR15CA0075.outlook.office365.com
 (2603:10b6:101:20::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:08:06 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:08:06 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:08:05 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:03 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 14/16] ASoC: tegra: Fix kcontrol put callback in AMX
Date: Thu, 18 Nov 2021 12:37:09 +0530
Message-ID: <1637219231-406-15-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4219fd8c-0db6-4006-f074-08d9aa622bc8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3968:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39688510B2B4BA3920E03EC2A79B9@MN2PR12MB3968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uTXufS8RmKi3XWT64Gi6qN3abcaDr3grpuIe6ixa/zTSOqoC0mQRAldve6AReSjp7vDiuRiLvUUYlKMBXQcY261e5AxIJxA47l0oes5R5smxfhvXKteqv3YZMkvOGyF1E/5CkjM0J+Lbcrq7HBdhGlQa9kNUIqXTYFxbtx9n7f4gnAUDA64/1LMzoXddV7bqPjKtMamZ3rw8su69+iYf1CQJlPoPm2SdkmXNSHYXEJTHg0Iai7m8Km7VdqAV+dfD7qNgLHaBt2kijWxQUkKOu6g4dRow90pHOchjQ3b7zOKXrRGt7KWawsOaLqOUWxpxoTSMH1oUZ598h05c9ftGL/VOKlcWa6f9aJLCHqDkWEcpOm0jld2R0QkCwF82uLNcYwvCg1Gj/gBsxCaW3JSgB3V8kqiYdYBzgS5RcFru6Zmkm44e3wtIdmdxVA/svFt5iVWT1WcVIts/xOB5FNrW0BqAAQ4gZPuWN20dhEDNg1UIFDRDASyt5kWSpVOZwbA0uCg8Y06QpzB3dvYFtQxIyrQMTMQPZFd+nDT1XPsqKZRN5Xosnx36CXOy60FEHLbEkj0oDjoXMSuNBnuZdwX99eECvbq5Z2TkDdI/Z8uGN2loQAwKbystCUICTHfhEsu/wql5uMK2mnuhWWIyw7f8nAeTXJ70eTlwGkaKDb99Fune5M8WOCv7Qb4w/YlqKjb6zfhq72VBte3JRqpyQ51Qpg==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(107886003)(316002)(36906005)(36860700001)(83380400001)(70206006)(4326008)(70586007)(8676002)(82310400003)(508600001)(186003)(356005)(5660300002)(7636003)(47076005)(26005)(8936002)(110136005)(2616005)(36756003)(2906002)(426003)(336012)(86362001)(7696005)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:08:06.6722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4219fd8c-0db6-4006-f074-08d9aa622bc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3968
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

The kcontrol put callback is expected to return 1 when there is change
in HW or when the update is acknowledged by driver. This would ensure
that change notifications are sent to subscribed applications. Filter
out duplicate updates in AMX driver.

Fixes: 77f7df346c45 ("ASoC: tegra: Add Tegra210 based AMX driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_amx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index af9bddf..6895763 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -222,6 +222,9 @@ static int tegra210_amx_put_byte_map(struct snd_kcontrol *kcontrol,
 	int reg = mc->reg;
 	int value = ucontrol->value.integer.value[0];
 
+	if (value == bytes_map[reg])
+		return 0;
+
 	if (value >= 0 && value <= 255) {
 		/* Update byte map and enable slot */
 		bytes_map[reg] = value;
-- 
2.7.4

