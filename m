Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFBB6989AF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 02:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09412832;
	Thu, 16 Feb 2023 02:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09412832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676509829;
	bh=rVDnJySWq5qSG3jefU8cFFzaRjiZy9Kbrche2LpkUy0=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oVnxUeEZGvl1oxi8Fr4Q4J2FLD8GD8uwkgd7Q41S5DExUpVmccYdIgEnhlZsx3RiA
	 0CQOUEytRfME5js5grjg4PtVS/Uixvz7WRt7KlSCyYr3UegGY0+G0bShTRjA1yqyOq
	 0/x9O29RMbpWUg4h6E/82swIprBaj5omgm14schA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8744F800E4;
	Thu, 16 Feb 2023 02:09:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C2CBF801C0; Thu, 16 Feb 2023 02:09:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77F21F800E4
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 02:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F21F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V8ZM3Kd9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAH6HRP7tYgc7D8sqF0/inoTBXobb1h1bvxWoe2TjKew5EJig+6Z8uxrIJIeEenCrlsFO5ievFvKogsiHKZREFHpBkUbscHAbLNooUCUljP/6iP6raS5+E6frzPbK7BvSCpWjc2AvOYLVO+e79fL9aQ7bI4o6ru/RNQ5+jNw6ZnPUnmQv7RvReHPffRriiBqJVomjDCkezL8RHnBHwuk9pb5ZranBVPybVzfO7F2tWOVy/u8RNNJa2scXglIcDKigppJq3XkAmDSY8iXB46QHGpbp0+xEP0vtxLybEh/M7VXtkT5pfRlnBzb08wNXkE6eu6Ti7KPjZePUA36FFu/rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQ1r5WRGCvcN/3tIfRM6HXbeG1yLt0wk6yvovtewyGk=;
 b=Y7vV34PTlckFQfHn8Yy6jRVF2ARP4Su6T5Gux1bFzpRX7SrRHeza5RNz1H7m8MdQcJpdH2xI4fOV9bmTRF6HnA31Zlu1UcH8/3y/AybAY49PCfP6ZC48c7WpV8hW7+MHg9zB47Y8CymQQjig1Wb6/L7XwWuuS1B8cNGGmbfz/qxxSATgu/0Sp2PK1qsFh5SXpUNNk4fB7sywtV1fRmHKwkTAoNgqf8szb0iNs9UNkpgcJAb9VJxBqtGswTm0p+TI2Y+lK1nPWwZebs3cqKNDm9egGJG7OrAbVFF+0Sp3GlKLZtMHTkoAv52xWcwt0QkkM0saTqMEbp1yzeR0eHhPpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ1r5WRGCvcN/3tIfRM6HXbeG1yLt0wk6yvovtewyGk=;
 b=V8ZM3Kd9usVCqILJNH8vlpJJZ3zYy/cbkRoRiOW3Qh9RTg4DnqCGzNMKyHmWeWYcM0IHVnKRAyppASzA4iVoBckVhLwEROTOtLvaihzDIPWPQMNDQ+E4Hdn0aDxP42yHIKjgEwdhZElZ265lGWOkDpkzlmEtFIbGlLlwYZKtr7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB9541.jpnprd01.prod.outlook.com (2603:1096:400:19a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 01:09:15 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::c012:df4d:8ba9:3291%7]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 01:09:15 +0000
Message-ID: <873576ju10.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
In-Reply-To: <7b194041-4386-3b82-c65d-f0e3ad5cf015@linaro.org>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
	<87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
	<9aa09940-91cf-32ba-34f4-a57c9e9965bc@linaro.org>
	<Y+vKcGic3sC7+3I/@sirena.org.uk>
	<7b194041-4386-3b82-c65d-f0e3ad5cf015@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 16 Feb 2023 01:09:15 +0000
X-ClientProxiedBy: TYCPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::7) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbe6fdd-e30e-4d84-2e1e-08db0fba6c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V4sNLZEj6DJ8dg+350Sem70AV7ar0jnkkRl1VQscoByH+pk7zVn/yQxkhOGr7M+sEpqzuDNaipoL8LjqcI7/KkXca/Yw3xhfZ25y6x4Xz6FQ0WCom2V9F0QwsGFfGIG15aEex3a3xfIood7FV26oA0JXClYhfUXsogN3tuE86nWHC+RxlUKfu5IBYdx55LOCbPmA26GqfDwBLG8MvWSOfyVUwvcse36rrgCpBKH7MpcLNn3/TqUnO5XGWsZr9v5VWUE7CzY57H4/ixmiOB+aVIwZcrVT/UZjSzn3kafKNJ4QuM8W7i0xzmYmWYYuW1c0s68Hz8K4sm4zVt9mIgiuCH9pTQIq5ANAcA1U/ViejTa0ExOOlw1yJmbLLYAMB+6ostuw5k/7RqJtO0LpcmlONVXLIWs68XabrFuSTJniqTcyreyztQIjXslT0T45RgApSe7VNMIX46gtAU+NGUsphDzppBnEehICySG7/k+kYb1I21we0P+ZN5/87ZvvqENS8Cw/2HjM9Ek+q/RuQvIkuKzhTBUgYaU6i9CG2Dxbd95NyYZMUuyfqqQ0zWKzTZ8Zz+pSdNd2P7OSYxVG8qTS6wK+pQGVjCq449sw+U0lgfLDaNakATNV28BGXiPh3VPPy2mU83J9LZwCiFXJe84KydOpT/OtBH4VJYZK4wSiU2yPzXxzMhMi6H8UgMFauB4V12OmvJaxDreqO199YkjSRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199018)(5660300002)(36756003)(83380400001)(4744005)(478600001)(6486002)(186003)(2616005)(52116002)(26005)(6512007)(6506007)(4326008)(8676002)(41300700001)(66476007)(66556008)(66946007)(6916009)(8936002)(86362001)(54906003)(316002)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HF1BgUcJUFddydqs3MADjDlCHJL0g4G3SRRdKSEou+ivmOq0O3uCpYwSwEAu?=
 =?us-ascii?Q?klP3/uBLXLaPUw/agcp2k+BfsB70hpq/uaQD47n5btnqWEu0ZppDY0eN5QJU?=
 =?us-ascii?Q?7Q4Cyggtda04Wh0NEy7AcDuWDwTJIR8yAI0qn5Rzl+7fN48MHuoiCnxyoCRq?=
 =?us-ascii?Q?Ca/HtGI2ZPgC4HXukPY3/SQNxPETOBFcyPIoeCIgL5ARcEWLwbvsHDTZAWFA?=
 =?us-ascii?Q?9oLwFgeY+KDHdT6caZnFrjQegJprh99/O8ePwl6VFJiHuDb9/jo2lw6BRLna?=
 =?us-ascii?Q?ExiGZls8x8W+3rox+rIGepLbPA+4LK06iVbcYeCfAn0y88dkSuHdWYps/XSW?=
 =?us-ascii?Q?XUNltglOLjZnN58CKYCztpdl69lQDJaOazjRX+XS8O3hGmubPDDMIUVFIdGz?=
 =?us-ascii?Q?dud+bcyENLKPaCV1Q2pv+YPxQCRu3JAcgx8vZ04oGsj4LgH1YgQvrMG4rsRZ?=
 =?us-ascii?Q?aaHkf05ujV1oQj6r3NTPo7nKw3IkcEoqa1upJD8lgQgTDHUlOr9huu6BxNM9?=
 =?us-ascii?Q?COlrPWeaHh4TA4z9qZTiGVJRN6UpZ7Le56jvwBWzQ+vVHzv/LBuy0V1A9CDm?=
 =?us-ascii?Q?AVgSMEHSzRTVMrgKHJLQBGqKVVF+DIwDJWPWndMkui60f6X/1qAULBdGmTc+?=
 =?us-ascii?Q?2lDesRX9sVuwILMhcL5eNNlnQm5ktqV9PXUtNWbNJAzksnsqnsNqZC9XcQie?=
 =?us-ascii?Q?e1qE+dtqkKNU/38RC3fxcTzWCgWMSwBjLR5ZVxdiMjLABks3ts5HAKwoLFJj?=
 =?us-ascii?Q?wGRHuYtw9enHAPqk0WLvuecE4aOTd1F/1cgJ0KtVekWZwEgq2+g8Ntls8DQ/?=
 =?us-ascii?Q?pkDZM7rHyfsA23PMVpiNz7FIk5sVHolb3kQRDJ0I57Q93xLsqk+ldloqemTN?=
 =?us-ascii?Q?mhDk+vtksDzoAzwhGbCRFFp3FeN3RQcCF7B7G44fQhWYjPWq+yciUvdCWPqs?=
 =?us-ascii?Q?9gljC4q69J1FcMg7z+iLZSRvKGD6xHYY23MrF24yLZ5O/a1t93Op1ZU9orrZ?=
 =?us-ascii?Q?QakT7wQEoy5e/TF7vJlbeUlcM7o2+iSzvLm+cpvkXn1F2VUml63TqGrso9Du?=
 =?us-ascii?Q?lM4T5ZtWRz1gbxi1wap530or+JgqQs+qBYiuWDvI4tHeTDVYgpyAJzsMXtap?=
 =?us-ascii?Q?JVfxKMexqDf1nUytAjcipkSIWa0AKimSB6d6kgdtYRmjMuFzNXBHiCOZOSmV?=
 =?us-ascii?Q?jeXm+MbwZ5oNQpmws9DuQ/6EJmZHi6+2uZIDfenLCsmYtAswKkXAsihAWX/u?=
 =?us-ascii?Q?GR43vtuhpyFfeZ0wczRddj0NsYXKau76F2OE10jrukyPeFHAM3532rgwEZxV?=
 =?us-ascii?Q?p231jQgvylwgzV8S0IIJsQq15VOEAy7JViR8vsV6FeI7Yl+RwGEvLQ9jIFG2?=
 =?us-ascii?Q?m3erdHufRUW+Ajq3a0/yGVSoQ3QfuJ19SwcR3brMzZcIISFpGvuUGMo4lokA?=
 =?us-ascii?Q?FDiFzh/1RrC/RBVYfp358L+3WlqVYfxoT4G/j50jVoyowCd0Non3nkm2gTLW?=
 =?us-ascii?Q?kvgLMQwXnUPDKNKDzVnP71XG2AZ4TJL3919BtnJXur9kbT4ZE4a6cvBaSDfh?=
 =?us-ascii?Q?4EiOAAehcqglpvjdNvhKTLr8T/fOaQ3r/xxlc1z3l4N2gT7N3Vqx4Zg6/R5y?=
 =?us-ascii?Q?iP9xKGfp5wKsnCUMG0eh6z0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6bbe6fdd-e30e-4d84-2e1e-08db0fba6c34
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 01:09:15.7999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0xtgrQ7hGvfiwFvEBIzmcyIRV2bvbZy9Csj/nXmVeLcb0FLdwrWsjvdt/9if2ocGVIjYtydy45XQ/lNRQg/FYYFlFpq3t6pmMF1pZTDeqV22WiPcegVdWyMuE1gCxZmb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9541
Message-ID-Hash: DMWW4NUVE5NGWS7WIV4ZS6FM5FGAY3CZ
X-Message-ID-Hash: DMWW4NUVE5NGWS7WIV4ZS6FM5FGAY3CZ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMWW4NUVE5NGWS7WIV4ZS6FM5FGAY3CZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Krzysztof

> If you leave the top-level definition without any constraints and you
> forget to include all your compatibles in allOf:if:then, then you end up
> without constraints. Consider:
(snip)
> -----
> properties:
>   compatible:
>     enum:
>       - foo
>       - bar
> 
> clock-names:
>   description: anything
> 
> if:
>   prop:
>     compat:
>       enum:
>         - foo
> then:
>   prop:
>     clock-names:
>       - ahb
>       - sclk
> -----
> 
> What clocks are valid for bar?
> 
> For simple cases this might be obvious, for more complex this is easy to
> miss. So the recommended syntax is with constraints at the top.

I can understand we want to avoid the future miss.
But I did it on v2 patch and you NACKed it.
Thus people confused. That is the reason why above strange style was created.
And it is already using "else", your concern never happen ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
