Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490DD6650FD
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:13:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E1FC511B;
	Wed, 11 Jan 2023 02:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E1FC511B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399581;
	bh=wsud8JX8hiWbqazbQ3YWbK56T3JjX6I/H1oht5HxSu4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jNYLmuULcO2xLWi83UW2eyzyGB/JLRzi3H3dwO16JbhUMvkDmHxNVBOBZAJNjiDN+
	 5bmLelpOMQV2EVga2N/uux8ojJRCAgiYJ+z7wTs/m4Rrnh1H/4uFq9zTTXrIKAhWrz
	 brkv1R/8WrCJtVvRTmEabKZTq2UPazof/02UWFq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B368F800C7;
	Wed, 11 Jan 2023 02:12:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 745E9F8053A; Wed, 11 Jan 2023 02:12:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2094.outbound.protection.outlook.com [40.107.114.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD58FF800C7
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD58FF800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=c8yHi07T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4ky2uzrn+gsNOwR2w9g7Yq7ySaN7x6G2xkANWlc6/O0dw+80+F4fXfRtL5AWF+HHWtgCBGfINnlkUjSDSzqm6dbkMHuY1D8++mgIVoOHkirzHm0ECF+KOhrKQ5pkkCmeOBzwvNz5fz1fKSTiTbTH0PhPJMtXQSWCTd+UkGgpl5ZdZps9w1CDqv0LEHvhA/1lujUj4s5UNz5CbhKZumAEeNvSU4bZ/qmBc/6q6sHwU8DPs+Cs3H2Q1m+2v3s6ibI+qYHAxraDgHu47XptIj/dqQsLV10z/FD1sB50hmo8as7Lh0RX2xzNyGuymQouxlZTOW8ZRyskBFkzxbieiFUbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRJY3CscDr7Tg33vFTh7uxbUM2MjI5+3Anri65XFyW4=;
 b=MvnAiBl2wbhK6jSe9AK+f1+0mnGKHK3EFtwuYmNiE8rvvd8BHsQ+29RKFIMBrnxCzn2RRc6xOeVzsRywC4nAMk/zHYf6T7BfdrUktTgRQjNSHpzfBVC8zzedhn/cQf/CubldWCivYpGBTBL3GxSX6CVEovVivP9Wk6l6bjIGIhcX/BzAn1pgTTQ6tLvAkZmQ7Ufw0UktLMe/WbokRbPTYvcRQYFmGB/TUH+hcyrypowNavI6dsLEIjKKOYsm099yv9sLWSHYG09w6eI0WQeSQpyh/F1XN2hwiFU0y4c5HgcPLHucqADYr85VqW+ZonWSfWqSEyWEPR61oJYY8UaqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRJY3CscDr7Tg33vFTh7uxbUM2MjI5+3Anri65XFyW4=;
 b=c8yHi07TVZqlsKSHPlpK/d7TJbN4jLygoFxKWzpBRp68ydImk1WyZfR8SiDetYOQ56Qr07GMWNYKK09ZOO/ghgsxpn8FoDE2lQEYJbhBZMFKioJOfuYqm3n3HtGnOi8dWUoApzI1HqSzApO/Pg6hxSpv8bvAxnFHP97Ho8vnVvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:11:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:11:56 +0000
Message-ID: <87sfghho2s.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 07/10] ASoC: dt-bindings: ak4613: enable Of-graph
 (Audio-Graph-Card) style
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:11:56 +0000
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: 49395d07-ad08-4469-a62e-08daf370d52e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 40I+IH4cf2Tv+gjavjLaMGpCiQgxuEBzL6OPk3Xq5WnThmoULaxg3RZbPSE/BFNSli+YSEqqW+AmgwYP2lxVtw31koN+9+ikrGvp5S2L7B7eg9rbSbP30p3Ra2nQEhiIsiKiHXP/6F1rlsx5xipEOB7idPcGEJVwgpnUsDpzXGQBQbWv+SXaGdjzQlLN8Yyq5s+h25yZPcz6q/V4uhOsMzxaEhKIYRrOUiaL32KIe2z/4SsdAbsgFWAtrAldxIMDqUJ2LK1+crKGGDqCb4V7KAsKJ0MS2SjF5FYLy721gp/Ats8KTJorSB1q6woxfusinuNvOztWAaAGWIiv4ArhawcHfSJmN0co4MF7FBIiRmAbBEGM6aTfN2gGK13h+jvOaM12S7pefQFEuq85fbJySU4sKY57tt75HoOR1fwSYAqkx3rEGbwkd45ZXpsn0l3pHnwagB1Ci36YiEcQj+eMGKiSPB2GIV8MdUhrTmpEjahv5J6gdUbnrOVOy3puNHXTWvAciDedGEUaRYAluGcbptDel4KSZEN+E/OvoVNwAvxK5nWx07HWJNjaE+2wmYC3MBLoiSXhFQB9HbTjh3GRYVO/cnwW/NOvqXgmh7B49L5lEPfolw5dJ/fhT/oniB6qbn0x+Mixp8LhmLIRSDFtrfhruI6O8vT3BALs3uWnuKqRlWQcHZfkzvGbf9UKV4aF0JQ0zCeNFPrCG1GkXgIYfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(6512007)(5660300002)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c004lFWAZapKzMxzGO5/8DKBD8FctkPYYsdXzjnzDk9474/v72eQWoTdzQbC?=
 =?us-ascii?Q?Uz72dYK9hxgEp6mABEU55vCXI9itC4aHwrCi+5YvJsRaul4m8TM0EVaOo9HX?=
 =?us-ascii?Q?Dnhc0tEOIcz5mosrf7JbjLkcDWfHJBLRB0DxoXwYy+menmO8+0lBAaz7qECH?=
 =?us-ascii?Q?3/2iurDm5gmy1UfaMDW71ngZToLSzLW0pq3aF2BpQ030jDt2mazxTlCudi0b?=
 =?us-ascii?Q?tUX8C/4eY+bZB9S7k7Ir4pGQmybp/rowmY3fuI07G/HBDRhynyWD1zm07/0O?=
 =?us-ascii?Q?jL0MT46ncmLNzXJjYZZl4z/fZfZfWLOOxkPvTS1GJrhLGBy6SAPvNOLTa9E+?=
 =?us-ascii?Q?/LeJ6D7+8xhEWxdH9RAt/qjVK0dFNybj3j+qWTZi8H+Qfs4bZkvI96nsokSN?=
 =?us-ascii?Q?EoR0Xl5j7y7NiEq3VXx+KOdQcQtdGnJ7BPsQrm824Iep27Shgtcyq0DxLp+2?=
 =?us-ascii?Q?lyJ+L4eM1X8kLe2H8H6CkOhJ0pgzAewsmRBsMQ/doeDJYI6fNe+ec9w+YPJA?=
 =?us-ascii?Q?2hPe+HjNyTv7tU62CjWi83A6KEmSNeoW1nbx3askLVXtDrhWejIRdZGY+bbs?=
 =?us-ascii?Q?FqVFtQcFWgpxLCVLm12XOKy/JCd/Pe2Gv2QYGfZyOfQ7CQ0P1rI/DUoTMpr+?=
 =?us-ascii?Q?qwMOinE6ClWO6Gq2SRAqScUT1OiGsnItSB4dwUtkLHO6dmJq4gQuLNImU1f4?=
 =?us-ascii?Q?gRQlFE4bxTP1h7CcuqXnT+u9QVEPmYKF2ZHXpgbr/20gGayafagR5dMtExNv?=
 =?us-ascii?Q?Hj7Q7hatYxJ5q0FovkuYOCJDcVB+UYzZMIy2MWeQKNYGjT4LMRCstXe38aYi?=
 =?us-ascii?Q?26KqiELoqoYL3jEPX3IdyJheIPDGgK+DCN1V0pYHzAllBIVyeeRV8kvwWhCK?=
 =?us-ascii?Q?VH8AiGvqTLuWww4mqpUVRbMWtjE5+BKjjAjFVMpCZg7RFlJDSxy/ANC4sEuw?=
 =?us-ascii?Q?icvDM9EJgymbPXkqv+qksiMwxO0oDFTCzPjRNVw80Er+Q6LjQK6hBCG4j9kv?=
 =?us-ascii?Q?LiUgdY/Wg8HhNGfQQcG0GQ+Etl5uFKmpiiubPcIbkyCC3tygtMXyVcnQKDUs?=
 =?us-ascii?Q?B+bAVf4CgEAtxdvE4xbVFp4gxLarXpdZ4moLH4fT1J0+MN5gGtJ+owdvcsxK?=
 =?us-ascii?Q?CAO8Nrti2/f2gecWqkmzZCRS+6ZEaW8KqFxuN2aLokCTtoSiqwy8aQ20pMPn?=
 =?us-ascii?Q?DSoL+N1xWZ/dEQaFr/VDJ3plb4/9Hloq/+BubF30BFjIdFK//12+rsz/D85j?=
 =?us-ascii?Q?4rQxIyYa2FdNESoVMcG2EkfhTAciEMK3b8B1fE/jYHlsi1HAS2JcYIDQv5Kt?=
 =?us-ascii?Q?r7dw55aN+Dt5y1835VnAjfUT4FSfkoxGzhXDxf6YnZILB4Fc3PusE1uJUmBc?=
 =?us-ascii?Q?SCb9mOiatyKUggWyCOLVKxqQ58hDeXDIIay0h03s8+n19RC14uO8wueSH/lk?=
 =?us-ascii?Q?Ur3rLZ23HNt5xAfqH47aeCI+w9o/zzQuqWhjWMw22sHReEYrWhwhU2S3fGX0?=
 =?us-ascii?Q?A/ecDLj2/SjvL8wlQqNQ9zrTkdKEo7Ky7Z4e+BJ7LeG/55bpLms/AHn4tl3H?=
 =?us-ascii?Q?SC07nX6LVBBUUgizJsa31+xHhYayE4v6PdwLTwGlxskOXuiVP8gIXH93Rkap?=
 =?us-ascii?Q?7YzcYyv2VHQ+JyJWb2GqJLM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49395d07-ad08-4469-a62e-08daf370d52e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:11:56.5930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I12Pvd98/SCrgvhYxvz9UNKyFI7XHkvB/WHQEq71ft+HoAZkAyguo7LrcTkxFklfm0ynVuRLWRoCqOXjEgG/qoWAaStwk+4TQiL/81ZX9qJxQLmmQt+qWsbs+2KKCVun
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

ak4613 is possible to use Of-graph (Audio-Graph-Card) style,
but we need to indicate it. Otherwise we will get below warning.
This patch add it.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb: codec@10: 'port' does not match any of the regexes: '^asahi-kasei,in[1-2]-single-end$', '^asahi-kasei,out[1-6]-single-end$', 'pinctrl-[0-9]+'
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/ak4613.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/ak4613.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ak4613.yaml b/Documentation/devicetree/bindings/sound/ak4613.yaml
index 010574645e6ae..75e13414d6eb1 100644
--- a/Documentation/devicetree/bindings/sound/ak4613.yaml
+++ b/Documentation/devicetree/bindings/sound/ak4613.yaml
@@ -25,6 +25,13 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  ports:
+    $ref: audio-graph-port.yaml#/definitions/ports
+
+  port:
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
 patternProperties:
   "^asahi-kasei,in[1-2]-single-end$":
     description: Input Pin 1 - 2.
-- 
2.25.1

