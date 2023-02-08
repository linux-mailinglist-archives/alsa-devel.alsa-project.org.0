Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B7968E57E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 02:33:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3230827;
	Wed,  8 Feb 2023 02:32:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3230827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675819994;
	bh=dnblfIOAXKH+Lxl14VAOWlc+AJjGernReZ33lV9h7Cg=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+bY4PcHMqUBEiaQ1AHFKGXeNEL0xgvO+9y7SXr5SQzQ2s8eqr1emTwCMytYUuwpH
	 9IZUqF5Q5otthsAR1d0vR263yGg4CpSlkdenKd/2L67vqbcHal1O6lysB0GpmyGegc
	 jT1m3Sj/f/7PNs42MAPK1BfdcmWel+OT9ESjrmRQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3350F804CC;
	Wed,  8 Feb 2023 02:31:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CB86F80518; Wed,  8 Feb 2023 02:31:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 386F3F80224
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 02:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 386F3F80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g+FgFlbE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBHig+ZJTJvRIaw8UQy6O8o0AK/msTg4DLlxc8Rg63eY7Hz6E4pDJ2uadG7nzoREob71ZJqHWoxJGdWIRHIGMaXPirhy0TCshhgBy87enLQ00P4ekQMO7dzZamYx4LXwb8U+lY+Oh3NuhtL7bhweOx5fvygVRVeYu3U8M6NxPcS6mqIQaURqJSDewTamjZ3S+xAK8udNdHbH6HT7q7tTZv3qxu2knQRugNlALCZYGDB06WQfEyAno+T1doTV+x388S+xqIzCwRs0A3YwOB0WwNzEo1aUfHYtuqzauUezNwJ4FSTVRxJ2OB1GfgdvLKrjaM12klKRiiOSIP0sBaqTOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXwV/XZg7kLeGjYOFU/TUnwNp/J3IuLnh0r3YXWptLI=;
 b=irhVQE0Xf24EY4HwHcQVvSTExevLORY93TdJ7JRDCZa2Bxur/bolVHdmg6+fNANTTCRJzzCnwt3A8rp13wRKOSwIzladJcMdHKFMQgPliYWpAQrCqhRBtSFQy3V+eo1V2x0MPx3oY3FGQWSlvx8JlRVeHcC2DiqC3EnhpFmfk25zR/GOQUC79G0XLG5jOhZJHkmlVrn2W9irTMOwhfAE5LVcEAWR+Eb/24uA61KeHOlPrzN7gceLs+Ptz+A6w29GeNqP4lXNacWaQJ03ICJHXIekDr0mGLI4p8QfmubMvwTlW89r4aOfVKL+fq7gB2ZTK+yR2Is/MhvjipWk7xc0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXwV/XZg7kLeGjYOFU/TUnwNp/J3IuLnh0r3YXWptLI=;
 b=g+FgFlbEZ96ivSIyTvUqb5GA5A/nbq1/qcwGo0KGAiNm+Qp+Pzxa5Bj9rq4KgdFtCH4C2GYiOzoR2Q4xFM4fufFB4SYvVohccyfIBA+KLXG/C7BdqCm+Da8WFs1N51f3BEecHxARAsV2DDReU+lXwm21uMIEO2Mj5ktAhblnFg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8702.jpnprd01.prod.outlook.com (2603:1096:604:15e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 01:31:39 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6064.035; Wed, 8 Feb 2023
 01:31:39 +0000
Message-ID: <87pmalt01x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: tidyup reg/reg-name
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Feb 2023 01:31:38 +0000
X-ClientProxiedBy: TY1PR01CA0192.jpnprd01.prod.outlook.com (2603:1096:403::22)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9e081d-f02d-4aff-6ab6-08db0974398c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ADSN1zOiBhmma9ddvskL1wlOhKqpkODL0pwVNr3vfdLKzUEh08EoKilSvXlARuW86tW+RSw8wVKymeTyqchJSE0kk1fzhI6oU4p005tZgkZUvpPJU8N/7R72AyZhLXQs9BiGpgOwRfUdQgXBr7BdbJcbuk7q40OIOVrS71S0Ux2quSBQubCmVnmCSGhZg5V6xIxNQV4N7BGdOo+aikbXqxBWDxKMgW/U+5RL5e25COGKwLXJKFnpzYjf2zHvib3IQLiB1+HaJKaUoc2jUK8YN72GDHml4CK+tUm3YovSmMfcZJHyrZJruXojMxGNZ6yGVfLZ3NSkEj0osvPKelkaiNCH8DxiyloUIhNLWnQqDzTyhq2ehtsFCmuQM4wxP0nLf7hrq04u4Zw3rl8JhNH9qg2Kj0iexvXImJRT2qnpPFRvwnwKhH8wNIb8vYhuj8tyM69cahyWLpl6SftcUQkZ+PS/CucH4ieW98PzF61jxNHp9zV/kJ7T9QUzRWum/SrrxOQq9AyaTn8VqjLEFmV5vgdAiF9t7+E0Sz2dwjF7dgOyr9iE1QRn4TC+hIAxxC5YA+A6/ZFLODAJ2WK4g05McuSk/9wqlEYhPf91lZYPmDjQBq8jnYipWwmm4O6lCA1L9retMJjcj1OkLL8E12r4VQiH9aB4oz5PA5hx8Fkw7oK63QyTmfVyA0/eGDaENDr2yEM04AXD+52uWNaMa214kKKl4D7VT6RjcisDxg3LO+Yogzbeo/yeD57mU7TqWJbDDG8XriqdcIT0SjDXQUrl4w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(38100700002)(316002)(83380400001)(2906002)(8936002)(66476007)(66556008)(41300700001)(6506007)(6486002)(66946007)(5660300002)(38350700002)(8676002)(478600001)(966005)(2616005)(4326008)(6512007)(186003)(26005)(86362001)(36756003)(110136005)(54906003)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x3qEI6pAQXScDuMywgx2EL5JNE88IcbB58BP8PuEAzYQl9PokhJntovbZ7dR?=
 =?us-ascii?Q?ZTUb803oO2hBox1fHcc3s1q7rGb/1YX57+ZzlWU4jdgUE9GCgguAK7rVbxIw?=
 =?us-ascii?Q?btykgqtjZrO8QwTclZCpbCDdFQTCwnWXQ+HcjI0Qtcur+tXTEknsLe/W3Bkh?=
 =?us-ascii?Q?nFc5tQ8cFT1ohEgpK47+fAiwdUhVLmtDhh1xrxnzhoS1Yuxgh36F3ZFGprgm?=
 =?us-ascii?Q?QlNtJ+cQZC7GKA6xEd/0PnL6/sQiA79dnGIrOLR3tjrHs8TSX0zEAtzoFkEK?=
 =?us-ascii?Q?BxY5TXELSjw3IHDKkHPGWHRnurknxu0lbtkcpkPmMY+RL08YL9l+BkE/6Y/e?=
 =?us-ascii?Q?jyyo2X54GlAHIIxcBb2jB+T6bjBNlYO2yTFlwqS9BLmyFx0onnzUlT6aaCW0?=
 =?us-ascii?Q?vQu/fxPwXEOu29HLogUQqBWH3Q4eDdt2r8wDaqK0MFZPorcGL/EPLXdrOl2R?=
 =?us-ascii?Q?Mj8I+mFzO6jCO2uhgq/LFOr1DnzpI/MjrKERzmiiWbwS6MryE+jGx/IdTAb3?=
 =?us-ascii?Q?hKOVVjsHwRIebuDHL4U+3w6LQufr40GfTCTaLFfcNLWNonN0XBlywCRov+Lj?=
 =?us-ascii?Q?cHeYwcRZG5F1v+HRzE4lo7tycPVT00fuAqj6GGlPnuvr/sFjkJyu2MvWcJ1V?=
 =?us-ascii?Q?EZB6I5dfzr+fBXRzVp27o8kFc5YSqk14nB0kRbbrLWfoNQFPtTWGKbEhlJhs?=
 =?us-ascii?Q?xJkiup1kKFN878FhJiGYOwkHj2AfMJCA0vok6NYnuBa7NNJ7P4gfowaBOR+y?=
 =?us-ascii?Q?af6vTNJlZOlJ/sNU9MKe6pUQeAyu97PUVgHKiNHSeL4tc1qRxGzy0Wi0AUrm?=
 =?us-ascii?Q?dokRYLmGn5dB2htei4P3q/7yGN19utBJv7QEW04AwDM57mgA9CV4pWris1km?=
 =?us-ascii?Q?EgUZcyudDokgML9hsfLcdXC5Ou5uqKnqlc2in/jVDD/OL6XLc85XPR3nCFMe?=
 =?us-ascii?Q?x/WACVibqtDEdXNXPAum1ORqd0jtHOMCzql55IvRLMiNqw8o79TOXsaG0P/S?=
 =?us-ascii?Q?9q3FbJ9s+EhCt5bfV/rZOMYKAS2xnQ1vYIEPBlY2k9+vXViIHb77MLGnIRDK?=
 =?us-ascii?Q?m30jXXdElbnEG0F3ltQVIpzPz6cmRzUGEiMrrcaeenKpbIagDtzp8KQyzrq6?=
 =?us-ascii?Q?fbUkHJ6JuQTF7gBioupf4Eozwu4WtkaudrA9da20TXL2cMgGVLBEuGDIWZP9?=
 =?us-ascii?Q?5d21eSESIvbAn2GBfLZq0xnehrhUXiNJgfFcx6io5ULXnKfPwo9CmpUCLFuw?=
 =?us-ascii?Q?JbzY1PV6LmQWYJMBfGG/enUJCH2THoYv84hbysmxUFSE8X5mTzUth4B8cg4n?=
 =?us-ascii?Q?DOyPYu6T/KoC+NTtzAFUSHTcWXZLdKdw1Jbk/DazvN3GazM4KPKzgUvcRS4B?=
 =?us-ascii?Q?Q1uJNTCNLDx50NpHyKAMMb2/YIpn/4hUx2CZW/R1+g+z6YuTYWrt0tqsq4SO?=
 =?us-ascii?Q?Kfs/KuiVLumAuubp0eC2dp+m7wYuh3kHrd/rW13FSUQ821I4HRa7k8KHGFXu?=
 =?us-ascii?Q?lvHDHPYCNSHbjoIygERcZsv5wb1HYrf6fBE53bFXoB2ZcrggRQT4CwZgBUqI?=
 =?us-ascii?Q?olYJFji+CWEuLA3JDV1Sc6Sbueyj6LR98AV/JRKmWDZ5QdZKuhHzvGC9A3AN?=
 =?us-ascii?Q?s66Li/u6OhdvjwwUJAd0Vk0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f9e081d-f02d-4aff-6ab6-08db0974398c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 01:31:39.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ew0L8s0bCOYffo4piq7GC5ZXY56tk2XYk5VqLAD7cHRhuP7EBVC+kXm/3n/0VChBABoTpbqRXPzNxOFVQ7adOfOyUYUbDuJkYlkCPTln6gsGtZiZnofHB1066oHFfyTM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8702
Message-ID-Hash: BHGHOC6GJUHIO7OI4KQ2YULJPIJGL4I6
X-Message-ID-Hash: BHGHOC6GJUHIO7OI4KQ2YULJPIJGL4I6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHGHOC6GJUHIO7OI4KQ2YULJPIJGL4I6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Tidyup reg/reg-name "maxItems".
Pointed by Krzysztof, and corrected by Rob.

Link: https://lore.kernel.org/r/46974ae7-5f7f-8fc1-4ea8-fe77b58f5bfb@linaro.org
Link: https://lore.kernel.org/r/20230207211621.GA4158591-robh@kernel.org
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index d106de00c6b2..c3bea5b0ec40 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -300,7 +300,6 @@ allOf:
         reg:
           maxItems: 3
         reg-names:
-          maxItems: 3
           items:
             enum:
               - scu
@@ -309,9 +308,8 @@ allOf:
     else:
       properties:
         reg:
-          maxItems: 5
+          minItems: 5
         reg-names:
-          maxItems: 5
           items:
             enum:
               - scu
-- 
2.25.1

