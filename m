Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 313478D13B2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:08:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66A5E65;
	Tue, 28 May 2024 07:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66A5E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872905;
	bh=25InoeQZCQShXtxXew9EC80oPB1bzBPU+cNrkvUXL40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s6QB6b3KDAYneWIsaJjZdlQqEYqJORKiTwtFCGDbC/l2huXLGt9RUWQ+Gaj1MU9pP
	 U44LxHkdMHgjvfJpSJRqzLEj8iE4KQhsW6v+Cq90q5uZpXqODlAR0Yu7Pj8hS+rur6
	 5+eADZsNGL7AYgky4x4fVaOPG6vlsuGyABNPvcBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F45F806EF; Tue, 28 May 2024 07:06:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 265F4F805B6;
	Tue, 28 May 2024 07:06:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF63F805A8; Tue, 28 May 2024 07:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC5D8F8067C
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC5D8F8067C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Pq9yYKzf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOUx6xG4kt9Ob+sdpY/QN/mL7UhshDYFOiMZAsNpddGxaorVvdW8Enh9/uriQZ816zOFdEu7ykHfvArhhqrVPHKgoD+qVJSWkwL2CCWvgtZNB50PmKiUFKoNAL9UFgWj3vHBX7Z16YaQHPmsH1JB4mefFqBfkEBole0qhdTdXAXBb3X/sNfrIe/vnDF/akbEUxKH5R1qM0wdAkplvA5Pm9YaYRAPPNAe+AAWW+AGbOWxvqpKprjJeSCgO4baFyOeThcwJMdhaTzB1IvXkKFUgdW/vB/FkIpGzIzPVVzhTXHaFsVvqWs8WpTEdOwDfUGapY8nIFPrL+i7bs2UMnlNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joBcpE/N6y4ZBlB9XeUFH0ECYeUhLnw6Upvk8stfclI=;
 b=JzX3t6vSeaeeYiWpLCTL54zegA4CLw/h3uD7ilfSq4+P+NCfB9tFEZZpw4OIHKjpoWM0Qdswgnm0ueR+pyG/+JMIbWZXiOhR/R1zx45qE5F/82aJoT1NK5Jw4A3a1d45DogfzKomRnG36YRA5w91FHCkcd/HRMzlK0chawdafcbo5SF1AFil/tmSgvwtU/ddmkw2OvgQZAdN49Ok9NZu/g4omGuA+5YP8demlOKP+34v5/oEClw3NSG57FhMh9JdmE3OT+5k0MjbBL7PWzF+my/MeSzY7JU9fn7qKhm56fSdKp7S/7kEMQhwxCqsFTbYei0vQuoxSblil3nl+g+kzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joBcpE/N6y4ZBlB9XeUFH0ECYeUhLnw6Upvk8stfclI=;
 b=Pq9yYKzfyW+0gREmbj6SW4XfTPMOGJGVZexek+gVOnO5zyntAAFEU2kZ+5sGzBnbvE58/98QkzAmg2jNaxXVx+SpC/2SyfxH3Qdt+wKAhpWlTSTX1nB+hjq+/+cwRXfCb+hHvQVvpBdcT7IZsSOVAPdPW+M6XDVUMufyc6QOgIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:48 +0000
Message-ID: <87y17ufrv8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/11] ASoC: audio-graph-card: merge graph_parse_mclk_fs()
 into graph_link_init()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:48 +0000
X-ClientProxiedBy: TYCPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:405:2::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a3d0ab-5f31-4990-7c06-08dc7ed3d678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vc6XVuS5d1nu8lGKyKoPnr689DD2xNvhnJiFQkBz5gNHVwCUM/r9nEmygbNR?=
 =?us-ascii?Q?a9tuuHLhLBNBl9Zaxs70kUAAVv0NpmaPNNLWdYNxg/D/SHrbE+fqdl7i2QX/?=
 =?us-ascii?Q?cEP3/je+KiCNZLkAKVgQxz3wcDHjZ1QaaT/t2Cy3TG40bhZmh1u/bx2XdSEM?=
 =?us-ascii?Q?gqrInWN+Q3i2JX4f5J0PX1McBFw+A3rlPMQSaLjHac3fuOCUwaD1xKg7RK/1?=
 =?us-ascii?Q?QHgEMTTYwt3HsIkQODhP3XepdqBwhl3ZUd0LjfqUo/ZEFbDdkhS121Mr3z9T?=
 =?us-ascii?Q?fX3p6ik4kMSkh87emEfLLKFo7eMS+RqaLKVy2dq4uGpI8aosPfgc4BydT+4L?=
 =?us-ascii?Q?2zqb7Mwp800/BNS4id7MbqzNQvyJZGUGN/KjWBUKH8o0SaMouI4PNLvJTZhz?=
 =?us-ascii?Q?1OSJVdMMAMuZp5xTsxn/Sb/mDaFd6OFjPGNgWeyyH5b2AxhwoewoIWHbf7u2?=
 =?us-ascii?Q?toSgV2c5fY58SIkcJ7c/gvnwduJvC4TLpedxdYUC/EnMv8lQ/Zzapm1zmY3b?=
 =?us-ascii?Q?QkJ2o7FMp9fJ183WQWKx96VyHKK2lHzMtLghvBqIgypBNkvQ4rlxkRliibyp?=
 =?us-ascii?Q?JRYms3nZDbmWdC2L2vtDC0uziPtdIYUjr9YZnRp7v/MT8XUvTIDAGdnKwDAi?=
 =?us-ascii?Q?+Qg2XWl6uH+IML464YulIvNEXj0SC8ZFC8al/C20EdaO9ZXCATdwbSU8cxZa?=
 =?us-ascii?Q?zTf9JwIs3kL9qDZC3UetWQBE/vRpsrnbwws0vXDXIIkvziJhTJ51buxcs1ry?=
 =?us-ascii?Q?sgrK6qBgiP9xL4d8Bhl+BKVPHftrMUyuJYI7gSSm75LFU7rUA3fZsK0vh4zc?=
 =?us-ascii?Q?2JZM0oDWZm9GfwsEe6CyS+EAL0DwQIV+fw8CCrf0NjiPS3pN1zDeXFXOppeT?=
 =?us-ascii?Q?m8E0L+r7uxZr5azhZhuBhlBE9U/p8UKpnzUCyZD4NLoNW6DNXnoVd8mJEdM8?=
 =?us-ascii?Q?nXXnTsgmZTAW1BlojrvbNCrP+iMgA5KWQ8M43cep+AyLcP0ZduOAUT9Pptd0?=
 =?us-ascii?Q?ojVsDG2e+0iFN6c9nx80wS0Qjz+DbTeT60sEmsniqQE0DS4daZO15CzhWgO/?=
 =?us-ascii?Q?KYoGmeEuumzC+HBz1CtnzhnOzWA2PfB7QVAgkTTurqqFORNjieHosi7XocWO?=
 =?us-ascii?Q?jELkXDvLDdA5FCkbeQnazuk2oxFYQa9JDRllUzjy/137LWLkTaMwYboZWmyj?=
 =?us-ascii?Q?Ftl6uzw2riTVWkcEboVxnH80ZQ3QjHG8qKZTvSXg8oHKBOYbydMOvrBlchz7?=
 =?us-ascii?Q?UqB9D4326G4/S8bSO5dpqRK99R/cmUt9msZzwHUvc5Eh7pLSMaOoSiCi3qcv?=
 =?us-ascii?Q?xZPXAVcZxD/9u2lsuMs727nHJyvxh/ZNyzALSncnxtH5cw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kqsPCBCuIyc3ACz38CwXuB89AICDF+V5KrDGRyBJliZb6DuiuCH5nO5FdBbj?=
 =?us-ascii?Q?fGYnCyezVPj8VY47kFMyoNlpEXieFRhG1NAU4mJVI+xmqS4u+H4IbOw3AZ8+?=
 =?us-ascii?Q?cw2QFMxvd23LsiPQfPKcjsYJR80jkFteXlZMdc+j+/uqknYD66r7NAVX7hsI?=
 =?us-ascii?Q?3IBd7Bvc5wNTtBlgZ8Nhgu3w/qFLQV3zkUHDfPo/QPxUL8/G4mvYLldfwdLR?=
 =?us-ascii?Q?1/iwhIIP70I+WG/vCpWI4UI/QrkPl9+AIT3trxLTBhuCXAV3K33/hUvkX2Ss?=
 =?us-ascii?Q?F2bTe9dld/aY78F3KD2NQg+ZJJD2qBUzQpeYHJ7c0UfF95LVKJQotxp6MeTQ?=
 =?us-ascii?Q?6Ah8Yy6UiwSRqXtyZh1OMZEBiJ9vnZSLlBqitJyfaRh0sN2GFqikUGowT3aA?=
 =?us-ascii?Q?S+WqLJojRoMGQrLsIrxQkqR1HM+GqGhE6lTWm5PUVLWU+tCj0Dv/53byeEmv?=
 =?us-ascii?Q?zt0vEI8Og3Oc65GP7EFP6hjcWWMz/Cd/opL4sLDrCu9rmAP0yT+nx8zDwHLO?=
 =?us-ascii?Q?yRPQxHuFCq8XZniNbn2gH29nKukZ5+0UToKQq0xBGsX6sy8Q/Neen6iAcGHH?=
 =?us-ascii?Q?TT6vjvXZRVBK/sOQzdXfEgrm8qiOysWR35aPhOCtEzYbLEHSsAv+ViHlOsf0?=
 =?us-ascii?Q?0g5S+zzu2bLjnVjNal73bWNG8C2EtnWZX6mIO8h88uEmKLNOCMAS0j7zr8pl?=
 =?us-ascii?Q?klPtM/0F1j5bCPf2Bwb/qcqLetc1IZDTC5/SnsxtMJbv2CiErA1OC3M1PfVB?=
 =?us-ascii?Q?flXMumZjjcLpgC9S5LJBbQh51xel8OthqGCSirzVC5gZBBByCYM7EItYoMXy?=
 =?us-ascii?Q?tqNT4v3QLEl76F9oSJ1oQCI4EBonasx134dxN29vYhDgh5+UYAIyjMcNN03Q?=
 =?us-ascii?Q?pBrwlvXM7Jt+9dZIveRo43/aThRMy6R9sols5r5/ByBtN4zbAxyZJREx5M74?=
 =?us-ascii?Q?lrANp7rWPdC3zEWX3+qQ677XSu3zP2aTtJ1Nhzk0nj2lEIiAKxPzwkKCbToL?=
 =?us-ascii?Q?MwZhoAm+An9QW4divh6WG0sSrIGiqePu2gjiExU9fojNm1mFezEGeLYzQPj4?=
 =?us-ascii?Q?fRYGtRVt1PqHxULz0qUPfyTT+HxV3WLUml80aVteA8J3MfE89T322ZbAuQfO?=
 =?us-ascii?Q?w+XibwlZGC75BuqBTA6II7oRcREnFmowrWOZbUfayGA62sDbaAqLnXVOg8HR?=
 =?us-ascii?Q?/ROxdh+7kYBR/BR3MQhlgWrSYfNuDP3MieIJk7e8vUJMHkV1ncbi8UOta9xP?=
 =?us-ascii?Q?hFA7N492sW5C5M3lEGQb7DQazF81xaLVZfzbhXH+V69/iZophopLsOw7SLfU?=
 =?us-ascii?Q?NkSxLCqSsKaQGZXAJExbYYfOxdC3uvOyTC5UBSZiIvuo53KEBXU05rMSrJDY?=
 =?us-ascii?Q?7piFJIlybO9SV6j/EC+23OoUNajAeNJ1PxgO7ZsJFhtvgrsVTub8GuZZcJZ8?=
 =?us-ascii?Q?BJTppF7VvC8R5StyxLHTS/6Q6uk78sr8CmG+Nowq+TVwD/WIzIasZNkeA32i?=
 =?us-ascii?Q?HkAf/G8Vr69V12b7nyWrW1EeoaqhLhYdALxwuH9RW28Ls/Njli++G2xMPcQ+?=
 =?us-ascii?Q?RtmNQ/sc56W9mB9BNR38EZ6jrlw8iii5mDEJMnepC41I/Dm/lAiO9aXuP9q9?=
 =?us-ascii?Q?LCxpJUzHuIocEkoQVLzBHzQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 46a3d0ab-5f31-4990-7c06-08dc7ed3d678
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:48.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9QnFSpeXywkqk1DEShc6xfVfuSZMIZYDFTsHe4qv98WPqID6OprxPoEKzc6YdWrVpMFcRi4WQEZvs1H4f1lx+aHeqjy0eTFal7IbNeI5dEhBkBQR8njK8RUkq2E2XC73
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: KZ3ZHYQIQZ2AK2M3IWHHA4FIYKYKVYST
X-Message-ID-Hash: KZ3ZHYQIQZ2AK2M3IWHHA4FIYKYKVYST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZ3ZHYQIQZ2AK2M3IWHHA4FIYKYKVYST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now graph_link_init() is parsing dai_link related property.
Let's handle mclk_fs on it, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 32 +++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 6a19e40d2c4aa..7b981aa8690ac 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -94,29 +94,12 @@ static void graph_parse_convert(struct device *dev,
 	of_node_put(node);
 }
 
-static void graph_parse_mclk_fs(struct device_node *top,
-				struct device_node *ep,
-				struct simple_dai_props *props)
-{
-	struct device_node *port	= ep_to_port(ep);
-	struct device_node *ports	= port_to_ports(port);
-
-	of_property_read_u32(top,	"mclk-fs", &props->mclk_fs);
-	of_property_read_u32(ports,	"mclk-fs", &props->mclk_fs);
-	of_property_read_u32(port,	"mclk-fs", &props->mclk_fs);
-	of_property_read_u32(ep,	"mclk-fs", &props->mclk_fs);
-
-	of_node_put(port);
-	of_node_put(ports);
-}
-
 static int graph_parse_node(struct simple_util_priv *priv,
 			    struct device_node *ep,
 			    struct link_info *li,
 			    int *cpu)
 {
 	struct device *dev = simple_priv_to_dev(priv);
-	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct snd_soc_dai_link_component *dlc;
@@ -131,8 +114,6 @@ static int graph_parse_node(struct simple_util_priv *priv,
 		dai = simple_props_to_dai_codec(dai_props, 0);
 	}
 
-	graph_parse_mclk_fs(top, ep, dai_props);
-
 	ret = graph_util_parse_dai(dev, ep, dlc, cpu);
 	if (ret < 0)
 		return ret;
@@ -157,8 +138,11 @@ static int graph_link_init(struct simple_util_priv *priv,
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *port_cpu = ep_to_port(ep_cpu);
 	struct device_node *port_codec = ep_to_port(ep_codec);
+	struct device_node *ports_cpu = port_to_ports(port_cpu);
+	struct device_node *ports_codec = port_to_ports(port_codec);
 	bool playback_only = 0, capture_only = 0;
 	int ret;
 
@@ -173,6 +157,14 @@ static int graph_link_init(struct simple_util_priv *priv,
 	graph_util_parse_link_direction(ep_cpu,		&playback_only, &capture_only);
 	graph_util_parse_link_direction(ep_codec,	&playback_only, &capture_only);
 
+	of_property_read_u32(top,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ports_cpu,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ports_codec,	"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(port_cpu,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(port_codec,	"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ep_cpu,		"mclk-fs", &dai_props->mclk_fs);
+	of_property_read_u32(ep_codec,		"mclk-fs", &dai_props->mclk_fs);
+
 	dai_link->playback_only	= playback_only;
 	dai_link->capture_only	= capture_only;
 
@@ -183,6 +175,8 @@ static int graph_link_init(struct simple_util_priv *priv,
 
 	ret = simple_util_set_dailink_name(dev, dai_link, name);
 init_end:
+	of_node_put(ports_cpu);
+	of_node_put(ports_codec);
 	of_node_put(port_cpu);
 	of_node_put(port_codec);
 
-- 
2.43.0

