Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30B60975F
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 01:55:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E3FF8EEA;
	Mon, 24 Oct 2022 01:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E3FF8EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666569322;
	bh=Op0uExmD06YMI6KhqsU/A+Hecb18GzdiS0QJw3s7Zqs=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PF58Y9mtnce7DTtdQbUogGqwD/yOKzhhmQ1o478HG98cDb13AlVIfgwyG8t8CQkya
	 S9rWm/cj9LWywKSHoyxMR7RokJqE+zPnV5toqODGR3ibT8KCLxLHu0OzHhI28htdxK
	 dy2UyUF3bKE1GF05DUYTdVJTYtSxFGbh0+lT7WdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAF1BF8012A;
	Mon, 24 Oct 2022 01:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C698DF8012A; Mon, 24 Oct 2022 01:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13E9F8012A
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 01:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13E9F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Y0Dk+vG3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi0ysKrNhzUDLy26kB35TuFLbfSmE1+RbfYiXuJuZn3VFAA/AGDoFobHSHLZhkukafbjKLIAKRMYMnYBiypk7B7wzWAuwK9kC5j8IfsrqZ+Zrggtu+y89xrTg+gBR/Y5kMzy4wF6VFHCsJfnoZhuS8Gy2C9YBlWfG7zxo+U5GTuTf2jo7ME5q29V+rnCahXvph7I76dHCWwizJy7VwiKnrRtolEKS7U3+FI6oc/NRnRJUASzJ5Ry9T/uWJeecJ+1BBP/6Ks+6R+Y64ysoz8+Ek87F1PhZnyzBx8dUCqjDOxTvxY/xMnRLryD2lx8L72yWrNXwcnaq6Bhwzrk6mc6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEq4OdJK1ddoKTdgHf7BODWIeZU9bxt6gJRXYgJpjGA=;
 b=cLtATLjJZypdOw+FBkgoP2w+FP5tW/y8ee6+b9NiOCuq3oxJxDaFwNiKw8E37BZhSlatFE/99dgwGsU3BDfH2U9VpSzLfXesMIMMBoowbFtv6iakigB6zqv1gnGMBUU3hE6e+LVGHDFIcMDSp8ce1D8+aR8l0PlPjeUQ17li/CI+eiwZ9n4mMqqKFfm9CfJ/YRLinNwgquAgGtHsLhbTMl9InXNvm9N52eeTxD/J5L0cFSgyUSIuEB0RQTi+GIcA6I6KVRYQK53RSE7VCt++uX+I8IYK/n14pT+Eh5LH6ZIT0kFrP2GELmRT5lVM5x/RcQuj5Y6jmbxNTt+28ypQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEq4OdJK1ddoKTdgHf7BODWIeZU9bxt6gJRXYgJpjGA=;
 b=Y0Dk+vG38ptOWIeYTBs9tTGscp6DQwWh6prjp1sv8obdFfMhkPcgqkk3Gbi9sr8zWVIDNu04NvhzRxu4tkrUOulZiUFI5YWCY5MTfEhKXRsLcjdyQzhBGl66XdoGbKXYDu7wllGidhn2BGYA4fmEc+qk0IorVRO1VsY5Nna5RDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10521.jpnprd01.prod.outlook.com (2603:1096:400:29e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Sun, 23 Oct
 2022 23:54:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5746.023; Sun, 23 Oct 2022
 23:54:15 +0000
Message-ID: <87fsfem6zd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system clock
 IDs
In-Reply-To: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 23 Oct 2022 23:54:14 +0000
X-ClientProxiedBy: TYAPR01CA0115.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10521:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e01735e-eac2-4f6c-5bbb-08dab551e3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ByzJoxNWC44EVyv51s6ZrNh4/cplTraesoAU/I8AewSRTzA+AVDvnpT0so+/Q0tY2rsUQgzxPrKkCfKTyY4jTMCOcb6NxN5WhybLpBb9NKySqX6uosWTsnOz+sjs7/yBLx9tuXMnvykVs7K+hwszX+OGjeJ9sqibbl2T0a4cdezI4iil4FVbK+dFLn49MoLmHFFTVMkZkbyLUkf8EObCRoakcSoLvC9O4Azd7b3Ql2mGVwlzI0PAUxL9CGx2zjL2EV2usgqmdoJmGrMiEyo3C4sxFr1tbdTuDH8Gu5+GQ61EVlN0KPmTSK2uePNcA3zciVKhRESSSPumzChSzYNtmoCLxbhjpXmzWVuQVLHfKV/BpVVpY0TBgSXJUwFRB1Qx0vlXcv3hgiw3bhXyWbZoi2iYWgRdfmoQNGRDQWfxhOA781WqnPsf3Wvv2PPQSVB+k6PCmKnoDr4g+0OL6Ncg5RSKC4rDe8JRy4Yx2/BfhaTs2sbfifrFAwGt9ruEc1YeUGH5IaxHf9rHPO4v56+OoK2b6E5nA9izd9M3AFau75R6QAlE8Qbahn9Y8DPLPD+lAS96hWVNvq/H8D+Wnhul+enjX9ENl2pIT6rFcLWcg7m3PCvlsP+vEaIIZNcW3VPuc7KkoWQO1/ztjNNZCVPBv2icsUrtTFVv7qi27VbJ2YGfdLtmWdtUjbfHq9tiU5ooLDQmrLE7aldcNau/G5goSQ7mnC47aPv2OmbFS0tzAbE2W0ZFEUygBreAYDpa+kbkEJLtfmKqjnROpwCo9ms2iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199015)(83380400001)(86362001)(478600001)(6486002)(8676002)(26005)(52116002)(6506007)(6512007)(41300700001)(7416002)(316002)(4326008)(6916009)(66476007)(66556008)(66946007)(5660300002)(8936002)(2616005)(38350700002)(38100700002)(2906002)(36756003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BHa1fr8a4O5wPVaLf616tpIxOeTPc0isoUyzccd3EL63tYVav+Bpq2JAzA0V?=
 =?us-ascii?Q?1DHzovPAGXJkeU2dBjL1F0bEEoqVgs9/9Q56RGKM4jtn4avKSi98IrEeMQQ5?=
 =?us-ascii?Q?uNAQ33V7J9/o+XaejyXnJoGRv5MXfMPz9hRaaUmdEo3d7mk53k0i5ZJrA1iG?=
 =?us-ascii?Q?5ba46N09Ad3NJDvs4udm8cimTS9bEaQd4M5fAwLokAGNlYJIzhV/gGCynHy+?=
 =?us-ascii?Q?mCkpLy6rJ7SbZnwqRYwpNoQP005XU/eb1NW9vPoT1xjuCpZeaiAxlt7IUUh2?=
 =?us-ascii?Q?nqFQEvfUNWqgGb4YguDzUi8vN3O9pUHeZaJ46ZIp6EqOv41GxiyiWsKOJvyQ?=
 =?us-ascii?Q?VZEtHK3qDVs0hT2zd/dpBtZtv+0PDCxc91vcCFxKR8HmmXIK5Vfcary71m8g?=
 =?us-ascii?Q?E+MuOcEfr2yc/eDjG2vzb3044/JuMtfJe8JeCmjBNVaj2x4J2sIx6I7GLavw?=
 =?us-ascii?Q?RjBz+c7+QYh6Y6bJAr95/O9hqGaLtnX5mmk5ossaL9r/RoLQflE+2fgjYI+5?=
 =?us-ascii?Q?sjwtt+R9M13Uwzw0bAOiHMronAY+YW/b2jXRUuxPV92MikQ/f7PsnbVFui7p?=
 =?us-ascii?Q?avrIbjxObxTM0NTWl00UUnqJL2qTxTUzH0vz6nG3Bzd1/kjtRIPGDeDXW8ol?=
 =?us-ascii?Q?Qh+AK2qaJ8Q9aRkUnOCK9FNmZB6Mn53GIvf3EbikrVJCVW0rtk0XSk1fXxJ7?=
 =?us-ascii?Q?9VUJkZqAZwvBHP3SVoj5hQ+F01QAiW1GvWtNRXK24dGnOzGZ0eoBQ9ImHzjw?=
 =?us-ascii?Q?Xu06FdyJeBPpWDaAsJZx8KULBYXp7paCvua/8uJ/9adOIdL/o75fZbZ9tgiF?=
 =?us-ascii?Q?e+H7pHMzm/++SMcrkRT6klaNIpvuHESqyvOBp0vSew9ilRI4akOhCQY0XR38?=
 =?us-ascii?Q?9wAIyuzfzHwjlixd6EjvaHZ01RB/1P1pUoxMgpvY18aGDlhNmDz84K2atmMS?=
 =?us-ascii?Q?avLImQgd2Svcp7EYlM1BB1ehjeOkguId1bR1Aq6swIi1kHcy1MLVJnCyn7vW?=
 =?us-ascii?Q?mCJeL2+GFlUSQUrPMSQFT3W69aq8wt8SSpW5Ak1kQeKx4uLu+CTBFJLEKKi2?=
 =?us-ascii?Q?Yf33AZtKmeoVjHEplG+BY6PtI7UvvYRrIf6qPj74WNZdDpsIz4qASopupvO+?=
 =?us-ascii?Q?F8adJ+7nNE32yfcjFC9pKCMtrlHoyYLdDNTtK5BZL+QI6Aqebz7QutzFjXcX?=
 =?us-ascii?Q?dQdS2qTXnShxuE01Q+510asqsziy6uVHladp/ug2hXPbIOeCTSWrXhUO9xCi?=
 =?us-ascii?Q?A70cCgnijBBjEOhptdKQ3MyTX/D3q4FsOlFn9s1RsGF/PxVkSOq0w3IAoYHj?=
 =?us-ascii?Q?V63GrH2teGho7Y5mmq84LVDUpRKLieUQc4/l97DWUF8jPCONwAXpKN1tyFDx?=
 =?us-ascii?Q?UBg+gJzIv2WynZTkvKavbzYJWWSEUy3m3a9RDQhmD4fnVhMqpftPDt1f6wzB?=
 =?us-ascii?Q?Qhux6dH165CoUUiIH5rIJN0eOPenbDPgeVG5CuWrNqtaYnjJINGOfrlk6zUL?=
 =?us-ascii?Q?oLk9hrxaHvYiYNR6ZC60GFeLA/HpRLjiiqfoKDVcDIm5SyESnkFIJvmBuBP9?=
 =?us-ascii?Q?znFYIMefkuY9WJwvCTNaCMqQaadO07YJBOw9kZh3h2m+fXVepab6oQQGV8yG?=
 =?us-ascii?Q?ztThJ/XV3LYuOnTBDip4Nqg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e01735e-eac2-4f6c-5bbb-08dab551e3ec
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 23:54:15.2085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAdBa97dwtc/XtdFB7kXuEr/uPn/BvAOyZpxJGbOKt8luy3dgctPwGXtVasp7Ikl/sjuFJND3K6IkTEqHl0SCGms1tJ/xUiAWmzP3lw5razh8u6J4R2guz6px1rQ0n+D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10521
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org
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


Hi Aidan

Thank you for your patch

> Some DAIs have multiple system clock sources, which can be chosen
> using the "clk_id" argument to snd_soc_dai_set_sysclk(). Currently
> this is hardcoded to 0 when using simple cards, but that choice is
> not always suitable.
> 
> Add the "system-clock-id" property to allow selecting a different
> clock ID on a per-DAI basis.
> 
> To simplify the logic on DPCM cards, add a dummy "asoc_simple_dai"
> instance and use that for the dummy components on DPCM links. This
> ensures that when we're iterating over DAIs in the PCM runtime there
> is always a matching "asoc_simple_dai" we can dereference.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---

I think adding "system-clock-id" and adding "dummy asoc_simple_dai" are
different topics. This patch should be separated into 2 patches.

And I couldn't understand the reason why we need to add dummy asoc_simple_dai.
In my understanding, we don't parse DT for dummy connection.
Which process are you talking about specifically here?

	This ensures that when we're iterating over DAIs in the PCM runtime there
	is always a matching "asoc_simple_dai" we can dereference.
- 
Thank you for your help !!

Best regards
---
Kuninori Morimoto
