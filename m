Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5931A93712E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 01:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC55E8E;
	Fri, 19 Jul 2024 01:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC55E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721346222;
	bh=RbpGtODWBqIIoZSGOdg96lAJFpCULRqpBdNbkkteyGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pHbFyNQ+MjG3GmzkDJx8MPyfA47Ahc6rAOzvmsUHAXEroFvAc6OQW5PsArwr4VpEZ
	 e3xvM6McgyblY79GMtZo57lgRzzxxB5q1NR13/nKJVEDGnP8zoe+qaRW0I5UcIig/s
	 bTO76bsju4TpT1JgEd/fvDfV2sp9MfsNjv0GMcTI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C608F805C6; Fri, 19 Jul 2024 01:42:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CA4F805BE;
	Fri, 19 Jul 2024 01:42:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04F29F80528; Fri, 19 Jul 2024 01:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F8E2F804FC
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 01:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F8E2F804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=eBY2fh1q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKIomiWmwSGCaZtc+nIq6MEWp0YR9/XEwCpuCyAjo2tIrVxoAqCTTTmPe1iL7kZzSX8DYGKP6tPlf7RWhVx9uGaLtISO+6j3ru+yh/3YZfvlpCv+8lf60qBzTeIG0LcSKIVvvLFpYmiRh1QJyHEwDLYvrBUfmrSts/E4dV53+dwkIyWBOAj0jLVpou3ZFlQTg+q1ASZNY8/sOmxwbH9IzVaRSKQDpfWS2oHa5aJyvMUAz1d5jVHA4SMh4LI2ZMAyfgMcLdTaZ/D7mDz8ZeTRnKtIfkUcOTqrcWtWCMN4qnxS7wZmvSo5hJyjizU5ncO6Pv/XIL3SicjfewqkLu5Mzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujZxfw75Anq6ozVxWK+D0HABmzWzxNeSWvg4SwUt0ys=;
 b=RVUa/KZnNDcTuibCkvJG4A+TgseAlMZggdukZqo2iWBu29+gB2CK8XFsc7UvYF2ONMwOp1fcOoCaCgasWN3kKurS/1r4f3L3VrTIbd9GzC7e9D/eS6wndxZQGQ0AubaMim8AvuFLuE+kax+n3j7xF6rvzl9DHQqD6rzgtyAx0EYqT6E9eAYIvE6OIE3S0j0exWaDPudNzCbIeaEe8UQSTIYWf7dO+hqgZmAsKTX0jYyWfmvMT5qM6r/HeYn6x44ZxqwTA9RmCLO7UVJTlrbo2hAz8BMoblWYvKtLpkR9w5jkPni5Ckci/6DJ1eO4avVrOMdze+FuWQ40qbv2QM7YbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujZxfw75Anq6ozVxWK+D0HABmzWzxNeSWvg4SwUt0ys=;
 b=eBY2fh1qgvv881DNmvWM2fXOMYbYGRhqby0xsKE/murE5bs/lBq6/JaUbp5K5N8RdiBmUlQu0M4M3J7w8bMtYgfrNXft88CBS24d1I0fjW1C0RHowiO5ST6Um4Ut9KcvrwzcKxdIJW85GNHWA+ntGLoXXENEKOC8JK4FxLRp9eg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11460.jpnprd01.prod.outlook.com
 (2603:1096:400:388::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 18 Jul
 2024 23:34:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 23:34:51 +0000
Message-ID: <87wmlil1et.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 02/xx] soundwire: intel: use
 snd_[sub]stream_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Jul 2024 23:34:51 +0000
X-ClientProxiedBy: TY2PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:404:e2::24) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11460:EE_
X-MS-Office365-Filtering-Correlation-Id: 6853f88f-9a80-427c-0952-08dca7823853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4z9ZvT5s/C2mvrmnkMNwOiYFpJit8jAC64/TGmt7euuXJ9m8UbBJ7O1TPPPA?=
 =?us-ascii?Q?q8Ne3si3mYSGf4vZULoKCkNZC62KhyFsxN3HmyI9rYrulS7T3qax8VKruYuN?=
 =?us-ascii?Q?yUNfadSCnMOjyQuzUIH+MT14m9d8w4YvHmmeCWhVyjgYEIfXNhOpvHh+wjHR?=
 =?us-ascii?Q?HmpTCGPRWt1z7YBgrvtjeV5qGVAHGTYIenWWnQwwW0NCtSlFbSGryPw7MOfe?=
 =?us-ascii?Q?x0TIYXflCIxWm12f0P4DgdF6yyfgsrn9pOHpZbb1DjMwkWwicoKaSu/mdF6G?=
 =?us-ascii?Q?Hn6Y5ScXxOXbwe6comWjs1RUt+RL3R8WgWnrT2tiCp7X88Jliok4EHBEPNrP?=
 =?us-ascii?Q?fuLkvYwxwAMvoyfX0Cc7C8RBqFdziOc0p9sy1dH+Ter4thxQrjMVklF/0s8e?=
 =?us-ascii?Q?JZSLA/Y3iNDp4VsmG1Swozrm3WZ8clqnMDq0/02PR+QAlRLn27HpR473Yj1+?=
 =?us-ascii?Q?XAFwA1ZW4KJbkcBXOYUeiThN2WWpO0geCH2h5JcvtpAJ+ImUzr9VbyiRcT38?=
 =?us-ascii?Q?IHMP7P1U4qK6BTI7Q1zi0QN6VOHoOWPhv7693UPyox8f/jy4kkboEAdxJ+bx?=
 =?us-ascii?Q?lxtGCJ2YFJp2a9R/I8IGylgjnzjzQIKPNefbzWVuFXf+FbkouDlTX1Cm0KZL?=
 =?us-ascii?Q?a34dM0rw2qsIoLk0N3MQYRX04G4XOH8m87LQ0401H5lG0VCewPy+RS4zcYxI?=
 =?us-ascii?Q?AAu60lMvT6S/vRXD7RIFLfGXgEzVwdbLW+9otxApmt+EaJyL14Oi465gE8H2?=
 =?us-ascii?Q?V+ZvUfTQ0FEfRRM2tA7cp+TlLdvO9UOJrmPoNtXWS9kAHzZDK3iMv7LjCFt1?=
 =?us-ascii?Q?u6pGchXfAILtd3eDTZOVFRbdYWaEixjJuOP1YlkGacEfFZ8HVON8Hxw9un9G?=
 =?us-ascii?Q?hVH4u3UueMZRNLYGUYGDim+ve4GoqZ6J2qUOZVLLQNArNWMLe14hJ5Eat1vi?=
 =?us-ascii?Q?azKSTkskaVQMj2CXBSN5vbtRy2VAn8O4OFOtn/3nvuJkuZdc+N0v8B9N0VdK?=
 =?us-ascii?Q?nZ95CQZHbSDs/hJ6m5YcK1fHvamx6F5+lN+mH+h0xhjhHt3KKcGcM/N/b5fx?=
 =?us-ascii?Q?Jcm/QVrmaob0MEYb1/XyQi22K68h1dBxncK5aX3cEByRoYo58/7qGJqZ5Pyr?=
 =?us-ascii?Q?eXtXkudimOaTd49euCFHMYWVGQtbXhZIJG4n2TdoI4sUATR5M7K3eEyOzgr5?=
 =?us-ascii?Q?MUyuDGNUd3WNT1GZ/GN4cZmmIf28bniRdPLvhJ0SckVuKfFjX6tVxWCV3t4E?=
 =?us-ascii?Q?Hon7d8dY9JuzpwIUxXP6PrHXdetKlSJ1WwFS5C8gtls5qqjD4IixUiBJQxK7?=
 =?us-ascii?Q?rH0eTr/LMt6JDMZvfTpeBw70RQFMGmN6Zh7mqK+DoZJeY5Id9FQd+kMqYTcI?=
 =?us-ascii?Q?5WUQZwsqtXsNqrwNLGi508tZVqeI4A4SFQHYbmEOvLR82f98Rw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?79h/HBYl6ThI/ETT/M/xemTIw2LL6pGZfYkURtEqg4i+b2infZX6e9Fx/ORh?=
 =?us-ascii?Q?IzKqcPUV5UP4bAxEXS8TCFNBByzxp6NzDb+0Ikp4jQs/rJTSqbFSyVSwtCT/?=
 =?us-ascii?Q?kWhbbzoEz58+YXWSsM6YgaZFTJZCpZJil2RVv6WyCxlVPPF2Ept6cTA2OR3B?=
 =?us-ascii?Q?CAH1sDUwYdMJ6w3uyq9TfzmuHRjlpJcdhM2vhSyUzJwpCW3ZdEh5u/nGP+je?=
 =?us-ascii?Q?MPxyDF11FalNyfpUVRrPZFsviLaOi18V8RZYJdTBGns0QtU5qZWBNvmlOJqs?=
 =?us-ascii?Q?9CKmphqrvbnLU4ogFoewMKJGvyyX/R28PwYJrC0Y/OlXeR93QTy0pXveJA0E?=
 =?us-ascii?Q?DU/mZX/5hQfHQqQCDn4bi8IuaxIYFxeQ4h/uDvMx595wXqGbQEu8/uX1CBZW?=
 =?us-ascii?Q?b3E76Hf63Zs8OCuzqax3cXFdU+RsqFUTcGG4YtNwI1dIOp2SUnYL41il/aTS?=
 =?us-ascii?Q?EcjQzyeLuYZkzb6uSQ4KTN8ptDxP8wXKGmNtiCcQJgzzbsvvpAfsd0bRUDr9?=
 =?us-ascii?Q?5YyxVAfeGLRyk63Fv/wdDq7kP1Lk5fqsXqzoNZnNcZhyXuoqJUvleXLGVdEG?=
 =?us-ascii?Q?KjHGiWdBz5uAcvPQXwYYk/cVFq/LvpS1Y7oQ+0ODk3PQmwbLB2QTRVIfs0ei?=
 =?us-ascii?Q?3a3XClmJmDw/sB6b3poYCWcE8/Ui70NIJgImntTzEyHmd6jlBEdAyiP2V0QH?=
 =?us-ascii?Q?iyCiCtMiea3WxAJilZEYYRtqc0p6vQOHQtFsci1z81yUlk+0vVbcU9G0npHF?=
 =?us-ascii?Q?2Rmvd3q/pqaIaohlgOcSgwqo+20hQCfJP6XqPdpXKAkNyJp9RREvRUr7CNKn?=
 =?us-ascii?Q?LYJwjcKmaSwqmKiwrbsb6Dm2Ik2chByNnz7ZLXgfa53HTxMHOcUpahgb4vRV?=
 =?us-ascii?Q?4shs2XX5rrqNK8vKefFTJ/qdU66MjF7Ym34nu54kGc2fj5slmOUc/pfiN/QV?=
 =?us-ascii?Q?X3LORGhy3598zgxahe2jcYgH+1YrjLcA8pr5+FUiGkgpcJcUHs4ohN1/hm67?=
 =?us-ascii?Q?kT4dWQDepyhC0RTEL7tWSVZ4yKu81KlOiRfKJvIZlWo7e84CuOZE9OCCKIeG?=
 =?us-ascii?Q?tscs12Z/wfN6vboOv4wcaSoOGcv00wZbK0XQoFLADwmnp8ToYY6Vee/XJhdQ?=
 =?us-ascii?Q?xnEH8tGe/KAynTQ1U00/eJ8Opi5REOspoIo8AC3f88qSA6rdjKjNJ7tn77ao?=
 =?us-ascii?Q?TA9vHnZuEbUv86DPq5GPzFDUkgmBxk5+aGkvaHal8LSHwD6ChgDOMDekDq7y?=
 =?us-ascii?Q?KNyH3vLpFEq2e4o5xSEvr8lRHMmTESyqGPopnijlCYmIMjoYpZvO8GeOBtiv?=
 =?us-ascii?Q?X22fCndhO/z8nCHG9vkBelf7rtEL3VY1dfyh7YXu24CLKHwAnxXakjgBSmSV?=
 =?us-ascii?Q?F02voCqnAj07ctebjCLTr3gzxJtDMUlLfnJtjPH4/hzHHE1/ea2fkhZbvwWs?=
 =?us-ascii?Q?zjnPWAhInipcnOrVpr3e6bL5G5xlz/PWXcmpmFbsur75XR8gx06uyUC/rFEA?=
 =?us-ascii?Q?ZVepmLpINVJcrvDlv/syhp+AOG4TvPMKX/fi0wgYdypJaZlMzDAzOTMzTWCy?=
 =?us-ascii?Q?wtsJoOjvPB/ramFcXH1a3KiF3OkHt9gG/tBJJPPnhHxz7fp7io3NOsZ68AL1?=
 =?us-ascii?Q?VJz/zagTo7/whCeaBff1OMU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6853f88f-9a80-427c-0952-08dca7823853
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 23:34:51.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q3e892OTgeTggvSIGMCaQnWjfgRE68+DmTc1ZvJMlevKfC2eGhvV+xsZBZZA7dwLFSu8XmfW/krjhCNQAMpMOw2NoRa+C0yVboCgA6InTNcwoVsLWpSmjCEim0hQ5sKp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11460
Message-ID-Hash: KS6TPYFPS64AKZFCAVHKLIUPPBXQZP3O
X-Message-ID-Hash: KS6TPYFPS64AKZFCAVHKLIUPPBXQZP3O
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KS6TPYFPS64AKZFCAVHKLIUPPBXQZP3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_[sub]stream_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/soundwire/intel.c       | 4 ++--
 drivers/soundwire/intel_ace2x.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 01e1a0f3ec394..a87c8c8294d4e 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -736,7 +736,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		return -EIO;
 
 	ch = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_substream_is_capture(substream))
 		dir = SDW_DATA_DIR_RX;
 	else
 		dir = SDW_DATA_DIR_TX;
@@ -826,7 +826,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 
 		/* configure stream */
 		ch = params_channels(hw_params);
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_substream_is_capture(substream))
 			dir = SDW_DATA_DIR_RX;
 		else
 			dir = SDW_DATA_DIR_TX;
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 8b1b6ad420cf1..b459795ee442d 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -304,7 +304,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		return -EIO;
 
 	ch = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_substream_is_capture(substream))
 		dir = SDW_DATA_DIR_RX;
 	else
 		dir = SDW_DATA_DIR_TX;
@@ -398,7 +398,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 
 		/* configure stream */
 		ch = params_channels(hw_params);
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_substream_is_capture(substream))
 			dir = SDW_DATA_DIR_RX;
 		else
 			dir = SDW_DATA_DIR_TX;
-- 
2.43.0

