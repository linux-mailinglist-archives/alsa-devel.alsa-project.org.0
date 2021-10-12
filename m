Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C74FA429E84
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 09:23:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D4F8169B;
	Tue, 12 Oct 2021 09:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D4F8169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634023398;
	bh=4v7kPVVpB5B854Otv5ZMoGeIsbKDZu67cJTcQVSqtIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2sfCjqvvhRXPwz7geptd5oK04i20pT+HCB8CyUr8QOEBCFrHc7gidOLY2MxztOZG
	 V8hi37RCuQ8tEQBEwdV5OLdoUjpCRCzx6AcK/6cmF7nWXEtA2k5cD+etGTq8vjQwYD
	 p0EFuho7kBwe3bNSYnmv8eI+6ZhqO1ubWuoGfaHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A052F804E4;
	Tue, 12 Oct 2021 09:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18395F804AD; Tue, 12 Oct 2021 09:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::612])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E70A2F801F7
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 09:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70A2F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="cgROO4Uz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMbxtR5AFja1ioX2cSbGtc9CXIkxej9RslLIghPP5b00dz8RQuKXgV6muNTfoIqkvgXl4gFRg/rCh+jTcFIs8z6AqVJnddLa21L+4TA0a8MkD2A+Hl7jyJkL4RPFO0vCSflLJGZ7wFGzhbXRBo+AJ5UB1G1LBKVfJNhRErzAx+Q+R5fA6cLVgin9CMjBUUnx7oQ23/99DBruzBIatiWoP7CslfyRNhGfJXRbKryeeQnITPaZcTM8HXzwLyjZM6/iHzT0Ehh5TQz588HzH9HceLFq2slWPTzrexDymXDTVM/zxeXGsdmE6PWkTYeFjeWmm7xr+W77AlkMqjBoA/49FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2aNKp2xP70Tb4j+3sSlPPtluLKfcAqPl5661JQYpwA=;
 b=U8lp4lz7fs1XpwKcaGshmkPX+E2ZIJmtgv7e0uJ6OoYY1aO5FHmpaPuZpTkQir6tpAKTKjWDKvUKO88YUDMux92SiIqoKGAiQobvJiNdB3Y/5EG/X2nODKGnc9smzatj7F4FtbmfWvweHtRDckhrVzA78EFLNUHya4s8Em8M8XNFPFIOzmYyTrP3E64BASg+jSlwnUT7Xy3VtAekAE1Zz9g4WztqiLM5zbZLRlTHsiJxgS4XVaaS7M0Rg4mb0jiPhwsTfyZKMN0un1zBeabQHsiLwworfPqu76bnFSOZWvXx54g4LAiY9So+RNffwNczQDEWhYhz6rTmDdMyCwXhQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2aNKp2xP70Tb4j+3sSlPPtluLKfcAqPl5661JQYpwA=;
 b=cgROO4Uz9Ih2tGRvio/vXmbJB4a7yqvnwcuYDAD+V/RM+IRvFTHXCl2IyVUB+OSFrYc7xQb/lB+baIA1b8b5TjTBRsL7hmeRN0y+Z0OuTge3mwH2PpBJo37+o5Z7TECvTuKxvkCCHi67z0UTTgtlxhh8XBZzBBdhmt2wQ9aCYyc=
Received: from DM6PR14CA0064.namprd14.prod.outlook.com (2603:10b6:5:18f::41)
 by BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 07:21:44 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::19) by DM6PR14CA0064.outlook.office365.com
 (2603:10b6:5:18f::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Tue, 12 Oct 2021 07:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 07:21:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 02:21:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 12 Oct
 2021 00:21:42 -0700
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Tue, 12 Oct 2021 02:21:38 -0500
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v3 3/8] ASoC: amd: acp: Add callback for machine driver on ACP
Date: Tue, 12 Oct 2021 12:49:34 +0530
Message-ID: <20211012071939.97002-4-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
References: <20211012071939.97002-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3a3fd8a-c3f5-4c00-be45-08d98d50f197
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:
X-Microsoft-Antispam-PRVS: <BN9PR12MB517954BE49BBF59CAE097BDF82B69@BN9PR12MB5179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bmz4OpB9IMHmg8D0lU7nFliBGgJg99PkUj1Al3DA9MSIgCdOKR5wURGrT9naOC90EQcFvIw/phXFeGxx3pCXXfuJi3g/caC8Ws/BpQtOjlqlFo3xY5za/KaHs4mwsxwbB66ZRrsFnPWKMmDJ5N3LlXPL/9wkRBMRVj5763YlX0aAmbt70qTEx9C6ZVoKhkaodYFTAPYVrO57l/ltBwyTQCPx3JM8f1/KvBrihDUDhl/zPVa9DZdV9PBCs4d2pjJwZ7Q5BW6bnYx7e23qFosXMobjJ+0oW24mui0d53VaQqogi02Jww+LIEXSUgeEKj2nWfzBdeZNKh09jNV/BxcOMVZCHG/4C/APy7RcUpV/6/y5BEWrfxUx5NXqTXskpEt7XfO6D6dVjqN1SwSrxg8lD93ZkRaySnh0PHuYnSlv+9snU8ZTXwBioBl/tDBEgAkOoTg2Jf4NoIDoQq3F6F6jd0gq7FQB79k4Xyg13hhYx+/LN0MQOkvG5nxwx2sDLTaC3lKpoqIboMx8K22G2pQnQMgLyrg82nsEkKyopRWtSWbz6NRcVZO/CRtyJEGMQMXtw76m8Qlr07lDk1KBi1HNIqjLJ62HSsQYeT9ap7rq1b+pATvvoIm9dBZ3U2gDRHn3A6RSpskpVfe2g96RuMV+i8FyTVa+XMbg7Cgb2UyeLWnwmbuppW9YEXltektziuUwtD246nTbmnxxTkJoLN1ySIgPwszWW5cknspB/bssJf0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(86362001)(8676002)(186003)(83380400001)(82310400003)(36860700001)(4326008)(8936002)(2906002)(70586007)(70206006)(26005)(7696005)(1076003)(36756003)(5660300002)(81166007)(356005)(47076005)(6666004)(426003)(316002)(2616005)(508600001)(110136005)(54906003)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:21:43.8910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a3fd8a-c3f5-4c00-be45-08d98d50f197
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5179
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

