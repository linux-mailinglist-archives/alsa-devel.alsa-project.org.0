Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31667D5FEA
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 04:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C631F85D;
	Wed, 25 Oct 2023 04:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C631F85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698200626;
	bh=Ab5X2HQ60rNtQCh4/8KHmH5NGP/BZoFfFpdRGnvTH3A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GzbcaDKsRve0WLBgP5WrilZQff/9jdyXkNlmCDBsx89C0eEqlQcgWd+n8CIqtmDlU
	 GUMf+SC1VfARgzefGAnjXwz250dpD9z3qFdcOhmzSI72pZrCRYipv3fuwqQg1HQZJf
	 kGd76iRcBmYiT4WeQ47SfvOo98GDCUnDOBmPPEh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0B0DF8057D; Wed, 25 Oct 2023 04:21:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 315E3F8057F;
	Wed, 25 Oct 2023 04:21:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110B5F8055B; Wed, 25 Oct 2023 04:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEDDFF8024E
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 04:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDDFF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RwLarmR3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElyfjbnWaa76BvdI+K971ltrYQ8vLypcFjU9lIKy5QzQB8XjlqXT2DLTsXa6+ZQE9SSlH62CBqhW5r5R1l5Dp2wU4o8F+TK3DXh/Lp9W7X/5KvdHTC9QnpdMxwO1SWDohX7HvMrNhCIFFmFp2ECJmqoHQMgLv3W2O4oVipA+AtC/81ynP2gq0eJQVG2Br6/jxTUE5ApHAiHjKNdaatljUUru9utfXbN9Y5HjvZAuwIrDcoQZXwdzYgFspSdlRkU1QPMqb54XJ7LjoskC+MSWR9DlflrVCzIV25gXhJNx1OY6SnMJ7OBiyTPvRpUbPvVc7OWLhiC2+B4T53BYPsZScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mJ1bvcWawDtFDfdiKrmUg496h6QNVvahuspTZO9s6I=;
 b=mgCaWmXpbzwQwC6LNd6OpkNFykQlj+vIaKLvRVaFQB8iEtq3VmMVm6nqQDTu8m9Wn5Fy6zLPajRZUWipdjAD6DduLVXK2x1YRCIB1RQlPTHdZGc5vi8/3o6Cw+BbMcPQIy6djKkfZz2aJmrYlM+9RT0p59sU3Gq2sdc4CZw94I2VOSfos/VVZkaynXcAuvWwXZUvnpWne9+GkbG4fnXUtOyCuueK06jgRIhDOfvHIbb8HnfF3c/4RX0ZvLC8dzhR0mDeT65uFOgp/bnKnmA92u6X7v1FCFlhSP6SSA7wApxmjGqUQ7hfGBy6YIgAfjfz+OdvaoCYNNFNc8xT9v5JCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mJ1bvcWawDtFDfdiKrmUg496h6QNVvahuspTZO9s6I=;
 b=RwLarmR3AnClcIk1YNy/LFdnLnj3VQj+/SxRP1TQGOtAYDdTlGyXjzla0ud3Sf15+EJ9zSlAtY+vgaiV+V1jk3rZe6p3LRh268N2uGRAYjNpHRaJ+7A/EmdPCg6imO5Oth4jzKTXTbyAuwOY+T9e6nJaiJEeQtXJ8rpq19InOr8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10372.jpnprd01.prod.outlook.com (2603:1096:604:1f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 02:19:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f7e9:e682:d78b:f55a%3]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 02:19:13 +0000
Message-ID: <878r7rbg0v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 5/5] dt-bindings: audio-graph-port: add channel-map-index
 property
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs1zbg2g.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Oct 2023 02:19:13 +0000
X-ClientProxiedBy: TYCP286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10372:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c25774-256b-41d4-d619-08dbd500c7df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JkE+nNrKGqsscd2wK2VmmxOhflqU4076Id4mVcmn9wzKBPduT3KgMqFM/15lPb5W4ndH6JkqnfPprcnVhXInbeq1ORF24G8X/55j1WfE4DfpznmlMUfPSrAZ7RqiyJ5KF/o+RQhpP+8dVYxgE2PqzEJWfXjbfKp0NuHISMA1phJCimsE3B9XKnsjPpteaKAVVm6Omn85Ke9s2s6b0FDNpdlL/cLToWKlMkycyUY/deUVwk+2bty2wC2QLUB9CQoFNTsATDfYuFb+eVVl7yP26pzUllyVRX0dZz73mGCYkdv31cdqgTGdUX2E2xcWcW/CoKU8Gk+VllSHM+xFjYm9p0iQOpi/E7Tr3wh98ueJ/RZryPUe8YDFjqcFcfM0VwcNUBRsVbXMaJz7sPUv6fbLxafmyxMQCUCxFZy37vyoRHM4LYP59dvPQ98WsU2mpMCTh7Saj8rYu8zav4460cu6EYbmDxgqWKtruSDj58cEc84iYU61aIR8x2ii+ORJl+8SPw61o1ltYTcSnjbho7sqOKWSvDkcNlxgiDr2JWTWE6kXFnN9LBEONesEi97wyFkmRLJS6+/RFMRHdF8TUgjvQXcc5faJCDwD+HNL5TPX8DApJXsdsoJp1FaAzWz2ps2WezgxQUj2hwJWaFxdLZSKDg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(38350700005)(2616005)(41300700001)(6506007)(52116002)(6512007)(7416002)(66556008)(26005)(4326008)(8936002)(8676002)(6486002)(2906002)(5660300002)(66946007)(478600001)(66476007)(110136005)(2013699003)(316002)(86362001)(38100700002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GXtYAxLbPHy8ShfKFWX68GkyFVTItJpCfA6rYr6RxEP/n3MGKtux87T2ABQg?=
 =?us-ascii?Q?0QXDrPEDh3XmJO100Vx6G+psx4keSWLR7wN2FzzjW8HrdYW5suVAX+1dq1XU?=
 =?us-ascii?Q?JBLMAkbWrdLuOqaApet7SvZzH1UaUTMsCyb2pcvZoHxYZCjb4ExF7JgG1QEO?=
 =?us-ascii?Q?Xt6sBwyxUa2IRpfdgZ8UFOyNEBhz95gBrYmaMJ9BDXDmzGl0mspm9bXCmkoz?=
 =?us-ascii?Q?ohUffX4lauUwjIggivZ3tvaY4IBGrnj6CcDyRi65qsvdtveHz23a571DJCqL?=
 =?us-ascii?Q?Bz4gBACmCL3+rXyfF+vpsLdCvdpC0oeTt+VLk4JnUC0hHWA3n1atbvq7aO2x?=
 =?us-ascii?Q?WLQBCeyRPZlLdiJbwXOkIDBlavJOvoBXETioes+eGzp7FdKcgGXvcIVCLHxC?=
 =?us-ascii?Q?wqM7O5R+hlNosyGPb2hWF4Gdy7VoykKeuwh2noVKjEgCceW0dtzbFAi7dKzP?=
 =?us-ascii?Q?GoxMhzf7jStgLYzMwJwconhnAd5GqcskxDo7wu7WeO3vQEBs+yeEaF4FIvn6?=
 =?us-ascii?Q?An7rO9sNPR3nkMlwVi0mV1+JEZW9kOcwd/eezLal57ZC1W9FFAb9GdxeDGfw?=
 =?us-ascii?Q?0TnAeynAVMUPb62O51oO3ngWdj395Jg/asqj9AAna4zOMZYDy93l22AvrEqv?=
 =?us-ascii?Q?o6ud4KRRGLlM9OZgASM9ZvSY7pOJLxH41aRezg9iIk2VsAVU7oYeHCQClkcT?=
 =?us-ascii?Q?LT5k1lCoBbWNDYYfgYGQfSMVzQEhWc3LUpdz2YVJo+iev0KNwoMS6xrLATRq?=
 =?us-ascii?Q?O9Dn/5YtdCNPRSQRrnSSjtFRaj107VLRWhffNkXNdNXfWp2CFd3SZbafse/X?=
 =?us-ascii?Q?1keJo65pV+lTtc4415rsYGkCT/6WoZA2uakrTODE82L4iiOvcdXuCid816/8?=
 =?us-ascii?Q?nuF6mX2PnNgDjOj88hPymJZCIBPfBOO0Hw+/2j8oniPNWx0+O3tP8vDEQiaR?=
 =?us-ascii?Q?qFwlfB5PPDymMnqxzNfCYyaacTxnR7gOn5SoTRMqd9TAvMcVQl05hbiu3J+v?=
 =?us-ascii?Q?Gu9iYKNy+muZufEtf7q7T6mGbKE+dtM7B0mZzHifnveRl5DVqr4G2oG00kif?=
 =?us-ascii?Q?ojsprjVHGIDCt2e7NhWEElEygHbK/KC6fulmUgoZaPdKBE5LHjGgyVl12cBD?=
 =?us-ascii?Q?oQSyB+V3c0NDrqYa94+3Ra6Z+uiIbYgFBqESgzZ2qreOGkf8DY6SB7/Cz6zQ?=
 =?us-ascii?Q?wjVCxvWJIVvHOhCYwFMSJmsavzmS5Js75IXeHxkCOdxbRF2K0ziNTauq12d9?=
 =?us-ascii?Q?PK6g2AiDc5Z5mYHHGAzKtvlLyjJav0e+gd8B8k+lV9ih7YffKHbLJ8Ybvmqe?=
 =?us-ascii?Q?w1SS6roMnFL4B7tuSXQ49fY4d4/cCxQ4o1zpyYZHJ38aAjnZB5+tjQw0fW5I?=
 =?us-ascii?Q?7q1ZtcV6T8SMxOIk0HEJTpYkGtHFK51NKOMxdf9U+wOBXFo8ND2Z4yBvXiTk?=
 =?us-ascii?Q?wsZA082cMi6gEpDAeNhvX26m6A8+Rbsgsuhd4L/K0JQbWNFKLd8NH7klDNVq?=
 =?us-ascii?Q?KA4495fgP/7Hb9VtijCmi9noEv6qvAlquMGfolq5AwW4SIBMlmAoVyekK/MR?=
 =?us-ascii?Q?byyUIkjUsNWwE70Wss5JTwNttzFWKOQH8rvq/cIWxLl4ntIkdcpxXmvBxGn3?=
 =?us-ascii?Q?/tP9X96sr0/qaSyVaZTpULQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33c25774-256b-41d4-d619-08dbd500c7df
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 02:19:13.5508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eUd12t9y883Q04pi72JFATr7dnDfor/F9xTBfWZjmOEfkpL7hA2bG2SEdm6Fl9jMp/JbbzYd5IFLzR+QLfJIqp3GlSJMPJTPui5fPQuIT+upOwaY1D/AdID7LPUw3vaU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10372
Message-ID-Hash: UXBHHLSFXIPLP5K3CTN2FWFD5CNXKXO6
X-Message-ID-Hash: UXBHHLSFXIPLP5K3CTN2FWFD5CNXKXO6
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXBHHLSFXIPLP5K3CTN2FWFD5CNXKXO6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds channel-map-index property to enable handling
CPU:Codec = N:M connection.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 60b5e3fd1115..2a7e0784d591 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -93,6 +93,19 @@ definitions:
               minimum: 1
               maximum: 64
 
+      channel-map-index:
+        description: It indicates CPU/Codec DAIs channel mapping index if number of
+          CPU(N) / Codec(M) were not same in one dai-link. channel-map-index is not
+          needed if the numbers were 1:M or N:1 or N==M. Same indexed CPU <-> Codec
+          will be paired. This is CPUx2 <-> Codecx3 sample.
+                                   CPUA   { ... .channel-map-index = <0>;   }
+          [0] CPUA <---> CodecA    CPUB   { ... .channel-map-index = <1 2>; }
+          [1] CPUB <-+-> CodecB
+          [2]        \-> CodecC    CodecA { ... .channel-map-index = <0>; }
+                                   CodecB { ... .channel-map-index = <1>; }
+                                   CodecC { ... .channel-map-index = <2>; }
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+
   ports:
     $ref: "#/definitions/port-base"
     unevaluatedProperties: false
-- 
2.25.1

