Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DF59E8C77
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:43:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21B6514E7;
	Mon,  9 Dec 2024 08:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21B6514E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730183;
	bh=5qgSOF7QkbHxHU+fdapx0clie6BKtiEtgDpMNc88PMI=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kdoDTjLA4LsGhY48eQns4TWA7ldygb2FSELaOFuhw3apV49uh9QI/2j9erwhqwQ8Y
	 IHJKn6tO6QVNGuLY2MBbJx4mflokKb0rCXtZpkgC2BiPAI94BFVj31xlocqMiHhYJG
	 wN1zLE0k0FOHxVe2B0Ni5MPgrTR7DhnCvkOIRRqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB3EDF80613; Mon,  9 Dec 2024 08:41:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 468A1F806C0;
	Mon,  9 Dec 2024 08:41:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E45DF805C9; Mon,  9 Dec 2024 08:40:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3715FF805AF
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3715FF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Ra5PokTK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwzf0O9b6S0l7LUT5QAAr/CBpqi4aK629N/Az3jk+1WRtCAebJMxUBGqdYksVeM909+1EFrkaMOUAVDVbMrZ4YGzOnmemQxTiw3qG4NCqOBkd0fpAkZfPZ8UCS9wziN3CjWsMGABL44b4pFVgHzn0E7mnX4z6sV/S2874omG74fhUip7T5hbf8Wk2AXA8Oanz1kQRofH6gb9CMhCGTrAv+tE+57sXPZs6LYMHumjoNznUayysxy03EifNC5D5HC5HwQvh/DTjYbxg1I7+25DPyoA/rZxVN6H30q3F4XGxcK+E5csnU+OiZfBDLBhGVMy6/38tkc8s8ITVIRd7+V7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/XFh0Y2A36hWZ9jX14GqRDF7kYqK8NYHqpf0KRuU+M=;
 b=Dx2jBrRbWyM4LUIWCKIvwh1j6Yjl4wxyLkVP963yBYJowsVD3wz3D0IRbZtDbtOOQ8HlIc2CRqwB0rE9fIkgiDED0CGTrFDy/UKqBPG7X74+hvsz/8qRLQKaFeiNXE/Ig10edGbLNpTcIvVFCJtEp4oVtHxcRX3OnKnw0kpCy5ftZJ5nof5bmqcB813DAuMi+EVnfJ0QIuFR8AwO9qhoQ/cqPAwokQTvqJRM/wpvqc2I2mrX43KCiJeFS1qzyMYmpR71aU6Fcxgf9dVWEMjLmPMOdupKgY6qGDVqUYG+E3SSl9eNn1EkG6UOWu/50leJPddjyLwZ5PgmV3dp3Nu4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/XFh0Y2A36hWZ9jX14GqRDF7kYqK8NYHqpf0KRuU+M=;
 b=Ra5PokTKg5qLPIzT9q7jwogRyS07pORJ85ryU5JQC3mqMPncwXeWCt2Q4j7FKurpXHt2ZT8RrSekmldACGooWctj54FDavt7EM5nCLJgzg9E/NJmqQTebXbOBQ9UPwZHFPRGZSJSEz8MzrF6AHJfJpKe5fqeT/fVKu0I9nambek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:25 +0000
Message-ID: <87h67dmhhz.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 11/17] ASoC: codecs: adau1372: remove
 snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:24 +0000
X-ClientProxiedBy: TY2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:404:a6::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 781745ef-bf05-4803-dd3c-08dd1824be6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5QIar+Xhcu6Xkx9zZPxdOG5qbe8L2RWaGz07eY9pxqnhVQmsv1bgy6vrhodO?=
 =?us-ascii?Q?HfwyN2UoC5NES/d6OrHmOtTnuYjWXYSv+5Mm6L3xROYTH2Ip/+As4a8d/iyb?=
 =?us-ascii?Q?LbWmhse7ac1vyoyuoRUSLZy2puptmdkEbvKECej7rrL1yqIyjepY2bi9W9lk?=
 =?us-ascii?Q?SKCWcvLNx+hk61w0FCptUhuj0oGmdJunVCdHHW6/e1Kq31bKY20oHs6aBk7y?=
 =?us-ascii?Q?tI2rClKB+VlLSkyE9Cqu8QltNCckuHS/+aQ1yTCdU4BTFClgsPH/urNDZ8vY?=
 =?us-ascii?Q?rJiunzeENppStKp8qdbJjhZ5icx/g25qitPFf7QWPTeDTP6MxuXB4hnyrD12?=
 =?us-ascii?Q?MXM6VQvlT3icqnaeT4EoSdmQe8EJykcYjCpXMhgRFg76DTsf/mOM/ZZPKCbW?=
 =?us-ascii?Q?I8GyjeQ7/0dcadgmoH1cNq6OsGxzSXF35gZpaRH5tdtUARM7f4FRev/8ipN1?=
 =?us-ascii?Q?/LesgHer6SSCdnZ4LZIdMkAJlmGCZJbubHz/OW/D5/HKe/OcDC+ZzTl4VKQ/?=
 =?us-ascii?Q?8eCjYQm30gYeXGpJ8Xi/Xm6OCqT5DMki7OUyTOndwOcdrCNDuZGjyDiP9Xok?=
 =?us-ascii?Q?3BqRW8ms+9WknougrJnKATcU2dLcJ5v+2tQMF9LtW+CFDdWD1ysnXciRA97G?=
 =?us-ascii?Q?TqkPEFSSKcZzjRenV6/i6bDTdyoehrrtXzFavTRQZwvnHZwLu75mfwB155MF?=
 =?us-ascii?Q?xrZtpfX1YF0omLJKw3UvuKbz/6y8AfbZlub52VV3KHeL75PEOcAsEcLwIwzF?=
 =?us-ascii?Q?9xqpa1NOkS0bI56IwnPOorVvtYPo5iIgcCnlrmwIvmAKWcxApSghljqfpCzx?=
 =?us-ascii?Q?FqNf7tD/bPoeevAkwq+Og+kHZTFPR/Zf8ticL8iZr0hwoKCh+SaSSRhHbBDp?=
 =?us-ascii?Q?oPY5p0hKQ8vZ0XGaH52LolFPP5I0bBbEnPER1jJz/vv5LHxwnqaQ7lvu6+Cx?=
 =?us-ascii?Q?jL9C9QwZm028qp8pNmYARU/OA6YI8jykBd+Z1ZYMW2Eb08OFA5RK5/pFmoeO?=
 =?us-ascii?Q?c3KACKukPHXOrw/ySj3yXZITU4IAVYhWgYw0zmO9TuWkINcA76Y3O6FOHTU5?=
 =?us-ascii?Q?ecNOeWZzCScLuL58o+Tb+pMpF21o9bW7sJ2Ly60/VbY38ryXzbtl7J4H7vhY?=
 =?us-ascii?Q?HHoMkqkYHV3rP4phvGHffTFOUF0rxfKroIKJMPNuLUDNdLkAsjOvWeMtcuDO?=
 =?us-ascii?Q?7Oa4L9Ues21jfG6450DHf5LM3YXhWpv8s9Y9MRsjppQ9oq9QSd9qlDzUgHfR?=
 =?us-ascii?Q?Rnv8ZEoPwAX0VZBXVgkXgqtvz7wdZE4UzqBRFsmIkf3xKMZwuAwoC/Eg9tLq?=
 =?us-ascii?Q?jw8XctHLd4uTTo/kNt1S9mH7RAL60BaHYmXbQbZHQA0yemLuu6XcSxrYr9xn?=
 =?us-ascii?Q?cz9hGH6ouPVBsfzTK9nAFtY7eL8jexqjnc3JRRKZqttAAZWnSdAO7+7oyqrW?=
 =?us-ascii?Q?c7vSjb3bb+fukYBJ2nphF7MjfH4vgcLC?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6FPh87b3sxqnafNx2lrNnb6HZWT2fAU6qS7ZdZwYdDO7oMxZfZiIJzZUiHO9?=
 =?us-ascii?Q?62w1XpG+jt2CVwhlG4WOmf+R+7UmCdi2vQt8T5zpkvvTRD+TonvlANIIVHvG?=
 =?us-ascii?Q?BvsFomcodJBTs1e6U+c5FpC80F+sCg+tjeqK+9FIMwg9KRfLdYVvOj5rJ2Aq?=
 =?us-ascii?Q?y6KREtMMZF2Q2iG9WZgg/XQxWF5wHBMX6VGIin1i0foCEZQf6SjTJp8qgaA5?=
 =?us-ascii?Q?t4ESQU5NORt8SXXz8bgWQ+pgd753CdqHOyYDtilk7qMOyRtgXIdufzWBAKtm?=
 =?us-ascii?Q?YsfngY08lJwOmq0vRfqAWmGc9TnKj9Fb1Td9yoqKHyiVv+X6wlIpG28kO2M8?=
 =?us-ascii?Q?ltuVhtGCb7cITdu8CugdP4Jy88JOxbxrSLT5jCiq7AyFNmTar7bVuEFjBG0P?=
 =?us-ascii?Q?9fdWQss+z5dsFa962lW0oAGVPY/sizHGWFuJt5V9JmCo7bCxyrZoa34OF6Fm?=
 =?us-ascii?Q?pphNLuKCcRkRcegZ9/4HlWiQudMQjZ7OkbkRJh5Re1Hii4un/ln9v3zS5r+a?=
 =?us-ascii?Q?NFH7GrWv74BZ6z8hYf83LEzyuYQaDe4FxKOtd3xfzqJkYtHI5coqPpprxIay?=
 =?us-ascii?Q?GIWYbl0aeJ6tBRjfSNwElVk8RxDMaZeYwr3xq40BtwHXlshtDO/O7QHjmbOm?=
 =?us-ascii?Q?P54BUYaA1sqvokGP29KWrDwN8rmu45nPN+8KXPy7x4NAg3PAOI9PHQzbN8DC?=
 =?us-ascii?Q?6tOeV1pNmlTYnua1tzgXrh9JL7UWvH8sBqFqp4rgDQHlC6t+MyYnvRc+3nz1?=
 =?us-ascii?Q?b7eJkJprHB81mGa5yeyeNwta+bcfQVl2lI6cNEHA7y06p9lpJWUugt7zGpoM?=
 =?us-ascii?Q?dDnzvO5gO1uJuOA9LfAbKQaC1+SmepME20HGnlHfjUcRgXbnDjb6iThDzVlm?=
 =?us-ascii?Q?yj1nkd23kLred+/MQeUs6b0fzA06rEWbZvvVDyPyCFiqoPd9HV/0cEAXRIz2?=
 =?us-ascii?Q?liB3r342wM5weO/SiBcz2wNXPq6/07VzcqxGaNl/Ree7c5x1rKBN+y6ug61M?=
 =?us-ascii?Q?jjOSDBVU8TPblyMPPOmWSc5NC1S1BO+NolGsxQZrLp6upCZH7OMjpuWKJ6lS?=
 =?us-ascii?Q?TMjOOLPsldg80e9ft0R+VS0+oC9pCqAMYReccdU+TFB5D2Ghm2jhOK1JUw9L?=
 =?us-ascii?Q?J0hBzfJ8XlP3l769N1gdzxWaiAOxP4ANl2+fsotMhBXtNcG5O9bpm1YcxbNs?=
 =?us-ascii?Q?Qf1/J+rMGbx9BT44M0UnrWuAhq2ilNeypilUiZpJfumguILQCsftnGkD064J?=
 =?us-ascii?Q?wxhOKXAZmEQDVJgWLVk5uFiWVDzc31lZzB/ivybOzBbikBa5yPX2tWVPILG3?=
 =?us-ascii?Q?nx/iL1NjNSbOUD9cwpr+okDFqa4yAD0bvo8ToF/JQvCAxG2A6VpUMGn6m9zy?=
 =?us-ascii?Q?Nvxr23naVusFpW8htOiuGUTnf+8STJTD89iDxLvlvEYu3r11HBwhbOW4uk54?=
 =?us-ascii?Q?clhLVevMidFlpnuh7NI3AS2eq/7KfIxshxOr1o8L1Jwfk/Qd4L1X1O/2r0rV?=
 =?us-ascii?Q?Oq2Xbkn8o5bmjnkaTgW3dnGk4PU4vPdUQuByYbWS0lNSPSmO3HkOsctXM4cR?=
 =?us-ascii?Q?ldC0IP5fxArqHkDog3q01vL2EVl109NUnjLLS1j/iq/qCH9iJsYSiOUz6TeE?=
 =?us-ascii?Q?xotrQSMQGbysCMzhPdHmYKg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 781745ef-bf05-4803-dd3c-08dd1824be6a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:25.0252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pHFhtmeFL4s0Ap/UqDRJO3QkUqLKgQag7mXwQobF5bPWY/bbwD59MevwGXPExDrH33166+UxpXkRYB5aDHj/a2vt1PneIh7yHks1+6qPMetsWsEDgpDkg5KFNx02PXPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: PUXZ3FMSYPX346MW5TERWFIDH4SSJIVL
X-Message-ID-Hash: PUXZ3FMSYPX346MW5TERWFIDH4SSJIVL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PUXZ3FMSYPX346MW5TERWFIDH4SSJIVL/>
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
 sound/soc/codecs/adau1372.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index fdee689cae538..9db37f12c87ef 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -739,19 +739,6 @@ static int adau1372_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
-static int adau1372_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct adau1372 *adau1372 = snd_soc_dai_get_drvdata(dai);
-	unsigned int sai1;
-
-	if (tristate)
-		sai1 = ADAU1372_SAI1_TDM_TS;
-	else
-		sai1 = 0;
-
-	return regmap_update_bits(adau1372->regmap, ADAU1372_REG_SAI1, ADAU1372_SAI1_TDM_TS, sai1);
-}
-
 static int adau1372_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct adau1372 *adau1372 = snd_soc_dai_get_drvdata(dai);
@@ -866,7 +853,6 @@ static const struct snd_soc_component_driver adau1372_driver = {
 static const struct snd_soc_dai_ops adau1372_dai_ops = {
 	.set_fmt = adau1372_set_dai_fmt,
 	.set_tdm_slot = adau1372_set_tdm_slot,
-	.set_tristate = adau1372_set_tristate,
 	.hw_params = adau1372_hw_params,
 	.startup = adau1372_startup,
 };
-- 
2.43.0

