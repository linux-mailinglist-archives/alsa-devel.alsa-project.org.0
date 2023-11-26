Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A857F9663
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 00:20:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175F4832;
	Mon, 27 Nov 2023 00:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175F4832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701040801;
	bh=0caVp/le8xOjFzqALvsnnUHcTEf7JntOe2d9ASKjKhw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eFX1B2WkDJw8YBGyc1p+/fa6BElw38DeR/m2YLdyFqeNIRjOwhlsig1oUPRcAeqF1
	 S/2Q26zic0xoIAmbUZDaraR2LJLEHeyY2lLaAbh0cr4WuZG1H+w/BwdQy54hSYyb6i
	 W5a9Xr1xZlkm5njd4/BlO0+reTqwXs7GsxIXNyeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F305F805BF; Mon, 27 Nov 2023 00:19:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91992F805C2;
	Mon, 27 Nov 2023 00:19:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A19FF8055A; Mon, 27 Nov 2023 00:19:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55044F805AE
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 00:19:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55044F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N4nDNBje
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7fYay3TBqdwt2oPWhByeG6S4UvBALrBf/L6EIT9DkT2ZzO6HxqKsnvaaEuSe9sXG7foJqkOdSpW7BeghdmGqPI5+kisIqzznsZDiKbH3iBpssM0s9AxcglByXKvX3pf1psxeWL1s0WX8kmkqb2lrhQMCFI+c+KHRzKQE4/FUwWoKLqauV5JLrRZYwQzoXcM7FSWE8uMyk/u2cap7fs+vgtLqK5gDc6BCKgLAJHtjVzc87v0hSAgo2h5E0W2WLupq6Xc63Atvm+3Dvj0OJlVtsGb3Y1w4SVB5KCtWDUpauO+qj0OR/xHCB2lWp6R/S7ANNcawIpSMvPHkBo22T0Pow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mzn6aEEqfjRey7eAmQFxfH0YJvdMXpBFkFgceCG4ZM=;
 b=Jp/mCBMPj6mu0LLoBtLOA73kowcpAwgawbtVwWhVUS19dqrCaGJct/yOFTFrmOEzx0ktmK/AY94XXUwRkTsv0UOEFKN3IxnjTIqoPsBOyrf9DMCECIZPyBvYa2SDZgpsyv4sVwv8o2ESH6lMVMnrUoRpv6sJKqa1zyBBs9UCBRlzXlUfyZBfyMj8y8oIgGiYinDa0tQkJW+IzueABLtCJsGzFXpC00Tz0mV8PIORyVQTJ0J2qFABeCQFKPfQb1S4ZA0lBzBlmxj4Nc0sGLA+FLUNa2qOpm/VXNwGKbT5suMEVlcW4FqmgWayKEHsUm04/6f373ox5pQGSoAqUmwZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mzn6aEEqfjRey7eAmQFxfH0YJvdMXpBFkFgceCG4ZM=;
 b=N4nDNBjetYdvKjRRwyEQr1OS2x8uRklEAe2xi54XIABlf27RQ+G8yfWqjDFKA+W2F4qDLrMNDnx+J5Wwr/gpJi5uYbBHzwi/CYe3L1xzefnVnVjMvSh/cc+sHRand6ewDwhH3W14UBzhL1euJDZPrX7nBpWx3QqQZixTqWQm0+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSRPR01MB11697.jpnprd01.prod.outlook.com
 (2603:1096:604:230::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Sun, 26 Nov
 2023 23:19:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::16b3:a84d:faa6:4846%6]) with mapi id 15.20.7025.022; Sun, 26 Nov 2023
 23:19:05 +0000
Message-ID: <87sf4sw1av.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 resend 1/5] ASoC: makes CPU/Codec channel connection map
 more generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87ttp8w1bk.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttp8w1bk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 26 Nov 2023 23:19:05 +0000
X-ClientProxiedBy: TYCPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:405::18)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSRPR01MB11697:EE_
X-MS-Office365-Filtering-Correlation-Id: 2870b504-83f7-4de9-a23c-08dbeed6155f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4KwyhlwcmGfUcwhgR9wQiKyRBl2dRSYwyLJDj0JJ2kOtCUy7nZJ3ys1UsBw1KW/4qDQTIeFrq250AMcsW6Dt5KiosZddNgQ8k2kRoRWjPesOYDr+hIs0lBf+zCVjW7B58d03LFhzYXkQvlHTBuDjwKxgEHo3xD1URDCamO+9jyZ9wm93iqyuCbxXshIlvGRb0fq/tpQhL5AVtScOsnGI+uR2nePgtMHve4zNDvp4wrY7XOdDX3DEg5ozuiMfteQLjCdui8qaA50e6y/lveFhSTBcVePqsKOjNM9H5s05lEhVVNqjujhuS5oM1gawJPl3/1w17hIfkMhaTWW6fJmDyuLKTYh8beqSPfuLC3XLwWIlfL+AiMj3+eElwebqIQ6fIruEPdPbFB29Ky6IGPGfdWXK8MB1yyHu2KttORUnQ/ayXdNDHnAyHv9kx+OSQ07VKRTj4GwI1f712kNgejEm8SZLBSJYlNUUJulN3RtKRO2az3Lx5vXoNnm3TF9E6HVqCYZYy/bVsNDeMRVHQ/Hq26ObrvgMYux28gWsgGRYsfLtaph9M/yqa5ENi3+dbkuGO6CfWNZ1KlasWzbRwQhJBRuchQt7A442xwuPJ2c/cpfy+1ZlygW7XEXZkQAfTWvg/ORrkh8NcU1E/cd199vbOy8KhUnqs3aLCoX2RHrNt9g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(366004)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(7416002)(4326008)(2906002)(30864003)(8676002)(8936002)(41300700001)(26005)(66476007)(110136005)(316002)(66946007)(66556008)(6512007)(52116002)(5660300002)(2616005)(6506007)(83380400001)(966005)(86362001)(38100700002)(38350700005)(6486002)(478600001)(36756003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yxhsnOYJ//r1pklrb1leqsV9IKc/BTx1tfASw9A6dDNgO70IiS/yqTHp/B1c?=
 =?us-ascii?Q?5uNLzqNQQVPZdEBMKAJYuoIhwUr/pKM547Q0mr+2ovF006B0n3U9hnVlkGMs?=
 =?us-ascii?Q?JFjRVGemlNfw8pXCdXlthBQcAwz4ib/b1kjcJM9mq2RRNzKLci26hG9vn0U/?=
 =?us-ascii?Q?OP0NHkFj+FQg5DTuwfshUuh7UdkIEtbrpynjIfP6jVRkm9JElUhdldaMuZwj?=
 =?us-ascii?Q?D1uGiQA2NIeKaLP1M1y2yIavdfW77EPiduputl5iARB6sVogb/KiqbxBvfG/?=
 =?us-ascii?Q?zsBx92yKp/XeqYkvahlQyqlzG4WjqOhftJTOebZ4RFyCa5lvHl7YtjEJyqXX?=
 =?us-ascii?Q?uG5WnkA9qU+11U7oS5YdralI3VkL1AXzTRhWigflNVPhddXQ/K2RKBwaa5BJ?=
 =?us-ascii?Q?uPvTMMhvhRXfvLrbO68wK/QGFJ7O9SCapxMpU76STJnxqJuxd/76+srCpmZf?=
 =?us-ascii?Q?4JZyHCUEoC3misgMzRFNX1cN8vj1RjXftnrkpZHkz1YDR/D9uet8+rThyRYx?=
 =?us-ascii?Q?x04Qcmwai0ZZyVnA3boJ9Y7PbkmtONcE1mnYi79ccSxJBzO1VksmwRYtwbxd?=
 =?us-ascii?Q?ox51Dc5zEZdurRLRPUE2dgXi+1TJhZCq3Ta1N1D8WOQD/lhF7EjPmLBaZKy0?=
 =?us-ascii?Q?B7OeZikK7d3IGyvL7a31zSZ1NGcGdWeD1Gab6GozG49sBG0u+LWI+2y+7fma?=
 =?us-ascii?Q?YvfPJuFjVPiR7BN9+F6Uv5r4dLiRNRpw6x2JG4Ysu0ydf1NxmdeaG15EsImo?=
 =?us-ascii?Q?/ssoXNOSPvAZHLMxJPbkTZGkUUlc+RTDHai8VXueRnLSlywLML9Bk+etoTYh?=
 =?us-ascii?Q?ady0J5RNTFTNTcO5YGyeiLNoNEIk2KQLY6Hnj8Zv5iWwWMlU9GTH1JXziguO?=
 =?us-ascii?Q?nMavzixWU7WqBp4wjeoH9bBYvY5PL5krOsFzMCZqJa06+oVOSZ3X+DU8a5nA?=
 =?us-ascii?Q?jdWEc+YG4nImHTsLhE3r/SxqIOL9LgzdWisPOmtk6ZfeuzuwNvmE6TU5wlJ4?=
 =?us-ascii?Q?8lj9zb8/4ZG1q0U0IJmj2ewe4r6mzci4TuuhrlcmV0Z1ChDeNO1cXMiGEzPl?=
 =?us-ascii?Q?skY5EdA1aqFZbUFRZQxv4B8pQOC+hdgfmUoGFISxtvQzRvG6suLMTOzeWb7t?=
 =?us-ascii?Q?GnJf7dsG+MfkAk5MR3OvcUOo1VNZISqIFdBQLqslzstPaVO1CC7aa8fbd59/?=
 =?us-ascii?Q?9QDybMLCaxT0djGeRSHmoGPvr8etlseSux6+w4XH6cRaPMLgtVAX6HJHyaIX?=
 =?us-ascii?Q?RvTIzYtcpbqY1aOW1DrDgfkGf9Z4Yalk0iMgBJ0ZIZf2t4nVZrbo9x28KrpL?=
 =?us-ascii?Q?SzozqoltHd79omH4lqjZS0xzJlfXhxOp+v5OlmUp7Mox0JlMBEXpZ0CelD6I?=
 =?us-ascii?Q?uS/X1vNZmX7Yz5IgM9zdseacz3xG19lu4Xj/k2pCaHxKCOACV8/hOa22rEis?=
 =?us-ascii?Q?2jGD6EwgtdVO9ZIQXyQGso5dTqeP1raPVjWKV1DyevDaAo8veA9RpHDLzmVf?=
 =?us-ascii?Q?X/QrpvKt2V3Tpx0xnA1r7akqJXJl4JEpMpDXc4cwE0ohBrQ2tOGOuvVk7Nn1?=
 =?us-ascii?Q?5/7RFFytZMS8s3fjPW7F4MeoqvFx43n5Vr00vw3xWvM7wq2EEwT5UFCUTJ+D?=
 =?us-ascii?Q?nQdRyyLih/4Eibz3FoXXjS4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2870b504-83f7-4de9-a23c-08dbeed6155f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2023 23:19:05.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Exbe9ZDnzA3SSbD3NXA7iSFyOpAoX8KXOKcrhlO7wZSY28DmMBnGgglYB6zjiX0JOmT0yHXi6k5rAPLnjfkYKOLmrM0Q+98wedk2LHzu5YnBfld7aFz15BvjfbBN0Ho1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11697
Message-ID-Hash: ECZ5X3FJF27JWOJQ3R3C6W26R6NTT3TB
X-Message-ID-Hash: ECZ5X3FJF27JWOJQ3R3C6W26R6NTT3TB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ECZ5X3FJF27JWOJQ3R3C6W26R6NTT3TB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
but it is used for N < M case only. We want to use it for any case.

By this patch, not only N:M connection, but all existing connection
(1:1, 1:N, N:N) will use same connection mapping. Then, because it will
use default mapping, no conversion patch is needed to exising drivers.

More over, CPU:Codec = N:M (N > M) also supported in the same time.

ch_maps array will has CPU/Codec index by this patch.

Image
	CPU0 <---> Codec0
	CPU1 <-+-> Codec1
	CPU2 <-/

ch_map
	ch_map[0].cpu = 0	ch_map[0].codec = 0
	ch_map[1].cpu = 1	ch_map[1].codec = 1
	ch_map[2].cpu = 2	ch_map[2].codec = 1

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h              | 56 ++++++++++++++++++-
 sound/soc/intel/boards/sof_sdw.c | 28 ++++------
 sound/soc/soc-core.c             | 95 +++++++++++++++++++++++++++++++-
 sound/soc/soc-dapm.c             | 45 ++++-----------
 sound/soc/soc-pcm.c              | 44 +++++----------
 5 files changed, 185 insertions(+), 83 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7792c393e238..f3803c2dc349 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -655,8 +655,45 @@ struct snd_soc_dai_link_component {
 	struct of_phandle_args *dai_args;
 };
 
-struct snd_soc_dai_link_codec_ch_map {
-	unsigned int connected_cpu_id;
+/*
+ * [dai_link->ch_maps Image sample]
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <---> Codec1
+ * CPU2 <---> Codec2
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 2	ch-map[2].codec = 2
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <-+-> Codec1
+ * CPU2 <-/
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 2	ch-map[2].codec = 1
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <-+-> Codec1
+ *	  \-> Codec2
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 1	ch-map[2].codec = 2
+ *
+ */
+struct snd_soc_dai_link_ch_map {
+	unsigned int cpu;
+	unsigned int codec;
 	unsigned int ch_mask;
 };
 
@@ -688,7 +725,9 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
+	/* num_ch_maps = max(num_cpu, num_codecs) */
+	struct snd_soc_dai_link_ch_map *ch_maps;
+
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
@@ -775,6 +814,10 @@ struct snd_soc_dai_link {
 #endif
 };
 
+static inline int snd_soc_link_num_ch_map(struct snd_soc_dai_link *link) {
+	return max(link->num_cpus, link->num_codecs);
+}
+
 static inline struct snd_soc_dai_link_component*
 snd_soc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
 	return &(link)->cpus[n];
@@ -808,6 +851,12 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 		     ((cpu) = snd_soc_link_to_cpu(link, i));		\
 	     (i)++)
 
+#define for_each_link_ch_maps(link, i, ch_map)			\
+	for ((i) = 0;						\
+	     ((i) < snd_soc_link_num_ch_map(link) &&		\
+		      ((ch_map) = link->ch_maps + i));		\
+	     (i)++)
+
 /*
  * Sample 1 : Single CPU/Codec/Platform
  *
@@ -1163,6 +1212,7 @@ struct snd_soc_pcm_runtime {
 	     ((i) < (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs) &&	\
 		     ((dai) = (rtd)->dais[i]);				\
 	     (i)++)
+#define for_each_rtd_ch_maps(rtd, i, ch_maps) for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3312ad8a563b..2faf7372bad0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -570,16 +570,14 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 		  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	int ch = params_channels(params);
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai;
 	unsigned int ch_mask;
 	int num_codecs;
 	int step;
 	int i;
-	int j;
 
-	if (!rtd->dai_link->codec_ch_maps)
+	if (!rtd->dai_link->ch_maps)
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
@@ -605,13 +603,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	 * link has more than one codec DAIs. Set codec channel mask and
 	 * ASoC will set the corresponding channel numbers for each cpu dai.
 	 */
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
-				continue;
-			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
-		}
-	}
+	for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
+		ch_maps->ch_mask = ch_mask << (i * step);
+
 	return 0;
 }
 
@@ -1350,15 +1344,17 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 			    int codec_num, int cpu_num)
 {
 	int step;
 	int i;
 
 	step = codec_num / cpu_num;
-	for (i = 0; i < codec_num; i++)
-		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+	for (i = 0; i < codec_num; i++) {
+		sdw_codec_ch_maps[i].cpu	= i / step;
+		sdw_codec_ch_maps[i].codec	= i;
+	}
 }
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
@@ -1453,7 +1449,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
+		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1530,7 +1526,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		dai_links[*link_index].nonatomic = true;
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
-		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
+		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b2bd45e87bc3..4ca3319a8e19 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1015,6 +1015,94 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 }
 
+#define MAX_DEFAULT_CH_MAP_SIZE 7
+static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 1, .codec = 1 },
+	{ .cpu = 2, .codec = 2 },
+	{ .cpu = 3, .codec = 3 },
+	{ .cpu = 4, .codec = 4 },
+	{ .cpu = 5, .codec = 5 },
+	{ .cpu = 6, .codec = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 0, .codec = 1 },
+	{ .cpu = 0, .codec = 2 },
+	{ .cpu = 0, .codec = 3 },
+	{ .cpu = 0, .codec = 4 },
+	{ .cpu = 0, .codec = 5 },
+	{ .cpu = 0, .codec = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 1, .codec = 0 },
+	{ .cpu = 2, .codec = 0 },
+	{ .cpu = 3, .codec = 0 },
+	{ .cpu = 4, .codec = 0 },
+	{ .cpu = 5, .codec = 0 },
+	{ .cpu = 6, .codec = 0 },
+};
+static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
+						     struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai_link_ch_map *ch_maps;
+	int i;
+
+	/*
+	 * dai_link->ch_maps indicates how CPU/Codec are connected.
+	 * It will be a map seen from a larger number of DAI.
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+
+	/* it should have ch_maps if connection was N:M */
+	if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+	    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
+		dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+			dai_link->name);
+		return -EINVAL;
+	}
+
+	/* do nothing if it has own maps */
+	if (dai_link->ch_maps)
+		goto sanity_check;
+
+	/* check default map size */
+	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
+	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
+		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
+		return -EINVAL;
+	}
+
+	/* Compensate missing map for ... */
+	if (dai_link->num_cpus == dai_link->num_codecs)
+		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
+	else if (dai_link->num_cpus <  dai_link->num_codecs)
+		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
+	else
+		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+
+sanity_check:
+	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
+	for_each_link_ch_maps(dai_link, i, ch_maps) {
+		if ((ch_maps->cpu   >= dai_link->num_cpus) ||
+		    (ch_maps->codec >= dai_link->num_codecs)) {
+			dev_err(card->dev,
+				"unexpected dai_link->ch_maps[%d] index (cpu(%d/%d) codec(%d/%d))",
+				i,
+				ch_maps->cpu,	dai_link->num_cpus,
+				ch_maps->codec,	dai_link->num_codecs);
+			return -EINVAL;
+		}
+
+		dev_dbg(card->dev, "  [%d] cpu%d <-> codec%d\n",
+			i, ch_maps->cpu, ch_maps->codec);
+	}
+
+	return 0;
+}
+
 /**
  * snd_soc_remove_pcm_runtime - Remove a pcm_runtime from card
  * @card: The ASoC card to which the pcm_runtime has
@@ -1121,8 +1209,13 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 			     int num_dai_link)
 {
 	for (int i = 0; i < num_dai_link; i++) {
-		int ret = snd_soc_add_pcm_runtime(card, dai_link + i);
+		int ret;
+
+		ret = snd_soc_compensate_channel_connection_map(card, dai_link + i);
+		if (ret < 0)
+			return ret;
 
+		ret = snd_soc_add_pcm_runtime(card, dai_link + i);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3844f777c87b..3d72084b6a34 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4438,11 +4438,14 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	int i;
 
 	/* for each BE DAI link... */
 	for_each_card_rtds(card, rtd)  {
+		struct snd_soc_dai_link_ch_map *ch_maps;
+		int i;
+
 		/*
 		 * dynamic FE links have no fixed DAI mapping.
 		 * CODEC<->CODEC links have no direct connection.
@@ -4450,39 +4453,15 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		if (rtd->dai_link->num_cpus == 1) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, i));
-		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-			int cpu_id;
-
-			if (!rtd->dai_link->codec_ch_maps) {
-				dev_err(card->dev, "%s: no codec channel mapping table provided\n",
-					__func__);
-				continue;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai   = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
-			for_each_rtd_codec_dais(rtd, i, codec_dai) {
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				if (cpu_id >= rtd->dai_link->num_cpus) {
-					dev_err(card->dev,
-						"%s: dai_link %s cpu_id %d too large, num_cpus is %d\n",
-						__func__, rtd->dai_link->name, cpu_id,
-						rtd->dai_link->num_cpus);
-					continue;
-				}
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, cpu_id));
-			}
-		} else {
-			dev_err(card->dev,
-				"%s: codec number %d < cpu number %d is not supported\n",
-				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
+			dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 323e4d7b6adf..c20573aeb756 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1050,6 +1050,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+		struct snd_soc_dai_link_ch_map *ch_maps;
 		unsigned int ch_mask = 0;
 		int j;
 
@@ -1063,22 +1064,20 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		/* copy params for each cpu */
 		tmp_params = *params;
 
-		if (!rtd->dai_link->codec_ch_maps)
-			goto hw_params;
 		/*
 		 * construct cpu channel mask by combining ch_mask of each
 		 * codec which maps to the cpu.
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
 		 */
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
-				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
-		}
+		for_each_rtd_ch_maps(rtd, j, ch_maps)
+			if (ch_maps->cpu == i)
+				ch_mask |= ch_maps->ch_mask;
 
 		/* fixup cpu channel number */
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-hw_params:
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
@@ -2826,35 +2825,20 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			}
 		}
 	} else {
+		struct snd_soc_dai_link_ch_map *ch_maps;
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
-			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-				int cpu_id;
-
-				if (!rtd->dai_link->codec_ch_maps) {
-					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
-						__func__);
-					return -EINVAL;
-				}
-
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-- 
2.25.1

