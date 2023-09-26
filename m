Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515C7AE5DB
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53EC1EE7;
	Tue, 26 Sep 2023 08:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53EC1EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709681;
	bh=9ZJD7Xw0srOzAW+ZIctLbNc1Gnlt8pRV5yetj3MpNOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k4toZHE9LKK2NFb03OSHfsx0KEPmX0T9gsdmQfTSTEhWVPo6OP+DEj12OCBdnFe18
	 mFRDT2RA7C5O2/CCiPOTHcNZurRkxjV/HoG0z1Srlma4afd6AzXT67F1QBAz7CCZQs
	 CIruF19EMby8mBexMZHHXGDRxlIbKsKgJO9h11wI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DB44F8062F; Tue, 26 Sep 2023 08:23:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B42F805C8;
	Tue, 26 Sep 2023 08:23:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAE31F8060B; Tue, 26 Sep 2023 08:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF3DCF805AE
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF3DCF805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QovLgrQc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7E3i4ie5wAsuhHcEM6kc3DOLjof5u7NdifreSWjIk3VrduyByr5Fv0uNWhRj49UjketQokIzSwdwIXksyAZd/D7iejLSq6wPJBNDjr918d1vrsj9hiZLmMzV1R8ub7Z4qMJ44o8lJdJZntiGQLdvqB7rjZo4rFPbdSagVA3ru7JmNBYT0I3VrnbPFZ4iHqKaQhTNqBhqohXIzew3ghBQsr1n8IHe6riCr0j+8dPlc1V03odp1kgXnUMkZH2mu2fKxLsN3uwXP7hXU1aUE8jZzytBXDkr4/404x3v0TBNlsPcnrHo//WpLzLzhk3pGhPfI8swMlHVtL0hkMO0fiJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TuO6gVMOUM/410LpFX2HqBTW2mI1s1WXHGhBF58NSA=;
 b=RU7TDFl5AQhkarOapwIzGHRfCIwpwJKHAa54jOuPgLgHDURWKtX7nU6MVgXveR48lqfoaalMpnumk1SrCS1nUQuFACCyqroEY/rkFrodBdwEtXJvpyjtN3Jce5pPCGMqtoOiEcBpudNfhx877UKGDYTtobjt3VrANPDXFoq9ENKdCBquTie/5kpnSJxdF5XZ3Yw63eVWkZvrI5U3SFj9Ym5/8kqcHGTOwOD7B0QBlawFA/UmC5wDhScwUGK7mRazPKjTqW1401zYSgz1WSxTSSRol7XoZVn7TK2YGlyd6CQtXdjB/iJwO5XmlD2SvIprZetU1jYpBXBraq+g/gTE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TuO6gVMOUM/410LpFX2HqBTW2mI1s1WXHGhBF58NSA=;
 b=QovLgrQcYIUmaN1JFOZOAq+W1IK5vDLi0GcqZgmpvumuXT1bUIFBkDZWT9XC3UHWwLaU/Kh9sRu4FkFkEFqr+E6FfDQW4J7NJCRoxaUY5R8x9eWwe+0Fx+MQ5hcdQ/yX7ji55jtBxQTdX1F982qTHWlEb3XxknUasy4B84pOXVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:23:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:23:07 +0000
Message-ID: <87cyy5h2r9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Andreas_F=C3=A4rber=22?= <afaerber@suse.de>, Alper
 Nebi Yasak <alpernebiyasak@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Mark Brown <broonie@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 26/54] ASoC: samsung: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:23:06 +0000
X-ClientProxiedBy: TYCP286CA0298.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d777d9-ddb1-4644-bec5-08dbbe590c18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0yqRQ8cW1Ok4Qx42HZGft9vBQrMhBFB41NVo5ezVujucj4LNBP+QyiMFyGDaDp4em5IN3MiAayS9JTdRnJaAcvw6VwVuNeU1F2S1AQi8+2FgX9DqeZJXlW8d9zvhksQgzK+I5MJ8PKnKwZiS3PT9fcgGPfIdvFWBR3Wlwo5VJekURa9pjM8OhSXTencp20lbslJAf/AVDQU4sq3EhrmjDtVDPHfmpF6uMa/udAEd/9XoTiIwZsLAc9vpMLbl0OflNMpvd3yYkB01BBCl2V1/a1ufrAWaXAadx+JKUUwJhxGi2/lTLWu4y3BsX5wHa3KdOMBPpyTEX+K/npi72UN7IzjfqezcaCy9TNEvSWIsb1RsnFEKa09etZxFc2kfdQinNq/d03+FVwn55p+rOzlB+YHCLZl5ZKLcdpQevlgMUWgJlSlXA9vGvtLEDLp6F4lrmbWNRuYUtI2WZjF3RguW9JledXWB+ezHOKt50C/2Qgo6DFzYqS2oWhHpKsg4bvKoGAXc9hInWuWNpQnoewghNX2+sD56Dm52/apsC2QOP0n8whSmJcTJHjORoR8iJs5PW5GFtVnGF0uBVNkZUEgRqm+uoHx0wSqIhKzULtDXaEtV7k4NOoM1QdLXanBgnA25GZuYj2Jq9kS50gcyMwruZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(30864003)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9/kuMuYlyM1WYpZVhk8ZlXx93diRRCphiECZ9REYgXW4cED6UBOu2lE/EJew?=
 =?us-ascii?Q?weDT/UeZAV26XTpEMcAS8V2ae30W8z7hsND6otgvlkrxev/GSsqLbCtlv1AQ?=
 =?us-ascii?Q?PaZbt8k/LwNadrDzdqbhBlmkLHX9MvAmBOhT/ysuEOK93cva1DuO7cpyoUwu?=
 =?us-ascii?Q?yjro7dzzsUsvQCMgRT1IFCVoUEZwTmzmLntER3RgwFLZ914BJ6VHiFEO5duS?=
 =?us-ascii?Q?ygOFmRzfwz3Ed0eCKgjUXkzUH/LhxGI9UR0QbgEI3YKm63hw+1QGmBKo25WZ?=
 =?us-ascii?Q?iJ38QwrKh5DsVqydOMP9lO+jwIS4jYEGVoeBKeby2c5d+7928EAcSeRwE6lb?=
 =?us-ascii?Q?9CsePq8sDJAVICP6KBmDibX2mj8yC+Cc3idRttNVP/s4oElt+5WIMNiRtEM6?=
 =?us-ascii?Q?zWczGxwBF6pNLTz1HTuh0lhCNM/WRaIpCuzS7P/HrMOG3EBSdO0GQXPugVrx?=
 =?us-ascii?Q?Fy7zUqQ1vNRWkVPBXdSvs5ZlWHbxBpJl2vqU2yDUiH33IlpvXNhwVGyjy3XT?=
 =?us-ascii?Q?uXw1Q4QCVgnC9KS3+gWOrRY9UURb99ASEorPMIjcNZtKTpHfFsI6s4AZRVT6?=
 =?us-ascii?Q?sjWJQH1LaTJUdk5IwpAqtxC4fMBturhiSk/7rfbN0HypvUaQKbe2EiYt9prq?=
 =?us-ascii?Q?s5aPf9xZ3JOQf4+RvF2xYCAllkqjiT5ReiQLRWpJNhlWfha3MMZu1RyzadAQ?=
 =?us-ascii?Q?Apq60wg0P7Cv7GpM8WOMnsGgk4Za8o+EPCXj/z8foEE1A61Iy704yhBJAbxW?=
 =?us-ascii?Q?N7J9GblwGFcHHJX10R9/5P46DsFhSHufDskwQsFeWfNAtQkNtY6PO/DGQSt1?=
 =?us-ascii?Q?8uKiXn6wu+ElKIvj6F5QY6ZDzqFLzR3P0qtpIxu39vMIGmBXVghCsX47AaXC?=
 =?us-ascii?Q?12UXvvvBzQF+SGnhQmky+x3hGd7vp8KCD3QKOoOtL4xWhk/gao+Smjy2FGmV?=
 =?us-ascii?Q?TfnQzXAtDvGbi6dlAZ7il0ksXmrRxkpwo94zgnLokh6O8GObnX7PzDSCpi3j?=
 =?us-ascii?Q?Y891cCsmLqBdC5HAqeRS1QSLR/87GMhCscgbfgdWo7E8O4aFlfGcxUWKGSIp?=
 =?us-ascii?Q?BedTBYYBypj4jdCVZNH1ZeuWeOBIaFAyXfv1yOPTkFrymquYiorQ6yVof0Qf?=
 =?us-ascii?Q?jj0VRx4axLIKMmB2hY54koNx3Rtcj1wOjb5sNgHqjXVqxbs3aiOVfJbXK7sK?=
 =?us-ascii?Q?hbKrewF2k6EX94R90BgAF9UDndfNWdFpjb5mFBmSLmeBfWSAM/KGpzGukFhr?=
 =?us-ascii?Q?uB/k17KnNAOpvK0Eby9PX4iS0o2715HjI9FKxOZy/WJ2Y4NAA0UhizlXrqz/?=
 =?us-ascii?Q?PA76x2YhCYLUoxhNzyVhVTHlGQ9xkgF1kKtaFk8dZgapQfNXyIz1WVmYUQuG?=
 =?us-ascii?Q?eZdbNujnocV8g4lpLNWTK2Aad1CKLU7a7QIne/5jIylehPVoQ97dCyTvSUvK?=
 =?us-ascii?Q?61WKNmF2zbEFc7hzKhinXS10dKzFDNTDohXkXq1vJrm6em/jcJv7+iJW7FQQ?=
 =?us-ascii?Q?MHrHlgMQTx8FbbI4FzC9m+m4uQ54+3X3puZgpe/NO/PE6bKlEBX4V0QoFQ+F?=
 =?us-ascii?Q?5YMkbA/Msl6PVI+tF6jVtfPhDcy+uh7DPMkmvMYYApYaEcy9e3s1kGoq9Gv/?=
 =?us-ascii?Q?VZ9UOE12pV4VEXIHePYBtJk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 03d777d9-ddb1-4644-bec5-08dbbe590c18
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:23:07.3509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XxFivblvKEX9b9oQRa1qyzFZdxsSWq8sM+BsJU2VaEpWbIZwlCeEOhyY6noqLEhcDfq3C0CloOAwEU0DBKemn39L6y0QNax64cRlHvWTe88ZaAnx3zPNdflFBC3WiLYu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: 6RKWWTAIGIRZDFMUL2ILK6BMRU33L24G
X-Message-ID-Hash: 6RKWWTAIGIRZDFMUL2ILK6BMRU33L24G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RKWWTAIGIRZDFMUL2ILK6BMRU33L24G/>
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
 sound/soc/samsung/aries_wm8994.c   | 12 ++++++------
 sound/soc/samsung/arndale.c        | 10 +++++-----
 sound/soc/samsung/bells.c          | 16 ++++++++--------
 sound/soc/samsung/i2s.c            | 12 ++++++------
 sound/soc/samsung/littlemill.c     | 16 ++++++++--------
 sound/soc/samsung/lowland.c        |  4 ++--
 sound/soc/samsung/midas_wm1811.c   | 10 +++++-----
 sound/soc/samsung/odroid.c         |  8 ++++----
 sound/soc/samsung/pcm.c            |  8 ++++----
 sound/soc/samsung/smdk_spdif.c     |  4 ++--
 sound/soc/samsung/smdk_wm8994.c    |  4 ++--
 sound/soc/samsung/smdk_wm8994pcm.c |  6 +++---
 sound/soc/samsung/snow.c           |  4 ++--
 sound/soc/samsung/spdif.c          | 14 +++++++-------
 sound/soc/samsung/speyside.c       |  8 ++++----
 sound/soc/samsung/tm2_wm5110.c     | 24 ++++++++++++------------
 sound/soc/samsung/tobermory.c      |  8 ++++----
 17 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index dd3cd2c9644a..fa7dd04fe94e 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -166,7 +166,7 @@ static int aries_spk_cfg(struct snd_soc_dapm_widget *w,
 	int ret = 0;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/**
 	 * We have an odd setup - the SPKMODE pin is pulled up so
@@ -259,8 +259,8 @@ static const struct snd_soc_dapm_widget aries_dapm_widgets[] = {
 static int aries_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int ret;
 
@@ -287,8 +287,8 @@ static int aries_hw_params(struct snd_pcm_substream *substream,
 
 static int aries_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	/* Switch sysclk to MCLK1 */
@@ -316,7 +316,7 @@ static const struct snd_soc_ops aries_ops = {
 
 static int aries_baseband_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int ret;
 
diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index fdff83e72d29..80a57bff1d02 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -20,9 +20,9 @@
 static int arndale_rt5631_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int rfs, ret;
 	unsigned long rclk;
 
@@ -55,8 +55,8 @@ static const struct snd_soc_ops arndale_rt5631_ops = {
 static int arndale_wm1811_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int rfs, rclk;
 
 	/* Ensure AIF1CLK is >= 3 MHz for optimal performance */
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 70b63d4faa99..365b1aca4855 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -60,7 +60,7 @@ static int bells_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
 	if (dapm->dev != codec_dai->dev)
@@ -106,7 +106,7 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	component = codec_dai->component;
 
 	if (dapm->dev != codec_dai->dev)
@@ -152,11 +152,11 @@ static int bells_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_AP_DSP]);
-	wm0010 = asoc_rtd_to_codec(rtd, 0)->component;
+	wm0010 = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_DSP_CODEC]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_component_set_sysclk(component, ARIZONA_CLK_SYSCLK,
 				       ARIZONA_CLK_SRC_FLL1,
@@ -195,7 +195,7 @@ static int bells_late_probe(struct snd_soc_card *card)
 	}
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_CP]);
-	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
 	if (ret != 0) {
@@ -207,8 +207,8 @@ static int bells_late_probe(struct snd_soc_card *card)
 		return 0;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[DAI_CODEC_SUB]);
-	aif3_dai = asoc_rtd_to_cpu(rtd, 0);
-	wm9081_dai = asoc_rtd_to_codec(rtd, 0);
+	aif3_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	wm9081_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif3_dai, ARIZONA_CLK_SYSCLK, 0, 0);
 	if (ret != 0) {
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 3af48c9b5ab7..0d61055ddc59 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -939,8 +939,8 @@ static int i2s_trigger(struct snd_pcm_substream *substream,
 {
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
 	int capture = (substream->stream == SNDRV_PCM_STREAM_CAPTURE);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	switch (cmd) {
@@ -1580,8 +1580,8 @@ static void samsung_i2s_remove(struct platform_device *pdev)
 static void fsd_i2s_fixup_early(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	struct i2s_dai *other = get_other_dai(i2s);
 
 	if (!is_opened(other)) {
@@ -1593,9 +1593,9 @@ static void fsd_i2s_fixup_early(struct snd_pcm_substream *substream,
 static void fsd_i2s_fixup_late(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct samsung_i2s_priv *priv = snd_soc_dai_get_drvdata(dai);
-	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct i2s_dai *i2s = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	struct i2s_dai *other = get_other_dai(i2s);
 
 	if (!is_opened(other))
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index fafadcef234e..c5260e101c2a 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -23,7 +23,7 @@ static int littlemill_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -70,7 +70,7 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -104,8 +104,8 @@ static int littlemill_set_bias_level_post(struct snd_soc_card *card,
 static int littlemill_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	sample_rate = params_rate(params);
@@ -182,7 +182,7 @@ static int bbclk_ev(struct snd_soc_dapm_widget *w,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -278,11 +278,11 @@ static int littlemill_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	aif2_dai = asoc_rtd_to_cpu(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
 				     32768, SND_SOC_CLOCK_IN);
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index a79df871ea13..702cb4cc1ce9 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -36,7 +36,7 @@ static struct snd_soc_jack_pin lowland_headset_pins[] = {
 
 static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	ret = snd_soc_component_set_sysclk(component, WM5100_CLK_SYSCLK,
@@ -70,7 +70,7 @@ static int lowland_wm5100_init(struct snd_soc_pcm_runtime *rtd)
 
 static int lowland_wm9081_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	snd_soc_dapm_nc_pin(&rtd->card->dapm, "LINEOUT");
 
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index 2ec7e16ddfa2..bc4214530e95 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -53,8 +53,8 @@ static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	if (!rate)
@@ -105,7 +105,7 @@ static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, WM8994_SYSCLK_MCLK2,
@@ -284,7 +284,7 @@ static int midas_set_bias_level(struct snd_soc_card *card,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
 						  &card->dai_link[0]);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != aif1_dai->dev)
 		return 0;
@@ -305,7 +305,7 @@ static int midas_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card,
 							&card->dai_link[0]);
-	struct snd_soc_dai *aif1_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
 
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index c93cb5a86426..c59273e2da2a 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -35,7 +35,7 @@ static int odroid_card_fe_startup(struct snd_pcm_substream *substream)
 static int odroid_card_fe_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned long flags;
 	int ret = 0;
@@ -56,7 +56,7 @@ static const struct snd_soc_ops odroid_card_fe_ops = {
 static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int pll_freq, rclk_freq, rfs;
 	unsigned long flags;
@@ -98,7 +98,7 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	if (rtd->dai_link->num_codecs > 1) {
-		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 1);
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 1);
 
 		ret = snd_soc_dai_set_sysclk(codec_dai, 0, rclk_freq,
 					     SND_SOC_CLOCK_IN);
@@ -115,7 +115,7 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 
 static int odroid_card_be_trigger(struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned long flags;
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index d2cdc5c8e05b..573b2dee7f07 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -216,8 +216,8 @@ static void s3c_pcm_snd_rxctrl(struct s3c_pcm_info *pcm, int on)
 static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
@@ -260,8 +260,8 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *socdai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = pcm->regs;
 	struct clk *clk;
 	int sclk_div, sync_div;
diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 6f3eeb7bc834..2474eb619882 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -100,8 +100,8 @@ static int set_audio_clock_rate(unsigned long epll_rate,
 static int smdk_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned long pll_out, rclk_rate;
 	int ret, ratio;
 
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 821ad1eb1b79..13fb1bd7f4c9 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -44,8 +44,8 @@ static struct smdk_wm8994_data smdk_board_data = {
 static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	unsigned int pll_out;
 	int ret;
 
diff --git a/sound/soc/samsung/smdk_wm8994pcm.c b/sound/soc/samsung/smdk_wm8994pcm.c
index d77dc54cae9c..5802f92ab8ba 100644
--- a/sound/soc/samsung/smdk_wm8994pcm.c
+++ b/sound/soc/samsung/smdk_wm8994pcm.c
@@ -43,9 +43,9 @@
 static int smdk_wm8994_pcm_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned long mclk_freq;
 	int rfs, ret;
 
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 334080e631af..7de6acb95701 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -30,7 +30,7 @@ static int snow_card_hw_params(struct snd_pcm_substream *substream,
 	static const unsigned int pll_rate[] = {
 		73728000U, 67737602U, 49152000U, 45158401U, 32768001U
 	};
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snow_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	int bfs, psr, rfs, bitwidth;
 	unsigned long int rclk;
@@ -109,7 +109,7 @@ static int snow_late_probe(struct snd_soc_card *card)
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
 	/* In the multi-codec case codec_dais 0 is MAX98095 and 1 is HDMI. */
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* Set the MCLK rate for the codec */
 	return snd_soc_dai_set_sysclk(codec_dai, 0,
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 28dc1bbfc8e7..f44e3180e8d3 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -141,8 +141,8 @@ static int spdif_set_sysclk(struct snd_soc_dai *cpu_dai,
 static int spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned long flags;
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
@@ -177,8 +177,8 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *socdai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = spdif->regs;
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 con, clkcon, cstas;
@@ -194,7 +194,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	snd_soc_dai_set_dma_data(asoc_rtd_to_cpu(rtd, 0), substream, dma_data);
+	snd_soc_dai_set_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream, dma_data);
 
 	spin_lock_irqsave(&spdif->lock, flags);
 
@@ -279,8 +279,8 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 static void spdif_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct samsung_spdif_info *spdif = to_info(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
 	void __iomem *regs = spdif->regs;
 	u32 con, clkcon;
 
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 22e2ad63d64d..43519572dc69 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -25,7 +25,7 @@ static int speyside_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -61,7 +61,7 @@ static int speyside_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[1]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -131,7 +131,7 @@ static void speyside_set_polarity(struct snd_soc_component *component,
 
 static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_sysclk(dai, 0, MCLK_AUDIO_RATE, 0);
@@ -143,7 +143,7 @@ static int speyside_wm0010_init(struct snd_soc_pcm_runtime *rtd)
 
 static int speyside_wm8996_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = dai->component;
 	int ret;
 
diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index 5ebf17f3de1e..2417b91a328f 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -92,8 +92,8 @@ static int tm2_stop_sysclk(struct snd_soc_card *card)
 static int tm2_aif1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct tm2_machine_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 
 	switch (params_rate(params)) {
@@ -133,8 +133,8 @@ static const struct snd_soc_ops tm2_aif1_ops = {
 static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	unsigned int asyncclk_rate;
 	int ret;
 
@@ -187,8 +187,8 @@ static int tm2_aif2_hw_params(struct snd_pcm_substream *substream,
 
 static int tm2_aif2_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	/* disable FLL2 */
@@ -208,8 +208,8 @@ static const struct snd_soc_ops tm2_aif2_ops = {
 static int tm2_hdmi_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int bfs;
 	int bitwidth, ret;
 
@@ -284,7 +284,7 @@ static int tm2_set_bias_level(struct snd_soc_card *card,
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
-	if (dapm->dev != asoc_rtd_to_codec(rtd, 0)->dev)
+	if (dapm->dev != snd_soc_rtd_to_codec(rtd, 0)->dev)
 		return 0;
 
 	switch (level) {
@@ -315,8 +315,8 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF1]);
-	aif1_dai = asoc_rtd_to_codec(rtd, 0);
-	priv->component = asoc_rtd_to_codec(rtd, 0)->component;
+	aif1_dai = snd_soc_rtd_to_codec(rtd, 0);
+	priv->component = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	ret = snd_soc_dai_set_sysclk(aif1_dai, ARIZONA_CLK_SYSCLK, 0, 0);
 	if (ret < 0) {
@@ -325,7 +325,7 @@ static int tm2_late_probe(struct snd_soc_card *card)
 	}
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[TM2_DAI_AIF2]);
-	aif2_dai = asoc_rtd_to_codec(rtd, 0);
+	aif2_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(aif2_dai, ARIZONA_CLK_ASYNCCLK, 0, 0);
 	if (ret < 0) {
diff --git a/sound/soc/samsung/tobermory.c b/sound/soc/samsung/tobermory.c
index 9287a1d0eef1..2bdd81bf821a 100644
--- a/sound/soc/samsung/tobermory.c
+++ b/sound/soc/samsung/tobermory.c
@@ -23,7 +23,7 @@ static int tobermory_set_bias_level(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -66,7 +66,7 @@ static int tobermory_set_bias_level_post(struct snd_soc_card *card,
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	if (dapm->dev != codec_dai->dev)
 		return 0;
@@ -181,8 +181,8 @@ static int tobermory_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
-	component = asoc_rtd_to_codec(rtd, 0)->component;
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_sysclk(codec_dai, WM8962_SYSCLK_MCLK,
 				     32768, SND_SOC_CLOCK_IN);
-- 
2.25.1

