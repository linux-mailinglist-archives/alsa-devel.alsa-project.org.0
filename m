Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2CE708C30
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 01:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21500201;
	Fri, 19 May 2023 01:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21500201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684451797;
	bh=oLXvOJWeq6QMgyPEQXlxiHTEfmo1MCL8omQ5qHaoK3I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NtbBVeDoPZrf6BOB8aYAon+w8tbntaxCz7N3LTQ9inB2z6FRWz8mbMdOe4QthyGmM
	 P+3ndRjkFunY+Zcnc9shimGnqxFsml8zlywCIPtPO55ETFqUmO/GNFPLhiv+YGg3ED
	 xMx6tvfXGvGDSms8mTvODz235aloo/vF12sn4x10=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14670F8016D; Fri, 19 May 2023 01:15:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B28F8025A;
	Fri, 19 May 2023 01:15:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3B63F80272; Fri, 19 May 2023 01:15:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C83EF8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 01:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C83EF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iO5GQc+J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+Ch9bJPxFGqWRLWkNCMad5WL/24+KGpBA90QjD84WLRLqqepfWK+yNZ6iagubGTvzhJy+CtOiYaQkD+jnTSfjoodRl+mho/GbAl8A3N9onTJxGhcjN0xJX0Z1+qWiRdjbv9twt5jkpu2+Fv5VvDO4prUIXpfEXukpGSaHF2/KuYAa98POVjPErFqFfKsZvzRKpDe8GM9bckQCvnjzTOdz9yNzJzyQNfnggnF06YHYDJpuo4i6yiDsoeiTVapu4lAZr0AmIwIkAssPJkj9i94lBga5x0vPasrfjkHHO4JP2L14xZbvRG8ELjUSLV7/6Su0jtP5nX71gVczFF0WQwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABpNeMFmNl5aDwlged3Fn8b0sF/0czGzj5KhzCgZCq4=;
 b=gv5MsjwyZp3KGBDxuA1mQy/bt9zrlN3I3R7IbBKQGG9CbvDnKZ2U6HKYbGr0iuiDpBnrbqazkimssxXuRixPrhAhPF3CX02U7+znLucUBUVooURZ3YwBM6ZqF3lHZnNj71XqokZGOlaQ8b4ax0pozYAWG6P2w8aWEyI8zzcvZw1W0I0UwxBQuXz3WBa+fCa2F3b/yH+Y/4qIcY3WncEX+4r1g54rSrSaznJXGNl7QGBgkVfAUfzzQNw1ruY9GjYllOxNpASXz1jBOFcVdgVD5Aappk80H4ebpS5RXHKSzDrZKp7Ra9DxoEnoxMoukMo6Km0r1j8jQ5oD0oYKs72RwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABpNeMFmNl5aDwlged3Fn8b0sF/0czGzj5KhzCgZCq4=;
 b=iO5GQc+JVMKWwvzEgiL02eqpeIAWp3JKgOvv+vRL+7s4Q+hT43HC9J4oQuYTLU4pSEvsKOjFqx69p4mpBgRHNaH3pImQnYPfsk6hqLK7d1wf77eknBBEaG8M9F8Sa7dJ78IspBrku5TtmZbSQimqRMynPtGB3vMm5wRMnChu6M8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12110.jpnprd01.prod.outlook.com (2603:1096:400:449::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.20; Thu, 18 May
 2023 23:15:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 23:15:03 +0000
Message-ID: <875y8pmdu1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 13/20] ASoC: Intel: replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <4d3dd0a9-b7ae-ea5e-a4a8-766e425c49c0@linux.intel.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
	<87jzx6p4u4.wl-kuninori.morimoto.gx@renesas.com>
	<4d3dd0a9-b7ae-ea5e-a4a8-766e425c49c0@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 23:15:03 +0000
X-ClientProxiedBy: TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12110:EE_
X-MS-Office365-Filtering-Correlation-Id: 43798468-76c1-41ee-5087-08db57f5b5fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YXeMQJjBfpE3G6o7k4Mwn8TX2jzeMOO655x/4L/GroYtCpnjzvIZ4qjcjBC1l9iy264rJnwL5wXIbusZK4isAHDhKozOjbHUGxMUTuaCBKcYNAEOfiiDBLLjdhEF9ddpCL/5hb/JcW2K7o6/RuzOj7uGOTZP5p+pgtZtHMdf/TnmEe/rA42TfF9NWquc6CmjcST/eFGje2NZecYY1fBZlDg7wTB2da9LCdJr4rW36VJbyCRVZq5r3tJvX4McINeC4nyv6Bhsxoa0ANoz7w3/w+ikZO0N1iqVGsP0lKhtpxneT3wYCcI3ieFrgtm7aPgYNKeQMjNK6WckY5n10GcTI2Qo8J+MznxoaWX+CrKcUCnqxG0ynRnmgGg37uNhlLkwwYYUHFQiVDybyAV9a12ryI7TveoeqoH3t6aNfa9aZfZt7DYZwp+3qFk1w+oK6ssKZIC9mwbdwxhKN36D8tcyg89O5s8AkC3cNMcTjlwDkRTEFdmiA2FIQS3v8Lbf0MeUepgUZHeEpH6giE4oneFBMjTh8N2a7VrD1ywBQYWBAoah5K/XY7UV69G9rotXDQ5xOzOVE87qIxQf6aTw2KY1grQsRowkdYjg9XPiApsiqI4RadDrylcTlJ4ghfsQG4Dd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199021)(6916009)(41300700001)(4326008)(8936002)(8676002)(86362001)(316002)(38350700002)(38100700002)(66556008)(66946007)(7416002)(4744005)(54906003)(2906002)(478600001)(2616005)(36756003)(66476007)(26005)(6486002)(6506007)(6512007)(52116002)(5660300002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dHyiMH/dTX1GDQWZ5pxsw5mgumcnR/lYZzZU8cPQfEInZpNRe9DHgF/Bwe8T?=
 =?us-ascii?Q?XB+kBQ0d+SH9idJOCBjH1m9w4ivXRvKOML6bWR6mgM32YIJIZzE5sCuTQ6a+?=
 =?us-ascii?Q?1m3ymfBlRv37TM4evaGelEdfnlpuW4jzBtCEPIX9hisaugHF1DkFr7f2avE8?=
 =?us-ascii?Q?Gw2F2UieduLBaVMymXxfRSiSgRm81fJAHz17V007YY2xCc9sKcHCOH9kKFkO?=
 =?us-ascii?Q?cBunowmWoXBRa8XXY7Fb44fj+iTxn4ygxIZ213+VjbHxg/YlVWuHCGI4OZ3j?=
 =?us-ascii?Q?7U7FUff2ar7eCbhp36Aieflou0ceIWv3z/z2LOqfkrA20zLs829aJM3kNLyr?=
 =?us-ascii?Q?pzXUf8ti73vqVjLKvRHlERjclkkWrPvC7ik5MGSqgE3O2ZrVFpxOSojJdYfO?=
 =?us-ascii?Q?3OT+Ukdjt38vueQwywShc9Ph6LFLvK+skyGJHy92cXfy9izcRf9/vo0JeWUU?=
 =?us-ascii?Q?EZYRlcG68qUTbVhpV5CVfaXHtJw8hD6WH0oI0fhKPtz+Oi2JrQNqUqehzaDN?=
 =?us-ascii?Q?s2YceDo1ATPQ+p0qvpW/LfQki83MaBUNs1Stwb+F4fCyu8m1AA3AcejZHRQM?=
 =?us-ascii?Q?+wgTUrpfeyECzPOi0hsnjZgLnIlscapSecAceODgKJvAh8TSQ9AWOauXflc4?=
 =?us-ascii?Q?Z8iuVpM1A9uXAvL0sR9oMTMg9sy0hnqIj/AkXWWw/4CJ7Z4uVf5TlTn6yQhl?=
 =?us-ascii?Q?Dqv3u42MC3peT26JxxTGLSqnQbFjmRsyJ4l7jWJbI7rQXiWi1gwOLQBbOwQ/?=
 =?us-ascii?Q?2c6ejFYB2RbP2PF2c0Zf8zXwEbxNsttH6UajrcZBOocDG8fNu4c2y8wKHZTw?=
 =?us-ascii?Q?BZxdVgZiyOR4b209zKhd+0YgVHhQHBf2NTpfETRFJBEtZIqBTWBLB1UI46do?=
 =?us-ascii?Q?56a/PEiR5JUu/ne1P0hjN7V25hI5AKjslSvRCU/qqrpDBjqsl1n5TCq32i9P?=
 =?us-ascii?Q?6o7pFnbzTSbdmesTq4PdNzYtzXa2yGUJdIG+fqVDxD9EOZgHyVp75ckk4wVJ?=
 =?us-ascii?Q?B1FE6SZ86zXccWdMnlRpsXpK+r+n0JcnctSuHhmawPDZWDz1JC1OYGIB5zfc?=
 =?us-ascii?Q?NLaIgFD8imFtJmTlj+whFLtwgEQ+BhC8+89vbGuOt6ZFRHRPAI8WjItsnS9z?=
 =?us-ascii?Q?zZPbEE5Pd5awtZi3/PWi0KMoLOe6kp43Il96HJY6eLQ93nZ5B4YhAvJSfJoo?=
 =?us-ascii?Q?GbxNyUqVCewFQqO0bCzLzaTLnOgyP04grDeS2TAlUf88u9t5OpdC0vvVzZRO?=
 =?us-ascii?Q?xM+nuP/NoVbqPxDq9AsErXH8se0yJu4nlcgYZAZL8by49XYK4XwJaPjL6duD?=
 =?us-ascii?Q?C23cd89OIoXvo+ZdS9nfj0vcpaFu1Nlcc2pv4pIq9dTqHFhyX9qivxUnCBcW?=
 =?us-ascii?Q?Dqq2TISGYNZdFfPSqyYaWCH4vofQfFjlCR0uSF2VNOMko/BtUEZUE6glquQ2?=
 =?us-ascii?Q?/gaY5cD3I93bNC2qBYNlkA0IT/uWYJPQ54JjIloqz99QbG6J1borjHojdIBf?=
 =?us-ascii?Q?1KdcE08RysM3+gBqueS0JV9zqtE8AvK3GNQxGm2xhqVEWChcb3/4ic8iMTXJ?=
 =?us-ascii?Q?xPQD6jfhUDgzyVTp/eSZagKL8iCHISQ6sv9ipMdZilFgwmpdl1BymJqafbGn?=
 =?us-ascii?Q?yxITO9HjzheL0MnCrF8PUmY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43798468-76c1-41ee-5087-08db57f5b5fc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 23:15:03.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1AiF8DPj14IYDAmhj0b2CjcodvGuZqJN9au7n3KpzHUPyj+uhEPXCrR1Yl4SpRaHxQbFhfBC+MYHaQX4Tyqb9F+qruexXNkrqAP+lLCjsU+4X/9lnA+HpuXlWYio/CdX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12110
Message-ID-Hash: MINNROPCYB2KQNLIX4HTX4I7NATLP2WC
X-Message-ID-Hash: MINNROPCYB2KQNLIX4HTX4I7NATLP2WC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MINNROPCYB2KQNLIX4HTX4I7NATLP2WC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

> > soc_get_playback_capture() is now handling DPCM and normal comprehensively
> > for playback/capture stream. We can use playback/capture_only flag
> > instead of using dpcm_playback/capture. This patch replace these.
> > 
> > NOTE
> > Some Intel code was complex. Please check this patch deeply.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> I've looked twice at avs part and skimmed through rest of boards, 
> overall seems good, but please split sound/soc/intel/avs/boards/ and 
> sound/soc/intel/boards/ into two separate patches.

Thank you for your review
Will separate in v2 patch.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
