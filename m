Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A08E87079C7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 524C71FE;
	Thu, 18 May 2023 07:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 524C71FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388877;
	bh=SlrVIsKyhZ9xYDs+7b8aGVVyCYCIY8dYvu/BKv7cxto=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=j0BSLq8pBsC8Snb4R71wsshtdOrXTceXWQJepoMt+G8C5xlfuZe8NP1GjhZHUE3Qp
	 crGx1HitsdKbQusZfDpEjMy0nftg0TrqsLRjiqeLP1Phb7Dx37iBSDkjC/df0NHR2q
	 GJ7Du6IU8qAJJ48gx1obJhRrlWynbkXDEpmtBGO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96715F80551; Thu, 18 May 2023 07:46:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D8E6F802E8;
	Thu, 18 May 2023 07:46:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DE00F80272; Thu, 18 May 2023 07:46:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC9C4F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC9C4F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QyPAgiyD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxwbA8kj8wXWRPy3jQyN1POJEeUdmL+RNivfZ+damjkKs3Hg+D3/OaWh1C9YHpU1KB0wa4UClWpQYWeq9LkLdPv649rbcEmAvjojmCXin+V7qWpVhZjESAvfNZ22RAGp1UOQ7Wv5khd84phKOP1EUJKHPOoYZ+9zhH0h5sHsUiraV7hxnuOb53bo8JE2vYkGTEVhMmyud4roXVGVNnzix2IRhnsaEje6BjZPekjM1Dl36rHeTwc7gkgkNkEUoFQ57sgIe8iRn7U80Ya85LYl+U0V6wSE1aUM8ilRwAZW9MZoBDSKHOdDpKStqRc7UagoVyMaWCp+PUy2FefI4IYokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W28jMmyrQeC0uF25tt9MzSfQnqbpqcdJ9QcLJurQbw=;
 b=AAyALR2L87IyU9zGyBhwDBGQNFDYfVWJMizNCPEuFEArMduV0/uRAQLdCLWbjaiV/ykL41WbWTA6R9N2AaKO/54ugziZskwHmXw+QFW7J0P1MxLS84+2cYpgrf/dpc1wgqlO/VV8RgIKZld2Aw/KktOVdC7iGAWrc9BiBLrR+QjOnUHTvhDKiEg14+X1/87ovOGtdSghaC4bAakYynxQakPQXrSlTK5NO3CIwM8bc6rnTat07g1lSWcdwOE98pkqtBEcbx9d+SV8NV2V3xcw/GrHnCxDngHkLVq6onq8gXH6nhjddlqea/1l8g1nlXjwLSM4PxWNm+Hs9y4EAKZYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W28jMmyrQeC0uF25tt9MzSfQnqbpqcdJ9QcLJurQbw=;
 b=QyPAgiyDwYDiZZ8waydVE3+L2eqJlACWfBTQfL+/JJATBXfG+HD9Hhiis5M1OqaedPQNF+iJ7xSC1S+49sZz72lHIpmdKDEsTKq55C4lg4TRPSs34O+AaddpSkfbCljbQdGU5mDSe2rwgkycI2UwW7Z/vhpfJcZ+i9ygN55JYj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10472.jpnprd01.prod.outlook.com (2603:1096:400:2f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:46:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:46:18 +0000
Message-ID: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22N=C3=ADcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, "chunxu.li" <chunxu.li@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>, Jaroslav
 Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Lucas Tanure <lucas.tanure@collabora.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>, Wang Yufen
 <wangyufen@huawei.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH 00/20] ASoC: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:46:18 +0000
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10472:EE_
X-MS-Office365-Filtering-Correlation-Id: b56117fe-69c2-4970-b4d4-08db576333d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O1sW6jZA9pfXKUmCdskhi0bjlpAfGKMsZCtCwxj/YdNGbEXDeWIUuU2kZXbCWE1KYathBZze9ix1Bf4bmiiTAYHbyoH0SKMjVScDImpN3ByIMScRgBCLL6sc8nwJNhqm2h1VyjYmtKteO0k39CGRx5N1AEBmmXDis1KminEPls5ywcuSUDauFt/8Ak45rcF5AtBCoqDVEGOX6o7DBsTWAbuaVWz/mAN3S0brUVfWxbTrRZUdr9FJDvE8aGAEuFNMUFNjyb5He7fxmB/s+gMUhjzxdKwdTUsvQSIUKgonZq92IwIaH6WukLF0xwjekryLUeDPCNVuyv5jsK8kup2fJFOtt9yjb5Sv/0PM3pg0daJkN2w0R0lKH7IAKzFp+sEZc1StdnP2w5H00vfT4kUCNzuCwFREW55Tu9kDta6IAZIVHlGG+wE6ATrO529FrbYunVy3w1xr7TwQPdgaFHyTeNwV4XVF1W5OhPL/lpDS84pOWUfIibEGwSpoUnu+622K3K9qKUU4JEe/ySEF8GMc3g63qrrYYVAI/jJ1J7dmaWLKEACKAMUFMcnmcqWr5xWQzhA5+X+PE3ehBmDTNDkhjNvr/uPccdHuwiW6+TkSOxrEjxScN/u1tm6UX2vDz1C1voP5mBlpgG53hZs7G/gaZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(6486002)(52116002)(19627235002)(110136005)(66556008)(316002)(66476007)(4326008)(66946007)(478600001)(54906003)(2616005)(36756003)(6506007)(26005)(186003)(6512007)(5660300002)(8676002)(7406005)(7416002)(8936002)(41300700001)(2906002)(921005)(38350700002)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2D/sQCQOrzjI2Me4xvzXD/tumVT+F3KFc1Q4Xxc8kOfPJk9W4zKblDRRHBea?=
 =?us-ascii?Q?jz/5unxycDtS6shajFwZZHMP+y4cz4dbNsCqhkqoVrni+5Gvj6IXiyntOOOW?=
 =?us-ascii?Q?+1Me3uUI5XqEvT6mMlujwXcLDGF83R87T82wIDbEK0GjyYr9jsuG4QHMShRJ?=
 =?us-ascii?Q?7F4ofmoJmeRiBPVadmKRIjeMN/QCaltcYk2SDCDqt+uheE2hud4yBWGK8Mvq?=
 =?us-ascii?Q?i8sDalQ+RrjCqXTYrsp078SothpVpp8dF3deubr1twNsvsHHGxyFi24nmi9i?=
 =?us-ascii?Q?hnZP7tekGVN0Ovi8mM8P3rD74Mnxv31JiM63eyQEVlmF0WoC7pQxUkmpWPiH?=
 =?us-ascii?Q?mdnxQiF1/ABBumqikiOP44SNiPBqdAVBhgbFIUQyd4Hnxd4YK0i00Sd2JWcH?=
 =?us-ascii?Q?hA2Ef2HRn4uynbrx3yTgyV5hM5ZoxvXJF97Z8001VB1imllSL2kJu12I+n64?=
 =?us-ascii?Q?Nk5jGwoWcC+DyzmVADLbucxs1awPkF2OJMP7R+YobtvqXs9UlID+3ZyAz1IG?=
 =?us-ascii?Q?qYeuAQp7w0MXeQoOINgUC7jvADrXbqAHN1SPilTJmlXWSHwXnnmJTVMPcrCw?=
 =?us-ascii?Q?5X1gsB1VxEBTbxulNeiJYvTxBnFxVfBaI0IPD6xyWYQ+qwnGF8tnz7WsHQ7K?=
 =?us-ascii?Q?1btheyOmA9JNiJDsYMinI0YtZsq6puT8HABGeGluvWDEJdStj+Fog9YC9DFa?=
 =?us-ascii?Q?+HVDDPTAnzrl8pRdLsOOri6EHGuxCV//DSOuDANYWqhvnu+4eD74XkUzwqYt?=
 =?us-ascii?Q?RQdOssSAk+RsVMjYgcraM7KnKmLUXh4h1i9nyNRQfXZD/pDmg52lFW7utZLH?=
 =?us-ascii?Q?3zERa6axxcwQMulhhwzrJRXrhS0691Q/gyTaoo90o+PiZ3T5vjwDLlC9hAtv?=
 =?us-ascii?Q?eUq1qGDNMS1VSNJeKNK3C6cRxzITwBnBnaP54lHMnoIQZalEQSHmt6GvYL7m?=
 =?us-ascii?Q?jF5D2nValHPmb11q6OIUzVXjkMGgWshx+M06n8e6BK9enq8VgeqQF94IsEon?=
 =?us-ascii?Q?sXlZz/iaBFpjdMWwSSQo+9ehfRd2hFG6UFzfd89LA/uyPobROKeoFcAaembu?=
 =?us-ascii?Q?dsPwZ9gnYZrwEsoyzSVHZraNWIkk+0qwUM35AMRe1zzOPvx8aDor/d2yDFxM?=
 =?us-ascii?Q?pHAJ8y64MRZGcsjMBKKH+5bgsNmqGK4CPUV4yqM0+XGpQ96duzrscLRfW6UC?=
 =?us-ascii?Q?Ep43fk9NPGAB8Z1KAT6iM/v0VXUDMrIy6rmgNrs+nQluyloFmHytp39HkKQi?=
 =?us-ascii?Q?aKHyIbwmiG71fcMRnEng3pM9rojSN1BAt2SASkNXsBKHYm/2bQYn2fqpFqrQ?=
 =?us-ascii?Q?/6Hc7JMM21IpWxXRM/D/qY/KrXXCH/NucqEY0mvnk9/zkCdVofdjIdS6wLDp?=
 =?us-ascii?Q?fJtNEEjwz47kJwz5+bObc+JZrJXSDLXSTfmcem+fHtpbR2TOZYSzJouCSArk?=
 =?us-ascii?Q?ZA3APSVdKi5KSJ//NJMWrIIgeS03u7XCDmGkoC5wmFleyf1utkSSpLXyCSRJ?=
 =?us-ascii?Q?Zwr6AavNguTeMoVm3l7LClAWJjqz9TNjHeDES8RX3pGLdvZfWTwe7Aq5xer5?=
 =?us-ascii?Q?tcp1UxUdCF0BkPIoNkZe/kEj+TSHUsYmPY6cy6iAkbI3/HV4wvdL5YyVLZPF?=
 =?us-ascii?Q?X5+pWU8GeG64QSWBaa/zEM4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b56117fe-69c2-4970-b4d4-08db576333d6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:46:18.7340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v5DCWj4rkIgoevul8hFQELkEu9S0ASJVKPNbhcDE1rR1iGQgn2N45Ee63tkd1guwh62epwjLHuP0yVQUg5SQCtMjzRV8S/CMuZGZ32i+z8Na+kJBDgUJf/z3Ps+WYkeL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10472
Message-ID-Hash: X5IG5F7A3BEPTJTYUFIQJQWALTAFML5W
X-Message-ID-Hash: X5IG5F7A3BEPTJTYUFIQJQWALTAFML5W
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5IG5F7A3BEPTJTYUFIQJQWALTAFML5W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark

Current ASoC can use DPCM, and we need to set dpcm_playback/capture to use it.
OTOH, we are using playback/capture_only flag on Normal/Codec2Codec case.
I think it is very duplicated, we can share same rules for all cases.

This patch-set cleanup these.
 1 -  7 : cleanup functions.
 8      : main patch
 9 - 19 : replace flags on each drivers
 20     : remove old flags

Kuninori Morimoto (20):
 1   ASoC: soc-pcm.c: indicate error if stream has no playback no capture
 2   ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
 3   ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
 4   ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
 5   ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()
 6   ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part1
 7   ASoC: soc-pcm.c: cleanup normal connection loop at soc_get_playback_capture() part2
 8   ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
 9   ASoC: amd: replace dpcm_playback/capture to playback/capture_only
10   ASoC: fsl: replace dpcm_playback/capture to playback/capture_only
11   ASoC: sof: replace dpcm_playback/capture to playback/capture_only
12   ASoC: meson: replace dpcm_playback/capture to playback/capture_only
13   ASoC: Intel: replace dpcm_playback/capture to playback/capture_only
14   ASoC: samsung: replace dpcm_playback/capture to playback/capture_only
15   ASoC: mediatek: replace dpcm_playback/capture to playback/capture_only
16   ASoC: soc-dai.c: replace dpcm_playback/capture to playback/capture_only
17   ASoC: soc-core.c: replace dpcm_playback/capture to playback/capture_only
18   ASoC: soc-topology.c: replace dpcm_playback/capture to playback/capture_only
19   ASoC: soc-compress.c: replace dpcm_playback/capture to playback/capture_only
20   ASoC: soc-pcm.c: remove dpcm_playback/capture

 include/sound/soc.h                           |   4 -
 sound/soc/amd/acp-da7219-max98357a.c          |  20 ++--
 sound/soc/amd/acp-es8336.c                    |   2 -
 sound/soc/amd/acp/acp-mach-common.c           |  20 +---
 sound/soc/amd/acp3x-rt5682-max9836.c          |   6 +-
 sound/soc/amd/vangogh/acp5x-mach.c            |   3 -
 sound/soc/fsl/fsl-asoc-card.c                 |  16 +--
 sound/soc/fsl/imx-audmix.c                    |   6 +-
 sound/soc/fsl/imx-card.c                      |   4 +-
 sound/soc/intel/avs/boards/da7219.c           |   2 -
 sound/soc/intel/avs/boards/dmic.c             |   4 +-
 sound/soc/intel/avs/boards/hdaudio.c          |   4 -
 sound/soc/intel/avs/boards/i2s_test.c         |   2 -
 sound/soc/intel/avs/boards/max98357a.c        |   2 +-
 sound/soc/intel/avs/boards/max98373.c         |   2 -
 sound/soc/intel/avs/boards/max98927.c         |   2 -
 sound/soc/intel/avs/boards/nau8825.c          |   2 -
 sound/soc/intel/avs/boards/rt274.c            |   2 -
 sound/soc/intel/avs/boards/rt286.c            |   2 -
 sound/soc/intel/avs/boards/rt298.c            |   2 -
 sound/soc/intel/avs/boards/rt5682.c           |   2 -
 sound/soc/intel/avs/boards/ssm4567.c          |   2 -
 sound/soc/intel/boards/bdw-rt5650.c           |   4 -
 sound/soc/intel/boards/bdw-rt5677.c           |   4 -
 sound/soc/intel/boards/bdw_rt286.c            |  10 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |  32 +++---
 sound/soc/intel/boards/bxt_rt298.c            |  26 ++---
 sound/soc/intel/boards/bytcht_cx2072x.c       |   6 +-
 sound/soc/intel/boards/bytcht_da7213.c        |   6 +-
 sound/soc/intel/boards/bytcht_es8316.c        |   6 +-
 sound/soc/intel/boards/bytcht_nocodec.c       |   6 +-
 sound/soc/intel/boards/bytcr_rt5640.c         |   6 +-
 sound/soc/intel/boards/bytcr_rt5651.c         |   6 +-
 sound/soc/intel/boards/bytcr_wm5102.c         |   6 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c  |   6 +-
 sound/soc/intel/boards/cht_bsw_nau8824.c      |   6 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c       |   6 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c       |   6 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c    |  14 +--
 sound/soc/intel/boards/ehl_rt5660.c           |  14 +--
 sound/soc/intel/boards/glk_rt5682_max98357a.c |  30 +++--
 sound/soc/intel/boards/hsw_rt5640.c           |  10 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c |  26 ++---
 sound/soc/intel/boards/kbl_da7219_max98927.c  |  54 ++++-----
 sound/soc/intel/boards/kbl_rt5660.c           |  18 ++-
 sound/soc/intel/boards/kbl_rt5663_max98927.c  |  44 ++++---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c |  22 ++--
 sound/soc/intel/boards/skl_hda_dsp_common.c   |  14 +--
 .../soc/intel/boards/skl_nau88l25_max98357a.c |  26 ++---
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c |  26 ++---
 sound/soc/intel/boards/skl_rt286.c            |  26 ++---
 sound/soc/intel/boards/sof_cs42l42.c          |  12 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  |  16 +--
 sound/soc/intel/boards/sof_es8336.c           |   8 +-
 sound/soc/intel/boards/sof_nau8825.c          |  12 +-
 sound/soc/intel/boards/sof_pcm512x.c          |   8 +-
 sound/soc/intel/boards/sof_rt5682.c           |  12 +-
 sound/soc/intel/boards/sof_sdw.c              |   4 +-
 sound/soc/intel/boards/sof_ssp_amp.c          |  11 +-
 sound/soc/intel/boards/sof_wm8804.c           |   2 -
 sound/soc/mediatek/mt2701/mt2701-cs42448.c    |  20 +---
 sound/soc/mediatek/mt2701/mt2701-wm8960.c     |   6 +-
 sound/soc/mediatek/mt6797/mt6797-mt6351.c     |  24 ++--
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |   6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |   6 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  10 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  10 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  34 +++---
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  34 +++---
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  86 ++++++--------
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  86 ++++++--------
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     |  48 ++++----
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  78 ++++++-------
 sound/soc/mediatek/mt8195/mt8195-mt6359.c     |  60 +++++-----
 sound/soc/meson/axg-card.c                    |   8 +-
 sound/soc/meson/meson-card-utils.c            |   4 +-
 sound/soc/samsung/odroid.c                    |  10 +-
 sound/soc/soc-compress.c                      |  11 +-
 sound/soc/soc-core.c                          |  20 +---
 sound/soc/soc-dai.c                           |   4 +-
 sound/soc/soc-pcm.c                           | 107 +++++++-----------
 sound/soc/soc-topology-test.c                 |   2 -
 sound/soc/soc-topology.c                      |   4 +-
 sound/soc/sof/nocodec.c                       |   4 -
 84 files changed, 502 insertions(+), 842 deletions(-)

-- 
2.25.1

