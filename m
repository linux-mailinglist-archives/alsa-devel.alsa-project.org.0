Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D155717916
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 09:55:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B3E206;
	Wed, 31 May 2023 09:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B3E206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685519722;
	bh=5zicIIzM9MlGT6mHk+tsechuyWaWf6jQjXt5N64CIMs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fMGTAXTLPmKyyq1Cr/wNF1nSeeeS+ROWo9KHtV4LNO1xlZccPuoVshpDGxls6P+fR
	 OiLc0FRtU90U/W5/XNWqvK61IgZ5WogPpuGKuS8X6y3yQbhPLxjSC6wjvXKbNyO0Wt
	 28XU9MWaRQGhc4UNVsCnke6f5cVg+cq9vPPmdN0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 135EDF80544; Wed, 31 May 2023 09:54:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C054BF8026A;
	Wed, 31 May 2023 09:54:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B243F8042F; Wed, 31 May 2023 09:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AC3CF80086
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 09:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC3CF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=QrFgdDR5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8p/X2NLq6tpOVi5psZRuVrZrbYNsb96+l6Eg/RsAJz7nM/RKsfaylxjkEb98+lbRk9FR7G3kF48Ix5SSa6+G5daVOXnusOLrWhxHgEsxDX8osX6cIPeUIJ8l3MWqsBzdzprpAp0O5aOsWJZSFyoEr/B59EhrGLR99pWygU10wSnRcmUMwZALdRDnKUvQ0gIgeGzvStwlUcAn7FKBTk9UdyPN6MrbHJGV25ZZENWKvfAYMLf8bmCZMnziA2lKEkllGkINkRtRSO9yjQX4an88XVIrtJkRlxEqOMz9nTA+RFesJrkCvYWTDqLhNJQsFciVQJ8avDECAEWracRXIURtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JYYxRHrB+nOD4qnLlRHqKUAzyeWpd8i+UiOD6hnxro=;
 b=lR8xsnfbLTOf5PoxQoXC89qmpHZuIwUp+fb/eFH0j1gnMWCknsVwC6ONW4qH8UyS6zbmtfHrtEDSS3hUIFChM6GD4C26KNL2nv+GhPjRQTYngnQnSKx1FPim17gjEX5TkR+yVI4guqtRlLxZAl8VET7EwcLVQ6PLvY/zEEB833mpn2smHpca4RHC6aJsmuXCKlRvVCR24el/7c3RL4z2zdeLiWItyvzUKDh8399yHe9+XEBP/Tjv2E5koRBvRw7poVVoEljjaKvreA5GUx6zneQOp4i4EcHtG6CTfxEIheM0ru/ipItSXpNNU7I006cWcob2f4b6ZLQ3uje1jgBbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 211.75.126.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JYYxRHrB+nOD4qnLlRHqKUAzyeWpd8i+UiOD6hnxro=;
 b=QrFgdDR5Yb1GfqbTrfqsvJtf+eSPx2zNOFtOnFVIDBT+Isiy9BMt+zfACU2mHHf8IzbWVsZ+Uma8Z3+p+rYqAmWfbsAlso9zpWIFgHzNKu8MWfqYJgDI8SgT580SzXHdEsk2fpIM8UyGDDvHmubNCBZHNYzepdx2CQI6zE/rRmY=
Received: from TY2PR06CA0039.apcprd06.prod.outlook.com (2603:1096:404:2e::27)
 by TYUPR03MB7112.apcprd03.prod.outlook.com (2603:1096:400:35f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 07:54:09 +0000
Received: from TYZAPC01FT003.eop-APC01.prod.protection.outlook.com
 (2603:1096:404:2e:cafe::d9) by TY2PR06CA0039.outlook.office365.com
 (2603:1096:404:2e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22 via Frontend
 Transport; Wed, 31 May 2023 07:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 211.75.126.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 211.75.126.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.75.126.7; helo=NTHCCAS01.nuvoton.com; pr=C
Received: from NTHCCAS01.nuvoton.com (211.75.126.7) by
 TYZAPC01FT003.mail.protection.outlook.com (10.118.152.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.22 via Frontend Transport; Wed, 31 May 2023 07:54:09 +0000
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 31 May
 2023 15:54:08 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Wed, 31 May 2023 15:54:08 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <WTLI@nuvoton.com>,
	<SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH] ASoC: nau8825: Add the management of headset detection for
 power saving
Date: Wed, 31 May 2023 15:53:35 +0800
Message-ID: <20230531075334.168637-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZAPC01FT003:EE_|TYUPR03MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: d101b3b5-e97f-4cbb-65e8-08db61ac3753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6bSQjMDW2l1jauOhBpEDhnvV0D+zXq/2d5tbqPKFx2A+r3Lk3/92o/24G+Eob/hfb6g/5XCMF66Y88hMjnB1ygnX+VAjshZ8/Jt+IWNalYE6AtpbjgiXT7KKOREOvj4vN0T56JpNReP1P2+ZGKNCNFkC1UwhoSaeee9MRz8Pi58Lrqcm26+Xwfnpi9TRfsUYWyp9IrrRsmnE19P5uG5M/ZFU8VZgyHjVW+JIvvjk4rxZXrpgobjH3PRjs2MWBWw7eUxAmNBLyPXwdJfF61MpB1tN6GUffr98H9HKm7loLI7Z0Yww821YVYUKTxDuYrVQNCjIINvZTzdHAt2rxwBTzkjQqHCL3j8/qEYraMJGSjbbtiZk1lZwMNA59ORVQJJyB10qpd7KxsDPGRiPy7eyyggJp3r1KaEEJOJXx8AP487Up93Pr2aaJSKWE0ixR+gSWwiw3v1IzhpJ5DYm/IT6jxIKQ96kh4557xIOEogizygHJVCgBkhAGiEAczlN58p7AWNi6uUK7DkAjF/UUkbstJtxvycJUsV0aVULNylDIG1mO56+N7pgDK1HUqygf2fKx0o/JcNlbRNLgPX1TsjOsjKPQtXx1bOUuyT4Seb51PCCPT/eTh3Nxp7dauheCg4wLm0V5/IAjegkrZFoa+Hwlv5mz/0v4ZGh69s56NsAM3B8yRpZsMVKEwm8DQeTZCvjx9ZTt2rgkOfPutU0Al3q+LzKi2HcBN1e69qF68rP2OKjcpbJVBPVTEDOGHEOOZ9
X-Forefront-Antispam-Report: 
	CIP:211.75.126.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS01.nuvoton.com;PTR:211-75-126-7.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(2906002)(186003)(2616005)(54906003)(26005)(336012)(426003)(1076003)(478600001)(47076005)(83380400001)(86362001)(40460700003)(36860700001)(8936002)(81166007)(82740400003)(356005)(8676002)(41300700001)(40480700001)(316002)(5660300002)(70586007)(70206006)(6666004)(33656002)(82310400005)(36756003)(107886003)(6916009)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 07:54:09.2757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d101b3b5-e97f-4cbb-65e8-08db61ac3753
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[211.75.126.7];Helo=[NTHCCAS01.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	TYZAPC01FT003.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7112
Message-ID-Hash: GVHUIUY2XMZPGUIPF6P2XUR2QZOQYCKW
X-Message-ID-Hash: GVHUIUY2XMZPGUIPF6P2XUR2QZOQYCKW
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVHUIUY2XMZPGUIPF6P2XUR2QZOQYCKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch is to manage HSD feature for power saving. The detail is to
disable HSD feature after the headset detection is done. When the jack
is inserted, the HSD feature will be enabled again.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index cc3e18207c42..f6dd84b32e0b 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1704,6 +1704,10 @@ static void nau8825_setup_auto_irq(struct nau8825 *nau8825)
 {
 	struct regmap *regmap = nau8825->regmap;
 
+	/* Enable HSD function */
+	regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL,
+			   NAU8825_HSD_AUTO_MODE, NAU8825_HSD_AUTO_MODE);
+
 	/* Enable headset jack type detection complete interruption and
 	 * jack ejection interruption.
 	 */
@@ -1955,6 +1959,9 @@ static int nau8825_jack_insert(struct nau8825 *nau8825)
 	regmap_update_bits(regmap, NAU8825_REG_CLK_DIVIDER,
 			   NAU8825_CLK_MCLK_SRC_MASK, 0xf);
 
+	/* Disable HSD function */
+	regmap_update_bits(regmap, NAU8825_REG_HSD_CTRL, NAU8825_HSD_AUTO_MODE, 0);
+
 	/* Leaving HPOL/R grounded after jack insert by default. They will be
 	 * ungrounded as part of the widget power up sequence at the beginning
 	 * of playback to reduce pop.
-- 
2.25.1

