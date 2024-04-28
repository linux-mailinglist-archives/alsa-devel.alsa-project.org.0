Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D978B48E6
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2024 01:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B0AAA4D;
	Sun, 28 Apr 2024 01:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B0AAA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714259419;
	bh=cu2XpYAVFTUgCxMfXO9ydjhRECnbT0F/wKVL4TCbVwA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YZ7LxFAlP7djOuhVu8p+dsS0XycjDtB1Wvs11TGoZfwmBAMyBb3MsGqS9LwOvdXXP
	 n3O/P9t42imBJlB++pQPn8LW5ksdMITeGIqlaOcXN/mj43nLbptAGge6AlpqJ/8c1F
	 pL91RmoimmB9n2NmK9YW0W+a+QhZJCMyYv8HmTeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 014A9F80589; Sun, 28 Apr 2024 01:09:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CAE0F8011B;
	Sun, 28 Apr 2024 01:09:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE72BF8028D; Sun, 28 Apr 2024 01:09:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61F27F8003C
	for <alsa-devel@alsa-project.org>; Sun, 28 Apr 2024 01:09:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F27F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SpLhadb8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714259380; x=1745795380;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cu2XpYAVFTUgCxMfXO9ydjhRECnbT0F/wKVL4TCbVwA=;
  b=SpLhadb8MXgYWfZkuk5mfK7bIrAv5qgM3ftqzblDWG/vvHfdZaXwye1Y
   0cLmIiX155Pa5KgKeU0S7VIH1vnBhMD2TWfnUI8ngQ4+hCSW1OMNWggJ+
   U7gA1kEzAmjaYmyhJqN6ER6YaupGDM1K+PpZUf+PzOvd+iybbi4bRpLcM
   EfpbtXAIRx4E2Pw2I94oX8FL2xyYnS7P1gQ8vHy4VuxowZQTv/5vKAuLx
   JbN1LxJbEa1w8LIl03GOp1jwtKiZYci9H8ZkxB1QeL+kb7sajEuJWYq+W
   ZeSZPhJjBEENufKTHk4lWhSckSwLqjsJDBONzFbOC57vMtXMWhj6Y8X/5
   Q==;
X-CSE-ConnectionGUID: PyWdpuc1QeqO4gaWdSzIVw==
X-CSE-MsgGUID: xOj5/1iPRh6gIlcFDK7klQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21376437"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000";
   d="scan'208";a="21376437"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2024 16:09:34 -0700
X-CSE-ConnectionGUID: ZgY9oYquQXKNl44ZgwGFxg==
X-CSE-MsgGUID: ad7Law5URhCjSzVFZC5kow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000";
   d="scan'208";a="26166298"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Apr 2024 16:09:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Apr 2024 16:09:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Apr 2024 16:09:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 27 Apr 2024 16:09:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 27 Apr 2024 16:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkTwdXxctE6j3HhkPpxbwp85IXh/dAUqwX2rkPb5jy26NrI8neDbOL/+5b847hL0rRdX81RNqoVdcbDdtz3buV9pERAFS/vhKQxDRxQwXU7hJmk0r5H/RREWU5+tcfnah5Qv2i18fbvgv2U3EyS7AuKETpzmkKNGjl6CywC+LnvmwmLnJVVb1VyC+7EKePZovZL7hLe8MbKgVto4rCbOImXlLrdaZS1J80Xs5G1BfE+Z20Ue1Eyko1VTZ9Rz/qrcx4KbrlEl0bXM9BhJ0IgZD07gXNyd/kjSkZ9q+sGkqHjOpII5/ngNqJtAkfmKnaFMR+YqtCMEQUI+/WxCoOAI9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPc0wMPgWwMEvwwrUxNYKmgOqnzSalVFDGXlZkp9sz8=;
 b=QsWUAWDeLQ1vZk8/+QiQHazkNRiCTeIv0fuQ6YONsv8FvZBfsGirHKubMleEGZblRAX8s5p0LprjUvYzwOrT/YJ4hlcFdGUoESIFuyHlECZP+J2INE1UtwfR5HNws2ofCvTdNwyNLeCeFQReCZIeLOKuHHK46cVtKto95h6PYi4Hw45T9HDen++p9/y5SHZmdg5q0nlLqgWlCJ1in855iG4iHPYVb0xlodN3HXUe6CZLrwiZ4PtmPNCiy2DXIWXw+xwruv46UpsSboL2sHvR8s2XrHVCDwSsc40bVQh2m7NyF7eXhcPOxrjSsimGYLhpRy2xz5J4MmRC8Zym2r1sZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sat, 27 Apr
 2024 23:09:29 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.7519.031; Sat, 27 Apr 2024
 23:09:29 +0000
Date: Sat, 27 Apr 2024 16:09:26 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, Lukas Wunner <lukas@wunner.de>
CC: <gregkh@linuxfoundation.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Marc Herbert
	<marc.herbert@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-coco@lists.linux.dev>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: 
 <662d85a6ac2a2_b6e029449@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
 <ZiYrzzk9Me1aksmE@wunner.de>
 <662beb6ad280f_db82d29458@dwillia2-xfh.jf.intel.com.notmuch>
 <Ziv9984CJeQ4muZy@wunner.de>
 <662d2ca522cc6_b6e02942d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <Zi1qtKNwcyydP4c2@wunner.de>
 <662d6f24528d7_b6e0294d2@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <662d7e9a6d437_b6e029440@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: 
 <662d7e9a6d437_b6e029440@dwillia2-mobl3.amr.corp.intel.com.notmuch>
X-ClientProxiedBy: MW4PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:303:b6::23) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c67fdf2-3822-402b-9b86-08dc670f174d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?T0DrFyzIpeg4A/kFl8aMVtBKt0NVzU9rugEdURbeoQuYV3WVlC0HsSPVN8TN?=
 =?us-ascii?Q?JLZM2ITkiRmTaMfwoSnoBJhgDk2cfiZPSrEvZ30olEsXy4SBzpDFLFBSUcGk?=
 =?us-ascii?Q?zq2M6hu8J9iUx6mLWiQ5+IEwo/fHEu/vtE6e/ks0DxirHq7ihMa7vA2lI5Tf?=
 =?us-ascii?Q?+4sxGC0spD0p3tPMAkhJZyjkot5ZhrWbOdLV3F61ScJQmLHbTPRuPrxqMtgp?=
 =?us-ascii?Q?ycE5iz9UwCu4RTieA3gLLlsAlJQOUGRh+nJ7tkIQikbgK/PY9oASuOoxfxTp?=
 =?us-ascii?Q?X9cdSWe5set2Phgy7AY6BgPwMvko6lW0/gJ9HY+NUXURy8SoZ+rCcJf8L10S?=
 =?us-ascii?Q?wpKnaJLmkNmpL564FdS/Fee3VoWQVq2fNaXv069JkEOfPGFDN+OxsaovL5fy?=
 =?us-ascii?Q?WmlMxn49nn+eOobYmSPgtHz+NCFolf5/ZYSEGXmJxpZRdfOVcCAm3BnpN1Vj?=
 =?us-ascii?Q?YWyMsLhMfEwR6SJBl7Q71Kte2ZOmRCIxYFS4hf5YMH0d0ulDVoG+aEdxN14P?=
 =?us-ascii?Q?1kseCI9vJxMAnBMS3ffzZMK+C7iab/Eo3yvB08FuO+6KC2rzqEZ8oxSLFZLP?=
 =?us-ascii?Q?0WVp0CldbW08/YaR0AJfYKDRz+LfIhvclDoAxLKplKl1f6nHSdNLMTRx5jDz?=
 =?us-ascii?Q?INATrr4S4ZFGfj2a0f0lt540a4OcAO1XC5RCQt37hJi+m+GDIaJbfM8Z/KVy?=
 =?us-ascii?Q?5WHR209bliGdDSCQuPL50uaMmnSNDVe8baUBLFrznrVgPBuQQJ0fnu7gMKSU?=
 =?us-ascii?Q?edZzYZ10jjZX0UnvbiuRbz5wAStlszc/shG3HeIfOUPzEw0KBiVEHFoCXyAb?=
 =?us-ascii?Q?k6JP+ano/IZ0Be8jUYlpaR+QUDJt8q+JWOBpEhG2J5IqhmKIEXLfr+4DsYxe?=
 =?us-ascii?Q?yIW0WTO6ygVp4jAGgLaqNJiamU7OW8XIm85c14LjOZa9QNlNNfrFbfIT3+38?=
 =?us-ascii?Q?ts506/qEKFYeljuiG4sHupsVNg34NIJ9FgIMlXo5aK3xxMlYWF1IWZysgBtT?=
 =?us-ascii?Q?L4hj68xxkMHOMnEe7v12Qnav33hBH6E9XBFs6zVbUqX+iKdDhnY/w6ynGJ24?=
 =?us-ascii?Q?5JexiKPm+3V0XW8G8lfh3hvvclY2dNIuoxIQpVcrBlYd0JQ/7TRZ875OOxaS?=
 =?us-ascii?Q?jsEc3aTEeehWHz1BKD9gU7EYkoiMkUOBRlKvbyg8OjvLAQjFHW0D4S/23DAP?=
 =?us-ascii?Q?SzU/k1Ipp7VI5Za6jaCRERGAGhv8kLBowj45yGWqhmzhtmseCw0snR/WpZGG?=
 =?us-ascii?Q?YhedJw1kTdduiVEHE2jAxem9pRUNjsktMWNwFD+jdg=3D=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?sX0P8B99IWD7lez/aiSsiFDM4C716NOI0Xm6o3PUYuGLDKKLtS77pAjBsZfq?=
 =?us-ascii?Q?a+uDcSjgtfXmnvRYn9Aqty2MLtN0wdG1GbsNI1mWMHZ8KYavkxaaHdxDagIR?=
 =?us-ascii?Q?vdirUiFondoAyyOtRjar5YjYq7BxDe5o3pAlz7PuIgLZNJwmcDa7LeEfWTl1?=
 =?us-ascii?Q?vN6IP6BKK04Qyk/EMQtHXVJ4IRy7+LDUkfjBuue6xDgoKGCi6WD7V/AH+5zT?=
 =?us-ascii?Q?LtgUQ8kkmnLyQhegnU5sCBUh546r6J1CnKALKWsvsUI0uOjuoOECWsdcq+BC?=
 =?us-ascii?Q?P/H3Ua2b6aFbVSMfrACqKiLkEfULzT7R00ud6H6/NftSArFE9oIdkOQO3th7?=
 =?us-ascii?Q?6lNam+nFroWcWYIgV15ldScA2ADhWjBnsjkOSxONiB46Kl5m6lP2TrSSgc5s?=
 =?us-ascii?Q?ryr7MxHPRoQDwV2vpSoIB1UtC0NxEiDgPdNQtWyIWvVY/dCsm3MkwDI7ICcm?=
 =?us-ascii?Q?P2VKHZvqpWRa9mjfD+xWvgi5O2ba+Z1js3WqZTSDFZwWWb8z7zHSCIY84zql?=
 =?us-ascii?Q?EzYhUyhGt+tluWfJZ+9OP7sjgXpv+wNw/noC9/BJaHyousm5PifzCF0kDJs3?=
 =?us-ascii?Q?MVUXAOsbzPIvkkrmOcRDOPmxf1hlBVSoy/HCBSXhI1DL6Zuno28vvosxJFqh?=
 =?us-ascii?Q?zSyNtOmNymFZ4DjhfhGDEsmc8jdLnylIxg+fJdBzNwtOWo8W11o09x/r8tlU?=
 =?us-ascii?Q?NJz88qMsvBex6GXkjuP4gKTsUqnhu8EWWzMIPmP+Be1fcs6kXTGprz7GGYn7?=
 =?us-ascii?Q?oqe1jVoysQ/D0zh7J/X8s+V84nBU+WwQ60m7OGJkeMFrre3jrkttGY5dJxB/?=
 =?us-ascii?Q?VyBMhS/aXCx/NW7+yz/rr/iCcxb/hjMdS5u53ugKJzlUWVpeuQqa1/bVomhC?=
 =?us-ascii?Q?MHo8hf7Qt7oyRfpJvOzpqRljdPr54WWuq2DsAyVKx02+s3yH+dmyDsu038Gm?=
 =?us-ascii?Q?ukIRhV2++ZvyO2PcXUMr4kGUd0QQpYpBusqUNyLcANkGnUupU6lOkivf/PjN?=
 =?us-ascii?Q?OZiypagD67wHVeaZeRw7SB12z815UsYbNcqrWoVaIPWNCnRyrEu2QsD/gdSp?=
 =?us-ascii?Q?lm84c7TO5IgkdLPXAXGJYZ80BW159X4nHpasCcGJ9S3Ga/K5+nHHR6Rl8oV1?=
 =?us-ascii?Q?xoDB8oZ0oJmP+Hu3fWojdIHcujtnSXPm7jZusx1VIdzbntolNKBNU0VWdYfp?=
 =?us-ascii?Q?lC0UUvLgjH5mBzV9icTDIwQMpa7b+U3vnLH/wykybApJOfglq9meGTtX3Jna?=
 =?us-ascii?Q?LDgiFvO1XoVvdVoD72jo/gIiyJMIDXNThdCM6SOxA2UXsUzMHh4uKiKoA/rw?=
 =?us-ascii?Q?Xu5AxQUh8dtvNzB1XwUnmqI+EvL/90HLOdm/Dlc7y4+TtGUEPwcZWwKE/UY/?=
 =?us-ascii?Q?gR5CL0jsuhHjJ27ypyXYSA5jkJAf+LaOiTLQFyptlUZcV2fzEf+z6NfSkRDu?=
 =?us-ascii?Q?fggg1yJ+6fm+GB8j8Btgh71yAP20QgBoyYLXrU6MWZs9bVS6q089u3aMSubG?=
 =?us-ascii?Q?39swy4g8aeGJuB+v4VkRuPE9lTD0xySu8PX8e1EpMom2YJa+GYQ0kGgxzAXK?=
 =?us-ascii?Q?LeQ7fjW6N/9VA1mpUyzWBOYgvNT7qLiie4KpS/Uasvqc/2t8SYU3/wT5j+5g?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c67fdf2-3822-402b-9b86-08dc670f174d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2024 23:09:29.3906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SV1kSUpQSzwqaXmV7OQVthLfXKmVjzCUR5EheLk9RF+0zYcawzVnd7IvmcbulrqBPulsISeGpVoA9f2GdlXGalSSMjUB/D+XZPtbz9xcV/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
X-OriginatorOrg: intel.com
Message-ID-Hash: O3MCOGINS5MBYPPEQECNMGCW4VWIF7I5
X-Message-ID-Hash: O3MCOGINS5MBYPPEQECNMGCW4VWIF7I5
X-MailFrom: dan.j.williams@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O3MCOGINS5MBYPPEQECNMGCW4VWIF7I5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dan Williams wrote:
> Dan Williams wrote:
> > Lukas Wunner wrote:
> > > On Sat, Apr 27, 2024 at 09:49:41AM -0700, Dan Williams wrote:
> > > > Lukas Wunner wrote:
> > > > > But I want to raise awareness that the inability to hide
> > > > > empty attribute groups feels awkward.
> > > > 
> > > > That is fair, it was definitely some gymnastics to only change user
> > > > visible behavior for new "invisible aware" attribute groups that opt-in
> > > > while leaving all the legacy cases alone.
> > > > 
> > > > The concern is knowing when it is ok to call an is_visible() callback
> > > > with a NULL @attr argument, or knowing when an empty array actually
> > > > means "hide the group directory".
> > > > 
> > > > We could add a sentinel value to indicate "I am an empty attribute list
> > > > *AND* I want my directory hidden by default". However, that's almost
> > > > identical to requiring a placeholder attribute in the list just to make
> > > > __first_visible() happy.
> > > > 
> > > > Other ideas?
> > > 
> > > Perhaps an optional ->is_group_visible() callback in struct attribute_group
> > > which gets passed only the struct kobject pointer?
> > > 
> > > At least for PCI device authentication, that would be sufficient.
> > > I could get from the kobject to the corresponding struct device,
> > > then determine whether the device supports authentication or not.
> > > 
> > > Because it's a new, optional callback, there should be no compatibility
> > > issues.  The SYSFS_GROUP_INVISIBLE return code from the ->is_visible()
> > > call for individual attributes would not be needed then, at least in my
> > > use case.
> > 
> > That's where I started with this, but decided it was overkill to
> > increase the size of that data structure globally for a small number of
> > use cases.
> 
> Perhaps could try something like this:
> 
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index d22ad67a0f32..f4054cf08e58 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -33,11 +33,23 @@ static void remove_files(struct kernfs_node *parent,
>  
>  static umode_t __first_visible(const struct attribute_group *grp, struct kobject *kobj)
>  {
> -       if (grp->attrs && grp->attrs[0] && grp->is_visible)
> -               return grp->is_visible(kobj, grp->attrs[0], 0);
> +       if (grp->attrs && grp->is_visible) {
> +               struct attribute *attr = grp->attrs[0];
> +               struct attribute empty_attr = { 0 };
>  
> -       if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
> -               return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
> +               if (!attr)
> +                       attr = &empty_attr;
> +               return grp->is_visible(kobj, attr, 0);
> +       }
> +
> +       if (grp->bin_attrs && grp->is_bin_visible) {
> +               struct bin_attribute *bin_attr = grp->bin_attrs[0];
> +               struct bin_attribute empty_bin_attr = { 0 };
> +
> +               if (!bin_attr)
> +                       bin_attr = &empty_bin_attr;
> +               return grp->is_bin_visible(kobj, bin_attr, 0);
> +       }
>  
>         return 0;
>  }
> 
> ...because it is highly likely that existing is_visible() callers will
> return @attr->mode when they do not recognize the attribute. But this
> could lead to some subtle bugs if something only checks the attribute
> index value. For example:
> 
> lbr_is_visible(struct kobject *kobj, struct attribute *attr, int i)
> {
>         /* branches */
>         if (i == 0)
>                 return x86_pmu.lbr_nr ? attr->mode : 0;
> 
>         return (x86_pmu.flags & PMU_FL_BR_CNTR) ? attr->mode : 0;
> }
> 
> ...but in this case we get lucky because it would return attr->mode
> which is 0.

Oh, but if an is_visible() callback gets confused by empty_attr, that's
detectable:

    mode = grp->is_visible(kobj, attr, 0);
    if ((mode & ~SYSFS_GROUP_INVISIBLE) && attr == empty_attr)
            return 0;
           
...i.e. the only acceptable responses to an empty_attr check is 0 or
~SYSFS_GROUP_INVISIBLE.
