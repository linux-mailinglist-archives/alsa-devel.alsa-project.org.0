Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B168E537
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 02:04:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F64F3E7;
	Wed,  8 Feb 2023 02:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F64F3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675818280;
	bh=+w7R3Y+eozLCfTNJqAScDfE5ME9QVI9Q4m1yX+5YQcg=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bpZUhfGdFFjkelRN8KjdIhS+LSb21fRUKge0zk9anv0Js0jF/fAVp/NNscItsfoiR
	 5cbQ6vAuAb8WvHRamD/squ1c46hdUAiVmjK3P4j0GaUjSI55AO+BDIZ0fWiBPYPLR9
	 iVo8+hXRVkeqBNnohUh8Y5Xm5aORP7MeLbz11Dz4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B5EEF800AF;
	Wed,  8 Feb 2023 02:03:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 393DFF8012B; Wed,  8 Feb 2023 02:03:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8680F800AF
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 02:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8680F800AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iCEyrrrS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaIIvrHW0KWqf74JSgkkVQ8V99L2HRBLogck5gXjtAhEK/ZbHgV/uc8B/fi7373K1VQySYD2pawjbclBmfuo94HXUz8K+XNIIhrwaEyF7UfAASrNarjsD03R+7rE4osYocoglh8iMvqgLrD/cW6dDz7DM2M96Iws2ny42FCqyUvCf8qwP2naO0KnfcADcP6HJe/KZhgyZj84BrCaLAUXLWbPWECwUFBTv9wKOWYw29YNcp/XSWU73lXqzWW8Q2vrxJFkclkODXNwAxqXhtuq3f820s4JpUme1fj7MCxWlmObmsQz0ABbjBajIiEWXum97ULamKheF40T1koTM+vMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cjk4szjfe9yfjpz0zCIcH6lhBIifNe7pN15R2OQQnS0=;
 b=mbFbNvK7bQCiUvyfDc9tMN1RXenOtGWLhtEKKet1MguCxr1DpWGpBpBgBZJKMC0XkfLHzI2CJQXCOrBdi66gAaQ7F7I/BrsdB0m8UIdhNiOEBYvV1E82dlR8G/nSYn+a3nZieFenXCcuTJl5J2ayJYMwHdIvmDBa26qfmwoalaIZv9GgHA6G7FB59yC7q6i/XN1cblmsIsKMu+wOhsVJIaUw8vhilhNC2fRX/LWvtl/UTA0dtbOEUefiU4shtd+57lhqbteY8uhQKPEhHkqXPNz6VgtQJaV6QuYDgPlAM7CFUet40lLqRbdIrb8bhsJ3tOUfep8BccaIMzAZofRzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cjk4szjfe9yfjpz0zCIcH6lhBIifNe7pN15R2OQQnS0=;
 b=iCEyrrrS6lfeizpPBQ+RCbZLLAuoaKAphd9eEaCsp1U+YV9O0EsS/lOB+mlqF/jx7ZK1IcUm7JoH5yieCkEqiot3Loyly2pbDu6vAx0+nswLnp8jGFNVoFBM43M3BJvCREuz7pHVOxcrWrEDi08252OuJLMGJvjvKlN8X11Yjz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8474.jpnprd01.prod.outlook.com (2603:1096:604:195::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 01:03:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6064.035; Wed, 8 Feb 2023
 01:03:24 +0000
Message-ID: <87sffht1d0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFC 0/2] ASoC: dt-bindings: renesas,rsnd.yaml: adjust to
 R-Car Gen4
In-Reply-To: 
 <CAMuHMdXYwW8bk+a+7Fb7DA7kT0DdQyJSGaSnFzdgfWZxpmPHAA@mail.gmail.com>
References: <87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdXYwW8bk+a+7Fb7DA7kT0DdQyJSGaSnFzdgfWZxpmPHAA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Feb 2023 01:03:24 +0000
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b8ecab-b0fb-44ef-1245-08db097047c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YMn/diM27E6fUYLJ1rI4j0nUELltaolCmp6znVGEbviKFum0tPQM/lJIvA4OQyGuhsH3fQbbSB+eFXb3dHJ3/o9bAMk57AemznOsGNULhJzCvEuvaxAPuschUeOK3leSothFL/f6tWYMXgo4RGV9n7XjEKNh1ek8DPH7WdXbVzkkyFnKgkRLn5BzIkcrQLMIzKLofCU64TqOW+i55neqjlHGw617RcouKRz5xgd+CwIYlCVW9NhUivEQdxfoWN4fLyC60cerQ6QZF7BCQTkkoyCVOB7oKYl78+cjTVQUAf8Ra9REB5rxqzhtK3W7FG5OxsgKiO1nUQdIYqPmUnB4VWzMwWQwTlZEHY8gWtaf5jxjKt60SOsmdi54PvuaiFNw5f/91SaaupvOKikCZcDjcYzno0FmS+4Zg0pwvnRIewncz4QbpWW5yElLUwznP2bbyaN5sxwDWeqVsClbDqPm3JwU8hB9q3fnqNKwlV/1UdbB3USztK7f2zXdCm8a0ApXWvnEnuAh6M1cHFFVVF0e8XyVYtTVr+quBJFFhvdjaSO2PFmSnBueeLYCjCvF1f6tAKBiXENJMaD0dTE9OXhwjFt+sg3SjFJMRS9a/inMl4XDJxJ0xUYwXBQzv2ZFVkEfTysV+DuRYqShBvRjlaEP60dAnHMcNfk4uQ65E5dTDzRVk5iLBngjUXyoCZ+BuDxjWVoWtGCBheOu0LXQfhZonfK0KnGs6vZvKw4puK5z9gs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(451199018)(4744005)(41300700001)(2906002)(4326008)(6916009)(316002)(8676002)(54906003)(66476007)(66556008)(66946007)(52116002)(6486002)(5660300002)(2616005)(36756003)(86362001)(478600001)(186003)(26005)(6506007)(6512007)(8936002)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kFT/zN0L5NrLDdsWEHx2ZGVj/6nXxTIjQUwy8fcNbt45CpHkuUxSozNnQCLG?=
 =?us-ascii?Q?6KJRSU3dRikHVOZepMhgtol9Y1cIl8+DylMbSGJ9QRg3P47BcRZ843RF2thZ?=
 =?us-ascii?Q?p7WKXLdq26lhf3rvx6l4DR1JaiiJ80VGcYfhM0IxuWeZOzkJcNQwO1JxpnmN?=
 =?us-ascii?Q?lyXUe8vLpn+rMKUnpGX3bJWESlXGXW/PLxPHXHCXh+AiAOOI//fn7hUzBibN?=
 =?us-ascii?Q?kC2V7yPLyfasG+BjwFhpxrGwn7W0f1tk52V2jtRgMpP/JJAW79fR1O4+KvbR?=
 =?us-ascii?Q?fcMiAoFOmWuTM2VM8Ya8Lz4nsbpPp9T3EBk5SixrVZvsUw5T31dpgPE9Z15k?=
 =?us-ascii?Q?u2tYRXbr3NTwslk2XVqzJ4OziLpbjc5xjnhxwegif0+qcvgFk/kli0Jh4Pes?=
 =?us-ascii?Q?THzt6/oXv/zODFWRbGtlhTeR8+947MyAz5GkZ4037Tt3wF1xMGxTdCjSEowC?=
 =?us-ascii?Q?LUY7qap1FnJDDLAWxSZGnvu0ZLSU6YyAoFJbeWjwDHAY2o5ZUU1p+1iWsKb8?=
 =?us-ascii?Q?RGu7Fywbz+dAyFTdDGTG3ibQpMgpy+du/4Frr5c4XY6KBbmhusmK2Dtc+a4E?=
 =?us-ascii?Q?Fu2aJjgxvRFfOxw1RqVWLQzLbkokRb2E1xFaHSuFkYEwJx4pZKt3IpU0woKJ?=
 =?us-ascii?Q?y6/U2rzs7bzwQHwir2xIR7IRPxdXY/oZULwRCo2mWuFtiRVvGsK73FGqOTmi?=
 =?us-ascii?Q?AhUOFo8UEeCjyZqbCxHelWGhf9ATRs3zaqtcpYJtZH5Rm7mtjKDnUz3wS6YO?=
 =?us-ascii?Q?Voo+TMY0wl1RY+Jmw3eu/oakclAMmOCb7SwMuiovWtTKdRs9NHqfW/ph7iBM?=
 =?us-ascii?Q?DfOjYbU/fW+CnsMWeou0g2Fe+M4m69X2B5nUZs2qva7WPLqKKQ+h1w5wD8xr?=
 =?us-ascii?Q?l3jjfWx7yiZZMQqu4WhMT6pgMNID5T4+wsZjJ6Z0Na0uFUIVJlPxOeqy+C2m?=
 =?us-ascii?Q?rPNt72S+i1XaH0eEv14g1UuPXKgncvrqploWNSQJfCQgEdtD2lKztgAuR9Sn?=
 =?us-ascii?Q?yp9YiZEd41T/dBAk80nzDNHkrB6yi0oVNGuBOISCyAgTXuMg0gEId65Ul4HL?=
 =?us-ascii?Q?7FNLbM5NBtXxh0kbCcWf7PPNc/OJHc/h67KQE3rOErC8vhfJRHN3UtIl0s0A?=
 =?us-ascii?Q?iCuh/LlGEKTRveGNCpaGdQDox+dns2cXDombi6XPyNzYuE5wmUBjZDzURvDy?=
 =?us-ascii?Q?HbkJ8v78aof0+8VmmSb1MH3td8U5i9jxthcAjqHPAS8RdN4DkBxQFLlqacqA?=
 =?us-ascii?Q?SKh4MXKuWTDaKy+y23BXfp/Hj7NLeYJbUaj/qf9G662drnfrT2vTXKVovjvk?=
 =?us-ascii?Q?97QljC7l3tcdCF7bBBNFM7stkND/3P3YlIG+YS53rqFrTzxePeQxq2/bBioF?=
 =?us-ascii?Q?HQ55hqJrTiWPtCAsnnG0I/oa7XXJ123E6gPxNbiCPyEDVdGZ60qCd1F8jc7D?=
 =?us-ascii?Q?aEIyEB6CE/nyBtaLXlc3T2kT22f/CsFuWv9fUHs7zFKUk6l6puVmUPIToh3a?=
 =?us-ascii?Q?RgRiJQAatw3tijYnHuyDYfsb79JNOV6wiN4ZsMhWZMfzEDDmoSAkhjATYeNC?=
 =?us-ascii?Q?Q4MfKukwLYEPG3dTKxr7WstvBalbqM9vmI6EXuNddTwr8xAy3r8qeWgli08E?=
 =?us-ascii?Q?JjjyzlIygNkLc/cTV17GmD4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 43b8ecab-b0fb-44ef-1245-08db097047c1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 01:03:24.8973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FfFGcu3er50FFnB5IQwTQREwu+uDiyphNKJj52gYFdNxZvyX4qhUna+ehvZ9CqfxkvuWWB1lAQkIeXtT4mVBkukI+fq96HJtSmq2TCr1tY4ahu9wbi8JyASv++3prX1A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8474
Message-ID-Hash: QJ6FSRKS264UBFUZO4GPVG2U3F5AN22F
X-Message-ID-Hash: QJ6FSRKS264UBFUZO4GPVG2U3F5AN22F
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJ6FSRKS264UBFUZO4GPVG2U3F5AN22F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Geert

> > This patch-set adjust to R-Car Gen4 on renesas,rsnd.yaml.
> > It works and no error reported.
> > But by this patch, non-Gen4 leaks from "ssi-[0-9]" checking.
> > I'm not sure why it happens.
> 
> If the logic becomes too complex,

The logic itself is very simple IMO. The problem is that
all case hits to if-then for some reasons under certain conditions.
Under "patternProperties" or "xxx,yyy" style are the point ?
I'm not sure.

> you can also split the binding
> description in 4 files, one per R-Car generation.
> That would lead to lots of duplication, though.

It is nightmare for me...

Actually, to be very strict, dmas/dma-names are not mandatory,
because it supports PIO transfer mode.

I'm still trying to solve this issue by using many kind of schemas ways,
but all cases doesn't work for me...

Let's remove dmas/dma-names from required for now.
It is not a wrong schema.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
