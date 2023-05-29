Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97335714174
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF238836;
	Mon, 29 May 2023 03:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF238836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322272;
	bh=TvTYotcr4ZOu144Ecmw/NtiyUw1IkWxrJ0GVFOaUoro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qJJOP5dqDUZFBq/WxpSTna+RZH0FSrIjYF5/aMeRO6HAEZUpGNrdVk3umXjsB1+R5
	 mCZGK1NxCBR8DioWxYOk2k5VtK/f1XcBKoI1X88KWY/Dodghb596/BoNA7VFMQRa70
	 SLCYpHhRznuQnTlliiOf4hXqMJ3QeXc++5XvuVvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C71F80571; Mon, 29 May 2023 03:03:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2847F80571;
	Mon, 29 May 2023 03:03:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66D2CF8055B; Mon, 29 May 2023 03:03:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D77EF80551
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D77EF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NzPb6hHz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdqWYIkN1kWBY0rPWOreVx+FKz0o72WnpAHBdjQQ9O+skgZngtQ1iPSj1Q69AYSAyY9nBlI/v5314+Y+VwwCnIahlHZL/tQLMe2MpeC79/doaC08Tj4WXZCgGk9QwbNxomowIdAbUmgbi6klSTJMO4ddb3yAKqeXp74vzh8TvkFNRxMZGLyuPIua+XULjDt7yCKp8ugjdkMi8tn4xjpoT5+FcONPXLwJpMn6SQADdOeY/oi4049oTmhZOGNGm+bEmIznDXkziiI/BrTETJA6kVnvIOiuL7kF+Pe5mHx4+TTGk2LCFNK3foNAsS5cIzVxnY5irgNe9AEvimv2GSEFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbeDTQB35tZm8Y9PzzEs450v5znSklXmzYkAjOadlco=;
 b=nByqQ7GY9uFIMKqdA2nerrGM2i7TSxBc0TktSCtD6mVcCdIt9C3BUzwq9EEh8GAjjS+C6RUXbWDCek+5yodAakngJ7N4NCbbsTeB4iE4Zgpt/Mnn3hvcihu1S2FdSNRQW3AWgXBSiunoBi4Lst9wiyGxycFBQlg1lzEQbVkoYKVM+0KrIi5ixkuQjsG0FSlREr8ZbiiI+QXxmVUuNV68Zm6I+Zbo6TU9S0/NxiLfLNS5eHoiF7CPlBnmT9ge7MacWYdYON7GchAr6FR6+mJ53bN0fC3zPT6/qDwLhQ4nsl+S16ItdpGa2MFy05DgnXO9HtC3QY279e8S3tY7vzOkcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbeDTQB35tZm8Y9PzzEs450v5znSklXmzYkAjOadlco=;
 b=NzPb6hHzngS+H+Y077tVyax4qEwG4D1in+Qm5jmyeXyWQ8noM138zQO8TsJLlVrrWkNC1sbfoiAYFgh9VKuYzeNqTQOBmaSntekXIHXaQZSOAYkFtgWkpFR9wcLhBPuy3EXV0sylcWK3C1+qxx5B4yHKRkXPVu39ycFgfj3/T6I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11557.jpnprd01.prod.outlook.com (2603:1096:400:37d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:02:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:02:59 +0000
Message-ID: <87leh8lzjx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/21] ASoC: soc-pcm.c: use dai_link on
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:02:58 +0000
X-ClientProxiedBy: TY2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:404:42::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: a8f0373e-3d78-44da-e786-08db5fe071d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oGV4NPZnvo2MwYqtUJbZE98gIWt3jDGci/k6GustS1tY4YtYUrD0fmX0fNEPqwaexzWVEeVk2eLQoV1QBup7C0n3GKg7Mbkj0slZPVTjuloIiP70pHxIf+sVGB/YcHeucDlgDeApgwV+nlvzqaYB2NVKw41aHYuGIqxKiwkUZL6/5N5q/cTeyTU/HCK21k6TlSRsNhZY0bF7Yl4/rKFrglnn3SvIbuu21SQnvpLHBE7D+idJtvsTkMWO16qKRkV2AondtBOuq8goWdqjubtwvpnTdOGFkFyzw4RN4t+lMuoHXLWsdYvnbbR26702ZhEd/FMZR4qxM0pLex/4o8xvZ2Fl40qbroELLvO1BJVLLoag/JkAVtjOODQIt48xa4e9jDCTnzQYRhrDt7rRpCiub9hBtBYhZwZucuV3KLaynyW7K99bSyEujJN1Quwt862/yoLrR1q7bCd5slzoYzJhtaxTe1MNGtsNu3WL3f5wu8B5mqj71GwS7+eL0SEKjAazg615CFAF/zuDK8yHCaU2MBT9Q2SunAbhAsHiCNnPxmbGg1HwNGiDe8PlsQdxfOVVAx+IQ+YuuCkXjBag8o+9z6XvmdYZM79HmMpe8nbORQTk/8sZ+IR4uTGC4H5X5iNp5VNfXFAT7fOXMDSZP6fLeA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(41300700001)(6486002)(52116002)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?la2xZtoTOSqq1FOTYBltWpcqEZwlGp+ZDeqYqcDopdrXc32jIj1UtZ5y6e?=
 =?iso-8859-2?Q?eolwwU0sRKNQmPCut3EFLBUi3N7jQ+mPvsN3NAhPig+fbIESxh3U9trEuX?=
 =?iso-8859-2?Q?MQP08PJZ4pktm3RuoJrUvvrvkj2kZd0l2bBYHZBvaNY/Kw0RGpor9/KgC3?=
 =?iso-8859-2?Q?ENUPbX1STjCs4an4rZ7gwmSUlBTxmktSe5Q2P8t+n/cG/+ylomMhzFKRwJ?=
 =?iso-8859-2?Q?BToq6rmF/vMGTB7gl7ymzGjfDxNWvuTegOYhahg8IvKzyslY3yr+hxGw4p?=
 =?iso-8859-2?Q?sdXB5xarz2g4z30RCney5O9BMXgX1EvsxWDjNPabxCdp17rXthe/Jdu8WC?=
 =?iso-8859-2?Q?Cp+J/hMlhtBkwupw51cpaHIp2wimXQXpogMpr5FgIYikv2p1P0DJsGl0RW?=
 =?iso-8859-2?Q?INlhAGzLahl/cxbYgKSFd4fZ+e0eK5x4xQtkYOw1hD9ozY8BaG3cEIqDn/?=
 =?iso-8859-2?Q?JTlsK460mJPOj9iCt6B5MDRcHkoVhdkTXELYoHqCpDiTCqxVmgduL50rt/?=
 =?iso-8859-2?Q?FzqoInAA2sxOj9xYn9s7EJlaHjioj2ZMt//xd4zqL+5rieIRwOZEzLzpOd?=
 =?iso-8859-2?Q?KlOs8DK5ajjZGHcIJvWEern9aQgx+yiORVv+RHAjzAXCwxfWMsz/K9C8cd?=
 =?iso-8859-2?Q?O8THeUW9PYGQlLHZ/HxXD0z28U+/MmK5qN5iTb8niWW1dgSppQUUNx6E5e?=
 =?iso-8859-2?Q?+WEEeJH/rbMxp2hLSGedmepdYJgh2mO2UCwaEE17q+IU4BZyy+/h5Q902Y?=
 =?iso-8859-2?Q?wOheuvqOdc6xfYmUsuPtGep+Pms4NK6THFZHRTuU0CVfFZHxOdub+jEFR4?=
 =?iso-8859-2?Q?pxMbC18y4XmaWbOUlxCjKsaA1Upzz76eRVzCj60ivMv6YBJLlW3gqVqRGq?=
 =?iso-8859-2?Q?thz7VIYNKrJOYKp3G9F2YqcpIEAbJuRjrmia+KL9p7ctUTSBFhsABKk1Sf?=
 =?iso-8859-2?Q?vvC9SC5BdMidtwmnAcOEUc13Uh3HNTrwbURSWTkpI7d7jB+DLNh3aLGpHz?=
 =?iso-8859-2?Q?FtNmTARz2uqZlGEtN5I5ZVQbZVFqOtlLSQ/mkb5UOOALDdEeWvDTv5s9HW?=
 =?iso-8859-2?Q?IZP3gTAoCel+xguL5VvfhR07MLgOyFXmCNGHjfV+JZVKsO05Lyy6BAnvC/?=
 =?iso-8859-2?Q?VNIjvKss6/ADrF0J/MGiU7nqZQUPjGKJdNERtQG6B2E39241nIIjNfSze3?=
 =?iso-8859-2?Q?/HVlzTmb4QT3puI9tC0+81hb9lhjJ7Sptz2eJqHxPA0GGrrka7bb79wWTr?=
 =?iso-8859-2?Q?mkhxgl0OBs/3UdCyr76IJgBaZpxjgdrCUEftTByHnRz4TqT8ZyGg8Aci+V?=
 =?iso-8859-2?Q?QvTHQ0WezAni3EvpvYhBHh5vMzB0ZjQ48h6DQIRvHMHae6FD7FzP4sv3qR?=
 =?iso-8859-2?Q?9EGJ5/tT61lmyYdXU7flchS7wkLU60bnU1C7BxgfAXwvZ0iOuh/LEzFfuA?=
 =?iso-8859-2?Q?LDDVv2lF2v/iB1Q8pgHoAu0IyU8wTSk5ZK6hRDj4dtWz3LYbs+unEam8cU?=
 =?iso-8859-2?Q?ujFEby0tDFdFxa5isStb3lNIYJ/xdvQpKm6dmDbnGwwTbgOWSugd1O5/xS?=
 =?iso-8859-2?Q?/pQTkQRBsSN2S1xIcR3V6C8BQfK5A9FTDIwL6KfOLGLwDtHuViWx83v7IT?=
 =?iso-8859-2?Q?xlAE/xUE5Y4Ts8SD7/EjsBOzc+lTwDIrgGwmlalHvnON1Z7FaooKblxt3+?=
 =?iso-8859-2?Q?QdklIln0ExOh3Q4+7Xk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a8f0373e-3d78-44da-e786-08db5fe071d3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:02:59.0890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3/1MiVPlTVfzeRMQKlfmY7TQoeqetrshbIH1QMbkVg4SptTsRw9mswfQ/SLgAwvBoVKZ0FDUiOgPC5hgqYa6kuDf5iK1FcgAv45/iGqclcdpBxrZu4sguMeb2x3y2fdE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11557
Message-ID-Hash: A7ZMGISXXGOMKXV5EYYFJG4RKTQAFP3C
X-Message-ID-Hash: A7ZMGISXXGOMKXV5EYYFJG4RKTQAFP3C
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
Archived-At: <>
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

