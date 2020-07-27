Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA722F35A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 17:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D23516A4;
	Mon, 27 Jul 2020 17:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D23516A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595862228;
	bh=MNdxAKZpKt9LwXpkK2ee7SFKXgcUjTtdGsjy7496DM8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OW1BRHdtbRMNjQQpq7RE+xD8adIY7idPivyzfSnLcStGNE83P1JQHSRNwS68Wv0Vb
	 OTKhWGk76jx9uPGLa2HmoNWyGLPMjzdYc5ygsa1WeIv//I32jylOMMq+Hep1MOuNpE
	 l7r1PixqQKJAtjqqH8z3qkwPE9VIGkTRcNim2E8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6C16F801D9;
	Mon, 27 Jul 2020 17:02:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E8E8F801D9; Mon, 27 Jul 2020 17:02:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89855F800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 17:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89855F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="yPbZWMuz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETXPaEYKN6t9MF/O+HEWtfOGWCOFBvH+oCBsF/vPHYV89X99kdb1DL3WfYZP3zuDb8WiJvEnmOwsQII0qu9k9Ehvqrsbepn3NLkzgvlalEq6jhLd1AMyEb87UQr5mbgIE1Z7ZZ23U3Awm8j2EMogaiGmW5ywB4BNScbFyDVeIQ+1/XoRDjpJ/M0r3KNlg1w5VkcYcMh1SbHyyC1QpVpr5/N9daB8SCWbpwQEuRPL5OMXzK4a+hS+Bj8PsYVLM4Wl4HlFDBo6anMjB/ND3xdy62aJeMWvQ36Hg9X2b4w3ObjaEkl0p8CLA+Iu3RS7T+ek0u0wfVxIq+QoCQjKvNs9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZwsNUL5Rb+nSi3eiyrnNr7PnidSuPdIOwi32PL+Qjg=;
 b=QkpJHIZDgNz1DnpZAyrLbcZrqYloDI97yn+aeI78kwRu4R9fqGwSgsB2at4i+vCaLj9mSUgmvWqZvSCP9F8BgAlrsa1mci1sYgyUMFxfEGHjaO+dvpKIg/89Eo8NGVxc6HD4E4k9pHR9/t9NzhS3lfcd398Bw7L2YmHxZujKCpGACNMV0B0/NwWZK++rbebA6mkgLd8FkXtICuyqnyWoLySXi+vr+q354J4OXVr0Lek1S8gJtvziguA04dcTBWl7Dfvzgsffbmlg6S8O7sJ2ttClS0Yr9CkbJ4ls1VgnPQ/JC5sXgwyCZ7tCped+1/73e/5wirWl7xa5kgzFlCIE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZwsNUL5Rb+nSi3eiyrnNr7PnidSuPdIOwi32PL+Qjg=;
 b=yPbZWMuzSNOv9804qgZhbku58YBu+gC1MrwuQL3PBVIeEsPzpnlkZXPMTKHjHfk1rd6/4KPbnGs08EV8bNrstvO2Tq0RBL/Zrbue5n6OnqFbBWjH6UbNgskbKcm/kBJrw55uCr+qbpqscyDRcboUKXuRqXFiGRpAzX5zcWJoivc=
Received: from BN6PR14CA0025.namprd14.prod.outlook.com (2603:10b6:404:13f::11)
 by BN8PR12MB3074.namprd12.prod.outlook.com (2603:10b6:408:65::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Mon, 27 Jul
 2020 15:01:55 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::31) by BN6PR14CA0025.outlook.office365.com
 (2603:10b6:404:13f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20 via Frontend
 Transport; Mon, 27 Jul 2020 15:01:55 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Mon, 27 Jul 2020 15:01:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:01:54 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 Jul
 2020 10:01:54 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 27 Jul 2020 10:01:50 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH 2/6] ASoC: amd: Passing card structure based on codec
Date: Mon, 27 Jul 2020 20:28:27 +0530
Message-ID: <20200727145840.25142-2-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200727145840.25142-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24b97e88-4de1-4b0b-97f8-08d8323e0083
X-MS-TrafficTypeDiagnostic: BN8PR12MB3074:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3074516C13D61CA6DBC50CB9E7720@BN8PR12MB3074.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3XUFxjw/D0yWLXPORYCy7S+/00b89jwKm3NsFcSXdtJXv5PM0sXfptri3gt8O+GmaJtXpPqSseAbrxY0PQcYSPsz5lambcjAAWy0tyfPVUABs5vwoCBxlCooQd7ebHZ7VxmQhaX7cO0RD1vcOnbO2k4ohNoRKXsF0HBU+reRAZxzzfJD5eW/UlBYQpgdsR//zWSzIvqjWaU9c8haN7nkKf5KvaJH9+5Rfp5DSjq3/Zn9RSoidJ+igfJ9eShpQlUgJVzdeC8hIWPQDjVS8VxrgLcG8r/U8rjeDYT2xHz3uwhcTqRpy922Sg5Pu+mMOu+a5tYgeZB2KFZ8iKN4vJRNHFmhMEE4ha45+UBkhDyNA5rnr6YZjKp9K9MGcjn5JURDG0VeuLcqVu2BVbvWZWxHgDR2NW6OVGtNHXm38TOE+E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966005)(8676002)(4326008)(6666004)(5660300002)(7696005)(109986005)(36756003)(316002)(186003)(2616005)(54906003)(83380400001)(1076003)(70586007)(82310400002)(81166007)(356005)(8936002)(426003)(478600001)(82740400003)(70206006)(86362001)(336012)(2906002)(47076004)(26005)(266003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 15:01:55.0470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b97e88-4de1-4b0b-97f8-08d8323e0083
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3074
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

Passing specific snd_soc_card structure depending on the ACPI ID.
In future we can add other IDs in the ACPI table and pass the structure.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 8b5af064864f..1e446e4bab25 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -326,18 +326,32 @@ static struct snd_soc_card acp3x_5682 = {
 	.num_controls = ARRAY_SIZE(acp3x_5682_mc_controls),
 };
 
+void *soc_is_rltk_max(struct device *dev)
+{
+	const struct acpi_device_id *match;
+
+	match = acpi_match_device(dev->driver->acpi_match_table, dev);
+	if (!match)
+		return NULL;
+	return (void *)match->driver_data;
+}
+
 static int acp3x_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct snd_soc_card *card;
 	struct acp3x_platform_info *machine;
+	struct device *dev = &pdev->dev;
+
+	card = (struct snd_soc_card *)soc_is_rltk_max(dev);
+	if (!card)
+		return -ENODEV;
 
 	machine = devm_kzalloc(&pdev->dev, sizeof(*machine), GFP_KERNEL);
 	if (!machine)
 		return -ENOMEM;
 
-	card = &acp3x_5682;
-	acp3x_5682.dev = &pdev->dev;
+	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
@@ -348,18 +362,18 @@ static int acp3x_probe(struct platform_device *pdev)
 		return PTR_ERR(dmic_sel);
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, &acp3x_5682);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev,
 				"devm_snd_soc_register_card(%s) failed: %d\n",
-				acp3x_5682.name, ret);
+				card->name, ret);
 		return ret;
 	}
 	return 0;
 }
 
 static const struct acpi_device_id acp3x_audio_acpi_match[] = {
-	{ "AMDI5682", 0 },
+	{ "AMDI5682", (unsigned long)&acp3x_5682},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, acp3x_audio_acpi_match);
-- 
2.17.1

