Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD18C39A0
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 02:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0287FB65;
	Mon, 13 May 2024 02:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0287FB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715560337;
	bh=Ks5jGXQLt6qun7V2eluuAAkL1zGuGKWAI3HgUHOLOR4=;
	h=To:Subject:From:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LQEyAYJ4PRL5FvJSF3q3JYjLCg7oyO+Slb5ap+23jNvGxyQwV2g1Hlro3SKAdXpCb
	 x/FsFbaiX0jhugEsb8V79uVBtbGMyQknZ4p4lNxEp1EfE8DYkBcM1yXuWPYb/2OO90
	 ZGDJjD5ak/FD26J57HBY/cIh7xFqpv1C2FXTHmOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAA50F805AA; Mon, 13 May 2024 02:31:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D998F805A1;
	Mon, 13 May 2024 02:31:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8AD7F80224; Mon, 13 May 2024 02:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9EE3F8003A
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 02:31:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9EE3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p4bPhcag
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZurpV53RaSKv5Nouragt2jGMv1YYW9AIDA3JtkxezVtMwtSP9e2OXPPofGb7kBOqUDFsA2kpU2+bGeYr+kaWEdRnXzokqCI2g6J+qzRtBorF1ETLjx5SuMIYWNdoqRBg98qoiab1cnfKfgSV5us/4TiI5p3aRfWjNC1yIAEmU7tqImskI7uimx6fTF5z8gwaWt1pnVxnrNjIxpTn13DxwihW5/DFl7o7Vd3jBK+a1u4LX3KVh7WjU9rukQwi53sp8WzOiD00g92XLC26FmN3QwtND6ZQLPO20b6ofFboBXrf/NmyI6OJlpAUkcbzVrhYi28P+hGMseClO5/6SXbG0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymbbUopb+35hn+vs+VykGHPtXgmd6VsUZgnJh7Bni3E=;
 b=C848V+SzA6VKyXUct3paGW6lWQxq1XqSWH2U4PMfkg5AJ1uAcPIMK+uJ09oWATkh0g0K0m3bsZKGO+HbOJ/HblS5R4HeHvSbx+mTJgui3Gw4u4MEQL0yyHbSPU+bO2DyR4W7kfJh43WzHWTNU0S5+UG9HKnwxsOygL3UhC7wX/YETzy+cRaDbH9xKe4qZd4g8X5Ul8w1YQn7shAbzFMbgi5+6kyXhMlSyWYqrGjtVmxW1lo9/9o2DWYJH4K54VwYXB90N0CuVIr1vvwUzz43mbl8x3rZduBKa3bdzYT0rs04gHQtmbUMFUH0AjhYUrPcZ1RaxfCRi5WF29kHzpIoPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymbbUopb+35hn+vs+VykGHPtXgmd6VsUZgnJh7Bni3E=;
 b=p4bPhcagNB8+EokMu7osAYDey71gJmrcPDum0nM08VCdVVuVFzHJDZKqrw3swrnmuPcGeK3sRIkd0JGy9SrVo4uofSkpjovhAt/LC1SrZTPKIdddIlIA7mqbw3BjCbGi+YhAusGThSarwN9FI0ujcGaAdPnG4qXZZpEqsp4ub7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7383.jpnprd01.prod.outlook.com
 (2603:1096:604:14a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 00:31:15 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 00:31:14 +0000
Message-ID: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>, Jonathan
 Corbet <corbet@lwn.net>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: grace time for DPCM cleanup
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 May 2024 00:31:14 +0000
X-ClientProxiedBy: TYCP286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::13) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fcfb738-b756-45ae-9dba-08dc72e3ff5c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|52116005|366007|1800799015|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GQfH9SPj6KTO/jQGUoq2gqDNfk/XqwC9vX+FFkKUuJ61XbisyuUe/9GDK2D1?=
 =?us-ascii?Q?DtNzglOmTh2fwlkY01V/y3Dn4+wGlz2mtz82rijVNTDsL2KRiFSCwNoslcIt?=
 =?us-ascii?Q?GRe5cML14XpAIWLy1nVLk1ViTuRZcV90PZQDd/GwRCFLGB4oQGQPMBS8aovA?=
 =?us-ascii?Q?+W2VHJog1+zBzlE+oNhjLLQEuKw/ZUh1Cmeakj5pJXNh7Lk0R6ZkuO7xPvxv?=
 =?us-ascii?Q?U8duSUxxck3i/UM0NT9+OQrbbSU0aI7tCBIPyR6sN/nRzIN+JbJIIaXS8BBr?=
 =?us-ascii?Q?H4kSS9pIM+TQLKS9Qb75Hkw98+waj8kXfRcImb3rWZA71fSZ39q6QbBWLMpW?=
 =?us-ascii?Q?0fFSGIf3u99XuDPdvqoPChgwrvn7QEPT4eZoFwLHxEX1FHLk5t2fYWm/4pfE?=
 =?us-ascii?Q?Arp96T6CWkKqR8Qev/GqaNA1KAODQl3RmnB4xwxBmK8B3SqLI3rZdMVfZMYN?=
 =?us-ascii?Q?RxWLrCYtENwiOfOBne/ii7OegJHGMsKjLVXq3RhiTLwx3YqVAWAJ0P7QtvKz?=
 =?us-ascii?Q?1LwFcu3lr+MTIEWldNu7NnIMG1NPbB/ouJkHAOziskayfdU1K+tjJxfSfL8F?=
 =?us-ascii?Q?lnIlTj8Lsfw516pw2qLhFzp3n32KKowvtCipvUQqvvEnvdrvUvNUOlzco0EL?=
 =?us-ascii?Q?SIyWDwK8hEGFAfNEKlL13rZ/b+hVUIWWbrBUz3C03czY4IqYRKaG+aWvNTsC?=
 =?us-ascii?Q?u3cN392QTKmHh6B4uU/s8z0EHkN0JAtH+l4OSr5Vamu1TTCL76UvGQR2JCs+?=
 =?us-ascii?Q?XN+CeEBa9SB4cYKrR1TYLfBjQ72RiEABPMluZ9AG2AbgNLWMV5xZFpyUYtPN?=
 =?us-ascii?Q?Oel903CP8EiUdXeX09LdiVkM2GslH9P3h04TV8ngn7lSVm9AxGNG/XnLRERv?=
 =?us-ascii?Q?ekbAPkTS8ORm8jBLZGFzpr7/0zcACq7fdgP9cJaufnxZ8I246wU+lY8UNnO6?=
 =?us-ascii?Q?BH0mhmnEGaZyptI1a2yEfzj+7t+duCZlQbRu24MZ52Ukh0k6X8yKqZgx8l7i?=
 =?us-ascii?Q?iLzKZhqMnwAWxL2XIarT/YuzSahJWxIaLGBjoYJ8KH1JTgGm9JhJRJkf3IhS?=
 =?us-ascii?Q?0NiQ7f68wLyktVn+wlrZNpVsiUyGielxgEeALiS4ccbQvEh2Sz5d4vLV65Hn?=
 =?us-ascii?Q?vzC71k2vZsz9yhPJOb1JqbqlYcaoqmUFAdk2fQPvWBgrZOLYt6BQw2pQDuEG?=
 =?us-ascii?Q?/wksBujOjZxSkPubG2UgYgam4lLp42w6rVpMtOQq8DU8kZzcNmdkm6j5outB?=
 =?us-ascii?Q?ddzAf4kBTc8FwMWxSggGWzCsdqPwlJgqkuKYTTKOESpl6+7Hpu/J+MH7wQY1?=
 =?us-ascii?Q?6qI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(366007)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SoSNV4yo8xib9z0GUSkJpDoL/nitnRH2XMTGB2bN83jXp538QS3fA5/lAKnR?=
 =?us-ascii?Q?I1m1fxat+vKnaVqveQgMlgvIQJ93yZdWK5dlecGL8P7l6HwZeorawlIC5bIA?=
 =?us-ascii?Q?n2COw8TsTlCwjjT+txG+C8E0xmcK9bWiJMCoFCHVp9ja+8YCg+kGBU/umEq9?=
 =?us-ascii?Q?oeMLLiGOV3n8AtLt44ufZJNSMyjXugIZnQh7Si9T7ikgXZEnRR2a1By52dvi?=
 =?us-ascii?Q?c9Fus/lCNCeLV2UnvEotHGJqwAXIfucaEOFfw1HzVLF2ljL2jsxQ9ztHqeXT?=
 =?us-ascii?Q?yS8J82XiyVludDlIGee/35kCzV6d1+z/PCRw7uZENYiGg70ohDgpL309PlZE?=
 =?us-ascii?Q?79W7cVqcYxfG2KYhzRo/eiDVkBb6vevUfQ0HLnfbhxnqHp7QNCQBSrfEOn1C?=
 =?us-ascii?Q?ffeFI/TD+btReYiy/Awrs9t47kPL8nMfgP3FCYPgJdq7dDBMVGoRJyjvwlcS?=
 =?us-ascii?Q?e/kYpfZv7FDxmi/rSQHjiE3EY6SroZ8GHyKXWLotoCdTRkFnk3clCtbcrYFY?=
 =?us-ascii?Q?61ZKiPt8SPtDmou7PClXXSPaQV2x7qjAr/b351FSWSuu5+hhzDDI8JOQOSJ4?=
 =?us-ascii?Q?U/tzRv6+/dTDvH1d7MJ3U6coOl4/+fqJq6YvKtSiqF0pOPql34a6U7Z7Z0SQ?=
 =?us-ascii?Q?fxTAqpzTg/6FlYisTL6BmXk6Z7FqKGl7agQTtw91xx9OHUNImsNva04vSrrE?=
 =?us-ascii?Q?zToP6lgvN4fAVf1NEpFBK2ddqh5izbLm9Ck1tW+wUKXr+pjv+MjpDnCK4HKB?=
 =?us-ascii?Q?nJOE1Qc2mzYH+Z7MTCoVwTgjLnMyD+I7vI2Pqr9Yy0VKcMErdXxQFu8wS8fc?=
 =?us-ascii?Q?rvrgJ5wR6YAjMBcGS4STWfYTmcfeEl0gOZrvoYPqrzCZYVrGAHwtNa5k02mh?=
 =?us-ascii?Q?J6B5AgYH0gUi8+ynDGHSD4rXitJyBD2dX9aX67MBllHT3R8Ywspm49k9kKcL?=
 =?us-ascii?Q?gXsECdLGmVMC8c21uA8ZHYiG/2NqwH3Ae7Y47cHs1c359x9jNLGiyCRe+6oA?=
 =?us-ascii?Q?pfh5KMeJ1C80upIY89IZ6w8bk3tqyQT+0PvUC7sHKu9zi6C4qdLO1YbiU3GC?=
 =?us-ascii?Q?20/aSYsPmsVRag6EzvY2En7/CdomG6pE6gKcOaV0vZBfpeU5FchH9phTtvPl?=
 =?us-ascii?Q?ptuSaO+qNcRKCzPF4gC1/9wGpgSmNSc3BaONQQOSDh9AiPtVqp8iztPCuwup?=
 =?us-ascii?Q?RBCPPSK7XGVJgmJrrzL3rJ1T/SllfZcrKMQX4BnwFCX+ESQTV+NDDL6zlGYj?=
 =?us-ascii?Q?vo+eGPN6+ylMT2N9broROWQNlrxatqTPITmPXoxIwCG2BYkuuUa5N1k3VnGT?=
 =?us-ascii?Q?v1oZtoWygTHqm4eilEGCYKsNA0YuVAJdguBnhUQ6HmVUD/t2eK6r6VugtkxX?=
 =?us-ascii?Q?FuJJ4vy1GZZprFkh3i6a9QjFDutzyCJ3LfhkfGchffyVpMDmkDL9IGnmGBO6?=
 =?us-ascii?Q?oljHv+iUsoaKe6meFR5eEUJBOzhxVFjUs6irXq2gh1cm3fV6JMO+VnHLt4s/?=
 =?us-ascii?Q?/XYai2mQEIt5MdN7PlGL+obcSP0rNMEVq8EWoMII2m1YCdM7ua0WmW3KTgZv?=
 =?us-ascii?Q?RUaPGdg2B4NnOnILIDcHIzhd4Id1TA8kWstQJMtIVyHuzU0/5xlmcop9uwb1?=
 =?us-ascii?Q?qc6FIMwusZFvKDd3QavXTLQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9fcfb738-b756-45ae-9dba-08dc72e3ff5c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 00:31:14.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KpmqXwq7mh7CwzCKLWB906ziUlONGJLUcSGsvxTK8Ipj1Tk5rnu++LmpOVGG19ioXs4PVmsYdfub1/YOsj9kfwAdEEVR40OquFVM30I/Hg/sPoC5rwN/pQrdRMMGUUjx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7383
Message-ID-Hash: APT65WJEXOPEZRSFZ2LZZULLZHL4X554
X-Message-ID-Hash: APT65WJEXOPEZRSFZ2LZZULLZHL4X554
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APT65WJEXOPEZRSFZ2LZZULLZHL4X554/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

And because of its history, DPCM has been checking CPU side only. But it should
check Codec side too same as non-DPCM. Some device/driver has been bypassed
this check. It should be error. [2/3] patch indicates warning in such case.

Because dpcm_xxx flag is no longer used by [1/3] patch, 
snd_soc_dai_link_set_capabilities() is no longer needed. [3/3] patch remove it.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be error,
but maybe v6.11 or v6.12 ?
Please check each driver by that time.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com

v1 -> v2
	- tidyup Codec check warning output condition

Kuninori Morimoto (3):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
  ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
  ASoC: remove snd_soc_dai_link_set_capabilities()

 include/sound/soc-dai.h               |   1 -
 include/sound/soc.h                   |   1 +
 sound/soc/fsl/imx-card.c              |   3 -
 sound/soc/generic/audio-graph-card.c  |   2 -
 sound/soc/generic/audio-graph-card2.c |   2 -
 sound/soc/generic/simple-card.c       |   2 -
 sound/soc/meson/axg-card.c            |   1 -
 sound/soc/meson/gx-card.c             |   1 -
 sound/soc/qcom/common.c               |   1 -
 sound/soc/soc-dai.c                   |  38 ---------
 sound/soc/soc-pcm.c                   | 110 +++++++++++++++++++-------
 11 files changed, 81 insertions(+), 81 deletions(-)

-- 
2.25.1

