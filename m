Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803A6EC3BB
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD8D1ECB;
	Mon, 24 Apr 2023 04:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD8D1ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682304009;
	bh=xizdbhVnFWIfgTGsEn3x/B4/1UAoiQDsbxLE3bV+Tys=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uqZw63bAgDc5sq2TnSNusOThZflh9bk9pFk+EbQEJw/FRciJrrHLIe7G9l+2A0geA
	 m9lgziQ87Y7k61o5ZEkzzjcysXt9+WZGvGRStfhp1/XIQBVNdiooXbVeVFgs0ngMRz
	 ZtsjLW/G69mBT6TXTaBUWlDKOWLJKqaXvdZJJVi4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6CE9F80553;
	Mon, 24 Apr 2023 04:37:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D121AF80568; Mon, 24 Apr 2023 04:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::718])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9AF0F80529
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9AF0F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OTIxAsRv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLKP+MxARHJEKbjUoQP9ixbs8D/c5Huc7m/3GJnZm4k7o6Hb/5E+6OTsQk7LV9HJ4yZBGENfRtYP1IpP4SRIxwl+SfQut/mTrPhLfaA3KQdYWPyu34X6hJAyAGcI0RiQ/HAPReCY8uXq51dkm62jOdVBXaCi6GUg0HhFJNVIctkU+hT6Qn0CeKX8lRWsHk4BzQxI6DSUw+z2jujUo08UW8qmbYVwm+JIUQaGgE0Dp06k/ukEBmVY9OSsGdk9EenEmipFCR/ieEkLsKT6XX/m9SHb+wSxut2L/UKsqoAycf3xZ1UE9ngv+YS+ooz+OiOy4Y8vkX6G+j3ugrnuLwC7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztr4i5werXWl1+l4Wph7b88HJ5Fhem4Zb0APeyrj+xs=;
 b=CNmOALPFkHfkG2NG7CQWJmhIirYFSrdQyniU/vVpgaU7rxdQM42YgbYSMVYerTY7mtwcrwa6CBdOwxk0cMYssuD177C3RTKeWi7nazO8S0lEdIj3IP7V1rBb7w14nr0qW7cdNV2jOiyO0DBWv4YpjkIlBpMqIfJzch5wGJaZKE5e/0qcVRl0KCtHx7YORezbGd9/xLgvaDQlfInrY8L7R6OvZUY0nSCuJ9opnNjABzXvMKil3QPKlAwYS9kc7DtzZl5Xxk25mlDZZeZyrBRxd9MBtmB4JhfvuTwb0OpSg3pfAD12vgdGeJNMTw5lCbvG4IiI2LWy/GJwTuNfT51BTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztr4i5werXWl1+l4Wph7b88HJ5Fhem4Zb0APeyrj+xs=;
 b=OTIxAsRvw19d6PjnLFy0FbFyUuQe/4ZqxMs5WVBzY2Er7EsmPLhgM/rH6MzsXtA3+QVjnUpn5sQtmLPERcnb6iAy8YL8rcdceTPZ77siDJXUxIhL6FSjZnOrhU44i4HiFpfOPnq/bJ8Wc8wbwtkXIJVrTSRWM6WANrBxVk6vVC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7950.jpnprd01.prod.outlook.com (2603:1096:400:fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:37:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:37:38 +0000
Message-ID: <87sfcqyphq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 13/13] ASoC: soc-topology.c: add comment for Platform/Codec
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:37:38 +0000
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef42788-e7d7-429b-651a-08db446cde8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YG/U3u3qU13FlzwV0OTEAk3jOT9tic4fBucRUvh6UoKOiKdGpiutFU8WwkfIx2HOlLyvLEs0iQFELZP18T0EQNau2n3Nhd525/tnUsH5y4/pMKSpLzvz8og9TsHzxW/NZvJqnTSbEbEyguunVOXfndvxmCv9m2d/0pYt0dbUPbPsGd9cIHiltBsmWOus2FrXAM4Ge2+UvvvoiH7ZQB9R7pcJdPbYAkKd6f4XRaolzuBbbbJzEMeRI8JBbfnMlggQHy9+uHnPCSQgGMr/TCX4vgUg68sfakdPmH10F/MgcTJI6G4KG/uYBCcTaOs2w+H05c8+ij7Dlr8XtCl69p/m0t7jT36fxixB/zQ6RbDebnKYpZzeTX3M7zYKzBNWyG4ZWwq2PLtwOjB8gTg9SjKFzgzhKPDj9IfBcql0zXLlrNHcLZPMC8HREloqQB7tX1znia+pae8ONHB5AFBT3AtjXst4pDddsYIFSBL/MDYsSdHsVzUA31e0uU9+IrEmulo5XOwM/X426p/Hw3QaJfCSl0dIIeeBgHqPEHuiuyg9X6kpEIHYo7co3vnljvc5zE8sGzQGk/p3XuIFNO8xUqr/1nL62V8N008epIsFVAPYV070YuIxUbeC6M5t1hJk5SpN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(52116002)(6486002)(2616005)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(110136005)(38350700002)(38100700002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rIoJ9sLAbxOdKJVpbNoAp/DS+cJxbMZPxUKq1f6EjizCRN33OsvfgqhIU1cj?=
 =?us-ascii?Q?cX5RNzuHJVb7RL1W6eej/U3O+xlpkoWPFl7TMYRlk6aMTX1afXw6f846nRA4?=
 =?us-ascii?Q?756y8afqg93+WB92Hp31rGpejTWCAHVapIz2kJUDyF1Ku7pmg7zDq5YWMqT/?=
 =?us-ascii?Q?KHcT/c+Gnr2j+2H+gPVM+mGaatdxcZ+RAoWkB5mmGjuLlEsR4xych2VgGBFt?=
 =?us-ascii?Q?jJawlp855E430eLmToJr+G0kF+mN+po59Udd+y4u2+clYcKogYVbA1gcok6V?=
 =?us-ascii?Q?euwsGcy3OgoEKjOV5yjt7+6cG65JZmYCkbS/mjoUszATePwC+kupNCXEn7Xp?=
 =?us-ascii?Q?H5PlVtfMkwIcF+R86ZZe+Xi6sr2+3zaAOmxNjEgRcbqk8CJ5tzCzv2HzoB2n?=
 =?us-ascii?Q?+RH1jIlS+pZOnrO6q+ax5XS3tyMliReXWwyvA9FjG6z8DKQT/YHqy1U7F2Gk?=
 =?us-ascii?Q?SxCHsTMvm9jOrJBMPNWzN6EI0HSE37FpFiq86b2Njz7XrYZ5lDeS3RSMlFQl?=
 =?us-ascii?Q?1oeBpJrsaxIDN2SeJS3xst8rU0dcBYEmh7e64AQX6xkYljl9NKfCK3GSCKAl?=
 =?us-ascii?Q?aLxqDB8Rz+0x3BHpEa2TBgHqKvemhQ95IR40gxPSYxZZfgc+BbgeiV3KiNoE?=
 =?us-ascii?Q?DgUFsyK44cNdoPjsvyC63OkLOlJybJoAfHu0qo59CnkzxAipPo+vQ1iTYB5J?=
 =?us-ascii?Q?UG3VmSDgvTl1/XxwBUJoAu+3Uo1PMllHmGAvJsOU+znK/93o+kc2FRi+/8t5?=
 =?us-ascii?Q?CPd9FIKcJb3mmL9tHOfRECJZ5ZhUyD/Ls1Okz0TtfpVkUgkb0HCRefZamfB8?=
 =?us-ascii?Q?Js4AeseKXrT+WjppcUrRhad3+GG2r0dHyQ5tp0iXUGmx+/J4Rg2VvFwwLD50?=
 =?us-ascii?Q?7wzcWpqz1UA8VKwbCzShMfs/mHB4tqsp1O2knkDs8cfg02SQPnFuuEEF9+yi?=
 =?us-ascii?Q?21JxFq7l+VLh7yZBCssRbME/NDbUuW8A06tdd3+KHsDi2XOxO34WMS97qnUG?=
 =?us-ascii?Q?QBy91SiDGZ4UKMXvfeGN1FjL3/Fdk533uVem+X5i8eVUfmNa4sz4jBQH2pN9?=
 =?us-ascii?Q?LEAQfowrXCUGi1g/wmPAZL8xX9Aej3kWL7Ygw3ejWwoTY4R5aapmsvDAhGH3?=
 =?us-ascii?Q?sezXY+pjKVsG34XSNCXTCqDAN5VK16nXAlOXiN0r3vErs8iw4E4PlK28FUaC?=
 =?us-ascii?Q?kMZH5CFXr9ZtAlllPn8U7XPQDtB0L9nhY3S1FL+iyIS/DGgv8pg5D/DB23ca?=
 =?us-ascii?Q?7C366S0EaxssrqpZp0zLpt/0FQiBkYh6FXH+h1zyuULxlIA8EmkriKhASc5z?=
 =?us-ascii?Q?CXHpkk8HtFm/MYHS8oaN1i3nCscy63DT9XnZ9pgxEdUkWnjek9PPA863gDrp?=
 =?us-ascii?Q?8LdC9NjUOZ91XT/KCvXuU5anQfLIARkWH9M1O3P0FJm+nFENNTNipdcR/4rA?=
 =?us-ascii?Q?onXbNXTk7ucwChKL0PPKK0i0gDRaYbFpQwYv7SxIJVU/VPVBtVut+0TxTjG+?=
 =?us-ascii?Q?YOAEShSW4gAowGYz7XLbBkUuNZZSRyTeZyll44goD7LNIX63l9H/xBeWAzYy?=
 =?us-ascii?Q?lQ3s3oQf2NZSz7JPLoaHukJp5EZKaOu+rT1wcW6AGMzNvcDOgTFy6uQW9Zct?=
 =?us-ascii?Q?uGgNvDv22Pq6dc5YQfqKSeY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ef42788-e7d7-429b-651a-08db446cde8c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:37:38.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 s54mnQZXWJnj7jFBA6FII3G2OyKKNkfrPgv9SxW/aYoL6KLbksXLCLFS5zZLqMwv8caxE7rMHvLwNrigY4VsCdr3lXICFyLYzW8AOyt3smXb9YjwdtZxlHs2hXu/iRhE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7950
Message-ID-Hash: 6VF7WJLQKRZ4W6U46B7GHJ3CL52KCDR7
X-Message-ID-Hash: 6VF7WJLQKRZ4W6U46B7GHJ3CL52KCDR7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VF7WJLQKRZ4W6U46B7GHJ3CL52KCDR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Not only Platform but Codec also might be overwritten on Topology.
This patch adds comment about it not to use asoc_dummy_dlc here.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index d0aca6b9058b..47ab5cf99497 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1693,10 +1693,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	dlc = (struct snd_soc_dai_link_component *)(link + 1);
 
 	link->cpus	= &dlc[0];
-	link->codecs	= &dlc[1];
-
 	link->num_cpus	 = 1;
-	link->num_codecs = 1;
 
 	link->dobj.index = tplg->index;
 	link->dobj.type = SND_SOC_DOBJ_DAI_LINK;
@@ -1721,16 +1718,19 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 		}
 	}
 
-	link->codecs->name = "snd-soc-dummy";
-	link->codecs->dai_name = "snd-soc-dummy-dai";
-
 	/*
-	 * Many topology is assuming link has Platform.
-	 * This might be overwritten at soc_tplg_dai_link_load().
+	 * Many topology are assuming link has Codec / Platform, and
+	 * these might be overwritten at soc_tplg_dai_link_load().
+	 * Don't use &asoc_dummy_dlc here.
 	 */
-	link->platforms	= &dlc[2];
-	link->platforms->name = "snd-soc-dummy";
-	link->num_platforms = 1;
+	link->codecs		= &dlc[1];	/* Don't use &asoc_dummy_dlc here */
+	link->codecs->name	= "snd-soc-dummy";
+	link->codecs->dai_name	= "snd-soc-dummy-dai";
+	link->num_codecs	= 1;
+
+	link->platforms		= &dlc[2];	/* Don't use &asoc_dummy_dlc here */
+	link->platforms->name	= "snd-soc-dummy";
+	link->num_platforms	= 1;
 
 	/* enable DPCM */
 	link->dynamic = 1;
-- 
2.25.1

