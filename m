Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653FB455544
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:12:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07A1018A6;
	Thu, 18 Nov 2021 08:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07A1018A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219542;
	bh=hkyQ6LrOEu0r0N4VJZh0VRobbIQPXZ4BlrvdIpSPZfU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nvtVNgWTvEYFtUD+8pF/k9g/uWkSw7bBr3OVfPsmAYqH/Yt1D3ir3vtmIaC44UAfl
	 IKuP1S28BiL9AP+mc7zLv6RKnRVSL77GjoichhlqU1CJN+Bq67Az3RAXiSj7wys6m8
	 ze8WPmWN/Pcj+M4gag+gd7STTpr3Mc1gXXhCN7BU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AF76F804F3;
	Thu, 18 Nov 2021 08:08:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED8F3F8053D; Thu, 18 Nov 2021 08:08:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A16F80524
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A16F80524
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="G+nMAuZS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gdx8TQnWmp0h+SA185KQWR97/l9h+OLNx1I2roosy/vc6AmZ4o0GjUjYqmAJpBbySJG724gnKGwyCrQAJB0sB9yjMAXIwNAKnq3GooYo6uOvj52O9NEPgDALdWHg+R7/UJLsNnTN0Tg++zO7VjxRIAjWgLVzq0ksgR71N5AxYZRBsPP1vUV9yi1T5LuobgK+gZ6oYp2r8ijV6oVkAeZZtJiNHFT0zafIgRvcBAT8hPn+EAeNLdAuFUWIcCAMxQX0B7MKYZNRn9wLC8KtWSFuaELsudMeQVzsf6gz11y1gqJk+M46MZsQpFg6XW2PFgFLy79Jm0R/z4F7HWInIih3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qp8apSfahRT9HCiE6++FiVgESKJ4WaZDVtz+XJTCa3Q=;
 b=luFllsprLsXRWDhNtK5BviwYZc6JDs7Vzb3zM6Bonmf0wQhY+IqpuZwMyNQOIXbWoPa4Q4sR1VGm21PFbkTolYld/6ze5UCBHpI/b4qdXV9MQba7u3xQDCWVKuLb8IadHLRmrr5UcxlSW8ZoA1MQjKdm8hkgy3Ys4P8xJ5dbpHeDHQGvH95fz68PIq7zjVuD90ocdl3etRKUis6SJ3Ng0+RvqapwcXSBId73iP1yYV1azZuOJEtyTCKi6vfV+8UE8bnRzpN81+NUEjwcauy9ejpeaKv0Ot8BUeIPnxi9pfmmfZZmIvYKt/TD+bMiIDqZUuJnd7DcPjyTCrB86ARXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qp8apSfahRT9HCiE6++FiVgESKJ4WaZDVtz+XJTCa3Q=;
 b=G+nMAuZSbuFHhNwLNt9c7kk2t31jANGQI5M7G9dfR8n+I5urkRVa1gegCLZkJK6thF8mIujthdILZulv2JLN2+Vc+0C+UUaLu7WH/dfoKVQ3kLcAklpzrfS8uw4JYst9GtS2DzjkHu/GpfxZDcJ7WS/69GA3lqfZw/ENbzqkLvUvXFBmjEZsamZd1s04fdWddJX4JRtOdJsvddqno3oPdCH+9kG7bl0FJv01GbSrk1DtH/G+5bFGHHRpOUkF1brvS2pJpfBxm7T2O16a1IbdGjTfKnbeEXQGYtjmMZA3CTvVsnUQPpCKiqJHxWGZo7sxBo1HEYiOtROfyud0jes5SA==
Received: from BN6PR1701CA0005.namprd17.prod.outlook.com
 (2603:10b6:405:15::15) by BL0PR12MB2465.namprd12.prod.outlook.com
 (2603:10b6:207:45::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 07:08:06 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::6d) by BN6PR1701CA0005.outlook.office365.com
 (2603:10b6:405:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:08:05 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:08:02 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:08:00 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 13/16] ASoC: tegra: Fix kcontrol put callback in SFC
Date: Thu, 18 Nov 2021 12:37:08 +0530
Message-ID: <1637219231-406-14-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f4d4ff1-0f4a-4968-5b47-08d9aa622ae1
X-MS-TrafficTypeDiagnostic: BL0PR12MB2465:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2465B40A6CDA5286C8A4F6D7A79B9@BL0PR12MB2465.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2BCWdyezw35q7uuKOR8G6U+qbITDZyNWIpsDcsJCLhoJ02tWzTqVxenkohujv89nnHerOZ7LwF5f+QPZxfGudF0l2O9iO+A/taLLnCdEE9GrXqANqg+/XJN5h7yI18skjWtNhbZZca4rjsFsc/9+6pEyoZlfTGhd/hqTys+YjglEVKFd2YrOWnhEazRFXRX9/zUqWjaekRHy6l/IB4bz8AIdPAfchynY2IzB4X6axjR9MuA+lxupRsGm8+twR4FT+jwbTze64ljke6j+jxvbuYuOvHDknaaC1+E4I5w7fSLDx3X0kXy3EGI1DzK/HQuPfaai9f7QI/1N/U3imDeGf89alnRnuUOjBBOsFIHMLfhkRBxOLYzNhv1qIc8PJOK7mKE4zyz5V5Nrlap1NPN2ZX6JA3NKpdGfn78XqcAMEedEJNE8S0gWd0anX1hmcpDpVqedyMyDfl9zvwhfYmEQn2uQe2IHWupZrmemfxxTNAY2VRiRtisNL5RAYPhfFFbVAZyZ4+S4nMUCLuPr6aILPiX/ge3tW7LWL3ApCFwoTTBeNw6YHNdo5971lt5K/3G+XlL3uy+JssysSSRmK+c4L1XptvBqqbnzx3GEtQwqHdxH5HCqkBMIHrE7EhtJsj6VsElIUMEazqikTHFtvVGh0G5M4Fg9utLKjkKrni66oPzNlcnbVPg04vdA2SzaezncwijzcxSycM6Vjqh8TEmy7Q==
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(316002)(36756003)(36906005)(7636003)(5660300002)(7696005)(107886003)(26005)(508600001)(186003)(36860700001)(2616005)(8936002)(8676002)(336012)(47076005)(2906002)(82310400003)(54906003)(70206006)(356005)(86362001)(70586007)(110136005)(83380400001)(426003)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:08:05.0885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4d4ff1-0f4a-4968-5b47-08d9aa622ae1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2465
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
 sound/soc/tegra/tegra210_sfc.c | 124 ++++++++++++++++++++++++++++++-----------
 1 file changed, 93 insertions(+), 31 deletions(-)

diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index cb592ef..7a2227e 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3244,49 +3244,107 @@ static int tegra210_sfc_init(struct snd_soc_dapm_widget *w,
 	return tegra210_sfc_write_coeff_ram(cmpnt);
 }
 
-static int tegra210_sfc_get_control(struct snd_kcontrol *kcontrol,
+static int tegra210_sfc_iget_stereo_to_mono(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
 
-	if (strstr(kcontrol->id.name, "Input Stereo To Mono"))
-		ucontrol->value.enumerated.item[0] =
-			sfc->stereo_to_mono[SFC_RX_PATH];
-	else if (strstr(kcontrol->id.name, "Input Mono To Stereo"))
-		ucontrol->value.enumerated.item[0] =
-			sfc->mono_to_stereo[SFC_RX_PATH];
-	else if (strstr(kcontrol->id.name, "Output Stereo To Mono"))
-		ucontrol->value.enumerated.item[0] =
-			sfc->stereo_to_mono[SFC_TX_PATH];
-	else if (strstr(kcontrol->id.name, "Output Mono To Stereo"))
-		ucontrol->value.enumerated.item[0] =
-			sfc->mono_to_stereo[SFC_TX_PATH];
+	ucontrol->value.enumerated.item[0] = sfc->stereo_to_mono[SFC_RX_PATH];
 
 	return 0;
 }
 
-static int tegra210_sfc_put_control(struct snd_kcontrol *kcontrol,
+static int tegra210_sfc_iput_stereo_to_mono(struct snd_kcontrol *kcontrol,
 				    struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
 
-	if (strstr(kcontrol->id.name, "Input Stereo To Mono"))
-		sfc->stereo_to_mono[SFC_RX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Input Mono To Stereo"))
-		sfc->mono_to_stereo[SFC_RX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Output Stereo To Mono"))
-		sfc->stereo_to_mono[SFC_TX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Output Mono To Stereo"))
-		sfc->mono_to_stereo[SFC_TX_PATH] =
-			ucontrol->value.enumerated.item[0];
-	else
+	if (value == sfc->stereo_to_mono[SFC_RX_PATH])
+		return 0;
+
+	sfc->stereo_to_mono[SFC_RX_PATH] = value;
+
+	return 1;
+}
+
+static int tegra210_sfc_iget_mono_to_stereo(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.enumerated.item[0] = sfc->mono_to_stereo[SFC_RX_PATH];
+
+	return 0;
+}
+
+static int tegra210_sfc_iput_mono_to_stereo(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == sfc->mono_to_stereo[SFC_RX_PATH])
+		return 0;
+
+	sfc->mono_to_stereo[SFC_RX_PATH] = value;
+
+	return 1;
+}
+
+static int tegra210_sfc_oget_stereo_to_mono(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.enumerated.item[0] = sfc->stereo_to_mono[SFC_TX_PATH];
+
+	return 0;
+}
+
+static int tegra210_sfc_oput_stereo_to_mono(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == sfc->stereo_to_mono[SFC_TX_PATH])
 		return 0;
 
+	sfc->stereo_to_mono[SFC_TX_PATH] = value;
+
+	return 1;
+}
+
+static int tegra210_sfc_oget_mono_to_stereo(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
+
+	ucontrol->value.enumerated.item[0] = sfc->mono_to_stereo[SFC_TX_PATH];
+
+	return 0;
+}
+
+static int tegra210_sfc_oput_mono_to_stereo(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct tegra210_sfc *sfc = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == sfc->mono_to_stereo[SFC_TX_PATH])
+		return 0;
+
+	sfc->mono_to_stereo[SFC_TX_PATH] = value;
+
 	return 1;
 }
 
@@ -3387,13 +3445,17 @@ static const struct soc_enum tegra210_sfc_mono_conv_enum =
 
 static const struct snd_kcontrol_new tegra210_sfc_controls[] = {
 	SOC_ENUM_EXT("Input Stereo To Mono", tegra210_sfc_stereo_conv_enum,
-		tegra210_sfc_get_control, tegra210_sfc_put_control),
+		     tegra210_sfc_iget_stereo_to_mono,
+		     tegra210_sfc_iput_stereo_to_mono),
 	SOC_ENUM_EXT("Input Mono To Stereo", tegra210_sfc_mono_conv_enum,
-		tegra210_sfc_get_control, tegra210_sfc_put_control),
+		     tegra210_sfc_iget_mono_to_stereo,
+		     tegra210_sfc_iput_mono_to_stereo),
 	SOC_ENUM_EXT("Output Stereo To Mono", tegra210_sfc_stereo_conv_enum,
-		tegra210_sfc_get_control, tegra210_sfc_put_control),
+		     tegra210_sfc_oget_stereo_to_mono,
+		     tegra210_sfc_oput_stereo_to_mono),
 	SOC_ENUM_EXT("Output Mono To Stereo", tegra210_sfc_mono_conv_enum,
-		tegra210_sfc_get_control, tegra210_sfc_put_control),
+		     tegra210_sfc_oget_mono_to_stereo,
+		     tegra210_sfc_oput_mono_to_stereo),
 };
 
 static const struct snd_soc_component_driver tegra210_sfc_cmpnt = {
-- 
2.7.4

