Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D20C54C315
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 10:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D3118B2;
	Wed, 15 Jun 2022 10:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D3118B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655280366;
	bh=4syxjfDKjClZ6wIQemNTdLK7XK6NV+VPiGmOFoOUC1U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MZZ/ifxkHJVOVxZZFjS5g8BIg/i38iFR/uvqYFhoz2+RRIy1Paos/aQSWIQog0Ftn
	 bwLEKWk5Wmrj9MjbLuy9wMMp5PbQlkbqEB6dBc20ST/Nh2XL1XaH+40ZKTsoRvT3pr
	 L3Zf4/tut2y5j6qjpyniGV6vb59miVJry4hm5YDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D62EF800B9;
	Wed, 15 Jun 2022 10:05:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DEACF80162; Wed, 15 Jun 2022 10:05:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63B0DF800D8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 10:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63B0DF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="TfrQ30AP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrX8SAP4gC6bSxsbnbWMK4q/1HWrx07ipbn3jvWEWY9Ln3fyhma7GPkvYVv4d64cwDoIuQBe24NoFEWtjcJ+d9MUIq/pC2/dYuxD70u/LZ+6os0oPfH5yQwgLxJ6el3u1m5mqGJmLLVgVkbG/QEvInIm3fbyQ4hXY12jEjwO8HrLHPuzHfo+hmPHk7W8KJU1Sxtj0tnLI4GpJNgb7+QU45lDFWvOXeeqInUIqYKRT/lfebF2R+WesV0catc4grURY7t53iqFhOXOoD82+iJScS/9sEgoT2Rqhsv8d4rUVLXJcNS+hl5MDBQPVxeH392u6iErXZjFzruP3aHfp2fFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM9rREkoE8pvTBZBGN4bUxN0DeU0Muw9datHRmkrkuc=;
 b=h3w5gOGhcyLazvSYBVfYxkCotvjQUmw6hcfVL0y84oDx1Qe4JQk3DuQnirGgs733gWzi0Hx6F14JI6cNGDnDdUea0Nn8AnY37oC3JcQcvI61eXVGk8dWXtpMPEWZIk/y29O22z8XvzfGunKGvIdqy4+os5PZwumABM1XqppYmAMYxHwOfxL6DDurTTnuda59HHbT+BkJp38FgEYcawsLa9E5TSK+jEnrdSRDepPs9JZIuvch392x7FYaei10HhvegsKoFhRZFrEpb0PETDNXCtKgqqEXjQoOHsta4xI1mMXXXc86bKTtacuoVN+m9p3YW8tNo2mi/6BIeUyzc2t5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM9rREkoE8pvTBZBGN4bUxN0DeU0Muw9datHRmkrkuc=;
 b=TfrQ30APYmsfI3ey9LVD9M5Aw+kmwNzTjaeH6QdwyAVg7sdJkuYY2V+oLrDvH0AVp3X8ZthUfkQ87LvQAn1nvbHLKMKpSJFbtaIrKjYZzTKTDhIV03RA3j3CZ6TqZkNlgxRJF1wsQAc5Y8YmMMFZomoSgkJvBvB9urt4zetFkpH5H+jQRwuYMXk9N8ZMw76Oa3EThQuIun56zGiEF8fOpNbRfDc/FEPYR27Jyof/xDkGjuPu0IvlzCAfnHk3ZEvwou4Jn+O6QxxPgslbTnMigiVjQBZ5DrKXsLQgtqLT6LhF/T4qVVOFP3BI12SPVgFTpPUEvgV+DEVFMgdt4tzFSg==
Received: from MW4PR04CA0039.namprd04.prod.outlook.com (2603:10b6:303:6a::14)
 by BN6PR12MB1489.namprd12.prod.outlook.com (2603:10b6:405:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Wed, 15 Jun
 2022 08:04:53 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::7b) by MW4PR04CA0039.outlook.office365.com
 (2603:10b6:303:6a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Wed, 15 Jun 2022 08:04:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5332.12 via Frontend Transport; Wed, 15 Jun 2022 08:04:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL101.nvidia.com (10.27.9.10) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Wed, 15 Jun 2022 08:04:50 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 01:04:50 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.22 via Frontend
 Transport; Wed, 15 Jun 2022 01:04:47 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: tegra: Fix clock DAI format on Tegra210
Date: Wed, 15 Jun 2022 13:34:37 +0530
Message-ID: <1655280277-4701-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b18d3567-1ebd-463a-ddbd-08da4ea5b949
X-MS-TrafficTypeDiagnostic: BN6PR12MB1489:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1489E5BF64A3131ED1CD1C81A7AD9@BN6PR12MB1489.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: As7OVBhKnO5O08Y5poz0WjL7znMP8pKNlZVc56gCvODTEagRjm1th/7cYUulMSoubhQKnTqV5jBWW0bPmipYvPfSrIFHVQGzkkyigaiDF1yWKIRQmk3ZOhTkdDDLL25Gi9fT2gvrvySMECD8by6C0Usgsoj3Z0oN60k4+E5mvmXQ7lzSi7zP66rYKku/EZCtXUt3sCi1NQCdmqFspVlS0pjtEVwApc9Aupj40xXcc1QAMArTC+FvcWwUzVG2phIL0FLZ4mrn68rH758R39ZtByBhRr7Bp9gz7jM+vNgLm/VIWIqnoiSPsYrtDnPT8D5XQyWZg1q7qfUvQ+afneyfg9G/sZ98rXCj0e8EEE6jbmY9xV97oJH21yuBKwD4OSkxzOuNqKR2ikplUVcygo4qE4hRcLd+f809LvPhDAc76EPzrbC/bBbbc2R3SuQ5XMwZjRUpfgJ/QoOcobTRUdALRrGSgYsDgEnsnrJaep2r2DppZNR0RH9QrDI1IRM3+2m0DuMVmeAoSP05CCal5NCuoBebTlyrVEfaLv3N6CYwF9OL8QfE/rEXLjITDybcdUeQ/4VA72Y63VMtI3vnvumDVhmq6jBByqTBIhxNHtT7IqaE2mWba6Q0pu921X0tbMAS0tPYtjYopupK/qRLpZdrde1dN1l6qxp+EYFMsCbHqGSTCrsi9lipccYGE7z5G2q7tGkAd/USqdcp9uW48ah93Q==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(40470700004)(36840700001)(46966006)(8676002)(40460700003)(70586007)(70206006)(107886003)(5660300002)(83380400001)(36756003)(2616005)(186003)(7696005)(356005)(336012)(47076005)(426003)(4326008)(8936002)(316002)(6666004)(508600001)(2906002)(86362001)(110136005)(54906003)(36860700001)(26005)(81166007)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 08:04:51.0605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18d3567-1ebd-463a-ddbd-08da4ea5b949
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1489
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

I2S reset failures are seen on Tegra210 and later platforms. This indicates
absence of I2S bit clock, which is required to perform the reset operation.
Following failures are seen with I2S based tests on Tegra210 and later:

  tegra210-i2s 2901100.i2s: timeout: failed to reset I2S for playback
  tegra210-i2s 2901100.i2s: ASoC: PRE_PMU: I2S2 RX event failed: -110
  tegra210-i2s 2901100.i2s: timeout: failed to reset I2S for capture
  tegra210-i2s 2901100.i2s: ASoC: PRE_PMU: I2S2 TX event failed: -110

The commit d92ad6633fa7 ("ASoC: tegra: Update to use set_fmt_new callback")
regressed I2S functionality on Tegra platforms. Basically it flipped clock
provider and consumer DAI formats. This configures Tegra I2S in consumer
mode by default now and there is none to provide bit clock during loopback
tests. The external codec based tests also fail because both Tegra I2S and
codec I2S get configured in consumer mode.

ASoC core flips the DAI format before calling set_fmt() for CPU DAIs. This
is negated in above commit. Fix this by swapping SND_SOC_DAIFMT_BC_FC and
SND_SOC_DAIFMT_BP_FP switch cases.

Fixes: d92ad6633fa7 ("ASoC: tegra: Update to use set_fmt_new callback")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/tegra/tegra210_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index a289458..01c76ba 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -215,10 +215,10 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 
 	mask = I2S_CTRL_MASTER_EN_MASK;
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BC_FC:
 		val = 0;
 		break;
-	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BP_FP:
 		val = I2S_CTRL_MASTER_EN;
 		break;
 	default:
-- 
2.7.4

