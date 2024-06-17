Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F10B90A0FB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 02:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDF0DF9;
	Mon, 17 Jun 2024 02:51:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDF0DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718585507;
	bh=6aj6ftvEyM+QX86BCIKNrBpdZ4qJfr84LPMnjKkgfa4=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MayCN9WoYgBHp5gb/DVhkFKnI91zReiIC4pG/JkUnYK3aMMQDqAlSjKrdDQkY8eld
	 iRWGE+OknuvzMyWMHI7Pr7UCdhhadt75YyaP1WPnyUpEPQ7SOrgDZ6XbwUq802ndrX
	 SikyXosi4TlJ33jjUxNUNwP6JtdDkOb05ks6h1Vc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DABFF805AA; Mon, 17 Jun 2024 02:51:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFCAF805AA;
	Mon, 17 Jun 2024 02:51:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED4D3F8023A; Mon, 17 Jun 2024 02:50:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A4F1F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 02:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A4F1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DazmoOka
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWzix24EX3jQPApZsU4R/W6cy/dGC4UAZagdCG7rHGy/jEMADmWIprIcJJvua3e1HpfsNxNJepWC394c4gTmVJek4xc0SaaYgaM98c5pJG0ixppA8MHlvG202SO3x46u1pOhxPduRu+vScwIXYhss3n12ANtjzjNYk2o6l2rv8oxXS3FV7qua6/L6j7Bm+Tf8/nXUeoKLPASw3jXaY8NYKk/xAEr2WTdEHg+uZIEncO/y85OylguuGZ+sM+CX95XMpt/D2TjMyDXkC/YawHc9YSnW2HxRTG5NhHXiBf0axEGKsMunYUGpOTf34c3TRIbyaXPyTf88NX22qhCGqYnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfVi9p6v0uqFbrpv0FnowW+foZvJuzIlp0nmBSjkEzU=;
 b=nbj2Ws9sP3pnAYWz62FlxBCmTswE9i8VkuEGVDxTBb4oR1hBoxdJH4kUFUHsZMs2ofaq/emSnNaWUgDYE5TPwQoUq2EWNd9iTRqiMnK1kECEI/GNwMNNojS9GiwPffziU8G8pgBkDdZrpqJJW98Ahoglx3HlUfA0+s1lKQhKHJpgbW0gfiroczwstWikSPfbSqf3dVv+vYBTMfR4fxlyHUMbwcfZQXKdiJlsrlLwzhW7blNVdc1l/4hoWQ08lH31MoEGnceu02TbOJYnOvLQrWV+sjPKa091T0T6c6TdLYXNLiAHJLpJxTAu5l3q/E6xbIu6L220sHtLcS6hnji2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfVi9p6v0uqFbrpv0FnowW+foZvJuzIlp0nmBSjkEzU=;
 b=DazmoOkaPbh4vMz4GlMGK+5nhi9dWfoLZdvSAEWwI7ELPbzszoIIwYPhzV9oOD2mpE92GwRTR7J3hUG+ptR/GjOj4nsVfxQ5NwepIOC7V1NasK+GJ+EYWzLYOkozaGqESNH9/Shb08NnRHAH8BLJDqgirRMAgwj8W5zKH8DQukM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12387.jpnprd01.prod.outlook.com
 (2603:1096:405:f9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:50:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:50:07 +0000
Message-ID: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v5 resend 0/4] ASoC: grace time for DPCM cleanup
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:50:06 +0000
X-ClientProxiedBy: TYBP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12387:EE_
X-MS-Office365-Filtering-Correlation-Id: bae69a42-38d0-422e-52bc-08dc8e676e9f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/TvRc+lKNhlrTGsF6gernk5AxNDq64C+xCEDz2BvwU/8dIE+09OR3HYnq55u?=
 =?us-ascii?Q?cpidy1PF6IX2Y7vanJL7+o+z37sL/JRdauHu89CtNGbsaJLx/M8AqyMwliYs?=
 =?us-ascii?Q?ajdAIhDHdOucGNxnNEaceApmPc0eYLrtcNe8fzGkXBT+AclYf7uqGCyrGSZI?=
 =?us-ascii?Q?bBlQ8220btjCaqAszODeZ3ojztFyK7nNcUyM8CocLm0Rr2kl3EH+1W8hdLNy?=
 =?us-ascii?Q?HrTHBVGV+Gps77zVRjElosjxYrW/wNwNXbCPNbSIS+5IlwQ17huqmehCcB5T?=
 =?us-ascii?Q?iZqplUy82603xvGT3h117kqKvgSGyfc3qo9JTdVNUROACGb6fVvXp/DAvOOW?=
 =?us-ascii?Q?kf8Jrj1WWLf5IuQoRFMnnOSBJILPn+Alpmc0jNXDCRcSPLsUKLcr33qmpoWo?=
 =?us-ascii?Q?CG1/JQ9y4h0MPJWiwxPPSmzrYqLZzsApRhdYFXAEIUL3vikK+XCqwHybNUrM?=
 =?us-ascii?Q?ywPRGMEmQuQvcwPUiee9ypaRUN5UdFE7IY7qOeFf+iOSqfIi2vlIen1bUqYf?=
 =?us-ascii?Q?gkyf2DnF48+OQOHDsAzVl7DZ3FobGDsdv+EKOJSYatQs6YN8Bb/etme/8sm6?=
 =?us-ascii?Q?Ga8r5NA7V6jvnSNNjq9PCPPP+9xjqiJxo3gDRJj18AzfPWqjle/yUwS62aS5?=
 =?us-ascii?Q?18Ayoljj/D9H/8EbJXgwYBli4DBEDiGWFeJYAZqVNdF9yGOjxeaNtfpU8qBW?=
 =?us-ascii?Q?vIER8v4Yz2oObEtM/wZ6gcwtI90XH2VQOAs5ELiC2pkDc5wcXkmRyI1Li/Ur?=
 =?us-ascii?Q?jns329go1SHFyT+IOJxl/nhjNSwjjK+aQM6ZjtsO05c0O0yRZK0FjOo9Or0t?=
 =?us-ascii?Q?/vgLsKd7io4LudrqdwmdCUSF6qx3jJRvPGJV1QoqrM7EmcQdMudXMiyrKjSq?=
 =?us-ascii?Q?l/Bw+1LLwSKk8SfNCacBs8YC2z8v4p/heec/3uE38LoYB75OByEZ3L344fim?=
 =?us-ascii?Q?U2tQqSJSu/tsScpp9p6mzySceYZwgEpTcHeslDyCXNKQ371Flluv5WAKmnTh?=
 =?us-ascii?Q?4VRy8C0x9KvOQ1F1idLmiewpp2C1ByDjOooDZmYHS8WvlOkPVCC1sQs6m8fp?=
 =?us-ascii?Q?DL7jKSUUbP2ExIyXHVt2zh2eh8Umk7+gbLQ2qFwVghugf+j+8vLI0w1sGylT?=
 =?us-ascii?Q?MS4ZIIg7AQC8ZAryBXXZFKlqRE1LvFbDcaLNunZ6cb1JHawXIQdyqFQjeIt7?=
 =?us-ascii?Q?clM3pfyMn4VYo6hImxQzJVCDl5nt6DUus6wEeamLGulpt9I2BOFvzCsXG7DD?=
 =?us-ascii?Q?QKpCBa1byBW48Ly3io6rwJfSVkYlX6asCrWaq37hI9pGTqxLMMd9f/pZ/f9T?=
 =?us-ascii?Q?H0vqw4CCbZ29oGc+OKCooj6PHz1VuzqcnBmbHxwKlo9dnA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gmqLCQmCysHDfkyxSmi/ith1osJsBo4KzQf72AhR3BpE7fdBBI7K5kpQL7iz?=
 =?us-ascii?Q?x00R9ynQG/7Z8ssiz6KHagVZqQ6pfzIiJKXhJDK5M9srXkLNB8Tb9sgRyiVf?=
 =?us-ascii?Q?qfAfpehMiS9ZOEzHcZ1F5i2JL94TfwBcvYo5nV9EQ1C2RXnxN7DRSHcpEvm9?=
 =?us-ascii?Q?/GcySjjNLIpxovVnJR2OySOcddqUYtJHVN6zuwB346bWxq2AdKYoi6m2JMnp?=
 =?us-ascii?Q?Udwmy5UJFsbnU+sQdYooLV0tLSnmgNy2fNnnl4kKCsD2XFU0InDekHE/Vx2c?=
 =?us-ascii?Q?wlIkFG3n/otSwI3JiahYtRBMObsAyVr1keNd1WugrGEVWq8/011krCgJaPgg?=
 =?us-ascii?Q?QR49eX2aZWZccEFhyq7as4juFi5DCYmXCh46c9BR43XUOUQGu7EXqq5O+DRr?=
 =?us-ascii?Q?MpkjUj87GTxQ2adg+FRAhmVS28mFMG50iipmYAGLKssL+US+mV/5vwR07rqE?=
 =?us-ascii?Q?JC+U+gpQH2ruQ1KhbKjRr2T6DExCtacMDfmzdJaucwqar6H0A6aGGyhVI/pJ?=
 =?us-ascii?Q?0cZuioXG/4lH/DPaf5oPtlONyGJNP6iBPG1qa1P/NNJ4yi+xF/5BzqZk7idY?=
 =?us-ascii?Q?R/SWy0Pb2hE2nlg3wCBjFpxy3rxDeAFPetEpY5LXyAXF5ulDxlnpsOicHPui?=
 =?us-ascii?Q?3vg6BBmWHnh+BqZnYc3ftASNhZY4KRA49b8KUhGxMOUE5WtnuCvn49BUElv+?=
 =?us-ascii?Q?WLPRKKDt4pSBBkYT8RYzJLzwtSvjvu9pexq8kYiD9stGlNKDQ88PUvKNIiGl?=
 =?us-ascii?Q?exBeH38ct8ghxmrfUwuG31GPcyuH/jAIpTgLF28QCRPYC1m27wMTHPG5e4BX?=
 =?us-ascii?Q?nrjAjWfe3Yd+Ypn+mWa4/V5aC3VuiFI4aF/Wk1nlKDyMiA4UbRb+9Esxrxks?=
 =?us-ascii?Q?2JuVsEw6frT1vlvz9yD1lYxszrrX8nhRPnoD6ZbZYb4RaysggxT+l+luB0wG?=
 =?us-ascii?Q?8ajHbDW81nhe/fWVZWTYowCWQ8Z9r3zhs2WjAOege2sit/w6bTdi1rhekINI?=
 =?us-ascii?Q?cQ7RItRHD2Lh9HTUJytWqi52Yf8zhVv3dUzmka+7x/3gKp2CV7yWU9z1aAXq?=
 =?us-ascii?Q?B+wvTYgG5aR/Q/BghMy/sfo5ScdCWdtqr9pqcpAk+0MZHkdvsN4InxSzcYIW?=
 =?us-ascii?Q?lb3eqqTccpqaS8Vs/GsXhhz2omSw17h/ydPfLzHTCrIe5pG/tcvtTpEbZFbo?=
 =?us-ascii?Q?KHlSCxwTp9G/VcDG3zMzt6GEmS1CPSexgQjhuC2ZzZY91aDGq2jBVrHpDLJP?=
 =?us-ascii?Q?yMNOd7MiF9pEeaSOXu4Bj6+LNUaPmkQaKbI4xU/PtcapzF1aq1LcngRv69Q2?=
 =?us-ascii?Q?8nHXwZ7KpWZy68Mk5b9LShZ0hAH+y0O27JHccGcz2WpeLwQNhwcmvk9eRhcH?=
 =?us-ascii?Q?R8pLl+fLmFJQyhZ5ZRAUsOepXJX9PfuZkLi7PLfQ3JtgM0zr+dFS+/vXaZ6B?=
 =?us-ascii?Q?L+VAjV47A+kRApH3QDRwIUa6dW1YfCIvYa9Q69RqUpXrxLsXFx2wKV6zBXvu?=
 =?us-ascii?Q?C7LnyiGlZJf9saIWddDsKnkqxxfStsL5UyMdW+hPMoyps5KOW850DpYihsNR?=
 =?us-ascii?Q?OEvuZle6aR67nMiGBcwfHYDE8hhNb9qidri5EK2nYYjJ+b8lHOttcO23a6RX?=
 =?us-ascii?Q?6AMpf9geqGiT+dDWIhyzlbU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bae69a42-38d0-422e-52bc-08dc8e676e9f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:50:06.9826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OfzgcXci+zzCUabrcQhHatLMzTETGgTR/qw4Yb0+boNk2FEZjMJLpcKI85Cd84n3+ExGXTIQRkN1tGJXQdjXT8OPcCbT9WYXAo0h4KI+Ew9BuR/8eItTSIoQaPJf1rmE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12387
Message-ID-Hash: GJXTHGRFDPSWNLVOPNBVD65ABQIZCWHV
X-Message-ID-Hash: GJXTHGRFDPSWNLVOPNBVD65ABQIZCWHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJXTHGRFDPSWNLVOPNBVD65ABQIZCWHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

2 weeks past. This is resend of v5 of DPCM cleanup

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be
error, but maybe v6.11 or v6.12 ?
Please check each driver by that time.

Previous patch-set try to check both CPU and Codec in DPCM, but we noticed
that there are some special DAI which we can't handle today [2]. So I will
escape it in this patch-set.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
[2] https://lore.kernel.org/all/3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com/

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87msole5wc.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/871q5tnuok.wl-kuninori.morimoto.gx@renesas.com

v4 -> v5
	- typo fix: limition -> limitation
	- typo fix: catpure  -> capture
	- include Intel patch

v3 -> v4
	- don't check Codec on DPCM
	- include Jerome's dpcm_xxx update patch

v2 -> v3
	- tidyup typo (reuqsts -> requests)
	- add Tested-by on git-log

v1 -> v2
	- tidyup Codec check warning output condition


Jerome Brunet (1):
  ASoC: amlogic: do not use dpcm_playback/capture flags

Kuninori Morimoto (2):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for
    availability limition
  ASoC: remove snd_soc_dai_link_set_capabilities()

Pierre-Louis Bossart (1):
  ASoC: Intel: sof_sdw: use playback/capture_only flags

 include/sound/soc-dai.h               |  1 -
 include/sound/soc.h                   |  1 +
 sound/soc/fsl/imx-card.c              |  3 --
 sound/soc/generic/audio-graph-card.c  |  2 -
 sound/soc/generic/audio-graph-card2.c |  2 -
 sound/soc/generic/simple-card.c       |  2 -
 sound/soc/intel/boards/sof_sdw.c      |  4 +-
 sound/soc/meson/axg-card.c            | 11 +++--
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/meson/meson-card-utils.c    |  4 +-
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ----------------
 sound/soc/soc-pcm.c                   | 65 +++++++++++++++------------
 13 files changed, 47 insertions(+), 88 deletions(-)

-- 
2.43.0

