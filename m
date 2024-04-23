Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 465768AF75B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 21:30:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D3E219F;
	Tue, 23 Apr 2024 21:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D3E219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713900633;
	bh=oEUss2ccXYRZxmK7FlKr7P/HE54Io0MA7b24o5uGmkc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OlbNyOrCfuXX/tN4+XY48CLya7pyZVtYOIDpqTWSWIGAG6MjthM8mC/cSQy6phQ3D
	 zbMLytgYEIMYervwhSD2gOWie9y3LR4YuJSLjb4hNrWTy89kD9LBDLCiQ0/BPV8tu+
	 qIkUWQaoMv9e21i5jK/sfw2zRYaCmUJq0P0qvIiw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E538AF805F3; Tue, 23 Apr 2024 21:29:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B21F8063C;
	Tue, 23 Apr 2024 21:29:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B7D0F804B0; Tue, 23 Apr 2024 10:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on20705.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4440:2::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FAB0F8003C
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 10:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FAB0F8003C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5kYxKv+bFxoFAeipVqbmWRSRsQQyVPhdZoDeJtmMd+EdJkxK2KnKv1W/ZKnXWZ7NvGFOOFMowPlEshUlD42cDWmteXQdX5VfSBWznwfpeOE1DBXgW7xHa0e091ZoA+aEJN2QCR5i6bjd/j72hUTuRIXDf8/PNyEB1EptvEKNiM3KZrx6Y3SadbE/wSD3dlRu9Vjp7q6x6Q2Q3onS2cH8gL5aN9TmEFLFzij4nfS+2lWka6NB9rOwGGu3R6wSW6p6vtbhGFy7MSbN8TA+ujxDoT5Nv3HDZs6YKgbtJeTH+w38hPPdQPf99mLpAc6F4d11QDPaV1rf1ZzaMfCLKnVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1P2lrXNJOZN2ADl4PxctyLQ6KvEk3oVIfydM72cSqs=;
 b=KucinErgQAOZU6T9sbD99u3QD0fU1dvN3sufEFQP6xROAY5Vd8sZvWYZ9J7RYVZz49gYfCArK+lJFoB5aeBB3Esb28Qln5p6U/9FXHaaEJ6vAjB7J2daHEM/DJVsEZXLWPaQHAG83HXhSTWMq3nUEci87i8oyeM03b1f3GEXzMUX2hMOFz+SNdzmlg0fwCNss7X5hdg+PhrFxVohHHdwAtdssEp62l2/pM77GGPcEa8Qxv/OAS2sf1fK6pAeHL7zl2O0iuuRkjfrYIfzufQFgGLcs2NnGKtoLzs/qWCNPg6+GnfqvX1hR5rIdKxtWTEv7AFbSoja7aQ6khSfo3gFNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Tue, 23 Apr
 2024 08:34:17 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Tue, 23 Apr 2024 08:34:17 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 0/2] Add PDM controller for StarFive JH8100 SoC
Date: Tue, 23 Apr 2024 16:34:03 +0800
Message-Id: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::31) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1002:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d19776-5bc8-4d1b-b201-08dc637029db
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W4IAc+0H0Fq7oNciOuV8MvlMffp5bEoHm+qwzBBtErEJcNleyOiDUM3hZwv47YsoGKQ+KZP/nZz45Xep17UnuABD8EIjPxpPmsg9JB2A1puW+dKNJmMYD/1SxLa14CP69VbSbXsMxjt4Lj6cn7O61q3EYjblfDzsR+TbWRKgu94EgvY7DXRNt4FrbVn/hImtCWrcFdIk4/TGTh+uVsGlSBUDYPau66j6z1I221dFni968kvrjDz9Y2yS2GWQSgTEgk0Ce5XffuBLT5dmCGtlJxJg3ahnoc5T2O8ilnQBRSbFEcX2yz75isnQgqav1Nzra58g38dV2/Sa/5zNk6sUjSB3hdynEIQQ3HKzWj16bgLVi0E3U2/d99y+Vr64weIxWAgzfb1eNvGLD3H5FkXv12zOTrNzLyXXKBnaqzxHxT8ajyDKisBjmmECMcNOjwUvLTfwTAj5UeUFSFpa5VJE0N2oF3rJvzdThZsEii736HoLWGcsihuCsDa3hZ3xDE0ZQlKoVkCF5ssKGLTpgbFresuTX9J7yi1SNTLDJBdzxBaG3k5SypBcBMA9j9xFCR8oP9L2rJpK0P4Kzy0m2uxTjWxKcsZM645dq8BIbiQ6OC7JE5Z85SLkllQ332ohD6p/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(52116005)(366007)(1800799015)(7416005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LQZoTE48Bw7ANet3o9Di2c2xPIW1EbudG7FELyM9yniuJtxOYMDZS8akcVJL?=
 =?us-ascii?Q?GwdVp2cV7XAdSeKbUDG6lgK8hZm4VsAK+bUdwbz2SsY2OopGyQk/QM5E6hZG?=
 =?us-ascii?Q?QK1z4uN02pUzoEtJMtD9JzCpHs/3pJ98DvGQ94Y21WgKHGomfQMe+gJdKolv?=
 =?us-ascii?Q?ZV0zBYpbTYrfPCao4FYj++opg2PIT54wvZ7Zm2tVgeHMeh+mSKNr3sVHUmG+?=
 =?us-ascii?Q?GtXZU6VWOpcOxnMw1G2py0EIyWcAqFoPn+S1ZHTKCHdoIM7rTgBj6/a3oQBL?=
 =?us-ascii?Q?nNzP7QS94JWNpiYh+7+wumcmiI1iXEXpt83nj4uGySG0rwJ3Bj8CvuSuk3nq?=
 =?us-ascii?Q?9UtGfzO8RPDVZEwaFQcyq3E0TfHY4ZAu0tWuCEnS358dKIHsZHfqR6Yw4Gvj?=
 =?us-ascii?Q?qbKELWIupr9nOxNScvTWsh+NIc1Ztn2PrfJWz4Uz5WWbfOmZyia5oV/QKtzc?=
 =?us-ascii?Q?xJupcspySWRwVaYMT2QGBNdtDtCoeXCbIVQPOLXorcgv/lh8E9BkJH6s6e7r?=
 =?us-ascii?Q?XZTQCTjq+T3Lv3u0fY3ElE6lZbMtqGHKXgxQ21/qGAY3nv5iQtJh3f7wUU7R?=
 =?us-ascii?Q?0RpNj5B5Zc+qU4MSQ5oSnGDA02mQ0CSZj97Ow/Ujdxi95XHu5eC7RbN+sPnI?=
 =?us-ascii?Q?HLFDwZ5tbhyVaagw4iMWefHy1Xzn/XmgFm5Bj/GSUPDg2rmlueA2ETAU9OSO?=
 =?us-ascii?Q?DetVIfWbLiYJR1ubQtHUYL5GLGqUB0hRPyvpv5itvm68NJzAvltu7DNgfbR1?=
 =?us-ascii?Q?joi1aGfiMME3i7rfukDAob4j4ewfHxVnafTKusq3pqX2dPs1R8QnD3lees3/?=
 =?us-ascii?Q?EzWuIOFnKHKiR7tRXJreiF3iaY44fdvKwdb1w7waT1DMg427/rxkIHvZqcxY?=
 =?us-ascii?Q?5omEEJHIlDFaPbWULLEBDLuhU4xGrr2VCN1rdKZiK+L7jgDdOwQDw31a5xDa?=
 =?us-ascii?Q?T8t2i0cOGuXjoNcOGDpVsFiU4pHPj/geA3zuPSuyRv67Bp3ghEXFJJByhz5V?=
 =?us-ascii?Q?uZwXtiYtpTg6LGrwpyNVdpfttbxUo8z6o6L86nC/Ynnq1HI9mOXcHiOzHm/z?=
 =?us-ascii?Q?T9YKCLx/f4SKXCdyFOkMnxP8g/7fVOC4z/oHrmTbWZX13j7JM7btHcIt+C6T?=
 =?us-ascii?Q?V7zTwUftLBRD6PQqh1KBIc4NDJkq+1Iwv/X5YbervekxUdxQ7k/rlfrayLe2?=
 =?us-ascii?Q?5k0ur2xOYZNi75WPde20bM0E2+Aph2yF6mhn1+k/20qAlFzKO+9StFSnK7f5?=
 =?us-ascii?Q?p6wNas/jNI/lDJu4TgirRITVSN+El4mqdkDihZWHy/er8I0b6KazHJwupBtm?=
 =?us-ascii?Q?PI3RkTtnomHIBGvLIa75kxiGhIOUEU/INRadeGNx1N0KPfisekpRW/Qr6Kpu?=
 =?us-ascii?Q?uPu6jmTmel/mrBlIb3Lysr4YJ73Jji1ovZBmdKhRWUGl/sRrratG4diFSPDV?=
 =?us-ascii?Q?obYfuhs+xgV3fHgPzCuz5jfWNeO14ugPcU5psuskDcTDhyalU/di4G2i/2p0?=
 =?us-ascii?Q?VepZRAJWMoEhssE52AaP38rfKiyqfj/HsdYdZdC5SxZBsn/6f13a/6Ti9DGl?=
 =?us-ascii?Q?UZ0pbDeJDeKU9tkcPu7UjHLwCexqR6tSCloe9YOtfM4rqNF+OXAZanUAqS3K?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 22d19776-5bc8-4d1b-b201-08dc637029db
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 08:34:17.1466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 th2KknMJl81kk4uq9OWWVlYWmFISM9v7ckHG/FDH/lP4oIhdshw8kZ1LhGwcSnTdgZsOde8r3CGhMKtZ+ZDO/Trp3o5/Qco1/5p6+5XaBcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1002
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 55BBCGTE7F2EEYRU3OZUSDXQS5HKYOJ3
X-Message-ID-Hash: 55BBCGTE7F2EEYRU3OZUSDXQS5HKYOJ3
X-Mailman-Approved-At: Tue, 23 Apr 2024 19:29:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/55BBCGTE7F2EEYRU3OZUSDXQS5HKYOJ3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Pulse Density Modulation (PDM) controller is a digital PDM 
microphone interface controller and decoder that supports both
mono/stereo PDM format, and a Inter-IC Sound (I2S) transmitter
that outputs standard stereo audio data to another device. The 
PDM controller includes two PDM blocks, each PDM block can drive
one bitstream sampling clock and two bitstream coming data
(mono/stereo) with sampling clock rising and falling edge.

The first patch adds documentation to describe PDM controller
bindings. And the second patch adds PDM driver for the StarFive
JH8100 SoC. The DTS patch of PDM controller will be submitted
after the patchs of JH8100 DTS are accepted.

Changes since v1:
- Changed the subject prefix of the bindings.
- Dropped the confused property in the bindings.
- Added the $ref to dai-common.
- Changed the kcontrol names and put it into ops.
- Added the reset when device resume.
- Modified two blocks into a whole PDM which supports up to 4
  channels of recorder.

v1: https://lore.kernel.org/all/20240307033708.139535-1-xingyu.wu@starfivetech.com/

Xingyu Wu (2):
  ASoC: dt-bindings: Add PDM controller for the StarFive JH8100 SoC
  ASoC: starfive: Add PDM controller support

 .../bindings/sound/starfive,jh8100-pdm.yaml   |  82 ++++
 MAINTAINERS                                   |   7 +
 sound/soc/starfive/Kconfig                    |   7 +
 sound/soc/starfive/Makefile                   |   1 +
 sound/soc/starfive/jh8100_pdm.c               | 447 ++++++++++++++++++
 5 files changed, 544 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml
 create mode 100644 sound/soc/starfive/jh8100_pdm.c

-- 
2.25.1

