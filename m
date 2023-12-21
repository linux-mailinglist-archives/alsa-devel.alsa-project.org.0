Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7381AFBC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 08:43:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A611839;
	Thu, 21 Dec 2023 08:43:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A611839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703144611;
	bh=X1rCHQReBAc6/5R4G28cNMYQ+KwZYl8KhiE09u+h2fc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PTF3rQQ2pukfq13wHSGVlYCD7fGwyGqNXmnyM+QDwhK40Qiper6JM0qnVNSYmZuE1
	 xTO+l1iTO4DYglUDgr5+rUhe/2s0uCGE5Vua1TPnGoy0DYMHOHrIPApHYuKcpglHjt
	 i1sV3dQz1eC8Ufmn80fPG1e4PmrAcP4jwK2RHGCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44458F806B2; Thu, 21 Dec 2023 08:41:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF04F806B9;
	Thu, 21 Dec 2023 08:41:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21A6BF80153; Thu, 21 Dec 2023 08:38:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 734B7F800F5;
	Thu, 21 Dec 2023 08:37:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734B7F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CKcfAvLa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7PO54kfXFup4K8kfvqkOjltFEBAzCUgY6k1fPHnSDo6gMpMjoTiOibYXTFEViE/g1Io5rG0CoCWsgsRPIB5pfNkdevLKBgub/gK0ucpYdMP1LPeslwUUCfQNNPwKEYMKCQpb9ngCYO7YwMtBZ07xU9Jizi5WajhMW2ROdtf/EoZ4JJYfZ7hR4210cdMDc1rpXDJSP3tFQPsWFp6bbA1ZMoxDW9vWUsixg0j5h91pjmwFI5zpcHiM+g8RXPgoPYXBXLe8f6m5t0+yWDG8Y4vyFQt1h/df3XxbtzA2dAeTV71cJwCd95szmpx5K0GAxyL4Yf5KakaRZztEvSdabbqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+omCGRhppcTZgY3hpYmOov+emvix6/ZrChbQ00XGnbg=;
 b=R/v9OYooEy1XnRKrY44Z47gUJpITtULC7N4U1hgfdUER1KP4+5/RaRSdnAK5BA1JAimxBla8eordDz8/BUa432OoEeRi242XnhqFXlaMJV1BcaSWhCx07FBEMMOB0uHmLPX/lME7T8BNh+STdLVHyWeb3WqCINubwebqrLiHCzGAHfw5tHLhYm7nnPlQZfMPU9VVlaNK3diIlB2Gi+oOr8eDzQbncBcPEZsB0FTjuKez+MR/cuJlHAOgJWw26xDjtQFp0kGO57FgFqWgDXTr7w34foNHR0UIWEy5aB4bCTfGvUe9xj2ydcZ6XV4yqB7G9oVqfQjPAp6wmmN52EnkZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+omCGRhppcTZgY3hpYmOov+emvix6/ZrChbQ00XGnbg=;
 b=CKcfAvLaSwpXm2IH4Rgh+sYisr4QR988HRbRqSfTqWPo2ji13BV0N0/9MoDZRLQsSziAAE4CwVX2GpYoeFKr2n2LDFwNXKSexLM+I8QFZ/BZBt23o+tqao/zjGA2AfLCIMbQkfz0RNUpFbWVUoGl2OC7STfojmFu9jadWfq4aKQ=
Received: from MW4PR03CA0196.namprd03.prod.outlook.com (2603:10b6:303:b8::21)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Thu, 21 Dec
 2023 07:37:41 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:303:b8:cafe::e) by MW4PR03CA0196.outlook.office365.com
 (2603:10b6:303:b8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Thu, 21 Dec 2023 07:37:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.18 via Frontend Transport; Thu, 21 Dec 2023 07:37:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 21 Dec
 2023 01:37:40 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Thu, 21 Dec 2023 01:37:34 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <pierre-louis.bossart@linux.intel.com>,
	<vinod.koul@intel.com>, <venkataprasad.potturu@amd.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Peter
 Ujfalusi" <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Wang Jinchao <wangjinchao@xfusion.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 09/12] ASoC: SOF: amd: add machine select logic for soundwire
 based platforms
Date: Thu, 21 Dec 2023 13:05:55 +0530
Message-ID: <20231221073558.3181911-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
References: <20231221073558.3181911-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|PH7PR12MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c2faf2-435d-4f80-4e64-08dc01f7b6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gKf+Zl+StYnmutEYoiNIJ+8OK8APXOOhKbLYqqO9056yazzUbuILCOJSCfUcvH2w+SQxoHf07W5rdJECoxK7Z+RcQTc1LMp5hV9HwkRX3u/6p7BbwcCr3cSFGKZbFvcSVP5NadPMcjWLLAangJOeM+jdwJfcEHeYf9F7CQpsbEbHpR6XRtE3KK+n45mbViXpmEqktS8/T+ps0FNLs9Ew+hFzOoZxkPN0bkXgq0GNdgS2Ave/9/0xTR+zulP9B81oWbg4CoAHK2Zbzoxf+jd4wtgij+ofM3fyOZFoSyA0WJFS0PuxixQpbm7jdjYacMtlZOx30SGjVABeHUd2P8bfB2zX5Q5PDZ88wtfDNdEZ+t1Ed0MKkCeBFRW+DwX7Wkb1bcFxoSomaZmNVU0HOsAifXBpJ/rfPlpFfnVu7b13Sume9oe2eWd2rpVxmjCb7Zx2QX6ceb3hNjh28xwEF7RbXpnseFdTVai0YcXtl/EAutZBJTc4fDylZfp0gEmxBeyg9z/+wQ3qbZ5HCgtFI/733SmWn4aA77YdLm8dmLkWWPFVPY/0mSHzuOQmscBXsFvHwLFTo/WdXlirwtH5a8YzNCNnc4Abtxfz1a4GTWNjBHyX25E3eWPSmcpiYuMHm0d7xaknjvaqaMUdiZzQKkEcOdVIbisko6W9PR5k8tuVLZxldrtnzdbDzqFNNVkdADqBWnlwg1WhKifI1VERX8nn9VpWpxCLiMGkd0ILAdeiKosAQUw5OF5FoCS0DotPmntfXRL0Lf7ROqhB2BCI5DgsKg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(5660300002)(40480700001)(7416002)(8936002)(8676002)(4326008)(2906002)(316002)(54906003)(40460700003)(70586007)(70206006)(110136005)(478600001)(36860700001)(36756003)(47076005)(41300700001)(6666004)(426003)(26005)(336012)(1076003)(2616005)(7696005)(86362001)(81166007)(82740400003)(356005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 07:37:41.1147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c5c2faf2-435d-4f80-4e64-08dc01f7b6a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666
Message-ID-Hash: HP44LTLT7DLG4QVOU23WAUWQTMHQNDWL
X-Message-ID-Hash: HP44LTLT7DLG4QVOU23WAUWQTMHQNDWL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HP44LTLT7DLG4QVOU23WAUWQTMHQNDWL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add machine select logic for soundwire endpoints for AMD platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp-common.c | 65 +++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 2d72c6d55dc8..0fc4e20ec673 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -118,16 +118,72 @@ void amd_sof_dump(struct snd_sof_dev *sdev, u32 flags)
 				 &panic_info, stack, AMD_STACK_DUMP_SIZE);
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_AMD_SOUNDWIRE)
+static int amd_sof_sdw_get_slave_info(struct snd_sof_dev *sdev)
+{
+	struct acp_dev_data *acp_data = sdev->pdata->hw_pdata;
+
+	return sdw_amd_get_slave_info(acp_data->sdw);
+}
+
+static struct snd_soc_acpi_mach *amd_sof_sdw_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_soc_acpi_mach *mach;
+	const struct snd_soc_acpi_link_adr *link;
+	struct acp_dev_data *acp_data = sdev->pdata->hw_pdata;
+	int ret, i;
+
+	if (acp_data->info.count) {
+		ret = amd_sof_sdw_get_slave_info(sdev);
+		if (ret) {
+			dev_info(sdev->dev, "failed to read slave information\n");
+			return NULL;
+		}
+		for (mach = sdev->pdata->desc->alt_machines; mach; mach++) {
+			if (!mach->links)
+				break;
+			link = mach->links;
+			for (i = 0; i < acp_data->info.count && link->num_adr; link++, i++) {
+				if (!snd_soc_acpi_sdw_link_slaves_found(sdev->dev, link,
+									acp_data->sdw->ids,
+									acp_data->sdw->num_slaves))
+					break;
+			}
+			if (i == acp_data->info.count || !link->num_adr)
+				break;
+		}
+		if (mach && mach->link_mask) {
+			mach->mach_params.links = mach->links;
+			mach->mach_params.link_mask = mach->link_mask;
+			mach->mach_params.platform = dev_name(sdev->dev);
+			return mach;
+		}
+	}
+	dev_info(sdev->dev, "No SoundWire machine driver found\n");
+	return NULL;
+}
+
+#else
+static struct snd_soc_acpi_mach *amd_sof_sdw_machine_select(struct snd_sof_dev *sdev)
+{
+	return NULL;
+}
+#endif
+
 struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
-	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_acpi_mach *mach = NULL;
 
-	mach = snd_soc_acpi_find_machine(desc->machines);
+	if (desc->machines)
+		mach = snd_soc_acpi_find_machine(desc->machines);
 	if (!mach) {
-		dev_warn(sdev->dev, "No matching ASoC machine driver found\n");
-		return NULL;
+		mach = amd_sof_sdw_machine_select(sdev);
+		if (!mach) {
+			dev_warn(sdev->dev, "No matching ASoC machine driver found\n");
+			return NULL;
+		}
 	}
 
 	sof_pdata->tplg_filename = mach->sof_tplg_filename;
@@ -204,5 +260,6 @@ EXPORT_SYMBOL_NS(sof_acp_common_ops, SND_SOC_SOF_AMD_COMMON);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
 MODULE_DESCRIPTION("ACP SOF COMMON Driver");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.34.1

