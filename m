Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2B6B6CBA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 01:01:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 422C11198;
	Mon, 13 Mar 2023 01:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 422C11198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678665714;
	bh=ndrwiElmR0DxZjXfTkP3ZAqcUzEWmP0iuDy6T0iSfnw=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XM5hIUM5c1HGoyQh8oSWUchsfgAe5+4nVYCoLMvbJuTYncxfcomD1xtbEgvMvWaGj
	 7d6k04umYw5r5GhA0MCZ6UK+li6JHX5uxXjyVQOo9GBGwhnUdAWdZWbjSPNkz1WJCn
	 VPBZ/pbnPqlrQ7SaIg0yaePKgT4gFH9yBPoNnLAY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB32F8032D;
	Mon, 13 Mar 2023 01:01:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF163F80423; Mon, 13 Mar 2023 01:00:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BCF76F8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 01:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCF76F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FkLn7Yx4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQu6b6YtQeOqAijmfdZB9YVyomMwJKV9bMUFUStpBf+ctY9IVLT0z8caFTvrGKYsinaOvfbb7K6UaqkkM7KQ4nx3C+VXEVsdwlhiXttcJ+m208lFrUFcXK+jvxs0nHHdXlrVGmWy3kVGciwkz0CoGTWjAxdYsro3KKyzaJ6vHQsMw6dGZrjxE/m2YpVlzHH1tvddXH8E4Ye1xcgRE0+GL20/thE4M1h3ByfRN6M0E6mM7dJvMlTZYwFqkng6daZitCt5p5E9bcSFqiePI2i/lxQyIIZfyC3vyxCGPb6Fo+pNEJLbf5zsWb0hUoY3SJS5HM3IbvWMMLNcR6XTi3e1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piJNvybfFdhyyYQvOha95mH0EnPN8py/NaDWtXZh05M=;
 b=YnBBjH6RIKvSosCB0uVYrDV0XfqSgN3PfGb7lGDoWHxFdj9HSmUvplE5wYrXKHZTa/Cwj2RUng8m7Du3OuuShy3mgMPruJWfJnchnwlgPRdf7Zkjdd54LnEtMBT0PleSWn4r6R8qgI5w5knLPzWguMn80xqtkJWBT5QV9unh2eUDy6MpergGOPCJQ4qxaOCSwiuXijMmblx/+1FZAW7aU//oUPejlD5iPqadB4INXGSPIu7kb6dOVURn2+yVlG65Rt0pcebQjxZV/UO+eL/flj5/R+90cKhB9D4UWVcTKFUddZk94c2/zZcOCiOb9Y0wAeWIdSAc1bW/Iu1QFJLg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piJNvybfFdhyyYQvOha95mH0EnPN8py/NaDWtXZh05M=;
 b=FkLn7Yx4r47UGC2vtiQxUXGmkqY+UBJ8OobWdSZtT1IO4rRLDts8fUiErBBnCdZO5s+Obn8iVBv1zxBHgaINFFumH0Vf8FSPzSGLj+TnArj9ijLhnAunhkP8F+EBTahUFSIEDbATh9/j30XcFjC/Vm4q6SGS6Oz/l6DLtID5p9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5503.jpnprd01.prod.outlook.com (2603:1096:404:8024::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 00:00:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%8]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 00:00:47 +0000
Message-ID: <874jqpfrkh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND][PATCH 0/2] ASoC: cppcheck fixups
In-Reply-To: <ZAs/fjWkCsq6U9vz@sirena.org.uk>
References: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
	<ZAs/fjWkCsq6U9vz@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Mar 2023 00:00:47 +0000
X-ClientProxiedBy: TYCP286CA0151.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f52b2a0-6468-4475-7c89-08db23560005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oXCiz/LjQ1TDPY7egoqcEQJq7i2bd8WoOUBr8INn2LXSMnFE/HXXpVBtKlX+mP1W/kOp6FTrwawiQWGhcdDpucRDnm1MSxFzM/r214kgXPpiOBt6sP+YRALH2PpWPz8Uu5T5qQ1MBOloytruwOkekj3ak4VR2gT4+BgnL7WpDPnVL+ji/r734VSkTOQ8qF5Ujw5fGPFXDrfNCmzJUuuXKmhe2DwB3ztuQz86nCxnwqkYqQFi5cWccWIrR35G+OiuIZSj6xmczveOCnnZdOml1a9/80SCVp0BKW+PCgquaAkt9yIcRd/XHIhko5MJXonbEtrRrr2p/hKOZYGe2v4hyILR4OB5j18IxKDYkJFjCJjMUUt40F79j6u4aDvm/u9k2xsmc2RYb3YkfZlcfj2Q/rooiyhrtoru+CMYi+8V+sxMTKe7z1jBv4NHdyDnBxKCf1HFLmqFAG7YrKfRUDuwolMK/EZtC9zErsmgXGfBvY6uH8REUqhO6BMzL/lonMaa9eo7ErM4K5o+d1xe9gdEb5ho9o6rU8+Xzhu1ue13t64gCiI6BEJRrL21E1LrpV61qtoTHST/+fxN8dbZP0qz/zohf3jjBzeSQnMprQHaYr1naXRIGaBhXI9rqvNejC0ofFtex9nMw433rfQKHpAU9T3CgFqOiHIXLNvArJiGkFFbuY97/R+3pmg4w+BJ+6QFaoiLSHEV+irsPVmZK2wdCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(2906002)(38350700002)(52116002)(41300700001)(66946007)(66476007)(66556008)(8676002)(4326008)(316002)(478600001)(36756003)(54906003)(6916009)(86362001)(38100700002)(5660300002)(6486002)(4744005)(26005)(6512007)(6506007)(2616005)(186003)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tRkVumP3VFQnqSmRq6dlcnCk7TwkO1Kg8i1QuQxglRwKW5JTWH/0scoRCBk/?=
 =?us-ascii?Q?PWwJlAWavvo6kgRHDGmu1/8k5HPFDfEuW47AvXhWZJdbF4V8WkMMocpFSZkj?=
 =?us-ascii?Q?cHksCSggBeqGo/qvW7kn3JdFFSlekZB87rHszxKYx18rswUptTyvQw9OL4EJ?=
 =?us-ascii?Q?e0RkrGPhd0jjTEAXYltJ41iVLPPSAidzr15X6lHea1tMKMuI9Cd7B6L+IM2I?=
 =?us-ascii?Q?iIfo2WPHZlsKYMPk/LLuA4JND/ocPtGtsus6MLwY0K6WBudCjBkPqEHyOuxZ?=
 =?us-ascii?Q?DKKs2gnzIrzonVRzv2RlHhOA5ZJIFVeu8ft8jksnKwfTBmk1hvbZ7Obj3R90?=
 =?us-ascii?Q?KxCxFD8nk/HHfeCbFZFhQ6tiaTwgGUu6tiwLf7q9xjXLLnGk4XRXrTbJ7ym0?=
 =?us-ascii?Q?Ux2eJyXurjeaWIqEHDQ1YCwfLK9QLE/gySQxoNcTQ+7eyTM4SvQ9F04pm9O1?=
 =?us-ascii?Q?xVjCeaIM2xzixzGdctg1aTJ/U5CCYM1o6yCnZRx9zTeZoadYZKEhqGUnxFrb?=
 =?us-ascii?Q?TZNn0sHBAQaWRVfjcREM9rIfgY2jJT2Jo3WHfsr8jrrFjK7kbBQ2PMJUt9Hm?=
 =?us-ascii?Q?/8jj7d6Of7k39mRT7altw/7pwHdK6z8O+ZDHIcSQgjLuXJKugnb6cjfabOFy?=
 =?us-ascii?Q?2/xV48b07f/hf6G58iOfKQBTwhYMtnubrTxCpo+7VsNUFRFA4ZxEIinp20mR?=
 =?us-ascii?Q?/k8xnI/e+8wpuHKG1kJanVvhL/DiftQlXkVvGto0yrZcxfOqQcpnDj/C+XxB?=
 =?us-ascii?Q?yDVAvgrr9UQ/yYGdpLjOi8y1iSR5xx7KxqMfpUdf0s5DTuRUecel2sBbykRW?=
 =?us-ascii?Q?bAffbS8+vBUr3yt4wkMq7bb9HoC0zmNpFRU+SZjQZvk5IAEeskQQahpDAwdS?=
 =?us-ascii?Q?wOPtG/I/E5gBYjglJkgI7JOk+um/adieOBMtKmmu8Ri/ihdg3156hA50p7eB?=
 =?us-ascii?Q?rQpRi1rpHlTpjYinTdffVo4hxyrQBX86smrgyaaokNqPCEt0bG8ZlN1nUPPI?=
 =?us-ascii?Q?Et0ZeO3kONfo2TGxR859nE6iSJrqFU2R6CCA1I1/b2t4M+Npg+/4F6z7hH8i?=
 =?us-ascii?Q?NnjFL92lRPEXbtHV2CE/dxzSkrrRtrqmseHwC38nlGx1x2Mx0p0S6ksvrUyw?=
 =?us-ascii?Q?MY1+J2Cgq5Fg7jPPnMY407WYIKCera6szsChDvQi+BUcym6mODv1G3dwWA1U?=
 =?us-ascii?Q?njdZIrpeI5UyPxPotg21KgccFmhRP6kts3ApLdgXZRAG1qd6D5FH+fFtnd0K?=
 =?us-ascii?Q?yBiJ6HlU+q9yofMRdkMaxg6iATYMQh+h1GOuTkZUPWoCyBYp/tYPR6CodsoW?=
 =?us-ascii?Q?B9LegpnMi/0oitvga4L+UGkXfvz2OlWQYBJhADrmsrs8ePdW1LVkJDdLTse2?=
 =?us-ascii?Q?7RgDD1mAZsooWoUlhJ6TX38bczWdprYrBDZr0xGagZNQ6gSzZcUAHx0PZmEE?=
 =?us-ascii?Q?/TYSStnK/A1qguOL9r35ofFt8A9Ac4JYq5UgFJ7Ph8BCz+Ah9CRifSJGPLc/?=
 =?us-ascii?Q?0SIi5DYnzCvOraCCMlppdwZ4rwjaXnlFW1KDrbmJPmDsNAJHmF/wVA6gIPc9?=
 =?us-ascii?Q?9y0COLxTQqs/Q0fmQPEvwaUXwqgBpkBCkMFfZ+HS2MsaKpUxKH3RnMOQAhFJ?=
 =?us-ascii?Q?bXSdEQ9R1fZAhmd88iKFRHs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f52b2a0-6468-4475-7c89-08db23560005
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 00:00:47.8826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 YYNz8XobBZglyX88ymmSGoFsFFnEjjcnFg3AWyc+vqadrYuIQr/j6FVoDbcpgrmZxal8ZJrh0laP6hx8Y24/vbJWECtZgg5xMqsRZyokue5N09Jwxk49ErgaHa8PvNXQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5503
Message-ID-Hash: FYIWW7F3YSKRXTJVZJWNOGOVVKWCT54O
X-Message-ID-Hash: FYIWW7F3YSKRXTJVZJWNOGOVVKWCT54O
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYIWW7F3YSKRXTJVZJWNOGOVVKWCT54O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > This is resend of posted patch.
> > This patch-set fixes the issues which is reported by cppcheck.
> 
> Your subject line says these are ASoC patches but they're
> actually ALSA patches - perhaps this cased Takashi to miss them?

Oops, indeed.
Sorry about that. I will post it as ALSA patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
