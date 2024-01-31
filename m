Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC01843611
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 06:28:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 458B9E9A;
	Wed, 31 Jan 2024 06:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 458B9E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706678938;
	bh=M/wj8cn2ha5igVXSs+hsLkK2F1SR6eNYlqdQx3apgP8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=capadnR2nHOeDKhacVEUQuol9A5RviLXFZCNGZcNmouTzhwKWPF6zngS8uZ85I508
	 hrM76Vxsibnrty5Ju3Slkh1V8EypaCMxkky21W+rxQX4Jc/cot9uYL0/dLzrXp11XO
	 DPjlyC5WdiyPeB7ZFuZEjDrGy3IYEIztEztjo7mI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D67F8057A; Wed, 31 Jan 2024 06:28:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6072F805A0;
	Wed, 31 Jan 2024 06:28:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A301F8055C; Wed, 31 Jan 2024 06:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DB43F8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 06:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB43F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CybZrTqy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706678417; x=1738214417;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=M/wj8cn2ha5igVXSs+hsLkK2F1SR6eNYlqdQx3apgP8=;
  b=CybZrTqyZjTf/xUcgPbcgqa8TnF99r98Kr+YzOL12NSnCaXfO5LIm7ME
   MJaUzGOWw5mWWKpmMCIeDMGMXjjdy3e1ze7itgiRPTCpgC1CytzoAD5bH
   I9FwkeC6biX6uXUMrcMFg5YNWzo4W+xJpiTSkP0I0uZG/4fXGWSZlZW7O
   KfCsPS0sC1mmxKCM4F3ug36fhPUvEJEikXt/Y8fpzM0IqWXf7p6B78vrg
   adhwKwRLnNlbT6EIiUq1yDxYn4NZ6+yjGzubJqZx09cGx9urIi4jrW4B/
   uc8M5+Ori5e4gB4IN2tEBBzcE88j5DYtlnwkFzW/o8amf8FiNH71KazEF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="22006488"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="22006488"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 21:20:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="36742949"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 21:20:10 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:20:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:20:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 21:20:08 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 21:20:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCJXDKNadY7FNJ2aqWzrrU78T5peHjdc/2VYKZaxGl7fCdrcYKPO5BcU1xyzahVn6546O8A5orLcx3/lYpmugaseLpBfnLWdbfB8Ys3SPaMmbpdLoDj9hg7DJIEQcw2X7VvElE1dYms27jPH01NrC+ApnJgr1uAMLtPdJDX3CqvDwLxK+uErBkjXppjH5s9kkRLC57X1JECGFCfOfwVCnoNLR9MsUlsLDVjckFlxCvToV8aGpg6ipti+qLNqSCZTfEvvrGIgUpFfSVzfxVquK4kZZqJRLA2HG0y1bYhLvgpvXwOXep80Fons95IHjrd62Gfm7hjkplapLb6JMjhr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrytv5gjaXOMrWHN4sPch1rV+6QHTx2kCbSZ4bJWAjk=;
 b=j0dBJrJUcSpOzbvdUQsaUGWeUm8iTrFwp6ktcQwEakDIsGJfboPycyhczcwsqMRQvZMWvGJUZvtjzR5GYuTZblfRJBNUwHSV8Axuer/XpoH4o13PNmQpN7tvqK1I292rPEqRVXjEPgqYaB2L4mBHe2jhCgosKGarwnirV4AU6D8XDOgzLFzo58n4/YPOOQEPOD6Hv7k3dUWZQ7okleHjsUXj6dWfd1i+By3dxh+OVuOGHtowWDC0xrF7IBe5GLECYo7RMDd+9K0Ug7lvxSPqh89x3wrn2/8nMMGfljK0zHXh6hExbDRrhBGSVvQkf81tAJU6LpGYNfnMw4GzbyJ45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA0PR11MB4686.namprd11.prod.outlook.com (2603:10b6:806:97::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 05:20:06 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 05:20:06 +0000
Date: Tue, 30 Jan 2024 21:20:03 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, "Vinod
 Koul" <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sanyog Kale
	<sanyog.r.kale@intel.com>
Subject: Re: [PATCH 2/6] soundwire: sysfs: move sdw_slave_dev_attr_group into
 the existing list of groups
Message-ID: 
 <65b9d883538fa_5a9dd2946a@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013029-afternoon-suitably-cb59@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2024013029-afternoon-suitably-cb59@gregkh>
X-ClientProxiedBy: MW4PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:303:b9::7) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA0PR11MB4686:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0966d8-8ea1-4699-d71f-08dc221c48db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 zP+T+Qxawo7qUkyT6HbY1yZ1dUnMCYbcNrjFq9+HH6jO+C/y19xEL9Jl++EberxotVpt5+93VmZmxdMlZzwLaK7WAdojJOMI+/LVm7BHOCo+YP4337KpC23lP90Ttu4gQji3f8LXcX0909H93CDnHPIRzLKW1B7Dl273WANcPNAWxz0plYNBRxWqICOC5nrY6a1KTorb7ivMVYGhuVxkFbqUyQs02Kt+X045k2vPr3VKF3UCVCH01sa1iXtiH142/kkZzN7b42V5jhxeB8fa1drDA4RaisUTAPdl9dkoudeec8yy3zVcDHFeYS5u4kuMoNmC9HrU6f6QzZAeHVLu+nFAkjGMZ3iNP4tt+/JXsjK6CvHLo5t/NW+F1Ryed71s5U6NRBhwCZU10ETE6U+D/7UJmQXtHn9E/t+LJtR0zDOQLSI169mFFS5tAbOOBT+R+Ndx9a6crTicKDwmc0bgId549xY1DuSh60Irn33kLh8IAce5GJXU4FvqKMiGHqU4J7FpdA52xOSZjkKY4lC1NeorHJKQXnZ14LnW269PGjjD8KHV+ELd1kBDsRSLNS+Y
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(376002)(346002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(26005)(6486002)(478600001)(6512007)(6506007)(9686003)(6666004)(83380400001)(38100700002)(82960400001)(316002)(86362001)(2906002)(5660300002)(54906003)(66476007)(66556008)(66946007)(8936002)(4326008)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?I3T5wLXSBrInnxUyBT3PvOv4Kc+yrvwjCSCiR2Q/jopwPC4N1j1+CUL/gkzr?=
 =?us-ascii?Q?r95xEMCWdwg+8CLxx60BZrXIlFZg1GOUjy/U2SYYR891uK83KUP6DOEPlK7h?=
 =?us-ascii?Q?ikSQD4Dz8LvkB5JfNOtGUOoPxBTATcjiN+/HfffVEjOZ6D+xjCJbpg/OjiNX?=
 =?us-ascii?Q?9Xg1SI9eIDIu5Pslj66SFILfo/i5Jd1XEdd9Af7TGwMT+dpcNQuBuN9Y/OwV?=
 =?us-ascii?Q?NBvcGtz+rYtO/DKmEL0sygsUTeOoMUkNwFlaiODgrTswxO0tB0/Bvs/yoCjm?=
 =?us-ascii?Q?5ShEJNZGOcD5tgUGQrv6quD74cfPn2MIIo0nHXx/Xqjjl2mVIn5D4vIw2Ewg?=
 =?us-ascii?Q?EGP+orlaWPkyDt2wT8cv3ksVncMYiI/2v7e5SKg9cB13JXnfhT58AK4I7AfR?=
 =?us-ascii?Q?NZZovR2b4NxqKZMAdp1oHdaKU1hMmz55SDeHb0UZARn4gjP5rahCZrqT1+1i?=
 =?us-ascii?Q?pLeEzWh/vf9tHAlfnaCckM2gxWcM0VBBXj8f/CNiKCVZ4Qka9v6iGTcDVHGF?=
 =?us-ascii?Q?1uPnNF/5dU3fGZkwNkHh7thxZqpeBv8MCyBqD18mqf8eWa8aOEjcAGwFdbhB?=
 =?us-ascii?Q?wwPj3Mv+YFUNAOiU7nx+RCqvFYh26eYtiawpEej/j80p0LQXt20wotrQMLDs?=
 =?us-ascii?Q?X2vwcR0+8oxnPFKEbg1LauTSyokIUSEZgrJG6JKbkGhJKPsE/98u2nmIbIXb?=
 =?us-ascii?Q?kulRtc7kkwHR+hZKrk1udHQQo0hGOrHV9C0ICGvmQWdxy5Y28r/W/OsFl9FR?=
 =?us-ascii?Q?g1tsRCXkZX/mtNB5vJX2RYDpDQQcrbWB8k9YS0QHJivqFIZRfvA+n5cDBda5?=
 =?us-ascii?Q?KEb7s/6piqrTrLSshI72oGeNsnSVJ1dAAXHJlnz8hr5qRbh6nEd1ysjkzG+K?=
 =?us-ascii?Q?vEDy+PYGqX3FCWwHlX6Z6mNGgyKhqAjI+YmzBP3K7qUBkljJYCXfn5hqyNyu?=
 =?us-ascii?Q?DKo7KFRrQsfY/CCNyL9PkY2kx409c97TflQ29Ovd9Qw+oMb8V5aHK7juarXr?=
 =?us-ascii?Q?bfoy6sf0GP3JRKOTpOaB1pLhhW4hmIKupsb0OAGJvs5t3DUuYsJ93uDqiCO8?=
 =?us-ascii?Q?eBXMsvfZMJv0gjWhAIqTGxUwnIRryGDKfgxuyQB/Ju+vMOoMdCWwd2EQMAnC?=
 =?us-ascii?Q?HozYaOqwhRyAPrJjZoN2YW6leVDUkZRwBAlJO+7QDJtghizH5I8adGsvl6aJ?=
 =?us-ascii?Q?WEoIv+NlgQGX54tNfN/cB2jetYAy22fuv0wqlgFeWopV/usZ+fHVUwui4lxp?=
 =?us-ascii?Q?ZEbKsHX41WBI9Jp6H+OQxuovz7/idditq4XVxNvscwthUhVDf8cPxJgr7Bce?=
 =?us-ascii?Q?PId0VVlHu4/owCGhMAd1eBHHWcVTiXC3asRtlEp5/WvvBxyDSnhGItggIYSf?=
 =?us-ascii?Q?aewvc0KaqKGU+Dg9eF8OVxpvxt3Ybv5lbZJppuur+ZlRDRkhp+TxgWiVPTFO?=
 =?us-ascii?Q?m/GVhKyMV4qaQhqBKn9gH34PaKoSHaZMLpRfkw8CiQInOnW5apSJe/2zYpsy?=
 =?us-ascii?Q?Nzx5MmF/Jkq8YDNfZvkxtL7WRXVWE5frW6ohmWxv/CYVCqHDL417bg6EScCC?=
 =?us-ascii?Q?UrAPELM+eMA8XQLGk1jFNeaUdq3AiyNG/f1gCRqF2BltuU2xytvm2LkmUYq3?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f0966d8-8ea1-4699-d71f-08dc221c48db
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:20:05.8090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eRHNbn12212QdRTsNMVL585JSZrlbIVZKxeI7JU6qbQZsOd8UbCOCDiprA8NXgUfVvLxuLyre6GT6iFz8lPBUy2MZVnRwgH73X4j2t52rH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4686
X-OriginatorOrg: intel.com
Message-ID-Hash: VBHRUVIP5L4DYO7K6UCJSMRGP3ZFEPGB
X-Message-ID-Hash: VBHRUVIP5L4DYO7K6UCJSMRGP3ZFEPGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBHRUVIP5L4DYO7K6UCJSMRGP3ZFEPGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Greg Kroah-Hartman wrote:
> The sysfs logic already creates a list of groups for the device, so add
> the sdw_slave_dev_attr_group group to that list instead of having to do
> a two-step process of adding a group list and then an individual group.
> 
> This is a step on the way to moving all of the sysfs attribute handling
> into the default driver core attribute group logic so that the soundwire
> core does not have to do any of it manually.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/soundwire/sysfs_slave.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> index 3210359cd944..83e3f6cc3250 100644
> --- a/drivers/soundwire/sysfs_slave.c
> +++ b/drivers/soundwire/sysfs_slave.c
> @@ -105,7 +105,10 @@ static struct attribute *slave_attrs[] = {
>  	&dev_attr_modalias.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(slave);
> +
> +static const struct attribute_group slave_attr_group = {
> +	.attrs = slave_attrs,
> +};
>  
>  static struct attribute *slave_dev_attrs[] = {
>  	&dev_attr_mipi_revision.attr,
> @@ -190,6 +193,12 @@ static const struct attribute_group dp0_group = {
>  	.name = "dp0",
>  };
>  
> +static const struct attribute_group *slave_groups[] = {
> +	&slave_attr_group,
> +	&sdw_slave_dev_attr_group,
> +	NULL,
> +};
> +
>  int sdw_slave_sysfs_init(struct sdw_slave *slave)
>  {
>  	int ret;
> @@ -198,10 +207,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = devm_device_add_group(&slave->dev, &sdw_slave_dev_attr_group);
> -	if (ret < 0)
> -		return ret;
> -

Yeah, open-coding the groups, much better than dynamically adding one.

>  	if (slave->prop.dp0_prop) {
>  		ret = devm_device_add_group(&slave->dev, &dp0_group);
>  		if (ret < 0)

Makes sense. I won't say "looks good" as this file has "slave" all over
the place, but I checked and it entered the kernel just before the
CodingStyle changed.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
