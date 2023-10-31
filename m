Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D22677DCE78
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Oct 2023 15:01:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14881D8;
	Tue, 31 Oct 2023 15:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14881D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698760915;
	bh=OLoAZrbLZsescgcgjuRiJ8QMzUKHF73SMN28VJNvbP0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OCMEOhg4Mla7HcavdC02PZCWkZIgmtAH2C2k5LhC1IT0qUoLGMqGcVQ+utJmSPbWp
	 ZylKI4PdFjYIFaszmZaGJc8UlAt6ngFOAIR1VmDA834EcCnKlxYtsB0MCIU3+HKLDv
	 PFMspTZogozviww7QyLhrqIXfvJ3TjKVlEquDETY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A811F800FA; Tue, 31 Oct 2023 15:01:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A33FDF80290;
	Tue, 31 Oct 2023 15:00:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A414F80431; Tue, 31 Oct 2023 15:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFA02F800FA
	for <alsa-devel@alsa-project.org>; Tue, 31 Oct 2023 15:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFA02F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AXx6/a7q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRCRuze3qLG3wi5+5Iua9qfPS/fzcHKAi1Z/FGN4JxPRbTO38IFoJIJfmLmMxopke6zK2eoSyG5iSxrQxR981sYcUvbCmLRu5SOVaMiXmh05bvnEEtxsnYQ50jHMgebSSOFY0U3X/pblaMwdDHUjcTtu0FlThz0t999shYYFcRZdWIT+IeR5+LQ82Dq1Mu0p/OLE+8swJCKsgLsBdeNnmWtLxqG8Cr8GFGriOpehyYSX/q/OWB5V6K7ErOmtBn6qwLgtwkvrsaR9CFSoKhti1g1RrtsJbGzB4AsX+h+x4X38weHSgSKZJLSpAgtEURcmtClTxjY7U43JBbr1Gzn0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fh19rdl5gfqBenFXtgRArfr4pwfyJJx3mHihtWHjAsE=;
 b=ZqdMT899Hfze7TrnnhXqoAlaKHG+Gix0y355OGY3gkzmzpGU3wzZwWNgOpwfXfbsCUmUBjk0+SfZKEmu+UoBi6RlY8l1hZp+A1hWYe9MvVxZFtxsG59sqs8ktlEpozi0+2kUhgGcLSkQ1z1MPGq8Fxw5/Vs2+6MrhrmQREaLY9fF+gh289HhZv7Mqyv8E07W9bqz/ViJA97d+1bFV+Oukg/Ct1lIiVk9JRD03zu/qImwydyO36IMwpju0CILBaDhNFGzLqf3236iUMPkwP73O8Qwwou+5tTBHO9hPZP8H7t5nUi/1qaUdEUD9yWxCrvknppMhc26aF0Bzkg79IsgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fh19rdl5gfqBenFXtgRArfr4pwfyJJx3mHihtWHjAsE=;
 b=AXx6/a7qBodLvRVEJTgIVavR6vtsHHdxMhg1is5dt/zbXswYr1TSIY6Sc/3hXjFCgahpk9xK3mE66tYca52wciFTAxtt3M05lnfj4T5gBuyLMtAKn3hPvPURt7ZGM6DzTFkMuFiZINFyERJLqKvaEnHstYBGFtQfzhP+HRxPvSE=
Received: from MW4PR04CA0321.namprd04.prod.outlook.com (2603:10b6:303:82::26)
 by CH3PR12MB8878.namprd12.prod.outlook.com (2603:10b6:610:17e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 13:59:57 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:82:cafe::1a) by MW4PR04CA0321.outlook.office365.com
 (2603:10b6:303:82::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Tue, 31 Oct 2023 13:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.3 via Frontend Transport; Tue, 31 Oct 2023 13:59:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 31 Oct
 2023 08:59:55 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 31 Oct 2023 08:59:50 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <arungopal.kondaveeti@amd.com>,
	<mastan.katragadda@amd.com>, <juan.martinez@amd.com>,
	<amadeuszx.slawinski@linux.intel.com>, <dan.carpenter@linaro.org>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Yang Li <yang.lee@linux.alibaba.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: amd: acp: Fix for indentation issue
Date: Tue, 31 Oct 2023 19:29:32 +0530
Message-ID: <20231031135949.1064581-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|CH3PR12MB8878:EE_
X-MS-Office365-Filtering-Correlation-Id: fc08a05f-69b7-47a2-e825-08dbda19aa21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hMg6LjTS9w7fLxyA4FgGF1qfYPbqKMPDq2JCLDn1vkdvWgxDW30obPzv7PlT9hiKy4/JmbkJIs4YmK1UErby0MaUcpGidPLc0LpNeJT5xg3mFlDet3xoNE4fcyb/FqKoW00SyVdb3d4t7Qd/D1o26q1aZftGv8l7/M2MQ/+j0YVofBJm5HpTlryrdVqWBTHfaqteECQWGzpc06t3L/d36ChPbw8EnLWv/V1fSl4ZGxcbYagpondH4bodmqhP8kuq4XHTG0CieC7sx71hocRx8yLY8dJcJ4zxtONHn6RRESoBgp/w6ViJbRu3YDmgwtj58P/cR/aOOC4MyXvOzmie81/0elzk9gifHDi/3VXHolbfZkcCeHQ34cF/uSQ3sZviKtoj6oZmfWYkOMyQfaYb82hByIM4LuO6rCaxnoKwdGguxX8Q/3WrdQyH9fh/47lyq22FryERqn4/JSBYYVD8XrPlGKjXBrkPEFeptV7z8m7FqHbLlGKYkBz2SIbhLJCDyfk87yH/GR1FzFGI0tP9bs0t72VMjYwbJcd66AvUbH4ei8iRUVFMJGlC49iMfK1sMMl6Ebv13jqg/fAdNhRQ8cu7vPyaRH5hMDBQ7KJtK7npQXLuv2qc6KZ1cqO9Nm7nG2KkCiccphYeZKa0Wd5c+26EWlXj/DSkNkX8K3TxoMTn+TVNi7/tjd3bVeUrOo1h+Gg/IhBTSrbhWG854EJ8mCv3LRha8bBtFlTf57aGgmyUKAxKvoVGceqYhf26tqCYWRFrCZRATWNv0ziWbRIr7Q==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(478600001)(6666004)(70586007)(70206006)(110136005)(7696005)(83380400001)(36860700001)(36756003)(47076005)(81166007)(356005)(1076003)(26005)(2906002)(86362001)(41300700001)(2616005)(426003)(336012)(82740400003)(54906003)(4744005)(5660300002)(7416002)(8936002)(316002)(8676002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:59:56.3943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc08a05f-69b7-47a2-e825-08dbda19aa21
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8878
Message-ID-Hash: XSGGIILJ7KIXJOFBLL3Z5YHQN7DQSUWQ
X-Message-ID-Hash: XSGGIILJ7KIXJOFBLL3Z5YHQN7DQSUWQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSGGIILJ7KIXJOFBLL3Z5YHQN7DQSUWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix indentation issue reported in acp70_pcm_resume() function.

Fixes: e84db124cb21 (ASoC: amd: acp: Add pci legacy driver support
	for acp7.0 platform")

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/acp70.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index dd384c966ae9..1d699c96f619 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -229,8 +229,8 @@ static int __maybe_unused acp70_pcm_resume(struct device *dev)
 			}
 		}
 	}
-		spin_unlock(&adata->acp_lock);
-		return 0;
+	spin_unlock(&adata->acp_lock);
+	return 0;
 }
 
 static const struct dev_pm_ops acp70_dma_pm_ops = {
-- 
2.25.1

