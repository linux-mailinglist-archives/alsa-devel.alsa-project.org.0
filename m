Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B24442DD
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:55:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB840167D;
	Wed,  3 Nov 2021 14:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB840167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947748;
	bh=gvmQ6QStlfDuamUV9ZOddKFYfhbXrtb5HOEAx4V17wU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHquxf9LnKXiijfptMvzGeSyQ6dnmSxZYTdFlSo4Dvqqs8HpcdVesMNH81d4yqFSe
	 QdKsQIcM7OAvzFrCIvIpgymOAa9A55dpqg0jCtN18TPGw6iEJdVLNHcBSI4EHHX/AJ
	 zsGRssq7bz0jfRZuAgVS21qbhCfeWSIhMiFX8yqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57C53F8050F;
	Wed,  3 Nov 2021 14:53:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24526F804EC; Wed,  3 Nov 2021 14:53:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC58F804E5
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC58F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="NHeM6BZ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFPE02EmobO1X3KEucBFk4V0OztIfU6HO3wnXVymUI30TGtNEgZJ3ggdxxy1mf78S2KxDnKS2i3u8gFPPVyXmbZKuFty8Ei9FXt//2zU2WudQ2QjqZE7v+xOX4dfFYHJ1mXyclm2nBxV2GdR6xR5MJgGfTloRxvoKXsPnJ7vqgUDiyRW3g8dKd/FQPvSkykmz83TWGfjSZhsA53YQj5FFJ8KpBkmD3mDLHRXrhhoAPJFLb/C7oW48Oaqf8ltwHl/gUg3tji1GF6g3+1Kf/YQiolA1Zb8UETh635RiSZXRPyBYjZRkTDY6bcnhXNgpO7IUCPMmBCf1XX4D9M4xOzc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9ZOKYQmuNuZwc2ljgbVpmsRj+kKvpiSn/G+mClgeXU=;
 b=Iifjl5Mpb86ULepw9YAUryolB0aDdDWsQ/IXVAXuzOrNNVn9HEIbSL8+ZERJMNrcv66Di+Ep9SSRQV6t2uB6Q7ppbkF47UJSBW9DXREAZft9/442L69lvSk9/NV81cun80xuzh7dUYXmTVDk/m8nd3Tii3jlvSy872U+eU4V+9wb3rjIKfLLQrJrxj9aG/pQp2sd3zNOf41qyySsKYiYojcor1SmhTz8hkuE02fk6q4Lim2q6JCdRqJbl/u9MV/aRyDBEwpwg2hFqCgc9YOvmbL3/QBPpi9MeTTI1rqrCSXA2nRoKjHFwZ9da0JRKewj4IcD3jj/rCTBJ+gJ7+/RGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9ZOKYQmuNuZwc2ljgbVpmsRj+kKvpiSn/G+mClgeXU=;
 b=NHeM6BZ9IrUsT0Cort8BbPsmEIdzpy4YkDtVsJ5RzDKN0sEPbMeu1GAk8XOaVX8mR8JEmVmybRByTP/kQgYws1aHKNaK/Cbv+kBznLgUiTuogfOXvxlq9rNF0k7g0wSyMla2rAgY1MUs6A+GruAZc/ivitwQrk6DlFT3XCbM4Ggrm7UhDh70ysPnuLwGoiEPcmN7UeZTrEPew2neUaS2I7tTUdGeIZ9CIGwLlfzZ/bj/QCT53QT7JBAX+E/2ZzU97dSy6ugkwFBQxgvkB0x/f/Ob9Ngtwxsso+JmY2u+SPZ5ewwk6xkrmHZ6ud5ELuuS7izj7tP5NCI1gaUwpHvnhw==
Received: from BN9PR03CA0712.namprd03.prod.outlook.com (2603:10b6:408:ef::27)
 by BN6PR12MB1203.namprd12.prod.outlook.com (2603:10b6:404:19::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 13:52:56 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::58) by BN9PR03CA0712.outlook.office365.com
 (2603:10b6:408:ef::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 13:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:53 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:52:52 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:49 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 04/10] ASoC: tegra: Fix kcontrol put callback in DSPK
Date: Wed, 3 Nov 2021 19:22:20 +0530
Message-ID: <1635947547-24391-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce0edf17-7e9e-4240-289b-08d99ed13b89
X-MS-TrafficTypeDiagnostic: BN6PR12MB1203:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1203467D0E4ED8F8DD72C97EA78C9@BN6PR12MB1203.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pCP5sY1Lrj0TiFhoL60FKOlblcQSCe/3NVPuWMkXA18tF0V5agRnGTpJG5KbrR0TqPHMETGFOM26jE4ONbT+57AubGToqsK1azHr1GztG+0e/LJ4UpQYf6SStRKk6tcRIXKxDxqa4CanL+DliCmb5JgEvH75XKFJC50xt6o/kZoK5wRox/zfHkzpnOGn9PubMaY2G2D+inH0/nkskcszSZvAOeSdfVdJgo1EPcDM1SlsxAISfr+TvcgaY+MRIPuB8/x0QdxlzPJJw+i9orx5H3B9Iv4DJWZlKTfz4P47/O+h/Fq6PFO4x0Y0jE3J7X1HVraCJQO0F9RdGcs/CoLOSO9CoqF+WOsxyu81Abi91JXHd2l7Cb2qd0xlszUPTqj2DXapEPBEcse3UUrTwlFObQUsAZ8k+Q6mOPG/rY0ExNWB/stl1yJchnxcTjaeMFHAq77fgGNlk7JeR5f2yCdztsvAup/UxESAWhU8F0taut9XpOX81WfH9yCXrAAFPjaaf2pEzXIAWYt3sBYCPoh6GBXnM5fv3UWh/MQxvSc/+8PZBJ4g895tSnZQMsi/52Str0eKjJ1x5OjwC6izqquWMokWZtxlFXUwi9Bif2jo7TJn0wj4D6wrfe+JsAB7JpXRqTmYQ2bTbKxFzz/d9hNp+i+zBauV2aAhzB6b5rgaRQr5mvAdxI2juFUT6099sEXDM8gESahzKs4ab01MhqF7w==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6666004)(70586007)(82310400003)(54906003)(8676002)(2906002)(2616005)(356005)(86362001)(47076005)(7696005)(107886003)(316002)(186003)(5660300002)(110136005)(508600001)(26005)(7636003)(83380400001)(36860700001)(4326008)(426003)(70206006)(336012)(8936002)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:53.2184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0edf17-7e9e-4240-289b-08d99ed13b89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1203
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
the DSPK driver accordingly.

Fixes: 327ef6470266 ("ASoC: tegra: Add Tegra186 based DSPK driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra186_dspk.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 8ee9a77..4cc06e9 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -55,20 +55,39 @@ static int tegra186_dspk_put_control(struct snd_kcontrol *kcontrol,
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 	int val = ucontrol->value.integer.value[0];
 
-	if (strstr(kcontrol->id.name, "FIFO Threshold"))
+	if (strstr(kcontrol->id.name, "FIFO Threshold")) {
+		if (dspk->rx_fifo_th == val)
+			return 0;
+
 		dspk->rx_fifo_th = val;
-	else if (strstr(kcontrol->id.name, "OSR Value"))
+	} else if (strstr(kcontrol->id.name, "OSR Value")) {
+		if (dspk->osr_val == val)
+			return 0;
+
 		dspk->osr_val = val;
-	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
+	} else if (strstr(kcontrol->id.name, "LR Polarity Select")) {
+		if (dspk->lrsel == val)
+			return 0;
+
 		dspk->lrsel = val;
-	else if (strstr(kcontrol->id.name, "Channel Select"))
+	} else if (strstr(kcontrol->id.name, "Channel Select")) {
+		if (dspk->ch_sel == val)
+			return 0;
+
 		dspk->ch_sel = val;
-	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
+	} else if (strstr(kcontrol->id.name, "Mono To Stereo")) {
+		if (dspk->mono_to_stereo == val)
+			return 0;
+
 		dspk->mono_to_stereo = val;
-	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
+	} else if (strstr(kcontrol->id.name, "Stereo To Mono")) {
+		if (dspk->stereo_to_mono == val)
+			return 0;
+
 		dspk->stereo_to_mono = val;
+	}
 
-	return 0;
+	return 1;
 }
 
 static int __maybe_unused tegra186_dspk_runtime_suspend(struct device *dev)
-- 
2.7.4

