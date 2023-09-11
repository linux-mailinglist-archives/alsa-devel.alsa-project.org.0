Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6B79B062
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D71A4C;
	Tue, 12 Sep 2023 01:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D71A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476170;
	bh=DaDaKOkI0S2LOt1iP2n0nZE35w2vUva7t11tKVB2WOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oXfOrsud3bqOccqbz2CEW6yC1PRiDleqDqax3FmzIxj0CpqvtnuB4iyBezvpiaEJh
	 EFFQ3U2weCskSPEWC66WDhg5D0pyL7hpt/m+1W5lDGjVLViuNKn3Y5Ej1/JsKSreZo
	 Fz41/vZVcnUIdVSNqTUY3oUVcpb2OAt1+T961/jQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43D67F805B2; Tue, 12 Sep 2023 01:47:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D6C7F805AD;
	Tue, 12 Sep 2023 01:47:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A49F8F805AD; Tue, 12 Sep 2023 01:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 082AEF80567
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 082AEF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Ri0/qsCX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU4Gn76zvb6GoZx/VeFF4bc0quPSnVmFf39g6xI+tiWVCM1Oj8o4z6qpm15FL00TTHuCzpJfjhuQRHhwBX+DxfQDSP+XSMsS0LPWhOvNPZJtjC8uJwVi5+yj5o9a+/dy8bdASFsOPMFM/XP3vsSPdHMm/4cFRm9uaaK07XqJ2cGEehsUFqN10zZff2XethaLEt3DgyK2CkSHlJo5u6uX3p013ECR16LGEEOfnZUTI2UhlAgkm9qWeAXzl1nIxD0O/47R/pTsaNBp0v7q2JhDp38Keo8GW8db++1715m/abkviLpJKiKXLGuHimzXZzLfV5AWvCoXVQbcmTNEk14Lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqkDkv2zzlQEmAnav/0mCg5nG4DVDsDoolGyDVifosU=;
 b=PD43cVBrBo9u4C4yN2ywJWhLT+M6+R89J/WYRo99+YY2ELk/K45uMeNQ0fyL/QJqEYrt5ybsDok9iHc//75+JyTvpYqQGNHUlntBU69yw3ICDZLsnpFSaCGajl+Vo75K/cE6ZnAAVY9Bfty77NxjTiHhS5aOsULc7BoeYRYNbTVGiJwE7YMrNcMQwPW7mAmCZV/SOW/xEfQyQXEOfgHN+/LzNMqA0XZTJx3vPonyzJy2FASdmI95WpRnJL/pnh9HGj9ZevhhGY8OkUYm7LVLrAWcktu4gmMyRMeXJdXL9YgHlPdPgPBALn4ecA7ppM9iE4+tTBJerHvNcxxj+TriBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqkDkv2zzlQEmAnav/0mCg5nG4DVDsDoolGyDVifosU=;
 b=Ri0/qsCX5MxyKvv4yLFHV/YDzdUkvhjqSpPQ0GJ2t5+tcr7IuLlzjeZJ/PrJqx07U4Ud0uwT9Y5VcfAuXR94HAFe2hyuzwHw0z2yHZdn1ZdqU//HKHi5yL1DbwIsUdWHeH5oB6ddbkYRxLuaY0xAOyHh6T3QhR9JJCw3L7zNsZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:47:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:47:29 +0000
Message-ID: <87bke8s25q.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Arnd Bergmann <arnd@arndb.de>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/54] ASoC: ti: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:47:29 +0000
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 113dbd80-2f8d-4f13-2025-08dbb32175f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/sR+MAACL6Xxy7qS6l8Y777FMvTMwgn2o0ctt6Bdcqay92hRZgAuFrOHBMNoWUiapy+t963xP4157tCjEYFwsuzo4j5ktYTQG7MsqzF5YUGVl+AgboBadDwzmthpUFXHMonOEWifmCU4Y7HxXjS9El2orYJy3Auh2MRAjo51PciVvJmGJeoxCWKKNDLxjIcquotg0EvlevzK/4NCLMGIERa10CvYmgpEPC9e6wIgHNApvDcyucBbJEb+JR4JGFXUHQkmavjcFys5maONNAaXmBZYEqemF5sIrs0QvkSYfVDAN5hzZ6DKwDUyusl0zep05ADcUajyHdyAgNmCLyl+maAG0YXH0hCqNpu9DhqWz/5+8vz3ikUmVO5DS7QW2EYASdSLHPTinMh3xBCb/UWnz4wONt0efd86aLndH8UZm9hnIeUO848+MfDv/EOgV1jGTqKNLPJngyKiTtLOmsV4zmMFqZtYCLbHAZYS9Gq7GS0Y+o2GJyCFwbdfKlk1Y87bSbalprgUcg8i0D8Ha+GOEloPNF4z6nJ1gX7zmDD6+rgxQWhx+XhG0Cqy6Omxd38Rwm6ck4PJ8Q2vTvUM4muTfEbjHoMfkgloN2JYAt9VSngoHMYPPSgggYguvbYrQehQabhEoqkTERFioJLnecIIbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(30864003)(2616005)(26005)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YqcAGXPLxXpg0ar/mY5U9MMfJ1JBNchf8jgVu8ZgMKMGMCLu+s6vABvvKz3g?=
 =?us-ascii?Q?CMMTyFUB7ye2cZw7w4/ArsSoYg0BhBOdqC39aaKonPj0GCbCcuEPAmMGs81F?=
 =?us-ascii?Q?ba3s/XuFDK1XxZY9PLtUeS33byFTvOFSoYLPcz5Csw2otEOF3vIJR4QureqJ?=
 =?us-ascii?Q?JNZ+hJPe7/Vld5JyC+hqNhXjJ8Gi7RsmKE0HoLvoBAVMqwh+fZXc4+iNbx0t?=
 =?us-ascii?Q?qoBLpCwHo+VflwpAIjdpS1sebiglVxyvcXD8I9S3Jyn0+XOokqlytySnLmDL?=
 =?us-ascii?Q?EToAjv0e8k4bJ7w5iVULOefe9+rdFr40Hix+w/344E9yoIwahHHNFgXwkoTC?=
 =?us-ascii?Q?GZJxZCCLsuldlQrv8eyQh9zAyLaPziwkIt0GSVdtBQkp0uIjrNzVgof2bBjd?=
 =?us-ascii?Q?NpvasTwHXndw62P05cMDpAlhqqWmMxhTjxtrGM+wmoE4ojwBODytzJsoMQE+?=
 =?us-ascii?Q?zvh2vn/KxtQGoVA4E5+TMyYF0GH/tC0Cre2/plkY5x5sW2YVrwM0L5WV9l21?=
 =?us-ascii?Q?FcVOXzUm1I9Qhl3WdFVau6jH0xYc0KieIJuqwQN3obiYGW0lh4QXVQ77sahO?=
 =?us-ascii?Q?7JjxWabsQsCPkZ25pjEMGwefYabI+tZbqs/FdKqNXvix6FqlWy2gydU3AOLi?=
 =?us-ascii?Q?yjLUzRQDj9MbR853hubCsqUIHjvU+vPRKt1/2LF+H4G7wrDwzCMqA5nec8oy?=
 =?us-ascii?Q?tILV94EPCWBpSR5kKvtL+wmtdyZlsKyCOF79bJ0ZH+2RYmpEkMMqFNJqoWXC?=
 =?us-ascii?Q?4aq0NlD4gTmOb7oFdsM+5WzS3WjHmpr5EQ3T87elcByehKcqXr8jxuulMsgP?=
 =?us-ascii?Q?CQiK49QQOBtpYzAfjHc91H98aj2ec5uCh2NH/1qctZ4G0+Jt5BfrRW5X9Khb?=
 =?us-ascii?Q?GPOnxNVUX5dThjbcf3DPfE9gf3DObSjJBiR/+n7ACEIzII9CMbJ8NkKg0KT0?=
 =?us-ascii?Q?40pJKEriiBWk2C9CsqlMiNSQOGBiK8DhBfIQA0MTt2c/pl3jKYCV40ukNQJF?=
 =?us-ascii?Q?AaRkJ0gOfGN/V8n4XlLUYyNsF2gojY2qMKyf37kiHwX6GZPUpDxYRVM14S0o?=
 =?us-ascii?Q?JlR/YSAlkdYrs6yKfw52xZnaTaewR2DYM1d3Atx4XdNVTchBAAilYBSjggSN?=
 =?us-ascii?Q?BrRcATn73sq42z/I0tQUtneqaKIlh8iEVZN6JXzHnnZaAWwfnMnXOC8eooib?=
 =?us-ascii?Q?erSEL6gq2W/QSH4C9u+cvGZYgZ6qag186m7A6/DXSnjdkPdceGAxox/g45t3?=
 =?us-ascii?Q?N6khAhv+1cxq4WH858Jax624P3cleypej5IffU/H/5dmG2kG9R/lOecV87/2?=
 =?us-ascii?Q?8GA4GH0TzQcY3EmwEFSF5+EpayzzvyA6QAI2DCy7aqux15A7jr6N1/jbNA8p?=
 =?us-ascii?Q?3KqESN4dcAjnwG8luwNBPn1SuB9FWUlMXYOhlktu0YVRhC9XDi4rDAU/b18l?=
 =?us-ascii?Q?HIl/2I8DB484KtcXzAKCCfmbcTDNdFgk0l4DzFh4vHYwDJ3791F7PcfA7uJD?=
 =?us-ascii?Q?rPrPYFXQk3RsKRfh2tTUFZ/TGY1ysiz9R69RIvQNzWuR4GuxYUJShvMkFoLQ?=
 =?us-ascii?Q?kQ6mQcLKOXigkkFMz3nFVBkKX8RW4dJHBoa/pbH8uNzLTKLk+eyJFWTmuUXe?=
 =?us-ascii?Q?cy4cpJ0QiQx7I6nGGlz0/3c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 113dbd80-2f8d-4f13-2025-08dbb32175f4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:47:29.8522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WeZopgZ/CyDY1UF2Mb6Xj46hw754rRfsM6kI96AYTwE5jirstFjE36l8W81WT79cedFLlHvuWct1Yj16hbkCND9Prny6wwLU7f8YxsSFPfJ/wsPrgletJh638z3VNI8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: V32H4LZJNQZTCFKGFP4Y6KTPVL5OQ2ZV
X-Message-ID-Hash: V32H4LZJNQZTCFKGFP4Y6KTPVL5OQ2ZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V32H4LZJNQZTCFKGFP4Y6KTPVL5OQ2ZV/>
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
 sound/soc/ti/ams-delta.c        |  4 ++--
 sound/soc/ti/davinci-evm.c      | 10 +++++-----
 sound/soc/ti/j721e-evm.c        | 12 ++++++------
 sound/soc/ti/n810.c             |  6 +++---
 sound/soc/ti/omap-abe-twl6040.c | 10 +++++-----
 sound/soc/ti/omap-hdmi.c        |  2 +-
 sound/soc/ti/omap-mcbsp-st.c    |  2 +-
 sound/soc/ti/omap-mcbsp.c       |  8 ++++----
 sound/soc/ti/omap-mcpdm.c       |  2 +-
 sound/soc/ti/omap-twl4030.c     |  2 +-
 sound/soc/ti/omap3pandora.c     |  6 +++---
 sound/soc/ti/osk5912.c          |  4 ++--
 sound/soc/ti/rx51.c             |  6 +++---
 13 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 371943350fdf9..687c1d969285b 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -460,14 +460,14 @@ static void ams_delta_shutdown(struct snd_pcm_substream *substream)
 
 static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dapm_context *dapm = &card->dapm;
 	int ret;
 	/* Codec is ready, now add/activate board specific controls */
 
 	/* Store a pointer to the codec structure for tty ldisc use */
-	cx20442_codec = asoc_rtd_to_codec(rtd, 0)->component;
+	cx20442_codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 
 	/* Add hook switch - can be used to control the codec from userspace
 	 * even if line discipline fails */
diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index 544cb3da50eb0..ae7fdd761a7a7 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -28,7 +28,7 @@ struct snd_soc_card_drvdata_davinci {
 
 static int evm_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *soc_card = rtd->card;
 	struct snd_soc_card_drvdata_davinci *drvdata =
 		snd_soc_card_get_drvdata(soc_card);
@@ -41,7 +41,7 @@ static int evm_startup(struct snd_pcm_substream *substream)
 
 static void evm_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *soc_card = rtd->card;
 	struct snd_soc_card_drvdata_davinci *drvdata =
 		snd_soc_card_get_drvdata(soc_card);
@@ -52,9 +52,9 @@ static void evm_shutdown(struct snd_pcm_substream *substream)
 static int evm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *soc_card = rtd->card;
 	int ret = 0;
 	unsigned sysclk = ((struct snd_soc_card_drvdata_davinci *)
diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 6a969874c9270..b4b158dc736eb 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -251,11 +251,11 @@ static int j721e_rule_rate(struct snd_pcm_hw_params *params,
 
 static int j721e_audio_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int active_rate;
 	int ret = 0;
@@ -309,12 +309,12 @@ static int j721e_audio_startup(struct snd_pcm_substream *substream)
 static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int sysclk_rate;
 	int slot_width = 32;
@@ -376,7 +376,7 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 
 static void j721e_audio_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
@@ -403,7 +403,7 @@ static int j721e_audio_init(struct snd_soc_pcm_runtime *rtd)
 	struct j721e_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int domain_id = rtd->dai_link->id;
 	struct j721e_audio_domain *domain = &priv->audio_domains[domain_id];
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
 	unsigned int sysclk_rate;
 	int i, ret;
diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index ed217b34f846a..6c72c2a50dece 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -84,7 +84,7 @@ static void n810_ext_control(struct snd_soc_dapm_context *dapm)
 static int n810_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 
@@ -100,8 +100,8 @@ static void n810_shutdown(struct snd_pcm_substream *substream)
 static int n810_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int err;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 805ffbf890140..fb8727a744362 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -45,8 +45,8 @@ static struct platform_device *dmic_codec_dev;
 static int omap_abe_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
 	int clk_id, freq;
@@ -77,8 +77,8 @@ static const struct snd_soc_ops omap_abe_ops = {
 static int omap_abe_dmic_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
 	ret = snd_soc_dai_set_sysclk(cpu_dai, OMAP_DMIC_SYSCLK_PAD_CLKS,
@@ -166,7 +166,7 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static int omap_abe_twl6040_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_card *card = rtd->card;
 	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
 	int hs_trim;
diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index a3663ab065ac2..29bff9e6337b6 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -370,7 +370,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	card->dai_link->cpus		= compnent;
 	card->dai_link->num_cpus	= 1;
-	card->dai_link->codecs		= &asoc_dummy_dlc;
+	card->dai_link->codecs		= &snd_soc_dummy_dlc;
 	card->dai_link->num_codecs	= 1;
 
 	card->dai_link->name = card->name;
diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index b047add5d8875..901578896ef32 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -475,7 +475,7 @@ OMAP_MCBSP_ST_CONTROLS(3);
 
 int omap_mcbsp_st_add_controls(struct snd_soc_pcm_runtime *rtd, int port_id)
 {
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 
 	if (!mcbsp->st_data) {
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index fdabed5133e83..bfe51221f5416 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -720,8 +720,8 @@ static int omap_mcbsp_init(struct platform_device *pdev)
 static void omap_mcbsp_set_threshold(struct snd_pcm_substream *substream,
 		unsigned int packet_size)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	int words;
 
@@ -885,8 +885,8 @@ static snd_pcm_sframes_t omap_mcbsp_dai_delay(
 			struct snd_pcm_substream *substream,
 			struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	u16 fifo_use;
 	snd_pcm_sframes_t delay;
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index d7d9f708f1fde..2b97f2e4f1851 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -533,7 +533,7 @@ static const struct snd_soc_component_driver omap_mcpdm_component = {
 void omap_mcpdm_configure_dn_offsets(struct snd_soc_pcm_runtime *rtd,
 				    u8 rx1, u8 rx2)
 {
-	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	mcpdm->dn_rx_offset = MCPDM_DNOFST_RX1(rx1) | MCPDM_DNOFST_RX2(rx2);
 }
diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 950eec44503bc..a3ad1a2df1c70 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -38,7 +38,7 @@ struct omap_twl4030 {
 static int omap_twl4030_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int fmt;
 
 	switch (params_channels(params)) {
diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index a287e9747c2a1..712e8ae5e8048 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -31,9 +31,9 @@ static struct regulator *omap3pandora_dac_reg;
 static int omap3pandora_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 2790c8915f552..5f718f9ec1e55 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -38,8 +38,8 @@ static void osk_shutdown(struct snd_pcm_substream *substream)
 static int osk_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int err;
 
 	/* Set the codec system clock for DAC and ADC */
diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index 322c398d209ba..d966c008be4d8 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -90,7 +90,7 @@ static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
 static int rx51_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 
 	snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
@@ -102,8 +102,8 @@ static int rx51_startup(struct snd_pcm_substream *substream)
 static int rx51_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* Set the codec system clock for DAC and ADC */
 	return snd_soc_dai_set_sysclk(codec_dai, 0, 19200000,
-- 
2.25.1

