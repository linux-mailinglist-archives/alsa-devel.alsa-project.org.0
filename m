Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433E645553E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEABA18A6;
	Thu, 18 Nov 2021 08:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEABA18A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219474;
	bh=ENfUTimaxCbiVl5o7uSL9/WyanVBBlvEpIgsBmPQhB0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jh48EgWEnLiP1T65IeZQU8aOhGckn08I9GFk1LUrhuy8tZYkU6W+mJxWjzavFB1z9
	 e/ZeVom3/VsKUQCPP9807VPe0qyhZKy7dGCC6FpGhZhNqOk5RbhLhKUqXulp2N8/jS
	 Mthx57FDmT/VtwOAIYiXDSh5w7gr/gX1c0DhuOuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C8BF80533;
	Thu, 18 Nov 2021 08:08:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26803F8052E; Thu, 18 Nov 2021 08:08:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FORGED_SPF_HELO,KHOP_HELO_FCRDNS,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C424CF804DF
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C424CF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="BvqoLZ3Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVVz2BUZ1AYJP3ynRSpXN2mmxuVR9EvXXQJaCvGBE47KQ6l5Oa4qAY9tm1IZeqSF33lqPVq2Omx1gZg5102rjGd5ZWlqowKlgTfTVP1/OXfRz4wossw1XQ6ggr/OpxIyJN6A5sTiD9Uf9A7lZSviopNjDDms3tdqa0/66NSkJ00YnuUcKonVzBk1A03ZW3EK3TJerU79NnTm9a7D/CcoCl8paikCIGkamhrvKOnMgRGkWSDV2ZKtrElTr55ZmEZ4/NCrkXeWGKcAqVbFOF/Rm/vH4bFZ+/h8qWmef3C3tGgV7nwlkw9Pq0GcZk21fwW4PDZnhKIFiDybvtnWJnt1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EyzUBn0C50ScRpxCiSjR/hwHCTAIwl7ZGwCwMD4AjA=;
 b=Fuk22ysly6FwJQ/efI/yUx5qtWMPGf4M3HK0UEr8djVPRYmvtMjVSYmyGXBcsj5Wg50OAL19QNXxUw4Z94Rn646DYIekKGTVM63kCVCn1VrSAlElIiehEA4AauwOoSWNxheLEJhvKkKngn6CVyGElbi/B/4tYJ1U9AGk4fhh0m+dWG1lM2v9Rz7xNvlguRQZETRepZ9haPBQ6kPT8IHZMtwt5ewllWgamoOLks7kKPsJpenZqMUaQEPbpZD9U60XKO2D7s/7GGEmO8LDWa3+GFLBsviat2Sqhz1iWcaE4eBnUGzrALGy/czkI4z6DB8n8taw+wimcSCC8x41g83yJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EyzUBn0C50ScRpxCiSjR/hwHCTAIwl7ZGwCwMD4AjA=;
 b=BvqoLZ3Qh24RTLR9wjwnpacqkwhOra0RtgdwZBYyXol4RmVLMkxIaX2ZUjqQR2wg1FIdtPa7zwAGdTeuDZZrBAugV3nG7PHsAqH3liVdCTD2x9oHKabwRueASBtkGGcOM7Mjnbio/DvDs53giNIULSzzaw1xz2aqUBxsGh4ZIZzGypUOjORXYFxYCu6REVo/pBEqy1/7SbjxrRi5SzQHTJN4/Rl+uVUrVybrw+S2zOi6fQirjqyLzxSE1y72WlvpF80KHhNFhHNWvxTlK+HfS6CO4beGxUCiqnAC/26VfsDJ2+6nF50dh8sS4q6NdA/CqR6DZWcvgkIR9wlRU/y20g==
Received: from BN9PR03CA0809.namprd03.prod.outlook.com (2603:10b6:408:13f::34)
 by CH2PR12MB3734.namprd12.prod.outlook.com (2603:10b6:610:2a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:07:55 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::a2) by BN9PR03CA0809.outlook.office365.com
 (2603:10b6:408:13f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:54 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 23:07:54 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 07:07:53 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:51 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 10/16] ASoC: tegra: Fix kcontrol put callback in DSPK
Date: Thu, 18 Nov 2021 12:37:05 +0530
Message-ID: <1637219231-406-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5925f29f-87ba-467a-5281-08d9aa6224d1
X-MS-TrafficTypeDiagnostic: CH2PR12MB3734:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3734627ED8B85CDE548C090BA79B9@CH2PR12MB3734.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 331NgMp502owJZ3fl/lm4+gS0mVMMqas3NS/e/lJ0aNQTnQWXjK2nwLcpyAzHGPT5Du18E7M5RrrWNnAB17dBL5bCEEDCyLOOvJJO1yvv12GX7a5/PEkUuSKWZuvw86BrmRrjp7ur7KH9zU5pUsPmIM3zxLRhCyCnK2Jh4bRwtRPyckgolnjjvkjVKYjl/SBLUFshhPkRXMInwtoyENe71KOtzyCEfl4Dl/QgBmmHKefkPkMDhNyphixJOuoSNvCu/yH3mZlm2qj0HqF6tSSpvTUUOCmdqq/g4IOnZCiiqeMlQfbhTWrk/5WuQZlq2RYH2xSz36GMhlRxez9hmTwpjiWrZFfYgYxWIOfzF+8M6ft82dXXcLbrzSamhyh5Cj8JAzRmUn4cMZJDG1WGGWHYpBCCPDiI7cZxMlbMsH/s5/rxT3iTp3/q9Wtt7ch0XgP/3mMEvGqx/p3x4PpfM22q8qU66Uavqele+Z7YdOIIaO9n51p2srVwKjDD9v1hpN7KF8LZDnEqc4JbSDYBDE05stVuv1Fe94pt7ubPKYJMh/3Dc5PA3Y9E9GR1Z9D22hhFoq/aU9pyctByZ2i/jG+1glScYDC9otB/YPctrslX21Sx5T4Kuje0hmrbhLZPN7rt2ELfkr+BVKvOLIdZKQTr4JWFCfd/VJo1EzJ+EG5v6kRoJJuwANB6YlavhDmBkKfSwQME5a1j3L95LQMSh7h9A==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(26005)(5660300002)(8676002)(2906002)(107886003)(6666004)(8936002)(36756003)(2616005)(82310400003)(426003)(7696005)(4326008)(316002)(186003)(336012)(86362001)(356005)(47076005)(7636003)(110136005)(508600001)(70586007)(54906003)(83380400001)(36860700001)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:54.9171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5925f29f-87ba-467a-5281-08d9aa6224d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3734
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
 sound/soc/tegra/tegra186_dspk.c | 178 ++++++++++++++++++++++++++++++++--------
 1 file changed, 146 insertions(+), 32 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 67269e7..a74c980 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -26,50 +26,162 @@ static const struct reg_default tegra186_dspk_reg_defaults[] = {
 	{ TEGRA186_DSPK_CODEC_CTRL,  0x03000000 },
 };
 
-static int tegra186_dspk_get_control(struct snd_kcontrol *kcontrol,
+static int tegra186_dspk_get_fifo_th(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
 
-	if (strstr(kcontrol->id.name, "FIFO Threshold"))
-		ucontrol->value.integer.value[0] = dspk->rx_fifo_th;
-	else if (strstr(kcontrol->id.name, "OSR Value"))
-		ucontrol->value.enumerated.item[0] = dspk->osr_val;
-	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		ucontrol->value.enumerated.item[0] = dspk->lrsel;
-	else if (strstr(kcontrol->id.name, "Channel Select"))
-		ucontrol->value.enumerated.item[0] = dspk->ch_sel;
-	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		ucontrol->value.enumerated.item[0] = dspk->mono_to_stereo;
-	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		ucontrol->value.enumerated.item[0] = dspk->stereo_to_mono;
+	ucontrol->value.integer.value[0] = dspk->rx_fifo_th;
 
 	return 0;
 }
 
-static int tegra186_dspk_put_control(struct snd_kcontrol *kcontrol,
+static int tegra186_dspk_put_fifo_th(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
 	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+	int value = ucontrol->value.integer.value[0];
 
-	if (strstr(kcontrol->id.name, "FIFO Threshold"))
-		dspk->rx_fifo_th = ucontrol->value.integer.value[0];
-	else if (strstr(kcontrol->id.name, "OSR Value"))
-		dspk->osr_val = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
-		dspk->lrsel = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Channel Select"))
-		dspk->ch_sel = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Mono To Stereo"))
-		dspk->mono_to_stereo = ucontrol->value.enumerated.item[0];
-	else if (strstr(kcontrol->id.name, "Stereo To Mono"))
-		dspk->stereo_to_mono = ucontrol->value.enumerated.item[0];
+	if (value == dspk->rx_fifo_th)
+		return 0;
+
+	dspk->rx_fifo_th = value;
+
+	return 1;
+}
+
+static int tegra186_dspk_get_osr_val(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.enumerated.item[0] = dspk->osr_val;
+
+	return 0;
+}
+
+static int tegra186_dspk_put_osr_val(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dspk->osr_val)
+		return 0;
+
+	dspk->osr_val = value;
+
+	return 1;
+}
+
+static int tegra186_dspk_get_pol_sel(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.enumerated.item[0] = dspk->lrsel;
+
+	return 0;
+}
+
+static int tegra186_dspk_put_pol_sel(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dspk->lrsel)
+		return 0;
+
+	dspk->lrsel = value;
+
+	return 1;
+}
+
+static int tegra186_dspk_get_ch_sel(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.enumerated.item[0] = dspk->ch_sel;
+
+	return 0;
+}
+
+static int tegra186_dspk_put_ch_sel(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dspk->ch_sel)
+		return 0;
+
+	dspk->ch_sel = value;
+
+	return 1;
+}
+
+static int tegra186_dspk_get_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.enumerated.item[0] = dspk->mono_to_stereo;
+
+	return 0;
+}
+
+static int tegra186_dspk_put_mono_to_stereo(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dspk->mono_to_stereo)
+		return 0;
+
+	dspk->mono_to_stereo = value;
+
+	return 1;
+}
+
+static int tegra186_dspk_get_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.enumerated.item[0] = dspk->stereo_to_mono;
 
 	return 0;
 }
 
+static int tegra186_dspk_put_stereo_to_mono(struct snd_kcontrol *kcontrol,
+					    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct tegra186_dspk *dspk = snd_soc_component_get_drvdata(codec);
+	unsigned int value = ucontrol->value.enumerated.item[0];
+
+	if (value == dspk->stereo_to_mono)
+		return 0;
+
+	dspk->stereo_to_mono = value;
+
+	return 1;
+}
+
 static int __maybe_unused tegra186_dspk_runtime_suspend(struct device *dev)
 {
 	struct tegra186_dspk *dspk = dev_get_drvdata(dev);
@@ -278,17 +390,19 @@ static const struct soc_enum tegra186_dspk_lrsel_enum =
 static const struct snd_kcontrol_new tegrat186_dspk_controls[] = {
 	SOC_SINGLE_EXT("FIFO Threshold", SND_SOC_NOPM, 0,
 		       TEGRA186_DSPK_RX_FIFO_DEPTH - 1, 0,
-		       tegra186_dspk_get_control, tegra186_dspk_put_control),
+		       tegra186_dspk_get_fifo_th, tegra186_dspk_put_fifo_th),
 	SOC_ENUM_EXT("OSR Value", tegra186_dspk_osr_enum,
-		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+		     tegra186_dspk_get_osr_val, tegra186_dspk_put_osr_val),
 	SOC_ENUM_EXT("LR Polarity Select", tegra186_dspk_lrsel_enum,
-		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+		     tegra186_dspk_get_pol_sel, tegra186_dspk_put_pol_sel),
 	SOC_ENUM_EXT("Channel Select", tegra186_dspk_ch_sel_enum,
-		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+		     tegra186_dspk_get_ch_sel, tegra186_dspk_put_ch_sel),
 	SOC_ENUM_EXT("Mono To Stereo", tegra186_dspk_mono_conv_enum,
-		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+		     tegra186_dspk_get_mono_to_stereo,
+		     tegra186_dspk_put_mono_to_stereo),
 	SOC_ENUM_EXT("Stereo To Mono", tegra186_dspk_stereo_conv_enum,
-		     tegra186_dspk_get_control, tegra186_dspk_put_control),
+		     tegra186_dspk_get_stereo_to_mono,
+		     tegra186_dspk_put_stereo_to_mono),
 };
 
 static const struct snd_soc_component_driver tegra186_dspk_cmpnt = {
-- 
2.7.4

