Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9C7152AC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:52:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D6D82C;
	Tue, 30 May 2023 02:51:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D6D82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685407945;
	bh=eXkDvqezi7ERAGj77f83+BFDRaBmKx1vpn1imIQSQqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qgUIc2vLyIwZGF87RdK7qVXpXHdc9x5dD5vSnXBkpbLE7bI1R7lbXCBv23HPQ1NWq
	 LVPKcyjqCDP31LebrsVkdtTeha+SPqjcLcWC08Xl7E2dDejS3I7LtaDB3lm1LEi/mB
	 hqcYaaKjaLT0IulukmbDjeWjKmbEmgB+r72WP4pQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEFAEF80589; Tue, 30 May 2023 02:50:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02FF8F80589;
	Tue, 30 May 2023 02:50:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C707DF80564; Tue, 30 May 2023 02:50:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 704DCF8055C
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 704DCF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UVZ27NEv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbO3rTHKtFAJqQIiOKpU6PqW4o0GKgXrMT69eW6u/Qo2rQ9jztuyE1mD2VJW89fpWfOKTj4cNlKZ894kGiPXOCSTZ9omuXTFbrDWE3myBu8muWwE5IWm2Uzhm7k4mRfpC5HJ1LpDBN3RirOsLmy7LNBuRpTmheX6sPvR8A/KpDW/lRASQEqSbpJsn1gJLJw3vdW3+giOliVNEjNlwAasOaSbpGBOq1zSJ07/o2TwSEm/cFPHd4yudT/qUsvi4NZVyS7R4DXjtoZp+4vpMg2EKoEQFIte9IuuPv1vZqZWwTfOetR4a1clccqj5J92ggaG4EaE2Oxf+dmlD/bi5ZNnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URYLGPDTAxi+1oEIac+j4tw5WMwXWhid+7elBPBpCKA=;
 b=hPOZ7qqEWYQpVNSZTrtajIJfid3SqBGn8TlC4kzzxKUI2vr1AILIG4ET9qJBd2g0NtPpsOX7q7+wNm0CYZ0VEbkg9axv41yOWELKluJGQHZ4AENmDz0hvPIkRcdwPjyY3PpUNFigd+KkSsfsTkYIAVYduDYHZUgQpdEcJ47Llk3M9jPKLVSqcpqHXo7VNYfjcZNySHTsrEvf6iJTOdpiwPhF1TBpusz22gr1YUCJIQv6UHywU/zgLyXDUiWEnVcDYnXAwCyU1IuYoAOEwfjagCoUZP/uM8zgvk0Dpwa1JpshZ9ePe9u/tporUZ0E8oOPzJQOEFPVmQoh61pjKDjLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URYLGPDTAxi+1oEIac+j4tw5WMwXWhid+7elBPBpCKA=;
 b=UVZ27NEvFHFJh+H5UY+n0Y7pFfp0JRxrAdK5OZ7/xydGlZ6/m7KIZo2s1FMTE3K9s0iTckFnbdpSj4owe5fj9rI1Kk2wbrXT2HYguyCpRF0fsgyRa4HXzIUuXRQO8g+dbQyGhFNBvGeCljpnxCdVPrj5yxgfE8ODu4GKy9RKEJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11502.jpnprd01.prod.outlook.com (2603:1096:604:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:50:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:50:08 +0000
Message-ID: <87sfbezlq8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: soc-pcm.c: tidyup playback/capture_only at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 May 2023 00:50:08 +0000
X-ClientProxiedBy: TYCPR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e26ed81-5b9c-4073-6622-08db60a7d0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0pnogVFUgUihx3w1SAffmMvfchwg7fpPPuS97wnxhruWtl9qHDHtfjs/GOvYrN3grac5v2rBoAvIp+vFp5nmLE5k9gMslUNISewthmrm4kA1Ag3x7emZmJg89Bv6r+4/7wiAlxDeQIokJBliPbT+SBUq+qXT0dDpqh+jMQmaYRfF3l0XBnvD8sHW2AMDQ8y+oMoQ/SFnuMT+Bm2qu7SLC4tfchxe9wuCjSnFa+znGCKrhkdZWaBCzxetxhxWi1HAV20AftbWJqRl31z725d7T0wxBN/Ewcest6ghevqREpx8cVbWvzv7QJoDHFZ6ijLIgwAoWPts2J/Q1dr+1NkJAEQVTlcaIjaGH1ww5YVnFb5xdZ/AtC2NAEpwOA8qOhZdXhUtJnW87kGt5M2TNisK3JOsSfpD6wNWad2XrNIK24Ru4F8wYBMg/p3rKcisEJNUA+G29LV+I7qnwYZT+42IjEotQE68MQtnnC2lcLYdQ88KYLy/oMecRQiMRHAURwJOixUwGYYwtIYR2xEChKxtc4rB8CrULJU87apTLywxI4dyZcsloNNMlKRTwTdlZDvjeO0zKVEjnvBEoD2F+5OMzjPlfOkginIsKSZex+IG9f7HMLmi1gmwpqJSeaZw0/ZE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(186003)(2616005)(38350700002)(38100700002)(41300700001)(83380400001)(6506007)(26005)(6512007)(6486002)(52116002)(478600001)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(5660300002)(8676002)(8936002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?QbD/0E97QUkkXo8ImAXTU1Z0T6Kxg2yhs1hdVjUoO1CEucehMmnkRJwuNC?=
 =?iso-8859-2?Q?MW4J6LCQKabC5DlXKg2lihZQEwQTYkrH1P+LlWuQkIsmqtR6N/FHEzQdXw?=
 =?iso-8859-2?Q?cENj2b0/gF+yUh9PbL1XQDaLVDdomRX+OAxLaBP0gaqnDtnHSfz7UrPIai?=
 =?iso-8859-2?Q?GLlGr5Lsojh+pWsUjgWx8/dusXZOcufrdGvn5/eJm1ojGesSzW0DBkQh3r?=
 =?iso-8859-2?Q?rL6ydaL4wuqk//3FuP2WSBNNL1CugAsQJ6i1znKIQG/tGisYbt3DMVJ08P?=
 =?iso-8859-2?Q?ApcURNFzrnZ96gNmqfwxHNfQY5P/i2izLYDFoQobZDAGyo4z/Rm3p+BASh?=
 =?iso-8859-2?Q?3neMEmf+/ShHdLNQE+9585mDp3H0KF6q8VXt1WdxeHphFz4x7w9gl7iREh?=
 =?iso-8859-2?Q?H3RxyGKTjfv9drNYFAizUMxewiSf854fPtUrcJTGJ2ETOUCwB6v1Sl6vYf?=
 =?iso-8859-2?Q?TcHOg37pyxVPo1YJF3sPIeSNjZ6fQLkoWKUFjptYa3xfJLpQVpBJfUrCpm?=
 =?iso-8859-2?Q?QTHWouNLEXmiHz2358F/bWW32gcrObe217k8XF1DS6sWMleYMr2aXY61ZB?=
 =?iso-8859-2?Q?v4f9pzDiicvK6c9ZMyW2Ffz7wtlQqRcmCKeE1yYjqFQBfq+x9x8EmsQlMP?=
 =?iso-8859-2?Q?T5NvjBH7jz+DpA1HgtACFyJnPkMl9hgjv76H/mqdRNkVV0ytuTvuZq7S7H?=
 =?iso-8859-2?Q?+wmAmV8HQw8M5/s/MNp+/ITCffzWDPvMC4i7B+z1Ro47AIZ23ryOc0S6I2?=
 =?iso-8859-2?Q?gij1vPM5l0x+GIn3ynySkz5XYIR+7qrI5OLB3An6qnO6xthT0aKQVF6J6k?=
 =?iso-8859-2?Q?BeMsM22X3eNkTkOwhy3VzMFHlSnGqpu5AMdSxXiedVYvwiZbTZkBJOWzC7?=
 =?iso-8859-2?Q?gIl4XPnrk4HShBchpupI0yw2C3JWi7G4ZDEmM5pNUeWXVue+eqrX5ky+rh?=
 =?iso-8859-2?Q?maUxe9Oz234mFgBnlfRZzi6LQ41gTHvcxDZx+wa1GlZJZ322wZk5DIsPOX?=
 =?iso-8859-2?Q?YNMg8VG7v4HtW0g8HVpFT6+UBkwvXo8XupP5k95vaTTfqmhIV8XV7Fon3q?=
 =?iso-8859-2?Q?u+0MUXLR03t+u87D1hXi3DPi8xAytLk9hUw5hTNUhDT59xxWBNIV3dZhUv?=
 =?iso-8859-2?Q?RjEz97JZVF9iBwZ7eDx3fEZFS6ReBvHTnk+DFeI6Gqo3AlXe7qBovo0ygg?=
 =?iso-8859-2?Q?zAyZy5ad7ud8w9gMiquCXuzvLykpUmPy1p+hVoh9qP3Knjlkz5jlpozQvf?=
 =?iso-8859-2?Q?erqvAy+7r2bQpaHlNwbR5Uc8Qq6fJTTjEDJdfFB5D+RIvXpaNtDvo6Uz1z?=
 =?iso-8859-2?Q?XNl1wZstaacDQrrkm57zm07RXM5W+a0HG1i/sfXov9Y1t0OUweiwOqIvz4?=
 =?iso-8859-2?Q?OQn0GlGmKKRWBapPN5sN4Vp213u4gtpbHeu+f9KMX84fhxwnygZ4VoLGD3?=
 =?iso-8859-2?Q?JTEnEfO2huxXp66SYdjFF70P37BbOhY7jhKaXEMcDbhFnBRC14Sx+BSS9o?=
 =?iso-8859-2?Q?Seaa8KjnPHDvRO93QkCkdkWAT56qpZsIwObN1lBInylDxwpK+OCwnFjasS?=
 =?iso-8859-2?Q?xugLf/KSqM2/phcbSvCVsS+W+WMHuW/jzjXEHS4WWEExw4yrFUnQ5gT9be?=
 =?iso-8859-2?Q?/TOhUxBGc5UphjwHqm9X7ZRc3IdJJykkiyR40MqPMCc081QT73lmkRcUGf?=
 =?iso-8859-2?Q?u+jhOlQRiXxB/zRLcus=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e26ed81-5b9c-4073-6622-08db60a7d0e0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:50:08.4357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ykkZgKzFS5DV43C7AWSlXKd9iax8UIjxL/RpFa4C28WGqNMDFNg9WKMCcW5svjtdgsLG508ANDRsTkkP00kcmvLwEpCAS7otj0Q2bA4JGMRVgUWQC1xqbj5KEZAz673J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11502
Message-ID-Hash: FA566JKZIF3H2GQPXSFFSYMBFVDIPXBA
X-Message-ID-Hash: FA566JKZIF3H2GQPXSFFSYMBFVDIPXBA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FA566JKZIF3H2GQPXSFFSYMBFVDIPXBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture, and then, we can use playback/capture_only flag (X)(Y).

(A)     static int soc_get_playback_capture(...)
	{
		...
(X)		if (dai_link->playback_only) {
(*)			*playback =3D 1;
			*capture =3D 0;
		}

(Y)		if (dai_link->capture_only) {
			*playback =3D 0;
(*)			*capture =3D 1;
		}
		...
	}

But this flag should not have effect to opposite side stream (*).
This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b3d569e7ba61..159670612de3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2807,15 +2807,11 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 		}
 	}
=20
-	if (dai_link->playback_only) {
-		has_playback =3D 1;
+	if (dai_link->playback_only)
 		has_capture =3D 0;
-	}
=20
-	if (dai_link->capture_only) {
+	if (dai_link->capture_only)
 		has_playback =3D 0;
-		has_capture =3D 1;
-	}
=20
 	if (!has_playback && !has_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
--=20
2.25.1

