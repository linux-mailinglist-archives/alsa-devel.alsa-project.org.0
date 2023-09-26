Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34A7AE5DC
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:28:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 327ACF03;
	Tue, 26 Sep 2023 08:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 327ACF03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709691;
	bh=eILXEVtZvUbFd4iagoYawmSmzRVRpgV0RPQf7ilyUGQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V9PrDU1VzqPl0guRBvRZp0cvHjRpC2GLHCjHL3ZW33XqC49gEYVfeHt2od8aI/uS4
	 +sDFE1T195t5jgUn2lkkHVgtWY2Zv/idBtsBhq4JK3SKts8GBr0JJJufSZIpXKb7Gr
	 yW8rqL98cjPwCm5kZA8KCfDBaLEkV0wIn3b/4WK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3855CF80631; Tue, 26 Sep 2023 08:23:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E2FDF80630;
	Tue, 26 Sep 2023 08:23:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE087F8060B; Tue, 26 Sep 2023 08:23:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9920F805CB
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9920F805CB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=k0rVzzmu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J67n2cYoFN6Xu4hVrpiEzvq/HNG3QRMQ10w6UTbRIo7GSM3vaglEwjZslHQ79w91xBp1S4GGklvr2HT9U4osR14NohJEnauCBp2y6cPgx3WChAyUya/0lswGhRJj/w8+/MDT2Ll1q6FJHqsGKRDkltouH0ne8+0uH31vohqL6xarSK3AHhjw35Jt2TfQXfBpza+fEFrS95A0hsuBTdk4LTy/WRcQ4ErVXCeCgeF7ba/51RFJA3IT6axU/btNeO5+pOFpK5OYvYviZWBI7ne251Y95PBMyi321q7j4Oc8gkd/hBuxBy0G9skEEPZVI5dGFfbu+vd3q2iEzCyc5bQ3mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGEw6NxrWw1LVuGw0JtTvQzF1g/BPu2nyqupaipEadA=;
 b=N+y9aOq6eLNlCywkf7FeaDm0s6NKBfhropi3pS6x5jvdvx6N3gLkjm5Jck4XmOBXpoUDBaiKh6CrHx56HWLUldUzoeeKvqhTZbFYYi7IL8sKN9oiviNeNcIrawPuK8sT8GDOigNm4QFp7tV2JZMxr8fbt4DDyjJFRKZ/u2NrsR3iQ9T+wAeYNkepanPx8EFXiHeV6UjUfLoIeAC0JE8Zqw8779JXOx0DwdccM+Ug1X69wRjyFR5Ak/CvJpOxzlH0onxYjmxmod81UIR5WKIZpmDtHkp/iUAk8L2t8wapwFv2BZV8HI1s+KF+ebZR0tHQ4tK3wUCCa+pF78njBHJ0Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGEw6NxrWw1LVuGw0JtTvQzF1g/BPu2nyqupaipEadA=;
 b=k0rVzzmuJ5T6AWQj+jxbg/+FIfLt43TtQAXQh+wK/R1ebnClackOa22pzt3oA3swSxwzpcE9+Vgd68usMzSLGqkEK1BjKC0tNO3mXp4RX0KZr3Xy79+n7IQvzwuO4TP1FG0WkFmz8XhRm1PtLEtUkYl6sQnIVf8nRc7Sllo1s9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:23:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:23:12 +0000
Message-ID: <87bkdph2r3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 27/54] ASoC: extensa: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:23:12 +0000
X-ClientProxiedBy: TY2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:404:a6::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: de3b5347-289b-4370-e158-08dbbe590fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AB9OwkAFBRhBtflubt8Owedrm8XGU0wfD5MSpevqLgQSCrirQulB9Eng9FZJWFjHX8Mfq+XbsymYnjbqjgE9/qq/aiFddzTSF+35CKnZgnddpSLAuTQPup43bxWa4YBs3XhGE+Q8OHvyhS/bkloHGTtQbjUWzj0zofjYVWEWPUT9Lgjpb3qoAGDfclvjX3C62w5uZC3pjW7ffdo1pYrhS+J+wlEMzF92GfhkPfaABJzOzV0359ootjSq29qIDT0skE729S2HSDLZY0wx/sYuRl9t5MjCvpWmGaluSPqQd3SDc8uHQysRI3UR+4ri+koA2hqWVX8i+prAouQkINwSr9zjNIVCaIgUhze2W9mW4FvJTgWWu4mRd6jw1aocGb4mCnDGl0Zz+fQYAGsmZGOo8UXp/Bga/4C3S+oNDYW4EfEIM7VzaBIIA39SvPLv7nZr49izoZFGg6qz8urDErQh5W9i0Q9w4jBjAswUIevFeNlTrd7zQn5wSjy8qs/WAs+N9V88XdzCISDHHgXAp2rsvGV5nrYUmJtnnv2hGEHNL4YAgboL+7qjT24qszM4ijaMQRdupOjVRkBp6PK70NznD8osRq2OIekqFLFjut4v4Zm8ODTNYYEaD+AMZ0ls15VUxxpNZ/1HERrB/yKTF6P+Yg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b8tAZfh48xYBoQKCxdpfgofm1hdqE3n0tywlYpDACGZe60G24u5ArI7ChtKS?=
 =?us-ascii?Q?Ny44VHD1FxAmd26mjH18J3Wv9SmaETHb91LEL9dGFuN9sdlkd/iwn0ARixpW?=
 =?us-ascii?Q?Hc1A79EJA6b/uh8Jc6dFQthnX0Lu7xjUcxKWoQOaM3rKUOLQwiMzqjf9SD8Z?=
 =?us-ascii?Q?w2kBmeDcS5HNOvyM4zGvkfjnZ80yAnuAqt76YR+qXx+/9ms5MT3wTWDZ17zB?=
 =?us-ascii?Q?sxJzXV0jN16WuHgyeqYqVc7p5jDvFVQfc5nkp+8q7wySKydr8f/BSxcgkTbn?=
 =?us-ascii?Q?HfoBNa7J3N5cQGm6AURFRcANAZtvFm6Kyd0nbp5HHzr9KonTCTGlXI2ZPDuO?=
 =?us-ascii?Q?GOPD4pBoNuPsXaoS2sjBpfwe7LBJbz+HIb/xi0G7vuuwf8aIxb6wholFZrNz?=
 =?us-ascii?Q?RqCzQvSZDlQJJXXYRKue+ET18twG+A5eeLUBJhw4C/Bl7CVihsvMFgrnj22l?=
 =?us-ascii?Q?bU4G76RzTWKFeUhLpBExPJd7IWO6hilx10x9y+/j6lwDzZFCSX4Y3Wlz6io7?=
 =?us-ascii?Q?3II8IuQqYgg9/49Zh+OS1PuMd51NNbXC8FdzsTAWx0JV9byhaiE5QzBLs6eq?=
 =?us-ascii?Q?SXkwlJhwnM3NOyer+ecPbFmBFb9rDGXsV+XsLWHfbEE9iEAAM9XgE4Z3HUKc?=
 =?us-ascii?Q?TJwY1gbgqC5hiWwIiZupFVcio0WjDAagGmQw/Wi6ezAkDiOqUUOUwpFnWAcW?=
 =?us-ascii?Q?1wRaC2uwszxDCEn0I0wYorH8NAZJAR7kLrBlRczENzwtP5dXHP1fpFLVb3yg?=
 =?us-ascii?Q?mwWlbkgZw39WKr2TTyIBoZd9w2zKTyIU96AOvMtCOUDBtI2UECYrUwiDfLeQ?=
 =?us-ascii?Q?oKd40EMMloLzkGJctNvny5ZdI0w751IUKCh1sEAsAc/WBn4b1lpMs/m5Cd/9?=
 =?us-ascii?Q?asPTSCK+o4vNlK4L7VodCAZdOESTCx+EFXR+h+pE8gxiSVxW5yPW3F3/Rmog?=
 =?us-ascii?Q?ojBCx9Bzd2p2Xw6M95KqD/2S8Gi5t8Q96tSuQpcZR1qI+IOyX5B4h/ME7VQp?=
 =?us-ascii?Q?ZUmSs6HrIq67JOkjcCrCLpSMNik314smnjgIgiMffR8K0uzZUo/SWyjbN9an?=
 =?us-ascii?Q?bt4FyU8518EmYQSb5NQDD64w6X/jr+Ot0+Wml6bKGLmFTBvaqbtWTrzVwTJU?=
 =?us-ascii?Q?sFO074HAVfFc6LCgMUTTYZz6GDM8X6GwHBkGb/wfyecr/4o8F5JGAzuQ3dVD?=
 =?us-ascii?Q?HXLHMrv08KjziYkQ0mEL4HgaTxgQ4qGej1GOObd5WorZU44gh3K8uOhuJmIz?=
 =?us-ascii?Q?bTAOIK8WMYcUExxnuqh2EIqa7rwTUE10z0FCaFp0kDVOQioNn2GxCniZMcF/?=
 =?us-ascii?Q?1VSQMFt4//dUDDtdTETb8DC4eBXmLEZVy96qePbfczGMkx7Ku/zuJjxh1ce+?=
 =?us-ascii?Q?MH79uOA68QWksJsSmBQf3/kBWf+epsRfvkV0Ff9mpVyb0bpELT7c+4P6ErQS?=
 =?us-ascii?Q?4TUILUdBOajO3aziVdXoQuFrXWDX7aZlqUwipS275wXW1Bby2TovYP82H7Rd?=
 =?us-ascii?Q?Q5WhEWCSW953yZsMBLPolffrN89MocEQhPenm5eEwR+9aqq91CNvBVEXllTQ?=
 =?us-ascii?Q?BF+GIuc89aaxUk8hI2M1QZ8DvxXP3H9JoqFkTW+Jx9rQCnjqXV3EJiiMmoYc?=
 =?us-ascii?Q?Y7XyM/yiTvkXSBblbr0GDf4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de3b5347-289b-4370-e158-08dbbe590fb0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:23:12.8653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NYunO1DUnIANKr0UwgZJaO9nZErAR+ZtzW+h/+skp+NbGvRI+2NeyOa6VGYh2V1LFdwVYp8JbBaaLUEykGs0+9L4L66PsaAAMxke5N3XVOoMZHzgQnovE5/vOCpoOqPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: 3ML5BFAOGSFGN275RUGYFQ3THJUMWGVF
X-Message-ID-Hash: 3ML5BFAOGSFGN275RUGYFQ3THJUMWGVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ML5BFAOGSFGN275RUGYFQ3THJUMWGVF/>
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
 sound/soc/xtensa/xtfpga-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 287407714af4..6e2b72d7a65d 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -369,11 +369,11 @@ static int xtfpga_pcm_open(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	void *p;
 
 	snd_soc_set_runtime_hwparams(substream, &xtfpga_pcm_hardware);
-	p = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	p = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	runtime->private_data = p;
 
 	return 0;
-- 
2.25.1

