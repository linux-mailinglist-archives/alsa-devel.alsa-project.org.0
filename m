Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3479E96E62F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 01:28:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21861A4A;
	Fri,  6 Sep 2024 01:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21861A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725578910;
	bh=xfjN39osnkScP7eGPsKzHU25s4dTvhoDyqf35V/EnVM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BlWvexrlyYPmggU+wy0wHk7T8inZM5U9OBWe8tLVuXfdZxsWNcCcPZp+XWTEOH14w
	 N6BBxxVgzMbO3DvjukxD5ZoK72gYhMzkmrvfl9gCKHGb+H8wGM7mfsXeGabETgHiHO
	 JUVTmmAlrzct4bcWMVUGjWOc1b/XhjpTjfEv1+0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8E7AF804FC; Fri,  6 Sep 2024 01:27:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0117AF8032D;
	Fri,  6 Sep 2024 01:27:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B22F8016C; Fri,  6 Sep 2024 01:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05FD8F800E9
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 01:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FD8F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZZ3w5WOg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBVVDOEapguSXmm/IzawqZsJuZcRy3xpgLco3XeCqWK9ZIrghDvb+M59oN5oxtdzldFC8Rer3a7Nclai6SMARAhujCEjMPYUxrBRDqk/WNQ+xn7yidBnbqDSmv7+941H5ZFUYRPLRwYsazsHungMiUTx/dk8jHs6tgp5cyfDuCuQIIUvku9xQqxWtQ7+nGqn0SfNPJANKLSVprvRg5wnq7F/NMVu1+zE/vKjOJ1jJsZTmE/jhX4vVonQMTV0BlfXKZJg8weZCGauoC2gc0PaN3KCLeNtP53Nt4RnO1pTAca+X+oyPcJ0OVF1cIHugEmLp9j+X8Y3ky4fWUSqkCZYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJ4BwRG0EhR0LTlObZ5hDCOIgow9mHsL92psko0n/Yw=;
 b=XOVDJOws7C3oE+My2cUFPsgabE/Vsx//ro5zv1ha1okdDAo3sFSvpxJr+AVhdH95ElaATYNPPyvp5y6NGN63120fWmAiw8npBnAUkfZZxOQFUtgzxGHKXa2Kl1YispWuL0T89EcaXp7FSTJ5kmCrjzoGRFHsMbvlCELF/yrU57dZDX/fQ/kVTiOKeZ2JREYFiXTqKXy1CrIVe0d/LASFRbpEIk853m4cagBiZG8z0QLhXv5OObqHKEFz9cmnZbd/ebni7GV1kYdCL+EnjgJD+tRfRterqQAqsTM+6RHqrlPAALMCpvvYEupR2zpUd5OmLSeC6DwtVhosurZqSqK55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJ4BwRG0EhR0LTlObZ5hDCOIgow9mHsL92psko0n/Yw=;
 b=ZZ3w5WOgXr7R9UsMGSvp+Z4AbhuDYDHdxXMk9DJyvWsMEzPPb9uhNZXbMVqtfbqBkFVufKCv+vQhaR9YrWlJh/E7Z68y2MXcmIH0+W1YlBF6beR9yaKJEgyiEjLAXEkSUkKVmJ+JUuZEZdl4OTrL4XojqFFtMrwcyhDNuOPuqXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12401.jpnprd01.prod.outlook.com
 (2603:1096:405:f9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Thu, 5 Sep
 2024 23:27:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7939.017; Thu, 5 Sep 2024
 23:27:42 +0000
Message-ID: <87seudr89e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: How to handle complex Codec2Codec
In-Reply-To: <aeb9d0e9-ac50-40c4-88dd-30cfa164d7c8@sirena.org.uk>
References: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
	<31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
	<87ed62ogvp.wl-kuninori.morimoto.gx@renesas.com>
	<fe428f02-3eca-4dce-9eef-675cf3e56831@sirena.org.uk>
	<87plpikfgv.wl-kuninori.morimoto.gx@renesas.com>
	<aeb9d0e9-ac50-40c4-88dd-30cfa164d7c8@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Sep 2024 23:27:41 +0000
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12401:EE_
X-MS-Office365-Filtering-Correlation-Id: 1492576d-2486-4d22-3027-08dcce0256ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?37cu4v4KEP9PqdPVSDAOtYZNrPxSEDcKmCpmTsiRYF3SG67t4F7vTQYhbxi7?=
 =?us-ascii?Q?nLDRiZ5TOuFygzSScFlH2LeFRnL3VYbHSVYDJq6YiuoXrOyNfmyZ0AM19Ei+?=
 =?us-ascii?Q?JhW6qzrbVM7C3gMRaQcneZ+M4H1cQszLLRRkvqp5+dIwii9PqQATmcVDLsCj?=
 =?us-ascii?Q?xUB4LKtIcX9CnZIUSYTle/QtVRwKiUux2rRo9fkMuwLvN+5SkB2beQqaH0QF?=
 =?us-ascii?Q?W3zgSqkaIRS2mX584poN0T9HzoTJ7NeXFtzcTXUaq4QcIpe3T7P3heaNsIHc?=
 =?us-ascii?Q?GLAJMJaTXhPjOG3d1TQV8R76S2CAjElpVRy+RMOaVGdf6xpEqaitEGYuYiTY?=
 =?us-ascii?Q?6hn2x2Oe/2RahhfclcCiJ0rarAHg8rHd7cUppwyMLyPxXJfG44n1ySt5J/mS?=
 =?us-ascii?Q?b59bOs66sSYPV/Orp1mdcKjhbUxG9ptHCJLUewOlQ2yrgd3KeHk1Ik63VzF3?=
 =?us-ascii?Q?2ekzFLtSvYcm7WfiuxRCB9uKX2ZWrPRpg8uKZEeRah0AA1He0xz1RflVkcgr?=
 =?us-ascii?Q?E2xyolBNhySUzZ1ojV5HDsFQg05h0MZ9tsksDquWwjfyviQT7VqLGSf3x51s?=
 =?us-ascii?Q?H+8uPqV5+ZgBuLHOCpu+PjEg1uBqyQTmHovuZfbNQwp6uylXj3HgEcBZLicP?=
 =?us-ascii?Q?InT6XOnQu7GVFOvJ/1g2H44Jpo9/n+ns2Yo5zJeGxpO3fpp8m532PrOwbRVa?=
 =?us-ascii?Q?7SiGrCniaX93m6NIMchHI82isa+kHmO8Md79JvMJJE9IECI5qbb9Thk8i270?=
 =?us-ascii?Q?iLNq6mASmmpUbG0YIDlc2Ye2SVWpqklRfarB3kwd/i+TLs5jNDqFA47gbk8q?=
 =?us-ascii?Q?ajBAnMQF6LQqvDe7YKdn6aepfYPHpprxWGe4TeXs84HLcRZ3Tj9EonVkCjbx?=
 =?us-ascii?Q?n7oCbYRoemPHSU/u5QAqxHNtYRdJrP2yUTvHRiplpYBs2DcF7PfnvRVE7Ivf?=
 =?us-ascii?Q?/yT9sFDFJRXtnZ9P9bLhozXrHtpMAPO+UW798E0eJLRlEUVLu/g4gUS7aTCg?=
 =?us-ascii?Q?XtHxnaJ9B6InnynB3joQY10o85qKjlC/ydIXxMqC9tDyuHq/FJwA+TyzTS7f?=
 =?us-ascii?Q?E9PsdGeItbGeSk5PXg1hfOg+P7/QCpT9mNDi1U8N8cRhsj/9/ku9M7GydTFb?=
 =?us-ascii?Q?DPKqctVuYYt69JZ8B5hxHMHHcbAeR7AVYd5gtApv9lqZErvZb6qEjUSbIqjf?=
 =?us-ascii?Q?19JuctE4FBJ/B6yglsaYbqjpR7DWguEYQCvrQtkoaGoBJHybAwOZh/BGY4FO?=
 =?us-ascii?Q?1Trmncqk1FhWyU6Fmj5fM4faL0PXkXiTeIgjjdQAtvflz1nc/lng9sLQDFX4?=
 =?us-ascii?Q?V4NBEHjXRn55uTxRziMLSj7+QmnVfsAThb66HNEpMIFoIlE++5mU8fM9Eody?=
 =?us-ascii?Q?z3lHN2hJefUBhHRv4pb5N5W4FFLp/Se8oCOJpOng8TxBAeAqRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HGEAB1DdxlAco6UpCxyqqpghxbmzzNtTxmwH3/p480TAlLzwWZjOrAZVXf9h?=
 =?us-ascii?Q?PAHtgCqOBXDxX6RUeouYhS8kWwl9SulIwZBEEqG8r6Fy9UcvmdPc/FzcDkwF?=
 =?us-ascii?Q?QKodtHJKasDbl99j2PeKLBDYigKrqT/Ml/aWBMH5rJTSjiyDJlpGGTvT9jIj?=
 =?us-ascii?Q?kqbgOkyPboxmN7U2sosY2CKVh2XyGsB4Atjss6h5P9D+Su5kYIwSj0SPM0BH?=
 =?us-ascii?Q?aqiBqSB5Xps/mdIx4EAPOoYVXs3fJU5oswKamCWvZQ57iDfDP1PFUPIlzRQV?=
 =?us-ascii?Q?jbETABp5NQpnrSgL1OWEzXiHnbmcl5VfFoE9zM+DClKKC05DnA9yKarvv0OO?=
 =?us-ascii?Q?aOZIL9rD06tEVfqVe3WfHigwVI4OVwaByigu8yZ3U/ZfpYIqMn2QYISYph4/?=
 =?us-ascii?Q?/3cLZaE6CccDSo/DtsIMsBomYl0bUeHgKZEsg0BiqK4Xmvfnf54cLaNmtQ9E?=
 =?us-ascii?Q?NOTL48N7df0dSMikRdZYIuBxVK17eu9S5sf+Q0XCOd9ADexcAvX65ZbP8esj?=
 =?us-ascii?Q?5Y1J/S0ZRNeW8uHDZFaKbsFZTAJo30Nx0EsfJmT0dPzWnML67P/Hqs85TA13?=
 =?us-ascii?Q?ZnTmEjQw6jjz/uLSCmNYO4nWTh3u7lHjbM2W4RCYrvZOZgG6AyYYGTtb6C8E?=
 =?us-ascii?Q?tqfp4B0eE/DVDQ9aXEk/UnA9fSJkIheE4kPo2ASYN4z7Wt3PPqyai6wFJveO?=
 =?us-ascii?Q?Pqg4j3in+s2frDa2r50SDz6pqqE5NWeO55cnMbvZPt7642UZhu13dODjsaJ5?=
 =?us-ascii?Q?YqQ+ncDy/T0yyVruPmbmQrdeCgFFMRl7jGVSQwU54S0K4qq2B7nnyZ/DLBXM?=
 =?us-ascii?Q?5LtT2KA4LW+MdiGn7Q2epXUDVLdRGsqwVrp717YuzXzmCLaEUM6OVgBAtrqJ?=
 =?us-ascii?Q?iv2Vk71iIophBgcHj65svEtCah32lLEYfFTrrs+o1Ge0hSKtIESZ5TxKemUk?=
 =?us-ascii?Q?G7XxYHsRC2AZpWigm/Eo1QSyDyFGerzgY1TnR75QaiVuLKd3n7ua5G7G86vT?=
 =?us-ascii?Q?4uNEwZ+92nTk0SD+hqLIhxrxb86ct7gtKuXusaFI8xVgSEmR01Ay3dc4ZKAU?=
 =?us-ascii?Q?f4NMMOoMUs9Q+FCJJN7BGuY0TPdRBlPQtGaMkkq3PPxRRQSatoR+2Jpc/My/?=
 =?us-ascii?Q?Vv/ajM8A3TZBdgWTMYkYSJvxJYjYutu4P+yuit3bMZbAvTC4bmwSkqJvsaeQ?=
 =?us-ascii?Q?nezB6cKT13wH00b0pH9WxZnN19VOhUXLLJAd0s5YqP8rAAweqZglzaUfE1yT?=
 =?us-ascii?Q?JadVIkX8sHZ0Aw6pyiOJu9s5aX0QbAiiHVhrsy4H1RkpQsNlZweOxw0DHIzp?=
 =?us-ascii?Q?4uNCgsfhUcv6nlDBgK71dG6HcTUbkFbHLyWelc98qYenV7dT8KVCpaMVynL4?=
 =?us-ascii?Q?i74uTYZtEsHjA3m0+w6yAMg9Kw9SZBVke/uoyz//JU0TGHQt6Z4bZ/oMsF7x?=
 =?us-ascii?Q?EEXqZ38JQtuz9GWILTcSvMVhhQRI9ktX1zPbaxIS5vUyc/tSGnUw7WRt8WxJ?=
 =?us-ascii?Q?7UJ7n2AfLvAaF1TahoVZG6GEfzAsJUsRfvUduQVTUzvvemct1aL1G/pddkxj?=
 =?us-ascii?Q?HZr1l2mRJVQuZZhOM4kJ0xuftLOG1NrHG4ofFNZigBUG1GnPyPCydFpAwAz3?=
 =?us-ascii?Q?JnhhC4fGnqiQbiF1N/7wmgk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1492576d-2486-4d22-3027-08dcce0256ab
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 23:27:42.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SGwOVTtyYsH4KFXyo9jIrl7Jj14Y1tx60hqnq9BNcexBWMAwJlWwQQBk20YpoKMZR46HnlCkrwDia70FKMhaWm2XJUEHxKB7t/lDFVzYZB6WUuBthTNqaGnw9pskqMtx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12401
Message-ID-Hash: GEYE4XEKUKLOWR4IQHASX2NBSHODITSJ
X-Message-ID-Hash: GEYE4XEKUKLOWR4IQHASX2NBSHODITSJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEYE4XEKUKLOWR4IQHASX2NBSHODITSJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

> > We want to have new style connection which is more flexible, and is
> > possible to handle all connection in same way ?
> > ... that may be an exaggeration.
> 
> Yeah, at a super high level we want to be able to handle digital audio
> with DAPM like analog audio, the main thing is we'd need to propagate
> digital parameters along as well as just on/off status, and support
> conversions.

Very rough speaking, we don't want to break existing connections
(normal, DPCM, Codec2Codec, etc), and enable to use new style right ?
Let's name current style as PCMv1. I think we want to grouping related
things into one place, let's say soc-pcm.c, in roughly.

And make new style (PCMv2) at soc-pcm2.c, for example.
Then, we can swtich v1 or v2 somehow, like below ?

	-------- soc-pcm.c -----
	struct pcm_connection pcm1_connection = {
		.ver = 1,
		.new_pcm = soc_new_pcm,
		...
	};
	-------- soc-pcm2.c -----
	struct pcm_connection pcm2_connection = {
		.ver = 2,
		.new_pcm = new_pcm,
		...
	};
	-------- soc-core.c -----
	if (ver == v1)
		connection = pcm1_connection
	else (ver == v2)
		connection = pcm2_connection

-	ret = soc_new_pcm(rtd, num);
+	ret = connection->new_pcm(rtd, num);

We can create PCMv3, v4, v5... in the future if existing connection
style was not good enough. ... well... this is almost "ideal" ;P


Thank you for your help !!

Best regards
---
Kuninori Morimoto
