Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2EC455532
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 08:09:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21E4218BD;
	Thu, 18 Nov 2021 08:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21E4218BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637219365;
	bh=Q35Kbv+b/Ze3CYUQLWWHBZQtrzvoVmy0FF8iI1s4a0E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkQlprlFnXfUzz2bOsy0NIzfe/ktp2LLDOnKbVb8jRNFWyO2AFnIjjfDm3Nou7U4S
	 U4Z+GdYQrjylJU2Ax7l73/K18Bu4/K27B0FhGs6YSy7uy+1xwBkWAIIUWMaQbU+QYl
	 xLFC6Lw2GN3AR8JtSFA5fs8H0XHakI0uIiFfofDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 105B0F804EB;
	Thu, 18 Nov 2021 08:07:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8AC1F804D6; Thu, 18 Nov 2021 08:07:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3010AF80115
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 08:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3010AF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com
 header.b="GWJq+xdW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZsWOOK74Vl0MAl33avV4yBX1yG1JXsGkQroy1N70Ea/R/DewnRVeftaNp6AXVUH3NcxGL/jwls4e/J6p92rNIuLC6tSse4BVD9hCmkOeXK+EJBh5u3tQMoLtlWN8cFlrP5tPVe/xmrjTik0ssgHYe6poyUy1g6n8asdCOw/9geU2gidq3QhsKzlKInUI53N1r9b4q0PwFzrFbGzhfpMgfYVEs9jtj/uniEQstz7JxFjRqEbVukvIothCqQ3tSNPOnckixaz0KalMDeIF6UiQpyurGUHHUbVsJ+raIOO1B7jgesGPPBuio2ASwzBLrxYNXO/z0etzjS+vFFGDcjNkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZH6DmP+YK97sU7+9CBpXUI1T4uB1MtrtKVEuznSRq6c=;
 b=HpkNE0fUHLs4MaW/u/ncDbNIRIQTPbPvrnCg0ljPaFVUr5JOQVVsLJ8885KmyLeiXAbH6DViTuYU6OD735O0axFHRlWxjCjvTaz/VpL8arYGB6Q1WVXXJUFBpVBeil9kTrrx7IvHedds2jFEbjuoxRdP9sYkDK9S4ZQs+QIaCq0HiFGUq10whjKN8wG02/Jlztee2QBRkYA3ZPrv98lRFe6CzDjbPXcQYSnpqwvYsxFmuvwDkadgZlyRZo65hwgrKE9AE7dVmIi5aErtynf02EM58TJdv+UFm/RhYMXZGdbwCm7HaHbxFURP0MVOzve7JZLh6LCzgNPsRgwqDNyt5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH6DmP+YK97sU7+9CBpXUI1T4uB1MtrtKVEuznSRq6c=;
 b=GWJq+xdWkNRJOEGZzDc81o4aese7H+wrQjxr26/pb1noS/wIATRP5SRUWeYFLfKiIiXEMK0LEsuHCzTIUyLTULas6VEBjW3Sz3cyrU13SsVrs0vNd2t+gJDqEiig49yM3Pz5ZpOtpRpm0G9N2sAyYtqrc1O2mtP6AW1M7IK5+BA0B9F9QCdsiAgvaieRMBYkhVQK5D5UyI9lYoOHS9/AKuseOCZsZ3qp6NGSkJXD/pyaLa1aTNgNvyJYeNThICEzFvzsVrym0PRJNsmfIYU8p/QVVkV3GiSc0nT3tYENAjpSZdX45e9yWaS2x/2iQLMDGiQVVYpGDWlwDnSJw0XaFg==
Received: from BN9PR03CA0608.namprd03.prod.outlook.com (2603:10b6:408:106::13)
 by MN2PR12MB2863.namprd12.prod.outlook.com (2603:10b6:208:103::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Thu, 18 Nov
 2021 07:07:29 +0000
Received: from BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:106:cafe::7) by BN9PR03CA0608.outlook.office365.com
 (2603:10b6:408:106::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 BN8NAM11FT050.mail.protection.outlook.com (10.13.177.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 07:07:28 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 17 Nov
 2021 23:07:27 -0800
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Thu, 18 Nov 2021 07:07:24 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v3 01/16] ASoC: tegra: Fix wrong value type in ADMAIF
Date: Thu, 18 Nov 2021 12:36:56 +0530
Message-ID: <1637219231-406-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a31ad3e2-e580-4d20-f4cc-08d9aa621519
X-MS-TrafficTypeDiagnostic: MN2PR12MB2863:
X-Microsoft-Antispam-PRVS: <MN2PR12MB28637D6032733CDA791B7211A79B9@MN2PR12MB2863.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ErcfxqCjhbyYkkeGSq2nHgFn2dRb4YR+CQXHy9p42zHy20m7FERZ/B9UvxtUf2eCIqoDG/2uKOQXgIVp0RQMdzZ8jx9iLiXbW92BoafXBGT8BuEhn/AN1dUu40E5eLpPRhFVZBtZ2dBg8oyMpBGqsoDlvNogFbw2OGInp2wJaMZfFXV90UZbhmhJ7EXcX3SbkJ4JkbpRd0K4qM2ktSITPj+H3jhU8iJlcsaIsycoYVwX5/ziZaTWnljcLJPXJ6sC1RHTZoiyz+J4rx1QQIj6YhFU/LhyyvwokLOlpstS97FtDDTPvxYfPyCKTkenurSvN41qX32u81UnDVqKkG2KIpqrIEYUZ6TaTZkeQX7xfgqXSj+7xorGoR0mGPqiS99MAGmKANPwNHaEjJR1TwNJ6V1uAjAoag+WRJGacIwR5v2nGaKuSwWLXbhY1KmAkSRSfeXJxhN/c1WDWSa7ryTEiQz/62WxbFsXypqM7dU94jrLlNKZuTqNQ7VLJsn3lyyULs2ftKo+K7rPnGiKMIw7m04xX3NCunay6phRxXclFhtjRZwRG5RtgihNw6aKDiL9r0Mxvn6395g9huAHpc7HwMpbTPR4nqIljzYdMj1kgM3Ju9nWw4FPEjMQWGuE/+NLD745WYMlnoa3lhczZ94rcgUASdLMaTj+svUrBGZfAReIliQVXz9P/wtxBE67dVBvGGSJTNZZAoobJ0u32WVy6Q==
X-Forefront-Antispam-Report: CIP:216.228.112.32; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid01.nvidia.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(82310400003)(36756003)(70586007)(47076005)(86362001)(7636003)(70206006)(356005)(83380400001)(4326008)(2616005)(107886003)(426003)(5660300002)(336012)(26005)(36860700001)(8936002)(7696005)(316002)(54906003)(110136005)(2906002)(6666004)(186003)(8676002)(508600001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 07:07:28.5586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a31ad3e2-e580-4d20-f4cc-08d9aa621519
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.32];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2863
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

The enum controls are expected to use enumerated value type.
Update relevant references in control get/put callbacks.

Fixes: f74028e159bb ("ASoC: tegra: Add Tegra210 based ADMAIF driver")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_admaif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index bcccdf3..6febe80 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -430,7 +430,7 @@ static int tegra_admaif_get_control(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
-	long *uctl_val = &ucontrol->value.integer.value[0];
+	unsigned int *uctl_val = &ucontrol->value.enumerated.item[0];
 
 	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
 		*uctl_val = admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg];
@@ -450,7 +450,7 @@ static int tegra_admaif_put_control(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
 	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
 	struct tegra_admaif *admaif = snd_soc_component_get_drvdata(cmpnt);
-	int value = ucontrol->value.integer.value[0];
+	unsigned int value = ucontrol->value.enumerated.item[0];
 
 	if (strstr(kcontrol->id.name, "Playback Mono To Stereo"))
 		admaif->mono_to_stereo[ADMAIF_TX_PATH][ec->reg] = value;
-- 
2.7.4

