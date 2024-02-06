Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4690A84B1D7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Feb 2024 11:01:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5F57F1;
	Tue,  6 Feb 2024 11:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5F57F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707213700;
	bh=Q0HuGsaXbgk91ULnCL6dQpjK6Qra6f0yPpU6tEW2LfQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YtzuesR6wpbIIZePx/eMTz0wTZCNQ57EUvpTkTvTnoViHtzgKWM+rK5qchmzXdq0T
	 ZFzXRmq0tRTnVHGxBoj+8lvbtAOGwSyovaGfCPTfnYTz1sOu55BgcA6VifomB4tVKl
	 8q9fUZU8dth7cGoqmYcY0TBPEXQOlM6E8UcjQqSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32BBBF805BD; Tue,  6 Feb 2024 11:00:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83EBFF8057B;
	Tue,  6 Feb 2024 11:00:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7385F8055C; Wed, 31 Jan 2024 19:09:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 620FFF8020D
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 19:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 620FFF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TyyUwvmB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706724528; x=1738260528;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Q0HuGsaXbgk91ULnCL6dQpjK6Qra6f0yPpU6tEW2LfQ=;
  b=TyyUwvmB+vLvcapHYThtLIBVDAQBSQemOqOZjYK0Wpdtm0d5VhjZKlG5
   MtZoCvFWevvRZXqYqxc8GDiOarou0A6xCwEhJ+DJe2lLpHQn8XtemTyzy
   xfaQhxNYUxenl2QrQ+UfIMfamQxDPl5s6Mv4qETQ02BYD54S4Pw14xnI7
   o2DkS3eXjSnZDoxXb3OWfz8kK76EYw+yPMQ1vYrlq8E5mYTqmeAbYy34z
   fLuvq1AEDBTIqlMYJ0kaT7b8JdZoSBlFbTJwXajqNPR6mEcCOHtRc0V08
   u7uFFJXanonA/v+ZJ+sVzWmBZVigZs/yx2323QI5l5dntLba6IBDmzn59
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407398468"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="407398468"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788665787"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400";
   d="scan'208";a="788665787"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 10:08:42 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 10:08:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 10:08:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 10:08:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkAaArLcP6PlPXDG6kVqWX5ABeobP8i2ib/6F1EeVahpcHmgHrdHZuCAWzOTy25GtoB12WsXabBxhcbHt7mkJg4xPUyry1zzEqyZ6aVtYiX9lPJCWKQz/u0QIdc8R6jm1BQtMtlb2o4bWG2vWWY3UqUP6P15YKTaKXGSHmNjoV/7xABCHWL7MIGPQPJWnuoccHUC2b2dz4afJv8l3JAn2U4C+7G6zpG3UzBWOSSYzFVBa/6gTgm6XJLScW1LIhMalXzIJmG4jKi+IZ+4WwV6tIIeYfS64cxSs97w9VisDGNektl8p0seC2tWwFjB6stMXaWMNZTgv1PzVoxRQqrTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYzyOCnEKG85DLxbBM6wFQ3tS4OtMewwWBvh8GNpvkw=;
 b=G6fubv3ZJ/0T6YmQ6+z/17cGtiCiA3yL8gYyrqfhsvPIZlc47JHDplpGZ+tVhf5YfCpa0rGXr702py8BSJJhH4j8T1zrhCpPSHGRVursK+Z1m6h49HMyMzZLql+41VccjTJWGifSr0Ut0lZsbN3QmLQvB/HCq12peCpNJ/H6mtl2hp0GTalV83afQ43o+9IRrImvEqZiBGLtzXcmzNK5R5k3hj/O0ppK4lZ/Viw8mHgEAVlRBCNnZsUzAHmt4vvPqs0JSzNehCSaVc/vIDuDaQ/eYWGgzg7bFksjKls7WJvyItjkoCLcm+NQLOJma0kGqm52oJY1j4QsFXaefX9/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 18:08:39 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 18:08:39 +0000
Date: Wed, 31 Jan 2024 10:08:37 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <alsa-devel@alsa-project.org>
CC: <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>,
	Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [PATCH 1/6] sysfs: Introduce a mechanism to hide static
 attribute_groups
Message-ID: <65ba8ca5709fe_4e7f5294ce@dwillia2-xfh.jf.intel.com.notmuch>
References: <2024013025-spoiling-exact-ad20@gregkh>
 <2024013028-deflator-flaring-ec62@gregkh>
 <b93ec9c2-23f5-486b-a3dc-ed9b960df359@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b93ec9c2-23f5-486b-a3dc-ed9b960df359@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0190.namprd04.prod.outlook.com
 (2603:10b6:303:86::15) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: ea7638fb-73cc-4b2d-04ae-08dc2287a6e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 JS6+IJXxBl5QrBEgdxLzGZ0QbdSGpLArQISAKVoG1mmCu12pgKCmxzy2Fpue6JCW3/VGTt/XY//IsNsvxGJOhFT0ZCjfCe5EYEHsJKIDXXNcmGrc5s/yH7pcdMf1AS3Xc9U3PgkCWHfO+EHBLomRdlx30SmrFSYKfl25qKCKaiaWqTlJOMDULsE1ZfXy32FqHPG5ZgWAUe50uDP+CRTETaASPe96FcfWGaWKRR4Ap/8f/imc2km/73Hm/5tDJtt+P47exC+9VKCmVDaU63O/nxfhbdQ9mpDDeLizDth1N1Di8kcPtXKU0TYPzg/czZDw6l0PlwZrbfl7DjJM7+twMlECcL3rLCCltnpFMBTZBsL/pPxzdjufwv2437avH5KL2vxoNAm0l6ojJz/Wll2EIYcLnoDqeUY+0xkGbOuICfu+CDjuM/0ViyARXaRMvSlbYBCzT2bVU7g/DbrxrmLyMsHhkbgcp0OQq6TSM4ub+ChPvJYnQLeR175OlpSVJIe+uO4aqBUBK06gUdCL+DLVPsGFSBXBgqnmLnc7oZ8GRuTMmRw16we5llkYc2p7TOGMANykPlSK0R+r0FTL7FvxGA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(110136005)(66556008)(66946007)(66476007)(54906003)(83380400001)(2906002)(6486002)(38100700002)(6512007)(966005)(53546011)(9686003)(478600001)(6506007)(4326008)(316002)(8936002)(8676002)(5660300002)(26005)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?rJ845QMEKKj9yyu89VB3hI+VDIeeqkQOSRIMv8In2hjHQbF4Ejlstf0hr64x?=
 =?us-ascii?Q?tzS4RdE0QQKfiu9YiT2ySa4VUK3SfvPTTNkuPKpLjLmCpyWPslCQaUM9NCL+?=
 =?us-ascii?Q?iU201B64Un+UpWirAsvtUVRdaXbeLsH6twFhkWfKFKGQIT8isP/ApXeSPvS9?=
 =?us-ascii?Q?mU+h5vaQRU/EWjAvQ6BcAx9ccaiGvAR2+7OmeFLH1qnn94AXh8K4J2GwAZDs?=
 =?us-ascii?Q?tVWsCrUNiAiOiaJnzjN8Xk6xNudMkpZTu44gE+MqdZ6LeObuuv8Jk58XuFWj?=
 =?us-ascii?Q?RZ6OrM+AxrfhslFHKdZTETVNj1T9kLtO3yO+MG++HoaDKXsTE0/BL3WMiqzg?=
 =?us-ascii?Q?2lFGlHHbRF9QxKU+V1G+gYLanZ5SaplVLQh0LrU81z1OEnBB0ZuNTDhpy/ry?=
 =?us-ascii?Q?uyZCLU8heRbV4XU1zvVYgpLdh0FY0UlM+Ifl0vgkCUIAJT6cqOiglNODUuky?=
 =?us-ascii?Q?xkFG+FrCFo6gRGI9PuRwNxutJ8U7gXvduxmtiYd1PcH0R+125DgO3QWKgTMX?=
 =?us-ascii?Q?3ABghseSJs71HT6bfD7jOFYfRNi5992GwCaOPYULDTz7HpohvLWzLNu64jgz?=
 =?us-ascii?Q?XJnto5UOZEqhlxTOKJ/qrXSC7eVrTM0MmSYVn7Eu5OnKigPBovaanKolKJwn?=
 =?us-ascii?Q?ebSE/ksQFTpeNH2AdHGgikH/RNNFuUOHm6OWlKF6xU4FY9qJTVPwtYHZIG1a?=
 =?us-ascii?Q?dNR9mBvLZ9fuihmko9R3BPw0RQP7735Qd4/osm7WDLPGoBGjJTkNeyXAY2ic?=
 =?us-ascii?Q?Und6MoL5+M7AhST45dEYmpqwC1IEyOxakdvf1u6g9Igav0r90xGnswlI0By2?=
 =?us-ascii?Q?e/N2GNAo9KyW03+hNuMckzRrIEUzdefIXgvdWGPsW8sais0aA+EdpV7WTWXl?=
 =?us-ascii?Q?n5U+6qLsBkwn8RI+g87hoj9Nwok+W/NQ9rLzBEgwCJkEuHw4nrrftbwxvAsx?=
 =?us-ascii?Q?F0ECZYCa1VXS1uDGqH0ZOdT+DVr9GLqrS6bHyycvzK9UM8xSH8PpwP8hQitC?=
 =?us-ascii?Q?9iZX2IjEtNWH6Ih3bRTZLWGyBngio5eLadkN6kt8/I2w1PKzd+hvFgNBGCwo?=
 =?us-ascii?Q?XTztjWMKIaLbCeD54lSWkreNTlDpPZFpFxcAiJq0aWLhfTKteqdeTRwPG+HK?=
 =?us-ascii?Q?1hgyUzshjGK9ClWkRpc6/DVxt7IFCJbY3yP/XXcLVeTU4n5hJ8hTbFqH1376?=
 =?us-ascii?Q?VIusPwUuAidinaktQbD/mLTMbs/6+uYUH2gNWSziBGJyWZgkjvvtmt8iZroW?=
 =?us-ascii?Q?3auVSSusICc4Ird993+PRSso4GgD0A79T229x4bQd6iCGlTlopQ8Tyf0UOe2?=
 =?us-ascii?Q?ZJqnhp8jbx36qTyyJlwwFSEDEKuO18lcJ9zLZr9Gq8aYsZg5r16sZyQD6Y7A?=
 =?us-ascii?Q?/O490kupYwCAgnQhUcERHF5Jc8vV9oYUtF6DBpg5IrVeMFK3wLYX4bpl9NTZ?=
 =?us-ascii?Q?jU15hJOJWzOgyqAQ2DI0i2+i8MdsPZv8YlD8x1kLkYgTEO73j7HnfOKTowUv?=
 =?us-ascii?Q?kdY6l37RDDQlC2Hpv4TW8q9PppmzbQxm+gAIuD+u2mGVa8dWVOkK//dzD1Ej?=
 =?us-ascii?Q?LVgumZclIMjnkTqS0XqcXmk5x5JHat3awn1St/c5VMOPe/lOUve7vAxcwN83?=
 =?us-ascii?Q?Ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea7638fb-73cc-4b2d-04ae-08dc2287a6e8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 18:08:39.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ske+mI3g7wRhJZ06SPID2IucIMChUZJk4RA0dHAfSPHPOwe9ARCDSOnZ4HKYWadCBHtq1WosL+Pvq4wA+O7jyBxiCwUrR4Rw6hZtvZCykZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7177
X-OriginatorOrg: intel.com
X-MailFrom: dan.j.williams@intel.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
Message-ID-Hash: BHQUVGP5TNTID2AXHW74JZRCEADCBLBQ
X-Message-ID-Hash: BHQUVGP5TNTID2AXHW74JZRCEADCBLBQ
X-Mailman-Approved-At: Tue, 06 Feb 2024 09:59:56 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BHQUVGP5TNTID2AXHW74JZRCEADCBLBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pierre-Louis Bossart wrote:
> 
> 
> On 1/30/24 19:46, Greg Kroah-Hartman wrote:
> > From: Dan Williams <dan.j.williams@intel.com>
> > 
> > Add a mechanism for named attribute_groups to hide their directory at
> > sysfs_update_group() time, or otherwise skip emitting the group
> > directory when the group is first registered. It piggybacks on
> > is_visible() in a similar manner as SYSFS_PREALLOC, i.e. special flags
> > in the upper bits of the returned mode. To use it, specify a symbol
> > prefix to DEFINE_SYSFS_GROUP_VISIBLE(), and then pass that same prefix
> > to SYSFS_GROUP_VISIBLE() when assigning the @is_visible() callback:
> > 
> > 	DEFINE_SYSFS_GROUP_VISIBLE($prefix)
> > 
> > 	struct attribute_group $prefix_group = {
> > 		.name = $name,
> > 		.is_visible = SYSFS_GROUP_VISIBLE($prefix),
> > 	};
> > 
> > SYSFS_GROUP_VISIBLE() expects a definition of $prefix_group_visible()
> > and $prefix_attr_visible(), where $prefix_group_visible() just returns
> > true / false and $prefix_attr_visible() behaves as normal.
> > 
> > The motivation for this capability is to centralize PCI device
> > authentication in the PCI core with a named sysfs group while keeping
> > that group hidden for devices and platforms that do not meet the
> > requirements. In a PCI topology, most devices will not support
> > authentication, a small subset will support just PCI CMA (Component
> > Measurement and Authentication), a smaller subset will support PCI CMA +
> > PCIe IDE (Link Integrity and Encryption), and only next generation
> > server hosts will start to include a platform TSM (TEE Security
> > Manager).
> > 
> > Without this capability the alternatives are:
> > 
> > * Check if all attributes are invisible and if so, hide the directory.
> >   Beyond trouble getting this to work [1], this is an ABI change for
> >   scenarios if userspace happens to depend on group visibility absent any
> >   attributes. I.e. this new capability avoids regression since it does
> >   not retroactively apply to existing cases.
> > 
> > * Publish an empty /sys/bus/pci/devices/$pdev/tsm/ directory for all PCI
> >   devices (i.e. for the case when TSM platform support is present, but
> >   device support is absent). Unfortunate that this will be a vestigial
> >   empty directory in the vast majority of cases.
> > 
> > * Reintroduce usage of runtime calls to sysfs_{create,remove}_group()
> >   in the PCI core. Bjorn has already indicated that he does not want to
> >   see any growth of pci_sysfs_init() [2].
> > 
> > * Drop the named group and simulate a directory by prefixing all
> >   TSM-related attributes with "tsm_". Unfortunate to not use the naming
> >   capability of a sysfs group as intended.
> > 
> > In comparison, there is a small potential for regression if for some
> > reason an @is_visible() callback had dependencies on how many times it
> > was called. Additionally, it is no longer an error to update a group
> > that does not have its directory already present, and it is no longer a
> > WARN() to remove a group that was never visible.
> > 
> > Link: https://lore.kernel.org/all/2024012321-envious-procedure-4a58@gregkh/ [1]
> > Link: https://lore.kernel.org/linux-pci/20231019200110.GA1410324@bhelgaas/ [2]
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> This patch seems to introduce a regression on our Lunar Lake test
> devices, where we can't boot to an ssh shell. No issues on older devices
> [1]. Bard Liao and I reproduced the same results on different boards.
> 
> We'll need to find someone with direct device access to provide more
> information on the problem, remote testing without ssh is a
> self-negating proposition.
> 
> Is there a dependency on other patches? Our tests are still based on
> 6.7.0-rc3 due to other upstream issues we're currently working through.

The only behavior change I can imagine with this patch is that
->is_visble() callbacks get called extra times for named attribute
groups.

...or if an is_visible() callback was inadvertantly already using the
SYSFS_GROUP_INVISIBLE flag in umode_t result.
