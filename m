Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756FB665100
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:13:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60EC49D1D;
	Wed, 11 Jan 2023 02:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60EC49D1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399617;
	bh=x5Fz247WSoly8ON9TTRP15iZF9WBikMD1gfPO40WDHo=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B24qHmmywQW1QrLTY36gJQoYEAAVFb8h0s9hluAes/6+K4Cwt6nLIeJicsja5b/H7
	 Q+IVWLSoxg/ZhkjfluU0DIe41vze+L/ABUaGaOCFTjGqxGGp9yMKTQvBMOaF4xxtsi
	 YvdPs7jInVsCDwUoBHkpc20SdH2YM6sVDu+QatCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF78FF804BD;
	Wed, 11 Jan 2023 02:12:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08306F804DD; Wed, 11 Jan 2023 02:12:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37303F804CA
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37303F804CA
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AdHZy8LA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HipUsGIBVGmrHngzyx07DjuOF+8I4Sm6n6UAzmZzg8hmJzJda+GDIueRNiNzdiiszkKCPLix3YHHuYgkNuH++PkeeibsXhJyZxed+6JrpGm7KboMzGgnKUfBhzviBQOYXYTk/bkU2CoHKkm6NYg0z8YL4jozY5Vf8Rsd4C9sbozR9yLnC9HDTfzTtvADVx4eGo8r3s4TiFdJOfP0LKRQ0LMMpJKUqnhStk+y9lz857xTtWFZ/kUcKGpx4x/7L+OzIcXSUTqYhoauuhFWE+S7F0s8DuV9LJnjJEba9hCCMd4JQH6iuQmm4I462JxE5hnvUD6WV78MPpV8nko48Ho4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKOL6Wa2wBT1BCHr8NhAFMUpsemcy1KrKNDg3IW4G+U=;
 b=IngvgZa/spwSIXedf11reHK9ikRHlF0nmnTd/U6x0AmcsJrMD4lwMXCyJA+6wz6/yHaa8CpZjWO3WyFnu0CchQgFwMCJkTj3eNfhMvyk8zRd/qHLpd/oKkTtdn+FrIyB3pIFmCTfohI1i7oTpfv0058wgiw2plWE38GH3VEMPyz6DvrFMiate1guZK6zQpAPJgSia8+NDfkBtDyI0f4u+HQ6r3lpV4T48A3QeXqyhcNpHGDbV/KYn6YW86f+KoAQ19rNZGFdqVggi/mMz31kbHwYmJjIqe/ZaE8fphEzPiuOr7uf+P7A+PO5u/29JAX1jwaI5rBuI3sqYwPmnot8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKOL6Wa2wBT1BCHr8NhAFMUpsemcy1KrKNDg3IW4G+U=;
 b=AdHZy8LAvEVwpWEFTFIMNmqcIb+5iWgksRicaBImHLeBXpF0ec5l69RMY6AT8efEA5aF+d8KPjerclCPa8krMwkZzAS0i2V231E/1FdVhb59cP9LwrPnczACzgVaIOcC0KPCPLOUAADUiQ6oyVpxwujUTiZTA9C/n3UbE1O7UY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11030.jpnprd01.prod.outlook.com (2603:1096:400:390::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:12:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:12:37 +0000
Message-ID: <87pmblho1m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/10] ASoC: dt-bindings: renesas,
 rsnd: #sound-dai-cells is not mandatory
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:12:37 +0000
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11030:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9a368e-8e67-4d17-af0a-08daf370edae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFOQyEfwzEVlQG9crEHrRM+60imRorFMO0RW3YuH/OoeMKG8YI6HLa5YGKN696BpZ5uSLWJPGgS7snbKr/0OgDflmkfkhNsW5oqYXZ9FqNzpzDY3vWX6GAI9FT2JHlAaax1Q0iOTu9waej04hZadYyS/2dBA8TmKGtPkaeyqkXoOeZpsVzBWly7LsxequT1KJbo2If/1Cc5VoaE4zIk3bUesrks44wELTe7l8g7xLwDCQzDknAEpUbrWirpm2GqttkaFqldfV/zdLQlXK1N2yJHxXMEuBELrXtIRnRh3UotcLcilvRbDF1VCn0BVfpmfiohNAdbMcH7HizZWm6H7IzsPGGj+pf8j94njgZ3kK+onsaF5+LbAbowgdRupxD4LuBd9v+FOlIRlX/pYNLbaeSlDEfuQK6mbh9AKvSUMOnO02WTIL/7qWRovg0LSDVM9ijtBu2zNL4oli5XnRMTQ16rse09OvwBkZCu4nz1DFYiqozVhTlg0F9getK5g8oB5sjC/YPFy/Z+7yjUBsWM4kXZZfdxi1ne6uI0ExGM/mMC9/fyK1UHzXbFLL6T742hs1inRvHyf4GdeLXUBFLcBOQEZoqc5+Voy/rhLtanDKSreZVLxzVI1emsPKcy/kb1F3NHvxSL4aGGRnGZ6vTtncPYqi0llRnN7S6bp8fCoIdCDvT8Bur+WWMCEngoIrg2iiprpKY5xQGdRkHXS7YiVDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(6486002)(6506007)(478600001)(26005)(186003)(52116002)(316002)(2616005)(110136005)(54906003)(2906002)(41300700001)(66946007)(66476007)(66556008)(4326008)(8676002)(8936002)(6512007)(5660300002)(83380400001)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8naXLm8+G8phSzF6u+CRhRtmqsaatKv/kKcpLMM2B227lx4yG4EduAweEqGo?=
 =?us-ascii?Q?oVSrsYeHHrZFMRNve+VigLMc4oeIkIZ/cEiE5eBYE4vcD3WsJN871Ui2dtuI?=
 =?us-ascii?Q?g14s9wmk3JSW+T8JuQgSZjwb8tIS9IiKzfbVZvhQ0uddzYUrfOrxOxjTb+L1?=
 =?us-ascii?Q?i8oBY88z7oTz4MsNNC5dSlaANQuycLWolXF4/F6tErrBojbcUVl674l1JpGa?=
 =?us-ascii?Q?IqoTeBrk8NcOzpzpAb3NF+c+kfwidHRbjubygHz+jLHgTfa23XjKRGfjWS03?=
 =?us-ascii?Q?nqzBSDUDBLfNjSG6j9LdpL/NsycjTgeHIAbqEP5RPyf7hm4xgzydu9zaMgYe?=
 =?us-ascii?Q?zfcCO1YkEreR1ODXJt2POlBI1zxoDOzu55GecB52I9bKiT4jE0EMS98c1Zk3?=
 =?us-ascii?Q?DU3RbLvOkRosgENGE1Fg0PT4TMY4bmp17Egjnou0HH2IWgMf2zaQb5+PMpr+?=
 =?us-ascii?Q?v4h2ODGMi8XxcRQAY2LdGbExCM+di6uL7K0Z3NUusPFtS4bKwM81OR99Orz9?=
 =?us-ascii?Q?Hl6xw1GqzoCyLWjwdBekOse0Wex+ZiTNCxx07NRXqlBJb0HkSokjj3JAoN3l?=
 =?us-ascii?Q?8Au1GYZ6a/N26fCedTSZF8jTGV8ZCPK3CKrnJmJEXRlS0764b+7jTurbe6j7?=
 =?us-ascii?Q?xd07DYZcEJbKhloUEoVDQYRgdv+Lkk2tmVpWj6+pao+Vrjb8erc8rTqaEK91?=
 =?us-ascii?Q?+wL4IOqqjv6FrcztRWSwYEMMoQQclMpqkMGKO1xP+V/Nhj+VWNV5cX/DcnMe?=
 =?us-ascii?Q?87jo9ysd4huTUcBlOOxAHry7TTQH3LHT+oeB1Le95CO/RwDKklc/0ZNzpFjF?=
 =?us-ascii?Q?6yaS5Bqu9dHLXpuCmDKvUXrM2LzaVOtc1QSQwkTo+7P85rup9t7WWcHRRw7t?=
 =?us-ascii?Q?SrxdTotm/T5X8Q7SxRsnzORzN/NE/tpzzLrR9kqKusXvS23hWaQmmo3jRl2N?=
 =?us-ascii?Q?IrLloSdcvgCwWl2UStrVqkBl0OZaXnRErHP3XLUukA19yC3RKcbTNPH6J6Tc?=
 =?us-ascii?Q?sxG+PzUG3RoCCLm0jMMtbi4pPRWMycX6siB0+2AUoZOZX9Wa0D42Tf03EOpA?=
 =?us-ascii?Q?Xg/lKoJ8XvEzI95Ff1fLP4T5dvGjb4nLOknvnJSVXRweMe7Y+/vWVE5Skf11?=
 =?us-ascii?Q?dHl0fVsd4ppxKm93YRK+jNm9UyDg0lufeDBoNV/JYh/E3jm0VX0b+o0VokQx?=
 =?us-ascii?Q?0HaI2X+8KVqve1r+g9d1eukqWJIFjd5gFuGKRss60QhQbB26/cEts8pyl8k7?=
 =?us-ascii?Q?QN9nGGJwDVWoGf6V2gDyTmdNpmWjRk5H4hUo9uDy61XvNH7jhtpPb6ok7IDu?=
 =?us-ascii?Q?4hWteYrr6NZNwvKX31+iRdbwudGpX6UT7mJFrM/F4f55pzn+8P/N0Y47N6G6?=
 =?us-ascii?Q?ZQG3OHXjBTPfVJEJsbyAKkGb80hTu78whQU/XuHQRKBtWQvQkME6Ay2g2U0t?=
 =?us-ascii?Q?gGM2r9xwRKLm1goHxVcyn0lEK4mqAC9So6hHa8x+Z6QVbQjuVKVXWu1COCvW?=
 =?us-ascii?Q?MkFuCUX22KnDI6vulovQj3IaFocH47hFD5E/EJnjvy2guxQ6fNMGqgOwi9rh?=
 =?us-ascii?Q?5Xu+D7tFywIgKuLaOk0AqCYpOpa7CRTbb1wvL3zs0yduVKNeR7cIijj720Ho?=
 =?us-ascii?Q?Pd83PwXUFLLfACck7pQuTIQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9a368e-8e67-4d17-af0a-08daf370edae
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:12:37.7443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zDIfRd7lZbpC0X824pmFC8FbFGDbHtpw1U4uIHYUcrp1rNyBVvGabElfptfRJp7ZW4DbORx/Y8OJjZ/1EQlgsIruWYXHW9hwub9HZBNPZ9MaeFP7PEIFpikmNBnf+NW
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

Current renesas,rsnd is requesting #sound-dai-cells, but it is
needed in case of it is using "simple-card", but not needed in case of
"audio-graph". We will get below warning without this patch.
This patch fiup it.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb: sound@ec500000: '#sound-dai-cells' is a required property
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 6ea8dd74932c2..bd3a98efab5a5 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -68,6 +68,7 @@ properties:
     description: |
       it must be 0 if your system is using single DAI
       it must be 1 if your system is using multi  DAIs
+      This is used on simple-audio-card
     enum: [0, 1]
 
   "#clock-cells":
@@ -290,7 +291,6 @@ required:
   - reg-names
   - clocks
   - clock-names
-  - "#sound-dai-cells"
 
 allOf:
   - $ref: dai-common.yaml#
-- 
2.25.1

