Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C67079C9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFEB76C0;
	Thu, 18 May 2023 07:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFEB76C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388906;
	bh=qNh+IXUGN2jhil3/InRMugvwg/UrW4/O/TQo9gJOSd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KVfBR0xX7xD2TBTKtuigTRm18YYgNadHHqoAXcBlyum8UdW+D1q0gCEXBo+BFCb9J
	 jxP1mc97ngZCXgeuCYXjZAp3HMNmd2+/hOFjvorzVm5xMmDaf8FUvFyLMYJaBcoocE
	 +cpRSdB8qvegwBKs9pBjhw9v3IMZyp5AkTHvrHlA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A3D2F8057F; Thu, 18 May 2023 07:47:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7985F80567;
	Thu, 18 May 2023 07:47:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B403F80568; Thu, 18 May 2023 07:47:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2EB8F8055C
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2EB8F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hdljML4o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHgvxrg4ucIWJv977zhN27A7qmBW+5Ln+NTndldd3JGGXnlSZHkdHJEk+lDmiwMl90dQksru2gH/Nrkjk+wjCUdcJ/ZZqIhYwdgZ2I7/1eXl8LmsLvBk4iGWoSjDKUT3a1eILMksbi27LhGJvXJ15W37+WYaeWcWCaYC2BxrGfSiSix4nMaJngeKtepBpuZZOMW1BmskLRC7aDFLb3TOr8M6rRV/Fn1gA9auTaA2ICzlC6QylWrI/OySsLxFufTKJzYJRqExgA1B1IRcVp4KFjMABIhQuLgDZK6nBkJHkvXkcpMXMIQtT6AiXSXW4tr2I3nm3jMEuZpqPqcsQzKzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+RurxIIzOXr/pISTtjibgtwwDr1PTNeFrcaG3wA+6w=;
 b=H2ZnGrWUQmus1gsBLGiY2ih3MYp/4ndx8PrVLQF132aDGAauuF/ZLEka7ozrEPJGFgW1Q1+9mgMEGrsQ2dX9Kr0G/naU7JfBYX/kG70SJ2CMzPLEkpubzIf2qd0HJ1/cae1aomfOiLaF/EcMJVKBifTC5NCWVssLrdeFgN0hlbsBhDDTpEBZi3oyNeGJHJbfXN1It3dFTU9LJTem3X8coFXe5Q4LJ+9woppl9Xy2zrZpKDM/mOfv914RkQq+D4QcQAOrTMFZqnZf0XLbNJ2zJi3Xji31Df7lGWJPkayQswfSZSvSDYFKX7T/xM83O74ZtZwCAckPho1Lw+hSX3wY7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+RurxIIzOXr/pISTtjibgtwwDr1PTNeFrcaG3wA+6w=;
 b=hdljML4opl4hHiH7o4eyFxx0YqkFTBZBHGpixo+GHhNiyyIPzegx1AWUud/myOhh5ePJm3lZ+l9Ybg0p3AzQP39K7g+ATjamJG5s/oiuzK6LTitYb/KcERw7EM6NRkItGsJiIZI2bKDBc2APsdfzvt5JNCk94xIwkY9c6u8tHuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10472.jpnprd01.prod.outlook.com (2603:1096:400:2f8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:46:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:46:50 +0000
Message-ID: <87zg62p4xi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/20] ASoC: soc-pcm.c: use dai_link on
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:46:49 +0000
X-ClientProxiedBy: TYCP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb0312c-58c4-4591-9ae9-08db57634684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vvr5VhO9i/Kbp8gKEguA2E3yUXsVZI2j6/WnLdYsZs7zBEFmNoEaAAnddae+P9DEkwW5to/KBgMphcfRMeLkkj0rb+TjoCdXxnbqzZdyceQVLNMGMHA783yNTftVIr6GJtULeWIlwS7RcEbsaw2qQurRpGMpq+7ZzlXcrEFZB8HtHbupp1rgPv1nEpqMAu6ROsXvQYOF/U4Rsxls/OpjObE5vhM9u4fnFYf6794d3P+YeScsJAXH0HTHdUtDApT1t7vlNv+K6VlZB3vyV5pbrxwyyYPjXveNKhjTnYdqe93r0sECZjd9AdN/LQTFVJVFpvfB5oz303IuPsXDC+2ul1aSCpauaTwyl2B6GwGXLJUwdxseTHZZsaQY5e/r5S2qDDP+xV9ZQeEWOdX/QVanAZ8TKB4G7bPp5O/cDAkJLAJfGyhSbF7PMZ6JBHsSVCUCTb3PgjWCm1/Y9KoDOPOhqxPB/xjp3tjgz66c/g+5FqTPuLnU65898nmnZiWi0WkKQ7mO1JEan0kNFzHUYurAed0sjOKvXsFpqgAhgFGo4oFJfnB3oseQoByTISbJ5bc7exzU9Df6KE5xfQfkdGhWmxwx9hCwUyNCeN2X9ElP0vEUOdln3voJ1wo6kRt0DiB2tiYHzMmcW8qILVPBsXelog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(6486002)(52116002)(110136005)(66556008)(316002)(66476007)(4326008)(66946007)(478600001)(2616005)(36756003)(6506007)(26005)(186003)(6512007)(5660300002)(8676002)(8936002)(41300700001)(2906002)(38350700002)(38100700002)(86362001)(83380400001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1AohM7OKgsxEUFi94rEyPVRCO8sh2w5d7xqVfIBDgfsBqDYUYUyQL5otxvFx?=
 =?us-ascii?Q?s2ko4e769dYPBraKFvr79v/4CfM4aYrRoDTre4QQ3m9aKaOSp5Axw9oZuoLq?=
 =?us-ascii?Q?T6hqo0u1DbMaywZj0D6/HkYkhCLhgi32vnSauccQzP/B3NHjuWWCA2GxvqW3?=
 =?us-ascii?Q?+DkAd0yBWPci9MpwRPmusG850LI/qaTL8Mn2y19RNSlgQo54okmQUO+xjr88?=
 =?us-ascii?Q?etS0cs2lCx8gGEGVL7hCUtImHcVh8sOiVesdJfiOf9MLb5PpFSmlOFIi//oO?=
 =?us-ascii?Q?GNyq4/Aa4BLIv7p+zWN0Jac6vuafpTU12DZGy/IHBFNu32a5qPMYv4XErKaV?=
 =?us-ascii?Q?Td9AZ2XZEdp8Z5od7yGaCQyAX+qyuNb7I673XZjuw+nVDP7Cut4i6YJEHRvA?=
 =?us-ascii?Q?2ByUuAZ7OyR7ly6NFg0mK11oPemPHStzG0d7FJwOTA1pPVCHmPfTK6Gcluqg?=
 =?us-ascii?Q?m6dfSh0Ll25bjg+px9rGFkjt3s6W8LDyVJ/2mTxIXwHkplAxwH39ngAoz78f?=
 =?us-ascii?Q?BhB5YJhQkTqIQCaz+TNdnYsxoOIRM+6yXUPfxovhPq0L5dXioQ1Gn1Zk+NX2?=
 =?us-ascii?Q?Nwz2aukxqjva3i+v42nmrhcRmAonOq5BUcGNl6kn5outOhijcSqHGcYcAGYb?=
 =?us-ascii?Q?Dws1CtBPWlI4zDpDYhvdx5VDUNCfNz6O61Aqmm61n+B0LEJJzJckzWgdw3cR?=
 =?us-ascii?Q?AEpm+MdxrUIoJVHEc6V26LaDr5Ekx9jNEX6mOGNp2qdAjNieSartFROvdTP8?=
 =?us-ascii?Q?66rObHXwz9WoGnkvF1ONln80NdB9w51XE6gZOdUljb2WgvMgFgC7NBkKcmhW?=
 =?us-ascii?Q?nLunHJBpCzg1Jyxh9MO1DVxq3Uf67XEwbq3XB2tID8VfWauli1Wj8mTt86YW?=
 =?us-ascii?Q?f3srLcTDirn6j2zEST/5DO1wWs6AvmLsfIF1Exx/ICZdxyd7RgBvAWROcXGN?=
 =?us-ascii?Q?2CU0JQoFjBMLXRn8ar0lu8zmh+O+PMdMh9lq+7PDcIUxJFaOnLzrTVUsQ/Z7?=
 =?us-ascii?Q?Xx7RDxZ40XFV9l35HLM3QDRnCS1IoM1CP2f6A66i1jDbEjbiwrjtw5Md9e3k?=
 =?us-ascii?Q?6ToiNsVYVFPfAB7IrLcBndXlxq2Y6718O12ZpQcUgZbEIU9/Rm/xN5WbXtC7?=
 =?us-ascii?Q?nambFqijJa9j2lgUlMGm5H8sRy3VzblG9SZ/b+TBsSGJ4oG+hrW+aWQxDwQO?=
 =?us-ascii?Q?89uc23MjPlha5qRznOheetW9ChHvJwmOEnhujDXMu+t3H5BPjf4j1BCuh3oB?=
 =?us-ascii?Q?FX/VqsKkVvfjfnu+xkcLf3Tre0oK3DPmOXvwiXU4tFZ6xOlZSkfsWI41LbTf?=
 =?us-ascii?Q?q8ly0Al5bNvqByyxASbvWzN6EXMfHK55EpwMW6rjtrCFBk9UBP9fIv52WaYO?=
 =?us-ascii?Q?lOK6RhSG0g4JFOXYlxzj9H+8+g9PVE/iCgrmVsn9XtUTL2gNF2q91wYdTB6L?=
 =?us-ascii?Q?idVw19STnN/y50Xd58L718tASW//N0495GnrcLMJLgrJFnngkLcICzWXMzhI?=
 =?us-ascii?Q?bZ379cIsBJIrNuMheDJza7LlQKjfmr3zV9WT3NnEig5Hg7UfmqTyq7UDqYMl?=
 =?us-ascii?Q?O6ovbaruVQwnDBPFKgKtFuWbrTLbrkjPOtCIKllB7ziBgRnQHBQfcddZbNY7?=
 =?us-ascii?Q?0NH03j1+7oEZrXKxoYzngyA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8cb0312c-58c4-4591-9ae9-08db57634684
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:46:50.1072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 d6Jb6WK18IuNW+NID9WUxEvwzGQqHb9FnXrJsNMOtwZWCsVkpSCaA3ZNRvDbnf4mvT1EpS1Iei+RSY+XGrteNh6L6KNJu+gXd8Gdh6I4dIXHDCNlgDRX940LGiwluxU3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10472
Message-ID-Hash: AW2BPXEWS56XG2NINRJ6OCE37UVW3GRT
X-Message-ID-Hash: AW2BPXEWS56XG2NINRJ6OCE37UVW3GRT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AW2BPXEWS56XG2NINRJ6OCE37UVW3GRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) is using rtd->dai_link->xxx everywhere.
Because of that, 1 line is unnecessarily long and not readable.

(A)	static int soc_get_playback_capture(...)
	{
		if (rtd->dai_link->dynamic ...) {
		    ^^^^^^^^^^^^^
			...
		} else {
			int cpu_capture = rtd->dai_link->c2c_params ?
					  ^^^^^^^^^^^^^
			...
		}

		if (rtd->dai_link->playback_only) {
		    ^^^^^^^^^^^^^
			...
		}
		...
	}

This patch uses variable "dai_link" to be clear code.
Nothing changes the meanings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index fe65994485f8..db3fbe1af2ce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2731,19 +2731,20 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				    int *playback, int *capture)
 {
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
 	int i;
 
-	if (rtd->dai_link->dynamic && rtd->dai_link->num_cpus > 1) {
+	if (dai_link->dynamic && dai_link->num_cpus > 1) {
 		dev_err(rtd->dev,
 			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 		return -EINVAL;
 	}
 
-	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
+	if (dai_link->dynamic || dai_link->no_pcm) {
 		int stream;
 
-		if (rtd->dai_link->dpcm_playback) {
+		if (dai_link->dpcm_playback) {
 			stream = SNDRV_PCM_STREAM_PLAYBACK;
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -2755,11 +2756,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			if (!*playback) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support playback for stream %s\n",
-					rtd->dai_link->stream_name);
+					dai_link->stream_name);
 				return -EINVAL;
 			}
 		}
-		if (rtd->dai_link->dpcm_capture) {
+		if (dai_link->dpcm_capture) {
 			stream = SNDRV_PCM_STREAM_CAPTURE;
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -2772,7 +2773,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			if (!*capture) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support capture for stream %s\n",
-					rtd->dai_link->stream_name);
+					dai_link->stream_name);
 				return -EINVAL;
 			}
 		}
@@ -2780,15 +2781,15 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-		int cpu_capture = rtd->dai_link->c2c_params ?
+		int cpu_capture = dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback = rtd->dai_link->c2c_params ?
+		int cpu_playback = dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (rtd->dai_link->num_cpus == 1) {
+			if (dai_link->num_cpus == 1) {
 				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-			} else if (rtd->dai_link->num_cpus == rtd->dai_link->num_codecs) {
+			} else if (dai_link->num_cpus == dai_link->num_codecs) {
 				cpu_dai = asoc_rtd_to_cpu(rtd, i);
 			} else {
 				dev_err(rtd->card->dev,
@@ -2805,19 +2806,19 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		}
 	}
 
-	if (rtd->dai_link->playback_only) {
+	if (dai_link->playback_only) {
 		*playback = 1;
 		*capture = 0;
 	}
 
-	if (rtd->dai_link->capture_only) {
+	if (dai_link->capture_only) {
 		*playback = 0;
 		*capture = 1;
 	}
 
 	if (!*playback && !*capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
-			rtd->dai_link->stream_name);
+			dai_link->stream_name);
 
 		return -EINVAL;
 	}
-- 
2.25.1

