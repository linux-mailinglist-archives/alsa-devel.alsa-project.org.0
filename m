Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0928078C5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 20:40:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AB1D1FA;
	Wed,  6 Dec 2023 20:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AB1D1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701891635;
	bh=Q377c6MrItYetdzxCLVQeqpNGIoxpVXsGcnj5vNgOiI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GW0tYfXEEu/TIZ0ZvXgneP4gXjhn3MHAow0Jsd1LrT58rhBdPgZWvVKGzzJD9PC/t
	 n86nn2KtJJfJaB/el1BU42xdolFMkNNcZZaTzXs+XtzGXfKSLF23PZTn53xwmNH0cb
	 J05e40Azo2XLmLE5GLB3m5Iq8+EKGmr+mz6+1DwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE93F80563; Wed,  6 Dec 2023 20:40:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF52FF802E8;
	Wed,  6 Dec 2023 20:40:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 542DCF8024E; Wed,  6 Dec 2023 20:39:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0924F800AC
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 20:39:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0924F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ikMntREb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZPZV0jAF7v/ZIIlP/lAg37rsR4Z1Z+17gWpUPdvg+n6u8uXHThK62BfwvvaxRkAbV+Ay79rwHUqM/Ag6F/lt615gTZobtXbvvqxyNJjedRx87s8WfrAwulXSf9029rk8z8XbRlIbQ9IyzZHb4wErgpIugIaO2ji0yszht+DeMTAnR4GlNdKUCJOQMSEbacqdoSOoHqsQlNi1irZifS3bYp5NxxrboMsPHqeMIR6Id/lpDNZF3cjav427iyVkrl+Cxara8ZfT1AwqSitfirgaZprHRmTxXAOGw/FmVvHIa+a6Oy56c9h3EZjuQ0yPnVs70x+9MQWmsP9RG3tvBB0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrSl08hCs5ktrRITRJmfTUUOnStuwtHEmIL0YLCvNo8=;
 b=VzODqXMjJRnUt/uKn4W+4yHvgvtop6Pu0R4SXP1C04A5pYGI7eq1EWTagXyYROi4RGcSv/m9Pd7jjRubzgzgk5s8BYWHK0LD+a4UcWDAx+qR3Fjc+6MGlAb7u2M6CjDy/AoqH650Nwsk43kQ0uhts52vbXTlFNCMsmndehenE7WTntqQ0WXPabXgTZi/Xe/mfcJQ8VFttdugZqjYrOPR37iGWsZsgzkpoVpsCAhCm5hgU4HemQmGLrnvPDkcVY4n+CC7gxqXbJIfldCpC+NgbjZcKyzHPc4sCRvs8qrKmdxJtW3RDmizNpMUZsiaqQjDqBrKlsnFgo8JTSvnYlrDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrSl08hCs5ktrRITRJmfTUUOnStuwtHEmIL0YLCvNo8=;
 b=ikMntREb1Hfsuo5zGBJevRJ2yCClwVvZP4tym2SpYRkDomQ73I4efoDiZILXNqboWy8jnm8BpIEIayC8fsG/Yp6wfsgSGZmJSvDK4gs2ST5DVW8GI3mFY4/y71hCAfqaLiwosYf+nTqOt5u2K1/5jNx19tU3s4yYRphHBC9qbTs=
Received: from SJ0PR03CA0264.namprd03.prod.outlook.com (2603:10b6:a03:3a0::29)
 by SA1PR12MB6751.namprd12.prod.outlook.com (2603:10b6:806:258::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.28; Wed, 6 Dec
 2023 19:39:41 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::ea) by SJ0PR03CA0264.outlook.office365.com
 (2603:10b6:a03:3a0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:39:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:39:40 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 13:39:39 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Takashi Iwai <tiwai@suse.com>
CC: Jaroslav Kysela <perex@perex.cz>, "moderated list:SOUND"
	<alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] ALSA: hda/realtek: Add Framework laptop 16 to quirks
Date: Wed, 6 Dec 2023 13:39:27 -0600
Message-ID: <20231206193927.2996-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|SA1PR12MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4f03f5-881d-4d57-944d-08dbf69316ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WW+CwzD/HHbfLOGp4gEIexxX+x/NRo9OxV958erxBVmMV29b52uvbvxSjZaYrlsVVABSMHoV3HoiGYvj5AyDXeMqT6UzdRfIg9Y0hj1yppAZ+B7BvvC3UvrCzPBxAvHERggNnLQtWsWhDT9wSomr6o2n/MKWm7APxInDKjmRASYiJ/SxpAKRhbypxoZ0SPEey6mglYj+QODTD9S/okMpGd2QSixPvsdF+uHtd822mwx8QaSm+FKbzS9SBBWQa7D+xVhPhg3SN1w6pTujNG/eYfXUD0qNLUFZJ0fCq5A7SfQ4M0scNlpdiDPUk1j3JTmEkY+yPglsNmEu9YbA9yr1xuAD+pwMWZKTJcBJOmz4VUTXJEkPSDHW26IbO2PfexdB+PB8nkEcYpfwad4yXJcybmAbos5z8vDJ8yfId89z7DLrHjx3p3/qbFlGsimmbv/AN5Drl5aI3SB3vSet7z+2W+deieELelWfb2t5W67LVyQuaoi753iY29MHJn+AwrCdaStIx1YXIJNKMX9q60dctAZPo05ecdEKkvpAo34aU7Rzw/9R+gSdn04Lv7ZOa9Cu9AVI3/XUeM9Ue9M1BMIWkpOiwstac5XAJz4tqkKcGx+N5gpC1Td/sdV6ehNZDqC92zDMw7dLLriBGUopqfycTuLffinyOsBMsal5/Cxs5EEQj1aFWlUvgAxO6HVdZZnjPaxbU5pcfJKX79mTXcJ6Z0L9BMMT7GUXXuW54OQGVrbxFcxPNl5T8ZmEOuEdM+tqmp7wE6iTM5d2pWRpiUt4mg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36840700001)(40470700004)(46966006)(26005)(40460700003)(70586007)(4326008)(54906003)(8676002)(8936002)(6916009)(478600001)(70206006)(316002)(36756003)(44832011)(4744005)(41300700001)(86362001)(2906002)(5660300002)(36860700001)(47076005)(81166007)(356005)(6666004)(7696005)(16526019)(2616005)(426003)(82740400003)(83380400001)(336012)(1076003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:39:40.2594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c4f03f5-881d-4d57-944d-08dbf69316ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6751
Message-ID-Hash: RFAIGBCDJCEU3PZZLC5YRLCC3JM4CGPR
X-Message-ID-Hash: RFAIGBCDJCEU3PZZLC5YRLCC3JM4CGPR
X-MailFrom: Mario.Limonciello@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFAIGBCDJCEU3PZZLC5YRLCC3JM4CGPR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Framework 16" laptop has the same controller as other Framework
models.  Apply the presence detection quirk.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 59f2578839ed..50141795aed9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10271,6 +10271,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
 	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x0005, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
-- 
2.34.1

