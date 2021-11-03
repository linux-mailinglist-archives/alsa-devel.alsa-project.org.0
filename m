Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA904442D6
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:55:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 681DF166B;
	Wed,  3 Nov 2021 14:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 681DF166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947725;
	bh=F1bGNf+j2sI+p9sZOyMctur/VhqOxrDqXZVOZeIclPU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sm+VMNSbhRmZNbZuk6yHzfrbPktf7l6L9/2Uch6rzB+NgOJ3fg33/pE8DTwq5t/qQ
	 6CyCs6M3RfEH/9N84NWrkqNrSQ82o2eZfAAyKgjW4gG3Dn1ICiYF7cZBN+Zpbu+vyu
	 PezwHwKuPqqdxX/NLoOluCmUkVyWaMDtzWqfloLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00E34F804F3;
	Wed,  3 Nov 2021 14:53:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 173DAF80269; Wed,  3 Nov 2021 14:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2061.outbound.protection.outlook.com [40.107.212.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5AEBF80269
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5AEBF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="jUEj3ppG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOMfd82PVCeRqE004UfmOAO8sMscZYhPHpMfs9mxsReuak1Vy8C5IZsT8s0+Yz97rPnsajBx/hMcxdeiawu2bAlNrhz+b1s3GSZ8EFXTQLZpc7KxhDJYaboGA23zyuEXaZCYIiA30Zbs8K1vzRLBi80c+An/EcFltliIFELEIH97kotex7bE+dirSq01rO0YbyNXhOboIz2tie6HdKJHbN7iuUspg1h7s2r89r3Zl8W2MecASiS1Y9sTt0Z6TmVcHqtgV//coOxTVl4i/xVoRo1r0TbWi9j6XUEaF52S+5AQKLgn+93qZxr34cQ3EXcerj7LPcLKPtV0k7IcxhfMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXqLwbKo7AloZe9GpCoOeG1wpo91/LMKM1UlGi1eBJA=;
 b=Hyxkkh568SOKQKAT7F5hQelYvDi0lqbPmzmySwEvZK/qUnvDOw1FyN+BUYYAc7shV255qfcs1aZtE4T34nGmnAsaqql2ZeFEAnJ7H5RKJx2GZY6sRuFjOLg8WnDjB+K8ViMStVrnIdUkHRqH9p1Lh0P8531KaISMOPsCJFbKLI8A9o1G9P4MeSA7CMNVMH0JAn1NP/2lkEwCE+mocFlYExbINIc6fkD3SmvFR1Rf891A3/r4mwA4RN6sFa9pwi8e59f+u15lzuAMrWMWMLSVBzJvN6ocRuO3AOC2VBKetCe4nbfvuZsISDLzaXPaPP7xGZv0vzrXyOM0TgIdI9hNYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXqLwbKo7AloZe9GpCoOeG1wpo91/LMKM1UlGi1eBJA=;
 b=jUEj3ppGTg4e3U5c/JRQv1jXjuEHVk0YPsy5C72jzKqr65Qs10XAyiCslukTM8uOAMt32SST0Dms7CDYpy2D776NbstRzx7V69E3HSaxYZyiBqCIpogNrckxDMaUM+E079LnN4jIeOUgK7k+M265j9XMO+44Ue+Uk44rqoyPJier6TCsOhV3cZP6wzUpxpKHuh2cvpg1czPAeVn+dKyXPJS156YSTbfQyHUxK7XXGgSbSLgEtDT8GuJVC+R5rXDVQpFcgV3S5NWn7VhBj4IP+4v1xQJB9OR4NhDwbeYJgk4F1de++IXVPqad98KJPGzTIsZvM6sihhpH5K8iLFzYBg==
Received: from BN9PR03CA0698.namprd03.prod.outlook.com (2603:10b6:408:ef::13)
 by BN6PR12MB1729.namprd12.prod.outlook.com (2603:10b6:404:108::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 13:52:49 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ef:cafe::8d) by BN9PR03CA0698.outlook.office365.com
 (2603:10b6:408:ef::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 13:52:49 +0000
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
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:48 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:52:43 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:40 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 01/10] ASoC: tegra: Fix kcontrol put callback in ADMAIF
Date: Wed, 3 Nov 2021 19:22:17 +0530
Message-ID: <1635947547-24391-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a904a2b-a4dc-4c9d-6891-08d99ed13876
X-MS-TrafficTypeDiagnostic: BN6PR12MB1729:
X-Microsoft-Antispam-PRVS: <BN6PR12MB17296932FDCE280D69382C42A78C9@BN6PR12MB1729.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /CFR+4fEHl+nIiV/UNct8FlZp7wTF049NlfzGADPOQCxPxCUgx1nTeZsVLcGLkfVKMgB2wDWELQHZLTy+E3DKZrrT5RvlE30fVbBpGBTfZYL4Fc+jXyAF7+vdihiZ7B/pAUQC7dE6JJMyDHq+4KbDVKwOCxMwPI2Wegdzi/FxkPzt5X9wrmRyWaOhUdfJ4Knb7mDQVHsN5iqiZrqmgXyrFawypGZK6Zk8107biVo7cE4e+gvS0Hvoh/E4JKEZag1MgNH05+RhTTLP1vEz+eehtdpbiKfEzeq34RSnFKynA2KHwNpIT3BPpeNADJJX0PRWbx5SFl9i/IXxW/qdkMelMY4Rq7GfJQ2g7zetzZVxWKdv283vtusotafYVFn1sghg3g/Q4JfXUkTcJ5Xvq7GbbqfRfw1364LTsAb4wLpd6fZdpBU0OvCtNu2Z5y57yU0QzgSWlPCCkndQHMOd9fZ3HscDrHTGOL0UhQ3BXnMaz2eTVhkrmYqQA/fvneDU4w48WT2YMUY3QMKFamVpPL/ECYxKe5PYAPWiSgX1FYNe0WXXJM2/WlWtWotMyHMdiBJ6j3UCnqxxupUOhxPtachPV1vPJwGOJJdHw9KsY7aaDcEdeYbeiBYS2VeqPP4733gs0IdUb0vvjGT+f17i7cezM4K2os3U6ZSOipdar0iUjDKiUkLbsvmk1X7hdfEHsdzX4M2XzGaSvwioLnF8io0KQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(8936002)(86362001)(508600001)(8676002)(70586007)(70206006)(107886003)(2906002)(36756003)(356005)(7636003)(82310400003)(83380400001)(4326008)(5660300002)(6666004)(426003)(7696005)(336012)(47076005)(186003)(26005)(36906005)(316002)(54906003)(110136005)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:48.0574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a904a2b-a4dc-4c9d-6891-08d99ed13876
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1729
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
 sound/soc/tegra/tegra210_admaif.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index bcccdf3..dc71075 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -452,16 +452,29 @@ static int tegra_admaif_put_control(struct snd_kcontrol *kcontrol,
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	int value = ucontrol->value.integer.value[0];
 
-	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
+	if (strstr(kcontrol->id.name, "Playback Mono To Stereo")) {
+		if (admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] == value)
+			return 0;
+
 		admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
-	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
+	} else if (strstr(kcontrol->id.name, "Capture Mono To Stereo")) {
+		if (admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] == value)
+			return 0;
+
 		admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] = value;
-	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
+	} else if (strstr(kcontrol->id.name, "Playback Stereo To Mono")) {
+		if (admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] == value)
+			return 0;
+
 		admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
-	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
+	} else if (strstr(kcontrol->id.name, "Capture Stereo To Mono")) {
+		if (admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] == value)
+			return 0;
+
 		admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
+	}
 
-	return 0;
+	return 1;
 }
 
 static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
-- 
2.7.4

