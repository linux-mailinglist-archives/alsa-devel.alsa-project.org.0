Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B26116774D1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 06:24:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB934393C;
	Mon, 23 Jan 2023 06:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB934393C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674451481;
	bh=SM2SzpFzK4MELTaDEr/J9G9pWQf87miCKEXUKYHFrIc=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=lpd9jf8l3YY0y7xarMAvyb/0XMsm2nitT+8GyfW1hTId/mJUOaWU4D5KfxlJfJsh1
	 vukLYNnQvhF9zhDES4ppsMdmuT5sx8jMFsuIm25Y1IIu9zZyYhMXTLxuNp8A1pjMtO
	 hLie3cPHVSC0n2UAFmn7xh76T46O5Rc1eD968Z5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2624CF804F3;
	Mon, 23 Jan 2023 06:23:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF93F804C2; Mon, 23 Jan 2023 06:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2117.outbound.protection.outlook.com [40.107.114.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC433F80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 06:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC433F80132
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ILlwlNu9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BofGc5+f/fSU5Yc8qw9Lj6nrZM+iU24agQMFDQMux9+cxP9dUSwBHZ5/BsKPuW1JQCV/6phWeCiwRFl2C3esr4SYU68ERdMo/Um42O3uSFV8MPpsYaIJqxR8qIZA8c1L4797mSgGshmafi3sukBBHruAgb5VZc4OEInCUyIXqOf3+jho0AJWKeNbI/XFAat3xMVmaxqrUp9UfTitiGkmDlZ7MAoA5ocG+OYKzAsCSAOFkC3JdlvExEDWEMfJU1AbOEED9iM2lo82hwf6DYgn+7QGSwOYL7nYZQN9iLIRCDvdReh0lXWnc65VtKpKnstRWubwiUZpBx3QzFupFu+mSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4o8+U2aacEdkPLooabt5MlWdpNpYwEyfKAaMHBYRZs=;
 b=SmBm3vM81RGZh85W71UcPylt0tQYgd41FyqFeAbxuqE991RvTPLxcPywZNGMh9PIANBYMuWqCSXWsQLhyQN9udNZ+Wsrx+qlVWILKz9LPSnl5I2fdYx6KAx1RB0M9/wx5jG074VnrtGPcxkblY6JqkLTxhFm33ZDjm/RKFC06Na4ASPXzhTwL2RPaXMxeIv0e43/cm8vvfIG6/xyMwR8+xm8+rLqnOTzadPw0JqUGDhh9aQvgRSZPumvMi8Q+rKwq7McOXHv9zNout773PAOpD3qplQH0P2xAWjaS80jF63ByVat016fZCJMGIIdOYeeMRFhFEUJEA4aWw/WOfOgYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4o8+U2aacEdkPLooabt5MlWdpNpYwEyfKAaMHBYRZs=;
 b=ILlwlNu98F1Pe/nYp6xjeEsSMF4hLFcGRPPTBcPqkUkFWLx+ZO3idLZlb1QJPij+xWe5nk0NyAzTl2POhXo50P78C72IA0XiTDBkRToj1Xj0H+YE3UdrqJ+jJDNEDaPO0ZVHtkzdXTcMdxrdzm+ss5tHSeC4kNQ2vkvgZ3s67zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11546.jpnprd01.prod.outlook.com (2603:1096:400:38a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 05:23:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 05:23:22 +0000
Message-ID: <87sfg17rjq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 00/11] ASoC: dt-bindings: audio-graph-port related update
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Jan 2023 05:23:22 +0000
X-ClientProxiedBy: TYCPR01CA0147.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11546:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7bea05-b8ef-4d65-361d-08dafd01f1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QxuTjoiHhr2HSMiXrtkeqfPomO5/mn26en69rmj5tZrmZTVuIhPYpTevJJV7BwdpXlqlrC7nquqjYOtEwvQCKb6uh+6chkmdBaAl0QqHYiBEQ89Rdw68E7y73OOJcvqKkVepx0/J82w3F2c9zNW674LkJekxVq45obcLhAXKa9II6OOChExM1z9SunukgSQ/XcHYvZxwHt39VxI9tn7vXDtjfhSJ+M3qA8hxQVQjDemuqqjrP5vzZTRBxNIhiuVH3NUIof2K4ThpBOlKbjwTfFFdeD8vGhWqixthxuJgGf6mp/YH38pFejSfJFwDriOn3vtQtgNgr7vDltvSkGXKgblNxVpkBRWd32e0YirZr0BDeKZoLMxUbz6T9esVse4huWbliBnjwPm4u7x6UQzp79TEyY0BAeE9hfkfA40OcIuMdo1nMmA9Fm9gJvPh3ugoIpdv6xYA+zhQDCDYcjfN4xZTTw8mMIx7FtuYM3I4BMFld1pJyyqRbDmjoK+ZvJn9FVQCO9KFLl4jJaDNpwhdGUxRMq7wuJbJVVGV+lygPCfQ/umoZTLJQANdvPKK2617RBALQrRI/tJvCu8y7PJ2MfdCEx9ZZznxhWNaZSzjAt/j5sl5oKb5w3yXR3BE2Pr1Pi4zUmmz8BLYVYr0CPNijPniHpO+rMoUJvGC7MCUe+xDnD9FxdHY0dxLb99crgTnrJhsNH8aJLeIP2aQWoHdYDbDshQWCb8+8q2LUT7hk10GK36dkWHOEe5UaY9X7+cXDyn9ATunelj3IjNKDlaIwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199015)(52116002)(54906003)(110136005)(316002)(41300700001)(8676002)(66556008)(4326008)(36756003)(66476007)(83380400001)(66946007)(86362001)(38100700002)(966005)(6486002)(478600001)(38350700002)(2616005)(26005)(6506007)(186003)(6512007)(2906002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?brdZnAPfbtgARBwGTsm85STG2oXC62ll+cuxNrN7D7diEJHDiog2ezugDtCs?=
 =?us-ascii?Q?BbyM9PFngF1Jn7LxkT+sbdBGSzv1sMiYs95VIUMqY0mMOxX7BgOmeAzMarM5?=
 =?us-ascii?Q?CDNl97D1kCLLfjWF5P85B4G6iUQfHWKPUUe+xaW/7v3K8acqQyjztWC8PKYY?=
 =?us-ascii?Q?WN7Wxg+mPY4a7ROkqpjd9UKde87W6Q4Y6AN3D3kYgZq8Yuole9mPAuMBM8vD?=
 =?us-ascii?Q?Ww2YqwkvwrQt0xtFhgylgC2obxZLHqVrTyYatj86ESQJxu4fit2P5B8IJuyX?=
 =?us-ascii?Q?jwrgh/oXQugGCeK42R6ZwGekhmDd9h8ZAqe48g4Pzyj/+BbtgC6cYImnN7CU?=
 =?us-ascii?Q?YAJMnWLOnsb3Mg4k/0ABZ2kjA5fqhgiM8LvxH0+CVKyPQDD6ZJIJaGUjmpLG?=
 =?us-ascii?Q?zDPurbIb/rMdpgsFrD9HBur4Q4gpxu/2E8bMedTtrpKhm0Eja+f/Mi7BdEaL?=
 =?us-ascii?Q?0nnBHgPflfs+TJ+G63AG3SdMT/DQ3DJRK/Y8Kqxxrl0DtZGbVq365cufP9bj?=
 =?us-ascii?Q?s1LygVCk/HZZhF3I4b6p0MLLnrIwMwO5uBPrPPSAw6B33XlPFhJi5P3tqpei?=
 =?us-ascii?Q?3iFpB3+ZqkbvK9aJa+HpYcWaqcHKF5welAzEs2ZF1jGrSaJi/immiz65Iiw9?=
 =?us-ascii?Q?cwTaDMpl5MBo1JoR9fixHT3X5w0ce3tPZa4Wpuf7+04JfPIUe8Jzf7AFo1QX?=
 =?us-ascii?Q?GKcPV6E7EnaahbHsVWsC41gV+tOjkZYVxXEoARrxT1Jt9cQuIxmLnf+Tr6HC?=
 =?us-ascii?Q?zV0wFGCfxdEUizh8oilC7KXlN73+3vnp6Q0CzEf/J7aGxc9K/od4jWFfoi9L?=
 =?us-ascii?Q?26kQE0Fd/AfHxi4+4PvkG4EUmIxeGMj7821lJp1ENlcbWx398NS4rl8Q78iP?=
 =?us-ascii?Q?vCeuoyUnX74UdzrvvfJ3vQLgcfD0BbDysJkx56mGX52GdPe1PREMZkvkdmrL?=
 =?us-ascii?Q?XDnHFi2XwpaLDuMuQbt5U/jQ7xAgpfvNTgum5LY7DAbSUVkKH7nfEJ0WsFki?=
 =?us-ascii?Q?RHPH7ljSTs6OrH5sS3Uq4i6TBhsMPKtzGT4ppRiuRYcoQyeqKPGq3e2qKy5X?=
 =?us-ascii?Q?mfawF3FqwhsLvW0nvcAjc5lheRW8U7stvDejScVQ7Z1IPalC0ZfhzaTHm33v?=
 =?us-ascii?Q?BkGXwOB1OHhNxYmGFmn773NDaxy6qD88x8kHfITGK/270K1j5LDdPHG5RKnU?=
 =?us-ascii?Q?ryQKZkdRQ66HOfPiFlpJQdgIMVPJCzj0LSlwhzrMjB+dVN41HOfpuGMkdzeT?=
 =?us-ascii?Q?sG3dYxPQKugIzNRWiK30FP2uPhBHQWxNLZdWxjWm7vuPdJpeAmHynR1IVYoU?=
 =?us-ascii?Q?PtPbiJ1a5ZfVz0wGJBeUvysfNP7I8YY9j+CRRvo//8WWTxBzNOHZuKo7IpO1?=
 =?us-ascii?Q?oKfVlhpgJznLLPj+GBMQeYGrdubfxYpSSQDNlOnBLZgNCgXAoBoqWQTgFk8X?=
 =?us-ascii?Q?jY1fI6c/wo8FLAWpejiE+uheXWLStcL8kZzR+2KCEi8XIvzZ5sloy1wkoiMd?=
 =?us-ascii?Q?cKEDpowQLOgLHOXUuzS4GKZMZW21pbXSdzTkqQ8f3QG8EGsQUYb9CqJdkqc+?=
 =?us-ascii?Q?MdGExGIwJBcCOoI1l4R/Jy/ymAUZJ8tQ0E8q+nm55U3Qxe4l02gpISOxHSGd?=
 =?us-ascii?Q?u5smArRSld+bZPwBrqvtrNA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7bea05-b8ef-4d65-361d-08dafd01f1f8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 05:23:22.3966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlRPMaRP/BlkMIAZeomkiIQFO2GkjTF1ffQfUNpQxAgOosM1k9oEkeU1h2XrPV28TSUmVda8snhkIoL4dn+UqT7skyTWoL1QcBkHUGyHkJsCCeJeTaooLP50N/ViZSw2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11546
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

These v3 patches fixups audio-graph-port, and its related DT schema.
Audio-Graph-Card and Simple-Audio-Card are similar Card
and are sharing same utils. Thus we can also sharing same schema.

This patch-set fixup some Renesas's "make dtbs_check".

v2 -> v3
	- add Acked-by / Reviewed-by
	- include missing 

v1 -> v2
	- remove patch for Nvidia
	- tidyup ti,pcm3168a schema
	  - maintainers
	  - ports
	- explain more on git-log

Link: https://lore.kernel.org/r/87358hj2ub.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com

Geert Uytterhoeven (1):
  ASoC: dt-bindings: ti,pcm3168a: Convert to json-schema

Kuninori Morimoto (10):
  ASoC: dt-bindings: audio-graph-port: use definitions for port/endpoint
  ASoC: dt-bindings: audio-graph-port: add definitions/ports
  ASoC: dt-bindings: audio-graph-port: add missing mclk-fs
  ASoC: dt-bindings: audio-graph-port: add clocks on endpoint
  ASoC: dt-bindings: audio-graph-port: remove prefix
  ASoC: dt-bindings: ak4613: enable Of-graph (Audio-Graph-Card) style
  ASoC: dt-bindings: renesas,rsnd: add missing playback/capture
  ASoC: dt-bindings: brenesas,rsnd: tidyup rcar_sound,src
  ASoC: dt-bindings: renesas,rsnd: #sound-dai-cells is not mandatory
  ASoC: dt-bindings: simple-card: add missing #address-cells/#size-cells

 .../devicetree/bindings/sound/ak4613.yaml     |   7 ++
 .../bindings/sound/audio-graph-port.yaml      |  65 +++++++----
 .../bindings/sound/renesas,rsnd.yaml          |  31 +++--
 .../bindings/sound/simple-card.yaml           |   4 +
 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ---------
 .../bindings/sound/ti,pcm3168a.yaml           | 107 ++++++++++++++++++
 6 files changed, 184 insertions(+), 86 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

-- 
2.25.1

