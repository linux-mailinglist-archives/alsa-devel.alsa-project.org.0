Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B04AC860664
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 00:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D342847;
	Fri, 23 Feb 2024 00:17:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D342847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708643870;
	bh=9iECg1qsHpFzbui8o6WdYxU/SM9BQnKlbxtVVwhP1Ro=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MCyn7wAl/rSD4f4d55Rkruao11oG46FlPRJJZuCqoPoGNmSkBTKKiHm22v7XNPZC7
	 g2AIk6/LMI271B808o1NYCqtqUSoukyvLie2X7zb+RClaYVqRR3VCC41R2Sq0iDeyM
	 7SvhIrLZFPXJgNYFqbsMAGeMdf6mjoDNKDGRi+sY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 295F7F8059F; Fri, 23 Feb 2024 00:17:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 805BFF80496;
	Fri, 23 Feb 2024 00:17:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E9E5F80496; Fri, 23 Feb 2024 00:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5029F800ED
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 00:17:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5029F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lOVlTxVe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708643826; x=1740179826;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9iECg1qsHpFzbui8o6WdYxU/SM9BQnKlbxtVVwhP1Ro=;
  b=lOVlTxVedaoVXB33mNlbIK4tHNFpbN+Pn1qFFBSMkgEcGhk0G14LcLXs
   SRYfCEkIqNm1pOvVEBUxafJD9vidC42ksblpWDS2hBXP6GrzuMTDyTdVB
   tHfRvV2KN1IsK/E4QTg4RnTnRTkr32KCoqCFiWZAnJu/sxVBITlrBxeTi
   XriI98VeYZZehg0ChDxyvSv/6FNSrlx6xogkZmN6Ujalg7I6i0y8nFb/J
   Uyl/DqT4VQwfr6xq34uAeiXObCZYmkSByaAePS2mWvve4wxKz7xzvFf0E
   0pef3vi3DRS5Ru/ZaGAUMWUMbj9ZiubGwHCko5nFPnLM2ji1dW6uxWXnI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20461639"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="20461639"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 15:15:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="5609982"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 15:15:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 15:15:24 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 15:15:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 15:15:24 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 15:15:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ea/WIcQXvWubd01yYQrMNW89APQl698tP823D5uRDQFitTGq00A2bAzmwKakP77n6OsDwZaBhBat0QKkHfN3+ZAs8OQNTTPwEeasYjTWWmGPTwwEeYLAAF0CArfCTn7qEkU6KG9zQBbnaA7ZCMObP/TqV0ebA7Jz2xWimy6l0rqeIUebNFljjkzdgYH4EszyS9161PRWEB+dJ0YaF1n3zpMBoBPAFySSu7cQh1nLCWuVJy6ccWFFhe6TCaN1/S1E8wMacQvb6zP11cYMi+Xk0+RtsPmRTCJnSNNdgqx71u3mVPAvCiM2yTjyFCobQOa4toDrGAJrlV5HIgTa5hhaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtQT9+51SPZJKbiW1KIz1YG1E0sUL+/T2so164BgXXc=;
 b=muDKGCwT4kI/fuc6dD+RD09l+FvwGBOt5XqebNRfoMwDN5tgqlLGY3DIzlx4JGCBlEYTS2hmXU/gAH2QixkE/Ck4otjd6ydBv7HoIzIJfAPwm2KGc3GXBomMtyJz5lm7UscfY40jam7yzd8KK3Qad9j7lk9Ws2C4mKrjdEfGEhmfrzngSUYtHvnZDDSp9nBPjp/rrtIgY9L3Q8/weW5dBIuhMFlJ6IZdwrCS1YyL541nUmucjxz7sapxDFGAuOeJMFQh/gHO4/zBxDT6yK1QNhX6amQ+IaKW7+pVOljmZI1jhlv5BQG0q4VbteSkAMCP3XydynCIMIfC9Xd8w2tNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 23:15:20 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::da43:97f6:814c:4dc%7]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 23:15:20 +0000
Date: Thu, 22 Feb 2024 15:15:17 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, <gregkh@linuxfoundation.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Marc Herbert
	<marc.herbert@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-coco@lists.linux.dev>, <alsa-devel@alsa-project.org>
Subject: RE: [PATCH 1/3] sysfs: Fix crash on empty group attributes array
Message-ID: <65d7d5858bb74_ca001294af@dwillia2-xfh.jf.intel.com.notmuch>
References: 
 <170863444851.1479840.10249410842428140526.stgit@dwillia2-xfh.jf.intel.com>
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: 
 <170863445442.1479840.1818801787239831650.stgit@dwillia2-xfh.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0207.namprd04.prod.outlook.com
 (2603:10b6:303:86::32) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ0PR11MB6717:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed41a4e-3ac2-4737-ea4b-08dc33fc2355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 Kd7gX8N7+mbDAET/hesFWz93QZ9wnvSX2HI+9bcjMvmnCSI2HIk1mKv6WAsQb0+IiJDgEALSgRICNdLRj4DyU5ZggSnw/Wwq8bV12r8OahF2VBN0BCkBsxyzEUCW5o3EocsjO9GjYQl9FYSMCwfL5IbyfMpKjlAwmvlMQtkCcx68Gv6m8denGU1yIZLVGH9UHgsm99KH1KSRGve6qd9+dkGcxzofJWiEtU964sDvn0DQXs3jwyDASAWBj7f/v5IoPMI8/tM88CWo54Im874KxDEvz6xIXqBke36Sldr3DQk3wzhe2T0p30gqooMdbVxP/AARRH6syoj8wqekVkgV9uf6aeRdZibIqy7uyJT7bHK80eLuAGRJ6Xw4fC1aLJv1hgonOuB9EwkYPTvFqGDSN6VGdUBiezxXtzHmyf4dtay5TJJ2xVn/NGN8ggckEKKmueYhWXhEepH4HfwIbxFh9LEG1Rilrg/UwE/vrwPufHlLfi4CbK1uNGmCUcNIF+pONXdPYMZs3D2c4MCKLBxJvA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?LOB0e6JHw3pmrhEW8ZuoBlJJklnROxwYjxOyp/Squ/qH0v+0cxHGO0ZZB+wV?=
 =?us-ascii?Q?t56s4vRjrBjRQxC+rbhsWd8Z1JOwqm+2Nd2MFvP/jxMwIBYm0oN3fKicicPh?=
 =?us-ascii?Q?jACFkS8Km7HCfq6czRvtssoAxerLJVV3iJaZY2izYsusxTb+luD6FXW+AW0v?=
 =?us-ascii?Q?cnrlUI5KpuPAG3m46eNewLlk3VJUdE973Ous4N3HJUTvxqQp46Vt8zLTIbDp?=
 =?us-ascii?Q?AXDEndDv3eizfZk7xrRBD8HUUDM/pnc/wdKdChd+yyzD36tzzTt3xPHLsT5b?=
 =?us-ascii?Q?tvJq9T1pv8+dtbgQbQO1etTrT6XbLDMvZ9mjCqLfvO/tmCDtXe+VQVGUq22B?=
 =?us-ascii?Q?v0ri7Q+nyrCkDq1LUxxNVkqBmvJOFxJF0UPhEcg6vT1UW7Vv0o7vPwEgUuAK?=
 =?us-ascii?Q?okx3cZqLfMpCg8QJmxpNhcxX6ISCnLbnFa6bqGFnfedk+zdk20ud8ULlhmHr?=
 =?us-ascii?Q?aump8guUr7JMNtyvJ0y9HGrXyMOVgpgV7q5KiyYm1uLhrX8UQPUwRQiLo7Mo?=
 =?us-ascii?Q?QxI+wD5MVDWxB/BewNKwH5F+uDVnH7vxw1aYSoBBdadhjiBeYoIrVrNgJecZ?=
 =?us-ascii?Q?B0PG2N+GLUGpUU+ZcbK4/36ueLXFz96qtHw+bxup+mm5rnN0c3TpaJbRR4Zz?=
 =?us-ascii?Q?1kyuS0+W66eKESyr+6VSo+DimdwzZQkpmr8uGUsbanUhlEl42l+kiCbw7Bd9?=
 =?us-ascii?Q?RjX+Dyxoo8iWRxCOIUsjatacXKx4CEXxWyP6+oXOI1W2PUrhLJkkahYeoAP4?=
 =?us-ascii?Q?WmLLIu4kwJZrRFIBcMtK71XxW0xFFOaZ24tKzADVUytipuKBXhkMJwTGg84E?=
 =?us-ascii?Q?Kh5zN5N5J4TdOtUw6z9J+8ib5PVYQ85h+aOCTlv+eYhFXg7N7SjFAjpONuQv?=
 =?us-ascii?Q?LIx6wBtpmANsAkZ32w5WIkWnvPwMs8qcsU86ylT2dgJEtu1nsgdJABvKTKs+?=
 =?us-ascii?Q?4zvXLdGTjJhSDhLbYdZ8IArPx9g8t3OFO1n8rDSexcLf7jk9VcmuPX0/vjhV?=
 =?us-ascii?Q?RDRUhYF8CUCXSaz3GRtMV7AgptI7MzR725WKQY0wMGGzNC6xU8ffhWB8F53o?=
 =?us-ascii?Q?rx+e8K/lMp5snzQ3AvuRDgOLfddr+9uZ+o2s2/QX8b2nfQakbFr8bGMb9tgq?=
 =?us-ascii?Q?UPow7xx6mJOaS8ld/PYhnh/q1ZKoS4FTzXMXHo+M3tXGw7AuE/zL57GKW9Hq?=
 =?us-ascii?Q?D5mhbyn0XLMF0oTMPQ1tW02Az+Qb0r4nmv5zYw0wUDzIcH7I8SQBVs8mE7u1?=
 =?us-ascii?Q?VnKSIMj09Ih6baQcWyVR+NDusYyzwiQaF6ag1LT8bGag6sSAR8rRVq+MunoE?=
 =?us-ascii?Q?LtsZkopuNEn1dIGnOKmTXmiex/NaODkD7KEQ5G+WC6zHg7YNo+HKe18Bic07?=
 =?us-ascii?Q?CjxNl/c2W3dsoiUMNoyu0iygk+k28fywM9rOUAx/q6Yek35UMM75aFiKNTBm?=
 =?us-ascii?Q?AsjJxwLH3eGoVg5hr1JoYEKW02f7ahAGj2LYj1rbafcw0Ioq8Y7CbOhyv8Xf?=
 =?us-ascii?Q?ig+zWHLSK2/7EvQ2d4hQQJd5bQw20VoAOu9Tjij1vzUSqx18As07T6rCVmba?=
 =?us-ascii?Q?ZrSQbWLn9m/+zKBvAdMPINsqYBZXp2qtrfeq17q/x/zByW+kiacXsBuH2AJJ?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3ed41a4e-3ac2-4737-ea4b-08dc33fc2355
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 23:15:19.9029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Eib7vnjiESYCgZJM3WKRa+Q2VaMVRRT1SFNyObentWpagRbV5SOq2HFvynba2PO+MdhwW9vW2hZMuegvDIQDjEZdTAifCO795kBBOjdjp28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6717
X-OriginatorOrg: intel.com
Message-ID-Hash: 36ZFI3BWD525JB6G754YVVALW7EIYDWT
X-Message-ID-Hash: 36ZFI3BWD525JB6G754YVVALW7EIYDWT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36ZFI3BWD525JB6G754YVVALW7EIYDWT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dan Williams wrote:
> It turns out that arch/x86/events/intel/core.c makes use of "empty"
> attributes.
> 
> 	static struct attribute *empty_attrs;
> 
> 	__init int intel_pmu_init(void)
> 	{
> 	        struct attribute **extra_skl_attr = &empty_attrs;
> 	        struct attribute **extra_attr = &empty_attrs;
> 	        struct attribute **td_attr    = &empty_attrs;
> 	        struct attribute **mem_attr   = &empty_attrs;
> 	        struct attribute **tsx_attr   = &empty_attrs;
> 		...
> 
> That breaks the assumption __first_visible() that expects that if
> grp->attrs is set then grp->attrs[0] must also be set and results in
> backtraces like:
> 
>     BUG: kernel NULL pointer dereference, address: 00rnel mode
>     #PF: error_code(0x0000) - not-present ] PREEMPT SMP NOPTI
>     CPU: 1 PID: 1 Comm: swapper/IP: 0010:exra_is_visible+0x14/0x20
>      ? exc_page_fault+0x68/0x190
>      internal_create_groups+0x42/0xa0
>      pmu_dev_alloc+0xc0/0xe0
>      perf_event_sysfs_init+0x580000000000 ]---
>     RIP: 0010:exra_is_visible+0x14/0
> 
> Check for non-empty attributes array before calling is_visible().
> 
> Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Closes: https://github.com/thesofproject/linux/pull/4799#issuecomment-1958537212
> Fixes: 70317fd24b41 ("sysfs: Introduce a mechanism to hide static attribute_groups")
> Cc: Marc Herbert <marc.herbert@intel.com>

Ok, this one is now

Tested-by: Marc Herbert <marc.herbert@intel.com>

...per:

https://github.com/thesofproject/linux/pull/4799#issuecomment-1960469389

Thanks for all the help Marc!
