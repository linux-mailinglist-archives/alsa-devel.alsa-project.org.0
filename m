Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60576650F8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:12:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B7B828B;
	Wed, 11 Jan 2023 02:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B7B828B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399533;
	bh=0H0jkde3o+ql7/+jbfRBHUxmtGsSH79yKweieeqxiyA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GXtEZelf3CnQcBizAeAnIjPv4iZqvdMdkYLDP3ZbRyijpRDrHlmcUBzhxwp0O5Pq+
	 3OKXac2Zae78Tys40M17hGjgYAZTAlHIIbyZTfn5yw5onmahihdjoQjjAUc6cP4VFX
	 TCdpREqKOTPI+9mwfLTzEOl6d8IKGStBzeGcFBZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B32BDF80539;
	Wed, 11 Jan 2023 02:11:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6226F8052F; Wed, 11 Jan 2023 02:11:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 332D8F8052F
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:11:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 332D8F8052F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PXpqBm79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvxlsJP39yHGIqQy/7MxeXzdYxihR4PB31KGq/bBmWuhstMIi06zvriC1fsoS7sO/eqL7NGk/6WIHmiMKON8Y8JaX3p4ogJYvU+JuxBJcKdMjAMqC96ND1HGvho2jf3PhSEOOI5bichMdnnj4i8p8REIz4UCaX9vVc2gPlydFVRfIQKEVU+nFS8JcSzT5t+vF8iJQRri8mbv686gDRoqjLpYa0aN0qMCbpvJqZW2zgZFVl7LcY3gbkDca3rGZ6iqtY670BhnUqubarQNCO7zBQX+li3RaXnAXcE3QZL5hUcyYVN258999lEPNBKtQ1NlfmkAwBsmZKgMJvGGUJ5v/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4xvd4zkk/ON+Sgsr51R8pZB2S4XhRhWXwLFqF/ygDU=;
 b=kPyrJr6aCqs66YVIE3J3TJYMysPS4uPjx/BGWv4z6yxQNdwJRubHr69XM5A/c14LZAoHJ0oEEcTk90rJvM7xAlac/oAdrRt7us50NQ8z7/vKzUCGEhX0CBY86atn1usO/wcO6/3XQzPvUrvw3JD6yPapqlJ8zI5xQCr0xquKe2kLMfW5j4NlRtYYCJPbTbA9RPN0nfh2v4TOhJ2Uf55qHvaFpFl6ctf0gyYJL4mgFx7ruVnpjGiZlQnpeh0gtWGZt+0Ce6kpE9qx4a9RSVJXO2LtjN7D2j1XyMgTjVJah3yi/qHuE1geaRxhuULHcWibQarC9lH4Q5UC5RJaRkeTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4xvd4zkk/ON+Sgsr51R8pZB2S4XhRhWXwLFqF/ygDU=;
 b=PXpqBm79PKd6GKWqI2X6DSX8I9K2N/kH3H43QnhzsgXIrSS9gP2pOjsTNYESqRqhOWUAzu0cAUxEsmCBSRW9UX4LEFX3ni5lceLC3ISnh2xPyEGMx/nBBiYuBsiwG0XdmAjCHrCIyt0Xgjl2/EYCBNx8FSurW98P8lcjBlG4MUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:11:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:11:09 +0000
Message-ID: <87v8ldho43.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/10] ASoC: dt-bindings: audio-graph-port: remove prefix
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:11:08 +0000
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad4429c-2c1a-4039-6a9e-08daf370b8de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LJI4joMwRE0Lrr/Yav2+AskQ8VRGjbcQ364Lzp6Pj0dw6pR6L7KBAUg19O1UNh8P5R4spm7yVH6sRdQaahcJgnGw06bb2wRdJEK2KIOInVGD2ri4mELrd5GdAqcctzv+LK4fVKh/j+pzBKg0BBWtHcSGh1xlKwfPS+9tEROqBme0ZCvqo+0ETwymSEa0upXRWn1TLPaNa1urgcdZvfyzp/U4rjs005XWVGbOmhpPGJRYRQK9oLnrVoYTQ5WX2sKJ4s/msCHd37lIMJIHkpeKMdqsYeDfSLreWRfmHNP/rdsJXB3mHwgKqfCBOjSp2neaZ+swVUYR7k8ZUjaBVN1YqKzclmSYJjtgmbCZS/vNeVR9lwp4G3UkSm4GGr7uN1021LmzFq5zBuB5oDbLEDd+OhLdF1x9aHg0Z9fQ/WQhmD/c/iw9dvwBnMY/cKtp26/sAsQpzKo/xzjbxun3F6H06T9i8CiKCt6Pl+6Ty8Lpeenk5IJ+I9CNlnyOgKIi1z5rycwFhxOcwLL5jbhTlD2BoDkH78bUgaAM9Jwy2cD7pFnnKhsmv8S+kgSh0NQOTsV/UzPHDoJna71dUUzvog/pjmxZMZitFYbGPBMxGV8xUm5m+A1KQQhSUPcU72z0aNqWm1iQlA7z4Pu2cb2LmfUf8678GiiYMNqo/WtL9vuIeOhynIMZ/Gf488X5Yoc+flR+zRyJeEzexHoiyZQ5sxaIFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(4744005)(8936002)(6512007)(5660300002)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X9w7NK43yZPgIx0nIo7PRk0S9jfYHNmsUkmKyX+OR+SMzAn5VGhmpcHcqBfL?=
 =?us-ascii?Q?k2kRbHdovSJAZ4jQoIFGBDD1wVKWqesqkpv0dRVX/JW74wYo+fsw6LJ/PEV+?=
 =?us-ascii?Q?1/IewvF/T4XNIeY4jHnGlM927Ud9+m3XIrOtQt+84IwX40aAGEyXIKCKF0Mw?=
 =?us-ascii?Q?Eh+tRNgSKTFLr7cVw4lc6cdtnZo390IBj2D96k5V5fgoANewF6+hR3Ouww2r?=
 =?us-ascii?Q?pfSGLrpdqHCmvx1N2e89pihlLOMWnTQ+3ZZPkqz335XlzDWxiMsKiVxCo0aj?=
 =?us-ascii?Q?tZN2reU8lyWBBA4umsoAiTkAqFrSDs2atZdieV9qIBp/Cq+cjtZShkQswwuB?=
 =?us-ascii?Q?LARd3StWWQm7r5mlIa8jPGaWgZDDXuBMGK5peyQBpqdZ78WHe0fCZ+DUPj50?=
 =?us-ascii?Q?NHXf6T19G5nff5MzPHfEJD323/LEihzxzo/qF7fTo90gUV0C9A3uXNKhKP/x?=
 =?us-ascii?Q?Tq2ZQC3RFqPJxR2v+g2KwE9TWFeL6pjoiucSk3FikvCaPdxXYfCn9KK7xGKT?=
 =?us-ascii?Q?Myxgpeh/Id8W5T0BikvPIeN+Oxx/PX/aOlW5vxGrCCGXP5jjFL/qfcVTnsXX?=
 =?us-ascii?Q?Wbg/PYfD3gDOFXC78zLaLPcDycGZrLfjCYL2sfte8hxXoDigZU0ZIzdw1BNd?=
 =?us-ascii?Q?hQ864EWmxOfeV0YZNFBY/NAAH8q4abwUzP56nntXcyL564CbjyBWf9cxqah7?=
 =?us-ascii?Q?UzBCnYmvIiF9HW/XW0nO5ogNTfbi+uKnr2mFHuvJNu85ScyBsWi6s0LJWtn5?=
 =?us-ascii?Q?ZFFq9CFISN1oXk9hvjzr/L+cv3TzlomXyXJIJqYq0xJCfqD3+F74cfSI4Nb7?=
 =?us-ascii?Q?xxfrD/CAk44tw8emX9vmQ0odk0Fxd9zWQsT+3C8g4+wq1vhjviPfohKmIv0N?=
 =?us-ascii?Q?WF93wVKMEXi/q4n1dz9o4ZzFuJFuuSi4V3e6TtMGCitkVWJ9L3f0TY5nnFBu?=
 =?us-ascii?Q?B+a8quXNQFxQYDCgDPq14a1WBYrUpY8iyXP42pu/XehMuRZH1lGYNaCbpEyz?=
 =?us-ascii?Q?U4UatMz4LHtg1ZJxYX42ZTLYJkPP7kWx5AQHxbUquO6zDsMRSVq2NhZmVqh4?=
 =?us-ascii?Q?Sklxllws2o2hdLlWNFZOVggbYmiIyFtB3vbkqHsTD7OIxAz2FhMWNYESffV5?=
 =?us-ascii?Q?oJ0RQDkmhB5LienIdaV4ImTR1iJk94iSd4YXsfKedW+k0qBsy5VfmWnlaOtK?=
 =?us-ascii?Q?z+oxmYB+FEfR2BmAEqlBCtRHTknkHlUk4YEUM5xhwS8jh8bcQjZ8c42ZSsBa?=
 =?us-ascii?Q?GbIc95cl3wDpuCvywSgkyt4uLPXEO1dLfm5fWcsQzpMCEIgIpQYNwqBXRHWQ?=
 =?us-ascii?Q?qA/V5KRRpEpasDUGW298qtgq0jzz+6to5b1nnJtUgvjiuFDkxG3VUf6bSvyx?=
 =?us-ascii?Q?3lfnfBd/YNz+8wc9E1GDsdNekgQ0R+aKZxf6Tzx2/T00WzX8RVKvo+B/EOuS?=
 =?us-ascii?Q?j5md4qIMOjEUPF+LHlreGQF8+OjglaNRD3m7syZmwHh7a9DyHwyK4NG+05L4?=
 =?us-ascii?Q?Grt36H/tX34izWBZRQjza0FgsUZ+mzYHYiEOlDp6EEH82O3oHEam5ullkSLE?=
 =?us-ascii?Q?pTgSfsafgGvSvoJ+yNH9UgFpXtsrDyFCeP/gZHI3anR02bbVQX8Hc1TVMLlt?=
 =?us-ascii?Q?BSL8dJpipK6cWqwwilsp2+o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad4429c-2c1a-4039-6a9e-08daf370b8de
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:11:09.0598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPfURae1CcvnYWd2OADGuTdU5cDeTju4Yoh9jFHSbfQsPcxPh3JJ4UHR3qYdh8xmHp8tEFQ7tlkPNcP3x45f4ieVYYXab9B+b4WGMfuvrKgE6qvuelRZZOprI4WxJN1I
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

Audio Graph port doesn't use prefix.
This patch removes it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/audio-graph-port.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index edd6cc37118ee..6b4e02a0695ad 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -15,9 +15,6 @@ definitions:
   port-base:
     $ref: /schemas/graph.yaml#/$defs/port-base
     properties:
-      prefix:
-        description: "device name prefix"
-        $ref: /schemas/types.yaml#/definitions/string
       convert-rate:
         $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
       convert-channels:
-- 
2.25.1

