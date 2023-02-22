Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7769EF0E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 08:01:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DE71F1;
	Wed, 22 Feb 2023 08:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DE71F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677049286;
	bh=HMqy37WxfTqkKliIi9hhNeX5H3Vpi2aBAICvaxAgPmo=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UDVsEFnkZr6LQvxw45Jcq9bWUhLHh25qDG5Fiefll8gFWYJOB4Zn7WqwUDTo4AqX1
	 OiecTtfMNsGZtPwQrMqIKjXMh1aVMYhZKru+ccBJa57KByxl+Qej05+SaywllNYWJT
	 nPzqMAJuf0CMtwF2BTSBxfgJlisfIlgrqkK+1GOM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C07B4F8025A;
	Wed, 22 Feb 2023 08:00:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AB8BF80266; Wed, 22 Feb 2023 08:00:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCE7CF80125
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 07:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCE7CF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p7tonAl/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXqUNISX/eUcv1wq1mtZQkUurruhHcSV6rg7aYJEmy2yI0/74Si9MgxSD5AIRyb1g2FbPAVq8kPIygY8HUL1o9i29J7EwZ95LY4C5WsdrWeI+FT203/E+iCIqTdceTYq9fKj0P+FiEM9iW2wUgXxV6T7exQzocp1gwANkcNPfXBfVq0/aOC2NAAKEvbgsg0bqW/k7ny4VOjkxNCq/Tw8sCkN1r2LZAFJKt/DgOUR2f9psnIyYGkFpzgtVs2F5Y9cNdJMDRrPZieBzlBc01OoH5YaJWPmPw/MzZuZpuUgv3eYoK3A+OLpEuFLGGYqMjEh1VtsjFcgw+qPZUkA1Mbing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvoitf4TNjzW8os/z0eZWqyAcsvlpD+FZuTfpjJ3maY=;
 b=Fn2ROT8x5R5bI/UKALKf7iJhr5UuLOO2GaZrCN5v6+yDchX0rJS3JeD2pg8huam7PdrXGWw5YWTRX0dF6lWJ0Xk5xR3oXgLqFw4MYS8+WxB+BTbVThJrrpCQ0lVNmq/27nw50bVtsQCnQ3EUOhny7ouV/1UHwasH7ObgFDCnDZHOQlQdw/bAzx/HajvNYYgdzMhW0LOF2Hm8+jdvnmvCOWE++njNbSdMwfiAAoIIXKyGHrtcdZq2tiN4X60Y/7bkAxDJT19VgkCBtwJj5rIhqgzn0B9bp1krM7oJ3f9Vn4JUW70ib6e/k4lx4dykWKgqQSuI57iue8+DKQAqnMBZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvoitf4TNjzW8os/z0eZWqyAcsvlpD+FZuTfpjJ3maY=;
 b=p7tonAl/UfRg8zG2RsSzizUg3DbZWFpkv383hTSMI1RQdVkJpFqnnAFp419YRNu8FmCubJWrdqg6R9R8enEBTB4iMDEfd7Sd5ZIsRi8bvC4Sar/VHVhmZnqu7umnKxtJRn3y3JgAO0UgVpdi6boapg0uXffn+qSQdIw7Icds2BI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8790.jpnprd01.prod.outlook.com (2603:1096:400:16f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 06:58:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%5]) with mapi id 15.20.6134.018; Wed, 22 Feb 2023
 06:58:34 +0000
Message-ID: <87356yqj8m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <875ybuqjcg.wl-kuninori.morimoto.gx@renesas.com>
References: <875ybuqjcg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: patch_ca0132.c: fixup buffer overrun at
 tuning_ctl_set()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Feb 2023 06:58:33 +0000
X-ClientProxiedBy: TY2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:404:56::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: d8690cf9-6a9a-4be8-1cf9-08db14a236e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pIMtXcztbZy3QLR6AA+bqlGLrQpfT2VeKpNYcOUDet3NCcThzf/7vWcTJobkTA57sI2GKufeZTiCfTgeqkraN2hZCNJb4C1HDCgwWJMzvSluRBUAZ36Ii74uL9TbyW+sx+giNLaw5UFkjDL+X52QunE+C1auC9Tg1OKi2rbxmneoY/1jT3ka5IJ7Ci0YMunSg0BVl3FJ354H0Mnu8NRbggztFIq18P5ORk3pzonakxHBqUjWGarDJ7a8NRXnSNGZmHsOz8SDfQoK4QOcERNEG+nlG7f9Zm0SQNDuFUz8GAc0H6L7wiTUM50oAq3zJH8sC432f8ljWjbtoFx0bKPVhHpWNYoxtcu+KjiNsi5eBwqDU1yTSrpMZghrlywn/booZve/gYsg0d84N95wrRMjHGv+kNj13hlaQvooBbyPDOAFgfF4UWOaZsc4OD/GM+lCvmnCCqFTnCbmng+F9XcOuHagDML7YQ0wvYtJ3ZJJHF6GI7qnM5zCZaw0wIW0i4GTLMqoKexX6rSd5z2jPc70trv8XoKG0Mm6jF5DtHZyrSZ6X+xnYaBfu8Ha3gSjReSLXQ4k6rgfhOel/4z6V7hHpnvSFgjRZ098yM12aQLW+F1HdDP6EsfbM6dU906zmjH2ve6/3sBilxThv954XZr/poORvytqecfMGad3fxLXux6cDoLwINkenvcFDYpTCVSQZ2emZL46RvSsZ0/cLWESug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199018)(316002)(6512007)(186003)(6506007)(26005)(54906003)(8936002)(41300700001)(4326008)(66946007)(66476007)(66556008)(6916009)(8676002)(5660300002)(36756003)(6486002)(478600001)(52116002)(2906002)(86362001)(2616005)(83380400001)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t4Yge6he1VON4Xwvr9C9ZWAMtdZ0Ho2haeMy6DeSUKKsFGWLJAOYzTiv28FJ?=
 =?us-ascii?Q?wyGXmXV6ZB57wQdmI4x3emP+GYbH9CQSopYqYWsEKivJ1vQeELUNHHfym361?=
 =?us-ascii?Q?TkBY9M2Lm2aDsqXMCDPALZpoRLLwdDvPV0CKUmMr5soXg/cMH2HEYlHGATEK?=
 =?us-ascii?Q?bl9MAXIRjMs9c3vV4voIwpWmetjNyFh6NzXFdOlFINYggzsqE20kgattOS+a?=
 =?us-ascii?Q?D3GQ2I/TiyuUN6qFOplGla2YsgD3PpYg1DQeh5L51zdWVDcMNFd7PHM9hVN7?=
 =?us-ascii?Q?XYkaRSzbtYsp8qFpFc1b+pCHs1JFYj19zhF7NE/b2hyRNkCJe2vImnJ4qVr+?=
 =?us-ascii?Q?6xRqSys348GyTV2xs77BD6p98PSJG3jCrp+sQpOFgd3mTGEX0l8RWoVWW6J0?=
 =?us-ascii?Q?Oyf6LNkh5kJEwsUNxIsYgKW21SE8kmz2Xv6FEVvovATPUWois/tYUtBUXo6y?=
 =?us-ascii?Q?171CY/pabuHmwVdjDr4PlCUd2RfkFoXGoLYNyGRHjjpEH9fagEH5qiL88676?=
 =?us-ascii?Q?+o/EM5vxW4buqt7tR8ARJdWHQgSyj47N5TmhRtFZ8zXBRxREa3vK0ZbhbcXJ?=
 =?us-ascii?Q?CPj3JpFj1QdP4JyKuhzd4DWfcfI6B3O2tWmK0WvFuEBksPgNJlQZ9aAI9H2x?=
 =?us-ascii?Q?rUTDew70WFdTT5eSXe0Y0sOEIGfMuSH5MVlzFefQlkWcX5rm4ESEgG5AO5Tg?=
 =?us-ascii?Q?QmVTrVMpzeWVu1HM0Lrud69Je3kyRH/g+CZd4tWv574eA1RfupsfJ7YhxIeA?=
 =?us-ascii?Q?XKLOOo0VjQBT8Uw1mSzxv/5o41bMGWQlilYAGJMjb24yZNMwTs08uk7EQeng?=
 =?us-ascii?Q?PKXE/P7A2NqGEXy5X8jeJT2/tPwBYF0iYVlqEh2RBY/MPdn/uHG5J6cvYb8y?=
 =?us-ascii?Q?Olbs/r7TvGb40uyeli971+GfbRo4RWPfkHXOY4sh3DADMzTbdEjVnJ9Be9Z7?=
 =?us-ascii?Q?ZC//ryR85stG66+VcQKZseAspPSfnwQu5S45Ye8pQJb36d/M+MbXEPgJsH6s?=
 =?us-ascii?Q?Zt7azC7eF5xJ4LSe03Qq4UW3Gd4BexYSB59FQSkX+OKA9Xs5gO+ncceL12AY?=
 =?us-ascii?Q?IHcdQqjD35n5d2CPVzYEjhoCbDRXFIlQuledJ0vQ+KjYEKCDF9gjqpEbN1K6?=
 =?us-ascii?Q?G2IpgJkJyd4WU312dyEo8oNoj7CX5E8g9jExd7csRBiNON77IsfjU6WySst3?=
 =?us-ascii?Q?JROp1zFx+WNO78RTx7yUc9qnpMU75rh0UYIaQqJuV2ScUcWLlc4WX2PEIbzM?=
 =?us-ascii?Q?XLQhKmRQcSrjl2QsoqyYdYfXMYXWZPLcxKWAqyOvAW7HLVrDzavmOWyRZCjq?=
 =?us-ascii?Q?9GH0V25yXRAjnu8ZQPiHvqWCboYIrf9e8Uq3mKBP6Ll0wYsX0tQApyojYUUx?=
 =?us-ascii?Q?Yp8SIY7GnOLs1vQUX5oHNgw010hw6XwP5T3FhfuVkQ74BZfXjMtQoQlmar08?=
 =?us-ascii?Q?1pV3bZUQqdNRJh1mzSZpU6Nr22LJw+mjyCggOsQKzGOJYLFVhhh9EJ271pB6?=
 =?us-ascii?Q?51QCz2GDyLhDIXGrH1WLQosX5BurAUAb72oyuHwyoa/zzRcxy2A5zx95HhOk?=
 =?us-ascii?Q?cHXxLJIJ/sSWgvfJBfeUTQFAqXFGxWMe5KCggd5NtEVDkVurmnGh14QrF6Za?=
 =?us-ascii?Q?53JgpCuPZKSluMtnUQku/IM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8690cf9-6a9a-4be8-1cf9-08db14a236e5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 06:58:34.2549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BPxVpojeFoDyZ1Ea4Wa58RHJ/Uhqtd7JMb/UE+YC+w0toGfiqjx5UmyNlpX8QoBuOXFG+QqvorJPWn4isH3DAN2Otvm0f58ZUZk9I2f2UHVBcy24tayOXiKVbttr7fWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8790
Message-ID-Hash: M4RIDKK46PEX2DMZPH5UUOBF74UJ7N57
X-Message-ID-Hash: M4RIDKK46PEX2DMZPH5UUOBF74UJ7N57
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4RIDKK46PEX2DMZPH5UUOBF74UJ7N57/>
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

