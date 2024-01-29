Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BC83FDED
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 06:59:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E95284D;
	Mon, 29 Jan 2024 06:59:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E95284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706507990;
	bh=X1rCHQReBAc6/5R4G28cNMYQ+KwZYl8KhiE09u+h2fc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JLdX2YVzGG1dvr1i5uJoyzX/fEDWhfZmvV90F+6iZsJzo6HWp1W+abtv+YKzP3SL4
	 iXbmAnJ1l3cyoN1+hM7/4IIEPPlA1J94eG3ESJaFtv1U44A4SIyu9ZT2o+ZLGNCUbD
	 D4z3cFqCyO9tDB+KtRQofVUTRR00+tYjnwoWiRKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C48DF805FA; Mon, 29 Jan 2024 06:58:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 679CFF805E2;
	Mon, 29 Jan 2024 06:58:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6DC7F80310; Mon, 29 Jan 2024 06:53:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 560DAF80548;
	Mon, 29 Jan 2024 06:53:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 560DAF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pk9MLlr5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T5lrtpV1tli/yLppExGYnCABDx2f/+VZAL071h6arKC8DNBVBZ7ds87OnH0iK5qnPcVM7UP47tNOP/pxX4D7Ttx2yJflXHhelsCVGM6bYAtlW0aeP2L3oRLkV7hC42dQU6ZUoSSDnpJtOvQrcFINm6tqbkk+CmgO9MM6mHxseJLxv1fFyoEfUxq4Uo8TTlwkWF9UjIdYCX5qeM4UyfsSZtNbWkFLIngXYo4hNXjVKNyz5FXOMqm+68NkzXdbobrrDPtnGrIErkpTUZj0R2REzqObJyRFuBThVCYevLuKaq0T4Ei6V6TZQ4r8Qgt5AHDtA5ZZi4cFX3cUd5VeeElU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+omCGRhppcTZgY3hpYmOov+emvix6/ZrChbQ00XGnbg=;
 b=ZJmZNUdcWeQ+DmsMQJ5wY0zw6jBQCIsMfiULsNiXScJTooEccbFKqO1Sf62RV95zK9HFHDPZmMg6u+mXJrQkrVfAUdH9+CFDXzsPEV3266KqL9JjXZ75mcoBD/cEraJr74BLEregpc0Wo9ki2S9Wla/vVWSBmu2rOWgT/isiKM0eImPIkliZdj2zXXdtkLHBHEJgucyBqknYnfw1jUgm8NnQnN5yn49aGHeid45xOUOV/TRN4hcZyaC9T2TI7C22EPCqS7MglAvnrcHSWp+6WOueLKcRLYdSVzooQJv+7VT5h/HldAD2p8KGVB0DkbxpD7JW18D0JomvJYPdcwEpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+omCGRhppcTZgY3hpYmOov+emvix6/ZrChbQ00XGnbg=;
 b=pk9MLlr5rBP/6EWPx6hn8rN6Zsf2IMfPT9rDslmEpF9qKHUD3noc+kkDtFmCO6pu/H+i5aeU2PIRhos/6ejXwvogyiyUGwbNOXqWqjZikoM/ZDx1Utblf44kr6K4o6Vc7W2MHHV4YZxFEKpPQAbWMk3DkRPOAklyGM930DiXI1c=
Received: from BN9PR03CA0452.namprd03.prod.outlook.com (2603:10b6:408:139::7)
 by CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:53:26 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::18) by BN9PR03CA0452.outlook.office365.com
 (2603:10b6:408:139::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Mon, 29 Jan 2024 05:53:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:53:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:53:24 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:53:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Wang Jinchao <wangjinchao@xfusion.com>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V4 10/13] ASoC: SOF: amd: add machine select logic for
 soundwire based platforms
Date: Mon, 29 Jan 2024 11:21:44 +0530
Message-ID: <20240129055147.1493853-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|CY5PR12MB6429:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3d39f2-52a4-4c76-a3b5-08dc208e9c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3HpfhXTP5gkR7v5w8KJCeeUYftDhdi4K5q5vLirTq5xuIXYzRHKk2RRr6fzdu0U+kn6aeO/9Vu3eWxnSLJVeYtlqSTxrCO35OR0Kfs3tWdqzY+MyTvi4KWqHuMEDRU4CUJsFw7h7Uz0r00jVTz8tZTvbffnPdqc+IOWC9Tv2zPqol5QxGMQczIudQmVjJY0IXfJDxuMmfzobbMXgsSaWJJcshYffp6s7ZZ59EPf8FJ2dCpL2JpRAjmc9wmAmFFDlHVrJcBrFvDXn1Zg8OymOoz8ZAbVVfwYnyWqjyjqMA6AGIt/tTmNtP7J7PiLFZkT8yilbx/beINea2ky2Y1hb4o2Q+hhO1t1wl3tRBnuS2rTgXqLc4/L0kz2zvho9wbPtp4iCCcwZFKP88SV83RCTm5b13I4wjyQlj4yhMljF9Annx8J0HM0qkha74N08As70+ZxawvXaTFO8t+l8X3VOrAJugyU+xs6D6YMWxyaj0Bsa1iNhtG93AIOHnPGqYFxDd986IquaiUvxF2w5hg8rz3VQt9LTlr5NigzWBs3QGrLLH75XlWKY3f9QwONFM/odalp7kOHQkEAu9Ccba887E9/PNQ960O5rR9agCyqBwmH8Av0vhM4cQBDzbKahLEZ89eEad6R07fEFgb3xKQLmjv3BfoDO8xYhvS8+VsXEHwuKBN5GnyKvmFnYVwlk1XA9malkO6kN7RzbPBcxI7lCOttDb0N+G5LuPE2tUfUMO/g841w68O7QQ4sGmmfrPaljwF3t9tw8tyi8uwX39c0qLQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(82310400011)(186009)(64100799003)(1800799012)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(40480700001)(26005)(1076003)(83380400001)(336012)(426003)(6666004)(7696005)(36756003)(86362001)(81166007)(82740400003)(356005)(5660300002)(7416002)(41300700001)(4326008)(8936002)(8676002)(36860700001)(2616005)(47076005)(70586007)(110136005)(70206006)(54906003)(2906002)(316002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:53:25.8881
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c3d39f2-52a4-4c76-a3b5-08dc208e9c4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6429
Message-ID-Hash: P2LNERX7C7E7KY3Q7FWEMU7PJGJZSA7M
X-Message-ID-Hash: P2LNERX7C7E7KY3Q7FWEMU7PJGJZSA7M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2LNERX7C7E7KY3Q7FWEMU7PJGJZSA7M/>
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

