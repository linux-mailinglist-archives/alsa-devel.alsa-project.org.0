Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C108A2C8E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 12:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6ADB2BB4;
	Fri, 12 Apr 2024 12:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6ADB2BB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712918330;
	bh=NYVDLadom2jXFuQTJlSk5F8KtYuvfxzT0A5slpkBu44=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PF1XdTTre/fhzsBpJxnMTVysI7cGenVJ/qJXoERyLgXjavUjQRd4xFohZbqiGgjvd
	 xVwlPp5HYBZcAfbrQhbUbo1/uh/OLbMyH8L7xgfb8esThKPZZqz/lR+wS23WfO+D8o
	 ZV85lv6Ku9ONivjh+krOsdDffhJ5IJ0OyEKO6MAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C70BF805C9; Fri, 12 Apr 2024 12:37:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE1D3F805C9;
	Fri, 12 Apr 2024 12:37:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACAC8F8028B; Fri, 12 Apr 2024 12:36:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23A67F80130
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 12:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A67F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=QRCE5ujn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XY8jJWj0DPfhC++bhMyfWxcppAfDNLZePe21fctUHImr6JjKVGARfJ4CpKqb0bnBaHhl2zuoZh9fb+JMe2i+g6TIU9cHKHxx+DTYwKezH29AWvHSKyKTV+orlPx6yj8sc6N7+wUBqxne+exHf4LX4xQItWnK9uWaVoGnyjPo89z5y6KUVriqgkW8IMGG0opOmpyY0vMDKvicJ4yugKM+ygfGeBrrZ9h3b6x9K6ooWfZwEdHpdgLQBQdqOkJbri1g1YCP8GRWV5j86S/gNpDsT9qlyZwu/lvB4nlnGwLbQn4yXJCIxebQoZd4wmc+2WfKHZgPyriVfNc/SOl7juQniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxZZI88trLcPkuM5m+bNe4H9s474rVMS+WtUW1uoU9s=;
 b=A+4SlsGhwm/73LzKw/R+M3pVDVXn3QC6WD1uzvjXHflo2bWjkgJY6mHSawJJO+n7nS2UEZytDYB/hScMrV0r0sIdZXP9lJ9Md77Xt1GVoiZyx5u199nbQWQtxxkEJewzOmxVnzFT74nGvjxpvuZ2pNJV/TJyiLJKWm7o673BXhqyfPiCrO6TOBs2hx+1UrjgvC7XCQcg/y+1z/wP/Mtxs2+KVe0M/D5wl+wG0ng9y1dOkSZIV5AdUStpUAtehk3+Js9BLoutXHttnd3Ilot0Xu3rBxt1+dZp2rZlhyHDTu8mMt7+Lv8b/y3qujfsV5gAKSiQEPm45IDDYlqR4YYApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxZZI88trLcPkuM5m+bNe4H9s474rVMS+WtUW1uoU9s=;
 b=QRCE5ujnQVQOM7NyYIGbve1f/msAzuNzBLffG6zykSRkjxXfuFyDUe1mIDQnlNGpDxStZ52vYMqT7Hel3SUtZ9YEo2Rwk9mJ+JUP4drJrMW9CyUuLS3Uf+sbea6YJBMf0VDo/3tCBraBWY5G2B3YPpA+MUjSU83vBy5yjVeErOY=
Received: from SG2PR02CA0029.apcprd02.prod.outlook.com (2603:1096:3:18::17) by
 SEYPR03MB7165.apcprd03.prod.outlook.com (2603:1096:101:d4::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Fri, 12 Apr 2024 10:36:05 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:3:18:cafe::29) by SG2PR02CA0029.outlook.office365.com
 (2603:1096:3:18::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26 via Frontend
 Transport; Fri, 12 Apr 2024 10:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 12 Apr 2024 10:36:04 +0000
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 Apr
 2024 18:35:56 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 12 Apr 2024 18:35:56 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>,
	<CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>, <wtli@nuvoton.com>,
	<scott6986@gmail.com>, <supercraig0719@gmail.com>, <dardar923@gmail.com>,
	<edson.drosdeck@gmail.com>, <u.kleine-koenig@pengutronix.de>
Subject: [PATCH 3/3] ASoC: nau8821: Remove redundant ADC controls
Date: Fri, 12 Apr 2024 18:35:54 +0800
Message-ID: <20240412103554.3487290-3-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412103554.3487290-1-wtli@nuvoton.com>
References: <20240412103554.3487290-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|SEYPR03MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d05ed57-08af-4290-2476-08dc5adc5b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cw0Izuiv39JV6Di3lOv2ifUa1KWfTx4poERtv4sxwz+z74R5IxljBQlqgxCFEE7A8nqGLo7H4LBCX/4JdkpZ7z4fJSZR3dxPLO4VJLp91rWWRPM4HDn4SuQBH8MJWhTn9jrFjOUAZZJZYPcrQwbin5qIQNAgrKqFV5Hlg9jgBECj7tjClx8MZqv6Ht2uSUPpQ9qhWxAp+vykItAAZ1ZLaS19QczuanIXHJTV60HW7SCkWTlh5lVVcQUBntTRkPkljLo2qxurH8nUDvQCtgTfgKOPAnPaHxbpBu3S6j24Uoa7peagr3btB35xNvoDATq36rYsFOgmfaZGjp6iji82GmczJ5NKkg1wG5Qp0fVJhKFOzCt46dYE8ZxVBU+yEL1CIncaPViaqNjRpApf8BEbHOz0892IBy5Vpy3Ge6X1tA5eJmE2tUmdxUNwvHYTNbXsBh7rj6X3eN4Tl+C1ziuKvDBh4MmsoS25Ovl2qWu+CEJEWPD5BTPMemIzfAAMdQZHhYGCwPRrdkQW8ZATh+Gw71TDQip2rW8hmR86BxVRRo5TDcdzTXwt8ZX6EyIUSgK79r/aNfEin3Iw44tq/DshiH+eEXcCrTpj0acgN3DRH5uphXJgOZcjgWz3AUVids1rP7O8FPIcE0CGCmiSjpbkuxgMSllUmH/SY+2OJiyCtZia96/ADeu2m8palqO8cvPYTylq/p4YNciHMJLrJJudWNxHyLYylPH0heISCjm8XN7/dW31jXKS110A3AZgggsI
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 10:36:04.9761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3d05ed57-08af-4290-2476-08dc5adc5b4d
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7165
Message-ID-Hash: B3477S4JHU5OP76HJYTEPGZ3UTGAAQCZ
X-Message-ID-Hash: B3477S4JHU5OP76HJYTEPGZ3UTGAAQCZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3477S4JHU5OP76HJYTEPGZ3UTGAAQCZ/>
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

