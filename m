Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4A71418E
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2CA193A;
	Mon, 29 May 2023 03:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2CA193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322535;
	bh=N/B4Y38hjWN36QyDhxmBfVcYZer2SdQFwlHsfgd9Bco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bDS8p0hWLa9D/jSEXxcTXz6piD+FaDma383tv1LjeImhEbmI+YxMRgIG1slLSnaiP
	 gX6O6XHOUiQLoEu1hJDE2/XlcxxuU9m4FmA5v1lp45BKZirXK1Kxw0aC9mO1TEgtTp
	 YIy9WS+XoeX43wp9V15D6PuRdHIxx0TTEtU5YzFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C3C5F805EF; Mon, 29 May 2023 03:06:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 905C8F8057A;
	Mon, 29 May 2023 03:05:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5514AF805C8; Mon, 29 May 2023 03:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FDFFF804FC
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FDFFF804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p7ts8amz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmXYU52Zf4VoInLkot2c7TDbgcRERdlngbjbPx0ilOtOmQuxJDyIOxdTucpkFw/KTRRmdaqhqRwTjgjyYhdIEc7X/SM1LPqFmvrbnWbYsGZ8i0StaqPsjftuieKi1ZbajmcRpKAHgmGrW/h3IxGU22YZ/IFxFa9JBBk4qBYKTFthgRzfQsreRu2NiJsA9+cogQ8o5fQpm9PdQWjJqSdg/KamRsDI6aRCt7qqopYcU+V+yUqLVKo1tl0T61dh1OFdsAvDmQlunCdk2c5tepTBqp7p+APWfgRdCBQvjxeva/ioxeBo2jOwt6PBddBuB6/LFk0iEP+PhyveJdgSWyI8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ee6ivP1wWvXZ4wj3pxJ8Yls6cXQZCmml9pEsGukaNPs=;
 b=HDGBn+llgZ/F1Suxf8zOfmjADDhMF0YDoESRp8V1HKRxtqCgvL5/uAfGPQW3phNH0NlHFd5adls1DOn+sm3fT7qG12sjOibpI2OpVEPrcmfuBFydM7pakQxY7r4dUaUycFxzsKGeKtxUg4158b7PXPqXkOB1u0uNi5+qsphUVE6taLIXF41bTidqfNCLYPK2zH7L3OrjFDiizbvUe2ug4l8r4wUvuoKJu2Pdcno0/z4ZtpQ5X49+k2Jn+4znp+A9mjA6Kajb0LXYcNMx9ZMrFX0EHTS8KnMgleO1MrbhQarqeBfkaFnDqaxpK0XwmdM8u3p9cn3t90hfwEbORKXJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ee6ivP1wWvXZ4wj3pxJ8Yls6cXQZCmml9pEsGukaNPs=;
 b=p7ts8amzcmGNALq6xkomkaTUzPUQVTjgdTWM5B4tN5R4D1fP5o0d9rPZO3M44lx9mM6m27gWIXOqa28tOjUTK6RM2e6iBsHg9W+4675H6yrcxmMELBAUPU5vW7BZ9gJrRX5AyJRhYqEzbnHvHy5ZUyyNDgb7FNlKLJH+4kY6m9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:37 +0000
Message-ID: <87y1l8kkv2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 18/21] ASoC: soc-core.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:05:37 +0000
X-ClientProxiedBy: TYWPR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f4c4fe-9703-46d5-ad05-08db5fe0d06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZauE6QFccjAtgPOIF5jvdLFLCqH7fm6pfcRvDZazWZwCiDdc/BWqXsZ9n/xR+JlzldqsVl6ii+74widNaIIBPWAUA7jBc47bsR8J8sApG35cSl/smE5xgkDq3SAXrqvUA/TpwBu5b1hlRaNNS5LVaRPN6a76jbiTLZHRoB9p/RC2LOQ65BtlnwwOLgn15o82raG+6Y9fav9j2l1ni3zglLZMchMlDISP70FqzK2aw5C4XIFOq2C0rFzI5rYlc+mEX+JohiVBsDpjovSAMeg2sj0AzyysZxsw0PgahKbqQX/psmPoaY5J7i8xtW2ruKaCQZj3YgQdejvqIX3QIcYZQ4jqoayHhY2xwWeef0gNHNcWCLEgo03ivSamfmF7sJVyhlWU+IzjR5BzZbXIsCyN5OqqRz5SJ2u4OGhhxe/gYBTACX+fkvo6GM+55GeIFz4av5Jf9/x3YKNBzuoLlwgrXw6/S2A2crHm4huw4qd7LfPdkF0TtN+tjNcipgxSWzYJP8Hhshrrn4OpbYZ7irxg5RMTHhxMXqdfg+rc346PV0Hdik36QGBNzbsU8B6wzrYcElFEgQDyYJGZhrkuMua7vMoF3FbhELlBs2eAysEBkhkoO2yPf14E6/l+mUyQYmOj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?+FJEIfRE9a7fMrxv2RfoqeRwqS6ETFmq8HERyET/L3HUWeQ1OhoojB46uT?=
 =?iso-8859-2?Q?KDEb357XOMkcrJCTest7uW6tOmdrmXyrVa20E30bWyiur1fSUQ0YxoJgeF?=
 =?iso-8859-2?Q?+9zysAzFnWbEehHnLgg1epS/jWCi5ns1Uv7hc5FpqQlKIg04wQ+EzEjmhW?=
 =?iso-8859-2?Q?PkDfaL8b1XiPJadXBLwtJVzPr5TUOBKfXBRjrw7qf7kftJpu+yQyZqdcm3?=
 =?iso-8859-2?Q?IqbAhARRpUZkwvH/DQ/P4v0FSj95/Tv0JfQs0gda5vwc7FQnCqfAnDAxDE?=
 =?iso-8859-2?Q?AbCUIj47QUAnsW62CqiPPrYUQTOoVDSxpp8qNT/iQfMPr6T3NiCD5PMTqt?=
 =?iso-8859-2?Q?4ueOBCdCdo8qoM/iTa5FU9kjF4uxV3S+UHjVOn07Q4NQPzAu23UXIHiJRx?=
 =?iso-8859-2?Q?aid5MVNU7r+rv7t6Tjdp+sm8nSGphIB1I3vtSHRYovAI9buhjFEmchVOYe?=
 =?iso-8859-2?Q?KcMcHIm45csMKCuKz4CJRU57WX12JjGH32cFoGBKcK0sJ/PLVGnNjqVj5H?=
 =?iso-8859-2?Q?06Ez1kGBSE+cHcAvGNM2+HsvbspXaPQ8gIshIe1mF2syVuAfcc/UlMstjH?=
 =?iso-8859-2?Q?bJKMjBmqcQifYgh3D2E07LPVwItWK+xpq7Ye5KrQ/s8Y7xDnD8PJgSLgpp?=
 =?iso-8859-2?Q?IaOlvPbjY2Fm/jxV6Ds2nCoevYLjkMsKmt3iPBDddZSR+v37KeVZdSjFc9?=
 =?iso-8859-2?Q?woOXJykUyMrmAaRfxCZqYZq3JpxGZfna12FhNYSvIEyFi+aBVuCpV3CaeV?=
 =?iso-8859-2?Q?dMefOUTYdMr4y1fm8a1du1Fk9s28h6rD5EYO82rjkAmhcHOauBEU5RYwa8?=
 =?iso-8859-2?Q?a7GznPZTTfLqfJF9GnM2JutI/Raju8iiYyB6HS59o/aCj/p/RZCIFGSe89?=
 =?iso-8859-2?Q?zcmefgf4I2rUiYKA8QZgCKy9iYFPeE6B7mvAqKTX/rn9VRpAUNrb2RO3wq?=
 =?iso-8859-2?Q?24/dP87l4UkMKwFj28F/bKf0X+011FKBVUHIDiZlsutxWuWM7+DBbUGZ1m?=
 =?iso-8859-2?Q?2dECYsbwTGrdfmjhiKRMOSqCUq3ulTvUBKBRVOr4T4ehrsRtJN0ZnOLLq0?=
 =?iso-8859-2?Q?xRDHcGMHXtXQFaE0tz8CB9zP59vMJzzY1+8F0pJI0cjtjHxlRcXqIANvys?=
 =?iso-8859-2?Q?uPWxU8MmMmyDsnFynL3DyYoansS8KoMxKVh8Uni95QreocTXVPuuI6qSOk?=
 =?iso-8859-2?Q?1w28aB/BeuG+EIte+QUjdPJv1m7iZs6wXMI9kU8KAsE7Xk9N94B8Br3M5A?=
 =?iso-8859-2?Q?1COm1O5A4AeDqpzJs9iNHIJ1EoPiG8F0vTmnjHKVjpcmWMIZDEM+5GOle+?=
 =?iso-8859-2?Q?KORqPX8cKJL1gxraP2mQ5gI0rE3ddZZSGPQmUwsxeYdRFhduG5eQLaVxnZ?=
 =?iso-8859-2?Q?Ezk1KvN2kk/DZvTikRh2nY33hkN/D6Dx5zsI/JqW2aHwWXoKm6eU5MLBvH?=
 =?iso-8859-2?Q?X1GOFQzaBJFd6fzfzk01+0zstcouAEDIYlq0p3vpiEijLztkx7X+D5rsro?=
 =?iso-8859-2?Q?Mtw8XL7duWQiE/EBamurgSvFuzHdTaTkt1PkCVfhTG5VSg65y+d0tygzSr?=
 =?iso-8859-2?Q?xs3Yc2xhaMINBqp9uC7CgcSX4eEGsLc3FDFImXS7fLxYrAoA6kM14Hi4kH?=
 =?iso-8859-2?Q?1FBGITYofg0iM1/gkXZTBue090Sxz6eayiEYBC52NFrz0vrmUkSeSD0GlV?=
 =?iso-8859-2?Q?h6kfgJ9B/d3Uob8H5cY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9f4c4fe-9703-46d5-ad05-08db5fe0d06a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:37.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kAVFvmY9d5XlVj/kIhoM6IPQdTBTIEaQC+iJCUSUXb/nDktu0UNrmm+FzfGdAUTssJp7V3D2V7JmwMFMPikuAXmdgfHpYTXW24H8lC5I37DmMkUCA+mqN4krrFtb6hNx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: AI7FHTV4QCMDNA2SJWVTJJVOP3VPTE7D
X-Message-ID-Hash: AI7FHTV4QCMDNA2SJWVTJJVOP3VPTE7D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AI7FHTV4QCMDNA2SJWVTJJVOP3VPTE7D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b48efc3a08d2..f57911e4e4d5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1781,25 +1781,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *=
card)
 				dai_link->platforms->name =3D component->name;
=20
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm =3D 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_pl=
ayback=3D1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=3D0 and dpcm_ca=
pture=3D1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback =3D !dai_link->capture_only;
-					dai_link->dpcm_capture =3D !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm =3D 1;
=20
 			/*
 			 * override any BE fixups
--=20
2.25.1

