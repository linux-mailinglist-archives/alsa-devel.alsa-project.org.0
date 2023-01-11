Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 408F06650E5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 02:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A78C8C36;
	Wed, 11 Jan 2023 02:08:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A78C8C36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673399336;
	bh=CjZjh+LUNn5XrLdDna8FNkPoMqLLhvcnHiAotVggKcE=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=SyVKtCDJfzn+PUIUHjBX7C/n0VFfUEwSyps0103B2r0+E9kpr1j0NnDWWHJqmQRY9
	 H/XlusLzXvpfqy3eQMGlN4CcClGotesO2udznaWcoa4kCZZWgkm/2eOAb+fNeczsp8
	 aCBiZKebrFODem87AmETwtnehlKRuhHRfkkzlork=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E54F804CA;
	Wed, 11 Jan 2023 02:07:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56277F804C1; Wed, 11 Jan 2023 02:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2092.outbound.protection.outlook.com [40.107.113.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E293F804BD
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 02:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E293F804BD
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N++cVh4A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWfaWAHR+yEIMrAYF0cLDlgSZXaFECFeYzeN/wH0JeBYjWoscECr9ixv+mUQHLIG0DztE9rXr5qCvuu+/JZe4wkl8cFr1BUhExvFuhpsYaZ1yh98ENzqU7usIJKBgrL1qrtNFKONIL6siGMn1YJKK7Bl2yy6rwE+Cm6hry8C18YiZPUW4YiiYfuMa+Fr5tx1JhdW0tXq+9PnUrbvrD+ylZUDNie0QcMHz05ZyrEGPNvjlzjcyi4DMdRYhvPQ7u5b4rF1QlngdxvJEO5KRH1oVNhgK2mflCTZ9h5jyyNPSoDG0FldjFesrJfJFdOBXOsTY+VsYBbefObZLjKDSUeYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnFbZvMOciBiynGoUTm4v6E+lfpdM57zR2+C6zc9lns=;
 b=blzaaAzDb5PbhoFFyw2C+x+mC/fs+sY6f+0ykWonhz/GlEvrTuIyC+lciIFNMfxrDLcXF/7dMpnerz5RHbHSZs6BhYZ2Cpt9zbkXtAULmmzyPavFrU0E3sRX70k+nC06bZ/4M3gIpB0Mtp/ero7bPGkqp7xTc3UFw/yseyDfJMd+ZdqgnWi0MRPA+sPqR6KTdxGRzA8pbC2lN0ml+syVXXrIFgmHcwSS+VHsPqo7JTRgfjvWrRmmbN+01t8TR08rF97BraZchym2m3l+czR0gBTgE6SQiEg3/F9ef+nqUap+q98Wnts9hy0NgiwrtQdV3svCJjNXUsqped9m3eaqug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnFbZvMOciBiynGoUTm4v6E+lfpdM57zR2+C6zc9lns=;
 b=N++cVh4AY75gr0D6gOjWIT3BOBD4FwLMoVclGd5smPs4+3MgTiFdHZd7Tv6olsa9VXgrMeaPRN2IyuuO/Zt4jMCBb8IzMBKc24gyUBpzK79vMftCjgX7H2tfJ2crbG8w66KnXcYCvY218auhFjC0LJy3ul3NLdway1h+SRF0viw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5970.jpnprd01.prod.outlook.com (2603:1096:604:c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Wed, 11 Jan
 2023 01:07:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 01:07:41 +0000
Message-ID: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 00/10] ASoC: dt-bindings: audio-graph-port related update
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Jan 2023 01:07:41 +0000
X-ClientProxiedBy: TY2PR06CA0048.apcprd06.prod.outlook.com
 (2603:1096:404:2e::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: d63288ce-73a6-4569-a7b6-08daf3703d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7kM9G9K3zBNn2jRICXkSXVCF8GdKU7MJNP1atRnqM+r6scfGUvi3LUS4Rj7NS78Krchd63TBYjb9mo/FZCBRCxwVqa8uHDkzyI3zth9mHFqyNbVRbvoqq+yY3u6oe/ULu0A4p1pe5pIi4LgsSURtoEZgoDDXYPjHpiWC/9ypLp5fUsTztKfNc+MGTY51kWmvcTC1dkHnkR+/6iI65JrwvAT4Se0RUEC+Zb6U7jZR3NnupsDo+FbJRA2dDOD7DmsfWRB+ewf1ONv5a+ImV7FAuDMoFnd4335EDYng7IW/PymFgFja5b3XW3lqo0HVofrlyKSbio1ScNUgnDKuHdZ/Iw2z3rSBEzE1ICQRfkaKJReIpSojkk4wyfDLW+6LSFEzOoEI2fIDg+LKoQdoj/yP3TCTqJgOvZDkujzQ6HWmVPtXHiRp+x+nQN9wq8AnFRv/1m6CtqoBp9EczKZxIzJWflWWzSVX51Wk8SCoGiFvUebujPIIujIEJjf1D1YIZ8Nyhd9tKz+dP53uBdHwyH7pTz10uFd+1brrandRXLzwM28PXGteJnlwzOf8VyFBTf2F6YBTaB0Dnioi37e41SH+gZt9bDZZtMMMbB2Iglofcy5niC7QRp0uhkbSn5gSvO5l3zrqCtjJHhmMmUh7FIyEZZtOtRcznnUAEb4V5kB+SljA+W0Bk3XM7K30IUtZViEuC7sMN0tZ3IDE5VpRmDYmFYWZBC49gCW6XUDIHUautg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(52116002)(2906002)(41300700001)(54906003)(6506007)(316002)(26005)(186003)(6512007)(2616005)(83380400001)(66556008)(86362001)(8936002)(66946007)(8676002)(4326008)(66476007)(5660300002)(966005)(110136005)(6486002)(478600001)(38100700002)(38350700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?frB86eH46zCd34Us+DMULIZw6Xjq18YgAC7h769PcDPVCI+PcDseygTDJtHr?=
 =?us-ascii?Q?15fC3SEUPKT0s26tfy7QwoClQ9PRQh56A+Kkhhjo/6OIu0HxqblixVjmVH3v?=
 =?us-ascii?Q?wrXklYx6dW4/wnM4OyDRHyiGRxjAIw/1FCoECA+PDkIS1bWcLlXQPoU9dm18?=
 =?us-ascii?Q?6w4Ed2T1sR74ODArrVwzq+yWHpaDz/hGkgI4PkdDG58JcTiu0jGnNeSNqoq9?=
 =?us-ascii?Q?IBY89Asx0cXe4AD4yfRksKzGTCwLhwWSR679U1BDDZcoYT7Dk11a/Uy3msZ3?=
 =?us-ascii?Q?6faxFZvHlY4I8RcIHK9JaRcwN1Z6YY9dpmlOXpaNmzWJEgxfLWHkzRoD1oRh?=
 =?us-ascii?Q?ihdUFhj1eAUcJwS4H/jtZxa23Ijj/1PzE/N8+cEuX3pFlZmyeH7gB2ZjcByS?=
 =?us-ascii?Q?59XoYRNsSUDBYAlX74IPueYoVgjN7aH/QSjLgxppWoQ3FtlNulxP77SGpuJ6?=
 =?us-ascii?Q?oHp6z8QoNV8CR+NeVk0+cZ4ld/hrNXZdcciW6B3GjEd8m5wjZHJaPJjfSxiE?=
 =?us-ascii?Q?mbrwY5/EGF48K3+RU5+GrTyqjXvOnCSGOLV2oDSRWXqHg9urOKTTnVC3QbLw?=
 =?us-ascii?Q?JDfcnuLwEGf3y8gvj1BwLA2YWlcMtwFNg3kBLrmFA1Gv32gKACYOxyJjLTlb?=
 =?us-ascii?Q?S0jVx89T/wQKGuhOduO1nw65Kep5+O/mEhwF1ZQ7GGiDXDf1s2MI/n7lUlDI?=
 =?us-ascii?Q?jAawHsOQBN9pZnSdIKB1B02X+QszQ5wmP1nhTIwxXJeSNow/oxUcSeL4s/wd?=
 =?us-ascii?Q?WILJGAoImnu1LkUmyI44XNBK5Jfd4oWQSC8Eourw4y4FRZLsb6Kcr2pg/wk7?=
 =?us-ascii?Q?ENupJmCWjeueHFNoE89Z+rQrW4AaHda8wpAATlH/gdELGIFTxHsy6VkiFIaf?=
 =?us-ascii?Q?SdPUsqEXPtvKglAQ/2C/NR3ZrkY5kDQV+jhCvgM1Rsf0n1i7ejiH0ejhUEeQ?=
 =?us-ascii?Q?9Zu/+J6qg0XEBBwkqd+0yIJ/MZ4IGSz0LJ+YPga2Eey17VEuPWW+ByXlbHy7?=
 =?us-ascii?Q?GGqks7n9ma8nLMw3jKw2S6TUFm4a51SAe/Kdk6Pc3+bTg3DvryfahxShLkLA?=
 =?us-ascii?Q?eqBP6OlSBioKGBDUTc68duX5p4tya+4KyAbpqbDyMBUVXM3vE0+RtovilETA?=
 =?us-ascii?Q?2Lpb7twp7tXP9W6XOMmCHjTxbkB88Mix6qlHtMncp/DXKGTzHnzkwmmcmFr2?=
 =?us-ascii?Q?tHcCMmv8zHIJckaY1HhIYRlnd8zrS+UZt9+YDxrk+CoQvCTZI2rp4+cF09qM?=
 =?us-ascii?Q?uDDl0aV6nB58XC7LZudG51/cYnkkycasPlTqwzOJGb9gvg4b3g/w5Dy5hdWJ?=
 =?us-ascii?Q?1rw7d5xLiyhx3sbz3jY5FJsYSOzH86iRAjhcZ2oggR2JH3d5zigeC+jz2WGx?=
 =?us-ascii?Q?tfmkAX9FXw0W8JcyYSJe5D8+SKprKRPs19IPHuaIvfr/dzzG2nmAaWXks4AK?=
 =?us-ascii?Q?sIuJazYwxgPq+iHWUKfLdUiFYIb2sAxdOla35TqW8b5z681fm78fu6uzYwS8?=
 =?us-ascii?Q?ejobB0xIHGzY/ZJd7cJN4qyqwTsy4kUVIzw9MQzsP1I2Z9t/kLoln4Keux5u?=
 =?us-ascii?Q?+dQE8nEPbYLghgxMZ61gEixGe0sqqjMHzRIxjHf5MUIYip8RHgPrSoBG2cHt?=
 =?us-ascii?Q?/z2Zq8IqNtwANDgQZ/9PFPA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63288ce-73a6-4569-a7b6-08daf3703d20
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 01:07:41.5033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m0aicwunsDFz6Wq4vaHKyJkYF4fpeKCGY1/tcN5doyxApm75lB014iAWMBzbesZRI2wzb/9/QCA/9sWs9Eumirae6nQIGSurEkLVGmAz5W2+YZj95CUuJl/as9iuiWWM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5970
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


Hi ASoC ML, DT ML
Cc Geert

These v2 patches fixups audio-graph-port, and its related DT schema.
Audio-Graph-Card and Simple-Audio-Card are similar Card
and are sharing same utils. Thus we can also sharing same schema.

This patch-set fixup some Renesas's "make dtbs_check".

v1 -> v2
	- remove patch for Nvidia
	- tidyup ti,pcm3168a schema
	  - maintainers
	  - ports
	- explain more on git-log

Link: https://lore.kernel.org/r/87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com

Geert Uytterhoeven (1):
  ASoC: dt-bindings: ti,pcm3168a: Convert to json-schema

Kuninori Morimoto (9):
  ASoC: dt-bindings: audio-graph-port: use definitions for port/endpoint
  ASoC: dt-bindings: audio-graph-port: add definitions/ports
  ASoC: dt-bindings: audio-graph-port: add missing mclk-fs
  ASoC: dt-bindings: audio-graph-port: add clocks on endpoint
  ASoC: dt-bindings: audio-graph-port: remove prefix
  ASoC: dt-bindings: ak4613: enable Of-graph (Audio-Graph-Card) style
  ASoC: dt-bindings: renesas,rsnd: add missing playback/capture
  ASoC: dt-bindings: renesas,rsnd: #sound-dai-cells is not mandatory
  ASoC: dt-bindings: simple-card: add missing #address-cells/#size-cells

 .../devicetree/bindings/sound/ak4613.yaml     |   7 ++
 .../bindings/sound/audio-graph-port.yaml      |  65 +++++++----
 .../bindings/sound/renesas,rsnd.yaml          |  27 ++++-
 .../bindings/sound/simple-card.yaml           |   4 +
 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ---------
 .../bindings/sound/ti,pcm3168a.yaml           | 107 ++++++++++++++++++
 6 files changed, 184 insertions(+), 82 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

-- 
2.25.1

