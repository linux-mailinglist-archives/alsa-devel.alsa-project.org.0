Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D04293BE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 17:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41A716A5;
	Mon, 11 Oct 2021 17:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41A716A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633967245;
	bh=4v7kPVVpB5B854Otv5ZMoGeIsbKDZu67cJTcQVSqtIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBNHgPLqbfgFr6lugVpULgD1UFsgZ81BDn3ZYZ9Cgk2vYGgXqAFYW8Arr5n4uEAku
	 jB45RboV3MKf8eFiGL3zdTgLX80ZyBemBGTtQ75jHrlqWCRSahHjslZPE9oXzcQiB+
	 IVkqtGDQEl+WpIyTvKVI7C1LBHuqYBxyIO9eMyJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F28D7F80430;
	Mon, 11 Oct 2021 17:46:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 342E2F80423; Mon, 11 Oct 2021 17:46:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B66F800C0
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 17:46:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B66F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="b3Ei/W4/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQEUe4/na1FeVNVdNPuTzROkpe9BOpm041lxUr5WGl1Mi2RhW0FOLgUt5ogxg8knmM+kKqdqmNDUvpxVGXve2AhjaIBDKFF4Ff0CJo3TxS8VRwcdOqS9QEuKFafhFxX5ifqPFrlJjhkRJC5EIWcP9CKmpzQMytBa1fRYb7J10kbYFlyaqcEM7jaC0g9+9q5E2PARe5LctFJVumJBuv4Dn44hAc5VGXOpW3hFf3PoKQhG5XP/aOVKRPvnKl2qm4xrtIvaUfHumY62RjQLkekpUHNl/bVr9+hXYqK1APGsPXRyefvOtH8oSwMqRyj5s6GS8kSxOuqr/Bz1V9w16mDxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2aNKp2xP70Tb4j+3sSlPPtluLKfcAqPl5661JQYpwA=;
 b=Mif1n1aebkuEAkjcALnlnQu0Qh2z7Uvv0FBuuSYqXyHYZTSwZqcXtptrkokb9SE8jIpz1mNC8yqvckkWTQOK6pfWzHo0PwffVAkMRStWRBB7qJABBPqP6XPlSOOxezab128tqqVjQFbAe8xv1RxjiSD7Hs3OsrrG6Ghd8/fBDxlTRlXbWg2a9pBT9jWuCC3iCPAndBtkagKzSUY7PLMxqJRKcwPcaZdQGZx3X340m/suxKxjLZGvqfIlttQiETejH6z524EofTOd4LlvzOECFEiCu5tdn/H15FchsXRCzeWXhf7v1suCt8CKLf3Rbxg7f710+I4YDY2Gg6HXlFELpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2aNKp2xP70Tb4j+3sSlPPtluLKfcAqPl5661JQYpwA=;
 b=b3Ei/W4/fvnP4vOm8MFguUZeU5JSne2WSpm+pW8d7oxPY/fJ1FNFJhogNnYXwkoMT5tPXZn2NwBOJz7x1ahxR6bBFHRk1fNFxdhKUXM8nDnxmUe1Sx+2zgleNkXzPKlX6JhbjGxPM8ARWuA17pwRW1o4cpVdwJWaEz24Db3cCdI=
Received: from BN9PR03CA0101.namprd03.prod.outlook.com (2603:10b6:408:fd::16)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 15:46:06 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::d6) by BN9PR03CA0101.outlook.office365.com
 (2603:10b6:408:fd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 15:46:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 15:46:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 10:46:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 08:46:04 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 10:46:00 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 3/8] ASoC: amd: acp: Add callback for machine driver on ACP
Date: Mon, 11 Oct 2021 21:14:47 +0530
Message-ID: <20211011154452.76849-4-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
References: <20211011154452.76849-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05a124a7-c015-4101-ffa7-08d98cce3cdd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125B9F8129DB727B4B2B22782B59@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVg49poCGhne0uDDrsqeDt/cPVBBgAV1EPA7ArYnGiKPSZRTOSmYSATgAkedUrZY9uUDGTrZuzcJRnyZiWV/9Ifp/q3nqytb8C+zKm4A+zvryx/wcCIYkjOKy3esSFUgLy6g4s3vl0miHFZw55hWTZ8Hmu0p868YdcA4Zdt5lo1doXALHw6i+budNRSST8w+jpZQGEgJsPIuS0dbrPQCQYkoGra7ZrVzb6YjvtS+YJV9OB33GR+2pN1RBvlZyl7V57zOiKHCJ9zBO5EIOj/qWcJ37Scjxzafur3NRTSExJIQJZzLHJylPcI+Da8SvPDcW6R6nThzSST/LqZF4OzABqwCTV13nNq8zW3tk+AIls3vP5PsQ/Gc6kwxyrN0HOb3UlGY4TUPZF+k+1ZLECJWXrw74tjYrCvq1DEND7YaSm6rLtJVdqSuIhFS7OlONv6Lo62EV7wK9Xquqx1tAYmFU7hCsUGKBbL9XPO0fxsKfaTvCPgXa7OR+oeQmGqs1/U3ssMmIsx8eEBl5e8g4ncM4iiLgVB+p/uo+k35GLCtdatOSrfevJi6zLVXAvyg3sLz8kB6se7TKh6tdaGaDjjLpmMPzyEYN8R34mjR9NDREtoygSbmTaRhQ+4kYrpUzcfydFMrho0HIgWP1AZpCgS4az5JR8c5BAw+LZqkmyobmy8HbdrItLYIjzxKF6UukpvT8Guoi684/5z60nfqB+BxhXnWQNARCOeOaoNn2RMWC5s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(81166007)(8676002)(316002)(47076005)(186003)(4326008)(82310400003)(26005)(110136005)(1076003)(36756003)(83380400001)(54906003)(356005)(8936002)(426003)(508600001)(5660300002)(70586007)(2616005)(2906002)(6666004)(7696005)(36860700001)(336012)(86362001)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:46:06.1169 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a124a7-c015-4101-ffa7-08d98cce3cdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
index e79c05276d5f..75003d0a41e3 100644
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
+EXPORT_SYMBOL_NS_GPL(acp_machine_select, SND_SOC_ACP_COMMON);
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
 EXPORT_SYMBOL_NS_GPL(acp_platform_unregister, SND_SOC_ACP_COMMON);
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

