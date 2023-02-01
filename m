Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BC9685D04
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E0441;
	Wed,  1 Feb 2023 03:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E0441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675217083;
	bh=XtkkJs263IEgNlVOnnEx6NWQ1K8b/T51jJLhoX9ssd8=;
	h=From:To:Subject:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=s5svHRdkrLcXVBnKAona88U/T6lVUqfRJm37X6nhYbapFKarDQYxuS32PAzJhIn2l
	 9YyObjRr+RKH1zvM1Ysem2xymn7OcDEBmgZ4SINDo9ATXCpNdXViS6qcDWg2MgVeMF
	 pR5S0P2gN4zsbAr3QOiBm88GaCFgZL/kXYvxq2vU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58CD5F80169;
	Wed,  1 Feb 2023 03:02:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C806CF80519; Wed,  1 Feb 2023 03:02:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20723.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::723])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D8E8F804E2
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D8E8F804E2
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=H2vNxDJF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOTm7xC3b6gCRJ6og1Z04ncfgKhA5SuD/11aX8DXvT+frAvg9llXm2kVZCG4UX4hvOunxqr954dSwexdfWc9ih2cdDTr6VmT07fv1GXJ28Hnwudg5uChr/mT72KQcTUTHo+MJwvqcTAfXQkDU2gxdw2aKH1HotkuHUREWN/j54p0OjRwzrctHRc3InGhY6GpZc/+dTeCDKgdZInJ3jT+6I3ox6QuYhkx1f9Gne3A1dWd21Mg3UZfX7LQ2FLN0ehOyqWFej31xMhfswOcmogVyAjdg6hrWkw+y2gCLyg2AlpgFdYMQrwpLAWdj8dGtWEB7P9tzjAX1iA862nwmBjo3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBL5GAcQu+Pqgo7PA1H2Fqcrh5tEzL9+VcyPfVvQAVs=;
 b=kbmIoANHXOKRwSR5Upa+Azo8MrF3h6CGlqNIbyh2SmGZDkGSGLcbHnLRA/J7JvmJJHWcNHcYqXeW98XzhgYC+FtTQdx2LDjYl4Sr3Rm4eNtZqy1bzFOZYae9BLxOZ6zIjcNDgxK70MssOD5hOOebaw7Rfa1l5PIUCtI5onx46TQnUrYK5/5M250LZzUIvz6NoIF1OkQQ3zuKhQjg37I00qpjaNp/MvwS4RJiAGuYqVF6RQiXfq/JcRwn8tpx8sKXxOW2kkeqn2wMBbG+hrvd2GECiGwfurvjkBjkM0KlbFicQ+14E3vTGvV7IINbbaPpytE2e4JE4JwZZH+K6gI7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jBL5GAcQu+Pqgo7PA1H2Fqcrh5tEzL9+VcyPfVvQAVs=;
 b=H2vNxDJFW1djmmI/+Sum9xK/AuPeHQlYE22KVbwkYKQidiya+TrEUpl15xkqMbQlEJTXCnA/8kuE8sas7T0UP4jEKLx+N5arDXDnbHULS7k9+EyDDiUJ1jJJL4NgU1AwP5zOVNI7cPT1q/YP4htQSVPSAqNjtAgaCILb9KjMoIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8772.jpnprd01.prod.outlook.com (2603:1096:400:18a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:02:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:02:08 +0000
Message-ID: <87pmau5ejk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 14/15] ASoC: dt-bindings: renesas: add R8A779G0 V4H
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:02:07 +0000
X-ClientProxiedBy: TYAPR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:404:14::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a31160-94d3-48a7-b9b4-08db03f852c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: StlPahfVmJsdTDnOAmCFYCK3KI8sbJEEFmb/RczbiXz3JicQnfV/MnRFgF+a2b1olAjlEZ28F78O+UoDg8x8gWs+3/XX5SGyriMdsvO6Jr8dXDWXz3wYPImsM8w6RiPMDEmxWmd+xPexWFh+0GJO5jYvh+absBThiUMtvRBKHSdADIavU/M5rUTBfyVytO8IRtQ0WmPcGZwkHxNBJkwi5N1dIunil/KmXqDjIJrhOKjncz74Hzwow8/qSsnRJikwuajyRYo2oifs9U8/Rx0qr6tR7+m6yLiyUjQ1RH3I2COnolFYHPtcYVEoxAh1scWrVEpk9LIUO9XwpTqybPIKZSuBpfxOVqQd1IkQI3mDiczrOsJtU9mAFuCS+VBUBJXj8befWZQHUw0ah6AQw8GHMGXJZ5DmXb1IGQgSThtASLvGqsWNAYnQ1HcvSVlFFUTpO4QnlBqAst8cNt1OuRD/5rHupBuyNKLNmAAcCaxuEX34l7k7xbfR7UAh/Zrgy7FLoObnvYSuOe6MVriJ4unH59If1fa/IXUkbqIcp7BT0LBwNrR2xmfYWbp9U/HItCE0vCbBlArj64PPTcBr7Oz/28BeDUqLjuJd052lw+EgwwGN1ntdoGV8Z8xw2qUUA3ut2uvvDYzJMP4IOE9sjA/LR63LS80Tbv5O7oLtoUZ7c7SxWQy9cTKJ9UyDhkzcvrS8MAMcVr2gHvSnM+d9LLUi5wCCqi6yn3bkUubnnpFqUlA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(6506007)(6512007)(186003)(26005)(2616005)(4744005)(2906002)(316002)(66476007)(52116002)(8676002)(110136005)(6486002)(478600001)(966005)(66556008)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?udjGesIT4S/mnGAjvH03oA2RnWcCjpO4hTDBU3U62wJYM9YQDjPq7/24+rCP?=
 =?us-ascii?Q?PUyLAN6l931Q2G1QogxHzQjXrSnjHLvNAPx9mBKlbQFwmIdxrkCnIToDhk4/?=
 =?us-ascii?Q?eFeLRGRBUQXnxL5oXvwk3oMv8grjC6kP7KBNhzGwe0Qek+SdlzKhVmH+NTVA?=
 =?us-ascii?Q?S85uY/BL4dwPKLmKac+crAL/OgoTM2YZ/ahlhlO+D9Xyz6/Vv8hup1eSV73j?=
 =?us-ascii?Q?vqEqzGxFzNV2Dr2LX4K6BpUj7sMGvgmQcj+R38KKFtubfdtlSU8zrn0VBuq7?=
 =?us-ascii?Q?JNUW7qCiFK7Vma+olNy6o0iH/Hyy1MJYrwfEI1FTXjVr0VK2OMBrkVkKKWjR?=
 =?us-ascii?Q?aUoqJYkx2oj3qikgWa+mIN57Idf1gfqQs0El2qAqLaM0fQpHjQTi7FCNWxmM?=
 =?us-ascii?Q?IQYj3qtR42fbGgxdT0VIaqXuI6wgL/ETQh+Y5thDTQKlkcHfkAT4indEx/zk?=
 =?us-ascii?Q?W9he+g0hPHC8yWTuTPpHD8R0RosaWdOwTIs6E+//hjwP6WotrjkNTJL7tnf/?=
 =?us-ascii?Q?cwmKIsub7lHft9UoILBrT9ntY1HLlKqfv0y3/SS91KDGy6cx6x07ylAEUSTl?=
 =?us-ascii?Q?dgnuCyVTzmFx8JBc2n7952Pw1mio/bG3g3llEcBYdVe3i1xNtcbDqbXPBfiG?=
 =?us-ascii?Q?/A8VsUSRe9R8frH/IH4yPD54BPTYE+eOI6rwGi52zOwSP9iwvIBv8X+/o/DO?=
 =?us-ascii?Q?uhFFhYkIA567OcVeFZYS7dtuKOqmSGANcjSWcsZw6cqBgVMfCY2vOTBMnRTe?=
 =?us-ascii?Q?pLy700vHqiyEpXpubTTe1qtFaokcY37kvklRT+v2bbnfHRB2ZzCmVYqspq2A?=
 =?us-ascii?Q?oserEvEX+qHY+7v+Fy56Kfu1ocD24Tzxc5DW1vUbn41SJDR8V7w/Aj9fDLEy?=
 =?us-ascii?Q?UhUH5UAfKOfXQZEZeB5rcpy4pweeeAGCbDZpcQVTvB+VHUixN5CAOKgECiA/?=
 =?us-ascii?Q?zsmsaPiIf5YcsTOPr+3o2EgXJqqUlvN1/n/8tPsJNdgf5zwvP7xbzWVtDCR3?=
 =?us-ascii?Q?cvq66a1rNwo/3lEamlknRzucgse3VThymckoryOxIxPsfzvi4IRgwNLz85ZG?=
 =?us-ascii?Q?8vGhVKikDzDB6yUC7M4wWOFROnypWyld1YLfB/JoJGAK9lChphWz23n0nxQZ?=
 =?us-ascii?Q?cvQeGseA2i7HXbXBylJjYRRsIeyhTNn5ARhs1OUvkXv8IQEVa3kpt5ZIY/fM?=
 =?us-ascii?Q?l1phfGxqf1biuEWupPUXkTBv+J0vH0nRjHw95IjuBO4mylULdqlp3CvQDRHt?=
 =?us-ascii?Q?WosuwYB3HGWODSAEd+JPmu47235C1YHbHGBbEOd1wS1qJ+NBOzf+C6npP7JI?=
 =?us-ascii?Q?5Z9tvTxv2o1HiLcl4895E0lAzBsOawte44rUiiTHycjWjtX3BGZoE6iZJhVu?=
 =?us-ascii?Q?tau7SRGLy5ZAVXrgeK66Zy43DH7/TR0NTkz3g0ekohMwTgOmjUbQuV9wznaA?=
 =?us-ascii?Q?UAoFkCvVNxAyHQiSuBRzrP7xvgyXEeD8cGL3VE9Yt8xKocb83bxWXux8dMKY?=
 =?us-ascii?Q?hfZKc14VqG/k36w4n2NWr9RjjVPJA2fMqLmpaGu4OTvsAVdfgpnLclEqnzy8?=
 =?us-ascii?Q?Y831VyZQaZ3i0bbjXC0GQpYva91PpdvH9wGsXhWJQOTpHXthxokcNnXfS81N?=
 =?us-ascii?Q?Bzp0fh+SXUGJVOafjyK+gqA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a31160-94d3-48a7-b9b4-08db03f852c9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:02:07.9719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uLF3yXH1SEqlR31LAvsovlvMl7GXvC5RSVnwhr92z8olaEmvqC1DwxsvHqiNE37TispJq6wmX32YCKf2rKrU1hazQgibfz5+4nw/R9oymhSAZce0LOKzD2PB7DI3nZBo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8772
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Document R-Car V4H (R8A779G0), and R-Car Gen4 SoC bindings.

Link: https://lore.kernel.org/r/87zga6t5r4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 66175aeba7a7..d106de00c6b2 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -46,6 +46,10 @@ properties:
               - renesas,rcar_sound-r8a77990  # R-Car E3
               - renesas,rcar_sound-r8a77995  # R-Car D3
           - const: renesas,rcar_sound-gen3
+      # for Gen4 SoC
+      - items:
+          - const: renesas,rcar_sound-r8a779g0  # R-Car V4H
+          - const: renesas,rcar_sound-gen4
       # for Generic
       - enum:
           - renesas,rcar_sound-gen1
-- 
2.25.1

