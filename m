Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80D873BC8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:12:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B0DD83E;
	Wed,  6 Mar 2024 17:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B0DD83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709741576;
	bh=UT30R4QzdKH8k4mCkIJSCn1wZzVL88t7bcUSxPXRHws=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lSWZxE/EUv2QIp2uxh7fWgjIefb0k/mmGIlziV9XB/4p01qNMAgAksPqdPGwvE82/
	 Yu29VxW7lmBKViQ62VuthVevh3LbFsb66iaBbK3+S/4NBPfB7UsyoZkmupynb4PU7W
	 Nm+zH4V41WsBC1gTj1ZRP0GfrbBdAeGQyOrnPe60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 486B5F805AC; Wed,  6 Mar 2024 17:12:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C567DF805A1;
	Wed,  6 Mar 2024 17:12:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1944AF8024E; Wed,  6 Mar 2024 17:12:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88F52F80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88F52F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gLLukawm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709741536; x=1741277536;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UT30R4QzdKH8k4mCkIJSCn1wZzVL88t7bcUSxPXRHws=;
  b=gLLukawmyelSaGv3848ZYF8nxPp1fg+I/ZzmUe5eoYpcDq0HY/ENoy7O
   RII3Yv79VBg+jmiJbadCq7qABuQOrWc/DpXLIfbhOjQPyyVHyUqhBFUZi
   AfD/wJ8sx+mrHAMTqQFuBeh+0dg4OjAmAYfux7HgYBEFBxGBilv3JIhFR
   IqOXrE6Pkf1CK/Z0RtKVfUztek1UWqgkWqf/uXr2m+LpkD8cXBvNlwgAd
   8n5H3cy3b7+iiw8KdorGRN4gkPTeQPEthrexldG6LniIKLSmcCWNQ1gpd
   Ho1C7dp5B+cj9pULM1gEYpjxIYc+Rot7spcpVf5YutIrdquKuhv2cjWg8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8167575"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000";
   d="scan'208";a="8167575"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 08:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000";
   d="scan'208";a="9666569"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 08:12:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 08:12:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 08:12:11 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 08:12:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh2m6gE+2xyTpGnT9uYiLTVMZAsoPwIKcqKb0/DR94cXTHbxAp3NhaO6e0Yf0Gm3a2Xu5RUiAh8BUnUw69xMmqz6yjzo9zfvut7PjGhlvsPsMc2XtLTENVItfHONR9hXz3p4ggmT71jhOleJB/Ko8YuOnAA/XZolCjlq6V9vSYKv9toykWkrYonayxFQNqDq66XoMZU2DCYPaV6T0Gjl/HkjBMfU15K0jQpH9IoP3q/mBUYZWlgMEOHIhLu6V7eaLOESkbhOHBl6SepwVNlT4Wnt1iXWUm/QGAajyhgcxCKyYMpGT8kMLN6+NXEEjSJdpTBpCQZ55yKVGNdJuJMmbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4L171/UsTC39jESLONj9Rl6Yklx35FcJe+Y2JCPlmU=;
 b=GA03uO3DDivJInYL5iY2xvy+cpfhsRO3NrQ4Cs3waWCl87uLwgQL7tZYgcdbyXMPcEaz03LP/C+nTpYBBkgZCuN98nkAkYikUb7QIguN1LmX8gyJ8hN2RZXpjoOpx3CQkbo0Avtnbbc2iVrZJ5i6rHplJBdEoCQcSpZbQB2vFCOMF8fuX383w7jgwzEuQEGnUrvMk/kBBI0i9i9mN78+BnNc5mk+yBKEZdDUSj6Enm1gJe/Rf91maCB3srqdcaHpnexLSk4g5MSEsKVP8qSmNW0GsF/XXBJJCjolyKTbl2TxJp8zejciz+DYSPq+SUIL2p7zn+lmksTH+Fm6rY+bAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW4PR11MB6571.namprd11.prod.outlook.com (2603:10b6:303:1e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 16:11:21 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5%7]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 16:11:21 +0000
Message-ID: <9a21701e-2729-4ed8-813f-065f1785f394@intel.com>
Date: Wed, 6 Mar 2024 17:11:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-3-cezary.rojewski@intel.com>
 <14a2f9b8-7711-47c4-9f57-bd839c700d4e@linux.intel.com>
 <ea72dd2e-587d-4660-9a8b-da3048819e6b@intel.com>
 <50fbb243-ab41-411d-9e3f-b8d9f5574768@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <50fbb243-ab41-411d-9e3f-b8d9f5574768@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0206.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW4PR11MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9581c4-c3db-47ed-183b-08dc3df80ff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 04eXwUuXu0iibeGVaCUa4FKPhRhP8JC4kKkOLcx4pTFRnLeeq78SzTVrUEt1MIwlgmERWkArYX5z5QcswbC0XQRFWflBfYOuPuurn5iBRLP0PaT6G3cE1SYiLZWQVVVZCM7BW5Offqy08l1Cd5P0J9+sHKWV9+bxJSfLKxpQtmZtUluL5pw36E9IDIXnB9eEFjGWCp76pjPcKTtOjIBEBZJcWhNOZ22wIAEHtsjQxuHNl55VYiq3pOopMnJ0oMPPnsjnWaf8Kez0xb8eLt50Yf+xber6LNkVBKd3e0GTrsSHK6OniwDdB9qwaD8Rs1De8EwO3C2BYK1eWi8Na5KFSjIdpGWkEU6Q1ebkLBv6lWJbpKlItMCfv/8WooIy7NOiIDU6pnaNgTCZqY/Jqup8sxVj3sjT/1tSYkh67c3BKm4SFyUy+z0OPn4GnskdZAWj0HfjiQqanDzBN5KYZPnjchE7IcUAA1CHKqC37a9Oqs9GcvrHwMO7OvQYQofH0ewYUrZYUeHVb/JRI6l3hVyla669tY08LH1s5/o/JLaDdfI6LG06lQrU5Ve7VGlBO3RWn0Y/H7/UrW4YSez3BLPV/8a8YbHmrJvl3QzBxM3SNfsHTU2MC4aV5rJETcKdrtY+k+wcF947nVWrDT2Wow43d7UWG5Dcl+QnTi8P0yGo7Z0=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?azY3SlVjaUxER2I1a2JGRk1MNHkxem45Sm1OaWxLN1FQdUMxRmlxd3pDRjh2?=
 =?utf-8?B?TWY5RkEyMjVnZWFROWF2WmtlZkxHSUdsRllMaFlaUFVOaTVOcFF0d1p5TkY0?=
 =?utf-8?B?U3paUnMydENyZkVBVWo1UzhYcEtYSlM2cHI4Und5RGZ6VmJrdjZRcWpjWS9X?=
 =?utf-8?B?ckZGeDR0YWYzaWovanJHZkVhWml2SXIxTzVSV3E1dEQzWU9zdW5UaWV5MFhI?=
 =?utf-8?B?M0VNdUl1LzEwamEyV3R4MUcxQW44aDViS2NPZTd3Z0RTVE5hVy9uYi8ycnBB?=
 =?utf-8?B?VWlkUVBUc0VWaGtKMi8wTXRyeGxTMnRVdmY1aDBhMWNDbHNKWWEwOWpHYzF3?=
 =?utf-8?B?SEJHejBwck5LR0FPTnBIc3c0emRoOUJoWEhPMnUwQVI0TFdOWHRxMDJTMlRi?=
 =?utf-8?B?cC9Qcm5iakErYndQL2VqRUQ1dWl5dVpvSUIvczU3ZlRseTljK0JSczFramlj?=
 =?utf-8?B?N25NbVRzK0krMUtZdEp2b1ZnUm4zdVVReEJROHl6bHpFNWR3ZGdobC82OFJk?=
 =?utf-8?B?QiszdHZDYkdSd2k1R2gvQVJmRHBvSjNpb3JUblRDMWxvWVFsTnlJeW56K3ht?=
 =?utf-8?B?UlM1NnZrWlFlQVg0QTRQNE9wQzF1Wjd1dmNLbmxUYnJzUkNoUkthREZqKzhT?=
 =?utf-8?B?NTZHUnBFbzQwMGdNU1hFSTFZUUMwdTRZUzFscU9zQ0ZRUTZuV3hWcklwRm0y?=
 =?utf-8?B?cmRzTFYzMVNJOFBCM1VkcFBWN1JYb2gxZ1hHMzNkTm8zb0ZDWTZjZVppMHpO?=
 =?utf-8?B?NWdicE9JTFdoU1l6c1kwZUNha1RYSjNZTlRnSlVWeFFVdlhaVEpESmh3K1ZM?=
 =?utf-8?B?OXJFZ3RWcDBLSlA5SS9Ba0FqNlBRV0FBK25RWTNjOWc1bmtCT0R5UWNwaDVC?=
 =?utf-8?B?M3NmUTdjZFQ1c2FIam1MK29WL2hHL0Y2blU1eUsvMFpEcHR6VTdWVGU5N3pU?=
 =?utf-8?B?TzVwZExZd3BDeEpVQjI5djEzeUNYcmRiSE9RMUMxS0hZSWZuNWN0cmluYUYr?=
 =?utf-8?B?alk3dW16VnJuekJFZi9yakZudnUyMWhnUHc0WjlwaVhBdDhlSnNnZGlGc3Ir?=
 =?utf-8?B?dnB4WnpPNDkyRkZpVXFtR3I4bTNlN216TGpzTXNnSUVQaXJvQXZkVURoWHFk?=
 =?utf-8?B?NUhhVE1yWVZ0c1VMWEhseHVpNlJrTUwrYVh3OUFuQkk3Z3o3WVhPV2t6REwy?=
 =?utf-8?B?VGU2UURkcTQ2SkJzZUFkbTBmL0xrcGN0R2pKTWt0aXpLMXVtL0FEcERuSURx?=
 =?utf-8?B?UEpVRHV4VS9JSnhsdXVPQkZYMmxjd1lCNVJsM3Y5alljTzZhTHZUVlA1UWQz?=
 =?utf-8?B?a3UyNC9uelZ5TzZPa3R1Qy8xZjJCRlQ0S21yV2JMWDJtWFJZK2tPQjVkUnRt?=
 =?utf-8?B?VWlBbkplbVhYUW02cURrc042Zm5qN1AyYWJIc1JoWHJUQnBzNE1mcTBLZ0Vj?=
 =?utf-8?B?KzVadENkY3pWWWZXVWxzRmdvRjhWTjBkOEF3RzY4dU1KY0IvY3dhaE5CUllx?=
 =?utf-8?B?aTdSZWpyRnlFRWpvK3JsU2FqRVBBVUdrckVXWUtKVGpLSm5nS2VRanB4OVlw?=
 =?utf-8?B?QWhEUGQwU3JFNE9VREFxZGNkWmRRbHJqVytYWUlFNkJ6Q0dkY1FWVXBMODZB?=
 =?utf-8?B?VGozV1owb3o2U1Y5UWhaVGFUR09oRUQ3RlFHSmZ2R09jUVdDaFJwb01ySXNo?=
 =?utf-8?B?M3Y4OEczK0NpNnV3NW5uNTlPWVBjamF2M2xQNHBKYjRUYnlnSEJTMVM0bTU3?=
 =?utf-8?B?b3Nya3ZsTHBLeFNkclIwTHpadHpjSVI4WEJzYWdURUZzT2NOVjNEd042OWFz?=
 =?utf-8?B?SG9WQUZXb3ZZYWx4N1UyS3FocEdmRTR6SENyeU1QMktJYUsyeXNza2ZlOEtH?=
 =?utf-8?B?TEltdDdrNWNycWNBUmNJamNuMWxCcGRCazNjeVdybDM1VmxUUkFTRHYwY0FJ?=
 =?utf-8?B?NlROamlLUjU0L2NyVlFIcXh2NTBnaGZkelRTOVR3UG95ZHJBcTVCenFlVW4x?=
 =?utf-8?B?T0xnQi8xbXQrKzdIaEptU2pmZlpmd1NQUTNLMkkyZC8yMFgyT0hzOTJEZ2R1?=
 =?utf-8?B?bFFreXVYY25Ib1g4bXJmamQ1dERxZkpSOTZXR2sxN2V4ZzJySlRMVmwzb213?=
 =?utf-8?B?NzFPeHhpQ0xrWWFNT3Z0aTdRMVZzUTVZb0pzWkUvRTZmc0puZkpnMmVFNGFN?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf9581c4-c3db-47ed-183b-08dc3df80ff9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:11:21.0926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C17De61zpGI3Pn8krOL/xIdOXlEoIjLKNXOH2SrOoIU936ubNYTlLab5vhGulAHrFIYN2HS5b+kw/CDhnsv5/sII2SyXgIY/8hTTgRghT+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6571
X-OriginatorOrg: intel.com
Message-ID-Hash: 2OUXZMFXMPXD3ZTR5U3RP4BBSCVR7IHR
X-Message-ID-Hash: 2OUXZMFXMPXD3ZTR5U3RP4BBSCVR7IHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OUXZMFXMPXD3ZTR5U3RP4BBSCVR7IHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-03-04 10:25 PM, Pierre-Louis Bossart wrote:
> On 3/4/24 14:50, Cezary Rojewski wrote:
>> On 2024-03-04 8:32 PM, Pierre-Louis Bossart wrote:
>>> On 3/4/24 13:05, Cezary Rojewski wrote:
>>>> One of the framework responsibilities is to ensure that the enumerated
>>>> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
>>>> the are checks in soc-core.c and soc-pcm.c that verify this, a component
>>>> driver may attempt to workaround this by loading an invalid graph
>>>> through the topology file.
>>>>
>>>> Be strict and fail topology loading when invalid graph is encountered.
>>>
>>> This is very invasive, it's perfectly possible that we have a number of
>>> 'broken' topologies where one path is 'invalid' but it doesn't impact
>>> functionality.
>>>
>>> This should be an opt-in behavior IMHO, not a blanket change.
>>
>> To my best knowledge, soc-topology.c' first "customer" was the
>> skylake-driver and the final details were cloudy at best back then.
>>
>> Right now sound-drivers utilizing the topology feature do so in more
>> refined fashion. Next, in ASoC we have three locations where
>> snd_soc_dapm_add_routes() is called but error-checks are done only in
>> 2/3 of them. This is bogus.
> 
> I don't disagree that it was a mistake to omit the check on the returned
> value, but now that we have topologies in the wild we can't change the
> error handling without a risk of breaking "working" solutions. Exhibit A
> is what happened in the other places where this error check was added...
> 
>> If the intended way of using snd_soc_dapm_add_routes() is to ignore the
>> return, it should be converted to void and flag ->disable_route_checks
>> removed.
> 
> Now that would go back to an "anything goes" mode, not necessarily a
> great step.
> 
>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>> ---
>>>>    sound/soc/soc-topology.c | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>>>> index d6d368837235..778f539d9ff5 100644
>>>> --- a/sound/soc/soc-topology.c
>>>> +++ b/sound/soc/soc-topology.c
>>>> @@ -1083,8 +1083,9 @@ static int
>>>> soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>>>                break;
>>>>            }
>>>>    -        /* add route, but keep going if some fail */
>>>> -        snd_soc_dapm_add_routes(dapm, route, 1);
>>>> +        ret = snd_soc_dapm_add_routes(dapm, route, 1);
>>>> +        if (ret && !dapm->card->disable_route_checks)
>>>> +            break;
> 
> you could alternatively follow the example in soc-core.c, with a
> dev_info() thrown if the route_checks is disabled and a dev_err() thrown
> otherwise. At least this would expose the reason for the failure after a
> change in error handling, and a means to 'restore' functionality for
> specific cards if the topology cannot be updated.

Sure, in the next revision I'll mimic the behaviour found in soc-core.c.
