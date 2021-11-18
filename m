Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B95455551
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:13:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B64F18E6;
	Thu, 18 Nov 2021 08:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B64F18E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219621;
	bh=C2ajaOIXo0/P9TP4U2dZ676USDjpJp+IyOO5zb8dUVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwCzSSIB3AXrKmXUQ+FP+uA9oFBDC6/QVTgp7gemJuELVzXAZDYHe6J8RwjhEE7ae
	 JIqNJg76sTaug5goh9oaslFYU/87k1wDaH8n+yvlGGZGeHpy/iVvsLovGN1d5A/eCs
	 1Gz+OKMjUChgqfHAoCtgYRr5R+jGxh62naEmGWBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD3E1F804C1;
	Thu, 18 Nov 2021 08:09:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F02DFF804EB; Thu, 18 Nov 2021 08:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FORGED_SPF_HELO,KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9005F804FD
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9005F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="hIEqjhax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lREGkmBrAmYWpf5QYLfOvdEmHd4vXfw73qm/Jub2fJsegEn9Xr8evqkFMhqTBtjYC5GtoETmjAXgBygohzxqlThyjZp05JVVLjICAtoueoMzm4hFkNW6vRSX+OKzxGmKLyumO36rTpUSvb4qhrFCZbK0GA49WZ6e+hUXQoXGZFtOit9RECzesCjO1mMURQFITKL6tZDqdu7i2zjFe7ECQuerqpSLUdSBm/fBPFq9k4kdOAHW8hBq402Ds8G1Sbclxnvy3OHTD6sPSyVlWF6vEARDxOpXYp7uK32ZAbRds+w2Vlqs9ChWIc27QQzE027M97xiRMYA0HA6YXA0pv8eCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Qkb2ZDWYZx09hj7ENpj87i6yIgDCWrhrk3FPS4BLYY=;
 b=ACWB7hwpfd5jcwl4pomqCjz+wpI2jvoUcz12U8A6dWAFWjuif/9Jqv5GE4oXJgOPr3mOU3L30enKKdImL4ftbVsJEFmqk+M2oa+5rkUufmKs5ho1BK4lv+eCPjoB9o07nwuC0RzVeQcXy5AIGmRll5GTxbZqsc5XDrtqhNTRjO+MRbxHHpSo2PG/XgJyKiczV9Ofr+sXCWxd+OG5DOQJlcvtPB8vfaPc0evWDypOMU7evPpIw5EesqoX2PDtmMxurGtG9yjuANsIC5lDCF3qCGStV9MBBu4IpGV3zymWJ9dA3aefS6s8oJTI8L+pFgJ1BbcW1tYcpPEfTkZ18NRwbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Qkb2ZDWYZx09hj7ENpj87i6yIgDCWrhrk3FPS4BLYY=;
 b=hIEqjhaxM43EpL7InFRAXTtTnAprc8kBsdolOv+S748KhTjx+ux0A53aTrR0J8XrIO7sSRoQFTAEIiDAFSADzY+YLadPDycaispn3l8Nhxp32+qsaSPLXTtqM03TCSJWCLQ6TS3VffVsGHB014WKTloKjNeq+1+mB/1D3uWQbNvrIX+jgIjH25UkFugA59zMp/JwG47cW1drKkbVKCmNRogaz2jIXLQFofr2SdYImZ1hGTvr1ViwSvcQjLfW2Zw5VkqwMaddBMMnRiNtOxfuICm8/8jyXRmHMykZhLz4OuxDoJLqTDciXdoEIwzbRlDjEiCnpEvtkYrQsx+yd2j0ug==
Received: from BN8PR03CA0008.namprd03.prod.outlook.com (2603:10b6:408:94::21)
 by DM5PR1201MB0092.namprd12.prod.outlook.com (2603:10b6:4:54::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 07:07:47 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::d1) by BN8PR03CA0008.outlook.office365.com
 (2603:10b6:408:94::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:45 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:45 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:42 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 07/16] ASoC: tegra: Fix kcontrol put callback in ADMAIF
Date: Thu, 18 Nov 2021 12:37:02 +0530
Message-ID: <1637219231-406-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db956fe3-5e82-4d2c-a713-08d9aa621f8b
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0092:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00923400C7E816646BB4E9B9A79B9@DM5PR1201MB0092.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/+y7Az5rT8VEp9i9OCRti5o0ZPsfA5jQEW5tnJiV5WycRYE0DDVMnY9NVP43E/Nqwqn8Ma/vZsV7QkLVsJScwGOkohFytAUK0yiVZ7AMw7ZZ3oixXGOfYNBRZj+qX4+LdIbNQJriXyCggNux0DJYsag+CnhFP4EeDvlh8SvJpGsuPcF95EcEVbCDxt+2LjlUg3zU8OOuNpcyk3ci9hpnUVgvFlcN4d56fR9p0C+5Pq7uQiHX8/albwOjH6c+MoiWJ4GbFZRW3zluZsepv+EgqpBzDPoj1BhTSf4RSuW2pjRoQYILnHdWX+x0ZaIhlOBbEWjlRUNI4PnANYA9mMvnSgM24pO/UU/6RjCQbz1ZuK1crP0/qyACf7UE2uQUjfYH+Ef1xL0BkuSNKFEGVU2/ZwEfhLY/7/1ac7gbNijPr3aaB8b53Y9Hs7BKz5BBUgCBcFkDkLtPWgaXq89ZGGJkhtzULdhJgGsCnUjC8huZsuPln2EpP3qF4Yl2FieZATZ52On4kNh3rVnseOWcmk+x+RnCk2ySriiXfs8d2y5VQAe3T+BjOujckz4ayG+YxwK8SaM56eyB83pFikZP4JevMmU6XhXokL2oT5ALlRLr3AzloEN1yDghOd3th2Fd4O7rRaJ+/AJJUhWvX2YNyq7usGFa8iWxqYYIrTwJDV9Fcn+O0PyRxNd06S1YO49mQOhVInfjLUmI3ze5rXEfEawaQ==
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8936002)(336012)(8676002)(82310400003)(110136005)(426003)(83380400001)(70586007)(86362001)(36756003)(26005)(36860700001)(186003)(47076005)(6666004)(7696005)(2616005)(4326008)(54906003)(316002)(36906005)(5660300002)(508600001)(7636003)(107886003)(356005)(70206006)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:45.9110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db956fe3-5e82-4d2c-a713-08d9aa621f8b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0092
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
the ADMAIF driver accordingly.

Fixes: f74028e159bb ("ASoC: tegra: Add Tegra210 based ADMAIF driver")
Suggested-by: Jaroslav Kysela <perex@perex.cz>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_admaif.c | 138 ++++++++++++++++++++++++++++++--------
 1 file changed, 109 insertions(+), 29 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 6febe80..1a2e868 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -424,46 +424,122 @@ static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
 	.trigger	= tegra_admaif_trigger,
 };
 
-static int tegra_admaif_get_control(struct snd_kcontrol *kcontrol,
-				    struct snd_ctl_elem_value *ucontrol)
+static int tegra210_admaif_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+
+	ucontrol->value.enumerated.item[0] =
+		admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg];
+
+	return 0;
+}
+
+static int tegra210_admaif_pput_mono_to_stereo(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
-	unsigned int *uctl_val = &ucontrol->value.enumerated.item[0];
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	unsigned int value = ucontrol->value.enumerated.item[0];
 
-	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
-		*uctl_val = admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg];
-	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
-		*uctl_val = admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg];
-	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
-		*uctl_val = admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg];
-	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
-		*uctl_val = admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg];
+	if (value == admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg])
+		return 0;
+
+	admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
+
+	return 1;
+}
+
+static int tegra210_admaif_cget_mono_to_stereo(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+
+	ucontrol->value.enumerated.item[0] =
+		admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg];
 
 	return 0;
 }
 
-static int tegra_admaif_put_control(struct snd_kcontrol *kcontrol,
-				    struct snd_ctl_elem_value *ucontrol)
+static int tegra210_admaif_cput_mono_to_stereo(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg])
+		return 0;
+
+	admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] = value;
+
+	return 1;
+}
+
+static int tegra210_admaif_pget_stereo_to_mono(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+
+	ucontrol->value.enumerated.item[0] =
+		admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg];
+
+	return 0;
+}
+
+static int tegra210_admaif_pput_stereo_to_mono(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 	unsigned int value = ucontrol->value.enumerated.item[0];
 
-	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
-		admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
-	else if (strstr(kcontrol->id.name, "Capture Mono To Stereo"))
-		admaif->mono_to_stereo[ADMAIF_RX_PATH][ec->reg] = value;
-	else if (strstr(kcontrol->id.name, "Playback Stereo To Mono"))
-		admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
-	else if (strstr(kcontrol->id.name, "Capture Stereo To Mono"))
-		admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
+	if (value == admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg])
+		return 0;
+
+	admaif->stereo_to_mono[ADMAIF_TX_PATH][ec->reg] = value;
+
+	return 1;
+}
+
+static int tegra210_admaif_cget_stereo_to_mono(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+
+	ucontrol->value.enumerated.item[0] =
+		admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg];
 
 	return 0;
 }
 
+static int tegra210_admaif_cput_stereo_to_mono(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg])
+		return 0;
+
+	admaif->stereo_to_mono[ADMAIF_RX_PATH][ec->reg] = value;
+
+	return 1;
+}
+
 static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
@@ -559,17 +635,21 @@ static const char * const tegra_admaif_mono_conv_text[] = {
 }
 
 #define TEGRA_ADMAIF_CIF_CTRL(reg)					       \
-	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Mono To Stereo", reg - 1,\
-			tegra_admaif_get_control, tegra_admaif_put_control,    \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Mono To Stereo", reg - 1,     \
+			tegra210_admaif_pget_mono_to_stereo,		       \
+			tegra210_admaif_pput_mono_to_stereo,		       \
 			tegra_admaif_mono_conv_text),			       \
-	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Stereo To Mono", reg - 1,\
-			tegra_admaif_get_control, tegra_admaif_put_control,    \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Playback Stereo To Mono", reg - 1,     \
+			tegra210_admaif_pget_stereo_to_mono,		       \
+			tegra210_admaif_pput_stereo_to_mono,		       \
 			tegra_admaif_stereo_conv_text),			       \
-	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Mono To Stereo", reg - 1, \
-			tegra_admaif_get_control, tegra_admaif_put_control,    \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Mono To Stereo", reg - 1,      \
+			tegra210_admaif_cget_mono_to_stereo,		       \
+			tegra210_admaif_cput_mono_to_stereo,		       \
 			tegra_admaif_mono_conv_text),			       \
-	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Stereo To Mono", reg - 1, \
-			tegra_admaif_get_control, tegra_admaif_put_control,    \
+	NV_SOC_ENUM_EXT("ADMAIF" #reg " Capture Stereo To Mono", reg - 1,      \
+			tegra210_admaif_cget_stereo_to_mono,		       \
+			tegra210_admaif_cput_stereo_to_mono,		       \
 			tegra_admaif_stereo_conv_text)
 
 static struct snd_kcontrol_new tegra210_admaif_controls[] = {
-- 
2.7.4

