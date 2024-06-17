Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAD790A19B
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 03:07:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DA54DFA;
	Mon, 17 Jun 2024 03:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DA54DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718586469;
	bh=ci2e8BhC06wNWgK0fAI1KKHphl1PBB/WgtgVi6i4VGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Er6wBGCMQTJwIk9/nsyl34jM1Ek5UGpN0Qb8+mPDCAoKcbls81xDi8IwnYaH8QSEU
	 yJef4kxHu8/oin/BCEQOdhG+E0IRjBxAw0jZVjFTwLJlvDb5fsOt5l0elG8RJG9Me6
	 OA133LktYxk9uBHUObKxb1ojrJcs8IdXNT8l9qRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49397F80610; Mon, 17 Jun 2024 03:06:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2EBF805F7;
	Mon, 17 Jun 2024 03:06:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9739F8058C; Mon, 17 Jun 2024 03:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48001F80266
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 03:06:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48001F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XH2Bdval
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GZ+tz96gEj09hvvjUI9rmV8OjP9gt1kgGTPEGfg+TA9jWZvIpwBoCnHydrZcda4jyEXxPdLRbqigYFLn0miCiduqFSIVTNLM4BaLCrx4xbOy3EENXwsBNpqqpinCMnzhKSscktF+lP0bRi17IiGphk1+ArmI7aRPQTtFjNdVf2Dp/h7TSJM91b8QNTmLtfWJtPu1fhgXUz3Bf0RLDfs9TL1dl7FfDCVq3Hy+eRDlWEK7zakbW1IcZG45aqqnLO1ipR7HODYgUo/fl29m3+jo/XVhPocaxx25xA1rP0i5EaAjpCcjS0wuz8xCyDvS20phgxhUzT0YyeTGNrIWD+cBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SR6qFu6vbCQG93VqEgo+PjdR3MVFfB3wgIXqBfrre4=;
 b=KEvT6Kooih23UN58gDkvuXcWNMx32vmPEobpVX9msopuoGrNtgd4k6d+g4ZMNZ6+RLFRadMrZ+WxlM3nRqM3sDcmcVsNhExnYRDPiPQ8Tb44nwGqdh+1vkOZI29iKwC7GM1RmAM1PY0LkmAaK6Jcn27kyVK+NNFXXJNqw5crIr7ukTU2WZdQk7UoKUEWknU7nyFlAQs+xCeB7Y0/IgKR1MGVgvDCioYV46eRkDrkdOLFX76bMUm9zshnULQjXN11YRbmm8mkcsNvlPN+msJFFhieQ5M1iFrh+Zf6jUCwQJIqv0oZFXQPmSlB0F/GtRDDZUc3v+azpg3W+YYL1mp6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SR6qFu6vbCQG93VqEgo+PjdR3MVFfB3wgIXqBfrre4=;
 b=XH2Bdval23GzOxCg6e0TNjsompg8lMcLgJJUBzEjbjxXoyEHJr8e7d4tBb1bfWeQPrAnlry9yAH97GDNIr30HeQVOEwxc0kVRiBZcmOTYPjM0utinKaatHwCR4Mm5cnxcLcwIaeAUuZEQhYPTIVJv5nBZJ+p+lQYhbF/jwPAbfA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11912.jpnprd01.prod.outlook.com
 (2603:1096:400:38c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 01:06:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 01:06:47 +0000
Message-ID: <87cyogs7h5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/5] ASoC: simple-audio-card: add link-trigger-order
 support
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87h6dss7i3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6dss7i3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 01:06:47 +0000
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11912:EE_
X-MS-Office365-Filtering-Correlation-Id: cced4fb8-6167-4947-e203-08dc8e69c2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|1800799021|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TVGjVoiolRHLZMWB8yG9R8Xvwj5OKzfavFPC7ZiHcvG5GpQYy9xJ6fkS3ICf?=
 =?us-ascii?Q?Sy3JzLNJJQ0Ug5O4kht0f15ONSH3lemezXNs34NZmkFXnmh1wK9eRCfd+nRo?=
 =?us-ascii?Q?wfaAfcmUBBAVzlceW50IefYOV0uaV+aiG+/VxKFz5nwy4XHX0JmobH4dt6Mf?=
 =?us-ascii?Q?327zvptoHPDsVpTfAyOaqIHcqBrLNl7ntEuhlRb/evRtMmYI5jnAchaQbke1?=
 =?us-ascii?Q?93sAj6as8lBB3lbCLGXXIlXxfSL3Acr3a5EipzWomBiXufN+neTFFaXXZJ+I?=
 =?us-ascii?Q?rPVoNo57ch7AAW04QjmJeWF8gQ0/RoCZfGPkndzlgvO+c1OaC0M7cqJnq7mH?=
 =?us-ascii?Q?kwwYDg5r6L4Hc0gPiWkOKameNDANylJU5r4GUkoR3962eZNfjMrm4Ygbyv9J?=
 =?us-ascii?Q?S73aKiKohhqpsovB+fYabqVUI5qjwKFuAZiAMSr81jeqMR3ah9oEYt6b/HJn?=
 =?us-ascii?Q?Zq9LLFyDihkwro0/HSI++PzKBN2HfgXWKSUe4HnzF6KG0Fh/iRPX/MhYsNNi?=
 =?us-ascii?Q?2CnOjmblAkwH4ap0oa4vDjWrLNJP1sMjM2Lo6vEbet5+71XkX9suQ5VV2b2x?=
 =?us-ascii?Q?lvCXKEs77g59vmRMS2H9IO+ad2TgS2WxqWQJHm1GKzTIdu4hejakewS9PaFM?=
 =?us-ascii?Q?2mW3FOD1hdD7Z3XP8OKYyop13BCZGgn5owwh3owDrHEskicr11BWJlrkbob8?=
 =?us-ascii?Q?Im31Sz93Q8tHd49IfBbnhfwyJy90n89Nk13s8hK43dPiyvdtpmTd+YGZQ55E?=
 =?us-ascii?Q?t9oF2Kh4IWbVseJtAmF0Y3RjoX8aDIFki9EzkfJUCWn7vr8jNltMVIGDGbkA?=
 =?us-ascii?Q?ayGkZC7OQ9t7gB9Q0XQWY3dTFFPi7moF/hEHVN8iJwxwBVTbndBddICPRiik?=
 =?us-ascii?Q?8IbKqYcZ3KH/G4C3QjWeMLTsfiraKajdBBEneYlUx7IHLkwzX5uvxnNeffCx?=
 =?us-ascii?Q?iadnElbng2PT3zx6YT2kSG4Y3EgDB02dqgLvUgQKUw7XkZIG2+LoKnV5hZSw?=
 =?us-ascii?Q?pWb3wnQoOL/NjP+W7wq0ZnTVhmPEAAWssAinisOta8FGTb21LioF0klfBT9L?=
 =?us-ascii?Q?T3M2jIvXzhf5NlL2ZvuWP5gYpFX0au5c+IVaVt6EQbkG4UVJZB2XRxxvCSHJ?=
 =?us-ascii?Q?YV8DYVutkdMk4+pQUlN0AczAoYGBjy1mra8PEtk4/nsPENUKG7qzrwAaaJ8a?=
 =?us-ascii?Q?3ln/iWu+B3IGpHYveTlgBxJ079f8A9XXvcxgbr5kufGYOifBAkeqwSB+2US5?=
 =?us-ascii?Q?gO5P3Coi++gz2BKJzj8zoXlPHl9OH+7ZlvufxnvmJbF8OCUi0OD6gzgQQYaa?=
 =?us-ascii?Q?JQ4WL9ce4fnrV82u9O5+eGKjrZNLa37dj77xIDy1fu9tWz2TB0ZKmwBMj/zM?=
 =?us-ascii?Q?pF8Tad0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(1800799021)(376011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cx/CmmqOZLlm9YSLR1192i1gtQhAg9RuUbNjkRBVSZq9mLdi5Bf4fLlfxiUu?=
 =?us-ascii?Q?kQ3wX0qbo4EBFJVWzijPSeCTFSFoJo2fXnEoMvShbPcljBegscw5d6zRt/+x?=
 =?us-ascii?Q?wwFa9eV1jMr3mnBLcniWZ0RVPo9kgyNWmcp7VBB0dg6od4sHztC5ic/G4PV4?=
 =?us-ascii?Q?i00x2q+NEHCOrGAILC4c4AwTMKmJhh2SUR17/BdcXM0Up/iOMchtRzXc3pm5?=
 =?us-ascii?Q?cVAf51Depf/LDEQ8coW0k7pkLrI3muV7pfu1m8P4/ufuB4W8qKDht2T10Ica?=
 =?us-ascii?Q?UK1Ram2YaQueMRnE7Ci5DIj1SbFkF/2CllYPqXgGNoqodsL56zLdh3ZOZ/Vu?=
 =?us-ascii?Q?veZ53nC8P6UPcF4nWR5OoxMg0ZTGzPItMExFgNrZ/XyXh8QT+6zL/26drQDq?=
 =?us-ascii?Q?2EBTkR/K2dqnzZaS8gnwM+KuZp8u+9Qp5SGlL5F6K5gFvyhPexPueItvNQpT?=
 =?us-ascii?Q?0ki22nxW8MUjRqkJHJcuuIcceayBP0HIekPl0KwXOgkufifiaqtcF14Q55vR?=
 =?us-ascii?Q?8V7/qtWrvaRqCSc2kyJDVUsQTyxhsop+kc4fd3Sza18j324/+7sLooOET5Mn?=
 =?us-ascii?Q?W7SAKIQnVQiCCH5QRYYHxQwaYuEMG6LesZd/Ql9YGVR/i/NtMpABhk4bFEm8?=
 =?us-ascii?Q?u3lHicHu7YOUEaBJLhPVSVckqr1uVhhy3Kk/G8nCOjDvZuf0sNnubi52whuq?=
 =?us-ascii?Q?OqsZsv45uryPBq5AmQKGqfNQl5gL1tQ41qQHMRswuKRF4RAeRoZIQuOWm330?=
 =?us-ascii?Q?UI0PF3Cxk5A2Osr84ywI1QfqZHxbboqqKugn3lod+Xu8FPTNrBBOzRbbclJB?=
 =?us-ascii?Q?zkLv5W3cYR5oFFYZKZa+a7o6so58hNryXk7pUhi6OiW+kCNbsJCNFN6XieFa?=
 =?us-ascii?Q?h6CoXDgFQqxiSo5cS6pwmBBofeqQu0xILgHn64RfyRhFsh//XokG3AyOaGr8?=
 =?us-ascii?Q?s4kRjPW03HUKMFhzEwV+WeOYAYcnh3pd8qn1XKYmi1pidUwtbbT315qUM1Xn?=
 =?us-ascii?Q?jOA1t5IvaWt6wU2Eeede/OTAeHD5gKLoL5LHIU1Cq2ncvtaiDaUtgDP5/xsD?=
 =?us-ascii?Q?lX75iuVjSbmThnQQg7hFDZsyavEkm6iDBSX9eTnfXMWUzpH9q8OyuYBAA8bb?=
 =?us-ascii?Q?qcd2gfgYJzBE+XBBFh2rp7wHw+seKSddbrv5s+GcCqeiVMjQHJxbX3SrzpVX?=
 =?us-ascii?Q?rRlGl4EYh8riN//3L3MnBUCgPEfsczKSQQQyYCkecicUd+M1pjELW+y7Nx4v?=
 =?us-ascii?Q?hsqiGQLlUmV0Hbwx/+V1J2sYWrAKy4Zq6X6rkOtC8UnS2AXJidYvSCnOTDeS?=
 =?us-ascii?Q?occjURR/dhjUBD4BFeJ3C4s5YOlXOkpBi06MJvFahXK7StIUy4xdGqj/Rfnc?=
 =?us-ascii?Q?81F6UG+L1vrhgE/tzjILGex7hajVoR/W6zleFT0cAbRC0Osjr/O60leAEGXr?=
 =?us-ascii?Q?VYMTWRTwVIzMk7UlJHlhyHql0D/QnDHfPCHHcBO5eGiimGIwU0etOourQh+W?=
 =?us-ascii?Q?vE97n1EOrTUlu2o0G7zVkYvuv9CnQdRehzpJKhCJsRPA+kVOC/irmvIAgkyv?=
 =?us-ascii?Q?XNx8sxb/oio+tgj19TMxYXRYvk0PMAIvzFESv71FClVMr0F32Lq6k7qTWujr?=
 =?us-ascii?Q?v8ilTvTlL07b4N9umgfntjs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cced4fb8-6167-4947-e203-08dc8e69c2e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 01:06:47.3261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dxqFNvs3jT6HOOxeq5VLu9m4JArQM/TU8aib0TCa2gXCn90mwGn/XTFlDArijAWFdN4NKmNfO8g8iZAph3sJsKvx5kdQ0/PzaYQSxtZXxIt+KBwwAFUzxJXSLgs8UJSO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11912
Message-ID-Hash: BK2MFH6BBFQ3GEAZFGGTUG4MSWSWT45C
X-Message-ID-Hash: BK2MFH6BBFQ3GEAZFGGTUG4MSWSWT45C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BK2MFH6BBFQ3GEAZFGGTUG4MSWSWT45C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Simple Audio
Card still not yet support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 2de5e6efe947f..edbb6322e9be2 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -176,6 +176,8 @@ static int simple_link_init(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *node = of_get_parent(cpu);
+	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
+	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
 	int ret;
 
@@ -198,9 +200,17 @@ static int simple_link_init(struct simple_util_priv *priv,
 	of_property_read_u32(codec,		"mclk-fs", &dai_props->mclk_fs);
 	of_property_read_u32(codec,	PREFIX	"mclk-fs", &dai_props->mclk_fs);
 
+	graph_util_parse_trigger_order(priv, top,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, node,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, cpu,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, codec,	&trigger_start, &trigger_stop);
+
 	dai_link->playback_only		= playback_only;
 	dai_link->capture_only		= capture_only;
 
+	dai_link->trigger_start		= trigger_start;
+	dai_link->trigger_stop		= trigger_stop;
+
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-- 
2.43.0

