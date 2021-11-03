Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1474442EB
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:57:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCA8316B0;
	Wed,  3 Nov 2021 14:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCA8316B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947832;
	bh=aJ4LwsBtr8lUS0oAOEQypQxKOdL34W5UWtWPdDYWa40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sbb32HNUoSfNpEIe1nSpbFdihANbJ3HbM8eUP0s2o9sAi3BCXZ3A1cLfWRVVsszN6
	 icUu90GYGalRuE2Ez1XJhvvBisEQiV57lcVIgbnP3LQMTfnx4yW0lRZa94zjVfWYlS
	 +xtTKlRSK7DNRAGGDnohRidR03YH2I7QcLwInGxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3931F8052D;
	Wed,  3 Nov 2021 14:53:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71881F80515; Wed,  3 Nov 2021 14:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75F4BF804FA
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:53:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75F4BF804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="MSPIrtD3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AjVgtK87pvA5zNWYvS4n8rxRdP8RaQOh9IwXdT09TPbgl3br9CRx6goEsKqQoHdv+hAqkKYfXZKGWn3RlukF+dEbFXLnyfBQAI0PW8C/RltaO5h2uYKBqOl6+NF0Qz2JKzMCPPDQ/oby1ZNQDBYd+s+1w3JymcqUp2MgvA6rS8Vryx9brz2aHbt/InCEyQHFeOy80DhsQJVOOFmJRFIt2mntE2sopo0D8eNvpmx99fjwpTtlNFmLUIrwprAaNEUHdS+uaXe/UnM0acnvDknluRsKzBEg2bSwXvygg6ASl7+KlqU/JZG9rQgkFCAhIYA60xaglPKpGjizmI9sglhcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WF2iEGB/T6jvZnq4ceN0v7xUZBWzt+ycRuQBNzdRPgU=;
 b=HAG7PmNFTNUFR6No6WIFnYSsZhpP5+MOButvJnwy8kQSy0jh/Ka1ao2cZszYNz3BseAO0eIbNidvO3bgzpPcrlxQfn7x3WVGnRZJPLjF4K19q5KwSIl2PMIyLZY+avFNOCE/d4Mdb9G4VrrDhYn40RbHCQ3qJ8F1Zgd+YBAdGlhLvy5HwN/8kHNwFdRXwLffZ9s+B+Kq1156Qt9xcbx/9XuYN87iHFZRfywj7xsojZDOOrlfasoGBdE3aOoN0Z4EgyW+TNZYWUjicU0spMzf0EiiJw9M/es2blPW5tS5wMekkPDLNkoeB6KXwEziAYNyR0z9nBW21Ik9cZJTYdnHFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WF2iEGB/T6jvZnq4ceN0v7xUZBWzt+ycRuQBNzdRPgU=;
 b=MSPIrtD3K+TdfdpWYyG7ZBcn/urjJlOnmo214SOSHUlced8y9jV1itvdT7FIYXSyDny7kBfuh4TNJmdFNT8uJ2Iq9oniE6EQQEtS8C2msQdprsWRnDtxihq9WZ9ILBTcTFvOQC7n/Bhz78cWD24dr08300LW9w/lVZokZdlfDNCA/Vek9JUGOgRVaD8JujBm5Zx30JhBE77RU68q6qfuwn35Ws/WloB843cqG2vkNvPaopkC+qd71+yfpPynMSlmdzcQKau6oAoxDHwFFk3NgBDoAjCbHTOZpNGyyFx3PlbPm6jdaDYLrcy22avUX20dhJ4+pVl6P5gqawATfgPydA==
Received: from BN8PR03CA0013.namprd03.prod.outlook.com (2603:10b6:408:94::26)
 by BY5PR12MB3985.namprd12.prod.outlook.com (2603:10b6:a03:196::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 13:53:03 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::68) by BN8PR03CA0013.outlook.office365.com
 (2603:10b6:408:94::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18 via Frontend
 Transport; Wed, 3 Nov 2021 13:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; perex.cz; dkim=none (message not signed)
 header.d=none;perex.cz; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:53:02 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:53:01 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:53:00 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:58 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 07/10] ASoC: tegra: Fix kcontrol put callback in SFC
Date: Wed, 3 Nov 2021 19:22:23 +0530
Message-ID: <1635947547-24391-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a180ea0-2d17-4216-c48c-08d99ed140f3
X-MS-TrafficTypeDiagnostic: BY5PR12MB3985:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3985C264747AB5E0AEAAC35CA78C9@BY5PR12MB3985.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oIqv5BeoPTZHvXwDYF66S+APP1tkfz4SuCjGloT3rg71+Aj5cco3uS5nEqwlhCB8n57UQEPILUoxwHgEBYTdejTCX+jvv1EdKIQ2H8KV1/pQVrb/Ye6FQgkSs8a7K+Pymduh8o9zoOHRCUgmpk0ey6IgCV4o4/8Pwr5sxmEwpXeaMwk/frxlzq5ukgV0jN32VS17UwbYj5gUkZ+M18xUDD/LuLQdTuaF0Cle0ey+3Gu96JYGiAVMl46BLSqxrG8E7CLMRI34wIYtdYYu9x8m9uynxPEWZBY1s4hDbN9LQ2BOxhKnMxbd8Ui507Wcx/LTkHbOM8e1/EFYFzzfv1AVmZjjcD372EowQt8aUuaJfKzSYo2TgJsfupvjCjCEJJBbFuS8KZOcR+C1UPVSv3xCYwQJj3ibIfn0aDHpxZZmxkhvBzNptgvuAK3J7eEluSfnoqYcw99IS9FNzW/Xlj8zr41lGxE3g+XI04cXwHqCLEq73abSQtRRgvZdLkn8ICsODDN+DmraGfRSg01eLVq1oaUTv/JxqTnfDpQE9C4KZ2Xkb7zh2FTxzgunhUAIclhXeaLfX7GjMtn6IxKxDA+LWsU6AqWtcXyuBiKNBluDslPXRSbKvI8uP8piD9nYQ+XtHfOSXRXtCnEALmxPtOgKKJ5ZxJqIkm/7qRFnIgpojLaF7A9YgBVw908ocouqp5btniyvAsz9nIc7EtYBPAnCKA==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid02.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(356005)(86362001)(47076005)(107886003)(2616005)(5660300002)(426003)(6666004)(186003)(83380400001)(4326008)(7636003)(2906002)(7696005)(8936002)(8676002)(336012)(36906005)(70586007)(82310400003)(36860700001)(70206006)(36756003)(508600001)(54906003)(110136005)(316002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:53:02.2907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a180ea0-2d17-4216-c48c-08d99ed140f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3985
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
out duplicate updates in SFC driver.

Fixes: b2f74ec53a6c ("ASoC: tegra: Add Tegra210 based SFC driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_sfc.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index dc477ee..ac24980 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3273,16 +3273,27 @@ static int tegra210_sfc_put_control(struct snd_kcontrol *kcontrol,
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 	int value = ucontrol->value.integer.value[0];
 
-	if (strstr(kcontrol->id.name, "Input Stereo To Mono"))
+	if (strstr(kcontrol->id.name, "Input Stereo To Mono")) {
+		if (sfc->stereo_to_mono[SFC_RX_PATH] == value)
+			return 0;
+
 		sfc->stereo_to_mono[SFC_RX_PATH] = value;
-	else if (strstr(kcontrol->id.name, "Input Mono To Stereo"))
+	} else if (strstr(kcontrol->id.name, "Input Mono To Stereo")) {
+		if (sfc->mono_to_stereo[SFC_RX_PATH] == value)
+			return 0;
+
 		sfc->mono_to_stereo[SFC_RX_PATH] = value;
-	else if (strstr(kcontrol->id.name, "Output Stereo To Mono"))
+	} else if (strstr(kcontrol->id.name, "Output Stereo To Mono")) {
+		if (sfc->stereo_to_mono[SFC_TX_PATH] == value)
+			return 0;
+
 		sfc->stereo_to_mono[SFC_TX_PATH] = value;
-	else if (strstr(kcontrol->id.name, "Output Mono To Stereo"))
+	} else if (strstr(kcontrol->id.name, "Output Mono To Stereo")) {
+		if (sfc->mono_to_stereo[SFC_TX_PATH] == value)
+			return 0;
+
 		sfc->mono_to_stereo[SFC_TX_PATH] = value;
-	else
-		return 0;
+	}
 
 	return 1;
 }
-- 
2.7.4

