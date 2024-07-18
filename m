Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FEF93712B
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2024 01:43:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9F9DE7F;
	Fri, 19 Jul 2024 01:43:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9F9DE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721346200;
	bh=7gjw/vUqTVoH3XUqE1tG74Vul99ND40qJBu0oqDwLxc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r3s/vFwFG5/xPl2zXeWJYm/QlKjhHZ9A8JAJkeq4m4pGg7LllzgySEkgXz6LNe/Xz
	 VVUMTlZWiPNNvJJ0+xkRrjV1GenF3FdKk9vWYBJUrmDiPDXzevZ89e4OiYnvc7oG/C
	 br9dRkMDIXuiqB8HrKBls10/UxqmJ4Uy9KGALAOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59CA4F805B6; Fri, 19 Jul 2024 01:42:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 197EEF805B0;
	Fri, 19 Jul 2024 01:42:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82FDCF800FA; Fri, 19 Jul 2024 01:36:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 586B8F8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2024 01:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 586B8F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mmrRJVyR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MIZWywH0u7E3Jeb5URdPFty3Ckqe3SdNJEi8J1mZrii6zNl06zJgcijV+tdwf7y3mEcNbdmIppT7nYXrVdnckPDUcEhRApy0vGbtTDln5To6SImzw8AWNg9aT3bsWOMWgUBvEersq6vAnA251ALvjM10i1e27N11oHBXTIacjzohAYbYq1vnZsYb5HV6hYba4N6JM/fK/oUtp9McfIuzbfWjtKROFPl691vIW/QTrSiE4rlOHqeRAZACP2QxNOCJwItLZds+B+x5NpBwSEW+LFNiRXjJDTHXvPCxoKyW1RroqXAIaOPPzG+uPoE0sdazC0U/x2G8J3T1FRQk66IKKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGdbHSST0OtaSexSPQ2NSkiR0CznXAJArTvHN7fPgW4=;
 b=oiHcZaKkQlnJYCVUaEfemgFM8wUFJGCQx/RPsVRMLzEvUJmEyEI01FnPZJ5gz3yfw+DYrA5jvtOBKbXse9W1wg89RrBALAsLUYbJN2pV19zLWNv+roRS+D5wR7ToW59RLlnMma+WdC9pJtvA3RDUSULmkjXtM8XhjoZJZsSwhUgiwCMfnPBaBWfxOuACiW6QXDlcMahOiaSr0S6kZxjDpm7PW9ny7bDRAS5HGEbt20FuGxwDVt65dl4OtFfHOV3XQNuYaxEeFkh3oVE2zLoMBW4F/t7RKSqS1zGooW5TR2+O6QFG/42483e/04q78DlbGEv4Brqp02/9IxUz6qgSeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGdbHSST0OtaSexSPQ2NSkiR0CznXAJArTvHN7fPgW4=;
 b=mmrRJVyRRrAyV65pN7KVxrAVbg2m/mTAI8M+QSgP2sXfXqTXdIzANopqFoC6EGJ6f22uquNdfIll6oHbJJwsXM2mATLb8f692Od3KNTav7qXEZG56427RTcfxcI5B50oPBGaaPtmzoUKb+P/eQGuafBZ7vuK3rH2EEGPltND+Wo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11460.jpnprd01.prod.outlook.com
 (2603:1096:400:388::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 18 Jul
 2024 23:34:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 23:34:01 +0000
Message-ID: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [RFC 00/xx] ALSA: ALSA: add snd_stream_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 Jul 2024 23:34:01 +0000
X-ClientProxiedBy: TY2PR06CA0043.apcprd06.prod.outlook.com
 (2603:1096:404:2e::31) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11460:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e28ea6-91b8-4369-9e0c-08dca7821a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pQA4uCiWE+LeCWcgJhQov4xtsQ04lNlVBqZXL5JoHBNaAnCoJ7JpdAXWvcO7?=
 =?us-ascii?Q?tmz6Q2RStq1Z4Kmekkc/LwVaXkjfl4lYjtbQg/Q1qfvJ84a/LgyxF4EdiEFh?=
 =?us-ascii?Q?OcuA0DuOd2CA15bh5iwjMh95F97pm5zPDzPJ4RQ+dik/nr93JymoNJe6UKRz?=
 =?us-ascii?Q?weETcqpOXFrIKMgowlUdnPmxJXjPsqLTSldh7S1xRUldZpBxnRUj7y3NZxsy?=
 =?us-ascii?Q?fOb9CIfZ3TuZ8r4Sz9YHITyTIdozMtP8KW6e7JlYkpxRhhEoAP2pGB9hxmYM?=
 =?us-ascii?Q?JY+6rbS9oRXx46XEM9N7UPdrmni0cqQyXIHry09gYCpy30z7g/IJekZYnErF?=
 =?us-ascii?Q?NkI0pkknonXv3B/g6dYNQ8sSeJiccdzTFbZrUpInS0E2mT9fOh2ahEpMcvRg?=
 =?us-ascii?Q?oUKmhQv/7teeJT9i6ZNU+0Ny2RxDoFlZZaW9bfPSk/Wj3Yiw5J/K3W9LFffe?=
 =?us-ascii?Q?/tCepA9FbfP3pajAVnqjcjPyzgVTHsLvZ2agL0vG6rlHxQhHjAdmSLXLA5Iu?=
 =?us-ascii?Q?oxjpWo7Ubqa0TWJAE/ah2gaPrFTP/dZeF21Hrd18mY+HBjSkyzrLWDYv92ru?=
 =?us-ascii?Q?Za51EH/RAlkgJL/fA46c01hVEjcctmddDYOKs27mHPmm+0ckfgGaa+OHMeKu?=
 =?us-ascii?Q?99MPmMgG6HMgH/wlKZfC9BQ+s0LfnVWEBa7c/AZQMHBqSZEwle+OQ1sHIFJP?=
 =?us-ascii?Q?mrtLTKdfkGPpqhzmlmVNLsODzXyzZRgR3MZut/lUvn6A6540qCQCQqK1YJQp?=
 =?us-ascii?Q?arKvDHGb47U57ZSYNRRWidWQ8o4hlpdJpgSV/Gi3yeZlRYzR1jLFu1UwhFst?=
 =?us-ascii?Q?zC53Zmhkn+udrCYeJ4e5Xem2aNnVF1FjbeW2g9Ozj8W3xg2MEofG6aW1LqHI?=
 =?us-ascii?Q?hJ7EhHd1rOwYEKweVcmSu1sePYxcpYUyqXQ+r07C1lCEW7btNvRqK9/PIc2b?=
 =?us-ascii?Q?eXPbzRAnJrIhqcI17Kd1rfa8Mwq3qeIfzrMqUJbHxnKG1Cd4uf2qmitDuHqf?=
 =?us-ascii?Q?STwsMlgX5aKrll0v10AVwmQo4mMLWQ4DPSc4uN7gOtkFMLW6oXZ6msA38W+O?=
 =?us-ascii?Q?cq1CDuuVrecO/AXDpS9KYCIiE81YxcGdp2y2voGDuPRb4klp/O4Y3cbdUu8I?=
 =?us-ascii?Q?YEJ0NrkZYBHIg3ZNkNSVfbUotgK40iqQXIrVvooXBnVDELQeSzOFms1tRCqk?=
 =?us-ascii?Q?o7rVrhdL3wm4YRbDbm5l+D+D2akYPz6tCodlPLTpfX1FGnGYm60o1xEKZmgt?=
 =?us-ascii?Q?RsB+R0nyNnlUWmhn+oThBtj35UEfrjOUHdrCYwTtjhXvpRTy2baYLOmlsKf9?=
 =?us-ascii?Q?8Bdz0blSf6AekdFQe7dUHS/8nUnnoA1OZ7bNviMf2kksKv5SqFzwNXlbwEiA?=
 =?us-ascii?Q?z8kYqox/vSMnxVUQ5gJd009DvUibrj19jtN3iPhCruVt88NM/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/VTZTOThlVv7NN9pVKBiu0w+INp4fn9fcjZAMHwaHgAqqXRcm1+lzayxumnV?=
 =?us-ascii?Q?oM6YcXvTvMXYP7mas7BprpyXgXCjZbr6J/YDHyE4rsWSGYFURdPPaWAKL0QD?=
 =?us-ascii?Q?nPc9b9DRezNO8iDQjHb4oSsEJlZFOxivUONa4ZdDbWvX9D1+HJHFq/KaafcI?=
 =?us-ascii?Q?jCiYrghhWye0MsfL89YdQAUo2w+czm+UxddH6+r9uG0/gdg6cz8Vfkp8k1mZ?=
 =?us-ascii?Q?zipfSkL/UguOpx6uYM6pqA5tXlPoCwYVYyVZA3KLL7EwA5gM2qMVlqm2/K7v?=
 =?us-ascii?Q?DIJbfg22SFZhYUhPOPPxOeEuEKGCFHjN6r5CIK6VqmYYCpiQtuLSQyFTqgFc?=
 =?us-ascii?Q?AnjGvo7wwLvcmTXef3cdK4Z0oazllSASLZ7R73ipZRlQtSeIDbNSAu81LMMn?=
 =?us-ascii?Q?33cBGpyOAB9BLl66T602oR3yFRq+MkMTITNLWLJMQ1zYtpxUoFYoJlwUhYtq?=
 =?us-ascii?Q?FCemclh3kkXDqcZGbFvjpM2ipc4h6r52GJ08dNlrmz+lAm+StndfDIzJdwxw?=
 =?us-ascii?Q?co4/CUu0a/3mTQdcn/xKc49KDCWIUgxl/ASYitjG/AOj48JzIxKbWOv62Kni?=
 =?us-ascii?Q?snvuZ5Fns5TR1HeKWDS/bhuyj5DedJtcu2L0XNGxBrlPZsKCOG3bY2Y4KZJT?=
 =?us-ascii?Q?hei+pfpBbPvccHSTU1JKdYVrTs7iVWkutibrTskJUlodC8LTeWFs7DMP/FK9?=
 =?us-ascii?Q?gGa4zh7lDHCqtqa5fEz6O3jcMzsTMDakraOxJ2RQ8UYqpQLVi56B4ODiiGDQ?=
 =?us-ascii?Q?cRQHAGfBwVRlkVfNbZ1TSVT2f8NXe8hnkMcFoN0v+7IueZY3zTGstyvNePYx?=
 =?us-ascii?Q?O7/4ChwVR8iqm84JsiT6I6plWoqZYgUYAM9T0p+i71/x0ijf6UJ9EIIM8+V4?=
 =?us-ascii?Q?fcE8uH/Fw0Iv+pAell3l6ZoMHA5TSTrRRLPHhhkQzAzmriXQ9pHNFZAG6NIx?=
 =?us-ascii?Q?3VDGxHvFansbTRwSET/LwL1k5TBdW5IfOtFc08BJw79HHArDeKvujoNPrWpj?=
 =?us-ascii?Q?v63LZht7ZyLJkEhWTdDxKOUjhYXXRVwQqTuvulGGiAWkvnvVbJgbEkfhbK+5?=
 =?us-ascii?Q?ZTGjsYGG4BMFyfcgcns769/68xAAov0wNkKlU3y69Sfo8T8CERibK6CH8YNL?=
 =?us-ascii?Q?inYQYvpOWO2zyxWGdqyekyBiwfugQtWF/2oisyAIgTp+A7MkNWjr7AKHQyZ3?=
 =?us-ascii?Q?cLzOGGXGyoGdJ/fRC2NAVEjdBw0fgGQ554UlIfvVvFsyR4bxQlv40xoZOKzq?=
 =?us-ascii?Q?wrZyB8T3VuQZ5rZjQXm4eBCem0RRHLQGXtsyQjLFegshNFTUG8f+bQqHwUeD?=
 =?us-ascii?Q?Cf3UnMQ4g3MtOJSbNLDRaQpOEA6Sa4d7mOjZOmBo4w/tibQiT+N4eul4FaAm?=
 =?us-ascii?Q?/7aJztHVVsVfSoBGGRSVMc4CstY829S/yN5PEBpyENUz7ScuMn35XPhA/5TE?=
 =?us-ascii?Q?0NjZndPj/i92ANNzmTrtn5SCYf2yVSDnqkLuy2z+g1tJ0qz1N+RXV1YpSSZY?=
 =?us-ascii?Q?N09aWjMvXv1B1NoY4spbMNWaihETZHjwtWyZhUXKQQz1KuF/dnDT0l0tV/GV?=
 =?us-ascii?Q?ZLZRbnzEAeCokWTC5m+MfaGwYV/3avqN2EzYxcSP8xBYJIY5Fbwzq8ZjMJkf?=
 =?us-ascii?Q?RCYCCSnGqNVWt+wDU/Qjkhc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4e28ea6-91b8-4369-9e0c-08dca7821a9c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 23:34:01.4790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qCT08R9V5xLyJo214x/4TnDiZF2/HPe8FWzNZE9J9gEX44wJD/Fe3aah3Ns3Yb5N/4l2t58ou2cXaC5yu+drWn8YHEXxZQZnNMmS9fhSJPEoDfSSP5nSY1o0st/R7+hd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11460
Message-ID-Hash: 3LWHVYFNERFHFQUXGNP5TUZFOOHPXY6Z
X-Message-ID-Hash: 3LWHVYFNERFHFQUXGNP5TUZFOOHPXY6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LWHVYFNERFHFQUXGNP5TUZFOOHPXY6Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Iwai-san, Mark

Current many drivers are using below code to know its direction.

	if (direction == SNDRV_PCM_STREAM_PLAYBACK)

I think it should be handled by function. But is it acceptable idea ?
Because it will be too many patch-set, I want to know it was acceptable
idea or not before posting patch-bomb.

I will post main patch, and sample driver patches.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
