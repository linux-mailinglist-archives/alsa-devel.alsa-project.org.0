Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC16B366E
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 07:15:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A5851758;
	Fri, 10 Mar 2023 07:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A5851758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678428939;
	bh=HMqy37WxfTqkKliIi9hhNeX5H3Vpi2aBAICvaxAgPmo=;
	h=To:In-Reply-To:References:From:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dV62iWOuUOZ7Shd6gt9PJ8YzwoW8oHoCJVjbw1o1sOMD88y+pwQGsbxvvNYyDphpt
	 lzXz5vSv+zu5AgHyRDOPKwPCR/rf3sVQ33+2+O6uL4Sdula8dEZzWsPsom1ha+KsrO
	 YqlGGeUrPPCGe/3d8C3kl5gYG0KbL1+RtzXQ98Qo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17318F80431;
	Fri, 10 Mar 2023 07:14:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA4D6F804B1; Fri, 10 Mar 2023 07:14:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D3D6F80482
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 07:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D3D6F80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lee1t6lk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9kIeXNam9X4hM+zbiZm5FGsRespC03jDgKFrbtXaI++K7NX0eaDZZLrI7FW8Wz10L0nasrTf92aScAGPL/YZDT93gso7GRxg1cU1uqH07d+b6VgNJX0SGbGVFhywfhloHA4E7VfoHK8YNNs8BeGNzaagLxj0OFwPiEgzIXSzamncMZtLPcIyTYX5wSEgaX/HCS2HkHu0WDWOSyTODqaz2ivIbby4FumTfXoxQqJDNSAmRqYmi+qOMF0lSAtMnFli0dbjorlpLCh+p0WiZijGQeahcAmsoYYmBzYvv8qycrZqbE9udDHharXhMYPnFl32ocpa6onqdeke+IZZuqWLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvoitf4TNjzW8os/z0eZWqyAcsvlpD+FZuTfpjJ3maY=;
 b=icu6SKgcCuUO3XcDZMasNsdm+1LYWUFtxV9yU3zXWEXAaEgUJlLV4bElONY2lrc5t+tigEpalDrgXBvSSq2huErcVLk+3YtLo+m9RKmZ8jLMeYuDM79iMeQWv1zSwC8LRpcxr5LM469DV4Ld2Gnp61K9lCnsWwZXtjx5cyFHpGXTL6sD2Bbonx8ddIPRZA+Wt3NpPAniMwtoYJy/SLjavUgZS8xrm4jz0HSjyWjmaFtuFUgFIeCRGuWnxCkKgcrgCBE8xSpGqk+DmSmtQ3TfPx84kkNz8XHItz8hGNC80SgzTJvOF1FIhii49LsTU3N/VolTVYstbjXNTSquUQFTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvoitf4TNjzW8os/z0eZWqyAcsvlpD+FZuTfpjJ3maY=;
 b=lee1t6lkc0y0qT5jupwFgarBI53mwS5/cF8p9PgP8QJ5iHJAI+IEtDNSQ7EaXLFPkBK5KagiuCOboR/4qU4mXYMEhlYwbvFMcKPcY0urJiSGdoDAMdrbpZJKVk08IfFJjVPuEna0NKNTgO37cWaOK8PoW66JDhm5zDS6tQ1Ey8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10612.jpnprd01.prod.outlook.com (2603:1096:400:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:14:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:14:32 +0000
Message-ID: <87cz5h2kvs.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
References: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH 2/2] ASoC: patch_ca0132.c: fixup buffer overrun at
 tuning_ctl_set()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Mar 2023 06:14:32 +0000
X-ClientProxiedBy: TYCPR01CA0140.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10612:EE_
X-MS-Office365-Filtering-Correlation-Id: ed51da54-6bfc-48b8-f1eb-08db212eb6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z086ch8qQ/LpV33HipIQlMcX2gysjl2Sws493bvw4IhMgs49H6pDlidDqYoDKEt/JC3TWs42jQJQbPShd0upKBn6BtT1+axxlIj2w4DkwBxdmQOHSqGMzo7DvQ86x7EE9iJ+AcdIX+8pyTdS7gcMU8eXcJpmQRMOtqSpJ7x6awKqrUrGFB8NCY/bn1xSXgRIcNOzHBbfLSsJvS8h477wcEQ9LLgmmRhv1VhoO5Ejxw3/OEKQnLCihGrxmGJP/j0KXv80EQWV7mn+ypqBhr7jLXuV91AycZD+qm902VMWoU7Lg3bdxaa+xaOx38EU6dMLJEQlPAE/Uixk8cJo/1HrhOQMJ6tB69nihwQmYAfBRBB3AQ1i2T/o/2JJtKOM6OvtT9CTucj5vy1/h+cJtyFAdxebxR2nY6eFPxlmzZrtdAi0MJnc1sT47iuXF8POmJVOkq47RA3GifuTJ+ncoz5wdpeGTk0SHlML+36WOGbOYFWX5HLrBQotVAVkpxibEGChvDNJYlVQ7nTE46TEcqLTB8YaCSoogeMH3F7BWwEC1SS5qy2lCoqce30ItaGsoqasK5ssKUqoqaUwrZwR5d1C6ZXb8evVh7ZkyMZpeqH/gqIxyDZdhr4oFdt5UuFUPb4pVNHiZZ0kmBNN7sMbJS9wEceAs97K7LXMbAOQmG2G/3PXrdV3TLe3NvSwF0H85qhgDrAYIp/UmUneb9ngJgg0/A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199018)(36756003)(316002)(54906003)(478600001)(6486002)(52116002)(8936002)(5660300002)(4326008)(8676002)(66556008)(66946007)(66476007)(6916009)(2906002)(38350700002)(6506007)(86362001)(38100700002)(41300700001)(186003)(2616005)(26005)(6512007)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WFGgXs3yVRs3vEdwkruUI2edWosKj8DTBQcYB/2q3jH0dyb1iUhODYeIVadK?=
 =?us-ascii?Q?Jr4Pt9a3LirmlLPQ9vvD5l4cDgHrHjQAQc5o3PzxTGEnOqI+4BBf/PeXskl7?=
 =?us-ascii?Q?s56cQ7x22H/wadBtxMilnP4lKb/iOmZNqgM4Y/6Yewgm/U9W8WV5BLksMr6k?=
 =?us-ascii?Q?Tj4/+TdnznzcBLL3kpfV+Z9Ct7LwDliSCatR5j8C0zPq9Lf/EZWCjkipp3Nt?=
 =?us-ascii?Q?e2Mb2/n6sSu6QPK4llo1yCdIjGInUly3mddGHFL89K0KMtiCGqPa6UTVbkX9?=
 =?us-ascii?Q?8DBkiuIaukzGJh9Rk2lySk3Mhls3WeZ8XiZwqjRJjUIENrtEI9DBCJK8Zifa?=
 =?us-ascii?Q?j0Vyvsw/pqelGF8ls2aQ0d2O7rIuea9eP3i/iX/nP5a2nio38Dg/oOk+r4/S?=
 =?us-ascii?Q?H5H8SPBK3Iba0duhVh3h5yrzAtMMjSr7ZmUWijtJYzv265tl5fBKZ6HiNVRS?=
 =?us-ascii?Q?NYEtFeLQTkHd5Bq0MNNwyVbFfI2UWP1EzZAHD84/z9x09CHysYUH12cCzAiV?=
 =?us-ascii?Q?CwIJHIYZ4EyVZRAUPHm3ok0VayYvQ+C53YB9K/vqUf7+ey1PiMotWNFKT63y?=
 =?us-ascii?Q?tJLrQPzIqe7/sRnknbY+QQ1fl5MjdJBy16p/eE2mhFYLGE8DkO4ZuLZ0g5C7?=
 =?us-ascii?Q?nKm19bWQNJfEfDn4/pocSCIjLjCHrtgtZq0JLfnPkcy4qqFohcC4IsOM2AJX?=
 =?us-ascii?Q?ykd6WUlBP2wjeHHFeZtB1tb8kqdpzG278zn0pE4IGJ/TbJCEw5gtR68kDgfu?=
 =?us-ascii?Q?XwtnvazTdwMzusflfRzNAu2EPIpJwhf0IUIjw/8OhR1m/idJU/lGinCPJZdz?=
 =?us-ascii?Q?v8fYuybKu0OikZxSINYCmtmjqEke0klwQtslZ/P8I6qeu4iGXmNt9npl/GBX?=
 =?us-ascii?Q?sTsAydq2Qtez6IIscjT/JaR25jdg3caaki6MdkumPz0tfhs18NChl/EBVfDA?=
 =?us-ascii?Q?ZDq+d/DwYgrMZCdDL1c4oJEZwFZw5ph4vrLR7opstnDRsWMkqrynsr/B/TvL?=
 =?us-ascii?Q?Q2f6fZpTOiC+w5qoEnw3TxrWNe0luKNKlHU4DHeCjI+zv8T8bFDVoOEbseRk?=
 =?us-ascii?Q?cxUU5fN4RqnbwJsc+l2sf1m/VtJ7CjG53dxolNxgzQ8WHeLTDIGWL3FL2ldk?=
 =?us-ascii?Q?NBn1m1Ct+82qJXLA3Ufhr8MXj6EX67aZOkdFKNRgUnUA6ae4l+5cEvCqyBMq?=
 =?us-ascii?Q?qVVuDxBCrHo0sE21z/E/HDjbFRfQBPZ2pwtp5Gg/qeoZlQ7zL9PoTfdex6ZC?=
 =?us-ascii?Q?q/93DV6FNF7ZvCpgLM/C60lwh73mrhELvTHr34XntuoKa43ALYCou9++bImD?=
 =?us-ascii?Q?qiCpVylp4VYyWJebQlf3lQEVmVpna38GT69y6oDLKCqqP0rWFHDi4rmZe5LT?=
 =?us-ascii?Q?7l/NPjKRRoIhtkssZJ8aHY50nKg1FlGirNnRXrVk1p3MAOH9TkNYWliJB3gj?=
 =?us-ascii?Q?BsxkjyVoOgVy0hbCK9Z8aqcJlf+aLlyNLsIqRpTyqCKfk+rXowsegQg7lqka?=
 =?us-ascii?Q?bKcrXDyRzYTyo78bCVVMJTUxKjHamOftc3RNegqWhM7J+WqlramT1vwxXcPc?=
 =?us-ascii?Q?GUatmg5bzUsBeMl1ueYWWxAW2eygYLc5ROS2O+ijAAboEWOZSVg+xEURCgam?=
 =?us-ascii?Q?WbeCIGZNzUCcQ+V3MGK/xhw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ed51da54-6bfc-48b8-f1eb-08db212eb6d6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 06:14:32.6402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dpDjQwdYAd1ipMGUgLO7FTXRAiNsN+gjs9oSNRjqBdYIIHSha5sMFqHFHkGLeJXfLH44ZkZ2ejUQ15YqVAI84HdYoLxYITe9URFR/KMFOQyOddGlUOvBAX4M9MC9Byja
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10612
Message-ID-Hash: Y46256AS6YDNIH2X7XRZIVJS6VH3EAQR
X-Message-ID-Hash: Y46256AS6YDNIH2X7XRZIVJS6VH3EAQR
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 Xian Wang <dev@xianwang.io>, ye xingchen <ye.xingchen@zte.com.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y46256AS6YDNIH2X7XRZIVJS6VH3EAQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tuning_ctl_set() might have buffer overrun at (X) if it didn't break
from loop by matching (A).

	static int tuning_ctl_set(...)
	{
		for (i = 0; i < TUNING_CTLS_COUNT; i++)
(A)			if (nid == ca0132_tuning_ctls[i].nid)
				break;

		snd_hda_power_up(...);
(X)		dspio_set_param(..., ca0132_tuning_ctls[i].mid, ...);
		snd_hda_power_down(...);                ^

		return 1;
	}

We will get below error by cppcheck

	sound/pci/hda/patch_ca0132.c:4229:2: note: After for loop, i has value 12
	 for (i = 0; i < TUNING_CTLS_COUNT; i++)
	 ^
	sound/pci/hda/patch_ca0132.c:4234:43: note: Array index out of bounds
	 dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
	                                           ^
This patch cares non match case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/hda/patch_ca0132.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 0a292bf271f2..5ce4b5f62983 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4228,8 +4228,10 @@ static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
 
 	for (i = 0; i < TUNING_CTLS_COUNT; i++)
 		if (nid == ca0132_tuning_ctls[i].nid)
-			break;
+			goto found;
 
+	return -EINVAL;
+found:
 	snd_hda_power_up(codec);
 	dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
 			ca0132_tuning_ctls[i].req,
-- 
2.25.1

