Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A7E944A59
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A08E43E48;
	Thu,  1 Aug 2024 13:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A08E43E48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511634;
	bh=BWY0HeMKX5j8MYwzt++fcvfMywe9slgt84bF/F1opb8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LgZ8F4Tp3yXpGUvHVwNHUwcjJc1LMms+Lv8AL8lKLV8fKxUTogUZEGPrSc0WwN9fG
	 aoMR4/8DuIG5qai/hsSa2gfpLavpu0pI8TnPI6YakUk2O4NMrGzJwT9krAJFmEOGGA
	 bQeoW2hfhBxyw49yIStGSDQsFtNf9IyS9SQ9skdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA7C9F806D0; Thu,  1 Aug 2024 13:24:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D046F806C0;
	Thu,  1 Aug 2024 13:24:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FE4AF802DB; Thu,  1 Aug 2024 13:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12669F80269;
	Thu,  1 Aug 2024 13:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12669F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ZTXKkDVX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0F5TAnAlbUJrtFGjvMtSxU5661OcOtoxKgYvjAjITBMn9mD734Qm4+OIlGVxGt4KFS+5gGSGvpEeCl/nHuxeh//JvGIsrjuNNI8rWfQUi17QjUsfUXzn5qxp8QuOnamGPX4MSYWvyPicNiuU4Xb+WTv8CEWidkVMyTjQTahm88gWEf2LclC9gOoVazB4sNmw4EbKNJfmatOxEt8rPyGxXUKyaoRMFKPe6VG5hFoVy0vX6ZAWg5rygJ8+xlTUMTHZpVnJAJPPsya73Nu6J/h+vNYwE0ZIT9t31k3QubiHGMxKSChb13j00SiDSy9ttPq8DauRNfhhN1RIiBRjWD2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkZH9XUeUOi3DFK573qstKi2PUYImuCo1rsunQifSFk=;
 b=iF86hDG2ob0d6lmaWWS4l7gxnLps/kWL17vb8QIUfvuraCD9ygWwDy+wgqwD4KQiAzNlIdr0uzCsw1c9OlSid375+5qv0JVVRytElRvbLitxx7qIDcEjSOjUNCs8eYc8qbd9C4NJLrl3wM5zugB2x2YIT809n5zgkoLGoYoMF7HMMmrP4/AJhEO7WcOv1m20uNnzIk8sUpU9/MeYYc9+p3PlO5zSmtK2R4DBWAQCkqdnvMLzpJOVdJlxe2dOABxyrE/OrzyPHDmPe2LL4wTO7LBMqdgTpKPHNcovmTqRy0L4Xrm+oUcXZpeXEvarkwFvZVX9P7cEmL7WViF4eaRuPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkZH9XUeUOi3DFK573qstKi2PUYImuCo1rsunQifSFk=;
 b=ZTXKkDVXsnOgmlzpU2/VvU1rpY9Q0wZEiSECmetTYnGCnEBdADzoRieIXmkTTQhN1mRykJqQk3omgou8SaLBIhafpJx9tKotOWYRo9uAbWG0UNpL7XtwyWlvho+U2kwOlwoh74Tovth6ALTGTTrMBqvaForH8LVKGM2Ds6rgcfM=
Received: from MN2PR20CA0050.namprd20.prod.outlook.com (2603:10b6:208:235::19)
 by DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 11:21:17 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::ef) by MN2PR20CA0050.outlook.office365.com
 (2603:10b6:208:235::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 11:21:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 11:21:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 06:21:16 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 1 Aug 2024 06:21:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vijendar.mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <venkataprasad.potturu@amd.com>,
	<yung-chuan.liao@linux.intel.com>, <linux-sound@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Wang Jinchao <wangjinchao@xfusion.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, "moderated list:SOUND - SOUND OPEN
 FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND 30/31] ASoC: SOF: amd: update mach params subsystem_rev
 variable
Date: Thu, 1 Aug 2024 16:48:16 +0530
Message-ID: <20240801111821.18076-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Vijendar.Mukunda@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c30efc9-460a-4c9c-6a3a-08dcb21c0fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x8Rm3qFF+/TIYMZJSjVLCMd9ybPXj1QcC4GYZWvmRtNrUWDuR3KkCwcrIlVU?=
 =?us-ascii?Q?SJOsZEPGWkhTWdkNV77C+PQi0naULraODv72IE//zAzo1cP/24THNKutTM/I?=
 =?us-ascii?Q?Xr6znwAKtZwDlw1KbgKFYQ/V9uKujg49UrGz88JwKfyJy2FzIEY0HZFqPbIN?=
 =?us-ascii?Q?M0dniRKAUmOfYP6lDo6LdJ/Vvcz81D0+uyYIaryAp0whAGSwyX/q6zObcQNv?=
 =?us-ascii?Q?6pd1g7paqx+fdj7V7TVPHeBley3EnkDV0//8pBvj3og224x9Q0IRAoTsEs87?=
 =?us-ascii?Q?t29dfRHy/uFhqpWj7/MOKa7i7/YrfhBuoEKsVgkzWrLPzh6CbAnlLC5PwIJM?=
 =?us-ascii?Q?nZHmLsE+gGqn8Z3AYXVa5OgSKp2PoQ+0M2cZ8csOBST+uAZY2GGzuo4IUFDB?=
 =?us-ascii?Q?Rs8czy/6CRlHbb68O5KbRpDw9uxVlz+56aNgGipWlyyOYdduLDtOg1r7Wbe6?=
 =?us-ascii?Q?xnD81JvcufUAfeEsr9kDVoJXOupantnSvVgvC7L1uDQUCzNdh0ymz9SOY9pR?=
 =?us-ascii?Q?gncWwik/owfFsmBRsu8CfP76/g+A6PXdHZ4EJCVqL/ujYKefitcdjMwEGjDh?=
 =?us-ascii?Q?xaq2kcmK6uXi/qAsf20XJev3Ns+Um/vNeFH48mBzgW2PaTotb7Vh7ROwypw0?=
 =?us-ascii?Q?x0XSdDG5mffpgrIfez5t6Q9lgsIGNm/V8BBxIhGjs2Qfek7Yc58FWanQvzFG?=
 =?us-ascii?Q?8MR/jboSkA5ox3HHp8vNvalrqewMReChZjouzZQj7W1/yqz2G1mgZlkY3OqH?=
 =?us-ascii?Q?3Y67NQ5Y1St7CuOBUZEUmjc5t9/C2LSAooiHa8fa3ehcp2bEFpMn6RxD2FsR?=
 =?us-ascii?Q?LmCUi5QwhOta97WzDSE9cwLcF1keEPuFCeOkez/XMgzS1jML3rZDKHSLXyLQ?=
 =?us-ascii?Q?a8PNq8X2dDD1/eMY7YR1diWrrKwiRYHeY1IMw+Zq0w9HpilMcmaCVAgceJ4z?=
 =?us-ascii?Q?lriH2Yz1dZITFJ4qaBTqbT0oZACfSjad3Ud2cdcUVh5zLo8lvut1Z4mFSmvG?=
 =?us-ascii?Q?SjaNhL5VdRQdbZF9J3qY8Hf7pmkFvbLHvdsWZXZJJwsCbqvZVhh83MYVv4Vf?=
 =?us-ascii?Q?dtoDG+I9RyNpWzkUFSvUKD+BXehAZkqrPpP28RmxnESVM/LvJ/NvQvk4Fx7H?=
 =?us-ascii?Q?tVoG52buWT3l2Ezp3acr9z9O2PohJ1D1Yhhe6UAwDTyFNtp4kB4Pa86kY2QB?=
 =?us-ascii?Q?lAz3O/wXKsItsTs96dp8zpG/hXqLMYn4eREZjL0IznMi1J0R1akG7C3Pk2wX?=
 =?us-ascii?Q?PHcnF9zqDwHMKir7uwGrlRZjp03CNevwL3oUkDtG0X4UoFrUzM58BEHQfwP5?=
 =?us-ascii?Q?T+ohqlNIU0Wdj4OUBKrbM3bQubD4yBqDHLw7gzUyNbgAxvfEI6XL+se5KZVq?=
 =?us-ascii?Q?SnRIHJZ+n1VLxc0ppnI3QeYH0P9Y?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:21:17.1886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c30efc9-460a-4c9c-6a3a-08dcb21c0fbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550
Message-ID-Hash: YBBVE4ZUCL6WARAONGMCVJZKUSUZIESE
X-Message-ID-Hash: YBBVE4ZUCL6WARAONGMCVJZKUSUZIESE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YBBVE4ZUCL6WARAONGMCVJZKUSUZIESE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pci_rev variable in acp sof driver private data structure and assign
this value to mach_params structure subsystem_rev variable.

Link: https://github.com/thesofproject/linux/pull/5068
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-common.c | 3 +++
 sound/soc/sof/amd/acp.c        | 1 +
 sound/soc/sof/amd/acp.h        | 1 +
 3 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 81bb93e98358..dbcaac84cb73 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -153,6 +153,7 @@ static struct snd_soc_acpi_mach *amd_sof_sdw_machine_select(struct snd_sof_dev *
 				break;
 		}
 		if (mach && mach->link_mask) {
+			mach->mach_params.subsystem_rev = acp_data->pci_rev;
 			mach->mach_params.links = mach->links;
 			mach->mach_params.link_mask = mach->link_mask;
 			mach->mach_params.platform = dev_name(sdev->dev);
@@ -173,6 +174,7 @@ static struct snd_soc_acpi_mach *amd_sof_sdw_machine_select(struct snd_sof_dev *
 struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	struct acp_dev_data *acp_data = sdev->pdata->hw_pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct snd_soc_acpi_mach *mach = NULL;
 
@@ -186,6 +188,7 @@ struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev)
 		}
 	}
 
+	mach->mach_params.subsystem_rev = acp_data->pci_rev;
 	sof_pdata->tplg_filename = mach->sof_tplg_filename;
 	sof_pdata->fw_filename = mach->fw_filename;
 
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 74fd5f2b148b..7b122656efd1 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -695,6 +695,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 	pci_set_master(pci);
 	adata->addr = addr;
 	adata->reg_range = chip->reg_end_addr - chip->reg_start_addr;
+	adata->pci_rev = pci->revision;
 	mutex_init(&adata->acp_lock);
 	sdev->pdata->hw_pdata = adata;
 	adata->smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, chip->host_bridge_id, NULL);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 87e79d500865..ec9170b3f068 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -251,6 +251,7 @@ struct acp_dev_data {
 	bool is_dram_in_use;
 	bool is_sram_in_use;
 	bool sdw_en_stat;
+	unsigned int pci_rev;
 };
 
 void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
-- 
2.34.1

