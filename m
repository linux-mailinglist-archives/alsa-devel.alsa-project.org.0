Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABAD835E29
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 10:28:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B37A1204;
	Mon, 22 Jan 2024 10:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B37A1204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705915719;
	bh=X1rCHQReBAc6/5R4G28cNMYQ+KwZYl8KhiE09u+h2fc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r+axbfN4xbVGGaQmR9fGrmMrW2pLvLf0Jk+QF8uwmtCUBKmeZmF6/IutwlmgHkyK5
	 8pVDKtGa44jfmCT798agt6zDdI60SAP/GHuIEdiQV37vwd8t8fl673AC6UYYbwJ8mN
	 EcmyKWbNYg23QWhjdMUDzQzjChDORc+qvnUg3zbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EB6CF8061F; Mon, 22 Jan 2024 10:27:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7845F8061A;
	Mon, 22 Jan 2024 10:27:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C143BF80520; Mon, 22 Jan 2024 10:27:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4040EF80149;
	Mon, 22 Jan 2024 10:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4040EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eqO32JbV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9PhZC2hi6AmqXNhgjMwj51pEQGz2+5xSCFrLbLh+zZT/PNEUSKYBcybHhLPot9Tcg9UcA2mbHO34yOV2Z9zjcvekqWY8oqZp14/7U2PrK+AeXkWiIT65iXSKfWzvo82VXdvmLE3IQs2254RPpQbpAhnHMkLZ5GHoURS1viHxK1oClRQd2ZTZrt2o45aT5V9DgHMMFNMvWfQYFJ4/zmoq4pc0WEL6+2RsJN5b41fln4eHlObp97ATYnwMxNvKaJK/DjXeEsZ9D7qDj/eBL4eWWH6UuFfqJJww0Pn7L0BBshFJ+KC2y5a5JZ+rcjpiQqJhfv1CYiv28kigsyd8VuQpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+omCGRhppcTZgY3hpYmOov+emvix6/ZrChbQ00XGnbg=;
 b=aXwnbJIx+a13WJXHzMo4y19Gl5haTsjQWX5cxdlGFxJvE3TXYniu+87HHNWEGEeldllU3RxsgycSb605JAE1dLp0xXHsWCqJ8YiU6I3tgppR6Rz4vXcySWNn+CP0b2oDIlWwD0ZEh+J3eX/SJJdpffixgXcMhSfxW4FZ6due039tVcBtbhnu5JCt08+2DprabtABHNFXlssFiGGObya2PQUvmwSJ0oQlHsKy2TX5xzvZ3ieCDJo97lqKOiA0pLgmKpvj/RH2guzfK+7/zWKrQq5qeFArppPBxtxHKmnnP2xAA4IXkUVs4YG0VD04AqqClXMEAQjxtqZrpyErCXvQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+omCGRhppcTZgY3hpYmOov+emvix6/ZrChbQ00XGnbg=;
 b=eqO32JbVAUMOWDhoQc+ktw0+/poD9IXqKsD/wwUdHEPuJgGCizUEiZ43OfCIzEvyAftkruXo31ap7d84UhRD7dYH3Jzy2bby6pQhKlKyDxzL3AxowzGXJitOwzNsvWAPjUzxlgEOdRsk4OdoTSmqTPOf/oDl4CHPEl/KWB0O8z8=
Received: from CY5PR15CA0078.namprd15.prod.outlook.com (2603:10b6:930:18::14)
 by CH2PR12MB4102.namprd12.prod.outlook.com (2603:10b6:610:a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 09:26:11 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:18:cafe::e9) by CY5PR15CA0078.outlook.office365.com
 (2603:10b6:930:18::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 09:26:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Mon, 22 Jan 2024 09:26:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 03:26:09 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 22 Jan 2024 03:26:04 -0600
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
Subject: [PATCH V3 10/13] ASoC: SOF: amd: add machine select logic for
 soundwire based platforms
Date: Mon, 22 Jan 2024 14:54:32 +0530
Message-ID: <20240122092435.3791175-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
References: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|CH2PR12MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: badfce2a-9033-4911-749f-08dc1b2c2bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LE0l9mbTlz5qtF69FAzB0/XZfZZz4gun3uSkWLah7WvjqlrctzpDOfNY1+Bo5hHHsRQ870SuDio15GbZoW9doDpGq3qpwqm2lPioqmk5MSMztsoySzYAvul8/HWbiubCP8GU+69esubgwqlP6Hs5bJ+czPE4W3OzhxnxrP7PmnPXUDO9w8Ky9STQL0l7rosYfnJKrMD7h1sLA70MtNy80t03vznN5eIbD/Sqg43WpHQqcAG07/MmgMEsE2uVGbuSrSdwgIyAWJ9QB+4eKkYoTi0z+JD2c8IciXdt/CYsQISnwZvJphX0X+qAZ/4cmgCN4A8QS1eZTIRdIwc47b+v6gG4LFKCP8VLqGXDI4MMlpVYZhxXGiIsLsoUcKo2F5K9RBXqQRkEADZquDyfT1nRLAq73XdEY19bAyfgGdXooX2JFpce2k48UraQ7TX8m0pp7+5wNUuBUAkaq7Br/aHaU2k+6XkC4PTVkeKoQLOfJWy8gnFxvd0fVB8lezR7Iplrhv/4IbKfyxwVdprYH5oQJncfGYM0RQyVMNI42iX+rUXTyXXrAVhtrygP+EiR18+yzJyu4ShghsP2r0L2MTF+cldAcqr6yJEPH4u5rEgNXC0OSCs3ohAA7YADTbPJMwMW9iV9ElYQWBYCw8eK4ddAugUgEO03IoFRsSTDucIjOxWVsqhxR8PqW3eYSJBQj/ZrtF59PYAWnVbReALJXQ5HxLEvcFBGSBOmzSRbd+gFzxnjScTtA6VrucoTnG5WNQRD5TsWOyxWfLp0PTAwkFd+dQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(6666004)(7696005)(336012)(426003)(1076003)(26005)(2616005)(81166007)(86362001)(82740400003)(356005)(36756003)(41300700001)(83380400001)(36860700001)(5660300002)(7416002)(2906002)(47076005)(4326008)(8676002)(8936002)(478600001)(110136005)(70206006)(70586007)(316002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 09:26:10.5767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 badfce2a-9033-4911-749f-08dc1b2c2bc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4102
Message-ID-Hash: 7O4BSU6SRPFBMZT6CKR2R2RAGAF454XL
X-Message-ID-Hash: 7O4BSU6SRPFBMZT6CKR2R2RAGAF454XL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7O4BSU6SRPFBMZT6CKR2R2RAGAF454XL/>
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

