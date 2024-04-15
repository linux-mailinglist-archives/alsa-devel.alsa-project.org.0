Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF18A48B6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 09:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE0D2EDB;
	Mon, 15 Apr 2024 09:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE0D2EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713164906;
	bh=NYVDLadom2jXFuQTJlSk5F8KtYuvfxzT0A5slpkBu44=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bq53/KHe2atieCY1h4xM4Sg2a4lHWKCbzAqzhaUMQ7blwo/yQQk1LhWRiK+KKX+Ve
	 byBKeKiBBVyKOEsxfhAXfQc/3SI4yG3f9UkhSK1uvRYqSzkxACg/XfoXHR3H7L+3Dy
	 eSHv7RcphqTlSbbnMQJ/CMxr8BS878J+NwkZBzWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E763F805F4; Mon, 15 Apr 2024 09:07:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 534B2F805C0;
	Mon, 15 Apr 2024 09:07:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE28CF80423; Mon, 15 Apr 2024 09:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c400::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0300F801C0
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 09:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0300F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=ajKM7XoS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W12XrErfIxhDzlcJRmnbo8kzsXGAJRxDUMAM6goTrJ8LE/dsbwkWjPgE999leHA+FxMXGegVogP2JTns6slyids27xxM6DCktfMSy0FJZMs6lrBgA6nBW/7bZPhTMnY4IkX5YVJjqzmtDu7elsAC70Jk+wcxV8mKGItprFXY6k9YkfvziUGqz7DhJnCM1CNNQZKpIvjq5a6IHA+mlkODRHl1KqKEkuD/E9LJJX+MT/w80ZRaMYY3sR+PsPdhabLz1pBB4f6M0kZmKoVK5IwIO925obH+NVIcjTSCJ23QYnwbFWDTYQacu7l7uIr0KYfse0mCDjmNSUmXkMJIOY7tXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxZZI88trLcPkuM5m+bNe4H9s474rVMS+WtUW1uoU9s=;
 b=Ub/IRW4yTp8sWLcZtMEdDm6qDtLdkI/Q+Hw7AikiDG3RJFlfD/oFksbQ56Mh7UuT37Czpli/M5SO2RZHaAzXBHJny/GLXBkLyZXkeHA3Ku8I0Ho9MTTotQVv3bikehv/fgwxvVeB/uqJ7f8og6yhjNeruhKJbFvcn18gCxKVvEz2vNbYoYeZjWfNy3RoIQbDLD7DtPMtNTU6DI1ZmMAyJ80qmALs0DsLBp/tOMeE73wT8PPT/++gdYD6JaFRo81tsiKPJ2MndnsGHX1td2HDJ9kCApVoANdXJV0g1YFXhvYPGgPyvCbW1qSTUD6KaXj5PCo6vHL2ZJxelYvArMrifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxZZI88trLcPkuM5m+bNe4H9s474rVMS+WtUW1uoU9s=;
 b=ajKM7XoSPAm4nomh3LTAUSyMURVxhh85k5eiEp7/3sJLpbHukDVd2KPy5JOBy7nngvD84zXfuawr+o1YGQIVllXb70Qg4M+YFdYJglBAvgp8kWvwo+NDA8d93tgE0hHEn+XjnySn+dGbD0BpdT98i6TE8CPPyllIuw99a2MiYWI=
Received: from SI2PR06CA0013.apcprd06.prod.outlook.com (2603:1096:4:186::18)
 by OSQPR03MB8528.apcprd03.prod.outlook.com (2603:1096:604:27c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Mon, 15 Apr
 2024 07:06:58 +0000
Received: from HK3PEPF0000021F.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::2d) by SI2PR06CA0013.outlook.office365.com
 (2603:1096:4:186::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Mon, 15 Apr 2024 07:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS02.nuvoton.com; pr=C
Received: from NTHCCAS02.nuvoton.com (175.98.123.7) by
 HK3PEPF0000021F.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 15 Apr 2024 07:06:57 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 15 Apr
 2024 15:06:54 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 15 Apr 2024 15:06:54 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <edson.drosdeck@gmail.com>,
	<u.kleine-koenig@pengutronix.de>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<wtli@nuvoton.com>, <scott6986@gmail.com>, <supercraig0719@gmail.com>,
	<dardar923@gmail.com>
Subject: [PATCH v2 3/3] ASoC: nau8821: Remove redundant ADC controls
Date: Mon, 15 Apr 2024 15:06:49 +0800
Message-ID: <20240415070649.3496487-4-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240415070649.3496487-1-wtli@nuvoton.com>
References: <20240415070649.3496487-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021F:EE_|OSQPR03MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8e97de-5b17-4e49-2ba5-08dc5d1aa3cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ubVl+qKaAKxGNDB958+y7uKZi4E65x2j2CZA37dNK9T3Y9dZf04SgZvpdEP/?=
 =?us-ascii?Q?TY+am68bCinolYDUr3hjr/c3MonGL4PiOhE1QMc0NhxoBUQujYYVcnsSjAHD?=
 =?us-ascii?Q?QQDKsa5/SSwxo7pCybs+uyDhAgU4WSG2ixxiIFJDaGQyl+GJHHh1Oirjb+KG?=
 =?us-ascii?Q?mqCnFRVZ359S6HqOwim2Mz3sBPnZEGrNzINrVnIfQce2GTSdYRvrMC2Teye4?=
 =?us-ascii?Q?oHDNHl45YemaB4ufhUfiDSbDj+chwvp+ddexuDnGSKxjmQTutO3o8nlUzbo8?=
 =?us-ascii?Q?d1L56jzxQ2npBgngu3/4EsRpXhN480I7Q2FPDDCgC9ELpEpDXWAzz97CkUOa?=
 =?us-ascii?Q?ovRoFeGNr40cRdN+7aS4XAGujm52LUTE7kwXrtTaYdC4P9Ked3qexG21876n?=
 =?us-ascii?Q?qtesHP/salzavJmCCVHeUqN6+Wi33Pqv03u5fUXU83xSQM4Clp3o9MLELHA5?=
 =?us-ascii?Q?imYUfYPzJASOCiVAssRLm8wFmyd52R5/QXwnN4Mg/qfZgMEyH3EIBQbE3xgl?=
 =?us-ascii?Q?k0OtyBke8WzvcOIbfRCgC7NwlfYQBSeVmOldTcCSpWY7gVz8gbb8Dq05AcLy?=
 =?us-ascii?Q?lBI/J7rE4IgcIw3QUfeyYsAAEMpW7HoS6E9STjMqJCDQARbCsn8SVreMFCW3?=
 =?us-ascii?Q?Jxq/rOa5b59fUorEMcni1liKx2DYtHHoXdc8HRbUGVqu3KNSyhA5dMGPHqaF?=
 =?us-ascii?Q?URo+Hj4SWoqRV94KMJ7Uht3ZD4mKxMv4j4ZGPouKvQgA0529RXGVqiukmLWK?=
 =?us-ascii?Q?UR6HdLckKd3Vv60QqD08fgc5AQ5eW1n3GxrIouXEx8HmAQCSprBhsC034WsT?=
 =?us-ascii?Q?Ez8Vk1c/yxSIWDAqZvaE40pAEfaeF5QCBKkgUhp+1cHD4G43sa76FN4MHDke?=
 =?us-ascii?Q?a6xCQ7alsnfCq1HoBC9+QsbceZh+w41hFe2SRcVnZoijPjFxx+0/YrA8CV6r?=
 =?us-ascii?Q?fVzjAPrfE5Mg9GTYR3wRoPxOe+OQp5PF9l9Kv6mJTN8ckdxNTQb7y5W+9uds?=
 =?us-ascii?Q?SZ5uI2Z3af6M6eUbzB1RxHHm3wNGuAscwvaQw/ivhaUo4rR5wvot06caGjq9?=
 =?us-ascii?Q?NFruAzf5Rc7E+u0WtrH83xjn4XqpaGC2tToswrMEpMk0e928FW8m6uu6CaHq?=
 =?us-ascii?Q?WPoTz6caMDPjIxWWqLaI9G3EMDbP2OkiHmYUNIn5IKSsXSTe3JuYTCvlRywL?=
 =?us-ascii?Q?zmnWiXrIdjqNDUaCbLrHqcI37iGsyxnk4OHlOv8TwVjqV+Y4aREpkvc+/I15?=
 =?us-ascii?Q?Qr1y0Ty1ZtpY4ZamivsiDGtChQvVqlYLV87m3HrD1fRT/gjOCe0uFoGyiNcl?=
 =?us-ascii?Q?G332vdQ0BZlUNoEoeZBxrs/CYKVyWD41ne+ySMiZcE6toyL9q5OUWhfj5EM9?=
 =?us-ascii?Q?3ZdU7Bg=3D?=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS02.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(36860700004)(7416005)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 07:06:57.8251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f8e97de-5b17-4e49-2ba5-08dc5d1aa3cf
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS02.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK3PEPF0000021F.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8528
Message-ID-Hash: NBNCMCPVIDCTED4AJE6YNXYUCUF7AUYP
X-Message-ID-Hash: NBNCMCPVIDCTED4AJE6YNXYUCUF7AUYP
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBNCMCPVIDCTED4AJE6YNXYUCUF7AUYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove redundant left/right adc channel enable controls.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index fec669e00a10..6818bbd1d3c7 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -512,12 +512,8 @@ static int nau8821_left_adc_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		msleep(nau8821->adc_delay);
-		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
-			NAU8821_EN_ADCL, NAU8821_EN_ADCL);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		regmap_update_bits(nau8821->regmap,
-			NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCL, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -536,12 +532,8 @@ static int nau8821_right_adc_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		msleep(nau8821->adc_delay);
-		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
-			NAU8821_EN_ADCR, NAU8821_EN_ADCR);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		regmap_update_bits(nau8821->regmap,
-			NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCR, 0);
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.1

