Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7974442E9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:56:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47852166B;
	Wed,  3 Nov 2021 14:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47852166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947787;
	bh=EY+BfICY1xULbz89Q+hekTqX4s8rOuZBFiExtHgmm6I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ksrFrYRF2GbogaXYfUpFd0gw7LDj+H8VgX0v2DuFOXVPx/aj5y3XBQOlfhBnsIvW6
	 v0Eqjz6fwjnRFA816h6FAZgaqiq2DNgRYGxB/S1tWk7petpDHXc9YdGkIFrhd7M2tl
	 X2JfK1A5sJT+8RktesAwCmBRisD7R4R09IklLmsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DFAAF80518;
	Wed,  3 Nov 2021 14:53:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8017F804F2; Wed,  3 Nov 2021 14:53:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7608F804E7
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:53:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7608F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="SEW9Vc25"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FzNAnq5tJYpW+GabYnIJdre+Di39kWGAUI/Aemb+ZwhndtAc1zj4m5JB9hm5gOzzsiXqcyGM6rOGtvZFc45WKqACG8aNdJlODwkDOKlm7l1mGE4AGTisCAebDWvEbwjVsFpDUT2LeaoK8XrJa/wluNl0hJylWPULB3mXaC484FxotqtWLZ4XUXj/NyK43DPZx0MJoC9zYQLWNMLepgz2cJ95flJLKTz6RDqTDfqqmef/02fk9VH5FU5QMHbQ1DXgg/URDmiGJVXTUuuybiKPUrSjdQspuhsgw54/WJ0a0YlL0Lvfl4qm7Pcy7+ruxi/GyO6xUQUlASqk3kogLlCP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da/l8PVvKRGSZfJXUHeP98sIkpbFJjyuoTqRvSa0D1E=;
 b=XjwNTttILjET1+LppJ6jrMYjI8r2Tuy1fCffhcVsdjGFghorWDV02nHelFeyakvEAl6YP6fIkI9snuyGn7QtPFWaG7xDMTpf7/Md7QZ6vafkwSBRFwDxcRbdhTKR9mVHh4miRi4iPLHP2EFJnI666+Mgik0Vv3eAgUTBy4F3GuqdUbRo41/49Fhcl6OD6T17/sb5Oya+DvnHsqXxM4jqxEQX+OH0E5bEAZunjIu7Mw/BtjgjmpqQp2gxGDo2yk3GA3mBViZQxi7/msUS6Fa9o2RwmnXnQS9/SaegflayT57X6WTlpAIf4h/mYAOBHgidIQKCiHr2xZu5QD26a+mIyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Da/l8PVvKRGSZfJXUHeP98sIkpbFJjyuoTqRvSa0D1E=;
 b=SEW9Vc2522BUqsvuYSAXR01dudYATO1Wcx70KKWdNvygIQtFk7DmBG2Bfeb1lR7m7JS+8kBWAt4aNbHsEFyC80y5AcFDTbME7ueN06Go7lwOR7KwJ/PQvxPAJWP9AgWCnlf1szVi6aq9+G4Yu0r0tCNgKCOStGhirLHRUcyDh3WlrqO+xGwzcHbCpfDc3bHS1EEV3SEPq5vh1XVGmjflNPEinaYbr9iWrEdM/7weS2hwJBkOdWdkp6UMa1SrIV8C5X5LIvaGkrFzAp4eBGXTXQjT/nRQVw+ID4s4VsdgAaZjhxHwvbJKDm7Qa7ByEWBBQ0NUTsBV8nQdEZou7DXqbA==
Received: from BN9PR03CA0168.namprd03.prod.outlook.com (2603:10b6:408:f4::23)
 by DM6PR12MB2844.namprd12.prod.outlook.com (2603:10b6:5:45::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 13:53:00 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::b3) by BN9PR03CA0168.outlook.office365.com
 (2603:10b6:408:f4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 13:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:58 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 13:52:57 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:55 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 06/10] ASoC: tegra: Fix kcontrol put callback in MVC
Date: Wed, 3 Nov 2021 19:22:22 +0530
Message-ID: <1635947547-24391-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a811b01-e71a-4a51-6d02-08d99ed13f13
X-MS-TrafficTypeDiagnostic: DM6PR12MB2844:
X-Microsoft-Antispam-PRVS: <DM6PR12MB28442EC06E63EFA52EAFD005A78C9@DM6PR12MB2844.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJyOw7zHA2nMn33OtUVfZnXMenuUDcscnP6y1Jo7THC5awv95rQMmroJbST4UPhuqS9c5xlTjf96lpnUrHWY7z93kQePU90k0rlPV2f/dLOxLKIDjjIt0Ig9mW/qGUJT6tU3pUy6FPfKHQTyflSEdIJzi9p/I7hXxKp5WFfYAb562NZ33qlhUCcp9iDKvh/DypWfNJ8GFRoLPFS12GaRZpwMhzXBtp5StB1VuonR2rVvqmwEQrH7fmjCxB+xUfNwo4gje3mU4lzQdumTbo9cRvcXO4bJ/WrTZfKBJpvWAp1p/iP84AGbC0fxshlrEACDgKNpywC1zL43wPr5QNszviWr0zDtBTjCNKz880tCzlxbgBLDk7C1GuSmYGNctdqHRlsLKfoHQZLqsPxMna40xCZc6YL01tHAybGmxaRsgbRFDymyOEL8hZpjxWLiswQMcj26qeBMOQYnqNsAHmvIA1bulSWClfVzmhmTc8nQpPE1I1XLr966koX6HjAQUYF8gGzSw4ro2Fo/NvA5u/9yuaQF7zcLrvZk6VtoRAmbE5VKcI3NksVcHAqo37zkBjkDxMwfJD6M5ECBSuhoZ80bq8pgy4Uw2Wh1nKIK0ZOj88oVUshgOyujYDGkZ0ymexr3JPyi/gQuXgsb8oJR56VxVYYWWJLFJmFHGOaHBrIaHO7O/riDCU1Dh1lyfkACQquUypE+A8AiUBi2QGrWWDXMOA==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(426003)(356005)(7696005)(2616005)(8936002)(4326008)(508600001)(54906003)(86362001)(36756003)(47076005)(336012)(26005)(7636003)(70206006)(316002)(6666004)(70586007)(107886003)(5660300002)(110136005)(186003)(82310400003)(8676002)(2906002)(83380400001)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:58.8559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a811b01-e71a-4a51-6d02-08d99ed13f13
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2844
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
out duplicate updates in MVC driver.

Fixes: e539891f9687 ("ASoC: tegra: Add Tegra210 based MVC driver")
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/tegra/tegra210_mvc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 7b9c700..380686c 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -136,7 +136,7 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value;
-	u8 mute_mask;
+	u8 mute_mask, old_mask;
 	int err;
 
 	pm_runtime_get_sync(cmpnt->dev);
@@ -148,8 +148,16 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,
 	if (err < 0)
 		goto end;
 
+	regmap_read(mvc->regmap, TEGRA210_MVC_CTRL, &value);
+
+	old_mask = (value >> TEGRA210_MVC_MUTE_SHIFT) & TEGRA210_MUTE_MASK_EN;
 	mute_mask = ucontrol->value.integer.value[0];
 
+	if (mute_mask == old_mask) {
+		err = 0;
+		goto end;
+	}
+
 	err = regmap_update_bits(mvc->regmap, mc->reg,
 				 TEGRA210_MVC_MUTE_MASK,
 				 mute_mask << TEGRA210_MVC_MUTE_SHIFT);
@@ -195,7 +203,7 @@ static int tegra210_mvc_put_vol(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int value;
 	u8 chan;
-	int err;
+	int err, old_volume;
 
 	pm_runtime_get_sync(cmpnt->dev);
 
@@ -207,10 +215,16 @@ static int tegra210_mvc_put_vol(struct snd_kcontrol *kcontrol,
 		goto end;
 
 	chan = (reg - TEGRA210_MVC_TARGET_VOL) / REG_SIZE;
+	old_volume = mvc->volume[chan];
 
 	tegra210_mvc_conv_vol(mvc, chan,
 			      ucontrol->value.integer.value[0]);
 
+	if (mvc->volume[chan] == old_volume) {
+		err = 0;
+		goto end;
+	}
+
 	/* Configure init volume same as target volume */
 	regmap_write(mvc->regmap,
 		TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_INIT_VOL, chan),
-- 
2.7.4

