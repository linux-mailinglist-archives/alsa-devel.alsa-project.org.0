Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF89E8C76
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:42:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B36D14EA;
	Mon,  9 Dec 2024 08:42:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B36D14EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730171;
	bh=rnurwG50QVzLfophTHyhe85MdX87qEkkmeaUmJb8iTc=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nhV22dKWG62nudxUiZ/msN/93QBb/vzZpj1UOQmW3H5t53hvFzpZqhwQ0GFXtWNPK
	 myui9XKo/Cjq/tNFszrPVBPsJHfQydeXJzQh8LJIbBzqW/qfyvRIttn2ThD/DUmq45
	 qJ2NvQujpV/d2unU28rLM3j/pn2DGUuZeSul6rHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24714F80482; Mon,  9 Dec 2024 08:41:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 675BCF806B2;
	Mon,  9 Dec 2024 08:41:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77FC5F8062D; Mon,  9 Dec 2024 08:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52E65F80607
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E65F80607
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qqb0Itfm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wU034WsbrqU2zfNl+vvvPmfrCAmolP6PJwYk7/XF8dkBChfODMcWPHO+kUnhjxfevoTtjdI2Nmyoo1ADqL0SWFr668S55QCucrqh5GpB2a0q0qFbKdpmdmJG5fRODswuNK9UW+CeNwmazQy0Y1DMThBoGn/RFKEVhqFgALI1GakeYK2MC+n+lQuG2acPptzR049TIReyy3JUSG66ffu6zmSsPr4Iu52xli0jSrzcJlCSdvFdPx+PJ5JiIWq848s6acyK9NDSZosXvmoghpxXgXmsT51QTLK1bZrQRQEQXgVF3CmdBaWCcws0necCCdv3iFvhpQR2+3wqkIwVvxt+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FgPx9fw22gg81NHZS0RvaK0fCX/83EEnMV59YKBVWA=;
 b=WYvfF5qhRR2b70d/16JoY3KDuykcwF7BBI74HvxJJhKax4wrAc64hZtzbjEl9zuwO1CcrYolETxp7uqqOfGXkRNYrsCEWlIzBbTDCfr4PmjOoZwkHUY3yw2FC75DeD0KIxgoT4kYltZgy7NvxNacKgBhS2I9uxJ1YMwAX+vySwxJyxWohm3p5Hk0mCkkxBpsNLICjdqL+We0L6PuYQOfbIypf3BptxOKCvcaEemt1XR/CLQ9jSiNmQYlEGKGm6aCuwpJF/SMS3ZBEBxDyQBwFEKAr5XCU+zxBMAUj2bHEbgHf0T485xfO0MJojhah915safwJ2QVGCY1s0Eyzh3WeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FgPx9fw22gg81NHZS0RvaK0fCX/83EEnMV59YKBVWA=;
 b=Qqb0ItfmbKYbQN/mw0D3QKlJudH4gqeENVcyZHdWwpLV/u7S2l2ZB2jdCtrg7jeoBJ0UMI7ELPunMeF0X/yIGvoeUnfnBl7/KU3+vf61UsV4/UXU53tifNq/ij131ajA8drfQ8c/lqR+2t6h6ZUYjBbkeisxPUcy3jBNfVakcgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:20 +0000
Message-ID: <87ikrtmhi3.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 10/17] ASoC: codecs: wm9713: remove snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:20 +0000
X-ClientProxiedBy: TYCP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: dc98da58-6ba5-48cf-3699-08dd1824bbcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pajtoX3syad289M0JHqi0zDRdEdSuSCWrum5awR+oxX6+iaCQi+/T32+aljr?=
 =?us-ascii?Q?YXmaZZIQwiwyh8p9w01W+97QXmUF4Hzag7nIOXOxZO0fZGqH/ETABqAUIZx8?=
 =?us-ascii?Q?cBStqfvb3nxiFHGxDG2YfPBW3/Cf35q+twccem06CxkQQRQ1/4IO/ENpmK6K?=
 =?us-ascii?Q?XeM0otSUXjZxRTWpyD6/W0O8eir+Gm0T5eHQtZJPwP5ASLNhkw6jVybBZUUw?=
 =?us-ascii?Q?HKEy2hMeLvjx1LqH/GiEHb0FQjWugeuVE4BTiCQ9rtRZsDjVRzOXV1yc7Wbq?=
 =?us-ascii?Q?qyOYr/t9YzXmVflniItcMM0x1CsfQE9zkkmp5g1PbWtq65iYXrKPPghbvV9/?=
 =?us-ascii?Q?Y2eKYI1id98MQHIOwuX8ejLD+d7PPHKY0HRK1+3Fwco42LxLAVe+huphfE+x?=
 =?us-ascii?Q?94sq3nrQCUG08b/GTy8XpEZSP0NEKzFW75B7eflOEUfGnvwd+Po//lfiuaan?=
 =?us-ascii?Q?VWJijJFwhTEdnxaTtA3oGMA/omObwk2aDM8swTKSMfb5VhgwUZ3ELBQtKH3P?=
 =?us-ascii?Q?p5YpaGiqe2sLqTiJhrEJb/ieJHb4qd7jqtmXFdZj13zWkA3X/Us7tvDpx5S+?=
 =?us-ascii?Q?atVh9PodHV0UfDofmAZA7dsN3LgHTk9HOBEixv455tuQ/E4OAaJZ4wvfV62+?=
 =?us-ascii?Q?kYw68K16DB6rGa85hYwPqPjfdvXyyHNJRS3N0BrocPplb73U+ohqTy7oNMdF?=
 =?us-ascii?Q?biTzW5InIwcinzCPiOoeHztdI9ZI6RPV9l1A0cKqV74bd/svUqx6ZI3lR1Cj?=
 =?us-ascii?Q?0A2aVYrLuep1KkItpSYa3T2q76HiaAioHpqTmZ/av8hnzXLyRoYCaXDZBXVC?=
 =?us-ascii?Q?8la9rEk8qx63KJjESuyP29c2OQ3jqreZFj9J6zyWOqih9NDVQT1H7jutFd7O?=
 =?us-ascii?Q?AKANz/z6dPJMjKCYX7gUQnfiBZX8WbLyOyIKSFWCMg8GH7BzM9i3Qb+Jyrg1?=
 =?us-ascii?Q?duFwFgd1X16MhykTZU2nTabWWaJbYi9eMqTaPcqiLyZ9A+v2XxWEk03oG39o?=
 =?us-ascii?Q?gF60zgVcf4uXVsmgNZ4Vb51PM3rA8Bf+2gtU8m6/w7XH/Jv1yy/wd0VPW82H?=
 =?us-ascii?Q?PDmpYtnGbes36QGydaI3+fk2jm/m5v3Hs7fsy43/8eIgPlEG64jum4Du0pp0?=
 =?us-ascii?Q?xAdsuP+ZcntqLI9yvHLv4vvVuRNzb7BcSUVarJAYgV1t59w7YuaKPCUVU9ON?=
 =?us-ascii?Q?1P8PsdTLsyVhG/PyOxLdOtNJmppbFZf85AcpMrnv+/Xj4neu4BjoD5bsflmp?=
 =?us-ascii?Q?fTyDfsFFKHjsApZ0zu+OYCwDOaweXR5ivReUfe44lzajJnuuWXMVbYPQv4Tm?=
 =?us-ascii?Q?tfQzw3fk7D0R/Hbq0PKrW8wrP7jpZK8vKGsZdqk+/+OszRT5t9M4vHs33xN/?=
 =?us-ascii?Q?SyJKgti3G1shQyzARyzTYNfBBbyFQXkYXWeqg3uEsPqmcTXMerLXc9VvAuyz?=
 =?us-ascii?Q?KlueFIMF4wS5DtwlI5og+ChkIdQhBVtB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GqEdtbIvv/AoEfRkX5tbnic9oAISaH4bnsZ9cjkhfTPKqpRJ9up61+h12hU9?=
 =?us-ascii?Q?lrMmRvSd/A4Cfgz5IR20LoDWuhzBz9Id1Wd0fJR/+jU/f84ZicxN1IVj3rQG?=
 =?us-ascii?Q?uADJT+kRyePqHlsCwKEzUWhHtIgkpoAkPuHB85tD8x7h0PCJlOcBLIIhSP9H?=
 =?us-ascii?Q?fzqM/GMDMAtixm1wWXwxSsOlvX2P7cg5fonPB7KR/8bM9evk5wAA5EzMRxZ4?=
 =?us-ascii?Q?ohp/PnjYeuDjtMhnNX6JUppGuxdlwaWRnJFnyh4VwL5kj9sU8x/r81XdpU0O?=
 =?us-ascii?Q?/t5D46gX97KiIcIAjALZRoKzSExvUU6jps0G+gIYWVC3NLUpIn/1c+OwvzFi?=
 =?us-ascii?Q?9/KKqYW9eHLUF7CcmS2phvVPk0/UBvqDeHSWb6dQ7Ds5EU3JtLeamZCfpIK6?=
 =?us-ascii?Q?A9LZFpWu0QuhU+hfHf6xpXGwLgZ1r7DfTXyk7tqS5a4IOuz0rlbFr1kw/6en?=
 =?us-ascii?Q?os8n89nKXspAwgjUyNFLaS5UHxco1RdFZNEcztTWw2iWyVQNHNTFWBAO/8ER?=
 =?us-ascii?Q?miGudjFV6gmAtS0XpleX0agu2sYMDgIBa/4vxxYWsMs1det+nLCwU42gQ4JQ?=
 =?us-ascii?Q?on1aHQhktRXtALAqUYgkPEY4/StQTdCxPjbW8CYSTjlL/v/yEzfJc//j1Zaz?=
 =?us-ascii?Q?fF/wuybHhUE2F8w43asDdVIo1YXmEFWCJ595htIHi/CkSqSlzqU2+gZvfuRL?=
 =?us-ascii?Q?Bn1BieHjKuzE9Gt+NN3UJYR1hJjD7rpUvZPk8m4X+t58YKkFSnxpLslM4pGu?=
 =?us-ascii?Q?ppmOHfU45bQydHQkuOdElS8aMF9+wQs1F5T4yMIBzIfbNoUhGu7IDVaaKgnm?=
 =?us-ascii?Q?ABrkhmhxS64UO++mp4B+40GG/PS3G2IqGMqWVVuC/qYuuwyQ3xCrHOEbcjDU?=
 =?us-ascii?Q?VawvLUQ2J8K8I3T3eLBoMrfFA/WXaCkphmvNeLDZo0N3Y/slZhwnlUsaaiN0?=
 =?us-ascii?Q?LqRm018kUZPQiD3YvuHBhvbwiPHNXSRfG6NMcsg2JZpDaRPMP26g6WbMk9xw?=
 =?us-ascii?Q?yLsW7OwwDVNF3yLceJsi5l8FW/pI/gPyNILZgfABLs0uPcb9A0QYzXOQIHCa?=
 =?us-ascii?Q?cHZASsjBQU7gmhvrA0XjKN/0j9e0yGxzumNw7loiqoqAkk2Lriw/gzXCOrNK?=
 =?us-ascii?Q?r48LivOPWl7N3KqZKLztdMrFqbpokz50OBOjKOsSq+qFyinfUC+pmku8Kg2v?=
 =?us-ascii?Q?LB/iWvtQrmHe/6ZcJMJslCAmQc4pGI21L7n+IyneRXALZjLzk5l1DnLfb8r3?=
 =?us-ascii?Q?2pcoh/bBZY6u1ttTVZXJTsrzy1Py44itIlf7S+fMVRQNXsH7RhaQQfBDqNf/?=
 =?us-ascii?Q?oYktx9NBpMotIecLIO+U5Jl2yzhUZgMH6ZBI4SppSI9PH4veiikrL2tjxnkr?=
 =?us-ascii?Q?VVuXzqvLmJh/JNqoYxc8aGMb1Qp7pCMdO6jfH1XBPrrFH5V15lhG2C5h5tw0?=
 =?us-ascii?Q?E5z+nw3pwIeUaZYak/JLKg97HIJZbBzR3RBG6Gdc15hRoviX5TRzSPLX+qAg?=
 =?us-ascii?Q?bZYH6wp+SC2XlAaJ9x0u7h21L1aS2YokwMQGT3NE1Rd6apO5PQSiZ/FVeKA1?=
 =?us-ascii?Q?yMXL/KNVeAzGh6DyZa3wqau8MuHnzqJ+7CWE7VjCGUjB4cKojDBhyvpMiMNO?=
 =?us-ascii?Q?9+hxulHC9YaAU/9SNoT0iWY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc98da58-6ba5-48cf-3699-08dd1824bbcd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:20.6351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jFNaio5PTK9CZGgnbDOXmWFl0XXIcmmL7QfcRAqv9NKsa69a3cJ+egUxc3m94jlNjfhetnqgHVRJNTKoGK36XYYOhqojH31kBP7FQzGFvXygb1Yx/9qHO7Qz879gr7bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: WS3BMG26IPZPE2OIDOW7YZHZRH4QSSTI
X-Message-ID-Hash: WS3BMG26IPZPE2OIDOW7YZHZRH4QSSTI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WS3BMG26IPZPE2OIDOW7YZHZRH4QSSTI/>
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
 sound/soc/codecs/wm9713.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 64b69316e4c70..51bdad7129d56 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -879,22 +879,6 @@ static int wm9713_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	return wm9713_set_pll(component, pll_id, freq_in, freq_out);
 }
 
-/*
- * Tristate the PCM DAI lines, tristate can be disabled by calling
- * wm9713_set_dai_fmt()
- */
-static int wm9713_set_dai_tristate(struct snd_soc_dai *codec_dai,
-	int tristate)
-{
-	struct snd_soc_component *component = codec_dai->component;
-
-	if (tristate)
-		snd_soc_component_update_bits(component, AC97_CENTER_LFE_MASTER,
-				    0x6000, 0x0000);
-
-	return 0;
-}
-
 /*
  * Configure WM9713 clock dividers.
  * Voice DAC needs 256 FS
@@ -1089,7 +1073,6 @@ static const struct snd_soc_dai_ops wm9713_dai_ops_voice = {
 	.set_clkdiv	= wm9713_set_dai_clkdiv,
 	.set_pll	= wm9713_set_dai_pll,
 	.set_fmt	= wm9713_set_dai_fmt,
-	.set_tristate	= wm9713_set_dai_tristate,
 };
 
 static struct snd_soc_dai_driver wm9713_dai[] = {
-- 
2.43.0

