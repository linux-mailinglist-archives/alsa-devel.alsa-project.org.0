Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1D17104D2
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:56:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7150950;
	Thu, 25 May 2023 06:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7150950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990599;
	bh=TvTYotcr4ZOu144Ecmw/NtiyUw1IkWxrJ0GVFOaUoro=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YrYfYGlEvhyOconZZAtG/VB0uDQAyaJ5oZ3fPHaOw01kt8dEpl59VpJY9TRtVdLO0
	 9whej1/nw0kyDHQBhy08AQ3HBCpBkpPbwMx/J2FDkOxQ4zzYOW55Dn8ZvKXWX1hqf3
	 /FGnhGM5OYjULi7Co4BKz4JrWrn1zyB6FQuX63hk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7975F805CB; Thu, 25 May 2023 03:18:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B695F805C2;
	Thu, 25 May 2023 03:18:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C983F805C3; Thu, 25 May 2023 03:18:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8B99F805C1
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B99F805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=j1uwySpI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h10wQIdLebIBi23nSN12A314HNXyc4MOescWI12E8KbS2FpVnkiD6E5B7EKcOEeAp7ttrX6F/hqnQ5MoAjEqG8TWdfbzTURTJzvcDhTbmZMjAodHxYkVQfJ5xEcyONHvftnDLbtn5ZOCK66acK9jxurvS6q+u9um3iYX0hBDu9a4Vx2Y0lXh3iFRxZ/SxCDJg3Av3FfLTHn7j4eWduep3y3CYsDHmqZnPszHB9kQf+fFhIS13ZZpWH2hXEQPKa1FPz05hNXYJ7vgRgTGy4gth7Y6u2KZQQxbtb7nKK92XUih1pd9/RK23USk1jY5SNpUKzRavr48ZxceEwtJPNvOHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbeDTQB35tZm8Y9PzzEs450v5znSklXmzYkAjOadlco=;
 b=HVH63swkuIAg5EKGO3owTRndhNFOSazieC98nsOpuHYGnhOF5FR4QoroJ7zlYaybo/A9/B8/PJuDZVMrAPeV3qAEfi+kW6jWM2nvzh7pxZ2jA6ZYethYnMTrNudRkSMMtfx3niKs0uSJ66kJD9AMLKP1aU7/wKRH9iNR//q8yA5OVvmPkD6Du2arVWOKQ5EPqdJ6mBMSHS9jiWqikduE2qXLlAwBF+fRjizvTTN+eriodtzvgO+3oETT0rQfcjz+GSrTRX3w0R/UnPzIZTpL5ebhLCPGpF768fRDHa7OH+EjR9TzG3VwhJ6lOL2mNx/0foTxXs2fA1mlhIL8TcDe5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbeDTQB35tZm8Y9PzzEs450v5znSklXmzYkAjOadlco=;
 b=j1uwySpIGe4w5qvwVjmOl9NjY9zM1+tpqE/q/41pz/zepH0u9oavM3C2hlaoSRaGq1AaRmF2nBZ2DZL/ufLPpUU3vEEHEpBNGYIShRe31Mv/aNCAs88Y3V6ocMj9uhyOz6pPktQXSQnOvm9Clff4TLxDnh36KfrAIhA4Y8OkJX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:17:55 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:17:55 +0000
Message-ID: <87r0r5gqf1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/21] ASoC: soc-pcm.c: use dai_link on
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:17:55 +0000
X-ClientProxiedBy: TYAPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::26) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d3601f-9aca-4bca-a4fb-08db5cbdde42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3wBGiwvq/KsLE9RK+RTLr4uKtT4Po3xZLqvE4cmFgVkVbZIO0JHp2xn3lpO/IivrwJhpzAO/uPx5LmQVNnf0mkRfQaeTEDn8KDDDJCxGyveavm51aTIP1QGg6nyvOBop8NhbdgRBEkn6Z0bv0k5bpLKBC9MnYLXq5VxjnrmGEEd4ZMh9VYy3I5T/mAgyBb22y8R5HWXo/7XingNdseEAa1hhbrzNpBUKXWrODQ61as81+28y9mJLcKFrtPK8UvwGv2RkYY7k2JK4ieX/OSs2JTwAd7VYZOdb9r02zhuqWxmZfUgrV2HueG2je17jvJ2/aGSHSmSeT3U1Doi2xA1C6Y+4qW/+lPgas7B4A9N2z0IeS0uPQWCxFtKZ/JLJI2v59cwsq9xK8/QLv1i00bgIVW7SivxUhIy6H3yE5IYe585z8AJfP1ZvVU6vG5RePAvOpMG5yzDuSa5Ev2s0FVNf4r5tvyOR91yEKWIAkILPJLfKY/+qv9TcyeHWOQuVBOHGZX/Ws8ZNE4TEuhJoEnrISG/iOwyyWnx1fuTyPL1Jtw187lzvEjamlcXPC4MPLb2JIJYbHf4QmNhABMcvvyTXdqsWAQzJtx357hsrEZpNrDWY8vIw2aRwiNQ10T8hdHD6XK6dy1o3iLmXJ/duA1uY2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(6486002)(110136005)(2616005)(6512007)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38350700002)(41300700001)(38100700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?YqlKAzyK7okoiiVRfF6Nqhx5gd42IO1sxjm3ycg6if1/9BgzFehadKLwKX?=
 =?iso-8859-2?Q?5gxsgDwFYuja5qY9qRPnj+MKFRWhYf7Qk9qMO2ALfT7mQHkPosZ8syCdDJ?=
 =?iso-8859-2?Q?Q2T6b9sz9EAARyZhiCArumb50MMHu1IVj82DrelbKKKU/4H5DeamB9CNOd?=
 =?iso-8859-2?Q?Me5VEMfn3qKpFW0jJKf0bUxc+Uyv5GczlJ/ZcHekeXsZiBIC0Kj/iQvf5U?=
 =?iso-8859-2?Q?vfQXQBsJtwAafXL3npwlz8epigNQ5GGhFa4JDH+NcHntPWeaY4w7ZoB0+C?=
 =?iso-8859-2?Q?Y77XEfJfgrPsYzVW83TpW2fJrGBLK9LJ+7/mkhY5liR0nFmdDJkOcOFXoJ?=
 =?iso-8859-2?Q?lnHiBB4kdzPy7ZZXRpFzd0BewNR6PBSJqhCQhkR6wYQuKxFvBmjDXS52PK?=
 =?iso-8859-2?Q?ubCIAHXtbETMkmpk67gkcHsK9/KOl0QKFqWFIO7Zy71k0JT42Sm0WIztom?=
 =?iso-8859-2?Q?lISBl9ewyNyfQO1YtsLNBNXemSlzYew4nrH0M28/dgfsopleeQArBzcpFZ?=
 =?iso-8859-2?Q?F9x2fWw2L2kPPiwLl4R1ZJ9iH+yxuH0fRdtvGpO4/VyqKtEE/fWBW7zP5j?=
 =?iso-8859-2?Q?Zw55NNoDS/aw05ZENmTxA+G3E5qROFCTe5PrVoqcyuyCaTPWKlZAVpERIr?=
 =?iso-8859-2?Q?HB38acJK+9wT+cQPgVIyCRcPH1KhDIIiKrYVQBGoteoNU4P9ITYx+MqWVc?=
 =?iso-8859-2?Q?aWevJx4XQPE4ePI3LSNNaW2YMUK8nERhUpVXSVdkFQoUCMZydZit22GS8Q?=
 =?iso-8859-2?Q?AS1dYwwWL7KstQWKs06HTioLyFRCC+rFglF2czwl1IuxlEKes03yOOlKpT?=
 =?iso-8859-2?Q?vFF/zY3o/N2GyuKwow/ShJxLjQp+5d9Kpp5dlG83qNGoDr66jfHpgHwqMS?=
 =?iso-8859-2?Q?5tCs3N8YvaBKp1Xgvv7fcr5KjKRDQifFQw1PxDEEd6EkryLVSxGd5rmnQa?=
 =?iso-8859-2?Q?rKjccz4UhLdBAyGeujCIK/WI4KbeA5uEc7HSUfn09H/2nrh5lZQHb7sgM4?=
 =?iso-8859-2?Q?BOC3hS0xhXzTKnQCtMqYLFa1tJCLJFqEHx/sj1PRFoZgZUgQFPaXIuVE8p?=
 =?iso-8859-2?Q?wUrtY6YlOMkZQmXEkct5OORIfcp8MUPed83CpU/4uxEfFoMy3F3TekVxS/?=
 =?iso-8859-2?Q?Ne6OjTt0khhtNSmwH67uVmQQ5MJNXVAG14kyXuWLLe65aXOSkqWJoFqBOU?=
 =?iso-8859-2?Q?pHsCeeDQpZBOidrk6TzxHxkHh/MjuYaq/tOVU5uGpDkxodrUR0D7X+w5wu?=
 =?iso-8859-2?Q?b0c1FI6gC56TEm4QaismEb2+auMfi3o/Ef7MEJXgO/pgZOSWYpmxx3XkFN?=
 =?iso-8859-2?Q?gnMIGGhS7lNCeqTpYg/KdZM0ZXIH8VF7VHOaJIZlNatisDXhZEUFjYct5p?=
 =?iso-8859-2?Q?pvFDsgOe3fEpJ/xiLdB/SoDrp2v2EWeIWjI1qnIPhe6es07p6Ww6UF6w/Y?=
 =?iso-8859-2?Q?8/xvkX3DRe90UU6K3MMVWGXQ8k9ejQLRaY1RneSZf9JrtMNne/lCpG/yGu?=
 =?iso-8859-2?Q?KI912xPYJ51VrvGW+Wwfil0ncUDA1WKmYjwOApdAOkFNqlmrQHVjKBFinf?=
 =?iso-8859-2?Q?g0mhiEv0JWEOsc3+C7u3opKVSVgJvoHbKRHBkeorOpTdOJ162Iv1LhP9ru?=
 =?iso-8859-2?Q?CVSjsBXiMcZR7fNQQf4QxYzFr+Z8TPJUY5Z1TwUKsUQrdSgDSgEE66j9co?=
 =?iso-8859-2?Q?mfq9ae5Ms9U5M91AB6E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4d3601f-9aca-4bca-a4fb-08db5cbdde42
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:17:55.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hBZkj2c+/b+HS/crXLaNic477mQFlbvY4DxMEXO+E+8gZEEjDJ+TUfRAv6EuY5PHQb8ZTFX0vpLj1tjFKWpByMLEaCVQYAuFAnLe/Ar6aBk03LlwpRlgVinHXZAH/+tA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: PSXA5QU3ZGNPAMPXEHIALSJMLN6FFZFF
X-Message-ID-Hash: PSXA5QU3ZGNPAMPXEHIALSJMLN6FFZFF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSXA5QU3ZGNPAMPXEHIALSJMLN6FFZFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) is using rtd->dai_link->xxx everywhere.
Because of that, 1 line is unnecessarily long and not readable.

(A)	static int soc_get_playback_capture(...)
	{
		if (rtd->dai_link->dynamic ...) {
		    ^^^^^^^^^^^^^
			...
		} else {
			int cpu_capture =3D rtd->dai_link->c2c_params ?
					  ^^^^^^^^^^^^^
			...
		}

		if (rtd->dai_link->playback_only) {
		    ^^^^^^^^^^^^^
			...
		}
		...
	}

This patch uses variable "dai_link" to be clear code.
Nothing changes the meanings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index fe65994485f8..db3fbe1af2ce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2731,19 +2731,20 @@ static int dpcm_fe_dai_open(struct snd_pcm_substrea=
m *fe_substream)
 static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				    int *playback, int *capture)
 {
+	struct snd_soc_dai_link *dai_link =3D rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
 	int i;
=20
-	if (rtd->dai_link->dynamic && rtd->dai_link->num_cpus > 1) {
+	if (dai_link->dynamic && dai_link->num_cpus > 1) {
 		dev_err(rtd->dev,
 			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 		return -EINVAL;
 	}
=20
-	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
+	if (dai_link->dynamic || dai_link->no_pcm) {
 		int stream;
=20
-		if (rtd->dai_link->dpcm_playback) {
+		if (dai_link->dpcm_playback) {
 			stream =3D SNDRV_PCM_STREAM_PLAYBACK;
=20
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -2755,11 +2756,11 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 			if (!*playback) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support playback for stream %s\n",
-					rtd->dai_link->stream_name);
+					dai_link->stream_name);
 				return -EINVAL;
 			}
 		}
-		if (rtd->dai_link->dpcm_capture) {
+		if (dai_link->dpcm_capture) {
 			stream =3D SNDRV_PCM_STREAM_CAPTURE;
=20
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -2772,7 +2773,7 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 			if (!*capture) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support capture for stream %s\n",
-					rtd->dai_link->stream_name);
+					dai_link->stream_name);
 				return -EINVAL;
 			}
 		}
@@ -2780,15 +2781,15 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 		struct snd_soc_dai *codec_dai;
=20
 		/* Adapt stream for codec2codec links */
-		int cpu_capture =3D rtd->dai_link->c2c_params ?
+		int cpu_capture =3D dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback =3D rtd->dai_link->c2c_params ?
+		int cpu_playback =3D dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
=20
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (rtd->dai_link->num_cpus =3D=3D 1) {
+			if (dai_link->num_cpus =3D=3D 1) {
 				cpu_dai =3D asoc_rtd_to_cpu(rtd, 0);
-			} else if (rtd->dai_link->num_cpus =3D=3D rtd->dai_link->num_codecs) {
+			} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
 				cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
 			} else {
 				dev_err(rtd->card->dev,
@@ -2805,19 +2806,19 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 		}
 	}
=20
-	if (rtd->dai_link->playback_only) {
+	if (dai_link->playback_only) {
 		*playback =3D 1;
 		*capture =3D 0;
 	}
=20
-	if (rtd->dai_link->capture_only) {
+	if (dai_link->capture_only) {
 		*playback =3D 0;
 		*capture =3D 1;
 	}
=20
 	if (!*playback && !*capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
-			rtd->dai_link->stream_name);
+			dai_link->stream_name);
=20
 		return -EINVAL;
 	}
--=20
2.25.1

