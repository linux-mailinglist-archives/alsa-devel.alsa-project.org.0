Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1592289369D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 02:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B66C20C0;
	Mon,  1 Apr 2024 02:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B66C20C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711931628;
	bh=cnB/V3wohlLWCfkt6VQSScJ43OvBpoF23Awr73jQB4Y=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bEHadQuCHKlup4lrAQ/DkRxahcqTid5vFn5VymtEHj4cSN6n7KkRKaskTT/irn2qa
	 4XDbHOa0ut3w+tqaIMLxJykMqdXluUdBeMCcU/Q7Z4+QE+DfKhEkXqdxubb0/EQg6p
	 ZGA+dpAc9v8sLonhwQYCk8xRsrU9QdmzGekusybY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3371F805DA; Mon,  1 Apr 2024 02:32:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A6EF80693;
	Mon,  1 Apr 2024 02:32:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBAEBF805B3; Mon,  1 Apr 2024 02:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6646EF805C5
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 02:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6646EF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BqgSlRmw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeHn17oHgNQMOTWY/BgRB090SigYvcdMcN4FcvXa26hoDNETliRdFPX2CJjJCHzHxTLSqMKLzrYHlq9JNH7pJOycbIJNChADHlWzPpZvd7VzqOOepZGjPYJG5Tx2BELq66PGKhiylMeV+KB/sECP49l4ZaLwAmfSpfQKnvoD54Ge2I7xC2dadG+dvn0ERg+zzPEbI0h0qGd0ydDe4FgAqylgs/iCS3KJONs2bn12jbEPc1ZG6VDdBNNGlYQxl9oo4ZhtZYbvtpC19zb8BgwtoseNrNicnXPg6mF6J062QUS3SsAN3mOm454GDjX/6DCTK6jd+Wr46EG/ioxar2yoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxuSQVl0nypRiWotmWz3lA2eBHp44qVH8lZjAAMD0do=;
 b=jN1qE/4X3pHyBaHucpOe9mADA1+VWQF8CONJ7ZH5SGHlaFF1x5r6Bn6DfRE6GWx8usWp56w0V4sGGAx4UxZV7KPw8iAWfVoY50IARo6V5IQJMV0MLCb+4uMyTcsZtqvS2odNrAxyzkaJtK6lJJSpz2+fInicTXILHL0PZyQIwvdZK/LEbNbgOKYIIYerLpPprclIxOZtGuqsWBhlpFTSNplZdsXyn5A/TBA93i4zeh6Ega0gQFa8GhvQ6x1Ob9cGLqPJ8W3RdybP5jVaJVgMW71hiqlXbGnBc14sRpRtpDxesBJDmiFkg9yVQJ06vtSm0nbcLowMuYB5CzP8QNNClg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxuSQVl0nypRiWotmWz3lA2eBHp44qVH8lZjAAMD0do=;
 b=BqgSlRmwKDt1S4oooDSLarqh8UJu1ZBGLVQ2PkqV1k74fejsvUdQaY4k6cWQXzoUZw3SemOobv/12BJz1NzogoGupZUpqeoCm8vn+tXBhcVLIYm04fhT/t2qmqXGYa6Mmv4tWWn7eh1PodCqaPdhGMwkzIaJwneJ0DpvjYpLSU4=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9964.jpnprd01.prod.outlook.com
 (2603:1096:400:1df::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 1 Apr
 2024 00:31:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 00:31:47 +0000
Message-ID: <87le5xudn1.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 10/16] ASoC: soc-topology: Replace dpcm_playback/capture to
 playback/capture_only
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 00:31:46 +0000
X-ClientProxiedBy: TYCP301CA0004.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9964:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ixjrql9GN6NQSAk0AxbqEUFUsplsDOQt8QnQ11sVlS58Qx6CAydm1w4IltaqUG8w227YQYiZwmqk0cheF2z5c45HxD24TWzxKPaU/WUYjxkXwOSQjmmkuIJ2tAw1hnqNIdAfcev6Ie3VAK/scbyQViFMrp/xxWXQPRNY+nup5cAo+CsmsvejGXrMVUIxmC3cO2kLuStRLi2xxO3v4XwRXBOWQ81Nb7E/E2ZpFmEtCmHE5PDL4bIbFBFCNb1feqOieUqppPWTEUzIeOw0pWTEXP0mctRwN4Tzs+4GaLpzXfL0GFZrfBIDN91qBhoAvIfdhrt1fShynCg3MYOBTPik+d8mROGJ2hYIkj7gc5EuVtIQV5gINcH3QmI02tX1P68WbxkJLeTCqJo8rSNgey2jCpoZ13ZFxkzLXT5Kk5UE6dfdESBJFLiOvUhIAjSEWpUqJvuR/E7UNK5MicIkzFCd9ODiSa/4Rqr34py7LmkXmZGcVhehgf53hGbRSdKSTk6cT6EF4wZM9U3JOvlcw+WUf9M7ybxQSgHiZmJcwTRF6TrOqz5lNWQQPQE24G/Om+lAQ0JEOijZNGwi21DCFF19BmLKxZ2DpSqsJij3M1okIUy0T4n4Q8ojEFFMHfiDfMlspiC8gkN92vAJ8Szvnce/A9ilqTgAVRpZAPhSFLE78BTimvFxjmA7eJMujzSmB611gXvTtZVpR94anrZ5oAfdt2Bs6f4hV8NrxV+k6uVG58=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(7416005)(376005)(1800799015)(38350700005)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VnDBupkSIqtvgQcWzsfRtG30fx+zsad6GjS0DdXRju/oP+kx7941T3UfJKGQ?=
 =?us-ascii?Q?qoOmbP6tSL6rUTodbTTAeFoJ4NzKjxVfGS6JukF9Q13jZqSE3gq2XGQPXx+H?=
 =?us-ascii?Q?Q3AAD73mlue/V+mLL/r03d3P48pXI6J6AmhYxtw92Kj0kbmC7g7vKC8V7mz8?=
 =?us-ascii?Q?iH404bsVaX1ByI/MxqZ/Gx+xGdr85MmIPVyskx8ly5QZoNH/BZh4iKT4u9OG?=
 =?us-ascii?Q?2qfTI8ycxIUZJBuCCNHGVl4HL0razZ3cLSmOOxzmFLde6P1yoGqAGb3hxtdx?=
 =?us-ascii?Q?2zcLi3aCh53UWidD/Ng1tQrOI35HxMDiQOeIrEFvTqoOc/NYU8l5Zd/8c6f2?=
 =?us-ascii?Q?eWdFJDgSZq/d4/M41+0cGY0JjUp9B5kAu0PWKqoJr8UwpLBEOSrl2W7yypCi?=
 =?us-ascii?Q?JZjz99zMki1v88YtFxOWP8heVqhXsPQnPIiadZS6NYhQRtlQCcmzTQskpt9a?=
 =?us-ascii?Q?mmqeFx1AFCVuW0AWREOVCrrn5fPAj36e6h1j2/PZMdWQtvb/kGhX6z/cBj9c?=
 =?us-ascii?Q?ABOopNjlHKObyXfC7dm0NInrUCDRtVlFB1GjlBrlDqf98Tl78pNvbmvrNQDz?=
 =?us-ascii?Q?i++bv1uPnqZ1Po/Nh6yh1QHAGSBPtb5vopf0eIh4tIgoyg8K76Deucyp06p+?=
 =?us-ascii?Q?PJ61d6POOFn7eH6vC+bc3Wg55AzsPu7KBU46DaafYhTTrvZCZD1Ek/x17BeT?=
 =?us-ascii?Q?9jmEBCcUY+Nb2dagaXpkxFPHpJhoio2mN3S/dHg2i3PFgFNlv9SWtwhcLQ21?=
 =?us-ascii?Q?p2Vl75S+zZf1S5YIXH2gt0KDleZplfQ79N6T+RitF6jBLHs19+zSD2t0iH8B?=
 =?us-ascii?Q?yfedeJ4uf+vmTJ7JNAVd/gem6wZ0UI5kPz86n5P2kUrrNXJLhu5DrzwOJbdY?=
 =?us-ascii?Q?wh0+vn8vOscFGe4jlUr7t8bFvKp32KhtkwSOpa6i4+ZcawfH1kHHvMHnW3m0?=
 =?us-ascii?Q?l0KTT/DDTr0H5bLdLwcfx+4sJbL+UMnfh54MfRAFMhHINvs1TyZMXBMCv7tN?=
 =?us-ascii?Q?CaJYOr3XoTDsShkJ8z1ssd4T2F5qg2ZKH+eMUW1BaVe5ukmG4Q/SMY/S68zk?=
 =?us-ascii?Q?JyTbv+Fg5YdZczQF2UQS9rAPraRWvthua1k1iQgJhlRAOnAk49NK+bkrBsoA?=
 =?us-ascii?Q?/g6L9LX2JN4F22uoC6UbQCRaD2JNcDTMoDfAHQwBQmVdG6hPCDAji6Fw1DK9?=
 =?us-ascii?Q?q9mVZB/8KRCPrXad5KhCCOZ3+dc3E6aRtbIUEJ8Pjla9KJ2vTJyElkNL/fK3?=
 =?us-ascii?Q?2ntQI/48RrIJ8t563JKSuPcyp0eL0TCkhHM/TbRyesNSd1VtX7Yg2v6MGObf?=
 =?us-ascii?Q?3flOW3IDovZhfjwkvy93kWturK1iZkVrx+wcskboot0WWUvyXzChQcRvDufT?=
 =?us-ascii?Q?9WPjmSuaA3zQCGh0RjKrIpdnF8uqVgbcAWkJPjU0j6BYfDvG7/VFI0hsis0m?=
 =?us-ascii?Q?mZmaG5t4cCOyH2Dq/ArTip54Z17nv/01mPMZV45j+zq4Ezj6+SG5n/HXsaW8?=
 =?us-ascii?Q?T5q5SeQnaWhYnzQmbhgWhh/GynVUu5RULk7OZspxbLeqEXUMY4vqIJIvZjg9?=
 =?us-ascii?Q?wVzGIGkIE+Dfz5PYdax7oWPwDKaDUMDZ+VidLG6zQeFpWTHWlfudiAP8K0fn?=
 =?us-ascii?Q?h4EA9l3HxmXznpCxo1eQ/lg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b628cfc3-aae3-485f-b35b-08dc51e31d59
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 00:31:47.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qIPJqoSh/rafoCVT7RAEUCzK4dmHy1ZeXL2KA/3WTmxSzadNH9qHiyJB63DgZqpYchdvNquNtXAgi6vjf9mg5rYUt/sVinNYDegYhUz18x+/SSm5JapGx3+KxiowcXE/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9964
Message-ID-Hash: D6YD3EIKJB7ECTUWMJF2T4JWFULTSPYQ
X-Message-ID-Hash: D6YD3EIKJB7ECTUWMJF2T4JWFULTSPYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6YD3EIKJB7ECTUWMJF2T4JWFULTSPYQ/>
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
---
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index 70cbccc42a42..fe6a4021b350 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index fad9432a10f1..c98847d2d219 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1727,8 +1727,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only = le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = le32_to_cpu(pcm->capture)  && !le32_to_cpu(pcm->playback);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.25.1

