Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6659DB4A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE87815C1;
	Tue, 23 Aug 2022 14:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE87815C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661257152;
	bh=36l/Rr8RVvK2YeAF1dykhp0XVSs8L5gDNpKsMvEHRKU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kazg2h8FHRhVa+XlCy+Hg6J4w5MmhZPwFI00RDC9jxJdxHCcU0q2iksmvFEtfRiVN
	 wQ/kOhKbe6s97GiIrjEkYPSuNM3Gm63SGttI/FTsIxqdXEoDaIbH+hyuOLSNbpXm8V
	 7k3LGuOFOpoAQAUzeqxxOflT2MFGHNGkjvTfPcpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 257DCF800C9;
	Tue, 23 Aug 2022 14:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E81D3F80152; Tue, 23 Aug 2022 14:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9288F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 14:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9288F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P+cPNwrQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661257086; x=1692793086;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=36l/Rr8RVvK2YeAF1dykhp0XVSs8L5gDNpKsMvEHRKU=;
 b=P+cPNwrQPwWz1akV3O4vPiIiWHo8QD0Y9waGUFBHpkBnWbkehqpT9J/f
 XlqTH0pobDfOiE6ZOduiDXbOxhEzcuwBxMON8t9wDO6f4jICyQELHOxbu
 UDM35b65AQR6i0fhpqcgbDAjFM0ycz8gQYVCxzvDohRbBBVU2SnLWZKmu
 MVCX4bPUENyc6abl/qweQCo7g5vNsHDYWkHWdciKqyCJWI19G5eIV+BVn
 79xfOee3eaiPbzzDLuEeQAMDLMMpztfquhRUK7ZT7FkmmdOikbiALVUBw
 JW3NPSErQeEiTR4ZNjYH+LZjmneaJ3+1nTE+rU1ll0NqYNfZUanCL6q2n g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273424310"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="273424310"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="854845099"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 23 Aug 2022 05:17:55 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 23 Aug 2022 05:17:55 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 23 Aug 2022 05:17:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 23 Aug 2022 05:17:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 23 Aug 2022 05:17:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMKPr/XDFjTucgkam4+COpIY0A/XZaX3TzKjycr7l6PVFDJL5lWpK4YlTB9z+mb3bw8DpdyanL130etza4ermzqMHTjZyWfy0bZxMI/88QmKv9jgt13MTcoupGUllom1a0qhi/g7hs9FfcXeiCX1sQUgyL1+j/RV8jlUAOHH+7Xx8p2QNaxssIptqyxmFLj8cYJUrml3l9vMmVNIbVKKmPy9eDkqVb1n5cPpMVf9wZhWWc+sccSoZDZPuL01GPowSuIApum+1vt1ZV6cUlA9uzH9lKaUS3PgIcV/U+dZtZvgd9YkvVxWdEqsM3bQxZODB1rSBJYcZhxt1BRg5TS6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO6BRiesEwij+UOQBb9P8qYb6/CujmWzreRyp1LrnHg=;
 b=Dbdy/HOhMCuMYQxhMagfR81Nut39a+f4Aj/JjS0uAVA+Jj5QZ957oA8BXIzzqjLQouV7E6u1cXoKPE4zH5eRakUtbbOYYGUamTUM5Zn242vPSSAks5KcNA1pODueHSmu46jAIja5a4QxGOKC0IZykP9rjnN7Ln5799S39AcZQSTLl6myIs0JsMpsZz/UM1M93cKGwY6ZH+6V/GcOYE11wpZo5l5yhGw1AXgMpJmIu47RRjPQd9+MgpWjyiy47DvIKeHUHDIiiIlCIy63Osd57hP+Z88fb6jmU1ka754IARK84rGFC+Fd8bJB61cULi5PcVESxLGncf9yEZo0mQVr/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM5PR11MB1609.namprd11.prod.outlook.com (2603:10b6:4:8::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Tue, 23 Aug 2022 12:17:48 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02%5]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 12:17:48 +0000
Message-ID: <df284a03-c7c6-239f-77ee-5f3248bcf401@intel.com>
Date: Tue, 23 Aug 2022 14:17:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH 3/5] ASoC: Intel: sst: Switch to standard device pages
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, <alsa-devel@alsa-project.org>
References: <20220823115740.14123-1-tiwai@suse.de>
 <20220823115740.14123-4-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220823115740.14123-4-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fde77bd2-d0d4-4560-5cce-08da85017db1
X-MS-TrafficTypeDiagnostic: DM5PR11MB1609:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3NBODanUDm0SbrKQ6BR4NHynWkAMAY64VfkfW3aVTWkuFk3LfEv7zS43eJcSGUvZuJNWc37D0xSDlRv8YK1MCy/cluKGOp00gW+5Mnha+Ju5NcWUQssATUudtRbF5YYHSnRqhHpTAKEtagDwYzLbyudoWNobBGI3Evie9rkNxMFvK0Hik7kCxacuQ9DE4Wm8dfiH/aPYi6HQZUuD9NkXRSsCrH+iYPJxlIdjEFaE0RVCqjSTVmlGSHd/50yi8HJH4fiNB8mSlGrDlibwaEYsps99K5gYj/+A3WHFSxnO3vP4GfVwKUvCNKNsMCJsTmZG/iVhKIWyrUSq1QnqKItSJI2oTBn6+E8cTADAUgoqzkwAw9Vy+BSFXCjFnNydHUfs/Do+qAnETTiT2DjsfWQqELXob2wKoPDoJzPfAlEuhbZcLcLUeABpqS2d3sh8YEsvr7ihkB3OOFcAa8dJXqNGP8ZKmgSWaR5O0NczRo9CWgnZ+f3IhrB1E/4oBMll8Tzey3HAr3tGs4nXxK9eb+3+3Vh3dWuHhjJETNWxD6M0ID1RQY3mp//bClm0raEkLgRaYgt37xcnPQmp/A0d5Mk0IxG4CAqc4Pgj1ndDkqohiIKPn3p84NU7QXzkKko5y1lacr2r4Mr5i+tCCacRb1FJ47nugZ3t6Gg35u49ZoaNm4gASFZ5edIqtdow/E5QdxzwHKncac8kbUADu3PhV2IPeM+bq1X4VExMEix0tCbdaiTLpvrgNAksQayksy63rrYpqrfG3IAOyIhQhoFb2gOTJzA+/YElPuWp+r767WyI9Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(136003)(376002)(39860400002)(2906002)(38100700002)(31696002)(82960400001)(86362001)(478600001)(6486002)(41300700001)(2616005)(186003)(6506007)(26005)(6666004)(6512007)(83380400001)(5660300002)(44832011)(53546011)(8936002)(316002)(66556008)(66476007)(8676002)(36756003)(66946007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2VaQUtaM2xkM2FDaFhHQnJLQ0pMdzNFS0dTOVA4aE5hQVcwY0tJdHQ0S3BO?=
 =?utf-8?B?VjMzV3Zwcmptci9SWHVxakx5dVFNOWkvVHYwRUZQZ2pmdzBFY2JicVVGUHM0?=
 =?utf-8?B?V0FLbXJmelhvMHNma21zQkF2SzlVaEVZWWhlSURidDVMYVFBYjMxZEw0cTRN?=
 =?utf-8?B?eFp1SFZySnZiYTBHUXIxVE1QZWVjYlYzMFVnMml4eDFoNWJ1b2R6Q09mSjBQ?=
 =?utf-8?B?eXJ2YUw1RmY3cXROaWlHSkZTTFAwTkkwL2RMKzloT3YwTHNSejNzOHZSWU5i?=
 =?utf-8?B?dXdhNi9QRTVxTVVVVnFFVFZUbFQvNlNvblJEZ0JvRWs5V3I0YW5OOWpOaTVB?=
 =?utf-8?B?MUhXTmtkNE53WktEQ1NadkdhUnEraHdGMjJRUm12d2NpMVB4cHpqb29ZOGpX?=
 =?utf-8?B?TUNhVENDQlZHMVloVUpnZDdkZEFIMEJ0RWxRR0JQWmhETVRZUGY4blE4K05o?=
 =?utf-8?B?eTErM093cjFPNXB2dmMxelJiTDVlYXJLZnNtbGh2ZzJFaEpQQ29FWWNGNmd4?=
 =?utf-8?B?ckQ2VWlVSGtxRXk2Z2V2NUhpcXRueXdxczc2N2NneXRFTTRJbU4wZ0paNmFu?=
 =?utf-8?B?azJXTzFRUlB1UEU0Mit4c1dPd3RPYnNWUTg0OFBrS1JSdGwzTmJDbHVqR3Fj?=
 =?utf-8?B?MzhkK2lYL0RRb0x0N1NtNDZPNVdZd0lhZCsyMzJwcDFEbGpuVmpwNE5ScFRi?=
 =?utf-8?B?UUp0M0NpbmZpRUFudkNWRWxWaU5oQ2dmNWF1eTJMaVFVS3NyVStQUlVFeVpP?=
 =?utf-8?B?S3dGeVlONlF4V2EvSGNybmMvS01NeS82RlpuSVR0RWVYR1FQR0RwN3cwTUxh?=
 =?utf-8?B?ZDVRcmZ3ZHUrNVhCaUdhaUhwemZPWWgwdFUrRlZPN2E3NGp4NmlrRmxQSkth?=
 =?utf-8?B?TmtTa21iVW16TEhZODVkcjdISGswZjgxUzkwTHZ1YkZrUktoTUQ1YmR4cHpC?=
 =?utf-8?B?dUcrUmZML25LbFdIcmhsT1FqY0p4b08zblV5dC9HR3VFWVRrL2tzZXZsVC9j?=
 =?utf-8?B?amdyenlobmFlSHY1eFRqd0RqdjdrMGdmdFFsMHBPM1h1OVRPSXh4cmpxVUV0?=
 =?utf-8?B?Q09aZTFRL0JNTVZuOVB1a0k5KzdVV1R5NzRtSTR1WmVzUzRZRTA0SWRXTkl4?=
 =?utf-8?B?LzY4M05BbDN6azJxWEFaOTgvTXNPRC9QSWlRQ2lwVzlTWlJpeDRxTndGSmJx?=
 =?utf-8?B?Y0owZ3c0S2pxYmRRRFF4S2xoZWhRcjFmOUxWZUxpWFpuQjBmb1RuNldJNGs0?=
 =?utf-8?B?V090bXRSN1BlZmhqcHY1YVh6Ykk5cXRCcW9BK3lDejYvYzRZdjN2eFNvVE95?=
 =?utf-8?B?SlFDWFZVbjdOMGpsVFNGQzR6Rkd3SDZ5ME5HMzg2US9tM2k1T0pjS0RwMUZV?=
 =?utf-8?B?YkFXQ1d5N2tqeXdqc2NaZTZoVFptZWVXcHlOYWYvbG9JRlRuVmkzVzFqR0hC?=
 =?utf-8?B?Z3g4UUd2T0ZIRnkrVHJDWE55QmhDbW1FdHlCNlJhWXBwNVVYUDRBcS9PZlJH?=
 =?utf-8?B?cDgySEJQN0ZQT3hRZWI5YVBZbUtMWUl6aUpTS3RqVTlqUUFqUzZrSE4xUHE2?=
 =?utf-8?B?cmwxSGtBSDZHMXg0UG03aWhkUHdEUDZJdFdXTkFkVWoxTGNrN2l2MDROWiti?=
 =?utf-8?B?eGxFY1RWMmtBVFpGRlJsVDZ1d3MzV3ZGaUlMUGZlUE4wcmNUV3Y1eThVa0kx?=
 =?utf-8?B?NDVtWmFZWXBtVlkyT0lCa1VRUVBCRFBlV1B1Nk1ZY3Zua1FTOVpHKzhPM003?=
 =?utf-8?B?bkd0OWRjdmhGdWxveFAzRERoYlM5eGhNa1VkUzdKckljY3BHZ0E0RUU4UGlp?=
 =?utf-8?B?WkJTYWFGcnVnakhMQktsSkJtdHg2azBnWnB5d01GQW1McG9weTZLZ2dzWjJJ?=
 =?utf-8?B?ZVNSN0U1M0o1K21NbENPVHNFeFAraXIvMUdzYlh6TW9MY1h3WFFQNmpCdEJt?=
 =?utf-8?B?aVQ0enRCVGpucUU3d2FvU2hJNlhaNFVscUJDWFBIK3dtTGUwbitSbG5vUWRm?=
 =?utf-8?B?ZXFEUEk1c3JId1JpM3Q2NkJtWDZaVmJGMFdET1pNamEwYUlCaGpMZlYrVElW?=
 =?utf-8?B?OWJqc0VZSHFlbkUzTmVwY2VSaXA3bUc5NjdxaEk4L3Jpb0NRdUJOZno1dXR5?=
 =?utf-8?B?bVZWeXBid2ZKVU1rMkkrUmJ5eU1SMGVITnhBT0lGeEhSMjErYlZ0SEFjSC9j?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fde77bd2-d0d4-4560-5cce-08da85017db1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 12:17:48.1740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gsy+5XMLScTHkolD/tgD0l4dDnHijTJL+ZCb59mHptNl8FPU7dOAzbW20VAm2k2nWzSxhas8/qRUV28jc64DTH2N2ub4fbJiPmO9mpP+X/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1609
X-OriginatorOrg: intel.com
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

On 2022-08-23 1:57 PM, Takashi Iwai wrote:
> ASoC Atom SST driver is using the continuous RAM pages with GFP_DMA
> flag for its PCM buffer, but this should work fine with the standard
> DMA pages.  As a part of cleanup work, this patch replaces the buffer
> allocation to the standard device pages with SNDRV_DMA_TYPE_DEV.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> index a56dd48c045f..c75616a5fd0a 100644
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -676,10 +676,9 @@ static int sst_soc_pcm_new(struct snd_soc_component *component,
>   
>   	if (dai->driver->playback.channels_min ||
>   			dai->driver->capture.channels_min) {
> -		snd_pcm_set_managed_buffer_all(pcm,
> -			SNDRV_DMA_TYPE_CONTINUOUS,
> -			snd_dma_continuous_data(GFP_DMA),
> -			SST_MIN_BUFFER, SST_MAX_BUFFER);
> +		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> +					       pcm->card->dev,
> +					       SST_MIN_BUFFER, SST_MAX_BUFFER);
>   	}
>   	return 0;
>   }


Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
