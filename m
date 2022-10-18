Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A65F6036AD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 01:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C90A773;
	Wed, 19 Oct 2022 01:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C90A773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666135963;
	bh=7Ow1ImWRG4aus/fgY3pAtCIcSmujIT+VQMBsJy1iF+0=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OI2XbFdPjLJfBsI4shdhkyxrTiHOgWOUGyAG76q1Hfd8ca9ZHRTkWqvdDT405jtIo
	 pnO6kiVGXgLKMHTD/sEL425F55bQijpfAD+A9y9nUL2uO+tWEKaCnfkpSBV8xKTZew
	 eK6QfRBGkyMHYYRwdRkYbP00gu6gtOsButwMS8VM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B337F804BD;
	Wed, 19 Oct 2022 01:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F84CF8024C; Wed, 19 Oct 2022 01:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 208DAF800AB
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 01:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 208DAF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Od+2AkEX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bX/FpT6966A7HZ/CcQ2pGqU8baV38gVN1z0IfY3Vjwh6uYdiQWD7oEUZcQZngkZpRrdqkeP9saP8bZ4ISzMy87CID5k/e8+JIwJAZwXTMVmF761UghS6Ca+uxBtGPH1VafHy+xnNUE813wD44zBk/ldzSWQZGSUaDkdz7/OOfKoF2glzTgSTnR+vsQP2GHdLbLNkxye47bTCB96ik7kc7psddQ764TCbY22fRYYCHnz+4MLDOvx0CF5twnKPxpfuaa5tq7trzf0LFfbubors9VPK0594oLVZDWwtb88uMaR7mm46KYbVVwLjOnEGZbAhrRckvtYQ3Q33YjnXGi/qAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTYzw/rnLPb1I0dAvEdT9rSn3HuJ7cMe58Fhz2nfDnI=;
 b=PblhscDxWDG6HvP7laFDxsxbigZalrDnFSDkezKv/ABo9tCCQPbTk8coOuPUeRBUE3dl/32om8Zl+NXoKhFXhJaX6AdxRv5aAbSr7dYdq6dI1PAXZIuA7tYm1kVSG+K/6PkBNN3XEslZj2YFhin4oe0HjI75q2Skv8ARaF/JPaBCg/eily5V4um/QzsEdGTTSjH0qNO/4WgxWrZcKF3n5VZEriu3BRFz9co47xthModHyAnf4ZURVNfjHof3mDppHItbyxx9EuCq9mePakp3K8VDAU8B7UbMwbMiquuCQ0qyOPVk8/1PRR7bK64OC1H159ycOeFn/KIJmVd6lqAxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTYzw/rnLPb1I0dAvEdT9rSn3HuJ7cMe58Fhz2nfDnI=;
 b=Od+2AkEXsGTO48wl7nMteRIDWstGUIq3cZp47tVHTdP32bIn7K5lOpzaxtl9OY/Ea6b2x+e19/0uDuMOfdGKM9bF8HRjVIcY3fjAnG8IsknTw7xFG16/b6ghxUdEQy6N3PJAdLdxPgc/Y1O+2JdNB7cNDX81SL8jjmX9mHwROPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8193.jpnprd01.prod.outlook.com (2603:1096:604:173::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Tue, 18 Oct
 2022 23:31:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:31:32 +0000
Message-ID: <87h700u2sr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v1] ASoC: simple-card: Fix up checks for HW param fixups
In-Reply-To: <20221018230409.610538-1-aidanmacdonald.0x0@gmail.com>
References: <20221018230409.610538-1-aidanmacdonald.0x0@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Oct 2022 23:31:32 +0000
X-ClientProxiedBy: TYCPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d5c6f8-31fb-496c-21ca-08dab160e40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ud9ueqJFGeo1oiqTxKbs5kMiZXjqCDKqbYvF8gyThCsyY0DpE0iWofIyQimZsBQkf3gmt7CtGSfFREFEB6MPtsYzuioXGgWknpzYMJaJx+gn4JgNnqWFKTtKaIVlksYCD53uO9Vtbleh/obp7OwAntHFUNaXStU61xs+T3WpJIY75Koe/k0/3WlX0LHdjyjtuLDPZ+o6y5fwgnqmLqJlBrvDhvdVdrCRlgCsDBA20RJOH+gohbBeRjCZGGCflwILrESwC2qq9/daz1h1IWh/bLnNyorK5ykIf2aF5UIKeeS7l3aNqSt1mFJugnQiYiOeCmE0pErKew+43pTXuHDdI65XjeJ9AAMSVSq8J+P1gj4QkqZVdZzWAAHD+dovp94qhj8eHKg0Fo0vD+46C6WkvhQzTHEkbr5Sl533Etz+ehnfXXX+kZdVe7g0jYCeMh3amQ5QnBLHUwndhtZi0bmN9yb0oeqs20otPR/UVR8nLvi4iMWDLokfxQuWa6HlHkJqp1gjFG+uULho/+XrZnpUAXLLvDs8YXWrIkYu+94gYCYA4mF78rJAR0TvAd7hTB7y6EDHzXJx4n94JFV00SSySAYvkhgejFsTxy+viXX0WHk62UalGOgZ6s/+iaSf0HZ5igtK/8f2KWVLeu3Mmj4w8uTAN+QTHiCedr8E8kg9lLm6sCziphiN7gYcZoXkGRQXfxDbkh/846U1LTXffKzGEuf3PIr4dca1jbog4cvV/OTvQ0GSAeDZdBKxpwreFdAR9l8QWnO0XgEbKgNc6bt63qZ5btGU+vi5T30pTYGgkvY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(6916009)(38350700002)(2906002)(186003)(316002)(38100700002)(66899015)(2616005)(6486002)(36756003)(478600001)(5660300002)(6506007)(41300700001)(86362001)(8936002)(6512007)(26005)(52116002)(8676002)(66476007)(4326008)(66556008)(66946007)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HHnUq/Ff8g9GNB4aOJTAaLc5od4Mfa/vr0tOB2EWgrgdIrNuLxj/B+HePzuG?=
 =?us-ascii?Q?n07i6PN1M1Ova/yoriw8EAXkE3LBgl2cdfWGmciThtl4RzweuixNoCTicqmC?=
 =?us-ascii?Q?caQM0DNf/j9KidzPjt7bEgi/WMNA81mVwQdwMO0y+jv5XX+dc7cb3vkyO9vw?=
 =?us-ascii?Q?xdlP1ygOIiww63m5JrWz+rRjMvklr4FAFV22jSnsGqqwm8HwvLAKgwTeCNnL?=
 =?us-ascii?Q?CuRDR4WDak4Jj0467VmiCLFOV1962gpvoqd0H9gySopv7VgVFjsyzkQnKH95?=
 =?us-ascii?Q?0bFgOZtt9KycAcFeFWnIbwvZUkZZoFdcJqXNl/Eimxr+ZH+80nfcBD2sJf3z?=
 =?us-ascii?Q?q6LbzPUlnr47KZWvi/z8aTYreLHmUPk6V77U5DKUglfXsX5eRiYO/c3LqW+Q?=
 =?us-ascii?Q?iOhwEfBv3l6Lws7rz1+yvMUX7+dz9qlrIq1Inxa/CrfG4CflHTlFRrXHQY2X?=
 =?us-ascii?Q?Qx/Z9fP1ivlOVqwkudpM/Zg5yB/Ac+GjwLqRjG0haZnNoW9QS9ltpX2t7Lq/?=
 =?us-ascii?Q?4eWfuXnCL2OhSc5O1LTJcYvvkeaJ1vfgdI5rTSeY3IDVg8aJ5wrBeiyNs7Sy?=
 =?us-ascii?Q?UA1a5lOyZsJb6EZLEE/ix3Xx50bExtezOxsyRg6u9gX40e3hNryP/S5YhymT?=
 =?us-ascii?Q?EDwGOlHoGuro1X3Z9bVwEv3YRfm303+RdZ7cVGW1O3nkbiktBSwBMJgJwXhA?=
 =?us-ascii?Q?QISisRTjH5mijUy3BLGF+vAIaPsJJeQrmI8n2OIynhw82Y9T83n49ofDhZuW?=
 =?us-ascii?Q?wl0eUgnfjTTXYdozQxYwOjSqxR+01Oq/CKSaDmKhcY11sCgGciNyG+jzIPcL?=
 =?us-ascii?Q?VZ00Ng2p78s3X1STgXIxs9kyFcn7TgCQgywf3f8dvMJo095FgiVqUwwNezUm?=
 =?us-ascii?Q?sAt0e0aPMOQEaUqpw8MqRG2+TVuVVHKkr8M4dwCEGeY1+3wdejk+C165DCMB?=
 =?us-ascii?Q?3R9nd8PdLlxWUSU4L7cz7ynq9Bs8pmcD+NbNtn95RVg+6za5poKyzNU84m+3?=
 =?us-ascii?Q?VOGKX2v8nbMn48x1ebSMn9u7BLICzs2zRxuoODnSUekGsHXeZN74SuWKE7hk?=
 =?us-ascii?Q?vMTncqXuAlYeRL+psnlWISuBsY7oDw+jCTKoc9H0MzOAxawAZSCPgQA+GqAN?=
 =?us-ascii?Q?BVDCRdK6OQXGKewIO6blclqzLqVSbxJDYgIDbkNKqIyDtXuEUd6Q9GCRnzns?=
 =?us-ascii?Q?S0h6e0Q7egfpgoAIrV1mt0wuf4YXTmxkPgnh6jCB82JC+H1cFHnrGqZSUZ70?=
 =?us-ascii?Q?7/SpzEPbF7BHEeulqAJRrx0PFphEEkFqIBHe9wZT5aVEMb43cKh/4GYVmKYq?=
 =?us-ascii?Q?x5SbstL5Z/vWuWY7U5HW9PRuiwc0wLcdvGuQcW0CZbaPuWafvvWtcK6Otpr0?=
 =?us-ascii?Q?ZIJRJA2SUiozOQu3UOcldgpynpwIwttS5Qg9fQ3KHJyeZZXCRGM49Q6soTv7?=
 =?us-ascii?Q?R/TnO4DqelKf1xdH0kXHsqxgPN5hEuLQTCV8bPONiqOsVz/FT7Cx1ExWp4Jr?=
 =?us-ascii?Q?2aQ3gE+SW6uarXCTyNpMdbWXIQx+RX6WZmMOS0Uy4NW3l10UqtshI8x8o3Wv?=
 =?us-ascii?Q?UUItUDX/HGHhbBl0MXAGfYl/KVxI7Hd7muebDF1zaaNlbMUAYA6i97Rb3IsP?=
 =?us-ascii?Q?43657EvMNRabZXBXpBTH0IU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d5c6f8-31fb-496c-21ca-08dab160e40f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:31:32.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjZeMorZCgaJys/XY1A8YXtM8GmWxZUyP+r1R4HzYxBv9HTGnoYpA+C3nQ80LBL1FM8DKOFv4TMbz8BkFjN6Ee7I7YkQaFboyNgHtYcDY1cg1GggrU22OTQLJOtW9IlW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8193
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 spujar@nvidia.com, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org
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

> The "convert-xxx" properties only have an effect for DPCM DAI links.
> A DAI link is only created as DPCM if the device tree requires it;
> part of this involves checking for the use of "convert-xxx" properties.
> 
> When the convert-sample-format property was added, the checks got out
> of sync. A DAI link that specified only convert-sample-format but did
> not pass any of the other DPCM checks would not go into DPCM mode and
> the convert-sample-format property would be silently ignored.
> 
> Fix this by adding a function to do the "convert-xxx" property checks,
> instead of open-coding it in simple-card and audio-graph-card. And add
> "convert-sample-format" to the check function so that DAI links using
> it will be initialized correctly.
> 
> Fixes: 047a05366f4b ("ASoC: simple-card-utils: Fixup DAI sample format")
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
(snip)
> +bool asoc_simple_convert_is_required(const struct asoc_simple_data *data);

This is not a big deal, but "is_conert_required" is better for me :)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
