Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB3B7152A6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:50:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7661C208;
	Tue, 30 May 2023 02:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7661C208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685407836;
	bh=HTEaEfuRJ+JWrhEnn3OEy8u1AXP/1iGl7pfnHethpGc=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N4kketVwMTExO8BVRz/lWiHWGJNflL7TxPIkPITIpJ4A6qI0u2oGC3y99S5647jzT
	 41EE6xxCuvFhhkQtMEjd+d9pKeF7eMVWjBGB8vgS7a5Sw6wkVTWSdLWGYRemQJ4Wl1
	 h38rWCQjwsybTlEXFbtie54PNr8PVbbbJehfDRZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A9DDF8053D; Tue, 30 May 2023 02:49:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF1CF8026A;
	Tue, 30 May 2023 02:49:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B647FF8042F; Tue, 30 May 2023 02:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C878CF8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C878CF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lNjBohcd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWsYgJWYsX1q3CDxPjtbAFQ9uZ042rE4ZReaO4fd8LJvFSHXm50Z+Qh5KfAXzC+/9NF80MTTXh+UDRiLchg6E0ZDfAm6P6FeLsG1SeFwdHTPOVfXMb31bZbw4vx3hxxFLNPMYXoXIkx6HrakdZ7aLApTk00trffJglcw9mSn0g+CgPA5P4U0Qlf3NN81gsa1ajt3qaeDYIFTr3ceDGi7CKHXp1wQNHq0nGpbDEKmBmhBLK0mfyMydEwijdRPPS0fk1vBtfVJFUHXz2igTgqzPMxLLwUK6fAI4D3A+4KOAfOuLDP8DJzitUhzDvvWvguMKwLZPRJm1ZhUx0paWqsQSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t80uOYpE+ZXicwlir8GuCNciDxA7Wb7YtPfbBYWd12k=;
 b=F1y4nKRrujY4cm/yesSGuCLqDN8VQwim7Tl/ByijDEmfoVSy6+kxt0i/+gxoLz52hePtLtao/fOQo0ydlW/vtUZaIVlrTCtkjqRvYeuJVd23KpHrCGfrMU2Y/gxbbatEodSItsuU9zHtuKmkFVg+u/HKBPhXzvaWiPLnVLMf3FEoLBKaL9mcz6r/fI2AupMxadwa2dNDuSmQEoTR14dZ7NAE31rwjpg6eZwSPG4oZh/urU+/HzHGlNFdcOkyQmBpEgy7YuiUCxj4DuS1Bz9K1jT6KqhEtOJGR4BrsCnDNLedJT6zgYyqyT5pRQhmPz6pWQoiyapGfwBMpxjtedRh3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t80uOYpE+ZXicwlir8GuCNciDxA7Wb7YtPfbBYWd12k=;
 b=lNjBohcdT47A2c4AV9fNXRYURLaWh8p7ZALf7mV3FBqba/ppIrpjR9In3B/qaLTndMSdrG3eKW8cwHe5BG63L0fGWuYsz6YT3W/Q9IgPTVlpjNnAP2STFT3UMP/5eywabeRA2YuCw5GGEieROvk3OWs6V+83fBz/NzsQAXsGHSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11502.jpnprd01.prod.outlook.com (2603:1096:604:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:49:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:49:27 +0000
Message-ID: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/5] ASoC: minor cleanup for soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 May 2023 00:49:27 +0000
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0cb56c-977c-4d8b-168d-08db60a7b8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qUndfXnquJ4cdynC4AkX0Oa6PVp357zGCzW26+PAyd2HkzkBOXL7Dqrt82qBBVnrurndURXzvkMTowMKfUgbrnDYRQ4m+TQW07M2CVTSYWX/4tUvECPVZ5vKVImwKlEFKsSlu9MLYjIN5hh4gx+/UYe7tzMYxvUVQ1C2/3bDf++HS73E52QYp6IoinX8V8HShpA14E2WYyafK3GPQ9DJFPqxwsCLSJjVQDSONG7rejYwGSeUPsePtDw6iHO34QK4Enm3cY6iED+QD2sbYx4+GShgYsyBSakrr9UiNJgCo9VNuAzgpWwI8FBTBzXUYvghXv+apSO1nYrtrXQEEv8LZcg56TV6cjRlBWKaHUkRFtDvS+3I2X0KNgE/Qrqg8Sh80wyiM+YIlyaPoYZOV9Etqkmf4bUCgLJPCxkebMn38rzHvDT1JkYv2LVo1lrZ1A/0csqdTI3Vs1o5MJYZVbYWHH4XG+SEKdwrW8FEVr4HHTSJLU/u6+k650APMdx3vJ6BJmphyLNMj9zj8cRm14JLygmPgq2yB5ytuG5U8HhcKJVPJwq73QiWSRNyniyAJ2vpmM/Rqzoq9nqwCgyJICRV8HC2bjjYV4SADgQca04qswzs4FwGHFykLRQoAiUUAzd9KDu8Trj0pEItuW4yMQ/bPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(966005)(186003)(2616005)(38350700002)(38100700002)(41300700001)(83380400001)(6506007)(26005)(6512007)(6486002)(52116002)(478600001)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(5660300002)(8676002)(8936002)(2906002)(86362001)(4744005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YO/8k0Ef5Sxy+di7GxaeyzZ3MuBWx/HAqEp5XA81bALo8H5nvfhxKA+gDIvi?=
 =?us-ascii?Q?0Dj2RRybq8d0y+/IxfTT8kIQbqBbAF23Prpc6HgiGTUXsZq1pQRw6un7hKpb?=
 =?us-ascii?Q?a7LMqiLJ8Dj9XIcobjMljuacWg+0UrqkJwg9zcuXupoeFH7SirKohBt6ZfUw?=
 =?us-ascii?Q?ib96fwmMC7NGe8Uu3iw2qVstIHGKXoWmbtaE0f5+aw0lptgAaxQDwPy+NspN?=
 =?us-ascii?Q?VQeyhWSWVdDiNid/f+6gbBuzK/izphXTGzfsSHEtC8iPWFnaJJLos3qJ8KDd?=
 =?us-ascii?Q?He4h3pkbYK2rJ3JoHSmv1AzcyuUUIcbMOMCSFHv4BkFX+v3ccyTvsalebzl7?=
 =?us-ascii?Q?hyVkVBumrAy8HTEXunrDbAxdpTwt9+obkbAY7Xh31S57SjXp4+waNEXDhMja?=
 =?us-ascii?Q?4StuBf7PEBAG4qYudwD3aTRFHBO6Xc1gOLqAPswnmG5A9oDgus6eN5aTFsIT?=
 =?us-ascii?Q?gP4UkGWzv/qIu/Pl/wfGMiitNrfkdSLN9mOgJzm0FrgWfBRLDztKLf1kCvkJ?=
 =?us-ascii?Q?gvTSXLWVkYtsJvch7NU7lMNuf04CZBJoZ1NLhI4xZV/GN90UGl6VpIG+vct/?=
 =?us-ascii?Q?L5WauBaQ4nc8TTJzhtc6qNoghGoZSQAYRk9MA0Aq3oNZO/cIJd6W7UFqS6Y3?=
 =?us-ascii?Q?NmkVkD6qMDqfK5L1afQR696syjiZC4RWbvu/dT8Vm33Z7OUR4lup1fhbGi6a?=
 =?us-ascii?Q?QSh6iBEOmT29ZV4BvpuRvvbuubfXuUOCw1ikaHRx4gDxUDRyNVm+f8gAhIwn?=
 =?us-ascii?Q?gcGKf3ETmInAIVQ1WEPZg12H4i+8TwQKUGKVkk4kIxZsevhx3XZeuvEEli70?=
 =?us-ascii?Q?x8F+mAeu+O67NnMykwhGMOh0DB5KNi2Tm9HGp4eOmQNcTeJbI3hOvzykJZeU?=
 =?us-ascii?Q?bxPdz66NoTb/OSZDU1v0pQzq9ZsGo56AXlUL3hhWu1/NlN2avdh9Hub4b9oN?=
 =?us-ascii?Q?RrhfYngqTzi/NCj58iuFoi8bRy+Aj76qpxUde+JCNG10y9kuY0U0nPQ1n5KU?=
 =?us-ascii?Q?8l3iktPvVF3qyG3+21lnocQ+8NTHSXVzoH3Sw53/yUxPud0ApqXH0vglFATO?=
 =?us-ascii?Q?oLkYS/rmtvtxSm0tFsqKIP1hKNWy4dIXFy8d1l16IO/qG/2RJENdOMMDV/9h?=
 =?us-ascii?Q?N51f3h37Q9okAgQwVKCAcS8a5Wz/ry/iZZrnwsC9yhAYkf6Fssq5to0s5JcX?=
 =?us-ascii?Q?ayCYcmZBldkqd3mPIdNktQ46jGVRFs4eKDndy+Xfs4rH7Lu+l65mx56NGBm2?=
 =?us-ascii?Q?/k8+FxWd0VOwAZeaUWZvxZ2AxmhFDH8ulfz0Sp+mQLQBc4ymTfF+MW0uVNxE?=
 =?us-ascii?Q?9MoNnqKDXo4snT0P83NLFiITpifU4YoGZb9RlL0xTqGgNYLZoT+M8NSn7uJ/?=
 =?us-ascii?Q?Ubn/hF7mI2JXTAeBz+JFY2el7J0BLf9YqnMLXw4B0YPaycnOYn+30FrDktIK?=
 =?us-ascii?Q?MqmiUmgJh66wljHAyAMCZLvrI5xDx3Wv7TGg+PIbUr6iZ6o9AGAK8KNqYr5V?=
 =?us-ascii?Q?Os0Z8uFa/LpkiqNuVBgbZXs5Cb3glw7Y+WWJ3+iGyTFWNtCeBsYqUkVGFwWC?=
 =?us-ascii?Q?pv7V5YhmkIDZrWnRkewfCTWhDKs5H1w+6bcAdAdxVRQCjvxNtjiZ7vYLuxnO?=
 =?us-ascii?Q?J5FAXeSRAibIXzGMD74iNgc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ca0cb56c-977c-4d8b-168d-08db60a7b8a1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:49:27.7808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 owLU3FxDtWTzdEC3J6/CVQLjloFzUjcT+rYhlR4QwmKlA3k663NcY/bjDeIMwP5LGMLcY125XsKmEQRudr5rJk11VQkVSIwA4i2KsN2Un7RgXXT21/3umiGK1dvW08my
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11502
Message-ID-Hash: PAVXTGK5JZETBJCUSE6WHTIUEL3IVZUM
X-Message-ID-Hash: PAVXTGK5JZETBJCUSE6WHTIUEL3IVZUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PAVXTGK5JZETBJCUSE6WHTIUEL3IVZUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

This is minor cleanup patches for soc_get_playback_capture().

Link: https://lore.kernel.org/r/87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87353uqjiu.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com

Kuninori Morimoto (5):
  ASoC: soc-pcm.c: indicate error if stream has no playback no capture
  ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
  ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
  ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
  ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()

 sound/soc/soc-pcm.c | 58 ++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 25 deletions(-)

-- 
2.25.1

