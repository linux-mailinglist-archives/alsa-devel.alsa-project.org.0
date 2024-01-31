Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3F1843622
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 06:40:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B442EE69;
	Wed, 31 Jan 2024 06:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B442EE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706679632;
	bh=tDNvStFRsgGwrhNGTvjftastO3YvrJQIZtpaiPh1HkI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ek7rqbmZyTRiD7Bi2M/kklHDqOetLztskI99MAUeaBoqz6bWRG8Q2KnoyQwSLU7CZ
	 q2B/j+2BtlmCQPRTj2L4JiNPkH6ANfI0820XVSCsnyHStN+yc918fWcnxlZMgUKhyx
	 zh3q4RkUDhP1Z+Ldzk/W1uT5PIsmlaZ7gfZCaHtw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29D53F80578; Wed, 31 Jan 2024 06:40:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9745BF805B0;
	Wed, 31 Jan 2024 06:40:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEAA7F8055C; Wed, 31 Jan 2024 06:39:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 419B3F8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 06:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 419B3F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cZl+BEpS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706679597; x=1738215597;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tDNvStFRsgGwrhNGTvjftastO3YvrJQIZtpaiPh1HkI=;
  b=cZl+BEpSlYcFKrtKzNoH1y/g15UsV4jPd+EivrS+GXor1qs8ldrSuPX1
   UujCJchKr/Vggcg+tEmzY7BiMNmjzAwrldwKpUcGsqqOo6aqOXoQUCnuP
   QrCOQvBHOn/lbEVvXpoz7fSbx7zag4o5YoHlvxuM5354gANDosiq6tZ28
   AHDhEI+g7Mxntpt/7qefbaNQ85UxRp0zWK+sCQS6OmW+oRY6oELK29y8q
   4DkKILh/3lPmi37SO5ZyYjNGG/OtFNDApe5w3nELZn+E/20upeROHr5dI
   Fr9C0NXv6wAGdSQ+Lmh14AJZHOlgY+nS4ax4Y1hl6mvicf9kVzBwuGZ8w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407214224"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="407214224"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 21:39:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="858700745"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="858700745"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 21:39:53 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:39:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 21:39:52 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 21:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpAASZeOG9Qn8Olgd2xCU3VXtC9UqU+SnK5QzI06CP6W+MPKOGEWrGKLvEqsNy8Oh/xDyEb0svgwqIgJH5KSomV+EA8TcgpN1tscEqf66PoYW24+7XoLnYOABqNsg66y0Ph7UmE5C7roFGD9FVBPmnd67wAJB3jFOlzC5ywxlw/b1BBOxLzMjx+0dGDSGLy8ePBRexJ+k02rc8hvKA2NynNno3HvmJBbZ8ona/hPp+PftHPqq5JbThpfATeI0p1ODdwOt1QEuGUMsiuzUBcmQaUpIYgikn+qEL+UPD/5pz+1JYCtOJWdAWwOvdEXUKG1sC8eapvpwe5OTbXXnhCyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkOXcwpvB60iTIaoBAxQS+Vndv8zjCD3SRRdmKG5Heo=;
 b=UQDYfwZjmwvtjH5x8yrfvbbO3dD1PX8QK0e66f7dycbByswdkcrvRscEQIXPaQQlZNrNCaYxZqC8rS1ZfKW/mT67i2veAknwwMlP+jN2v/XOwt7geHj9IJL/kn2Zq+gTY5zns2mA2bNOuXfL5l1MRaAgM7jz3TGujonvWOoLEOa2IRTeCOAM6BD7bntRcLP6pwtGdyqBFU0Cm96nwcfhSiZBD00mQxob8x1c9Qk1vkt2yYeRyZChUxaYdv6yCMoF+syU6nyaEg1CYc+d0TVGCjAHO2UWUHCz174vJSULMj9TdjbUeqP0aYp4sEdU9Spy5Zux3QDX6Sp5O4CAh45r9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 05:39:45 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 05:39:45 +0000
Date: Tue, 30 Jan 2024 21:39:43 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, "Vinod
 Koul" <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sanyog Kale
	<sanyog.r.kale@intel.com>
Subject: Re: [PATCH 5/6] soundwire: sysfs: remove sdw_slave_sysfs_init()
Message-ID: 
 <65b9dd1f64d0d_5a9dd2946e@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013030-denatured-swaddling-b047@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2024013030-denatured-swaddling-b047@gregkh>
X-ClientProxiedBy: MW4PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:303:8e::9) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e489e2-e909-4ac4-8aaf-08dc221f0803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 /haw3s6T//tH5vqA1OozvJx4rLhqZzlj0eockxmPmDsaSHidS6CAU9tf7gTEGkIlxvjY9TZ5aeDqWr0bG6LIldtL6MZtuNzuWxqxqLXzP3HhBcwm2NlLwBANBvwr66EUVXxP2l3PUeC52CklfqxIhtd6+SBtQoNjL/u4AMKq/alSJeQ9Jnt+uUngNqm9fyH2giSRNLosEkVBafxPCQTVxkBseFefRaoIpeyfEODTGawwXCGbKNjNTEwnov2/NNsH3oj9nujBrzuJXZ62u2Ky/wf1Xr5M/KQvsH0hLqdK6g93HkT8nghwU2JA6Wc5XvpzsUTBkz4hlwlvVx/s3gxeUHLC9jCbAHXbBathFdMrn4I7B62ldqwscAkBD73env08m1xy/f4XWWgmPUpnlQEqIc5PfuR6EJ3/Ld82bvUwFB5P4t9YUoLIVsLe8WE+mreD17W3+edvbBz3SexkWescpSmqOymvsU8+lBIiVrTitFhhfpWRq1xN34pc7u3i1bQILs/NUcS/m9ct3Jn1dZByL+OPIMrMZjgZH5ZKP8+4f5qAo5Xwu+JVtaEencz6uRIH
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(6512007)(9686003)(26005)(38100700002)(4326008)(8676002)(8936002)(5660300002)(2906002)(4744005)(478600001)(6486002)(6506007)(54906003)(66476007)(66556008)(66946007)(316002)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?n9rCU3ipdgnoqgOI4CbrSTLAkn0xh9hhFdf0M34SioUzIjt7nDH5l8Se8uYf?=
 =?us-ascii?Q?XyjYt1hqEngSWN4k8YK4QfeqSjAf/IoNtUv4gXzMF6z17cNzXqd4fHcvFC5Y?=
 =?us-ascii?Q?6+YG3YKaD70Lo9tMZ6k0KUYEup0QyaKnIMtSwpn+WUVaXu1+6/r3SPaZn8Zv?=
 =?us-ascii?Q?nEOkyTb2thB12qvkZYrHZCMEYTsE30D/aystDFdhlP6KBTCQFkLWWT6WMUhV?=
 =?us-ascii?Q?dt8XqZ2nPzOHgzEwSA8/TFbS4iKYL8/V3uF/b1RoAN5b8ugAxm1PT1Zav7Ed?=
 =?us-ascii?Q?uLoxZLzfLJL4oKxyIt1OXRzoAX9a7LEFQGo/6VyU1fln+0kaZm9PVlYsjEEa?=
 =?us-ascii?Q?Oc7BJknvxMbaz7U2xLgJ6GfFvdZ3PjtLf4EZ4w6QHgMrgM2BqXgGmGgBSULv?=
 =?us-ascii?Q?IcOk6yNfUkc8dfC4CU1ml6236KcCirt2dgssmn3bkUalfSCxRqsa+bZDl29g?=
 =?us-ascii?Q?NuZhMwTvOzkaPIWrvx6kWAYQInYznF7/vAE8i/da9axPxtxIVdPXR2y5sm99?=
 =?us-ascii?Q?cBjhuP2hMXRI0mQ5Dw0ebiBN0XEqkV0S0aY0alZWp9Z3icQwXuYlRXv1HG4S?=
 =?us-ascii?Q?VMXpbzWX3fWUAcWWYZWc+CpDmqgYAbN5K8/EBex98HfOzGCIE8z6PNp6w/pH?=
 =?us-ascii?Q?QNyUdIVRZ3sEGQwP7Hhsi8v3XgAWedVQz0YspdOdVT/dAf+LLU2hbhtShHTx?=
 =?us-ascii?Q?Y/ZvPy8P+0T8+cFLSDIo0F7qDI3lzLG0towJ0ZFphBfSrVQUNtPTvMeInRla?=
 =?us-ascii?Q?7L2XWnjbk1gBRq1X8Xp/F6TpBcMRyuehFJfEk1/bqzR0dBcxOEd4o2TtnKgW?=
 =?us-ascii?Q?iH85fOYseDp8AaU+WFXbhgjeENSqKwpaJiKvMb/tLRjiLj3qlVTM7jLafS2s?=
 =?us-ascii?Q?5q35YAa4JIggQCEkRFaCQkPj1APRg4JnNNo2tq9rwWHXqlnpEWxHD80zdODP?=
 =?us-ascii?Q?jHpqRJlZSXkQ7aKtEr8ye8ASFJoOU/Dm92fdKl8g5YINYb/HXOX5hjHg3eQI?=
 =?us-ascii?Q?tiztR/DPWSMIjAgRIS+OHr6btnMfV9sjkOS53FmcTcF7CGx4le2qgnrrF5Wf?=
 =?us-ascii?Q?4QT5WvHY3N5lFZYxZib7z+aR+la+HohPtO9aYanmyrWh/iBpTRKzSUVzDMlP?=
 =?us-ascii?Q?HsIFHkPBbAkPSOXolTAfg3u+07bgkVI9Pj1lFhqJgLaiDFtlXyS95rEouPH3?=
 =?us-ascii?Q?zyjJ8zuPZSXXk/XcciCrLXR2OvI22PYfltKnxAGyhi5G31logxuO8jKOSIFb?=
 =?us-ascii?Q?6oIkXK0oLaB3moElaIkWIZ24L0srEHbgS8xpF+L5gdrUf71OLkXKL7CdTkiQ?=
 =?us-ascii?Q?LgYFjJJU6WXQfXEBMI57kRqO/YKEHJCerw5adxiTmeWX89QIkvHUQskFGWQb?=
 =?us-ascii?Q?3Hatkx2O60F1+60gX946K8ft34j0kjazIFhXDWlNmUZ1UkbO5cGA7ysPki6q?=
 =?us-ascii?Q?cD0USP39LWC5z32YImltVPNk6vws/u6PV75XUdFkoRtzvQL3Cnf8W9I+Iiwz?=
 =?us-ascii?Q?HDBmuaIP4kkaBO220GTjwkhlizxBS4N6zqRgO2TKZlfUOOI0A8ld0+Bh0xhb?=
 =?us-ascii?Q?RKWg7Afc3v4JM04BZMYbz3DZrIQPlr5XnMsiIoufQrin0Gu7ufT/CdQKVk7T?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45e489e2-e909-4ac4-8aaf-08dc221f0803
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:39:45.4492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vnIQuBrgscTUTTg/G//aUruz5dnOcxxtROJd+WqvGasfP9OsdHarzucMUne/ynmc3e8a1uENAYB8mMFWuruFrV+zXVpgr/gIw6nWeoO0fXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5358
X-OriginatorOrg: intel.com
Message-ID-Hash: AWWVJAO6Z2LEHW6RO5OUGGIGOU4NWUKO
X-Message-ID-Hash: AWWVJAO6Z2LEHW6RO5OUGGIGOU4NWUKO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWWVJAO6Z2LEHW6RO5OUGGIGOU4NWUKO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Greg Kroah-Hartman wrote:
> Now that sdw_slave_sysfs_init() only calls sdw_slave_sysfs_dpn_init(),
> just do that instead and remove sdw_slave_sysfs_init() to get it out of
> the way to save a bit of logic and code size.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Looks correct.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
