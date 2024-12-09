Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 794879E8C6F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:42:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80531827;
	Mon,  9 Dec 2024 08:42:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80531827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730133;
	bh=/F8kZfV6P3Eq5FGeVR3K/rQvxHvWen9EL15AdNcpIhw=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SS4pMDh3OHnAiUe9fJXjFb8gy4xieCjLy0TCQ2R1Fd5NJbwKLhE4jXp78booXhcAg
	 bwKRPWiIPNOEhAbHbF7N9i47SmyVMQdJ7S/ju1zerp65xqD1aeqLVe+gsSktLuyF4R
	 KeaCKMKTjDxCOjR1vqdys+wIUcghvZAnQXINLsGE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7508F80694; Mon,  9 Dec 2024 08:40:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80AAFF8067D;
	Mon,  9 Dec 2024 08:40:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2167BF805D2; Mon,  9 Dec 2024 08:40:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93A69F800E9
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93A69F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=USSAyRyu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+Xs8/v+IJ6afNKqxZIiQHra5hMASRsRbyGNbjQwcDwHuzpVyDTuRpDEYg9f5JY/2YOWTxLLRtOLP5pbeEZkZVrXiK+jXQFBRiyoicFCp3r5+2ICeKir0ZCG+MvKTa57NT0m+QNIgKcl6dW5sJ5ovSY6bk86DmXQivgeUmW90KSvkwuFwwE0ME1Z8HjIfhz2UKXgK8TeAiaxMWNbe5Mb1iW6CnV0g9REpLBM9OAAhv9stHKwXetjjsPuHqzky6eQ08sOhw3+7N8sSqqC6/alfCrRg4WUqSe8DQy1UIhBjst6Deox3/dbLcEuX3ZRdOmkL8yGwGf24LaWwgUT0peo6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRPu2+d3a7o2mGr4jWLLEl6mfLakbMRBH1ShfSkD5P4=;
 b=BU8fIqsfg7AhqP9VSaszJ4rNBRVBOdkf3pvhIwlQv3sqbvv7kWR4XaAMDzhFD7CL5CM1fRrDeGHBEY2S2YCwYBFn+d+7ERACWP1DSlz1gKA3XwVgC5x+q+eLJDyIn4qUP99caZT41vF7Lxjr93ZGnokDCMbZDi8mxj8b05WTMtcVpCd4st/fE224gZPbX3b8egFPY+aZBsl5Gnf/Jxv3e4j6/891gTCLWZeoGuaZZbDGBlxwcmUsG+NDXNN/XpG8WBIMn2nVg12dp01+HhpwJ1yT3zVq4O6Ahzu5Pod9lNNtaBqklsyWIbwkcJGlkkGVKP8lY2kVLlApvOSHLIMkLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRPu2+d3a7o2mGr4jWLLEl6mfLakbMRBH1ShfSkD5P4=;
 b=USSAyRyuQbo7NXMWlvwy6DT1gKzWT1kKfF5kisfUVeS0Lk/EZvLXkNAs/Q0teCvT2418HgeJlQgehPci1/uuLWazxvUu/7Z5Gorpjl2ifDEsae9xz5l0A3egXjVNMk9gb/lZPS0cncgzXm01tUq3Hrrct3uW6hWJhuLO3Vml+E0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:11 +0000
Message-ID: <87ldwpmhid.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Daniel Mack
 <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter
 Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/17] ASoC: codecs: wm8994: remove snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:11 +0000
X-ClientProxiedBy: TYCP286CA0289.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcbefb6-66e8-4c76-f1ca-08dd1824b66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NNREpg7uZeIDmofHRi+dwCsG93d2E46ie2QWf0z/NBTw7hoYMqfd8pTosD5C?=
 =?us-ascii?Q?M7eitssiYERdoqlay+vU2SF6AMy/NsLfJHr9UyRDH5zmrRU9rKLqvf4zb3w+?=
 =?us-ascii?Q?IaeppoPqD0GQsi7EK+xylMI1CPSVYba+iLdN/R0Mql4Alwgq4cfx/ApRwtXK?=
 =?us-ascii?Q?fsoq0RuX3ps9EQFsvGtfGzgIeUoZEr4CBjCVYZNPPpYFo6lwdc8vkuxozD5K?=
 =?us-ascii?Q?kEBHUk/JlaLJWNZ0Q4tK3U5aTbKVmiwHLJLkAKhIxhQUsWLkj/jX2CgCGvf2?=
 =?us-ascii?Q?u3E9gZ+44eq75JM8y6626TM5/nDFZdn/UpTex6gPlkDiTdQiDBhLYSPF/Qaz?=
 =?us-ascii?Q?beb7si1R937Hlkap+tLk27gKz1UWvNHWGVoGYfED3KDUpTseJ6Ox+KrZO+c9?=
 =?us-ascii?Q?VI8MhPb6VPSovsQZiOuf7lWDqeVp31fD9FNBOq04WUkz3W5oD2mtMB8bbyQb?=
 =?us-ascii?Q?xms1FuxwnhbMRgrojLc2wGmsdAwdUL+MDulrK+AAeGYhI47IRAJbGa9W3Bfp?=
 =?us-ascii?Q?cWcTdIpx4445wwrr8PdyUzTrpAYPF5VJsdKQwvNiysYpOclvvU+QYK5JL2OZ?=
 =?us-ascii?Q?B5a57FVEZ+/aMZrUbVydtVoB3eoBht9wiTZcq/h/2Wg0GWgnqyvOKSHMHmQE?=
 =?us-ascii?Q?mJgfZHJ8lgUMLdXiJY2a8D9FeJ5VZyKGAXOOPs2m2QJJNC3SrEjn2jzD+ubp?=
 =?us-ascii?Q?9rif8E3GVenzOLZqobD+hzA7Z+Lf0QPH5Q1OANfCX+VcyQdwDmPKzQDyOv8s?=
 =?us-ascii?Q?n0kwbSHsSNZP2AvshuSRbnhDXEdLs5cpn76SXaNU4K9s011py42TXHwZUZxY?=
 =?us-ascii?Q?wA7sS+eOejJM5P3sor2ycb5rqdHm6ffVa8trc1reEbf1j4FNIjZ8KcHZYtvJ?=
 =?us-ascii?Q?oKoOtwAHKgYuxwYdR4BI8EqXisRLt7QXaZ19Ktr68/SkwqZzea5SZd0QtyfC?=
 =?us-ascii?Q?kg+5IduaoyPnWq2tRk5U4GdVlzfTTCzOpgCCe+wXzpMOAOtloVS5DZf6kzPU?=
 =?us-ascii?Q?f1FUlXljMOo3fLZXw70NMJuogKIj234WEsBwuGVfarPqpDFzId94EvTRmxO8?=
 =?us-ascii?Q?yqj5sOevu0T99Riba+h1dRPYzAQfS54hHWy3yBSZzOGbzq1Igk6CcjaTywVz?=
 =?us-ascii?Q?+Xgamd9TlNhJCarxEUNfHdUWMOF/XzvyDLeUCGCql1C+C6vaTBWhyjgwpFpV?=
 =?us-ascii?Q?xYqnMeiTcxB+mkEK1sw9T/JWnhAr6yv/YzZCLPZoeGJ3NwAW4IJInlrN12bK?=
 =?us-ascii?Q?zEOHEcgqy1SnHn8YF5ZuahjX+0RL5D3pyzWt0VNZsSC2uMFnMP8b8vNDG7rf?=
 =?us-ascii?Q?SFuMpE8MMIUGqS8e+hf6xCCRwCyFXcNnJktLoYY/Qdd6zWYKzUx9CahH9KP+?=
 =?us-ascii?Q?TBLPr8midczAvvPubRcxJvS5Dd70FPNu3SuDxknwUtjsmOUM52XEHYJKQsC4?=
 =?us-ascii?Q?IAAGsv1BBK8oJcH1IOCAS0u6apKF9MhA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xY+9gWfL7d1kWomIp2a42399T65SKqTkmdiHwCZm1Txj0ddDW4FrGmAW0TJ6?=
 =?us-ascii?Q?dw62eW5eWehDv+SCw+7kxmMQlPxPRv6CAyBK1dKUvauuxjdH8E7MlRI+Ccdm?=
 =?us-ascii?Q?8kp8/3qxKxmuhKShnfsCT1X4z8lFMsL2635L2lmUzFtJKN5foxkM1OsQvYTV?=
 =?us-ascii?Q?xFblnXlcs/qiY27/Ix9J93IfhnF4WAdbICQJgOlqg2J3lEB35gE+rmcJ3PpR?=
 =?us-ascii?Q?AH9o4daIpZ/FegkNhq6PCFgTMC4gZ25jFaxgWt8Kn2gURg0tM2iV3zwsV6rV?=
 =?us-ascii?Q?/IouYqHlT5BLQbu9KRC8Q9RD6Blv18ZgyQprUrI3LnVPAQN0C5SS5TsysPRU?=
 =?us-ascii?Q?hgMZY6pT5QKG4KRo63yreq+BZazHJg99CbCTBretzom7r3AiNxbSOaVevu3b?=
 =?us-ascii?Q?eX4LdIMFFMLsttxs/TLz3pLXYqBSsByVfdjgJnY0z/5Hfp8M+YR3zPTpF2AB?=
 =?us-ascii?Q?5VU7JFplGIP9ETlhfkRyOatp2gynL9C+P/roHkM58g0tX5QPcGJtzQt6uqpK?=
 =?us-ascii?Q?PhiHu6Ufw7C1JbMflEEUGggcXeSMlb5qasRjlDh2BgDQ+9nuS7YvNT5+tH0q?=
 =?us-ascii?Q?czvCWqfSGuF7Bxio4jdgqcHDx6Sf3af8Imc8TxaLGlWJo/sqkXzaBEEE+n7J?=
 =?us-ascii?Q?VROYl2elLhi3ENsm0bb1SRp8+S36m6DF9SeyXaLNR+d3EhXcozcN6V4lc0iE?=
 =?us-ascii?Q?IpDPM8TtQX8I2fvnP7lPHrK+6uXd2lPgQ0H1zUJTT/TSwjAlllMWm1FfEb/0?=
 =?us-ascii?Q?ANqgYEca2uhUwLBMx8QMj+wevYZS8N+apnjaqkZXxT1uFvkxsNAD/QMYqIf2?=
 =?us-ascii?Q?RLYWtqkBIgcuKbfdU9BgDs7lM4K66SShUUjvfWxoNCkD6rRc2iSHQQCQ6y3A?=
 =?us-ascii?Q?AwQ03JNLXTczQEP4DcLzNaMar6f2COe/uMXx6SL9ET+5HaffVnTHfhSFvagq?=
 =?us-ascii?Q?dWbPkZrGw2UKUOG2zfSAn6UChoAAttipwUYaJxJH3Eq8Rmu68US21cRZUs7h?=
 =?us-ascii?Q?6va2tja3WtgOBdurPFv0QIrMFMuXJk3FEet14zoW787TFrv5toQTu56cU5z5?=
 =?us-ascii?Q?I6CVGhhF7EttsT4JMRLR9H7epne4bEibAG67LnLCR4DFo3lAH0Lb3U8pGctK?=
 =?us-ascii?Q?5M12Dp9hWD65/UegMjh2nqMRyYutuPG1M+Sa0+zkcba0k1LSbu6HPCAdBvyo?=
 =?us-ascii?Q?nih2zrMH8Ba+gxErwYtNPTRYOQLcG1leHeuBZOik1i0XZ7Ns3d/GHB+ixg9Z?=
 =?us-ascii?Q?4FZCmUoZaxsJwOQq7bDceD+kJK7UGrLSAsG44j/iVDUa6Hsz0BYO6t7YDcIe?=
 =?us-ascii?Q?bweV4yNKrWkLZywSRVDIvewZW30oNw1oFkumynHC0DlTzdqLpINRScGVK+Es?=
 =?us-ascii?Q?A8tsMDf76gA8svMXArVGKjmU01EaoUiggNJoW9+nApr4C+exDZWyL/Cix2Cq?=
 =?us-ascii?Q?y21z+dF4WZGa7QxB0BJEuLx1vgot03VJKrIuMMcJjI95y8ZIQMl9OJzsqm89?=
 =?us-ascii?Q?OAuH8d99whq/UZU8befczcuRQjBkv/KWJyMPnTFTjzmTnB/gvQV8RFk9Br2P?=
 =?us-ascii?Q?5R9PUlt+OV1U32VJGknhlvSzhtGSRn7KccqHk5I+o+a5fSzprPpjNxTvYvHE?=
 =?us-ascii?Q?NODs4iNc5AaogxIxnLwoISw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cbcbefb6-66e8-4c76-f1ca-08dd1824b66c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:11.6567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Wj9MaIowOvtdKUv/kt39MtjZORozq9V3KqZ7NgS9hVIuLUMjsperUGBEPQ0EV4QvyykrNhaD2TfmIUq9v3Kr+8HTcmdRnzdH3Yv1rPI6UkIMVAxB2wHpn/aMBIRGk+QJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: WAFZHWVSSMZWOPXMKX4BSQTRG5VWPWNC
X-Message-ID-Hash: WAFZHWVSSMZWOPXMKX4BSQTRG5VWPWNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAFZHWVSSMZWOPXMKX4BSQTRG5VWPWNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8994.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index a4abe6e53bfc5..20a3cad66fc8d 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3158,32 +3158,6 @@ static int wm8994_aif_mute(struct snd_soc_dai *codec_dai, int mute,
 	return 0;
 }
 
-static int wm8994_set_tristate(struct snd_soc_dai *codec_dai, int tristate)
-{
-	struct snd_soc_component *component = codec_dai->component;
-	int reg, val, mask;
-
-	switch (codec_dai->id) {
-	case 1:
-		reg = WM8994_AIF1_MASTER_SLAVE;
-		mask = WM8994_AIF1_TRI;
-		break;
-	case 2:
-		reg = WM8994_AIF2_MASTER_SLAVE;
-		mask = WM8994_AIF2_TRI;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (tristate)
-		val = mask;
-	else
-		val = 0;
-
-	return snd_soc_component_update_bits(component, reg, mask, val);
-}
-
 static int wm8994_aif2_probe(struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
@@ -3210,7 +3184,6 @@ static const struct snd_soc_dai_ops wm8994_aif1_dai_ops = {
 	.hw_params	= wm8994_hw_params,
 	.mute_stream	= wm8994_aif_mute,
 	.set_pll	= wm8994_set_fll,
-	.set_tristate	= wm8994_set_tristate,
 	.no_capture_mute = 1,
 };
 
@@ -3221,7 +3194,6 @@ static const struct snd_soc_dai_ops wm8994_aif2_dai_ops = {
 	.hw_params	= wm8994_hw_params,
 	.mute_stream	= wm8994_aif_mute,
 	.set_pll	= wm8994_set_fll,
-	.set_tristate	= wm8994_set_tristate,
 	.no_capture_mute = 1,
 };
 
-- 
2.43.0

