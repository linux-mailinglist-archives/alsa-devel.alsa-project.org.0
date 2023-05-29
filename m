Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136E714190
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:09:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE80586E;
	Mon, 29 May 2023 03:08:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE80586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322577;
	bh=6xB7EQYzattNpDgPEkkaA5Rf27rpG9qFS5ykOi1y318=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hhvegKmgnip7X5I3hDJJS40sivtOucmUxTg1b9dGWLs0jIn2PYeqIWvncw8CqlF0m
	 E8/rBpN/8HRhIZv6ZlavcWVAOmBxKjxD6oUOd+gtLAKcPCGzVcIqwF/1xe70xwXKID
	 1EDeCz4KKKbse2HEuddpsxrXSi+glqIh/7qzfees=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C29CF8026A; Mon, 29 May 2023 03:06:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E325F8026A;
	Mon, 29 May 2023 03:06:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F2E7F80612; Mon, 29 May 2023 03:06:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C4C7F8026A
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C4C7F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hYe8QOz0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AU/2lPZGD4NotSQIiELzUb3kVCOUBFw5kYzZndTKye8KLDpECo108k8JUPTY2SEmTkTJNiwB9/67a8turfwlosKmEJylGpwNOVD2uO4avHpZrYvNLmTNqTyFEfXkSxfnLN/zIzSncRmmMzPmz1N8Ykqx8tJiWgp9KmsQHFiYz3hwP52b6Sov284uYyewoIU5e/no8hn/I5gmAT9X6mbWU6l4j/wca7YkIwHzspz2f9m6lGjonW+4/o8W5TxEz83wXgIf6Zzmm88OoXqirsW08yUlFdXUm3qfNiE8nHL+gIsXd/oVkFmhh8m4oj+RjOmMYhghcHUzGl4ZA1DN0vQPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEa9MSp/pEhMaa4tNifWlD+mJo+k1OHTpkFn9Br8cNM=;
 b=iTGd6wRyvpEUuNGqVRiLmvwiUaMdw5VJC0s3yXtmhvBOK2DuoO2vXBE82CBe0WsQKpGmmqjFXmQwj3UjYQMkTLLEz5UmD8YRt7NpoLeuGpfCzu3Lnmw3RthA97OmNRD6rLh3BQFMf4/eZVUo9JyKuAz7emwnXe0K2HSmbin+gJtC69tYW6Qm0EXpGR89S1L+ApJdwdd3LxN+i1E/ecyK4tinaxLIiAf4p9hRJY7s7FwfkOQzLdRjrOWh3zHEpPnUgPh8lEOPTT0JSKDzt2Mmdxv3RsOH/TWvj5QeoAvOaG6oVoJP9bAfHW42BTXWgz6/V65ftwnZYe6X0+64BQBcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEa9MSp/pEhMaa4tNifWlD+mJo+k1OHTpkFn9Br8cNM=;
 b=hYe8QOz0MSCzrdrX6kplSE48b86FM5OLy2Nt2oli9QuMtoComkocFb7PWXqMb9PL5onn79XvyWssIiAoch/y8pe4OfYN9fO9F9S+uY9JWjCeviw2uoJBvnmHT4K5o8MZ5cNDk6ArEy1sUM87ojSFnZVwg2vBmvZ/NgDX6kfQm/0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:50 +0000
Message-ID: <87v8gckkup.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 20/21] ASoC: soc-compress.c: replace dpcm_playback/capture
 to playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 May 2023 01:05:50 +0000
X-ClientProxiedBy: TY2PR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:404:a::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4e18ff-d2ae-404b-ffef-08db5fe0d80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ty3aGlzgCJswppBBGnv0Eg8qFVvFFVGq8VxZ2KsjsBRYjcHH7sZXzX+rJ0f9Pe4x9ZrLJ3W0Psj8hTOQY669GinCZp8IhIcpVFmFFECOK+kZSa3JbHX9WyMoDCX1U2Ez6VWuTB3ri1wqqpQEx4MFSLc3XwOQChN50/mhPL+0EPg49SD6cFs+lCge0WB4+Rt73D8LmFjWeHrHHzbJctMUSTCDWHXEcj8+6Sdsh2q9v1tyFGozJvdiQkhdWJoepwYZb2N8dnk+3sWgYzy77NySyPjpeFxaNpH4ynBMhCW7bLB4VxMJv2BQ0yxEgbdcBJyusLyNS/UMdzMThv83x+RHA6WOTJtSXfsW2YfdpdysET0nqsCLE8iNm8bC5R+kA04pFZhH61xo97nhRyCCyaOUScWv8hdcEkiEPUNtwLVLS5YfjORFj3dBF7ktRdsc12p36FshIjh0irlSOzUhaR+xHAND5l9iFWDENW+1jnv9F6q38xHT/qJV91RM7qEevajH4TryTJg8R2P+OvWeSdzV4LhbgB28ACsukvWUVG58jjDF9mkvz1ws+a7ZzSQhaDS0ElXLujGGq/rm3uWracgvPvUUKLtUYw5DUgcgzLt0pxmkF9KVbtRCUDPMgqBHsbrm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?9vY2sFDf/mbsAJOlAGUF1kcXUyjU9ZuBnimkjJdiBEnIkx773JVTQQElXU?=
 =?iso-8859-2?Q?enNrlpdOP6bCDiq9Teny//SlM0C6/EcKf314VGfj+jSe7BNiJLCHWwz3HD?=
 =?iso-8859-2?Q?xudIofxlakAiLSWLAdXDS3J+fmQ4VabQXtCNaA2GCTe0MMX/3095IjuepK?=
 =?iso-8859-2?Q?IgkLibdhFnVSndeZImrBjdo2STBImiQvSnAIe58XsfjQKCFqfi0u9Pw3ry?=
 =?iso-8859-2?Q?1hP3R2bSoq0uLZoAmK7mhSPIR7h9LmvSbY6E72iCttdzK6OVRRAKdJ60Tz?=
 =?iso-8859-2?Q?gLha7EEbDXs0A0VhbTeKCzc6Iu2OXT+64ksiG3juY0pEpsxoCFX/ucdOov?=
 =?iso-8859-2?Q?4ppo5Q19MGOdalmPsz54fP7OSSkvc53h73RpP9boydCHv2/39/LVuDNfHU?=
 =?iso-8859-2?Q?bYiJ+2QhrqfeSkbH0obKN6Cukb1TsilgZFUcZXFPhvCQ4EZ01mU+rrYkWv?=
 =?iso-8859-2?Q?8QUBMsgffD4z7RfPSvbBDPmXlEwS7wN5RFun45GNpsMJQt4Ke/t0MP+XrR?=
 =?iso-8859-2?Q?jyedt73FJGDNFoG1/QnTuoT80QU/beTfkItthSaCAD1B+LiVs4/IiKLVNO?=
 =?iso-8859-2?Q?FugJPKH6WT424YiFAwZYpu6unuHKzZdmb5gi2JeCOQK561VPmi2dAEej0T?=
 =?iso-8859-2?Q?ONrVKXwm8mmIKnpsY2/IHeOSTpEzUfUtcJKybn+ZJOpaRsNjh5RZ3O8AcU?=
 =?iso-8859-2?Q?bgEq1EMcW7/0jM4rR1ZO0fncz/vdKG2riGgi4RpnxexB4wlLNHs30QweWV?=
 =?iso-8859-2?Q?nGDTyrP1xlKwkvSlE4ena/qHu2kCcZBK+o0CjK8SRRx7WIKMqua2Padmvo?=
 =?iso-8859-2?Q?/1qK77lNNbo/nLwXxF57HHTUAXggYsbVG6giDuoQwenT5NyMxEp3YiMMC6?=
 =?iso-8859-2?Q?wiM0xCecQmuAFPtqs/3NV1QrcgyPd0IV4PMV0e5Ad/c7LiBJU3KNyAtPlC?=
 =?iso-8859-2?Q?HuR/fqbVmx+xcpD9UvP4FAvoKqVmdsQ4JFxp4bzeo+/96+0K0wDAvC5o+U?=
 =?iso-8859-2?Q?VXDeepkOBEk7TvafG79/ckIJXT77maDs9SwlZc4kbJfyGBfB2uwPl6meov?=
 =?iso-8859-2?Q?cOwC3jSsS3cZBsFGM1v488Y9kaSMeFbXhOyD6nmNuok2+Diwbc8WeZEvZ5?=
 =?iso-8859-2?Q?iZQbi8Jqz8ovcRRQgCKOTaQEBgaHNPPjvDOXjOw6kbJAkb0WMUptjQbZxU?=
 =?iso-8859-2?Q?OjulIECEksQx+ajSgaPY01h07BmFZZXQsAJmnnSwlhRls/bEr8cxiDTVqh?=
 =?iso-8859-2?Q?ecDa2gLisXR6i+WytS/kfD45b9O1PY0eOZmxE9OsOgtc0hWtmO4BmyFNGS?=
 =?iso-8859-2?Q?Wl/3Lq4kwdXh8r/dG3vEkINdToAl8hp67MC6y2ZcFPvN4MX5T1hUk+zojV?=
 =?iso-8859-2?Q?ebyJGQhAu0Muc6ROeV66pjSTIqeT9R4bIeNUfXOEl6OuLv2A2Hm7wc4pi6?=
 =?iso-8859-2?Q?qRCwLiDyGzytR4ehu4s1RFsG5nW63AFqInvSpLvWYh9gg/ZFBCTodhBePr?=
 =?iso-8859-2?Q?0mZNv/+sWlaFLJGTP8DeM8ctHYy5ot616CE1c52Idv95+CQg/CJMdZhg1Z?=
 =?iso-8859-2?Q?mN/tqXSgoqCDZsXrnHASktFukHx8Bn6cfHc7lvMj+JImiLBY0llTAGX4jG?=
 =?iso-8859-2?Q?ZgsE0V06CETrqADD+zsz1O2Gl7h7PYNf8xDx6IWbc1YLAxg2r0tRQqOyuR?=
 =?iso-8859-2?Q?FhzI0ulbGUn0+HBALyM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab4e18ff-d2ae-404b-ffef-08db5fe0d80a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:50.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fqRIdnsqucfrCIkg2JlTaHDlFt6Ns9AW3LDaPL0mdetZGqwPwsLopKMtXfyW9BxQVyyRR9RLG4WaKBMMJ6MycYMN8M3X/VOGDk8W0rDEBVca3biLn9roiRsogBSl+TWb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: H6FBD6HI6HDBYCFPKWV5JLXKCQRLON43
X-Message-ID-Hash: H6FBD6HI6HDBYCFPKWV5JLXKCQRLON43
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6FBD6HI6HDBYCFPKWV5JLXKCQRLON43/>
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
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-compress.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index d8715db5e415..cf3cab7a648f 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -602,12 +602,15 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *=
rtd, int num)
 		return -ENOMEM;
=20
 	if (rtd->dai_link->dynamic) {
+		int playback =3D !rtd->dai_link->capture_only;
+		int capture  =3D !rtd->dai_link->playback_only;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
=20
+
 		ret =3D snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -620,9 +623,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rt=
d, int num)
=20
 		rtd->pcm =3D be_pcm;
 		rtd->fe_compr =3D 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data =3D =
rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data =3D r=
td;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
--=20
2.25.1

