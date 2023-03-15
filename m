Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E596C6BA856
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:46:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A27C1315;
	Wed, 15 Mar 2023 07:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A27C1315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862808;
	bh=zr40UXeOoZ/ZggsSrLq51fpcYd6E4vzyU2XEsEClFHc=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imjZlI/oXU9sC5pFEWJCayMb+dxwofK7WKaZh9a63FCGy4qH7lo0spu7STskLVOC/
	 S9nlfXLEnupO9RNnRF5zyWPNeSjVWpEtoXri0PeMxNxx4It6KIN6gdwOXjKONnv49o
	 vZs+NFLFSBloV9fxZVEq3NkoQVEtG/QR9jnrNFJ8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E917CF8016C;
	Wed, 15 Mar 2023 07:45:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF5BEF80425; Wed, 15 Mar 2023 07:45:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93B73F80423
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:42:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93B73F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dCeEsi7q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxpiGZo4IfwbQgaYuMX4SfW7zNhs3+dwDvoLk+Gk6ttNzL6Fc+Nw2sFONx2esFOh1a4dhFBSZbO2mhNH5kv6UricdB4KiZpOIFwg4bwpOFmDoTN1NYLsJVjQ7zYINuFMcxxWPiVoY3QMKoM++YBMeOnUKdTyE6//sfjkhoXzjTZ3QslC3R5Tl3Y6Lqt+VxX1ZAGIe2a33OAKqxOg+OIiYdAYP3/6GovOH7wdDaJt4uAX2ffUomN8j9vy3eoCgDfDy241Ht72oUp2qwJsW2fxOUyy+kXj2kzsU2veppPIm8OKhwoVh2bEq1yg7wY/TlGUbzu/65hgr6Q9wKpmaKKa2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okMb9XkxEysulHOCSZfWMlvJf4T2zR264AHBXbMerLM=;
 b=UNuNi5q2AQQAnyoZBGhRJNeoSA29h6LIS1Cvxb2UUGdwuc30gbxHDRi2m+hMbCR47juO7Rqv4Ae5WF6I9YwRXWvDi4FcGavf1k1hSZXQ8gjnHAWDaqBKgE9Mvb8dzkKPE8Y48P4XXIQlYrspEBel4JiPMFfZIPPM2Dnvy5/hrHJTa6KHJsLce6K6ZOvZ4vlchiUY5Bytc6ciqB+vug4dDyb/3GGjH4+g/pC1tXRLs9rCIuwIci1XmfUaftdCN4ftPVqP4fj+yRan2pX8oOpJdU+4gZzIJRc0uy0/3+T/oactSWUHJOF3v+oZ/IEnwfh2VF5yAmeYDrB8ZFAkxiY9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okMb9XkxEysulHOCSZfWMlvJf4T2zR264AHBXbMerLM=;
 b=dCeEsi7qudVVQGfuCWq5rgV3lE33d8Vcfz7eE6NbctWjeYaFWr4lsguBjmfAmGChARnMLbbwATGvt1XnNEQYtryDi8XrK3LyrJQe8J3QIK1xq/3lExB8imBU5fleQ3kc/Bvsq6heMTnPGe5KBix3RRp2VRqf5RV1j4HH3XtCDvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11479.jpnprd01.prod.outlook.com (2603:1096:400:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 06:42:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Wed, 15 Mar 2023
 06:42:50 +0000
Message-ID: <87zg8eikgm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/6] ASoC: simple-card.c: add missing of_node_put()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Mar 2023 06:42:49 +0000
X-ClientProxiedBy: TYAPR01CA0074.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11479:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d00738a-3dd0-408f-9d85-08db25207ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	30FbPwZdK/nrSiXuJCSg0pcY64nVwhrKuOfkcKR3bOzdPsYMLijQcCihmClrgleWwuzKhiebACpjtrOTeW22p8mjaFw9RBshhKWtrpY1pXC3U0vQv7dto0qp/rhznoQfkP7nD3NgddaXbfwAr88ZnISD/2Pj/MeRQ95qPA4oWOzqk4DP8SFjs/2nPOyvfkzAdAxSK3yjPtPeNUjS1NfZeT5OZau4dVI7GqtZL/4ObFju6wEMVvNS/tipttV5LoX4+wJoLQ1uDNKJ7aN7b8zelFbH1zy7HJQr/bSNGsyuPaIPYZmAtEFAAEr4fkvvhcpssVK658UWzNsAb+yYabZ/8XvEm3w6auR6lJuvsn2P+zpJJKhBC5asOjXFgBvtZNgqFXT0hWjyNLhxnTN+5hQW6uLI5lF9Sw35fQn+O35J6HXyK/zt3ZvMrOe6iUMdzzpQ4WGjhLvAz9dESAP7lWY2D++vkIRZPDcLOZLNlwrERWXIzJjLERutV65JEweEpeL3/G7fVWhCFPvaQqmNBAkkfMJKVydmS+JSefxzm9SJCRr8KXwHM6wP5zkV+LVxMq5x9T8/u4isgtpKnTb4eYRg2I8Nu5T/+eSeFAtUDvm67ce2rU854pq/c7+zArHs3SHLTtuBtAHL09dke0fnOeqrWL9EERXQSeRHYS5LQgu/gEOz8OnU0v5D8q8b6Pl95u8ufHsNxN873lW/wqWNF4HXgQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(4744005)(5660300002)(478600001)(52116002)(2616005)(2906002)(86362001)(26005)(6506007)(6512007)(6486002)(36756003)(186003)(41300700001)(38350700002)(38100700002)(4326008)(6916009)(66946007)(66556008)(8676002)(66476007)(8936002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oqe/uM37nWM3k8+SMxmjl7eCY21rlx3SLg1CZxfexL7j4mWvt/2RcytWNJMY?=
 =?us-ascii?Q?b0W3e0Vk1rmOEPPaobJh9GGge0j/TtVztk4/oSrbLbGO6I0q7q6mv6wZt4Ta?=
 =?us-ascii?Q?uCPJqN6jyHQFNveXKA2xAIaU/MRCHWR36J7wYGxMeboUvdr/IYE+dAdB5ojn?=
 =?us-ascii?Q?a8rqFz0J6Hk1J3vFygGMv8ULBU8gZ8vlvPRwfB5xyFBGjDYUnxJm5tqptMP3?=
 =?us-ascii?Q?I/dJYa5b5sa/alfL8TqejLO+9GzlfrsMhWl9oHNOCY8GzY9SrMnovtczdWwJ?=
 =?us-ascii?Q?JLJtqBQEUH8+HTLm3Ks6/pWpZExXXJS4Gxpy2J+G8hB6h6rhHU7PUKdGuR06?=
 =?us-ascii?Q?/w5N2tQ6RWj02Hb9gANvrh2B3f7mpbVTu6QdmTSgcTIMZZ4EVj4quZWJ9fsz?=
 =?us-ascii?Q?g0Bie8Jn2olh++HdCrQ+97FoavrVJtRgTVAlGQWMQp46k/4cSSY2yW4NyZ+F?=
 =?us-ascii?Q?BV9Dyi3nxCVunBKl0pq5A2KqED1DXF8Dd0kNMvytlPePA3fkZdXKD5K0szbg?=
 =?us-ascii?Q?zVHLRBeRd0MGQB3YRtLH1clcp6AbgXv5tC7F2dDDw/23LXvC0AUPWuTK9iMB?=
 =?us-ascii?Q?tYTAzgyvINL2vrBiXesZrkDy6qstGHJONiciYGaUPXByQ3/1M+hePCsvXmRf?=
 =?us-ascii?Q?hMW+bDFEtnlOKNN2veUaPbP5go4hIIun3yD3XT+ll/7BYJvRXc7/oRY7kJds?=
 =?us-ascii?Q?sIkFimkTHDOOPnR4q5t8jed4nZwKkBwk1rWkW6RBVr4dGi9hVryb3KFCI84o?=
 =?us-ascii?Q?8gpEWP3zKZN4VMa+dH0NYi1eBOPlzPkNJEMI+CD/NFbMw1wOzZ3RqtFpbAx8?=
 =?us-ascii?Q?EMibjX/LT6U4jgXlMWBkjhz4x4VU6AVF66nhUBqNBqocHHGiNDk6tWQUQLRZ?=
 =?us-ascii?Q?+XRzphHe9NNjbTAxSbjVud7WVQfmqytqAWr2G0vsdzBH5YADv9yja/091J44?=
 =?us-ascii?Q?sEoWq95sigKZTlWhYSLSo7V48QzIp3M1f3Ivm+ed/fY1fqgxAGe9M4vWaQn6?=
 =?us-ascii?Q?u3ltlkiAfyrnbgBq+MTInrvoZPcmwp98AupjBMk/EWlqZQP4JzQrbZ8fdzk6?=
 =?us-ascii?Q?uZkgQ3ZNQDxJ0tJTDEKeYmnbdVml62uDnSK5b0M5fcAOH51EWdHojSmKjsSQ?=
 =?us-ascii?Q?TBxem9dB5aZ+qPgPja+aH3GRuan8vkF2Q5vYYk8EXw0ZOakdAMPObkQKmvqx?=
 =?us-ascii?Q?G6KCs5naCL3rZKrKJhiGUvvuSSP2nfpfyP6HFJ64v/ClSTE+wZ5SLGLoGhKH?=
 =?us-ascii?Q?ifAz+sYD96JEdIBpN8artnyftRiiW3PIazIMpmk0eWpOYhXtDbnVVENkFxq2?=
 =?us-ascii?Q?05zTMKNdvNQFNFPfCH+OL0ScXCQCG0ja9mgpgawNWAsr6xYYg2ABzxW/dCO7?=
 =?us-ascii?Q?I8YiNlUJFxcQXjefks7T6h3Xrv7V5+aBmK2o+7kCMKwEHjOaRJriw9o81x21?=
 =?us-ascii?Q?a00WVFsevwR7lMtY5ptqzIS10RXK+H9yQcIUUshUdxh6uv6GzaiAxiXo8pTW?=
 =?us-ascii?Q?cdyCh2Row/kT0KHcw9aujTV5fDqlArWoJ4L8eajBBuRn3+eKXiALo8HlmJoH?=
 =?us-ascii?Q?8Thhf4YMHACdF6aD2aRCyxIoxQeFAAyo6m945TyFyt6Q1hVI0NweSi39Sf2I?=
 =?us-ascii?Q?1SBL88eKbykOC/deym5XH5s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9d00738a-3dd0-408f-9d85-08db25207ecc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:42:50.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KDGm0dUpSraXZTUyLOcrSegXYLU/D7eKVA4E7tEIjEYT2cwHpX1JeGQyHgDNv19RrjMxr8eqH8dPqD/TTWotJwgVZeflGJm6XvpKKB36ETJDo3jmCcJuwDCvaLUhffoM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11479
Message-ID-Hash: FRZEDSK6UOJXZUWTTNHH42V4FWNW33QF
X-Message-ID-Hash: FRZEDSK6UOJXZUWTTNHH42V4FWNW33QF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRZEDSK6UOJXZUWTTNHH42V4FWNW33QF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is missing of_node_put() for platform.
This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index b78d9db6ca5a..75176b89693d 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -420,6 +420,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 		}
 
 		of_node_put(codec);
+		of_node_put(plat);
 		node = of_get_next_child(top, node);
 	} while (!is_top && node);
 
-- 
2.25.1

