Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8666C98EC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:10:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24AEC886;
	Mon, 27 Mar 2023 02:09:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24AEC886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679875844;
	bh=2WPcRjiuBWwkzqRwDawbCsxGYcanuytpl8fOwynTSFE=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Fq9Uc/8oCtKimglGUOqPCWEDgEvUYPoUAE+u0wwDRekLjdfPecV2aPTh2YlO28sVU
	 34BQjfhD942N626ggixb0pq9otRWPWyHj67FTcnKkg4II99SfHLrlAsfEdFNkuP5nQ
	 63EeDv2KULO3QIQOv8MAl1G/49ACVt1tnZe1CmlM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF04F800C9;
	Mon, 27 Mar 2023 02:09:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7261BF80272; Mon, 27 Mar 2023 02:09:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC076F80114
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC076F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=byKQ30Og
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHSDyW7d+kpoYWxgGpv01IyHwosKUD7VceKSHkydI7ZPTYNCSygot1WfHxQcl2z8I6+/ibqOUTx+tgzFNADVPoh9Ua45so/3cdQDTBx7OYjVUtgjCBcKlJqFd78ywIcvzPlYW6ECmtJBt9MPwFbvv8P/DO7LvXuixszy0vGNeSa5K9ZfRaHqZcUCoSyOs4nOZlE9CHZ2OwqMm61qw7tffTmYjuJ89UDDBMf5MnLB75IoXHwSsjbfKv5GAKJJYxjgxqCSrqmxK44OCslZjIr2OhF3A+25O95gIaHWGglmNjz2QKsWU4NSEmRGwycIdxxh42A5ED3T+kQj0YDKmP42+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyMN4spU6WJwm5l9u5oJfdKPr7g0ohftcPBSRm50TZk=;
 b=ogLhGFXSCiqETvqAL7jXGRNhtR3gfsHFzpW04x8NLb1jfB3HMpqDN75SViffxc6XgGyt9PzmTfiQfMqMxwHXn53/DCnzeEvbxzb1R+GwICR4LB3v2xZBcJkT3T/hv+BYKBZ0FhM62zIooDxUiuHUovmrnab4O+lvEdQq1ipTMH3I9vnnWJ4eiDhMvaiYn5Ltp9FlQW4eJOawCDbSCSaw1cDETv8WvFPA4RkulIWUUpEqq5wUOuyIA/jVga0DZUSNSGKdhCctumaW8GPfnXOSwCaXqWjAjFlO6dUgYmK2kP3dmyN9ww8WwXLEmySgs4T8SosJ4cIKlL5zKchBMAaRDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyMN4spU6WJwm5l9u5oJfdKPr7g0ohftcPBSRm50TZk=;
 b=byKQ30Og12P94uMZJUox0XMx+Gr/AnF/39GnboP8//cy4PW3Q+796wikmai101wftfheGCD33IcvAHxmMTfbFWGe2hQJCLxOgEGF8IFZuGBW/SZcja7tAprO8SAUmrrmmKSiBHSawqR1Bv7IqpyI/uRsmbOeWCrBpfWNavpeEAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8192.jpnprd01.prod.outlook.com (2603:1096:400:105::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.40; Mon, 27 Mar
 2023 00:09:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:09:26 +0000
Message-ID: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/5] ASoC: clarify Codec2Codec params
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:09:26 +0000
X-ClientProxiedBy: TYCP286CA0018.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 53337e5c-5ab2-4208-1162-08db2e578723
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iGU0nilUcmRmWU6QSFjMt/H9krhVJewxeDbhsPQmPuxO0KcWHCkalv+RoV2UiVT0GU/xb7ZwU5dUEHI2o9bVPHcH3NUe9mK6UJoFJS6J1qgfiRBlxRclynHDW3CwR927O4FrRCxmHFGbCCer+JYWq59lt58rRUJQWRzE0vXiCNa294zCb1L2tU7adgydWLvCPL5jxTqa3cH29P0qVXGXJlUTqH1iazxTDtnHHG4S8Z0RzeP/stKDyxA81Xk63Ibj4CNAWe/ArdrvH1gwmJfhUt1kwrZn6AN+g15mlOh0wuFbHz1XfKTaO78iyBu/9Tt5N5DwFkcqJBg+oL3cJ2mpYHAezbePvfTqa22Q+PrsZWxcVA4II0Jj1WYGgSnv5oRjdqbivr3XVd1IZF3EiikGd8LqyX8OcGy9z2R98QDB2kotO12tS2wNapOMdC2yR+9c57riW2PLB0DzdOHdbiZN948Q98zyaTCPHEOlXKodTYuISVmHzEWj3K9zPEgjisrGE0DnBxA6HsyaUsWPfwtgPB2ZHTih+969myrHfhKWF45sxE8uo82ox1zynUZePq4L+KuA07x/V/Ho67rTnoOdBvWG54qqH+Jj4FxuJZLsqE2VARpwbl6NUYyoduWy0hS5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(41300700001)(66946007)(6916009)(8676002)(66556008)(4326008)(66476007)(186003)(6486002)(83380400001)(2906002)(52116002)(5660300002)(26005)(86362001)(38350700002)(38100700002)(6512007)(6506007)(8936002)(36756003)(316002)(2616005)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ANsCJt5auvQUy84oSMXQ86JnMBGha2CKxR5xHaV5zy0my5w3CzL/S5ftbKvc?=
 =?us-ascii?Q?/9H9YyXIAZ7OIGVqpL8esYcNJSjAZMgYPulSdk0uzFnqL9+nl/VvLwHAFDVu?=
 =?us-ascii?Q?NVK2OBCk57ZX6mO+BghUTTd07S0R+MgV9gfWIWH/7qm+XFfgkzROiAUboIkX?=
 =?us-ascii?Q?DeQ/i3rtit0Ok2JY5ynGKlFqiUI9KGxxq3tJQff6ex92GmZE5xViKKSGwNUz?=
 =?us-ascii?Q?ZCIiculFwVZ/QV2PltB/m04oZ/hSR4hnELoCTkVMgBX36weNvUeWv5N1G66D?=
 =?us-ascii?Q?vhlAomsMpxRVQ2hyOhkWEEkcjPsdW+yQnjggHhUy3s+DK6+z9ZZh7CgmSiP6?=
 =?us-ascii?Q?W3sxEc9ddV6qHRebjQLXB5xngSL0LwJYjUfiSCCH9Y9ot0WptCs000sEm9j7?=
 =?us-ascii?Q?0DZgBFYZAm48N5u1kUYG5XpB5kkLPZ76OHKWIFTgEjEfY/mctOl/wGRwduip?=
 =?us-ascii?Q?Fetp7eSFeNTq2Jb9AFjMs1HvLAP5hyInufxgbUE6hKBrE0P282G944ARTIjv?=
 =?us-ascii?Q?kz0g8KjByJ+t2GKOzR9xD1MArffq2k+E4O2L41Iesd+Yas4C3itunqMvCMPQ?=
 =?us-ascii?Q?d6UMvn3bLvOD65+G3U/imSqE1urmA3AcjOGpe8UptSz/VB7zLzJ4jUsjPNNQ?=
 =?us-ascii?Q?59IKXpc5BMuJZKx850qwmDFIY2kUDqNG2pgS8Ay/K09i8VbvyGE7sHh/iaRy?=
 =?us-ascii?Q?xwxqm+0dXlrOJsgOUexzcPyd2MJywXgCFVs9Z5Irp7HsDdNOToXfLk4CJUGf?=
 =?us-ascii?Q?dlXfLOPTZiAelP++/xklUkJtWQqtnBI3d9sKLKObhD2JXQ5pPhzHaUaIDUtX?=
 =?us-ascii?Q?UOepZio7IbHxQZkOWGCYd2o8FKC+MWjJMIt0tMydcBzkqE0rPK4gx5TgZpjy?=
 =?us-ascii?Q?Sg+zrv8xmgYvJ8JkH95ifX3MOPPvryY8zpTbvICKadR0hbW0cwYsoEDANlEv?=
 =?us-ascii?Q?wkjMNTSwNVJ+/ToVim5/3hHcsy/uU/OOzzeHI3/5wPcXFjPRR59F5V38ScgG?=
 =?us-ascii?Q?fdNXU4fNAnr9voH/TrubP4/2EgeWq3yvyN3IZyB9XARsCECoaBI9H0RblXkx?=
 =?us-ascii?Q?tjaMXVhbP/3TgLipT07vTKqfcHz04wMFaEmfLclOeNcKMz9VkwCg2Q1kqEsj?=
 =?us-ascii?Q?e1+/4/hIESZGa5AX7DE3R8ZnBpC4DBgNr0f7fcqgW1wRiDxFtDHmRGZCdSgt?=
 =?us-ascii?Q?mOZMgGeycXNeSAycSLx9ELXf8aUnua6SiBUBkPKtp7LtAk+TGdtZ9TUzSaav?=
 =?us-ascii?Q?JnVnUtSi61fkEMrwL+WB6TwpAc+ZbTS/94c7PhFVx+CYEA3E/RJvl1fRF8ry?=
 =?us-ascii?Q?jmjQryjx396guIaxdzhoTKisiy1Z+dSSOipyDpBNIpGFz+ediS3oI37jA1vP?=
 =?us-ascii?Q?siLFRqFnV5x29fj4CpS2dSpxzYdhiD/jOgVu5bf6n9PCWbtK0iE4qjYjqTK6?=
 =?us-ascii?Q?Yblme3vpc8HXkXAy96Zlj90eaboADqwTz+HllOnhqmT6j86t9KWqVywaiglC?=
 =?us-ascii?Q?gc5NvQGiI93hJVrg9GPAiUPyhXadlIikORL/4fUWjupsBbUIk2GYjONG7gAN?=
 =?us-ascii?Q?AtVtHn+Lg0678Mf9Jkq4Q76ySOiAEdqHam5KJ79/sfVLQFfnUAWD+uox0VYo?=
 =?us-ascii?Q?hix5j/BQpgvatkwO+ct7dG4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53337e5c-5ab2-4208-1162-08db2e578723
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:09:26.8662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XgHfEuwgpl0A3BCFJzOySerlafvjtDnEr0HI4rvmNG5GGfgAKKjJCYv4DMrqEb/iZtzJ2bFypHlxGpE6adPCQk3MAZqqlZ4KL7BobuIgrGP1ibgGJXZKQYLppHYPcFHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8192
Message-ID-Hash: MR2IKLOS6YCSCDKNMKNJRRZKXVDASVCP
X-Message-ID-Hash: MR2IKLOS6YCSCDKNMKNJRRZKXVDASVCP
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MR2IKLOS6YCSCDKNMKNJRRZKXVDASVCP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

ASoC is supporting Codec2Codec, but its parameter name is
"params" and "num_params" which are very unclear naming.

This patch-set clarifies it by replacing to c2c_params / num_c2c_params.

Kuninori Morimoto (5):
  ASoC: soc.h: clarify Codec2Codec params
  ASoC: audio-graph-card2: switch to use c2c_params instead of params
  ASoC: meson: switch to use c2c_params instead of params
  ASoC: samsung: switch to use c2c_params instead of params
  ASoC: soc.h: remove unused params/num_params

 include/sound/soc.h                   |  9 ++++--
 sound/soc/generic/audio-graph-card2.c |  4 +--
 sound/soc/generic/simple-card-utils.c | 24 +++++++--------
 sound/soc/meson/axg-card.c            |  3 +-
 sound/soc/meson/gx-card.c             |  3 +-
 sound/soc/meson/meson-codec-glue.c    |  5 +--
 sound/soc/samsung/aries_wm8994.c      |  6 ++--
 sound/soc/samsung/bells.c             | 21 ++++++++-----
 sound/soc/samsung/littlemill.c        |  3 +-
 sound/soc/samsung/lowland.c           |  3 +-
 sound/soc/samsung/speyside.c          |  3 +-
 sound/soc/soc-dapm.c                  | 44 +++++++++++++--------------
 sound/soc/soc-pcm.c                   | 10 +++---
 13 files changed, 78 insertions(+), 60 deletions(-)

-- 
2.25.1

