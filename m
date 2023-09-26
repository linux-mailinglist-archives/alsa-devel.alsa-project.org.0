Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386917AE608
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50DC9EAF;
	Tue, 26 Sep 2023 08:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50DC9EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710141;
	bh=g/uRo5pX6xLe9PGc46O2MfVNhRpMUwI72fGmoja1NrM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SHQdw0WJiKTgyQ6WL8QSE2EKxHWd/eV8rBUiOMEuxAkydtuzqvRZQz9EMOgmOykSK
	 HWxykgvyCXi7uG2DddjBHm55xtqcwFNMeZPAPKJGMMeD7uQTqV9sy3RjPl8IZ8PuoD
	 zFzsr7auW4JDkynuv3lWwk/FDe71VdQf0HoUutck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E40DF80760; Tue, 26 Sep 2023 08:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B1B8F805BB;
	Tue, 26 Sep 2023 08:26:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6634F8075B; Tue, 26 Sep 2023 08:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9362F805AD
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9362F805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mOtJIvHL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbTJqbRz86hg1pXr7OrOTwqlhrCnYfv4r2ln87j9E9G132Fw26vb4aIqDBndQyVMcFd4+IChwLmcr5Qd1x4V+fRJ6uAdMTZGF5xTe0Gqsq67JatQGuKe7h79lYpKB3VYJCB/gFfZaOcpQ0t0uXnUxKH4ldkrCPNYNPCDexHBuLAjLAx+lw+pwzS3TFldyu7BxqsgFX1Do+FvniTKTdXmgl5CxJ2E1ISBM0rwFIp60YN+u4sf48ialcRDxc0yaoGWjG1tnWlEWmDVTx3tmG96Jtr+BBOnuAwsxh4+ST3DTsIJeOVR5TqsWzpL0FQz6u6AfGxxFGU6YFelKnzvIPPMjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPTSuWywHW/fgQwhMlw9knhno4Pex0N9j7jBjLFbxwg=;
 b=myOyj4d0JIdsQCUYhxdfP0AWAvqQS2hjoSBUz4l3k2NOji9k3R6NO5d9ugfR0Z1c/Pj6darHhvfvhAXSa6AN2UvZbO/CsTVAl+Nm+qtdvBw5t+L9erYyxRU7KIhE5b3q7lzjL8Pi/oznio54GCUOniwKAByJAMIHDdP4GvTRBIeuKSt+8b5LQ6U+FazhD76RMtXj5rFOPFV823FBAWZ4U/tajmswXX7r97zFsd6zabGXcOhwfJcoG1Re22V4hV6/TytizZO4E0RA1qWet8fP2MaGnlyeLV0q81W26a3e7lFuOJca7Ti1vUErz1zTGmZsEanYk2+kaKt5pWEu9RA7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPTSuWywHW/fgQwhMlw9knhno4Pex0N9j7jBjLFbxwg=;
 b=mOtJIvHLwEe2RH6QXwFxgmRrE+X1w1iEJWyEDs7LfZGeI08Q9llTPGtZETMTLvTKW5oQ4EVoZH6q2uk4zrgKTI38EtXoYq5OS1QhfM+EqdXw862t0E+vfUHiJV2qlceXx4G7b6+9/2kVSN3wyWlJEBOTEIZVe2Wl5VfEJ3XA/BE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:48 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:48 +0000
Message-ID: <87cyy5fo0o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 51/54] ASoC: soc-compress: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:48 +0000
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: eb546f04-424e-43a3-1c25-08dbbe59903f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fZW5N4s9XmApBs9SijHK72PlTWO1tQuXVHdWOO4tTYBmWlCD3VM7PMZQ1bhmGQ5DOIqSzi9+iJZnkZ7pOuiC3eBM8ekXUZEKVKooZL7+sfGqm1YGg6pyseT7z5ScAKfTjJTLY7isPaHf/yhrnXIrvz2pmXzS2VJ0X1Qjk86MdTiH/awaVsETPZDTX9Ic/LPnH9u5sYQtfS0sVPqlfjW7aYE6US3EfJ9bGMiWdoS7O38ZUVCe7U9TaacWPVa6jm210UCAyWFrSu0kZh+wme2G/ewMslRTPsntKwepkfPxn80EfALpmcvzAIIR2LmAjIWaR4IyvGrHPWCvoKJZ1r6R+y1Hi7WjIecXEe8gdixs90nvBrcjGSrbBbfvK5lYvh/cqIfqiUcpPr/1mECkFI0QQvaD7Fdldzl6XXiLZ9A2Blku97OMCa+vtGzTKyWZgpKtjICBvUedqzfpnewK6zHfWQMa+/zK7v63JjrIUnoczpXnbGswEXVeu+vmpDxm9IDwikz5YYG7F9mWyyrmm+4GqJuShtxXQhof09DjZN+VUtE2E8Kgebibi3FRa8q91KaUhWLQgzF9RFatgO9EnVBbWdiqHrC1rD5YnazgxdeA05/sN8fKP+oCvmVDw30j2dUDZJTMzoUrT08Bk3BOh5aVQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wR0z/r8dioPPAbCvBwsrXa8IAUeCG8pEPysxgO/Nxe9KR5QLmB8qoFEHH42P?=
 =?us-ascii?Q?XZO84O9v45iWgsY1VzW+o753yxJ8wioy+rAhLOZdr9eGJ7S05wokxFlzMweI?=
 =?us-ascii?Q?+t7drrAsnxqaE48pmpv4yLSJmBD8+Agrf6E+M1jmgmOSb0gQBuVMmJwsOMuH?=
 =?us-ascii?Q?kLOojz9FUNA8PLznWNi30MyCYq8kXiJ/QkBfHH6+W179Yz7m/pMlFgbkxZcq?=
 =?us-ascii?Q?RPktCoY7OrPoVrFlliZXW8h2Xuf54tN8ztO6+mAFduenwVg5q7gYubJgEQ9K?=
 =?us-ascii?Q?VMoqclX4L7kYn9IR4XHcpD5dwBVfaLk0tc3qJryrBE8uOcMs77kL1GB3VfVA?=
 =?us-ascii?Q?aNOe272yhZi5KxJSUFblMFIaTSXU5NJ6hZc/sCI6C3YZw8QQg6wvzdNISrKt?=
 =?us-ascii?Q?gl1r90diU6ucT52f6kBFJsoeLDZIv4RF1Iu8Ujjdh/I9xxLJSKkRLhLCTkQa?=
 =?us-ascii?Q?vrPwm7iqcyFP6dsRetuqP57z6LAMRvzlIzoKg7mIOPajy2gxHbYhrLZY+Xf5?=
 =?us-ascii?Q?qvZOIxrM26NEqcJuth/zF3ci3tM7btaPuFI7z/ITWPojqlPI46CF7Vs9kGjZ?=
 =?us-ascii?Q?k7orWfjWkcwH54g5KG31Opys911jHoctHcZmWzY42vvmvLEt+dC2FtQ9Dz/G?=
 =?us-ascii?Q?9uyMaoh6+lfSpgNv61qxlZUL2iDitrQwLCmISEgM8H0UV1vZvioNz9xb0Jsf?=
 =?us-ascii?Q?w5Ru9AUIujC5OOBmcR8tFmxWgFkkj62XrKKVEZTFSR+09Vev1Bre58vR1N2y?=
 =?us-ascii?Q?Hsx//CcqyhLY70yTvfBpD439Bs6/rE5YtkLeKRcP18a/gohssONc/FhQ6k4l?=
 =?us-ascii?Q?2a10oVINUwTO9fl/+EcqJpQLtIoxh0kQAqENrOwTFp7bkTrSMP5K4mJDXbTJ?=
 =?us-ascii?Q?q8Gr6Dxh0dUZcX9+nU4G1+YrgRi5gMidUesZtqp4RMQYnATunPAtQHc8/FjB?=
 =?us-ascii?Q?JX2GhTtnRM66uhUTQhq+JK+fjg5I8nLSiP4GoaXc9qsjovvzf6uyUYkHt4xp?=
 =?us-ascii?Q?bxrfffK8Bq8nitBM5J4D8RbYRejuHCqfGrG2ENcrDv5o254cGC3qpNPmL0O9?=
 =?us-ascii?Q?RTlLjvhuxrPVwZ0cydQIqqhuRXm74o5PzFLVL+8S63+LLfli1zTOsXYCsruS?=
 =?us-ascii?Q?zOFNtqYa6B+RQ228MoC2JvG7gdpKUxbJkbncb2DHOiihbNqz1dcp8Ujk94co?=
 =?us-ascii?Q?+UTDlkrR7fxO1ehgBrByjOJOjzt+IRj+CEXKbsy0Jl7szl47q1j6RSF63WGO?=
 =?us-ascii?Q?thQwZf5UxyL8kwwRSZmCmsuFbICzsgD86lMB9dx743jNj6WWKEvM2ObjHZ6u?=
 =?us-ascii?Q?ugpCqll3bdCEpvuDiUa6Ie72/BpIi8FRZKdq10mI5B6bApC2bohUoPfQ4NH5?=
 =?us-ascii?Q?jOdDHHHuJRW2sRUPUAcI7F2hTOMydYBvmTeHiyPQk/OKmmFqFVPTZk9X809C?=
 =?us-ascii?Q?Ky0eKmMFVszPVy5/clO1qZVIytaOK7/j1HX+/Cxh48nSdvqKhqjyatQRHmCC?=
 =?us-ascii?Q?1eRHXw9GvhE4aKqmlgMKaQ2C2qEcDrl7VUel4gmEoijzfTe9Ui+4zVqdS7Jk?=
 =?us-ascii?Q?Y3IcBFWE2VB7dd99SVYYMCbqEAtssjNSSaWGruoxikSB1rCPBJjKR0pFwODK?=
 =?us-ascii?Q?38SoFOm6n5Xw0AxPJeu+ghA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eb546f04-424e-43a3-1c25-08dbbe59903f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:48.5197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +qwYPPdnnHaa0X7hiagwdmX7S1fZclA2e7RdhAV4w+g5uih396m4UFr3Nl8AQ/pn00FvmenWWntvb5cBzYLl0W3cmRDvvJRRR+MKwIQ6SRqMc3qqamEsSZzKsrmxrnHQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: ZPPHMMPVY2LFT7EC5B2WP2ICQNO3KK3J
X-Message-ID-Hash: ZPPHMMPVY2LFT7EC5B2WP2ICQNO3KK3J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPPHMMPVY2LFT7EC5B2WP2ICQNO3KK3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Acked-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-compress.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index b58921e7921f..a38fee48ee00 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -57,8 +57,8 @@ static void snd_soc_compr_components_free(struct snd_compr_stream *cstream,
 static int soc_compr_clean(struct snd_compr_stream *cstream, int rollback)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -98,7 +98,7 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 static int soc_compr_open(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
@@ -133,7 +133,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	struct snd_soc_dpcm *dpcm;
 	struct snd_soc_dapm_widget_list *list;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
@@ -203,7 +203,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	struct snd_soc_dpcm *dpcm;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
@@ -244,8 +244,8 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
@@ -276,7 +276,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 {
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
@@ -323,7 +323,7 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 				struct snd_compr_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
@@ -369,7 +369,7 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	struct snd_soc_pcm_runtime *fe = cstream->private_data;
 	struct snd_pcm_substream *fe_substream =
 		 fe->pcm->streams[cstream->direction].substream;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(fe, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
@@ -419,7 +419,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 				struct snd_codec *params)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret = 0;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -437,7 +437,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	snd_soc_dpcm_mutex_lock(rtd);
@@ -457,7 +457,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	int ret;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	snd_soc_dpcm_mutex_lock(rtd);
 
@@ -475,7 +475,7 @@ static int soc_compr_set_metadata(struct snd_compr_stream *cstream,
 				  struct snd_compr_metadata *metadata)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_compr_set_metadata(cpu_dai, cstream, metadata);
@@ -489,7 +489,7 @@ static int soc_compr_get_metadata(struct snd_compr_stream *cstream,
 				  struct snd_compr_metadata *metadata)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_compr_get_metadata(cpu_dai, cstream, metadata);
@@ -540,8 +540,8 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
 int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 {
 	struct snd_soc_component *component;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_compr *compr;
 	struct snd_pcm *be_pcm;
 	char new_name[64];
@@ -644,7 +644,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	ret = snd_compress_new(rtd->card->snd_card, num, direction,
 				new_name, compr);
 	if (ret < 0) {
-		component = asoc_rtd_to_codec(rtd, 0)->component;
+		component = snd_soc_rtd_to_codec(rtd, 0)->component;
 		dev_err(component->dev,
 			"Compress ASoC: can't create compress for codec %s: %d\n",
 			component->name, ret);
-- 
2.25.1

