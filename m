Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCF89B5DB
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 04:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFF7227D;
	Mon,  8 Apr 2024 04:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFF7227D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712542535;
	bh=tOd0fPl80UIt5LpqCI82MghWxIwFPCc7exQoS5Ow3qE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=am18ZIosPwPSiwLbj6sQ5a7UQFzd1k4SZN+F5tAI3mcLtUS2Jjv301KML3HYjknew
	 Dk5EilQ7uoKBJkx4NoO9c7IuGlygXihe/YU9ysCvoc130Bjs4Ym+cHdbJ8Gbqtzh96
	 ZucTUnYfdWhLYPt7lRHXdDonN0IixHIiXJ3zBaOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FA0AF805AB; Mon,  8 Apr 2024 04:15:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B86F8059F;
	Mon,  8 Apr 2024 04:15:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 630FBF8026D; Mon,  8 Apr 2024 04:14:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A261F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 04:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A261F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Wtg9VP9u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFVJR1hC82LrFymjMjDsJjr4mBnXaDvbxvd0GE/b1eTBLTuHGbaurSoLHtrSSnrz5+sZZXibaxoydWhtoaGLCpVz5DS1SmkztooEoH6/xdbedm6zb9P5Td/wYda9qlqd+XdGcVeKCjLrfk1tokTHZoEsAvT9Avt7wISUhAT/x5D44IAdeDXsFY7g7eI2eNaol9NpfmOX1GbeZb+ZZlP27LB4eChhhOedaxDrhLz0CDLCnGrt480dPzYTGFC5zk+zSuHrXaJJSuQ8pg372q+1QwDlPGmGSiGd3FbPC06SFpOv9nz/YHpnbbKadNzptdz6F7MjNhhnyTP2PsrjdDh6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57CecwmkjIucv1CWuEGj2tl+XFyYNvwbXmEHTQizVl0=;
 b=JKvF/FTGtPqgTS/tqVnH2/cBAcNSHur2eWy/scos3+O2K1FqO315bzGle9rQrX3q61K4PTn/n5NxL45yRwjNkNFl2ApEKWfZf5JtLDDOz9J0MQIIn7RBRv0p8svc5COrTNNDgKZqmm8KLmeu37GD4QDipAXrt9cJsTclA1iQ8D6z4wFqDX8d4H+OIAHWQWvBjEP9fxNNvxBZ0fXFiPXYkXxzmYUYeHSIYtUdYDPVPXzKjQEj+1l8+KHioWfgYvZ4+mb6bbzsdSC8iDVr4M7uPoWizZs4VITiyng1XtKiKi+n8JVRR5SMk5TVhKkyJGsTMHVoekKsPyLrkO+yZScArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57CecwmkjIucv1CWuEGj2tl+XFyYNvwbXmEHTQizVl0=;
 b=Wtg9VP9u27rPkEfTzKgobtvFGNIidOYYaWJpWHOzxtiNnTE4e2AlpA/b3cdGFj/SWqJ4xQwWilOKZRX57AI69ZF7AmGYh30MXft2pvZd7mlgEfnEdiHjj0Xidp5HkdMsQ92mn8EZivzP+a32h4twJ/Wj/9WIFgk1DF70ZTQq1q4=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5376.jpnprd01.prod.outlook.com
 (2603:1096:404:8021::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 02:13:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 8 Apr 2024
 02:13:39 +0000
Message-ID: <87ttkceh4d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>,	Vinod Koul <vkoul@kernel.org>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Takashi Iwai <tiwai@suse.com>,	Sylwester
 Nawrocki <s.nawrocki@samsung.com>,	Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Matthias Brugger <matthias.bgg@gmail.com>,
	Maso Huang <maso.huang@mediatek.com>,	Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,	Linus Walleij
 <linus.walleij@linaro.org>,	Liam Girdwood <lgirdwood@gmail.com>,	Kevin
 Hilman <khilman@baylibre.com>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav  Kysela <perex@perex.cz>,	Hans de Goede <hdegoede@redhat.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Brent  Lu <brent.lu@intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Banajit Goswami <bgoswami@quicinc.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	linux-stm32@st-md-mailman.stormreply.com,
	linux-sound@vger.kernel.org,	imx@lists.linux.dev
Subject: Re: [PATCH v2 00/16] ASoC: Replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <1j5xwwp491.fsf@starbuckisacylon.baylibre.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<1jil0xplcu.fsf@starbuckisacylon.baylibre.com>
	<877chcraaa.wl-kuninori.morimoto.gx@renesas.com>
	<1j5xwwp491.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Apr 2024 02:13:38 +0000
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GomhiabpbHXM9WlLlwlCO5JQL2VLddVzvbOcHgcvEoy5wghqgoCeTay0KUoJGmgDrHl0vQHh6GHf5VG7WQJ0hRFGTn+UsKqrW33BYlTjqsiHLk5vyy5/tghQMmlR3D/kvQ5y3U+qfAOHy8x5MnMKZtcFpp/85/BthEG+AwUqTC9jfmMQyQ8TuCjUOhnaiKvhVplb9lTrjf5L25l/hukFjX8XKNzAvjPwBy0P1cFv5ysgwpMl/eBc6jPErxaOYN9hlK+eTYm8XAFolRO8QCmM4IkYrqezyp5sjfMcd+6Q2b0yl6wfEIPPAZo+A18Se8TSpnpZsfCrRilf9maAJxZccqyCl1XQLl9dNv8bWeOlyPBhHzHvT4Iqb5wCCos9Lj3iEmAbTGxLopZCe9eqn7U4dV1UW72Nu6b+ZqVDcmofk9ILCFQpLA+tiGR/cXHnYS5r1w7++QEGPpxLS+xGU6GHRte1pYPUVB8L1Uw+UbfAP5IBlcPiDXI2K5CGWRJIXPxBFOiXWa40Ts3I2wdERT0Di24XGwvSEAtGqsA/CuJL9dKxwJA3uTvm4cLO+ekbZkTGzhKeJvMeX1MZbBj0P56h5GmBRwojqL9vc1aADUmJth44Xr5WCaDFmKIXueHmLI698Oi7SeUoBisYCbVY/aTkNV5ZM2wFC2mvkZmrnxgZL2Gcqob680wMiEHAB71N/aCNU4D3yJVE1KwbbTVPCoWvPP5XKX2DIugP8lrzngIJNDY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GpEntpvYfcf6pCN0GWzL2QhPfFYqMyRZhfcJbmdspRPTvYIDsGnwh6Vzr1ma?=
 =?us-ascii?Q?Ykk7WN6PQCpdIieGKR0w5kXb5i51RV01vZPH7QNStn3hYJsP2I9DUunZbFGE?=
 =?us-ascii?Q?Se1Vecz1kOES6HeqrJFYMbuwWJm04jPZDISKcdLxJlrHVo9UHv3IKwweurer?=
 =?us-ascii?Q?+NaNTZ05bmci7oyaBWV0H/FlYO8nFTYm2RmRcKxYTU7fH7lOwrHjkO2YOWVA?=
 =?us-ascii?Q?SD6JkZCU9t7J9XKzCwvvBuhI9DuSgyR5y6pLx1amgnkY1QIDR9HBRBtCSsce?=
 =?us-ascii?Q?Pamt0WRH4Y4om5JgNNm0uuK6RhpX5Sr1B9D8LGYDY0aFme+f7dlLI4w6lAGc?=
 =?us-ascii?Q?idN2SnS3c54ApETvk7xNg340foJH1LMBUXBL2pi6KGSSWZhZ8f7y0TmVmYzf?=
 =?us-ascii?Q?VdRIge7LflQpdwiRJiTVFgR2selwgtwL8r/28YsEYB7CbNBhOx1cunOgvAzg?=
 =?us-ascii?Q?FMhcCQj8PFIP6ifeIgHnx9cgDhlwM5skOV7B2gULul/EXMWe368eB81URMb6?=
 =?us-ascii?Q?Ck82DGBW5LmjAGkF2Tjd83wcGjcOqcI4SBvOcd80NNE/NF+WT5zpkNIMb47e?=
 =?us-ascii?Q?rCVHbQyCRNPsMEiXCAvHTE3lEgXgjf13Mu9GYaBNtXcd5g0qPH4OiCdarpmh?=
 =?us-ascii?Q?OfMbrpPIhj+f8/ghTT6T1J5lmtNNRJPaFxeXXwWtVxQO2BmJjHmlDfIQcokm?=
 =?us-ascii?Q?1NxQmBu9WbnI454azkxD7cFcHldQOiMrKs7nk19qM9/qFr3apbiDyA3xZL8Z?=
 =?us-ascii?Q?t7pisHSM3jd+Q6VB7dYlqe5++9k/RWsFN0Fcd2NGo+8HhL3Zkrnmxy9dlU+h?=
 =?us-ascii?Q?gCmtgyK7dt/0pjkmLJYV9ngt2b7wFj+oPbUKQyZ+DFxIdMzVudbseX98Lsxf?=
 =?us-ascii?Q?Cb8r1Xy+p/o0WHbWjTdeViZ3XpJ/6m2J9IXuGscad2LZnWzrfQ5xfjHp6W1K?=
 =?us-ascii?Q?M0//YhIv7lb65/oUcT35ITYsYKucfeW0V0fIlDIWDSIosPVkVhQ7DVst90jX?=
 =?us-ascii?Q?4QIHzvbLdVMsjnt6H16e7A31TVWG/slMd4bH80G/e7Xqqsj3Lg684iDRb9lM?=
 =?us-ascii?Q?md5AiaLu8GsZyR8EvQ5EdMgM9s4ntAIdIvl5TOgW7ro5Rm3oeCoPljUqVvgl?=
 =?us-ascii?Q?mpTHkyLIhquOg4Q2zktXn/4aEjXRj+p1sCIWGMpUNh7iTIm+vlOdza1SQmVF?=
 =?us-ascii?Q?WdlUDNlyrWfhN7/ak2cIy7K4opwrpzSq6YtOXqgw78UapxYfrFc4B0qDJXTu?=
 =?us-ascii?Q?ykcvMtJvVOtw4QyhwGoziR2So7IYHGEwuo17c9helid8CBHbC+ZcdTb1J/wT?=
 =?us-ascii?Q?fZxycDhgQNxOHh4IXtLL+eVi9p8AIFCWQWhYigILcN1sLIl7SbllVUb/s7pR?=
 =?us-ascii?Q?ABS9b79e5wFZKW0AaaEFBjYruc4/13NvZdQ+ZLrwLb3RDEjyhh0Ce12TWaO3?=
 =?us-ascii?Q?RTymkfg1XZb05VuGe0lg8EXyUt7/Qd+ncgcnH8At+JrTCqOdDgNdVX4DUklY?=
 =?us-ascii?Q?m7FIhh8UbHF/7NmmA97D2aLnjIiqxx5WBA2Ez85tJbCTT4oLZaIrOwRL8ujp?=
 =?us-ascii?Q?MABUSa15cFQq7IM3Y8An4iiIUv7aNoPVi6YhoVLVz4pAr6w9QHWVpvBgoV5L?=
 =?us-ascii?Q?IMhedAZ7P83abb0D9WxebIA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c7e63b4-4d5a-4a25-4bf0-08dc5771814c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 02:13:39.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CequXKHYp5QqkdkVIL7HsoDoDsIRTL1EIQsGJyA9k7N/J1dzOz91VoOALwKNiaEqwewsyW+1TM+0PTZk7is8i+OFgTBIPbAsYXzlbWd5Sgn77ACg7XKeburDmBmmnLsV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5376
Message-ID-Hash: EEUBWTLSBR2JYDLQKZPT2WTZIFCTOVE5
X-Message-ID-Hash: EEUBWTLSBR2JYDLQKZPT2WTZIFCTOVE5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEUBWTLSBR2JYDLQKZPT2WTZIFCTOVE5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome

> >> unsigned int directions;
> >> #define PLAYBACK_VALID	BIT(0)
> >> #define CAPTURE_VALID BIT(1)
> >
> > I think Amadeusz indicated similar idea, and basically I can agree about
> > it.
> 
> I've seen it afterward. It is similar indeed but I don't think 'None' or
> 'Both' should have a dedicated bit. That would be yet another
> redundance/implication between flags/bits ... so another source of
> bugs/complexity IMO.

I noticed that it is alreay using bitfield.
The diff is it is possible to use "XXX | YYY" style or not.

	/* For unidirectional dai links */
	unsigned int playback_only:1;
	unsigned int capture_only:1;
	...
	/* DPCM capture and Playback support */
	unsigned int dpcm_capture:1;
	unsigned int dpcm_playback:1;




Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
