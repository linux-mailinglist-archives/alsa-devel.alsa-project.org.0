Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EAD72F0E0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:19:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7411E820;
	Wed, 14 Jun 2023 02:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7411E820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686701941;
	bh=S2p9qErrJuyH0SFKNvD7cq3SvldrQqf91ip9Swx/GoA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C4NWlftfFaEbxVhp5MukgQaenMVwFQlXqer+lobKmR3dOKJcZFtl2+wJALgal4Nv5
	 lg4BNOTAyI2kxvA9SHVCGkeR5l/Dzzy4WLlz2LRrktQDJBRbecVdlV7iMlmsc5zNVW
	 u/ohyuOfx8+iqeAi5G1KjRSSfuubfbSG1+hW5+qU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBB06F80301; Wed, 14 Jun 2023 02:18:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 770C5F80132;
	Wed, 14 Jun 2023 02:18:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0072EF80149; Wed, 14 Jun 2023 02:18:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97137F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97137F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VC2HWROa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lg/sFHcbwtTZYdxHFohCv34KvMzWchWlBJZ9iiW+6vupGBEw3g+o2bMITK8wPv7X4swzk2c9uTcxLwBarn1RhAP0IQ2Ey2QRB1WSEy0h2z3tBtbsJsQBBQ5kvh+sO1HAecoAp8FJltlqv7opVubflzViTvIQeCj5cHpghb4HFoVZcR+DiCyNB5N840OIIYyH3tNFLMr5uB2dxusuURrAPiQ8iy4UfV4z7ggiUEb9qQo3k3YocMWYuUMtyl1O6QtNSwnRkHEI6dt3NLMmSr15za9acqzSPjteZjG5SxH5XlIHUUm1FCjAY6ase4d4O915X4gbXHCL/4zL4pXh1CFT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRbeJ4Eat9tB2LVKhPzoEXRYzYucojKJv7QpwqjvM+g=;
 b=UynEoq/4ojDQVZ9bkm8J7c6U0OmTAmG8GcLhvGuieGFSQesbq7zvlJcczxgKDorMc6CDW39s58vLxung1stA6rZhHDpmJqcTpUX7KZnr6n77ieUdnDfNDHXXFg40W+vyxsDyj9oB3BF/FF8ErDYG9F8DT8LYvFaKviOsSr6Yu3UOWI+THf+o2M+9pjOVDZPvvBkUX4AY5kVxI5/KXzE6qhxZDXoPhcbyhC3IY6BOBcSVI9mrM4HBCfJ0tIVNmkhbUvB70vL7jLVCAbzJ0Vdz2qwkqZDTrRptZ6LEiwzDzcWDs9i2oJqpfAK+n0rzZ/T9a+8QJmzVlitlaOV58L+OCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRbeJ4Eat9tB2LVKhPzoEXRYzYucojKJv7QpwqjvM+g=;
 b=VC2HWROajrvGNLR9gKDyGBysZYxZQ8Z4jZ92EFkmO/1Dt6YRWX9Irh9oG2i6t6mqyG1juveWFkxFZI4hUYEO5zGGqZy8sJ8WswvyAmecUeKDpS6p6GQHz/E9IgypkkTk8FnBqvMsUh+WdDwgEolCRIMXgPAk4RTz2i0VRD1W1Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS3PR01MB6276.jpnprd01.prod.outlook.com (2603:1096:604:f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:17:51 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:17:51 +0000
Message-ID: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH 0/8] add snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:17:50 +0000
X-ClientProxiedBy: TYCPR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:405:2::32) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS3PR01MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 312ff263-6ef4-4014-b8cc-08db6c6cca13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wyp8ov6nNRGjHeJzjN7VrHkbOwL/BLY/7kNMBoaJuWJBcRHPFrHVlanIzi+S7TQVM8CdWalgeBgNWRFN4SguhkCgpmh6nV+PgmCZMaIcGevokyyugWYw4HajnpBxC5ZdU45pe78I6H5WfHkJEmLTNii9KVqhkWJWN+b669JuS8Kyl39/+Uc7YmsQ5lgUyWp+Y85RF9AnlLUZ7geF5ltAzXZ/W8U6M8XJ1XKIYciPsjAQbFwwtIQesIfSz7X0AKlk2hs/qjOaQkXCqrS0vV/75RC58ug8p9oHFflb7u+ObJcJaAuO67x3bp6OFzTqr3PJprBUtqwwGApiqkfpPLJaqFdtOF7bBggzRmc9tIVosICC1KUFknIm3j8eqLBmCAOWGcjlmHGx9nsUm+38kkCbPvQUsG1wmZHi+cxaziojbA/rbJ0Cj72M0a0+ONmoQaiFOBJOnBfnnaI7kRCRzN0Lfar/CgOA7tI8m+GRhjVFOfmed36AfNbO25Ke9WWXZhkmELuO1F5n13sDje9ox7ECpfb8Q57l7oAHn2bzpaUH0llNSUJDm2xr+ZgW630lkxXFsaDI9jQODj9Cnepo/GdXpmD/bGRTRo4mhL2t/JT2Devs0XIyeKIUHNez9WP/VLIK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(83380400001)(66476007)(921005)(4326008)(36756003)(66946007)(66556008)(38350700002)(38100700002)(316002)(41300700001)(6512007)(26005)(6486002)(6506007)(52116002)(478600001)(86362001)(5660300002)(8936002)(2906002)(8676002)(2616005)(54906003)(186003)(7416002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CBjHW/CDenQPkNwl8EIUMBa2W/EHIvk1u3mGA6KXVTSQfaU7QT8dfaB8uRQk?=
 =?us-ascii?Q?rpZ9WeKnEzdEGPpPBmD4zG/YQOClOavZGIVY/EhwsXHkLkWZwFIOIkI4UUKW?=
 =?us-ascii?Q?Bgv1xRRXo9jjjgZAKaYTH4XhpSd2PMJYJNRSb9WnylL4jXAjCLnbsS71HuvU?=
 =?us-ascii?Q?3Up3ngP0f3ZQeRP0idUAyqkGVqKFSZGGQz+QSa7tI3lidmemPdU9ABg0huSX?=
 =?us-ascii?Q?lF3Qz3DbJN2z0wP7gKnMoMzb1rKflOEfBCiMXO/oCzKqA7cpoomLFlg/okxW?=
 =?us-ascii?Q?3jHFPzfwCnY7nOHCcX8Kz4ZAjlSZbvQZz+oOOxwAlBvodlujaPlPwmRVu20e?=
 =?us-ascii?Q?7pHDVtOCs9MO4g6QbD/9BA1NdmGjucUJc7JSJ5oiq1B6X7uaHZ2dGXV92bdO?=
 =?us-ascii?Q?w7XXDs8lSVzmpVSsA1B4pFTYu64Q8vJxPsbmMzyef5AhSHqJTrcS2Gw3RsDy?=
 =?us-ascii?Q?UJ1pmxK2IEaAaRTFqpLDAPmG2ubsX4Liodu/DKxn8tXrMSkm5UtViXbX0Bjy?=
 =?us-ascii?Q?swPJYUMXZcFC+1Jbu9OnM/9kHmDQ9avzLCTleLFB0w1M6cnmQ1Bn4coZ1Xbt?=
 =?us-ascii?Q?UkrluM+Si+VLy8S3ykWWeXDsS6hMBAILEP+DNROuCVGc/rR54ZmuFlAFhEkI?=
 =?us-ascii?Q?ML/yBBrEgbbgodTFXZGsuAfc2BTzirtwGooaEwKALCEIVazHq8ZrsJA4OIUH?=
 =?us-ascii?Q?Ty3TTmbKfFOgg0F92ZH5IankqUJUgVuHWBrqLeDMQCfeJ2Qpf6Qha4/WZ66X?=
 =?us-ascii?Q?btusryrZqW1DTFHkrJyhCWjHDwmfpKqIUJe9WwCuSPKERA0XtoqOTgDJJLSE?=
 =?us-ascii?Q?BPxBRpBR3Q7WW3iyB9qVoldIrVs3TWXMWB6LKvyBJHkpU+AORYFEo1/FVh9P?=
 =?us-ascii?Q?FlnjO4Tk+8NtfPqUrQzkZwyjPmbG6x4ZvuMMRmQVG2urAbDhsLjtKXdxGtiV?=
 =?us-ascii?Q?cl5RQ/CT44mSAfibYPW/TRVSFvpRVyFG9XrLe3TyEfQjRJB8GoW6wuEa6gCH?=
 =?us-ascii?Q?8d8kBj71+x9hxYH3SgVwbu++tb2i0ZH0pxjsmo22eqcblpBD8lpozNZ47FGs?=
 =?us-ascii?Q?PGrprHyfEFB7q3Y6INopecgO/MTr/nhIRn04dQgxkPCi5aAa/1pRQd0h2xjX?=
 =?us-ascii?Q?l4chLu+XAUpeypRfA7OuIPohYwGlpLS5h6eTVCJ52vGQJ5lkNwExKAFIXPGm?=
 =?us-ascii?Q?GW4da9pKaaBbDzQHqpSeTZmlN4Jm7W5lUSbdG+Xr4upP6kWHP2vneySzBg6I?=
 =?us-ascii?Q?N7+aj4++XIKcI46PW/WuYvlZI5stsD7hsyF7MhONOruBKHbbXWl+j8sg+jmh?=
 =?us-ascii?Q?t0c936O0KSdV+g4z9SVS+0z+5GS1WgwNFJnbOZnAARMxu+S69ChEunGAv1VY?=
 =?us-ascii?Q?gAfRtwsM7/Brh8m5XuNrAAeyDT565QXGrApy+J046pW5JNBRoG9CA9ioY8WV?=
 =?us-ascii?Q?Y8z1e8Od1MUjXxsgVxvWSke4/rBZ7z1/jTy33BMt68Zh13HJgg1CqRP9pC3n?=
 =?us-ascii?Q?qtq9cqnYJlvER0ZLYcwg6HwpB2+MWZQtHfUrjhiipKtMSdY+IOg46mWW5k+9?=
 =?us-ascii?Q?yDInJb79z2vHvcwFS85RcUv7qSyWACIHF7ol8nB520edsZeEm48ROoiXlUHP?=
 =?us-ascii?Q?TOn/tpwXKfpqJsJRf/0cxzU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 312ff263-6ef4-4014-b8cc-08db6c6cca13
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:17:51.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r3EVD9bc7M51I8pq1aoJal88N39I0dfKHPR+hIe+KRhcAeQHowlUhZEe/bYnvN0e326TY15e+1Lg6mM3edktT+X0Vggib6GrMWJv43ie5aIB0GLmFSnpz3hkvUlrpUAn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6276
Message-ID-Hash: 3E7LCM6QFKVISLDKWNAJXKTYR42HIMU4
X-Message-ID-Hash: 3E7LCM6QFKVISLDKWNAJXKTYR42HIMU4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3E7LCM6QFKVISLDKWNAJXKTYR42HIMU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Current soc-core.c has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component). It gets .dai_name, but we need
.of_node too. Therefor user need to arrange.

It will be more useful if it gets both .dai_name and .of_node.
This patch adds snd_soc_{of_}get_dlc() for it, and convert to use it.

Kuninori Morimoto (8):
  ASoC: soc-core.c: add snd_soc_{of_}get_dlc()
  ASoC: soc-core.c: add index on snd_soc_of_get_dai_name()
  ASoC: fsl: use snd_soc_{of_}get_dlc()
  ASoC: qcom: use snd_soc_{of_}get_dlc()
  ASoC: meson: use snd_soc_{of_}get_dlc()
  ASoC: samsung: use snd_soc_{of_}get_dlc()
  ASoC: soc-core.c: use snd_soc_{of_}get_dlc()
  ASoC: simple-card.c: use snd_soc_{of_}get_dlc()

 include/sound/soc.h                       |  8 ++-
 sound/soc/fsl/imx-card.c                  | 14 +----
 sound/soc/fsl/imx-rpmsg.c                 |  3 +-
 sound/soc/generic/simple-card-utils.c     |  4 +-
 sound/soc/generic/simple-card.c           |  4 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c |  2 +-
 sound/soc/meson/axg-card.c                |  3 +-
 sound/soc/meson/gx-card.c                 |  3 +-
 sound/soc/meson/meson-card-utils.c        | 16 ++---
 sound/soc/meson/meson-card.h              |  3 +-
 sound/soc/qcom/common.c                   | 13 +---
 sound/soc/samsung/odroid.c                | 16 +----
 sound/soc/soc-core.c                      | 77 ++++++++++++-----------
 13 files changed, 68 insertions(+), 98 deletions(-)

-- 
2.25.1

