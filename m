Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F979B4DA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C234ECF;
	Tue, 12 Sep 2023 02:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C234ECF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476957;
	bh=B3vaj7x6s1LGHUQAAGuT9bupaFbLRSu6tJ0rlUQO4So=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WgFAwZkHeQ68gD+M1bNI8DylfVRDGDV1F+mw+PmlYjb4+BB0V033ZuPMTNuOBP+ib
	 bZ8omZKS+/XD4RSaGUoYKmRTPiFdKey+4QEtyE2kv+TQYEpyCpCh5unNnu38D1vLYw
	 AXJYs5LrWBBC9tBH7A9iIST7CK1TyZcwAMHolbRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A0B7F8076F; Tue, 12 Sep 2023 01:53:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E44F80640;
	Tue, 12 Sep 2023 01:53:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 678E8F806B3; Tue, 12 Sep 2023 01:53:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92AD3F80571
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92AD3F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=l98lMJEp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aq2Y0MmvAqDfrnnSHmL7H69LFT6AyEBYpv5oFqJDAYS/3WwOYhPm08lJSrijuhn8woZhCExR9yAGTcrUYDQyrxH1XcfpN/cFkc7xD7l/Tyd4fIFYndClW4Yp/cO73GxEwnZ9qllWiSmqeNkoG0Hf2Zni0ul+uq7cD8iVsq/7bfhSQcnSI4e87Re82Aoy7wOWLp5GSfpW7bHPbto7MAnOxAeZJICaXpJvQjfz0dIiSGJQjKsWBYWMO10UEIYHrYgP05FcOqxTqHtjUvzEGQ/ZcPWsCYiEPDbmC9IPqqA/k22Fg36hYr0OTOppEl33lPEXHLo9jW9gKqanB+NHrD2Qjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFsjml5ydfuCV6u9ynnGe+0XkRaAfrGPICqu8Qzx0Ic=;
 b=VYrDH7EOiqRqsYiAs37PSVeDYJIVPmFKVV8k3pZHDIjms0meVC1ly3AMsU5aGQvoNcCrT72h2jY6tv2XWhxK4bi9vReA6epWxwqvVxZ6qcJxSZV98gDA4t/bwWvzqeNjIME8wVaJCdFHG/0gEX2BiPbAugp0VkL2Pz5MW5toADKQ7Gq5iBACXDkOZqKuPq4r2Vq4RtH+WiwlaBiew7KpjJpWF2V36uHYZ/xOjxYzfUC1bosKD7F0PVL7rDJPAqlfe/cC1kvvpzBCEUoBm0XqEaOcQFOPAtuUSNVL9GevraQpx8KUB8wwv2AaXETf/uiAaBmrBqj242k5ZMyK/ezg4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFsjml5ydfuCV6u9ynnGe+0XkRaAfrGPICqu8Qzx0Ic=;
 b=l98lMJEpYn/XGFSVq1xrnR4Ws4YVPCwo16j2I7sVmXtl2encWGjbOiCirWgFcamPhTexw/ubKipzIowBvbHkCmoxYALMVW2pNsoL28v/ItVnY9Tuzfx/J2ZLI3ofD8kLx/4O4D/Vj1vnEUnjiI9XCWRQC3lRfmIKVzJDcQfhjr0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5990.jpnprd01.prod.outlook.com (2603:1096:604:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:52:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:52:13 +0000
Message-ID: <87fs3kp8sz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 51/54] ASoC: soc-compress: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:52:13 +0000
X-ClientProxiedBy: TYCP301CA0006.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e3ca3c2-3fe3-4a8e-603e-08dbb3221f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a9uuKpYHi7dTWXmTUkoyiEaJUqTXAy+BAGndFPHAnUzfV54nainb0yowbvtC5EA4zJIP2ti+igcq6tKLLH/v+qVWQUW6gqALQWOJ7W94ZLfMTZKQEcMOoj9eiyw3UFAMkueOp+XD6JE0TQaEOgG3xXy0d8DdPlXW34vxMmIpkiUiMB+4eD5c7ZaqbOAOR3xIQAycV6RzbVNHi1NO1dbEZ/eTqNWh/AsFa1cIVrj4dWzh029Cder7QPy7S9OVXkhcdjEiTTGs81CaeeMiTCFwqx7Y0/zTJotf8owVe42drRgXDsLemMwRjctTPIlPn/50rWPjVrrHhsB90n81vozSzfKunviMyEDhJkI8CK+pctSFHKLZKmmXamP5EkttLamhKvcVLnHjRw5gFPHWNpe/OiBmHgdkx/MNlk7ZNfviQm8z1OJhS+WS5lzU9AMQBtHkwGMrdRv/6A89dZBjbufJywk6kd2XmCd7Fa9fot7BRz5l14u1L+y/KuVEhxnrHOOUT2BxDo+0D2sa2k2wgRgT64ut+J+OEi3pTUJaEHScBpM3f/2p9CR9AFeuy2HwEEq++S7sqzUKoVWKobh3I6Oxp8vjCxZPdSQ0h1poM+ZXLx8Dkgij8tNfyoSDoxbPih9mFI+D+Y+AMYGze9AAYQiqoA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(316002)(86362001)(66476007)(66946007)(8936002)(8676002)(4326008)(41300700001)(5660300002)(6506007)(52116002)(6486002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DMhsVB7SOxV7pG0HAa4LmSbAYUkL+8Xs0PaWm78Yl9ZdsLgLCnjzCkp75Yih?=
 =?us-ascii?Q?DA9bQol5OJ3aE32ZFhyW7fpqVGhz5lCZHdrSvNbjuztR6QLyF9U5aCihYIFa?=
 =?us-ascii?Q?BtkdYt91zjtIpicLP7YHPROGdUyrJBaobYOxuIXJpfEanyMi2LxNNAyE8LgY?=
 =?us-ascii?Q?kr6YwiZP2rz4OvxxmLTwJ8IztRVeaJSiM0lEKP39/XlKeiAQPjGMBtZsd6vF?=
 =?us-ascii?Q?RuIZ8TnhH2FtHZJDaKlIcdVC/UF3jDMGeOhfi3yjmWi1C5aVz3dQpX9DFDqa?=
 =?us-ascii?Q?hQkWwtl7obe1TmIDDjXF73nIFBTo80YqpKRIX02MqwLzVdWhCTFl51N9z0Ma?=
 =?us-ascii?Q?HOQBI1wATtC/oSbl9xpFebidgVf4Z9RDAyK/5ePHcnpWdYWrXS7dfctX59BR?=
 =?us-ascii?Q?AbTLKaw0rV1Hm06z9Q8FyRPMTT23FOwA86NE4JlEYRF2cMcKD+KLKxcXwkIN?=
 =?us-ascii?Q?OXEIuUFchjcKYkgMqF7ooAehwklHU1glx/wCqVAGNeQ0/+/SO96+ax0pbyXR?=
 =?us-ascii?Q?j8kVD4vD4AnFcPdfYkIs7XQ1mjFLDwIm5C0BN8m6IvUupSjxgIx0FnRCGzZ6?=
 =?us-ascii?Q?nOA/Y2bkmg4msnF9nO9I28keuTofFqSlf3ahAL5IU9npUFai+YlmfwMdvn9Z?=
 =?us-ascii?Q?dknyHNsMKgWndoAbvPnlrqhKRwqP4L3UYjPwgaP7i/3M3DPUeCDGJJK5r6oY?=
 =?us-ascii?Q?nAJWTG3Y++CY4HFAr6ee6QkQbcgA/zPw09tphm+U4XTtalWOh7Nwcv+JcBPK?=
 =?us-ascii?Q?ctqiUm8GsLnJnyenZywAuBtB+JMxjerleq4UROtZPIajItLByuAU6deYv4Q6?=
 =?us-ascii?Q?+aUAK5pIMXRfJytZHu7jr98myB20BvxAHNxUDkcuPXuiDsimFccaCl6DjaQR?=
 =?us-ascii?Q?uQ/MlkErN0g0B42hesCYscQ6QvREVR5cax1Hi0nOPvgFfk1Qwgdh6ia332ZW?=
 =?us-ascii?Q?4MAeYqJHLdK+4IsXb7KxHxVkq/sEf3VPClvuCDmfZbBZ039Gh0lsggEw5uhh?=
 =?us-ascii?Q?7Va9rdewwelvtZhJ1LcONQhxwOy5ZYtokMWCbkTHm2xTIZwm59Pva6R2daOI?=
 =?us-ascii?Q?WoaUx7U+XsNBEPvnwDhur5tqcSbOv5LjjJerFLcDlnxu8ggj7iGBhjrNylST?=
 =?us-ascii?Q?Bgqz2ub/yixBKxV70NMdwNtoAfjEwtfJuyWur2Ba1cBC35J0GaQrhZCWsTqi?=
 =?us-ascii?Q?l8OXgU3Hc17bGGCwIpqFdGs5A/mkAlzrw9IrjMa+RMKvs8b+n+KWY+gEFFga?=
 =?us-ascii?Q?BZVEGhtv/lB//ZTeXjCubkIpKWUvs29yT1te6oHCMMnDr2/x+Y5OupZ9SARE?=
 =?us-ascii?Q?i7lGXSS6fgJjhFlsDEwaUlj1xkzBqmPZSYdzzwfBwwqkOBplCvXgSywoq3Dw?=
 =?us-ascii?Q?acYWNLCeoRA20buQ3ccH2usfLkEZXSJ9pquRsPLIXgocSavfG9G0NMphOUhM?=
 =?us-ascii?Q?nG3LmJUXaMN9Q6j/kZXNzkFeS1Iss8kLewDO8M+YESDuoT7dnr+ogtUs6E7H?=
 =?us-ascii?Q?ukQT+An6c9kUJTsPsQhHrxySUbs3SZvrn2QVoS/8cxif/llWiigyk3A9tyyI?=
 =?us-ascii?Q?N+APsIecEExjrwRSVTM1Q4vkgU5bq7TtwCW5CwulYzxWbpx+zvBEeaWNcNq0?=
 =?us-ascii?Q?O2+W3IFTNaJ/COd4jTkrh0A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e3ca3c2-3fe3-4a8e-603e-08dbb3221f08
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:52:13.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2ankCdpUxT+8qrAHCJL4LTx3BPi34L3bfqwtxbBQHHPETY6NfiyFmrqrLJYXoT6LSVa5RN4xU+s5iypf/puRomk9oWdJohc9kMuRhZMpZiCetuio3hVlMQhWUF4LqIeb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5990
Message-ID-Hash: ZLYG2YBXAU44F3BEVREIK2M2Z5W7WVSM
X-Message-ID-Hash: ZLYG2YBXAU44F3BEVREIK2M2Z5W7WVSM
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
Archived-At: <>
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
 sound/soc/soc-compress.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index b58921e7921f8..a38fee48ee005 100644
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

