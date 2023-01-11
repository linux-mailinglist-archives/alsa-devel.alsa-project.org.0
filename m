Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2796F6650F6
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:11:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DE219CBE;
	Wed, 11 Jan 2023 02:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DE219CBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399515;
	bh=FCGnE4LKVVoiCUtJABR9Qj26ND+afrrhl4GGJ1oftiA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i4tc4DL20OEtd2FrgnFNuxpc2pH0D6xZWXD7VBeMzHIsLwbAwEUyH9iABTOLJgYwN
	 RlTIegw6Hhl0lsY0LrDOyLpoKp7Xv09yC4wt63pOdCaRakEPb8SfceUObP62Q+qnDc
	 zQBVmi88E8/dmJBhVkg4wzFhn9SjQYFoHJOhQupg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21909F8019B;
	Wed, 11 Jan 2023 02:11:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80B6EF8019B; Wed, 11 Jan 2023 02:11:03 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 02447F8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02447F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hzZrC/2R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xubb4mzfnLG0Qiwubw5abUWIJ3U5m85+yVb8+9VbjaXmSQ3tT+i7ut3ElCldt4wqpk1z1ZUYX3udUXC/IDXP4WW0/LCGH1Afm5WR8m6PIkLGidzMRhRLRIlN9MoR2rkRTxI1/N/ECbzRDjB2OiN5sIW9ItEka8RiAnQrDW5So60ly+xoHOQbiEOuec96MJKgkDvMV667zJVVTeO1wzGEDH7CDlBXKAVDtz15pPX8JDAREcpos0Y0kUieDQBr0duvMMu0PZZ4q9VvhAbZ0bnJeuoWsUbK/IFYBTrS9cRQsdMMf/sAs1MKxqftrpFdFtyoV7v0D55e66nXPUGrt+QTcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt7DaOyRBexc7kgYFus748DAMYABl4AAYvlIIGbdJls=;
 b=XqcYK2AlU9cjic0v5eD0020qYhm64uIFIndPUPfiwPyl0tATDHOVMLGyjms4lN2zcXVnqGSlVf1IS07x2unQSY4o34fko0mONUf/8GXtm0UZq9nHmH2NzqI+BHZ+7pj0LwCsmUM/r8jWCpAtM68emP8P6NPRRGoUIxM0mZwKXQ1E0+xigE201QpHBk1yDbPjLYjVZG7SYI3gbYUM97xXP5rgar++DXtYEDZ/RTmlIvDASqAyUXefnHKm6kV9tgc0yhyOUTxOS51TOysGjIo/ftYfztthOtK5SbBW9W2F24zmOfO5/mMkZ3Ad2f1/AUWFBZy1XbjmustvNGd5GAsODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zt7DaOyRBexc7kgYFus748DAMYABl4AAYvlIIGbdJls=;
 b=hzZrC/2RfJq0mH/25JPxxBGdP4Gg2XhYCNkyLyRJfrTcdwT3NqqnyGeGrGw8JQSKfiRRMZqDqsCQu3GOe6+eSfYwx/qzOV8NyF3JLbQZTzWvrYOM5ZcSpWjeJVO/G0tZ4vXMuhlpC7rckc3AJKmWWRWHYkXfY3siYoi6gK14QLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:10:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:10:57 +0000
Message-ID: <87wn5tho4f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/10] ASoC: dt-bindings: audio-graph-port: add clocks on
 endpoint
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:10:57 +0000
X-ClientProxiedBy: TY2PR06CA0038.apcprd06.prod.outlook.com
 (2603:1096:404:2e::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ed32f7-c94a-460b-524c-08daf370b1cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9j1vZf5CYsEaq/EJTeyRrrAghTe+41jxdCF6Xi8yGHh7Z4Wba/fFhOx6Kev8FnsGIEYCgOdrIWJUKbVYwP2/k4KwEnnEAPWj/t1yljF8KZgk+a7vxJTCNk4T7R1UAR0JH5tJykvbbI7iHDj15xqzI+wGdPz+YQnrNruiRJqaLtMpO5y5DgFN3eYM1ILH8IFD12OP/7EnxzZ1S52O6U/AIx0X98HDU+Dfpmi+uE6lRwazytr7spWEoOVMx/uveJtwRs0FnQOAXI6LJs1AkoTS8/wIYsGYQsob1OZft/VM10ylsehtUhkdTJr9/xYO65yQ/RIf0SMaZHAHlKID3wjO2wr5Uy8GwbHGDavqmqpI3WQPMXvAsMdu7nRRECTPSuM0lMdtlnQZiI3v4ED3SxMVtNHIv4DjravLR2UwDomXsRCdGspMIZJlANoB+KzO9BY0sh/zOpGH00GyWCzedYK2NMSlcBi6MUDpz/XeUwXpMgFWOxKUILvtvrDBsQihzNggUFFHW3dcU3Co16n+TfyUJRwfQf3tGtZzMjj1UXS+Bh0QWkFAzt6nhyFj9oPmf8Boz7QcnuXsCHlG1ewhOoKuAK3Z5wItXifqvB9FmWn4nKw5/ZAHuz3Au9v/HSSadzu/ohyllXfljlRFGbUMAtEi2aWmU8dilChty8IeELSWkGMMuy9tfQHYUyJEUWDNDTuWC/T10tHkdaBxLCfQkUa0Qi/siDiCO2MmjG2aXCSjuepuli0/4MyPg/6A19qxtzjw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(966005)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(6512007)(5660300002)(83380400001)(38100700002)(38350700002)(86362001)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V2p09g8rqw66o1nZIU7LfcBS7sMsjYTIAJuZtbyd9bELuEyCvzJ32367Xswl?=
 =?us-ascii?Q?BrQ2URAi8jP3Yb/lAyjLNY61VU3YVvEbtHKTDz+VUsbjY5VhMojvNA8RktMn?=
 =?us-ascii?Q?Bhz5Fvccrpv+dk0ctzGgMUz6E1nGDUPIKo9VpVZwz1WpikB6ZypYf0eKzjQd?=
 =?us-ascii?Q?rDUcfCvhzwpEXDuHiZCa/JOpGEBzDIAO0BYvpx9F8ovsBId/2qtafb/pjsls?=
 =?us-ascii?Q?hVPyjxwC/ZP1VQrXQbvi6R74zjwGvFCeaN8FtxGvlMUDj47VWL7lJHahH+RU?=
 =?us-ascii?Q?C4RgHUNVqju2g6K9XduG0wT6L+E+hsyCwL74PqOlrrVZoucKvUTajNhLDBhP?=
 =?us-ascii?Q?ezgkHAaUUuS2kM6xhpU6xUxcbDYE73QqPGCmkRcE/MXliaxr4ELdBNpmK9gx?=
 =?us-ascii?Q?46ndGtLzDTEo9JtPxDhkUjInAPt71X2Y+VedzIJLSsQDYSGNIcpOuNsYOmmQ?=
 =?us-ascii?Q?hanoU4CMpoXebqfi9aM/JJiHcYcXR232KogM+ebV6+r42VopPgc6KWNuuCTB?=
 =?us-ascii?Q?3siyrmcB5EpvborIadIAkbIgN36VbGfwLMn/Rt3MLRW5QH7yshSPovBdjZuf?=
 =?us-ascii?Q?stFGE6bZFSTnX0ywb4DYwIqVv5u1YPBOJayjdOKWY4BXjmTUveUTROEPa476?=
 =?us-ascii?Q?xKUsbmxr9qkhHQuiK8Qo3X5KOak/swnzjtyOh/B2AcmUeXU85jpDbS2M/7dq?=
 =?us-ascii?Q?lpogdOz0ne1yhQMN7QCs/Zh1RBEr89dckvtCwX4DwEDwkqiLcOndrEfnwa+Q?=
 =?us-ascii?Q?Wesl/94LlaXWXtoaGtiGl5GNxO9QucpSTCkzK8NEydMLS5FYo7w3BpjTUQ4y?=
 =?us-ascii?Q?f/9G5oAqevpz4DL9aiTQU7HIM48kZeiCtfDwbmEMkatPd6Y4qjQTWWx7xLqB?=
 =?us-ascii?Q?stqUY2TesNk36abExFtIIBmEaDq9mMpBlKfFslUTaAMQZ1XattXkMss4JrSE?=
 =?us-ascii?Q?ifjpUSWXy5Fu17YZEUiAGk54gaOXENcNlc/dZtsriscQXWpwkfcRYx2ijg6v?=
 =?us-ascii?Q?ogZ0MGWqau77WibDk/4JjJi83bxAhy1CXOAgUjagH2N2JncsXyz597RPgJBz?=
 =?us-ascii?Q?WXOOI+smEQm6QqHBL85fClcTmuHyhnpoYyMTY2qxUh2s057s2q0keoHSvdl5?=
 =?us-ascii?Q?pzQ7vMUfDDAnOJy4pQQJGV1pth6MHEruMKBVBpomtjmGvdR5f2y7XqkxkkgP?=
 =?us-ascii?Q?nCc77oDgJp/HLN8VuS3EPO1kMlVixLJa14rSqYj0NYMqc6M2ID366s2e66YD?=
 =?us-ascii?Q?Z7gt50jc3OJ0Bkq6fB4i0rTqDhImLtarLLOLM6hy0JwOqMepGnwLsZMM/CcG?=
 =?us-ascii?Q?mfiwmhtg/pbHP1Y/ryhqvXZW1BXzc8Y+9o3jqDb86aSFM96F0dJbxci7icaB?=
 =?us-ascii?Q?z0vWdzKhycXTugio1/sw/dCZM/zgljT9zMpmSayom9ARHxLm+CMfOVkHfq+n?=
 =?us-ascii?Q?Cq84MRGmzbp8aVvFQef/pMuTGraUb787xCuknFuo5hw9H0ZF6szvnmy88Crr?=
 =?us-ascii?Q?uFoftKlBWLErIFh0n0U4U1U5VlJBoX3z0TRUSj/ddZO8OBCqfIH2bqzcjmX4?=
 =?us-ascii?Q?/gcYGtwtF4dGEBj36F9WBhXJvmiJ1e4409K2WrgMax/no1Wzn1tg8E9aQ84l?=
 =?us-ascii?Q?T5D9LoKK26dN2E4zkX+IaGA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ed32f7-c94a-460b-524c-08daf370b1cc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:10:57.2488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSP5ySSOILg302rG9UZtOrvPu9/aR8axYo/0k+bjCgVAbIaqP6n+hNB7rJk9Y7TWdtwwaPL/xjlkPvwWhAccUtm9sbBzDLKa0pcTpych0wbgdhKHOLYahJ4bz1nbvd4X
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
index 036682e55b2dd..edd6cc37118ee 100644
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

