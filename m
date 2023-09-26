Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6357AE5FF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5634EA0;
	Tue, 26 Sep 2023 08:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5634EA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710055;
	bh=tvQeaGu+5DFg33G+CzfWiw2mCu7A6p0DH9cgubL9sYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YPz/P+HQYN56G2RG2zIGC7azENLgI3BM633xPfNEkpbN5R5W22IA3SuYWq1yg8a4Z
	 VWfvCzK3K4YTem5GnL0Rj+3Va9j2JIRHohyge3gxmiBdpqPWVs+lzoybdC27O5QKB8
	 2dy7pl89W3Wmz6aEw5otVXMJ0jkvUK2KiSB+6drE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4ECFF80612; Tue, 26 Sep 2023 08:26:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E05BF8070D;
	Tue, 26 Sep 2023 08:26:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F38CF80713; Tue, 26 Sep 2023 08:26:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D28EFF80710
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D28EFF80710
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mqy1byud
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eif6kpp+pymxrt1JnQZnpJLp0IAyE7jhqeaTSGlWdqHDdrMzIYmPyz3sWscEUy1W7xI3nbxv9sleBsNr4DIHvJIDTa4b1fBvRoRae6T5D2mQLUSD9YnK0HVVrab2bNMW0g1Laxm4BQE28pFcAVO/uE+aXUsZpy8ghVXDDnyWaohr8x0b3oMWeGYTrBZtg0cIZekEKlruF9FevHv0hdxecGHfvU8ls18clGE1ES6fFx1kv7MrMrzzVMqpN8U1XPuz39l+OKC2zzuSNtBxRjCiJEjhgbpdhsAGxttjDyTmAkz+lNgG9DQIdyq4Zt9bSvawbfZcLaGONNy+/puCsXrZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dxNSjESGgbi05VT09QsthYYyJ7a2PHkAq586MfwhSA=;
 b=eaj6J/qKbrkVLZGiGGxfaWKyI/BHN3SAci3c4AsTG53Umqk1Wj8e/WXnle47zk8T5+4NLbUN69G5NTnLwHswCi6EE4n0etRnjs+NkSbUQjCKWt2gSd5nOVxf2BHk+zcZmHhGckwrWyiWJg+nT9Y9yqSzaF4755Wa+ic7M/4hhBzdQ8PMJFbKnNzbPr6DqPrpbiFTAbktvUdMMnRehJ/xebgvNiaQLDKisikir7gTGKab6RaBvOXqKtGuALudpzusHqyqsJCW/VtS+kygNyB+FjQU81f1kkRq7aOKDkKKnnar1mB+Gx7xm+dABPbv+AuuhnpSI4DjsNux+bUl0rV8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dxNSjESGgbi05VT09QsthYYyJ7a2PHkAq586MfwhSA=;
 b=mqy1byud43eJTPEqAD8GpgCdfO4ipYb1QQm8uvcmwWBegq3ovHMbV6buX5jBy5ivmxO2B3XIAN6BmN8p/HyZByqjuO/YumX0twnZ4sIEV/jrUHdgs4hV0hciduvHpwe6p8lQiT9lTV1a/BiPcgGUetxvKVeB/Y6o592QF9y5vmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB8000.jpnprd01.prod.outlook.com (2603:1096:400:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:15 +0000
Message-ID: <87jzsdfo1l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 46/54] ASoC: soc-core: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:15 +0000
X-ClientProxiedBy: TYCPR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:4::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 914198d0-24e7-49a9-9f2e-08dbbe597c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y678YsMr1mDY8VGX+ZxNcceLCkAluMj2OC/ZR9Tl+psAdAzGOZ41TUAQdv2/Adk64Pg/U2UV8TBbsR9BVTJr1RsVeyv5C2P5Ys5VMKXgREjn6nBQeiOEcBqJmQn6Mq/thDs5Rh6vpWpdONC//e4fPBwgOAygfG+Qlyc4/da1ALy/kdlt0ZdZzEYkok4DEbJ1Q9Pb/vF1HReQvwv4AjqweLtcUrmKGhTUbFSnkmC6H1RSVosYJjztn3sBqPPlEdIC/Zn+LfkZckPTVK1bif2waoZ64sHS18i+Fih+DpDlC0u4Ck7EIo2hvQPMU1gcpNI6jEmxelHtBLWhABD7RhGGALE198n9qJKIpb3fJEp7rIYtQCJCkfpP3DyPbBx3qZpA29UE2LFKE9jShj9Gqf6G6nCK2M0IOlU35eK+ZKbVNY6wxqiFmSHWTw1TjL6wvdc4elulVnogQyiUm14FvrziZHF/OdphKdlmG0iEV0E7uowOLRM2Qyy783S8NIS9jdTJP7+QND4+49+6FjfFSCWGEUBlIhkjxdCWiZyfWH4BSYw0KRr+liEkQ1qx0MPEaKnrQk48v9ksVjUPr/C7DIHrOfuUkJL0l7GiSjkRSqFdlUY2KZjbKMHUOxyWgua7xwxw0hQiEtar9osHpOJPcCktRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(230922051799003)(451199024)(1800799009)(186009)(5660300002)(83380400001)(2906002)(316002)(41300700001)(8936002)(8676002)(36756003)(4326008)(2616005)(66476007)(66556008)(66946007)(6486002)(110136005)(52116002)(6512007)(6506007)(86362001)(26005)(38100700002)(38350700002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6ZX/cFcGeyRm9DHR/r78SQaQegacm6rzDsyTDj72e/qAO3cUH2PtP64owDku?=
 =?us-ascii?Q?j0ISdttmury1FMzii0VsA0BPDx08Tt2v0UGI/YdQw0Gcx5OPUijeKl3CNaql?=
 =?us-ascii?Q?QPezc4CtTgNTcF1DArsM0W4MIqvyr4XoiD2q1kml72GVql59oEG0OvMcDsIH?=
 =?us-ascii?Q?tEPny0xXumTmgzkXXezRktmEWV6yPvqLXyb4l09FQTjKjAKpKOITiari5jnZ?=
 =?us-ascii?Q?ig2TKIWGyOMymoWrlBgTCTal91USz5H0dsRPtg/rPVlBrPiVJnyQsow7DswZ?=
 =?us-ascii?Q?1FTh8NQjhd1HzH4/+UdNMAzsU9YzLow5wFy3WeIBZK4icAE2+APrIye5Wqk+?=
 =?us-ascii?Q?ebocXokA7jf9fOJKAcOWX2qvgpZQz8QH+7tS9E8CfCrfuXRFj3odoVxnCwzr?=
 =?us-ascii?Q?GREeGjnL8L+6Zpd9stzIWPaJnNiBdD2TcvT+oke7LerRgCe/rOo2z6BLEXpG?=
 =?us-ascii?Q?WdkWdA230WvnC3qCKMrIVaAb/Onl+o3xg20oFTlBrfgED22sy1pb5pm+Lmzd?=
 =?us-ascii?Q?MuoonY9z9HnQB5uyJdosLRhbYUhNDk5IragivmAvRD5jLvHascf8V/evlL+m?=
 =?us-ascii?Q?lgayE+hfPE0+Hk+E+20q0RZ+0TbEEzcp1bQk+i/qBgogLwpkJ/uBj0X3VfIV?=
 =?us-ascii?Q?BM1tV6P3vZkZM9N/sS6WKRGGi5snmbHb9KJpoFxDdVT2DnSzPDE9BBXjbbNf?=
 =?us-ascii?Q?6p2FO3f70wdZ0nsp7fjfa3jpVdMsdNr2PScVWkLtnxf9CmTP3SKSRY8Xt0iB?=
 =?us-ascii?Q?0ExA4Eku0A598Yxu8Ro1hR31yn3hrN0VQZhrwZ7D/uIry9ahtD+KAxK5tf3h?=
 =?us-ascii?Q?L7CBqBSMB+MP+cQj8IvP+0IAWU9IuLAGunjo4tSyPQhjHkkK0vaXgU0yWT9C?=
 =?us-ascii?Q?YzuheOCjQSdXAwxpTLxd4FQs6yd1ptFqAheJEPHnfmInzYgFz9D5z9ptZMwU?=
 =?us-ascii?Q?+x1Bu/wbkgWiusOROAG4BpjawUeybtdzCXL45WhdQ7/3NG+YeIk+FHsKxkCC?=
 =?us-ascii?Q?OGjAmur4MHkn0rOYoR+W/iUux7jkinsZKcWjbkonu5kBozxI6tGZ2H23InTs?=
 =?us-ascii?Q?H9szoJdyHGBALfTQXin5eQwrOKQNqzsiclZgpP1K3AOMT1CjwOdnYbP+OmIS?=
 =?us-ascii?Q?Pm4BOQHBmpuxIlCafpNxDlLpZpNHa0DHZGNLd3hfA363so6jon9RnJBFeKlq?=
 =?us-ascii?Q?Kx+0OZrDzGaMgBV00QMIe7H2KIGoN2VamRy4uZIqTPe575KPWTuqYv2LihGF?=
 =?us-ascii?Q?tuFxolXm18O9e35HORjzjNiifba5kg5xg60s1fwPlXq4XMjHrZKafjCMFY+r?=
 =?us-ascii?Q?z1ZNS6fAxfNKDTTGNDgYLuthjptvdjYYUBmBWZ8qmB7oROxwIowZiwVaV3xh?=
 =?us-ascii?Q?HvvzuIRKZ2vjs3asIyWv/xykaPrL0TeCvNYX6+uzzl2ARdLPpkOnlTMV+6Pj?=
 =?us-ascii?Q?R5ITkCVQXn1BGDcH4uOi6kngjE1qv+4DcCMC9glCWimybcM67xhiewQnrrOT?=
 =?us-ascii?Q?Xu5va/CXmvbAHAzzROfnro8POWtolhE27c2+a5/7edl5YdxyH5fALzbCNM8i?=
 =?us-ascii?Q?jBvDEwTpA8qNUB8Lq/0P9p1qqrE6h2higpmrsYvoeRo7H7c62KN6hp2J+E36?=
 =?us-ascii?Q?MeahFD61TDD4jyQVKKI+eDk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 914198d0-24e7-49a9-9f2e-08dbbe597c75
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:15.3443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m3hNJ/b2x/LOWHc82gguT9XCZUgI8rrZgikq339a5g2czJ1UXrGIT0dSwIS8Qz+dfZqg5umhCG+6G1kwGRD1LzvBVau2J9nHklg47e1eTQrGKgpNdenFQAr1c462Ujwd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8000
Message-ID-Hash: 2IQNUC2QVDEDX5T5QM7KSKRZH4WLYDPE
X-Message-ID-Hash: 2IQNUC2QVDEDX5T5QM7KSKRZH4WLYDPE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IQNUC2QVDEDX5T5QM7KSKRZH4WLYDPE/>
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
 sound/soc/soc-core.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cc442c52cdea..c305e94762c3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -420,7 +420,7 @@ EXPORT_SYMBOL_GPL(snd_soc_get_pcm_runtime);
  */
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int playback = SNDRV_PCM_STREAM_PLAYBACK;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -554,8 +554,8 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 *	  ^cpu_dais         ^codec_dais
 	 *	  |--- num_cpus ---|--- num_codecs --|
 	 * see
-	 *	asoc_rtd_to_cpu()
-	 *	asoc_rtd_to_codec()
+	 *	snd_soc_rtd_to_cpu()
+	 *	snd_soc_rtd_to_codec()
 	 */
 	rtd->card	= card;
 	rtd->dai_link	= dai_link;
@@ -1078,25 +1078,25 @@ static int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 		return -ENOMEM;
 
 	for_each_link_cpus(dai_link, i, cpu) {
-		asoc_rtd_to_cpu(rtd, i) = snd_soc_find_dai(cpu);
-		if (!asoc_rtd_to_cpu(rtd, i)) {
+		snd_soc_rtd_to_cpu(rtd, i) = snd_soc_find_dai(cpu);
+		if (!snd_soc_rtd_to_cpu(rtd, i)) {
 			dev_info(card->dev, "ASoC: CPU DAI %s not registered\n",
 				 cpu->dai_name);
 			goto _err_defer;
 		}
-		snd_soc_rtd_add_component(rtd, asoc_rtd_to_cpu(rtd, i)->component);
+		snd_soc_rtd_add_component(rtd, snd_soc_rtd_to_cpu(rtd, i)->component);
 	}
 
 	/* Find CODEC from registered CODECs */
 	for_each_link_codecs(dai_link, i, codec) {
-		asoc_rtd_to_codec(rtd, i) = snd_soc_find_dai(codec);
-		if (!asoc_rtd_to_codec(rtd, i)) {
+		snd_soc_rtd_to_codec(rtd, i) = snd_soc_find_dai(codec);
+		if (!snd_soc_rtd_to_codec(rtd, i)) {
 			dev_info(card->dev, "ASoC: CODEC DAI %s not registered\n",
 				 codec->dai_name);
 			goto _err_defer;
 		}
 
-		snd_soc_rtd_add_component(rtd, asoc_rtd_to_codec(rtd, i)->component);
+		snd_soc_rtd_add_component(rtd, snd_soc_rtd_to_codec(rtd, i)->component);
 	}
 
 	/* Find PLATFORM from registered PLATFORMs */
@@ -1335,7 +1335,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 				struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_component *component;
 	int ret, num, i;
 
-- 
2.25.1

