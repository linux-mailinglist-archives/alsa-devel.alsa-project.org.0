Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3657482BB02
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jan 2024 06:45:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84433F51;
	Fri, 12 Jan 2024 06:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84433F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705038332;
	bh=rDHhB6qqemHPQYr7lGC9CuxSdIwPnl4Ow0RiU+vefsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gAyydh76Okogbte4TgVMFKJrhC1PGiTGkZQARw1txD4f7pY7DX0PHcOZ/Sj3hfHnm
	 OLxBQ8sjUMWMp0j3JIJR6aVPZ26xmtN6GEAk/d9hfHcb6A9MMJdc0lUI4GOXwNsOIW
	 wgdMmNXFL0n9/pN7BuofEnQ/QZhH3pmpHVuS79s0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2A13F805E5; Fri, 12 Jan 2024 06:44:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAE2F805EA;
	Fri, 12 Jan 2024 06:44:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58436F805D4; Fri, 12 Jan 2024 06:44:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1FA4F805BB
	for <alsa-devel@alsa-project.org>; Fri, 12 Jan 2024 06:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1FA4F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=qlxd/xWV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTMc7Jt5mc+zjoYXomMeRonaJWw+IOI+JczlteW75a3GMxfJRLNfoyCMzkCcULeXNhQwgtcbK8Zc1wnJkqRT0FPG04xRTO6bpA5Fn97gI7AZFTUwuvG9n0jaR9PEJP5wRuyKvQmgJuZ1cgAIFPlj1+DrsNXft8K4N5awmGwYTWHYuBu2qFxDN4kSbMktTZOsJ42tlbH32PQro6PH65/4OM3xQlhtl+GvmQoJgd9XUnypjVa5ZnQ7TV93kqkFCYfzg6k5T9+w5KdCEiSS+QYYopBQSuBPER8Tcr7/aivvhQje5Txc8yTNL4G048emP1lFMJJV9NkKZiOMsw/R6Hfb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2phDiBW1nwn+xo/+w2XX94Kn5CwPlLpzfQ/7KwUZq3k=;
 b=gBQ3qi2v+ipdtaV6eD+x2GAho+wv3wt3K1gNUmplsT7p86MkmOkYRhkvhMSYDuZHCfkFUOFg9+ixZUmeqIT2LXkXeg//guwzHMPUJGz71I3cYy1VXEOcMyiAhqKng+fCfpM2bGRSGItX14GQMpGOlw9mzEFr+0r5rQ0tPLOtLuO/dOUxKwnpJF3+2OETybnyMF2iLssGg33Urjn5TrL7gxerY2F7TF5YjpZLwqASrDXVFtyMNkbfD2p/vJpyqRLERRJqc4vv7uBMD48M4fWt5ckC+qlsf2StE/4cbFIza4F6CYbLTYNJZr8BlpMdZf3Bkl28VTai04ovMIy2WiU0Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2phDiBW1nwn+xo/+w2XX94Kn5CwPlLpzfQ/7KwUZq3k=;
 b=qlxd/xWVR2+QhYj2hTHD+3PIz4NObfkFcroOl6sAizn4vTGEvvFdGSPnkaIV4+v+9UfkcNSjD9AZu+Pg2QUTrXv9g5QswH9IavkTua+I7RK5PFKMnOG29vy54C5B62ZE95X/W44NNyybls3RWTQ49ZKu9eeACPf52RRD0OtHBUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Fri, 12 Jan
 2024 05:44:09 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::2a3c:9a90:b09f:293c%3]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 05:44:09 +0000
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
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string
 for i.MX95 platform
Date: Fri, 12 Jan 2024 14:43:31 +0900
Message-ID: <20240112054331.3244104-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240112054331.3244104-1-chancel.liu@nxp.com>
References: <20240112054331.3244104-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4a72da-d995-4b94-1701-08dc13317f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kCB5QuNGUaalwlSTunujKNd5VUECDECn0DV1bsQGfstLgtr1woCqqs4rWhug60yOpkCJls0B4RDIRs8NiR83J7QAycF6y6GmwOYf/oYxdo4UtgIx9Ksb88pDnusI/RSwj2e6k99aWCTaQhyo1Nq8G6dIXiZJqhUCGl2v+CZk1RqXMk+VVwllftV9HHx/+jZu7o3lsmAWU5Pi6Na99GpVP6SDpdAcXznfEVsnkavGTFwKrPuhZ5fklBAk2XaONba8nmM4LZEUxSOaRNs3gE8Hg9387l+OZ1I54Zpnel1fN3dgt052laxKJ1cP6KM611Iv7YEhIpPr8APmjDjenIl7A5vY+UJYYFkZI+ZiTr5Uf4dmZ+B39Bwm0BiZZ2PLBslPVG7+wo2S+d/aWLZJ+lcuIRhGjYC7DCWHOzjW9aIW5BJYGhOX04+4zgkm7NU/oWK8JmpzTo7sRJkRf648m3ZJ3fw5/Sn7GNXZFsX8nd9+ouIRkAONqKHEUsybbvlbz7QOel6DwPV29oVDuQFsX2VZ9mcZMSyeCFFLuzcV4gYS/7W0f4nM7QynDbLaripa8vnyzGSuYCIZiCWElqmk30dMaaw2OkzrmJrRvNXdPwX7JKId+DKHIgWsBRSEdigyk6jPfKe0nRusvT5NXJEvYDxvxQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(366004)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(38100700002)(41300700001)(36756003)(2906002)(86362001)(83380400001)(6486002)(6506007)(66476007)(66946007)(52116002)(66556008)(6666004)(478600001)(7416002)(4744005)(6512007)(5660300002)(4326008)(2616005)(26005)(8936002)(44832011)(1076003)(8676002)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JeZU2kNFhBw07a7kfUKpztIRg4qeavfwWPm/uuJYgMycMqGX1Y1mPCKewGhO?=
 =?us-ascii?Q?kqT9kO9RdM5okGYiFkTEah6pBpdvRXl4bPdP0tEsrEUQYqs4QBjeyjCOjqul?=
 =?us-ascii?Q?rVZXguy+o+EbgxhbmplNtqvXCFiRFm9J+Gdhot54LR2Ca9YzNzwrij5FdJkQ?=
 =?us-ascii?Q?3ZwFN5UzW9tsgo4i1Zd1aD3zEw7tbLLpMnsr+LdmZF5w4QtKmWL4NPo+KBQH?=
 =?us-ascii?Q?C1h621hyZCNQn+F6iBmnMxUf545SgWe0GwTksG2dJ6jF6C4wCqMW1VqWz6Gd?=
 =?us-ascii?Q?v064Qk8dyxwmh3kT7D52zZ/HVy3EYeLjZgT4DDwYvvXHPRAvqKTT1ju0PNtc?=
 =?us-ascii?Q?UsIJZ4GIoJifZW7yZHImC0U4V66SrCqvbR27UgHS79Ij4P7XPAbc7ymX9iSi?=
 =?us-ascii?Q?BRhSyxrCyHChg+AsRQt+GcguOSmQJic3jxXiGBf2f3yz/wPM7Dip8aN1+U+k?=
 =?us-ascii?Q?YNdl155mwpGRnYEgKQ57WXIDPWEvF6TvO9LniIeArxjFqsZT6sZPkbLreB+5?=
 =?us-ascii?Q?2Q3YjLUwUIR66QEEK3AqcHFxQizRw0i/0RzbXvefNmhlc8CdMonsRS+9yxMo?=
 =?us-ascii?Q?LutX2VejHdbgnfp+lftBRTMExjMmuGMSmTpoSq5XLvAZWebiwKZrbhXpZL8U?=
 =?us-ascii?Q?Rv/6T+ufvV0fW2GPU6svb0FqqZwte5N+kpb1eGGTbL7gvf9vJDS68IvcZZan?=
 =?us-ascii?Q?y1CRvTbH3CeSBH/JV2V1wPrefE9ISLCw6I4DUJDOJ26lMm2sJ8OwCRuz3XLs?=
 =?us-ascii?Q?icxdIz1DQU1IBflJyUuaViQCMx49qAzgf20oiei2H1rG52rGgkzPnqy5TkLM?=
 =?us-ascii?Q?/GsF6zK/tXwaZZt5iEyAJ0I/DR+ow7Jz1ssjlxfaxyMnd5xGr1MMEAwGiZoD?=
 =?us-ascii?Q?17fF4Shs34MG95TeY9bQdCgEOsAL0FCz1Ua4kdd8rx2TUfZIZGK0CX2et/ai?=
 =?us-ascii?Q?JmTaD+zi6JVL0Mv794O4z6qPJuipAPg9RNIFtrQkHtiAJm6j6GJ++/1LnP7J?=
 =?us-ascii?Q?/dY6d3hnVbu/ghSSVdYI9TAh1LR3M963J5afG1Kij0AYak8M+jziYq/c3xal?=
 =?us-ascii?Q?zL40qLiETdZn0ta4fnfOj9pXXGYoYBPgnd2liuZ1ydDblhNUmcr2uPj5NbZK?=
 =?us-ascii?Q?Q5Qyy5J8eNXDHclYRJbrNKlETfDJaYaiP07E7Eml1oIa17ka7+q0pqo4AV3y?=
 =?us-ascii?Q?o+6yU59gQ78riKA+rzrcPg3Bkgn9gm3XKzDiwx0F4NGqmtPvedNYEjWwgIbA?=
 =?us-ascii?Q?kXJzM6IvFsMcFTK2RGq+Q4nn3MF/M5z7n8ajmmodH1x7lnom4rTzmeyeVKV4?=
 =?us-ascii?Q?v0Bd9Efg1miCiQubfYpWZgFPuwJa0o99n+bOqWGiioxv8lpJV7UG3crQAfRl?=
 =?us-ascii?Q?LqCdR3uJRxh00Z++7zi3anwqfwJDv9lIy7eNetcXbErHnEaarkVASGGxq1kk?=
 =?us-ascii?Q?gJuqVb54a3AflbheUif5kgJ0M1dLRKWBADUCN09mfTSB8zCCWmWeLHNGdiPY?=
 =?us-ascii?Q?zeTBxXBTm2I2IhtRa6waDlKxMjT7djmqAY2UjDCexQPa3H/EyEupXjDAKhig?=
 =?us-ascii?Q?/WBQDHO/kHXb5LTrdW03Ur+bbBxTEq2k7qLP2HLa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d4a72da-d995-4b94-1701-08dc13317f24
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 05:44:09.0532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7iWExMouCzy0/l9Yz4pFrMpGGxQJ/lbu3iNk1KcBNRwCn/1+UxuAp2+6B7vURqv5vh7dfXfXKOW8dsKh3VqtOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
Message-ID-Hash: Q2T3NYIBN7W3XYNIHNUSJPMXUQACZOSN
X-Message-ID-Hash: Q2T3NYIBN7W3XYNIHNUSJPMXUQACZOSN
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2T3NYIBN7W3XYNIHNUSJPMXUQACZOSN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string "fsl,imx95-micfil" for i.MX95 platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,micfil.yaml      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
index b7e605835639..c1e9803fc113 100644
--- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
@@ -15,10 +15,16 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mm-micfil
-      - fsl,imx8mp-micfil
-      - fsl,imx93-micfil
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx95-micfil
+          - const: fsl,imx93-micfil
+
+      - enum:
+          - fsl,imx8mm-micfil
+          - fsl,imx8mp-micfil
+          - fsl,imx93-micfil
 
   reg:
     maxItems: 1
-- 
2.42.0

