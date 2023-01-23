Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C006774E4
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:27:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED021721;
	Mon, 23 Jan 2023 06:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED021721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451634;
	bh=dtMiN4UTM+R3uE8rzwy/Q7rRZ9Istah47aUXdTyllqs=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m9RqS0UkfKyJbFQuXGPeudVCVAIbHf4GZ6kJD9jswg3aZm00/6JTAW7Tf62IQSse4
	 utWBIZEkda8iGycx14nCzPQLq0H4JxG1Gx1184kRNqQEobu++IDaMwNXAeBsG4VCRQ
	 PDxuyvlbVyk/lX+Zmn0jJ8ThCWeLDjnR2li+IlVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4934EF801D5;
	Mon, 23 Jan 2023 06:25:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1A2EF80557; Mon, 23 Jan 2023 06:25:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52566F8053D
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:25:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52566F8053D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Bkax+oux
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4NLlfqX66RijzXwE5BVnWkOL5rvrcpfSMYdsCYL+btfQotYfBSuZZLZ+8uqYF7zrrctzzf9vw1K5sumOu8BVF+YWfqDUO/qQ5B59yXn/CiywRaYbgS4xqwY5f2Y+giok1twPIUycvXzv6tayRJ2/6zww17oAGd8Wl7Col9KjD0T6Wj5/FeTWb0Gd8nZrpuO9lpOf7BOK7lvsOpbvcrvAOYlPuc7+3baRznjZOFr7hVxzp8Z/Z7sz5rBzEy9OIjSwTvJUQfXL1KmvUmA9hg5BLFxdv+vHmR3qkYP/EoRqcgcEjfG7+Dp5m4WkRQK01ixKDPo/CHomhRZJLjRrMJNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dI5HhhAqcYdtoN2PcExS9iVBxcl+RhCC7G43XpDcM7I=;
 b=HXPQS/fuNKJDb5NQzHraaKcKASJcEdcRwyuop0NHFzzTigkeKIfszJ/Mhzf5h/+vR8VVWetzHvWwrg54VqLwRyHb0tT2PLfxUtWkIeaHdUOD36WwcsMpHwhuExSKG8s+9wTU8ayi0HjjRdL6gg2Pdr7plEXWmDUDfGCCwSXNBRh9BmjXPPhG/61fEhKY/zcQhQX9CLV1txBlmONC9gxl/cxRryqHk6jOAh0GRBFWONOv3LrkZLiuzmvGjSPZXCaQq7CMGPgRpYOH/lAS6HL4ovVm3FiEloqmkGbKWrDD+7WTCAHiu9gfojd4VN8egUOnrl9hdgG+xzVPabAxUU11sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI5HhhAqcYdtoN2PcExS9iVBxcl+RhCC7G43XpDcM7I=;
 b=Bkax+ouxFJIRI8dGrLESi1gRnBsxBFsvCiZje6SELbC3u5OJ3ttxnTNaGF/SdN2nJHt6scfX+KKa3Jifef48dTHhm0hCxiI26Kk6SjJzlByVJvtLtgan4E6Ja+q+oaWdGU7W3g19XZHV8fVUJdDw0eaM6CB3Z72koJFwdyKP/BM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB10497.jpnprd01.prod.outlook.com (2603:1096:400:2f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 05:25:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:25:20 +0000
Message-ID: <87mt697rgg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 04/11] ASoC: dt-bindings: audio-graph-port: add clocks on
 endpoint
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:25:19 +0000
X-ClientProxiedBy: TYCPR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB10497:EE_
X-MS-Office365-Filtering-Correlation-Id: c2eab347-3340-4b55-33c1-08dafd023831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVLkY1aTGZRzLtJQst9quZgzJ8fWoLF6uZceGmw4cwfK8srMg5FN5c4fws/CB/czwH5UWVhG41H2RqSoGttgeBhOonnF068oY94SZlwYfa6vT3YQKSyGoNyedPQRQ4JIbwzFEMgehokEw1Ejjj6Deu03fHm5UmRIFDoKAAhYLi9+ajTbpoFzkC9lcFm1i+VcE7b52XuT/z/V7BK8n1w2X0x2h9HXG/QobxYxRPyuuoLzDehuJ7KjFQWqhJtDlEk1j5GT5ZfeWgcdJlX9tIUij/9oTaR0l7tlmU/XitaBLoRm3knLcfyyoPP3mch8QrW66V6j5E1seR4TdvfpS3QbTgQoq+B/ci6J7BTYmqIQWg8gSlfBh+avZCc9OkZgE6U8/UOT/b7V6jg0thLiJWBYt2w87GY//Wb2KHK9PTW0+mzp9GtVbbSiKA2pFbpeTjj99R1Z6+5eRmJSa891AjQeJD4ehHfTZXpOpxXHEUJZ6o1wwjclKv7U1MIu3lknITZfaPV7hq8+76BZqK9JTcjkF6Lk8ADtc1RI21NRuq87TzZfQVeigfkD20GDa0S+cM9RSnZQWrw7UNRwSztL20cJm/GCszdq4RcO09fh3cANhrNzZCOSRq2GCGlxwBkw6mON26zhmnoAu+lPOUB4kbnn7L53/VmNbXjzxmESMdQJefYw9R15aphuD+xzP4ShfLHdLjKjXOunnPE89ct4AxZ82Ef5oKAwlxSKpCZ6kqm6bhyx643QhoAMFiGS7NIOyTOj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199015)(86362001)(36756003)(316002)(54906003)(110136005)(8676002)(4326008)(66946007)(66556008)(66476007)(186003)(6512007)(478600001)(26005)(6506007)(2616005)(966005)(6486002)(52116002)(38350700002)(38100700002)(83380400001)(41300700001)(8936002)(2906002)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YLRT1TOxo1MHbUG+ks1rdJQGpfWn5kl7558vWVJV+YYcyv2LPvvA9Mpw12UB?=
 =?us-ascii?Q?tfpDqFET0B53nJCZRr5h+OcyRaPkD/6UiKn56sqSO9wAkILN1oHYKZ9h8OVd?=
 =?us-ascii?Q?7edanoaP0/SNBL01NXZjRNOkvsVb37luhObIAzABofeFCvm6cQuVM/vKRTx/?=
 =?us-ascii?Q?mKm1Pd2yMV0QsolAKjDh/mTd4R17CsSp3WQWBd/lwUhFiTOoY/7rGZqJ8fTi?=
 =?us-ascii?Q?MHA3mi7mLxRGB6UoO7/HJ/ymCm++G6KCB+NMQVqpAZUS+uc8VFzaDLuyKj4c?=
 =?us-ascii?Q?Yv5s2f06HQePLPzhWPlAjca4upUtZlRFswDTHS8pvUbZe8BBSLbvMOTalF+Y?=
 =?us-ascii?Q?t9Icepa3J8cMDZ6cHH1N4Kofquy76UZrcJx0ntKkVeGlmgA0n9zRkxB3fJHi?=
 =?us-ascii?Q?HlDTUT7hyPAxcxd47LT0YM3vPZ0JmpYiW/H/CQC/xvM4xfUQUtwaR74fvo21?=
 =?us-ascii?Q?qJMd/dNT9JbF303t/2aNI0AJ22N1tXzN5iKgSwJMBAVal0AwphLP9UTOZNrh?=
 =?us-ascii?Q?QjcgU+CktUCRB9GZDjfP2DVjUwfgzuG/9J/nKO8tbymaW2lkk38q9opUHhPi?=
 =?us-ascii?Q?cxt/8UGVcJj7qp54RalKTB1b+nBO1cHqRTB6BQmw8CkT1ScWmz1AfU43ezjm?=
 =?us-ascii?Q?bGJqUtgtM2YyRv5XoJfKtdA9iyAyv5furnAqx/Xf7EFmQoZlJUh2xoUwLlYv?=
 =?us-ascii?Q?F+oZvJGpJY+5bi1XsxZD456qXy4CrN/IEpC6+RfbmvAnz4NZdv4c94igF8FR?=
 =?us-ascii?Q?oTi+7KlvPog+OFlBCUHCVhWc6QCkLL8hLM5pJCwY0JgEBHqVHku3H4FGDI22?=
 =?us-ascii?Q?+51WXm93S4/qlL/uNoSyDYp88H2fBo4HJ0u4rTHqBAyjnzTKvJ3ssB0RPsXQ?=
 =?us-ascii?Q?2vPhaedVDBbE/CSfoRqrwKnsHWK497X3T4Vn5426+fVRblnqQ4dC6rm4Bqf/?=
 =?us-ascii?Q?nPTb4f4EMlUO9dYoTodnk/9GM8doaMXZzJm8TbWoJf4Y6RxhjYexQPDVMOXy?=
 =?us-ascii?Q?9Go7R92Ff1lTLiRU6SIag+qqYs9BTFz4CUnmYPpLM802+GkYvDLi3Zxi1nKR?=
 =?us-ascii?Q?n+ZiJ8Tv1onfcM4TyLJ7qfV3cmtdVaurf8pweM/rSmO+/iHtBmkTzfAiWNZP?=
 =?us-ascii?Q?SvSo1pWlDuit0f7N4DdNe3CKApmdwDOn0GEhKuQ8t6QB2C2Oum+74NrqDojF?=
 =?us-ascii?Q?heplOn9uu7evs+ow9agSUmrmwF6h3yT/pO3BMrUkrsJ1tOproBQtrfjzDfwH?=
 =?us-ascii?Q?rvbD35NqVqmotps5N6n4/L5fpCU5gnAP/9S2ytGjTjUew569DiJcYGAEPd35?=
 =?us-ascii?Q?L+TxQEEQ2/ghi6GqS6Ug4VWbAwoM46wp9/XMPuI81oB7O8hSD3XJzogkAbNM?=
 =?us-ascii?Q?lajuJ6YIt6qynt9PfUugpoaja4sEUV6Nfkd3a+M57qWYdCQEga/OB5cAv7Mv?=
 =?us-ascii?Q?zuBaYWgqoyqNTSlSgVKic4nL3a3GjIMb0iYKZ/W8VvRL/ryRno/SxCLjWVDE?=
 =?us-ascii?Q?rshhtKiS1rG0sgkhQ+iigBLqpbst1E/aBku7AokPPTySOzVtdF2NeJW9q/Q2?=
 =?us-ascii?Q?bQKHvw6G6dPgmc59q7JcqV5XuChdqQ2+WTu+PTA487YDPVHm/oBOQJkbRu3u?=
 =?us-ascii?Q?4Cwf9b3jlclV3Ymn6j7EhKo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2eab347-3340-4b55-33c1-08dafd023831
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:25:20.2419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZHO7ehlDaSAIPF2lC1VPmKg6xqeI02e08vYVjjP+my40g/u6s9cLq6AhowcCw05sI/5IHy3vWUTXc58yO3bxUN7TqZc1IeCjQKjZlhl5htqn9v9NKnz5ycUbCceAZ6+
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

Audio Graph endpoint is possible to have clocks, and system-clock-xxx,
but these are missing on audio-graph-port.yaml.
These have been already defined on simple-card.yaml.

This patch re-use these.  We will get below warning without this patch.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dtb: audio-codec@44: ports:port@0:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

Link: https://lore.kernel.org/r/87pmcmpyml.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 036682e55b2d..edd6cc37118e 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -48,6 +48,15 @@ definitions:
         oneOf:
           - $ref: /schemas/types.yaml#/definitions/flag
           - $ref: /schemas/types.yaml#/definitions/phandle
+      clocks:
+        description: Indicates system clock
+        $ref: /schemas/types.yaml#/definitions/phandle
+      system-clock-frequency:
+        $ref: "simple-card.yaml#/definitions/system-clock-frequency"
+      system-clock-direction-out:
+        $ref: "simple-card.yaml#/definitions/system-clock-direction-out"
+      system-clock-fixed:
+        $ref: "simple-card.yaml#/definitions/system-clock-fixed"
 
       dai-format:
         description: audio format.
-- 
2.25.1

