Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C70AD7D1DBB
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 16:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33F97DF1;
	Sat, 21 Oct 2023 16:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33F97DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697900265;
	bh=E1djaw8ifzswpjQfVx9V0mZOtpM8UsMK3RebFAoJTqU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e9G0u7pEMKeQE4RD+Ks7P80GkBJBRWxoaYTOpNERmcYlbMYMETyCYarb3Y0tQO8eK
	 cWJyvTVXosSLKKNLGSIWywlpy5+366VwFF9iS5TkECyUKL2wTr03yGZiycZBEMN2e9
	 7ssJeZPwW5PUzXGITk7w0utcnzknHXAlTOff+FTk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C877F805E4; Sat, 21 Oct 2023 16:54:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9BDDF805DA;
	Sat, 21 Oct 2023 16:54:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71A4FF8027B; Sat, 21 Oct 2023 16:53:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 097D4F80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 16:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 097D4F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MEqk2Mnn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aX9I7B+nH+/n2BYkvMHQIcbPU+QFLZh1FsyfPKOBP7JtLyZ+zDmmA+DQbvpUwBnIy3xoVfnoUxaLhyIZWNxwk8rYMfDUI8tceKvZChCOxwe7PMlIABYGRhq33OJGygVHiYtNsb80qxRUvpMcNYOXmnfRanEo7l1Vy93rTp2mx66A0JdvSQVEdCKbdedOaCGM6/hjdkV3HSOhW2eRHl42k6sTsUaooBVd8scjZAiGrxAFFgvWsDl/N71rKX8VE+WGpLBTcwSG1SGDD5qeij2XbeTWIGJmHlPwV50BYiuf7rS+okrADfV3Y+HgDQIYCxWzy86JNvy/iM7Sb1hfJePRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDkltNeWy4y5RmjuXcK9dTZA6jIBlejdqfTAUKQ7iD4=;
 b=lEBBsjJ1Q8ZBUzefMcKDuIP2RJb+H4CQ9a/5EaPwiH98FPL/rwuSFMhtj6m8R8emCgtlRp87PUn5U1xKtVvN4nj+VKokFCweMJiSVwoM7niFgwV22wD/NX9uDfihqWAkeXGBJcPG4s+BZCGz41LHGCODiEVJJSrqbWINpS5AgcTwQgX0tphv7HeeE2EthCY05ZbzfqxYaK4mT4N54drGwOPpQnhhE6AK8fv4/J62Z6DaFIAZ/w1XKYKTnQkDxe24C2W4gtzB95vCEvSNz1K8tWsvp2aXyM1o8XsaqA++KyC2RY4ubpvVMTSsKLzo6s4+EJawQ6mxAmIN1sMvkiMz9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDkltNeWy4y5RmjuXcK9dTZA6jIBlejdqfTAUKQ7iD4=;
 b=MEqk2MnnWMvcSz4YliIvhKYMs3+HspuHDmBsilRHtp0YQItLTp4/DfWOsM7G/ilWZsMlcpl+fCmDNwQLwTCUUaL/8GiVEhE6B2sdVGi4W9sABKYf2JP5wjtYQ4uULXjCf4mmw5VuP+HuFlMzHtZASZbBsvrJTtbmtbHqB5BKPuI=
Received: from SA0PR11CA0174.namprd11.prod.outlook.com (2603:10b6:806:1bb::29)
 by PH8PR12MB8605.namprd12.prod.outlook.com (2603:10b6:510:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sat, 21 Oct
 2023 14:52:56 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::c5) by SA0PR11CA0174.outlook.office365.com
 (2603:10b6:806:1bb::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.29 via Frontend
 Transport; Sat, 21 Oct 2023 14:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Sat, 21 Oct 2023 14:52:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:52:56 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 21 Oct
 2023 09:52:55 -0500
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Sat, 21 Oct 2023 09:52:51 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, <arungopal.kondaveeti@amd.com>,
	<mastan.katragadda@amd.com>, <juan.martinez@amd.com>, Syed Saba Kareem
	<Syed.SabaKareem@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, V Sujith Kumar Reddy
	<vsujithkumar.reddy@amd.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 11/13] ASoC: amd: acp: change acp power on mask macro value
Date: Sat, 21 Oct 2023 20:20:52 +0530
Message-ID: <20231021145110.478744-11-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 978ee171-64a5-4e72-0551-08dbd245696d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NdGkE4sgSrMOqJt17BLI9CqSP9DOqm6sogikbTlpTj7/y9HVwOFpxZFvIru/JloQeZFKKT6OKMr0XF0ifktleCtGhHB3acBxkWJUAFeluYY8T/nUbPFmLNraqGlUcbEUQaHX/DUb13TSWCUPcn6AQ1KPauoGP4YY3KaKty11rJYn9/7AoKTRha29UOJruJ2pHjBWES0NRUeL3t6yWc8ocmyrUhoJOyGcHgRRbcnmRr57t0SwJFaWoajYGH4I+DoL1sBK5KpMrv7NQ+ehR+V8/7usgXDkMgjWhVLZBgfbkvwrLwUyYfmT1DvBGz4pMeHUOfaT9+h/ioyimzQtERXfR/2GIWEp65iEnEc7CZO9zEBQ/2DMQi2PTvTURCr3ftrDjnMdq9EYW5lO8qLynw4XE9tvgzxFXtX8iMS6RNiv4pwA3sJPTTAl+B8P/ap63vx2Ju4t6i98rb5qu2vxwFTvDtcawWIPS2JpbU6BsgHhgVmqzQja/feLdoj5ekidIXGfB7EbApCZQAPG/BLfMk+YGMZxLkUN32hN/6wLv50hL76P3Q9JLaKnuxje7kBlLs5xMj8eejNS81UJaPsS9d/B2eAEsV7C+7TIQ8kNnOQEys+Vp3UPocY5a3Xn5kxrmspnxnRrDbu8DwDHIpF37aUbn0DiLmVP3mb47qBf+kzCzHx+PQD2sNTf9/0SKTi1pAUTrpwr+jhMDEEfzbaaQwstSwx54OWYVbour/QlCNFh5KTJHk7ulh3VO8UyYqar0BpEgOZ6qlDlL9MoTr4q+ZxNjg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(356005)(26005)(336012)(4744005)(83380400001)(426003)(316002)(47076005)(2616005)(70206006)(8936002)(36860700001)(8676002)(478600001)(1076003)(41300700001)(110136005)(2906002)(4326008)(81166007)(70586007)(54906003)(7696005)(5660300002)(82740400003)(36756003)(86362001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2023 14:52:56.5761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 978ee171-64a5-4e72-0551-08dbd245696d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
Message-ID-Hash: ABCPEBYD52VHXPECJIAN3PL3GO5YM6SF
X-Message-ID-Hash: ABCPEBYD52VHXPECJIAN3PL3GO5YM6SF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABCPEBYD52VHXPECJIAN3PL3GO5YM6SF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

change acp power on mask macro value so that same macro can be used
for all amd platforms.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/amd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index e3bb470d1f32..937ce13c7d40 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -101,7 +101,7 @@
 
 #define ACP_SOFT_RST_DONE_MASK	0x00010001
 
-#define ACP_PGFSM_CNTL_POWER_ON_MASK            0x01
+#define ACP_PGFSM_CNTL_POWER_ON_MASK            0xffffffff
 #define ACP_PGFSM_CNTL_POWER_OFF_MASK           0x00
 #define ACP_PGFSM_STATUS_MASK                   0x03
 #define ACP_POWERED_ON                          0x00
-- 
2.25.1

