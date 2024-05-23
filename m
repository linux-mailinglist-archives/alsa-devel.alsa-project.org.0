Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63718CCAA0
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 04:13:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B55F207;
	Thu, 23 May 2024 04:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B55F207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716430405;
	bh=V26oq/jEBuHmtmzWmxKXdh/2CooPbdgxGoP/yXr9hJg=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Kop/NZYNgjFiuZpVCauhpcFWu3UUG4/xzLDtU44twPGeh16MtIclziNIvHoUXo4rQ
	 LQvuWtwCoVmIk5isKZz/VGDOCcH+AlX0LgQjkYHUexnZU2xMBZRKSEmBGMZwZd5CYE
	 TOcJDn5+4Ehn9HHD9LgD7SiGBokGAzl4aYU1x1Uk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4B96F805BE; Thu, 23 May 2024 04:12:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA02F805D4;
	Thu, 23 May 2024 04:12:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 113C8F805B5; Thu, 23 May 2024 04:12:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBD06F80051
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 04:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBD06F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g5ldtBhY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrUOxjkQlzWwXY0n1xSnG8Bm2+nh0AExX6GKngnPEAmtkGKJU4F9Mc4Ei4OAGtycqj8tFGcb9s3yBWKhK86DdUiog/bz4cy+xex2wfaZAIGL9gF59Pd2GoicXseEvXXlIUg1Yquh8efLsMB67gFrryjebCACD5bUI6jUE2LbKQkgL6L4u4VPaNlmAKwUYxqFQMJteJof1lt6W5LpWIb5T/4h7d6KHjooz6G/lBRh34+xDql+jD4cCK4w1BpRnX92GtDLMALZ5W1Ccart3KQ1DURJmWcqXi8cJ1WmXJ8zwWvP/Ebyin+gDBiukM9aq9YfKNDUlW8MlTXPJtNBEtTkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRUm0j8HbcTIps1RR/L4MoVoqYV3uliAQYSR4xdus4I=;
 b=lFY/W9OtxPShwLcTdqzyQVNKbNBoevcuszZAqLQ7k7qtAks87wX94h4T0YR83FyBV3wTbLbz/sMwN8BDf6v92LC9/o0z9VPVyoCLWdtquqsWdQV6ML47HxBEYoNSVhOW5NMUXWLnRKOv62maORn7+Zo9tPn1aWJpJP8hm6Y++75q7ueGP1tO9rgK0FmTJfGXnQ12/k1sGFKz9jvXAzkv2RyP6xKfsJRY/Bml23EENlSW2FTGeo0GCwJy2efwjD/+cjBoEY0YdQqlyaF5zwiqVGGs7guzIsWfhlbUW+0Y3vJDV3oOzLlqM4E+aEGwOLx469FBG+MwFeOSmRlHg9XfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRUm0j8HbcTIps1RR/L4MoVoqYV3uliAQYSR4xdus4I=;
 b=g5ldtBhYX7s/j5aZXS1itzXLsByx3ZdvUGmG3PQ6XeeMROJm5s4H/MJlNmH8hyNcbijG/+xEsMyUoS6UH1BjNt9afKHDtUBuohMPDcIrQTS8snrvxYaDO20I/qWxGUNzjO2wCqm0OotDtFfzPk6VxJfoxwn9eXFs4j+jUNpyogw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9434.jpnprd01.prod.outlook.com
 (2603:1096:400:195::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 02:12:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 02:12:39 +0000
Message-ID: <87y181mg2y.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
References: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 2/3] ASoC: remove snd_soc_dai_link_set_capabilities()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 May 2024 02:12:38 +0000
X-ClientProxiedBy: TYCP286CA0100.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: 478cdb76-d9b7-46ee-f2de-08dc7acdd25e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|7416005|1800799015|376005|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tt+lw2GvyqSWDpMySd7MGEkibAQ2xqnVJI2PQMdCOvtxKVn/38NukgzWVJFF?=
 =?us-ascii?Q?/Ac1IrzcZ76Zp15Co5BRzqStJMag6C96mKLwKfkZMZ+X2HjeDncE+Lfro5Zg?=
 =?us-ascii?Q?JiGOoHJjNOid5S0T/E4kIwBItCUc9+vol0Z24BL6Fay2FdgqdddIiu4dWw8Z?=
 =?us-ascii?Q?40y3Oq0Uf2R0Z7rUNPlARcIH1ljhLBrKIZ4LOOxR/1v5FQfMxJt/xqP4spvG?=
 =?us-ascii?Q?Lsm9VrJurAnXXCx4qisEBfditbPDrps+9XHYCpGd5HhCFOsYuL0Lgb2005bT?=
 =?us-ascii?Q?7x7fdLLlcugpKn6h9SMaRcV+61pkNBaGwMgIjHiq4dSiIoYdu4p2R5s/o9Xr?=
 =?us-ascii?Q?1SQlpz/14Zkj8/4ZpvV57SAO3qM+Qqw368fEWQeSDPxGWVfFdEZ9TtIBWvHG?=
 =?us-ascii?Q?hgyLD8CdTjpDHe96SKKvVR6BN3/GTZADqBUvC4ODYJ885cP75qWzO5KQebwH?=
 =?us-ascii?Q?B8EHKrFQn5Fs6rmcvZ35tDRDRgNaLe43UhP6g6atjxaYOI7I3VEKPJ3rXm7k?=
 =?us-ascii?Q?gIpeBZm151LAGoU40NoGP3K2QpVlBRfXCbeG/YamLEMmt9PZYkxGDUi6Znj/?=
 =?us-ascii?Q?rWXf6AOtZ6V7eJdRRG827s0Ea0A9D2fUuxLjqp51/dTcAplTx9oPcO3/YfW0?=
 =?us-ascii?Q?YOOj73QNpQKXAs+Xic/cNrNOhl3HMx13AFthK2ZocOKrw/jmMfO8MJHALdga?=
 =?us-ascii?Q?b/VgglVzrdEKlb0A8MdzjevOTzpFec+pbIh4r1oGzMac8LNPnzm6NG6mpCry?=
 =?us-ascii?Q?PIB8GJywfOctOUfg4yM2Z7m+IAQNh8lRL4Du9lj4wl/HdMj5F7CtVWilDEPK?=
 =?us-ascii?Q?cogc03lQ2iAjm5Q0nCGaues/iyDYyjEIQSFTBSD7nqErIIp1P1/2PXkaQRhZ?=
 =?us-ascii?Q?J4WpFaE8Tc6WZ3jekuJyprJkaOG8FCVb0ySEhKby3drlQvg8/Ifr8wcN/Xbe?=
 =?us-ascii?Q?QRk8QhdIxB1g3U8QIIKhO6K9c49iDjVueepqG0LwqPn+ZDw2SCkSvhbC2lIF?=
 =?us-ascii?Q?STWC+yef7Zj7uRP1Bp+c+AAfUVOyuAmDxD5lodrBpU0KGYPrQWyIptZZxhT9?=
 =?us-ascii?Q?MfUOWHcSJC7qKvMwtSTCxcC7Y0tEmobeOkBPeDxqE3J+vaLMwVHxhi67u4EB?=
 =?us-ascii?Q?9uBiMAQaG+1FmLhox5eqf51gm384n/ssVsHXHXGusdqIy3e9EWoh6oVl7S/z?=
 =?us-ascii?Q?ntFQH4tuDTcOd9aQ3EFVBmW5K89J7vRhIGKgIhzguY0a9Vq4yd+W7Mmfl2Wt?=
 =?us-ascii?Q?4CDT0NGJan7vRmICBNcyJKlpZyiOO1mrdH02WBtBk4SbOwhkrkv1BRfMSSko?=
 =?us-ascii?Q?349FpbBrE3EaUPlTfEtCWadyp/YHXJc4KTw7nsJnmTqoYMiH0Fwfd0upp2e2?=
 =?us-ascii?Q?iorcQS0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wvhbhqIlwW6sV2qFzLdyZ1+Ujo8lURVWAfuPwxGzlUDiNEH4CwsMQqQpmc+y?=
 =?us-ascii?Q?CgfnIrqFAKr5L+HemTHvrWOD/hMcS92HGadBvrFRw5qxw+zy7t+r3xIFBaWZ?=
 =?us-ascii?Q?5yN7AHGmhuUYCdM6Q/lYM/7jw77Ig/f2JwOhHkshW9W8vTOGjse711lpyRJL?=
 =?us-ascii?Q?t1GZ/U+s2DfzPDSK4IlWa/tOWky8I4tLPFt2oPB6pQP9MYkmERSAvy1kMdpI?=
 =?us-ascii?Q?ZZCpRXImNrEk+Bz8XTZ1cfP+rx68PaCouo/BfJD3wl1a67+h5QDNe384w2HF?=
 =?us-ascii?Q?GcFZ3bOhKLez10RJ8qvFgA9q9MweL9DTaK70gyxJwHJUrh3+FFLA7SFuX7rK?=
 =?us-ascii?Q?Nhi9bG1EWRgl8oAMYX88E5fNNHI5BN3yVYQYcCbhQA+WdH+1EydkboCgPCV+?=
 =?us-ascii?Q?8olnhagh2vDf6b9gswMY9JpTv0yTrp6TJsPu1NxnBwXHyZV9zce2rnbZQSXh?=
 =?us-ascii?Q?V04liQAL3/UtUDEejkArhLRREbBASxelMULSwtt5THYqDtw/gUtpQ2LkqB1S?=
 =?us-ascii?Q?M1pxHL04XOlGSDSrE7+U31PDSwYJzSqwXPdS2Y5u9zf14uo4SArmbfoiezBX?=
 =?us-ascii?Q?WBl525ISHHDjgcc0Ofup755pNWp72UVfH+sSqRc/7ONFu1u5DH1r+KGS2LKz?=
 =?us-ascii?Q?cDlzD01nlT09t8sBNUJby17tWkZAOSrrtGL2QDXBvWSdMyFwDOC0VSIosIIR?=
 =?us-ascii?Q?/urQa5wpWNbwQ5xgbjV9pxFuT0RNjvFVueVi2Xdxuu4VchhplT3/AnJ1w7Ns?=
 =?us-ascii?Q?UMWx3BERC/reMqAQ91GaJt+XuTMYjdlJucgAiEhuTGOaFxdbRyrUec8PM/AH?=
 =?us-ascii?Q?B32DUh2001H0EtBeDqMGKJaD8l8za29sUmO7iZzaGleMefIjsm9lVCwiJo/c?=
 =?us-ascii?Q?xBro7oxvnEDiIX7W4uZFIG3kmios2SHpJYW1hIDBLqBYIh5ajq7LdK0xSEYa?=
 =?us-ascii?Q?9EjICBqvK3+a1MuEjEwu4k8Aua6ifP16DetPUR/5gy6yUy9aXrY+0GRnXAmY?=
 =?us-ascii?Q?Wh9qgAje8IcQFWaFgk95JZRr03vyGzgwZhXsyIAVgN1dQWCXdHKFTlP/NEqK?=
 =?us-ascii?Q?XLfFCur7M0bCp2OITLqoCAnLztKm7qxsKdPtOm4tEi5PgT3D+D3GoT3aa97n?=
 =?us-ascii?Q?qA1T9Bea+fY5c0Ew9Rpt3Gpof1uaDsdYkPHdsQ5OydUxP//Kj5fjXMPC39Y6?=
 =?us-ascii?Q?3XLrGlLjI+IjoP9Wvngq6dAAtIqtPLzpb4EnkEQEAxBpsT+09+vLPmQlefX9?=
 =?us-ascii?Q?Za/d/le/jFIRo7yxUEJzVlyHZc0znC/acTOBZmoF7nJSa90zfco7tL8Lz8il?=
 =?us-ascii?Q?SJ8Y9aaJ1MnDRio+VIre6NKfy9WLmCszNxe5dTa2P3Vmbma3j2z2jX03F50L?=
 =?us-ascii?Q?6q3KkPO1zg1hyhL9bcEnn2x5u/RXY/ukGaY0uxv4LTT0JDQxrDfU+TrIBw6w?=
 =?us-ascii?Q?EIzNnWs3tR+PGkf4jFoQVUndOpxsGcx5L5H36VCnKKfd3KEWumZxnRsFPbt7?=
 =?us-ascii?Q?qqrIsOywkyjfItFfsPSC6ewnS0sL/4cdSylkcEjHwvoEipoe7p/7lsVOz/sf?=
 =?us-ascii?Q?B/CdTGcNP7PKS16mxOYqaEbVbuMfle0cXU4QM9I0W5FczMkRxC1BHrhwGL57?=
 =?us-ascii?Q?a6ri1E3fI0jpht3DFBzzH8g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 478cdb76-d9b7-46ee-f2de-08dc7acdd25e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:12:39.7143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VI4/IhYIrJ4xxMSX4LesWbfDJNK2CL+takLqi/TbkrXM+/OtV+JMhPaaTYubhV1AVS3S78yLxShkEUmNlaJmFgYbMzh6BHIz6SNRxSThlJlw1IgtDSet6nQNwYUPm8Dk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9434
Message-ID-Hash: DFPBGUTUXQ4F26J5XLM5UTSJFJ25C4YX
X-Message-ID-Hash: DFPBGUTUXQ4F26J5XLM5UTSJFJ25C4YX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFPBGUTUXQ4F26J5XLM5UTSJFJ25C4YX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed.

We need to use xxx_only flags instead if needed, but
snd_soc_dai_link_set_capabilities() user adds dpcm_xxx if playback/catpure
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
index adcd8719d343..69ba1a628eab 100644
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
index 0e18ccabe28c..98b37dd2b901 100644
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
index 83e3ba773fbd..714ce1f4a061 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -246,8 +246,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 81e84095107e..6aeb578891f6 100644
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
index 9c79ff6a568f..5e66812ffadf 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -276,8 +276,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 8c5605c1e34e..09aa36e94c85 100644
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
index f1539e542638..7edca3e49c8f 100644
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
index 3d02aa3844f2..11cbcb588336 100644
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
index fefe394dce72..f8e46bec6f80 100644
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
2.25.1

