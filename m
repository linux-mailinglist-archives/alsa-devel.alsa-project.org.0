Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85A8B3ECB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 20:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D8BE85;
	Fri, 26 Apr 2024 19:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D8BE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714154402;
	bh=dT5boOq0BIAbVb2tOLkkizjeMcJjRG9SBwkMP6o8Jvc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FdlTWwa2aak9DTaSyX4/xMftu5gcbkzlrmo0s57GZ8yyCDzzfw3/Zr6zxIaw1HBRj
	 pprw2I85Z3wrfJU5QKltKK06WJ/kv9SFGjS3QLqLsuaQJInkV2XH6edztyDUMMDymP
	 44LfMb+sKWTG/LpalrGxam8yNSI5uamymE/2XDG8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5749DF80568; Fri, 26 Apr 2024 19:59:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B477FF805A1;
	Fri, 26 Apr 2024 19:59:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2F5AF80423; Fri, 26 Apr 2024 19:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1622BF8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 19:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1622BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KQo573h4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714154359; x=1745690359;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dT5boOq0BIAbVb2tOLkkizjeMcJjRG9SBwkMP6o8Jvc=;
  b=KQo573h4YvfXjpsQIv1PtuceGmkYIaR9IX1f31J79NTpJ+ielFk9dPzt
   HuWwmc8rwzv/vXwJ6krZnJg9DG/O2aL/Mqc46JDmNJneYKqHGBdjBpRU2
   ejyFfEqN/Aszml8Hr30FOINKOQENrw126vChzqrn/eu8WBRMQzzCQgjs/
   n7cl9l8Nv1h/pC6EOU5XU3I+gOZpb8tUoK154WcE7t4pL+8ZvYSSQBlYq
   0WeekTtWcOmSCdGqxm3MiEd3cCOiED7XV1fXXIl6G3IWhEC8tl6HnlN9I
   LkS+3bCckLvtvfD7yY7EEGPzgQFhQNR6c31zW7KoUTdgh8JdYMVOebDiD
   g==;
X-CSE-ConnectionGUID: 7H8heS6aTVuPaZbgWSX5yg==
X-CSE-MsgGUID: /JIXQEEqREGgWK8kDQ4t9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10432214"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="10432214"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 10:59:13 -0700
X-CSE-ConnectionGUID: htifvE8RSA6FuOjzlTnnxA==
X-CSE-MsgGUID: U9mYtCkSQDG2ASSYOSgy1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000";
   d="scan'208";a="25374915"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 10:59:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 10:59:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 10:59:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 10:59:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 10:59:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWI/dCr9GTWc5tASXBQi2b2UPwueuOGnPYIR647ny9qt8QHFaDnfoc2UYBW3/6dNEEipsK7nX4estH5cVaQz7MYtqhvRRFVFj7V6RcNwG0jT0+Qq3cqEUc0Q9iahPz4wTCjfJs9oF+JGFGggiu51tGkPpJi26+WLZFen6LxCeQENvlCojtsSXmdo8aqbTyXblUu81gXpTbf93Z/Cbih+lDDT3VSKzZfEfJelnAExXQ3PTUl3FJbr0bmy18fM1hmz2omLMUmSuEMNzkWy3uBsAlab7QAPZ68AicvFLehvJwviS72yedSaRgRZszoIPoyILaJRDvZYurj5UPh+Ua5tJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WBbRS3HaXSYkrtnGnuF+0hCjLKOgyS3qVIVNatecIg=;
 b=ha/A0CSu0vBdiYnUqK+gFCNxZUfN33ZlVWWP+3Yk7Y1tjjFNTbhORgP50t/W0DUYykukjeYm0Fj81j9WUPyIwStojaGCxripnomp23boMMuvwznuU1ODiKT+FjQZaT/fFzowPx6lbA71Cn3Km7uWP4bKAwQ3gZyBLI2qdDZqQaWXxr9Cs5s/PMUN4n2h6AdV305aHvXu69y2RaA1QSF334YEFb7mmeFtJaos2Soui0s3Zkdc/bSc0LOET9JN2XhDAllrv7BWKdzVloPbPw0sqIdG7aukxXiUON54UquraEHKrhR1sSQJWyPTnpufv5Fjyy2YQrK/nDqlIYO4FWuqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Fri, 26 Apr
 2024 17:59:09 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::82fd:75df:40d7:ed71]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::82fd:75df:40d7:ed71%4]) with mapi id 15.20.7452.046; Fri, 26 Apr 2024
 17:59:09 +0000
Date: Fri, 26 Apr 2024 10:59:06 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Lukas Wunner <lukas@wunner.de>, Dan Williams <dan.j.williams@intel.com>
CC: <gregkh@linuxfoundation.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Marc Herbert
	<marc.herbert@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-coco@lists.linux.dev>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: <662beb6ad280f_db82d29458@dwillia2-xfh.jf.intel.com.notmuch>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
 <ZiYrzzk9Me1aksmE@wunner.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZiYrzzk9Me1aksmE@wunner.de>
X-ClientProxiedBy: MW4PR03CA0230.namprd03.prod.outlook.com
 (2603:10b6:303:b9::25) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f6fb6c2-0c69-4666-d5f7-08dc661a9273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?/VwLNR6EFcaQaNBdV989YyIw/0pLj6WFkE6ui+PHWKm4zuV9mhq9WInrrUTI?=
 =?us-ascii?Q?TEbHhh3Un/ms3K4lst1YXHo4fJ5RGBaHYZnX1NVEHUz55CIgOI5IGvjieXH4?=
 =?us-ascii?Q?5fsN2fvdm1NiOo4cKBAPQajUb8eqjmqm8HyvCGRWr4q3FrbFFfQeQp6NSw4u?=
 =?us-ascii?Q?KavNRo+7bU2y4cz0Urme0JbDjbacMSraXmwC9VX+tiOS8K0JEphWFIQLqgdr?=
 =?us-ascii?Q?rBcvZI28p9Lcihpgsr3u4jNPEGV41tBmlYa280TfslU35n8WiPBDNg8dNALq?=
 =?us-ascii?Q?xHpshDRY6dj/piRr3TLvhX6lVr/ETdySOT4kKkIxWO29nxt+zF7+a8WsIPs6?=
 =?us-ascii?Q?WYscHZmKVVdrPGa6vGktSC8IIJl0BkkD7Lp4uW5mw5FgOoaExZyVB9rEQNeh?=
 =?us-ascii?Q?Uff3eY/IR+3m+YbUXS6E1zLExxCCCXkXaEMJfTlmjm0ueX0iY8r/ZHDtghw3?=
 =?us-ascii?Q?g8F5oCS4SlAI6ePBOQSH2xuI/vGJfLrKwhV9G1ntCN9xnkYfRWuVPxkkJJQr?=
 =?us-ascii?Q?jIUgajy7VEKrjQ6t+HXETwe8hQXGDv27e3DnGrt+neTrIwFKxXJA7ikRfpT/?=
 =?us-ascii?Q?fUfwpwyBkKz1ic9AJkVlRJIe+XUiEc8e+j9N3bAVFN/aEH/DLhZ4MsybmRgk?=
 =?us-ascii?Q?n3po6OG/e72CopiOvERDbm3S+dPcXeKVPbXU8B9ii+K09zh7HYQ5KgPphpYH?=
 =?us-ascii?Q?i+vuS2tVY6S5+AH2vq8Vg/9lASS2Gn871KkrmmLJ1vvLxBcd6/sPQI1zb6bA?=
 =?us-ascii?Q?jNrrtIWsNE9zxiu+vHzh6o9cEeg9MJXf2gAXV3EZxdlSwQBhxpnh82CbQL7M?=
 =?us-ascii?Q?SI+kKqWodgdA9x2B1KCviWukWknhMmKyq1tsDntdRqZ7xmZ62pJCrm6/d00k?=
 =?us-ascii?Q?59ejFJUT+juEvapnZt9ZpDx/1xPcAnAVRjP3eYxHotVfiPuiQ98I1OEDCoaQ?=
 =?us-ascii?Q?LVLhJmlEXvHvdwxCUMjtBM3QwtB7UHuA3ffMkea9I78OMt/qAYa9eTrxywPm?=
 =?us-ascii?Q?ucqEWDD1Zq4Q9T9ipQfAOpcCrHNKv4UkMD73OIux29PrIUs6/ebEguI5kTt5?=
 =?us-ascii?Q?FU/jA3XeckuDdGN97zbJ0mGmu4BHiDmiM2CM++MNOu9zlHO+K84Hwi+VXnoF?=
 =?us-ascii?Q?mpGb5bIINovn8Rg8kyeX9p2azpRsAOnu7tTAHfVgG86cEsgu3gUfKl/Ufpri?=
 =?us-ascii?Q?FoCYyj6+9MJzKyx6CbJBsSIxauOMr7D4gKziaEmio7VNywl9tUZs1yAxfEA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?bOa9NpvvXnX+jrclANyH9VkAwze9JdpP/rkd9e3SaHclmOVvhLGhrY0J9jdo?=
 =?us-ascii?Q?UdToF3o83YF2RpTm6EY4r395Y8uy+gFA7bVphB8dZ05sX5MG2FYP1EnJgiDg?=
 =?us-ascii?Q?WclYYh9B/TExqcMyhDoB3RKDfPSrwkVIiTtB0UszLq7mRmqV0K4uGJoqRV+K?=
 =?us-ascii?Q?szOHUW4eiF9DouVFA70FrAReApqtqN3wTtJmBBnzi088kzJE0SBZvYhREfeA?=
 =?us-ascii?Q?LRDhQNbx7EEQYMYNxBSfnjeysUGMUcpTlumMBkTxhezpCMfSUAhz7GSlJUZa?=
 =?us-ascii?Q?/ISn3oZYsS4HgRfdVUjzsP7RM2gX3CHkmo19UE07a63rUmb8Bn+1pajViFZD?=
 =?us-ascii?Q?FJtTBg/tWowIbdGZUs14iDkm79T2HpQwUjkVIWywOWEcxyHkCvKhN/IezcGR?=
 =?us-ascii?Q?FzsqmhXfcHFOMw8MFJF1V3NxFnV+xJ9IU+g82Rwm+8CkySDGAWRafbwZcS2W?=
 =?us-ascii?Q?Fst3PNZrGI7bG3YOIitZ7KUgGLTApE0m5o1AVpB0bbVF8V3DO4AEwLYWa2JD?=
 =?us-ascii?Q?cqQdpkJJcN7Kdv9NcL7AYRTsaoy8rJZGKP/+X0+xBFCRDM6xEgp9NdxwxzBU?=
 =?us-ascii?Q?P723nHyNOhJaZGmFpoijTQo+w6XU77pdzTMdOXZ7iBhmhgWQECdgSVQXKKsL?=
 =?us-ascii?Q?4a0bXpHR1q9haLQ6EI731Ma6AAxvx3RjgSKri/UkyP+mzj3Ct8agVoTCvl3K?=
 =?us-ascii?Q?y/Srvb2I794PHGB91+TYyU7Y6NFKS1QRc2y4eFDkM+/CNZb2wNwOlYY82Pke?=
 =?us-ascii?Q?gLTO5F0UON4w4nLTlw2mLGEwW5o+KBrj40ULSdpqMWjZkY6IgjnmA58oKppk?=
 =?us-ascii?Q?c38NL2iPoJx4oGsbEHT/pX9g9afNBy4pJzVC+ognTPaaJC+JRwb7RKzZ7ShR?=
 =?us-ascii?Q?cxFtf2WetvxpP6DM8uSZvVc1ZYL+0stF9EXpv4WOXOyCXv4AbT4+H4nK8v7J?=
 =?us-ascii?Q?n4FQrPlhsJmw/hTjZLf8IJVTyCJ7EhpD4JnoYTqPbsTQoGYd53YANEN3IWyi?=
 =?us-ascii?Q?wPKWr3Wr/mdcLIp4pQZit/zIbrKy3L5GbM47T8n3JuX9w2++ah20ilowjA7A?=
 =?us-ascii?Q?8TKPNOkA5mpVJ5yRHiMiBF+YafKY9h1RkQ64t9es3ahUYlrMqtRrS+bVvcEg?=
 =?us-ascii?Q?A8MsjstjxjrdPOLvXgbVK3WlT0W+bbl54rBDzbhfeImofHZJj3I7UM3KoD8K?=
 =?us-ascii?Q?Huqrw6TDlmrHj6tZun0EqY5Oca6DuM8kspS6rWlQ37XoGqKCZeOeXIsPU/8P?=
 =?us-ascii?Q?B9NITMvW1fRihshyRdJQZng3KJ2erFqvjjuWF4s59D97lGiENSGiemSQrM8/?=
 =?us-ascii?Q?ffG/KLlm4xKDJ1oYoporL0w0dlREXUJvVdDDrosc+ZIENbmE9LC+24lvDbSI?=
 =?us-ascii?Q?rINYa0uT15YZQZZCeyrNVUm4kL/v1XFG9luWKSI/I9pr58PzA3rwViFppl4X?=
 =?us-ascii?Q?c3QVS/YkgwP7VqAETijIk8Vl7Dclqli9o3M6kT5hUQck+BarYeBwiGdX0bnv?=
 =?us-ascii?Q?6pWJmXbsL9AdDo6eTlOu/h5w4thTPu5g5Il5ryVBpZi1+MdqtBhbbt1d1ejC?=
 =?us-ascii?Q?GyvFkyuvDLT8bAXVda4rZxxPM6a0Kpwdu09NOMMGeLGeZQBbTklBW1C+NfYD?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f6fb6c2-0c69-4666-d5f7-08dc661a9273
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 17:59:09.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XRmiOD2rda2/k9TZvvr2hpmxr3i8UjvInBzCOKtIF82glPdeNwty8qn7J7Bl+VpJzXHGCsHbm15DP1+34Mt9yOD7Dx1JcZV+6SRJJcIX+xA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
X-OriginatorOrg: intel.com
Message-ID-Hash: E7AOZYLY6IZMS3DZ3GRJRCADTE2A3YQ2
X-Message-ID-Hash: E7AOZYLY6IZMS3DZ3GRJRCADTE2A3YQ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7AOZYLY6IZMS3DZ3GRJRCADTE2A3YQ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Lukas Wunner wrote:
[..]
> > --- a/fs/sysfs/group.c
> > +++ b/fs/sysfs/group.c
> > @@ -33,10 +33,10 @@ static void remove_files(struct kernfs_node *parent,
> >  
> >  static umode_t __first_visible(const struct attribute_group *grp, struct kobject *kobj)
> >  {
> > -	if (grp->attrs && grp->is_visible)
> > +	if (grp->attrs && grp->attrs[0] && grp->is_visible)
> >  		return grp->is_visible(kobj, grp->attrs[0], 0);
> >  
> > -	if (grp->bin_attrs && grp->is_bin_visible)
> > +	if (grp->bin_attrs && grp->bin_attrs[0] && grp->is_bin_visible)
> >  		return grp->is_bin_visible(kobj, grp->bin_attrs[0], 0);
> >  
> >  	return 0;
> 
> I'm wondering why 0 is returned by default and not SYSFS_GROUP_INVISIBLE.
> 
> An empty attribute list (containing just the NULL sentinel) will now
> result in the attribute group being visible as an empty directory.
> 
> I thought the whole point was to hide such empty directories.
> 
> Was it a conscious decision to return 0?

Perhaps there should be a comment here because yes, this is on purpose.

> Did you expect breakage if SYSFS_GROUP_INVISIBLE is returned?

Yes, the history is here:

    https://lore.kernel.org/all/YwZCPdPl2T+ndzjU@kroah.com/

...where an initial attempt to hide empty group directories resulted in
boot failures. The concern is that there might be user tooling that
depends on that empty directory. So the SYSFS_GROUP_INVISIBLE behavior
can only be enabled by explicit result from an is_visible() handler.

That way there is no regression potential for legacy cases where the
empty directory might matter.
