Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F089B6AA
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 06:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A7221B4;
	Mon,  8 Apr 2024 06:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A7221B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712548827;
	bh=tFjbG50Fs3tuLpy38sriM2SFr4NrgUpq7ytAAJ4XJKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r06leuqUxD0xsMomBjnPYW4XMZhp4WfyPZJd1WokhYxBpk6qO0HjfEynG7DQbJrGf
	 7xJak4OAjxVEdoycDtqIKYVlfh3o9tBurVvXNQgAPWk+L/+FjZ7uvw5W3Ad8vos/fG
	 SIkuKD7bf/lRYNdgtpHqcwHoMvVHukUNaIki+KIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F20F9F80589; Mon,  8 Apr 2024 05:59:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F93F80130;
	Mon,  8 Apr 2024 05:59:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EE81F8026D; Mon,  8 Apr 2024 05:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B0F4F800C9
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 05:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B0F4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fhbpM3OT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrHGvPfEh12+TICqUj6of99l9CmqMVfyn3LVKQW8lo67J4F2wFakKq4GVHwUwyNJ3mGni3zNtyj1ORdDd7FydveY2XdnpN9n8AAcvmmwC2iAYxCKlJZ0ms5N5uj9aH9dXV1Jfm4bjimPEcUGSt+lQ2v0mC+o83V/niS5KB3Z/rVBB7GzS4HUVELsGRjivT+Rq12BKa3CMkCB/O2ITusSbuEzK4GIKRVtuwsQJd8KZNjRNyNYbAOV73pCYszFk+IC8X83fcpOQvZ0KGzoWoq/W1+gx0JyZCrN9eyO3aA4ODwEOa0s4Fy6JgIEW1S67F5/L709wuHEexTufuanZ+DaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIYSm/9modbT24QHWv0NNEtIKSqawDgroUnWCWdc9kM=;
 b=YMCWRf63d6cW/E87M/WJwvG0AyFp0/lorT6RSVdkGqeNzWeXm+GEMiwRCM2eYdpws4IIIp5O8SxzmTKCLU/YVngu7+ekuAw2S+Hf4RNXdGnWNpMMR4fufQD14lnpLgfF+k+Ruizx1CYLGubap8GXsik+ms45h+WHwn4A7CxAMNscdW/9t1L7qmkpZ5+8gErZ7nqVahY+MmH5CUN0KZK5nodSdH16OIqiozzxAgc0uP5VlcXbcQ0WbbO51RX/5SmwhYmSjypzySjhh8njSqa7Ab5eY/J7ZQdtqIBK1FNOV6E6iYr8COVzyghoSYtv5XoBdFcbjidBD0g0PLveBdNIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIYSm/9modbT24QHWv0NNEtIKSqawDgroUnWCWdc9kM=;
 b=fhbpM3OTpnsrRomgzyAXe3YGkxJn5ymEx1F6l4gtYCD+8eKg8ZbTiMFFvtSiHzzbthImYwRFq0wzHMsWrvlOl/zyjUJb5RJ2Okr5IQps+dbzmbZLW7q3CTkLJMVqs2yH5hHB3iXm6VA+8NvEkmjTTnXxNWWBjzbOO3DegXOjV6M=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5991.jpnprd01.prod.outlook.com
 (2603:1096:604:d0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 03:55:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 8 Apr 2024
 03:55:15 +0000
Message-ID: <87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
In-Reply-To: <875xwwr60a.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
	<b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
	<87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
	<600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
	<874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
	<40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
	<875xwwr60a.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Apr 2024 03:55:14 +0000
X-ClientProxiedBy: TYCPR01CA0013.jpnprd01.prod.outlook.com (2603:1096:405::25)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5991:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KsW5Dd28Zx3FFAFOXGq+dDSfPkRk3G61zJirKGmAlylkvs59he34h9iw8Qn2dIK5f0U1h7Xp//aQOPDxMUbahAh3CPocuTaRnuM9bJ7RtG7aRpRB67qJDhDoc7o1YuT5CoRZUrEgcWYlwpQtyL2GB/s1nJxjyZ4sK53HJgmPIQLibIQwObPm02X4psywTxu+xFbbA9FsVZSEDAvDYQrEc4f0quGyX/btMllq1EA7c/KxSxDRt+4tAIw9iN1NGSE5CQqj7Z1ntiaVUtQhcKH9WPFAaSFH/CQrV+UDchtC5BzREbWh4P+Jo3USLEw+YlATD97SFd93mG1S3FbOBbMmlX/db6geCWo6n9haleBQuy0tnO2VY1pjjJjp5085e2L6tqdvDRRaERVAbJoC5dDZ1cqhVVYWV0BJ8fp5vy2hsTwNNI/Wuk7/29mG+s4hyTwdTIl5lrNe/eX49l0rnVRBIVutkSmhpXVnggYzuMlZHjsenZXyEh9tvoydnPUX3Dc3UIXY4wZtRQ1P/hgpjSC1IIxCuyHsRanx575amIkwblx/HWzW9CRP4NeopEeBEMGZcog4dlo59FJlhJCVLSpWjS1Sve8sFoikaNCYV+mdrV+wjllI86/SgFRmywUtTrUyAOYSCe2Y0uYEsJ2PBg/esLldeR+g+LyMPQGPlX+MsemrSdSrctt22PdmMyzLUZVN1acGwksk2+b4VYa5xO5+gjFMdB8NxuoWxViLA3UvPMM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(7416005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mPrUxzvy8r78RR/53Eto/sFCiqZuQVxWDPIMLgDhDCFD4n0P8WVr9Z/dgq1m?=
 =?us-ascii?Q?qzpW5scTWrliwM8/s9G3UTxLYcVgWwbootiitQfnDRobvir6t8Gfgdl1pFHz?=
 =?us-ascii?Q?WLPYipJwbmRCZqMEuCi8KAkLiXuae5G2KZ/lg/5GhDV4YfTiOtjaXuKZHF6W?=
 =?us-ascii?Q?m31CtTQ3kXUEYdN/KNkMHyHmwWLLqXiPw/gFuJMEeaL8sNTblodfS1Sbdhmk?=
 =?us-ascii?Q?1WKp0kuPF0XiVH2/B6jMWzbWlu2z3uo+0A1rph3a1tedlkMjRHjtRy6BQbpo?=
 =?us-ascii?Q?y96V9NYBiCkMcPDQr3FWZv7siz5oxyU5mcyup5unRLvJqx+eE32EAbhs955F?=
 =?us-ascii?Q?b5sLD+yKpf0+u3PDlh/Er8t0mPrrMVe2g3cgQDwivpvU1RqU2NnpNusdNGC6?=
 =?us-ascii?Q?ylFdPeKngDFTmK1/XCJyHHYBG741WWiHMONTiASM4s1mRVxgoTErm4WYnjXe?=
 =?us-ascii?Q?sjGRN08mrVexfiBxqKgOSrdIZ8/Jy5mzUkwMVbW19T6mgNiId/CZA6dVnqNE?=
 =?us-ascii?Q?3mpXFLa86+cm1dvOdsEtyfCjM0jloFX+TsTlQYhTseZDEEcLC43kjJSRHmBC?=
 =?us-ascii?Q?5L+NYMvuX4vvuPcjoMyUbn7yA8Fu9xlSVr3oKPQlTNP2/fhQv2CywdWIGSdk?=
 =?us-ascii?Q?WNajhVOsApCfTfelOSnFMcJY+ydzuz6ztPWUbrBNpC/3oOKczCDCSfA7NO+q?=
 =?us-ascii?Q?BcwVXvPMPc1JZp4UtctsPL5pMr92wD9wnTJoUQuaYKEU2uCmSS6BcVQk5AOS?=
 =?us-ascii?Q?f5lhdIlSQTOIEPap8LbredLhE9+fclBRlaYWW7KOkPskX7Qsqu90dlTisyEl?=
 =?us-ascii?Q?isfU9ZIqq1DCeE0rXwHfxpNM75HrBcWjAiOZQ0flq+AgHYDMiGEoOqOnCxYq?=
 =?us-ascii?Q?cg6HioZO3QgNZbKjSe4ZldTG7bJnnFIN3j75FRxmD3nok5pED0bELEQoyv/3?=
 =?us-ascii?Q?vVdqNDlJqjqHXCfvvbhSACeVofgKlIdJjn+/PQgGpIXMB7JxOuzpJKniAJ//?=
 =?us-ascii?Q?0aD4srQHQq/BbYLaLdML8NtMZ76Oj1LL23iKlB9+nYgwr30cMZzPpdCf1D1s?=
 =?us-ascii?Q?8HDmKQLeUWBapr5QO/veUq8ixG+zE39jHUeE8gbYaMAmbMtbo57hMtLi8X/B?=
 =?us-ascii?Q?rZydtF9GN121w4TUkWsGUST9HQ+e5fsHLUu+492nx1co3eSMkJYmE7G50xM7?=
 =?us-ascii?Q?j1itYPNrlrdSBEjbQDAdbdJPL4Y6cTD+A0hYIf1T39j5e7HhlGCMYsGiFO2H?=
 =?us-ascii?Q?byEj2bfwJlFFuyfInoLlSZI3zzTgok0tkJNX9ab8sRoR9dfvyse/PnZQr8Yz?=
 =?us-ascii?Q?yXjvJC+7GgFTDQ1HYCAbTvsfT8X4v2WXAc5lnx2IVlEKOZT9ne+QH72k4jHk?=
 =?us-ascii?Q?+9nyNXE7ql2sq0Z+1iIV48q0gKcbmmJwZE/pzYj3ClTwxHWcvbR12JS1DZ7R?=
 =?us-ascii?Q?eqZTgl1d+uNhQYieWXJ0DHqzO+SJI38d+hTqGsjAEUpnWwkc8mbS1ncVFAcY?=
 =?us-ascii?Q?AmmWhYzcoIiPXtAbyKCr3NAnMqBARsd0q651hRjhXjN3BNP5SZOxffFsPSRh?=
 =?us-ascii?Q?MB8TMLI/WSr+O703k3ndhnEaa0AQY9ZXDUWzqwitkVzrkln6MbMbkdYnOvKa?=
 =?us-ascii?Q?VWpUCIve7ob1PJXqNia+Www=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 916bd23d-d87e-4fd9-51e5-08dc577fb2b4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 03:55:15.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 216uBW/Mj31BtvPiOlDRFn8591CxrUFf2HdnIFZNLtxOOI6mjRPcnsZ9peg6c+yfRyhy7dztfyS1NQzHtYVG1vxPt3KrQKgbulSZqftOTftAxWzvjXyAxR9poAE5jywX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5991
Message-ID-Hash: LD6LOQOUU4N2OSDOSTLV4BX6FC6ZTPON
X-Message-ID-Hash: LD6LOQOUU4N2OSDOSTLV4BX6FC6ZTPON
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LD6LOQOUU4N2OSDOSTLV4BX6FC6ZTPON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis, again

> dpcm_xxx is used to declare that the DAI/dailink is possible to use
> playback/capture. For example dpcm_playback means the DAI / dailink
> should playback-able, if not it is error.
> 
> xxx_only is used to limit the playback/capture.
> For example the DAI / dailink can use both playback and capture,
> but want to use playback only for some reasons, we can use playback_only.

My pervious patch-set was "try to merge dpcm_xxx and xxx_only flag",
but next patch will be "expand assertion flag to all connection".
This "assertion flag" was originaly dpcm_xxx.

In next patch-set, it will assume for example current "dpcm_playback"
as "playback_assertion". It can be used not only for DPCM, but
all connection, but is not mandatory option.

Its pseudo code is like below, but what do you think ?

	soc_get_playback_capture(...)
	{
		...
		/*
		 * get HW / DAI availability
		 */
		for_each_rtd_ch_maps(...) {
			...
			has_playback = xxx;
			has_capture  = xxx;
		}

		/*
		 * "xxx_assersion" was "dpcm_xxx" before, but expand to
		 * all connection. It is not mandatory option.
		 * It will be error if dai_link has xxx_assersion flag,
		 * but DAI was not valid
		 */
		if (dai_link->playback_assertion && !has_playback) {
			dev_err(rtd->dev, ...);
			return -EINVAL;
 		}
		if (dai_link->capture_assertion  && !has_capture) {
			dev_err(rtd->dev, ...);
			return -EINVAL;
		}

		/*
		 * xxx_only flag limits availability. It will indicate warning
		 * if DAI was not valid.
		 */
		if (dai_link->playback_only) {
			if (!has_capture)
				dev_warn(rtd->dev, ...);
			has_capture = 0;
		}

		if (dai_link->capture_only) {
			if (!has_playback)
				dev_warn(rtd->dev, ...);
			has_playback = 0;
		}

		/*
		 * No Playback, No Capture is error
		 */
		if (!has_playback && !has_capture) {
			dev_err(rtd->dev, ...);
			return -EINVAL;
		}
		...
	}


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
