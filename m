Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BBB818673
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 12:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0AA0E9F;
	Tue, 19 Dec 2023 12:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0AA0E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702985635;
	bh=xW1UNt6Fo4MXcl3rpNWJ0Wt7f0H8dmq5ryvq4X8Y4MI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t6gmUzSxoZm2Spz0aIkAa7GfQ+6OKrkTIx813EL0Pmuwvu2RhkkoDsk3DTYO5nbdF
	 EmdKb9by3/vXmhK+1AgMKXLh6WEUl6idGD5EyAUNbnbVKUFYQnTl+R3CVwLE4ClAgp
	 2GCAah0ZpAw9RODskQo0AEAGU1jW+NtcTkI8ETP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33B1FF80640; Tue, 19 Dec 2023 12:32:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB9A3F805EC;
	Tue, 19 Dec 2023 12:32:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAC7FF80425; Tue, 19 Dec 2023 12:25:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC9C3F8016E;
	Tue, 19 Dec 2023 12:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC9C3F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=IYoES3OG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0Q6q0pyCkwoefr/krLxH6wiSgyiqdISvFooAvUCC3C1vhXZtZFFXGl/UG/wyUBQosf/dkY02QcKoUBVO8la57vaUJ2SxNV0VKeI/kYgHnJTiY8uwGFo0USlgkk3oBAGWBK3Mhf+xmTWh78HL0oidJ/Wy9CGBIekufsiz7y/i2jy7lSIy5tKsFwjz9R2dDxx//1vZ7Qfa0Mmk7btUtwh6YggmmdWxjrThA290qqmNs3uUxZewz/NHuoyoctOvLucI5j8t30exr0Ttf3IRn91nat40X9LPGYrRRG/2cByufACLUV1EzDiWEvO8ENYASq84krRcEhtrRXUPsDzSaQJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnibPXwvtxwiKdsBzcCnwTMu9XwLkmFDV5NF9dsKwvk=;
 b=EMD3GBaHPatPGaI1ZnAmNpTEvzpSqRKxkhAJAIwkdg4p3KJbAUwuybpizioJwb4DhocIGdBbXwFD40QxKsv6/uDwu5RHoiU7eIr8AG0IjXDlAYHl1aIKu9o8k83BWO31UahtTlSF395/Y7BPauTDEPD6DDbphDG6JWi4F7qJvmQlRsdDa7rqL1o+dmbtGhjx4/cvCxzKEHsgX8mP2eM/xVCFuZElQBKoSMrLgChbKni5AR91K634sjvUm95yxuO3PymJpdNP2+2GaF//cPP0M5CI8nDV6v7QnklBqsbQ50UTlTx4QET8imxSt8Q2heQHAhRhyDevZ7CZQ4ikLtEAbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnibPXwvtxwiKdsBzcCnwTMu9XwLkmFDV5NF9dsKwvk=;
 b=IYoES3OG9KJUUY0GNdsFc3WrPOLgaO1Q0QGDUNUzM1Edz6keRL3SB18A7g+MulnNv0G3qSNNnxZTQCEta87iAR6Kskn5LMAhHxfNYL9/ppZM2DFWsechkrAEJLB6kqUJ+2WVLg/cAgNxNefGx4aaxjyv47dL6BxjsftQslyF+/I=
Received: from DM6PR05CA0050.namprd05.prod.outlook.com (2603:10b6:5:335::19)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 11:24:35 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::48) by DM6PR05CA0050.outlook.office365.com
 (2603:10b6:5:335::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.17 via Frontend
 Transport; Tue, 19 Dec 2023 11:24:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Tue, 19 Dec 2023 11:24:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 05:24:35 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 05:24:34 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 19 Dec 2023 05:24:29 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<cristian.ciocaltea@collabora.com>, <emil.velikov@collabora.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "moderated list:SOUND -
 SOUND OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/5] ASoC: SOF: Add i2s bt dai configuration support for AMD
 platforms
Date: Tue, 19 Dec 2023 16:54:11 +0530
Message-ID: <20231219112416.3334928-3-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
References: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: aa219738-d517-4f99-d2d4-08dc008514ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FUXW67hUh4RBdoZH8nIv66IgWV4YAY/9wTjbLZC3j3FgaKUXsodiMQbgYKpQT9tiM0Ix04F+gIoQSxSNsGp8ITUI2nOxQhKPrMOiN5l8y/dfCDD14SZCrq1lcsc4D4KMIfwZ2m+BOLvPpvJhmijc11F2923H1n9Ow0+YwCxYf7Jau3YyHgfbz74QBaIdIGuMlGmVglRikmenoRXs/CicSWMVWEJZtZHLGYq3nksRC09Pp6cI9SnO9onRoRUVlIfiLBa0uqvD/Uh8k15LFTQagM7fXQ7QIpuhOWQTepQ0+lj4n9z+YFLH4cBAHkDvpC60lYaEUIlyg/+sdU1+rbf0oREMXxd/knQMAxZFu0D12B4GBMlHiP76jYqLs+IlPMWjrnYdqezU2n037e1fCOzcBs0PeTP+seUROua13b6vd7vsI2ng+pfcbqmkqrdGJgodW+w3+usU7NawDhzd2Kjlup2qoni0NI79Y1gGspuNVkOgZh4BesRYcaS6Rg0cljaQ6B1eX9k4zWVrrZfh0+KENFf/KlHWqnPaTrdlIq52bdVd/GJqIbTJNI3RvEtxDFt6zwEINVw0i3jAeNRWRiOmtErZ5AsqX7xGZ7Zo00InQaHjMNMpHEm4a9DAhx9g/LhfU8vweWnQB/MIK2REs0tOmK7w0F79RqtjDXVIbTV3Z1nOsH50QVEhG3zecGz3qxN2hw80Kav0i9kEkJkWp/rc7guj/VscSVZ2xmnwD5gBexFRCHXpP4fgRJ3YQgxszeAwrDXr3LyBn8+lkn2/MC1X7g==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(40480700001)(70586007)(70206006)(356005)(81166007)(82740400003)(36756003)(86362001)(36860700001)(1076003)(478600001)(426003)(336012)(26005)(2616005)(7696005)(47076005)(4326008)(316002)(2906002)(7416002)(110136005)(8676002)(8936002)(54906003)(40460700003)(6666004)(4744005)(5660300002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 11:24:35.6507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa219738-d517-4f99-d2d4-08dc008514ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620
Message-ID-Hash: QJQG5FURSGXW5DYO2HUSVSGI7AE4543J
X-Message-ID-Hash: QJQG5FURSGXW5DYO2HUSVSGI7AE4543J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJQG5FURSGXW5DYO2HUSVSGI7AE4543J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for i2s bt dai configuration from topology.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e3e7fbe40fa6..66b271ca6910 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1956,6 +1956,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index, struct snd_
 		token_id = SOF_ACPDMIC_TOKENS;
 		num_tuples += token_list[SOF_ACPDMIC_TOKENS].count;
 		break;
+	case SOF_DAI_AMD_BT:
 	case SOF_DAI_AMD_SP:
 	case SOF_DAI_AMD_HS:
 	case SOF_DAI_AMD_SP_VIRTUAL:
-- 
2.25.1

