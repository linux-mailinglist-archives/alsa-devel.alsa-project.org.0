Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960E7AE5F2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E28EC6;
	Tue, 26 Sep 2023 08:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E28EC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709899;
	bh=K6HBUeBcLvNsm+I/cbzz0r0T5DJ4nypLGC7e6Pc69YQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T+3nvJu+6eryOd8F49gV26i2o2kIV7MRYYbOJFMy/BQiQLKpYMAIz9U4xynhrKO1D
	 BmTB3uhFNSqFEt4Bu1nPq6JdPVSYE2gFn/RNFJYKKSvbbBJN/GebwCnfOwbT0qEGX4
	 vkQ/R/shRIYCgoiI397vygxmHvhsjRhfbS8gZtGo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 127ABF806C7; Tue, 26 Sep 2023 08:24:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD1ACF805FE;
	Tue, 26 Sep 2023 08:24:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21B07F805E0; Tue, 26 Sep 2023 08:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DAB6F8057B
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DAB6F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V32F8DWB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2WMoRnwhLwkmFE2Q1fdftxzk/YAaVq5kQfCZuMzLx5ZOEcXCoxQoQhuS9fStMg8U3uV/lXyzSMezXws5SAytXV1yG4flNxg0L8s+VEGDjrLi1mahKgEGv6KD0L1EQyxBlhl/nnxmu/a1I+EIteIwrR70ryx/iqQVUAV2vI9PX1mEUCBGWQEk8+sug2SbUTK0IKigKXmFpEW0VjGh5cu3URhkEz9t1ILRzOUlTsP7DWccOTxnw7DPF4L5pGDryXsp78jsIi9s+Lg8NHTMd5KbsnwCdmD/8QtkJi3BJT2T4ugBlbS63HqjH1GzIM5QzELcQZvIX7Hoapo+UxiPpPN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBclb4YIjLp49HxwF2L40TOVUX77D9fAmGpM3iFl4vg=;
 b=OwdvWmBkooR1CaI5O/PBFmvGqjy55OG0g/yw/17dDek0GYXItk8LOzAfS/+RKfL0XgbsqBbC6bpNMhCkAbcH9kMPrN0r/4L0OUlkhuRQybTD/jrKu3z3omC7Mamizzun/amRTCuursH+d9FXtDdvMm2o4hs1cmYLb/VDMnNBeE3/IlLT1mRqwaASY09bYRquPrworYta6eVQLU8DuPnU6M6RocWfifsslIsc4E+uGEp8Vjcnn8vKoaTszA5heTN22LEdgMrKG1rU7AXfWrSISEFvrREKYsW46jbESm/LGuFfqPfYSMKpHFFfUu5uRBh6hwjrnReAcj4V+dBkFXQF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBclb4YIjLp49HxwF2L40TOVUX77D9fAmGpM3iFl4vg=;
 b=V32F8DWB0eukUHwh7b9S2L3iqhgWdm20tzdaCNfy11Gtt6t3CbGpcv82pg94W1UhUaT0Q6hkT+4JuzfwYARV34cjNLpaFNreenJnRuhRo7Dc+bNCvGv3y9Ztyv2KIIeJuKSfih/i9HZaeadvyYARUoUTxOaITwqNB+fisaHz65I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6175.jpnprd01.prod.outlook.com (2603:1096:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:24:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:24:46 +0000
Message-ID: <87wmwdfo43.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 37/54] ASoC: codec: wm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:24:45 +0000
X-ClientProxiedBy: TYCP286CA0168.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: 49fef479-54c9-4f49-4627-08dbbe594737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oH+I4b3eKI191juyMVKU7lalo0Hj5lpvxYrfjy98+GjM1v5gqxThRZE7oQ4P0HGH/QFkkctEaaoL10vmjVuY/iwi6Fv/0I9ivtk+NActK2pNQRlTkpECRAJUYDW9WAoNQ9grMXccqaMly7oidi1YHeOMC7sR+h7ZNhk0wPPRU2QsTvs/GvJ/m8LPi6uh1xPJCq+871QUTbs7KFnRLbV7sKPD1O/PygGMR2b3eoFuxAGps3iC6RP4m7wXkbdCiCS3ZFTQBdeFwP8USQ/l/fxARruZBLy0vTZjsLRnrP0DfNPq0r6cnrMQ15Uhe8nneqqDcLGNiiDfEQl/wW3meEXdhD9hGzZjIxuGiUrMWZjdBEaM0nrtV0J3FPkvAPQm7KLyyRZ5Q3O6U9qpAOxiZ/I5j0+dvkLjMCMNJ0XvJEG97LUlFOoF2FTrbT+vgb0EpgmnSgYeu6IQSyDLws8bS5bGZs8IR9OVbEDMMZpK9Ut6yN3gB+9zwmaYsQ4c9bnlq9eLaeTgujJaDPlg8CFRMHUOsN08KhnDujoYPpO55Yds5cwL7YIX2ZMNgd94pZC7FJwHUk+gLATAFaQy/CN7ddhJGwpRMf9r7/Yf4BPAP74gUnO0qXxnME2N3We6I+sDpFQ5KzvLQH4LXcpgxDGNg5mxhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZY2WSgE3ZKcugOk0jUjtczNtuBvi2G0uGx1oNtxHkkfnLyqUDzQRTAF/plaD?=
 =?us-ascii?Q?ED4+eu3fbg9CzvJsfoU8cN5OOyklLVpswBYj5gx1xm/xCeKOyT24MeRgFlr8?=
 =?us-ascii?Q?7r80oMthwtqdqA+yQB825DTGvPPlno6f0XA0ux4LC8b7aVZJmsle2gt6RF3h?=
 =?us-ascii?Q?b5WXR7owcYqj7Konyt8L68jpGOqNTCrxW2MFmGi207DA+VN3VPRmMzkpZWi0?=
 =?us-ascii?Q?SR78Lk6yJtrOiX3YKevZO5fWq6YpI7PBwfhZGnFRR2biv2CDfbFvvoxv2ogS?=
 =?us-ascii?Q?/XXwCvyY9dVbjtuQjZikFmTqVWuukVrTt5ggVAwFGiAuBSuDFG2eeC2zF1/C?=
 =?us-ascii?Q?4/B0OC2+r/LYI47orS3WiFWa04vtLk8vEjc+tiH7n9TwJ/o3L9noRVaFtS8/?=
 =?us-ascii?Q?ubWWIuO2ULYSW6Zcu0eI5I4lNBk69dVSb9NSN3BXgoECDiE51b+747/6g9fR?=
 =?us-ascii?Q?CEv4vzlg2D5JiyM2reg9ElB7OxHLoPwb1o89IhZuAr3z8BnBgmT4QpbI3iyg?=
 =?us-ascii?Q?tJTD0o5p0NhB2ZvUa+2SE8s6B0x925oSTwZZAUUNq6a/jhM7/oOoIlTUj2dE?=
 =?us-ascii?Q?N8XUSDaXDHNwHo+4kNC60JGiRoMmsONyUWNuXhCPBXxMngGmUc+7XbC0o9Lm?=
 =?us-ascii?Q?fpPA7q/7VIDbSNx0V1uUdxM3DTBel+prYT7FAF3DbhtZFuvCjnffa/1XvNji?=
 =?us-ascii?Q?fG+wf3engZySLE9TJ8yWPVNQHvDPKSmi1fy23I+lUYo+ES0q7gTbvy3LgzG1?=
 =?us-ascii?Q?ugO31HSfVymYvUfRBiUx7aZS4u95B/BcLyzECvd5DNclZ3VCQl1YCOvliOy/?=
 =?us-ascii?Q?oFDRZgHTcyoVJx1qhkCsAc1r+aPHRXQGoDqg3V2f4sEaZJM6WxeqrDQ4e+zC?=
 =?us-ascii?Q?gX2AY38StBlfLA18GteRqqDgnzCc1MPzzHicbwc3y/v1CYncKi+0pYGaFUet?=
 =?us-ascii?Q?8PwBxKWLBYCPNWSyOkjksNYVqtINqCq+tV8oREdy9YXDbrnM/riCrVZZn0bg?=
 =?us-ascii?Q?ZFlpaGsMuCXCZB1GdkEqe160MPtELi4QJikeiYNEJDDH8cA9cD6LfQDtdlRu?=
 =?us-ascii?Q?hzvMC4Bhe0Our9rLlOrfDhsTZZvdhZuXdGS//AITUN7miyoewKk9TO+Hcz4b?=
 =?us-ascii?Q?BqILI9npkl4I2tkdikNL1g9AqLupp+guQOvaNtF1LWBb2szsiPgxi2c9ULbB?=
 =?us-ascii?Q?NBKElAw38OGSo7J8pJwQWe8PW/6vR8vgiPgcP7Bz80Kb/PZ7Po+SfBY4Ni5e?=
 =?us-ascii?Q?2uVxam/10n1DDXmE4arYkGOhnpy5iRF+kHGAktKIhnD9xByvw+/86IS1hnca?=
 =?us-ascii?Q?c4SnJchZPv7j7x1hhV71BzlcXVOF7R3oJPlHuZPh/zPNeS2y47o3BqVEnLpV?=
 =?us-ascii?Q?C3A2hJzbcB9CfCxN9UiD1JC6XVlSIokGs1hxc5CeD9Q5IIDEUOVb1H5rh3cF?=
 =?us-ascii?Q?l29MBM6n0BF+pmf5p9OdrCwO+obNMYUUweAURYqzuU2xwxswltxXC+NNVJHQ?=
 =?us-ascii?Q?M96J9OUY6ffLaaC548qp5swdiCOFjXhX5c+NvDJONHWpy0GQ5b5KaCvVQcw+?=
 =?us-ascii?Q?zoqHXqHdDau9BQfCsoH/RaOkSuoZO9CRHP3fhaasM1An8HMGLvVrwTJcGzO2?=
 =?us-ascii?Q?bW60uxscMQ+ETuXXHYpTm2g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 49fef479-54c9-4f49-4627-08dbbe594737
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:24:46.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WMw0y31E0ZAGf4DVrVeVzKjKoY1rIK7i8gHJa1HBspN4Jnag2YBayQTwQw7U8Crqarv19ElPOajmQ9MiX4ZiL1azIJxZrmpfBTfi4o5CM/pXRuXKpjSr4iKxEvE+9rMT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6175
Message-ID-Hash: QUZFIN7LQCK7NJZXMV6Z7DUDLXINYQXJ
X-Message-ID-Hash: QUZFIN7LQCK7NJZXMV6Z7DUDLXINYQXJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUZFIN7LQCK7NJZXMV6Z7DUDLXINYQXJ/>
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
 sound/soc/codecs/wm5110.c  |  6 +++---
 sound/soc/codecs/wm_adsp.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index ac1f2c850346..0f299cd07b2e 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2253,14 +2253,14 @@ static int wm5110_open(struct snd_soc_component *component,
 	struct arizona *arizona = priv->core.arizona;
 	int n_adsp;
 
-	if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-voicectrl") == 0) {
+	if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-voicectrl") == 0) {
 		n_adsp = 2;
-	} else if (strcmp(asoc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-trace") == 0) {
+	} else if (strcmp(snd_soc_rtd_to_codec(rtd, 0)->name, "wm5110-dsp-trace") == 0) {
 		n_adsp = 0;
 	} else {
 		dev_err(arizona->dev,
 			"No suitable compressed stream for DAI '%s'\n",
-			asoc_rtd_to_codec(rtd, 0)->name);
+			snd_soc_rtd_to_codec(rtd, 0)->name);
 		return -EINVAL;
 	}
 
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 6fc34f41b175..db847e80a9c6 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -1236,22 +1236,22 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	if (wm_adsp_fw[dsp->fw].num_caps == 0) {
 		adsp_err(dsp, "%s: Firmware does not support compressed API\n",
-			 asoc_rtd_to_codec(rtd, 0)->name);
+			 snd_soc_rtd_to_codec(rtd, 0)->name);
 		ret = -ENXIO;
 		goto out;
 	}
 
 	if (wm_adsp_fw[dsp->fw].compr_direction != stream->direction) {
 		adsp_err(dsp, "%s: Firmware does not support stream direction\n",
-			 asoc_rtd_to_codec(rtd, 0)->name);
+			 snd_soc_rtd_to_codec(rtd, 0)->name);
 		ret = -EINVAL;
 		goto out;
 	}
 
 	list_for_each_entry(tmp, &dsp->compr_list, list) {
-		if (!strcmp(tmp->name, asoc_rtd_to_codec(rtd, 0)->name)) {
+		if (!strcmp(tmp->name, snd_soc_rtd_to_codec(rtd, 0)->name)) {
 			adsp_err(dsp, "%s: Only a single stream supported per dai\n",
-				 asoc_rtd_to_codec(rtd, 0)->name);
+				 snd_soc_rtd_to_codec(rtd, 0)->name);
 			ret = -EBUSY;
 			goto out;
 		}
@@ -1265,7 +1265,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	compr->dsp = dsp;
 	compr->stream = stream;
-	compr->name = asoc_rtd_to_codec(rtd, 0)->name;
+	compr->name = snd_soc_rtd_to_codec(rtd, 0)->name;
 
 	list_add_tail(&compr->list, &dsp->compr_list);
 
-- 
2.25.1

