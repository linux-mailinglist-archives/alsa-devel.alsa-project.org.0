Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E0E786480
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 03:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0224A832;
	Thu, 24 Aug 2023 03:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0224A832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692839629;
	bh=39LCWryqWu5uzNf8fYWH4l3g3LHGlCzWpixtOgiYoYI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mdWXAlv706vUk5B5cFJdFS6Hh6e2IsVvkVaes4+zKDdGfXIxlLH8mTx7j2iO6Fya+
	 CZXXQIVuAOLAAaDBe4NrHHOocSEPDMfYuAX8zjHAUv7qGOL1FaIXs/7v9zTxfYNCXL
	 aYKkyv90lDyHXoWQJcd68+u9ZW2XXZW0aKgkj/pc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89F88F800BF; Thu, 24 Aug 2023 03:12:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3ACEF800F5;
	Thu, 24 Aug 2023 03:12:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E480F80158; Thu, 24 Aug 2023 03:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DE12F80074
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 03:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DE12F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=aIRIxG1G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bTyTt+tAgL5Tuq5gXsaNwPGJn1+DUOLUW9fVZo1OgpxAz2eGM5ooAm2KOwJYchMyl7H/w+L3qNVaupuSuejj/WoLLHDS/tmWJoEdkGWckt/Lv/aPNElRsfIXYzkCdV8Cxos5lPlis4dBZvBwqbK08V4Bx1ycKCvRAJefLSBOyzWE8MY6NJdpa6aX30AXr72ojaRM1e7QIY1sUkNzrBVhvjFxRHmcty02gfOGfsRosFGFvvDOVV7PLceqAYckkpk8bW/Dvbp3pPKhJgeVH7IeHYnUPkmytBQ3Rc7BoThWM4tyT0JGuc5uYU0uMJXF0O3E6pb1tsFe3ccgOSPtFGTLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKhxOz32HzYGVtTfxipDkkFJ1vSPRFVTSY7oVlU1Kfc=;
 b=ioeZzbiW/W8FX2U8Arh/zYh//EBn6ns4DgTPAOMNXp+XDDoOgqZd784MOROmPHsKJ5I3z855fiDuClMekqjQJAS43LlO/PXhrenW0gdu7cx+JqowxO4nkW4S/s6qfTIilimPNMj2S/dDHmviZTTY4J3pK9BJAPobUqJ9hzQ9StztpSsJWoOh3pZY9hlZvSDYL0Yp/zUnfK4j0Gscc37fqhzZZ4HJncXGzzonnuTuE38W4wC9MbR+KNbh+VepdXc7DvXusg7ilsF07s3FNLRcxAhDbhCM7sY2kLPgWVoqlLtS7DQ4OdXlHKRVzK6yHeXEy6UjV2JgKC8bPgx7RoFvFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKhxOz32HzYGVtTfxipDkkFJ1vSPRFVTSY7oVlU1Kfc=;
 b=aIRIxG1GXxpR+yoNMRQmybtncRetj6jxUCUYDj5hXrs4r9pvKo8eGh/fr+oB166KTysRQmzslrtY9oXPFheMmkqZL0yeZqUHP1cR9AfZpgtUj1KiOmDUd4c+Yi2pTeNv7wU7wLYgbQNzTrkbRzKvJSQnMenl2dtAiDjYK8sknFU=
Received: from MW4PR04CA0136.namprd04.prod.outlook.com (2603:10b6:303:84::21)
 by DM4PR12MB5391.namprd12.prod.outlook.com (2603:10b6:5:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Thu, 24 Aug
 2023 01:12:35 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:84:cafe::91) by MW4PR04CA0136.outlook.office365.com
 (2603:10b6:303:84::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26 via Frontend
 Transport; Thu, 24 Aug 2023 01:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Thu, 24 Aug 2023 01:12:34 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 23 Aug
 2023 20:12:32 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>, <prosenfeld@Yuhsbstudents.org>
Subject: [PATCH] ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ
Date: Wed, 23 Aug 2023 20:11:49 -0500
Message-ID: <20230824011149.1395-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|DM4PR12MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aa0a0b1-5b84-48f4-f146-08dba43f332a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iQEaiBbSFoBbLM5L48HHlzl8H7UAm3MElImDbSSnY3xL9sit+NyKBNiAZO0xwZ+/tUh5rQ+FwDxahRH4DKo0g2GLvde6MIghc6O5zsWnRHd60NvdJ/4ZlpYyX+TBYohm+JinN5de4LTxk7/YldsDY6HZmLGFK6Ss+MlSPZs7Eiscp9/gxrj2janNh4jDY5FDNVwx8tESfeaE4W1DhuqmU76jydjNQRfXmeaaTn9Sfm19Oa3FFwlxKlO8SsP6MnTPOnAGdNezNiUcJAig+gwSdxFSr3CWaG+RkDObepkQX8+sqeyIVqKVOnthegfCN0Nx/udP0w8EO3pEjq3SvgR41n1JQKjzdSGDU3mcqBVMadiBRvNNmx/qnUPhJ0HRvNnlYIlI+SsUJl0qDO9qd5TIo1V8hpGvljG7p4LIF/U0mgBTgwtpZ+/iUXmUUgqck2fKGf5ZBeRCYUyEYg2T2+7hB+zs8lxXs8wCzG6NApAAyzfB7Dt1zGlAnQ0gKB/Smu/VCIJzomxirvqLQ2rvBND3tCLitBLqGGlOK+TUgOV/OiVhZn0K0d+nuS5GgmT7inP+6FZMh7eXZtCkAHkbdpEidlh+2nyAgBzr3yYXNuwomQXrXng/CjAilOVyc5yoMG/gFQyHeDX2vru0xlLJ2FftyCs5+d2RicqLZEviDrnqWioV2Jo+CRriN6A6rrg4nHPB4pvgcfCGAi4ZAvalU3rLBDpfyxC2WnHf4TOJgdoBKEJLM2a2Pz4vjeSvZZm9hYpjiH4E0EqjeVHcXZL6DO3smg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(47076005)(40460700003)(36860700001)(83380400001)(4744005)(2906002)(356005)(81166007)(82740400003)(36756003)(86362001)(41300700001)(110136005)(70206006)(40480700001)(54906003)(70586007)(7696005)(316002)(5660300002)(2616005)(4326008)(8936002)(8676002)(966005)(478600001)(6666004)(1076003)(26005)(16526019)(336012)(426003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 01:12:34.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0aa0a0b1-5b84-48f4-f146-08dba43f332a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5391
Message-ID-Hash: 6KPS4JHLBDLOTCQRDBTR6W5BNW5BDXEH
X-Message-ID-Hash: 6KPS4JHLBDLOTCQRDBTR6W5BNW5BDXEH
X-MailFrom: Mario.Limonciello@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6KPS4JHLBDLOTCQRDBTR6W5BNW5BDXEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lenovo 82SJ doesn't have DMIC connected like 82V2 does.  Narrow
the match down to only cover 82V2.

Reported-by: prosenfeld@Yuhsbstudents.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217063
Fixes: 2232b2dd8cd4 ("ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks table")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index a2fe3bd4f9a1..0ad1810cf29e 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -217,7 +217,7 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 		.driver_data = &acp6x_card,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "82"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 		}
 	},
 	{
-- 
2.34.1

