Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252207104D5
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 06:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42E8383A;
	Thu, 25 May 2023 06:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42E8383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990609;
	bh=gcIKwYrRMQ4qMItEAdRF4hYLNz1wlUbuVlb1E5AjHr8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eszvx2CwdaCV/62ACRwsc3wj+786GxEZN8DiKnp3L2nv89fSBmuGcj/nMsQoQO7G8
	 zIzMBD7zAobSj+mA7VVmRgmKHm5Jz76eSbGasm9bboK489qxxnW44QfHh5Xt/svJuC
	 gZZSFfQXiFrts47mTCFbxRYSJvbN+t55Nn5MByHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DCD4F80606; Thu, 25 May 2023 03:18:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB5FF80606;
	Thu, 25 May 2023 03:18:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3528F805FE; Thu, 25 May 2023 03:18:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D393BF805FB
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D393BF805FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mdERlwcy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qttrwvj13rPJZ0B8Gtj/EavxvLlAgRKgu7HTg1YOpuSh8UKZRWRPmkRhURPB+zZTt/hY1c5hW/zu+MzKgt+hJTcd14fmvlD/F0NMWZ/JGKR9k+kRJ6KkXjg1slahLjH9a3SXLbRuBD0Vnw013Z+/vrVvYZP4UflnUdqHHPzDoKyeVleRjaAYm2osPLQJTTx8XEIAR+ceAgCsRRE9DlSCKKkft63ahvISkcyb1V2GoJ1gEdbTlvZKue6K0UE/djE+EY/7XPQZJphqBA33JuLFYV/MT9ywdHNR2ibwOiqgJCjpatZqCUZBgJS34eKP0yGPHFUlBdBFoC5Lnz/llwEVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/UiBlKAyMuxYlsSkDYoNqnpynO7dVwmkDwhqHKiuu4=;
 b=cYToP0g+6Y+Ufrb3FAJRN21CxMQTejknyVRtbxZ2jgDgcc+SYdNcqvO2K2khskMWOCTRw4lSZgOUmX1PqD+wADIflBzrDqrXgt47tTY/cYVGW+/TtFVFoikEZVcMG0AzJN5YTEbOpoBVImjxe8xbkA7+VXNzKNcXv3bZp57wGkMhWN9UpvpxxC1Vqpv2ZMn0v7iUKzcwo9fFXi0eRYo1l5A9behB3T5o7mTUCwHjBEd2S7lveLO9FR+4jWjzg87NDJCHiry8IQXSr2ozHnQ8h/KW/iVrNgOvDEuoOIV70k444fhXa+XcwX9LnuWxiHf9lOkQVShJSNJBuXhJkV+BoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/UiBlKAyMuxYlsSkDYoNqnpynO7dVwmkDwhqHKiuu4=;
 b=mdERlwcydsJrx1uw5MECU+0pHivnqDKlzWz+iEvNXGtGYXY5u8iEU9pLWzg5VY3XlaTAm6gFXU/BWxq9FZhkF/pDK+xEQP72CSR7qzsGR0AWxUmjbiV5aTWX7Mzbonuto6LBhQambVQKTJUAjbbex/WflqbxrWQHK08DA+SCbug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8485.jpnprd01.prod.outlook.com (2603:1096:400:156::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:18:36 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:18:36 +0000
Message-ID: <87jzwxgqdw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/21] ASoC: soc-pcm.c: cleanup normal connection loop at
 soc_get_playback_capture() part2
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 May 2023 01:18:36 +0000
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 56794a33-2a14-4f0f-5086-08db5cbdf6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3pKUxICSIwee2BgMLvVsf0Ya7vqeq4zJNd1HDPgWJrBcEFHE4l9Q92rVvhRs9sQr/0qnG1+HzunzrispHAL9i/Kw2AYYLACReTveUmABJByMGwLzu7N4MygaA4hi2dhmqWSbpL3/AONdHjwmIbwIwGcInUtOwsxY4NrLpiTI5QkiwTiX0VdLjxVfYG++C7Ym+Uzp9E/4OZLNKHeBn/hWg9tZFcLAdRWVvydDFuKvot5e0rKjmckI1msPhmpsL8xbibkS38/f86PmUhu8TMXoC8MFXCizC9kxQtadnKBPeCpqgMW2yperef0ItmYnt/cIN+1QZqS/rXQZw+5RBx/R3K2yQxuMbrrulVt0i8+f+kKcLKqrBHpObYlsDvUIZN0nG4sq3C6fBwRiHKrYQRvA2nx2zf5YlVlyLqSrRFQmtSXbkKY0i2kMsX8QFLsk8vcMlPpfQtALgQauP5fApEC23R85cjcoLdz4HFZr/LwA1LKq2Z9YwCNsvJn8Pu0UijpmM0GhTZH+/rIUXfk66XN2Po6gTZgyAWMKqx7tLKIEsmgDmzprVSLcN1r8Y3LmmAiFP3zLzZ0ZcsbHAWdVZC5x65MMFGnKFSwmGsR+XOmJOnBeZxrA/oA5H5V9JnLRizt3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(4326008)(83380400001)(66556008)(52116002)(66476007)(66946007)(6486002)(110136005)(2616005)(6512007)(26005)(6506007)(186003)(86362001)(2906002)(478600001)(8676002)(8936002)(5660300002)(36756003)(38350700002)(41300700001)(38100700002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?+fwOsGFDCeHqo4/5zUQaU7nZV0q+mdXprMuMwOt47hZ6L49Nkv6oCfatw6?=
 =?iso-8859-2?Q?F0+tcCrfmbhA0+sG+uYTkz+PkaPKHSTB7RpO3WPaqiYbdaIFcECx8zAuSf?=
 =?iso-8859-2?Q?2EayFxTk1kLU/4BxTzTTE8YSZmHxUUgXKWQgHC5IY4YZTKA3qD8qPdSTQL?=
 =?iso-8859-2?Q?xNCdQNMUxuApazs8B0BUbHsffvR96ON6uDVRiCzjrByyfhRmtx/mFSOHZU?=
 =?iso-8859-2?Q?aUMI2SidgTHcRcAr5kAPORlMZZf01Wo9Oj6JR2Y3ZHIjMR6NSaLwL/mi94?=
 =?iso-8859-2?Q?FxdpeUl7MqF140b+ZtMz2wtpcvimBJDpthAZHnvDhv7wNmqWzW7Yky9eEa?=
 =?iso-8859-2?Q?H7GDBvVlFz0imjLotHTvTwbKZTO6yXZbX6Le4T6KfueUQ4eNpsjQT260//?=
 =?iso-8859-2?Q?WvjY6yAF2eO2f6uZmN0Vhd/XY5Bq9FE57qopah3HI9znjvUL/PyPhzIMwt?=
 =?iso-8859-2?Q?WS+ehkNQgwHBgxiyRXOThqhNS3NobFewdWsSZRPU0cl9s/PkJUbbjjUil8?=
 =?iso-8859-2?Q?qTF+xJzNy4ktY1kiWIepORvNQMw96HRDGeXeli+CHfBFLX3YWD4tAR28/S?=
 =?iso-8859-2?Q?NLDO98dLp5g9yNqGnG3XSlEYV6IznJvrMZ9iueSzNAXshYvQItPj6daVsu?=
 =?iso-8859-2?Q?AotkF0hywS9LayDRkrp0L/LDH4QHsojfw29by/3YRVgrqa9SRLoJKLLkAM?=
 =?iso-8859-2?Q?W0m0PNZ5/hDFBufrb6rSt10l8e9syquXopMTWeCIzTarzqHUSChC1CtjUE?=
 =?iso-8859-2?Q?Y8cXlWRxEPj9Z2s9ExINaolqxOXDAhhNMraKPncnJIUrYC7n8LgMAQrQgi?=
 =?iso-8859-2?Q?jTgQtS2q1eS0hBLbElKY2xD8EsCPyD5I8Cp1PiKakCfSMsoyL7NYKSJJZ/?=
 =?iso-8859-2?Q?QV8I2KmAvdVQEYYavx6bpp7YS9AzJnGT+3gj3cEDihFNcvndgX+svBEhQB?=
 =?iso-8859-2?Q?yC8gKdw8ayRFpw/cI9fduBxr0I0pk2N7lw4uiQgSvlea86EtDfXiiVsZDw?=
 =?iso-8859-2?Q?NmOy1V7CHa6ZwJ6OjYvMMZfVCVvZz+xuUqEXqQKKlhDldCUcX2TJxlSeem?=
 =?iso-8859-2?Q?YsPxfBYl4WD8gFwWdodfYQVG8ggtKSbcM9thyTHtXdlb7fTK+RvKwQM9v4?=
 =?iso-8859-2?Q?xEhOAjA3omg6lbDhZbFghLqOeR+OxzmRsCAyThvkrBCM6BcQp4cAPW9q6H?=
 =?iso-8859-2?Q?ukCjwxLpzuZaapdpMhy6JomQZ1SEobj2/8JTLvM7KLentS8HCekVkburU6?=
 =?iso-8859-2?Q?EBhhGha13smqIitVi7tW8VK9peF5TPwaOSMyk4ck/c4Hyj35Y1fTn7tLHD?=
 =?iso-8859-2?Q?lJISbIBBjS0Uwn7KcKmIMRf8qDq9vnIqwem5cWIzKd+dtpAlRu/D7XxIss?=
 =?iso-8859-2?Q?RravxaeCbLPqtA13KT0mMIbXPT9ZwIWMUgrMVCywM9gEVjmJwGGmg9uZkn?=
 =?iso-8859-2?Q?pFHq0XZI24fb8oKkoQ6QHja/Bpmy4yBWLkloIDwk+adag+B18LdRWrIwlV?=
 =?iso-8859-2?Q?9TU1A+Rya0s8xObbZdKnxa3wqXaLwdDUZXNVlB00y/Etx1SuG6PI6ojpHV?=
 =?iso-8859-2?Q?Jp6v/X5eYiPm5kUEmsAqH7N9HtXeixKRw2jns9pUL680cCH6H0CGfGNSvn?=
 =?iso-8859-2?Q?hDtEvXY9WxnzOs9ho9EiKO2BV2L6v/pBI9G8emQn+Kusl+gHJmVvIXaT5I?=
 =?iso-8859-2?Q?/tmvqdKR9LvOaI6c3KM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56794a33-2a14-4f0f-5086-08db5cbdf6e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:18:36.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WuXAI4EFZQsexvZqBPvma7iH/WAEFKLn4CglcbwyIEZhUPO2+qDtLS5yAyyFkRNcKH81dsnYe1TFLJW9wOkTdG1uGFfR3SXG+txKYzk1ssnkt/ZDbX6cwybXzwNz8Qo8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8485
Message-ID-Hash: 2NWRYLZRLYLS4QTP3RZMMEMCWZHSDXFA
X-Message-ID-Hash: 2NWRYLZRLYLS4QTP3RZMMEMCWZHSDXFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NWRYLZRLYLS4QTP3RZMMEMCWZHSDXFA/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) is handling both DPCM (X) / Normal (Y)
connection.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
(X)			...
 v
 ^		} else {
 |			...
 |			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |				if (dai_link->num_cpus =3D=3D 1) {
 |(a)					cpu_dai =3D ...
(Y)				} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
 |(b)					cpu_dai =3D ...
 |				}
 |				...
 |			}
 |			...
 v		}
		...
	}

In Normal connection case (Y), it is checking number of CPU / Codec.
	(a) is for Single CPU case
	(b) is for Multi  CPU case

We can simply merge (a) and (b). Because it is doing
same judgement, same operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c95adf59cfe8..77552543dcb1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2794,11 +2794,7 @@ static int soc_get_playback_capture(struct snd_soc_p=
cm_runtime *rtd,
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
=20
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus =3D=3D 1) {
-				cpu_dai =3D asoc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
-				cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
-			}
+			cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
=20
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
--=20
2.25.1

