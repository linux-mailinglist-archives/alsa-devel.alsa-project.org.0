Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BCE6650F4
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:11:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E684F569D;
	Wed, 11 Jan 2023 02:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E684F569D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399490;
	bh=2gC3Yw3cF2esqO0rc76MZEp393UkhtefFQ/FP5K3DnI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VzJ64AxtAtMc4meYFcpqvwAgdKc2QA5cHa4gNUiC2SuuEPngQ4HCrcHlGGBRzSYm5
	 qExF13gUkOyiWDsYoKA0oyo2+8grecBEexGimMlatdtq57DM4/Wooss23pJv6WOVOn
	 uTeSYKbm62d+uMWfPC+j7nzC9U5z4KMmCsUKJ53g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 680BDF804DD;
	Wed, 11 Jan 2023 02:10:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16766F804DC; Wed, 11 Jan 2023 02:10:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 533CFF800C7
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 533CFF800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jn21QC1v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzbS9iEwO4yx4cd3/kpUHgGCukH8ielGD5xyh6Zr+XjR/tIIH5Hdfw/KoJLW366BSd1MORGdAibiUQMjMWVu5+W4D3KJmxjafuEnrLhyVSH5xzfZoSuhlqMcpaQ/rCPbIVl6H1PPJVzPOC8JTppbMDwSpN9IBRT+2FKyu5/X7VKlOe1BML/RSfQxNjtppkl4Q2Wx1Z4aJAbk14KmSTZx/j7qINsNtFp/gpftmuFtBdd6TZREazC/xBt4jZEfD1fj9b/ks7nT73sGSM4trssc0WDcXJCUqZQjfo4G60R/7bI9BDhNTjdAfa5TrYr/7C3712ovQqTjVa2DzYHo+WrXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBYlG6lsHuk9LKuOp/lGBYHnp4O17NzM+jIvM0Nn9AQ=;
 b=oKGqgtrKrlJ1XOwZQBWA9espSic9Yh9U+rD7jy1Xne2KNNHDa1Qfbo2EKv13wB41C8rFViJMTQIAOEo9dTuJijV8IF3/vdncrLR23WBx60iz4F0JM9XyiRLWuiO35Ep5EvTpAVafpEVB7b2qIQlOUxxYT+XJhbLbhYj8DJa4evD8QUTvEsPwGyPPTxMZ5LY//UVFwgCQQ4464R1V5HoNlb3FsByyfZO5/h1zVi/kES1r2xamOMCNH9x4Wj77Of1gpQmIb38XHPgZelClTtSZKXAIi66SmUnUIKjJitl7Ll0rhcxr4KFXI/9IJh6HL5hLJ5r7wZ9LJU+fgbZLibuaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBYlG6lsHuk9LKuOp/lGBYHnp4O17NzM+jIvM0Nn9AQ=;
 b=jn21QC1vL0ZoAmOB8l8bV4TiAkK2WVjbjX894btpUX9ed4UBdrJvKdMGQzO+utol1fYXJhJnHAkb1OGyDhRBcrqtIwZN8nGkqRlxw+ief9U2d1HvBugJ3ej7WDBILHZNlCB5Rd9hW3f0XdrpD3JKu7nB/kaoFBDizvrddcqfY9s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:10:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:10:30 +0000
Message-ID: <87y1q9ho56.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/10] ASoC: dt-bindings: audio-graph-port: add missing
 mclk-fs
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:10:29 +0000
X-ClientProxiedBy: OS0P286CA0162.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: a473be59-845a-44f9-8f2c-08daf370a197
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uIbB4LAxk2yMHuBG7B7bohTAftxIl++Nmp8GiM6kSQHhig+q+JrdxHLg5nb1Ir0SomQQUmduoFwTn8r3cKDGC9GUQSSTgV+DJT348tQFkODeJ9G96VEWOHpxDYrAAG1yMfzIa9MsEDEv/fKH80161+E0UZOsuy7NLsO2A2raBxEIEDvqZBR0dfrxQ/vOFhXiRkz+BvdonkCVnRy8oJ/ce5GVgPx0kl7+OVmNnqBmH/e+JfVyy0iAFfHO8ctEhKtrDokIa9g7Fe5qWAB5fPR/C64VzhlWkRm8FocmMe55am9t7JgatfVOft/GFdUbKUWWBojcRTYpWIhW8qUZkHdefLUHeJjie6IofuuO9ANCGZJf7lNDhSjNIflcYG5UT+Kag77DEg+hDZpIK/zltPDf1pHoYXgXzx1RIIULCghomi2LrRzVUeaSo1vGsyDRMD75WvwjVCQXApuWqAAuMx42+WPzDVVy5v4FmUhsQCSrPDN5kwXPQ4Swt0L+CzPIinxkZlLCDTDGwDbuBNGlwQy0ckwArQFGYJNvsXMJ7wL491ZVXM09C9ZBEEbUYRLhpJ9zZg73NK42aU5Svg82JoL+AnkbPs3YO2uCUmZBHm63RwAy3MknWdd58hibo+D259+4NQN/5vSLuor5sNFe+eZ9XxdnesK0l3p/hpZCc7tyv9LGmmxiiY/rrSjgDUxvwGFoc0lNwmmdWAY0UD/2HtYiQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(6512007)(5660300002)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3aKU3kYAEpFHubB/BetV3WslGp7V/kINMozPcYFveojo6Bw7rUEPQJ1Oa4sT?=
 =?us-ascii?Q?t1ZQSbSzHflkpTLB6JW8sPI3/R1JM/soUy8Upxy7O3VgASbSaONLlRzK76hC?=
 =?us-ascii?Q?iclTdribv4kFz2DL9zCWDln4socYiDxDTFHLvp0NIaU6knpm8igzpFwcXjib?=
 =?us-ascii?Q?cp02mN9HYL415NDbBwJLgz2zuHwbp80L91w8PzTdl5AXx2DIgmRf7zgaPuuh?=
 =?us-ascii?Q?rqvABaVmsglpZnJxZlU5b2ALEQGAkso/EfOb0lNZKDP9tSLU6YMwj5llhIm7?=
 =?us-ascii?Q?YPtnb9cH1xJIqrsuUgwCxCO5vjm5hbst8Gk8gaxBLgX1A34XgOYeftRpPxqg?=
 =?us-ascii?Q?czaZ5sTIDI3o3XQ+k7LeN6xWBw/Wx/aBmrvPWOnj42kGZQtC1/ktAjtguBBA?=
 =?us-ascii?Q?y5poZjyWoqwGcbvC8OW832kOX7MkS6o1gPECWdDDCJyKDi/1km2FA9C+JtrF?=
 =?us-ascii?Q?5MRkz/xI+RE8kvQ4SJPu71Wogru/f7ZNxe1YwexPC2GpZ/aU8ix512vm5vwn?=
 =?us-ascii?Q?y0zIhWekLn7Czju1yrLCdfNkqEuqRQt7iRk04uHA6nGjsgo6l+cGwhwcQdqo?=
 =?us-ascii?Q?9jnF5ntNdfTZ/TajASZOYD7HMime1uT1ZTnAX0oVC8qxljm8QBSqHnV8X/7s?=
 =?us-ascii?Q?zPzTeAvAvxHosfidY1QjaSOTEo0+qyqU8WifYaVIE9wmzVJGCnRkHmDZ0Uqm?=
 =?us-ascii?Q?mk3SBrzA4zjoIaVUNVWD8anGq4ujVr68DKaxKrYO0pSLiBZzZ388fFdghYZ7?=
 =?us-ascii?Q?0O3Zp6bEEnbSURYC0V7xMVlWT7pj3M0/QjZUuMsiEDQsr2YqsmMGNh33PaKR?=
 =?us-ascii?Q?/eS3CsR0yN5rlJpJJ5mo2CgP+Toul8tHAdozjWCQxjGUOOuDX7e3m1XG2/ON?=
 =?us-ascii?Q?Lt0S32RpLA1u8PD/sIx67XRu3Nvv4rQn8XW6CrW1KiLL+2GoG3RgOaWzhmmg?=
 =?us-ascii?Q?CRWiUSulfkiCQVyxDUkvODUFPBx7T+tT5Zb4HYYVO59lSVGcs8JiQRVJtpxH?=
 =?us-ascii?Q?+8PtnTpHFe9MbgXhHEf6jjs6xoocYVdgKVHHFuVtP/OXUfzIG7f52iRnmcAG?=
 =?us-ascii?Q?7ZrYtLojav+BQYKovZhO70odcd/5qfIdm/xhjgYBeVSsyILF81AtcG9xBnOO?=
 =?us-ascii?Q?eqIdhE+Qb+S1CWLUjpkOgkUbletNmJbvcWhC4VRqNtuM+s4iRMBG3iv8ECML?=
 =?us-ascii?Q?r7Y9/chQuujHCCNK40xF2SoNs4sKyKHnRGQmcEb8P8fn0rS5QtaL4cLNIyuW?=
 =?us-ascii?Q?AsKmX3csIsM9WzJeQeasjGriIIKCi6pLhouNgWMV58FKqulpNp5jzop3+/dA?=
 =?us-ascii?Q?/DdiMuzsc0JQ68TkJDFkhWDQZdQoWW4TGGJXFpgqMtzHG/VuiSj7J2rrv+Z2?=
 =?us-ascii?Q?thLh1+9a5umL0XRg6ZrNRq+QvZtSp3AtkYdcX+QU6THrl4CO6okx8B0z8/pz?=
 =?us-ascii?Q?4HojeCLwL0Y/2qPOHFqUheHh7xDOFKI76gOmaUUurgiIXnf3hWCc5ruwXDF+?=
 =?us-ascii?Q?RreUSea5fmE8sHvT/7YmreN2R8jCSGJ04/qkCJsJDc0QSkV0P82gvVbF03GW?=
 =?us-ascii?Q?+Ti9SM9pnp0d2TuhEV6lrmWlFQG+vNhD2rjAdmXczV5Z6fhqFvBZHvKtqIm6?=
 =?us-ascii?Q?tx0zZSdI/jk99xq+KIR/Y2w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a473be59-845a-44f9-8f2c-08daf370a197
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:10:30.0703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /es5cAxtN0/XQJIqTQxlWGmA2XkR1VTMlvCaqtIC+GDOLnil6lqIYtYDJMJytfsGLaUgy4/eJL5s1ide/2Rhz4YOHSPaL1EzvGV5h/Gqq2nzdin9zgF2AYPh+Q6rZHrl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11030
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

audio-graph-port is missing "mclk-fs" on ports/port,
it is used not only endpoint. It is already defined on simple-card.
This patch fixup it.
Without this patch, we will get below warning.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dtb: audio-codec@44: ports: 'mclk-fs' does not match any of the regexes: '^port@[0-9a-f]+$', 'pinctrl-[0-9]+'
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml       | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 6fcf7f567424d..036682e55b2dd 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -24,16 +24,14 @@ definitions:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
       convert-sample-format:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
+      mclk-fs:
+        $ref: "simple-card.yaml#/definitions/mclk-fs"
 
   endpoint-base:
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
     properties:
       mclk-fs:
-        description: |
-          Multiplication factor between stream rate and codec mclk.
-          When defined, mclk-fs property defined in dai-link sub nodes are
-          ignored.
-        $ref: /schemas/types.yaml#/definitions/uint32
+        $ref: "simple-card.yaml#/definitions/mclk-fs"
       frame-inversion:
         description: dai-link uses frame clock inversion
         $ref: /schemas/types.yaml#/definitions/flag
-- 
2.25.1

