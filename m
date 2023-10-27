Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 110727D9161
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 10:25:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8DBA4A;
	Fri, 27 Oct 2023 10:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8DBA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698395139;
	bh=Wo99pV60CA3z8UX1BUbpMqczKLogPxmYz2rDM9iCWuQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nYusKGQSiGa68SW5K7DeODdFgkYocw0lzfy/45l6Ffm7Gq/MK+wGwrbMTpbfL/1QR
	 p9ductgona3fC53BOerD07/RL4ZXc1ur2yMwzfWmcaSel5AVA6/y9rsM+f7k6l7YhR
	 vQ6efKjHhp+ot6H7GvV3aY87xz6AMRD8Ah7vJKMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4E2EF8028D; Fri, 27 Oct 2023 10:24:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C48FF80165;
	Fri, 27 Oct 2023 10:24:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 855F4F8020D; Fri, 27 Oct 2023 10:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01hn2229.outbound.protection.outlook.com [52.100.0.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E64FF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 10:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E64FF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=BwXbQ6TF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQKoor+KXVzbXC05FheiJRCwyz2In90f182d8cfCZsMjwvafrwga3EsBrBz8OFcqx1qezr5OcJUqVv/YnMZzQe9tlypjvTnhwR4NNBLX112bYLidhOFrY+2FuiqXOnD/YTXvFrMEO0vsOcuLPGuKkPTD+6vERAd4oFeip7/Q4BOy5wtzFWwVucDzUIbnguTV3KCmtCmeYdMRvK+LgzDj9DSgPN2mKxGkmtsyCZFsPpS0MPH4vUKeJ+z1MUgSy/3LHSba2Vjk+i5fKwfcHk878gWfLCBOXQ05J+G46taadxi1LgtQE+TIPyqsnwZHnmTkhlUeZ1QG5t9sRUEfNWkeqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=787hQNn8Zrl4V34fsewfvHXZwHGyFnO7F/lZz3vYpDA=;
 b=debyMk+IJD5qR+emSDhr5aaqlapozZ+6ptlx1iNx3NHEiaNbhCxb/BYyvXi6AocZepkRmUpUmhMJajIMMGnFfjciuYSCgHYVhl2tZV/GAi49r2cwLIqhzn/SkMxMW9A3qaKnFVXzway9CM2U1QDFobujQ6SNSWqQpF91C8yYphe2Z4S4CQ4ZiXD5Gv1WHJSKoCcI3zdP5/h3ZGPTFVrCozQp5kFhpqTM6YIxIQs5JKawO4aIxKRY3pen8IWcQTaD2hAlR7X5GldRHj0RhqSonJcpoJ9S/2JI3LFdAAzqcd01WGTiviBbDkI0cWIur2z5+38j2DvO1JU/qBLZCuBpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nuvoton.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=787hQNn8Zrl4V34fsewfvHXZwHGyFnO7F/lZz3vYpDA=;
 b=BwXbQ6TFt7CUvFgkWvpMpzxI/RujWw75rRljfgJaW6p3v3iqI9rEOVlaEY0mTk2ot9ogeFR2x6Y1MReW5J4h6udMF/nYl2zYdGlUKYQw5aRb7rX87BtTb3iLv7RJGi5gfZBNTf2a0fpMY2oMDTUGygj32Er27Z/Z0tc0Gg1LDNA=
Received: from SI2PR06CA0015.apcprd06.prod.outlook.com (2603:1096:4:186::7) by
 KL1PR03MB7257.apcprd03.prod.outlook.com (2603:1096:820:bd::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.23; Fri, 27 Oct 2023 08:22:00 +0000
Received: from HK2PEPF00006FAE.apcprd02.prod.outlook.com
 (2603:1096:4:186:cafe::bf) by SI2PR06CA0015.outlook.office365.com
 (2603:1096:4:186::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24 via Frontend
 Transport; Fri, 27 Oct 2023 08:21:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 HK2PEPF00006FAE.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6838.22 via Frontend Transport; Fri, 27 Oct 2023 08:21:59 +0000
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Fri, 27
 Oct 2023 16:21:58 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Fri, 27 Oct
 2023 16:21:57 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 27 Oct 2023 16:21:57 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<robh+dt@kernel.org>, <conor+dt@kernel.org>, <YHCHuang@nuvoton.com>,
	<KCHSU0@nuvoton.com>, <CTLIN0@nuvoton.com>, <SJLIN0@nuvoton.com>,
	<scott6986@gmail.com>, <supercraig0719@gmail.com>, <dardar923@gmail.com>,
	<wtli@nuvoton.com>
Subject: [PATCH v2 2/2] ASoC: nau8821: Add slew rate controls.
Date: Fri, 27 Oct 2023 16:21:44 +0800
Message-ID: <20231027082144.639369-3-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027082144.639369-1-wtli@nuvoton.com>
References: <20231027082144.639369-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FAE:EE_|KL1PR03MB7257:EE_
X-MS-Office365-Filtering-Correlation-Id: 29522e1f-2fcc-4659-3398-08dbd6c5ca55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	El/zRx0V164DJIhuD6XyD/Y+/KeA1eXPZ1oBohk+tzMdHpqVcj9hMLa96mRxiSOE5swvvZQq2DQOI3TFgn7oMSONeMCmC96XTgfTI/yOtnYLweJI9B9oR7jsigkD/Y33hei5x1AueOnEoqvmGQGGXriDEK011qmxnMzAY647ahdh8DC5aH7mE0Gkox2bKaRnb989JsJjKyn8a/jSLYK+1+txBxBYtCybSAWYDbMnHRw4IULLYozYOolAANc3Hg51WqGfzMVsIxLPGwhcQ8dhX66SZYtXNBxF3EbzECVt9wxdSelcGVKxvWBWMtpB1yW521y4vnFVVAsHaB4EjxS0TGo85AEZJEvCVDlbUNXO2eroPrhCHrd0MOm5Jk7RJlmIBMvSKvfvrf5QvcOhViIFl27qmtxTCEYI0AqowPM2+dhScbf/tFahs8PJEd8vahGZ3j4jjc8NnEiHTe3VZf/5qGRRPq1hZ/w/nJSAwWQRZxHmP2iRICwPdpUt6RcRWCU4/RhQQJpqMQzj274a7f7YpJm1LlI3liwJiVegUf3wdr2AlxoysIYzZAM0nRjWmCPxGT0wQz9XF+QmUBQzEuviSoi8SSCbFeOcb658QZGYtN7dqPgxsjbOFx4RpGo/bZezABInyqDOjk6zQ5BWC6mPU5S+nl5Sf4ovq5ZfvIloxwU6ZeSuYoqqm96rZdeSBfTFXEadDfkA+T6OzT+NzFJB0hd6RkkHqcEakysp8FVdvcdJVNI+7Vi9/5vdp2WNw0mZNJEVeLzooh8m8Q24KwdS1JGyKzOxZg7rfiMKWB0RrnkQQejfOGp6nL9ahsTzhzKbckoTl4xCdbEI40jlHD+qib+iGVm9lCRsnJepH9R8wkM=
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(5400799018)(186009)(64100799003)(451199024)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(426003)(40480700001)(478600001)(336012)(83380400001)(6666004)(86362001)(40460700003)(8936002)(8676002)(5660300002)(7416002)(4326008)(107886003)(2616005)(26005)(1076003)(41300700001)(36756003)(316002)(6916009)(2906002)(82740400003)(34020700004)(54906003)(356005)(36860700001)(70586007)(47076005)(81166007)(70206006)(12100799048);DIR:OUT;SFP:1501;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 08:21:59.4071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 29522e1f-2fcc-4659-3398-08dbd6c5ca55
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FAE.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7257
Message-ID-Hash: B4AUPJAUD752GAG34YE7TXMQ7MAA7OL2
X-Message-ID-Hash: B4AUPJAUD752GAG34YE7TXMQ7MAA7OL2
X-MailFrom: WTLI@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4AUPJAUD752GAG34YE7TXMQ7MAA7OL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The patch supports DMIC clock slew rate selection.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8821.c | 7 +++++++
 sound/soc/codecs/nau8821.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 6e1b6b26298a..d8190e8a431f 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1738,6 +1738,10 @@ static int nau8821_read_device_properties(struct device *dev,
 		&nau8821->dmic_clk_threshold);
 	if (ret)
 		nau8821->dmic_clk_threshold = 3072000;
+	ret = device_property_read_u32(dev, "nuvoton,dmic-slew-rate-selection",
+		&nau8821->dmic_slew_rate_sel);
+	if (ret)
+		nau8821->dmic_slew_rate_sel = 0;
 
 	return 0;
 }
@@ -1797,6 +1801,9 @@ static void nau8821_init_regs(struct nau8821 *nau8821)
 		NAU8821_ADC_SYNC_DOWN_MASK, NAU8821_ADC_SYNC_DOWN_64);
 	regmap_update_bits(regmap, NAU8821_R2C_DAC_CTRL1,
 		NAU8821_DAC_OVERSAMPLE_MASK, NAU8821_DAC_OVERSAMPLE_64);
+	regmap_update_bits(regmap, NAU8821_R13_DMIC_CTRL,
+		NAU8821_DMIC_SLEW_MASK, nau8821->dmic_slew_rate_sel <<
+		NAU8821_DMIC_SLEW_SFT);
 	if (nau8821->left_input_single_end) {
 		regmap_update_bits(regmap, NAU8821_R6B_PGA_MUTE,
 			NAU8821_MUTE_MICNL_EN, NAU8821_MUTE_MICNL_EN);
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index 00a888ed07ce..480f605d5d50 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -236,6 +236,8 @@
 #define NAU8821_DMIC_SRC_MASK	(0x3 << NAU8821_DMIC_SRC_SFT)
 #define NAU8821_CLK_DMIC_SRC	(0x2 << NAU8821_DMIC_SRC_SFT)
 #define NAU8821_DMIC_EN_SFT	0
+#define NAU8821_DMIC_SLEW_SFT  8
+#define NAU8821_DMIC_SLEW_MASK (0x7 << NAU8821_DMIC_SLEW_SFT)
 
 /* GPIO12_CTRL (0x1a) */
 #define NAU8821_JKDET_PULL_UP	(0x1 << 11) /* 0 - pull down, 1 - pull up */
@@ -573,6 +575,7 @@ struct nau8821 {
 	int jack_eject_debounce;
 	int fs;
 	int dmic_clk_threshold;
+	int dmic_slew_rate_sel;
 	int key_enable;
 };
 
-- 
2.25.1

