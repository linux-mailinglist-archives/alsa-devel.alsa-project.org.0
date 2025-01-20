Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7A9A16A71
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:09:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA52160299;
	Mon, 20 Jan 2025 11:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA52160299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367742;
	bh=Qi07HhRL7yVQjLSVqDAFjjSY+ui+Geaj7Wx5TgMZVYc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VmcsNUgfz82BFcQgTPNvBhQM3qF4VZGL5/r0WGjHo21OHkR1Po1SWs6O4zQ2mi3pP
	 Y4gYJtQk/j07voVDIf/D2xTt1/21LJukr/LjyT98zaB62P56tY3umftF39vsmfLKeV
	 FYnqE12fBw4FMGuNupz4jzzMl4eQLv0sGwU8+nZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96AE7F806B8; Mon, 20 Jan 2025 11:07:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40A50F806B0;
	Mon, 20 Jan 2025 11:07:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DF58F805C7; Mon, 20 Jan 2025 11:03:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::626])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A3BAF80677
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A3BAF80677
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MbDLEHQ5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiyc7cPiajppKcNDegBRm/GgAg5eI5/v8jshYzxLCpxyKTGWCVMClTGKpIvKwQyl8ANH3DIC8o0dc85eOe4lOGpFrtGvK3nHWb1FTNp3ijUg/4Ds8j3evgKRpvRYYFHviDNlP6pb50Q7lfyRKH5L+Xr6scbkhKna3+kI14H39y8q9AyfjYjBoQXKEt9hTE8Uc2RxxvcmEQA8z0MooBfGdNksewDxJbWYv/SpnJ42LuBpI6PqbD95vtTs6UbWEyvLWQj7fuFPGeniFzPdmYstdaVRVgU08M3xaqIx4iDjDPpcgEhJODV7wIUMBK/MizhcAyFn0YRE87GZQ3L64b4Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSCDL8ng8+/KVmQI78tJQdaIkXOMa2mxp4y/82+V9Kg=;
 b=owJptnRjp4XLhUI32MOpgPclCgFsw9qKG4iGjWKck0omgwsaS8UvbyTCoiT4lObOdkJlWgMizIzUnykFPIJr/npSeeLKdWPjK7NzaNrV3RRWyC+KzmZZhoxqPhzdgBmXIwTWilx9KKB0RJ/B5GvjyYJg7jyWNxXiefCG4Rk+aq1iWdeWorG3pz5d2G5T6OFW/TR6tmPKf9CwHjKy+jAKT7HK/w8/xb+e2Sd2JU+bE9mV/QRysLwccJG9T/LYv1SmXF4n6MAhr3JdPSW4IVjyO7o14/UtQW4B0CtNGtWIhGOHrFPnYKzSUxS5f6uwo9VxJ3NtV5OroJzatO4SzYSjtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSCDL8ng8+/KVmQI78tJQdaIkXOMa2mxp4y/82+V9Kg=;
 b=MbDLEHQ5wMeJSQH2BTtxB76QDRNClAjLAfAXIjoUXc9bwzrdiQOIcsKNdsTiz2U6q9GGsfD8FjmtmHFTaZ2S2l+hpICvGcXe5k9NkUC/eDMtn15GpgTtzf4H6JWJTY7sFceT8RxjWFO/tGzfM33OSUxY5qserXC38cIy3qJp9gA=
Received: from CH0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::7)
 by IA1PR12MB6018.namprd12.prod.outlook.com (2603:10b6:208:3d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:02:54 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::64) by CH0P221CA0029.outlook.office365.com
 (2603:10b6:610:11d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:54 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:51 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 20/23] ASoC: amd: acp70: create a device node for soundwire
 machine driver
Date: Mon, 20 Jan 2025 15:31:27 +0530
Message-ID: <20250120100130.3710412-21-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|IA1PR12MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: fcc6baba-2290-41a8-9532-08dd39399bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bFbadFRgTUnRK89UUlFmtlWyJqixHDh4U3AVkaKmdDPBCH/HtmObkP2Mzc5o?=
 =?us-ascii?Q?7GzViyQ+WMvHDjsPdZlUNDfbzQzceVYJgvZJK/obxxMhN0GihK86MqVELcpo?=
 =?us-ascii?Q?eorlkmXyND6UOWN45xFxjG+z2RUqeEtLAmAJ6dYotDOaDsusgv8EzPFq9aj2?=
 =?us-ascii?Q?nuEVP2c/+VaeYuEVjLM2RX/rPoQRKIixKnuoUAW0Ho3jp/d0myUhjUhYaPSl?=
 =?us-ascii?Q?hRSn4lO/IdYzd7k+L18Tau9oUtJecq5MPKrYHcfmIkot6D6Izz+M5LP6LnHZ?=
 =?us-ascii?Q?112TG2M1h7McE3x2Okrglllownsjc9a/IRpIzkoTk2WDY/VkMVFajurnJbCd?=
 =?us-ascii?Q?/0P1hQ+v+zok5TNVPQFrm4F44U6UdlX27RWl7ExypQ1N/zn1IQ/PA51ZOz5I?=
 =?us-ascii?Q?pJjEk8Byx4pmLpe9eYpxfyNb6i/QBwP6YQrj1GTVFHCuEb8mIKxijbJRFiMU?=
 =?us-ascii?Q?J8Jjs60ugphygNoif2ZcnwMlK7prObEk5boq0QAIV8aK89P+SK2wvc92bda6?=
 =?us-ascii?Q?yUpPC4u2ZUlWxWvztsJ4XYTACSSWR54OBPSIWOvo82BV41JztgxirlBWclLL?=
 =?us-ascii?Q?046lQqt67qA/Os89PqM0NYYSySoc0jNP3OpFU0cVufSu1pWwHuUwdSCT4rjX?=
 =?us-ascii?Q?SwdYu2cRRNBTL6FrIhmgSg/Xf8mxl81HUcPM5iON0poTOyUi9VU1W1yHZr8S?=
 =?us-ascii?Q?ieQ0sp2zkvyGmidQBGhXcepw7Nr7G3wOPq7ChKxyKHzER8uZZnEG5NitmdeD?=
 =?us-ascii?Q?SrUyXUEE0LbflYjBkImSl9SmvjHqbt6NSMLP3FOzNT+eMHLaH2btHlXpGAbH?=
 =?us-ascii?Q?Utl/pxjzRhWmmE6G00K2CpP2P1hovy+bwHIzJy+ZSCXyLRCKMuCFuliBwg0F?=
 =?us-ascii?Q?qLah8gCJDfbzNt+05E6LOdUvZdR3hn8PWA3S/GsXy1gKzltbRgccUtwTubUn?=
 =?us-ascii?Q?xtPawknw64xFCwGm0qlFCsbKnjVfpBMVu0qHi0AusxEUM4dbrxkB1lk9Zeou?=
 =?us-ascii?Q?TZMcSeU1M1lJkQYFD2iibeChMyP44Ytp3fr2YdsVzhJqtEeIPdhC30efpZR4?=
 =?us-ascii?Q?8lxcx0sWhDD2+0q1Uwy6G3DR7SypmFfC/PwkA8DbygsD5OeoW0JvuFkx9gtR?=
 =?us-ascii?Q?I9BRB/eSqwY2HdM6eI+E1OPulgdABLca9lgVgXgepCwjZ2uCyAIdkiXGenOD?=
 =?us-ascii?Q?jsi4pXM4oo+2xzw3TicmTBo1SNSoM6hcHqKFYLV6+hJU276cs45a2ufNNChu?=
 =?us-ascii?Q?3zcl+CcXgxqnpSAcuGVvGh/83P/pknq/SzuZw+sMCQ0zH57GM1V/e2CT6TRy?=
 =?us-ascii?Q?fxUGZkQqQWRz6ZiptbD61L2Huojw+3mFAkk8PAJiEpnoRyA7WZInNjKhN0er?=
 =?us-ascii?Q?5GH7juo1FO3MWyQkKY2lA6TFTnXIjPaFcs6ciY6KbYWP3cBDuM766Y+HZtCf?=
 =?us-ascii?Q?PAnQGB330J9JTB8YC8BglNfvhLaF94AQUz+y2OTFq9vcoJ0DnMUxfNbJNHbD?=
 =?us-ascii?Q?k0EMM5t/agr9KYo=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:54.7498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fcc6baba-2290-41a8-9532-08dd39399bed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018
Message-ID-Hash: 4L6PVCWDEVBQD56HD5ZYSBJLTR3ZMTRU
X-Message-ID-Hash: 4L6PVCWDEVBQD56HD5ZYSBJLTR3ZMTRU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4L6PVCWDEVBQD56HD5ZYSBJLTR3ZMTRU/>
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
index 232210df6f10..cdf2d5a31fe1 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -240,9 +240,11 @@ struct sdw_dma_dev_data {
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
@@ -263,10 +265,12 @@ struct acp70_dev_data {
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
index e7da59a5eae5..211481cf2d87 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -368,6 +368,42 @@ static int amd_sdw_exit(struct acp70_dev_data *acp_data)
 
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
@@ -383,8 +419,36 @@ static int amd_sdw_exit(struct acp70_dev_data *acp_data)
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
@@ -621,6 +685,12 @@ static int snd_acp70_probe(struct pci_dev *pci,
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
@@ -724,6 +794,8 @@ static void snd_acp70_remove(struct pci_dev *pci)
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

