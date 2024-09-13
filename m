Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB381977670
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 03:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3656EA4D;
	Fri, 13 Sep 2024 03:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3656EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726191379;
	bh=NBk2uiwnNJIx7FelyJcBoTy2O0pvHqJbptNBrBBJ4nk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m2/wzrmmxmy0iWvGZ5BHfgDbxQr937O2Q3931drxXuUWXWEvYZXAG6YiVAPz8eix6
	 VNVtiXEtHTlwQAAwwM1Cfknf6x4SF++EsQwXWCOh79J+TrZkCjMJ2OhI8S0Ub4O//A
	 o6EZCI0gZJBcMkmlW2bYjnxmAQUhwGC0UEre3isM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADF4DF8058C; Fri, 13 Sep 2024 03:35:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00DCFF8058C;
	Fri, 13 Sep 2024 03:35:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E445F801F5; Fri, 13 Sep 2024 03:35:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D0A7F800E9
	for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2024 03:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D0A7F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Vdsk9KJD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQxnG1Tx+4auWXGg8pYeCRa+Jg9UnHHhlJY9qVwvKU2bKpaFnkQO6aUeZxg5Ow0NuTdbs0O7E4knR14vg0mRE+YaWR8vqxRFnmuTRX4EuWHIjrvC6AKQPmuwTJFrn1++7B+4TFnfQZl3a85+I/tusIPNaNExY4cKa+1b32RdnbqOOsWaUZxsXuc9D5AzFCS69J3vwBeB+xppDq6gBGjO0Dao6AdaSdl8zX+DjA/ZT8zFV82lPb4GPHAxwC4MBwhf17rmMYTiA8s50RMUTJe7WMI3bGGDbEQdYCWdnY3lbLYvzoN41FuNLGrJEIqSzR68p9zd5gFOwiAIHlNOMOeo9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te9sWae/08K0VBiL6lyj6qk7Dtis2dP12nE4yKCNlNo=;
 b=byHgpq5eucw00Bn9olkK5/3zsFc2JFtWOFNf3seqNS/e+dA1QdlLKe8Vr7PMycUsZiX1ff6mCUo/rY8rpoDjjyurvq6gV2KSA523iCNyE+ZXl5O2lTI5QxrDdH4DsoTPewUcPldA4RVEarPWeylPzeg7Ez8ghp8HqQxW1DickZyHW5tWk90b0C5QrFkAqEFsXVIRcRLy/1KTkgpjU1zPzhFteGK6ad61wvwYns7fNewq6DIQH9VSoB58TZJ9OyAhjjIS/x0UD0FQlvWjZC/DnxDXaHMrFkHeNQfhFrqySRsz+PYxG5KLt4Yx/hGqCme1c9ReHInMh35OCUir6KpCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=te9sWae/08K0VBiL6lyj6qk7Dtis2dP12nE4yKCNlNo=;
 b=Vdsk9KJDt3iN0leRKq+qb6nk3/HoovNMBXtij7f3P7DYctLuNfa+YILRbEZyGmBqTCO46aKQfhPqZmQA3GAkmEWVE8tLex3Af0CE+oSO2CTnng2hU19b3PG7QdCJinDyFF4Gt+CBPVHIAyL/oFkdQd9tphtdp7jlEWBnoiwN2QY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8733.jpnprd01.prod.outlook.com
 (2603:1096:604:15c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 01:35:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 01:35:28 +0000
Message-ID: <87ed5o8hen.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-USB <linux-usb@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg KH <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
In-Reply-To: <46b37ef3-047c-4b1b-a79b-37187a46754a@sirena.org.uk>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
	<d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
	<46b37ef3-047c-4b1b-a79b-37187a46754a@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 13 Sep 2024 01:35:28 +0000
X-ClientProxiedBy: TYCP286CA0331.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 51555bce-59bf-47d6-7653-08dcd394591c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X1vY3nM2IuQBbwR4l6EKT47yjr3WrBvUPDWRCbq4o5u7ZjV0jWQqOUAhAYq+?=
 =?us-ascii?Q?fAbpaY6V2Uf5r0eJ038tbTt4JIRc6iOpoZaP+q+6JFApP1ARH6xUKxxfB+p7?=
 =?us-ascii?Q?7LQroC2dymMOvRXGVLB7IpNm/4UQOCg30n2VlkHvO4QLa+YaGhphoAqejGOs?=
 =?us-ascii?Q?eeIERp5c+8aImbmOPcxDfVJiCxnRVwh3AJLuYDj4asnFn55gbqsxopuCrefu?=
 =?us-ascii?Q?p439r0BYDv67o3XvJMCjz1iRQs+wrcbd1qi9V2T/jIZ0m7UNkLygbTbqOiXW?=
 =?us-ascii?Q?/u9GwyY/+HccllHDzOHag6ixtJ9S89rNNPOuc5TLbfX0GJaFfc4OkaraNmhy?=
 =?us-ascii?Q?v9fVvFKpjgn2D1Ry9DgJTLrpme87G5n8Xkr0nV/ticx3wJ1A/H0pZ8PXO2SF?=
 =?us-ascii?Q?EZdBpuOpCKdRjWsxVsnUuNMUnKeJo2BTF1xE9WbQ9ECOiLiyvoeJnzxbGLSg?=
 =?us-ascii?Q?CD2GV8OQTXtVJcYqmYpRMtBuOE0iNnTAAZBHad7ydlWwHnuEv3yir9LA+31g?=
 =?us-ascii?Q?taVb3ziuc0ez+MiGX5zSZE+EcDHBuI7mrif2zPis7FRGiVHcSBHMWXxz+dI7?=
 =?us-ascii?Q?/HEA63bS0osJy7sW65MX0BF3KcLBDVxNKXDaVeWZsliDcScSpwR03Pa42T58?=
 =?us-ascii?Q?vgbgktLWRQpueqfj2yRc5p9cho6q1NtKwxlNVU6kFCJSXjx9Cu7dsn3rrdyx?=
 =?us-ascii?Q?6sGyGl+AZjyHqR9ecJWRx7xUjmqa0/p1kFBOCH4/IXy5dVb4RLiS5Qbzeiwf?=
 =?us-ascii?Q?aCnBvDxIO20grxxdMGb3h875bYB4Q5METifbRg0i/11jEBHygQt1CW+7QoOF?=
 =?us-ascii?Q?Fm1HrfE6Ffg1Ubl2lCPSf7WqC6u/wqOtH8kmTWVCsrFi6AdgEl+bCNkwFYFA?=
 =?us-ascii?Q?dD0XnZgh0Il+xNe+VORKnki5yQjcc1qo4QtUFBNQbR2tAkyHGaFrTVC9Aq4N?=
 =?us-ascii?Q?/dJsRTVnqdDK0Y3XgfZnfSjC7IUjC4rMz2sLG9IbYfhA8BUE8NDABtiPBii8?=
 =?us-ascii?Q?FVj9uXLXlqRexT7kkKP0S9ASxfaEq3OlWmCNV1C/QMY7iOBEt9LolIGDa2Z+?=
 =?us-ascii?Q?TK6/vbxXhMV8cvX+pwWqFdm2PbKppQBSSOQNGdHk7PVeuU5vL00Zc2Xnoexm?=
 =?us-ascii?Q?GvASWG8ZYKpgQOmmRM3okN/y7agtH/2R3SA7Vy1ABME79wnC646OEetsSeyw?=
 =?us-ascii?Q?6fqjVMWMmQeeXx9BGhf5rpeotry8XDBnXrKY+xJh7Co2DUjo/Ao8Yk/VE2Q6?=
 =?us-ascii?Q?rlglZdIv5t4e3dx1xrmok4y65XgrjWkHFMbEoZzlvkzWOOb4rTlPCqYw09MS?=
 =?us-ascii?Q?GuO8S8G22AbZoZK60JXHdrC7N5jaZDmUcgOCAPwsm5H0FmdafzFpD5OMmIeO?=
 =?us-ascii?Q?FTaRa1IIFAkvEGM2RbF4uXTmkabrQhWtAEFJrF3Cz16C5Q6Q4Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5xpgxHBTbwvgb7Qfbf2ZwBlnqTGyRfDhNiqbUQl6xdjxuTf50zMYJ51Qrvsz?=
 =?us-ascii?Q?PwKEx4v6L4Ig/d32cn+HsE0x4tbfV7wT3QwXMYFwIfJagGhSJ1QD/VhknmP0?=
 =?us-ascii?Q?v3YXfmiRdDQnXcel55zrMFCffUq8F4H/e5QWxEp94tBK4nKD30WTVxcq9qjU?=
 =?us-ascii?Q?1645b3mC5A+PACyRs2G0LXrkolC+wAQLmIK3WCPoBhIyoSwNOritkELvvVLv?=
 =?us-ascii?Q?w6z1GZ70IHxRWICMkoe3MrHa5s1QXN3m9MuFgVUyHvtKP95gqs40l4to3ZM7?=
 =?us-ascii?Q?9PiOkYfdNqlyBrJW7pYNW9kTd41uooKig6INcSJSQk0Kn7K3h6Xzhq2kntdD?=
 =?us-ascii?Q?WxJ2zWBOmrDxSQiTqsARGN1XBQTm7QSX52xN0jZnrmPX5J5RCve07Ak61TWe?=
 =?us-ascii?Q?4m9BPUcDsHOtNlGtAElbhMXA4sLuer3DPBRuaxKfhEv9A83UL8Trd+lBbuCC?=
 =?us-ascii?Q?TZS3uxv8ibtOUTmiUyl4BoqVCsrybQktLdZyIYX+TFBeefwqG6vIPgpC8jBp?=
 =?us-ascii?Q?0mPM2bzNuWauB2JpEGkxUThc/yZH8QtXE5eLrl6eFNGEMuYCmci9MHDet9tY?=
 =?us-ascii?Q?aAyVmdKKsjjbXYVnNHl6Bxb7dzs58X7Ctp1ZEy8q2UyVm/2p2GQsfwg4cKPy?=
 =?us-ascii?Q?+brYDwUdgQZJXrvaVSaqoXFleWM4In/rjmQ3yU9PJGQSTuBYR8vvhB+4pomC?=
 =?us-ascii?Q?l+SaSNmHLLlF4Fsr+F6sWy/uad/jzsMzrhW2/ZNk5eMAbchWrvg4v6rHyQQI?=
 =?us-ascii?Q?moDCMIei9R3IWj+qLu3GQNAdMoF2Vsj4B7iYOXrAVXeChbQ5wXa9Kgvx8Geu?=
 =?us-ascii?Q?H1WKSUBCyB3MZ+fsbVB3/bbb1fBg63vX4+z98lcys6qoFcVU6v76ddOvYv0E?=
 =?us-ascii?Q?Iqli+gT3OF0arNZECG/83yc9CKGOShHpAvIiK3HIRkclAkK9lGdcG7rtT3nV?=
 =?us-ascii?Q?9J+Ecyz8iDqRbvqWgkwEuVEwAM7pl/bpfGVo6jxdY1yjRfTyowkaSKwpACNe?=
 =?us-ascii?Q?6d6wAYiBKPN46H3kmA4pSRpgRDF5y7g7XC3nKzyHjGk2WhrAOK3YHhl2AnQI?=
 =?us-ascii?Q?Pi2bnYG3j72uhZPws5kJyfEf+IwPagaHiJf4Rq0B2vN7AFbcLZEZ9FImnxXB?=
 =?us-ascii?Q?KJINo+9LueurecD26FS/GME1Fqk8kmQ1kcWi8ldvJvNIgpcnNek2KD40icxg?=
 =?us-ascii?Q?YF4HTdeW2ZqD0es9Oh6vQZX7IJRhCW5iNwMWjQR3fgjTq9ND3QcYddd0+sJn?=
 =?us-ascii?Q?N3ywLIexn97mphJ3aCpJGfjZldurTJSKQ2FRU+2xqmFQMVm2XlNX9/xdW3iY?=
 =?us-ascii?Q?BrNTEkUkxNMVoGmMQY/j65kM/Cj8ZDbjsvuc3k0M7N5E5t5TZPoa5vF8xeCz?=
 =?us-ascii?Q?prtO4LyKjmYSTOQpx41JEDZ2dfhbWk5UqZJ1fz6kqiB8QtTBh9VBIOdwP+3a?=
 =?us-ascii?Q?hl2qxgd97BfGlxRbR+ggjjjMjlptcZxDeUHUEjypx+ZZAp4AzoYaFAabIKgg?=
 =?us-ascii?Q?HO6KS/GiE5CpK62mnRBExwNnB+p+//xq6qxHCigfk2bBqRuW4YSOGfzSf8ns?=
 =?us-ascii?Q?7DNRZqvh5qz6OtrqfrYcQ+hREpYqCAtP8AsDe9N4IcJRNnu0k6YEkEA01Blk?=
 =?us-ascii?Q?Gj12oKBPpi4Y/MUhsQM6t/E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51555bce-59bf-47d6-7653-08dcd394591c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 01:35:28.4478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AWSp8iLPZo4gSqSfj3E7OIkPvOQTEJdHxnRX6VXcO7x/NhjCX4vGjlX7Z3s8m8dk7WVUpPVjJ0ISdQhhTngfXnB1Qlvh8XTIeIgxMJPNhrVsTyAC9pn1gLQ/qnuhpero
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8733
Message-ID-Hash: 5SB7CM4LXSFU5MHKHWAZO4AFWNZFXZGC
X-Message-ID-Hash: 5SB7CM4LXSFU5MHKHWAZO4AFWNZFXZGC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SB7CM4LXSFU5MHKHWAZO4AFWNZFXZGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Takashi, Mark, Jaroslav

This is the reply for very old patch (almost 2 month ago).

> > > Many drivers are using below code to know the Sound direction.
> 
> > > 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> 
> > > This patch-set add snd_pcm_is_playback/capture() macro to handle it.
> 
> > NAK from my side (overdesign, no improved readability). The defines
> > (SNDRV_PCM_STREAM_*) are enough to check the stream type value correctly.
> 
> I have to say I do remember this being a little bit of a confusing idiom
> when I first stated looking at ALSA stuff, especially for capture only
> cases.

This patch-set got both Ack and Nack.
I wonder can I re-post this after merge-window again ?
I'm asking because this is very huge patch-set.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
