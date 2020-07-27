Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66822F368
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 17:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70E1416A0;
	Mon, 27 Jul 2020 17:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70E1416A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595862378;
	bh=6S54hSr5B94xmlAuoAhGcDnhzD4R8pbh00pjI8DnPAE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nsz84QSbfXHWfcAYfxEdgaBeX5BbQ1+wJeRQKaNKU/UdbBnkdy4L+HQKZjOEhgKDI
	 Nam+CIen3lyGheV7JYgCxdvoek/7szpT9Rq8A+UtXjhsWQsR33zWgLPfBzi4e8wVfN
	 DOvua7iW4Z23D+13ubI0SuiQrdxirW4nyZbsH96o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26E04F802E7;
	Mon, 27 Jul 2020 17:02:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64780F802E3; Mon, 27 Jul 2020 17:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690058.outbound.protection.outlook.com [40.107.69.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E52BF802D2
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 17:02:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E52BF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="CopK7pqq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT8HUnMATqTkvbYivQSjtQ56cjprskB6ctD+oftQQsCBzKIeck2j0F+uxZv90c84WoLjODdwVuhc2meJU7gXPQSfs5TZd+UjA5eqE65lwql8rDYwnenn8W4/kQJ0uLc/wz3yfxAG53DkTt4le/KWnpMeC8qSOqr/XUEEPCgZEYubjZ/M+XTfHYYGHXTu00SR767vxTCnD99TCpxfTTO5gbX6Im7VJ/FYIVo4XaJxyF9cDgeSX8qfZH2FJgyad8/69JIdszvrLmzT4wfVx5LWw/cfXgGBlXEH5XQoO9CBpR6z9ODkXcjCNBRsIvwGIkswrP+SzEZezKlFTyyoVSxeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCl07lc7XRC5uQgg9x12rtUZ1ol8ER+YYH/hcAArfX4=;
 b=Sa1I9hhRkvCvEUyoFLeD55qMzNygcT5+BT3ykAo8PXK2cRhoGw9ZqhDU3UEN0IxZPNfhRqJ8iHdJf0VnA7ISHlZLmDJm9rngbIZ3wKHr7AJr83vuwsFpllfNF7Tudj3LvjdjH82nKG78K0LHEK5v7f2AcdssGSV1T2Lqg9Guynfmo86kn88n/58AhMJpyYRLrM0S8Zw0KG2WG/NjOwPCdBZoEhy/Mtvu2kXtA32f5SvQBv29UDyl1g9Ij5MVyRRBGgUZwX8asxKai9ZsGdZKmSSxv9IufQ5PyNxRJnSMDp8+udeI2dwcgSJ2RjLtxcvENhRblnkm9JEZtKl//QNs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCl07lc7XRC5uQgg9x12rtUZ1ol8ER+YYH/hcAArfX4=;
 b=CopK7pqqbl6f6KQxg+1rQF4wubo7Esxr5BXBoYObAWhYoWnNsyk0bDI2fzkqe8/WFOCZp8+pyDdAGcR9TFNT+If0otK8kvEMVTjJYVpVm1wYbGuSFw6GbFhx9/JvEGWiZKuWNbebatfU9ATaV0HvGOOC8mqcTyCyIis4xX1dQ2k=
Received: from BN8PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:d4::31)
 by MN2PR12MB3341.namprd12.prod.outlook.com (2603:10b6:208:cb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Mon, 27 Jul
 2020 15:02:16 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::84) by BN8PR04CA0057.outlook.office365.com
 (2603:10b6:408:d4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Mon, 27 Jul 2020 15:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 15:02:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:02:15 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:02:15 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 27 Jul 2020 10:02:12 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH 5/6] ASoC: amd: Adding DAI LINK for rt1015 codec
Date: Mon, 27 Jul 2020 20:28:30 +0530
Message-ID: <20200727145840.25142-5-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e05e2f1-e170-4f2a-2204-08d8323e0d16
X-MS-TrafficTypeDiagnostic: MN2PR12MB3341:
X-Microsoft-Antispam-PRVS: <MN2PR12MB334164A4B793E0F6679FA45EE7720@MN2PR12MB3341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Q3M2OlHbIjSo/7y1F7Yf/kgb1kCvKkmeBQRd8OxF2VlAkCNnnQZVzIOhdTztw+l/Ski54OjhavOvVfJzgV6gxehcEx4/5zCURkI3DWruYN9dUnwxzb32wKFgdQdhCZ8OECwN88rj1ZTYQuDH/7PbrRzL69j7ya63EjPeyP7adFSAhCz/Z8gaZyaa9GfmNfkjFjFj1mTPqpfjSyNLg/mudZorqqyeDGXURg7AGx9CVutGf/meUkSaY5JqHLDH+dcBHeoYV+W+Q0IQOYk+duZh4Ahh5iKCbMlWvQ7csWNnxPYeRjqotSNdHXUxIcrB8IZzzV2TGQ7dAVNMEkxd6NoijyP4PyZMhwbW9nkC8LT2yd92rI3l5nztFFan7QaZ/T4al4t+mgrmiaJLVVQ7a8GSbf6x8wXAJWlBc6/F5xiqrA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(8676002)(356005)(70206006)(82310400002)(109986005)(70586007)(2616005)(86362001)(7696005)(2906002)(83380400001)(5660300002)(8936002)(54906003)(186003)(336012)(47076004)(6666004)(316002)(82740400003)(36756003)(1076003)(26005)(426003)(478600001)(81166007)(4326008)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 15:02:16.1400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e05e2f1-e170-4f2a-2204-08d8323e0d16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3341
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
index ac96ef70aafa..607205cb3a98 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -32,6 +32,12 @@ static struct clk *rt5682_dai_wclk;
 static struct clk *rt5682_dai_bclk;
 static struct gpio_desc *dmic_sel;
 
+enum {
+	RT5682 = 0,
+	MAX,
+	EC,
+};
+
 static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
@@ -241,6 +247,9 @@ SND_SOC_DAILINK_DEF(rt5682,
 	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00", "rt5682-aif1")));
 SND_SOC_DAILINK_DEF(max,
 	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00", "HiFi")));
+SND_SOC_DAILINK_DEF(rt1015,
+	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC1015:00", "rt1015-aif"),
+			COMP_CODEC("i2c-10EC1015:01", "rt1015-aif")));
 SND_SOC_DAILINK_DEF(cros_ec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("GOOG0013:00", "EC Codec I2S RX")));
 
@@ -259,7 +268,7 @@ static struct snd_soc_codec_conf rt1015_conf[] = {
 };
 
 static struct snd_soc_dai_link acp3x_dai[] = {
-	{
+	[RT5682] = {
 		.name = "acp3x-5682-play",
 		.stream_name = "Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
@@ -270,16 +279,19 @@ static struct snd_soc_dai_link acp3x_dai[] = {
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
@@ -389,6 +401,18 @@ void *soc_is_rltk_max(struct device *dev)
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
@@ -404,6 +428,7 @@ static int acp3x_probe(struct platform_device *pdev)
 	if (!machine)
 		return -ENOMEM;
 
+	card_spk_dai_link_present(card->dai_link, card->name);
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
-- 
2.17.1

