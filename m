Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D75359472C2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE05554CC;
	Mon,  5 Aug 2024 02:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE05554CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819529;
	bh=Vb21KBp+qLAAHivLgk0hhRe0Rj+cEeiJz3uTS+eOD08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A5SdkCxwW6V3FXTc1UJizhvhyuGTs4VHfMnFRW4iDI8O5xdAKcb2HrvHlbq5SothR
	 m+65kpXMlRBHv4Ssfb6HVRByxFADRYZwhrWnwRDtd4cEJTvMAPDEBKxvrbx50JCvUe
	 tnp4hiqRhs9ijpOZWp8ROnA0ZgqVjwDG9m7BT5EU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB198F89C9D; Mon,  5 Aug 2024 02:41:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7525DF89C9C;
	Mon,  5 Aug 2024 02:41:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC751F89C71; Mon,  5 Aug 2024 02:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BDC9F89C3A
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BDC9F89C3A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Up3654w1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yxtj5J8GV3Dnl/NgyuB/NETxFSw2D2MS0rxZW8Q1aY1urX5m7MitTUB3emlOIx56tVULd98YaMfc8PcmqqctjvqLLoxF+bUjl1gS5tdNHQTfep4aRsNgjb2dmypnab3Poni39aMeCH5t4kyNPbuXHza17W9SLWODgWo/ZZK0rhQp0r4FiPRCWEST/nyXCjrk1FcBQt0fipR605g/hRzi8t5CbPEx9jRQUhuM8ZOv81ZIAtc3XVUyN5VyZlsq4ERAsWuXLsWJQKPzKktM6oApAWRVxK5X9Pvl/WpdXM+hl876r6Viuwyv9WoS2+ygHxf3DjRlTC25q3rhgbj8DXjITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=921Mc7bAHlyWkUNU79epobNt170O00T2xV0b51g1rSE=;
 b=eCV0E8HqWXMZyr50Qo/8ISHPdxWXCe6WZl2cSj/InlUgENKiOqBlK/GY/pP3JzjbhUcW1WFK22CqtmNHVBfzJMUCGxq59JLkbEDll/kVITBvAXA8JS7ux0XjdlzFl5Z+ClujGzBdSRHf9HJmnqkANWxAmRiSQ9r92GmBKAEt9jptZ9r+o+OVsShr3xFSr1OIM/Ci4FjuTHApKmCkogyWOMl8lMzTxTOJIEL94yyPnFxFZyA8pQxYmhqfVYzyFhMkuFHBo/QY2F5Q1omUtNpHcy4zWYDtZN+u/FEFn5e0LGTEHQUVi9io/GBezYfTxYcLtc0XCT3yr2v7+HNjiXtCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=921Mc7bAHlyWkUNU79epobNt170O00T2xV0b51g1rSE=;
 b=Up3654w1d2KOSTO7tmcwC4+NH7QlThLXI+LCXkwGmqfWfAKa8WU/DUCJWWb2+CvdkJruElFqD6pcBQ7fqmEDsBgrEv60xbaJDL1nmzdCWYjHp9yLUYHN9mq+eV2s7ZgHoaT6M62Wdk2M6YP/4p9THfetJYtk/Ap3Galy9qGr5FA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:41:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:11 +0000
Message-ID: <877ccvyf6h.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 073/113] ASoC: codecs: rt*: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:41:10 +0000
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0b7d2b-846d-4979-fb84-08dcb4e74d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JXoHK6OLsut6WOmej8krTLMsTbRrAzAZHvBHxq31SU9iuXPZFx+BtmglpE2Z?=
 =?us-ascii?Q?OLwKoZNzLOlRDVeojSTnWqqWUibFJi8mTAaNoxlxsVWUZoh+wtuyDCF0ort/?=
 =?us-ascii?Q?QvFsXJ+jn520QyMWZqVCt/RjXlnhHJtV6/STc/kfAF7XzRJIKqPcI+ky61B5?=
 =?us-ascii?Q?NeYyc3yoKXfCJHJEtVX4KPDuNX4aF0v2p1E6W71GtoivLISsz79x2MdnSQzH?=
 =?us-ascii?Q?WA2ZwCMCCNXweIWrEniMiOlua8fGE1sGtiasPIYgAxTcWnUlMuRwXd1ZtqtQ?=
 =?us-ascii?Q?3/LPgY2Xbvje0roaCDP1S+M093mUs4t6jORqN5IPsAjoXkGso72E5nmvpS1B?=
 =?us-ascii?Q?reG5AZY8eyiuGOHZN/G9y8irPRhFs8wLYbfqzZVJ2Evn4FIrUMpcm1OPofas?=
 =?us-ascii?Q?DpsAXJ4AqDIKkjApPfZXTKXlvhCiUr/nt1VgkGgDO3TGiPcmnx3OWEWayqqW?=
 =?us-ascii?Q?Rrbs5Jq1UaOK2qblhpcK79YabJgYyAJDROoibYP032WG3tCtNWW1W9eUxRV5?=
 =?us-ascii?Q?Ka8AoVhdEosOPga6jwDgCKlVkDyUELT9/05YBjMpKaLCawIf+JKo4tI3FNKm?=
 =?us-ascii?Q?tp0s0Hyy73kaQ1BM3X/03lRTeDxGPLSOo0oxNydt15j+7XcsCs3K7XNy6v+G?=
 =?us-ascii?Q?ZwRgMsujiHkPsQar9MVgMRHGxn2Swad9kg7aTC6ctD70oYFwBug12lCp7oeD?=
 =?us-ascii?Q?1VfyWQu34esYXB56S2BrOm4KJqR/eF2zk+f5EayXb0pHxbvx14nsdUFIO0MX?=
 =?us-ascii?Q?BYlerKAo7M/1g6x59hNL6nw4y4rP68Me/p2auOyB6jLYQnjFoEGP5YzXWgIH?=
 =?us-ascii?Q?YiiBffUIT8VfMDOS/ctWbM0ms+iEZm27aC+L4tVNCXd1q1Y7uzKXK5GCsTq/?=
 =?us-ascii?Q?jziIAPymZRTgOBB/1LMp6r57PnYWLEGiWhfnLUaEAGJeBqiAomtE+z6iqCcf?=
 =?us-ascii?Q?M17C7NMheOPAXVI6Vo9dyQdOsBkRWkk2TgkZvtmLQBppqI1LQhLCTSpDMMTK?=
 =?us-ascii?Q?gh+AGLs0DVP37bu+odixOrKdzNNi5KKMIT3Y0VQVTbvdFOenKj/CTbF+TNdr?=
 =?us-ascii?Q?9FcV6huQrrO3EaAzmf5Sz396S8zG7m0AJ5BFPrX0heWaRWLhVhKXZfjKuFPM?=
 =?us-ascii?Q?FZIzY0cdBLAUVPf+c1dH8cSs5ihGUhKIrj3p1AQk0klI2G95/ZfnlyUJz2tK?=
 =?us-ascii?Q?5vsMTPwfJzMeMdszk4dEdYznkoXOtlJ9txZ9A+G58XLyXbxS3t5MUpLOIMfx?=
 =?us-ascii?Q?MkeSJUVYIQ7m/SlBqLYHCpQoxZ4zOPgwYuI8somA48NMzhJmxvgOxz3g50Lg?=
 =?us-ascii?Q?Zoqs/XwUIhMT1StvnLz0pWynB6qomXKOk0sa0whAasSH9hX/smhWX64o9135?=
 =?us-ascii?Q?YRBptURUs8m7VdAKexQs852dI7CpIIY+I0ExrDNGzimpWE6c/g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qzlApn8AE+ag3kwgpIXJ0qtKXEP9aptmsx3HG/jJDFVibd/gnFUGplCVihQ+?=
 =?us-ascii?Q?XDZABzRbmlqtKTlgOgvlkkUU8qzkTYzrvswsaGRPHemWQMrSpY6ADv5lKQR7?=
 =?us-ascii?Q?5opjSr6HQgvqxCPf3mdIge5uzlLpIkKd1QsCEpVQ3DX+fRNELFZbr7wb+01G?=
 =?us-ascii?Q?CUmlh/hB7jfAUmvhT9seIqMU5nkcEoy0ahe7AM0XoU1F4OnIPdCz97rPzwxo?=
 =?us-ascii?Q?7xvpw0JvL48d3kUWEolaXGOaIAI4ncEc5sXoEotvPXfhSCFbdFK9w30eb8Lh?=
 =?us-ascii?Q?3saPz1iYq48Lxg9Q1qZKt+6s8yl21P0QDjxy+FFgeIGccWmuSLkKtRRbobyH?=
 =?us-ascii?Q?MSAwxzVQjGgHh+tCayaRkCroGxiQqdSZm+TzQ0qRNn1QSw6TXEPFO7MvHzyb?=
 =?us-ascii?Q?HZDK1hGBgwoj+Oh4g+hBBxqrz2YBjNdEJiEUoP3o7gjTaQEzHx8RTVBp+nEd?=
 =?us-ascii?Q?zaHGg/zFY3mNaZvFlLa6adsH4KMOal4Dho2duryypM2BbUXAI+4StPLe6gmR?=
 =?us-ascii?Q?eM2r+lSN4RixLiqvpwLL+CgJpWogbPbYrY3mYrOTTP/fhe8OQrwCMxbEjhC+?=
 =?us-ascii?Q?J67eO4spWNJy0oiZFghK8AFJ533sqf/odl/FijQqAJk2ttDCDGZJ4Bwj0z/d?=
 =?us-ascii?Q?be2BcxLIJIdF1pcAtVejbI6WLm5XTWQx3fneRlYDaN4ptQOHqmEGlmUfxbRg?=
 =?us-ascii?Q?dm4XIYmvybQJ+5pTQ+idsTE2RMsdB8wupiGAmH0zhDOxCqXr6iaJ9pLuFFSz?=
 =?us-ascii?Q?DHUxGdbMTXlXJPrPgH0uc2NER2fLVYHn3lKwlFSJiIODkpNlV+ZIazRqow7Z?=
 =?us-ascii?Q?1RIZWEJBNztnJ1M6b40si4Wgdtvk3vbo0ImXO/yaPu24Czwf5nE3pdM+Y3qg?=
 =?us-ascii?Q?7AWNSOkdjWVCnyzHESbQQDwk9CvJ4gXIIYEEG09SY/8KGahwm5LL47tJtpHd?=
 =?us-ascii?Q?Of1DqSNJxvoe4dqJ3PC9SgcFQoTC0z18HYmiMvsjabGABXnbBP7H5058Aie6?=
 =?us-ascii?Q?7P90MSSR/Nx5WURvI2ADjWsVdQsAstvMjZ4r25lz51F2ZDnYCVigBuUUOVyw?=
 =?us-ascii?Q?k1shbdp1Jde9CuZjxTpp/5nfoFCZbv+tzYTLKyC9U+AF951EU1pdXrVyTL/A?=
 =?us-ascii?Q?jlIREVUixFzAw1hVpvFKQDzmb94gndbvJ4oxJWZ9i48uzL8KPZNvRPoZ4S7s?=
 =?us-ascii?Q?2aj86sGNoleCbbaczqC9EnRS6BbGA4zfMtVaRkbl3gRHPgvof+gVB31eRn6v?=
 =?us-ascii?Q?KMmRLAVZ0dNqrqkqih5LdzmjluSOAl1GhNb0lco9dK6tlfbcuezAnFZ2S7rr?=
 =?us-ascii?Q?dvgGu9u9Lq+gsWjxyMO5AxGqfLIhgA+ok4aNEEu/8wEku8LsHf8vQoo1qefO?=
 =?us-ascii?Q?BcPWE+wOfkbvl6HM1nmwgEPPW6YQnhqZynZ6Flr2856BnU61bAm8ZTpYSlOm?=
 =?us-ascii?Q?PpkFxDf8mLDXNPwRqtma8bOlsi+VQKy7S5BrYB5CWd9GbOdE2Z1CZF8bIV/v?=
 =?us-ascii?Q?YINt1bHQqNjk/pATFdsdbUU6M1TotPlaRDd2/NkwHBh4BgmHknIAkA8MqU9h?=
 =?us-ascii?Q?93E9uoklHh45mCiFEvgiWORT2eC/uH+18I1xKy0wY/F76ni0fe1yN4Uhk5tc?=
 =?us-ascii?Q?wJSSumuuItofYkVeFiQyypM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e0b7d2b-846d-4979-fb84-08dcb4e74d69
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:10.9983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kK6prn2GcLXLhDFHbEczIU1bnN1CLbxMK1eenKtkQZi97dzMH464vYttQGD1ecE98jWKJXbBwE9FItRN8aEGiv3xtTQnwyIGRSunkF0Gn6pt6OOZouDQMpzb8hwG1XNo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: MKU5LAGHRUR27WV5U2NW3ZBMPXSMICNY
X-Message-ID-Hash: MKU5LAGHRUR27WV5U2NW3ZBMPXSMICNY
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKU5LAGHRUR27WV5U2NW3ZBMPXSMICNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1017-sdca-sdw.c | 2 +-
 sound/soc/codecs/rt1308-sdw.c      | 2 +-
 sound/soc/codecs/rt1316-sdw.c      | 2 +-
 sound/soc/codecs/rt1318-sdw.c      | 2 +-
 sound/soc/codecs/rt1320-sdw.c      | 2 +-
 sound/soc/codecs/rt5682-sdw.c      | 4 ++--
 sound/soc/codecs/rt700.c           | 2 +-
 sound/soc/codecs/rt711-sdca.c      | 2 +-
 sound/soc/codecs/rt711.c           | 2 +-
 sound/soc/codecs/rt712-sdca.c      | 2 +-
 sound/soc/codecs/rt722-sdca.c      | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 7c8103a0d562a..986f3ab407a29 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -593,7 +593,7 @@ static int rt1017_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	/* SoundWire specific configuration */
 	/* port 1 for playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		direction = SDW_DATA_DIR_RX;
 		port = 1;
 	} else {
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 563df483a466c..aa7cbd8af2f5d 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -550,7 +550,7 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
 	/* port 1 for playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		port_config.num = 1;
 	else
 		return -EINVAL;
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 22f1ed4e03f1a..01a8ad0c4e943 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -529,7 +529,7 @@ static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
 	/* port 1 for playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		port_config.num = 1;
 	else
 		port_config.num = 2;
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 319f71f5e60d3..60b29188aa642 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -584,7 +584,7 @@ static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
 
 	/* SoundWire specific configuration */
 	/* port 1 for playback */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		direction = SDW_DATA_DIR_RX;
 		port = 1;
 	} else {
diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 2916fa77b7915..563eb935751c7 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1967,7 +1967,7 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 	/* SoundWire specific configuration */
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (dai->id == RT1320_AIF1)
 			port_config.num = 1;
 		else
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 5edf11e136b43..88258390afb7d 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -124,7 +124,7 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 	/* SoundWire specific configuration */
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		port_config.num = 1;
 	else
 		port_config.num = 2;
@@ -204,7 +204,7 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 		osr_c = RT5682_ADC_OSR_D_2;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(rt5682->regmap, RT5682_SDW_REF_CLK,
 			RT5682_SDW_REF_1_MASK, val_p);
 		regmap_update_bits(rt5682->regmap, RT5682_ADDA_CLK_1,
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 434b926f96c83..575bb6772c89d 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -918,7 +918,7 @@ static int rt700_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
 	/* This code assumes port 1 for playback and port 2 for capture */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		port_config.num = 1;
 	else
 		port_config.num = 2;
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index dd6ccf17afd43..a8b29df666645 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1351,7 +1351,7 @@ static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	/* SoundWire specific configuration */
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		port_config.num = 3;
 	} else {
 		if (dai->id == RT711_AIF1)
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5446f9506a167..49c595f2ae4c1 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -1006,7 +1006,7 @@ static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
 	/* SoundWire specific configuration */
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		port_config.num = 3;
 	} else {
 		if (dai->id == RT711_AIF1)
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index e210c574bb74a..b36d4a61121e7 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -1437,7 +1437,7 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	/* SoundWire specific configuration */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		direction = SDW_DATA_DIR_RX;
 		if (dai->id == RT712_AIF1)
 			port = 1;
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index e5bd9ef812de1..5e791a808b654 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1183,7 +1183,7 @@ static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	 * RT722_AIF2 with port = 3 for speaker playback
 	 * RT722_AIF3 with port = 6 for digital-mic capture
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		direction = SDW_DATA_DIR_RX;
 		if (dai->id == RT722_AIF1)
 			port = 1;
-- 
2.43.0

