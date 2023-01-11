Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF851665101
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:13:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B440D0A3;
	Wed, 11 Jan 2023 02:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B440D0A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399635;
	bh=u9jxmyXfU8B2+OmRFahkZP99NZhtbCnZyyO4AsC/Olw=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=svcaqloJSu7Eo5nponVDXOqz5/wHGBCnknDQPHKU2r923Ul3kVS7PxW7qRQafpPvx
	 9ebUmxx3UTNvYhdp09MKRm95znlPKsrqD+Dvz3XGsTkZuGKXkxPDMPTtbj9/D+TO7m
	 Bqv0SlOT08lfc4ZameLI0HUX83dmADFBQeT4a0SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C46F8053D;
	Wed, 11 Jan 2023 02:13:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72223F80542; Wed, 11 Jan 2023 02:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2129.outbound.protection.outlook.com [40.107.113.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C57E3F80539
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C57E3F80539
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BI90V3Q5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3x0B6nSGR1Fk6ql86L31udT7UVWQEiN71LLTSGSgrpFUJzBA/OiwQJxBbS2lvOk1JTE7MVlQqxNmSzyD3pvzOWoJey4egsCzbNSf7/IoMQST+lhbNX7+Ry4kzVfbq6evII3E7d36d8Kn5dyYELDSwwh4qHXT+D/cXbLiktZ9GPhXA1qr7ZA945YSwZwZoLEkHAoTsWYwGQtb/EcjJTATLHYTOE3Y/KMurwxulJ7qM4Viy+zaGf1EBaWUgCWQ7KFO2mr0LuaU/wsjQcYBhHGXGhitGhS0EcgUkROREYFKpdWuZoQAs288URX0IMEAuoYwA6mKF0otL6Zoy8gCESZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yrjn34FM6CuQl4jRYriiUVCypTUAG7DP39BBl9JrcXs=;
 b=oXuOV4X+t3gmp1175J6Ihs0LKrjw86QmNbo+BmCTBPZyS4fNnTufH0r+iZzbuLimCCtsY5V9S6xgjZFNlmac073hZ2ZUZRRcRCA2kousIdARe4fRLbYg/KfwcUv1yOfxKxg+EjzmWRDT4za5jjUjhnTzY5qEEcmsqFrLlFq5/zCgfimH7VFCHQ6801YcIHSbbGwiIm8i5BzfLdUrByIBy1FIJzXKBFDroaCdE1G/bIDRclAZEi/pkJsWh0XWK55hl8uegoTrtfVlRdcXpm5wSU226Brf/ZVraNuiPFVF8aMP+hwbjmBClRY4O+gSUiLoi9NfsGAwp1twqAqMqC8/jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yrjn34FM6CuQl4jRYriiUVCypTUAG7DP39BBl9JrcXs=;
 b=BI90V3Q5LZ8gU9DsdtUqtTu2T9RGPgVI+gNZ4NxkapeuJI3UzIwsX9/+2XZoGo7q1Eil7MzOaEGFmeTCGwqGkXdomFHEtA1gRMIVNtxd5JCA0z6ZgleKIRSvJyz8haURra9OIykMni9b1c7MoZ9uqJ43uzW6dFglbXDRfzOqQ0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB7722.jpnprd01.prod.outlook.com (2603:1096:604:1b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:12:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:12:51 +0000
Message-ID: <87o7r5ho19.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/10] ASoC: dt-bindings: simple-card: add missing
 #address-cells/#size-cells
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:12:50 +0000
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7b138d-72f7-4c53-caeb-08daf370f599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 07ufc6fhnUHd3tCCPXpF9NUf5JW0DL40+tfw6A9MjFZIf4wIOPZlSwPNX8Ax8EXO64ACBlEtKwPcQ+76N6TDpc3rdHATjGgfZPIbioZnOcXA/CQw3Sak0nxcf729VlSZOSIGaRODjkQscQHiwUQL3/uTgQDr5gL5ht8q+T6uSZxRqJTaESnYXyzpobsTLDnmKcIStQBDQ+zQ091F6Bbx4WZfYyFvoa7nrNR5SH7326OGCKq7SdBrBPzf9uZT4UdbMy+L8eqO1domwXgnQnyXqIFFam3URVp5d6Ujd928AYef7ooXgmhgWAmBi6JyC4gG+BMYwexOYPPlwWENM7VLwLvFoOHf/hSY3z+EI03iaqBRIByp7qw9s+1quEKaYpV6+kHeVoPyCXmOsXUi/oaCH4265RI68R3C5jx16dr9J7C7HlbWFTW6ZRFk4RrBKHBh81ITNTCPjZLUtbInhpocr55q5spxR0/0dMC5imJDmvb1AxlAIpGAfxE5qRrcUoaZae7Skfp44L62+Gn+SR+DfMVGzqgQz8paPvnp53axAqfD9ILlcN3YbRSWZ906rWG0dU/Kci5RntGG+RdK415dXso02FickkmL71ZkaSQjFSzOS8g5Vrmb4ceZN+e+uZhpTlsC+c4Fy4dryIpzjXHt2h3XA+kBeVDzqY5p9vifZJFidVThtAAzY7OK7Mww1bCVfvXM2jWEEvFbi7OwOPb9T9PLFlUEcIr1jlu7cEWaMvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(26005)(478600001)(52116002)(6486002)(6512007)(186003)(316002)(54906003)(2616005)(110136005)(66556008)(8676002)(66476007)(66946007)(6506007)(4326008)(41300700001)(8936002)(83380400001)(2906002)(5660300002)(38100700002)(38350700002)(86362001)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XAf5A0C+cO/INIhnRKRPfhVPbI3bZXiZxx7EdYuKrsGGEWJ/ZCyGVmvjINnT?=
 =?us-ascii?Q?rdf1tvKouWX9wdBUt7AWNqwBenNr3vCg7t7FHqhvsmmOb4wsrhZdJ5f0vY9W?=
 =?us-ascii?Q?Kb1AJBYHQg0YtThfTjhPDECw5Qi3q4G8Eu+4KahI60LoOskv92YMNoREseFq?=
 =?us-ascii?Q?7IZRkaGnucAWivQpDQ0bGW9FNXF8ZZBJSaQJkhG6yfHvZLtXA1Kl1q4Li8+9?=
 =?us-ascii?Q?2mI+UR9w0Y5hrPwf1TCRGFSG+Nl8SJVDzZEjj6rckaJ1VBWF4e9lkS/ADUbM?=
 =?us-ascii?Q?0K5R9cSFj+ZEvd3rxfaccHqko87jWSoz8DPtXa60mxI4J6EF6fjJCHDIqRZP?=
 =?us-ascii?Q?oFyG5wXWuIqgiBpBAG3/Am96h0SU2AlX44shE9lVaG3iezkPUfaWNSBptEvz?=
 =?us-ascii?Q?Z3PY3blJGw0mETpgvbeUflBXd/pm5zPraukU2W6qWmVLbKeRE9xoPJ+1D6Y3?=
 =?us-ascii?Q?U7s7E7obRL7hNxdleGysFVV4dh/D/B9hXEqVVZ34CDNKlxMye1xbhCWv73GE?=
 =?us-ascii?Q?IaDATUClYdTTf+CcQkU+hd30GmtPS1DJ6OOdFpUt0LRREnSsD+vgk8mFg5ci?=
 =?us-ascii?Q?o/pXZz7VUOZo/uWz4ZOn1367poo0bRrOWlypcmyGJebNTXDTq/YUkkqWFZXs?=
 =?us-ascii?Q?/thJTiCynyIF/eZOucBVYK0KT7/UjvI8RE4fKtNtvzvH2ZxDB8Ou0UTD1Aha?=
 =?us-ascii?Q?hWohSUDPGv3u2t7C//J+WBbqPCl6D8xL1JRbxQIMLp+A2TqAnEuOkbXjkpNx?=
 =?us-ascii?Q?pmpKq+IinJEEDK/umMZ8cwDfabi2LTyZMn0hQH43tVhCp0dRjzeU4W0wfuDc?=
 =?us-ascii?Q?akljuNZp4EKRpB7FgKvXUnyKf5ssavwxVyrOKs8mydSCacvs7XK0tquJQpAX?=
 =?us-ascii?Q?QOdrHWWYrNX8wBsN8cj+TKpGZh26kwwoxfbLReIze/WDsRRy+6Z5eUDNcEIn?=
 =?us-ascii?Q?y8gpHSrQ7Do4sSP0OiJEuFN6QYe+alJp+W5HHCn9SS/0zpZiCvAMeTCNU25E?=
 =?us-ascii?Q?YdRJ9v1/NW7MzmMVCmx4JQTC1h6pSo2FifBC0GWA3qfNQXCp/BVo+kFLAH73?=
 =?us-ascii?Q?+ukGdwZIrTZtKGnyFT47QdEbpIiNAGcX0ysfX4hzlB4jinlLCxWHD9QLHaoO?=
 =?us-ascii?Q?wFVNQayvVxUJXNxgEnv1Ekx8vvgi+L/TSF/3cIpciMxuPj678la/CDh4SkFZ?=
 =?us-ascii?Q?oUgQRPF9zYc5m/01UxYSG17xIvRPmuiBDTECwFtANlgVicBA/cPb1c+6+QJV?=
 =?us-ascii?Q?1LqjCzFqpFABHptBjS3FS86Ahcvw0qG2LWVDYUHUYWVtw3tMlJ7fYqYc16zP?=
 =?us-ascii?Q?nlJNHmxgzpzfOMTRGEsTe3UQvKRFNP62mklgiih6dl2sMklnznmjRANtPLD/?=
 =?us-ascii?Q?3Wiv6vp49P3I1jwhbcMcXU2V9Wq8OaYw66nmFxC+xONo5IDdc/19SWovANLr?=
 =?us-ascii?Q?sqorKqwXIUM42ZExPXJxaz9Ff0uIvTieLQX8m6ZKCgek+MVRca5lw46XQ3Cr?=
 =?us-ascii?Q?dPfMH3E8Ue+qwl0MbrlfksevFgXpSM1Xrs/OpoNMrmgIe1EZSzz8+G5paSRa?=
 =?us-ascii?Q?9zwbrvJ9CkWRbK1VYUrKsv+y+9G9qXCvGoqfzI3YBrRUmIe2X5b/gkLpnOHw?=
 =?us-ascii?Q?PjoFWJ3Fm1CgRdTHBiEH0t8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7b138d-72f7-4c53-caeb-08daf370f599
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:12:50.9823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1flJiomING/HzBm1bCoOqQ9Ze/TWHiXaYer3oA4qFdOAEO2IgSzLanLRMdkTkBfEstr8cadT3cf3IH/ZkDfsUlqIe2SMrozJFMH6gsQL6IKXq9i9m6X06Bbq7cf0FaDA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7722
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

In case of using MIXer with Simple Audio Card, it needs below DT.

	simple-audio-card,dai-link@1 {
		cpu@0 {
			...
		};
		cpu@1 {
			...
		};
		...
	};

This case, it requires "reg = <xxx>" which needs #address-cells/#size-cells,
but simple-audio-card.yaml is missing these. This patch adds it.

Without this patch, we will get below warning.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-ulcb.dtb: sound: simple-audio-card,dai-link@0: '#address-cells', '#size-cells' do not match any of the regexes: '^codec(@[0-9a-f]+)?', '^cpu(@[0-9a-f]+)?', 'pinctrl-[0-9]+'
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/simple-card.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/simple-card.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 08743741b09eb..a69af0bfd371f 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -215,6 +215,10 @@ patternProperties:
       reg:
         maxItems: 1
 
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 0
       # common properties
       frame-master:
         $ref: "#/definitions/frame-master"
-- 
2.25.1

