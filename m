Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D570C230EE0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE8F16DE;
	Tue, 28 Jul 2020 18:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE8F16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595952556;
	bh=VBnvRVmbd0nRMgXxFVN+84T7VwQ5sKFmgVdUNOD/zOY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pL9n93at5aa7aiHvetejupKt8EHVFUrZCPLWphFhs9CgZs71cDMbi9BNGgKzbdnF5
	 HMwVS5X69/cN39qjY1qhFNIrTs6g21nr8ta/gL1td8a2krvQrvOtORrIFZN/U4zlcy
	 7ldklUyhFt5Snp+JiG3ihovx7MEU6XrZFROaqqjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F64CF802BE;
	Tue, 28 Jul 2020 18:07:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CE1EF802BD; Tue, 28 Jul 2020 18:07:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07E82F80256
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07E82F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="B3mG/0jb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbgFZUn2kkJt2hokIxtDfbE/x42G9EbY4GL6H4uILJiWwq2bqhnkkRzBhBVwaCZp08t6VLmkUVtbY1mt9ezeg3Tdk5l5egnrwDmiQlp/vBmViI6aU8hSp6iXwEJnv5AM9uuijn/18Zhhox6A8UZVKxNSbYFW+O90mcHPrU1V6/CP8TyymL6DoUgioYuSBskhIgaIfi1+/s1NbRE4lnYLensYaomUehmdFF6hCzefPa0NQv9SLhxbsJ/fTyIkT9g1Fy6OyzY5oQEkKbYD3kZDj8176V7/1th9RisoBmVumh+rYhIqiGVJ2WWuDiI5nxsvnRVH5gVAsQbEHdlKeA/siA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCB1Vrsx+8WOuq91iNN5qiwdDikZp2WxyhLIUAVJ2Bs=;
 b=Y8gRcOo1QrC6wO5oo8mCBbzYzcBQVgCRPoqTtbSdN3eUEwOyHycr5+DTEgPgnISsjyspbri83TmLDlRZ8FWt4gUcjgD/Ph89pSPM14+RZZn7ozowXAz5+Aj6qVjYIVo7dZxa6/s82MAlLEHuaJlRNO7cO5n3y1Ht99KWgbhfiHF3ol0EuyiVK7iki3KthSYSe1K9rYZiEzUyqGd6sCKZdgxtPemb9DIjoD47xWnxGc3aKi+zYfjkYtc3fXueEuZCrLPpYKDeSh88sxb+dTd5z8dDBHWPnRtoTq4bsufV5gAcgDc97x4Yw3Nib/VKRW1ZhfkoAJzK5wG0aACopzzqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCB1Vrsx+8WOuq91iNN5qiwdDikZp2WxyhLIUAVJ2Bs=;
 b=B3mG/0jbROq1jfM7S+DRl6CE3DC036mDogAXEm93HkmBBNHporjnPbBrKFUmpF2AQtQhf4eTlcjl8XV94SfFVM1hzLNPoqTn2erMjMLDfFBzqgQL3Y8hqpXNvhBcy/cF8eoTj1EExLpM6Rvy3lGP4njCBf4KM16CaPXpObHLs50=
Received: from BN6PR04CA0101.namprd04.prod.outlook.com (2603:10b6:404:c9::27)
 by MN2PR12MB3005.namprd12.prod.outlook.com (2603:10b6:208:c5::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 16:06:51 +0000
Received: from BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:c9:cafe::7c) by BN6PR04CA0101.outlook.office365.com
 (2603:10b6:404:c9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 16:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT055.mail.protection.outlook.com (10.13.177.62) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 16:06:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 28 Jul
 2020 11:06:50 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 28 Jul
 2020 11:06:49 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 28 Jul 2020 11:06:46 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH v2 4/5] ASoC: amd: Adding DAI LINK for rt1015 codec
Date: Tue, 28 Jul 2020 21:32:54 +0530
Message-ID: <20200728160255.31020-5-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728160255.31020-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200728160255.31020-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f90de723-b87d-477d-ed45-08d833103d8c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3005:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3005B8C61381E85F8930580EE7730@MN2PR12MB3005.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nl4p0J/TdIQKwhJioUgSqRBHiDNcsXKutt8BoUc4c+mUrj/qHdYMrgDdlxImaPgULXMZlbL8m7HaZ67NKXX+rrbsSoPtMDxblOvbmJmetuXzrskwWbGgiMNoxwcRpIbjWSSCyKeR/Li7m5yjcg5nUbfbGIsdi5DJBFK9AHCvYBf0jC1uJsOoCnEk4Po4oBtv62xXJ2VxT9Nx+y+VEDxKpvZ83wOYX5do4UY6tHvJevnfngMYzFa1qXprE6+pKmIV4QwNmZ1fGdw9ieq5E7LorVLirqZtWMMCIovgdZQcc6f/88lxfo8JDHi9cqQ4SUg36Dn4wkrAryU7cmygsb9amGaV7otY1Xx0qw0ZQ+nkVg0o7hSJPxw9dJ+w+ZCnrdvtfzVihQplzuIfi/gedj4wo/g+QxXrU2Ebky9C38+9bLA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(82310400002)(86362001)(83380400001)(82740400003)(47076004)(336012)(2616005)(5660300002)(81166007)(426003)(356005)(70206006)(36756003)(70586007)(1076003)(109986005)(54906003)(4326008)(8936002)(478600001)(8676002)(186003)(6666004)(26005)(7696005)(316002)(2906002)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 16:06:51.7614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f90de723-b87d-477d-ed45-08d833103d8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3005
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Alexander.Deucher@amd.com,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

DAI link support for RTK 1015 and providing the codec details
depending on the snd_soc_card selected by ACPI ID.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 35 ++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 015b6a3312f5..e0c767716b9a 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -33,6 +33,12 @@ static struct clk *rt5682_dai_bclk;
 static struct gpio_desc *dmic_sel;
 void *soc_is_rltk_max(struct device *dev);
 
+enum {
+	RT5682 = 0,
+	MAX,
+	EC,
+};
+
 static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
@@ -242,6 +248,9 @@ SND_SOC_DAILINK_DEF(rt5682,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
 SND_SOC_DAILINK_DEF(max,
 	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
+SND_SOC_DAILINK_DEF(rt1015,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1015:00", "rt1015-aif"),
+			COMP_CODEC("i2c-10EC1015:01", "rt1015-aif")));
 SND_SOC_DAILINK_DEF(cros_ec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("GOOG0013:00", "EC Codec I2S RX")));
 
@@ -260,7 +269,7 @@ static struct snd_soc_codec_conf rt1015_conf[] = {
 };
 
 static struct snd_soc_dai_link acp3x_dai[] = {
-	{
+	[RT5682] = {
 		.name = "acp3x-5682-play",
 		.stream_name = "Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
@@ -271,16 +280,19 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
-	{
+	[MAX] = {
 		.name = "acp3x-max98357-play",
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBM_CFM,
+				| SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
 		.ops = &acp3x_max_play_ops,
-		SND_SOC_DAILINK_REG(acp3x_bt, max, platform),
+		.cpus = acp3x_bt,
+		.num_cpus = ARRAY_SIZE(acp3x_bt),
+		.platforms = platform,
+		.num_platforms = ARRAY_SIZE(platform),
 	},
-	{
+	[EC] = {
 		.name = "acp3x-ec-dmic0-capture",
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
@@ -390,6 +402,18 @@ void *soc_is_rltk_max(struct device *dev)
 	return (void *)match->driver_data;
 }
 
+static void card_spk_dai_link_present(struct snd_soc_dai_link *links,
+						const char *card_name)
+{
+	if (!strcmp(card_name, "acp3xalc56821015")) {
+		links[1].codecs = rt1015;
+		links[1].num_codecs = ARRAY_SIZE(rt1015);
+	} else {
+		links[1].codecs = max;
+		links[1].num_codecs = ARRAY_SIZE(max);
+	}
+}
+
 static int acp3x_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -405,6 +429,7 @@ static int acp3x_probe(struct platform_device *pdev)
 	if (!machine)
 		return -ENOMEM;
 
+	card_spk_dai_link_present(card->dai_link, card->name);
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
-- 
2.17.1

