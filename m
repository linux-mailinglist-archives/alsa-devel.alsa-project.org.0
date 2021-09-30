Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C041DD1D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9409716BA;
	Thu, 30 Sep 2021 17:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9409716BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014955;
	bh=JOYBLl+X0JeZM/uvqUn29k0qdtbkcCSkKoYutfLi/uc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lz+vsN9o1G81gmTxifpbdcYqwg6JKdBeRIHsBN/GXQamoum5mbqPko4B/UbEjiQEL
	 AQzK+u5Pd4YkchO0DhrYmGhQU0KPdyxUjv7h5Golvi5O4lG4xLpTKZ/ie6g+If6ueI
	 GxtaFpmMvUFA+QO8VqM3XWyeHT3CI19bFiTwyy0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86854F80525;
	Thu, 30 Sep 2021 17:11:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9ED6F804AD; Thu, 30 Sep 2021 15:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 340CFF800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 15:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 340CFF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="cD6gVybx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzpBQi0x8sj8zV1DUhj4EzRImL3W+Gd5FAyvV/FNoXAscd04L7/kXwDM5ksA6vEuggh02pLnDNKjFmpLqQrFstLtCyeMaz2dWCIXzPMdeonjohZQZEtcecTlLhTAgtte14owgIOVseKV4pOXlJqbIBeSXo4dndyobS4KZmmAz5Ea6jUB6RFnUnBxt6AThQj5JoATM0s0nJpwH9PHIO9UMm0GiJwPbleVjzZ+qF52Uo0PZIzvE8mLszyaXzVu/Qc4NSW4r338BXsIahkM1kbBpBGo1WM9XHJtMMIHqBedOrU65jm4vuMizeywEZPQR8/HszDjThRbskyD8W5MXO9UPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=d/OTof6Ymf+CwCCnmj7UPYheS7OVe3cW30zBhzZWBiI=;
 b=gdTkC7inwOohWwaUHAI0jkG0JGCJ9MVVSFVVH0Bva2BFb4olGiub8RBSvk20SR34HlGIEGytOAnFJ1mN8VsGkrhZG6sBmbLw1dT2kumHWpOk84BKsunm92bkc28ujQimKP8Sn5GhHexGWJ8cJfwgGZUTC6W9ySNmR4M6+8gi2Umc8j+g1QoC60rkzCBhqlea6nZ7emz5HDUPVJmsbu9HCjgVZmqT7UYKMAqdpQySUsJGmYmSChRLoFubVa8O574+RLFQLTTCWmbv90VJYNEetuMWAJTymT9BE/nHTHSJvX+3SwwQR+a+RLvnJvBWNUGFSNA7czcIR9bdXL9eM7iLvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/OTof6Ymf+CwCCnmj7UPYheS7OVe3cW30zBhzZWBiI=;
 b=cD6gVybx/PK/c0gwBj4Esdbi/+KzXyZIVeSgvAgzrX4Ryhga7gafIPTPIvir2waxAOG5Pysa39oZHOA5DbC6I/NXPa19eEsLYilRBK5EmDsOU+cqtl2VFR932j+YiCTcUtSx+U4a/1MYhB+QhutqSVUQv5RVOH7gJw81dKXxm0Q=
Received: from DM5PR17CA0062.namprd17.prod.outlook.com (2603:10b6:3:13f::24)
 by DM6PR12MB4731.namprd12.prod.outlook.com (2603:10b6:5:35::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 30 Sep
 2021 13:25:56 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::f2) by DM5PR17CA0062.outlook.office365.com
 (2603:10b6:3:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 30 Sep 2021 13:25:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 13:25:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Thu, 30 Sep
 2021 08:25:53 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Thu, 30 Sep 2021 08:25:50 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 3/8] ASoC: amd: acp: Add callback for machine driver on ACP
Date: Thu, 30 Sep 2021 18:54:13 +0530
Message-ID: <20210930132418.14077-4-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
References: <20210930132418.14077-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d253ffe-cf2b-4575-2120-08d98415d5a7
X-MS-TrafficTypeDiagnostic: DM6PR12MB4731:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4731417F0F452CDF5F2E36F282AA9@DM6PR12MB4731.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9vvmL1b/skfJeKi99Dl9gZiTSdLKnFmHGhUSdTZ8SMf24PnP0aHOHlol17H6R+CZRsw99CnPhoWOwRefKKXqYnLJipVLgCgSeVdh3DA4Z2mr010j4p/Ax2llPYeitIW6Nfk+OtkOSgkdXOyWIfsU0BvMDeVRjISAGuO7ismqymhACPikNwnbnSDUsJdUNlFi2hejpltryeJSM+pi74hdgPt6OlUMmNLxACmi4m5Ko7VCIQrSpmxfRuND/HziqUm+gKQ5M0fuglPEcojjJepPSL7tH1Qgsc0W6NYW6A0yaf1RPpzlTFTqzCRXb9d9OkEmMDSIGXVPV1rm8a9xa5uTH0mCLy1qBULx8giNghEhE8265h4lPJ2vyxkYiHa+9vwEOwGkvzg/6DpwW+jAKT4xF2vblZLft0DkBQWuO2jMSuJpGiUTcng4v4FDjZ/C1/r2Gu7gVUIQEY+Ea/pFKjemASUTdKmAtCPyxqMVuNWL015JGDergt2hAAK7KsudmpDkhv4/xIRXO86vevkJ8KtVyL1jCPFFEpvmyOi14PtL4iJ8hZ+Eb2NsCwr6xw1kDQvfBORafyWzg2XDk6gmxEWuzRAyb/cx4tSU70WYhKfwRPAiemb8yfYrsso9PH8Ak6bIgBfVp4QJGyZJ8olvMKYOfwBFqMsMQDuSwfcJzRqNXBb7oJMBuV+NEbOeFgSxKwZusKE/LTvfy1mjm09Cg7yWIqoXvaSdSg1XnLVRPuVvO4g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(8936002)(83380400001)(86362001)(36756003)(54906003)(81166007)(356005)(7696005)(2616005)(5660300002)(186003)(4326008)(36860700001)(6666004)(426003)(1076003)(8676002)(2906002)(508600001)(316002)(26005)(336012)(70206006)(70586007)(82310400003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 13:25:56.2515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d253ffe-cf2b-4575-2120-08d98415d5a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4731
X-Mailman-Approved-At: Thu, 30 Sep 2021 17:11:01 +0200
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com
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

Add method to select and register machine driver for acp platform
based on ACPI ID.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
---
 sound/soc/amd/acp/acp-platform.c | 23 +++++++++++++++++++++++
 sound/soc/amd/acp/acp-renoir.c   |  3 +++
 sound/soc/amd/acp/amd.h          |  6 ++++++
 3 files changed, 32 insertions(+)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 2eec2133b4fc..5d575c06fd9c 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -67,6 +67,27 @@ static const struct snd_pcm_hardware acp_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
+int acp_machine_select(struct acp_dev_data *adata)
+{
+	struct snd_soc_acpi_mach *mach;
+	int size;
+
+	size = sizeof(*adata->machines);
+	mach = snd_soc_acpi_find_machine(adata->machines);
+	if (!mach) {
+		dev_err(adata->dev, "warning: No matching ASoC machine driver found\n");
+		return -EINVAL;
+	}
+
+	adata->mach_dev = platform_device_register_data(adata->dev, mach->drv_name,
+							PLATFORM_DEVID_NONE, mach, size);
+	if (!adata->mach_dev)
+		dev_warn(adata->dev, "Unable to register Machine device\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(acp_machine_select, SND_SOC_ACP_COMMON);
+
 static irqreturn_t i2s_irq_handler(int irq, void *data)
 {
 	struct acp_dev_data *adata = data;
@@ -283,6 +304,8 @@ int acp_platform_unregister(struct device *dev)
 {
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
 
+	if (adata->mach_dev)
+		platform_device_unregister(adata->mach_dev);
 	return 0;
 }
 EXPORT_SYMBOL_NS(acp_platform_unregister, SND_SOC_ACP_COMMON);
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index c7fbf71e4669..82faae1b110b 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -111,6 +111,9 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp_renoir_dai;
 	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
 
+	adata->machines = snd_soc_acpi_amd_acp_machines;
+	acp_machine_select(adata);
+
 	dev_set_drvdata(dev, adata);
 	acp_platform_register(dev);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index ecb53285526c..3532f4d3ccff 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -90,6 +90,9 @@ struct acp_dev_data {
 	int num_dai;
 
 	struct acp_stream *stream[ACP_MAX_STREAM];
+
+	struct snd_soc_acpi_mach *machines;
+	struct platform_device *mach_dev;
 };
 
 extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
@@ -98,6 +101,9 @@ int asoc_acp_i2s_probe(struct snd_soc_dai *dai);
 int acp_platform_register(struct device *dev);
 int acp_platform_unregister(struct device *dev);
 
+int acp_machine_select(struct acp_dev_data *adata);
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[];
+
 static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int direction)
 {
 	u64 byte_count, low = 0, high = 0;
-- 
2.25.1

