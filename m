Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E738D42CB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D765857;
	Thu, 30 May 2024 03:20:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D765857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032050;
	bh=2R/R23QICHuMcwSbw8H64i0DM0woqJYpwXg6mm4YtlU=;
	h=To:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NOa6i6pPA4qYXcrKmA3FOimSPXl/uDGp5+Des4cARjWQ8VNVY8tTEysFtXlGTVXJ3
	 npgR1yE4FslS1T2wX0e7O6Fbgjijg5il7cs4kcRgueutUFtLdVtlzfkePv/HAgajDh
	 x25PuhXEnMlzrQrcj59JMcsGRiXbZM6fxWRcXhcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A263F8047C; Thu, 30 May 2024 03:20:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D4A2F804FF;
	Thu, 30 May 2024 03:20:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E40F80051; Thu, 30 May 2024 03:18:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D2A5F80051
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D2A5F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UiGkng3k
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ii4ZfS/d/F+tenI32HW57+Ea5esiugOQluSylYsHjP8q8IUPKz2rkoeZFuxja/ZjyZkNIHdORsHv3MASQCQGjUDNT1jztP2yKGoz7/pj6yiJFhkNXPM+K6RbKVEk56Uj6WpVtG7kYsEjgOK6BqJfLEWQ3QivXq+ZewlfcKUv/mS9SQ9Cys0vOi31BNU6V3EvbxqsfRelwDlPb4TsqCbq3tQEig3ueSsa5ulxiCjNv0T4r8iNhsTp7NpVRirtY1vHk6/dSjVtpngjk1+nSYGePqfzLml98OEjHqEHUqaFRCe+iS2r/Jbf7YYBkVgx9QXIrNeHr1VMswD3gFyMYmtgDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQW1zvp3OZfpMaa8MJ0x3F3VC0NQa+6ynogbGcPDbx4=;
 b=ReW392dY525QSs7TV018JPfw3zXAegS6ypa+WIUIXpL3skHHXLDhkPLwmAq7Ypy7mfbrpn6xnTouu7qjeLPGMAVtSoOwy/9gvj5gyJt6MPBWlm7GTh0OQ7qT8H2MB+r43laodiiZ+ZeFqr4Ha+ShmnXY4dKKCCGasMFwbQrJKleIlQzXE4VhjioLNk3xdkcQSS/40aYWfiwK513OikGS4nLvWdfAQmts0VtiMtI1V/pJ1U9TvUBTd9MePzw3LCq+76obGqOGRn9M2KEtfjRu68efbFpkjQlyYYspfKxnSAscex9zRWoX2GraVsznHJBhzsy9xccjEFqebX2K5zmUvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQW1zvp3OZfpMaa8MJ0x3F3VC0NQa+6ynogbGcPDbx4=;
 b=UiGkng3klDLFBYWK+XgovBjoc5SNKPZR5/iVyt9lqB+UJICu5zYFHZek3CnkRJcDtwBMnT4fmJ5zJgdKwCOX0zxK66uW1+mO3oQmn1CMutT7nsZ2x/VickqTKTWnKMZDsLHw6fPTtT/DbKP2/RvbItXwbABHjvQvJtYgVsqhBZ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6933.jpnprd01.prod.outlook.com
 (2603:1096:604:12c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 30 May
 2024 01:17:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:17:39 +0000
Message-ID: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
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
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 0/4] ASoC: grace time for DPCM cleanup
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:17:39 +0000
X-ClientProxiedBy: TYCPR01CA0111.jpnprd01.prod.outlook.com
 (2603:1096:405:4::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ec79e3-4655-40f1-c52a-08dc80464c57
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|7416005|1800799015|376005|366007|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qAUxTycg5+Ftjs+7b3V6wVVzbYwsrGt03AxufdvqPkqikenjvC+UHUNJCuUw?=
 =?us-ascii?Q?IPLbU9d2m2H7RFffHtlaNyuNowOGIVPrD20qYTjbJ0dlI/NQVKoQOC29wyT2?=
 =?us-ascii?Q?rTTKx8gX2pp2rXporQi3c6ex3Jo4sx6AUzq4EBSI10L+Nm+mCjodQW9hJWjk?=
 =?us-ascii?Q?Oh2SolNRouxk9WaTxL/wmVCE2VCf7IlqDXxvWiQQIOj1ZvRgRe2eH3Cxmj8e?=
 =?us-ascii?Q?wYNFdY8BHqM8suKDjM8hOdNnkoS/FUhxQ6loAA5k0osCbHgQmfF9cX7dVkC/?=
 =?us-ascii?Q?GEMsbi+oy7xz/YmU42c/ykZGD62yw7/ykHj+gvsdrCF9dH4+b3Rwvy9ondwq?=
 =?us-ascii?Q?ev9LsXZB1Ukkd14bOvYK1JevYXoJNScHmIEXLGyA+DDWKg0gbdx1qyXlJ9dJ?=
 =?us-ascii?Q?EaNUcAJl5/+Ey/xpsQ/Yn7TzdhAw6ZD/mdGC6PQQSyYY4rxkNRpioP+LYIiz?=
 =?us-ascii?Q?2pEDliiO+qO9PN4X1R4lqJ7rvH1pPPAmClEbWkd+n74RCIrCxcZvuJl2OKC6?=
 =?us-ascii?Q?R3bDiFw4TsnjM5BNIwgxEH8VGBFM+PQf4lvvoqsOyBhinetbtHOYJklnNp0C?=
 =?us-ascii?Q?5vK22rWIhfFopdf0kZAl+5sqzVLG6IyjLpfXlR6/YZ6qbuSnNYwanMp4OPX9?=
 =?us-ascii?Q?L38zJ+F0wWutlRQjAw7+7Ayy27kXtW7YDhzU/gCwY7Zm3kamVWv9PtJEoeFR?=
 =?us-ascii?Q?mLlxTz2XUF4hqBexTgFfwFs9QgAcxtvq9RXFL21iwjYQF72TTM2FNqu5M8O7?=
 =?us-ascii?Q?ZULwz+bB4+XEm6piHP1Hgk2azknCfOEq087/8EqRJ0edLbxlcIYwmjEVKlVB?=
 =?us-ascii?Q?XJeaf3WEWfwpadjjFUn+muNB6q9x/eaQhgHLd1Vq2VJD3se4YE20/aSlRws3?=
 =?us-ascii?Q?gGzwYe6vw8+rk3ltIMUUocC1yX86t0U4NpgQMe2llxVj6K1EJxddjsv36DJu?=
 =?us-ascii?Q?/nMo8GYU8D3ywbRfo/ymcEig8z5vXuMPnIwzXJGvUJgrsL0rXAM5QfSBEqMy?=
 =?us-ascii?Q?UbaujqLuAzUoszbR0VWTVcdpEY96JFe76DwYs5F8KaDNdtKwHcqQuj62CqDU?=
 =?us-ascii?Q?4nAVxQ3MbdwfOlIjAmYoFW/DyT6Lj4EuO+4ibWwPlo60zXFT9IR7SQooYFDr?=
 =?us-ascii?Q?rHc2GO8m0Wgy/YDFeXPgDEabXVi6JovE6tIXjrziY9SL7R87/ffmAGjMldlu?=
 =?us-ascii?Q?GuyC8TlkF339XAxdIjgxHkvOmnoZ5mYdvej/i1yUDxpFLWGuZ94vpxDBEiKw?=
 =?us-ascii?Q?aVECf6HQP+HVZK3QAXPzpP1j6uKv2JVEyjjGHr0XMSLNuA/8AwzCLGBvGkzj?=
 =?us-ascii?Q?hqpIMRSkJZxeVPzpf/x8qkYa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dPU0rgCaV8QFfT24NYdmaHCFBYII8IOuzxdCkSYbhShnL2XlPzrP490qPpxa?=
 =?us-ascii?Q?2PVGBSoCbyn0ZCyF9gy6fBVS40W/8pCeaOeG31neSg3KM6sGx2bUAAZ3JAC4?=
 =?us-ascii?Q?ak8QnOnXdwPOFIQ+5+lA+Mnlk8rRJRZAM5hjAU8mnc+1uGE6tGyrJlW0MpeK?=
 =?us-ascii?Q?vsnGuFw9zbh4XGsGuIaRFU9/1LM/4Sa9zk0RnmBk2Awq3PpWmTEaSq4fWGhg?=
 =?us-ascii?Q?rSi0XnvfeBnjhG3IiPzc9sa1bNsngIhJgurW9frWiZLlE+cMb+HU64VgyX2i?=
 =?us-ascii?Q?eLOYx0HJJQsRcDgclke1EmTK4ZjUohfgNocrQWr40a5vUrHTuXqB2YAsx3V+?=
 =?us-ascii?Q?r8iMoBZb0SXIm8O0vT1VNc8J5Z0U87TjUFgIki3xLbs87EK9hGeRM53iG9XA?=
 =?us-ascii?Q?li2QNscslLeJHxVq6dnw5NHhPxS9gnRB2uJ+CjQ5ED6Qagb09eAoGL4Y+S+Q?=
 =?us-ascii?Q?gWUYkxJ0aaQLDIqHlxa8xItGTtKD9Gc2BnAvWdedlHoNiXRjUHFcEDWuP4Y7?=
 =?us-ascii?Q?yzzWwI0NtEhaopfQxDaNWdisZfXGTiWAYrZqcygHYErTeEo8b9LCv5B4jcfa?=
 =?us-ascii?Q?aIBnhMESz0JWBMe2/qKDdR9f1SPapL+QHeXsIF67IXNA6+0J/Fc1yZl4RuaP?=
 =?us-ascii?Q?2RxbNy+DtNdZx/CiwEVaBnH57uOtO/YakHr9nRE0ewXyO0BCTkXYIKPxlNgc?=
 =?us-ascii?Q?PBJeOLQ5JZziq830JwSQj4J1d3W9aWyWvpsMMSKbETtGu8pKd/BT5rko3AOw?=
 =?us-ascii?Q?jeIjDALPCmWzAkhz75fCfR9j01J2olM/QgpDi8jgTDk9Lj9Ryb52jbCOKgwP?=
 =?us-ascii?Q?SpCJCzHosFwZ3t5jBbDYA+RUT6e557blNXM/15jMvO4SsY+x0+8/kRc3v4Rz?=
 =?us-ascii?Q?9tzGTipr1J/yxynmna8dvPHjaA0+JhxDBr/qmKpiMUpMf5cdBr07Be58sEAA?=
 =?us-ascii?Q?/3btb5VVf9+C1qLNLZKxaBdOE7k15FL403g9BViwVDaBcXOKcAEwvlNAofhk?=
 =?us-ascii?Q?oTDaeVtuE6HEmxyXiPTyZTUDLcSZybcSyuNC28FyFwTpeRBebKOFvUT9xejQ?=
 =?us-ascii?Q?AFM6sgsJv5pxqFhMLoGINJnSgedIA0hTLg+79/csKD4sUxInY71HeczpPeJM?=
 =?us-ascii?Q?DzMgMrd811pw+hhH/NdVMEBk6QhF6fAfmJOfP4/OqBdZIcMtv8YKNXJq9qHw?=
 =?us-ascii?Q?Z+G2IETct2rzIiiDfW2SfqpNfBhVWhOqxeS0SCWI1rQTG9ADPGozqol3l8PL?=
 =?us-ascii?Q?R8MM9klZsBR0rUBeFJYGqIFNl6fLw/PoLqzuFzPOncVXLf1EGhcmLsiAbEO3?=
 =?us-ascii?Q?P4xzx7bfTEK9PZ6Ug+Mj3k73WXoI9UGCawNtEc1kKonNMgkgu5LjTcfScics?=
 =?us-ascii?Q?p96VMRaJoC7iPI535FvAPk9ekb2BBvmYPhzLR/7HnekDEZHEKFx7i/o4Lo3I?=
 =?us-ascii?Q?gvrLLacat7r2ve0qNSUwm6xeAMHoKvp9/zidyTjkkT3KnVQL7IhTbtRzFZNE?=
 =?us-ascii?Q?4XkxZs2EsbINWDlcgrqrhgpyTrOmWYvxOdKvMmscG/9NIHebna+iqYKoQEW5?=
 =?us-ascii?Q?DTihRXbBULKCaPzZ4s/7pokXL0pIWVR7C0wtlcj25L2Fy4pvKwZoioreOyox?=
 =?us-ascii?Q?950LWIBuFI0zBBI79Wa80VM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01ec79e3-4655-40f1-c52a-08dc80464c57
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:17:39.7877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cc/bwGdsgrnEp596cyrEQj1UcM77l8zE8NiOj8uhvAIzg43l/uf3KhObXEFPrrhHC0DQqc3K3faJjawfXbNhQTnd03SzghBxqyxtuI0CLnQDr1TxvBa6oRUTY94cexns
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6933
Message-ID-Hash: GZGUIUJOPGMDYVQJZ5G2CVIBWNMDHJIO
X-Message-ID-Hash: GZGUIUJOPGMDYVQJZ5G2CVIBWNMDHJIO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZGUIUJOPGMDYVQJZ5G2CVIBWNMDHJIO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

This is v5 of DPCM cleanup

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
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
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

