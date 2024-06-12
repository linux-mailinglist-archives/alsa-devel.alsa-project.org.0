Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D65904B4F
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:06:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201A793A;
	Wed, 12 Jun 2024 08:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201A793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718172367;
	bh=3EW9dNf5NF06cNQGonaVOuZPe0mNYsi+P1abcOWgGD8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gyw7pd6ZpoSxBuHLSpxDa3APfhkJSrVP0XZNuN0iuyxsIY4xDJwCsz3zxfIk8+IHg
	 cHgzmTM9KlcFGwsLGLJOL8dJCh/EiUCdAktdbIDDn+D2jP0eNPlTfNado/p67AbUO8
	 8RCxQgqM+8b7jPptjuilIIotapVhbn3+3zCQWlGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B11B8F805FF; Wed, 12 Jun 2024 08:05:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFDD3F80602;
	Wed, 12 Jun 2024 08:05:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85957F8057A; Wed, 12 Jun 2024 08:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4051F8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4051F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dzctuwN/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjxgymXAtUk/+fkyiVHZMfDhSrpWqn1vL4Q63qPSov9eGqbljN+xOoKNZX/3zqWxs6ewXG6iadKAjIpDGG7B+PM1+XJefUXVQaarFvNkMiqjXhkJzQubL6Thygthjs/nqeuJ0Ws69ysh/DLvjsHJwM7/74FtMDz9FrIuaWg1PL8RT0cb2W0te5dGm2/k7JFnKjj5DqirppxWAPj7nSsYHa/KE/X+Zwez5fGamQ3ZlWcW7KJf7kuRlEW9RVbGDl5GqbbFmt3VPsNqifqX3MiAGnvAQa+fkgB+O8RLUDZyMP3WT7DeKzkldT+TPFbQTo+QFmlw5lS2csFfeJPlrhmyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ua9SBa4i5DU9XCDa9aFkiKerkdkc+Gepgx6SDA1CGA=;
 b=Otv4JnhN2qn2m6M/HInDDYMX7QsUBg6uf1UZTtQKjfFqfZ6Fs6EWC5g1NKQu7q9EpXvlxLPeW7fWPjH6tUUOL/mK4mD4SFOzvOavayiw0pIZR5iwOGOKHdOEKh/ZJHtqBy+vbJ40Zbyqw0QusOBeiUi1cqkjMEJHHzIabadiiyzQvPVC3sP7BCEH84F3Eq4Z2aYmV9ChKTJ705Q8KkrzUN85vJtPd5a5+BLW2XilsfRXQ8gtdP8t4oKwZbmGTR0vRcU9Z3j76yPk3qVLqOvtNxPB+Uqtvb0RVMWzhi81fL0Z/SHYgNf/7cZSfb/hKAcG2Bg/tlti4eWe/GGFceLt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ua9SBa4i5DU9XCDa9aFkiKerkdkc+Gepgx6SDA1CGA=;
 b=dzctuwN/iE04ZQHMiw1jhGJ4c8+ayrZSf+/Nh1mspGTJe2YWja8StdkQt5g8tPV6hRslTpf9g3TQo5Ln8FQa/ErL4PPwiJ5BJMkDpOL1yeYnpvWRSwRDhCYmdSeIhnL9l+OFFdHCVFy0MmBhjawEF6SJO6/lHqGLGPvtTYrgtfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8904.jpnprd01.prod.outlook.com
 (2603:1096:400:16c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.39; Wed, 12 Jun
 2024 06:02:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 06:02:40 +0000
Message-ID: <87plsmzojk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/5] ASoC: simple-audio-card: add link-trigger-order
 support
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
References: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Jun 2024 06:02:39 +0000
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 186719eb-af88-4237-19c2-08dc8aa54447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|1800799016|52116006|376006|366008|38350700006;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ztYWgbz4p83Px1WABNcHvTyatVkV0MXUt8xl7+pwvpTDmq3AyC/U90oHQ+6E?=
 =?us-ascii?Q?zTaVrcAY8aneBk9OL6tZMjfWdN+w4qVLTO5e3Nem1YQ4wpIWLCfoLxk4ksgN?=
 =?us-ascii?Q?tIKWdoZHUbJTbt2hr1qdHX+9ak1cdtIRP+ugUWnmGjCAnNm5An+soVrxLPbn?=
 =?us-ascii?Q?2vNQoOQEgoSfrOFSoxpEZiuSR+f88hJL2/86tupY6jmhbpFXhO+3U7xThIIr?=
 =?us-ascii?Q?jMWiUawtK293GkE78PcvcaPt7yAz+hDf9XCEgHU5/5qbCTG8PW05a0WljNif?=
 =?us-ascii?Q?tTMYQARlxlrdRcdLpKb0e1XXo4PyQMiMi5vvjTbR9AS/XaM8q2PGRpScSY+v?=
 =?us-ascii?Q?V7B9Ifa9NGthXH3IUtdSVlvRj6POKOiUNwLoSR6GkWukDPVPmss2rQMlD7oG?=
 =?us-ascii?Q?SEAeDGR3hFshP47DRy98C07xDLVAVZiBcDu4PgD0fPHOmrLBclZY60znhOCi?=
 =?us-ascii?Q?tqiqlqtY/SP0ZXv7OyPEB2Kci0LEHnHmezRYYE0FpwyinZUr5N86f319sJAF?=
 =?us-ascii?Q?GkqE+u7oCeQVzJF2oOeMK5raSSPflzlJJ/2bYpfwe5exyqCv8kYMoRTZQpXp?=
 =?us-ascii?Q?rKmJ7Ixj/gGDYf1Qg/e0AUK64HpkPVg18rxNStz/uzHNScqu/J20uv1DM/Od?=
 =?us-ascii?Q?cWuhUAbpfU3lA5F9c2DAkYkjKrQbGgYeG83jWc6Aw5/yMrkuo5OzZbNnnQHx?=
 =?us-ascii?Q?QiubdWgtKOszuhNdiMhnTfxMoTlpsr4+JOP7rPUdAjsDeYQa+HzgzOrghGOK?=
 =?us-ascii?Q?MvLSOW+Sl0IIm3mZfwJZAsyVzMwdyHPY/jkjTuaLGTi39Qfz0NLmfKxTq2g7?=
 =?us-ascii?Q?n993CbztnfSOWQ/+cV72HdL0RvAZy/+w4qfETrog5CFikAQMQc5SVfouYPSL?=
 =?us-ascii?Q?49JS1nx9ndt53vP+bCoGN50YdgWh5H1cBw71TjBn9q7vfx9n8hlyga28VnRu?=
 =?us-ascii?Q?6FjFFgPyoLmxNKjXO+16mPsiryjr6WPNa1HGMApxGrBIojam1bH1lZIECsQp?=
 =?us-ascii?Q?ufwwHYWMtfcHluDymPql1m9KwXJN0ISN8aInO4X/83x/ZJxPGeh0q5BYkEPD?=
 =?us-ascii?Q?8vvuDZuAsTAnh3TcKEveP4lLUGwPuNEeEmUK/2tynDb7S/g8TWtPr9aqOBbk?=
 =?us-ascii?Q?3wLYmw+2e+Srs6QKbaJaDebJglcfxbLhAWSrJqVScG8GhE/DwYHaffGijVlb?=
 =?us-ascii?Q?HtzfjGlxtPBOpfsRkHqsgXsDr8leHjlkRQdkV0X59Hu3foXuVUkeFwpzAuA5?=
 =?us-ascii?Q?kXeSRxSHSGuQ+3a81dLP9ysVagM/jtZrzKnHT7xJfz7jdsM0+iI/ijHNS4ar?=
 =?us-ascii?Q?4/LrbSuDqcenJY0eFx4ZhqnNlyxFvjFaSoolkbDETMgHB18ftzvbqQbaInLA?=
 =?us-ascii?Q?tVUT6J8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(52116006)(376006)(366008)(38350700006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jkbOrkqibHyzSxC2S2RKUi9NL4SdFwX3xfT1qM/z7j902NnLGmOAUMnZ44ec?=
 =?us-ascii?Q?oXK+6Wct71voGjbX4t3zaviKKrKw6CrCywTYgRFPSOptPvVZD1p0c/gHSusG?=
 =?us-ascii?Q?oTYoZMfqTIEkV5awsoY/hBVARRBIFfi3tlHqd97O3KS6zQi38h5yZrMd/isK?=
 =?us-ascii?Q?n3VruIKveBISiLNevV8xzjejNlf+l9GZ85sodxBHTwI1PTEbwyeQvSfLwPBx?=
 =?us-ascii?Q?WecoAazZ/p51WYu62W4oFiPeJMTWkujBkT3RTfFzbpSjSfdqZV5EzoxMd2KA?=
 =?us-ascii?Q?ryXmqDLHLZteV6cHAqyqDpHlHBXj2sVP1OQp0aI+Up7u4NtjFk4sQAIYKRMi?=
 =?us-ascii?Q?oQrlKn536vLMWgdeL2dRp97Fp3hY2iE/KYjtHS7LPaMXrxr2rmm6Rokx8usS?=
 =?us-ascii?Q?2mqxq+PUrEqogpi2FmJ16F1iAoOf9B991WmF2P7954NUx+oaIk7XZnJrvQFc?=
 =?us-ascii?Q?1Y1Y75tbc2tfwOsVwGj6roNqnj10GA5mbP8iGurj+mDjJfDBLgYAcVmunyfv?=
 =?us-ascii?Q?YsV3axvHELCLMvolmQvqOIDK2YicwSaDPC071ytf0obgeF7JrVPBRWOCPNb8?=
 =?us-ascii?Q?GNZqjjFzlY9lA4IBrPwZKqHDIZfF5V4aoK5+cDG1id5VIgdTB6i3kTouVp7v?=
 =?us-ascii?Q?njWErKlCrB8JI1RIRbG0lCvUvcA7C0QrysztkvWzUc2uNrbkSOJUIQPfyz9F?=
 =?us-ascii?Q?I+1culIf60l/CRm8C5zUR8RDY3wMJJCBS1/wpNykXC8xLV1FoZME7C77vjcN?=
 =?us-ascii?Q?NlnYNRYKevY8uB9y6Hqi8hzaCqhaPIeEvycQ1oK42ztMC67v9ScJUaClF5IJ?=
 =?us-ascii?Q?m6sMTrK9I0dtqv/3YN1tSpAygYCVBhjFO7MQJrCG7dgAmRnGgDWPkz4MQ37/?=
 =?us-ascii?Q?aSJA6A4x4iN2Et897cLgBZ3OeKNkCErDi9pMP3oGYqXfxp16EkH/pkUMCW1n?=
 =?us-ascii?Q?eCObx8PGbO5sFd+8wVnKKSTh3GFGjMdrb2NjMfeJCtfGQMEPpNFGY3Qmpe7R?=
 =?us-ascii?Q?vGYYY1M/00tOra/KjL9wmXhrXrK7BiuiOFDdN3lldr78Ov5+3HEQtwtwGhV6?=
 =?us-ascii?Q?R7Pes62gcEhJllaxlipHQJrvPCY7Pg2WFUO03z3+faLd/mMYIJSleNsrYCyr?=
 =?us-ascii?Q?DYDE3jBT6oeReCU/320MlhqokxLixbKdWMMrzErCTDHrxOgBZsWktzWfdNV+?=
 =?us-ascii?Q?PYXRfBQ18CWWQ9dsdf1WHAfjGZ7BA69oZIACzBroEpl3l0TwDV3BX+fSrTde?=
 =?us-ascii?Q?GzO6TbIrzhT6GiJGa1FRhCg7AKmtZx4ajKdlbFVJ0EgO7x/NfX4E3VWeZcSt?=
 =?us-ascii?Q?wnLHiUKIs1/ySxhFsIt/dWkGmKVABU5XCjfxPbnpZ0dd+Yr8gaXZJHb7K0W1?=
 =?us-ascii?Q?8WQzAWJKs1qJx+Lx1U/yVe7piBczheOzPGnzpr3fYFOl1Z8bd6T2Zkz0iY+t?=
 =?us-ascii?Q?4030ycH/rJdqrlHWBXz0p1lMrNp6AwJxRSBknzvXRJYfAMlcoBf75+U467kb?=
 =?us-ascii?Q?dgZgNcyBuDg3bvIXWJPRgq+breFX89ZMrKrse9I1BLJIPQsaDUXyBL80eH16?=
 =?us-ascii?Q?r92t48k5kEWJDLpyoCPp1/me71uVbf8doyc4t/S6puvJUL0NRYQ4vK8kh7Su?=
 =?us-ascii?Q?gpMUKb8EgUx6K98nvbsoJeM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 186719eb-af88-4237-19c2-08dc8aa54447
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 06:02:40.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zEPOPGUQPBxLxGeSlfM3/1WlUl5n7U7PjtfGhmVSY2dpXn0b36A4l+mFbcTPE9+b3aEdAhItvGQAiofD/JZ76ySfMsuqDaUrYEyKYJ163tRQc1i3mzPX05dNFAqPOHjW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8904
Message-ID-Hash: H2LIPIXORHHKNIQG3P43N4L37RNLCAEL
X-Message-ID-Hash: H2LIPIXORHHKNIQG3P43N4L37RNLCAEL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2LIPIXORHHKNIQG3P43N4L37RNLCAEL/>
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
index 2de5e6efe947..edbb6322e9be 100644
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

