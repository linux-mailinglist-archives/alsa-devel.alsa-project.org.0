Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF9562AD4
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 07:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A56E16EA;
	Fri,  1 Jul 2022 07:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A56E16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656652854;
	bh=zS7poFe2GuNBdtSvMSTwv+P/tQLwht0RR5u3CO1GCY4=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IA+ByqwOxfy5uHi1akUqXBToOCdh3nDTxXFHoUFUJvxE4ESTxgfuiZtITHFnaMVB3
	 KnsDP6+UqMFLaKpDaHNhX7R8uGmoLOE97LB2gwrbHmT/K7S2N1255He6cakJc1s74P
	 3oda3pBGhQ7PaauCdi4HXt/KkASlWcvSzzzyAaa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E577F80558;
	Fri,  1 Jul 2022 07:19:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5285EF80557; Fri,  1 Jul 2022 07:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D9BAF80551
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 07:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D9BAF80551
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="WfGOvZdJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7qJblV7Rwoufa9SSdR2sAfxqrsLrlJIFxts/fiEnUrjGplqJqExyDX0rNKwsxirHX6hGUUNKmGV8Z7j/5GHy9SM0a2bjNVKqrd+gZ7vcyFC0ZjMTHZs72GNDeLd94i88ZMYy4TU3TP62Ofm7PbtSEFQ76Y7tBV4/0VlrrkExVcd9fqvshW4OZTu7Wqea3FzyTMvHJJpmLhmL8tjWyqZOKGvK13hv2l05l+6YlodQO2P21Kg1P4w99v1x8gQJtDv3/RTQTqmrV/mkxKfGpzUExF/TGHnj+rZ0rovvk1cEEo//zttUZv+Wi5HLBv/5/cE1CQ8IFsZIGL1kVAgSXHbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRHTA/sgno1S/4tWke3KZ9iEqh63nqgyejN0+jsoo1Y=;
 b=GryhO8T1CCJw3Kzqj937EPvD9PLQE3brcvDkGDeFlZcDDyIJrKEi+Ni30vwEAcNBIWB3p1ftWUDHDGc5GOXMNoV6mUFZMAGKD8ZDi2G0udeDg+A/CX/rBIKLDQwOQpaI80nD0kpUGEOpz/KEGu6ZEVVTfCBjx6ZbiCpt0/XWD9IXjpqwQHMjfeuhL6EqWG15Xaw9YL0etS2a/j3viT91qk65DBXHLzbeDDXaBXY5DTG4KZMwOahLUvQX5M8aRmITKeNp8hM45RdHNUUj7eHcy0t/DGBqmcDKQorJCVknojXFdfYdCKuk0gLuNpDB5NUnbWys5SJ2LQla1PuZYUlWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRHTA/sgno1S/4tWke3KZ9iEqh63nqgyejN0+jsoo1Y=;
 b=WfGOvZdJuoX/MIOFYLCBkOFO6VBJ0kRkfARnIUZnuh1AswtbNDb3Da7VRS8G6hzun3k4IiQAk4kc02gUcwvhhdnZPXm/peOuw9mDy+jTL6/RjGQffsCS3n7v7eKqUbPLcOf7XGEAdN71y2rlDrnomJGv3Z54ZlzTGvGXK8tbMPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB2776.jpnprd01.prod.outlook.com (2603:1096:604:12::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 1 Jul
 2022 05:18:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:18:51 +0000
Message-ID: <87a69ts950.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] ASoC: simple-card-utils.c: care Codec2Codec vs DPCM:BE
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 1 Jul 2022 05:18:51 +0000
X-ClientProxiedBy: TYAPR01CA0181.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e43c29a1-b72e-4ed1-3f4f-08da5b212f74
X-MS-TrafficTypeDiagnostic: OSBPR01MB2776:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0A8/RASNBF3tHALARst4Rc2UUwqMhB3gwL4NVNWgOchoUbMHt5aYQZAj7bBmJ5168XFT0cCsOOvzO65Zt5aC3YxGuhb/grmW8qmlk+gq1kvox3bWpz7U325WpmvBundyChbK9w5JnqfBfbFf7vNqOvRx1pNZKJUi15BYWb+Bk8Iu5PtBjbVc1CTHt2tDrcxkiMOTYHUPthCni3t5EEUl1iKT9EaU3H7i6K5CkdoQ4gEqX925fioGbeiD+qVw/9UaRGXKxBxybaE0U0OlMDMkh/NexgIXTVRyyUF9s+6Rf8frlhh07lZtJmwlZ5Ni4XIxSwr2vGiDB7xHcrxExIx6LJ0nX0tjZp9RIcX9mYGUrOxRRjrADOtEJDOqR96thCTJuI8u9ZPRomUI6fzu/P0ZvjS2ZID5DckynKpO6FVBodCl4odfeWkEJ5Rqht1AYzccnXR8Ff/vWb15WxMRnCuZOy5wiGHRc5AKC5T0BUztfkJcBsWS4BbcI7aYQyxZCKe2IWMAjC2psP6E9Oi4+W2Q98zkk4fV6tRYMORN0ktZoeRwGzA/ZWXL0WYuWADAttSi3VvR7ZaPDXXKCiba5Y4dmTtJqqRVdTVDXyDhP130asUoWp3Y/ar6WCmbqVRGMwwW4ck3UDqFoFQ+aqhJiFjGrgPR2EXKQBSbGS6qaa5R5s3ZWL1jvZKS6ORYelAdiWqn7P6wO1aP2Oz4xoU2tOSZSkXSeaGo88oyfCvVnBkOiZvAj4rIEHNKhFQFb/hYy7cON0qrVqiBM4f89zGZ+3sjqC+Zw3eVxOoiPLzOf3q35C2tSorkppU3+wP50dZs4Est
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(316002)(26005)(38100700002)(8676002)(41300700001)(38350700002)(6512007)(86362001)(6506007)(66476007)(66556008)(4326008)(478600001)(6486002)(8936002)(52116002)(6916009)(66946007)(2906002)(36756003)(2616005)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OoyUaZHKuE0NoztyvY6Kyb65Ip748BalD4RRhFTRfaJoMQg05UIfv7LZ8AH2?=
 =?us-ascii?Q?iTNTe2DoT7QIO9W/8FGhTaO7/zDixWC6GDgqUDCc27YYeUb28GoYRjRrpVPv?=
 =?us-ascii?Q?BqkH0fr2t0UnCDoL3DAo5mUyVcAzHEhX5hShjTjGKj3zAD9s+H+w83qMOdJt?=
 =?us-ascii?Q?K8w8rPH4eCPz+dHhErT8i1ZvJHFwewzs4kgiQjV0YDTIQ93Io7W2LtwPE4g+?=
 =?us-ascii?Q?NRRjqWJPvhNjn/rSfl1mkch1D26bzWesrcjtO0xsPxnV7atGZcv6fDMQqubR?=
 =?us-ascii?Q?xfRu46q/e3hsGBpTGbZamSUqz9X04bRMYOtMFHBp9efcElw6C6RtTknbCHU8?=
 =?us-ascii?Q?776Xsl9s1zqR5GHgFLT0oIrKrZ1qU0D4CqiEU6+XN1hv9Y5ZKJo7wn9IQHfJ?=
 =?us-ascii?Q?uomihSNaagKUfHKV0cAvlnh5pBW6hU0ekKMaWVqEXQY2dWsaEHLvrKyHZltK?=
 =?us-ascii?Q?HCi8AR64erlSeE3W3F+jNGKdgHEJbLhaYpm5RMjiLCPmG5COzTAQDd2+/jXi?=
 =?us-ascii?Q?GaslUdUt0aQDuD3jxJesei5ZliTkqdPnsbk755GlmTKr8aZctyQHZV5GgB5E?=
 =?us-ascii?Q?8xybNYBWd4K6DY+ON2I1wj2gpFS11ChTxgOMZf1bP1RhDSWm5/MJyehqW4cu?=
 =?us-ascii?Q?TUNxxqOJKBwvWCbOWMR7zIAttp0I+r7qZx1cn6HqqGqgrzB78bp2YzQ1NsJ4?=
 =?us-ascii?Q?+Mt3FoHsy0f6JvKRAQu/6SEIJeRCz2l01f/Gf9w+z2BFuTcF0B2yUvV5eFry?=
 =?us-ascii?Q?DrFammqd7uRANs1wQY0UQNAS/J+sRpr3++R7MDf59xL/t4eUlz9Qdgmnrm6J?=
 =?us-ascii?Q?vDQocSHta/EZbsYx36B0xBwFTDBNTwWvV+J05O2DaxQAPBe+AIXPlTztmf8C?=
 =?us-ascii?Q?6RPMgRP1M8voZmireSIBkcPZOMuXz7hc0LogHDkhJVwgjRtkNfHYB8Q+zzPz?=
 =?us-ascii?Q?IaU4s1IQlV0BwRA4oxhduiJBU99imjQ3rc5ErLE0hI5rJEl9SDUayZNjZwh6?=
 =?us-ascii?Q?trfZvnzQtOYI/E4PvnkVCN9j8PTz4ejNqrwdh6O1IcQ5H1FscdoJD02YLUNg?=
 =?us-ascii?Q?LSbMywJcHd9RRUk4iKD9qiQThRFe33t9WV3AFiQ9wReSgJ3FZDKaTAfoQz8w?=
 =?us-ascii?Q?KTXRL+doFuu47cjysJc80cVpqMyyEc3gLLFF6hyV+HXDrG7FwiRMeCzVfMJ2?=
 =?us-ascii?Q?052Z2OrJjRU1LTILjy99XnwHL4t1Bkbt4jFtIBd4Ggh984QqJjHasAEz/V69?=
 =?us-ascii?Q?P9AVIKDeqFoQQWR551Tw0rdAHolvbxWM1bVh4D36BC6oNKLm/PQ7SflfMv2H?=
 =?us-ascii?Q?g3yZJC3Bj24KvIpIiEWeXlBfEhys7Nc7AV6GJPEPm40Ovklpd5OlfEmJHYQR?=
 =?us-ascii?Q?dcD0HtCEEqgiIK2K7D4oss5G4uky3g+Qc3/y0W8FnVZE9LVVgJr8SB7kiQ6s?=
 =?us-ascii?Q?bX4wbbMP+972Gbuec3P6S6XcRjK9LsCAP6FLNLZV1JIn7Mpk/XR5x+56c3Ky?=
 =?us-ascii?Q?I9TlEf+QsQ5X2Bi8TY++5t1SuttmnVv+beQp4djetkgcJRsbavrI7ETVK0qO?=
 =?us-ascii?Q?o680oX80+6bmU4TtuHoae9gsGKlCGSIUSTEK3xfHPxF01xxbhQ0lyfSH0+14?=
 =?us-ascii?Q?hBeQ1IP5CQL3M6H+/UKJjP0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e43c29a1-b72e-4ed1-3f4f-08da5b212f74
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:18:51.7198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEr0JUk5VR3exWd6egM14o+ZJ5nmztLbddURi1PpLEq9g5eN3yeQOsAW+HRjCfEmNNPmziqBFHnK8WiLRzMmtdqamTPVVaFSHXPoWeJdqI2CHLis38rEGKA5X9Ne0+3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2776
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current asoc_simple_init_for_codec2codec() adds default Codec2Codec
settings if rtd was Codec only.
But DPCM:BE also judged as Codec only, because dummy-DAI doesn't have
"endianness" (which is key parameter to judge as Codec).

This patch ignores setup Codec2Codec settings if it was DPCM:BE case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index b8a3da692ee8..4a29e314fa95 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -531,6 +531,10 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 	if (dai_link->params)
 		return 0;
 
+	/* Do nothing if it was DPCM :: BE */
+	if (dai_link->no_pcm)
+		return 0;
+
 	/* Only Codecs */
 	for_each_rtd_components(rtd, i, component) {
 		if (!asoc_simple_component_is_codec(component))
-- 
2.25.1

