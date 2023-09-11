Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A03D79B15D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D2DD83A;
	Tue, 12 Sep 2023 01:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D2DD83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476405;
	bh=GEnFpg4uC9pcL2Q0MpQIYp3hoaWeHMg11NxyXR+vkpg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ps39tysYUm76zZRMYYlcH5R1aWQb3RmGyM+1QbF2Mkn8AlGcfz7OckZ7+PD8qZf+q
	 G0Ol6rhoUmg9H0soAys47uEK33cfnL0Z3Jzf4D+U4Y5di60FuVUEWUXRjdq2Nc8qzX
	 /q+kNhOsC2gTUjvsqTqjfAoEjyn+F21HDQbizxms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D0EFF805D7; Tue, 12 Sep 2023 01:50:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF0E6F8057A;
	Tue, 12 Sep 2023 01:50:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8A72F8057A; Tue, 12 Sep 2023 01:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8A4BF80568
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8A4BF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CQAPGoNG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW9mkLHrmLOyzai66xURN2wwKjRw+sRyVYIEvjg+mnljCL675SljRtU3RmdD6rpPmpbKy7yoDDptP4sWVOtCcN1Xqnh/IKT+LRE6LhBEDNCFWmPkbL2ygEUfJ3XtKsCL/6SkPHb3rqbqmZBmf69RZ47fKIYtFNDSVuGK5fPusgVxhYCvqHbfYYlOzMwSLBuBoP0v7J9jK4Ena4QF5VBgwTVMG2jLxEwizkOKOMPu5hitH97raSKxYj+ul7zwJIWkt5pvHCT4sX4lS7iHz0VTJaGjO/oUunznvR4OzzdjDau2u4WA345R5OuZ3E0erFUJ2Gh6P8QCetb3vO8Jf+XkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoNjVlqFoTkqohceYca4u3sUipNBomoAP42MXKj2jqA=;
 b=f9z6eCLXyrVfPuIjXgV0W/yx3CCg7SkO8W+/fP8FGa6LaZzuQEN5FoS4Q/k8tMyTvW8cHcg+nEMBwkAEyABILRj8CliAMWXv4yGiNKWH521ny2HkyD1g/nWC8iVksTZATDmD5yi3/C6MGwVq8FMiJ2NaJTCejwVJnJBI9u1SOHgV2JjyaIXcEEyWmseKvAiEGqc/XtLWPnpCsRMPfdRyZvKzTD0QaZ3ijjVOpSbMY4qwXYl+2XIW84oRYzvFU+XOc1+w4rKL5VoaZC60lnGJ/6as3qB1Iv0N6BZbKwTDKLRugRubj/0R3aWd59VNUFCbu8SRB+KNELc1Xu65GmpUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoNjVlqFoTkqohceYca4u3sUipNBomoAP42MXKj2jqA=;
 b=CQAPGoNG8AV4qUkdaRNVrD0jxSxFQmKuvxGbUVqV2Y649nJ6dSYNbt24W568mNKqqtEZb72v1W4yZp4ih3xByOiJ2s9qWk2dIrj7e/n/LGSCm+kfvPqnzY5bAXvFeRQU63MoZrH22tB5g0h+juB5KgXZIg6pGbCdFzLs+dS1scI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:19 +0000
Message-ID: <87msxsqni9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 21/54] ASoC: tegra: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:18 +0000
X-ClientProxiedBy: TYBP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc2de50-88ea-4256-91aa-08dbb321b729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BPcld4QiH+1hpmp2n4giIWIiTvFAk9jI0LSNFr2ddCWeUyG61Nk4a9Huq02FkCYr+mJpkpv+NAF193Bh19dp2UL13wjxB2K1bLIBSjZniTlTu8Aq7MICmXUaDM3O+0td7xgGLjXPQbUpKC8sZBS4lQO4w0q/7bEOsYWhNd5WPgTqcUC5Bhl1tFoyfir2EURsKfBqa9kzHBoFl+Na49/TzHem/OMnobcgDaCwesra/9d35w4BafAZoIW7SvN5kff4lr6Xex17xRrfKsczzaOU/Dm9BZebMJ8DohPymmd6FWstrjtslZhhlR2vQN6UCIVsA2+cVQrh15y9zs9GBONpf8qCn1VsrbWOrOGE/5dBzzegCblD7UQheolxg0nX50YahamdKJelIjEFb/QtMFBwt/Sapx0Xf8EFmIzjKXxtdObURC37wXFqJRnvLtvN7iP2Ot61COgHI+C/Q4ZAW1eRnnMqe9reuINi+Z7WtdUbT4tg+wcqnaqzgnvo44m78EBAikuCq9TOq3ihb9FceR1dKdmGBB6oTFv5HBh68DWC3wmC4fe20JvGMvVQsUSNbgnj3DUWQsH+ZsqO5pgqRQBTiFNtCFxD6Dz8WKR+1IcJu0LXGLGaqPvorWrYqPYUbM/N11l5nZ0Am1CxSmR0R1Y02g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oSif/fEiCjotjARV+UzDxjhH0+N6DVpWTFSjqWE/6uAntGX5R77dmfnavnPe?=
 =?us-ascii?Q?ghmpCLtGZvv8vH70cmDs4+zVPiThfNHrasqrjbF93exDt8tbkj4liKxVwLWY?=
 =?us-ascii?Q?mkjeouvvnTqLdXGDy/jwTqfWGgsD9VxnZPdLWSVw6wHnYZNJLSIY7F4rZs16?=
 =?us-ascii?Q?Unp2DTFbbjgs+RPporstw6DPQXclZ5PEO2nzvAFTjNQXwZXa/ra9/4ctzxBg?=
 =?us-ascii?Q?Lxt5mV3LPin1HdUMMWFnCPACYnmhw09Yn3RQMdFB49DuZVVBPrba1ol3B8um?=
 =?us-ascii?Q?BgeDmb5QArgRGrJLujsALwyHpoQwl1v4lUT3sIBElV+XW6PLuDPJmN3l++oI?=
 =?us-ascii?Q?Zeeo4Lz3MkWYwTO7QSmY+P4a617tg3KzNz7wcVwkQ6vnX5IuzdT1iHMZWC7X?=
 =?us-ascii?Q?Vv0tym03EhJGOsqdU2msz2iDyCf5kuYHYEquFu6FCW2Ckp8jXNWPvx1V51Zv?=
 =?us-ascii?Q?EAFOR41YYOs5SLPYHq5k0RrY4E+qfD5tRR7EgA2ubEM28cg+mU8M2OmRkOd3?=
 =?us-ascii?Q?zGQ+JfN+zHCtfSBLJNEWkqwp4UE88FwyHROuE8NXvwDGGQBYo/y6wibK9nKy?=
 =?us-ascii?Q?9jvBqmUalVgvmDcZQatPRkUf/zvLkA3jNh0x6oGyrq43W9V7pHRnyVtprly/?=
 =?us-ascii?Q?os8611z+7ueTP/zeeMlvjwrxLVzoW00Dn+MbgeiGFum6zmT3SsOWJs35KDt/?=
 =?us-ascii?Q?Tv68oq+W5GWikX7TJgv+MSkBHyE5QMufI8GSKwGLzkvrupugKOi0N6B0tqfp?=
 =?us-ascii?Q?6EH7vpooZUmPKWRiyiaouq5nJm6jyYX3r9Ws/Jid02m1qgIgdPL1KT9LBoh2?=
 =?us-ascii?Q?KdpcPO2m7tBKJFRq1mOEu5QLyiv7DyYsLluIGfgkdJdiO+G2okyV6F5jmUKF?=
 =?us-ascii?Q?PlxgsWjSY12QQRH5/zSlin9H4gjuNBH5XfHSGBiITSe7r3BXma2nlXfeGelR?=
 =?us-ascii?Q?0L/gHlPO9xTFhkoKawu0o1vPhNoBZDMvqoGVvHAAj5U6iv7EEi9/2N4hj57M?=
 =?us-ascii?Q?+da08a47xPthBteFvnTeMmVtlooGKit6uD00rkkb+ZTnSQcVItpZaK2FrHBN?=
 =?us-ascii?Q?HrP+ImW6Q1WsnFjq19iXFIyjlYQzFXBRpcIFGNwR6LF+EiZkXW+WTcUvTURl?=
 =?us-ascii?Q?v01Sz4E5CzKlJ0+5Eg4FnpIBwnu/tofp0JCmeIWQXvEEZnotq8eXpYNAPSyV?=
 =?us-ascii?Q?btetLRBuh9zNoq9D4yMKuHepLiGlVqyFWH8uwLkHhZkzKkR4Mqu4NZQGJB4d?=
 =?us-ascii?Q?KXGjPCcxWS+khGE6lhZVx4omDY5EyZn6Qp7l4dcdof7fnfG/N5QHsKTF05lk?=
 =?us-ascii?Q?P8oEeyYcc/ny/gDESo3XcxPm2To+8AruSOxDhb+pxOFYmmrLTms1V1VSYdGi?=
 =?us-ascii?Q?psSdCyevb8DASm186Y4fv7ahbAvwooEJ01J4gWP7jzxUEVRfMxWWrI2ro1wv?=
 =?us-ascii?Q?3lSpHg1b4JZnmINOvWhwoM/Ru7wPI+NyNoH5wAn4DzveHoJJqigNN6D9lnpD?=
 =?us-ascii?Q?YxFto9IyqE8mUFNMTuW4AqN7IYGU9RwV13+DayBzF3piCs0BeMbJZhtmWQM0?=
 =?us-ascii?Q?t3PBsOPBOX+/PJ7YVe69CdzTaEbgfwhLEawhTiLLiE4wsRdYSze+MEEH0V5F?=
 =?us-ascii?Q?/hGmZbPMXDzlkYmuyRkuSzU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cdc2de50-88ea-4256-91aa-08dbb321b729
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:19.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1ktpgWedZnopuhqnTBG5XnDJPFVXaOVe8E0rnb/bzbJp0EPuV20DkVmtCQPLTb4fXJZfXJb8u8AZENjhewDz1MvqPhj/sGdGrCDY4zzOML6xGHcTq8rR+N5D629R0fVz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: ZJY2F6HRZK63RK3MHE2NLQEMZ3BDPTA3
X-Message-ID-Hash: ZJY2F6HRZK63RK3MHE2NLQEMZ3BDPTA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJY2F6HRZK63RK3MHE2NLQEMZ3BDPTA3/>
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
 sound/soc/tegra/tegra_asoc_machine.c     |  2 +-
 sound/soc/tegra/tegra_audio_graph_card.c | 22 +++++++++++-----------
 sound/soc/tegra/tegra_pcm.c              |  4 ++--
 sound/soc/tegra/tegra_wm8903.c           |  4 ++--
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index f5092b4109268..0e75c6d5c0c59 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -288,7 +288,7 @@ static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
 	unsigned int srate = params_rate(params);
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 1f2c5018bf5ac..baa9f81f59974 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -33,7 +33,7 @@ enum srate_type {
 };
 
 struct tegra_audio_priv {
-	struct asoc_simple_priv simple;
+	struct simple_util_priv simple;
 	struct clk *clk_plla_out0;
 	struct clk *clk_plla;
 };
@@ -48,8 +48,8 @@ struct tegra_audio_cdata {
 static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct simple_util_priv *simple = snd_soc_card_get_drvdata(rtd->card);
 	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
 	struct device *dev = rtd->card->dev;
 	const struct tegra_audio_cdata *data = of_device_get_match_data(dev);
@@ -136,8 +136,8 @@ static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
 static int tegra_audio_graph_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int err;
 
 	/*
@@ -158,18 +158,18 @@ static int tegra_audio_graph_hw_params(struct snd_pcm_substream *substream,
 			return err;
 	}
 
-	return asoc_simple_hw_params(substream, params);
+	return simple_util_hw_params(substream, params);
 }
 
 static const struct snd_soc_ops tegra_audio_graph_ops = {
-	.startup	= asoc_simple_startup,
-	.shutdown	= asoc_simple_shutdown,
+	.startup	= simple_util_startup,
+	.shutdown	= simple_util_shutdown,
 	.hw_params	= tegra_audio_graph_hw_params,
 };
 
 static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 {
-	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(card);
+	struct simple_util_priv *simple = snd_soc_card_get_drvdata(card);
 	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
 
 	priv->clk_plla = devm_clk_get(card->dev, "pll_a");
@@ -184,7 +184,7 @@ static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 		return PTR_ERR(priv->clk_plla_out0);
 	}
 
-	return asoc_graph_card_probe(card);
+	return graph_util_card_probe(card);
 }
 
 static int tegra_audio_graph_probe(struct platform_device *pdev)
@@ -244,7 +244,7 @@ static struct platform_driver tegra_audio_graph_card = {
 		.of_match_table = graph_of_tegra_match,
 	},
 	.probe = tegra_audio_graph_probe,
-	.remove = asoc_simple_remove,
+	.remove = simple_util_remove,
 };
 module_platform_driver(tegra_audio_graph_card);
 
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 0b69cebc9a33c..142e8d4eefd57 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -79,7 +79,7 @@ int tegra_pcm_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_chan *chan;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	if (rtd->dai_link->no_pcm)
@@ -151,7 +151,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	dmap = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dmap = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmap)
 		return 0;
 
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index b3cd0a34da637..6116d2e30fcaf 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -75,7 +75,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 		return err;
 
 	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
-		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 		struct snd_soc_component *component = codec_dai->component;
 		int shrt = 0;
 
@@ -105,7 +105,7 @@ static int tegra_wm8903_remove(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link = &card->dai_link[0];
 	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	wm8903_mic_detect(component, NULL, 0, 0);
-- 
2.25.1

