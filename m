Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DE97AE5F5
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420B71501;
	Tue, 26 Sep 2023 08:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420B71501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709917;
	bh=CovFu9Q645/BF/oHxxw5JRtEHb6nNyJaE6ypCHtHKjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tvkb+LLOKyUkkdE4s1XgAXN9MC7odayvXsuU9Lk+9zJY8VUf+gOOFRgZlgNGNoCNd
	 xe99jz+AEqWNa3t0zkyJnta9A2T5i5CNymcDU1lTtVmvCG+w3SxbSndCne/7pKn7Dv
	 1Io/9sja0kg2bqClo9B6eFJ2G/mw8dLD+q5AZVTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E9BCF805FE; Tue, 26 Sep 2023 08:25:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CEB8F805F5;
	Tue, 26 Sep 2023 08:25:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DF5DF805F5; Tue, 26 Sep 2023 08:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A053F80568
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:25:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A053F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XXexCWfz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE9sTvYeFvzT0SI0pKVKaUy/KJmwXPhx4ekXiBkQwCI+XrG0jXsW0chnFpINTi0TySFORb5k7f6lDVX++sDlDeD2r6Z5qyPJBXvSJlq7kqj5G7CBRLWqus+AaijxZQoLwdluPUFxWSyvpAw3TdKibzvaN72ASAOhsVuvgIIX2uxO1FYOlC+ct5rjvgIbWIyoSy3zPxHW1yWt5XbzJKByQQRsoXmfwZoYo9Kt23AYhVg3UjXZxI07A2DMpieBshFozpl+snerRBJS9uzVh83IVoKxCm8cEWkSUJjnpXFsnI66MVgU53wgV6+5l1Erg0C4dO4YQHUoIv+4rqAh9MIclw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuMoED3uqjKPyDjmHjqBLskZNdu4t+4v1+CBVdDPdSw=;
 b=eNenhtSmfCX1KLf4eng7eDFxt0vdJ/QkjPOgy8ArynzAKPQOHEsEl8W8TSxJmb3MhR1AQlMCWqv12ZcMjvANOh+3u2KP1+ZeAv+ai5O8Y5SE4O6CECL90cZanoF5sZw0p6d8oE0ItD9bhJCOUchXPB71ByBSbM49ZiN4TxcVpc3ql8/GsY7jnQ3kbsuqGjkISUeXqM7bN06Yng09AFgppslURrp+50elz79fzFI1PHWPZ6ClX+D2OzkthI/+5aD8+ZKo087YRIFvLOfhm9NT+LAH+J7rvWf0b0fxIGdmOoqCSyVfeTXJ9t/m0h3HXKKmmSsZWxKgwT8q1PIQn0QgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuMoED3uqjKPyDjmHjqBLskZNdu4t+4v1+CBVdDPdSw=;
 b=XXexCWfzLtEWnzqG/Ha7u2W0BbbOpuhgHyi8obm226vl7tf0KI0lP4ktCQWyqIevxNoS5LlFEbVoEMa6G5FVYxWg7N7RDpjQVVFkswkclb9c34BGesxpALcaW/ucid4ypX+JK00FGJGDqlm9CSHtp77DXVwG+MQxaOGQhZHw2/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:25:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:25:11 +0000
Message-ID: <87ttrhfo3e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 39/54] ASoC: codec: cs47lxx: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:25:10 +0000
X-ClientProxiedBy: TYCP286CA0034.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b77ce07-18b1-44c0-7e66-08dbbe595675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	erM+QnzLqzP5touhuzzJF21Nkqmv9TuFM/zMhcS1G0+7K3GF0pFkxOxpYxyAskAcN5H/KVk3uZjEt9i0y6j9OSRZmUJ8onnj0xJSUyKly5BIOgKODLbmDHrPZiF6vp+o9zZEzGn1sOURsr0Tl68ORGy4bl3QEZgK0Z+3PomVZOpNv02J7oVA0tiUAICiWZN40vAATeigg+bIjKwZA8D6lpgo9DRFWgNmsS3bg/dBItfz5gVLNOOjQlh0bMB4+rhDQ5Q1gm1RlAnZ+wXM9pI94KbmVK3QysASjNigmlyp1F2jskLg53+E75g9RPvdCc8N9KID4Iz2eGVE8D5Fd++JKdn55fUncyilGp05tYyvbDWeqBEjmS8g+bJJ9D/G+JrXuZ7+uhcsh+2nxLoZhUbQJ+ZGeWfadaOzo/plzHDcqQ5TL1rPgySYlWlmlP2ZMWBXbl+ellrtj54rSUA2EMZeuCTpurZ17uXIKy35Xj8iLJyn78pPbmgYjCwsXAqyCY/09QoBh4kGYNrMTWcme5LHFzKiz4lp61FUSHug34MeZhEzgugTaK4ZzPbT0LES0yVOx+H3LaXNduY8AOsZbz5hjNpKok0v6rW/EYYNvEJc9HCtnbhopZi6VAATabhJov6p4EZWIpQKjc8a/rxkUSsRYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pz1FgUwfq1mlDU9mJkQK3YC5rKrIOJcyxyOOQ+S83VzmPFfIJ/rAuzj0ABfA?=
 =?us-ascii?Q?nJl/YqJpL5BiUM1bXmMUa9lKSLGP9Up9k00IAgFCdudgPYeUZHA1o8uFMzMd?=
 =?us-ascii?Q?xHO2owqCWErilpk7aJgQZ9IHfK/OoOqKPOaW5cvWr9jWa2cbhb+QHqVvwMuJ?=
 =?us-ascii?Q?6ioJ6D5H+jnRKgxLMbOdsi0Urh1sHIUi5cZmnv8FeF9Cve7cwcglIbgk9jE8?=
 =?us-ascii?Q?1fjFA8EH92zM9IY7ZbMWk0ZDLtvCJyYE55Am7Yv5Ec+wnLG0N7Sndn6+HJMz?=
 =?us-ascii?Q?3UjMjzglvAGI19GLfqRW+9B+nmSxkW49MFYvAm5diQo+b5fEvAs5Y8Ji5W/t?=
 =?us-ascii?Q?/JfXv9KGBcTruYzSJlz2Jqi3IDxoIeFJHaFR4DIC65bIp4XjVai5LJdOWAP1?=
 =?us-ascii?Q?ojmY8Olb0hfQ/K9uLtwHVGQoCmZus9pwMlIZJw903m37D9bIH6crcdSlkqCu?=
 =?us-ascii?Q?e5rh8abJhlA1Oz14Smy60qyDMEpnJK0MdKKFJZbiRw0FYNIxYLyk8fl0WS9A?=
 =?us-ascii?Q?YpIRrbJQFnlA9J5pTxbbbEUQTYQfS2sxAZMm/QQHXwS5Gl5b6dzmRhtcPirz?=
 =?us-ascii?Q?BN+KM91/yXljk5uICPc7jrvMiSKlHwagoldTXbriEFcaqnpKiNC9TKUvEFNG?=
 =?us-ascii?Q?BmdORUzjEYfm+i8zdE54sS6phFJAwsb2PpLtUdpdjbuGqiZgzRfHa9iBC9i6?=
 =?us-ascii?Q?JaY1f61QRtBMsKMHhaY4LiCMy/7+k7UnKzZGdC+nNl39nkv1yMBIm1wbW4K9?=
 =?us-ascii?Q?VJu5+hokVZBpl7pwnh8abDNwkT36zEG/5OUbxG3oEE4FjvyXrBtB1lzD0Kxw?=
 =?us-ascii?Q?XFsDBXgABP99edt78HdVn4C/h4wsWt7I2kjhFU0zDn1HfM69l5fcvJlUffW/?=
 =?us-ascii?Q?P+FX0kVXvtpq+dTRVPoQAiwaYJxbJzc5Ay/zXO5r+j4YaCWa4IKNm6q7QYTC?=
 =?us-ascii?Q?0xBupkkvvPfQbLTsjh1D3jjo4/p0R1nfY/NJw6pMkli9SOKwI3XTlqzXRmo4?=
 =?us-ascii?Q?t7yhBDbUT3CFqrtC9PUQimE/QNbAgIuj57QT4U8x8qIE9Ep5VYhUO1xTfadO?=
 =?us-ascii?Q?WB7eWydp5KDjjO+i7MMUt58B3+kd4Kbx3Dk41rW/PhXYX+Atlzoi7iUTW4Se?=
 =?us-ascii?Q?ahhr3wo53vIjUBwd110QQtvavEA/wuNKulazm9DrZ3JkTvPKJBGjmNDi7X/u?=
 =?us-ascii?Q?1UZAmqRuG7fGBZkvrXNyGCRMSvJJ46Gn6s58veJp8xj9St1AriDO8bYLkpkl?=
 =?us-ascii?Q?XnCF0oS26srL7R0gNw3UmPpt63WgEltOJjaiss09xmX41hjH99+JvEQdAoPd?=
 =?us-ascii?Q?5Rt9h/sDZFXM+vkKel6hTW+ff8j1lqlPrSggP+fYf7lwqshdEYbO06CRKZJK?=
 =?us-ascii?Q?bF4KSkiAf95GT7f/M6U3F8vpPRcDDrSIzwt9QqdnnHFm4eh4VgiZwe/tOOz1?=
 =?us-ascii?Q?8HQzIeRLsPKPY08p+ZImo6RBmt1FtD05mzeqxfS+7bf7F/GBOv3rzFb28dBr?=
 =?us-ascii?Q?jJ+OZqMeDyIUp3i6xDx4dda5Mm3JfHvk85Z/3a+oopvZsokX3ENbgNYSLtgB?=
 =?us-ascii?Q?KK6HJCHHcLoWXuY231Ul382u6NihvTj8oYxSM07AO40ba9CqTHk1mQZc3Bsg?=
 =?us-ascii?Q?JvD1tDEJ6fWBMdyHDHA3hfI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b77ce07-18b1-44c0-7e66-08dbbe595675
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:25:11.6101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eQNAB1ACIdFkH07ZEn1XVZwC+lpujhoalFOi0oEcyUbLWw1AgNxnMnbau2TiGj1WpnmueyQ6udigxwyNP5+Cgu8eoXlkvcq1lAeBUSlfaZ+M90Vsqn0dtZ9UFULU60mh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: 3GPWCH2DPBN7EZQNNHJCBWHDFSQ5V5HQ
X-Message-ID-Hash: 3GPWCH2DPBN7EZQNNHJCBWHDFSQ5V5HQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3GPWCH2DPBN7EZQNNHJCBWHDFSQ5V5HQ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs47l15.c | 4 ++--
 sound/soc/codecs/cs47l24.c | 6 +++---
 sound/soc/codecs/cs47l35.c | 6 +++---
 sound/soc/codecs/cs47l85.c | 6 +++---
 sound/soc/codecs/cs47l90.c | 6 +++---
 sound/soc/codecs/cs47l92.c | 4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index 1245e1a4f2a5..ab6e7cd99733 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1246,12 +1246,12 @@ static int cs47l15_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l15-dsp-trace") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l15-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index cfa1d34f6ebd..ec405ef66a8e 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1080,14 +1080,14 @@ static int cs47l24_open(struct snd_soc_component *component,
 	struct arizona *arizona = priv->core.arizona;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l24-dsp-trace") == 0) {
 		n_adsp = 1;
 	} else {
 		dev_err(arizona->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a953f2ede1ee..0d7ee7ea6257 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1510,14 +1510,14 @@ static int cs47l35_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l35-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 827685481859..2dfb867e6edd 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2452,14 +2452,14 @@ static int cs47l85_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-voicectrl") == 0) {
 		n_adsp = 5;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l85-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 2c9a5372cf51..2549cb1fc121 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2371,14 +2371,14 @@ static int cs47l90_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-voicectrl") == 0) {
 		n_adsp = 5;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l90-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 352deeaff1ca..0c05ae0b09fb 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1850,12 +1850,12 @@ static int cs47l92_open(struct snd_soc_component *component,
 	struct madera *madera = priv->madera;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "cs47l92-dsp-trace") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "cs47l92-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(madera->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
-- 
2.25.1

