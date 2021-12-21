Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5D47C3A7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 17:20:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF3A177D;
	Tue, 21 Dec 2021 17:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF3A177D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640103637;
	bh=S16gPPuGlUxa/fk0hqnBOJP0ohxQom1wD6mS5J7t6MM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVzyZmWtr00NMTgCQb0X11OUCwB3JOQG36lovQyw83ZK7IMTiik0/gL6PsPWgyv3y
	 l7bL/ZS5Q7B9xWAmP7Pll/F0XEaeEsCqZKcPIBR2yOY5n045YoBzRPw670ekYtZatH
	 qs83sf2JJ+F9pmmKG+b/sFQPIsjq5BWJj7KJr6Wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E79AF804F2;
	Tue, 21 Dec 2021 17:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9527CF804D9; Tue, 21 Dec 2021 17:19:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B3AFF8032B
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 17:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B3AFF8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="uFuJBoJU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeyppFu7rp7MaKmLyRHO6bhHhSonpTvX1tUiA2XYL3OKtl6cSh8wS2/uog13dCYF4z+j7iO3zpYCDZOIsviVaokGTghzsdel2soKl17CMWD23mNZJdj/pzCrQRzlnfSZp8Iw+mmcUbupalEYenoJ/Tv1j1KWa0r3skwyEawsmmdJgoldf8QxF3D2vbISHeFynfPZv+V2UUOYH8NAanJCf2dMsOLmg0s4YR0CSRpLiEips0t6y/z2rQEVx2FjPwaU7mYdPstkbsclKMWpfte0N4CDtuL6MTL3NpBQ4pnota7PnOtuYB8v/98F0umge9uapU27E5EjEBeXGFCs+0QnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HOPp8SIaCsf8ymzbSkTja/Ct8WQHh4JyKDf7i6huNo=;
 b=L1OsAErwNkYPZVnFtlpzD5P9tvr7qGsa3BGuIjL68v9ARQHf2JVdhV1FZc1ku5BpEvLreShtMFOuq9bhfRlK9YQVsmz/52Ikj53qzG1UigBc8+YIrFOeTLycZ8OUWAd+OCy1LnnI063UaFTlmkvNmFgFYSMgSVsVuH4HFtCG+3fWivGKSJcRPD+oCyKsz53MvMOMTjwWYc3c28ttDIVX4/26oNNEj+9+UEb1R4plpzCfH+kF5WnqWy++aQXYSntLXXac5xq/N9GnPz5PzpbwieeJ0qw58YRx8A1BRkC2AQQM8fbPfPgL2eT3VlGR7h+FqXnIYpqJWcoi8d1jGhP2rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HOPp8SIaCsf8ymzbSkTja/Ct8WQHh4JyKDf7i6huNo=;
 b=uFuJBoJUhgklZPVQD8hv2EBuvCJlxIlZxgalDCcWODhkhZA9T6Lc039u/OKp8DKkPWkdrt8fV6xpd7GYiZ9TJx7pXFGTL5mICQCGLZ5pqTiOAIk6xVypreCc81t31nYVws/zz672B0UYzu4oK8pgNlq8hj2SHYZyyexPvbsZZYE=
Received: from DM5PR20CA0028.namprd20.prod.outlook.com (2603:10b6:3:13d::14)
 by DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:51::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 16:19:03 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::75) by DM5PR20CA0028.outlook.office365.com
 (2603:10b6:3:13d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Tue, 21 Dec 2021 16:19:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Tue, 21 Dec 2021 16:19:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 21 Dec
 2021 10:18:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 21 Dec
 2021 10:18:47 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 21 Dec 2021 10:18:44 -0600
From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/3] ASoC: amd: acp-config: Enable SOF audio for Google chrome
 boards.
Date: Tue, 21 Dec 2021 21:48:08 +0530
Message-ID: <20211221161814.236318-2-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
References: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 055c6ac4-8d34-4cb5-b85a-08d9c49d9a9d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0060B481C12C70E72A5FB53A827C9@DM5PR1201MB0060.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LkpNjV8vp1jtrbPhfSi+6MY5yuV3CcIyZswRz+i/QHt/DvxB1JInp10Jr39vQPfc/yEDbl2y5/lcHobRU+hY3uZXih70L+YDTZp/NwK8SqQ4AoZKMYO9lAo0jkDeQ4sze6kT55JWa/LugCO9dj35Y+0D7ZYxCBaMlKnBYWk5zO9OP3T206gtIWF0SX7Lru2626EhLGQ1hirGLFPQQZWfnKwLjJgfLNqyubUmC3bMG/3Td8aDyuraG3gdVGARn0QbIAdWWP1Ba36bevbXGnaAWFYA1/1A85RlS8L89e1t571UmKG6aSWQP0D0ATaQg6qHIOMeeA2otMibe9w4z54qBAp5dN3JO2G3uMlLav3S2fUW+NCJCgUBozZYdRWYzkhqQ8RNQGYFUuggeJtiFbP73hWAKxEDghZdBKX+n2G2U1EQEFjP9YeHFPsBawbLlywJPLv/7bo6Cm5SIQ4N2W2kY6j3q8tegHWOIJ56Z2MsXd9e1O2vsKexmSODT0CW/lo1pmiZxBMYJqeccTnB0UKNavbiLatnWuD7doUpHz8MvDouo0gfnEiyve2b8iWT8vQu/yUPEfn98UdBlf/244x2si/wFOlFkf8c3zR+utIN76W/Ymwec/l0/gimK/Tvi6RAau5uO6d23YyJLgJ7dkSS7aBsvxUJXSmKNW/2nYzRkHrvoxbU4O9g/6mqVKFBhIdq650/bSCZhXJ/sc9YErJ05x+n5IBORRi9HlM6oxH0tFUA8PQyc5iym7/g1YjiBFmNtGnqq20vAX4cSy5vP0tskIYQjn+mLdjK62SUngevdFs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700002)(36840700001)(46966006)(82310400004)(110136005)(47076005)(86362001)(316002)(70586007)(1076003)(336012)(8676002)(4326008)(186003)(6666004)(36756003)(426003)(40460700001)(8936002)(2906002)(2616005)(26005)(70206006)(54906003)(508600001)(356005)(5660300002)(81166007)(36860700001)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 16:19:03.1774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 055c6ac4-8d34-4cb5-b85a-08d9c49d9a9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
Cc: Sunil-kumar.Dommati@amd.com, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vijendar.Mukunda@amd.com,
 Alexander.Deucher@amd.com, Daniel Baluta <daniel.baluta@nxp.com>
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

We need to support sof audio on different variants of Google boards.
Add new entry in dmi table to enable SOF flag on Google chrome boards.
Also add newer machines to sof_machines list with codecs and amps acpi
id check to register sof sound cards on different variants.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
---
 sound/soc/amd/acp-config.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
index 1493d52c9290..c0bbcdb1761d 100644
--- a/sound/soc/amd/acp-config.c
+++ b/sound/soc/amd/acp-config.c
@@ -35,6 +35,18 @@ static const struct config_entry config_table[] = {
 			{}
 		},
 	},
+	{
+		.flags = FLAG_AMD_SOF,
+		.device = ACP_PCI_DEV_ID,
+		.dmi_table = (const struct dmi_system_id []) {
+			{
+				.matches = {
+					DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+				},
+			},
+			{}
+		},
+	},
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci)
@@ -43,6 +55,10 @@ int snd_amd_acp_find_config(struct pci_dev *pci)
 	u16 device = pci->device;
 	int i;
 
+	/* Do not enable FLAGS on older platforms with Rev id zero */
+	if (!pci->revision)
+		return 0;
+
 	for (i = 0; i < ARRAY_SIZE(config_table); i++, table++) {
 		if (table->device != device)
 			continue;
@@ -56,7 +72,44 @@ int snd_amd_acp_find_config(struct pci_dev *pci)
 }
 EXPORT_SYMBOL(snd_amd_acp_find_config);
 
+static struct snd_soc_acpi_codecs amp_rt1019 = {
+	.num_codecs = 1,
+	.codecs = {"10EC1019"}
+};
+
+static struct snd_soc_acpi_codecs amp_max = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
+	{
+		.id = "10EC5682",
+		.drv_name = "rt5682-rt1019",
+		.pdata = (void *)&acp_quirk_data,
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_rt1019,
+		.fw_filename = "sof-rn.ri",
+		.sof_tplg_filename = "sof-acp.tplg",
+	},
+	{
+		.id = "10EC5682",
+		.drv_name = "rt5682-max",
+		.pdata = (void *)&acp_quirk_data,
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+		.fw_filename = "sof-rn.ri",
+		.sof_tplg_filename = "sof-acp.tplg",
+	},
+	{
+		.id = "RTL5682",
+		.drv_name = "rt5682s-max",
+		.pdata = (void *)&acp_quirk_data,
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &amp_max,
+		.fw_filename = "sof-rn.ri",
+		.sof_tplg_filename = "sof-acp.tplg",
+	},
 	{
 		.id = "AMDI1019",
 		.drv_name = "renoir-dsp",
-- 
2.25.1

