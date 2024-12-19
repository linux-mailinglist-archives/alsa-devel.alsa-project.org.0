Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E25A99F745A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:55:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 263D1602A1;
	Thu, 19 Dec 2024 06:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 263D1602A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587729;
	bh=R5Ixdu4Gyx1Ft7b7Hpl7LzEjeRVBmjPD91i3py8dBdU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lteNBtzi9/ZpAQt70noREJgnGp9lZ1qn1GJ7aRFsI0rVlGPOOpc8UcgWrpVTR+JCg
	 rFiIv2iCq0d+wFNBoPX/gZ+A3iRaHW0ZhmKYQYdUBN8r27v5Z2Vlz7Ycu2QT3sjmFv
	 LR7f55bTx3Vo2hQ80g9qvCD0fRrftWMhqn3iNrCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46AD2F80855; Thu, 19 Dec 2024 06:52:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7619F80857;
	Thu, 19 Dec 2024 06:52:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C83F807A6; Thu, 19 Dec 2024 06:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::614])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2B05F8075E
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B05F8075E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eHzS3Nb/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhohv64xbdIRME+xLUrNbwD9+GtRlx0DzxYdQy81qFuj8btlS05SL219oQCqUUcIZnWNjYuMlfZSa5j8PKoh3883INdmF2gZev/Ffjy6j3dRlnCMKvXNdi1NSaYmGfF5fHOzUxs7DXIg1hgj+1i6MtK85bigyzePll0NRjUVOb4tmNAvnlcteJvIfVZ4yTlUo6my40K5Oa4RYmHOwthSetZ7uA38GTvCS71qIYKdHZ8uHXw89U+YnYv6EGi8Fz0bHZZcm/O4Ozu19YaNXqCx2VdNOZS5CFJBOKh7esyOTmGOIJMBXrn/KRYuihtIGC3Sp+Apa4nf07t0FBhJw10sEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehpkWakawdp//S9miNwMpuezp6lub1O2CYe7mBijSrU=;
 b=JpiNcAPzOOww2EUaN56Hrf2W1T52cqMhQqYeldjo0tZ+dvPnimF72Ya2YaZpdJuZFsXcn9vn8uDImukgLzDkPp/GIjNa0SKZAzEXtRSrJYPKpn+RjbQ6mUWHWV4+3KY5/pRe7BIHgZOoRgCjoEttIPAmByK1qjyTR2U0bQ2j90BARcdGXktM3QuR3jqgPoBnsOpenTImfbwQLJfgWWI/Y6Op7FsT4ryXIigMvQJYU7mk20PkmH8UQQbIWlY11Xu9kmLYiinob+VCJFDp2w/I8E1M13GMSeZTEwcKw58Hz2e2qQb6Vf26HUi9fmv+/SoOu8TTDfj/sr22Tm4SEcj0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehpkWakawdp//S9miNwMpuezp6lub1O2CYe7mBijSrU=;
 b=eHzS3Nb/qgPqOS11DA5YCOGkmei2CgATl4bgTr6GmUGDegSUEbSwCIOzUwBF9xsuU7s1hzeZLwdzHQiHqt/gT1YFqvr0HXpxz3uswoXS2OFY30iZW5T0YYSOm8sU0k9UCRy9xPA60pUGeC3Kw8jH7ANXDvBmLbEzINqawN0KHsY=
Received: from CH5P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::23)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:51:50 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::29) by CH5P222CA0016.outlook.office365.com
 (2603:10b6:610:1ee::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:51:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:49 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:46 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 18/21] ASoC: amd: acp70: create a device node for soundwire
 machine driver
Date: Thu, 19 Dec 2024 11:18:54 +0530
Message-ID: <20241219054857.2070420-19-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0c4b79-1867-445a-5481-08dd1ff13b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ixlGu/iWyZLiSgru8C5g/wayfVxopRGw5GLWRVEuZ31pQJPabPZPn8uSLRwr?=
 =?us-ascii?Q?ulCmgrjLWh9I3Bqhel9pmOujE5UPYrM/1gjUAWVOeErcUoRqjIPpWMUcbLo4?=
 =?us-ascii?Q?r4eGP5Lypwt1N9eNhsfXeUJU4metBG8xY/IRn3yXd1BvKQLaMMiouZzb+h5/?=
 =?us-ascii?Q?JUawkaWB64PUlDHP/M7f4OxdWf9YJzkxi5DXsITkdFvP+M33p7aMvATaewzV?=
 =?us-ascii?Q?ah0WPusr0+ZznI3V7g1OgG1mRpYbgP4BNk77XbyPDtVzHUWq94v2YB+6tGwI?=
 =?us-ascii?Q?SXDaod6qrTXBfHxhNlQhxyQPwhykAL4cO76xa6M576f5Jo1nr8jjhyXEhyiU?=
 =?us-ascii?Q?L63O6eyXgmFz7ao5N/VlCg6ZNQSUCtpaOuNHfCtQ7Wckq85YMVz15YlyxQ9K?=
 =?us-ascii?Q?S0nvjNivwi04gxDJTXqNFjlMWuWyvnKYORF830YYmmcWPCzBNFNzpkW/79M4?=
 =?us-ascii?Q?fXpjRm7NJZt5+a5TN3Jo2UsnEDnfFzk9mLrIWo+zSZNUzvIpttxcKUbUccpl?=
 =?us-ascii?Q?JrYYM7vHW1aR4WUaGbBQr6Cr7u138I2nRu3I3b9XxALKuD+a8n+pd/9f4ktp?=
 =?us-ascii?Q?5uqu9R19as8268iqvQfsZ0NmorJWHhiFBYZJSIyaTTpk/suepopqPOrWRA9t?=
 =?us-ascii?Q?ScrFVSPuwfnbhZP/P1jStS7Z5XWaBgAYrbX+Ac1Bs5qHIpneJqZeMdJegUE4?=
 =?us-ascii?Q?fYVsB+tHdzSDQRImQGp8+IZngE7VC4VIqmaPI6ObRdXtpXJbJeZTIvlrKPtj?=
 =?us-ascii?Q?m3kakizg6ZBDMlWavOZqqj2rmV3xOhLhy8HdfZMM1XTxIC4DmXT5HtyjBQ1T?=
 =?us-ascii?Q?VJyQKYoE6ZVWNnCorao/TSvK9GpWtt47tEbFUvYmOC49KFxuuNoKCNOaDpCa?=
 =?us-ascii?Q?g2EwZJwm2YyeT8j1SnBoVBHA+csadJrrz7T8o7R3vTy1hHlVl/AzTbF84d5y?=
 =?us-ascii?Q?r5iW4PJDPE0DsLQRYvyspXCcmXmEnSKnl3c1iPR1eT2h723WBI8xJx32IgRx?=
 =?us-ascii?Q?JIuVw0R5ZdARCoThSENEvAYsX31qEFUftktPdvg/1tE/mNXKYKgT0E/waReu?=
 =?us-ascii?Q?ocjUvZyy2CsKvb77oUJ/AZCjCmecZOnMY6JN27RyH8g+IOKuWAWoDgIzFTq+?=
 =?us-ascii?Q?xMv6lkN6oqY3XXgXgWf8bNUGVSI2CBTeDdowr68bw0wYW+53XiDFceS3MxLj?=
 =?us-ascii?Q?gsNNtLOqrBdPLF/Fzo2aTjJtKxToF0VSHmjtyXh300mFdd1UOUCGfcGcg2l6?=
 =?us-ascii?Q?gafOfBMXAayVMfJPEHeiU4FF5fsK2ypQwLn3HJG97n4XUaIxsuZD5gsENsBY?=
 =?us-ascii?Q?9SAUgf/5Q1w4O50zeod3jPAgVjpgjQynFr7yJm47krgcyPbDiitLcDF0uJJK?=
 =?us-ascii?Q?+8U4cnsreDmY6GLB/w+ZAOp7KMHW6WhTdK6pc3YbIT2LyucFyPdntocPCHHA?=
 =?us-ascii?Q?ZkYEN8Hp92B2xWKDJ9RUDtOZ1PmfWKf1x5IJROfmNJzUq3+BN6Uw41AQ1GkT?=
 =?us-ascii?Q?onvr6OPpMkcX/o8=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:49.9904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b0c4b79-1867-445a-5481-08dd1ff13b67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
Message-ID-Hash: HV2AREOG5J7MIBYW3TU2IITJP2FVVP3D
X-Message-ID-Hash: HV2AREOG5J7MIBYW3TU2IITJP2FVVP3D
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HV2AREOG5J7MIBYW3TU2IITJP2FVVP3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire machine register logic for ACP7.0 platform to create device
node for SoundWire machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  4 ++
 sound/soc/amd/acp70/pci-acp70.c | 72 +++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index 9774db1ac537..c7dec130f27f 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -239,9 +239,11 @@ struct sdw_dma_dev_data {
  * @pdm_dev: ACP PDM controller platform device
  * @dmic_codec: platform device for DMIC Codec
  * sdw_dma_dev: platform device for SoundWire DMA controller
+ * @mach_dev: platform device for machine driver to support ACP PDM/SoundWire configuration
  * @acp_lock: used to protect acp common registers
  * @info: SoundWire AMD information found in ACPI tables
  * @sdw: SoundWire context for all SoundWire manager instances
+ * @machine: ACPI machines for SoundWire interface
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev : ACP PCI revision id
@@ -260,10 +262,12 @@ struct acp70_dev_data {
 	struct platform_device *pdm_dev;
 	struct platform_device *dmic_codec_dev;
 	struct platform_device *sdw_dma_dev;
+	struct platform_device *mach_dev;
 	struct mutex acp_lock; /* protect shared registers */
 	struct sdw_amd_acpi_info info;
 	/* sdw context allocated by SoundWire driver */
 	struct sdw_amd_ctx *sdw;
+	struct snd_soc_acpi_mach *machines;
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 6884e8516a2c..ae19187fe695 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -317,6 +317,42 @@ static int amd_sdw_exit(struct acp70_dev_data *acp_data)
 
 	return 0;
 }
+
+static struct snd_soc_acpi_mach *acp70_sdw_machine_select(struct device *dev)
+{
+	struct snd_soc_acpi_mach *mach;
+	const struct snd_soc_acpi_link_adr *link;
+	struct acp70_dev_data *acp_data = dev_get_drvdata(dev);
+	int ret, i;
+
+	if (acp_data->info.count) {
+		ret = sdw_amd_get_slave_info(acp_data->sdw);
+		if (ret) {
+			dev_dbg(dev, "failed to read slave information\n");
+			return NULL;
+		}
+		for (mach = acp_data->machines; mach; mach++) {
+			if (!mach->links)
+				break;
+			link = mach->links;
+			for (i = 0; i < acp_data->info.count && link->num_adr; link++, i++) {
+				if (!snd_soc_acpi_sdw_link_slaves_found(dev, link,
+									acp_data->sdw->peripherals))
+					break;
+			}
+			if (i == acp_data->info.count || !link->num_adr)
+				break;
+		}
+		if (mach && mach->link_mask) {
+			mach->mach_params.links = mach->links;
+			mach->mach_params.link_mask = mach->link_mask;
+			mach->mach_params.subsystem_rev = acp_data->acp_rev;
+			return mach;
+		}
+	}
+	dev_dbg(dev, "No SoundWire machine driver found\n");
+	return NULL;
+}
 #else
 static int acp_scan_sdw_devices(struct device *dev, u64 addr)
 {
@@ -332,8 +368,36 @@ static int amd_sdw_exit(struct acp70_dev_data *acp_data)
 {
 	return 0;
 }
+
+static struct snd_soc_acpi_mach *acp70_sdw_machine_select(struct device *dev)
+{
+	return NULL;
+}
 #endif
 
+static int acp70_machine_register(struct device *dev)
+{
+	struct snd_soc_acpi_mach *mach;
+	struct acp70_dev_data *adata = dev_get_drvdata(dev);
+	int size;
+
+	if (adata->is_sdw_dev && adata->is_sdw_config) {
+		size = sizeof(*adata->machines);
+		mach = acp70_sdw_machine_select(dev);
+		if (mach) {
+			adata->mach_dev = platform_device_register_data(dev, mach->drv_name,
+									PLATFORM_DEVID_NONE, mach,
+									size);
+			if (IS_ERR(adata->mach_dev)) {
+				dev_err(dev,
+					"cannot register Machine device for SoundWire Interface\n");
+				return PTR_ERR(adata->mach_dev);
+			}
+		}
+	}
+	return 0;
+}
+
 static int get_acp70_device_config(struct pci_dev *pci, struct acp70_dev_data *acp_data)
 {
 	struct acpi_device *pdm_dev;
@@ -570,6 +634,12 @@ static int snd_acp70_probe(struct pci_dev *pci,
 		dev_err(&pci->dev, "ACP platform devices creation failed\n");
 		goto de_init;
 	}
+	ret = acp70_machine_register(&pci->dev);
+	if (ret) {
+		dev_err(&pci->dev, "ACP machine register failed\n");
+		goto de_init;
+	}
+
 skip_pdev_creation:
 	device_set_wakeup_enable(&pci->dev, true);
 	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
@@ -698,6 +768,8 @@ static void snd_acp70_remove(struct pci_dev *pci)
 		platform_device_unregister(adata->pdm_dev);
 		platform_device_unregister(adata->dmic_codec_dev);
 	}
+	if (adata->mach_dev)
+		platform_device_unregister(adata->mach_dev);
 	ret = acp70_deinit(adata->acp70_base, &pci->dev);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
-- 
2.34.1

