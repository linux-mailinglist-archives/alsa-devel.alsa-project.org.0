Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543EC79B45E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A73EE7;
	Tue, 12 Sep 2023 02:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A73EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476906;
	bh=8qhIa3YDBD2UvB3YxxctSyPr/hto2nqLpUe4JVCc1hs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j2QBBNEgCsTgQpf9jqVewE4a5yTLYQfuMtyThw+g5h1ygDGpvbI2+FEKRrzM2Sq14
	 3/9s5Xz3gFVKQKhuC65Eks9TsMN+6ED9pix89GLGSgEdarXaTkiKShblwHxInos02a
	 UM2JgYWjTUuwneA9HRca4VI4fXQRVvgzEWD8ywPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 226A0F80752; Tue, 12 Sep 2023 01:53:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17450F80602;
	Tue, 12 Sep 2023 01:53:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E9D3F80537; Tue, 12 Sep 2023 01:53:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AD81F8058C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD81F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GkqtB6ag
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IW4ZzTYEM7jT7HxNL5rKHfHDoXePyW8qq8PLc00nfm5lqwLhJVKCIq+4mBXSmASpN5hGMvs7CCD+OK4uBeyziGpAlLLx5+yq5FadRI+XTzxOHRm0tJCx7KFlWXdmwKUSx7HGpHXDCPmx/3pFt3ypbSGfR3JoJRVVC4rwY2WpmjiyKOOd2anPTHmozUG7EIqPQezwLzQSHSlbC2wielTnqQM7C0KYRw4nT/dsnso/8xB9IpmWCCGip9308bm89oifyBj+ul3t0MdnZFpG90AONccahUDVi/wq5HZumttwWcUMVcdRqSIBZ2PhYEmG5rgJQE+PzkWQoInKOA/xZzW0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/5m3a2GhxtUUvs/Ysbuv/V2smIJWfUb6hVJj/Sp+zY=;
 b=Q9Z1YG1DLlCAoIYtqdwS2LQepXYobqrC03r259BHqR8Iu+lLDvb2/Mie6jQfaJWqY3FCBVcRguCpneAFCCrmmXoyv980HuPa5W9gU5emeiL7I/CYbvnjDG9jug9eMHCAXCIpLgOwPz1Dfvm2J0h7Kxw9t0SQ+jaBDBLirJTr9mS8Oy6PE+cgs4wjf7ByaNu+6mTwIfImxfTAq4Hgu8r3VOr4N47Ceol8lOfhIUqAhas1egSEn9A6Ya44rkhgPnxMtdByA5BddK2IkuTmiSB0V188447wzMeAX1j/FqxHVbYXfUIcpconv33k4vnP0/mzO6MO+s8IYY/X9Aa2j0fmJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/5m3a2GhxtUUvs/Ysbuv/V2smIJWfUb6hVJj/Sp+zY=;
 b=GkqtB6agA35cAp6Dg1MrTiRHYwox826q/fJtaU66DTH/Lg3PUSPYXgn+8x40sxpP7hnxtUi9QwnDXrquils66RitWBcvwaCDZjFYkqCd3dwe9fDcPNv+qP/QaiNfVv/WokuQyl54rswlbGeC6caQYEvt058PJXilkdb6Bf4OCnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:51:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:51:52 +0000
Message-ID: <87ledcp8tk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 47/54] ASoC: soc-dapm: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:51:51 +0000
X-ClientProxiedBy: TY2PR0101CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 154e5e84-b1c6-4fa4-8c4f-08dbb3221252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v9K/edQ25A0QL3wE8hBCdzhqEZ80icYmGiJB72LEgNO+CxElWqaOACL1mPccQ69Arxf718nuNuEPX+jux/XYMcqNRcDtWSFNxD82TyZESvVVIiLmZNfsTI4pMGDHZYMjZ1qGfS2mSIDACyWY7UCr10G4J+pLxUBvmF7Boxyyxl4WQ7ubSjDdeziR2ws7GgJjGbO0lsShmWHFr7w4SRua4Hq2nJFLWq9zwhokjUaaQ2UJX7C7C8CMVrQoKI9cpUqwXJh5rdaUx3I5PtetlsBi1T/O2K07Cif/gtKMz3VHdu3eQNad3d9+A+FhsC/3HfSUXgeW+BnkDN+OmocmMdq4U8dAAVT4NXUaMR5KxqLECidjBQGUoXT7pmZbvyqosGncBbwypxJ9MrqhyG4uGtICPr56bdfX3Ob94gh4NhS6OC8ydGYeXCe47tNtzecu8mG6GNxw4sVKRpd/tFD/rErjrM+zSv274bdojgNE9J03jPibFLWL+8tx4OcYjySvQWmUrkHnhFX7A/XciHHXrAJxDWKVAZaFWvwIxqzxvuSH0rFNWLzcI8KDY5XSaP6zeKE8a14+idgQ9VNPcqZaPuQxyegmATG5J/d9MnPtM+7BSNcZlT49/rBinA4v+VEtAQetxW4tzFwKEelK4urdIFp3vA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rykR/7wax9V6zMphDqVcZuMe1U7gQufhGrhbSDf2YZgNdBg6kq2JYwZnP0UK?=
 =?us-ascii?Q?sNiDHuUCu1sA20cCSeJ1kuUuBD5zvaQ4disLDOqExLqhvovc3ZJ/2ZiZHbG0?=
 =?us-ascii?Q?QHOnMK4hkdaTstMDRgo78LPljV7vs5qu963Q2zQORBWu0qrfQFEXj+6eo8w9?=
 =?us-ascii?Q?pTBrpKAOMyChwqnjAgf05o651bMF8lI5znxNtzcIHxNzGMHEvtN8WNZd26C/?=
 =?us-ascii?Q?lN7vlBK7aJKvjmmkCwAk6+CFTC5Ma/pe5FG8UqRgz6GM72dSaEHNTE+6DH7G?=
 =?us-ascii?Q?VxwZE7jy+/H3IUJHJsD/rK+tLPMM/XoF9qATMLfnB6lJ6LxFWhIGcE7e1DQB?=
 =?us-ascii?Q?EFuBi2UWA4eeOmx9Nc+ShKEAIh+tIjt81aIRCtWE8RjlDkZ39/B/2/5alBXO?=
 =?us-ascii?Q?4udQZDgJ33FoUtbGlPpvUOqMgaPUQEdy7u3fISA8mxPj8qKN1EPWZ3t06fl5?=
 =?us-ascii?Q?aUIvk5H+Td9noJAbagfUzoW730m88sb/sTjD7FtRhwe+cmpASEvRWnt2hdLe?=
 =?us-ascii?Q?I4ywlKdQqRm6g/JL0Y6YcF9hJfYF7ndtO+Xo4kLue0Hu9g3x8yMbv8efJ9qC?=
 =?us-ascii?Q?RJR7hPoxS3BJyPmCpXABhtS4a9HZpVvzoVazE96oTkmb4p9YlSKl/ZlsHf7u?=
 =?us-ascii?Q?oVRhvU4TE6s1uuBxQP6LogRa8f8VX/ox3Yh1dEghUswCEtk3e8OxqvhZ1y4j?=
 =?us-ascii?Q?HXcheQb4/jHwMQGc1Pr2hZHPm2ftIUJ1QqbMTGCzlRGq0MHSHIk3RKmu2Tym?=
 =?us-ascii?Q?aN5WTyt7OYFy2zuwBY3kIQd/5lSnf5LpUPjLeDc7nIMxcwjE9AOJBdLKQ/d3?=
 =?us-ascii?Q?ykE7R33xPmeDJKqxnGXdT+1dJgY7GUm/y6e3y6iW0D53ass030d0a8+Mt5ws?=
 =?us-ascii?Q?784JFeftdrLYlGp9MTctCff8hTtvDIH0Vz/AVO3ZiCpPIGmQDTUYOpbzYtjK?=
 =?us-ascii?Q?YytzsBg6x2a3oMM27ishXlIR+sstI5MpTmXypYcM1fDNeqVLD6SG7xin1nUf?=
 =?us-ascii?Q?Xei+nk88MAWjXKOCnLIgk+6brHfXGUWdXbTJKSg2xvTwJoI4Lxav4bkeQRjv?=
 =?us-ascii?Q?iRg/ZVwxLgT+nxFUZZmJzIetqMlv0Cozdm56JAXw3NiwB0UjKcBN2nsfsrcS?=
 =?us-ascii?Q?D3rjSQIchl3s1KkAOXYieqHdL2KSJRoxHhRIZYBhx4S80kKKC3YqLhhdN/ea?=
 =?us-ascii?Q?IPnh055t/Z1R9tchns22iDuJ++hkLksW9uLxsHYHEqgaW8M4Wyf/6+bgnqik?=
 =?us-ascii?Q?ir10dlYVRfcSb7HlcRZKUtzayzR+LgUUGyPsxJt2opiiPoxEfU8I3EdXhfMQ?=
 =?us-ascii?Q?GCSjJlx2olRBMDoznToNbo8mC0QM+JIFr3bhRojZPCwYRHcSNdRyJXugo3J7?=
 =?us-ascii?Q?WhBS/SnWBeaExGRZ7LywwCHDPCeaLzBDW8KJUcStd1CCj1mRUM3kOV3OlLfN?=
 =?us-ascii?Q?CDBgB0aSu+nffx0sxafH8Z3/nKSDxPX4gvQnpB26rI+xpH+G8hL7gVm4jSxw?=
 =?us-ascii?Q?CPZ7Lbs5nBFT84Ee19xvhgoruq0qSALWJrgaylBT3xjfHWNoLjO5Be5NttWn?=
 =?us-ascii?Q?WKLRhK4EneTx1n951lf9lZhL/HNOobkA3r2G7Sv4Zc0MrllC80uy4GTJYe+L?=
 =?us-ascii?Q?h3/GWlv18BienWmbnn7FC1Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 154e5e84-b1c6-4fa4-8c4f-08dbb3221252
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:51:52.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XnhEcFR5w0XlmKABmTNbIN18cCyHze7lkdp1dTLzbHQWMVnWzuuRrtOQcCItpzp0Iv6NJgXOU/DqT1FF/jLR9ZZwzwVwRcOX1GIIt7bL7bm8Ev66C9bt5A67r3M/OyWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: BBL2XQWBO276GZZQ4EXPOACJK3H7KV6W
X-Message-ID-Hash: BBL2XQWBO276GZZQ4EXPOACJK3H7KV6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBL2XQWBO276GZZQ4EXPOACJK3H7KV6W/>
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
 sound/soc/soc-dapm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f07e836783737..2512aadf95f71 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2717,7 +2717,7 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	snd_soc_dapm_mutex_lock(rtd->card);
@@ -3822,7 +3822,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_hw_params *params = NULL;
 	const struct snd_soc_pcm_stream *config = NULL;
 	struct snd_pcm_runtime *runtime = NULL;
@@ -4142,7 +4142,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 		     struct snd_pcm_substream *substream,
 		     char *id)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
 	const struct snd_kcontrol_new *kcontrol_news;
@@ -4441,11 +4441,11 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->num_cpus == 1) {
 			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, 0));
+						      snd_soc_rtd_to_cpu(rtd, 0));
 		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
 			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, i));
+						      snd_soc_rtd_to_cpu(rtd, i));
 		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
 			int cpu_id;
 
@@ -4465,7 +4465,7 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 					continue;
 				}
 				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      asoc_rtd_to_cpu(rtd, cpu_id));
+						      snd_soc_rtd_to_cpu(rtd, cpu_id));
 			}
 		} else {
 			dev_err(card->dev,
-- 
2.25.1

