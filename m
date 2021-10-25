Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E543947C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 13:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02ADE16C1;
	Mon, 25 Oct 2021 13:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02ADE16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635160094;
	bh=gSy7o+7zmDB2sokrNdmAXlNi0TTvwK4KjtPYVksVQ+8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YZ2HI5YmmZFK0RfcMKpbK4Q5cKayuA8W+cgeOc3wY7I7klpKfrbjvNdZb9Ty8nDfx
	 Jz+jigqPkdWxfhef30eHfTVo7QkyxrPpXcjJ7FkW8ppt7ZbQIPCCNiSFCqO+hhR2L5
	 /QI4nhQyDWvr3x544F9hOgVFVqIHgOKCJrUbeIow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A022F8025E;
	Mon, 25 Oct 2021 13:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A535EF8025A; Mon, 25 Oct 2021 13:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F637F80153
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 13:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F637F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="umYtPBKk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+kB/dugaTQcraMu+MNJ18nfb1LKsm9RqyNeqyLrMMqnhFYp0xQoSojRGM0W/pWa0NJuba1XgYcBmFAc52OX09wrbwznLRLswI7le7DUWyzbrSNo5zFyv9XN4T9U8FWpjbpqliXhaVh361ekyMQIyzUAUUGzBlRyY4o4gV1LHwJw9DeArz4CaPWHGIqbFy/a18h7ClcpgUh/Kusb4zFpYsWnBAZ6kK5+DYbd4h8iSA2FoYifbfhIdDVSUjo7RbRUiKVfU7f9b8MSmPaMdi4RON0RZ7NMN94Rsc48NpifbDSK0f68ARB5OUwKucd/I4B4Y5K2zO6KvbBFnn36oM3oDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Rc06ufQdIBpzQwyKPOx3ry98XFZRZHDpzcxyFx0y70=;
 b=Oo4rgn6J/FCoTmkTyEsWEujcjRFYE8/4OgtMQjFOCee9NK0Rc7nCJk/QNWSCMcG9izQb9ouC84627ITiKkV6ZDjsvDdX37zyyFWziCeJV1iiqIcmC6INeevd/Vsn1weWLgG5jxJGfYjovAq0F7EOJQNHXeEDsiG8kQn1PDcxonrQCbWLWKWMJ6seU/dn++48xPsHgFK+9vMXyfq1joaYY0iMwImukjqcNfQR1k8H0zwAf2R6mCc1FHxv1RoI8T4qZukvHPd2LtDzGGX4EacQF9r1IXUQNwMi7BRxnbwPlDVld8O0hsaK9P4YRZc/ZRIdKIXTddPlBnAcAp83W5TF8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Rc06ufQdIBpzQwyKPOx3ry98XFZRZHDpzcxyFx0y70=;
 b=umYtPBKkEeSKqxUSFJw2CAdXFQ/x5Y+lbk7Po9eX6okTMp1VvyeNetpOLlOcHLCt5O825f4G3ur8Xvto/Y1+wdg53m6YUUORXew+7jUPzq0fbazZDX0BcbIi7W8CXZBbXZ7NY8aaYPyloN9jJxoDOQRGRS1bA2wvRzk0QnKxmOzbYRS96HriEY9vzWj/UgkNu5cSLm79EY9ban/JUidyINHAn7CMk1Mxf3AlXjq4Yq6K3uTPK0gnnHVwzVP8XCQIL1O2srB/X0MOYuV1AgxywLbPgSIJ4FhOPYawZ4DU+/1HnJXxLtswUIAKAuWVQC3J2AVFhMWYNbWEXbJDckatMg==
Received: from MW4PR03CA0139.namprd03.prod.outlook.com (2603:10b6:303:8c::24)
 by BN6PR12MB1378.namprd12.prod.outlook.com (2603:10b6:404:1e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 11:06:42 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::76) by MW4PR03CA0139.outlook.office365.com
 (2603:10b6:303:8c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Mon, 25 Oct 2021 11:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 11:06:40 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 25 Oct
 2021 04:06:38 -0700
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Mon, 25 Oct 2021 04:06:36 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH] ASoC: tegra: Add master volume/mute control support
Date: Mon, 25 Oct 2021 16:36:16 +0530
Message-ID: <1635159976-17355-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19d1ac5f-a7ac-4510-9de2-08d997a785a4
X-MS-TrafficTypeDiagnostic: BN6PR12MB1378:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1378E4F53C212C2450F63D94A7839@BN6PR12MB1378.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xKaCWOOYmVgdw55pPNYJpXGyirlsc3xRAAb1Ld1trMxDzOBNX2+mM4T3nLQLqsxzOBBf1zkEpl1KMRYd5oB2TyH9IIfEgjrD400ytlvG7EzaSUoQvdMDUHYw6MyTpDKnkwzuP2kvAXJaxrtFL+UwPdffY5yV1sqbfdIL/lS8tPdVEucCkxVa3FA5w7Dgnd6CgXb46L0JFAzj5hH6zF/l/v9JfuAHzf0hFInnkOYEwqgi3b9QE11Q4W8GpMPC+05OBmklz9VkwXGcFGx9XjjXxDNeQc/pcAy/qnHoyw6wYQFBCeBPIebdHpEbJ4RoXm7uL2rLU0yLhm9IZSLNdh+DhclOPGGNGBlB5RWghunO25HHkR4dGmCwo2jLJdTxnlM6Rptd4ZplRETQlhSudRofG1Ukdr/a6ymwkPDovNerPfLth+E5uib3PJLa2jrutA2/m0+NnB87UevLIhSaQbhhZZlSoYNB6L0aflP9FRJ+88BovtXRi5/NoWvDwDNXz3yjcHkmfS6GqNGa+rftuwYPOTna9OTPoBhRv9J6qxaPLq4DDIlPuY00yhoWKI6gwTrlgZ8TwPmZz0Uy4JY7bMIBYzHLcJMHi695vfkLbZIwWa9kdtIGeXfH/YlNRSnOYlWLiEQY87VJAXXJoN/AhUhCxeqK6HPPq5CI9S/cSZjOkTdadolN/db9xmUduAWsooQieoOufn33S7kgKVwLIhh7Wg==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(54906003)(110136005)(83380400001)(107886003)(2906002)(186003)(26005)(82310400003)(70586007)(5660300002)(356005)(8676002)(7636003)(2616005)(36860700001)(8936002)(70206006)(4326008)(86362001)(316002)(47076005)(36756003)(7696005)(6666004)(508600001)(426003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 11:06:40.6037 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d1ac5f-a7ac-4510-9de2-08d997a785a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1378
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

The MVC module has a per channel control bit, based on which it decides
to apply channel specific volume/mute settings. When per channel control
bit is enabled (which is the default HW configuration), all MVC channel
volume/mute can be independently controlled. If the control is disabled,
channel-0 volume/mute setting is applied by HW to all remaining channels.
Thus add support to leverage this HW feature by exposing master controls
for volume/mute.

With this, now there are per channel and master volume/mute controls.
Users need to just use controls which are suitable for their applications.
The per channel control enable/disable is mananged in driver and hidden
from users, so that they need to just worry about respective volume/mute
controls.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_mvc.c | 95 +++++++++++++++++++++++++++++++++++++-----
 sound/soc/tegra/tegra210_mvc.h |  2 +
 2 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 7b9c700..40cd21a 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -123,7 +123,42 @@ static int tegra210_mvc_get_mute(struct snd_kcontrol *kcontrol,
 	mute_mask = (val >>  TEGRA210_MVC_MUTE_SHIFT) &
 		TEGRA210_MUTE_MASK_EN;
 
-	ucontrol->value.integer.value[0] = mute_mask;
+	if (strstr(kcontrol->id.name, "Per Chan Mute Mask")) {
+		/*
+		 * If per channel control is enabled, then return
+		 * exact mute/unmute setting of all channels.
+		 *
+		 * Else report setting based on CH0 bit to reflect
+		 * the correct HW state.
+		 */
+		if (val & TEGRA210_MVC_PER_CHAN_CTRL_EN) {
+			ucontrol->value.integer.value[0] = mute_mask;
+		} else {
+			if (mute_mask & TEGRA210_MVC_CH0_MUTE_EN)
+				ucontrol->value.integer.value[0] =
+					TEGRA210_MUTE_MASK_EN;
+			else
+				ucontrol->value.integer.value[0] = 0;
+		}
+	} else {
+		/*
+		 * If per channel control is disabled, then return
+		 * master mute/unmute setting based on CH0 bit.
+		 *
+		 * Else report settings based on state of all
+		 * channels.
+		 */
+		if (!(val & TEGRA210_MVC_PER_CHAN_CTRL_EN)) {
+			ucontrol->value.integer.value[0] =
+				mute_mask & TEGRA210_MVC_CH0_MUTE_EN;
+		} else {
+			if (mute_mask == TEGRA210_MUTE_MASK_EN)
+				ucontrol->value.integer.value[0] =
+					TEGRA210_MVC_CH0_MUTE_EN;
+			else
+				ucontrol->value.integer.value[0] = 0;
+		}
+	}
 
 	return 0;
 }
@@ -136,6 +171,7 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct tegra210_mvc *mvc = snd_soc_component_get_drvdata(cmpnt);
 	unsigned int value;
+	u32 reg_mask;
 	u8 mute_mask;
 	int err;
 
@@ -150,11 +186,22 @@ static int tegra210_mvc_put_mute(struct snd_kcontrol *kcontrol,
 
 	mute_mask = ucontrol->value.integer.value[0];
 
-	err = regmap_update_bits(mvc->regmap, mc->reg,
-				 TEGRA210_MVC_MUTE_MASK,
-				 mute_mask << TEGRA210_MVC_MUTE_SHIFT);
-	if (err < 0)
-		goto end;
+	if (strstr(kcontrol->id.name, "Per Chan Mute Mask")) {
+		regmap_update_bits(mvc->regmap, TEGRA210_MVC_CTRL,
+				   TEGRA210_MVC_PER_CHAN_CTRL_EN_MASK,
+				   TEGRA210_MVC_PER_CHAN_CTRL_EN);
+
+		reg_mask = TEGRA210_MVC_MUTE_MASK;
+	} else {
+		regmap_update_bits(mvc->regmap, TEGRA210_MVC_CTRL,
+				   TEGRA210_MVC_PER_CHAN_CTRL_EN_MASK,
+				   0);
+
+		reg_mask = TEGRA210_MVC_CH0_MUTE_MASK;
+	}
+
+	regmap_update_bits(mvc->regmap, mc->reg, reg_mask,
+			   mute_mask << TEGRA210_MVC_MUTE_SHIFT);
 
 	return 1;
 
@@ -212,11 +259,31 @@ static int tegra210_mvc_put_vol(struct snd_kcontrol *kcontrol,
 			      ucontrol->value.integer.value[0]);
 
 	/* Configure init volume same as target volume */
-	regmap_write(mvc->regmap,
-		TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_INIT_VOL, chan),
-		mvc->volume[chan]);
+	if (strstr(kcontrol->id.name, "Channel")) {
+		regmap_update_bits(mvc->regmap, TEGRA210_MVC_CTRL,
+				   TEGRA210_MVC_PER_CHAN_CTRL_EN_MASK,
+				   TEGRA210_MVC_PER_CHAN_CTRL_EN);
+
+		regmap_write(mvc->regmap,
+			TEGRA210_MVC_REG_OFFSET(TEGRA210_MVC_INIT_VOL, chan),
+			mvc->volume[chan]);
+
+		regmap_write(mvc->regmap, reg, mvc->volume[chan]);
+	} else {
+		int i;
+
+		regmap_update_bits(mvc->regmap, TEGRA210_MVC_CTRL,
+				   TEGRA210_MVC_PER_CHAN_CTRL_EN_MASK,
+				   0);
+
+		for (i = 1; i < TEGRA210_MVC_MAX_CHAN_COUNT; i++)
+			mvc->volume[i] = mvc->volume[0];
 
-	regmap_write(mvc->regmap, reg, mvc->volume[chan]);
+		regmap_write(mvc->regmap, TEGRA210_MVC_INIT_VOL,
+			     mvc->volume[0]);
+
+		regmap_write(mvc->regmap, reg, mvc->volume[0]);
+	}
 
 	regmap_update_bits(mvc->regmap, TEGRA210_MVC_SWITCH,
 			   TEGRA210_MVC_VOLUME_SWITCH_MASK,
@@ -422,6 +489,14 @@ static const struct snd_kcontrol_new tegra210_mvc_vol_ctrl[] = {
 		       TEGRA210_MVC_CTRL, 0, TEGRA210_MUTE_MASK_EN, 0,
 		       tegra210_mvc_get_mute, tegra210_mvc_put_mute),
 
+	/* Master volume */
+	SOC_SINGLE_EXT("Volume", TEGRA210_MVC_TARGET_VOL, 0, 16000, 0,
+		       tegra210_mvc_get_vol, tegra210_mvc_put_vol),
+
+	/* Master mute */
+	SOC_SINGLE_EXT("Mute", TEGRA210_MVC_CTRL, 0, 1, 0,
+		       tegra210_mvc_get_mute, tegra210_mvc_put_mute),
+
 	SOC_ENUM_EXT("Curve Type", tegra210_mvc_curve_type_ctrl,
 		     tegra210_mvc_get_curve_type, tegra210_mvc_put_curve_type),
 };
diff --git a/sound/soc/tegra/tegra210_mvc.h b/sound/soc/tegra/tegra210_mvc.h
index def29c4..7f2567e 100644
--- a/sound/soc/tegra/tegra210_mvc.h
+++ b/sound/soc/tegra/tegra210_mvc.h
@@ -59,6 +59,8 @@
 #define TEGRA210_MUTE_MASK_EN			0xff
 #define TEGRA210_MVC_MUTE_MASK			(TEGRA210_MUTE_MASK_EN << TEGRA210_MVC_MUTE_SHIFT)
 #define TEGRA210_MVC_MUTE_EN			(TEGRA210_MUTE_MASK_EN << TEGRA210_MVC_MUTE_SHIFT)
+#define TEGRA210_MVC_CH0_MUTE_EN		1
+#define TEGRA210_MVC_CH0_MUTE_MASK		(TEGRA210_MVC_CH0_MUTE_EN << TEGRA210_MVC_MUTE_SHIFT)
 
 #define TEGRA210_MVC_PER_CHAN_CTRL_EN_SHIFT	30
 #define TEGRA210_MVC_PER_CHAN_CTRL_EN_MASK	(1 << TEGRA210_MVC_PER_CHAN_CTRL_EN_SHIFT)
-- 
2.7.4

