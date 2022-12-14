Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEACC64C1BE
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:22:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195B0188B;
	Wed, 14 Dec 2022 02:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195B0188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670980965;
	bh=0RzzEhEmY4QqeG609bkTaW1uYYkKW3n0vjI3NxDeFfo=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CnDb08MoquBYZ+2LAC7Pqo+qfYcPV/oiUVPBc4Uj9yaaDi4sWqi92qidJszs0fgIh
	 vEaPybNUv/TRzYPRZT6+ZmRcnnYO5id+sD4NUcu7K9xY4uJdqz6p/mAnWAYj9IbANY
	 jZuRRzeyMQfeE3EsE3G+9AFkfiWQDGqAeq8LgimM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF3CCF80141;
	Wed, 14 Dec 2022 02:21:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53895F804E2; Wed, 14 Dec 2022 02:21:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4CD9F80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4CD9F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lfsk6Lj8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5B0Quen0vsHpdsNFktdvNEAeKazdEFEV20ddnuBspz+8Ai2SlR0nzYHGjTrEUHfg++uGD1pcHuNRZYQiPztxZCFGtgrsx7vJzX0R+ZkG4I59r+ksm3ueThv7LjtCwLV871dpe6dyMo0CPbnLsu5mY39yLV9BEc0mHpTZq+ZfiOrIA0OmgLR2a1J4S41Lzbf/eE61SxE3LgtzpR7AY0TytF4BuLmHXKC4eWwK7f1kAnSpIanWRK9iar8sfEb1A55lfunlLmz23H1Rn/jTTglP8dyF1qpZD16Ny+0q1lZ9rvUdAbReCjs2X0E1JHS2AA7rwWDUnrvU089ZtsuanOpcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaUN0D15KdmBe5Vz1JX336KNFpS/G2I2FoANd+mxFdM=;
 b=lJhdoxC0L9sLZutf0qbciEuKvjUaEbcL/twXkodTp5d9qGbAn3dE6LXTsaF20JBejcIAKL7hcAICU7Wj65upI4oDXJ7l6DWFKqNwmtKHI24zEeJzGqvfplJbiA/zPfafTs81/jcyTQ1V/9VfojRJMNAgSMF2iU7gyBTfHOzabDtrneamvr2IRJ3gCO8nCuz/AkKqvVG6H8/FePzGPQUjWsZf7x0NCYtiEkuNhI1PDrgRbfdCtLW0y+TJKlih2padEabbfkT9Htp0EYo5s2U+ce82/PuLqt5EGDzDlU6alKthKBSO+GGuBl98v8CmtvVim0NSssllDUCdWrlg3+vFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaUN0D15KdmBe5Vz1JX336KNFpS/G2I2FoANd+mxFdM=;
 b=lfsk6Lj8DsQsl1kb02jhCSO9XuyWd8/79ta/gcnOqD8TQczKKq05HGPiG5Hqd2VAyBj7fsxJnMAIU7AUIIQ6PMDKO4+K5aT/iZRxfkt2n3b0VQxyk7AoCEIl0OczqwpbMsfpl/YIYZKJX2xzM9KrGgTZo0BEACx+sHUVRZ0A/Qc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9940.jpnprd01.prod.outlook.com (2603:1096:400:1d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 01:21:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:21:34 +0000
Message-ID: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/11] ASoC: dt-bindings: audio-graph-port related update
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:21:33 +0000
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9940:EE_
X-MS-Office365-Filtering-Correlation-Id: 32c86247-0a49-41e5-727d-08dadd7189e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flCgQHdOiyX25Q3iJe/HGIJoO0c4YCdjyDqF99qIbIwnSM/aiWYtXadrIKYPnE+VDtQc2WR4ii9YWTFDNGliA2Ukj10kiDyOoQpxai8nKGc8+ZrL3IfyhMZyg1gu8LP10ZxXvtv9+WV+EEU1JjWepxWVoDwihG4ZPAzsb13HNW5i8iFQ5y1aEtod2UXvGb8zZ4GKhXdzpomvGXeiwZJMVo3tBMb8USWEEcXrwERif/MYsMpiOtgkAdzT/xh4wG7O9pau6NJtM/n92wQw5H6CtQReXtFL3ftsXNRGdJ64AUi8YnWrz3KDJZ51roppV4/yCTfahMgPADzEhfuO2k8UG25r9HZGWq4dx3ngZxDwKBnUquH6rAXx0WPmFzSvhUVgGDMTJeqikIz8qaTARLpuYOYM1fNPYc4xilOJd+o0AIOC2CpRqbZo1dD05fSDDYYGEdPdG5+UvjippCBASd7/auVEvqcj73+uTYiPoY98boWqobRkVfEy6oJKw6q4bpYx86Yrg5OKLYdXd/QU3CZ1QZv1al07RFksMGBOC0N3VlKJvIdEe+W4nVhHgiO7hJyPvWAUfTeCXrdAQU5nxOqsMNYzrJnbseAMn/u9s0ce7DNmg0s0v3WxhOBOWHu6zgWsEq79FpJ4xXTh4oLKnP3u3cVKcsppMhYuEXtDUUXQucC3+cGEDKG/Vrsy9I+C0VHAM4LiTk739ZCv2yRBHEd4rg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199015)(2906002)(8936002)(41300700001)(4326008)(66556008)(66946007)(8676002)(5660300002)(66476007)(7416002)(36756003)(2616005)(86362001)(52116002)(6512007)(478600001)(26005)(6486002)(186003)(316002)(110136005)(6506007)(54906003)(83380400001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?14R/RSf0YzI5ZmQQIA5oc3RU8Xp48iwnasGn7I0cu3BIoRHP17dsunB8a9KL?=
 =?us-ascii?Q?YEHDAXK+nIHHtHK35cIneCdq7OuEF9c4vTZqsM6Ou0mH/fDMrvIQTFnB9H8q?=
 =?us-ascii?Q?Ogo1iI/ReTfh3+HZ1FXCwCaL2X17ijaBVIeJgIWJGtLvDRshnVi6O4DSt8pN?=
 =?us-ascii?Q?55aTNVrTJXrBr+kjJFExUe89uBPz2UefSfOqntYoeLHnbr2KdRWluzX40+NY?=
 =?us-ascii?Q?UOcTE8oCxOz9DqWGAj67qWRDECO9WRX/Os4fWkMAklrW6np9pgsvQtm3elNF?=
 =?us-ascii?Q?Fgjb6HksXKCXniSyfS+RQStkjKNpr0THbIzmMtLUoGBrW0ocTmtNRBsqn4lr?=
 =?us-ascii?Q?IA5iyHVAER0vcFutXnt1fuPm36HTcqWoALTSHGKHEKSu3eTac/3J9XI7Q2MH?=
 =?us-ascii?Q?52Jgf6af4G/XDM3RXmNnwq6k90QzSJAJJbjpeo64m9tDm/SSxxcfLzYjc/qh?=
 =?us-ascii?Q?WiYLzxIOZDHXP6UEzd+GID8GTBrdtPh1DGn2S2RFOrqsNINhes1sKCtyaQS3?=
 =?us-ascii?Q?5tlZWdp1/PMyTwTGMeIJHKo9dWDiR9S6zvb9cDhxJ9oFIkpaNmVyrvnlIyKv?=
 =?us-ascii?Q?qk3r2YUrfpZsW8leDMeHBJKrTJDqs4x6ymjGVswoM2GTJAain/wLnLROak8h?=
 =?us-ascii?Q?g6i0Bu+FAxpaT2M/jk39/aiNk79xzgJPJE28wz5rNz5Fu6PVf3v5lj5ABCUg?=
 =?us-ascii?Q?AgvEBEjWRHPsCZGClI2m6AdLj9qFXoni7F0q9WsYWYd6eMPlEesid4X7fszq?=
 =?us-ascii?Q?taJroYj/6we4Os8AMv3TLvO+DrjxTuhyqiyDue9ZfzRIrYCKI6AKrtS483HQ?=
 =?us-ascii?Q?Y7fdb5Zj6+5GT199LArPV5Aeb+Eh9p7hyWSgtZ1QaFynoGNlWUHxLOxLOFdz?=
 =?us-ascii?Q?fvsJ2kwT91UVDaI8F7xX99LVPFUiSBlkMp63phQFP6rtLjHeCyYgLFCdcTP+?=
 =?us-ascii?Q?o/FaAfS/1MS/j3kPeQ36Ivsf0BAp6Sb3uJgNbaR1cKoh88rGANkiStSI04x6?=
 =?us-ascii?Q?zasWdZQoSRXop6dKGB1XIPgTUOVIhx0ziygpY8OwYs5RLmHsyo9K52kSaLfV?=
 =?us-ascii?Q?ACz+xqmF3ksb5zOXcrbfVcis9e1U7Syy1f9RUvEjkc/P3CF88+08O5h2qjAn?=
 =?us-ascii?Q?nZ0+vwMSdbpQBh0Nhy5gUqwjHJ+zzUE1/qYjCZJ1ObSHPauX+mgx0z3Y8r3K?=
 =?us-ascii?Q?Z6a0u0NJfC/Hl9e/6fthhF8anTcD+XUoQT9pxB6WhAWB7j/g8Ce3NkcASDEm?=
 =?us-ascii?Q?SxkkoWeiXMbQUaonPcHyS8APrOANWg1U+8RqLEHpc7puh3KXjy9CM3Lw3KqR?=
 =?us-ascii?Q?fjKTC0fyvjoylQbtX9m7ZUPA5r7Xyi3pX/T8KbOZS8LthT5C7GsRKlXhpWi1?=
 =?us-ascii?Q?Sn70/u/Wqnbuix+lwoNCthw715L7MmQ6i+CUo8An/0+4vVWElnRK+lOoB5YY?=
 =?us-ascii?Q?Vhj29ijMMjGG1jBDImRadq2f4twoj8U8wrp8pQE3IfuwMwQhZEw5VLxL4wiV?=
 =?us-ascii?Q?Rbm4fN27BQ5+zY82BrxZrGGNG5WxD70y63K2ckKAfdP0A/LaPQjGKR15yeLs?=
 =?us-ascii?Q?QDnI9QVVje609Qp1NToR6g4pBn7JfP4WNQDLXp7ZkCz4YwR1212pnLFSxgwY?=
 =?us-ascii?Q?Mq+6kTFW4q415OB+FfnvaT0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c86247-0a49-41e5-727d-08dadd7189e1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:21:34.1580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXqtu6OkXoE89FsoWQ8q7zJaxaXMqwWehDjLtvIowBxlVSPDQAIYIE0C2IcxvLveeSKyWe0N1innbiy3l29eEYqt3zPMO35ZHr9/5WKaeChcUNA9ibPkOvov1MbE4YgL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9940
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi ASoC ML, DT ML
Cc Geert, Nvidia member

These patches fixups audio-graph-port, and its related DT schema.
Audio-Graph-Card and Simple-Audio-Card are similar Card
and are sharing same utils. Thus we can also sharing same schema.

Renesas and Nvidia are main user of Audio-Graph-Card.

This patch-set fixup some Renesas's "make dtbs_check".

Geert Uytterhoeven (1):
  ASoC: dt-bindings: ti,pcm3168a: Convert to json-schema

Kuninori Morimoto (10):
  ASoC: dt-bindings: audio-graph-port: use definitions for port/endpoint
  ASoC: dt-bindings: audio-graph-port: add definitions/ports
  ASoC: dt-bindings: audio-graph-port: add missing mclk-fs
  ASoC: dt-bindings: audio-graph-port: add clocks on endpoint
  ASoC: dt-bindings: audio-graph-port: remove prefix
  ASoC: dt-bindings: nvidia: use audio-graph-port.yaml ports
  ASoC: dt-bindings: ak4613: enable Of-graph (Audio-Graph-Card) style
  ASoC: dt-bindings: renesas,rsnd: add missing playback/capture
  ASoC: dt-bindings: renesas,rsnd: #sound-dai-cells is not mandatory
  ASoC: dt-bindings: simple-card: add missing #address-cells/#size-cells

 .../devicetree/bindings/sound/ak4613.yaml     |   7 ++
 .../bindings/sound/audio-graph-port.yaml      |  65 ++++++++----
 .../bindings/sound/nvidia,tegra186-asrc.yaml  |  14 +--
 .../bindings/sound/nvidia,tegra186-dspk.yaml  |  21 ++--
 .../sound/nvidia,tegra210-admaif.yaml         |   7 +-
 .../bindings/sound/nvidia,tegra210-adx.yaml   |  14 +--
 .../bindings/sound/nvidia,tegra210-ahub.yaml  |   7 +-
 .../bindings/sound/nvidia,tegra210-amx.yaml   |  16 +--
 .../bindings/sound/nvidia,tegra210-dmic.yaml  |  21 ++--
 .../bindings/sound/nvidia,tegra210-i2s.yaml   |  21 ++--
 .../bindings/sound/nvidia,tegra210-mixer.yaml |  14 +--
 .../bindings/sound/nvidia,tegra210-mvc.yaml   |  21 ++--
 .../bindings/sound/nvidia,tegra210-ope.yaml   |  21 ++--
 .../bindings/sound/nvidia,tegra210-sfc.yaml   |  21 ++--
 .../bindings/sound/renesas,rsnd.yaml          |  29 ++++-
 .../bindings/sound/simple-card.yaml           |   4 +
 .../devicetree/bindings/sound/ti,pcm3168a.txt |  56 ----------
 .../bindings/sound/ti,pcm3168a.yaml           | 100 ++++++++++++++++++
 18 files changed, 228 insertions(+), 231 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml

-- 
2.25.1

