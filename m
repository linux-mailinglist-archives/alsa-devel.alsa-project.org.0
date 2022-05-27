Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD2535E45
	for <lists+alsa-devel@lfdr.de>; Fri, 27 May 2022 12:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 462051729;
	Fri, 27 May 2022 12:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 462051729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653647331;
	bh=b6036prCKhX6AV6L+iO69ugoKAMEEwCsY3SphXUVLtc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BoHe8v/lVCNexvYsQJcHh1si084Ola2PIoKYytkXe1c9PWYZz27i67ATNM8TTZtKH
	 Jo16neIM8hJw1Qiz666XDTOfLDpBsLvByn5//Pc4RMfqmb/G226PDLoqHATEm6gtcr
	 HZaSt79FK5eiRhS2ElPaVScPzOq/cXqBcZjq1in8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F35AF80529;
	Fri, 27 May 2022 12:26:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ADAFF80518; Fri, 27 May 2022 12:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AB8BF80518
 for <alsa-devel@alsa-project.org>; Fri, 27 May 2022 12:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AB8BF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="nEZWngxb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3l5mprjAjTWvM9KxW35Gts1UTTMtbvYSGBi+7s/YfNHpg+/bh0MSSyX2jch7/F+wwPcPzTZJSE0Hbz2wn+kx+YJ4j/+gIlpZ/y/zNlDdhssnUBlCVKb4+S9sFmRdunggIGRvTEoNRUqh7I/QzFE559JxGz94aPN18BKe8g2nYAmedqungjyizmYfWFUhTXriyx0+MX1CU2o2CcNCxMXpUs8ft39GS9qoCeicaLnqoewEXTRQIOQGf9JAoMqGp5I6ie6SuKyZ398ML+dqcUNkhGGG7m2BAni9GhIXB0m87ajz30lscWYY+Z+WrLgrQD6LXKMo/QHxiLnIlb4SF3P8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyNpoCT7r41AoXMWM43RUrGi67Z/OWD0xufT9om0iCk=;
 b=O1jUawlfhdYejxf0NxkZQD3yMkig2RTojfAy2ep5KWq//MmkKFBndDFM2pc7u7EjgCjM3Y1YWIqUHdIJH/kT/q5C3ttjLEBkDST6wV6LjbLf8gIkX2tROWIgZTqCYNVHZVEIo/sEhN/AaMnYcSz/z4cqMbN/81LlFBKF0wBup/0Kv7G5OZ1MPjmcse5+IFFS+L/mM9rVz5Ed2V3G7E/J7BeCWgvjJHVxbAoEATjlgft/3Xycgxx5lf+s4aOQJi+7LCUSA5SILzwOiUxnIQigHyHC3weu6JePhDmzUwJAKfcFpGh+XNloxrllKIFBL7Pt4h5fhXf0p/+RpRhbDlejCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zyNpoCT7r41AoXMWM43RUrGi67Z/OWD0xufT9om0iCk=;
 b=nEZWngxbMXf3030RKBMuzaRluktvs1RB7CvBez10uGWFzc5UYKoF0yrlLvM3eoeMZkoltK/vS64vgpx6wHvnuftQpSetiBZVblkO9RU+xmUhb/vSg6XJmR2Qx6Xe5VAWNNcwDffwiw20H2Qd9UvR5qmcwF+vn3GuCSc7oZG29Pqpncu67ioo58BioIPyyJ1ccEzm/A3YN43u4DRGgtlagHIrfWvt+6nfkAfh7+LH0P+99R1AF3qBpoUAsmCer0HNhmLx7PTuaAXdtbDCYkBjyjWlbveexbF2SXekRvDdMn4YAo8qT1d96e7bG5KOSUCrAwsuynh+L5XUQ9FatjDayA==
Received: from BN9PR03CA0056.namprd03.prod.outlook.com (2603:10b6:408:fb::31)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Fri, 27 May
 2022 10:26:36 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::6) by BN9PR03CA0056.outlook.office365.com
 (2603:10b6:408:fb::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Fri, 27 May 2022 10:26:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.234) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5293.13 via Frontend Transport; Fri, 27 May 2022 10:26:35 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Fri, 27 May 2022 10:26:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 27 May
 2022 03:26:34 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport;
 Fri, 27 May 2022 03:26:30 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 3/6] ASoC: tegra: AHUB routes for OPE module
Date: Fri, 27 May 2022 15:56:09 +0530
Message-ID: <1653647172-2569-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653647172-2569-1-git-send-email-spujar@nvidia.com>
References: <1653647172-2569-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97683f9c-a15b-4ac8-9911-08da3fcb60be
X-MS-TrafficTypeDiagnostic: PH0PR12MB5607:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB560703EADD1871CB24A3010BA7D89@PH0PR12MB5607.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /7v5eTtYw9yGNtXg+FHvJFtd6ZlbV/P5p1wEaIItnrgFk/O68V1QHRq5hT2/GYYyTykm7vn6Jkx//JYbGSNYMgzyBaAaQS0B2Eyhq8QqEvXDXH5fwS72kRt97uJEseDM3wFaOeUVAvbk0o6dmGRYji/5kZTeuZ3Ddyy0ow3omIgrSl0NcnzKAOaaeYmqW+MGsZ/5PdqzVLRNyi47PPfM/hyCj9BacKLewVr6oxPmGergQ4qNL82EG8rTwbFG0i7TB+UCw+UVQCOQ7RnBIcHcbusLZUFgYs7gPvA/TZIH527dYJgjAkV91N9Kd3j7hVbj7Pxb/gDACvD/Ar4PIYyezLvFLD/hiokHmFah1sKcAv528h6r4HGprWRgbhUmNCTdu7zhrVgV6ZB2cd26MNGUn8URQNYI0AZ5vf/XY77NRWUGbhUAf/IiJWS8EXsUXdHw6POk7+8V8Q9ptcN+OpM+eO9Euj3G7U1n2i+k6fmajO5YkoOR0iJzBv6kSQwhMPbyTvXnIGY3fTv3GSENfrM5OQ1mbA3/C8OB+4V6ccjeTZjBJTgmYgetsblwTjZJDsKbU6EquUM7nsqdEvmO/Oxv8yZXoe3m9AxznFMnWDM+LrRSCRCR2PnWYSpa3IFPfWpHyI9Ajyq55oJABaS85Xdxe6S436LQFK496mUDne+DeedY69a646KXfrua1cX1WnuaoXPUv5WpVoetjrQQh4IlBg==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(8676002)(5660300002)(81166007)(356005)(4326008)(83380400001)(316002)(36860700001)(54906003)(70206006)(110136005)(508600001)(40460700003)(82310400005)(36756003)(6666004)(70586007)(86362001)(47076005)(2616005)(107886003)(8936002)(7416002)(26005)(7696005)(336012)(2906002)(426003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 10:26:35.8486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97683f9c-a15b-4ac8-9911-08da3fcb60be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Add AHUB routes for OPE module. The OPE module can be plugged into audio
path as per the need. The routing controls can be used to setup the audio
path with OPE similar to the already existing routes. The support is added
on Tegra210 and later Tegra SoCs where OPE module is present.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index e1f90da..b38d205 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -170,6 +170,11 @@ static struct snd_soc_dai_driver tegra210_ahub_dais[] = {
 	DAI(MIXER1 TX3),
 	DAI(MIXER1 TX4),
 	DAI(MIXER1 TX5),
+	/* XBAR -> OPE -> XBAR */
+	DAI(OPE1 RX),
+	DAI(OPE1 TX),
+	DAI(OPE2 RX),
+	DAI(OPE2 TX),
 };
 
 static struct snd_soc_dai_driver tegra186_ahub_dais[] = {
@@ -294,6 +299,9 @@ static struct snd_soc_dai_driver tegra186_ahub_dais[] = {
 	DAI(ASRC1 RX6),
 	DAI(ASRC1 TX6),
 	DAI(ASRC1 RX7),
+	/* XBAR -> OPE -> XBAR */
+	DAI(OPE1 RX),
+	DAI(OPE1 TX),
 };
 
 static const char * const tegra210_ahub_mux_texts[] = {
@@ -337,6 +345,8 @@ static const char * const tegra210_ahub_mux_texts[] = {
 	"MIXER1 TX3",
 	"MIXER1 TX4",
 	"MIXER1 TX5",
+	"OPE1",
+	"OPE2",
 };
 
 static const char * const tegra186_ahub_mux_texts[] = {
@@ -408,6 +418,7 @@ static const char * const tegra186_ahub_mux_texts[] = {
 	"ASRC1 TX4",
 	"ASRC1 TX5",
 	"ASRC1 TX6",
+	"OPE1",
 };
 
 static const unsigned int tegra210_ahub_mux_values[] = {
@@ -459,6 +470,9 @@ static const unsigned int tegra210_ahub_mux_values[] = {
 	MUX_VALUE(1, 2),
 	MUX_VALUE(1, 3),
 	MUX_VALUE(1, 4),
+	/* OPE */
+	MUX_VALUE(2, 0),
+	MUX_VALUE(2, 1),
 };
 
 static const unsigned int tegra186_ahub_mux_values[] = {
@@ -540,6 +554,8 @@ static const unsigned int tegra186_ahub_mux_values[] = {
 	MUX_VALUE(3, 27),
 	MUX_VALUE(3, 28),
 	MUX_VALUE(3, 29),
+	/* OPE */
+	MUX_VALUE(2, 0),
 };
 
 /* Controls for t210 */
@@ -584,6 +600,8 @@ MUX_ENUM_CTRL_DECL(t210_mixer17_tx, 0x26);
 MUX_ENUM_CTRL_DECL(t210_mixer18_tx, 0x27);
 MUX_ENUM_CTRL_DECL(t210_mixer19_tx, 0x28);
 MUX_ENUM_CTRL_DECL(t210_mixer110_tx, 0x29);
+MUX_ENUM_CTRL_DECL(t210_ope1_tx, 0x40);
+MUX_ENUM_CTRL_DECL(t210_ope2_tx, 0x41);
 
 /* Controls for t186 */
 MUX_ENUM_CTRL_DECL_186(t186_admaif1_tx, 0x00);
@@ -657,6 +675,7 @@ MUX_ENUM_CTRL_DECL_186(t186_asrc14_tx, 0x6f);
 MUX_ENUM_CTRL_DECL_186(t186_asrc15_tx, 0x70);
 MUX_ENUM_CTRL_DECL_186(t186_asrc16_tx, 0x71);
 MUX_ENUM_CTRL_DECL_186(t186_asrc17_tx, 0x72);
+MUX_ENUM_CTRL_DECL_186(t186_ope1_tx, 0x40);
 
 /* Controls for t234 */
 MUX_ENUM_CTRL_DECL_234(t234_mvc1_tx, 0x44);
@@ -758,6 +777,8 @@ static const struct snd_soc_dapm_widget tegra210_ahub_widgets[] = {
 	TX_WIDGETS("MIXER1 TX3"),
 	TX_WIDGETS("MIXER1 TX4"),
 	TX_WIDGETS("MIXER1 TX5"),
+	WIDGETS("OPE1", t210_ope1_tx),
+	WIDGETS("OPE2", t210_ope2_tx),
 };
 
 static const struct snd_soc_dapm_widget tegra186_ahub_widgets[] = {
@@ -867,6 +888,7 @@ static const struct snd_soc_dapm_widget tegra186_ahub_widgets[] = {
 	TX_WIDGETS("ASRC1 TX4"),
 	TX_WIDGETS("ASRC1 TX5"),
 	TX_WIDGETS("ASRC1 TX6"),
+	WIDGETS("OPE1", t186_ope1_tx),
 };
 
 static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
@@ -976,6 +998,7 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	TX_WIDGETS("ASRC1 TX4"),
 	TX_WIDGETS("ASRC1 TX5"),
 	TX_WIDGETS("ASRC1 TX6"),
+	WIDGETS("OPE1", t186_ope1_tx),
 };
 
 #define TEGRA_COMMON_MUX_ROUTES(name)					\
@@ -1018,7 +1041,11 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	{ name " Mux",		"MIXER1 TX2",	"MIXER1 TX2 XBAR-RX" },	\
 	{ name " Mux",		"MIXER1 TX3",	"MIXER1 TX3 XBAR-RX" },	\
 	{ name " Mux",		"MIXER1 TX4",	"MIXER1 TX4 XBAR-RX" },	\
-	{ name " Mux",		"MIXER1 TX5",	"MIXER1 TX5 XBAR-RX" },
+	{ name " Mux",		"MIXER1 TX5",	"MIXER1 TX5 XBAR-RX" }, \
+	{ name " Mux",		"OPE1",		"OPE1 XBAR-RX" },
+
+#define TEGRA210_ONLY_MUX_ROUTES(name)					\
+	{ name " Mux",          "OPE2",         "OPE2 XBAR-RX" },
 
 #define TEGRA186_ONLY_MUX_ROUTES(name)					\
 	{ name " Mux",		"ADMAIF11",	"ADMAIF11 XBAR-RX" },	\
@@ -1050,10 +1077,11 @@ static const struct snd_soc_dapm_widget tegra234_ahub_widgets[] = {
 	{ name " Mux",		"ASRC1 TX5",	"ASRC1 TX5 XBAR-RX" },	\
 	{ name " Mux",		"ASRC1 TX6",	"ASRC1 TX6 XBAR-RX" },
 
-#define TEGRA210_MUX_ROUTES(name)						\
-	TEGRA_COMMON_MUX_ROUTES(name)
+#define TEGRA210_MUX_ROUTES(name)					\
+	TEGRA_COMMON_MUX_ROUTES(name)					\
+	TEGRA210_ONLY_MUX_ROUTES(name)
 
-#define TEGRA186_MUX_ROUTES(name)						\
+#define TEGRA186_MUX_ROUTES(name)					\
 	TEGRA_COMMON_MUX_ROUTES(name)					\
 	TEGRA186_ONLY_MUX_ROUTES(name)
 
@@ -1121,6 +1149,8 @@ static const struct snd_soc_dapm_route tegra210_ahub_routes[] = {
 	TEGRA210_MUX_ROUTES("MIXER1 RX8")
 	TEGRA210_MUX_ROUTES("MIXER1 RX9")
 	TEGRA210_MUX_ROUTES("MIXER1 RX10")
+	TEGRA210_MUX_ROUTES("OPE1")
+	TEGRA210_MUX_ROUTES("OPE2")
 };
 
 static const struct snd_soc_dapm_route tegra186_ahub_routes[] = {
@@ -1215,6 +1245,7 @@ static const struct snd_soc_dapm_route tegra186_ahub_routes[] = {
 	TEGRA186_MUX_ROUTES("ASRC1 RX5")
 	TEGRA186_MUX_ROUTES("ASRC1 RX6")
 	TEGRA186_MUX_ROUTES("ASRC1 RX7")
+	TEGRA186_MUX_ROUTES("OPE1")
 };
 
 static const struct snd_soc_component_driver tegra210_ahub_component = {
-- 
2.7.4

