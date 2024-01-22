Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92147835E2D
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 10:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BCE1B6A;
	Mon, 22 Jan 2024 10:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BCE1B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705915762;
	bh=Ry0H129l7q0hv1pjs+h8ycQ9d7RRzP/o20mIdnuNtvE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qAQAb3DmBLslbyNds7smzlajExefHvxKLMse/fkrFq/YwMYB8o/xmnsM2BEq+rUr4
	 SIInLpwYBOHkbIB7mDznjqf7JdnW+PtzkTTKH1LJi9R4ALBr2fj8JMYTGFcOr33AVX
	 iD17M+Fu5fOV+KgH28BAgAucU3n/bpU1A1t/Vy/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84E96F80564; Mon, 22 Jan 2024 10:27:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 743ABF806C0;
	Mon, 22 Jan 2024 10:27:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7883AF80634; Mon, 22 Jan 2024 10:27:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFBEBF80571;
	Mon, 22 Jan 2024 10:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFBEBF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eJRiotnd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nS+dO3DAkB2cGyBGksrN5ESGYMax9JcD4PynS6vB9KMqvfxzzEqAPJOonN4sLAI/mLlQ2Ed5OyqNNFgy61+YRYFl+YseiuzuorMBHMdJ0C3Tevh2MmbAh72bzKUaDGQ4mafBYGUGNPN/fVFbTD1WKw19E+lykeWU7CXEJi6J5Io05bTrjbpUd5idMilMMJLRSEw3tfjeSQr/WWid2OaixPSmrP1zWoG/zQELw3Wa8cp66WfGC+A9xgZbmHbS8Jf8sd34/MhO8OkQZNm55eY+IJZN96FzueZdKnFw/G04Lp5o9TaTkQvyCrSMZX1Bjy8Idf977P4mctXTMAYUVnDDPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM5IfcLFOV5I+4SsS+sfeBeWW0qVpPfMyKw8GVqZb7k=;
 b=Cgf4wSRcs6Tc/NeKmSGPoikdDj30justanIi4GwvEDjgAMQP2dEDKpCLBNQvcmvWilso6wSKWrZ5MX9Jf85U2yPFlg8S56Xekg3yu6Dacnd4iE1t2+BV/M9+L/jkLyZjh6Gwr7zVt8tpq5pHkQIeGxYBflX8tx+fiiGeLf/HjosxFaI6kDwmxYPtzhNgYPyvB4RdfNYeCquvRbjC6nWmpnRzrgOUYNdKPjos1B55g7LlIUwN1IVnzoQg7xlUJ5qjcXnCpV+TSw1Yt6Elgl/hM8x+XsxnR8iQk3M5iTKuYW5nT8QcOnZb2OZMDUQvTX2YEtK9UxgWDalQfvYA78NU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM5IfcLFOV5I+4SsS+sfeBeWW0qVpPfMyKw8GVqZb7k=;
 b=eJRiotndKhWQ5yhMBnW6n9h4TVnw0BWW1hIwjz6AjBnveos7xnqktFTau8jtQEt8/MHBEcbhbNeVOrO/8uAKCBxi8u2rrBuNn6QtklOOYHZzop7y7gh0bz7LkiO5q80yt/TElRMQ8sTDO5p4yJisVTLNK3PMLCFDw4iFai4UUgE=
Received: from CY5PR19CA0035.namprd19.prod.outlook.com (2603:10b6:930:1a::11)
 by CYYPR12MB8704.namprd12.prod.outlook.com (2603:10b6:930:c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 09:26:35 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:1a:cafe::fb) by CY5PR19CA0035.outlook.office365.com
 (2603:10b6:930:1a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34 via Frontend
 Transport; Mon, 22 Jan 2024 09:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Mon, 22 Jan 2024 09:26:34 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 03:26:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 22 Jan
 2024 01:26:34 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 22 Jan 2024 03:26:29 -0600
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
	<Vsujithkumar.Reddy@amd.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE
 (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH V3 12/13] ASoC: SOF: amd: select soundwire dependency flag for
 acp6.3 based platform
Date: Mon, 22 Jan 2024 14:54:34 +0530
Message-ID: <20240122092435.3791175-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
References: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|CYYPR12MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: fbae746f-1481-4b9a-b412-08dc1b2c3a33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1SfefLFk8y1wt6IPTCWR85zCqTzKzl3DPlD8YbjXbr79JYOAJvHiRqhH3C300KoDO3uYlEsImKfDtZTKfrB+DMYz/1SIRgi0a1Q0dGQF2/sQADj1CL9ry8VlG87sGV4xbR6a9nbBsBLb3PBrxl1Qgf69aJC0rAz0Gutv4AB7CeMpwtpBqBVFYYrdtWIg0p3sM9HXKljP11pcBsjKkL4Avsg4kew9CQO5fxUI3QShGL6rtLSucU4cGCbrX1re6q8k7Ixz9hTzveHMmam915pyqU261KHXdHAsT4grGiUY/YHG5wc6ieH6PiWPiu39m8w6tuDry9Mv1nlKpgaodAUZChl87saU7ktjdKoSppd4z++iRibRP17buYYAs8kZKBNgiAs9PCHvme8ZrVSSki6daXwOXSiA50/oKdklc7kxlSglz5u1POGuohVFdBz+cqdQEmM6qmiUNECtfCYnLCsM6MvREqJPvw+oTnKYrmxABq0FZh+KHnpU53lkEZ8cwySKNsi5DUfxop4bWGZT45twE1sOqB2Nx2zEKJLTYAr+ECXR0Oen+oa4m6/212PfMtC6oKAZglw/FLJnDWTfLQAeHoazUYVK63oV9IR2CSbQa12TcdaE5Yvte7zXxdCw31as0b2+H5tvN/jvIzVL1SzFqzEOnvRvBbnTpRutZHqwQ2ecCJL2Emi/KvSmJkWB4THNUKwaCt9vHMkb3KU4RXZnpKPKifOOLlbctV1p9lrg1qdjmyiv3RT+M3j4WFrlgK3VV2p1Vf2Kke+D2nRhiGDroA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(4326008)(1076003)(8676002)(426003)(6666004)(4744005)(336012)(2906002)(26005)(36860700001)(70586007)(356005)(54906003)(82740400003)(70206006)(8936002)(316002)(7416002)(5660300002)(47076005)(478600001)(2616005)(110136005)(81166007)(86362001)(41300700001)(7696005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 09:26:34.7808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fbae746f-1481-4b9a-b412-08dc1b2c3a33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8704
Message-ID-Hash: CQDNGPZWT6WUIEVBINS3SDEGCN5K5DOU
X-Message-ID-Hash: CQDNGPZWT6WUIEVBINS3SDEGCN5K5DOU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQDNGPZWT6WUIEVBINS3SDEGCN5K5DOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Select SoundWire dependency flag for acp6.3 based platform for SoundWire
configuration.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 1cea1d75130c..c3bbe6c70fb2 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -81,6 +81,7 @@ config SND_SOC_SOF_AMD_ACP63
 	tristate "SOF support for ACP6.3 platform"
 	depends on SND_SOC_SOF_PCI
 	select SND_SOC_SOF_AMD_COMMON
+	select SND_SOC_SOF_AMD_SOUNDWIRE_LINK_BASELINE
 	help
 	  Select this option for SOF support on
 	  AMD ACP6.3 version based platforms.
-- 
2.34.1

