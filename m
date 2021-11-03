Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4791443C79
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 06:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D646916B1;
	Wed,  3 Nov 2021 06:07:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D646916B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635916078;
	bh=MEcaqvkVO1Spw4IWDI+6Zck9uK6F+X0X7P8PHcNiplQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwCHiPxvi/eBX6XwfeKnnmh40dCILbWFKRjAiZSevQbe6djW/jLyXFBR0kZFyNmpt
	 TC2Jx/gD/xvrtx8l0i6JwJ2OPM8RmToxPkb2GTzeofP3HX1MhDLug/S1CfskuGiYR8
	 TWpGpoE9qGrRodHsKahF8zOp5I519IBfkWrJs6aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 996D9F804F2;
	Wed,  3 Nov 2021 06:06:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A824F802BE; Wed,  3 Nov 2021 06:06:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D207EF800FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 06:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D207EF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="q8Uacuy4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilzt9jXX6WFfYgGHj7qHK4MiEOabKl4ZEtIb6vCiAtoSLJpcLOepB3P0WpHBU2ojGHVf7OHCuwXqaPm9E5WQNV0Nbo8lOMJO/EdZL9LyxXFxLHxTUwjh7bBbRm7wpJSCGV87BwosevWNxYQ9Q3L9KEbywuehzWNmMKcQ2TBZVzCD2jzieX2/UVkeySYoZALhD0Qmt3bxQGYVG5QAplJoH3JSKRokO81AZq9R1v3PjCRp0wbgUwwdTnz/p5m9onoM1hr0szTtR9rfcVtS2Rbk2ryMNXXJ5hXOkkBiCBDReugHIYKMcAmJZYj6SSg11/oZI09AHf1eM7DYoeQOjp3E0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFiwC8SkpFk9PgpgmGvI9+Or4jCrnS/cJhXLUAHQtoc=;
 b=IwE9KiyMRsoQAOmL43g90Lnl+32bcefPW2oBgR49r9Zvb/grF8JdyyGIJTWTk2K+NQectN69IrQt/W3kSKMviMOwCw646RRm24SpLEJxDo2NW+egQKu6MMGe/i2zpAsGKSuj4xShjRMQ/KHRE0xSYvSYeyH/ayn4NlAlBjjtdiM7v7GZlXQMbx1UhpMv2D8qqidSypMQNTDcZJyht8cZjNiGt929wQ6Aspv8D8NZoVJz74A6vQU6MMqC/WpIlizMqvdrubvbJcIlynvdtiK3DoXoZyod80bggtxkmbh/1UTZ8n4wja2KP6Am3myq927jItkkB4MFY+WShpEMbwD5kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFiwC8SkpFk9PgpgmGvI9+Or4jCrnS/cJhXLUAHQtoc=;
 b=q8Uacuy46rRpuj9Bz/WOUFBdIG2b255bSInad5dKDMNk/Jqem6gD+nKH8j5Dd8LZjp0Pj1AXMsN4qOAWCBhBliYnUZwV2D63XmX0CgxqjNbX11iaOWmG1Lz41c1RmBuCqzRKMHBpihbH4SJPrmEgfEHtcE4ldK9n4uRBWUDKvvmzpjDeM8sRov3/q+NCFNZadz6xHIleQOWvI3LISNLsTTuzuPvBXJ89N7T7+XmZ6S68RWvW3n+JKdCiRxhmDUNNnmdJ59DK7Ug/recHwaOG6uWBailxzyLpfK+3txTcrQk2VAtaX5l6kEIwKSySc5l/JFYz4GasykzLV5cJcf7+ug==
Received: from DS7PR06CA0050.namprd06.prod.outlook.com (2603:10b6:8:54::32) by
 BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Wed, 3 Nov 2021 05:06:05 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::bd) by DS7PR06CA0050.outlook.office365.com
 (2603:10b6:8:54::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 05:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 05:06:05 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 05:05:54 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 05:05:52 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 1/4] ASoC: tegra: Fix kcontrol put callback in ADMAIF
Date: Wed, 3 Nov 2021 10:34:54 +0530
Message-ID: <1635915897-32313-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
References: <1635915897-32313-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d86dd3a1-f340-410c-f99b-08d99e87a399
X-MS-TrafficTypeDiagnostic: BY5PR12MB4244:
X-Microsoft-Antispam-PRVS: <BY5PR12MB42447E3C3290CED9906F8F74A78C9@BY5PR12MB4244.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wR6BrYAhRJ7CL5r7qFTZ1yW4E+cn8jcIA1YJmNst/AaRN20Z0oTLUG27WszmOLDBjO4xZB3HXdpV1qTsJLhEzuNyBSSYJaYENOZEKhGWQvmKSJlROCJBu2GcEtIZXz52XUfU0aqdHsCWyzsRmqQtp1JwXhjAMpG8qzeOItWgIypgLB28d/U8OY0JFDW+LmTBAjXkFAl33Q5Vrq2j0jm6q91MjBnA12/PT+CIKgNYuM8CqaPhDDPCyF6UPL/MS0JOl2lu5LjN2+8Zwej8WYhTpNblVDHEBsksgPXJBVF0gvdJ7zZIvwsuBPUNIZf18eV5QVJbgZAB451LMFl4yfGf2QLim85WkHul5UEMqybmQqj298YIHj86nyn5tAcTgSKnllL3v33FCoUcrV4zRJnpMWUUTXO13XTrqnaJZewMGynxsI2stHNmac9afXZSxSJRxeZ0gL8pOAvxqTYQkx1y5lPXhr+6whaqgSRPtK3fphX0eCa8JegbbHIUhskZcWAjJb3F4Fd0K3vSUW6BJ18k/5Kjov7jOva5rRTXRaN/uMTUc/zrHyKB//v3wnhcrSP/0pX236AQdXRYnjlmS6j4MMSk9n6v2aqtGejKmVO1ONwHAuYAoXUhUTfsOc1/jICFb77cnHTPKlTW8h80dQ55O+BJf1rJZQb/EuCtkJn9bTWqW6Ng/ZIv6zgw0EPCjhAJpekiGI8mzCNE6VQXC812BQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(7636003)(70206006)(7696005)(86362001)(508600001)(4326008)(5660300002)(8676002)(356005)(70586007)(82310400003)(47076005)(2906002)(426003)(36860700001)(36756003)(36906005)(26005)(186003)(2616005)(8936002)(316002)(110136005)(54906003)(336012)(107886003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 05:06:05.0847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d86dd3a1-f340-410c-f99b-08d99e87a399
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
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
that change notifications are sent to subscribed applications. Update
the ADMAIF driver accordingly

Fixes: f74028e159bb ("ASoC: tegra: Add Tegra210 based ADMAIF driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_admaif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index bcccdf3..36ba980 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -460,8 +460,10 @@ static int tegra_admaif_put_control(struct snd_kcontrol *kcontrol,
 		admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
 	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
 		admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
+	else
+		return 0;
 
-	return 0;
+	return 1;
 }
 
 static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
-- 
2.7.4

