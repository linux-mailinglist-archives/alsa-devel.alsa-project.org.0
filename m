Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 858E35B2B72
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 03:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20B91690;
	Fri,  9 Sep 2022 03:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20B91690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662686435;
	bh=TOsHN6mgcwQguxb1vIMtP2ph6vJQCuk2DI8Y7CErohA=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KMGulGrW7xQE9cbVTYedS+nT65sE9Kx6/GakIqNhiC1S4s4MvxATI27p1s+IeJSDM
	 +98r45V+aXbx5LrJWEcOEzvrAFLnXPupY6YkzE10ZbJDD/jpvcJMRpzJFCCFeJz23k
	 +V5l7f+foOT4KF+iHxqDmNyyS/Dbq2GLgcBc79SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8D4F8032B;
	Fri,  9 Sep 2022 03:19:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 617D1F8011C; Fri,  9 Sep 2022 03:19:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2112.outbound.protection.outlook.com [40.107.114.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63AACF8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 03:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63AACF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="Uba7XnaA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAEzSx3taD0lmtOs+s5St+fZX4ae7n0MJ9JmIuP6QohQI9e0yTUerXYVC6uyKU69ERHmzQP2kQ3jpitUxS8nBtzhU9g3ts7voQDZna0IB/vsTkj7gpwOx8qmYNajbSfBlzDNicvTP1QZZocOKeG8khuO6jhhvBJXWtYghOtptsDdt3lp6m2ZVf0xX8SYS9IGt4XLJVyAWEwGm1LTtXdsqXdobKQB8i1vqOAy2LP1b22K1UXJAdDy9y6mn822VHtTjRInjtldZeVn3GQ1u1dxK3osnuOInDnVn6Qcpg3nwhdoTw/JD6F7kKG7G25SA4+S84OTz12pnFzXbY+n+brBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xLEjk0PL30aW9zeVfJHrDkUmxvIK/JmdL5//Wy2Aac=;
 b=EGA9QZZffnBAtaEvgDcVhgTckR24mh/aogcXJ6HTv5eTNYMZlEOCQV5VkxKJSuW3k+ZZQG4GmTByEJsVjJk6hbGwBByfVaATwCAVbRLaGvyp8XyKJCBC/3uBmGl0SB9Dv7OAT9D6G8oTuMm80fS4orHvLYB7zi3cSoENGz03mQRs03ynizvBjD9tUyDoDtRTgbwsaMb53oySlKEVslkVVHnmuLZlig8ApPoR5ubdnf07V9TLLGTuAAtOwkZS1DOwM/zFvsmVitK3YpfmnK4tsQ8sxAMRts9JqI+7CawywnMSB8YiR/8M9C5hOzdQvKiNtPaJ7Iq0BFxnTpoaQT4pPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xLEjk0PL30aW9zeVfJHrDkUmxvIK/JmdL5//Wy2Aac=;
 b=Uba7XnaA3hKAcmPar7G3NR0Gq86ANR4XjptnKp4pWChEK08JUR5oMK9NwANZTEE3k5Y1JOYy4+/rZxu+s76MPkEjvQMXnGwVKnMrjfOCXNLsOKhGsf5EmQ0Ebydi3MdThM7LnUzWGfjbibo8NHZCatzsbSXKR4E5akLCBbfmlUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 01:19:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::1891:867b:6039:55d3%6]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 01:19:19 +0000
Message-ID: <875yhxmjjd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core.c: setup rtd->pmdown_time at
 soc_new_pcm_runtime()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 Sep 2022 01:19:18 +0000
X-ClientProxiedBy: TYCP286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd34f42-c5d1-4230-c715-08da920151c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iU9tuxXRuqc7QQJyg7EybgYVfN0IGk4Epy2mfPdRXNtjheLjTK3TdYjIcTr0qwFGLo3VUebXGb8noPAeZcyQTt28sb97JwZ8TS1XHTy1QQjtWZ2cgPARGAS6ckc9vPyKefrDljMLCTX01QK2tE9dU4BwZ1zNCCOZAs8XJ0hOkqcxtGpB2oyZhnF2RnmSjpIdAvXBvBWLk2DnF8g2X7tU4UUXXs24q+PmyYuegCm9U8ea/MJ8vusjl6dhJvP9sLMYfFnAmcI6lfjUZU9mpg8vNevYgMq5rPj24gm+0JnG//nQ24dTdfJgO1poc83TF+1KsG9KtTHXTTRSSOVEnpHaj2oQIqO4EJk4GtU1BeVyg7Iy7jsoV7VAxJdT0JR+7EX8g5kcfb3Cixzsu3NJfYMBh4TlBzeRuJ+RR9cNUHjCH1RcliyO/O1Q8XFSKb/SaRUvatjLeKX0yI8j9/Vv8F0CK9sVTJx2GGgeUX2/JNWSm+KKmyfOWZFi3/V6e335sb7IppjbgH9yUK6Mk/qJavb9nDCkxnC//chgvlrti12S+Zhk+IuiI5dyC18ecwLx08kzoDYTEnJxYZmadSTLSzuum7s93boFzBPU9vMSyNttfyNizLGUiKml80NyceX7EzIBkPT9jFIXvYiZ34ylk7uOmaaala4+afEkiZ1OBCchSgdeTMtUKSPNMPSiM7a/2C9cq//fIBwuk7WFe75ybsG/jO2zYeIXuZQHMlXUHhIf+tcx6K/uVj/2jlg00FFUpucLIDwdP61rc95FC7bGWKxP8aRbjBnFXxqaW1L35nLnRvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(52116002)(6506007)(6512007)(2616005)(26005)(6486002)(478600001)(41300700001)(186003)(38350700002)(38100700002)(83380400001)(316002)(66476007)(8676002)(4326008)(66946007)(66556008)(8936002)(36756003)(86362001)(7416002)(5660300002)(54906003)(6916009)(2906002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tMMnmu5Vprx0OpOWZBdVaMgLlS78nNIIEhK5ED5QkGF6m7uzDUlGLGralp8i?=
 =?us-ascii?Q?7FJyeHu24h/Kc8D0xuXyvOW1mlTPshJDRD/gnK86iDj06koJlPvGtjoOqfP2?=
 =?us-ascii?Q?TOD0i0E479W02tRD+JULMDJinrFrr4O8FQ2LubQc9a1hKbAfHPBb/I8lm93h?=
 =?us-ascii?Q?v24fwBcTBL/fJIfNLafQJkfLMrrwq2OGQv0egH4LnUMv6tbvOJ0MQCYGKpiz?=
 =?us-ascii?Q?/5yXChK38OI3Z08NmH8lITwBfzRq85YTB7s9tn2SyfbF24sg0YWnfsd46d/Y?=
 =?us-ascii?Q?ivSsXyX/cFLjqGzy5mBV6QIh1i7h3V1Pz+d9KeSGJ2ByvKiEPVWs6nPUsg2c?=
 =?us-ascii?Q?z7+UkeR4KEn6yi+OB0p7otOPO2Q+dqMGRWKd+kmykkwGL3Je+piTprujQiHF?=
 =?us-ascii?Q?/w+57UBWWbbCauJVvriyZf7l1umbCCLJKovmLX2eSPmAlPkAKHymiZJ6nwu3?=
 =?us-ascii?Q?01n8h8Xxt07etzIYOhqBja+rEA0zVHnalv7iaQa92CbOdXzOs4K7QDJEy9H7?=
 =?us-ascii?Q?nAx53Tn9c1gIYQWgrvQ264M/CtIIcEtibZXO4xF02s+jqW1nn075/b04cGN0?=
 =?us-ascii?Q?yfihxkNvCNiI3kGlodnxUhvHx0rMHGdaERwUx8KnwtjByw4tgpqHXan6Dqjp?=
 =?us-ascii?Q?ishkF4HsRGoKIFSnzkPp52h+619MJu9l6mNQ1FLIJ4lEedEhwEh2X/dibkAU?=
 =?us-ascii?Q?TWZ+1FsHyCdI7h8RRXnuejMa/yh1x49omqvmAyyEk6GUwkWwYAm1bE+7a8oA?=
 =?us-ascii?Q?CKXWGHo0zpYVKVNc0w0Uubm7/QdU0ynMOxawygg6Z2j6qCKY5h31VSCr1yZ+?=
 =?us-ascii?Q?0UwSh5B9mQWlZseNCtmUcF1Kl1yS6YiK1DbK//CD2V26x00hJbkjHbISmWY0?=
 =?us-ascii?Q?+ivHyTL+HJ+bxhx8L1an45utIS3A2q421b3yhFuVSo4yaXsKD5qcQPO4ACUa?=
 =?us-ascii?Q?P2MzOyg+v8WNscB8GPiwkHh8mtgfvaVwl3eQfY2C4nc6D+jkJT6JtxMcqRq5?=
 =?us-ascii?Q?df4nMzhh0d1/VxE2NmKwbIHYw/oaC/KDynSglSjOfavjFoQm+YABfMLxcUGe?=
 =?us-ascii?Q?RLTleFJbjYzzefXlhs8Xm/MBANIG+20JyN23w/E7XE3rP03GxDF1brr7v30y?=
 =?us-ascii?Q?Pay7iAMD340zpaKEbC6Z/gq8KWZX58Abc2MfJdaYNZV8utH7NMJBnB8KNLvY?=
 =?us-ascii?Q?Qhq7BCS3UHDxW6iyWXq31pR8O9EuRBPHwAqCP2poEAQJ7KYX562FPoDgi4kC?=
 =?us-ascii?Q?l17zti914lWl92yu3ZVhR9GFLGWtsJR/W9orIHAX2Skq/TIySpizy0EOiKqf?=
 =?us-ascii?Q?dqOSt4AHRTMEW6ivARuDuk6KJaf2lSDVgVKccDF9esHZuw5iQTukFLHOOs+u?=
 =?us-ascii?Q?QGX6IOzWoIgGYw+b3ZjEiIHdN/6fxF3knSuBxlN8Q2L7nXM7b9XvpLTAj1Na?=
 =?us-ascii?Q?/kQuuSMAWAtrIgL2Gnk3iVLX5D9EncR1ayxGnj3YDK/LXhk33KH8MUq1Q4LK?=
 =?us-ascii?Q?nmgtuNzbzWUj2jz4ErbVBPzAdUssHv6KRTrCDsgr83cQtAf2Dg7vY1nvhWiM?=
 =?us-ascii?Q?0BEcUD6xlhvoB/mEfKssnQ6uABX2Gvn8kSTpAVwOe1q4SG6C0Rf6BQ3Z3V6O?=
 =?us-ascii?Q?4zSD2LKzloqf3Bu/PTA4sAo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd34f42-c5d1-4230-c715-08da920151c1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 01:19:19.1404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqegLXawhXqduITEMcq/WAQmNmHIN0sNPgZS5YZ5OcB9wc6Bk4Zc4SQj4nyseJDiyEkjRRs0MYgRXCWyMMctFhiF8+iWZ/rRuf+ykXNH3NeZRNjb0/8agGvR+5k/xD22
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Almost all default rtd->xxx are setup at soc_new_pcm_runtime()
which is sub-function of snd_soc_add_pcm_runtime() (A).
But "rtd->pmdown_time" is setup at soc_init_pcm_runtime() (B).
It is very random timing setup. This patch setup it at (A),
same as other rtd->xxx.

	static int snd_soc_bind_card(...)
	{
		...
		for_each_card_prelinks(...) {
(A)			ret = snd_soc_add_pcm_runtime(...);
			...
		}
		...
		for_each_card_rtds(...) {
(B)			ret = soc_init_pcm_runtime(...);
			...
		}
		...
	}

One note is that current topology/intel are directly calling
snd_soc_add_pcm_runtime() (A) without calling soc_init_pcm_runtime() (B).
This means, its "rtd->pmdown_time settings" was 0, but will have default
value by this patch.

"rtd->pmdown_time settings" will be used at
snd_soc_runtime_ignore_pmdown_time(). This patch adds
"ignore_pmdown_time" to these driver to keep compatibility.

	bool snd_soc_runtime_ignore_pmdown_time(...)
	{
		...
=>		if (!rtd->pmdown_time || rtd->dai_link->ignore_pmdown_time)
			return true;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/hdaudio.c | 1 +
 sound/soc/soc-core.c                 | 4 +---
 sound/soc/soc-topology.c             | 1 +
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index d2fc41d39448..073663ba140d 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -42,6 +42,7 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
+		dl[i].ignore_pmdown_time = 1;
 
 		dl[i].codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
 		dl[i].cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e020ab49cfb1..df2bd8098c63 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -487,6 +487,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	rtd->card	= card;
 	rtd->dai_link	= dai_link;
 	rtd->num	= card->num_rtd++;
+	rtd->pmdown_time = pmdown_time;			/* default power off timeout */
 
 	/* see for_each_card_rtds */
 	list_add_tail(&rtd->list, &card->rtd_list);
@@ -1247,9 +1248,6 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	struct snd_soc_component *component;
 	int ret, num, i;
 
-	/* set default power off timeout */
-	rtd->pmdown_time = pmdown_time;
-
 	/* do machine specific initialization */
 	ret = snd_soc_link_init(rtd);
 	if (ret < 0)
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b101db85446f..c3be24b2fac5 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1755,6 +1755,7 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 
 	/* enable DPCM */
 	link->dynamic = 1;
+	link->ignore_pmdown_time = 1;
 	link->dpcm_playback = le32_to_cpu(pcm->playback);
 	link->dpcm_capture = le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
-- 
2.25.1

