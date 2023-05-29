Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A77714178
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:05:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE702820;
	Mon, 29 May 2023 03:04:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE702820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322334;
	bh=/2lVF24wvwt/EniRLlSW76B85oHGuFwZaRGEElduacM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TsvixuBYWH0cv37pRA8/8dFH4G48ZFBon+RJG+jR/qS869kn6YhlBiTk/i4zVl8Rk
	 +WYDdBltN1mIdOamTqYnfGboiwZpUwAlpB5JaqH78O+u3g/SS50CCz06wgk64QhNzf
	 oz+IGEv8eoQ7vE8FUgANjyvZ2oi2XNIwaLUCjGqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1591FF8042F; Mon, 29 May 2023 03:03:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6B16F80510;
	Mon, 29 May 2023 03:03:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9992F805C4; Mon, 29 May 2023 03:03:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE331F805BB
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE331F805BB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nBfZaUXu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ5ZOnqtkhFaCU22Jf92rtqICWDuVfK6MiY1hBW/XVI+fslr30m1iqJTjURtlVK/+UNAf3GrUbFM94UXBG1WccsXNHrARa2FB1IoBQH+Op4RoOjZBd1qjfIvBFcsxc03YdidZxME8pYOa7XW7zhHUboNP0LIXQNr8Q84rt0avNKloCdTN7ImzAJwBpB5VvNjFqGNW/QW+4oIxm3nuyKMcpjw1pPizTYMWVbtGbakOrqliLLFBfhOXPO2RZkuf2HslkeNn3Aysn9Hxmao7QPzIvsZ87416fPLDTxbhE8CcBZvaHeyEsFlrlLi+GDrcQTJgt2jJZuzyAgZ6gAi7XunHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP+GOkWNAvoqclT3V//3dZg8IFTrUhfGtd+lfR5Ea18=;
 b=hVryhkFwa0KsxAJmPW22AvXSyZN3qMaU1eGdo1dBfjBFKemPO63sNS6QkhSeI/H2BmPXaKVyhWqtZ3lw82Uw8szLYyQaSoqCvrnF+T3+sMAmVYEFe3ld4cdOkLy+Rq4e/hllWstMbx7/vJR+B6wsxe5MP0F7hlTbHVLtyFzN40cFhoNYh63Fc5rOsDd7TttQeCs2BP5/aXKOUFxZoxDDPan2og2SvKis+wnk2DC7DME8DZvNDoxCT/xU/oekounuDfAj1w2v3nYjwGu1L71W6697o/3717hSSI/+jMOZa2pxAryJ9wMuqLNEg/h+TtJwHo3v/5NzD84ATgMqshwTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP+GOkWNAvoqclT3V//3dZg8IFTrUhfGtd+lfR5Ea18=;
 b=nBfZaUXuHdfLSUBsrpAkmq5tu+Ov3MsCZXgeRpb3sdlWx1wic0U9lB4R4KzaV8j6nBnhmgswhAKB5r4b5siT9NeVW1iU2C0n6Jh7544L2ZEqKy+6asyydAr/5SJQWQnayWomiwhlvrYgLobGaGbStmggeZg57SX4LG7GZ+0q6dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8658.jpnprd01.prod.outlook.com (2603:1096:400:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:03:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:03:27 +0000
Message-ID: <87fs7glzj4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 06/21] ASoC: soc-pcm.c: cleanup normal connection loop at
 soc_get_playback_capture() part1
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:03:27 +0000
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe9a095-f275-4178-728e-08db5fe08304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VAy2YfkSzys3l/3baluRwTi42T2Fkce/EtoqgUN8hIWBzhOXrn2GfR6/QNNLvfvv9MClJ+g/YG1FmnAbYZhwaT2JeV1Yk6qPi6w+oTDtMgXaBlyioYvJXFKO/VVPpD2RH2QsHHzvlCpFB0vS9766YwFG12dcf6SNU33xU/MIhA7A2UdN50G4xpg0X9l4OZdl70FrFTvW8h0Bi2HB/ZCmWIY4r77oNWzz0ZPXcxGdcj+Yn/FlhZ/hoH+833QIQbIS747d9keJfQ14hdDZlG3soqVTVhtJWEShrGVYrEdL2jmhB57DQujf5eH07u71X09nzD5aJ4uTeRjHvUt8v4AgFSO/9y88PtV7owdlX7vYtgxkvJW8/E+QkXw6l6GD0y8BmXFGyYx5KOxlAm596l+4HReKx/7plKGjmF50hVjWqIXXxvMUYAGVBQdMFKd2wHeodRnORe47xxBjZi6ShnVc/A7GPlBxH8x3l7GXGXLp1LUk9ltMqzqTYtTGOBMMBjncY4KPgcOTQ/KJOBICKVWlusmunbXVs/ShKyXC9GF3+sWyuyQAoMDwIJMehuipBXfQVeDynB2baNAuMiP46l0AO7EVS+7Ih9m1ByODtIb8Wsp4i8VarsMh9vluVHnVcQkgpqKdKxrD9lGCNcQFz8kJWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(26005)(38350700002)(38100700002)(41300700001)(52116002)(6486002)(83380400001)(186003)(6512007)(6506007)(2616005)(478600001)(110136005)(66946007)(66556008)(66476007)(4326008)(316002)(2906002)(5660300002)(8676002)(8936002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?WOZvTT8Rgetd75L6LxzM+GcPiLwc+xhXen2B8ZLIFFxZnYzayBSbi50qSN?=
 =?iso-8859-2?Q?zT+awFnmcmLi1x2//Fp/crpf1cdTZfpQ7bzMXh1z7+AlDx0AGdkNHUkNvJ?=
 =?iso-8859-2?Q?w2Rksmji/RrhS0vy3O1mFEyAK9Bjn9Eln7PTcFObJ7C8Yx7PddyQuecR15?=
 =?iso-8859-2?Q?Ld3dNeRKT8MgEFevZVRHXmpAu7aH+SE01jLdhwroR8W6J86mdSdvJbaJ6K?=
 =?iso-8859-2?Q?u4cRmFIMcOvu+sH+6KQCdjp6u58IomMHYQLpdOi6DsVdLkgwJ0Bzfvcs0V?=
 =?iso-8859-2?Q?FPlfll6Cqd8nm3IYm4+cLFOexolGvIQyhdv8+GeWDoHFwPtEYNmZe6tfw3?=
 =?iso-8859-2?Q?t+57p0wcvyt3qS6mfqadj6LKmFzm4A+Jb8J7VUL863NajtY+lQY+HusqUX?=
 =?iso-8859-2?Q?WGhomYAwqjQkK6++2IDuPR73Vy6zek1TiRcG/C9pN3TOFXMlk+I/W4rPqa?=
 =?iso-8859-2?Q?bk+XGQIblEGbFwzGEaRmXCR1fsz+HKnqiSMyM6eFXxi+WaRdE0eiQVuT5L?=
 =?iso-8859-2?Q?u3BCog4FJ3DWJTqCRRrUwmx1t50pcZTaKaxwIxolLTZTtxISkBlLhY9EBi?=
 =?iso-8859-2?Q?7iEyAqsm4W8R5zlUSp1skcn7Bh8JzTAH8COjKz7aytlh0KGMgnRpqVl4f2?=
 =?iso-8859-2?Q?gypvHhHkuCw/oJNZXouem7ZcbaZkmW6bKJycU/3uqPp3QtucBLl+1E9tyz?=
 =?iso-8859-2?Q?goB1NIJNYC10qa99z6lHBAWlltU0tafxIKIMxTnATzwptGjkPEN4wN+o1I?=
 =?iso-8859-2?Q?02TNNzTqMwkJxhoUTvB4Cswv4zOR59wqfub1xERr2Bnb7SF/amrix5PAKN?=
 =?iso-8859-2?Q?FruHFbtha4KxYLRzF6m+fUO51uz/Rd8GK+9QVj6/F/S5e+NABJdzc54qcC?=
 =?iso-8859-2?Q?EV1d0eLEyFXrdIOJDBVd0XnE6kodC0Siqag+IOapUMDd2zgq0GBqcDx0T6?=
 =?iso-8859-2?Q?9Hs++P8SNNOmms+h/OIyR5qc/V1FL6wlhJ59Wd50DufjUzD9i75ZB05bJr?=
 =?iso-8859-2?Q?vxfnbaQUMIcYBx7ACWzKhBuEynqFm9klc3VEpLhfNV01NjbSJxW6DkYBcG?=
 =?iso-8859-2?Q?Vvbmbv13FpOrd22ypNCaNBUlk63HURApk4TjWXBHr5x1m2L3c1dXDyO+NM?=
 =?iso-8859-2?Q?ZCEjEhwHxergrCGUiulDEHLQDSnVdAb3v6xdfjeOW2GDLK6wXEsb09+BXZ?=
 =?iso-8859-2?Q?4chdMHZu0+3IoPF1d6RXr/h4BlzLo79QDE2skTgxHIFwkx8+y/hP7u+9Um?=
 =?iso-8859-2?Q?QLtiSa1xVhUT+uaTE+gmeS4/oj9Bn7Pa3pjWy3phPlpOZ3gHYSdziR5Lvw?=
 =?iso-8859-2?Q?+TY2LA0RbEE+b3RUjjThcGK8kPRn+kDuf8jbXCvrpP2HpBg55TqZ/2/uLX?=
 =?iso-8859-2?Q?x1EF19V228KjW/fM0RYY45qCGe7zcyNJGD4Zt0DiBB4MqCqAmXenwnbeJq?=
 =?iso-8859-2?Q?Y71Qh6ipPyJM1kW0edV9XTQMoGzFjKXhoFJQUID2oJspUeYDZpRPMP4EeF?=
 =?iso-8859-2?Q?Xh6PF8h4r9KNk890Ie0VY2t4Hkl/45RMkBukrIKHAyjcX2zQzpV7UUZF48?=
 =?iso-8859-2?Q?h6CgJjgY+i7Go8unxS09qIYPYx+TPdUb7Z5MpDd1NJeyG2gy7ZjEVhxReZ?=
 =?iso-8859-2?Q?249TAGFc8kdRcvsO6KD7MWbtzw9bh1U4+zsnkMxqpe9IY9I8aO0RfqnVSe?=
 =?iso-8859-2?Q?U5aUR0lmapzPGQbLmE0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9fe9a095-f275-4178-728e-08db5fe08304
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:03:27.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q9uKVZopn2OBXRDQ9NegN0JNe+8cQ/r2WvOBLCBDwhQoJ0EjQPn7CWbc0Q4CSj5bTcJG3YO2PA7EYUU4ZYFjMSaYTltkyKEnSiv3EEYPdz7cUEakhaANy8FW9DMEEJ6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8658
Message-ID-Hash: F3BONPKVAXBYCKHHTCYHOZRWVOKW7N7F
X-Message-ID-Hash: F3BONPKVAXBYCKHHTCYHOZRWVOKW7N7F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F3BONPKVAXBYCKHHTCYHOZRWVOKW7N7F/>
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
 sound/soc/soc-pcm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 159670612de3..b99c0aa98d09 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2742,6 +2742,13 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 		return -EINVAL;
 	}
=20
+	if (dai_link->num_cpus > 1 &&
+	    dai_link->num_cpus !=3D dai_link->num_codecs) {
+		dev_err(rtd->dev, "%s: %d cpus to %d codecs link is not supported yet\n"=
,
+			dai_link->name, dai_link->num_cpus, dai_link->num_codecs);
+		return -EINVAL;
+	}
+
 	if (dai_link->dynamic || dai_link->no_pcm) {
 		int stream;
=20
@@ -2792,10 +2799,6 @@ static int soc_get_playback_capture(struct snd_soc_p=
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

