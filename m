Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D85198936A3
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:35:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623E2227E;
	Mon,  1 Apr 2024 02:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623E2227E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931721;
	bh=+wLzEEH1VR3pAyqzkI81w9saoGk2Nw17K8rce1d+zKw=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=AARCfw+CRMtzF3BgC9nskcnK5pHm436EleUKTEBA2mrEkvMfkT7q2iibWCfT0TmMB
	 /CY1Dgi2h+zmdDlMDtXKamDCaQMA0wvs2F/v+WEn8XKaTBhDYKRJCqz1OGK60R2u5v
	 7xsAbBJmN/Do0fyMNHNUN1tYBU0Yw5WQ21DJvqks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8E42F80752; Mon,  1 Apr 2024 02:32:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09E34F80772;
	Mon,  1 Apr 2024 02:32:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DC50F8060B; Mon,  1 Apr 2024 02:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CA76F806B2
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CA76F806B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gO+ElW1A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UR4R4FrwJm6s5aHQabPGPrCfHgfZt/GrZ3Uad06AQ9nQp51d34giCJZaKDBQE6vRn3rL0rLuyA14ibFCpbyQLmC9FlO7ODvBILcUHJ0Pg0VTrse13ynJ13Fbn0kX5oK/iqm89aHpQidvQvjQxXBL6G5gULb0aFyOmqmd42pEyKqGq9JiXvSjvSvbAq/XcVe1Wt6fBczz60Rko5f6cJC99d8VVwdkpur1cd7A91oU++7kn1/fVRCph+6fX5JyNPg164az3pRWrXuIS7HtxggueAGordLi/0Npf+iVgke4Z45fA3logCKb25iHwiooy0Ar6PCz+y6yYfqBMFKFsbH9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isxgVF7FV4cYRw7Vog5dLrnbBaf0FGSvkU1zDV0afZY=;
 b=LIvXmSCoDIhtRUXjR8CnBtrLG2AiQKtrZcjDKooBs+37beifRw+5WvyFWCK864BF+EBySzaz7T5yEyUjqA9Dn/fbfbNEtJTeTHc3U4uiA++PrlXIouuHrN4t6cyjBY30l1j/7mCBViaF5tEH95mj7vTvR0HuX3k/gV2ihMNM8Oz6wcn7Kzj99VySPKC9PscTrVFRnEHjgdojbnISQMqKegqCNVlNmOQSK4Zfe6NXm+BlSRvtgH5V+PXiujAzv+G1nriCBxRL/6teIj0by4/bHMScxAA8ltt7dyHhzgPXQB7kE1ZKQfF3mNYk2JbtexJLlYBJiKpiYgINx8+sQ312Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isxgVF7FV4cYRw7Vog5dLrnbBaf0FGSvkU1zDV0afZY=;
 b=gO+ElW1AAWmjwZ6qSFhZgqyBTXNQ37IB9tTGElHTr0p34NTq4BNl8xPY8H66Qn3qTp3jgInKoUPuQUUwxKNBuRAqh8EtLoTTZiFEBIhmAvu/RnKKfV3dNpXT1CY0PVagWfvr+6VOHZXDHZ+upRJ2DyAv8bIPAsMRu36hxgurIao=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:32:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:32:15 +0000
Message-ID: <87edbpudm9.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 15/16] ASoC: soc-pcm: indicate warning if DPCM BE Codec has
 no settings
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Apr 2024 00:32:14 +0000
X-ClientProxiedBy: TYAPR01CA0006.jpnprd01.prod.outlook.com (2603:1096:404::18)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jdSVM4y+rMyw3UWLmd9gwC7floHcXNll3lPBtmqwcHn5WkpAazHAkBwJvobA4IfWw6SIybIdqy7fEXqKyd8XW5PmA9g26mf5vgaznvd22mG/oPuAv44tmNj2Un2oeeEFFxQKiWdBn7fmWnV+qtKUWxnQB8tKIE7yEiFrfC/TeHu1o1f5QKwt5vcggfEz+AW5NDsc2OBwhjIP+ziro3h7oWJskJOfrrq6E8uFUn7GPNgAczKf66G2HssmX21SRPASRA7dMTxh2SWOUdk1uNwqvvMxYOL5Ajyysm+TCcJfyFA/N+Ax4J4fk6DwaBujZxDBeQSixPIOczr97s+l8mhxA8108LRh500T5I7GK6Jb7N6gOzTML+v1pYvVKzEP3RWAn3KklUXfFmdarMsf4nHZ37RxUjKJ/vjDhsK9ddOvbbQRBo93RvfZwDreR52kLy5kwT/T8dRVN1D/Ch9Hmq6+k1TPDoXj9YPnFlq5IDtlcPhnxSUCzlMy53A1XRsXl3UeYLraXHrTCVtp8M51WgbC/Rl8DTMaA3nYAI4oXZ807Y6cOMPDdkWzFadoNKVS6xZhQUviiuxHK+azC7K3Cnw3A1QO+lTcpJ9k8NBxzt1BkVSd5z4LarUeIqUrj1rS2k6EkSt7SmudhBOh/Dyu4BaAhBPl07gOskRL1lwT7orQpFt8A4QMDlGbkO7Ia/odJpiD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?ZmB4gC2G91qwEd/oQQTrHk2eFTOG7ahs3lBhFUFVFzQC5NEAvVNB9M6l0o?=
 =?iso-8859-2?Q?xhAsxec9GTBep8xcpT+6yzBxlUPx+13NID+y1e/NtsDb1MU4kuYB2Wy4g5?=
 =?iso-8859-2?Q?CSqOYTiVNfLGDgkeR4pIayfhfABFwosl6vKys9+XYZptqaQIYBbPzDJs49?=
 =?iso-8859-2?Q?OhbMaB/vlPb4Ymy8jREK5zPJ3TYuRGTP6mNkgGitwDNF1AUEz3pS9bYE/g?=
 =?iso-8859-2?Q?BdgGwvn2dr1QJl6CklDkxkcSxkhFa9ZqNcZOFK7moGNSjkhe/dqvNPV6+z?=
 =?iso-8859-2?Q?2S4LmhDAENF0NEG1fDFsuxWaVZcNDXJGfGJIefGqd4Igi/bClpEpPauTqx?=
 =?iso-8859-2?Q?eV0AfbCG+xJd+mHP91KUbNUhmoB3SsC8Hk0ICOs+tH5Sy9R/fpuVw2Eemo?=
 =?iso-8859-2?Q?CWnDvYV/Z8SynWSvCml2j+1b2T6/j2YPzxD/765Lv86rRbFp4IDNI1+9YU?=
 =?iso-8859-2?Q?ZhNHAetx5NmJ/qvE3bLTbqHUMT/8TC7J4S65/nfFilLU9G9KpTngxhtn88?=
 =?iso-8859-2?Q?2Mmzkqb/5AdsjaB4dXiEeOP277WQNp585v2DhH2CbAVug+EiSR5w+EcOUQ?=
 =?iso-8859-2?Q?08n8lj9XMdvPWSvc+01crA7oxeOWlLEPUV0fH4QD9YFUkqGKuFbGgX/hr8?=
 =?iso-8859-2?Q?zjNgDSEU5WcCUBwJFqeg1/vsRiCindq0/g4nHu/2s33g9km4CYUApyCr9H?=
 =?iso-8859-2?Q?PlCiGTdhaFkCE3gV/CxVbzAkXNqJ5MBUA+2R6dN47bW2W2VylIUWixkaLT?=
 =?iso-8859-2?Q?Cyp7ByOa1+ppBpfdqz5Bp+QJ4z9VBYTI0yz0ozrx3W48TpLUmSDJ943Z/D?=
 =?iso-8859-2?Q?xwY/15vI6Gx0nClvPBE0u1OBZjORmqJ2VqIor9orI4qbQ5T8L82ShaReTA?=
 =?iso-8859-2?Q?NvUVupkDmtH7hzwXQfCKOv+CYJRDId8lZ3SJV6u0MMXZSXSXZVo0bfVvD8?=
 =?iso-8859-2?Q?NBVWepthForMBhqj3yrW7UHvLuXKNs5X1GbhSFimnQ7g+cv34B2kQqyuVI?=
 =?iso-8859-2?Q?Rv26DyrxsIwo0Zv+3xJqczgFq6r0HNZYBprN1N07WUNjaqzIgHshcuXALW?=
 =?iso-8859-2?Q?lbzF1YoOfcyXl0HGleZkqPnKmGIuoPbNJDnumFpC8EMag7sZv9sY0ZxHDQ?=
 =?iso-8859-2?Q?3SkRo+2scf4mivd7O3IzW+uhr5Y9wGA4bmN2w+QPmrgwefz60+x+cgK2qw?=
 =?iso-8859-2?Q?4B2bf3U4uZtmdHbzpRY73hwqXnvTGPs3OoxLxjcgIwxiEO8FNDE5kEysAW?=
 =?iso-8859-2?Q?yV/FKg6E7O7ee0v53bvEk4u1KBpb4Hmaf0HTiKko9pVGcUt3V9lk/OuPpP?=
 =?iso-8859-2?Q?Vvxafk6EC0XKhKibGQI2aLOU9xliHmNs873tgT8ydRQlN/0Au5wiUz6Gjj?=
 =?iso-8859-2?Q?lbz3Gjy8d3p59wNUTRvvgi7xLTvJDJftLpr4zH+lZzhKZBshZUk4jbbeGJ?=
 =?iso-8859-2?Q?d3jzKArhUqq/jYR8O3YON5iGvXFV4Wv3DMOvYTjnMjyTIknSPPBdP7U9IL?=
 =?iso-8859-2?Q?aT8tw6KWM4Dhdlq3pE9Su03ZqNGOzc9n9mEEzNWx+KHdAILCVjnac8Oa2E?=
 =?iso-8859-2?Q?sRNA0Hy8xGUHwUfYEUkCLmc72NfuqIIgXOm+POfvTHS3HLICjkDn46FZJ4?=
 =?iso-8859-2?Q?+XY3v2vwsTNfgS0oq/B6VuMdPGl/g7pjOOw5Rep5mEusUUmcL3oIFziIhJ?=
 =?iso-8859-2?Q?U2loOJrdaOUGszclZcA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69f6539a-31e1-4425-f141-08dc51e32e00
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:32:15.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a6mnf4HmVE6jJL/BAfnhJQDEskefB5yLErPexGaIO0LCiU8OlwN0ihKi15Qmp+myXu3DbCVtDYmEycy3eeVajAZTqK4Gpu1eBAcDwembl0SY2C1sC2BTauwbtHr8Qi8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964
Message-ID-Hash: 6AI5IH73BPAGWL4F5CKLMHINLS34PAEX
X-Message-ID-Hash: 6AI5IH73BPAGWL4F5CKLMHINLS34PAEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AI5IH73BPAGWL4F5CKLMHINLS34PAEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Historically, ASoC doesn't have validation check for DPCM BE Codec,
but it should have. Current ASoC is ignoring it same as before,
but let's indicate the warning about that.

This warning and code should be removed and cleanuped if DPCM BE Codec
has necessary settings.
One of the big user which doesn't have it is Intel.

	--- sound/soc/codecs/hda.c ---

	static struct snd_soc_dai_driver card_binder_dai =3D {
		.id =3D -1,
		.name =3D "codec-probing-DAI",
+		.capture.channels_min =3D 1,
+		.playback.channels_min =3D 1,
	};

	--- sound/pci/hda/patch_hdmi.c ---

	static int generic_hdmi_build_pcms(...)
	{
		...
		for (...) {
			...
+			pstr->channels_min =3D 1;
		}

		return 0;
	}

Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.=
intel.com
Cc: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ac42c089815b..95a5e28dead3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2796,7 +2796,6 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *dummy_dai =3D snd_soc_find_dai(&snd_soc_dummy_dlc);
 	int cpu_playback;
 	int cpu_capture;
 	int has_playback =3D 0;
@@ -2817,24 +2816,36 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 	 *	soc.h :: [dai_link->ch_maps Image sample]
 	 */
 	for_each_rtd_ch_maps(rtd, i, ch_maps) {
-		cpu_dai	  =3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
-		codec_dai =3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
+		int cpu_play_t, cpu_capture_t;
+		int codec_play_t, codec_capture_t;
+
+		cpu_dai		=3D snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+		codec_dai	=3D snd_soc_rtd_to_codec(rtd, ch_maps->codec);
+
+		cpu_play_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_playback);
+		codec_play_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PL=
AYBACK);
+
+		cpu_capture_t	=3D snd_soc_dai_stream_valid(cpu_dai,   cpu_capture);
+		codec_capture_t	=3D snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM=
_CAPTURE);
=20
 		/*
-		 * FIXME
+		 * FIXME / CLEAN-UP-ME
 		 *
 		 * DPCM BE Codec has been no checked before.
 		 * It should be checked, but it breaks compatibility.
 		 * It ignores BE Codec here, so far.
 		 */
-		if (dai_link->no_pcm)
-			codec_dai =3D dummy_dai;
+		if ((dai_link->no_pcm) &&
+		    (!codec_play_t && !codec_capture_t)) {
+			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
+				      codec_dai->name);
+			codec_play_t	=3D 1;
+			codec_capture_t	=3D 1;
+		}
=20
-		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
-		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
+		if (cpu_play_t && codec_play_t)
 			has_playback =3D 1;
-		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
-		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
+		if (cpu_capture_t && codec_capture_t)
 			has_capture =3D 1;
 	}
=20
--=20
2.25.1

