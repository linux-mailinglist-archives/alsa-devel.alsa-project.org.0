Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEF2446321
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 13:04:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5ECA1684;
	Fri,  5 Nov 2021 13:03:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5ECA1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636113889;
	bh=Ma2M6iHPr6GttdPuPVuXAfnQ42TmvXjVxzQvKEC87jw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YkBsq6foGpEB4UrLseUS/40IIjbgO9ilB/vTAR/f6IUNXkVWQmm1WuR9w6LV+kGaE
	 hghUg8BwcPcKENVJnpHsXw2w2f5eK7Dt5Fv6gR1U43hftsLEvEjpQBDdTAjZJleXzr
	 4nVb3VvLyebJvJ4DeWxW0Pd3zlrAEOpnhF4sOlhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DBE7F8012A;
	Fri,  5 Nov 2021 13:03:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72A5AF8026A; Fri,  5 Nov 2021 13:03:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26CF3F80224
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 13:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26CF3F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="iVtBrHKK"
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="318087804"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="318087804"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 05:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="450772923"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 05 Nov 2021 05:03:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 05:03:13 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 05:03:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 5 Nov 2021 05:03:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 5 Nov 2021 05:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qls91pN+1P6BNBAbWt38T7++lTd3BqpLoX+jWA9+gRL1wQa653cDfTtrYcT8G92EN+3QmNF2aHQxV05Z8HWQOzliG+6xrgfgVOpNl/UWQ9j4HGuUBZuvB32vwg6HoGE02EpTNUoR5J9u+9ZD5l2EGLnZp0+2k1XLOm4f5vq60Ha5Dvy6/TbDWDYuAPUxmS3k4/7Fv9IGbo2Z6EW3ZFz4oBLauVdXXXd3ia8jP41OJ4zPQ+CtjMtBbUKdG7cAxujeoWLMCzQWC0Q9POD5eo18cmfPj9TGbiKaLJeWJXQSOdgqeIdtwv450kPgu/b82ukS+HLnVfb+vmQbZftOmCFCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLsLISDOc8shL0OpJZWLA/TvA8kziSW0oTQscECS/R0=;
 b=I866mpc0VYnFo4Q7S7qF+JhpL5l9ZhRGpz/5rXCOWbZWWoMrrXYPubpZ9oNDBZom/3L15GbTVJMEvH8fEYXKZDrWXkin1LI5NDsYPXe7JAM/xHvxXiyubTU07LQH2bBLaok0rgEUQreAV2nYHw3zvkyZWuVimNGRbKEWfo48Cs66fFN05YLzotyX1+uPKStdx9FFCLRLeu5hqKVu5omC2RpWV4o4vA8ZA7YpV/diFUkCmZt+Kk0n8ylT39YI+ddYlA7lD7am5AJimvmzfsqCZNitjEAz7p4Yz14kVElP3e5/s5hlbzg8x384cdjIhbXx1dNI+c60SCR9EyADqh6MTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLsLISDOc8shL0OpJZWLA/TvA8kziSW0oTQscECS/R0=;
 b=iVtBrHKKomZVbTRhbCYG6PsB4o91uqeSvoO7IryuH4OkyPUExbdKnBn3JVIFo5zZ1q3H4FdXrGNMLZDvorAYNMqemsHR6MDeyQ/3P4LVD/R3p5qn6+IuNo+/otIGZFGkuf4KXNMw3sXapNxRuHFD3f7RhMhFNRmGOI6v2fPj7cQ=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN8PR11MB3668.namprd11.prod.outlook.com (2603:10b6:408:81::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 12:03:11 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 12:03:11 +0000
Message-ID: <595088c2-a288-225f-11e6-1ec5b6f3c71c@intel.com>
Date: Fri, 5 Nov 2021 13:03:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH] ASoC: DAPM: Cover regression by kctl change notification
 fix
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20211105090925.20575-1-tiwai@suse.de>
 <bd3fbedf-6210-530e-2eb9-106a498bb23b@intel.com>
 <s5hr1bug7gc.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <s5hr1bug7gc.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::15) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.111.254) by
 LO2P265CA0003.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 12:03:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aca63d04-aacd-4172-ed0e-08d9a0543ccc
X-MS-TrafficTypeDiagnostic: BN8PR11MB3668:
X-Microsoft-Antispam-PRVS: <BN8PR11MB3668451BF6207BA0D6432BE4E38E9@BN8PR11MB3668.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TFp0a9+0rIQ5GNhKU6SUD6TmXZf26yorbiAZwliDKpAmax2/Fx/K5wxP6C1GnkI2fsyIwTqTeqDTAmr8dW3j62VN4D8XHDU6esFrjNM7l1QTylGht3ZXIQBL8FiTTdN5YxfYDbo0NxGMTzjoa01svHgDAFJjhQVgux2L++yqNKF7zv83f+f8cuYGcXHzVL7GEVTcSR0FV27LTLW/pakapFulREx1pPreKhXip/p9XnXwMEDDb4CWA3Qix3YRfhArcf4WJd7fNZ3QclDs3EqcOa1rl/9nhokBkoOGTjPGaA6SXLp3oOkPjEn/6RyVO3CuUExLg7vrIO7XqfR/7uEZXyUugBGWmWj/fBY6N/CVU5eQbe8RzzI2/TCbse9Lvo7eqFSpwbyxqEDijOXbMd6yaEpf4gEJeOqlmLA3OxKJ3iuycCkyGqWYg8iie2sccmcWcDgcRYjKoVQxVCqfXi/fUpwp76KgUPaTgfa9JNydKR/VLH+XKIOkCH250VLx8Sb4BKVOBJKYzXg6CuW2PrRs2ZaV4KyUHxEoKtKimgLmojD4LVFMzSLsUiJnGq1EyTNDGvWTSJZT3tSCrPMlSRCPN4Ezde44GDyp7O1epzumx8gha0hzYJ0qFjm5/Koob17ROEhz7vnrFwUWPy9kXUSoVbkrO/Fy8eqXjj1DHON6tbSz8M99c8Tn9oKAqwq2KEybpYWgXW5umhq0RR/+k/cXe1Fo7C+mXhEJ7qpyu7y5taQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(36756003)(83380400001)(6916009)(5660300002)(38100700002)(956004)(2616005)(6486002)(8676002)(186003)(31686004)(6666004)(54906003)(44832011)(508600001)(82960400001)(316002)(86362001)(66556008)(26005)(31696002)(53546011)(2906002)(4326008)(15650500001)(16576012)(66946007)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bldKSU1YWjRzaGlHc1lNMmJHZWY2RENQVWRoc01xVUxrOGxYQ2JqRDd1MTkr?=
 =?utf-8?B?TU0wN2RlN25wNTA3cTNzUWMrWEhwQ0RMSG1kR3llZ0ZFUndoUWpMM1VVUytr?=
 =?utf-8?B?RkIwQmNhTC9nNzhWWjNUU1puUzcrK21GL2xiVFBkNmZLcVFYQkdrU1JzVkVO?=
 =?utf-8?B?YlQ5VGRNS1N2Q0dYdGRCbHVZU1lENlR3UXM5Tk1Ba3hsYWdSR29aVHlJOUYw?=
 =?utf-8?B?cnBEanZmbnZITGRWSU9jNElqa2NmRFVVMFN3MDdDOEZiSTJNcVN3Lzk2TStp?=
 =?utf-8?B?U0Vidm5BY1I5THBxeitLa21BRjZuOUlzVWluaTluOFRqQnVvMjVBVkh4UXNT?=
 =?utf-8?B?OS9vbkhtbzlJRFhabFcrcW1EV2JIV2xLNGhYVDdwQmFaWWc5VUltVHY1cFNW?=
 =?utf-8?B?MlB0ZGhwSEtEMm4rcWl6Z0xZenFZNjhQNXJFcDJ4Y2J4azVrMEFJd1hFUnd2?=
 =?utf-8?B?Tlh6NjJrNzFZTUtTZHVML2lWbXNTYWF5d205dy9IZytjeDNRbSt3enhYcHZs?=
 =?utf-8?B?ZzB1VTVEd21XUGVhR01vaTY3ZWNJTUtPdDJVZk1qZTB2V3NvdGE3SjEwYlkx?=
 =?utf-8?B?Qk9zMXZFVms1NWhtNnBIM1pCWXljVVROV3dhUEFFZk1wM01BS2Z1SE5JUnpu?=
 =?utf-8?B?VXpXV01xVnIwWFRFNFdUbjFkQnVUTWljZmJLQ0FlYk1mMUlFNGgxL05MV25o?=
 =?utf-8?B?Y2VnZUl1MVNaT1dERmlscENTN1M4Z05SbTBvNjg2bG9TdzhpVmhzcTg5U0V3?=
 =?utf-8?B?eVNodzVxdnRUZkp5cUpVbFE5NldBdXBsQ0R1UlluRXFNZ3QxS25CN3FZd1RX?=
 =?utf-8?B?NWFmT0NmTjVjTnpGdmpPUjZlY1ROMG5XVkVvazIvdFJjaUg3eWtKT2xzdlJm?=
 =?utf-8?B?ME9OUXBtS3dKZFRaNlBWM1ErV0hyYUgxbE4rTUxhYVVzaEFrUXBYTHJMSjM1?=
 =?utf-8?B?ald4cC91Qkx4bHQ1YUxvWGlSSmprMmxQM2hwYUZ4aTBxSnhISFVWZURZd1NT?=
 =?utf-8?B?aFo3LytNUTlyaEFYdGdnZXdnTVJrR1p0NWJWMS9XTGZQbnRWRjdqSk5kOENk?=
 =?utf-8?B?eUo2eUcrRGNjaEdXZSsvK1d1L2NNV25BV3NkTkpvY0tzUzNqS0VnMTQ4VVlu?=
 =?utf-8?B?VlQ4eE11QlBrU2FORzQrNHZaU1lJcjYxbHdXbkxWaFQwRFlBelQvYlR0OWpP?=
 =?utf-8?B?SDRaREc3NXJINmRHamJjbnQ3SE5ydUNaTmxpV3FlM3dPaFlrQmM3dktFOXk3?=
 =?utf-8?B?aHYvc1dIajZSaEdsajJmTzU3THpwSVZNTHE2U0E0UjVwSWNUd2FFUTA0c2FG?=
 =?utf-8?B?SlJQczI1MndTNm1MTWQ4U3NEK1NOWXJOaGthN0w4TnZnbVFzdVNTTmdVWm00?=
 =?utf-8?B?NWY4SzNKdWJRTmtnRHVZNXFPR2VVVWlsQ3pwajFSOFJNSFpKVDhLMitLR2E0?=
 =?utf-8?B?ejNFUWVYVzZ4U0lFVkMxMU9zd1NTeW5EN0FuaDVuZDhnYW9Fbm9jSlhWbDQ3?=
 =?utf-8?B?cGhRWFpZMERraHRjcUdJV1Jpckx5Y2tzcVZxMWtjMlJTU29sNUk4dEV6TE1G?=
 =?utf-8?B?MkJITFRlWjlMdml2VG5OcXVGVm5wZWdBNE5qNkJGbTVLMitJczZsUU5pMTZB?=
 =?utf-8?B?dVpUS0JaY3hINWszMkFhK004YkMyL0JoYk4weUZMNEYyN3QrL3FVUjRodEN4?=
 =?utf-8?B?YzAzblVnelZSdlZLVVdMemR4MGc2NE83SEpNdE5SM3c5UFJKdmphakY3SlFZ?=
 =?utf-8?B?eXR4cHpYZmRwMUJzWFdwaDdaWGhZWDhUM3M3SzFQcFY2YXJ2cW52TG1jTjdL?=
 =?utf-8?B?RmJNVWd3TC9ONXhROWg5djVhR3VPVWF6V1U1d0JVeTFQYjE4azV6YTJwV3hu?=
 =?utf-8?B?QTMxVE1VUWhNUEJRbkRwZmRFRXgrZkJOZzBvcU55WXJKWWlVRFFlcjNDQTJQ?=
 =?utf-8?B?bHYya0QrNDA3U2pHcHNXelZqalFnc0VSbnpMUDlyalhJR2J4R09PYXk2ZXB5?=
 =?utf-8?B?S09zeklhZDZVU2xDSHdvcjl0NjRNTUN4dDN3NDFJd29TdFRESE9NS1VoeElE?=
 =?utf-8?B?WmwwKzVZTFYvQkR0NFlULy95WVRkV1ZyWnBiaVhva3Q4VkJiK1QyVTFjTWl6?=
 =?utf-8?B?N0lXblkyVlpvOTlXZklHdVdVK3RnUTZUcjM2TmNpQ2NZZmFYRnVhWU9pM0po?=
 =?utf-8?B?S25PWUVSaDBPUThqLzRrWDkwaWQ3eDBiUXV2UWVOQ091S3N0ZkUweXFLUWd1?=
 =?utf-8?B?U1BjZG90V2dUZE0wZGJLYTFJUlp3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aca63d04-aacd-4172-ed0e-08d9a0543ccc
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 12:03:10.9224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVR9wN79vY29B6VDQWcYKJhP4LBY4EuNaMARBuoj8C/ULEw/eezzEtFuD5Ov980kvXidWxWQQyA4E+tGRv/E4APDYI4YnSBNUHsmhor1jKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3668
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Yu-Hsuan
 Hsu <yuhsuan@chromium.org>
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

On 2021-11-05 12:36 PM, Takashi Iwai wrote:
> On Fri, 05 Nov 2021 12:30:48 +0100,
> Cezary Rojewski wrote:
>>
>> On 2021-11-05 10:09 AM, Takashi Iwai wrote:
>>> The recent fix for DAPM to correct the kctl change notification by the
>>> commit 5af82c81b2c4 ("ASoC: DAPM: Fix missing kctl change
>>> notifications") caused other regressions since it changed the behavior
>>> of snd_soc_dapm_set_pin() that is called from several API functions.
>>> Formerly it returned always 0 for success, but now it returns 0 or 1.
>>>
>>> This patch addresses it, restoring the old behavior of
>>> snd_soc_dapm_set_pin() while keeping the fix in
>>> snd_soc_dapm_put_pin_switch().
>>>
>>> Fixes: 5af82c81b2c4 ("ASoC: DAPM: Fix missing kctl change notifications")
>>> Reported-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>
>> Hello,
>>
>>  From my research I've found very few places which actually check the
>> returned value of functions mentioned by you. And thus we could use
>> this opportunity to adjust the kcontrol-put behavior according to
>> documentation for all users without adding any additional functions
>> which are part of this patch.
>>
>> Board:
>> sound/soc/intel/boards/kbl_da7219_max98927.c
>>
>> seems to be the offending user. We could update its code instead,
>> leaving ASoC unchanged. What do you think?
> 
> Well, if we're going to that direction, we have to update the
> documentation and properly mention about the positive return value.
> So the changes in ASoC core would be needed nevertheless.
> 
> I find it good to keep the old existing behavior; those API functions
> are only for enabling/disabling, so returning 0 or a negative error is
> more natural than tri-state, less complex for callers.

Hmm, indeed ASoC API doc would need an update, ASoC DAPM api != kcontrol 
api after all.
My impression of original patch was the desire to align the behaviour of 
snd_soc_dapm_enable/disable_pin() and similar functions with 
kcontrol-put equivalents - in terms of the returned value. Perhaps 
that's not the case.

While it's preferred the keep the existing behaviour, if we were to 
align DAPM functions with kcontrol-put ones, fact that vast majority of 
users ignore the returned value, helps us out.


Regards,
Czarek
