Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3B35ADBCC
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 01:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 461BF164E;
	Tue,  6 Sep 2022 01:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 461BF164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662419908;
	bh=S7Uwv47f5WleIw6JuoAzxMcObYCfaycZHZH63IwxLog=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I61bPWk1SGEPrcBORcLMjMaKF0zOCYcrOZ7r1QjaNo0EHvnd9kHBZje7tgXP3j8vT
	 /AoxVOqsdxnGIl1opFjY137FbrBM4hWUfZzqSm/SvxIeO+69Fnqd+iF/iwGpcaIZ7u
	 4M6bnRj8S8B422/RdMPSkfYTKIByjTP2JUxgRbq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1DB4F8032D;
	Tue,  6 Sep 2022 01:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F9BF80238; Tue,  6 Sep 2022 01:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0244F800CC
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 01:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0244F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="mbmd1cO4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUX10rRkfg4z8/89DYEgZQQta0hJTDr88Mzdirekn5qXL4g+LI29wwpZ73EBwav7pN1Q8uwSZq5LbjzczAK1qI47yhXdRkUYmZ5ZpkfmN5ucLTRhHtzhBGUuRlFA/xldkD2iRGCUSHwWdY1KceryskiPidZBo+CKn1t13AjKB1CVEPRig9yYVwTws6El1y2mhDR0vvvRipljBgK3wopSCHOtDjcCxygbPmKJrBY81iNSV2j51zjfRZTZhLYmy2NtGdojmCYNL3FDOySS4aV08+otp063KMgsJncK/1uUmcGINlMmjpGCeGptCalL6BZEE9QEh0MbtAWu3dQ+9e5Euw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgFS712Lw/YahtxBC5C4hhrlUb6pI28Np821sHTLcCc=;
 b=Ljo9f3tEwFdcoMSjeUt96d97md8JVSEbTHvSIcraqupYo1lyTftGbC6LaJD5EEIWO26E5Zj39z+MGTMEL6MQYHG5KARS4sMKViL6IeKEYjdt9etoLuooCk5gdLwc+nfK9/WAmuYi5c7JQRZdJU5+RMuZBICfPovl6bmKqw0yQ7v6JCLH0tzojRY9lFXTrGYKadvKmKXUk2lL4FQ81D0YQ1RmoIXiYQIXVXTGZf4vq9UyJMiVIkYSYN2TWYuRf7k6mo1bn9HrA0mcGyRmoR4MJDnXWp07jbVU11VYO/ydtTFYZNXcD20rnxTtm3ydOZDMRA8WFSweqgb3jCII0Qw1SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgFS712Lw/YahtxBC5C4hhrlUb6pI28Np821sHTLcCc=;
 b=mbmd1cO40tSkJFzuF1xlMYD5wyM4MldnBbla4pjTrZxJv7vWPxpyjKSp9yi7kSfD9tBzeyauzlufTrys4A5Tal/v0VxeS8dcwPeyPpeSzWIabBDN78jnVzXKHeAYIkMFnyJz279R/fn2+s5PWUdoUZMR/Tn9/J8DIMVJHr3vZzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8191.jpnprd01.prod.outlook.com (2603:1096:400:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 23:17:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 23:17:11 +0000
Message-ID: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: soc-dapm.c: random cleanup
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Sep 2022 23:17:11 +0000
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd2bbd21-cec8-4d00-6c7b-08da8f94c317
X-MS-TrafficTypeDiagnostic: TYCPR01MB8191:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7kw9aDRoF8A1Sf1p8Q1POzyJMFFvPn2MvRTcaTLZISgqrBHcUrr9c7G+z6TzOedf7bdnKvUfLU3pcCXFabUKkXKXHP78pip4sGmPRb0vqczr+67F+/ulDcUQBrmQgmIOE1uNDWqnszV4GkoP4AMCFMB1MqAVByqlKPyDy26x+OoUgdZ1VEOuYx6o04CxV4gZhb1hm489T2y0pd5fZl/tjq7xABqcVUJ0MiQa1QeV/9XmJhIBizQ5Mr7+IZb/nohDLHmJCybNSIw2963X2G79XjnsRil51gbI+0ohEE+a6uWInv4Op31zaXYopAbzy5SR/O7yrVR+YEtdVLP+7nY9FqjRPc5t/zz8TyOdd8vGMElGL1hXPhITg767jgHk6hXD4JvbCE+Urrg3LCHyOZRA0ccEvlEn1ivgb1R5bPcFRb3oZwP+MQHCRxkPdxl8Xk/eDBD6VNnEt1fvF3Qe4BtNNVfuM9O/aaAZ4cdyloMU0LgPeCtWRivx5UKUC+miL8xfkkp3ylzCGtAOOWU22WVg+IKThjJOMCXRMS/7Y/hQohOUvaX4hRPotSYm93ffzdCmewHsXEgo8Wwf3Agtty+uZdYOgdIWBb8DCPdjL1YMOk4g8ESAEQoZOn4xVcuWTk2YrZc1QuYEtgB3ZWGbjBEfjd7lwD7tkNzqlJZG9oYcigApgYC48inzMr+ElzoU8mEJCyBXifcHdlbAAOI5ZPvwjpocH0FfnhU/M3LKp++VKqFtJn0BptjPyLkSOCeTCr8nd55aTiijO8g6l+cW8rQVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(8936002)(83380400001)(8676002)(66476007)(66556008)(66946007)(4326008)(6506007)(52116002)(26005)(6512007)(4744005)(41300700001)(2616005)(186003)(86362001)(38100700002)(6916009)(316002)(2906002)(478600001)(6486002)(38350700002)(36756003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xj5nVL+D5rZSKDG+6x4EQMKf0jwKII9fnOOQS0tc14Ea00lcamvpMM5y2oOa?=
 =?us-ascii?Q?VPAOAILMULLR+RlvHJWey3rOjabhumbQXYhaMaoekCKmEwhPEbdNB4h0nIxa?=
 =?us-ascii?Q?/TNKwyhHah+i5yPXwd3SDRx7LBdglj9jV5T98Nc+zEEdLtYITAk/el3FC7Xc?=
 =?us-ascii?Q?svDEKQlT+Qrx5l5KBj0XiT+Fh2fnp0f3AR9WNz/XtWIiDQm7BfGhy/gFH84z?=
 =?us-ascii?Q?jMjIKsgqdsjmmtnwFHSLfvnL6AePCHB9cYtq6QzmtcwcyBBbTiqBV09cWrji?=
 =?us-ascii?Q?drd4IDUEqKtrSginQOLsT1+Tmq44KbHT42saPApxUrh185FAluqMqjFqonOK?=
 =?us-ascii?Q?ohvekO5nVZXh11ELAM8Lac6yPQ8dM0O/z4EJuim2cqC3lN2EeU/YPuWVi3gv?=
 =?us-ascii?Q?X46CWnP8O3nrBuhaovMRamFGctYs3FKCgOcNYhFKIDArIEIb0Nyb4oW5HWF5?=
 =?us-ascii?Q?OfM+tbyX8Kn/ro0G8GVzSb7PrVy/WU+ZIIeRA56vL4iaO6KRo4H5tYlt5eBP?=
 =?us-ascii?Q?3J4z0y3V4x3QYj8+P08Tt0+Ol5yc+m4F/rWrJpvNDNI7HBQ5PeQBMujIxHle?=
 =?us-ascii?Q?vVmr8tIVamaX9Dic4uYFiG1lnrAD2Stztw7aYai32trl9/we1WSk/BwRwrd9?=
 =?us-ascii?Q?VMnWhZwJPB6mG41fJPS6dZ6x4JqekQfHSVJ+yqDgdLsnomPA0o7/3pvdC5yK?=
 =?us-ascii?Q?Dn9oELeXpLN47R3oDGkoDjV3bqZAeH83FBJqvm89bjpn1CofbTpJKC5tVevh?=
 =?us-ascii?Q?pEA+x+r06VMrd8ynpNZdb1aaHoBVMpJ89X/OUdCT5JdIThON5HBmxLAtkvBS?=
 =?us-ascii?Q?nLXBngGeaLZukaxtJ4N/vDVbEWA5J5TTNrSNXuMKfQTxbBA1HP3K4bliJifp?=
 =?us-ascii?Q?anT4CLykZD4Eyft69fjuHV4ljNokBsh3clxixUe0fT3yEnBo5maarH4rc6yp?=
 =?us-ascii?Q?YINlUBGfpcksSkD7sYm6vH6EM+X6aGWfxLgjeNPA5K3lwnH63o2m4UvocEio?=
 =?us-ascii?Q?cfSsvJQjBepCPINO4+bCtReWrkhZnN1K4u6FEWW1ZQi7oxC0732lhgJt/gKR?=
 =?us-ascii?Q?JhhVAIFd/EM/QuB+Fccmc9wDkuZ6GgKeh3SS+9peZ0imxnmEbtEHER7ITPZh?=
 =?us-ascii?Q?hQBfztOK8GPlY+e60VvJZjK6r56nt4PqEpE6lUGKaD2wGYBiC6xMtBfiLtFO?=
 =?us-ascii?Q?CT3W6CmPLBgvQkVgY5Xs3mRvIQBlRLgRKqEu+q65NMINvFrudR54gSAVOYiw?=
 =?us-ascii?Q?VadYVaWj6UtmIVSfByMsJZ4Aa6uMUZWoL3wHzEFNweNsPDYrYVe2xjQ6mc42?=
 =?us-ascii?Q?TxP4/Es1nLmf0QKJJ8wjtvjVsUriWkBzFrbkFtm+eMuznLwDLTseFmCjZ8Jy?=
 =?us-ascii?Q?V1+jPwem82U2tAQur1NU1Usvvu5OXx8ik6zkG+I51OMJmueNT2Zu2e2ZzJxO?=
 =?us-ascii?Q?qKe/CaOLyf1mX5MwS7tT9x9SlXXvemoZx4Ogj97jcVaWuZXN360G5M+3Eqqm?=
 =?us-ascii?Q?jFPO8Y0uJ1Ki2wzgbGMzL3siafgDC5tUKP8Jx8nmknYEe8SmsSDbJS59d3f1?=
 =?us-ascii?Q?FQWJhfxNK4hox38IMVscHclfIixUPvBTNzsX8D1DFK4VQEjDHXrwffryEGbK?=
 =?us-ascii?Q?quKJTZy7+ur6/GDGGqyrwsQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2bbd21-cec8-4d00-6c7b-08da8f94c317
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 23:17:11.8464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jo9b5dbSujIG0XyZ8eJAj+hjj25QqIsXdA3wqr6EsFv+VB4hnZOTHJ8ocrO0kOvAXw5DocXnaFjE8BqJfjrOyVAjWTz2LyIE8DrcoT/v5sXPUHJdcv+ftDBxe+51Tyq8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8191
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Mark

These are cleanup patches for soc-dapm.c.
Each patches are not related, very random cleanup.

Kuninori Morimoto (4):
  ASoC: soc-dapm.c: don't use kzalloc() for param on snd_soc_dai_link_event_pre_pmu()
  ASoC: soc-dapm.c: don't use WARN_ON() at snd_soc_dai_link_event_pre_pmu()
  ASoC: soc-dapm.c: tidyup snd_soc_dai_link_event_pre_pmu()
  ASoC: soc-dapm.c: fixup snd_soc_dapm_new_control_unlocked() error handling

 sound/soc/soc-dapm.c | 77 +++++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 44 deletions(-)

-- 
2.25.1

