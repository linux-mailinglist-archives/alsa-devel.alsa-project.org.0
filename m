Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E676AAE9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 10:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56523828;
	Tue,  1 Aug 2023 10:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56523828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690878392;
	bh=ENPQ4mS3V77bxcj3DunRE4xUBl23EEkdk40dpDGvSkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDCQyL7ZfOzwyjZsj/Nd9iSCc2xgpDhHMdftqy8QqN1IOU1H6k1DmvfzvlndELZKT
	 I5cQZMr06lAghY1Ud9DS8fqFQwa/5pcWgVRjuxVO7E40+9mZ04yjTki6UsuH3brWPk
	 XDxJWkggXMJ+TSW5loKNqJv3Vuwqb6u7Ci1lTOLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F393F80552; Tue,  1 Aug 2023 10:25:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F6DEF80549;
	Tue,  1 Aug 2023 10:25:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66C54F8025A; Tue,  1 Aug 2023 10:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_PERMERROR shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC0A5F8016D
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 10:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC0A5F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=K9D5smqA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeE/xvSyCY+ww1rAFiZvcs4pqwP7vbBDYFlW7ulVNRwV3i/zbyk8nxLiCk5sImPgSmTcTfekCZ1wZcC8hr3x2aGKMDFtbCrZZQH4xAqY4vGknsC6g5YaxGm0o4g27T8KaFtmmjx1bUqqMoQ7i+P/mGrMs1WAqvySsqNNpFKPeD4QaI2kTvkT+hYn1qGMvroJnQkIj5vi+uc9/xY+xH90waNH5dPF1b4qmC4wAKya12arwdX5x4Ep2VIEC7wCl2/05PVNEqfZ7KvbnkT5iEKHg8lMUNPC6w/UW1mC24pvpvGPPck14isCtE6EEP8s3/q7lbkTU0G+YsxtcFwYiryotw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZfY6M3KKq4bJe1fFhlM30Nswp5pBszMPEpheMHnePAg=;
 b=CP95zGjrezCw+w/V4lCRmhupNdx6n+rWde7fVcsGs4HbATfxjFgGdNpeLx+gNy4KlXAnlfJ+gHqXGhBNOLfZebq93rOrtg5xSKbMuujJmhViaOHmDSCxyZ7Fs7M5yTm00l8UJubZydwT8YMU1EGpmeGFFBrPqqmZvzLT+8nfRL2AVNV8D09h9jVmHivH3yODhJnIuKF7ZARIhu3yuAxQTOVFj2kq2sdMB9jXk9n1GGaNO/Mz8OVyrKGvmjIjF7AkGmq3zHil8ViMbPgw9I782W7F6RSBJmO+K6PsLnbLhrES8KFQae3LXJUb/JJqTZg27EdvW+fIeMjON9PAiYrQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfY6M3KKq4bJe1fFhlM30Nswp5pBszMPEpheMHnePAg=;
 b=K9D5smqAqiOqO6gaX3DISllbKtG/Qh68xIauDKcdN5CE4kKpY6I+YNKxD+E1WTixcbi0RlxXj0oWyYrn+eQ0Pz+69POvRZMaicSzL1xiSdJuge8Yfs5SApJG4RldSfBQHGgJ6qKsHflfieCLwD8vwAKn2xh0qDx1TMWDBQ3e0mI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by PA4PR04MB7917.eurprd04.prod.outlook.com (2603:10a6:102:cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 1 Aug
 2023 08:24:52 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::d4e4:973a:b085:de93]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::d4e4:973a:b085:de93%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:24:52 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org
Cc: kuninori.morimoto.gx@renesas.com,
	spujar@nvidia.com,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	daniel.baluta@gmail.com
Subject: [PATCH 2/2] ASoC: dt-bindings: simple-card: Document new DAI flags
 playback-only/capture-only
Date: Tue,  1 Aug 2023 11:24:33 +0300
Message-Id: <20230801082433.548206-3-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
References: <20230801082433.548206-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0057.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::21) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|PA4PR04MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 004b4a81-49db-43f7-d94b-08db9268c746
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+vVSL0HagpcgIPV4cdNBKpXQFeQBmshDiQiuheMsWelG8JB5Zd1EKiYLbhJCYKCODUSNCuQWMqmjEvZ/tYgdN5nDK4LuquCWrss0x9tJLlpbDQbm7r2aqmzb3hWr7dAkJ7pa/yg8TxDenp+XHz7glK2p7jkBBy9tpTT1Ul2zdhCo9iXxEg1tx4CTVPhS/cHMH8pfDPjaeY3QDvIeW+Ntmjk8MDxoO6RCVWWo9G5G9dYXKVIUPZuLgCeA0AioXNPvw/BkIegPSVOghijKxPqqRnkre8MTuRo95jZtO/wLMuQQcfi0g4tzkTUQ8jlTujq79pKHcfyBxflaqPdzyRvGZp97gY/gykGUt0nw8/EU0IfxPqoF9lQZ6PFFe0wh+HUltLA5oVEu3TyGrcUdy8w5+eMCJvr2k49QM7OtluJi8PImD/TZHm+GIPgiHp+GaaEnkl2PeaiXsyG+9898+SJ/H6hD0aXT0fCDNPJzkU5hd0WimGYzsZFW1j2fqHCy9/8+IHilY/85GLQ+M6CULNJ85VZ90Li3X1aYId/WNlTBwmFDfhO9E2BzALVSBSCEy+vpEB63xuhV/z1QVXP4naH/ydDLU/9Byb0X42fRYoc65FZwX/RTYI+h3qaEsZ5evHHu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(66556008)(66476007)(66946007)(52116002)(2616005)(83380400001)(6512007)(6486002)(86362001)(38350700002)(38100700002)(26005)(478600001)(1076003)(186003)(6666004)(6506007)(316002)(41300700001)(2906002)(8936002)(5660300002)(7416002)(4326008)(44832011)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q+BnAXaQD4a1OUvx4MswgNJ9hHwAEmOv+lVKkeORBqmEbqGb1VH3c+U/nTEw?=
 =?us-ascii?Q?/idjRBDVP15J+uCWIrMcU49PrhZClsk54am7244Th3MPnwnq82oTy+u6muNb?=
 =?us-ascii?Q?EZOP7iH7g7pcVTmuWYPiY15Qh7HMvvxJC+0seVT8zyOIx3pAXlNV8CqDMA+z?=
 =?us-ascii?Q?Kg750nYyapk6e6HZfp6cjCaW4I2FCkUorzxZXTKLR1TYdc4lPGWCb91DdA2t?=
 =?us-ascii?Q?y8f1qwGqQUti8oDv87wzuXYGFaAh74WilpgzS7KviWDfYBCLExnlgz1Ux5zr?=
 =?us-ascii?Q?5Qhqdm6LVV5ybJ/hjt3OEi3VBlcnmNZfyzqDYvRh447MZWLCjK/DnTrAGNY4?=
 =?us-ascii?Q?E0xkUPX6s9MRmI8C/SDgjPw6GFrR46+abg5FtzztXNSbLBytQ9J2OL3lRedz?=
 =?us-ascii?Q?abqOLwrQKUZL1qQFX2hvPM+XXEj1pMIRjR7CCuSyPfXml892PfzU5qz94Msl?=
 =?us-ascii?Q?Jzgb9uJftSFwMuTXSZKo8MTnH6CyeJ/ec0N2vcaZA1vE099qCaZibrW05km1?=
 =?us-ascii?Q?6/yb4FL00LLSR7trHfZ01fz+/M+KC+PO8l7mLOOXi166vzKx7TNk/KW5oJ/7?=
 =?us-ascii?Q?5rYFI2mEv5ZpGW4i3FIQsW25jAj2bRR9rhS2IxfRSVb3BJvLsiW1ogm7fPQC?=
 =?us-ascii?Q?XnU1EIeU1XDQaqTvvYHnmYSJsdSr/MzRsbkj2DV0sNg+ZVP0OD0wpK6pvQ1U?=
 =?us-ascii?Q?CR5Ebe9rlW1A+ZynTZJbrUkYCYfw5By3iQ2CeyfbtWeHqfG1hkmVdDSDUBQj?=
 =?us-ascii?Q?+IP011r9gjQFmqAQN2O19KHtuGlomyT46HvfD1n0j7st6UiH5VtsMrpt/Lqq?=
 =?us-ascii?Q?7l6oYm7cKxwReA1vkGVrIf1zyit3DwXGE2uR7sKn5jjkwWMEEqjSi4M4kKM7?=
 =?us-ascii?Q?4Rv3QoJISEyni0xjUyRItyDmsTYnTBqMoK34chfpjcdsBU9N1+UqbEnmaL0k?=
 =?us-ascii?Q?y8zzVNfuIykbWzlSUNXB/7JkWLZPXBLQpd1ita6m1822MWEAUo+1EmhrVRz9?=
 =?us-ascii?Q?sLbUPSejWNR9ql6au6NdXBFtFwLQOEmxDdI5n0QLAeb5VSa33TgrEx30am5g?=
 =?us-ascii?Q?8ezJOzk7XzQwEYqZEptFjA6B9F7/KOxjGqdFMySpxPI0A/mFbgn1c6j7Epxb?=
 =?us-ascii?Q?ytNxsDK0tGRyTobnCwfKtJNM8wCwgJBWuJYP1BfDwmZcaLViIj0Q+om5AbpQ?=
 =?us-ascii?Q?Tr61+/cbEsSe40oCjl3/wYmgS5y4q6IKuQljhHF88bKWKxLP2wYAE59UCZsu?=
 =?us-ascii?Q?IeUzZqohofPUIgH0t/hWLeeYHWb2tzd43PvBJEKaJjXtn4VuNTvDTNrKauc4?=
 =?us-ascii?Q?PLkRhBg+w8AbeMpzxPnCDM8E8IYl4pJrfQ6joMy280VbgD9zvQEJqpq0sIIp?=
 =?us-ascii?Q?2MWtYWKsExb9RAeD7cN/9IOaHd0DD/Xn3aAz4xrr7GgnkEl7TQc0LE+B1V/m?=
 =?us-ascii?Q?eA1suSTfIFsNm4zb8mHjTiQ9aRuFRhS+54FtUWs3UeDzzFjjpPl3xRFdnGPJ?=
 =?us-ascii?Q?cIGiCnlCRR3+jIHmq1Z4xt8t50dYAq/atGx5pui5dWnSTurkNfKmQuCYX6Ad?=
 =?us-ascii?Q?1+Z2NSENB9JNUfcl8s0tHgLMOauaW99qQHH7Oaer?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 004b4a81-49db-43f7-d94b-08db9268c746
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 08:24:52.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JheMEgFZtDCPry+MsKZMQuaoaaZOoGTQG3i/EQHaiU4PlBNk8Mg/ioTXTjb+Ek28c48MLme/Cix8qFd9PXSkpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7917
Message-ID-Hash: CWXVIXU3X3VK5WKZNPNLJX7SOOFT3V23
X-Message-ID-Hash: CWXVIXU3X3VK5WKZNPNLJX7SOOFT3V23
X-MailFrom: daniel.baluta@oss.nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWXVIXU3X3VK5WKZNPNLJX7SOOFT3V23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Document new playback-only and capture-only flags which can be used when
dai link can only support just one direction: playback or capture but
not both.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 59ac2d1d1ccf..1bf331f095a4 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,6 +27,14 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
+  playback-only:
+    description: dai-link is used only for playback
+    $ref: /schemas/types.yaml#/definitions/flag
+
+  capture-only:
+    description: dai-link is used only for capture
+    $ref: /schemas/types.yaml#/definitions/flag
+
   dai-tdm-slot-num:
     description: see tdm-slot.txt.
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.25.1

