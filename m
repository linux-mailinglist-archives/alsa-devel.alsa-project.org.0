Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 468DC714179
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A5E53E;
	Mon, 29 May 2023 03:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A5E53E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322370;
	bh=KXdKNrzhck/fp+xORiX62UuQBuO9vS2JPbiHYgG+TVI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f5JOuA4solF+p8QdXqvlyWvoLzGZvnNKLeemIqB3utF23gKI26B6CqDX2ZeF8OgXj
	 B4ineqCRW6AP+jsfPritiboGupwdvjPNgZ5feNasMvZiK7lEmuVQCrM5i2rG/Ntk4J
	 cCD6/A/S5+zSkDaXWQqzy03YZvSQlARPUkmdMfL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9DA6F80510; Mon, 29 May 2023 03:03:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A2B4F80548;
	Mon, 29 May 2023 03:03:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21EC8F80528; Mon, 29 May 2023 03:03:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47F41F80548
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F41F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oNaLVAXU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GARqPf9nPvUfajhJjdTv42Ym82OW+kQuJ0whrzDmV3BkJLYRII56Q8vuRmUkv25Bsa8eAA2F9kDeZYhgW+cfV86huc530a0evmoiRvrjsZxYcAVmsCVirLVoBLhwPF52pxxDdUIsxpFBGBmm8j4/UzIIA0Mm5KUiNKZz2BFSdAs4vVyQ3zjwtcTASdAIxj2+ohf1OYgXmF+5X/zZ+LEPGoyEqMXvPDw079oCa4TuUlxUJxr4w9ifQr8BMGSQbKI4h3BTbbtnnIlArd/ssWPZkWEsRXz6ONnwarjk/eKJ1fMJm7JpAFgemLbq1eth7YBBg0IfyiXeIB2aKp7OSR3iXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50JwugO19/gRdobJr/03412SzOgPQ1qanBVHOuZGb14=;
 b=G3gbEsu4U841tw47zz52+T89VsAVfxAYnX90aPOnA7TF/ZsF5PYI221eXIUz1Wzo2dpUkTOOYTvEl9FaHY5zbUDj2WPVyLy5FWeI0WcK9kf3PkdcFUbF6PoFPuSMFvd2IQ7b9qBSo2a731wzfsDH+XQ5hcoaFPzYDxRxrfOQ1NlEmTi1FKvh99ejbZD1YMh+DKp9dxT0Cy/PZvLsTCDDtbkOl8LU9UKG71CgqUOfUvJTpI214ae7J0t84H7EnehdVSd7Ml59A6pagE6roCByFWHYDpwzKNjENfKpyRpqlIN3ocjFnpJK1zmJQmyzmE+suMa5CDnbT2oG/cZQv3+Wzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50JwugO19/gRdobJr/03412SzOgPQ1qanBVHOuZGb14=;
 b=oNaLVAXUq0QagB4swylWJh2mSvzNxhtxaBzbDi0x7RxEoS1whtKs+Rq5L5CRP4actIGsyu0rwcOj22h7edfsWWeFkIG5eMRl2bOEGA8XObIIXvdDnTOCU+8YMIfCRQulQYi8fjav9Pr5UqzRyLXJ7TeDrPFsn0VP4oyv3Q/wNOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11557.jpnprd01.prod.outlook.com (2603:1096:400:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:03:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:03:36 +0000
Message-ID: <87edn0lzix.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/21] ASoC: soc-pcm.c: cleanup normal connection loop at
 soc_get_playback_capture() part2
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:03:34 +0000
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b0f7460-66a0-4878-7986-08db5fe08743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oHS0SVJmxO4wls/lnJ8cxGLXYv5IYF1kgZdTSX++QwHHgw8iKcwRbMX7kw73BIs+bQ1s/vu57T9Qu/a5PTn9UhC9aRVVL3GmZjfB0hvX2Ib1JRsLCMm3HWJcqqsD3XkFQVIykQKdb//64arjanc4V/jN4qqHgdFfelB564XS2j8TigUPwimRscsLzDfBibmEo9Z88FMVEEQZ19pFhlwXRsqrsMC946vgqIi0Sh7scFgiPWA3ViPvYPqvVrKkUQ5rBc7nKHAENDgMEqLxzQdCiLIxF0I0bFrcERAOZ+iDP78aezICMDUPRbPAaVoBfpFnaFKlho4b/G3qTy9JThCj8VkIX7fdsjmOJm6CW40MQn3q1cywrpU37UxVo6FRwHMzuZWbndLNod0DrPjMVBsLDzHo8OLTmK/Gkq7GnZC7G/yQXaN68KYzOw0Dht2RWLdqz4E42lcsQX8TTLv3/B3U4BEHu9W9g/rQyW5GvGLnZMJyOjG89/YUijSaGHoYVFfmt1fJ1qnYgOv1p79a0Lz0Bzt3sh+lmUOjDk6+E6qMqOYEE334h5lYMvvvFHlOCWi8MGGHWUpfTuSbIQKyS7/0SsZAv1zxJm4iz2cMOkBi1K4kh4MgnyWMjKHPEZHtlaV3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(41300700001)(6486002)(52116002)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?2TPUG4umRObFKgp/EsOhCS3qeSZZjByYJcuYTizk0+mHHwaa4uutBQbtNr?=
 =?iso-8859-2?Q?MuEBtav2p0akifUNU8ksVIwPxio/GVOF/7xRMb1MQKUQd5Y2vrti7/IYA0?=
 =?iso-8859-2?Q?zmz6kFMfVTl2a1WuaOr43qMSjYzkBYij72Iep2DoDNk3qvthlrfAUQyFiA?=
 =?iso-8859-2?Q?2EMnGhMRXfFCJrIIP8QleD7kVCeK567/95HUtQaiPgEn2JOdpvdqQ+k8bE?=
 =?iso-8859-2?Q?x/XjcdamoQD61iLfwCDXccvaQMLTJudoQQ0j++rPdl9rZoTx/DI660n4mW?=
 =?iso-8859-2?Q?P1mGGQGfNrHbG/ONYAUbhJrL6bDNyQL1OIzOP9Ph+GbWTHs/4yE3bqwy6V?=
 =?iso-8859-2?Q?ZfpPUMwle4cEolBX2IlEmbnlC7huOjD+Z2SqYK6MFUJGzNxWn8QXC3w59G?=
 =?iso-8859-2?Q?pu0IoziRBb8j9ckIIRLJLLZrYlLH7VLaNrPvN+IAgSmzcUcOPxuAKliAoe?=
 =?iso-8859-2?Q?drBiNCe0/UdrTmnJLE/XLaJ3uJPQIBmQyY2YOETraggTL+biaHAasp8GeM?=
 =?iso-8859-2?Q?iPVVjyIv9+NESDAoQ+pOSy/Io+Ff2qzyBmcMRK6gRtj1XDn8a9f+XYTO5b?=
 =?iso-8859-2?Q?9/9CcFK1+IXrvCZYt7CrFfIir50iqyKY2yW64LobLKXy69hv764KZfrQoN?=
 =?iso-8859-2?Q?TM1DFmtYYDc7jtlpJBl673Qn2g3R95XJPWqB4McpAwUIL/krlCBWnRLL8x?=
 =?iso-8859-2?Q?gxTBh8FpR7hYVQH5d3emSxJ1JHXII2EsC5LarZd+juSoZmRN9ONrJ/xJ/c?=
 =?iso-8859-2?Q?jzZOTfN9oSiALaYXxnOZ+O03CqR49RHSgFXLzq5iwIb2PfDMdulp+Cn+8J?=
 =?iso-8859-2?Q?OAxoLn9trzuCv8qzhXGErgdUO12An3nhmZRsFcwilsKACnZKHMaoqIoqfh?=
 =?iso-8859-2?Q?6N1jODnpLIzpO18gLa+qrbqueX+FzoL8srtiteomlTUBPJuoU/ZNE/7Npm?=
 =?iso-8859-2?Q?Cj/S5mDcRGdVEp4HVdVbvmRFtgkejUnce3V0apiqiDEM9SFRKRY17vDW1B?=
 =?iso-8859-2?Q?iBVqXitgy/fhob2xYIqMtu2t0eoaHKRbMLLBqVgWp7jIlGkuloUe6bvVfV?=
 =?iso-8859-2?Q?NEh9hihR6C5s5cVzK23fQrAzSIBID+qGynXIQQLBR0akUSlzw0zbn3A+f/?=
 =?iso-8859-2?Q?ealseTWf2y3Zr5wIuBdzVlN4AztD/Ty94T0Y9OQAeuT4x0679xmeOqbpu1?=
 =?iso-8859-2?Q?qzOsSBVlDp0xwmrMFdTRZLmynGQP6cPa8sFq+csdM8WlIINXOaBGG85JT4?=
 =?iso-8859-2?Q?+GRU+SB3z8p2g+bzNQSgHgFjmRk7zudrXfHB3WMrsfIf55SsahvoTv//q8?=
 =?iso-8859-2?Q?zJsxCX8l8/6RsE9Cuv0AYZoHRUJJ7d2wKlDSbWQ0SfUNZ9YFI4GbPzDasc?=
 =?iso-8859-2?Q?9ef56DOmVGfbqf0BVw3QiGJXSpWOM4lPB88kIKyf05xxp4ivt4QZTSJZHp?=
 =?iso-8859-2?Q?aJzBjaTlyQ4dt14o1M8si1+MJJUgHtSJ1PZNE50MCVwa571mZCxES/4VuP?=
 =?iso-8859-2?Q?/YE3h3L1tvjcfW6uwEToFrPYDyeqw0EvljeOPmt5CsvTk0kcMQ5HSS2ckE?=
 =?iso-8859-2?Q?on9CSoTEfyNWuoMfvkdDXJQPNgoS3caH9kmVFtFnrxPtr+bNl8Su1U6upX?=
 =?iso-8859-2?Q?DjTFT+jW6vOcBGh/hqv+4doXMJWq7aT6VE/AX3h35uxoCSVt08E5Ov1fnf?=
 =?iso-8859-2?Q?PX3+lxThaArg8I83snA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b0f7460-66a0-4878-7986-08db5fe08743
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:03:35.4310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kehva/uHLdz4yQQQSCKaKadrqT8NN9rzdsqwDEysEXYHF8EEFvOyl2tZl0etqS3lzyY300y6J0kz/0VxX1kJKzq+KavmA1q3zvSC8SOJPtDVxdBp3LWlgBkkTqMm/b6W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11557
Message-ID-Hash: J7KQ6KGDHL7VLTD5PTVCBRP2GH5LSORR
X-Message-ID-Hash: J7KQ6KGDHL7VLTD5PTVCBRP2GH5LSORR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J7KQ6KGDHL7VLTD5PTVCBRP2GH5LSORR/>
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
 |			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |				if (dai_link->num_cpus =3D=3D 1) {
 |(a)					cpu_dai =3D ...
(Y)				} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
 |(b)					cpu_dai =3D ...
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

We can simply merge (a) and (b). Because it is doing
same judgement, same operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b99c0aa98d09..c1ddd3fc71b0 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2795,11 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
=20
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus =3D=3D 1) {
-				cpu_dai =3D asoc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
-				cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
-			}
+			cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
=20
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
--=20
2.25.1

