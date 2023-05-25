Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C0D7104CF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B4E482A;
	Thu, 25 May 2023 06:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B4E482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990587;
	bh=YiI3tRn85eD6KpplZsDhUwiwfnCxv5kel7AB17xB5wE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PoHGQFmDOx8AQafKWut5t1o2d4iNddbjwoiOsMlOir4Cy8vy4/+fN3UlDMU3Ww1CN
	 2WHxb52ZbOrAB6kH15Tp1YcH+N1SCNYsv8H/LwdAAKViQJLqJ7sECshFGd18PGpInt
	 KMDosVlQkELI1tvzbM8KVjF3CYbd2ws1R1Br4U/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B5FF80601; Thu, 25 May 2023 03:18:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BC93F805FD;
	Thu, 25 May 2023 03:18:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E2E3F805FE; Thu, 25 May 2023 03:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21CD4F805FA
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21CD4F805FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GCp6Dn82
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffUBf/QW7+sfjBfoB1QJAIJlRq0tAa/kBvlfTiYCp3lyPn5upZK9shko9Qh7Pe0d2rkYhsNesQ0U5EIekoP2669suJ21WA3HOAS5G0NpRMuPE9/KHqrIqEgEbbqrFOZU+wg8c+Nqz/Osb96EoCB7fcQ+FkN97ERVuAd+pOS04AlPlhfOnhQVh34JJlx//66wvOqwtcx3zZUvMa1OdAixzA/vh5LtmSlkldg3cGYuT87gJ0L17QtyrsAHWHUNmsmT8+Pcb5onuIkz5VT3GSzOvNvh8+GmiVgAs7XDU9oM+8oA02hoNYsc2QZ80MJk84jvpecI5a4ht09ZvINP7jZnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itmeBOoEMeNqWziCPjkXUADA7QwjNWbFTHTwQH2AXQ4=;
 b=IY7zGpj07TurU4rDjgNve//IUXNAOwY2dMSTW/SUe7dUG+s3kCk00891A61jR652OwAR8R0P51030aPnqWt2SLSNh1gj2ZQjf+IMHmhqt7WqPvhDE7uQFnRrXpq4dochL3I6vP48/5eYKvB49HYiMQJjEoeNWNHrkfqHWC0yhcxddRdyyUXPtpFwRlrCHrFZsW/YKxv2d+t60exaCOSI7v7IYYNRerqaCKd/9LrHbEUr/ATel+DSNyNBuLzpFHbQVCH1SuLyx/99d5BkV56NjCGUKQdzgj8dSrMtLue6OfzNlxh4sETI9hEfCSpiWdvQqi69sI0Epkw/ZdoIBZ+fMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itmeBOoEMeNqWziCPjkXUADA7QwjNWbFTHTwQH2AXQ4=;
 b=GCp6Dn82PhP+O7t7oETXkL3Sn9klUF9c7hIurFrqnkt3CjnEML6OW3IAThbCj9TOTEReZh5uARIGIeleSViWClF90BN6kMiVBJav/V6lqJL4ElHYzGsUYRYoWGDrRvldlZDXjBvRwKUm154K940lWaXT213cdAhIhVAYiWUPLoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:18:29 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:18:29 +0000
Message-ID: <87lehdgqe3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/21] ASoC: soc-pcm.c: cleanup normal connection loop at
 soc_get_playback_capture() part1
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:18:29 +0000
X-ClientProxiedBy: TYAPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::32) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 8013b3c8-ca48-45c5-dd9d-08db5cbdf28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wkM1xxifyDluPwoCeGp6ZwwQ4ObimKeUZYM8uIksAwDD/SGN/WazaTh+JVt7yVlyfXQ71arUKz3/oIzzLWPvR5LTHeQ2PffdNshFqntySLfGF1oga8595PDX+/daqnX4qnOh99nwJG8nqM9ZM0wWUdbSDufXamLE8l/TVuHbXBPxjG+W5tHMyWqaXbJ6fwtyrfyEvkzk7E2gkjfdaShdb+wPp52lWn0N81m0cvAYzZstzu5jsYZVW56Tbb0ayesCbZWyIyB0QW6yZIEJVXsJPqqekklvLp390zoSSmmJkx5roy7rjYc7uQWZv2fEyLRMH1SbZINrE4hvp1XpB+ycYK4L5Rb371KRjK4jNtdux8wQbbWlly0L9c8RJOyj5I1pYIS/FuFLSoCcGdzkNfbsz68bkYEOEGSyMVq800zztu/+A4NFROl4Y+A/lR5MS7dhNBKxxwLDrgYaWoy/xDnvnqmS9lHCNOVlHBDqYjoKAVECxJA2kCSNXmy3wgAo7Q3UrMQgrQUeTp1S2fF1OsvMsm/8QqdTnZVwsEq7ZaNMm2fYR5KdR/IkFuHFEtedifdrmX9gV4RUPor8uDwy4C4xNQIG6mXXcYJ15wSIPJZFOxwkC58lWh10BLhnU3PuAxLPJMWl6qSLG8XhIItMstMomQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(6486002)(110136005)(2616005)(6512007)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38350700002)(41300700001)(38100700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?7fMDjpZ6aZXHbcJgIcT+XidAB8a/xJEtEQifKspe9p+Y7dBd7rvz1121NE?=
 =?iso-8859-2?Q?MBW12RLTHeajQB8D9UH9R9jM6t2KINzPJXdr3N/7RJN+Ep9XVb55Y4beyO?=
 =?iso-8859-2?Q?j5f3BloeeakCRU49LqpENOGmADM0BZORKuhC0tx/+TWS9SP42dKMZ9Rfln?=
 =?iso-8859-2?Q?w9RZxXKSo/vcedONLlzFHFB1kg4YGEG1CEyHzIAR86LWCE68O4hp61jOgL?=
 =?iso-8859-2?Q?CIZbJVA0jX3JkKZ90/NRB4G6gpuh0xUIrqtjrfgef26ycaFqr6gIEbVy66?=
 =?iso-8859-2?Q?IbeIQg4zY0vSR/p/ss5ijJsW1VZTL7o/i/WsLiXSskcFuPsYLQVVzham6D?=
 =?iso-8859-2?Q?vCjxT2Lu2Dtmx/0B7FZmjewzfz5tetZsfh3kLyY6BvfZFlS3IiHihsU1rU?=
 =?iso-8859-2?Q?1xsvK1Nvf+6tUil6fkO1+FG70ROt3OHKpknYS+BHBoH6eBnfdR4HBitkkU?=
 =?iso-8859-2?Q?FAkofkHWwNxtV1y9CRcr/fO5TsbcPb5B3ueIcwo2RNwWuEyrokAgKNFGsQ?=
 =?iso-8859-2?Q?9F0qGg+XJfFOwHWO2MDVsOwWzKrOwucEApYAd0ENed+jafHTY59Hg58v6y?=
 =?iso-8859-2?Q?Crfko8TJjTyZfOPNcFephZcAPUy+BECc1UO+IWHotmRL4R3SHymJ1HlNHs?=
 =?iso-8859-2?Q?SRYda6vFL4/xuKjkAzZD1juilrgqiFyZc+5MjBXEUWuowdHzd0pMefHf6V?=
 =?iso-8859-2?Q?FuNeOuBfSZ8S5x842g1DHVXv3dCZICbtG6x/pmGnsRNb6rHIxJ5OpIsWhe?=
 =?iso-8859-2?Q?NAKx7/uh96WtECI1MfSoHbLjEhgC3qVAH6922231GswFqZYuGF7KW665q5?=
 =?iso-8859-2?Q?/OhtRzEC/9sXpplArDrIsgEFoAQ9xZ5wm3g9UjVGoONAj8ms224pwLAQAY?=
 =?iso-8859-2?Q?musnsIu2n5oN9mFn2/uAHIa0PyIiAHed55hHngwD72JsQV9NvxdrC9UoQr?=
 =?iso-8859-2?Q?BEcRXR+/mM+SffGw00mFx0g5dsJZEO+lgDZhD2qwTfPZHQiomUqAESZkx9?=
 =?iso-8859-2?Q?oExxEbSr2ok2U8N5SoItfb2U3sYCFxS/9JW5GrHWTGouUCJrsic3ohWjF8?=
 =?iso-8859-2?Q?XF36HK3aUNBkdbeGwSTHoaVBV2Zf68GqMJxbrOpsa779zifMmsCyJhwHhq?=
 =?iso-8859-2?Q?ctOamZFRr4bC3tDDn2/vopL0S+8uO3vvFchaHeeF1L6gQUDyMZ5cuk4Zto?=
 =?iso-8859-2?Q?4UCAc/RC+qcWgZOQnzWeD2nLO2UZckIKWQ8FH8yFBqAZGvJZ83bUqPxTpj?=
 =?iso-8859-2?Q?9BoDZ9yv7sUjKjVxmNoh7uYcPLEd6015j/T+Nj3hBpxFkVDe6J638Tv+q/?=
 =?iso-8859-2?Q?+csDVdVRTxXE4m1o1PpnyFZ+VhntvR8L9aZeuM6K/cnWxZIp1yuOv74+zp?=
 =?iso-8859-2?Q?+88rEXowUGEy+zQc3Y6RLTRpMj0+DOZBELhw7Iv1y0yNNkqa2KQrDzcHMQ?=
 =?iso-8859-2?Q?+rwSRXCMpWlsFO7POmIV12Zm1MoLhrUxRz9rnH5Q0mJE0mTp40YhGoO059?=
 =?iso-8859-2?Q?OfUnk/mUkpTE5Q/aFEaNsKVTwVUMx3TMCBk9gHYXRymQzO/ROJ2n95UN8D?=
 =?iso-8859-2?Q?uOqukkINaq8nQ4W/soJ9bD14lvzpOoXirGUCjFaqbugrP6PfF6cTXekvqj?=
 =?iso-8859-2?Q?RWvYj8txhnZmG076SoIIKgF4xEJ3HAaLpbCUQRgHeyvje+7HjTL/WahU6g?=
 =?iso-8859-2?Q?Uj6/L8Hcq+xQVrW3FVo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8013b3c8-ca48-45c5-dd9d-08db5cbdf28c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:18:29.2589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KumGboTpzwjxYxmXcXHcZVfSYEE6g2U7A1WKgirBMgattN2xFQB/C1yZSTMja0r18kLQv3+Ptr6F5fWGU1AoGub8A/VevrtXRBAjrHkP57ujj8ahVAFB3KKpMAnBmIoG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: CQEKONN36YHCMR2KDFUAFB6PVEW33CYE
X-Message-ID-Hash: CQEKONN36YHCMR2KDFUAFB6PVEW33CYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQEKONN36YHCMR2KDFUAFB6PVEW33CYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) is handling both DPCM (X) / Normal (Y)
connection.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
(X)			...
 v
 ^		} else {
 |			...
 |(@)			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |				if (dai_link->num_cpus =3D=3D 1) {
 |(a)					cpu_dai =3D ...
(Y)				} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
 |(b)					cpu_dai =3D ...
 |				} else {
 |(c)					dev_err(...);
 |				}
 |				...
 |			}
 |			...
 v		}
		...
	}

In Normal connection case (Y), it is checking number of CPU / Codec.
	(a) is for Single CPU case
	(b) is for Multi  CPU case
	(c) is for other case (error)

Because this loop (@) is not related to dai_link->num_xxx,
we can judge (c) before entering this loop.
And it is needed not only for Normal connection case (Y),
but DPCM connection case (X) too.

This patch moves (c) to top side.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 159670612de3..c95adf59cfe8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2742,6 +2742,12 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 		return -EINVAL;
 	}
=20
+	if (dai_link->num_cpus !=3D dai_link->num_codecs) {
+		dev_err(rtd->dev, "%s: %d cpus to %d codecs link is not supported yet\n"=
,
+			dai_link->name, dai_link->num_cpus, dai_link->num_codecs);
+		return -EINVAL;
+	}
+
 	if (dai_link->dynamic || dai_link->no_pcm) {
 		int stream;
=20
@@ -2792,10 +2798,6 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 				cpu_dai =3D asoc_rtd_to_cpu(rtd, 0);
 			} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
 				cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
-			} else {
-				dev_err(rtd->card->dev,
-					"N cpus to M codecs link is not supported yet\n");
-				return -EINVAL;
 			}
=20
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
--=20
2.25.1

