Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED00645079
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 01:37:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ABF91759;
	Wed,  7 Dec 2022 01:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ABF91759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670373456;
	bh=+yTvUFeMno4V//VbCXBeFVMlP2Z8RuFiLSuWJkDsHw8=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z4uIVdSm31fYpxslu63Y9F0H6n67WmWUrg2qnN2+2ewIL92SySZPke/7ph7w5J6gL
	 Hzu9EHw/w19BGUTbEije/b1oWl2ENuQ0n3BJwwUn/GKjJZ0HCW9EEv7XHo3qyDAkbA
	 2WGKhFyjae/0t7lufPu+LRFSiy+6nhIsB+dSxJo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F4FF80121;
	Wed,  7 Dec 2022 01:36:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08324F80246; Wed,  7 Dec 2022 01:36:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20717.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::717])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 593E3F80121
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 01:36:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 593E3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="A2izD3gg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPUPzmd9dEl2dzz+DOtaAuXtAF5ZRJwz/Os9++RWG1vXP6XWfGH5J0r34djCgchjv0ZO0/J5a7PkWuqaluW+Jajvb/Og0SkkCmOo3FpzYlzj2E1VyXYlo5kVjgEXmTBqq38+P+iod3dezL78Q2/idTWvw4CE355w991qX26XEiKNIG08Zc8cZf9ovUrNxLTYbhSHNmtxqinnKg/qTURcsZArn92XqwMp9u6oAlq1DTTfokw7bpkFxcN9pJTi80FGzwl7aXDiR9tV2HYTQkI8rAKF8sXpSJ5a2SEWJneLF7GbYuXOUfefxgywgv6j/9zlOfk+tFYYpqNqSiCRtgUqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YcTwYyGITBi/GycJw1nNxu6VTaVZHLphDP6VSWCjxY=;
 b=eW2YxsKJqbjc0fEss5aQt53Fs+/+OOic5aFHzP6ueeUPxToCm9vstlVC+KIEgrg6AE290qPYIGWFyXvizIE1bqPhycdqHNylDBvxGXyQVfOTYe8r2ubvI9qDH+RWoQLgM+m4aRof4qB/0SbCLZpRcbb0WI+G8iUL6vyfy7NkD8VN1swp0Ro24Xht56UnV6UnanJJtO1uY9dGt2kqj9RdKYVmPmjCOPCgFyTQ2CK3z+boJp3sYt/UOyF9VszFJkckn+U3glix7jnjBDXoFzwNTvd2jlaHGpdjniJL8Jq+XU6dpY3oGwa6QDY79DDmZ5Nt/6ICxUI46SWbSP4naLlg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YcTwYyGITBi/GycJw1nNxu6VTaVZHLphDP6VSWCjxY=;
 b=A2izD3ggeY240t2dYBVhQp4G7uRRHv0XGAqE2cjMRvDnpmwJW6dAA8j3PmRUhmbiF2jzAot9SwSqXWA32r08cMBJleMHvMq2+ZVd9FKJ1HeWVhdhCcsmzA1PpUw5ZLRdEG2U0cEkcluCW5WGBcePR+G9VcA9GrD7Qq1fSbCYHko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7855.jpnprd01.prod.outlook.com (2603:1096:400:114::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 00:36:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 00:36:27 +0000
Message-ID: <871qpcm4mu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH/RFC 2/2] arm64: dts: renesas: ulcb-kf: Fix pcm3168a audio
 codec node
In-Reply-To: <3c0f5b935da4468fe04e2d85becafda0040e4d31.1669980383.git.geert+renesas@glider.be>
References: <cover.1669980383.git.geert+renesas@glider.be>
 <3c0f5b935da4468fe04e2d85becafda0040e4d31.1669980383.git.geert+renesas@glider.be>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Dec 2022 00:36:25 +0000
X-ClientProxiedBy: TYAPR03CA0016.apcprd03.prod.outlook.com
 (2603:1096:404:14::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f1a866-b0d3-443e-7c96-08dad7eb12a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLLCFPCBrvvrWUNvY+ls9Wd4Qu2U3r7PhJtLPkg4p/idzZpBeXuUv3KmXxkAtxoW3R7pvTA2j17mn9WxOnggvMqvSHburS/EQvy+vCESFHSM+0qkqdGFskqKP3NBJUu8OgTFzxvhRWs26f6w8/tPbYc4J3a7h5RcXQvkpcjf1lFH5G26Z5ze4hEzttSdE0RQWNAIFmET6c3RisawPUYGZ/9dW7GPVkLvwHPtaIiJVaUGBUL2dxfg2r7ZKpIVZDfCnrD3LSKlAf63jsM8YbzelinRDDtVGM50z63RwBkVuTwdm3uRyjTDpQ/L1mPlu5xuFUgGstXqUv8h4CUne5GAB61Wi+sXiLQcI3Miy4PYlPPPFYCGeuMTpXspy1J3mn/k37lI2YlnvxyzBqGQ34tQXPieDZxmrIx68GatvfObO8NAFOqGpXXYzplUzRkRgAWihyoGYt5kIsjCtCDlbn3OKpx/LEizDlVU7KDPb8m8W4Fghc6yz4BKh+BqnlB3kTxCbAnn67dbkzbOFHcY26XPSMKa0w8pIcZIafX6BaM7hGUoga1xcCeUDzKGgZV7IQriButxiFDWl/O8GyT65a4GwWqf99+6W83yMPHYdTmvejwLd0lnPAL6myiUX/bViQU45C9xweEHcim7HEciB2XWwTC3aSSuQjrOKQKDPy+AGQWH8VN/0qKHJT6HAxBx8wD5pee8SZmLg7OAcuPkJSxx5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199015)(8676002)(4326008)(6506007)(83380400001)(186003)(38350700002)(38100700002)(316002)(54906003)(5660300002)(6512007)(66476007)(66556008)(66946007)(52116002)(36756003)(8936002)(26005)(2906002)(41300700001)(2616005)(86362001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+DX6T5F+DVfcpSeyMZK1Dul2iXqElxprV5q7ma/bckRlRlC7r0r0dMrMeeP+?=
 =?us-ascii?Q?cSebMCMfMIIarXejyXrvfEcRqp7FlpttD57zLPe2/cMy5qVHI/sySgTZmAr0?=
 =?us-ascii?Q?uK2QhFVWgyUXxeqTseZvMOwH9xVzBJWmdNNNvlto/xK0jjqWbQYMA/rMmXuX?=
 =?us-ascii?Q?9G+E/ZJEs0OgbPCjH5AesfVToABhLOERuB2B1/s0teo0c3WM7C0Ybd2GA8h0?=
 =?us-ascii?Q?IF80CbH66Ydwm6XJTxNzjqvC7YMEg7jOTZz++bvD6O9WT+2Df5N7sXO4xqmq?=
 =?us-ascii?Q?sw8a0MPB8YzlJFCmaagWZQo7LrtdyGQLcyZXWS6eFxk5F037NA/+kVlJqcdd?=
 =?us-ascii?Q?hq3cfKHXa7NSQ168Cs4T/7x0JqvkQ1ClmXTQFooGBPPoOY0slh3FaC+e9aTv?=
 =?us-ascii?Q?7/wE+b8nRJjQB68Ip55e9jXxs7XEtMQ+urhAzFmou36DIdSs63y3C1TC14Es?=
 =?us-ascii?Q?HGD5uVF/r8nEs9uD8pwVSRqXJ3U8ms4h+3iUAxFg4CExxy0CK/B7OGs0omrn?=
 =?us-ascii?Q?YNJxxM/HqJs3p5SiIX4JZ4nVBThLCAf6CONgHaL455GnZMtkWi9x81SVj4UB?=
 =?us-ascii?Q?TxR8pBsCchclZUJhsWxNQ25TwS9RPhD/GSCjuvzBpk54I23y+Y+dB3NPgJiT?=
 =?us-ascii?Q?DYnKsVH0DUlpck5WGmzkZk08ZtfCrhxZmSc96z2yrvnE9sT+5Mzj1dkhH8TV?=
 =?us-ascii?Q?Hd5C6/L+SUSTGHlEWIY9IfvjoxTExux02UsIOocsf87/viSjGck7MUjehf8g?=
 =?us-ascii?Q?kh6gjgvFLctgCCYQAMf9wwg0WNpx5vYe2QB/L6Mh0/2XhtP7h+5vf/ogquu9?=
 =?us-ascii?Q?abTsjMX3JDhTxQDLOAPR30JU2RaAeGU4QrwKEuhCB2GiF7ktUCA5UaA60ixF?=
 =?us-ascii?Q?1F0LeS74N74rtlWE1/j+HCNuMCZcpS/tzB4wIddztOqR5a1US+TqeLz9jVP3?=
 =?us-ascii?Q?pHqRcJ9J32fTff3fnnHmGuI60OwjjJeYqFxrSnfZME9p7UnTzr7b9imA7alE?=
 =?us-ascii?Q?HVumJgtZf4vhKEsqrfQh/hubuUVBlLoNVP4H0owCA69YLHp7lgqwjpSKcCTq?=
 =?us-ascii?Q?U1/Me0CAFYzbiYNG1yGYuncFTs6bdkTO9MW5HrkktK3H1PurqtC1qUBDoFZ3?=
 =?us-ascii?Q?b+9UXyQQbepAdOkKA/EIs038E8lt6hDJXJAa4nEBkZkjPHXcakUOO7rWuWPi?=
 =?us-ascii?Q?2ox2w1WjTYJRT8lpjs4PPXQtbXgsuQ4PkiT+En+FxyG5MQcXIoL/b+I+P6mz?=
 =?us-ascii?Q?RjssFj3d2mTXlTr4/NMI7bMOQGO8uqLaeEsf709AV5N7zkUJ5HPPooD6iWEy?=
 =?us-ascii?Q?/mTZQw6k9P4K9CECnDMMb/p0NrX3VRCAe5ebrlhAVx65MyTqe8fFoiwJLwRi?=
 =?us-ascii?Q?FXi/xXsY7SlhIh2DkaqOSW0hSWASi4FZLD4BJl3bdxbTN/6A2cuQsY5rBu7k?=
 =?us-ascii?Q?A+o8Mz9NE2khiStcjyXFmFRo/gHi7vfDJXNs7xy08UapPctPVxkimFtwdcEv?=
 =?us-ascii?Q?EHhfsNMZCujMC3MONWSmIqxjdG/HIxtWeWNRLkZfmtYX083XCzsiQ+Ntn/u1?=
 =?us-ascii?Q?qHwRQZevb/zWhtc4hNb7WHQbAYAQg65PbpxMNCJcrtVj9fSl4JSkHcXzwha4?=
 =?us-ascii?Q?3tBO3/yNwxODVxM2HIarK5Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f1a866-b0d3-443e-7c96-08dad7eb12a9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 00:36:27.0633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmHZrDvVLrdB3Du3MuJjsWkqZrui1akyYDofZV4+K8aiiI068i5zM3PNv+4/ebQAjRM7fgIGBrjKl7Qfnrpp6wc87Jdgtevy/43wRZPWk9miwE51QoUDdqlKFXVQaP5n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7855
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Damien Horsley <Damien.Horsley@imgtec.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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


Hi Geert

Thank you for your patch

> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 408871c2859d144d..8e46acbe3a203759 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -216,19 +216,18 @@ pcm3168a: audio-codec@44 {
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> -					mclk-fs = <512>;
>  					port@0 {
>  						reg = <0>;
>  						pcm3168a_endpoint_p: endpoint {
> +							mclk-fs = <512>;
>  							remote-endpoint = <&rsnd_for_pcm3168a_play>;
> -							clocks = <&clksndsel>;
>  						};
>  					};
>  					port@1 {
>  						reg = <1>;
>  						pcm3168a_endpoint_c: endpoint {
> +							mclk-fs = <512>;
>  							remote-endpoint = <&rsnd_for_pcm3168a_capture>;
> -							clocks = <&clksndsel>;
>  						};
>  					};
>  				};

I'm not tested, but in my quick check,
we can use "mclk-fs" under "ports", and we need "clocks" under "endpoint".
So the issue is not dtsi side, but yaml side.

I will check and fix it, but it will be next week or later.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
