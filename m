Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA087EDB45
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 06:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D94D844;
	Thu, 16 Nov 2023 06:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D94D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700113052;
	bh=/AjTx923BnliPEeQZq3OIbGVkgSWuVe3wJQS0UKF0Ck=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IIBz7Rc+Ecs362xTpWSF01rB6+gTwgaxoK4dtmYUkgt8TCXFPpgbrmVIvkszx9X4f
	 zyohyqIfMb/uUKSiWrw5ANZNLznLLyGCvVhpLX3wMuJnAQLNwa5uhNXKsZXA2rqxUR
	 Ffw6g6QnymVBrN3XW+ny2Dc+mBCuk62jiRUt1dZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6757BF802E8; Thu, 16 Nov 2023 06:36:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 578D4F8016E;
	Thu, 16 Nov 2023 06:36:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36893F801D5; Thu, 16 Nov 2023 06:35:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0E84F80152
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 06:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0E84F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hR2oUFcR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0tJvqBhqMxZrB8HPTIzUrThyOTBCeSWOpTp/OFHFfmwCd/Zmud/RP8VsVU7PDv2CsHfAcqQEq9uFtpl6F3tc4ytZYUHjgBFrzJoqTlvM+RXClNc3yc6mvAxxXcYmSWCWfXwuuC6QDp/20ERDKMXNt8NqdXr8odLQstNcNt+0229Ab0GaLHFv82DcAQnkNIY1BvfioT4XsQzrg/mBEt8XgyYKAR9xZUcNzJ5kma6Vj/ytMWUdCrCqhI3LQSh4jL7KLEYkmlOogYudl3CdWeiAdhN6TPXS6PatcVqfZuZzVB/rUDhGAtelzMt4QjUaZK5XuWUmgTGcHHR9UaudhQM4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98UTuh6MCAsFdTUk9MwKYoehigc3M3xhOBg+IeHo/qU=;
 b=RyiI5BKC1JS7OXQvK/uE679AYFXUeps/TPx8gptLdin+BfyUIPTCFgdm3J/61I7D2Uoytbusjz0+wcl2/YKSCZkK4wsXUe7FqhNIRLm/HMftcoVf0+GdFXjlM5s8LNHcKLeq8vGAAmAk53S7zilSOGg43Q8HRRwoA3on2RgBNmIdw6kzCCm3wmt7Lq20DXdCFO5HYBs1W0oCHd1HzaIC1KwrZXHWq33g33/uLDZomHyQg9yoIIpEJlbPJNrblT418mLqJAUSe7pJyM8WcJsIOKfA6dv4r0LWvAifPIzP3b3dvTiXpRIH7N9Z+NqMzFozKp6hSL7SzLdUp63rN8ZmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98UTuh6MCAsFdTUk9MwKYoehigc3M3xhOBg+IeHo/qU=;
 b=hR2oUFcRQFXp4h7RBCjUJf+Tl09WvEKJwMFia7xX/cpS01MPp+NHuY92BoDO/71gHv3/xBLOi3iX4C2WXj+7AB1u3pbFv1qeVJDgWqdelrnxBjfpMR2kWBbM7kNuTm7OInjHtaHMARq5CLnkoher1aCSTwULkcMoW7esTE5B+KA=
Received: from DS7PR05CA0053.namprd05.prod.outlook.com (2603:10b6:8:2f::34) by
 BL3PR12MB6547.namprd12.prod.outlook.com (2603:10b6:208:38e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.36; Thu, 16 Nov 2023 05:34:49 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com (2603:10b6:8:2f::4)
 by DS7PR05CA0053.outlook.office365.com (2603:10b6:8:2f::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.8 via Frontend Transport; Thu, 16 Nov 2023 05:34:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 05:34:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 15 Nov
 2023 23:34:47 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 15 Nov
 2023 23:34:29 -0600
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 15 Nov 2023 23:34:26 -0600
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <mario.limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: add missing SND_SOC_AMD_ACP_LEGACY_COMMON
 flag for ACP70
Date: Thu, 16 Nov 2023 11:03:57 +0530
Message-ID: <20231116053405.2574081-1-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|BL3PR12MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: eab4984e-8ebb-49d1-1820-08dbe665c068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/z4pWhISYiqV9c+BF42Jsf+CGyMv4i0KUAmQcf9AwGLnI/MlYJC1uc3WIpJdU7l7tVZFdtep9NnEC6NJTDpDCMKzAVppB8q/L0M5i2jNDfBdF+NwxkP2/1ep5j4BnZfZl5T+KgxpnWeG73Hx9YTDco1o2mVZSoafDaQ/CyqYCtg7lnMhCCqNLQt/P1kG9rTqCJiexccncfaoFD/Vi+q9wAXQCQS60FwcQA5KoTAg5QRlzCvhii4xZ52Nn0wbV7U+FnPGx9GDCYnz6ooLYeG5ttM3gJ0OqdlxVA4rCo6LY8iQwrNTrf02Q4EHNV4d2qcR7eU4PfYeXD9rvD54x1HSjEqz1VvOpIGUpjPE/QGL+0dAsDvALJcKnps2EFrSVheJO8MWSbpai7a+imry/Jv3p2OjMwVRy4egeGCjTWtKW6qGjCCM6hgpqzWTDzR/EGpsYAbtPf+tmaUtBDfzOrK4lj1nIkkVtvmjQxyzlbblQA+fuYGkS+aKgeWVoIuUACa/Bly4Mn4++FyEbwR/iZaE5vO6PfjDw9s44o2gBeWijQtqwaYOkpHcc/6dLjrmz2/ZM6UxLvUTQqBNMU4jtn25rIx1RM+LeZowCP1E7TjcIM/30nWEF84rNr9C/CLZQAgrESVydxyAqSTkCl6NMbo2u20lA3c4en1ao3dQDh5GBoDxR8D1fUYxXoPBWUukYLH1WIS6APB+ApNvBUwP28Un9FJig0MffsnM8JdCdFMZZH+sacSjMBFCT3GR5EWEQqR/s5Dmvy83AQbBdPxg+nElWA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(40470700004)(36840700001)(46966006)(40460700003)(110136005)(316002)(54906003)(70586007)(70206006)(6666004)(478600001)(4744005)(86362001)(5660300002)(8676002)(4326008)(8936002)(2906002)(36756003)(36860700001)(2616005)(81166007)(40480700001)(82740400003)(26005)(41300700001)(356005)(47076005)(1076003)(336012)(426003)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 05:34:49.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eab4984e-8ebb-49d1-1820-08dbe665c068
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6547
Message-ID-Hash: OQEQWPAPAZBSO3DCCH4GD4UTRGELJCHV
X-Message-ID-Hash: OQEQWPAPAZBSO3DCCH4GD4UTRGELJCHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQEQWPAPAZBSO3DCCH4GD4UTRGELJCHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

add missing dependent SND_SOC_AMD_ACP_LEGACY_COMMON flag for ACP70 platform.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/acp/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
index c8ac0027f741..84c963241dc5 100644
--- a/sound/soc/amd/acp/Kconfig
+++ b/sound/soc/amd/acp/Kconfig
@@ -80,6 +80,7 @@ config SND_AMD_ASOC_ACP70
 	select SND_SOC_AMD_ACP_PCM
 	select SND_SOC_AMD_ACP_I2S
 	select SND_SOC_AMD_ACP_PDM
+	select SND_SOC_AMD_ACP_LEGACY_COMMON
 	help
 	This option enables Acp7.0 PDM support on AMD platform.
 	Say Y if you want to enable AUDIO on ACP7.0
-- 
2.25.1

