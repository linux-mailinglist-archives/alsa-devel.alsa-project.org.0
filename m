Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C879B41B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:01:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D019ECA;
	Tue, 12 Sep 2023 02:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D019ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476878;
	bh=lWJfJLtWGsIQ5NCkzOTwKPQl6C63o14BmkiwbQEqjX4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cddSI2SrLolC/RmxYWxGdZ+510crjzuarrHaEpRkYkqKoOYS5MSGZk1cQBE97pNyw
	 z5FMR8oP4XpKhJzFnnPyp1cLHhu3gV/zXBSgpgum5ifiygUJjwuGvgAG+fIWHDwLea
	 A3cg2ZRdJXV6jswNEYY5QI9w8YT7XAgNA43SG04M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3F2CF805C5; Tue, 12 Sep 2023 01:53:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B49DF805D6;
	Tue, 12 Sep 2023 01:53:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DA5CF805D6; Tue, 12 Sep 2023 01:53:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC90BF8060F
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC90BF8060F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ERRqz4/4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JolkPbhAAmIrc40xmw7pDfva6jy1xWwtavFruAPcGxo6LJ6jBljlgRBNxd9GBEOY3Gm7pgCFEAV4aXuTRhmEn81ktQFfmBYeuGtWVeWHUmkjs5wsjUGQWMB/Jj/jDrox/bZvBBjKZ5sTALuV2RZ5P7R1HMQCRdd+hIkfncs+T4SSHWgmzOna1UBt0HNU/J/pB6XQ0cx8IbleCO0K0vB1vrTI2gzWZr6RjUfjGYyOBnkbYunygypWK+P/xWBxgE8DgdtcZhNX1pHc7DbsyvvN03U2Z42svGkUaBgd2RweSEI09lyCECk/aZMPsrjQPjCcqV9ZmVYefdsRS5H5h/fnZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ri5GN47Qqa4vjhkrIwdvVKc/U3UOkUu5/InypeiIG7Q=;
 b=H7i7tujMjg1EuxN+NvBC9MDDbnHSQFLXhm848Z4y1HBSd7Wmcuo5YcuSKTJaSEEjyRYvpHv1UdCjybaYrv8HAhJU2cM1rFG9LB1Y/XiFifaBOi6m2FlICP46B977YtdTHPhLIifGmyQm/PNlnnc4TVYJv9e4s62PIsfsdmxOH2rtXueBeoEZ9JkvCFwvZnJvIyBz0SFEHv+bsfLB/oaezu5rCad/8LhHz2stK8IYgZOOs3faihwANDwS2A1oCPB8cwBXCRt6gwBEQ1kUZmrhq3h1HrEq2/mzJOyE1cDPeRKA0/waD9WBwZUMD1bP4PPHvnyKje4XlcwTZKgjgAlcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ri5GN47Qqa4vjhkrIwdvVKc/U3UOkUu5/InypeiIG7Q=;
 b=ERRqz4/4FPZjELAZjJKWTa2QErCunGwEmCgogabUXm8uCWiDAtl3DtuJLb/s4c9GGO+ILIzwp3M0pNZUL+15vJMKG0vSQvestJClyQ5QAtMs1tBiRWcbTaeCXjXhuuDsmweRlRXJPK85MGaxFrblNXq6xBaXc55S+NiWsEsRqVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:47 +0000
Message-ID: <87msxsp8tp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 46/54] ASoC: soc-core: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:46 +0000
X-ClientProxiedBy: TYCP286CA0194.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cd6cdc-2a70-4a8b-e5ca-08dbb3220f5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sP+sm3tFO2QGqzZzuKpscxaeysezvqSM15rM9milSgsBYsYGyMZwIGz38Xh/yKzUaQ7sdoFqViz/FnVtGprfRqXWZrLKUOxws0XMK4dJ9Bve8any25AJpOsx9WtMAI5E+mkBsg9c5S9yJh5a3jQvxWcPw5gWy+z1y9UvOw8Qb7SJbTBvLTlyKwwO4ZdFYNYE7TtFIgXUECeJ5iwguzntFbIz7Az/Ud2o5yxAYh36CF8LmoPMNmOzWuH40mlLRr7evj1qO0RPrcgvv5dw410s9647JSMqPubSTZHYO2NvSf3KJrzZhJciWVQN1HIXndPXhZaFnwPO6Oa3/JGsmMFMhxzwKPhkwXddnAoIQKg4lbWIP3+XuCbii+G0Drr9si6ceOFg9I2SJTC1QEj54BHCBPaKwjsE0iO6s9GxYN9Jw3lMY2y35dkwco4l0yEjYBzI4vSnGS+CRe/DrUphnzxE1hOXpYsXP0ZXBBKdtLpXj1Fl5rPOtT4R+TMoye8F7hXGHgyVhPmUyVeP0a6Nvdr+SZUX6pvWKlmyEalCbuaog630MG3OdrLGp/eRBdht/HOo93+3TwSzA4zmEYI0JZWezcHd+mMsqhhZfbf5pw4XlhqKVm22ABei7bMCEt76aueQZ+OFDUaVjeJLVAcPYPoqCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IphVw5CWBW91hzEPQrTCEDvHzzor6Qb0TuJE3ZzHAcUUl5uOc2AlosLxabZo?=
 =?us-ascii?Q?3DWmYEWE8PilZyvU7NvMrJrESGZEinmF4tLnb99vD6BSv+rXTp7pdlVg0Eqd?=
 =?us-ascii?Q?5Hh4Kjur+PyBvvYs0mj47Q2OE7fRXXP8sEdV34f3uNCJUq4ZkBwvng85G1Gi?=
 =?us-ascii?Q?LHwhYHvgZ3l6OYn4+ajg4IKZtZGMvQF70kctGD+kGrXd9vGNybVLTuuET/w+?=
 =?us-ascii?Q?JklnDf9jBZ9uOsTIH1OpwuzYf5vDn+HAayqRq94S35lWyVT4YeSlmCkn4KNP?=
 =?us-ascii?Q?TOwy5GZJIO0OJ7xUxZ4DmoFziVd3gK7yyf7F/53asJv3brL+I9VG6VjmZ8Kg?=
 =?us-ascii?Q?OegjOlmIeiy93var6pj5a105RIDUKv6ikfDUWwhz0BtqCNDhU1cI/Db/Stfq?=
 =?us-ascii?Q?sbDetBvvUk25nXhy53FoithTBYxshVtfjMh8MWxJMQd0tAjzpa983Pi6y+t2?=
 =?us-ascii?Q?+lvNlAzhqBpzIPFkVycv6duOeBK92/J4IIKduKulro0MJHmRYQE96Uv4EOd7?=
 =?us-ascii?Q?TYlbBVGIHIsnvCoaNBlNUCdMRifCrdgaoI+8gijAyOjcYYpbjT208Qt9LCXn?=
 =?us-ascii?Q?Opd/8UpMyJX+cyiq5+GnGZk4Ub9KevRKY37JcLYTjg6NmYUKrc/nkhG8ZZte?=
 =?us-ascii?Q?m51SI1tFvcpmE8imm5E2EeZ54vU+wo3m5w2wKE4IchjT2qeTQl6w0AF/1HEt?=
 =?us-ascii?Q?W2zophIRNN8Oert5ozdefu12YwBoH2/5ietr5dw1emSpnNN87VDNvWwBqK/4?=
 =?us-ascii?Q?dMZJyjIaNYhEd6PAGg2ILUxKVCJsTbSHtziXsWb5EB8qBUXCId0RKvJiyf2I?=
 =?us-ascii?Q?1TRuwQmJ/iZgaOfDwIOxz5i4H7laOJvdhSm/BQqnjqKO6uoqtBbO+5ZOhh0M?=
 =?us-ascii?Q?qrZQcZ0tXFu+OK1pCtOowPUBIFW503AyIrRaFFvT6aHq4kLrWcS+ibk7jxz4?=
 =?us-ascii?Q?0e7nBGTwq6Edo+ej33/eEx2kf65aTRjIwdz1EtDoM7THPOyQHnbaRIKF4i6P?=
 =?us-ascii?Q?/5GRGertsm4+lV11fGCd0d0d1CB9475HixCq0qADEcszxvgYyr5FKe9DInJW?=
 =?us-ascii?Q?8edM1+LBGZfcUKYR7+77hzi6ELNLrpX6TfuP3ts+s/GnXBub3pu1ww5mtmqD?=
 =?us-ascii?Q?SzaM2d+e7LMeC7Qk1o0KCbp6JbPv0CKKcIpne10o38bbKHokDxcelr/gPC29?=
 =?us-ascii?Q?OiNOWUDKgm46wihqOQ6RJpTTxh7VuvjhpEANkw9xHYnQRpf7OOpuc/oMcSiu?=
 =?us-ascii?Q?C1F410YTjv3gccDkOVS05We0mPjAlBIgSNIzBgwoyFqnGLBWnp8NcVFcX74U?=
 =?us-ascii?Q?r3242xJStsmHXGMD2GE0kQuGFAVsXkkl1IBTgDv1gu0kJmhaAgHGrskOlR1F?=
 =?us-ascii?Q?QAgRGuklZVN3TXDgGzJF204KW88UUozE+uENQnWsL4qjCaayQaatoQp9YAUb?=
 =?us-ascii?Q?jwtsfjoPFmOckNI9OpUa9u9fr8UQYg88zT5+qZvGxRJdzi4VnVZJWZ8kZRrs?=
 =?us-ascii?Q?kw9BHqIyoNNKzLZyKFK/mYpRAGbLGWQvIPnRyACMs02EjzEo9pyGr5+saxXm?=
 =?us-ascii?Q?KkxAju2QnHm/FXd57Bpecg11TI+6sjXoHWN4OY3/Suc4q5W0eazJlZ0U+mgW?=
 =?us-ascii?Q?bESGSqTknh/6ykSU0Kttfuw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 40cd6cdc-2a70-4a8b-e5ca-08dbb3220f5e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:47.2256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PLXzZTDeJHeG5vf3nOdrmekEb7EaFq9GS6v0qMH4hkZLpOVbCRuEpBLsWOa++9P7Gw5KoUoVmKeKiMLGmLfzBO+UHNKfhg2XHjwayR9Oel/FJ6Quzu4ouIfOQ4AlZQPJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: 53WYOAGDCBBV4PLBNQSX443ZFEGZGG3Z
X-Message-ID-Hash: 53WYOAGDCBBV4PLBNQSX443ZFEGZGG3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53WYOAGDCBBV4PLBNQSX443ZFEGZGG3Z/>
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
index cc442c52cdea9..c305e94762c39 100644
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

