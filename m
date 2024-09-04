Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90EC96CAF7
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 01:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11597DE;
	Thu,  5 Sep 2024 01:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11597DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725493492;
	bh=sc8KQbLbJMzkCA+NgfkDKSJuHgSEUwfU9OB2ykjfOyE=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sZ7ffJixvQyYGkU0hXBaAQDNSbn0DvH/2vsCcMaAPCx5OafEBBLE8T8Aw3zwowInI
	 bNDSZtxe/5rTIDtiB6NgCx4s1BwUEbZ0FJUnkTdZfRR4SImLVIMY5duByK/GsudPwu
	 0zIUGXINHfGgL1nMrr7w/P23d5qCmlWxmdUg3Clc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5072F8059F; Thu,  5 Sep 2024 01:44:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 087FBF805B3;
	Thu,  5 Sep 2024 01:44:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D155F8016C; Thu,  5 Sep 2024 01:44:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7C88F80116
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 01:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C88F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lnt3ybv4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B8nDdipCXe8bSRwPvq0bYMEFUbqo0xQj3LL8dBJ4zjvkouRZEOqtc2/5yVadJGydTJO2UhdFJjwZUV08xbnSKh3xvor8+/40LHajBcK4oQvyE11KsCRjbe6svChswP2wqfPFnU0/lg2VUUd1HvR/coZuUCtS0NMkhr1rrJT7182Dy+cT0Sbl1hHW1TXnYIqlEB9ZFdM/AmHEd2MhTAqPn+pr5q3GDkEh26mcBTdbO8bInt2v0MgB5xSa+P0/NoTDvsHx9MAAbenpfgn6fUYPX4TpE5FrMcgrEAUzq0U3y2tShFcla9DbnqLMRK1nDMFoSe0BWwkaAzYQHAKA7fJhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1iaq3M6NxB4/rGpWMooU3Hg5wEoZUFkzPWYsXfT86k=;
 b=dhgsRGJpp36iYSyPEPQTGOSt57WzSgDkZPeAywFFYxbh7eik7xYmoii+K8XmxCgnk7gIswRoYFZzOldqLRRubvLfelIY2jWjjemv0F2RsDwEjstSS3lOw5n4l0gZFCq4ypSggWVPr3qHBJaE0V6y2BHjpjvQoZNATQK971awzlDQs2wcKER4yM5Dwp0jAlvqpX1BdZRG1U/CeUxtGKX4qp0/TdOBUXui0J6hu4PWCbhKdh4yidMkloRJWM35kesG++BvB9Chii2JVJckj9/xDBJvQSI7ufs//zBOTP8atV7nHZWiU5oSKsVY3QaUYdB3UK1piQ/511Y8hPP6BE+ebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1iaq3M6NxB4/rGpWMooU3Hg5wEoZUFkzPWYsXfT86k=;
 b=lnt3ybv4kwT31tMUBzuhhk8TVmyc8HOmf89+dCpT2sSH/7mbg8TejMvvxtjCcMYW8BAVUDM2Ad/gaBK00dMnAdcLrr6C2WOY6vWjqwUU+44nc+gjLCPq3HmH0noigU8I+ZLfrYmitsnO+O00T7uuJQ3o9SBwd0YlgmApE2BqE8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8869.jpnprd01.prod.outlook.com
 (2603:1096:400:16c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 4 Sep
 2024 23:44:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 23:44:08 +0000
Message-ID: <871q1zkmrc.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: dt-bindings: renesas,rsnd: add post-init-providers
 property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Sep 2024 23:44:08 +0000
X-ClientProxiedBy: TY2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:404:e2::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8869:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a1d96f-119f-48e3-22ef-08dccd3b7837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F7XDF4xANeK1CzaB1jLG41AEAVybuuRemhcP/EKPjT/z+M600GSk6leBrTEx?=
 =?us-ascii?Q?XTq3oPzPcGsN8mYYNUVowBz8lQdWhcEkZK5onMm8lGU/1WmZvKVRHM4jRGoF?=
 =?us-ascii?Q?m9DQh5xBvN5lOf1lOlIvlDbF2oiEe0+SBShQGuq1On2KfB5Hvnzcbt4MuS/8?=
 =?us-ascii?Q?VwON1ld0k8sfFKoymD99xhHK1Oe9chptoRJBqV/J90BvsfslHOjiPg3JTT+5?=
 =?us-ascii?Q?OQQ9It0pUYthKj9Dn37WTaBC4GEWOIDyDPRo4P4VasPG5ivxNCUELVeElfsC?=
 =?us-ascii?Q?jiI7TZokhmt8s3r+dGL9dZw+od1rMgAQvyqd/VlObuhTMFw1Woft5mmYJK3e?=
 =?us-ascii?Q?2VOjW+uXP8JVUWEtb3SikdnpEGWZBkDcpAbPHNPaXDulCaZAGKuMjHBVtOJ3?=
 =?us-ascii?Q?Ub/7sGO+sF3oL+kA1eWwk6gNnRwwwvOF3LSk07Gw9r3lYYPB4r1TFQ3M7Vns?=
 =?us-ascii?Q?CMk9ahWU6Mh3WuS/QrdeVx76xItPav6SVGbNgQkmxV3dBN3ziXeuNfQv0Ob7?=
 =?us-ascii?Q?JEklhCdjetr+LCOSZOkdNvb8/5Qq+l9ShO+CtEvMFY2SHtIgV9PgJiMFC9BU?=
 =?us-ascii?Q?WmbqmXGPhRjbq7NW3wshybnWbzHFYMfJ8COox4xidv6FHdVD/731ohyqXNur?=
 =?us-ascii?Q?zoWZ8PzXonHz+rI1rdF/vn7PvXq5SNkNkYQfwSrR9xG2U79jQLeNA4Co3f96?=
 =?us-ascii?Q?XRrEGO2Y1RZhaKOCtmeZ/HVJlHyZlvocBtID8yvZ9t7g4k6K0cwgRIj0WXCh?=
 =?us-ascii?Q?YHbgAc7j7Xhae8sOZi7jzMeTGVtTNZYSscRYt+2sIIoLLC9q63Pb9vO/vqNv?=
 =?us-ascii?Q?Ik3f8+Wcn5KhxtPqL54H8fmiDoVmX9+cmCFPvNIfL9Eaq9FXiG5+kV8JwQEl?=
 =?us-ascii?Q?zU0VAR6PmQI4lwNz5Acy6QW4akVzbXcnvaaCK/amhXkXeanoLKYiwVH2IKgG?=
 =?us-ascii?Q?ex7oS2WCJRLfjXkNvkFF0vORh6fCbsCHETh04ehXEcwhMNJufOBupM/iUnet?=
 =?us-ascii?Q?iT8uRb1+W88Hdat/qQ9GKlyf2Pn2TczBHb0P4Kv0/GZxeXwaXCM49TCJKHgU?=
 =?us-ascii?Q?zmvvHsas3IliSFGt0lwvixxsuaJE6xzj0+/as0TG83tKuBn3McdYZBdc4Awg?=
 =?us-ascii?Q?Yvv8pU36vsh0wwOt1p9b5Y3yNWw3B1+74wX0yz5lTOjevLnb//nXsQOEUHZL?=
 =?us-ascii?Q?YDViAfeHdpdei0iDmA6CIOcKbMrkYVilFlLvnz5xmxAI6eXn/gVsPnoM7+H5?=
 =?us-ascii?Q?9J1yJBKFWHrwohfAErT5//7B3XgpJS88c8gSADjT9Oba035Ozc7TxQOhC6t8?=
 =?us-ascii?Q?9nkPIb/ecEM1mvBTs/m6dUm5ArnB/I5WX37olsw9iQX+2TW99r4VPW9zJDsB?=
 =?us-ascii?Q?PiitNZrPzIErMh0UqVIBRFInS+eUTyZ6MaQql3PunZocG11pYQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Db1w9l6ZFebwSBVWwPyJ8bzRtHR/s4HjzlkwDh4i+1c10nQkMD9BsRBc84n?=
 =?us-ascii?Q?bkej0x7Gx+m4AvOHNVbYXnhQ+i0AJpaafEWMxK9aoQG9bMxmy6tTh3uDNxHE?=
 =?us-ascii?Q?g6EZTBiFasps0IARN5R2zUvtaPvZI5MWHDp/z65qVpgtw++g272aQ1oBaeCz?=
 =?us-ascii?Q?GWn6rW4GGG1Ml2XC42E03LUZRh3skrTe3UlYdmiSMcNlam/nOYi50qEGIO9f?=
 =?us-ascii?Q?eZue0h5FzvvKa2h9gigNx97wVKEoRAVVcE7Mo2XvFHkcDsbDlIq1zChIZXgX?=
 =?us-ascii?Q?WRdIcjbWCrmwd7uVwWXPjVaHrvJ+YYAnXHcFA6NvDB6dz362C2Otu2bO9NvE?=
 =?us-ascii?Q?sS7xSnsV5xuEDArXEghYWk9tvP+GkdxCQZT74xHEnqAbyW2VAE18OE6xutc+?=
 =?us-ascii?Q?J4xRagtFX4Dxm0XHvnmuovmjl/ieGHLea7xFpikptpLKirFuFz3CYciWnYaU?=
 =?us-ascii?Q?pw+Aczy1Y+5R+WLHTQAUb7bYZxB9DU8kMDZL/DhtZHJaheNb5TydAIPvB6qE?=
 =?us-ascii?Q?ABpV6bg27NkmIaC0svWwjqiMKX5el31EsZMoU59b+apDaJYvNwIXp2BRB+lo?=
 =?us-ascii?Q?9zZoiPoLyZzp3BLTnl63kasWOatzhBQMjVFRbl6mPpCxY0H+zZhM58w0vdT9?=
 =?us-ascii?Q?OYenDdaO2WmBS8k8mXLTQl/cr+vEltoRhNJULKxGwrGeYxk3mfHW004RRzQn?=
 =?us-ascii?Q?5cHafobrNwXiqdB4n5Dq2qJ7i48k27RQgUPZ3WFoRGeNIJm/KG7zFW1xEZcR?=
 =?us-ascii?Q?PolkaLGvMFQRR1CXQzINHnhN5s4pXlEdeyXP0dHmw1crrpEmf4U+I5LJy/aJ?=
 =?us-ascii?Q?UHXj53rgQWi7sd6rkrwoTiA3HgyLZuhpFWeNYCWQhtefdLmiilUKqStOf8LN?=
 =?us-ascii?Q?jJuO7Q29CfQl7GwUT8ODV52nsihwkB0SK7JDNw5VurwDEkECm6E+4NGj7xkf?=
 =?us-ascii?Q?K8DK6Ucey6WMLg97LrGNLO6OijaRdWX4zJiRrGgwBcys6KRJgsS+Y1tkqM4r?=
 =?us-ascii?Q?l0j3FYhII6NVJ2i0D7fHxnDL6sAbq+Lpa/Gdw44r0vzImmXPca3oeZ75AieI?=
 =?us-ascii?Q?lKw0pziC+WLqYMWgPYUggfLJeFSeYW9hu2RpMWqYQtNLuwDXoltyzECkOWGa?=
 =?us-ascii?Q?dh9ZUxhO70IJD/BhVOU8drMOgVTyg0JPhNO9bWtxcyntjqMLI1gG8xDEdo2I?=
 =?us-ascii?Q?lOSIkSeAVSZbPWqXcKHh7gX913jhIwRYAlHOH4l3FcOZ+hBnTDIiQ4HbmI8n?=
 =?us-ascii?Q?4fpJN9xB88Pe4ETu/0K31ktB1+GxMMU/SW1dd9Y3Z282UW4LApUwxNZcNMIh?=
 =?us-ascii?Q?yoxMl5jmsToDNX190cdvIJaghzu4V8z6byY59aCrPG7Td4JeAAsoxs1BUfkT?=
 =?us-ascii?Q?qr3dd58tCHpb77z5161f2CGHWXa0LbGP/GiyDxSPgIDKEnNCjBmLU42NXj0R?=
 =?us-ascii?Q?s3b8jVeLakTgSEY8kQdd2cgjik9BhOi3QqHVKMHqTfqrwDz+zNL9bWanw2jc?=
 =?us-ascii?Q?fSDRmPkFbtT37iTMYKX0AWuyw6wg6Hd7Q0U4nqTjrirnsPYxfY68IvQCeGLY?=
 =?us-ascii?Q?52sI7fj7vuSU4yd8efjDCQ1v31goXRhgy4g8wc97Hco5fHvNOrAXWPvGZisz?=
 =?us-ascii?Q?bs5LXZ79+/xAiMs5NHKTwEU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06a1d96f-119f-48e3-22ef-08dccd3b7837
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 23:44:08.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +6N/1uf1fzFlrAS0lPyVYgf7nQMmqF/mjJwQBDATAxkk5HSSTJCWvvjW2n3R1tS0e/zouwjlMhUPnMYmRliTZj6rodTFxSz6YtSkoeBSMmKDbBjgAJLE0Bsc4XnfGC8Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8869
Message-ID-Hash: E22KB7I3AWCSIMAK3IBKX3QRRM6D5VKG
X-Message-ID-Hash: E22KB7I3AWCSIMAK3IBKX3QRRM6D5VKG
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E22KB7I3AWCSIMAK3IBKX3QRRM6D5VKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

At least if rsnd is using DPCM connection with Audio-Graph-Card2,
fw_devlink might doesn't have enough information to break the cycle
(Same problem might occur with Multi-CPU/Codec or Codec2Codec).
In such case, rsnd driver will not be probed.
Add post-init-providers support to break the link cycle.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- remove basic description/type
	- add detail description
	- update git-log

 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 07ec6247d9def..458877ce4aa42 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -112,6 +112,13 @@ properties:
     description: List of necessary clock names.
     # details are defined below
 
+  post-init-providers:
+    description: |
+      At least if rsnd is using DPCM connection with Audio-Graph-Card2, fw_devlink might doesn't
+      have enough information to break the cycle. rsnd driver will not be probed in such case.
+      Add post-init-providers property to indicate which link in the cycle to break.
+      Same problem might occur with Multi-CPU/Codec or Codec2Codec.
+
   # ports is below
   port:
     $ref: audio-graph-port.yaml#/definitions/port-base
-- 
2.43.0

