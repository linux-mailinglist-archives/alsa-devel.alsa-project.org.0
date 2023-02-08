Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F20068FB61
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 00:44:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0E283D;
	Thu,  9 Feb 2023 00:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0E283D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675899866;
	bh=y/GX6r1ywa/7rtt2RIkTPvmKhypaJWv+40bS/FbpaZA=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IM3jPNZvm14ZV3ZpzjeOtQN8kV1quz123PJzRSa56513YuQp+GO8uVTnhQK+ixDRU
	 vicxvbH1k3TJuLUAb0C8azkt3i+sbqTRxYjnMdV5hrjUA61p+d9eBaOuAfImo2fB79
	 JzIaxHW7fF0xp4zz0CX35rZIMq2fxA09GR5RAcnw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E2D1F80094;
	Thu,  9 Feb 2023 00:43:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D82EF800B8; Thu,  9 Feb 2023 00:43:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82D86F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 00:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D86F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=h08hwjRO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cI2uGOYBkKKuAFd6cewKPGmkZvoQ2nhQBuFf5F8CV8KEVjOD/YaEWwDdBct87rptzrJOq0QLbMqhkTQ+bPdqrtoWlSHjd0XF3rm378vcGfK9FJetL4VjIoI/LMnmT69q9FEbb0Edz7NmSwaIWvkNi0lg5deect1K0Rx8awXXV2J244iXA4eA0pMxfEKVMRtqdbtCJ45Fw5MzrAUGjoAd7QiFPrAHRjvc5otBJggXuOPlZVnts1IJW1KHgJtGiKW+YUheWeAzQZfwVgaYId0Zy4UrQ8qo5DYaNHbsvk3pNFxYVgTNuAJOc2xMccjv3l7/bALL86pfPhF1f0dvMg7/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfJgam8zSSh9+fNhIDmiwakUBsUnXPYcgaFdEcyT6kI=;
 b=nC3g8NcVEVYg4IEFn+8IXyCkcFVWzoUqAaJgegMIhNz6CUkDs+dOZFIMs9XOc24v7MSAjkeqaHFVkCH+YD4OqJA2sRYK2A5PgZ3XudFOwDVei+wshK/LDIF33zNcXi/2ZTRLO4mbPlOeZQIpmNTmzQfk+ddIwCfyf2sVUKDCdUWoac/OHyEMNP6sRnagss3CITY5b7EV5IKDRsANwGx7ZhJrd/4tEVeZHn40a99Uu01WFHoWluIA03HkYJ8tLtRqDAkuckjeQN6rmb6v9njV10BfKA427iCrtYwzYgmE0Hr449lYsXNs50DxFD54IMW85qNX+OIHo215LwlZgLiiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfJgam8zSSh9+fNhIDmiwakUBsUnXPYcgaFdEcyT6kI=;
 b=h08hwjROXjpHb30kBNcihvJUS/QxFcwRfyQ2msnOIUBb8IvPjnDpGjJ7sYrrFOaCvxEjYUez38BuigjxceBbm3KCi2yK/wpFB1lBSuprLO+K+6v4hvYoLWjNWbusBApwA05BPQz4O/dt48fbIxwRz4WVoxdshNvBWY+FRGZCpMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8451.jpnprd01.prod.outlook.com (2603:1096:604:16e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 23:43:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6086.018; Wed, 8 Feb 2023
 23:43:18 +0000
Message-ID: <871qmzd8q2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: tidyup
 reg/reg-name
In-Reply-To: <a743cc0d-7a6d-d5e2-2c7b-53baaeb87ba0@linaro.org>
References: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
	<87pmalt01x.wl-kuninori.morimoto.gx@renesas.com>
	<a743cc0d-7a6d-d5e2-2c7b-53baaeb87ba0@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Feb 2023 23:43:17 +0000
X-ClientProxiedBy: TYWPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e4faec-e493-4db4-74c3-08db0a2e4109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hT+p/QV1aaSzOBvk2yhk8Kh3SWL/eZeyswig0/T49yo5TBYh6JP00dn8iGZlAwu+BNBRIKcH2s0+hHD1jwIxcvJNZrdaVTv+DIxQytxVxKNhg7zCWDuT3rozSH4htm/7uOwJbe+aBgFkZ5NrH7YQfWxZiseYR5x0uoy/fE3CtIWYjhBSJIYsCWzmNcvw0wmJB2XJ0qMZTkki8O7+G+Pj2zKpPxYv68zoOsgLMJtqY/MaKMvs6uIUEtVjzBNkGBYU7aB4MYZa+Yz0sgiNVWB55orFDHeoF30DEfP9mcWhDBXaZ6iuJZRk63VYozx+If+J82pdiWyDBxswFBUwIKAkeHP7uG3GmCE6DsyeFG5/xzZ865d3C9x2LaEuxiCTGF8QLGC8cRi0k1pJJE/UsNST/vKFWewgX8XiFh9YyPjFIOOsu/g+2+r5Y4wZKQWllggjNDylzFHaZelo0gO+8/4eyXwX+zpbW31BkC1veRTnhP5vrS+9bAf9UxmXyG48rouk83th3BlVvudCUeey3uLV++1Fp+NSZHixe43NDY79hoYZzZ3ew3v9SPql8JerPu6v6HK7qXQfM+uYvqtMEz3vxPorSgOqli0q8QZDBHQLmkipthlRCcreE9yjoVkO8XF/cpWIuvYTif8MybDdGGpmCIo12TVIotWNDlNAHBEIbZf0C8Ewwjb3uh+RWKGerbJ5WrkACkDv3sS71Tes+dmI8Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199018)(6506007)(8936002)(316002)(6512007)(26005)(186003)(2906002)(52116002)(5660300002)(54906003)(36756003)(4744005)(86362001)(6486002)(478600001)(66476007)(66556008)(66946007)(41300700001)(6916009)(4326008)(8676002)(38100700002)(38350700002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oiKIP+FtU3N3AXUXk9y6XZey3pQiEo5JIzpLhAc2xcB55kborxCodH+RA9oy?=
 =?us-ascii?Q?qPLW2rHB2Ql+GIM0R3kXmLU93Qb4rTwrjwxqWynTRHHdSZDgrJNtf+m/Loog?=
 =?us-ascii?Q?iCTKZc9n1kR6ZXfaH2cieKg9fF1GTPyg8MpGTt29DnIQCQJ/iWDQcecyXt5Z?=
 =?us-ascii?Q?GThpYJd52d7SJ5bHo1Y2EorXjM06tSt7/Z52gJcnTbRUwQQBDBk6wjoQTOen?=
 =?us-ascii?Q?uhzAAmW8lwfpKKENUqBQLN/D4vEqFbS0f7LTUOya83YiFfYS0OjBWHVRxvf4?=
 =?us-ascii?Q?pq5VPqQQY4Bd1E7NuvsMawpaKAk8ae3yjTaUSTE/tRA8iJOJ5G5o2TmH9yMA?=
 =?us-ascii?Q?4+MM2VT6JWDUrNA+jTuTDtfXnjsLSPQNErQbtyRzEuBNq3ciQqX+0JUbTsMf?=
 =?us-ascii?Q?352qa+j7/OVi9682L982MXCLP7FnMNq9CRHcsjl4N9RbvuNB7gNbIloB5zvI?=
 =?us-ascii?Q?f2Z6+QqehlAmEC4HpK2KXi6aIyPs5jE6kd8JQK1goFOpCfRyGdD3/u7IW7XS?=
 =?us-ascii?Q?r5FbfR7OvdF0JAOUDsrX4s9JE86di4O1M0ufsjta+gs9hwFw630hBOr2eHhK?=
 =?us-ascii?Q?3VlaR2cMddj9ymRBjtQ4T6xFAJCIgRfUnv/rdTG4ZurYvE3QwsN+8APfoIW9?=
 =?us-ascii?Q?Ov9KTUSZBaNz3py68R5WWnFocZDq61OV+2I/9M2rimAfE3ZSwLtZRuoPUQtz?=
 =?us-ascii?Q?P3SZnXWcUoF+6WLya7tleVtqgM6ikIVfczwSqTCy8ZyyDj6t5GTtMjZUsuzP?=
 =?us-ascii?Q?1KHRU9Yuit9zS4YG6dzJPYdR1LVxeW0Kc2B1nlQD/dDLFYVFWBhyuEPLoYsg?=
 =?us-ascii?Q?k1Yz8N34x6prhLk66H7gjRFJeCxuFd3rBrtr59/SatXdxAIy3FqP+z6akz52?=
 =?us-ascii?Q?4Auh3DhwAlXElMSGbkL+pJT7Y8Us9Ko/JeXdre88ElkHnIg1QrZXp3lIZ+BD?=
 =?us-ascii?Q?tv853LugGgTJ5PDMtQeabV4P2F+NwlIT1I2rsH0GLNYFUS/WPLIqXo3UN/aL?=
 =?us-ascii?Q?ut9+Xjb/vjNsbsq3Rcr6hxDbT9Ucpy2p/hoSyXwWPL6a/CF0ZvjO2Gt1Lvp4?=
 =?us-ascii?Q?JY/dIVznVNgGRQlhWE/2cnDg73qxE+roAi7TwuRTjRUct5Or8xn+bEoUEiGX?=
 =?us-ascii?Q?CqbjGQSPbxv35RNsG8uXXie+YPKr4bitl7Dy7H3N8XNN1PRHyEAtRnaE25Dr?=
 =?us-ascii?Q?MRSiaOXl7gNSGyifhk7rqsAp9HREm1/LyW6fhnfff85JFXWibFWNV5v/GwWS?=
 =?us-ascii?Q?rWDjAVRUNXQWQ6XHkTIJqCZ8ZAYiGWGTiJw+Xf9NgsPYYVp7QIZ26zM4MpjK?=
 =?us-ascii?Q?FIGml2W+5GA2sIf1ETwWiiywOikqSuA0FdINoLHOWcjM/Jp6nyQSks6QLFaX?=
 =?us-ascii?Q?YfQ3+G9AVgCAJPVPv3m/XI9z2h38uAkWRpQQRHBZ0bv8aJRvEF53uY6ZEqJI?=
 =?us-ascii?Q?Q5x0PZl3FY++/JPnBKfAClrt3e8qp1ixnTp9/DuD9uE/OzCVwODDAZOS71wh?=
 =?us-ascii?Q?4/mViNfPdb/9JKux/7/5gCxCoG9j2hmew7yYc9Lv5p6H7T0XYN915of0+pBj?=
 =?us-ascii?Q?jKwB1NktowaXNQ588Rfc2zKsZX1Jo45ibZdQB6l8ocHq0iVcsL/Y6dA6wTbA?=
 =?us-ascii?Q?K4B0Wu11RBLjVedNzJx7XGA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42e4faec-e493-4db4-74c3-08db0a2e4109
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 23:43:18.0843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rvjVThhlWoiD2Z8Ce/TdHPJHRo3EDUyQ5HzPm5MpV72Kr5I5xTdcCAWbAhBPRcKdxDUNZ15GOimAj28UNNCpXgEBdYVqYMUj9OABeM6uS6HATl66FAGm67Cpz+C3Y/cD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8451
Message-ID-Hash: YJ22PIU7WN6HQZQZXKN44NPWHLNTHJ56
X-Message-ID-Hash: YJ22PIU7WN6HQZQZXKN44NPWHLNTHJ56
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJ22PIU7WN6HQZQZXKN44NPWHLNTHJ56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Krzysztof

Thank you for your feedback

> All your commits still have this blank line before.
> 
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

OK, I will fix it.
But, I think top blank line will be ignored when applying the patch ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
