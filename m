Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A58904442CC
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 14:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F191699;
	Wed,  3 Nov 2021 14:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F191699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635947683;
	bh=C2h5Vi5QcbonDICJtnhGSTphXE+1isRJaFsPMOfrBBY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gaZVWLkGhMngGz0jpK5cHtVcowbDjH/PkDmwn3vUPwQeqAK709CNBu4Df/4cjjjiV
	 VByUJchIwSrBJb7Lskd3Ky1MlWP0ORYHrHfG+Le8yjQDomBCMlFtJD0pwkwusn8CQs
	 rIuCkd2+45aFuoynOT+k6xPCZo0smlnt8N3AAq0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF4DF804CA;
	Wed,  3 Nov 2021 14:53:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D806F804CA; Wed,  3 Nov 2021 14:53:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 230E6F80224
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 14:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 230E6F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="q2QE6mJL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQagZ4GC4JG9mjYGENnzQpqDA/uYcoGTh4aZRpQdnxsTrFDF7MfgmvoFD9aWxbMZA2JtTAq1P/14NvuEyOwhbk235CJgSdLW/39YNVn26jC4+3XRDSsM6OT3Ge2Q6eWduqKvhqcEnsFEEEbJ4zKs+Xo3dJLvcm1WKXH5CKJMUzRC4xq3ZlJ3erDVwAMIx82sbdgBgYIpL8vPNHm6e1DG3ELNRYMKRIP4A6BD4voLIghKnfRL3hlIKTxYtc9bVP02/RYXY7AIpOFoR/Awvo/wtb9gPn4zVeFr5svlUPyc4PdWOL6R+I14d7LZOKP/6KOftG9SPIuBPLOk8acbvnZA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2FX+tsXhbe1qqBKVL0Y4eOGaBZ/381SU8qOGjtKF0I=;
 b=VKqKQxAm+2Dbl9FOSHDP5wDH80p3f4UyKsmDtPuXSjjkWrK/jHigP3pJu+DuMuC1sJAsx1/zGyqh0AvE5ISYnRVljwQgGKr5SObmnGW4uG2skY4Ne2806gM+NDkrpGPawxf2wIsUBivyfOiCj9k3KNY3i1rUnRbHW9OdZdbvOWeNgYSfAcr5jqtVz7h0C/p7jM/FWEka/WbkI/2nzud57bpyccC9XBqt78PHPQ2HIhYz7yovfTOKISccg1PTFPnIvzyiosys0FGWnn/jj0rWF3/Ei1q5+bsiLQL6CnOgs7YjJKEr8bBNcCxXes1oq2X4SKIwoMNoNV/vtwNj7wcfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2FX+tsXhbe1qqBKVL0Y4eOGaBZ/381SU8qOGjtKF0I=;
 b=q2QE6mJLbU//3OKtyE2Hns9cMUt3Om8vPN1ff1nhLLLvNYB3QB94g2LqOJxbrQrPuTcwr38kKuNresU+PJILvjfLU9Lal/WoVf/6Uy+A5fk3cxW4i9g4a/pvJOA/xf7GwjBLisqg3sCq0aoPPjqLriTQaiPmfj3fG3imYxpuOwF6F7UNwZADUYB7Rpil8ttCwuZ2UOzBa7CHKFBVATSB66sLI9+BR92yShxBFv3n8Hpxa8nj5S2xBpSB66gkTnCMsNacpS/vR9+W5dd5royCU4wGdzD1p6YquP6vCLpO7N5Pgv9DOS6v5Lm5mDTGvsABLBLG/jA4gR1ThnTJsVHgng==
Received: from BN6PR16CA0020.namprd16.prod.outlook.com (2603:10b6:404:f5::30)
 by DM6PR12MB3674.namprd12.prod.outlook.com (2603:10b6:5:1c4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 13:52:51 +0000
Received: from BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:f5:cafe::99) by BN6PR16CA0020.outlook.office365.com
 (2603:10b6:404:f5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 13:52:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT016.mail.protection.outlook.com (10.13.176.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 13:52:49 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 3 Nov
 2021 06:52:46 -0700
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Wed, 3 Nov 2021 06:52:43 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 02/10] ASoC: tegra: Fix kcontrol put callback in I2S
Date: Wed, 3 Nov 2021 19:22:18 +0530
Message-ID: <1635947547-24391-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
References: <1635947547-24391-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf371f62-3325-41d7-cb39-08d99ed1398c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3674:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3674EB7ECADCF274CDE14355A78C9@DM6PR12MB3674.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a5kqbEX+umr5U+/4yHJKX9nuDNlBWlHdwu6VIpzDomucWvJhbXerPRoN2E1rQkjTj6P8aQGax/wJM5TRyirZpGsF+bGiJb9pQEPAPANkfNi34XOvKxfyTfIh4s5Cn0qGovMG4lXF5WW+aBlqHX+EglnPOMTj8S+SIctk5Y0NY2R5CM54jRqyzbHtGaeqeKF5fEOZRZtAbDkXXJ1+yVDHwjWA0lGCqv3fOq4lIxwz1KB3p6Ek1j4TLHv7+XYnSUk6wU260a3OC/QhqtdvuUcrbpe6AZUuFi+sMy+hhyEqO47ZyvLRlW+Tks+PoPGvcFdzy2293A4/8YCg49IJuepAKNgq/hkn05oO9Jm2jyA+Dlra+k8QDZPOXBViJS/jbuPuzBETj56wXVM9VSU8eJtvCEtX9Z1asACICseux3wEo6eKTMx+Rp+4vspEETH5jJCzZKUhIjB8Efg1JujULxKFLWlqFlWhbzfHQp5t0YTZOCRVuVTheRhpqjRKtI2SFhu+M5cfaPDnjm46UjIdi5s2jOnMwyix/f7ElbMCoXPQzlHb9l/ubZZc/Igx4OlbIItJwTdrkRP4v7w5Vk+7y3SYXVZnCTkdbpSKGLd9SP6WSeRx418i3g+NgP3d/2ND4/i400mgNXPio8wF9Fts3av71H+3TF4m4b4P7ekoPsZf8iR1CjqaJrrc75zN5D0CvYLXAFU5k3DjhBl6lxzS1sPAnw==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(2906002)(336012)(186003)(107886003)(47076005)(70206006)(508600001)(70586007)(356005)(83380400001)(7636003)(2616005)(426003)(7696005)(82310400003)(4326008)(5660300002)(36860700001)(8676002)(36756003)(316002)(54906003)(110136005)(6666004)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 13:52:49.8149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf371f62-3325-41d7-cb39-08d99ed1398c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3674
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
the I2S driver accordingly.

Fixes: c0bfa98349d1 ("ASoC: tegra: Add Tegra210 based I2S driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 45f31cc..70505b5 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -347,6 +347,9 @@ static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
 	int value = ucontrol->value.integer.value[0];
 
 	if (strstr(kcontrol->id.name, "Loopback")) {
+		if (i2s->loopback == value)
+			return 0;
+
 		i2s->loopback = value;
 
 		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
@@ -362,6 +365,9 @@ static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
 		 * cases mixer control is used to update custom values. A value
 		 * of "N" here means, width is "N + 1" bit clock wide.
 		 */
+		if (i2s->fsync_width == value)
+			return 0;
+
 		i2s->fsync_width = value;
 
 		regmap_update_bits(i2s->regmap, TEGRA210_I2S_CTRL,
@@ -369,20 +375,38 @@ static int tegra210_i2s_put_control(struct snd_kcontrol *kcontrol,
 				   i2s->fsync_width << I2S_FSYNC_WIDTH_SHIFT);
 
 	} else if (strstr(kcontrol->id.name, "Capture Stereo To Mono")) {
+		if (i2s->stereo_to_mono[I2S_TX_PATH] == value)
+			return 0;
+
 		i2s->stereo_to_mono[I2S_TX_PATH] = value;
 	} else if (strstr(kcontrol->id.name, "Capture Mono To Stereo")) {
+		if (i2s->mono_to_stereo[I2S_TX_PATH] == value)
+			return 0;
+
 		i2s->mono_to_stereo[I2S_TX_PATH] = value;
 	} else if (strstr(kcontrol->id.name, "Playback Stereo To Mono")) {
+		if (i2s->stereo_to_mono[I2S_RX_PATH] == value)
+			return 0;
+
 		i2s->stereo_to_mono[I2S_RX_PATH] = value;
 	} else if (strstr(kcontrol->id.name, "Playback Mono To Stereo")) {
+		if (i2s->mono_to_stereo[I2S_RX_PATH] == value)
+			return 0;
+
 		i2s->mono_to_stereo[I2S_RX_PATH] = value;
 	} else if (strstr(kcontrol->id.name, "Playback FIFO Threshold")) {
+		if (i2s->rx_fifo_th == value)
+			return 0;
+
 		i2s->rx_fifo_th = value;
 	} else if (strstr(kcontrol->id.name, "BCLK Ratio")) {
+		if (i2s->bclk_ratio == value)
+			return 0;
+
 		i2s->bclk_ratio = value;
 	}
 
-	return 0;
+	return 1;
 }
 
 static int tegra210_i2s_set_timing_params(struct device *dev,
-- 
2.7.4

