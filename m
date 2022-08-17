Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DE8596EF1
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ECE81616;
	Wed, 17 Aug 2022 15:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ECE81616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741638;
	bh=JSo+RdZKBZ5Fr0AgC/0Crovsw2/M+FB3fawTGwtTnyA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dkg80UKe5giKihXK//dxNMzlNTemSqjcBP8L4iTOjnLENdYqkm7sCHhTkOkdtDake
	 fuk3PGl3QDFkS5FuNEIRSpdLjOYPDh6keKT6DMD4m73TKuZ7YG1i9Gtcg0JdvA54Pt
	 TSkcTxT2SO2F4EZ0Cd5Q6SKwSFuxsSMizlKUsUuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0675CF800DA;
	Wed, 17 Aug 2022 15:06:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89444F8025C; Wed, 17 Aug 2022 05:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-ps2kor01on2047.outbound.protection.outlook.com [40.107.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B174BF800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 05:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B174BF800DA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kbshZW3NP+X1Xn82j0HjcN6zI5/0Lg8mMIm5My5FxLtiYbuY97NKKajW3rrYjuREpcdx2p4xtGizpcowUm6Wk2lPEh27lHE0NL6pz59E4bOu78dVYdIwaGvIzLVjbijvmINsjHkefQ/QFZF6ZTi96OAQgzbI+syNAxhR151fHn4IN6S5xnynmEIqjzaiNeidqtp7yI0ZWElFIqlzii5aSR+qUW7OzfSkDSv+p6JRXffQExRAhs+Lz0XqhMxadLQ9mNqnxxxQzucHSj69kFwrwtCbUlzmubR5imvTvqs1Vi23LRNhQQFingtbmsUQfGimhf7egygIlPxiM1h7K1k1UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJiBgLY402++iE/0WQGkfUw4BXyScz4onWR8Z43OgRw=;
 b=cCDl5q/W3Sun+24TjTlQ+MUbk1+6HJ1owy/Q+22X0V47ZXcyKIG/Ir6S3IZhHlNyxKG6yM3oucVQmox7KxXMwTZ2HkkrDH9orqYl5KNQo/mNHFupTebFj7s+e5+HlAZiqQKA8JWENC6ILj7bVGNzb4hb8nmOFTt85D2Dx6Sr7G6hrCeYVzMK1BRshfN6qOFrFvKKH/A2YH07LNvL8jJINCcaIhq/9Usn7WFVSjnhr+u2PoOZ6LFKeIXHZEImnbJcgsrA5j7tltUEW6aYnEOCo/9W/3DpbzSfYZmaMQRUVjDMPVhAKmdwtZeMFkC6loMkwwqxivcdyVXvJeHSCiq3dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0633.KORP216.PROD.OUTLOOK.COM (2603:1096:100:21::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.16; Wed, 17 Aug 2022 03:31:24 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::113f:874d:449c:f9bc]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::113f:874d:449c:f9bc%6]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 03:31:24 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Gyuhwa Park <gyuhwa.park@irondevice.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] ASoC: Add a driver for the Iron Device SMA1303 Amp
Date: Wed, 17 Aug 2022 12:29:36 +0900
Message-Id: <20220817032938.2659-1-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0226.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::13) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0438a922-6547-47e3-a7b9-08da8000f5f7
X-MS-TrafficTypeDiagnostic: SL2P216MB0633:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TS4W0uRVOXc8r0pp2N9dy29ismG0p/LY3SdLVu1kuIYCYxx4CTbPsAtDk75My6BSKpUwwvgceIa/Yff/BkfzYe5FRRVsJrAkiqFQTiYzyckOkBC2bSIcnWNCb3ATHM39lk7Wlg6Yf55AkHHu5+MzZ7jBCSzZ2KzldJrLUWlflRPUSMtRu9B9t83qfJU9p49XnA036/fuINK+aOqeNe+4U0RV7z4iFRuMKG1EWYx5JfHuB2PPwiSKphJkRmnLESSS6W7k2VnQvgLRxBYNoyIRrZzwP8hUh5KWaMFbqGO8sIbJtxDpNWIogWe4wkJ1RdUZTSyeyefPv1j+ApH6cL4hMcjdYITiVemZT0ot+jE0XLSkOtb/1PGVN91dZS11LUPPCnqidPDjroY9h24WY69Y+0C2Z7gI5vlFu/dyhnNJIy2zOdjftU+WtVAf1dPfFoKF4lUbgx/6y4WYMgIhEja9zSyEUJ7P3oaCHPwqC6Cx1Id3Pmu9+024FnDFZMyeI+OlqQ9nEbqWoXhR5K2B8EdR1wE6LFpisAAWzhpRN2yYJv0cfxLim1DT6B/aJCU7ngLQM+Yb+wRbmvISwnIvDmXIaeVjqXpaYfuKRu0Hy6iwBiOLVNQ1A7bhLFqr46bUO/2QSCyh78r4F0+wvyahoUYkmDesPTJ6qIXoQ1OqQ1DzaK1styKt8AD1srNpFgfQ0xGv26a8Rp3fX9A6v2rnH7SasKnsZqLv1njYJguoCB0bN8FjR7MUu+fnYOAARPfzk52C9Aq081MVCpAdKRhnKVB4XSwO+hd3zCOvjy3I2bRpRnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39830400003)(366004)(396003)(376002)(136003)(54906003)(4326008)(66476007)(8676002)(66946007)(8936002)(44832011)(4744005)(5660300002)(6666004)(41300700001)(66556008)(110136005)(6512007)(6486002)(186003)(107886003)(6506007)(2906002)(1076003)(36756003)(26005)(2616005)(52116002)(86362001)(38350700002)(478600001)(316002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Njd65ThvqbBGz+Xo/ey7EsWTVgZr4FHXQTCsES9c9QVoZFeTxwfoWzsOzKAE?=
 =?us-ascii?Q?+49qDwZgeVvj/q1D2oCcO1E9U6GpF4lAQImnqkTfM04hAiZ+vg5hxQae3i5y?=
 =?us-ascii?Q?EzPS63d5lWGi8yhDgBvYvpSQLvTMHIJFd8TAi1b4KIBuDRDifsHn1KhI9+x6?=
 =?us-ascii?Q?evw2fUphXBG14n7LiSsnQCrcL/mHq+l9b5kltbOnmrlAK9cCjBdAC/hlw8Cu?=
 =?us-ascii?Q?q7rkR828L+KX0f61AEQHfkJGpT0aCUfxpM55iiEIbm4wVYlqKfUEdFz45AQg?=
 =?us-ascii?Q?FUqhCmjS0kIxqeeqO7xjF47COqbwpJF4af4Rc1vpefIwPzNF1tDvv1H7O5zw?=
 =?us-ascii?Q?+vb5qZl80KxSddeg9jEWd6qU+zoVas9QKdhWdF2Ws42JIzkrTRtP1Z+QSzm0?=
 =?us-ascii?Q?wem4pNPM17b4i56X+iAJGWKjqSGCF9AVSmfg0wLqeUsDwc6dVMdci867RNVk?=
 =?us-ascii?Q?SnM+hx0V1XGAafNGvr2vvUtK/n0n8x4x3e4R2qKQ4ImkzsMiX+OXIyP5QUx7?=
 =?us-ascii?Q?uHzbsZth5usYSG7iEYH725jJShJZMXVAhdHk5zYcwK7fd+OmEKVpSXzQa81A?=
 =?us-ascii?Q?8HKYNpSuZbZ4ROLnLm8RfUdcLnO0atftx0folDf5wST6AsS93lXASto2zz1F?=
 =?us-ascii?Q?/3NhCL+O1nZVIhsFvZ+epoVW4CewR090Gvnn7zUqvYTEnxSpZFi6Hs3svGVT?=
 =?us-ascii?Q?NrwUDt0AdbrCBUjrci8P8bTZN/QzliOBZxnaOvNvJ9HpuzpwDKnqj+hgmAl8?=
 =?us-ascii?Q?S2DprLO2P0afJO+X8HDTVNbeUqAD/702izENb63P+nXH66IL35nO18R2eyLw?=
 =?us-ascii?Q?Zu57TbQFhbUFMuz+2u6xwRIiOWIvxtRwhsOrebEjAtHk20tWrnuEtQbbsW6p?=
 =?us-ascii?Q?d7j66I76a5RSlMpQ6R6IgjcbD6I00NJPya/5BSJwV7PepZjYJcmkt1RSAE0P?=
 =?us-ascii?Q?1etkgovkg6OYUN/U/7LQrLGlPUSN31/7FHMmsLheQVbEkksTLRQVfqWeiSgG?=
 =?us-ascii?Q?IZjyVJNr3I1fk43ejCi1pFrlvg4olHNRwFzf9xO6STMiiYt1KElKpVHofmtR?=
 =?us-ascii?Q?QE67Z0+se6pj/1ClFciNyjLzphQS0YNDYrZ7mbs8GKZWW3GY6iNQEu131t4B?=
 =?us-ascii?Q?tCCdJ+R5WLioLDantVkLfpwqgjxFUJ1WnfX7Iw0RkUjppjHqxNof7vOcuP6m?=
 =?us-ascii?Q?Sbbk8YemxeoM50e6ETh9jUEoi7fUf/JAnx88KNu0UBAqIzpCqw63Qv/4nGBf?=
 =?us-ascii?Q?JZ0/1CSuaaOzCvo15LXAlgnvnduQ7gV2fQRO7IHRtheAE5x0EnrNKytzBX4R?=
 =?us-ascii?Q?ma2yDa1ETYlNaVMwPJaMtJ6JKd7TN1pJ1QKIDkGpJtyyKDlgFlik1z/9owVF?=
 =?us-ascii?Q?vo38Iif/pO0QeK68Xa/n78QtyDUjwhVqp30kjW2ad9LLJd7vmR33z0FQ8C0Y?=
 =?us-ascii?Q?/rPMxwPjxncBlxvLcfqybsUvV/j01H666dAIphWPR9LMLswvKfi91rgHjldl?=
 =?us-ascii?Q?ZtIfVGnlO6fIMee/1/oEQcbwnCK5AvMuCPmH2zvrjWEIHnpn18M+VRY2SxBK?=
 =?us-ascii?Q?1eVz6v3BcclDKCyizPri0FP8CT8IILbFznPLWVBL?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0438a922-6547-47e3-a7b9-08da8000f5f7
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 03:31:24.2287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoY8DhLnFyYPzob5QysLyztsnJrcdJb7frh/dzt1mj7zfGS5nlGypU3HCS0oLuxqGan0LioJQqRL8Cbfh7LPXKe+StZZG60CuYl6DkW1Hc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0633
X-Mailman-Approved-At: Wed, 17 Aug 2022 15:06:17 +0200
Cc: alsa-devel@alsa-project.org, Suk-Min Kang <sukmin.kang@irondevice.com>,
 Kiseok Jo <kiseok.jo@irondevice.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This adds basic audio support for the Iron Device SMA1303 amplifier.

Kiseok Jo (2):
  ASoC: sma1303: Add driver for Iron Device SMA1303 Amp
  ASoC: dt-bindings: sma1303: Iron Device SMA1303 Amp

 .../bindings/sound/irondevice,sma1303.yaml    |   56 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sma1303.c                    | 3388 +++++++++++++++++
 sound/soc/codecs/sma1303.h                    |  604 +++
 5 files changed, 4057 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
 create mode 100644 sound/soc/codecs/sma1303.c
 create mode 100644 sound/soc/codecs/sma1303.h

-- 
2.30.2

