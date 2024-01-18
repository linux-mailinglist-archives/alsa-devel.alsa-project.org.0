Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E4831B62
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 15:32:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3574CE7D;
	Thu, 18 Jan 2024 15:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3574CE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705588322;
	bh=TarCZNF34cbkJ7TYEXJ436XSxx3DfZJBwH0xaz4cvQc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=urO9nkM8TOvkORmIQLKna/MPUKbMf3eojjVgK5HmDNovwHJmiKzLXM8E06Whcx4P8
	 PGsX3mmsuobQDM9d+yWwRXtVuQM+v5Skjqx6e6njzduythLGEnDhYg3Sq+WZe4lyUR
	 tXnNuSG/xhZmMKdfKm1At2lO3tMsvo/2hu+gOb9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75BF1F805E7; Thu, 18 Jan 2024 15:31:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE9DEF805E4;
	Thu, 18 Jan 2024 15:31:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54DC3F8028D; Thu, 18 Jan 2024 15:31:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1CF72F8014B
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 15:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CF72F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=a5EubFEg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odpYJCrgEC42068Qqb0LW1YupiRT0zk2Gxu1MClToIbbiM54yke+csFVAbjDrmx5rEOFDlb2FMwnY5t65papIICARuMklXMOPCMP8s9+D+hhLgClODCNOUT+8oyL+sL8zgy0B2i68kJrstaHfdrwj1J7OcvtUGv6x1IKbV9c9UAtlKSPaFALDom5srZqEPsf+nPclms4en7HJKekKK5SKFwlA+z5TaOO/s2NEvvrnFgylCRAFvxltaBApmwaulhVYeS+wMhxkWyUOuVsW0eMXaH1fR+O3xPM+UIyytUhbOSp2/FoqR4NyVaFX2GpN+lhkwNsnrQ29e8XUka6zHp/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFLmCPJjJFH2XLuYXiy/wIG1LVjbj4rTcbORql18LHI=;
 b=i/Epjo2EShYrkrs0kMtPYNImdVR1Phh7nm0qDtsyGIDQHUvmPJsspOsXnWNLcHq3Wt48rCb2Ah63xzgn/VLRLdV/ZONCSuABnGg0ubaSikGrb1tcUmgtUP7gposkazdk4ZsF/xTt/Q5g5Gj2ZjrvWKzS0vH/jo4foT1/q40Oy1YdTqwZA+9buMj0k3wmDrOrJiCPwPTBk0Xj80bMTgmT7Y/fy8sxGDatc9PFQaESUein5Mq5gdGz7xlqh/gJlGyEpsXfmuP1H8a/BUZm5XsvvTP6FqH86zncG+58yIJt1SJhj7O1TZ5xtAgJL2pMA0wN/4BkiMv+wTbdd3Fabkc3vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFLmCPJjJFH2XLuYXiy/wIG1LVjbj4rTcbORql18LHI=;
 b=a5EubFEgrlmk4rgcdrpXVvbM6uMSYpAYuTdKvxAES/quOcAM2W089HJf/OySQAxFkEmZhENAmwkN/oNODsEB7XlJL3ZwCdtUnKyZiw2D6lnWUoDSj4/3GheqmrDi4uUyj/CLDP7BAsglLAbOxsAH5Z5iiHTniyTU1ScdU8KVrU0=
Received: from PH0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::26)
 by SA3PR12MB8440.namprd12.prod.outlook.com (2603:10b6:806:2f8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Thu, 18 Jan
 2024 14:31:06 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::42) by PH0P220CA0015.outlook.office365.com
 (2603:10b6:510:d3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24 via Frontend
 Transport; Thu, 18 Jan 2024 14:31:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 18 Jan 2024 14:31:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 08:31:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 18 Jan
 2024 08:30:47 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Thu, 18 Jan 2024 08:30:38 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, "Alper Nebi
 Yasak" <alpernebiyasak@gmail.com>, Marian Postevca <posteuca@mutex.one>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open
 list <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: amd: acp: Add check for cpu dai link initialization
Date: Thu, 18 Jan 2024 20:00:21 +0530
Message-ID: <20240118143023.1903984-3-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118143023.1903984-1-venkataprasad.potturu@amd.com>
References: <20240118143023.1903984-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SA3PR12MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb750a3-ae23-4e09-de35-08dc18321ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iIYkavs17ip8vpKI3cAIHUryf7zrICBsaZZG81JWxriskMqPmKgvz+BcNLK3x/kJRZPqDg59vjhzGl+U+eqnIgPwR8TC3mK9YTAShLRDNxTii4rh52vRgTN7336K71IrvM1dMxdsVxoFtYf3G0s+Ug1wnP76QwXpJNMFgeVc5qv3sO61wKXIF6BnX5xQNkzTZST6ev5QrEJRJmd2QQPo0+SQfCqE9b56ovgIj5UEk79ckt+SejSmNn4iIroHEFv2j5U9tKyXnysxYkZAaPA/Ny9i+oZlwjp8f6TMazxmStS96UD/4qkigb2l4O2AFmBu1UEtLNRwyYYuUWDtYd+41gZXTOfzFky6v/NJjT5VvYk1X4X53F5n8+v6JBe/+KDo0HC1l2z7/IkYtSwDdS3aJAE6ZXXn/z7YP/FNTmc0tT+l5BhaQtnWwN1Rb5cH9viQfOeZ39rtfqOvrQumhkOW0EM9r6qXzy68/lAE/O7HTgGxy8gLC2i6ucdWZsAiO2qWR48NsknpeqOhexe0l/UaDcEITnIiyvpKtSFvIrMpO69bbJKsNOIKXoJmuD1H4GPsneuSlbbtMPr+VxIzdGH7DoAlAt7QKLuVL6X8BB85TBVHiNqo7Ax5/b320sH7zs37qKB9nEkhJE+uHebSZykhZbZ1hOqNbv8gzu2SJYbyT8ta9dfh5arqGqseQNDA/4iVI505MZaXjqX9zlxOjivYS03mRif3pwIcIho6V849wogh9FXrmozWBymUERy4j9UNfB4UfoN9+AXjgq4rjrPvEg==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(451199024)(186009)(82310400011)(64100799003)(1800799012)(40470700004)(46966006)(36840700001)(478600001)(82740400003)(41300700001)(36860700001)(86362001)(36756003)(356005)(5660300002)(2906002)(7416002)(81166007)(316002)(2616005)(6666004)(70206006)(70586007)(54906003)(47076005)(83380400001)(426003)(4326008)(8936002)(8676002)(336012)(1076003)(26005)(110136005)(7696005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 14:31:05.5683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0cb750a3-ae23-4e09-de35-08dc18321ac4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8440
Message-ID-Hash: 7TXYGZAOMHPMPKAZXUZV2O2PFVN3FKNS
X-Message-ID-Hash: 7TXYGZAOMHPMPKAZXUZV2O2PFVN3FKNS
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7TXYGZAOMHPMPKAZXUZV2O2PFVN3FKNS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add condition check for cpu dai link initialization for amplifier
codec path, as same pcm id uses for both headset and speaker path
for RENOIR platforms.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index a224043ccd42..504d1b8c4cbb 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1471,8 +1471,13 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 	if (drv_data->amp_cpu_id == I2S_SP) {
 		links[i].name = "acp-amp-codec";
 		links[i].id = AMP_BE_ID;
-		links[i].cpus = sof_sp_virtual;
-		links[i].num_cpus = ARRAY_SIZE(sof_sp_virtual);
+		if (drv_data->platform == RENOIR) {
+			links[i].cpus = sof_sp;
+			links[i].num_cpus = ARRAY_SIZE(sof_sp);
+		} else {
+			links[i].cpus = sof_sp_virtual;
+			links[i].num_cpus = ARRAY_SIZE(sof_sp_virtual);
+		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
 		links[i].dpcm_playback = 1;
-- 
2.25.1

