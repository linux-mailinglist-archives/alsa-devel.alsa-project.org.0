Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF18D42CC
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0AF1E0F;
	Thu, 30 May 2024 03:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0AF1E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032073;
	bh=oQIVMDFzjpt1LBJtWA9IUf5z2dD/RofWOC4ANJ82Mok=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CUSJePMldnvpyhtqrDsIYBCaCoB4+1QQvKMy90gYENlC8Q+jr7Wzs1rDy92yJqhdI
	 6aITQvFiMupaDdDxLZXDCF5+BkWd7n8O2SZGHV0r4iybdbEdM1XrhGBajVEIj5Ie1A
	 ITamwuiIT7hp9pF3fgTWQgTR5i3YKB7RGnjHkDA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D48EF805D7; Thu, 30 May 2024 03:20:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B7CDF805C6;
	Thu, 30 May 2024 03:20:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BA16F8047C; Thu, 30 May 2024 03:18:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD0D8F80149
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0D8F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OeuPG5p3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBIFHg8dL5bLc8xrmcUFNAF6ohssO9bU4PBYZpB4c+AT1uYvc8EsDQheRtwNhZL+ApKk+vP6arrkGZFIhdncOTqUNT4qbtfu8wvbdUoTlvyHnYHyisLk1m7oK2HqUlDZfLtIyQEQ+OLBmu7ykVfPxUyHEd/jjyemGQV4sx8BAQdy5Sojm9ktR3gW3ddpQ30TMsVZ56ftNfCyQOpiU+EuKrpQwz/J0kOmOH6DumhN2umO5uxDuMCjvHnfyk/YSFsjHhtbZIiTbj8zb5pVFmmCErYvifBWgV4fCcG3jTf5LpQ9+i4J3HptgEaska2Nv5GhScbshrzNw+6lQKpoUe+QJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/cKIiT+PZvxA9x95hKkw5+Eigp4hDXcZ5lf3TDTI58=;
 b=OoSDGySZ3fct3WmAJ0wvq7iy7MUin8l1i+ZNeBejLuN4ESKzplI3QPB0SgLiqp/2hDct3NMX5WyKN3f9GaU4qzUf8T2pG0SoVKNatskSO67zvRClg+kM6qhAUcWYla7DmZDlFsdVUB1Twa9dhMDXLYPwuLDZHm2v6pcN8jYwZbr8tdWAQKuqsCBINtG107wXHtFUCvXhbo5ooR2PJL9QO9NTUwx4v1M04FO3RtZ1ooV2y/rASbCDHNFb4e17jZ/Zkphs47fLIcxtD82nKhox/22YWqmImTTUrHh44jqSKf4cdyI4tlvKtqeLmpty0qXfHUruP0DUEAI7sHeog0N7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/cKIiT+PZvxA9x95hKkw5+Eigp4hDXcZ5lf3TDTI58=;
 b=OeuPG5p3CGyEMQf+mGEHFQkL05Opuf1/57Wju61970a4KB927yupxw07fMhodNbCW7pcOuBVuS6Fc7u2uPP6BzFB23bE3GeCdft9J0OJOsZJiMbyg2hscWSpKuZcgJ4qjrnd4HttF+3rweSAvhE5mMH2bHiA4B8hbQiQRe2eHq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6933.jpnprd01.prod.outlook.com
 (2603:1096:604:12c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 30 May
 2024 01:18:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:18:06 +0000
Message-ID: <878qzsqer7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 2/4] ASoC: remove snd_soc_dai_link_set_capabilities()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:18:05 +0000
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 15788655-2492-49b6-0685-08dc80465c1d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|7416005|1800799015|376005|366007|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uLoEQh4OLpXxXHYUVZjfv1jRyIEZKreJnm4ND5viApi2/K6dH8uTq+/7JEkE?=
 =?us-ascii?Q?abWCw5zmfl21rIPRHlTXipVJ7Kwd3PTVItnIVjZx9ibTsgO0cqMk6fHdEJnn?=
 =?us-ascii?Q?gSUSK2g6UJImMuveY4MCOpCv/1EtKxdRAU8TgcilNFN/95ezFLQ6YhqUCtsz?=
 =?us-ascii?Q?lbrp246G4wjPmojp9EwtLxW6+STGz3uDugQQSpnGHdNRwn0UX4VJUZbcqRNG?=
 =?us-ascii?Q?vIAr3lhTzVgUyKKoZmTAgN5EO/L85FnAqF3/PtFnvqqiANL4IITcdvr5cyo7?=
 =?us-ascii?Q?PW+nnwLHbQNG5/zezW+HpuQU8O9JrWwrPif6QC8cfD778JAi15M8kG92Aadd?=
 =?us-ascii?Q?YJZHEsskpbtEJCwwuYxBQX49TsM/wf8qCpO+PnLBPw8ZYsWxMgJ3uEhGJVJm?=
 =?us-ascii?Q?2+N48un/2rkiVSb3M13kOENX0JK/mQImoZIn7/uKuH5iN2IKeuaK8TcIAqe+?=
 =?us-ascii?Q?AZAlK4Ae66Spbo4E83Zk9PxhR7xaoIVihOFGwgnWdUXVVehy3gTQy6VAr/U4?=
 =?us-ascii?Q?BPcex+0QUhZ58R/UDkkSVXltcg7xrumflpK/MlOrvLu4boEPK3SomM5nL/1W?=
 =?us-ascii?Q?JvYdPfoBqKYiC7cnKVh6+1TZ+92CvveLcNGadEofJ9RZWUon7LcU5qzNLCHv?=
 =?us-ascii?Q?XBfScja/OQM+cdQbYUdgu1B+wf+jze1LrrnNkDy+WferyCzhUx60+FHK9hfu?=
 =?us-ascii?Q?sTYTQGdvpqL3ztLmcXS01Jtc+QBSyrBFdhUzt4oSJt4jNBIWqnnbOy/uKXrI?=
 =?us-ascii?Q?afM31W2uQVVX8xcbQaMJ08Xqs/Uw+Q3o93uZXBo7LmId1UQ81tCdEUXHkA7d?=
 =?us-ascii?Q?y+g0UsEK2VjZyZ16CCVdkayT/UqHICpQ23i28MMsh5lT4l7tvqQnNOaZk6bD?=
 =?us-ascii?Q?gGjgeQIFoKgITPO7pOZnErD1bklDcWRUYby2nOQn7ZZ4mhNftSZCw+lKaNC+?=
 =?us-ascii?Q?GoZsagTHBWhT2uFung/HXBYYGUwWJQBOMdf/FDFh/hUQCE3zcvr/EYL12kbS?=
 =?us-ascii?Q?Zjf6sPdoKoT4e9t89IaotEkWRD+jwARkm/uH/4Cipslo6LRhl15HQnjDWmPp?=
 =?us-ascii?Q?ou/0WeVYHElNdElDjAkGDDid1yTnCSNWXcGz+VLwDCfoF5EHAxA6CFy9B8EL?=
 =?us-ascii?Q?MdgAvI35edCvAzczq4nyAmc04tH9Sk77/8ZOWzqzOzpx6cOBpWvMyxmwRiPV?=
 =?us-ascii?Q?9e0f07I2CGxzcxkpx6GTR7XsbW61EUFBQRvJjmTdpXH/SN/R2mjVj/pcWAIl?=
 =?us-ascii?Q?YOQpT2brpSxPU236fVz3lAJK9wIUl46UB9VOg+eMzpzZnOaAtgukW2JFSLw8?=
 =?us-ascii?Q?xlPnAWUk1G/5a7hatO+zjV49dH0ylnZuKh/1YoKypRCSj54QrJhzOeXqp9a7?=
 =?us-ascii?Q?jR927aU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JzDaNeleBiJ/M2upkziOpV3pk8qUI3vWDJEdhkliqquhhTs2v7896G9gZc2W?=
 =?us-ascii?Q?i+0Lskf1CdPP6RbcevHdw+NsaZeFcoZVYDwU4pw5iSB0VczLG/E/6CKaXb9W?=
 =?us-ascii?Q?uZq4CbIbb06LfRjhkVFV9/+u3A7ZHSbf1OOgkJBa6eu7ATBTeVz8Ufs1U4ey?=
 =?us-ascii?Q?qUCv6dTuZSo4iWJLwZztglSTYrFOKp4/b/LnNUb8ADO5Xc09FbBsgBEe4yJT?=
 =?us-ascii?Q?ron0oPo641mb/K/mtgS8Pzm3mE5IppT/hzQjZeYBAEtDv5YpvNUi2+ElWw30?=
 =?us-ascii?Q?JoHJ/SXAzXbEGL6TqmES8nOMwgthfG1cdJjm8Q7c3NDMDOnnOubQvT3wGMIM?=
 =?us-ascii?Q?ACF75Vb1ma07H0nD0T79NigV2IFPCYQ3PKLnraC6GMAY+nZv+98GXlaYJouy?=
 =?us-ascii?Q?Od0CRJ5SmtYRjL+8fawfI/ABU3CpbeXt5ag0M577nrA8Gqib2UPiypJ9lc+d?=
 =?us-ascii?Q?b9TMl+zHtHRK2kyWpiPHy6dMNULnDIeX73ZkAOkX87j6XBra+RBW98pDgjei?=
 =?us-ascii?Q?YmirzXCk5yVirRyin4xGb9dQE+n4cH2LaA3/0qCuL6344AZDdJmO6pvp5tZD?=
 =?us-ascii?Q?Cr6xVZHPCqS0mUORkgkzunF0nfcL+mSklykLHiKYe3M4PJwpcuAH82sFFkWR?=
 =?us-ascii?Q?ClSOKMz4aTf6F0A31OMKpf3xFUQL2b00YemjSaqn2WKQGI6Nte0r5j4yWwqj?=
 =?us-ascii?Q?9zsCJUfQfujG3Q86OIdFOQ1bJOoD9qsNEgBJzp1dGZZgHR5IrDE/dLYRi8b7?=
 =?us-ascii?Q?yj8dfkSQxeJvXNd3F0szpQgJP1Q9nZnrHDdUwnMKLBEabCCyMC+4E7oOIz8D?=
 =?us-ascii?Q?LUoOnFLQ++LIvf9e/Rg3VAFqB40DYmvHumN90K3e5dG+6G6E7DyTMUMhOSh9?=
 =?us-ascii?Q?5yNYT+yhQOOnDKByIIB3bz/Rw0d6YHaXgWLRLugkFdLXe4m36vyNlKzC+QTA?=
 =?us-ascii?Q?XJnWrdanYKKwI3tRGPvAmdjLsrE5fnkGt2JCXfejEYJlZIE0oDrZuOsiTSHp?=
 =?us-ascii?Q?xOiGZzdL4hmw4NRKrSB/BR2IAQbte936PrChWrklu9bKB3I3hYb5Sa834aQ/?=
 =?us-ascii?Q?He9anVNuY0xSVBa7nO2slWetdjK35OYvq3mY5dx5wVjH5fcp+Qeebv4J6iDw?=
 =?us-ascii?Q?rUZE2JyAvX+qN89NUvk7U07ixgR9Q8acc45WFAZW7E8gRULpvT9sRxny1cx0?=
 =?us-ascii?Q?+xrWO5iy1yyZR1AiUtCTTmwJcRpCIh4ScD9slLIrzywNvN3993QM1Kc71bes?=
 =?us-ascii?Q?gLoLAvtRG3iD07ULpkRQRdH3ewQDg8RdoHtRO0vtOIxR33P7Ci3ZXd9QXKR6?=
 =?us-ascii?Q?F/8qkZxt1HiGOgHibOODDJnvG4ioN0tzOWfLy6E+Urn7haK+gKkSFEHv1ZSN?=
 =?us-ascii?Q?C7Tbx5g3yAKYO1bBloCIeT13xjUT8jaNb3o3ceEKNmgXK6r5/F3Uh5Ygf7wl?=
 =?us-ascii?Q?7hOdOlt9OXBYBTUzNf+awWi1gsOZiyvsVwx7BQq5OH4oTOt3/oIzdVpVbHQV?=
 =?us-ascii?Q?5sKljLswRUcsLg+krSmQp8WdClU4JTPdJP0iDztEils7X0EIxcEQQXLM1HG6?=
 =?us-ascii?Q?Cd44wchZeAYPFBo320C/n2iPcX32l6vzG0lHBY4iVWDpE75M/VmqQ1Jn1kgT?=
 =?us-ascii?Q?Vu8wqRxfaGrBLcU8Yzd0aZU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15788655-2492-49b6-0685-08dc80465c1d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:18:06.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nk0lvEqp/IGAvsQW5bgCYX9sudEVb98hwGQ7oqBmdK/QxSqpehIQSbkbuybM3XGEv7g15acRpD/r+3us7R3kW5GGC7RJbmAfDge5lVTxSRQQKJHmy3Uzt+vQoVdwtMFs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6933
Message-ID-Hash: VSKWFZ5FCSC5XWVQH34VX5SKE3OOPLJ7
X-Message-ID-Hash: VSKWFZ5FCSC5XWVQH34VX5SKE3OOPLJ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSKWFZ5FCSC5XWVQH34VX5SKE3OOPLJ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed.

We need to use xxx_only flags instead if needed, but
snd_soc_dai_link_set_capabilities() user adds dpcm_xxx if playback/capture
were available. Thus converting dpcm_xxx to xxx_only is not needed.
Just remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc-dai.h               |  1 -
 sound/soc/fsl/imx-card.c              |  3 ---
 sound/soc/generic/audio-graph-card.c  |  2 --
 sound/soc/generic/audio-graph-card2.c |  2 --
 sound/soc/generic/simple-card.c       |  2 --
 sound/soc/meson/axg-card.c            |  1 -
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ---------------------------
 9 files changed, 51 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 15ef268c98450..e73e906298adc 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -219,7 +219,6 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
 bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
 static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 0e18ccabe28c3..98b37dd2b9013 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -650,9 +650,6 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
-		if (link->no_pcm || link->dynamic)
-			snd_soc_dai_link_set_capabilities(link);
-
 		/* Get dai fmt */
 		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd6..714ce1f4a061b 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -246,8 +246,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 81e84095107ed..6aeb578891f68 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -925,8 +925,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, rport, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9c79ff6a568f0..5e66812ffadfe 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -276,8 +276,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 8c5605c1e34e8..09aa36e94c85b 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -339,7 +339,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 			ret = axg_card_parse_tdm(card, np, index);
 	}
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index f1539e542638d..7edca3e49c8f0 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -107,7 +107,6 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		/* Check if the cpu is the i2s encoder and parse i2s data */
 		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 3d02aa3844f29..11cbcb588336c 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -145,7 +145,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		if (platform || !codec) {
 			/* DPCM */
-			snd_soc_dai_link_set_capabilities(link);
 			link->ignore_suspend = 1;
 			link->nonatomic = 1;
 		}
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 03afd5efb24cb..54348a055566a 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -479,44 +479,6 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
-/*
- * snd_soc_dai_link_set_capabilities() - set dai_link properties based on its DAIs
- */
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
-{
-	bool supported[SNDRV_PCM_STREAM_LAST + 1];
-	int direction;
-
-	for_each_pcm_streams(direction) {
-		struct snd_soc_dai_link_component *cpu;
-		struct snd_soc_dai_link_component *codec;
-		struct snd_soc_dai *dai;
-		bool supported_cpu = false;
-		bool supported_codec = false;
-		int i;
-
-		for_each_link_cpus(dai_link, i, cpu) {
-			dai = snd_soc_find_dai_with_mutex(cpu);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_cpu = true;
-				break;
-			}
-		}
-		for_each_link_codecs(dai_link, i, codec) {
-			dai = snd_soc_find_dai_with_mutex(codec);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_codec = true;
-				break;
-			}
-		}
-		supported[direction] = supported_cpu && supported_codec;
-	}
-
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
-
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
-- 
2.43.0

