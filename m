Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F030D88D3B0
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 02:20:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083952BE7;
	Wed, 27 Mar 2024 02:20:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083952BE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711502423;
	bh=fa5nkLfgzooX7dhMmPHJNL5eGLTUPtQhsSZH6eqdbks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eKBG8jhoOJj0JW2xtDgJzaq7BNS/MawtVW/qIDXh+atRzUyX8rnLmuPn5z5fpXlBJ
	 XlDxhqn5BSalRsvLI91oC06OF1vhQKrzzpJaT6i3L7ezTsja6X4lzsGn645QCZ1bot
	 d6EOfzydPJXFIIHcfnaXK5xbsYUoLLoK9ZdNa90U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D4CAF805A9; Wed, 27 Mar 2024 02:19:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87D73F8025F;
	Wed, 27 Mar 2024 02:19:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9E37F8025F; Wed, 27 Mar 2024 02:19:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08604F80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 02:19:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08604F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BQkLL9mX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc3jpyVVKaRoDR6D6tDPFoxDANegooMvJx/2ke8Doy2Qv2FxDGQtEv+64ZNVgrM3sPgUYK+AOcvv25ngpwy0huRAXo3sHs9XxbqRKyPoZVDBs/xkp0YKjMDnb/YzzWAApnX9uZrjfJkpd6eQ1JV9lsOjLJd34f+9LjMlOmkRPS+NgAvhZWj3i1pwjn72JtbUXI2U4YLXzHigcpKUFL529V9L+TeVH+trmyTWvlyjfiCq4+dzeMI4BZZNaL7xwCpIklXibHvL/BH38z0ULuUinHme6j3EzD2Kk7i3BLPZS28vMJJXnkkBDaK7uAqUWGdqeNRfCzdHX37m1MQDH8sREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qA9EqwsjTFVdDcKxA0fWrvrgCnCu4xGF5MMycIEtdv0=;
 b=aKNd/9dCeD9Q5daxDkraJSP+Ba4sQC2lf5Z/ZMCqMzg2xN6hSYV4QEF0E/nuXtqpVuWUpuq+CVIQXfbFLp5cT3jVyZKvLZ27By5GD/sAr498tFLHxL8hU+RpKQbAyk2792gOZuO4jh3LoRpkyTtKdFXKUhaIl5Di1O/AQ7cf66Faw+zvExX8GESn/UWxQHtikRK62nhyn8CEeReNSnNVxTIeFsZYxySfW1ST0Swje2aM/svM+IooR/yxEjbkroE68/gfa9e6EBYjCrxSH3gARYQLA900eiC2wdHjGxrOFqj61SeYXH02orOlQ9BSN5abZDp/jPHV5v0/fGN+g+8VkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qA9EqwsjTFVdDcKxA0fWrvrgCnCu4xGF5MMycIEtdv0=;
 b=BQkLL9mXoeIEycu58F5JGsSm554eowhxKAJPxYyv4imugUHhlHFklZz/nR3ugwcpUGpNpkZlUD9LOGp+cC5wTjYcEuq7GaEPBFJACpLtSzXOnqZmH1513IsNZdcEHURWuBa46pkGmTf6lDWWKHz5lbm6paDK273sYry6hWUxH/o=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11211.jpnprd01.prod.outlook.com
 (2603:1096:400:3d7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Wed, 27 Mar
 2024 01:19:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 27 Mar 2024
 01:19:37 +0000
Message-ID: <87sf0ccvyx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 09/15] ASoC: Intel/avs: replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <80b9d7ed-5ddf-488b-8839-a96f85cfe9e0@linux.intel.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
	<87bk7353m7.wl-kuninori.morimoto.gx@renesas.com>
	<80b9d7ed-5ddf-488b-8839-a96f85cfe9e0@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 27 Mar 2024 01:19:35 +0000
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11211:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pS4rXaZYa1e7XvXzD8NfHkBObvm3Y9DISHh1dJgDhfQ2P1Hge8R9WcA6v+qX1HzPRz+lcAalJzbuT3PZTKjN+OsWh1V8rJA1DDtwEcg6Nw0x/6la+quJB/Ppwn1XO/rEJO6JFVl63AvCHqbldQNCPjt6lYf3ULhNy8iDoBXBjYjxFXhIPnvImlcMyJn5MUNCNoA04mw6d17MMXdpc7mSUUH35tXRZVJO695uQj8Z+bL2OWaD/SXW90RgBo2hGvOTmro8/ffst7/pCrMrZfq5/u2u4AI6EqTIO89sOZboyo0SE1HeA+jM0CsuSvTZApjYYTZ/x0tz+X+dopQX7+QtvGhKZYT/JbR3R35x1+Ef7NrbdmOdlOVRS1XUvoR4eV6TOr4UcPvRjkz+EZ5iyQ21BRLAUuWY+B75QNc0WVtlnWoec2JvwFh14IJoS/24EuH/O5izSibHwPdTo/5qggyfyFMW40olwqGY3c/t5z+Yi+meBJwBRdf+uctMZ+yhL+0hVQVO6sd4+x56Q2d4Dw0ca+wDsedn3ymHLAsLwLSk/3um5uzTFJXEsmAEhlv7ny8dPqqU0T3LqSAiq/u8ySkAmQz92UFJYL920B7fwsf4QbEg2wSYIb9lAuaSlpEZWxtt+T+EunA+404a7/k4SoSIB+oWQTvh4UJORNYog2Nw0hb9nlIm9JZVm+mMLfpC9bdCJNFF1qauOoXVmsVGND+XP88BUifVQzI1lBF8x9cl3rw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(52116005)(366007)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hgC1JMvVCSVoZBCkCQC845KjQRjGxQFuJlscdnQ2y4DapzwjyIQFQXWvqOAe?=
 =?us-ascii?Q?bMWAbbMiBlay33qZ8OiI6AH7YPR5aAZlLZBQ7yn36FY1ytXaG6g+sb1accus?=
 =?us-ascii?Q?dFFbw9rWtUY9A65BmNs/EtPLCtVVVWAEsR1+kOA1sO9V8BsdJK1lv4X+1X9T?=
 =?us-ascii?Q?gYJQrqjkK2dQiGVXW2c1h3FMfPoWJW8y+6a376fdxhrT51R6XGMt/JmjI/gI?=
 =?us-ascii?Q?soWat9seqB+A405sOYjVUmV3QRTY3Lphon5IrJv2qU13JvMgjzLBopTZP30J?=
 =?us-ascii?Q?sBA0+cHuuMwaC92Rp13ma5SBBtXrB3+igvBIESWf+wJlesmPyABCrFJ9OFg8?=
 =?us-ascii?Q?xkOt2MJ3hAcx33xQXklMK5WOPtwzCQQB+6cb0VKDwVxiJUilTqaeHOuiKmLN?=
 =?us-ascii?Q?DTHgNs90VoNI4udqmDuuknAmREKCJp471S7yDXDdo4M28qGLO+9Oo2OTa1X/?=
 =?us-ascii?Q?sxl54vBDikQbinOVKhxCphBBDKfFjNv7sNXYQQOXGgo/g+d/saQZkg3VhXtZ?=
 =?us-ascii?Q?86H47GoDUi5XHXAIYMc6YWfROkaU8PWIUOpuO9lHUjYe0a/vBKJZ3Egs6RA1?=
 =?us-ascii?Q?U9Q6ePsJre+WjWM497qVXLMUj8PsJfnTMxgvOY0D0F6ytrrGhBumq1/+SzUx?=
 =?us-ascii?Q?45aQa7KZoQh/Th+xQ1+gxWMquZpac+U1xb3dmJ9UPilfHYhSL6QlvTWw4t36?=
 =?us-ascii?Q?of5Crq/oTeCEYhLeQWPOZj6AIcNUOJua7puicCxlBnhn4p1rJtjew5ogz0mL?=
 =?us-ascii?Q?VI4hLBzSxYAy73HSFqdO5RIlL/CaYypY8Xj+ink6VVI/0qwd6lwojOnsmpsD?=
 =?us-ascii?Q?3e4fjw3k6cBHPV0zOrsKhRx/G8fFvv22neCQi4lVzcPEztZ0U4mYmm/YRVSf?=
 =?us-ascii?Q?1LDWX9XsgJqKbfsW8OE+guYbGTFjpA/UP1RPO8kZWdTb7fQf4+EidTTbPxL1?=
 =?us-ascii?Q?CePrENoaP8RXWES8U+m2ZF+2RacrxKx/ljvjVIO+FkUAyY3hRqAiu/fjpJZo?=
 =?us-ascii?Q?vGsMyq6Bx768wedyu1kJ/Rx2MCqewmDCgEFmiHNi5TOCZkPTq+kl/aNmDbEn?=
 =?us-ascii?Q?v371WrQZtAeoZBHmfxOwcbWwuptx9rMI0MEJGmJKrS3ptzqxQgcglh75lYiQ?=
 =?us-ascii?Q?FnguLsx+FjjtZ+gI0nQzL3riNMDZ3GgoQ5I2Qtj516cQcb0CFJv23XTKugxi?=
 =?us-ascii?Q?a0PgJXxYAq5z15gM48mGPe2407le7PO3IhSKyWDw2KHlx2d0mpYzmDE4kvDJ?=
 =?us-ascii?Q?2ayBq8SEPxC1pX3WO8xiac32wE1ZAVT6xuU/YrEzvmmoIVcG7PGd4jwqGOam?=
 =?us-ascii?Q?U7RvpOvA3RHwDO70ZC7ADUOj8cLY/BDFsi74weD8blXdTgBvX6/ZXPF3iMzl?=
 =?us-ascii?Q?2abk4F8eH5oBe/MMVXwy2v3/CEW1BLQZWJna0cGLwkLRCGVguDuEaUc/3ySq?=
 =?us-ascii?Q?OJAA2iFogwmoe9hP+DJmF7OptBfOwNHvAHxeMNzsIHYZtfIXV3oCiCCZn8kP?=
 =?us-ascii?Q?3K73SL0q+YkwcZmdKmqfjXDdawvx7es+ybfltnPRuNPAj8CqyvrfWEt8uEy+?=
 =?us-ascii?Q?CaV9WKhfBgYiBERjccrtcGddn7GZGsr3ZqNLX4GOkGcaVAxKkglOzZHs8bWu?=
 =?us-ascii?Q?1kItNL55iX8c0wHKs4uog8E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 31732d11-8dbb-4150-0c88-08dc4dfbf79c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 01:19:37.4668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RR4Ii8BHhmyzNZpzKP0JmvfVqz+fTHl8K+NBXyt0DzFb019KF950Al/IAsbxni/Z/zWQniKqieGFSVRphpt3HkrQUw1KtU3vHRESFSdYB4XupwLXBAEK5zeug96cNIU0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11211
Message-ID-Hash: BPWJYABGLEJWLYPQTPYBUIFCMCWEDAM4
X-Message-ID-Hash: BPWJYABGLEJWLYPQTPYBUIFCMCWEDAM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPWJYABGLEJWLYPQTPYBUIFCMCWEDAM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

Thank you for your review

> > soc_get_playback_capture() is now handling DPCM and normal comprehensively
> > for playback/capture stream. We can use playback/capture_only flag
> > instead of using dpcm_playback/capture. This patch replace these.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> 
> ASoC: Intel: avs: boards: Replace dpcm_playback/capture to 
> playback/capture_only
> 
> Fix prefix and start commit title from capital letter, otherwise seems good.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
