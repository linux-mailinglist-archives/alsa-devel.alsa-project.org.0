Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE86774E9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:28:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B6451721;
	Mon, 23 Jan 2023 06:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B6451721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451703;
	bh=8jGphJLRDDsj3rm2u3UmHEGmaOe+gCIMlEkJPuw9LT4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=t0ZZYmPR647edEslZlARSzl79F3vimWetHdWDrCuUXqv6zRbPI03II5qpCwrPJQvv
	 ktXldA0MP+No+IXkxf1Xj4BX32S1snDx941r9u3xx6plkz0U83uDp/5L5Fm0zwbrY9
	 M1t5qbNcGQvqD60G0Y+3H2qXYve45YeE0M11PxDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37A62F804F3;
	Mon, 23 Jan 2023 06:26:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9655AF80549; Mon, 23 Jan 2023 06:26:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 378FBF804A9
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:26:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 378FBF804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UmzqIFcz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQloL4ZQmt7eAv70c55tqPwfDWrjzX491zIXsxVkfUOLi+PEn7upIbSaRu6ZxFVaVnnwW7WzgLFBupfQ3oNz9QG/U4paxwgEif7n4k6gKjG6JSTMjmzhLZmQuqO0PEqB1/2opWbBe6IZxkGitk6qftT1REbF7aSSZBgYltFPjpb42+8aBPRlACiGS7r00Al+cjdK+lcQ9xRxON5aAilkpqSDm7ArDiS0/vc1Kl0Z+ALPuWu/Gel+U9oXJDUl8X1tqxQ7szHheb2zeYH/EMA2HoLq7jtcQ0d0mI+6NVhkWl0Mv07/kIAhPLdi6B+GYY0nIgR1gy9G/voah4lCUofW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Zd+MrzvNE7mqRNN7bPtTXxRETue4Xat1XTYV546oF0=;
 b=EiKGg9SmafUvBKaPPu4tfWD31AVim8Zp4vsTp+ok3NAqb7uG74z5qD6Bl0frM1H3ffwaq4gKrSWGI1iwP1YoF5hzL1w7xMT1XpRodHMPy22dyb2qx9YVZlm7/48PqWcOW9La2iBJLGmw21vhO/uoR2iseWyW5OT2VL9OAbYQ1y/IYFJ2kADmMJs3zK43vxCru1YZHi0XwI6YuUPiD60kthAPu+rxoFg+fJl8Pa7EW+zCcgk/baEKNsEKzALZ/AsOOXxy76WDiQApiZLh/wSq2XRIAn0nB9Yq5d6B4I52QPpL4sB7PpWgVJNjernrjDZUnjhWUYBSQEupcPxZK3mgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Zd+MrzvNE7mqRNN7bPtTXxRETue4Xat1XTYV546oF0=;
 b=UmzqIFczueYSid6S2SzAk67ygw7vl2OFzrMYONwUmRDv0f5rSopCF520cfLk2i2WCUSiMC5smG79WYR/7tU9C+JDq9U2NTxWVNh4nhumNt1bwh237MvTtnV4kiFWjmE4AkGcu3qgf3QgsTw+q1QqxUT8ysf95JL3JVj8tAG3kps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB10497.jpnprd01.prod.outlook.com (2603:1096:400:2f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 05:26:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:26:01 +0000
Message-ID: <87fsc17rfa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 09/11] ASoC: dt-bindings: renesas, rsnd: tidyup rcar_sound,
 src
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:26:01 +0000
X-ClientProxiedBy: TYCP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB10497:EE_
X-MS-Office365-Filtering-Correlation-Id: d6166223-0740-4c34-53c1-08dafd0250ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aEX3jxYXM3bE/ecSv2yD8aBepELU7py6WttM5iHADUBQIlQGH/3FX9+WFuSAQe3ULNOwUXIJ7BIJALw5BP3DyKYId2BREGPv/4dVU+7EiXOGeRXN36jSlgw91r+5F2x2UN4Lri7oRFBy4z/F4coYnJy30UpZEzsBpUja6pAqrq4SNqGAPzgfLp73P/u+8i4o0SqXdszZJ3Qxh2gXV4Bk1lg0afxNs3UevElB/kuNkPT3bdlG0a4fJFP0rueJmKZs3utoAPwznIMYuiKtZfoHCpUseZeSRbNwsD0ceVjdzotOy+QQegHNSCxHTkYUOUz303feqTjrD8yYIQqVkeFBzLbYiB+cMvym/17S0RsKuLGDYrCexBIt09PkjP0cQeHXjTOqe6uu+hHi8p/Eu4K6n1iNrnIxYQNToRM6ZJx3do1u03oqbeHbYEc1WmrUJV97DHMFtaDl3+54kCtHkh17v413b7fBhSjnuYEBq8wxRwsr+1ua2ckxucPE1bTsuXg7rGYUzTLON7VOe40Kbczne3QB0B8S5ZS6k3BzWteUFyE1UW5XOemouiFgdFaA9qqlhOhrlp37Lfpw56l0TNFDTDs02dxSeqWbdSgxeaUahGYsK2KvC15jIY6Dsc9xkFslSlexzi4FOFMztsA3jWAYTmh9UB1w/knoZk0kTK4dInjGdFmPjLI1P8T9LHvJ8+45oNxPKrPZi2jf17CEZJEEgvmN0LhzFV3RwPNJZOAQ+iU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(86362001)(36756003)(316002)(54906003)(110136005)(8676002)(4326008)(66946007)(66556008)(66476007)(186003)(6512007)(478600001)(26005)(6506007)(2616005)(966005)(6486002)(52116002)(38350700002)(38100700002)(83380400001)(41300700001)(8936002)(2906002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?76iALeUU+uHMion7TczCbR+4IOyp57M7MIHJQlegb7mksN/SOKOhiGFEgraX?=
 =?us-ascii?Q?bB/KxQ5uRBZ1om38wsAEjyHGBa+xw/B5/luC2BYUbVoLlJNeMP0SQcAHCRRK?=
 =?us-ascii?Q?4d6f2ybdblAevIdE+Yhhd/omJXsQF164PaXhQBRNLLU6PAjichdXVvgtLNl8?=
 =?us-ascii?Q?MdxQT3R+vcbVbxXOwEW+sWZucZ3c03JfpOUTcxnaGjOYhfsqwScY1vjkZmpO?=
 =?us-ascii?Q?ICxOuQ/BkrH4bO0i+qRqMoC53lGMc0/d+IFE5cHQHU0j6/U8oIqnCdFv5LuQ?=
 =?us-ascii?Q?C+9vmoLKhjxpigZgcsMTeJJeqRj98csZFw0+xkG4lbqKBCV4DGs5U+g16mYP?=
 =?us-ascii?Q?4uZ8hz0Kn3M5LdAAMWbrwM3AuAZ3zLfhDgvVK/7ZT7tl3zGr7tGdjojjcdps?=
 =?us-ascii?Q?7iuNM47vcw0ODH4+Y6FVaxMzfbFpt56/WS3omkeQAbfEEAZNbtXzt6exjacJ?=
 =?us-ascii?Q?AR5ZLlLt9NanFUA7hteTInjHfjnMGWj9M1msnCqH5m/49SfH4gTN9MSJ5pjh?=
 =?us-ascii?Q?/I1AXEMEdlFFwgiWUUra8Djefmb9fSOu+LgI3RMp00RFZz9eBoLKlRtkwtxt?=
 =?us-ascii?Q?HjgYCXwJ08YstTno58hMZ98il/uBWHDim3dsxPQly+OOqMC1aMv5DTbyGnlx?=
 =?us-ascii?Q?gldbqVg/H7XAY/SW/ybJHO3GFiHfFguEvTwZNPQWzUUDuGBV9QFpRRqyLKXf?=
 =?us-ascii?Q?9s91xeFV0d76IggQtF8jihohMY9ttTpyrAdfIlYj+b6Tsdk0fxgLoOVfukh9?=
 =?us-ascii?Q?/aEhPGfUEYMduJBWUcruY5z615aTnC1XjBurOJrahKAzHr+tGfqikGByxmml?=
 =?us-ascii?Q?/+qZ/dnGSnVdIMDvO8b6dQWWMJ2DJe3cZu2Y7AMPIFcWBfYR/qIsO9YPy+zQ?=
 =?us-ascii?Q?VbGdRz5OnjvkF6NGo1LnBRb9/qe45lhlzcYNBi36Yy9MZqdV0gV52wVCdyIN?=
 =?us-ascii?Q?OFsTGN0DfxmFrHJo2853uc+PyxyfR9u1lVHwgCKT+ze6/SWD+ZgPRqcOVCFF?=
 =?us-ascii?Q?QodQvDqildlqRc17Cw692d3F1funNNzkkufrjOODXlFkjYdYM+KPNjThI3y2?=
 =?us-ascii?Q?OCIHmCx1jIr5Kvo9/8MW9C6wVePyrfUCyluRn5uIOyFcn4RqaE6cMDuYvwaR?=
 =?us-ascii?Q?/hcIDvn+HB31vW6Tb0EjkBuiY1roWpYsgzfV3qUso0iWvCrOlnn7ol8ac6J9?=
 =?us-ascii?Q?IWOyCQBFO0Mz+kHJoLDbhze0sUu0aVEzX5gG4gDchWm09ZHxK7h6rwOublej?=
 =?us-ascii?Q?rQexkp3SK+y4QeOBAwbxn5MTwodmliE14A+Mm2yZp4xJUgg3WqlLPF7JqI89?=
 =?us-ascii?Q?H7gwMH7g8XQyYriQUttItq3brnPcssv9GPK0aA6a9O8CfBpIB1bMJ4K7v9fi?=
 =?us-ascii?Q?A4Cna301+nfLzESY63bsBp2LXYGNpU41sA0edxqS3fam9gt4EbQgc5uGGvPo?=
 =?us-ascii?Q?KtDcsPxFr1eRAm/1K5k+mbT6WT7ts0PC4bts5QpRw0Rgc0rT8hE0yniqlxge?=
 =?us-ascii?Q?u7kd3MK8s/Sxb7Um3fVxSf65NSxzEvWfO3+uEFudXNEv/DFQdLmveyooONx5?=
 =?us-ascii?Q?p93q6mBtzG6LINUe5WEOg4DvtjDOud3NoH62SxvNzVC5tkXcVtgFPBpUl6sU?=
 =?us-ascii?Q?+MOxiUL+FSOEWojt1p+QMJs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6166223-0740-4c34-53c1-08dafd0250ef
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:26:01.7533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39K33Bl8kBwOUHClc9NzB6aIWIIeQ1bNt0o9dMUSiK+aWGpGed4KX4OBY0jITXZfNtxPy2vAE20S9dvtJSA7EqmSg6O1ZdOejoIXlvpEBloAPHPj3ZrzKr6eeFd2KFKa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10497
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Some SRC is not implemented on some SoC, thus
interrupts/dmas/dma-names are not mandatory.
This patch solve it. Without this patch we will get below error
when 'make DT_CHECKER_FLAGS=-m dt_binding_check'.

dtschema/dtc warnings/errors:
${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: \
 sound@ec500000: Unevaluated properties are not allowed ('rcar_sound,src' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

Link: https://lore.kernel.org/r/167344317928.394453.14105689826645262807.robh@kernel.org
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 6ea8dd74932c..54cfdd4d5e7f 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -197,10 +197,6 @@ properties:
                   enum:
                     - tx
                     - rx
-        required:
-          - interrupts
-          - dmas
-          - dma-names
     additionalProperties: false
 
   rcar_sound,ssiu:
-- 
2.25.1

