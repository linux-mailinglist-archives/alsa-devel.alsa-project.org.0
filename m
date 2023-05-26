Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8363711C2F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 03:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFBDF206;
	Fri, 26 May 2023 03:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFBDF206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685063556;
	bh=MtiXoBceMitDIoJ0XPrAD1Hj6dTfbuLSRRfol1Hu86w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hd7opO1lD5YbM4pxrt2VTesnU+Fkqk0U8QunVpxdx0lifHcVPuD4ddEFMhgnntWux
	 aKyWR2+TKJZxYXe0mN6pmWBJKXLmJNco+PzqkkEm4nPPEMoVfE4M5hCLQx3B0/9ESo
	 lOhSSZgyCFrKCzFpDGax+gqvhFutDsSppzREqxMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E45E9F80542; Fri, 26 May 2023 03:11:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C88CF80053;
	Fri, 26 May 2023 03:11:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EBB6F8016A; Fri, 26 May 2023 03:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9AFAF80053
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 03:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9AFAF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RzAo8szN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dk+8v1Syo6tBwZ2bdFQsHCYzueosjVpRvXOw9nno3wkkgL+JlT7BJCDosANVe+9mHcPUemJnOsrnBCdzwpmbFop0QFGyI5f7ywmoZd6BV8eBbslGVChluZzBLDsAoq2YOqe8kZyTjipMJtV7uDObjsxnCtKR6LedMBWLlfKFJ7baDIR9Qx8DktKXpdJBq04fyqFMjGasSa6XypzG2HO1GHGxzdFuf0TGofLyoZNTvRYRmHMCI9Q0w9YsLMGYtf8Sokct8Q/NYOnm3Pgxm76D/1fXSNRM/fUmjeOwWQ0KbjvAixAQ1SIeew0WxK49S9Zurioim1uThZHxlf+gRszKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNHRJdObBPFo//2EbcRgyZId23hH0sn524wNmThmKmg=;
 b=GZwvhmiETNOAGxm00iiwCS6rcqq3pAnfVR9YAAKnCexNOwLm6UH3begIte2oUapVLgLrXqjV5s2CwrMyBW0tlTqCc1Laaz9dmK9EXnBqBsUwIPgABQhwV73LS7xuzFsmn3FB5WY/pLnYvWpdxFZMc6yMX9DEh0RNtk0WYBevdlNxMTaSZL2HbW5bQid6HrwwXybpjkFGgvXS6rvrFajEZwuqkYRcyP2zhrrwtKfwD73370NxJYk4CI4MHQ7SSDGK+Xl3sGEOTvIQCQTjC20LHnTvSixlqbO+OqocQntnUsnKYCX6xslZYPD2B4dexy4LM/3YouzZ37gOqLO1R1wxGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNHRJdObBPFo//2EbcRgyZId23hH0sn524wNmThmKmg=;
 b=RzAo8szNW5wjfzM9p6/zdhCQTwxSFV5ebVR4pJsf7bsOioiQAxo+QDK/875/XYDAQbcptBx0nVJdGUulYzd9ghfGfA3MJId25T0KcpprA+lTRsLabzEHbxf9M1yuJ/xJlvVpsLh/eICyhV+m8Dvm9Ha3kucpMikDuUObJME5nAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYTPR01MB11034.jpnprd01.prod.outlook.com (2603:1096:400:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 01:11:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6433.016; Fri, 26 May 2023
 01:11:20 +0000
Message-ID: <875y8fx5fy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?UTF-8?B?U8OF77+9YXdpw4Xvv71za2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	"=?ISO-8859-1?Q?N=C3?= colas F. R. A. Prado" <nfraprado@collabora.com>,
	=?UTF-8?Q?Uwe_Kleine-K=c3=83=c2=b6nig?= <u.kleine-koenig@pengutronix.de>,
	"chunxu.li" <chunxu.li@mediatek.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Brent Lu <brent.lu@intel.com>,	Cezary
 Rojewski <cezary.rojewski@intel.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Jiaxin Yu
 <jiaxin.yu@mediatek.com>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark
 Brown <broonie@kernel.org>,	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,	Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>,	Vinod Koul <vkoul@kernel.org>,	Wang Yufen
 <wangyufen@huawei.com>,	Xiubo Li <Xiubo.Lee@gmail.com>,	Fabio Estevam
 <festevam@gmail.com>,	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,	Nicolin Chen
 <nicoleotsuka@gmail.com>,	Shengjiu Wang <shengjiu.wang@nxp.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
	<ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 May 2023 01:11:19 +0000
X-ClientProxiedBy: TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYTPR01MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 773c957d-757e-4577-0f22-08db5d861d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O/qnxHnMcWrfvWh5ANlnQ4jzkAiPZdFYc3zntEkDuYy02NsjeWls9WZncU8FySl9r8kYUQhlArrClmJ3Z5sQ5eAJNbQRBI8+/nJLxG5AzADKUAusda82s6yNmPK5sPIi9C6YW4l1IOCqq3vWWe29xxnc5R51xEG3pErNiQgAYHT1hql7D3sn00dl49SpJ7huXCB865Wb61vB2cJDh22t2SGRh2pBfkMKJgM/+66QdPkRNv2aDh22BgSEaAa1sByFhFxjqgX8ZC7mJPhjJXcRcAIBpQs5z6Oi2zHNJaEVPPoJHzL9z5ewDL9pNkqHt2Yyw1D63jqOaUG+tI5fFphaivhcf79gTLO+T/caoex/XUEvev01dJhiJeAgTPGRb/OTjcLln8zOPnflzswPNKGAB8bhySW/kNMxC2V/T9gwx3PhE+V5dYh/e5kRmmxI39h2QdLNKkXG4P5dKk9C3OqbFFaKqYlb94MR79TNyaYqG4H8mpDZt3dkvT+yXWEP1hyUkxF9x+yQnkeesPjXePPqkFGVSVmZiowqy7SLJDmyC539ssEKRe5Ilv6rV4sZHCEELGqcfJMg+qWreka4EXKOept9q50JHY9yaplClEnDEWmgiB8sTvqRy4EQKeNo/NeM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199021)(54906003)(41300700001)(5660300002)(186003)(26005)(4744005)(52116002)(478600001)(4326008)(6916009)(316002)(6506007)(7406005)(6512007)(8676002)(8936002)(7416002)(2616005)(2906002)(6486002)(66476007)(66556008)(66946007)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nG2pWS2tT5Swai2+VX9js/IpgfhMfKrYnapiicB16zXDxZCrUuuEwgrxfbXg?=
 =?us-ascii?Q?CB/12aWhH+A7ET47PJFF1lV2ZABueqXRuUO4VwYCARUk0L0btpkypo11NSvX?=
 =?us-ascii?Q?b92rrjVC5iIX2EwkEJuxqTXlL3FoTZ6IVVA3DMJaIx7pjxNn3s1DIgRbKFk+?=
 =?us-ascii?Q?c/03GzDDw6eXknuT9k3P+sOgCenQV99Oyfd9Hq4mRu6ZBzydTuPpC7oGbA4c?=
 =?us-ascii?Q?VUBSEjQBkbiuPfOImZRItFi7w3rRznNP9cHvUHC7It/TkOQCSjg1pKl+g2KQ?=
 =?us-ascii?Q?QCz5P8WZPH7NXE0k9F9CCEXFbVwS+5YWFu46FEaLNzm7CZ0ATYyImU9irJqM?=
 =?us-ascii?Q?Ttj0N78Ay8LhA/ABB/XL1rdIJj5mF/kB8CQKjkLIV/zCWQh6gC2VphZBRXKi?=
 =?us-ascii?Q?qdXuMiZgMVavDfpqg4tHzeLPo5uhYxfeZ+CcTOkjsgkCwH+iFulR3JbmaB+i?=
 =?us-ascii?Q?aFvwAyhQXecWVteSH0aXtgPNfLxX4uegsn56QGNVFEaVNSOWpF81fSYBSHuh?=
 =?us-ascii?Q?nIJeNmPRk34F/09PVlIPdRjwlnz52JbI2Jkp3jYgsMKhf4jbSwGZ56ExpRMm?=
 =?us-ascii?Q?+LbS9C4uPBvyFe3TYgo1PtS+dUi0zagCtI3GuGtcyZrDj0lkgB/ReEWLKXpc?=
 =?us-ascii?Q?/vDEtY4JunsAwCZ6qr5afrVpvgV7dmIgXV9LWhIPCVou2RMXBz/O/rWwY3nn?=
 =?us-ascii?Q?gQyPJnkDFPby82eE6RMky3DARrzU1A05EYPnZk5QMwHMDcfGnsgmunx9CGQ+?=
 =?us-ascii?Q?/N/2io88c2nIvnoZXUSJRLsFjc6NQBdDBVNxO/rCuk8Z5PdwrvpPWr3KB/7G?=
 =?us-ascii?Q?JzjDyHYn2oAnbpBda7FUvrfHGQrn7JjLlzSGoMpio6LJZNor0vmFd0eYXnJ9?=
 =?us-ascii?Q?27tvYq6SKwsVg7mBxuk3iNxeQv2wlJ71tibAGMX5EcsPFZdUwLueljB7xa4V?=
 =?us-ascii?Q?RUwgnJ2dAGxfpDeKOUg9TByMstcHezXhMh5eFC1fbTt5Y/oSBK1ZdlYmT8gq?=
 =?us-ascii?Q?VsRS5lFo+t8AgiOTpJjjTCj2JnoymebvUbxgpb+savFkicAw2FhICvm4I0s8?=
 =?us-ascii?Q?Y9Ry2cybTP6t0b8UFaLYsTtAsX7TG2TFoa4hZgxrqo/ghPGPpshW95xy/gyR?=
 =?us-ascii?Q?VvxmXi38sY6+AqLKmZ7V3sM1ZGdNieiyU2ahWN75txxMhwJgftsnnqyCDVzr?=
 =?us-ascii?Q?DXXUKQ4AVWDoZioFAeJaOeYDDda/ua/ilXGo5JdwnwRBnGeJT1oVV5VlZknh?=
 =?us-ascii?Q?1u/ZjXzfmfCzv42Lro9O0Q2wtYQ7g3Ib/JljY//bucV1w/RVv1Bpfbs7ec9G?=
 =?us-ascii?Q?UoF7IRM4dbWysfcJTG+afpghuPfHzHhvVr3wZPJp1CGT4oL8oWS+/ZPgTMpd?=
 =?us-ascii?Q?xxM9zB76TvsRkelAqI1ZEMo06owhJp8lXxm0G1F9xRnxcwQ4xnY0YbW2jHUP?=
 =?us-ascii?Q?ouqbd4iJZo5B0ShEQ7+Sy6dGkI48seNuFEf49sTYKslUdttgZJL7tpFzb5rZ?=
 =?us-ascii?Q?4VhU/82EGNcRDdzZ5L2ZGlPaQ+l3cnJoLTUy1+aLaLdET6OJckA9aizs/eIU?=
 =?us-ascii?Q?F3RqdrzM/5dTzqo4KlSgCjxflml0Gbe1SlCjZNu04NyduGxpg96c1LFLImZw?=
 =?us-ascii?Q?xXU+x1veSM4wn+16wwjgpKg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 773c957d-757e-4577-0f22-08db5d861d2f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 01:11:20.2627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gnGgHZS5OlJGSMzkq5W7n4mU6cv4hUAMUNI1LpGYKvgIfoxEDUo+yTU46yGToFSDrr1GUGhmnLecCOt2rnIRkeRHiQJiIU9fz58yHNhiV1KV1UMCSfp027dhpeXqcx+N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTPR01MB11034
Message-ID-Hash: VRX3NQ66ZB5LVB4K6VAEYAOZXISAFD4U
X-Message-ID-Hash: VRX3NQ66ZB5LVB4K6VAEYAOZXISAFD4U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRX3NQ66ZB5LVB4K6VAEYAOZXISAFD4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for reporting

> [   12.883662] kernel:  SSP1-Codec: SSP1-Codec: 1 cpus to 4 codecs link is not supported yet
> [   12.883674] kernel: cml_rt1011_rt5682 cml_rt1011_rt5682: ASoC: can't create pcm SSP1-Codec :-22
> 
> This is problematic, 1:4 connections have been handled for a very long
> time, this is basic TDM.
> 
> git blame tells me this was added by
> "
> ASoC: soc-pcm.c: cleanup normal connection loop at
> soc_get_playback_capture() part1
> "

Oh, I see.
Indeed it doesn't allow 1:4 connection.
Thank you for reporting, I will fix it in v3.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
