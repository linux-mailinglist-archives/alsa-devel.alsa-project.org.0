Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA056774EC
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91BBE41FF;
	Mon, 23 Jan 2023 06:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91BBE41FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451735;
	bh=6Z4IxeWRftenRUZSL+UZJwyc7+SduilwujruIHLEvP4=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TABizYIatlz7FZkfbUwhJ2JW1qD+ua+ym4f5Tmow4MRJBsS16s1WBbaGdhpROhOBY
	 8W43Rxs8PjISf1O5LD6kj39EvDHzrnP1370ixOHzkzHopzRckbvpFwPsvHTw++OU16
	 GraB3kdBAiAxYbyk60ABplh+x6Djb2TleAaAeEdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA43F801D5;
	Mon, 23 Jan 2023 06:27:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C827F80510; Mon, 23 Jan 2023 06:27:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 028E0F804FC
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 028E0F804FC
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZYD7ICQd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZF6F/O2doXez+IJW3bJFnlD4Mh/7ySASjZMwyU23Yj/zBY5TPIcsbderKrd2U5csCLbCMsUX6cURv0FmthgE1uYR0NHOeKdQLLprroku9x5ep1/RFdBdr+2s3YUK0XzBdi9xkS4Bpv3rUQ5fQ9i/o8Wv3yLEp2UUifslsFKvZR98JzznAptdCFfNBxW+zzLvxjwwqZbWyD67JfT6iIPdT3lkENDc7Sd3aWFxW7JvjRDoaTbtiVX72PjTEJCD+wTDXDAv8iVlbxS081AIhg+xmxBtdVuH9XIQeIawpOR5+vOfAETAa40W3OQp18o7Lzpsgdr/tc3tNGqrqOlVLt8MGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U72eguayJt5KfiCkwviOTRFC70G11AU+FF9Ra2E+zjE=;
 b=Np6PS0llG191t3ONxBhL8hlRpzEKxutP1XWr6I75aoflx9XR7jQGKy6NKdh1l6+blNRY9jB4U505mvhOXVb+BWqqN7iFd/HgkyESfqeFe5kw20djdovUTWU5YM/zUW5OtVR1MmtEEbxUwrm+3stFoHo1AIsr9KaaidpyE6A4W3W8TVYwM+yD4uIp3R/dc8gfzpKz6aYF11uxQXK8VOI4BwkruX0lipm6SUxI8gLOQBVGvOoJJdW3wrN7D+OC9lunQry179CPgF45ggcCVsfIS1rDvqjd2HbaomL7FvW84ryA8H1hyVYgiVTS6TdGz2nOxfp8raHK7FdCDUQNqwA4QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U72eguayJt5KfiCkwviOTRFC70G11AU+FF9Ra2E+zjE=;
 b=ZYD7ICQd4a6aX4eeXtIUDg+WBEupaxQ7/zsCr0QF2U0o5PIT26b51Wdwc2kT875Nj8kd/5w8NwQKKB20gbLmgm3wLH8mOTcoUZ0X9hev68ZBq1wyFc9w0c8rFxh+hO+Td/Iw/IeCWaLK8VmtcMsoLDXfsLw0OqzqPKNLUBhBIz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5901.jpnprd01.prod.outlook.com (2603:1096:400:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 05:27:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:27:06 +0000
Message-ID: <87cz757rdi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/11] ASoC: dt-bindings: simple-card: add missing
 #address-cells/#size-cells
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:27:06 +0000
X-ClientProxiedBy: TYAPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:404:28::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf6f1e6-72db-4183-8749-08dafd0277a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUsG2VYOVjpokJoLWf0bXNBuz2/bubbK8qlpe+U4Gf1sT3cONGYPpC1+pPMtBRsMJ1j6CHsusPOWelqjOwNGYn/Ko3xwgYSUtwgn/nT+ZQxCfmMwQljp1Y9kTMRh8t5a0CeN5wNaftKZeFYjqF+hS0XT9lxtt1VnJipl3G01bXRE7V2dACOZTeXvNeJlffnE2IO+w577yg53TzyL9h9cB3FZkSonhwW5GsPMxvT8YaFzHgaZ2v0c8YOMTyfCYQcTPbN5aofXVLhhrszWJ9s4zlPsUKTFRwWZxxPrIrqqORkdzjmXyWhpb+79mt9ple87o0e/7/nDUMV0uFA+w3ZehitoFoNCwfSxiK4DuhuyfpzBno5U0bs8rKsoEh5QpHnRvfruQy9cGKQ00OjF4QWMYeCoWRDbZlTuURirZZwK0jcRdEQTRK9JpNaDTK32zZnHbPkm4sPtvab1oUEQocIHAu4JMRvdxnLpHVKuxfXd7SerTvntbYPBJAQvrLWiHsmPXNZD3qsN2A41tHNHkChlOvXxdGEaSEn/c5EQ6az00in6iVVeK6iYgjAW/GZrIb6xROm1HsMfuPEBwxbixwNV5NuXYwz9VbMGzeuNdz017qLWek4BsTslM1xxP6GI4TR+J3skEjOBKl3C0OhqH0JFUXfY1OaPcRgyQvNEwGsuwfThXf3N3uPgdTzfnC6f7jB15s38fZXUqQMT7OOUjzjnxtYAi257hlwIfAbXck7ljf1/4xMxDdw86fy1NBxxItSr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(38350700002)(38100700002)(36756003)(86362001)(110136005)(478600001)(316002)(54906003)(966005)(6486002)(8676002)(66946007)(66556008)(4326008)(66476007)(2616005)(52116002)(2906002)(6506007)(8936002)(186003)(41300700001)(26005)(83380400001)(6512007)(5660300002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EyNr0Q69rg4SplaJy2G61KVcXerw2zv4bOiJHHRCvIpisdyrzxoANaldTKy?=
 =?us-ascii?Q?7WEBqo9NOM336JKJ5sBb1SgYLKSdIQgai1A7b+QBNyiPsALgBkr/Vq/LOPUo?=
 =?us-ascii?Q?10jZFWC+ADyJiiDY6KsMlqKsYstTsRbvi+MDCOH1bke7Rrp0i0brXwYEFyFa?=
 =?us-ascii?Q?/nXbWDVx5AoSMeyAAEfUkvtFSNfTh5tsWLZbjRRcGDJvh/UuK+R8MFAj9pp4?=
 =?us-ascii?Q?D1w29X36kIQhng64htel7qqb0jeNcd2Ouya7XSjbJ1ACLe4Jmcp+j/ElfM8+?=
 =?us-ascii?Q?Lw3yeQsvAWzw+o3k/09wm8TN6YEzH1Vg6cBEicti2O8tuIDTa2zHYHzgo5Q0?=
 =?us-ascii?Q?9MGMOCj8XOgUb9JM6S6mgd4zYKsQ9F2GD4XCW0UAOpnZ1KG3EKASn6QTuKzv?=
 =?us-ascii?Q?gdFVqRTL7QU1Y08eYF0a0Sm661zBbef3Y1YV643OHmClmg7y3UUt8QsehsJJ?=
 =?us-ascii?Q?Pk5ieA4m0wrbExiyFFksu3IU3XgYNAJ88BaeoYuHGuzQuHaBJZuWng9DHGdK?=
 =?us-ascii?Q?3HiWjwoS+m8cYWn2XV8NO5OBfxHnj8SHm6089uPbkNRjfp2I9Fq5nmb9DR8X?=
 =?us-ascii?Q?ysCiNwE6kuPp/R5r9CXjq9sU70G2acnLX+g4FT/S/6mlioAJWhtiKiLv5Iz8?=
 =?us-ascii?Q?6+/nSSwMNsrYc9NnNZw5oUVdjFFoAmM5ELs9FzAxHA2qH7scO9M9sdBeTT/J?=
 =?us-ascii?Q?1Fc9ckPKv6mffxyjzpFYphCE2Otgmg9oDKwFFE7hAb6LLp7tc+ioEjBjOJxU?=
 =?us-ascii?Q?lLzdBwnDIUWN+k4OcpqwCIzrnED2fXTy8fiUY2jFBf63NSdJhSRl+kxUuY9q?=
 =?us-ascii?Q?duXFpBOrUFhCAF4oMNmh+dKU8fRVJCbdhDbIiSFpwIBnbkJ22sJSLYhAv7Pg?=
 =?us-ascii?Q?SKKtpdKBWA9346WEqA40LAMVHQQJbZOuhHXLPqxQbXdPvHb5+aBeVCRWZyd/?=
 =?us-ascii?Q?pRNFap4uPajYliVbVzk4WDkJSN2Xjmzbd5dsiwctx9ybI+mBcIam5ME5Vg/7?=
 =?us-ascii?Q?zbFtpk/pa2SMhwzGqA+FK3DAaV7rvv8vz6ZD69gUQ6HiC0njVcodCt8qsSgD?=
 =?us-ascii?Q?GI60EigbHC3VURLMhzhTo9khJF6ZWDXfSjydzLwEXF3y7pEXbcTCBrQuvx+Z?=
 =?us-ascii?Q?UUS3bUKzyXQEjOjoqxBToZzHByZ5jAz4XnUTOXI40SvcddgtrfBZzxv2/7h6?=
 =?us-ascii?Q?4FlrWMhvTz5i2uNHYk2GMaXx3msXKDq0+Oe0myALWSKgWkE9n7fPk4opUgA4?=
 =?us-ascii?Q?t1Ujmw1NlrRTN8W/Y/yi373dv/tojhUsxg3SyCIUUxo5nZq0zsaHPqHAJ18A?=
 =?us-ascii?Q?uI4H6SSY9Y///qmCq7yQdWzcBZ+ga3azW4nA/0Dd4fUUkqhsXwr9V1LFE6EB?=
 =?us-ascii?Q?Sld7RTp30RfcJLG/g+2Lk6gIMC4AVO4UXy5CWTzUpznzaS1Y7iI3exN7mcmX?=
 =?us-ascii?Q?aSrIPEs7mQIyO7DZfg2uNI/b2iqSAPlxNVmqcT2hXexcWR6gWjbL58S5HZSu?=
 =?us-ascii?Q?h9KfLE8ICu6mjkVcxsQ3fomXPWFGYqlr/WkmntMmIfxghX5UZgKd0v4p5mTx?=
 =?us-ascii?Q?LmUeIFKvcUpulLdeKYhSxr2FmDVuDOokfI/JymrJQls2I8auNb+G6ZwE2LpO?=
 =?us-ascii?Q?2dIWbxSIvSzCOfZUTKbhg7Y=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf6f1e6-72db-4183-8749-08dafd0277a4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:27:06.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHXCvcXOAxmF4siTixXIHyjR9LesWEGhYEKVvlC7xEuc6XjlxaOV++eobxEWXMKIhKgS7qEwUR22d8Nz6u7odZne0nK0a4brP4IGsyHtxd3O7XZGf/rGs0Mwf+veLvDu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5901
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

Link: https://lore.kernel.org/r/167344317928.394453.14105689826645262807.robh@kernel.org
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/simple-card.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 08743741b09e..a69af0bfd371 100644
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

