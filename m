Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D66C736F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 23:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 619B24E;
	Thu, 23 Mar 2023 23:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 619B24E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679612162;
	bh=/SxxBNo4lIq4+GLAM9AokN6vZFqVoB7i6MRM7DVszE4=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lfmGJ3rYzkg/dctQ3tibeuBm/v9jhcCI+/zM2MgutPjVu5g6Vn4l1jFsZuwr9IZzv
	 MZ8k89l3Ng7ANNYr5rP8Eybc7rdQOkFtm7iV1cJgGtgLwWQJZugXTBvh0We+KL9l/b
	 2nX8+uqt40502FaJbtBmbz2QeI4TlZJwZcUqlrjs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 221D6F80553;
	Thu, 23 Mar 2023 23:53:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F91F80551; Thu, 23 Mar 2023 23:53:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E5D5F80534
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 23:53:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E5D5F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pHhU8sry
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dF2YJMpwqelzReARz/999uEUQnMffN0MwHBwEjsu4ftz03ul7ANcTSlQ1Um5MdjtarC/Wob+O4VwMGLPccschPWYSJc7MhDaYOyqnv09oPjEeY4pQ23FEC6+DSAit6edMnbHlq0ksFa1Rn/ldAKANB72RG6vEy/EW898pZ16cGBF8fmalB114l4pQAIBersK8xUMXBO/mmhhMapy9XwiUR4/JRcVdFIBRXe7UBBvax+HCwkMIi6xF86lTCgljQLkSUSTj9/Uw48GRQWnicflENEyRYUbNZ9i85kll6QvQxlVpa203C/EmngJV0PiPaX8NiFj6szdF1xAlWXHCgcpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrNb9izMel4j+PUOkcsN0guCt/jbWOShYIYKpQ9JKb0=;
 b=SNpvZ643Agrx+YCkDzrEm3XLGJ0hOJlqV7YbFBlc5NWZwcE6WmLJqBxVVW311YWl/05Ws560/Kbu5kRpm6a4Cw1U+gUhFiyo+akiJcMnU4+hpt4MI54O9pAK9A1ga6dPsbvfYzkXQ1/37pcRcpWauV/wwT5KYeEgfjD1WCKPGd+f+dISnFp3bvSAz5ai6NAH0dE5u/Yc1//nyWCdGDV3dZBCOubebl57KSUgkkjKsfs1w+smUhKU9/lBPV6lIvRFBypp+HJxuCFM7B7uUXi9pgQBdStfsiHBtYRMCLNGQ4Upo0xolV812svCABHJuYNVd2TxPdHsq25B9MAAdlJwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrNb9izMel4j+PUOkcsN0guCt/jbWOShYIYKpQ9JKb0=;
 b=pHhU8sryKM4LUCng6Csy0G+LrZmNxEPlIjoHuJJ2YqBZK/xFUZMuR80g+XBu/ErTIf91rBQ8f/vp8ioerOaNJmgYJutMmot0b1o/zz2PTDBCsIlHeeTgWkYU9GNzrbV0comuEcF6QYkM5UpgsjXUuTxmKgszf7wy5Mi8ISPLufs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12022.jpnprd01.prod.outlook.com (2603:1096:400:37b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 22:53:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 22:53:47 +0000
Message-ID: <87jzz7jczp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] ASoC: soc-topology.c: remove unnecessary
 dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8zjd0t.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Mar 2023 22:53:46 +0000
X-ClientProxiedBy: TYCP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12022:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd777db-55fd-4021-e313-08db2bf175fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QZMYQ52gC30CrOuNFhn1RT1bw5fvtDIxVsFzBwioObHv0gB7atuW/S6lZwHUhBSVK5YzY9QOFXRSlGDOGiUU+Pg7+HPlwLQw1L0JK3X9mFJjO0sCZMf7Pr7IWgMXOL72Od+Ten4zIMJkNsxEj4RGOMogbI703J/VzbiSqf9YoBnCVIKSE5/3Wl/5NKSc1pEe6vSjGFk4sYncW0vhNV50gwAz9WJkTPuE4SnJ70uBTYBZHGHpJC+CDcrnDGTMkvPeVEQiUQ2D/3xUwCW1jdC1PMEXZs/XouAbsfsbywJrlSdYMh7hRa4FNQyn5qk7aR/DR4evdyrQSIG0mDvRwq6fx/Kxpkzc9QLCtWUZcG0OW82QheAyMVgq9DvAptcv8pys4olRsZKjPV4vWFRnP1vAOrWG3rY/t+tzkA2b2xe0xE0KoV1GToCXyXLQPTSG45t+/uAXZDULmknl1+sCnbrxw2SvwNqoulXRYZOOmXMgOKjjpDwWs00l/atRCkkxahuktzIz9vyYApzKFlWV5devJ3DeQanylKhiu8CV/NlpekGPwwMJok8r+/ewT/Y3Y5MCqI074qjvrlYtaJnsS8dhwrISbiIZ0kownCYXmPclADC4fEv+UP6kkG9dgxJ7Dg2y0j9RRKr9stD9deiUvtSGjioy9Lxn+UdUkWzj8Ay5FGGkgtsMq+9KMj2noZdKBlKoztgRjcB2KsanOi/S8OBPlw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(451199018)(316002)(478600001)(41300700001)(2906002)(8936002)(5660300002)(36756003)(38350700002)(66946007)(6916009)(4326008)(66556008)(66476007)(8676002)(38100700002)(6512007)(6506007)(26005)(86362001)(2616005)(6486002)(186003)(52116002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kCE8QV5FNuwKRg00CUgtcs12gh2mkK1TtuOiGXfuQOqOFaxiY6tb8WD+8maR?=
 =?us-ascii?Q?yNe7/pQKMkkXKo7+y4uJK6/AKSCo3RP1A0ZWUkvfVVJceFseMP7qESuQOTbI?=
 =?us-ascii?Q?E85kMRPZbElEHVrx5KVPmxbvKZIva3ejwNSLblB3EVjKxnymItCAQUdr6IdV?=
 =?us-ascii?Q?iAVwNBLD4NsbD5xJndVp0/NBK7bmNOoPn+l3BWNJk+E/wpNp5MpmRDrhAKcZ?=
 =?us-ascii?Q?tbsGt4w8VEFpdqMnqZMzuuulE1vLb1htyCX4s3Fnk9qFRCm7ji/SKS4I5CVn?=
 =?us-ascii?Q?ddzSiQ0siUyJCosabhpg+np3DUeXe8dvCq9rKO3GNl361YWJrszmdSgRQSXC?=
 =?us-ascii?Q?WQVlsj3CPCnAfEnP9gd8mnIMT9ofYdOLI7ItnFm3NhfYmYWKUCVVUGgMjfYA?=
 =?us-ascii?Q?W1F8ojD5ImL3gIK3EWsRAV5zqHFodWZeuyr5pc9vUym/r+YrJzmNwmBelksh?=
 =?us-ascii?Q?hF3dW6i7wdTtWoFlGUY+N3369X1RvJA3qO2DtwE0b/j1s89Suz9tRLEI7Hn6?=
 =?us-ascii?Q?QIdX+RSvtC3vBXVk282sBk7+6RX+ZxE2bBINU6ZnWMMF2PuEfCyW7+dAWIip?=
 =?us-ascii?Q?XYIRqDmO0UHGfc9ABdurZ79+gNQkrx8mfpuE3I6CGWGbPBuZYied6aq9vtBJ?=
 =?us-ascii?Q?Y/A4NsGoOYDPqA78vxIlSPjAhXd6438r8ETtyqlT+2YaQ1nq0Zm3kl8pPBN4?=
 =?us-ascii?Q?Z9kIrZ5Ll7Opp5zjQW7SFPGv0iOyTpGebUXhyTSyX73dNnRX4TN2E7R+oaSO?=
 =?us-ascii?Q?p817m/rE8DxZJcZUQmvpqTrZ/NIju6fmZlhRGFkklU6p/6/Kgsz4dRj8pzyR?=
 =?us-ascii?Q?3kpxV2I4XGsQQinntFu1QuGD4YRWwnKPIBcVxnGqxghpkS7tnHOuU7euR11O?=
 =?us-ascii?Q?HBgEM4hr+YrK4eiDVkJagoTWefZ68nxb9hkwxoRXJc4vtyE/g+SsJQrErPeq?=
 =?us-ascii?Q?ln7qsBSTBRV/FTLKIsWIDVYt8rfklXc8dNzB7R4W+Qyl8z35hfuiD4xk5Y6C?=
 =?us-ascii?Q?eS5YY3a+FK11Wm1JPq7bP21OYrQw1dP/tqhfCg6rONOXb/WbIFAEhVyDeRVD?=
 =?us-ascii?Q?P20Yytt5aXrjBCswWfa9p89B+56Kv6oaDoyI8NF9xMxVuddW5Wk+Nz0nTZAX?=
 =?us-ascii?Q?DGTUsMnttIVSwQb/QiPOFkMLH0R/LYL+fd6XFW1iDKKyqqzxgKmgRkfgOUHS?=
 =?us-ascii?Q?/jqS5q6GBVaFKsF9ZRaEm1Oby+fXE/Ut0DXf9oW/mLW26c62F9s+E5nm2g8y?=
 =?us-ascii?Q?wS4VFOtxmUudl4X1ndtTOegdQH7fMnSS/P2o4FZoBESQ6LnjKHt6A8loX9pa?=
 =?us-ascii?Q?FsqASuu7/zJPNYO7t/rdy5JdP60W+cWG7u4rt1AiuEDunuef5tSRPiFCrX9T?=
 =?us-ascii?Q?b87CYyJrFumPwwRl8WWU07z8CDyDhIWQb7xQoUft+Mi8pxwnv8BZjIDr377i?=
 =?us-ascii?Q?J17MKZh63zRv4GVytLq33Y8/0OURD0US+cv+alTjaf52DZfPWY8nRcEiTa71?=
 =?us-ascii?Q?jIPuBf6YduXzYLgqgRQ6fl/nVI0Du0oQpK7hYH2+wznHIKO0Eui00BpC8ALP?=
 =?us-ascii?Q?VNrpetumMu5RbedEpUHM87Y28+xhLbhLM7aNQjE95J61huP2LZ/0C40BbJN5?=
 =?us-ascii?Q?24Gnm5+VLMQjUKMP13V4KCA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4cd777db-55fd-4021-e313-08db2bf175fd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 22:53:47.1148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Emm0sdy4j+LAWWbtuXuePcUmRBbVRsLCncTXrQLFhODOwH8d+A6OFaDgoi1I/Bun+bfvbz/Yd+TZda8daChXbYstMM/SI16AVGfAaArMsizkJ7QJWdnlC7AEiGiALHja
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12022
Message-ID-Hash: 27SPITMYJYRX3N2ER232O2LXC3HIXMML
X-Message-ID-Hash: 27SPITMYJYRX3N2ER232O2LXC3HIXMML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27SPITMYJYRX3N2ER232O2LXC3HIXMML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 07421f5d4ebd..7f6424fa59ab 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1685,8 +1685,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
-	/* link + cpu + codec + platform */
-	link = devm_kzalloc(tplg->dev, sizeof(*link) + (3 * sizeof(*dlc)), GFP_KERNEL);
+	/* link + cpu + codec */
+	link = devm_kzalloc(tplg->dev, sizeof(*link) + (2 * sizeof(*dlc)), GFP_KERNEL);
 	if (link == NULL)
 		return -ENOMEM;
 
@@ -1694,11 +1694,9 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 
 	link->cpus	= &dlc[0];
 	link->codecs	= &dlc[1];
-	link->platforms	= &dlc[2];
 
 	link->num_cpus	 = 1;
 	link->num_codecs = 1;
-	link->num_platforms = 1;
 
 	link->dobj.index = tplg->index;
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
@@ -1726,8 +1724,6 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	link->codecs->name = "snd-soc-dummy";
 	link->codecs->dai_name = "snd-soc-dummy-dai";
 
-	link->platforms->name = "snd-soc-dummy";
-
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-- 
2.25.1

