Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE0843620
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 06:39:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F116F14E0;
	Wed, 31 Jan 2024 06:38:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F116F14E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706679541;
	bh=XrbSOapgmw2xj/Sker48alHwXc1gfrg4IV1OKHZ69Zg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t/lkTUJGknz8/mWexBM2tZMA/hfTwBU5O8A8jOkG8+NgFogMcfP9xed3rHPn6ttJR
	 5L4BDCDlhFfkxNsrlUGra/dGVkZ2KGhWwxWt4uPjA0eunlBZz2eQL93ubzaDr/lxIW
	 NSHoCy0+KcG0G+/ZFrM9N6DoKhiRbftYqm0HZIKw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9084F805AE; Wed, 31 Jan 2024 06:38:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A21F80589;
	Wed, 31 Jan 2024 06:38:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6FA5F8055C; Wed, 31 Jan 2024 06:38:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 234CCF8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 06:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 234CCF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L9spnivI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706679493; x=1738215493;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=XrbSOapgmw2xj/Sker48alHwXc1gfrg4IV1OKHZ69Zg=;
  b=L9spnivIiR5Z9Pfpkr2B1Qgmws+BG1AjSWQknUFu6XhOM71Ck+g2EStH
   o/yIIoiglPSbdD3oTaQ2Y6Od5kGo5x1JsOCEy68FOjIH6HLlp6QXYFJKr
   QAxltLw54yEl/h6/ko2yvhDHKu+r/Nh5SNVqrkn1e8bsQyh/lVgLSiWF6
   eiPnPqbOW5F07PEgZpHSrG9H0D6pbqQZaQ3RMAcG2aV8C8zXpYrEasxw+
   lSxYiXxp8pJPswgttWJXHbYwygldEkAIPBhubbOB/ggTjeV4c1FTz1KBi
   rvWT8dSJX9wiICgsd5mkQcrcQ7t7b0OwZ0PtUgJVWRfYKIMv7tQwmjxPZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10243910"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="10243910"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 21:38:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="4040469"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 21:38:10 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:38:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 21:38:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 21:38:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+mxeM3lFhqibwYRgVMiz5sBsK4SoTihgHRdBWQFGuGN7IUuTuAARPtN+A+XoRX9q/WIMxJI4X6PsTmvZdqdfEnbZuKSJ4esH6oUUl+wRdIGE4tJgSulXSLXR/NiqjC51e853OPFLY4c5yjP1I7hLkUpHBfkOvM2oKmYATu99hMixkdRJkHkUdHbOVQnLumBo1VDchnyGdGvq1tffmGF7QOtLQX9KKU+XoxkIyoDPU6J2qhkSpqb0Mr7YpR55p23M5mSn9naRrcDCAT5ESySPfLFMmfIvGEuoiktTvfrpk6cj4qStq9+xw/6WKrZnotX+PGP5c4QT9MNi0btsmg4ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UsIbAL5eeiyOpIaPYGiVdniZwWFXV2qDdUNtWHESM0=;
 b=Sglad8ftsoHX9GCq1V2Da3dgjL6TZuqFlH2Z2Yt0UdrhVrI79WjN+kVLX5YOO1R6MIEQQh9934oV4F/OS15Z14uYYjY3diSrf94D6Gd05q4OluHvy81yi3ojr7gm2KIjDCbRasrG7MS9RbI9hzTHfxOsGgA6lQWvYMJ6UuboAyuyodsfc3Hq6xtYfOk2Wr/ZbKh5Ac6NYhDiR4eB1dBPDK398jeWN57WpqnJqu+rBgn2+QK6iYf1FQZBSaX+vhIrw3nVX3Z4gt2Yabki1DDCCUerVIJ4xwPanEAP27kyR+MRdslnSGGNCHdb/XsNWuICmiS7nmI8TlY6Cf6tP6kbpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 05:38:01 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 05:38:01 +0000
Date: Tue, 30 Jan 2024 21:37:58 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, "Vinod
 Koul" <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Sanyog Kale
	<sanyog.r.kale@intel.com>
Subject: Re: [PATCH 4/6] soundwire: sysfs: have the driver core handle the
 creation of the device groups
Message-ID: 
 <65b9dcb6a5284_5a9dd2948b@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013030-worsening-rocket-a3cb@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2024013030-worsening-rocket-a3cb@gregkh>
X-ClientProxiedBy: MW4PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:303:b6::14) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB5358:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f320f3-591e-4fb6-ff1d-08dc221ec9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 D6iyMiUzaY5jO4rPePwyl0BboOWqdEKNzBIdZ3cDG447lfu9SE+5pUn4oGCZT4ejB5q1ShAJ0BST3iRIxpoo2H/dBFTfwqoX2PyNk/e3zCHjjUuLFN/Z7pO8CwhH2CPbJFn7WnSWRAkERPvufnEQfaWh1+77SgMet+rvCgVIhA+5YaBf18/XzQhpQcbdkkfSx0oHm3jwuu6xZZ1adv7JyPX6xTjUraCjW7oDNKfDGHJHDIK3rJMxtc3OhnaEKu4v3oZMP8Vunvo0C3nM1DuvlO8toyjmBH6mdtRBHzrG0pZvUGfMSy94aFod4YWuBBHYBKYbu6KoE+u8hTgoKinmhwjbfG+1EjLvLe8qBr7x6IYdvJmY28rByBlrwLURSJdX9mmGxTRL2+p46nlVFj/2FvAo0gFNqnApjr5dmvmFmCyzMeeQV6fklcWPm3aglhec50WpVKkR04RoIw8gZfvIUcerz/cqiyNJiz5W0KeYZWMkr0bKF6th/I9eIxpnNk4AxDcg7HYrMIKb2uKev8ixs/s908lr2nODK80+NrbXapof5kZ+6XY4rffNbd6IPlrS
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(396003)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(41300700001)(83380400001)(6512007)(9686003)(26005)(38100700002)(4326008)(8676002)(8936002)(5660300002)(2906002)(478600001)(6486002)(6506007)(6666004)(54906003)(66476007)(66556008)(66946007)(316002)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?8AE8KI32o7fi2KGRlN0znp4sa4AlBwZsypxvw4H0mCrfGA8SmEz9eiYrdVo1?=
 =?us-ascii?Q?eWeXjdgZcgBrKExAto+1rPBc6sgl5KmbPAj/I/hTSrFfi7TriwAcyxzy8nWn?=
 =?us-ascii?Q?enBIFvhOlzi9mcaKxABltlsOwcNX7h3phOiHL7qHEBzK9Ibqs4ppAJru4fAh?=
 =?us-ascii?Q?CTo865rtxhNJPfyHSJoJtAhtj4mQt3ONuK2ovy/xPUXkVQBfuKCC4vS6XDZ9?=
 =?us-ascii?Q?szUAQOellJofH+h4d0F0TtSjeRpdAFbQXU+3MeY2DU2ZxyJOT4XnZgft9h5h?=
 =?us-ascii?Q?Ez3QGa+1yLlnhMj9V+uXJtEIx5R5UqiZX9/TJkkx9YUvlk5GrEUq6Swjg2by?=
 =?us-ascii?Q?mzwRfGWnvcUw2YKuO0pnraJ2846q1Jy7QC2XdWCpplx/WT0dquw8a7X87iTk?=
 =?us-ascii?Q?UVOrWgitdmstsCHmoxLsDdT3UoLs6mVfdmbATsARssxcxGh8GMlpQPQAiDQA?=
 =?us-ascii?Q?eTy94U8dj/Gpc8YPvMNy7n2mpPss8BcNMGLkEHkTik5fAfr2Ynu91seU+elH?=
 =?us-ascii?Q?5At7Y0Q4FFY3/1jmFNphLVWHuFD+ybrwrHidZCy77whZ6e7bjEPYqNjt2+0b?=
 =?us-ascii?Q?Ta9fWqhZ28O6EzXSV97S66v0FFOKpnBE66Mx0qe7XcndPJNOTP6df2mNiVDM?=
 =?us-ascii?Q?PqvKUOtlj/YKwC2m0H3UtGDNT9erTRODZ6QD+8zzadZER5PdECE4M4NghbNT?=
 =?us-ascii?Q?tyKiIJowgZyAteSf2c5R03nPuPGd3UddZ9pHJDZmPIRPk1oAGgMXrii74pfr?=
 =?us-ascii?Q?nexRC6uYQOvFieOah4rL/Sc1SxskwGxlKOs1Yj13ju+O7fBfB6R6L0A9XAG9?=
 =?us-ascii?Q?yAnhk7iE0QJklehvjiZT2oxk6m0pKsg169db1w7y6r9oHZ8jOeEOAiBDwJes?=
 =?us-ascii?Q?fHVBxQI93uwO0QRWYkSIRmsdVs7d5LPaSfOAhwH/cmYvIwgzyI55wV/5ZsyN?=
 =?us-ascii?Q?ibIhQ654MVsd54OAevtbqLqgAuvaki4D2q4bfQTA76Lv/ijn0VgPVhu6A700?=
 =?us-ascii?Q?EZV6e9wNUWsOG7BmXHhxQVWKBP1KRFuOT95CdB9kNyUaRhG35/WD/z0o7/+p?=
 =?us-ascii?Q?yn8URHOAOaIrNJeNentODbI1d8sRho1EGvBNU69u6aMT0SAEOoS4H73yX9dA?=
 =?us-ascii?Q?D18mNcmamv6goSL4eSBbwyUy5y6iCtSr1IOpasmoDFWxWFhN/H3uG50Ub6G8?=
 =?us-ascii?Q?pWxMit45OT3gBlv1E3mT3Sj+6i0BE+RmSf7bSbIsqGSkjnV/vWMOGyR+r1DD?=
 =?us-ascii?Q?fPEy4qMiUOkNvV3Bz2MGFkCz8AOlrXjDczkzEkdA/DK0VWlTRVUWguBybPzP?=
 =?us-ascii?Q?CAJRJ616rMXzRriit/iSa616VGzVGEampl+IPppPBwRjTCMW/FDidyI5dNuB?=
 =?us-ascii?Q?Ll3/PSeFPDLKi8eh6k6lWqTE/rR8RsOzrd7tjUOc4g1HJ9xd/b1ZxwgLz/Le?=
 =?us-ascii?Q?F1f80bD0Lkz8ZocFX8FuIHOqqDtTJ0C+oAPuoqL9VefKGltwtS88OwVcIdnU?=
 =?us-ascii?Q?7JA5nllkhh+dw8VtErWov0tqs5mOuHy9S7l7uFQ7x5LKECMp2H7NFmZz52Os?=
 =?us-ascii?Q?xNkxKpOyL3mgcEMm4OQO2we8hvEWbjZkAjEyWEhlHyGFfiRLQ4rqcktiY2xv?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 14f320f3-591e-4fb6-ff1d-08dc221ec9d1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 05:38:01.1155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 R6wpVU37YGHnGfdxMI2TS21Jc37VyH7sIK1lw3yUGn2F6DdK3zvNyhlxh6e9F9bpdJzAgXeQYJc8ObfeLri8a4r6nFMu4Yx6MkLG5VGonqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5358
X-OriginatorOrg: intel.com
Message-ID-Hash: XDS3ELFML2F3TCB2IUCBWM6IP7CRIK3H
X-Message-ID-Hash: XDS3ELFML2F3TCB2IUCBWM6IP7CRIK3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDS3ELFML2F3TCB2IUCBWM6IP7CRIK3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Greg Kroah-Hartman wrote:
> The driver core supports the ability to handle the creation and removal
> of device-specific sysfs files in a race-free manner.  Take advantage of
> that by converting this driver to use this by moving the sysfs
> attributes into a group and assigning the dev_groups pointer to it.
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/soundwire/bus_type.c    | 1 +
>  drivers/soundwire/sysfs_local.h | 3 +++
>  drivers/soundwire/sysfs_slave.c | 6 +-----
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 9fa93bb923d7..5abe5593395a 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -221,6 +221,7 @@ int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
>  	drv->driver.probe = sdw_drv_probe;
>  	drv->driver.remove = sdw_drv_remove;
>  	drv->driver.shutdown = sdw_drv_shutdown;
> +	drv->driver.dev_groups = sdw_attr_groups;
>  
>  	return driver_register(&drv->driver);
>  }
> diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
> index 7268bc24c538..3ab8658a7782 100644
> --- a/drivers/soundwire/sysfs_local.h
> +++ b/drivers/soundwire/sysfs_local.h
> @@ -11,6 +11,9 @@
>  /* basic attributes to report status of Slave (attachment, dev_num) */
>  extern const struct attribute_group *sdw_slave_status_attr_groups[];
>  
> +/* attributes for all soundwire devices */
> +extern const struct attribute_group *sdw_attr_groups[];
> +
>  /* additional device-managed properties reported after driver probe */
>  int sdw_slave_sysfs_init(struct sdw_slave *slave);
>  int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> index 8876c7807048..3afc0dc06c98 100644
> --- a/drivers/soundwire/sysfs_slave.c
> +++ b/drivers/soundwire/sysfs_slave.c
> @@ -214,7 +214,7 @@ static const struct attribute_group dp0_group = {
>  	.name = "dp0",
>  };
>  
> -static const struct attribute_group *slave_groups[] = {
> +const struct attribute_group *sdw_attr_groups[] = {
>  	&slave_attr_group,
>  	&sdw_slave_dev_attr_group,
>  	&dp0_group,
> @@ -225,10 +225,6 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
>  {
>  	int ret;
>  
> -	ret = devm_device_add_groups(&slave->dev, slave_groups);
> -	if (ret < 0)
> -		return ret;
> -

The subtle scary thing about this usage in general is that this makes
the sysfs attributes live before it is known that the driver probe
succeeded. So beyond the cleanup of using devm to do something that the
driver-core already handles it removes a hard to reason about race
compared to the well known lifetime of driver->dev_groups.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
