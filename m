Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C39860F54
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 11:31:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C405E846;
	Fri, 23 Feb 2024 11:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C405E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708684281;
	bh=mLOdcfXDExv5AutUdpk/0HkN15at4Nd2qafmi74zes8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mwhiqvgg9guYkwD9yxQhuYGUchRSOJ+XloVRX8CEygjF9PSkPacUdulkGRGzZGs5M
	 4TV0gYEWnqKpGiUiv2hz5Sgr5ycyxPjjIrhrzxTw0Au6MDjgZvnxeppZt5zSrF1cq/
	 6PnJoqUgo8LSIB7u4AgyRtptW6PPHWH65b8VgP7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6753BF805AD; Fri, 23 Feb 2024 11:30:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD305F80568;
	Fri, 23 Feb 2024 11:30:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 979E9F80496; Fri, 23 Feb 2024 11:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0AECF80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 11:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0AECF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P6h9FVY1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708684233; x=1740220233;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mLOdcfXDExv5AutUdpk/0HkN15at4Nd2qafmi74zes8=;
  b=P6h9FVY1fo/YZN7fs3VUcSZe9ol7zmlYsuNub/QtmKFhj8eNK3ViEENo
   40U4XK9+eweF+jCZpeLqHoVglLRzBlocLSL+eAMVcAUNNDYLgQstI/NeN
   KRDe9xOwVXIPKxZvReq5bGAkUOsLJRw0FF22SPoYkD8g22vZ5EC2WHJ9D
   FSFQiD+A1utH0S6nB0qfSMJpOJGLNE5LY8hQfGl8kuHmbFuX4cTxdEEXc
   mkEMrIllsjafmB9bQn8w3lfXZ1KUJDkEupbiKoGtvIvneKDBgB4pUfCSn
   P8kq+Ze0X39Sp/tjZUQPrmVvhJOveOHig18MLYNlvs9AHhZMCfJn0Ajqx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2860975"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="2860975"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 02:30:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000";
   d="scan'208";a="6000645"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 02:30:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 02:30:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 02:30:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 02:30:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZ/qjwOMI4dMPzXy5rahjFomh3brY4t7qcBA7InSE1xb6e5cBM3cAQLVIGq8+eMtJfneGjmcQKKAvq/ADKhC0yKMbRf5/l9JRJ8mJoLRUs7ziPnWDit6wa3EDbbygnyyoGlZbMv54ZWW8XRQwdFpoQBioe10ERLoZVT3RrUj9hYIl1qL5AWnte8fxXLSk70XRrJ4JOMr5ncm2X7FvK6I0HN6vMY/1QF9BGgeRbXsKbiFwCSt5I9wVK3PjZP89i1eBPE4gTD5w4FDtpYYPD2+75ZOnGG1JAWeUtGrHz+HE4xh6B3QmbkgR1JraUf2oKy7yk9mRiuXdtdWKWKdtjw7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nq+ujt6HSQ0x6IyF3IouoPtO9xIMTP3loVl2M7tHy6I=;
 b=Yz5MUlK658x69z+FmAyzdZr+9bAyZgPzWL5F4TDmEdobsFFqHeBFx/Qnc/Lyd86m4CrlN6UcbQQWriJ6Tjq23O5gtY0/GOzgr7/lw6+XFAARtZYT5+BCHRnHjec0vYMB0A0AMLUJtBnUb/QcT+lyYGAUj4oKVWcrPum2EIJjZslolhlnTs0srfZVQwDkt5/Qr6jiveOXqJGZ9Rp6y+NLjhnYP76Pq1uU5WUDpgTAIbVJhMugLE9TMKSHYEkLKJQpAX4zoVTI6bu6Hx9BVLhsdPK5Y9zqrgbXL2E5Z5XGqpvfhPqRYF4fc/EbNY3NJ8ls6lbDCAlyZjzaKfP0uZCsig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB7720.namprd11.prod.outlook.com (2603:10b6:510:2b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Fri, 23 Feb
 2024 10:30:22 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::5d2:537:5261:6713]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::5d2:537:5261:6713%6]) with mapi id 15.20.7292.036; Fri, 23 Feb 2024
 10:30:22 +0000
Message-ID: <d6604d0d-0114-4d28-bf81-bc14053860bc@intel.com>
Date: Fri, 23 Feb 2024 11:30:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ALSA: hda: Skip i915 initialization on CNL/LKF-based
 platforms
To: Takashi Iwai <tiwai@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	<broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
	<tvrtko.ursulin@linux.intel.com>, <intel-gfx@lists.freedesktop.org>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20240222170614.884413-1-cezary.rojewski@intel.com>
 <20240222170614.884413-2-cezary.rojewski@intel.com>
 <ZdeDNT5jCgXAP16Z@intel.com> <13fdb738-1a37-47e2-8d06-959bbb85c2b4@intel.com>
 <Zde0kkWX5TrZu-U7@intel.com> <878r3b4le8.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <878r3b4le8.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: d516cbc8-151e-47e6-dcd5-08dc345a7097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 bTZr9HVJ437Gk5j6roGy3GDttbhURf0tXxC0zpQHcbjAt+af9WnO2fOka8E9q+XKquV/5lu0GmbHhXnKUvDJQ4TfmoDSfOjWZTRC5DWNhqJQBvDiVO0StWjIitc4E/EVfRT6GizqjGF9nTZYitXBUYjc2m1WOIjZGbvP3cf+Lw2v+DxSsuqxzlTPpnj18E1eI9XSk65GXY2HFd8nBC5/OlmMDJNnhgX3TlhPWNLexglwZoTEZiE2KsLVb0yT6E8SofEh9N2S934rwWpxB5DRg8swg4vc1NUmvcSgmkmhx1lWw3a924Ol9jdCczbwzuUWE1FCR3fTbEgzgn6K4tTKKjMMowROwtp2qyLuwR7drqAyS7tfA6tGrfCEZUVGowatF/UkZOGl8gjngaFgeKNdsLy8hSG/C+djkdQOtoaIAeCmviljXl9RhwhW3PX+yU16mmfguQDQ/hUlIMEeiuzYG7GiK1MuM9XZdy6r891UcJp+Ab0yRahF4yRFnwmAErj2SffvqAXbAcCp6FdI5h4akau2wAWzc6vN7b0lEF9PY30=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?VW42T1R4Z3p5eUsxc3dHdjFXekQ4VmQ2RjVxckdRMENTbHlDaEp4SitOQ2Q5?=
 =?utf-8?B?VEE2TVd0ZFg5OTlzVkFUOVR1VFBUbjJWSUp0S1ZwcTBFREJsVWRSMGhvMjlY?=
 =?utf-8?B?YUQ4R1RzelNlRXB1ck1HaU5TbGNiWU1ZTTRYdUxjdXcxQXRLTFhnTnZOVzFp?=
 =?utf-8?B?MWhaQmVhRHpXbDdiU2k2TS9CM3d0Z3BIZUN4UlB5ejh1anVXUVdVeVhMajZT?=
 =?utf-8?B?dGU2ejc1MGNWWE5HNWZUQ2k5NERoUHJjSVNmZ3l2YkFad0RUa2ZwWHMvYlQw?=
 =?utf-8?B?b0h4cUhVK3dxWkVDNmFkaHdlaUx6cmc4QWh0R1JwT2ptT203cXA3OHpRM0Nl?=
 =?utf-8?B?T09lVVdZYVFmL01DOWxCRnZFQml2THFBaVhnSHhPc1JyQjVrenJ3YzMwa21V?=
 =?utf-8?B?dVBWSTg5Qk15ZjZzbXp2bjBZb0haT2MzeDM3cEZhOGY3Y1IvR0hzUUZyblkr?=
 =?utf-8?B?MEV0aEdPVFphT0p3VlFkTUNDend4OVlydHNEMjJHMW52Vk1IRjNVZDU5T3BE?=
 =?utf-8?B?b1hnR2c5MWNGVit5cDhDeUtEV1N5VjA3N2FkZW1zZGtUazRjWDk3WjlDTms3?=
 =?utf-8?B?YjZ3c0hqQkVxaC9oV1ZjNVAzVjFuV1dJWkk5S1VNOEZwbGUrWWxMb1ErM09X?=
 =?utf-8?B?SEtuUUdCMEFSYmYwS3E3S0VPcy9KZ0VhenVDL1hOWHpEdnkrWG5oTE1WSVVr?=
 =?utf-8?B?dWRuYnJmdzhJWlFwSmxyMFkxK3pNQVBiR29BeThLenFUNUM2NEd0MmpMd2ZI?=
 =?utf-8?B?d2lUQU82cytHZkRydzRyOWRQcm90ZWx5anZ3ZG82SGFOUXlYZmZyTzJTYTgr?=
 =?utf-8?B?aWE1bkxZRjFDb0V4NWozNkZzcWkxdzlxejhhR0pYa21Wa2Nib0FzVWlqb1B1?=
 =?utf-8?B?ME91Z2k1dDRnQWFoWjZlL3Q2VUcvU2U4d01QUUxDTFlKdGpESVNjRCtibUFE?=
 =?utf-8?B?RW9vTzFhNHZPbUFCSUFVMm9HZVNWY29iVWt0VHZYSFNZZFJKNm5adkRSQjdW?=
 =?utf-8?B?a0ZLSTY1RlJlcVRBTm1nNm1iK1k5MmM4MGdZc2NWZld1eFQ3N0ZNZUtydmhJ?=
 =?utf-8?B?MzFuaWVITHNSSnNMODgwMkFPNW9YN1lIWE9IdWtOS01lWHliVkQzU0lHUkFn?=
 =?utf-8?B?TSsxcTArMkpDODB1dUxSVENYWmZaeHJ2YjBCN0xOYkVGN0c4ZGJZajB4QStR?=
 =?utf-8?B?Y2Rwa1Fic0srZ3FwNEcvemF1QVlUcmFORmZNeklCUFhZcDMyZjlpKzBQbVJl?=
 =?utf-8?B?WjhabndmUGdGeUxadThVWU9qSTBoSms5Z2pEYVNYTC9reE1QZFUwUlNmTklY?=
 =?utf-8?B?NEJ6S3RXRy9oUlkySzBrNjI2UEM3Z0pFV1RCb25UUDhZQnI4dVBnOVhxandS?=
 =?utf-8?B?UlRHYkJyU29sYW82dVJpOURQbTVaSFN5b05qVU9meE5QZ01qNlRVR2Vhb01k?=
 =?utf-8?B?WXE3MHZqS0x2eEU4RGdLUG1xRndZc2tyL3VhODhrVHl2dHdkWDRPL3g2N0da?=
 =?utf-8?B?ME43bUJEeVRqb29uYUdTYzNWSi84TDdxT3VCUWlFeHArT1ZLQnVRN1VqWDIx?=
 =?utf-8?B?NXpjMndYa3BTTitLeTVGWENIeTdML0NHNmVSWWFHNWg4MWpySlFZL0s2aUpR?=
 =?utf-8?B?WmwzRWNzdy8vZlk1dXNpaW40dnpVL0Z4clJPWDdGR3JwYVBlQUE3RDlKeHBh?=
 =?utf-8?B?M0xvRmU1N1dtZDNlb2s3SDEwUjFCcjdnZERwSkIwbzhvT2hNOFNrMndKRzI4?=
 =?utf-8?B?T1VEd2prczdxVnVOVkhFZmx4RjdvUVpPTDBuSHJiaDkzdkludUJjU1dSZlkz?=
 =?utf-8?B?ZXc5ajhSOG1IZmd6N0hza3RlOGc0QldoR0RJcExNVmZZS3YvbHRhS1BJMmRm?=
 =?utf-8?B?M0JLQ3dwWkN5ZjMxbTZOSWl6OU1LdGYybXBLTjU5eDViWkMxVXc2c005RnZ0?=
 =?utf-8?B?OGp2QlRoUFVOaFlBUTdzWEZvQ1lCeTcxcEFDaWd5bnpQd0hJc2F0ellqSEta?=
 =?utf-8?B?eVIwQzlYY1F4T0V0bmY1QzVNTk9XSzNjbldUSUNXQ3hHWDBnOEszZTU2eHk1?=
 =?utf-8?B?UnZkMWJWOEl0ajVDcFJjWTVLbm96Yy9RTllUUkhUVm54VXM0d1cxekNVem95?=
 =?utf-8?B?UU9wSTdlekZWblJwcXFNekEzWGY4eXlabnNqNDZJT3JVZU9FekI2eWdIcjhr?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d516cbc8-151e-47e6-dcd5-08dc345a7097
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 10:30:22.4972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lGYmgHNUMihuYLKVmQVJ+SePnle4aHyrhq6yjkj+mk4W49HaCu3Mht0Jfu+Q+eN6DATQx4bdmmKoVcyFYLGX8jpIXFYA0gqRqTLQdp8pSms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7720
X-OriginatorOrg: intel.com
Message-ID-Hash: 27QQCSMQJTVT76A5GZ4OZXYCKC72PSF2
X-Message-ID-Hash: 27QQCSMQJTVT76A5GZ4OZXYCKC72PSF2
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27QQCSMQJTVT76A5GZ4OZXYCKC72PSF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-02-23 9:47 AM, Takashi Iwai wrote:
> On Thu, 22 Feb 2024 21:54:42 +0100,
> Rodrigo Vivi wrote:

...

>>>>> @@ -127,15 +128,26 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
>>>>>    /* check whether Intel graphics is present and reachable */
>>>>>    static int i915_gfx_present(struct pci_dev *hdac_pci)
>>>>>    {
>>>>> +	/* List of known platforms with no i915 support. */
>>>>> +	static struct pci_device_id denylist[] = {
>>>>> +		INTEL_CNL_IDS(NULL),
>>>>> +		INTEL_LKF_IDS(NULL),
>>>>> +		{ 0 }
>>>>> +	};
>>>>
>>>> I thought these don't actually exist in the wild?
>>>
>>> To my knowledge the opposite is true - while LKFs were shipped in limited
>>> number, they still were. I did ask few weeks ago my friends from Windows
>>> side about the support and they're still running full-scopes on HDMI
>>> endpoints on LKF platforms in their CIs. It seems the drm support is there
>>> though. Once you re-boot to linux we get -19 during probe().
>>>
>>> In regard to CNL, the commit removing CNL-support left the IDs intact what's
>>
>> I would prefer to go the other way around and remove the unused/unsupported
>> IDs entirely and for good.
>>
>>> very handy to us - we have a lot of spare CNL boards for our validation
>>> purposes - CNL-based AudioDSP spans multiple platforms, e.g.:
>>> CNL/CFL/WHL/CML. The number of newer boards is lower, unfortunately.
>>
>> Well, I do see your point here and you are not asking for us to add gfx
>> support back, but only help to have this protection here.
>>
>> However I'm afraid that these entries in the list would only cause
>> further confusion. Couldn't they get defined inside your .c directly as
>> a const deny_list? so when we go there and remove the missing bits
>> of CNL we don't conflict or cause undersired issues to you.
> 
> That makes sense.  Maybe drm people would get rid of the dead CNL*()
> definitions from the header as a cleanup in near future, and we'll hit
> a trouble.

Another, more robust solution could be to expose list of recognized 
devices by drivers/gpu/drm/i915/i915_pci.c in a header. Rather than 
guess, as we do in i915_gfx_present(), we would just loop over IDs in 
such list.

As I'm unsure if such solution is viable, what I'll do for now is: send 
v2 with relevant IDs moved over to sound/ tree, leaving the i915 header 
alone. Incremental update can be provided later if a neater solution 
appears on the horizon.


Kind regards,
Czarek
