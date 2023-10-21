Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C67D1DB9
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 16:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 328B1DFA;
	Sat, 21 Oct 2023 16:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 328B1DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697900248;
	bh=LnmERgavyVdVMQGQoWrTXTC/UPaXHpz5wb8k7N6xIh0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JikcK0OiHr/GpXT6ZZ/qI09LLqP9gIgvgc2nYSU65cOngkY/wjn+MP9aXDA4nzimn
	 HFtI236hb755XBq0c/n431KwxEXBoyDjwLvq82MOqcx1fo8EPqPxvPG/jBZt08wzan
	 15NiFeslzbaIUuY9dFHqK3p/4NJC42svBgYn32ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C507F805DF; Sat, 21 Oct 2023 16:54:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA86F805D6;
	Sat, 21 Oct 2023 16:54:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42D9DF8027B; Sat, 21 Oct 2023 16:53:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC7FDF80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 16:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC7FDF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pdskug/h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMotHABrSIQV+4eTLjmWfvLnOdpk1CuybAmQexcGcrqghVTlh3CUOIb/5awXTeFXuU5Fsgs5a7V4pVseQfs5d23M7RKWjLjMaxUhs8812cZhR0b//Xq69HEynZmeSN0/tUAg5fJDe0VQ1IEUOryWhA1hxJn975calIA/wgIWKPToSbMGe3Dx5mbVUvtsyLhSsviiQJ7/5E5e6lZdzMgll2M5ZoOk+BTpt/GURFoVGYbHcY4qsyQGImmPlKuaG+/5eeJ0quoRssQF/B7k9hNcfJrTE44wdkL4PGlZt6l2bd7/K821W3waEgZJfiMuGAkmtiz0LxwBuXmMFPwBSYjmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAp94MXbWlUHOFFPRdpY09OJ6JFayAk1JST2qWf3c/U=;
 b=BthZKqbtRyhkQHIL8VJ24AQtdmoNGI3FCUBtg6hQuNWLimBb3NS9QlJyaZWykxzFsNX34LCEoNcrfCJchnmlA9aPKS8tli0H6W7S1CSiWKhoUdoOL+599GHlz+H5uywj+XaULWUonWVnLqbO73I5nwj9gDAX9ZGVXoY3gDoJvP9ZA9zTKA+LWVEYH5J+g01pnpnrwIYve0MBNko/AJvXGepJ0j8dKbB3PYegtjMAnH0VBsflayjovtT063MC4qdjAsuq2z6FlF2YLduK1GvvQ39qfaZLQHVPqMOtnmiM1UhBHszpB9kK985SFDIwVoH6ahICYHn9Sd/ApGoYaXMKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAp94MXbWlUHOFFPRdpY09OJ6JFayAk1JST2qWf3c/U=;
 b=pdskug/hSprUnCdft+OnpI1EJnq54gwz4Eu/4PBe/mPR+cFENEJ7qWC7iNWqUmYFxT4F285IbS8rknStLmG9Da0dCfrrku9ZBJuvtvqrR3DebsJLnR6CwlvHUytgeJ5CYGQhXZ2iTfYJw2dwfHckjgUVK3ctRtxXfKJL2jLgZaY=
Received: from SN6PR16CA0045.namprd16.prod.outlook.com (2603:10b6:805:ca::22)
 by SN7PR12MB7129.namprd12.prod.outlook.com (2603:10b6:806:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Sat, 21 Oct
 2023 14:52:50 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::81) by SN6PR16CA0045.outlook.office365.com
 (2603:10b6:805:ca::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Sat, 21 Oct 2023 14:52:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Sat, 21 Oct 2023 14:52:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:52:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:52:49 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sat, 21 Oct 2023 09:52:44 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <arungopal.kondaveeti@amd.com>,
	<mastan.katragadda@amd.com>, <juan.martinez@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, V Sujith Kumar Reddy
	<vsujithkumar.reddy@amd.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 10/13] ASoC: amd: acp: change acp-deinit function arguments
Date: Sat, 21 Oct 2023 20:20:51 +0530
Message-ID: <20231021145110.478744-10-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SN7PR12MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 5189fa8e-f78d-43bc-5186-08dbd24565a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C9cA/QHcBpaFyAOTSD/hlJpgjTlRWdpHMRmZrD9AA1Zz5kYY4Rm9IWSC/2Dfj3/FZ8GxNpJ4mJELSt0+PzvpxNCH16nFQ4TAch5tAb2xIfU11a9pP4fhsZw0PVZdu+YUXUc5bMYLADZlZA4jdhWG7rRlfWthkx0I+FG11qpUR2jJyx9c/V1+s/oyDKoC3y2a6qQdiQ4egp3fXaw5WYmLQczVJOerC6W5PSukJUNZTI1EIP5Ai4NFzfqQOGlb5TWa1U4a59xijZ6191HmIGqd0X7NORObrkbEhOeDz0oH//Krgu9t3s4KKScPr4Cd8dGZUQC6bO5+8bZSfykMGgSsr+HfqCPbDftOL818V7HkHHaJeAtbUOv/gVt0p1dvVdO8uWjXjMYzya1Yn4gEKbHs/bGu0YMPD2cwxKX5lVNjIdV+o9b8XFI/Ko1Xy0Uj5V+qyOjdz6vvyOCTbRjDIhdizhnm9sKe7A2QexLd+GCpwusCAmpqlCaz73E1KJyFMx6a4PNHieHoSBGc7z1fXEqECLXXySDUuWwgZEasmFYL/ruqz5Ud8X77ja5lKbAtZthOuVe84KJp22c6Pktc5ohtT8cQh/tgqUP0N5OGtoOs1VLPGmE6UoIORtObLNCKKIoTiUiShC5KG2LTEQtrvQhYijEVqmJ/FRbVT2dNkZizhRKdahGRGIQYTXCJNd4rwvwKbxUpI313wdBTx/Q97e0fW8CISsmGSaNHZnLqMogY5mp894LAAWavJp1NPEkstMlyoVJbYeuJdA+FuLXd/CKjag==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230922051799003)(82310400011)(1800799009)(64100799003)(451199024)(186009)(40470700004)(46966006)(36840700001)(1076003)(26005)(40460700003)(36756003)(86362001)(40480700001)(356005)(81166007)(82740400003)(36860700001)(336012)(83380400001)(2906002)(478600001)(7696005)(6666004)(2616005)(426003)(47076005)(8936002)(8676002)(54906003)(4326008)(316002)(70586007)(5660300002)(41300700001)(70206006)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 14:52:50.2145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5189fa8e-f78d-43bc-5186-08dbd24565a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7129
Message-ID-Hash: 4SUMK7A6RK3QZVPRCUWXAGH2KLKONILZ
X-Message-ID-Hash: 4SUMK7A6RK3QZVPRCUWXAGH2KLKONILZ
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SUMK7A6RK3QZVPRCUWXAGH2KLKONILZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

acp-deinit function will not be same for all platforms.
To make platform specific changes in acp-deinit
function, instead of passing base address pass chip
structure which contains acp_rev feild.
chip->acp_rev will be used to add platform specific code
in acp-deinit().

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 6 +++---
 sound/soc/amd/acp/acp-pci.c           | 4 ++--
 sound/soc/amd/acp/amd.h               | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index af85a153a770..cba0aabefb34 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -320,16 +320,16 @@ int acp_init(struct acp_chip_info *chip)
 }
 EXPORT_SYMBOL_NS_GPL(acp_init, SND_SOC_ACP_COMMON);
 
-int acp_deinit(void __iomem *base)
+int acp_deinit(struct acp_chip_info *chip)
 {
 	int ret;
 
 	/* Reset */
-	ret = acp_reset(base);
+	ret = acp_reset(chip->base);
 	if (ret)
 		return ret;
 
-	writel(0, base + ACP_CONTROL);
+	writel(0, chip->base + ACP_CONTROL);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_deinit, SND_SOC_ACP_COMMON);
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index bbf079d47dc4..696c9ee6786f 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -178,7 +178,7 @@ static int __maybe_unused snd_acp_suspend(struct device *dev)
 	int ret;
 
 	chip = dev_get_drvdata(dev);
-	ret = acp_deinit(chip->base);
+	ret = acp_deinit(chip);
 	if (ret)
 		dev_err(dev, "ACP de-init failed\n");
 	return ret;
@@ -219,7 +219,7 @@ static void acp_pci_remove(struct pci_dev *pci)
 		platform_device_unregister(dmic_dev);
 	if (pdev)
 		platform_device_unregister(pdev);
-	ret = acp_deinit(chip->base);
+	ret = acp_deinit(chip);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
 }
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 62d0793027f2..e3bb470d1f32 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -222,7 +222,7 @@ int smn_read(struct pci_dev *dev, u32 smn_addr);
 int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data);
 
 int acp_init(struct acp_chip_info *chip);
-int acp_deinit(void __iomem *base);
+int acp_deinit(struct acp_chip_info *chip);
 void acp_enable_interrupts(struct acp_dev_data *adata);
 void acp_disable_interrupts(struct acp_dev_data *adata);
 /* Machine configuration */
-- 
2.25.1

