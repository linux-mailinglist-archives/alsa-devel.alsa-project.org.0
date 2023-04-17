Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D96E3CFB
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 02:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246403E8;
	Mon, 17 Apr 2023 02:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246403E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681691818;
	bh=M1wSwwL/WspWtOKyPWAAIoRPZ/EbNkDE3jMENU8zgxA=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LOxNJ3X1iBrzW4Ss9OaM5gO5pEPpDU6knULVJA4tI9XH4L1gnJByBL1rOV7uHO5je
	 uBFYtFpJfTNCdLkor3Yo0nu4wdqjxOxKlqddIPvxrchKUxHHekVZTHEisLHbSRly+Y
	 wH+wNymmKqkmnN7W8cP0nKSZmWnLtra0A1RehhJk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F15A8F80549;
	Mon, 17 Apr 2023 02:35:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CC0AF80551; Mon, 17 Apr 2023 02:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A539F8051F
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 02:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A539F8051F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OqM43wuX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQSizDZk1YeJ3yhCib7i+OPawjbV8tjZ6Oo3QGlfpvQ9k1yQW66llnAb3PXSaWfU2VgRAvt3YruLM0GuYyOyY4JQrzPVgbYHN96QKnsi9V800VjD6OA2qSxN8DA65y8bqjO05ANdTHqcaFSulgwPCq6S1hnCWPDPMQSD+ND+Y0jPcMDps+Hb2Ov5JoGJ06uj3gYSXdetTDH591zALQZd6Qoas0rsIGc2fppStnunImWRaGUx60nR5TEUpAJeRVzhq6Cp31fa3AxOVmMaE4N7vhsvElxW/DBnFYVflTK90l4zwcErvRUymg8n4xy/R2zdpwnMh4QId53IgIAuI0Yvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zU1RfcUHNiFAL2zI0ffpyDPF9l0VaQEfDvob84zYKE=;
 b=mhdgTJaiVgDMNRjXho7V4fhwefoWqvh4mXM7jZIAcEXx9MJEczasXX3ySoGs4ke3DcFBlj28MFICiMM9Iib5EF0HEw04jUwPkM6P1hkgK0qA7J6zhG99NxlQdatc+ilaz77JT4EX7f2mFhWxA/Wv6Z5J0qlfCV6EmfRnh7eoEnLN2uyqw4BLcGc/uC6j8YckEhqF6kcGGFObrxgJkOOk927XHM8m+6LkcmD6V5Jhx6rMExtbovyzwK/12TXoJnAp2eFsMkDwCbyevYJWAP9cSboYfwtSHXpd+R4F4kh1ZV3WUkfrVpMBMQcTMAS+l/049As+NWtXNz24z3YANVLCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zU1RfcUHNiFAL2zI0ffpyDPF9l0VaQEfDvob84zYKE=;
 b=OqM43wuXUqjgXfB1DycERB4uV/Z6TCV1S2YlhWKVZ9HQ+9JYhwwtb8kqW60v1fLo/QJXjYLw4j5xI1YvV9GO5ZI7r7GBdu/kTRsaIvPURlZKZBQPnzbhYHW1jBZCP9jRGL3U0IoaGhLGt9i+spMBSNUFZkj9t0v+AGT/Rd90KMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9388.jpnprd01.prod.outlook.com (2603:1096:400:1a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 00:35:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 00:35:18 +0000
Message-ID: <87h6tftkft.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 3/3] ASoC: add snd_soc_card_mutex_lock/unlock()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87leirtkh2.wl-kuninori.morimoto.gx@renesas.com>
References: <87leirtkh2.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Apr 2023 00:35:18 +0000
X-ClientProxiedBy: TYCPR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:4::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 44265dd0-4c98-492b-e6e6-08db3edb9ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YFYf6m9cSTYKh23umiOAJIhy/bYkAI1uh+tt+SFjR4XPuv/QDT6N8tm6cqzBWsMVQ8d4bdhyMw7Mu4YsGL0ZGP8aD7/kBpRzJrJNnjsa1k2qaQBPCCGAunHmTPa+e0DPoft/BmJcbUroEER4KuUi6LtbQK6SY0hMHTVN3rqFX3Bcu+cojSmZlH5c77nbEq+StAv4E+iiHPJDlQzuJAoBf7onPXjE7+SjGeg1MQorYOptjW/pucpXode20RcJgtVMZyH/6qjCD5W1fXE+EXy/pjIvVtAQRYxQydm+wZztUhoMX/sKnKBaBWmt4gF1AZ/n/r4GCcLc5DS1pJ3MVfjA0/wjV/4HZQDlU85TpuMaN+ZxM/ATg4O9Bm9DmpGDqQv1i5vMaezKVEU3WNqz96o1Yjmi4+QcZOPsa1jSigQd/6htJEV4qaon3kdIgSe1dOLHZ7dm/Wzqv0Tin72L+LqDA7YUJ4k/q42p7/aebZ2n5jw3p/zLlb1OVGbEC4MXs7uUxLXLHi71G9/HXF4ip1C3+tYN0uhJz7hMKERM1uHzQaJQa0Udy0MGscgYpzg/JyTKLmBlW1iQ+r556dy2yuZTF6au8tZZEgrmxeATJcAmg6rp81+ySH+mO/shcIer9hb2NNrw0bwJYPBNJK9GqR8m4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(451199021)(36756003)(2906002)(5660300002)(8936002)(8676002)(41300700001)(38350700002)(38100700002)(86362001)(478600001)(2616005)(6506007)(26005)(6512007)(186003)(6486002)(52116002)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(83380400001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O3FH5+v7Aby5S8OnoaoCYW2Lb0fI/eT6QVLRtel5b6XVZvJhZ8qcxMdIlrv/?=
 =?us-ascii?Q?R1B9f9VnunUUN75QhFjiBhbifFBBPEljLgBHFAAh+Ujkip8zzuQnZmlGwYXD?=
 =?us-ascii?Q?sgELj1VVyVXrtBDJofVIFPPbMe0hDwHzJSyUDOb2tJx1aLhSg3m1AidrkbB4?=
 =?us-ascii?Q?9lwv1Ule6457zvEP1Bqy5otQpdA6cJYmfwphjN8sc61dEt+afan4Rgh4ofeF?=
 =?us-ascii?Q?l+3+enIjLbvH/kkOnXEn25V2Kd+R6TIzdwFDKEo0eH1BFJdDwgXKd7lOQcI6?=
 =?us-ascii?Q?ma4Au4hVIa9x+uLfJ/8H0ZPuf7d4/huI5eI7ETxFqyAOki3SS2gvC2F1ryRr?=
 =?us-ascii?Q?4pm7vuuwfC6Q1bH1QYj7iPsNF/GRKvW+Mel2L6NvCklbjGBRcqHyBGgiqB8p?=
 =?us-ascii?Q?06zNH0hwyJLF8PApLQMofaLjdIJNQa7bJVKjQ3W4ZX+vY12YMYUODE0XBlpv?=
 =?us-ascii?Q?Gk3DujDpk5vwJy1P2GlusOC26kTm5BGdl9Xbvv5J8vJVAYLXhWRbddLNgsRM?=
 =?us-ascii?Q?AZH15sWxCVXRH8XE3ewF7erUEbneVdQGFOk3SFOtV4zowSlG+P//64AEpiQX?=
 =?us-ascii?Q?j7PFpwtRoMxR0AlheYRnl0D+IB/qJttrChWQZQXcVpXOgg4QcdNS8495aL5u?=
 =?us-ascii?Q?0GZ4ImOTMijt4SZzFrGPGMscGOgXg8lJlqND6236S79ZG7QguQGayFc+D07h?=
 =?us-ascii?Q?xDKxh1KMsPm+Le49UmWGv/ZJjZXDvT71QoeUSCpkF3kAGlULRnojLkJra1ME?=
 =?us-ascii?Q?/XEgMlzMSBrhmrCfLdCcFhoIGb60srRc9jBE7hwJoa9RL+htLXCYk7rpG/KW?=
 =?us-ascii?Q?3KQ162vEo7BSoV4IlPmezSX6ViNi4GB3Uc3Ak9YBMJnZ/zi9fAwFfWDzSldo?=
 =?us-ascii?Q?MblhKIUITkZq1njGj+KbecZnlE9ujUqR5AvF5rNd2qMbkeKAwoVRYJyW1qk5?=
 =?us-ascii?Q?Ldf9KRDbhk1msxd668ObY/VonC9faRTLW2WqX/EHwQvwV0Kj4NLNEGFA3bdm?=
 =?us-ascii?Q?EDQ6+Tz8PqDZdLSzIoEIQPi6rTiGQPqvxEwdCkWrRxDSYAWOgw8jVMSUQkeh?=
 =?us-ascii?Q?nBvCLG0kEZ2OPVcj3kzAzdFuLTij5Vzfp/SULdUzRRNx57UkCwAq0lFdypJc?=
 =?us-ascii?Q?tq+99OP0QLHxr3PbdMNarOe/ycWv7Hqz/+MME7Yu3XSUl4ovDKJ8TJmy3T8r?=
 =?us-ascii?Q?3wmW+TR65pRak6AXFqQKg1KTLPP7VTxVnH6LrN5Vr6Lud0yrnmvZyu+bpW9v?=
 =?us-ascii?Q?efmlPypit/fJ57xoZ49NM1XwGwNP2dCByemcwi3YIXF7Gp10xQEgtD9lFI4p?=
 =?us-ascii?Q?hy8S2We4F95WuR+YBPj7jZjQx8b3gZKVMYgiTHG4tECPWYVnBX/Ujl/yX9Uw?=
 =?us-ascii?Q?DZvEHafPGFn9F+a4WJc6vRhVrnuUgqvKoYvZsWPNpFyVbWFlBIsvkwIX0ptw?=
 =?us-ascii?Q?dSkMzuzx2aa3YFCP2Nq9tACWYnvxAIrQQ2fO4mz1PGPLjB6jkL3QgODVVSsR?=
 =?us-ascii?Q?mMF/1uR1IOlvejnNnLM3pPuJy+7Bw4Vqm928NBokuTUWCF0v4I60QMDhT9RS?=
 =?us-ascii?Q?NPqw5A+WevmcGnoblsXzecsvgGA4bQtU4baP/6gG9vJ2ftoU8XuaJUecoKI9?=
 =?us-ascii?Q?nCzhpZWTyMj11OT0CtnSnls=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44265dd0-4c98-492b-e6e6-08db3edb9ec7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 00:35:18.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GLTrWA1/svfeVMRDq4jyC+6EN3YOkzaqJofdRGlxTKMdq206aU0IlZQ+qhcTy2waM7wAKLou5+NTCMz0/B4I4l07KkGmOggDnwsB1RGRYBn8BelFJ+cfucbWxrUj10Pe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9388
Message-ID-Hash: 2EWAZQWWTZDD6ZCM3DIHCGK7AZGX7NGQ
X-Message-ID-Hash: 2EWAZQWWTZDD6ZCM3DIHCGK7AZGX7NGQ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EWAZQWWTZDD6ZCM3DIHCGK7AZGX7NGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC need to use card->mutex with _INIT or _RUNTIME,
but there is no helper function for it.

This patch adds its helper function and use it.

Because people might misunderstand that _init() is mutex initialization,
this patch renames _INIT to _ROOT and adds new
snd_soc_card_mutex_lock_root() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-card.h | 17 ++++++++++++++++-
 sound/soc/soc-compress.c | 18 +++++++++---------
 sound/soc/soc-core.c     |  4 ++--
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
index 9d31a5c0db33..fc94dfb0021f 100644
--- a/include/sound/soc-card.h
+++ b/include/sound/soc-card.h
@@ -9,10 +9,25 @@
 #define __SOC_CARD_H
 
 enum snd_soc_card_subclass {
-	SND_SOC_CARD_CLASS_INIT		= 0,
+	SND_SOC_CARD_CLASS_ROOT		= 0,
 	SND_SOC_CARD_CLASS_RUNTIME	= 1,
 };
 
+static inline void snd_soc_card_mutex_lock_root(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_ROOT);
+}
+
+static inline void snd_soc_card_mutex_lock(struct snd_soc_card *card)
+{
+	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+}
+
+static inline void snd_soc_card_mutex_unlock(struct snd_soc_card *card)
+{
+	mutex_unlock(&card->mutex);
+}
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name);
 int snd_soc_card_jack_new(struct snd_soc_card *card, const char *id, int type,
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 661e9d70994f..d8715db5e415 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -140,7 +140,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	ret = dpcm_path_get(fe, stream, &list);
 	if (ret < 0)
@@ -184,7 +184,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	snd_soc_runtime_activate(fe, stream);
 	snd_soc_dpcm_mutex_unlock(fe);
 
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 
 	return 0;
 
@@ -196,7 +196,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	dpcm_path_put(&list);
 be_err:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
 
@@ -207,7 +207,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 	struct snd_soc_dpcm *dpcm;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	snd_soc_dpcm_mutex_lock(fe);
 	snd_soc_runtime_deactivate(fe, stream);
@@ -237,7 +237,7 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 
 	snd_soc_dai_compr_shutdown(cpu_dai, cstream, 0);
 
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return 0;
 }
 
@@ -284,7 +284,7 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 	    cmd == SND_COMPR_TRIGGER_DRAIN)
 		return snd_soc_component_compr_trigger(cstream, cmd);
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
 	if (ret < 0)
@@ -315,7 +315,7 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 
 out:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
 
@@ -373,7 +373,7 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 	int ret;
 
-	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+	snd_soc_card_mutex_lock(fe->card);
 
 	/*
 	 * Create an empty hw_params for the BE as the machine driver must
@@ -411,7 +411,7 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 
 out:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
-	mutex_unlock(&fe->card->mutex);
+	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4594505cdae2..b48efc3a08d2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1938,7 +1938,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	int ret;
 
 	mutex_lock(&client_mutex);
-	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
+	snd_soc_card_mutex_lock_root(card);
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
@@ -2093,7 +2093,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 	if (ret < 0)
 		soc_cleanup_card_resources(card);
 
-	mutex_unlock(&card->mutex);
+	snd_soc_card_mutex_unlock(card);
 	mutex_unlock(&client_mutex);
 
 	return ret;
-- 
2.25.1

