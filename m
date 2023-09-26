Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D37AE601
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:34:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51397EB1;
	Tue, 26 Sep 2023 08:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51397EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710075;
	bh=kc90EtinS3ieS2Oqj2Ai/0sRpLTklBqkjY+Bp/ouyDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dn7mnRw94qpvm/Sw5xYL3kga9kTW/QhSKMi3Ck5F+Jpv7APiDXQaTqjehh8bjvLsn
	 W53eCi4+3BfyASXSZfnSXK9nX8Lwr57o0ndnCE7g/D7mmxoPv/+CF7ETrjuO/G4Knk
	 h/CQcPJEXwp18v2HlGENvLOoMVs5tUtjbfX/d7l0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B9F8F805C1; Tue, 26 Sep 2023 08:26:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 067CDF8060F;
	Tue, 26 Sep 2023 08:26:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A2F5F80713; Tue, 26 Sep 2023 08:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C91EF806F0
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C91EF806F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ig3b4aqn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9e+lmOcb7gLIe+6OqY8FvU8+dfqgAo7j8hxaHd9Tq9MDtUuZ0yaBYke5Q+1t7VEgM9nnjPesQvhPU7EAyIV1IdzfOJYxikyWXrhK3EZ0+7T1Y+qqko9tjbgxBgPUBVIE0VZLXKeLqLTHoGM3QuUi3RY93n7B7GfWA2MNLiVdmbG/vPbymlOV0tCF66WgSywWrni3YuvDw5dOuoxHaV+H9N9XN7kTJGVBFqiZx2MBybm9FXlLQxDwRF6DOQ/RYyXFKyjQ2k/REhlO1vzDsudoZPVP6oOBnLIOACvlwTeYmflPZb2sTXr1K6JvJLVZhEBUEGX1OiB0qMb/iNTHuGv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNuZJ+gKfybAwD0XDDa2SonYeXoFkMaiS0xGW5rys/I=;
 b=CNfwh3p6Z8Ao4EV2vcWXTTZWCaAsaz4O5ByFtgybtYRhzLiK4HIERaKUch4BP5jCO6SmM27Z8obbgQB23VpmNVuyIH21+GSmaktvWwflmrOW/pK7Gmg0otczZtBdyGDAQLtQMP8ByH7D10Haj+lB6oskIxoeHCk8osEYT4LZabKbpgwQEQNzAag1+IHAIbYU1tWx7F8ybbKKQ//R7vSscLbaMjuZICEYQHRKmfc9uAyHgOtoZXElDINFTJ4NQBxeHOoEZ0vfrq+S/3SAzxjyIPymUMWfm8PCYgw+X9WOCW4FRYt40CuiM1ncGOmnQuRAkJ4VrfJ7NcN10woEf6UIRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNuZJ+gKfybAwD0XDDa2SonYeXoFkMaiS0xGW5rys/I=;
 b=ig3b4aqn9w7CE7r+jrYEK2wLP5bEPkXPaUSKFBcKRqeCr6IrJ370kXdb86rUDwerES0CDAf78lySDA7g4UXORGzp6PeqXWcZKkMtZUzYc/QCF/r8ERfVlJQSokZP+f7f1mtAmC4McpiVhZfwiPJ8WwJY/YludRAO7xS0BjI3+Y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:21 +0000
Message-ID: <87il7xfo1e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 47/54] ASoC: soc-dapm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:21 +0000
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: e56350ed-d691-43a0-4411-08dbbe598055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zU1LqtdM0piaeIF83WNI64THY2GBpMzcflFoQ5NfghnzufvTeZVDcdWcWMxaRao2Rmv54yirRqNPEdBTsSfqtAHQrPeDrdyIw9rFJzXKsQ46m7JV6i9B7RYk/KU5T9Le50q1ooWf4GmsadFl89t39TJj1tGz6WhJILKR7+XIkRWDBsD9YDtuwBIyr8eED3yGNOv4u4+2MWyBMDlqWjWsbZ8GBe1f+YlmJyMPGwqYg8GNwJDmjWpeOdk880zF3W5z3srCL/zAh7Y1JW+RxnB09+Z4lZFk6IPy8eE/jExg8EwsBXhKbe458RvMHHsOgPGuEr4T0l8vaW0vYwDgU07e3zVqKtOU5kTod9167r1uOxCsNro5/ucgOIYCarnRbnNQ+ijbmvXK8u21gyJ3d1yiDUWnsY+olXtHByRbJxQJUxNBZbsjo6musN+cN7n8R+th6P7qGIpV9GtAM43YiWfQADOvqQ393m3m20gN1WjuY1f/xBBfiaWawUKgK4Ix7zsRvUP05KvkC+DH4NLJ/3VcpEYKI6zPm+Dj2pdzPYZoaN9xbdK8CAhQSnVlRBBIQz6DN2Lo9AYHs9WPTjMEAO3N9c9t6cj/7ZFEQkTigXh2was+2MCKH6QvwI8fkWGfEOpRaV88b9F9df8BldgnAyEq9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?C8GYaHy6aH1Hvh/h7t+gscEFO7iX6VgH1qSBix55PejQIHhC1t/z1T0jsuD4?=
 =?us-ascii?Q?mYuoY+wxgCB5XlPo895Yi9JANJ8H4To3rMLeaFltbqSKpdem+qv7RjwnIBUj?=
 =?us-ascii?Q?XeAm7E2PG5vEkeYaVXqig2mOV9/yec3HpBhl3Oox7IqSWUtZre7CJCp6fmUO?=
 =?us-ascii?Q?7TrRSJcptjBBpRArv6nWjFew1Z6KlPdscxAJD3D83Qj3iz989lpShdDZMZ3t?=
 =?us-ascii?Q?HsOk6L9hHTHF3Fd5a7jcWMS/4LNb4czerz1ZxTAT4Z46g0e13ecC6F/gD2pZ?=
 =?us-ascii?Q?TEawmSdZGbmejeY7DggeecmPziV8ZjKWlAnt7tvFqpDgImoQVYGxWpn8obIo?=
 =?us-ascii?Q?l2rUtjbhP6WaV4+pBVtjeE24S/Gnqb6IaL6w54U6kvQHoCbyfcfms/fDLxnV?=
 =?us-ascii?Q?OhlXSzeQYuYw/jhAASkuC8EhytLf688xU66juRJ8ZB1JawGJjpCeO2zMCxST?=
 =?us-ascii?Q?Gz/7jWoj8wvduD/AL4EcfYg9LpEiD/ABV7nMmFFxz++U2PPi8MH2BYfHd3eD?=
 =?us-ascii?Q?evsXeNik5dszfl3w63xA+Vzy7U2Ono1hOoPrj/DhNLBo6MDatq16lQzpFnMX?=
 =?us-ascii?Q?CM1V7Zpy9xtZcXFr/Jq4g02IaFY3MRVZwFzoVC+N8sv5I7iik69rHXXxDhB6?=
 =?us-ascii?Q?lMj7k/L9Jvm41E9jOMP42q+P/NGIeQCrU1ZJekxuHfJDXbTe5qpmIvi3jrll?=
 =?us-ascii?Q?G0mYksTs3gpCT+gyQCJOCcws4iFr5XyPdzaZ3qp3Mf0EKdHERd8wxrI5KBbW?=
 =?us-ascii?Q?FPMKGN+/PidaO3cz/0YGGYY+twh6he/n8kP2gFzlNWgDO81dv6Pt+RVccAPj?=
 =?us-ascii?Q?7JyYCQSxwq8Yfc/a16yPonzZGAi7kPcIHw/Gn6kv+fqmBnBCLecz40MX1cOm?=
 =?us-ascii?Q?hhT24Z95O4hoG0YwXKb5wvERH0ih/0rsvgjZqrtAEHA2kZJLbcl28zUVC+hg?=
 =?us-ascii?Q?/bJn59ZHbdfJpeeGlp0S3ktbmIq8pVWkIUbnPMNUjf64q4CWCi47Vzr6jpm5?=
 =?us-ascii?Q?mvR0kFo5kDiOfghEkfmzGgLyQOf2ltS1wmnzn4AQ1XePZiEdr6xrUinTXuAz?=
 =?us-ascii?Q?hVRYX/Vfa1uSmaZ4gLB7CXkZNLdMvAqWOslzaTjbXZn3l2iFP34wAgyOC22Y?=
 =?us-ascii?Q?7wHc1c0/FtnpHZSmnSP86w/5HdWPhnQTOZk7BdPR00yyL0AhXwwFlE1Ep3TC?=
 =?us-ascii?Q?m62Cuxt/7dGHn1OxlbJKgWjoFS3hOZmbIvKNS1Z8GAOUfpoO/+qYMie5zQZ+?=
 =?us-ascii?Q?uoHJF1H8DazwACLsc6PVIZsuR6NaUfsvRjBFeYny+gCh8h9E/EXl0GEmIka4?=
 =?us-ascii?Q?2eT6VdfpIwDtVqmZL7hVt1CF+NxrHGS7jIX08G29TMc+wk9Q/LOI14S7AzJY?=
 =?us-ascii?Q?8prrDtU1KViK9b2v5a4ziS0/O8gSlfuis7bEQ9MlW+6cDGDY/8I8FTCnoRVa?=
 =?us-ascii?Q?LONS+85zf1BWwPkBBEJCKrWIE0za3JnuynVZtO4EV+Blp6xA0+IXUr4b957d?=
 =?us-ascii?Q?beQSBlGoowM00o7+Y+oKY82ynD5JYMQhCsvdfcQ9hEgHNK8L9jJg/VE8CkTz?=
 =?us-ascii?Q?t4Mmgl2XIlo8qXfu0lnIpOQ4DjBjEA/Fu2nbg4Gc24SNbxoAdmvXMsTxQuHy?=
 =?us-ascii?Q?AoO338zjusAsnA0/QslKQsQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e56350ed-d691-43a0-4411-08dbbe598055
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:21.8414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TQkXBM2wrGBYgjQF/L4V84E/6gyuEBbv7rrvT0KZwUMGO+2e994J3xqlT4ZAUhjjLKOL150lrOIdYczaNDKyxlEVXP9iYVPS8vY1+ajZeQbkLCa88RTiYQnlOkj9f+GN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: IB5JII3I4AJWJ4FCXFYORJJOQ6FRD33Q
X-Message-ID-Hash: IB5JII3I4AJWJ4FCXFYORJJOQ6FRD33Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IB5JII3I4AJWJ4FCXFYORJJOQ6FRD33Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f07e83678373..2512aadf95f7 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2717,7 +2717,7 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dapm_mutex_lock(rtd->card);
@@ -3822,7 +3822,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_hw_params *params = NULL;
 	const struct snd_soc_pcm_stream *config = NULL;
 	struct snd_pcm_runtime *runtime = NULL;
@@ -4142,7 +4142,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 		     struct snd_pcm_substream *substream,
 		     char *id)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
 	const struct snd_kcontrol_new *kcontrol_news;
@@ -4441,11 +4441,11 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->num_cpus == 1) {
 			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, 0));
+						      snd_soc_rtd_to_cpu(rtd, 0));
 		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
 			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, i));
+						      snd_soc_rtd_to_cpu(rtd, i));
 		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
 			int cpu_id;
 
@@ -4465,7 +4465,7 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 					continue;
 				}
 				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, cpu_id));
+						      snd_soc_rtd_to_cpu(rtd, cpu_id));
 			}
 		} else {
 			dev_err(card->dev,
-- 
2.25.1

