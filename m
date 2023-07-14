Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B035275368B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 11:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B942A4C;
	Fri, 14 Jul 2023 11:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B942A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689327092;
	bh=8UAt24Ff/Hqk1uH+9fia4ZA3p3sQUbY3wjoPO53RI3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ssG6RL3ixbwuayMlXA54B9KBCjG486G832t3PP44eoXY55SUe8x8HHK3ExjY8vxx9
	 RBDroZ2vKz4ZdW2gd9M9B+wTNs/BKXR1Zr9o1Rk5Y7TZ6wkFMCQu26l1slb12Am94w
	 QWuNd5G9eXpPWGVxsamvRm6CHOw08PdrSw6KNoUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFFC3F8027B; Fri, 14 Jul 2023 11:30:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E208F8047D;
	Fri, 14 Jul 2023 11:30:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 379EDF8055B; Fri, 14 Jul 2023 11:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2ACE8F8027B
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 11:30:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACE8F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=YQE4RF8k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9YUFTL9Tz5hks+BBzNlfASKSMH/KTEM0sxkhyHMHkb3J5poGFm3VNepBIb+Bo1UCEruYvn9HntM0dD7H/N2DFxLmVy1JFvGgB24yiDfzY8NXEGdzQjFE4l/vUEvIlHAzlSn5ZBZY3frH37QsFZKvC+tdYXro+Z92Iil6jVVXxnKXdRPKYPdIuFo4ckvGIl72rxcrs7BkW4CtExjuUgHPgKkzuDd5kN94Z48Jl5YB6uUZkAPSwY9nazVh60SkOs1TI0hhvpnqwOaQgu22/EJTUjh4+3rgkVaG1QUIQ+V8OIiPo8uIs9Qkf8vZMqg4+TjHFg6/qOEf/FIkMtbV2NIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZ87tA6/Ep+q9H+YAMrgp+VkBc+axD4WcUZO3DqFYYI=;
 b=C88eny6I+rHYZHRO3e9faZk/S6lzWKkDU3nzuRNquBFTtpcYy8HiGQlX7TvynIxQAjXRuKK9BJIg1fWVMDozr6zfNCZ3yDIxcEuJJluUxfWBgISGSYuS/fdS9QyRX+oFHMclDavUFmAqMXQKKDrWFCeJz3RQ2QtIMilF6JEM3PG7mlTSaIrV9oCb1I87EH/moM8E/PE2qUEU5g7FfphCharvZs3rGkrLtQJMuvJl2bOQ3GBN2q6Ru3+hSqjyaBxsDPBE29oQFqbJbphlZkC+SUvOK33JGk9str8cZ5IirqnvZF9v0LOPPA24o/pfo1DSN2hOLMIz2qNH8eWLgaS72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZ87tA6/Ep+q9H+YAMrgp+VkBc+axD4WcUZO3DqFYYI=;
 b=YQE4RF8kx5zMJDxmSQnu1Z+Vm84SSxqOtSmz/5q9ck8w5VNZPM7zr8jpQO5wEYOOiVRsttLD8iGYElQAkk9u0A7A2KgNuaB3Mj309OcEUj3yT6ifn4nGoYI1H5zKQPKhdGXA0rT6IZc4IGkJaZLWZ/G3S3jImziHHbkPeCWbQ3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 09:30:13 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::7552:a10c:7f4b:96b7%6]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 09:30:12 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 2/2] ASoC: fsl_rpmsg: Add support for i.MX93 platform
Date: Fri, 14 Jul 2023 17:29:13 +0800
Message-Id: <20230714092913.1591195-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230714092913.1591195-1-chancel.liu@nxp.com>
References: <20230714092913.1591195-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b1982a-33cd-48e1-13cf-08db844cec8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lrDk2oKhhIUpnAYlJ+VhcYmX8QdcRfwNeDmPGbtKw9dZmiKEXy1H04vYK4G7zVzWCSmtzJRju7+2VF7cxv+wtR15gveSobuqTrr3slLr9EVSiw/Fy39VSp+DBqleQWLxL8CavU0tu4Tvn9eXd4sDAQF8Ou/xkUko81mB5/kLqlhRK0OxCPtb+X1gBj4CFz2VHXkShGL5SOkjPdcO9fExHeVXmkx0Nh89aQTQr4Xiv1/Hv0B65gp/CMCpNTZJ5DQHt8qvNrljKyDB1Cc4EXMrek5vFePJ9JAjFwR0b0LGH3mJT55r9UvmPLdFFHd9mCs/QouFBp/LGEmyAimb9bZZjqJU6n16M0gvD2G7f6hCtMQRBvThJ9b4NhoCO/MU0wJudRw5hRRwgHdZOE2ylC2Nm5L5bvHUFNWALjCtcaBJlYwaEzMs65FrES+EpOxMLLsvwcYQnwZhjdm7w8p+RY1l5+bL1qKjvtVANSzSVlR7l5QoHRikN+MCAOPHSI1bbwsk+7ZlsxrQhMgpG2goaYXhnN2gBvbwOoTxBM+cm8Fiyxma/RcsKKbrxav3FELAN8gP2xU5nqzCHNNWaJ0cmZZiWSxSNbClHfjyS6WwmC3nH+v05fOq4GxFSOzgVWUsY6TpedoevQTBpkd6s4oIPCMfSw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(2906002)(478600001)(38100700002)(921005)(38350700002)(6512007)(186003)(2616005)(26005)(1076003)(6506007)(86362001)(5660300002)(8936002)(44832011)(7416002)(36756003)(52116002)(41300700001)(66556008)(66946007)(4326008)(66476007)(8676002)(6486002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yZXyQNgjdtLDWrLOA/eHq8UWULbL6zmaujj04WfRkocwvoGJpI737pqSoRaV?=
 =?us-ascii?Q?FP5WY4jM+zYm09HCVYPMbXpfGww0gdNvW5/FHm9PaU7Pux63f4ZEdXlzMKHg?=
 =?us-ascii?Q?Xq7fe0EUNrAfbehBGrTRKpCY6gKx2xsz5mre2F/xnG70aJpLAN7VsMa3gxdK?=
 =?us-ascii?Q?vzCNNZ4r9PMC8ymB5uy0je5R2QQFo7gHOTY4XO4VJnM6qZOTImwA7VI5WHLv?=
 =?us-ascii?Q?hMIOaXEGBfjnsnpCiNMIJ6hV46rSkoEyvHjP2uKVPmtaY80jnww6+Si2Buoo?=
 =?us-ascii?Q?CF+/YR/7ekz1SpNoV9QHm3asJklMCAJUpGQBUQNjgAaYDLDh/cdcT0cJvSSW?=
 =?us-ascii?Q?eVO7puh6yxOagbP/ltw4i64yA1aFs5wzA98RK+DWoVNV9IApTfUDBm8x/XKM?=
 =?us-ascii?Q?bUtZSujopsRl99xnmxr4Rvx6DIGm8BOyDJDTzFpuy5KgXGTo5jkCkBMI3Wzh?=
 =?us-ascii?Q?ha5xEpyFxHNiNusGj9rshofeBjU21RBGed136+VFh8mLc+4CVDAXuZsYXe9h?=
 =?us-ascii?Q?pLUsrlTT6Wxjhz4GdYUnAxLpECOCtmyj4Frg8eImZ6+S2EQXqX6WV7K4XeL4?=
 =?us-ascii?Q?lqIa1ksIE3QYxwgw6irJJSxG+3Lg1rts7xJXyKOlSk3/tcOtjnnhk8Ofptk3?=
 =?us-ascii?Q?03D0o3zIIxR99BgphxOGzk4+5DgnPOZ1tQSmOOWDN1Zrv+8rBMcoDWr5rOR+?=
 =?us-ascii?Q?120mzop9zcAQ7TooF6/ogBdjc+O/2LexYUc0RVLzfXdffLHZIrBaNkDWrr6F?=
 =?us-ascii?Q?7T1ToBIFe8KnMAWXWUhhLrRUg7kDjvMZMi+hzBZlgpVjr3kGR22dJ4wQy1IH?=
 =?us-ascii?Q?Ox/muAYpTyDn4NiaF3IyvOKNXrzu9l+YZ5Nou2BjXurPRFw/fu6AeibFhYvl?=
 =?us-ascii?Q?/ktXuuJBQLbS4/tMsjz2+3Ssnjfd5yP6PZC8RCdsg01Ltz63FlSCioAg+YJk?=
 =?us-ascii?Q?3V9yBs2hRwaytOVuK7D4bcNjUQRaTKpzQGF+Q9HuW9VvxoSyyYNXEQGEudrM?=
 =?us-ascii?Q?uuU3BIkJv40WckSAEO2MuldqM5/8bKTXkxdVKQZpUm83pv4zlhiE+WH0WqUt?=
 =?us-ascii?Q?wkTiwZHTMgxQxMvO5vxgBYe2oLXUNbNwrZU+WAU2R16paHyE4EML3O3U/0Kl?=
 =?us-ascii?Q?bDMAArSFNdwpAHNJVWsnr25W33X2/8oKCrXaWN6rhGZOT4KDdgWZwgi1YMW8?=
 =?us-ascii?Q?rlmkiHTKSySPcitOAXKm2LUIW9ts7LfG0rQUSTJmNtq8KeAGNPnHuGwIOZ6g?=
 =?us-ascii?Q?zBYTiI6SxeAQXiG8nFNZTAkOyc2gCrJFIHcLZskfFY2oKqUn/YzvYQ3USVbK?=
 =?us-ascii?Q?+M0wNmGnS5ANyuSz+utp33GeQE3Wv9Apl+ZYtc1KoRu4rTgT7LPZGv+En6Xe?=
 =?us-ascii?Q?NAh/pVsSMEbK1fd65mRhiJ/DGRS5YBAnxL5IDizWgdVhD5mm4YlqcUvVSi3W?=
 =?us-ascii?Q?m1wFJyz1jcIM+RJhKaXcbjrXlxy4pJfkh4D6d7ljYxuHJVPJnbNzSk4Zu8UU?=
 =?us-ascii?Q?5DBz9x+BA0z0Z1Mu+e6wLFDVBgXQey2Wpg/JKNJbpD+e6wOicqQMoU0LTl37?=
 =?us-ascii?Q?t9ZopSdPi3qpPobhixRk/fqo6VBASqzqM1xcUXyh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 85b1982a-33cd-48e1-13cf-08db844cec8a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2023 09:30:12.6962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ADOcABPvPX/3uu0DBxiXsEa1hbKOwMkguY0hb1N2AR3L1s+HCxY4VvfeIEHgMdlY6kOtSAe8VJ8swM9nKOB72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9578
Message-ID-Hash: HSA2UEYEXB7LM3CX73FXVP6KIOL4OUHQ
X-Message-ID-Hash: HSA2UEYEXB7LM3CX73FXVP6KIOL4OUHQ
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSA2UEYEXB7LM3CX73FXVP6KIOL4OUHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string and specific soc data to support rpmsg sound card
on i.MX93 platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 15b48b5ea856..abe19a8a7aa7 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -170,12 +170,20 @@ static const struct fsl_rpmsg_soc_data imx8mp_data = {
 		   SNDRV_PCM_FMTBIT_S32_LE,
 };
 
+static const struct fsl_rpmsg_soc_data imx93_data = {
+	.rates = SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 |
+		 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+};
+
 static const struct of_device_id fsl_rpmsg_ids[] = {
 	{ .compatible = "fsl,imx7ulp-rpmsg-audio", .data = &imx7ulp_data},
 	{ .compatible = "fsl,imx8mm-rpmsg-audio", .data = &imx8mm_data},
 	{ .compatible = "fsl,imx8mn-rpmsg-audio", .data = &imx8mn_data},
 	{ .compatible = "fsl,imx8mp-rpmsg-audio", .data = &imx8mp_data},
 	{ .compatible = "fsl,imx8ulp-rpmsg-audio", .data = &imx7ulp_data},
+	{ .compatible = "fsl,imx93-rpmsg-audio", .data = &imx93_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
-- 
2.25.1

