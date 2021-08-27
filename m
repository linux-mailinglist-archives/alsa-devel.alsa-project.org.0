Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B61553F9764
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 11:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E6C916D4;
	Fri, 27 Aug 2021 11:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E6C916D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630057434;
	bh=f5hdCfzba24KL2qLze5pHJHrrN4NVGzzNFLpjZAmts8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DYu4XRx1BUwthO8auJX0xup51CznV1bn0eenu2mGK/cHPVpQKdDy1Gbh6IYbhZYcY
	 RByK44O14XMshCwGYDvH5efQjmg4TnfImvMiB9BtY0q6qBXJb/awHMZjxq7+Pc5lkn
	 7NNQ5fFXyiWJuPHWpWHdCT2ag+9jawoefcWbvsGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48C78F80552;
	Fri, 27 Aug 2021 11:39:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A143F80557; Fri, 27 Aug 2021 11:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18541F80533
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 11:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18541F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="BFibFKRA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzhukDDfgOlAsc7X09aRCeWNntbO4H0POG/rN62YlnTgVM0DGq9IYhS2RbHeJSMHW3lw6+0IDyX//WBfqwGNySjNOPgFwzDsHSgehSTXAJcNevgIxDTxb+zTxB6fX5myP396J7k6bFZjb+smM/DzvPeB1XNoXqVHH7Z+mCjw/mcsqSENXMRYrmSKTEnn+TiWKvUY1/meCzjTVIv4EgHIZP1jvlMBI6VfbPPv/D3EaU3IY3Q9A5xUS9G8WkT5s3nEfAZj6eWg/Li+yuwwQeXPLghqe6MPFG/61VtlCzL1qHe4enAiX0HEg4KCyVkAcpEK1g1N+BUB1Svd7ToqXpfjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg6mXzCS1t3PxnYY7TnLUmVB8yvgmG+raaikvad9qos=;
 b=OpQL4ym87CVunzwJeDKTsOZWQcI7FvgpQ3ZtyWuKK6uMLZ8lRcRvL68YS4eSq5Q+pbz2f+DN27fMHbCAGJf4J5KDOgEIe6MACXu2uSGwLy5GymfRr3+W31W6JQ1zxHJPdR2JDa0RTwxWCk0BlSnkJu4ckhg1/tsI8u52wZfOHvtnAM+ToD1DE/VDZnnYCY1nAdw6SwK1xFA/Uoe0hXcYYEneOuS/yJMJokMsVGF8LXmsXMJcQbdL0hb+ly8gu+r0bilBmWAeVeTbiOuFQLOB9hxZpmSR5ByplowksvLwl52VQGRqAQmnGS91Rzkv0GLbXHT+K1/1c8D5HtLUWQe/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg6mXzCS1t3PxnYY7TnLUmVB8yvgmG+raaikvad9qos=;
 b=BFibFKRApcWRGzPpeA0MNPBfn7SXH5i6AoQgxKdk10bHzQTBf+4jT52luaq3+5ZcyVisMBu1ciIc8PMiIL3sQb74YIuVDG51YASvngJxAmvX/Y8KpxhdCKB6ai2xIzM5Vlgzw98xHOsUFYRe7h89W4KM3+wBMAmCrp5b5JL7PjYe49NaAZng8MsrsRq7ohwHuvJNSm6EZqkAcw6lhJROG/SJOndWXD3fA66xoFqd7V1aq+KhQvQSZFoVn8V9E+pQLZjwoRePaBOuwtvxrj6CRW3v9Qm7OKRBSJx5WFNRGgOWm+W+Pi5lVE7Ff2iat8b95jcvA/JabMYsagJJvTNPDA==
Received: from MWHPR22CA0047.namprd22.prod.outlook.com (2603:10b6:300:69::33)
 by DM6PR12MB3593.namprd12.prod.outlook.com (2603:10b6:5:11c::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Fri, 27 Aug
 2021 09:38:54 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:69:cafe::ad) by MWHPR22CA0047.outlook.office365.com
 (2603:10b6:300:69::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:38:52 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 27 Aug
 2021 09:38:52 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 27 Aug 2021 09:38:48 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/13] arm64: defconfig: Enable few Tegra210 based AHUB drivers
Date: Fri, 27 Aug 2021 15:03:57 +0530
Message-ID: <1630056839-6562-12-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
References: <1630056839-6562-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d50cfd73-421e-4bb0-6f84-08d9693e7b63
X-MS-TrafficTypeDiagnostic: DM6PR12MB3593:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3593724C21A74ED607360808A7C89@DM6PR12MB3593.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBLjVkmYw8c2S5hKUnTL9tJWq69qeaZIOmvsoq93sPIwDLXv/O/XkKwm/aL60KEN8y1dA5A/JezDUBPIOKur+sIRtEnM/FHbzTtmnTTLrf0sFD5I305U1zz2haQWke3NgBQ3kWp8fc/uXxri4RF3ryuKoO3O7ZEP/wbuFJm1ejsH81ZxcN97FeV0ME7PP5xaez5aOcZWctXnWvBZs5vsTs1PMCfsC8U3bPb/kvk/Ps9Je16I7k8bpWmn0dyyRtPjWcVjKd9NsjTQKd+UhB3FR3QI0sfEecJJXdDaBBEMwjI0ZSt4ByqElax+22wm5eQXQDkBRjp2emJwOYck1oDp6Part0YePQkOT+uLvIw9GlaQn0aR64ATdQVtGGdNvUHBYmoCtnD9FK6tYbNU6xXh6sQ0jXplSAEJ0gbmXQRCKZ599ZvUGZ1HlzHJ3aIBISkZYdV3SIYipAUc7oTpB8upB9NEsmzk52M5yF7yid7ENlGqrTa1KwviHHUyuqVEFAiP3y7TjdehcGfbupBMiZdGglytpvylCDycne0+qBjT1sMHsXyu1zK7ijnb2huiE1+Tt/Wex7gFhwkwZp4mH1mDHyIXcM5zM3tVY21VrvzYVjb6tVgodj/QM/7P7RCuE8/Z8ZYfYI80cIE2keGuB5do+ttTaEl33xvLC/r7xkOZTZtLsich/rmTil+a98Q02hM2D/oW07BTz9+GCEt0wLWgAfjn/kqF+M8AshoqKBthzzE=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(36840700001)(26005)(54906003)(478600001)(5660300002)(82740400003)(110136005)(36860700001)(6666004)(4744005)(8676002)(426003)(47076005)(8936002)(7636003)(2616005)(2906002)(186003)(4326008)(36756003)(336012)(7416002)(316002)(82310400003)(107886003)(7696005)(356005)(70586007)(70206006)(921005)(36906005)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:38:52.7569 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d50cfd73-421e-4bb0-6f84-08d9693e7b63
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3593
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sharadg@nvidia.com,
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

Enable configs for following modules:
 * SFC (Sampling Frequency Converter)
 * MVC (Master Volume Control)
 * AMX (Audio Multiplexer)
 * ADX (Audio Demultiplexer)
 * Mixer

These configs are used on Tegra186 and later SoCs as well.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 3bf6f8a..b936a23 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -773,6 +773,11 @@ CONFIG_SND_SOC_TEGRA210_DMIC=m
 CONFIG_SND_SOC_TEGRA210_I2S=m
 CONFIG_SND_SOC_TEGRA186_DSPK=m
 CONFIG_SND_SOC_TEGRA210_ADMAIF=m
+CONFIG_SND_SOC_TEGRA210_MVC=m
+CONFIG_SND_SOC_TEGRA210_SFC=m
+CONFIG_SND_SOC_TEGRA210_AMX=m
+CONFIG_SND_SOC_TEGRA210_ADX=m
+CONFIG_SND_SOC_TEGRA210_MIXER=m
 CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_AK4613=m
 CONFIG_SND_SOC_ES7134=m
-- 
2.7.4

