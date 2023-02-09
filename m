Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB4B68FC9C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 02:23:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EFD184D;
	Thu,  9 Feb 2023 02:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EFD184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675905782;
	bh=6FmJJ4vuUhC9nX31WH5aJxVAGYwTvn48Ki4bX27U1Iw=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QTBm2+5u/SrPGrjnscrqtHYZ5j/vi5s2wsZVBn8nxyj29XCOTbR0/Ml90pmhZQN+9
	 MoC9DNxfaPC+l3uayjlmi+uJBVbDjsSd2//sMFQP4Ijcfm2c72NFirCFn1W3tMFU7V
	 nulNcMXW2hvaH2UOgYQNlrzEeHQKodtEFom0pwlQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED83DF800B8;
	Thu,  9 Feb 2023 02:22:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7B36F8051F; Thu,  9 Feb 2023 02:22:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA79FF800B8
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 02:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA79FF800B8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V59FMDSC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8Kv3ae6TxbL9h+XigOEkKMU+ecENghvD4oRBqEN6vFDJ1jOmdwAFEncH5Mxqu3fLQCep4XlCyqZy9UuUWkXgfwpkfoVk+1AGIytFGZsCTIGWwno1ZvD7nnIuIenxYiDDsPdQ2c6VXOOalFvHwtcchmyta/2Cb4YRFFPAGwsRtfuroIAj8YkWG7F000aGdJZNhXlftF2jd0yP2WkggSwek3rJgo3rQV82jCeppb3ubsrnlHgb9CFIQJZxvi0u/v5k1bJL57T+I8oPNc0s7voL8R/oFHtRWmSaOllmhKYmoXuWtyrU8/tiOQqi30IdbS8BFiRvJub3AOOBHPL1lYyfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btCNNo2ewcHcCu14f+Q/pP6JYSpmdS/brTmRvTWdOLQ=;
 b=PNBNzwS4GiLvjIePzuLPTy6qWy5d/9MGnKSLbggEyBt+8QnneHSUAcYPA28ZP28YuerAKWWguPRfUsLdizIO7L94RSRozq0SBvYosR9/sA9sGyiVHFobxTZRAbtXVxPqeJRA5ryZuwEhoV9N65e3ybyWSMhnR5rVRM77UjQKqaupyjBRcWG4nZZSw8Z3cmPwVeIlZtC/Ki88VPMyj+WSQMUaE7zTmpYtYkUmhMLMMivpIASyE7uasZlLMqifc8z6rp9fO3V5hlcRXDad5ozrlZIcwcIiLE66Wl3ljFw/8aHPsuI2CZDJabaPcUrBq8igqWbPWP2cCeeYUKGGp7cGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btCNNo2ewcHcCu14f+Q/pP6JYSpmdS/brTmRvTWdOLQ=;
 b=V59FMDSC2jRFDcnao3z+huRViMbZ6rVUpZtTsSBHMRk7REbC+ejdDaDT/Ps9DueGwsR0HaBjh8tlmri3NS+9hmvN0BLFP9YRwuG9DOP5g11cmAkRjiVR2lgpljbZSX2xi3TUebH/tW2LXinKryyx6qXBOO4iQt0MGpyon8/X25s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10476.jpnprd01.prod.outlook.com (2603:1096:400:304::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Thu, 9 Feb
 2023 01:21:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 01:21:52 +0000
Message-ID: <87wn4rbplc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop
 "dmas/dma-names" from "rcar_sound,ssi"
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 Feb 2023 01:21:51 +0000
X-ClientProxiedBy: TYCP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: 52417832-ad70-471e-1985-08db0a3c061e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VBaoCx4vvkSPmeNxiIq2CJCvXgROXiT+rzxzxM8ef/+2gT8yI/0Yn/mkKPBCKeNQ22220Fca8NTd+Rz2cmGiC/GekpBfBHslhdURR/6ciiOCbz5BYfEaei4rmcCvd+fez/AoskyfZy6oQgLOqkiHoKcphEPKj7tM8zSOmu/dhMm0e0CtdFZc3HqzS2GVJmWk4+wQD+0sJjiCgEii7q9AuGoqz2VHHCrMbzELsmGvRBbEpCrdtRL5UlPZSTvJE1gp5b3ODlLi739PvmQNNni+Ama7L/ByTQrPta/QpbuXMut4k9LQQmtX42uYfwdKfP0BVd3dgj5ZiGdg0ALpcqQHp8q7zrOBZQuvTCSqk3RNEekT0Gy1DheHlqBT+LP1EMXI43dIoiCsCDXdFdSaLb0fM+TBxSz+vjenqNBVPkQit61gqsVJsJvAHZ267md9XNMbeKnuPURXcclhnKYDGR8tCxtGE/x11TVwKfdhwcACpyanyiwt+mC+qfhHXtTL6w13ToKNRdAjf2jbj3dEsNmzfiEWXvB0+nk11ateH3wLYcTM3uniuNGoBByz/YOpB8q//yxO9AL7szmtZKYQEgF3Ewg6qc02gbe48cG8f/eNqCkv+cs6iQykydsJ4dLM90+yzHhZHvBgIVP4sN2zoyc8theRy2OJYOJsSlCyLt8GdjkSfcI3cXdkN7SQKUnjh+q2depPv4A3LygtGENe0Zc736+nN8jVXKRYys6R6Zzgpi2g4TaWSoigyRgFUp0Rvg2pjC5I+PK2sl9zomNComyGRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199018)(2906002)(36756003)(8936002)(5660300002)(41300700001)(83380400001)(2616005)(66476007)(66556008)(66946007)(4326008)(316002)(38100700002)(6512007)(86362001)(110136005)(186003)(6506007)(54906003)(478600001)(26005)(6486002)(52116002)(966005)(8676002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/H8skq6l9aKJkHFoz4htM5lqO0qX3ql+pwbCeIKuOn52FDBSPAnUYw6bFOpy?=
 =?us-ascii?Q?EOwulEchwfRID8ikpv9Y+A4iFcx+K0IaELF0G5BhNRLhoK6frrvvkXRVFlX1?=
 =?us-ascii?Q?J/CdRRZ4rUIh+pSkvme6AFIv+SnjkcmEDuCtM2GRN/MhjJLDVApKpy7bMBOU?=
 =?us-ascii?Q?A27hHt9I7LjZpggk69fqR0+iW8H93RVxEqITrTipjjrO24odJcAGX+WoI6fu?=
 =?us-ascii?Q?gYg71DDxr9F3GAdACGvgV7KkIibNcoWF+ehpZf6drOdeeB1wHOzGDJ6OoKgG?=
 =?us-ascii?Q?TUeGDZTYfElVZjUKy60qAG23h4JFWlqRVWcAlvstORO/HlfEYjSD+zEjP/Xy?=
 =?us-ascii?Q?mD4Poh2nvpDgfOTEOoMg4cuRSLS0SnbHdZCZS3Ehsre7uyLmczqnSs8iIus3?=
 =?us-ascii?Q?aR4uhzHs7IRlbvT7NN12ntAwToTrkgxegKUpsWw+LsS3Jq5Yms1AGn8PdfK4?=
 =?us-ascii?Q?tv5vXTxqzRgd7VW3YpLrpaomtRSecWSkOm7C33He7Blty5gLuzVLjWQNVjOO?=
 =?us-ascii?Q?z6bYZzD0P+9r30NjkD0WytQIbMsEyRD6hseClK9H9t1y7ecKBUgOcShaf0H4?=
 =?us-ascii?Q?qXlkgaP2xXsXeb7QK0IeUCQNhpEYuvyjs5lC7h+pn0wSB5aAaVF+J7FrXL4T?=
 =?us-ascii?Q?Uh/TGYTh7AgCSJzWIJOMFF3vf/lmpDN9x81dP5TtsjPJLwJTrRQ9541pMN1+?=
 =?us-ascii?Q?9BegW5qiyiZ1m13tBPoFzxdhPTG7FL+dinQBJDP2rfENIQwfsiOr29kCoFy+?=
 =?us-ascii?Q?Z60X9PsThT/r+fwclp8oCFB8/roPDirRjVsf2S/qPOl1YrNYp/xMnnEXqwYM?=
 =?us-ascii?Q?DiJK5rvf6rPDIy+UhigyCdPb0MBGI/B8+cjIgQjhrjazl02+mttINNSG1saU?=
 =?us-ascii?Q?DDii4hwb3ki6IsR5MsxuHnsYnqO8fICwr5MDFOTAiw82dX2R/jIouAGQ+30L?=
 =?us-ascii?Q?J6a5QKY1PZ0Eco6xo6zb9uurDtWSFnpvE9SnTuhWnlOg5ViId8yv/MO7Ie+z?=
 =?us-ascii?Q?SHS0XluXem8P4yJ7ab3kTZgWP8SVeHbHn4mWsGvgV5HcVwSHBUtZF8/mg/+L?=
 =?us-ascii?Q?nNrvtGQADsCkEWkOdE42aHKhtzX/xnmzuMBHZsd6KR7mx80juJHa1yjGTRSg?=
 =?us-ascii?Q?L5I9Y+A/ViNYfdFF1hVNiIiJLRIU172MmO2tB3PESXbBcI8v2vRGGgMn079n?=
 =?us-ascii?Q?vn3f3ME8Cplr8t2QLGDA8SNpYnWS2uneOOgfvpEdsdxigtirYC2lb/KdsY0Y?=
 =?us-ascii?Q?GhcoHJ/7zyLwjX7lWxrBNbpXyrTxGxterOpifi7hTizHjAb1WiV4440GPw2A?=
 =?us-ascii?Q?ePaUFuFFTWyMY1Ka5QGqmqX7rdkjvHQ53nucQiWmBSnUbsM0+jT6NPZTgUqW?=
 =?us-ascii?Q?EjYJBF370C7VbUMbNdtJxZHRL2H6Yd+f/bytQ44frddvhwXw5Y67CltPMLoC?=
 =?us-ascii?Q?oB9KeYEDxjPsSXWUffmcmpJy9E2c4TaRHMhqDejYfHTsHDSwc2KFopExqL+z?=
 =?us-ascii?Q?L1zXISkAeqb3AEWUakzlbIdOXnD0h91JMmIjkHwhxHM1vmbZyrA7bi0nEw/U?=
 =?us-ascii?Q?ZLWZQF+E9US735da36gfGA8G8byac/docddwITttSNq6LRzO7WX50D6Wnedi?=
 =?us-ascii?Q?o6ln3o72N2bwaFrTyLhTI0A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 52417832-ad70-471e-1985-08db0a3c061e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 01:21:52.1414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rSJ46gxlPe0TPsq/VUXWC3C8MbuBRxQ5F/WWe9U5VBGQhH/sQ+qCC8qeIFfBngTXbiAaCnqigHIgUiN/WAgORFpdwMZsCQfrU22tO7sFeWhi0o/Nu18lx+wvw05zog7E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476
Message-ID-Hash: W5XTICJX5DJHTD3AFEJ5KKO2GYJ3IEFP
X-Message-ID-Hash: W5XTICJX5DJHTD3AFEJ5KKO2GYJ3IEFP
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5XTICJX5DJHTD3AFEJ5KKO2GYJ3IEFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

SSI is supporting both "PIO mode" and "DMA mode", thus "dmas/dma-names"
are not mandatory property. Drop these from rcar_sound,ssi's required:.
See more details on Link

Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index c3bea5b0ec40..12ccf29338d9 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -256,8 +256,6 @@ properties:
             $ref: /schemas/types.yaml#/definitions/flag
         required:
           - interrupts
-          - dmas
-          - dma-names
     additionalProperties: false
 
   # For DAI base
-- 
2.25.1

