Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEE69472AE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CAE15142;
	Mon,  5 Aug 2024 02:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CAE15142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819234;
	bh=rOD3TXk5bj4z3mjxuC3Fl8S8+so7WHyaz/Otlstnc9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TMJc2r18lT1pXul2pK99PZXsREtujymAlS3q+zYnOWbzgrZOHYiMs1IZmUz4uxZqf
	 NOerHURAbZtCUoDO5QPkXLGS2YYjOCkcdxByHK1N6UsVwZfuopCM/pyLiffJgUjgXu
	 k+aW4AtJ/0AYFvRqAbSkHQd6C9QShhcvvrewEPbE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C86CF89ABB; Mon,  5 Aug 2024 02:40:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA21F89AC7;
	Mon,  5 Aug 2024 02:40:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CBB4F898F3; Mon,  5 Aug 2024 02:39:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CA88AF89818
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA88AF89818
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fflcawm7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc5JQdFDnbH4Ze8A5ktTav7wgVpAzguCM+rQ/zBRGa6vowaaKBAiVyyysLjcqBMreXV65EE/tq6xi+HmNpeck0tg5Npt6iz4Y7eIkM+W3kKPvhP/V9bRGiD83oslg3uUpb3fxDdSlGUpKTUTxi2n0WOQFI71QUnPDCN+4tZrj7W6iDNlp8USdjQns4HX4Ug75LXoetrFWBEVyqfIwRkudQRm3w7lmrvWUAY4uaAAfBI2yhqkXx0rSEQVcF/WEfIn962iBexhA/WLuQAV2soT0h2YSUUYnfKAl6mpvtBpkV1yfvCwnuyhCK3KD7+U6yZcDNjWDyQK2aBBD7ag0rg8Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWB17jvfIiZnDthuCCeUpJuGrjhGo9LcHQV0ke7wCSw=;
 b=rsmueK9rs4Ikxbs5vmlxnWucvMirEItWwLza1N2mQaiO509sNAtIH2GXojvmssDlCxr4XkFHijrvvgOfdAFgoyss1zLZ+/hGHh2sN+4zo8SBp+1+Ymebx2nh7QORwsqp1vNqwN+diCf7ZKeivFdvlUq3OS3rVDOHu984Zxx9zgthFSQ9lACNrNMW2/8X/0YD+EBVVP4l6NIcuFcYwJatUjLGfv6KmQlF5iQi7uBL1hH6kRGRRh7v8+KDBWwTo9FKCpjoEcV0OOZw2cjEkhwFHUH3OQoFD83EYjaCSZta2oBLy1V+ul9wCxbVb19nFP40ZJxmBClqjq3WRjiZLn8DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWB17jvfIiZnDthuCCeUpJuGrjhGo9LcHQV0ke7wCSw=;
 b=fflcawm7jhydYrzqsXb3FjLIeg56wth5ufZpNa2nBF9Ypkp/jod9wcyiKrcaT2F6vMzd/RWwyHtruaKAAkJgkatO+O6jAL0Z0okCvz8O2yZ07MF3wfYlJ0FlS9ZGvGUxPkUivPHmPzhiTjOHLdh8O8iH9IAVMeiZShPkjpOhqcU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:23 +0000
Message-ID: <8734njzttx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 051/113] ASoC: pxa: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:22 +0000
X-ClientProxiedBy: TYCPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:2::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 79567008-06c5-4f1c-f7da-08dcb4e70d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mhcU0bb8DDkdKTVQf/pJGgXN37Vgc9dHbAmpgk7cNisb+PPdJIuXyVOlS5Ew?=
 =?us-ascii?Q?atKrv8cbmJMGJmKyLJ4+O7ac4zpUvSNNM3ajrSB5Ekh70FmLKg/uqGIyaeBL?=
 =?us-ascii?Q?1MirhwmSQAkQLDbmsbPJJ8NzWusKjGqqMlSiDuyDUB1Y2dM09ZPAxTu25C9v?=
 =?us-ascii?Q?0WXygmRd8TjFERsw9rJ5ZRitu5toFePo8SH/ce+8+um8hGeIhJjakOgJ1srs?=
 =?us-ascii?Q?TnDddJu5t2TQdCzsrkQVAPjbHM5f7tC7u6udr2pzS7OOd+iFqCSNfWVYxh3c?=
 =?us-ascii?Q?6qT/sNhjvlDqqyLe3k9fVYIfd9xuYsYtTrw7dVnkhs3uOm50gHPgOPqNeKiY?=
 =?us-ascii?Q?CvEQ0Z9lH7m+lzrA6IwPd5u+4BffY3Y1H2caauadv/1P9JFdi198cG0wRsSC?=
 =?us-ascii?Q?GdFJ5bEm5JQsnS5waCMLgIoZG+0R1oanX3D7AcyKh4s4Z5llrsDwGbIoAkSS?=
 =?us-ascii?Q?A3nIEKfvbOmx2sfJuDP7Poao93YNl7hjk3p7ccUkW5kijMkFFK7kiITrzm7H?=
 =?us-ascii?Q?19b0wOt3m2anU4f4QcajVOlmpqsoMJsFe7rbMO4vcqVL8FwqEeIYjRFqmVOm?=
 =?us-ascii?Q?NMqgPgQ16KBPUY/vmZWXQIM+l8WTeuZ8JATIhYsWhKdjhujnHc3XP/5NI0D+?=
 =?us-ascii?Q?1EyeMJb0tB5D8Mygyq3ol7tzvFX1UGNXNZ3E7Z8IwejAya/exdonBR2XCcek?=
 =?us-ascii?Q?0GOXRKLn6fZPuEwiMoaA67XPV1PEcfB7C0Kum5QC7Z+UG8t885eqTOm1eXgA?=
 =?us-ascii?Q?0oPyWxm7AiIi/PxWMENj4w1aHU29gYgaz/Q/xhTW3EIuFZMl8lnXJhqIJynl?=
 =?us-ascii?Q?iXZJnOsv9V0tqsGyjtQEc+Mj25LnjX/K6PhFjhmcp+3syfTfT5JPrZ2FvV4d?=
 =?us-ascii?Q?kqAkJpVSbRpoPHVioZSZ6tsH3LVpvANUW5OmcXCVlMyRQjkAdir2ZJ15BtPq?=
 =?us-ascii?Q?1sl2Ykk0gKw93SGiiotZOgJiJGi/3EkdWEU/YYC4882XVIICFhLW9YeNeHia?=
 =?us-ascii?Q?QjqtIFc5oQvP0LD8qbuN4ch/ZiCsGQClZjqUOcI3ksNrDLYyh2QiQijI1vdD?=
 =?us-ascii?Q?hDdahEEm/5hUxHPU3T7kYIhlPvhNM4I82hJtEiBr/X/g2Z91sYo6RX7jhZ+C?=
 =?us-ascii?Q?vdiE8wNBXeoq2A03udo9tGxMmzBuSeJO67MQckgaA5mIeJAgVl7tMj8EkEEZ?=
 =?us-ascii?Q?qgjNh+IhjZ33VSKP5o0aiZS49al7kd30/Sddd8OsFwBSSYFZe3fTjch3ih1H?=
 =?us-ascii?Q?aStUziOXhUuDmKtiUbeACv1l/mBAOBOAaRTF44MuBHMr1xIkRowORZ/higF6?=
 =?us-ascii?Q?wwQQOEKAQfQ3NIVdWMGUYnXVMDg40C1Uc5IsoNvcM/XY3qivEzLWS487Wqst?=
 =?us-ascii?Q?whbjUvRdaLekp0cbxJIhrw5fs7DEK7qpqZMqsgmgmUvDrt8Akg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j2y8At5Cv9GH3H65VKFsoSnGU8ZdnassQPeEsI7PNII70uqBf3Yf7z5jQhuA?=
 =?us-ascii?Q?p3+mR//Y8HRu/S3NSOkCO3Gc7CeXHEDsgFdX1nEcdwnzniAzV+pJm19C9XLy?=
 =?us-ascii?Q?43B4GTbOeSANez3lryR1QAPpgCquFFv1z20wn3wlnjQVoD4Ph4cLIzimVdGW?=
 =?us-ascii?Q?j4YYZilw+YnSJ5dJ+KIkT3hVD8ADdXmktvZkgMQjoE8bZ8chSWa3c1tm+nku?=
 =?us-ascii?Q?v/LTPXn6+sRnSi6BY+SOeDOnbmHHXWNXQsfOvrWvGfpD8AppypoWldpvXfYR?=
 =?us-ascii?Q?qxPDuBdDTWfKjl5nTc9vY41F2leSoAskFuFuX1Y5neaLU4MdvggnaNdlsy4w?=
 =?us-ascii?Q?OpOe7BstSZCD2v9DhcM29wUYHNiW3v8fo0HOY/+KuDLoYyIKa+KKUn/e3fI+?=
 =?us-ascii?Q?rmUwMJsjabzHu6aylUIUCzPw8VJRtJyFzKw+mMrcPu7+CMUWVHlbbSJ5XZon?=
 =?us-ascii?Q?pY0FOgFqgJEKt8ZarDBkyElwqszTxQwkrXzPGLMc1At+2aksmjQGZNYSy0q5?=
 =?us-ascii?Q?+an3RKYDoxLWWRvJ9LdAnWWWnAvmLE7ok9Ik4c9tD8XlDzU8DQ2HylzWhjCC?=
 =?us-ascii?Q?fRLP8NZ9tLZUDHFCRCRJjXjCxwdgaVyDsdlK5qvFQHx22toBKf4ZHYR1AcfW?=
 =?us-ascii?Q?6b881eKaVM+QrvuGoyoRv6Z+w6ZBe7B8Ij1orIL+tQ3zuUQU/8hyCJvPl4W0?=
 =?us-ascii?Q?0BykR5sie+elT0gGDN7ERUvJv2iItCihMHTcz/qy1NWeFTp2Rp1dkb1h4xnX?=
 =?us-ascii?Q?lexm/l0gaQAipp0UTv0qN8ck7H7jCWCjWCNLGWitBmc0qVOhp5YdMoaiVqjL?=
 =?us-ascii?Q?V5vad4RTZF/InqG7cplKMwGTAo4jtpS+TtGOfbck5I9FyKtbRdmVqh4yf7SJ?=
 =?us-ascii?Q?feBP6kkDA4SuF/O0Xi6rdM3cOcSWMgPnJc52OXmBZ6H1l/G7LrWPB069CdfL?=
 =?us-ascii?Q?mnD1t2en4coRN3ImVKOtRPlLPpLezOyLimgztcuaswVJVFPX7ALqVQ7MZbF2?=
 =?us-ascii?Q?bzvoeX61VO9ou4QO3GQMXohzNxRXPBh8ST/6Ql1uMThNIrMNSDjvuKUm2aNc?=
 =?us-ascii?Q?KTJYLZkeEarIu2pW/a2TWJl6eJQM/ug7Uwno0o/1f/UXfRciNb5dPHdZQSgB?=
 =?us-ascii?Q?ru0J0RiqLAAweO1kVYocgMMrj40yjJXUcbGYUH0MqPP6tThIBZ6cOQuI++XD?=
 =?us-ascii?Q?Zb9PVf0oSwPhgT28mW7BazHsjMgzeZe2/Il6CqZ/5d2zyApT7YIY0RNoNaoe?=
 =?us-ascii?Q?UaTAQdmn6YcOmAMTSw71h+t7ttzJlA8JHMObteWmQhtHZ9+kqSQOv2+Eranl?=
 =?us-ascii?Q?HwJxu8LI8Quypo7wv99U38PBHpuNfEbMuK0ZzK3bUoXjwKtkHxKnaIfN4l4B?=
 =?us-ascii?Q?4eJ7q8Uc00gLLEow0LzRHRLSoBPoG/Ly/Z3Y4f5DF71ZrD3N1w6RZIFy3IH3?=
 =?us-ascii?Q?D+8MZbubVIZZqiinBbtq6+l2BRVlMmBSKTHahT09bpPNOmpdAjImGYn2nR0D?=
 =?us-ascii?Q?40FH5tH0QFV+WahVMukI5TLJfamz6t6eVpyxrC2gDzdeGxeJVutz1PE0L/yR?=
 =?us-ascii?Q?le2L70N079FsGH3vB/1z5UszFn17hRJV7VwpHh3LlbVS3NEmSVECrRkVXTBl?=
 =?us-ascii?Q?edgkv4LoWsx5Airk1BR7QOk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 79567008-06c5-4f1c-f7da-08dcb4e70d15
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:23.3937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ufUd3M/A1mN3/mjrHDVOpIkw9dKkvjzs6rl25u76UzSb96DVMjqZMHVVpivxoTSob6kGKr1JMBj4K0n2wyhcT9qpkCsWv/agQTWD1J7EkSfRdKhBmkhs79NTpcZ4PSJl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: 4ARJJTWLINPW4UVJ5BEOCXK3NZFS3GQD
X-Message-ID-Hash: 4ARJJTWLINPW4UVJ5BEOCXK3NZFS3GQD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ARJJTWLINPW4UVJ5BEOCXK3NZFS3GQD/>
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
 sound/soc/pxa/mmp-sspa.c    | 6 +++---
 sound/soc/pxa/pxa-ssp.c     | 6 +++---
 sound/soc/pxa/pxa2xx-ac97.c | 6 +++---
 sound/soc/pxa/pxa2xx-i2s.c  | 8 ++++----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index abfaf3cdf5bb6..229b1ebe720d9 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -266,7 +266,7 @@ static int mmp_sspa_hw_params(struct snd_pcm_substream *substream,
 					params_channels(params) * bits);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		__raw_writel(sspa_ctrl, sspa->tx_base + SSPA_CTL);
 		__raw_writel(0x1, sspa->tx_base + SSPA_FIFO_UL);
 	} else {
@@ -296,7 +296,7 @@ static int mmp_sspa_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (!sspa->running_cnt)
 			mmp_sspa_rx_enable(sspa);
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			mmp_sspa_tx_enable(sspa);
 
 		sspa->running_cnt++;
@@ -307,7 +307,7 @@ static int mmp_sspa_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		sspa->running_cnt--;
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			mmp_sspa_tx_disable(sspa);
 
 		/* have no capture stream, disable rx port */
diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index b8a3cb8b75978..82f91f951619a 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -88,7 +88,7 @@ static int pxa_ssp_startup(struct snd_pcm_substream *substream,
 	dma = kzalloc(sizeof(struct snd_dmaengine_dai_dma_data), GFP_KERNEL);
 	if (!dma)
 		return -ENOMEM;
-	dma->chan_name = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
+	dma->chan_name = snd_pcm_is_playback(substream) ?
 		"tx" : "rx";
 
 	snd_soc_dai_set_dma_data(cpu_dai, substream, dma);
@@ -551,7 +551,7 @@ static int pxa_ssp_hw_params(struct snd_pcm_substream *substream,
 	 */
 	pxa_ssp_set_dma_params(ssp,
 		((chn == 2) && (ttsa != 1)) || (width == 32),
-		substream->stream == SNDRV_PCM_STREAM_PLAYBACK, dma_data);
+			       snd_pcm_is_playback(substream), dma_data);
 
 	/* we can only change the settings if the port is not in use */
 	if (pxa_ssp_read_reg(ssp, SSCR0) & SSCR0_SSE)
@@ -683,7 +683,7 @@ static void pxa_ssp_set_running_bit(struct snd_pcm_substream *substream,
 	if (value && (sscr0 & SSCR0_SSE))
 		pxa_ssp_write_reg(ssp, SSCR0, sscr0 & ~SSCR0_SSE);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (value)
 			sscr1 |= SSCR1_TSRE;
 		else
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 80e0ea0ec9fb3..9a8e08b30ebfa 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -95,7 +95,7 @@ static int pxa2xx_ac97_hifi_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_dmaengine_dai_dma_data *dma_data;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_data = &pxa2xx_ac97_pcm_stereo_out;
 	else
 		dma_data = &pxa2xx_ac97_pcm_stereo_in;
@@ -110,7 +110,7 @@ static int pxa2xx_ac97_aux_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_dmaengine_dai_dma_data *dma_data;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_data = &pxa2xx_ac97_pcm_aux_mono_out;
 	else
 		dma_data = &pxa2xx_ac97_pcm_aux_mono_in;
@@ -123,7 +123,7 @@ static int pxa2xx_ac97_aux_startup(struct snd_pcm_substream *substream,
 static int pxa2xx_ac97_mic_startup(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *cpu_dai)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return -ENODEV;
 	snd_soc_dai_set_dma_data(cpu_dai, substream,
 				 &pxa2xx_ac97_pcm_mic_mono_in);
diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 849fbf176a70f..664116396e8ff 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -163,7 +163,7 @@ static int pxa2xx_i2s_hw_params(struct snd_pcm_substream *substream,
 	clk_ena = 1;
 	pxa_i2s_wait();
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_data = &pxa2xx_i2s_pcm_stereo_out;
 	else
 		dma_data = &pxa2xx_i2s_pcm_stereo_in;
@@ -179,7 +179,7 @@ static int pxa2xx_i2s_hw_params(struct snd_pcm_substream *substream,
 		writel(readl(i2s_reg_base + SACR0) | (SACR0_RFTH(14) | SACR0_TFTH(1)), i2s_reg_base + SACR0);
 		writel(readl(i2s_reg_base + SACR1) | (pxa_i2s.fmt), i2s_reg_base + SACR1);
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		writel(readl(i2s_reg_base + SAIMR) | (SAIMR_TFS), i2s_reg_base + SAIMR);
 	else
 		writel(readl(i2s_reg_base + SAIMR) | (SAIMR_RFS), i2s_reg_base + SAIMR);
@@ -218,7 +218,7 @@ static int pxa2xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			writel(readl(i2s_reg_base + SACR1) & (~SACR1_DRPL), i2s_reg_base + SACR1);
 		else
 			writel(readl(i2s_reg_base + SACR1) & (~SACR1_DREC), i2s_reg_base + SACR1);
@@ -240,7 +240,7 @@ static int pxa2xx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 static void pxa2xx_i2s_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		writel(readl(i2s_reg_base + SACR1) | (SACR1_DRPL), i2s_reg_base + SACR1);
 		writel(readl(i2s_reg_base + SAIMR) & (~SAIMR_TFS), i2s_reg_base + SAIMR);
 	} else {
-- 
2.43.0

