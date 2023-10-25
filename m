Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B0F7D5FD1
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 04:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F1B1E7;
	Wed, 25 Oct 2023 04:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F1B1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698200371;
	bh=GEFVvIv8zJUjCikIiYndKN4FW87hLYbJb/HHm2b2w1k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=P4WhBVB6dbXhnxOZcSaAVW/jMClsjD1AA1ugcMaNGyifEmLrwAx81l1mXNajUSGv7
	 SPrwAaoiGbtHbcTaQzyEe+wVq9DIbmWHS4q5jCWJMjcy6xxVWW4u9ovT5eQFe5AIXt
	 WLk5O8qCdXesmFF43f2gRWM6vLK18NbOG7k4GyZ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 285E9F8028D; Wed, 25 Oct 2023 04:18:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A984BF80157;
	Wed, 25 Oct 2023 04:18:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AFDBF80165; Wed, 25 Oct 2023 04:18:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01929F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 04:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01929F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IWNZMOUO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA/TWF07DV4DgQyy77U8kmAEQn5r+dwdOtTX+b7UYFbc0hedU/xaHken1V1BrV8n0M0xPWVykLRUZvK6YfvCBTPZzKtxaLA8g5Ny1rkGt7FHOerWqOkpBHF+Y4zEOFrp9NJuai7c2BVWXXYo9whA/5ekJPyyawO0hFS1lMvpzmGOxe+mRaV2d+57fHW2pq5zG546ceCkmZIPq9FX9+VzbbZo0pe9PbcpdtUp0g2jGvzPtvVxOJh0ruVBfZbvmeEt9NjSoi0laoM7iArSxBCOx+tdlliNGY9DNHjOB3DDM739PO/nQtb68OieCYq6LMmy9tNzngBY3ilJo3iHHLxDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URnjzTaot51umwSipZYmi/jTjY7FB9VjZl37ibiv3ZY=;
 b=ajT/jBa88giQqSUoIpQVs8EPSlaPDu2KLpqIVbxVYjgWNhxleO2c1Pue3hKIpqeyeZvYIUUzhRrZ0prAxTFJmpqM5ST89sf1Ji5R8YQ6/wxumAczi58NjarxTEjQ3cbBvQsS8Vg5VYcJts1QEHp25LxwQlj+yOBd9ZKBviBsVoyRBIaqryROkKR8FZGDRsAkBwkAVZDBbSqVZE+bS2wshA/qms9WSFPaRVHq+ErEeCcfvBeSit3ZF49bCg2YBoK13nOUR+M8DcthOq8zy0u2BV1qWFrVd43U3aF5SA1+aZjweid1RZVfBB2w7+dQGIQO3xC837jEVSYzPNL3HVkfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URnjzTaot51umwSipZYmi/jTjY7FB9VjZl37ibiv3ZY=;
 b=IWNZMOUO1dzrO5KzJiCoXQrF/efocxurDHfPQxiDPPNdqIp7DeK7x5Wods3P9AU6T9J4nFGEH5mH2XNFy8ExjpibGUu1We0zDWrutJk4TTQAFPQNG14cEFMy0+MehXF16LK3KDuZAwnpXTXwrotRu7jIAAP2uuiau+33lg03Ocw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10372.jpnprd01.prod.outlook.com (2603:1096:604:1f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 02:18:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a%3]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 02:18:18 +0000
Message-ID: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: [PATCH v6 0/5] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Oct 2023 02:18:15 +0000
X-ClientProxiedBy: TY2PR06CA0019.apcprd06.prod.outlook.com
 (2603:1096:404:42::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: 989d3a77-1ae0-487e-9d02-08dbd500a5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jHRyk0Otw7oBZEVjOwhR/tnaU3Ye3pVEq2P5GhGwWQu8yMIPeWwxnHOkkWcQ/9qEAknrUFGV4Rxvn6jRYww2sgxsakU88QQEHlNjuUobZpUSIudsgFlirWQ9CdTv28c8UQOMWkBBglVTwCh2y8ps6snHxCa2SJQ5zR4YCHRrV8YqEnVMh3+dqLCKTLNkHGzCseiGCAgpUEUfosWs+icZpjMHgwDSjUnIuahMspsS1IH+HXTZHU8T+JWBZkqn7mJknDauD7OOqKiFJpvqcc2E7MJneK3238ru+wzLYatfNpdPJNUov9RJj95rqJhM57qktvajtXr+gIapj7nq+2n1u3GGF+Y/InFbnLWryqtm3ItJU/1pXBY2lNjN21GKoG8SJXTeaw50Rq8JyUTXIJr0g1bzfLK8AQBHFikWyZbGbrrkEZCXab4HF7cI7SAK2zUPG7YRGnKsIZV5WQfUXletxtwpicRuFvDpDBXXc+Sb9910caEQSbj1jix6cUECdVLusyjvuo0k1wM6iIXDx3kc6zPlkSitFgwSo+YaE4U0jpsyjQP79s1s2Nh9L6nxZblNvi2jZC5MBs3GZDkNzYnWgrFthzIMhta6WHHBkarXlwYFrGkxP9vf9LH+Avv6eNHMJmygzZ1hzuPJK2+RLfivVkz/IG3ACbeHSIxaixEKzYI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38350700005)(2616005)(41300700001)(6506007)(966005)(52116002)(83380400001)(6666004)(6512007)(7416002)(66556008)(26005)(4326008)(8936002)(8676002)(6486002)(2906002)(5660300002)(66946007)(478600001)(66476007)(110136005)(316002)(86362001)(38100700002)(36756003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?88rmSiEVxyI/QD201SOtLmDTN4Sgv32D5XvkUyHnRQ1EhqQeJG4CvDbZ99AG?=
 =?us-ascii?Q?/Qz8owVAixh0KSq3GYHpeKiTDYo0tDTp5lZO1rVhcmiB3xXtUAQ51GhVHvmk?=
 =?us-ascii?Q?Bvnn6fXWbumjGNtC72z8CKYMC9GKMhnsk7xXGC3kqMWYjH4C8geVr6s/zAsW?=
 =?us-ascii?Q?MW/Xa9pYyT/h2vc+CMnVodifZAP3PCUpYdzxJvOtgJymL5RQEczpf4pXJVEN?=
 =?us-ascii?Q?zxPbV0dDmzIkVmpd6Wo+CyyL6mHp9FG0212DaRDMcaSwuss2hrwnRCn5jhZJ?=
 =?us-ascii?Q?F7hzTgcyOtdEuPRqzGyfrNPxdwLNlobvNpmLDf9ZodMDGdciBC7y2lDGuZ1z?=
 =?us-ascii?Q?84pTN9yA20p4Rcp4XOkOQR6SbFvqbMVCMl5pFn+D2rxJu884m2MUHupbvN73?=
 =?us-ascii?Q?vC28OL4Gx7kYi4hOkyHNM9u9frX3qoltZfwv/WU2iw8zQBEbxnIL9B4wnTFS?=
 =?us-ascii?Q?exN4P15B8c1763FEtuAsm+oUz7eRCNqfw9/z7QWSkYLMb/ofD1EzoduPeH9V?=
 =?us-ascii?Q?YfgVt4rofBW6RMZ/dp/YVzxR64LEfxs2X9diwXNkHOx/j2ZxtkHa9s8PMt5E?=
 =?us-ascii?Q?tUvrNo041MWtC6UlD8iWF4AA6dqLHIFIxPh4I0DF93sBlYmeKIFzZugMl90A?=
 =?us-ascii?Q?6d3lK4pF/GO/orGogSejvQ4cEeYrmcOyRtkEBWOgE556Ic79/e/th6KXrlvy?=
 =?us-ascii?Q?dxwAyjN13iX0VGQ333xytfeD5r8cllWPp80tL+s1VaET9xDPVndSO20kn2GB?=
 =?us-ascii?Q?M8WaJo+IVqMvVzIdjfvALRUbRvO2tk/koZnSNAvQ7NETzrC083V6paX2i22/?=
 =?us-ascii?Q?N76HvgyMuewiaOqiHny3LGPi2Mqw8LC16F4qHfCctGCRRdFZIrroeFvZeyiT?=
 =?us-ascii?Q?a6Ay+qZDl8Oqfv5L/P9EVdu0eBUTFhJSPaAmgM7KkWW8YfwrqDuUs0W4wJZw?=
 =?us-ascii?Q?h6q996gm1bo6MfJ+1IP5cTVmi1zeuen16ACA7juz56G65BXb9EM1pS6xLlzD?=
 =?us-ascii?Q?EOecglJiD9bZ9SEiep3XU124kReHsPNd4jWo12cvCt9yFkITvmkByknE6U0e?=
 =?us-ascii?Q?FZWGUcE4EcGIKnyFsag97FP12xm83o3x1bAU5xM6Hn7VGEgzLlkBgK7jWfvq?=
 =?us-ascii?Q?BTBMeTJGTylHAErMkwac7DLxggxZAWQf+5D/ldfsgiEv3frFWOhsigxwCQz/?=
 =?us-ascii?Q?A/p4x31HQ9LcAxH1sg1NXPlaeUBgEJ9kz+odzw1N5SCMq2qc+oIdB+3ovbJ3?=
 =?us-ascii?Q?S+nP+hxFBufXTEExmpa0BAlGQmtyr4pI1q48HUXHvdfaR2Z3/W02MwXXiwGN?=
 =?us-ascii?Q?rYI1UTTRszhUL8Vqw0mIRJZum2s6Jjd/5MrgbdbTnwzUNaEcxVO5Wa2uGz8L?=
 =?us-ascii?Q?UAdLb9LBY/W7BUwyXiHWCWZ/KFRjtHBMW5j+uTtqMnXHxIxhG2x2KpkYjxxK?=
 =?us-ascii?Q?UF6RpMuR7Mft69m0cQYtjUngikieNLllSeK7MJZRvvwWgyfzCprt9Z3VzjL+?=
 =?us-ascii?Q?5rXFwnjZ9XZoXCT9S7FymAQ7n8dxXYr3EdWCnQGxHMv9HgqWQU2JN0k7lc8K?=
 =?us-ascii?Q?/s3lBZrfRfQNGhnrdo9pMLvbkUcDXdu8mdGBNTF1A/kzse5OKMZsRyt2byGB?=
 =?us-ascii?Q?UhHm4ZnpyzObtLbPaGuHxJQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 989d3a77-1ae0-487e-9d02-08dbd500a5c9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 02:18:18.6679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YPrq8U4iGF8jGBJ7TuYAvN5B/vHCla0KW1ci26qEesYNTzjFYSAfTYF+/bHsdrd6Db7XKtF5p0SK1rSqfpQJ0eQ2Vzoo9ZaUJti6C2SL2WM81olp3Cfi6SkpdxhLosoc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10372
Message-ID-Hash: 3WOQKCIUAX7K62V4PF4LEJK2KHXWSBUG
X-Message-ID-Hash: 3WOQKCIUAX7K62V4PF4LEJK2KHXWSBUG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WOQKCIUAX7K62V4PF4LEJK2KHXWSBUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Bard, Pierre-Louis, Jerome, DT-ML

This is v6 patch-set.

Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
ch_map idea. This patch-set expands it that all connection uses this idea,
and no longer N < M limit [1][2].

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]
Link: https://lore.kernel.org/r/878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com [2]

v5 have changed basic idea, and Intel might got some effect, but was Tested-by
Pierre-Louis.  Jerome's environment might got some effect, but it is less than
Intel and similar environment was already tested by Audio-Graph-Card2 and its
test dtsi. Thus, I added their Tested-by on v5 patch.

v5 -> v6
	- tidyup some warnings
	- rename "ch-map-idx" -> "channel-map-index"
	- Update "channel-map-index" description
	- add Tested-by from Pierre-Louis / Jerome

v4 -> v5
	- use cpu/codec index on ch_maps
	- separate card2 sample DT patch into prepare and new feature
	- ch-maps -> ch-map-idx on DT

v3 -> v4
	- add Jerome on To
	- add "description" on "ch-maps"

v2 -> v3
	- tidyup comment
	- use more clear connection image on DT
	- "ch_maps" -> "ch-maps" on DT
	- Add DT maintainer on "To:" for all patches

v1 -> v2
	- makes CPU/Codec connection relation clear on comment/sample
	- fixup type "connction" -> "connection"
	- makes error message clear



Kuninori Morimoto (5):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: tidyup comment / numbering
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
  dt-bindings: audio-graph-port: add channel-map-index property

 .../bindings/sound/audio-graph-port.yaml      |  13 ++
 include/sound/soc.h                           |  56 +++++++-
 .../audio-graph-card2-custom-sample.dtsi      | 136 +++++++++++++++---
 sound/soc/generic/audio-graph-card2.c         |  49 +++++++
 sound/soc/intel/boards/sof_sdw.c              |  28 ++--
 sound/soc/soc-core.c                          |  95 +++++++++++-
 sound/soc/soc-dapm.c                          |  45 ++----
 sound/soc/soc-pcm.c                           |  44 ++----
 8 files changed, 366 insertions(+), 100 deletions(-)

-- 
2.25.1

