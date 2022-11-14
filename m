Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B2D628209
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 15:09:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77ADF161F;
	Mon, 14 Nov 2022 15:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77ADF161F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668434971;
	bh=BwgA2R9VsXy31sC6ElrAP/i3pKrqrcyOSjdyQRAzxU4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOSq2Y+bQYymvtS+ztCIjXmWZs6zlOppVh2O3WSI2YsSTsGTde/1eyYioMXV4FwZ4
	 mIhNAF5m9V5gh+N4Q8DBcfFOn4Q3bi138KMMXnom0GH1nVqNhyW+Vdil8s9gGN4pt7
	 p0BxwqjBGzsQA1rfovCHHQoUsTNfMQaQDhPvu8TM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 194C0F800AA;
	Mon, 14 Nov 2022 15:08:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22ED7F800AA; Mon, 14 Nov 2022 15:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14640F800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 15:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14640F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nEE5JmLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668434912; x=1699970912;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BwgA2R9VsXy31sC6ElrAP/i3pKrqrcyOSjdyQRAzxU4=;
 b=nEE5JmLePrtx5cWiw33Lzu+94TyM8VA2ayTBlXrAsiaoxYp9QyRe7Rxt
 93QPnrjOfC984CViHkBd+Fc6e1noghrOJiD3ceqClijymUToNcoDLrclv
 pjwJJcvrUjT4w5BLFy7XautoQEGR8rxLWHMhddszcNbsk7vDCYrL0cdyJ
 qOLeWS1Bq6e7rCiwdb+MACq4vGwXCzYJMF9EcdZdoTFb98U2/nU/Cbx47
 6JyfY1ekojCUPv7jX93Pr3h4VEtipqCHoiQI7R1WJgNd384nxVbJb2W+J
 WvwPwS9SiEIDVC08sq90RaMu6q0mRw3ucEeWQ8zoNBr2uwxIMG3M8rKTj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="313121457"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="313121457"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 06:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="727536982"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="727536982"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2022 06:08:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 06:08:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 06:08:24 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 06:08:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzagm8VxRQ4CmLNlMnyEokDD78wbiK9IyUBw7qwsMoya4fjN17BhtcibtSjADE03c+pM7ZP3udxSXrqAwBCLLuCjVKeUScK0Ynx4qn2udlwtTKThCFGdcXlZTsQuR1m1ac26qIJEhlPdms/WCGqqUr3ZG/pV703sSanUE9fANDA06nkJV80KAs0ZPCZttuieiBq2Gx9SMyWpPKPjyAxbAWird7RoiBigRku8Qy9gn36UhAhhIOH0thKZrtfRR0viW0iE2u+u+mVB0kZjGfu0qnyqy9RWZhnvY3nyw4dpJN3HlVbmLhvmNPspuMDRQLnnplD+RRK4X9QSob0g1VEHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1HuJr0FNFSzWQqjXHXZyY3hzu61Qfr7YCXQEjPq4w4=;
 b=gk0qjRQ5dICDxtRx39JP6iG34BD5xwRMF51qO+mxxHOfevYI5QxAlfyJrAqIrp76gfar4swk3EpWN3midpac1oCWHH6hm2clwD8DUNVkXvLgn8rEgB+yKVZLOBQcbotuH+lVyYVZBRcyVCw6LKIXa29Yp/yP7b8L3HXdcMU+xo+pfLgROYMrRbNzA+Lf7x+XvLD1U7h3y/MrqXLNgJBV28MCLdPIdslaoYwfks8ePnuAuoK87NaBoN42ju02VqmvYlBkqAtvYy6zhrQJRjDqxi+NajYojzGAzxec5DXGQlerNr9Gkkhn/b0JmI6H0H+mjKRGDj6eRv6h4ymVq3hfjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.13; Mon, 14 Nov 2022 14:08:22 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:08:22 +0000
Message-ID: <f6eb116b-e7a4-c95c-0fdc-01ffaa246bf5@intel.com>
Date: Mon, 14 Nov 2022 15:08:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] ASoC: Intel: avs: Disconnect substream if suspend
 or resume fails
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20221114113729.1022905-1-cezary.rojewski@intel.com>
 <20221114113729.1022905-3-cezary.rojewski@intel.com>
 <877czx4rkj.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <877czx4rkj.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: c8689fbc-5daf-4716-8dbc-08dac649b099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1KAnhWL0+N32bL8VI/Q+JjuQOMFFbdGCZgQWIrgBovxgLFyeqdNfybOlsLdI9v8KXmjnYlsJFPM9Q36VW8rXYUkq/8/dXz3UbN0RhFolA+fX65tZ4asBRfQyQCoOHT36jewuoI9JbTkC3l7Wsyyyq6l801LOgWOg4zzPNZRBlo6oHS9FfFYs8jpVBk+hdmS+hurb9rPecgI667iZ1WaEZtYJHsC6wMtMrPps45QKkTs2cek112ou+swIQQ5ekYAyyS1M30elc2dR+l5CbOB8FaxNMz7M99tMBZ17teRbEEaxgaqjFwk4oqnTAiCEoGzJcjN85PXEGSxg2oALNQdU+RYqezsXWgwgEMLKFq+PlNuZMiDLNdE55in+QH33q+2/ApF7Oc32YFv/V2AwpjK3RHEDdElbfypVu+Yv5fpaS2IWy5XB6CGabZ7GSYMRhyo5cKF+odaXhb5DKPneuRGN+BmbyZwkWslFgFlEJ7v2cTBYft3YcE6JhRYceVXuOR04TZMiizYbQf/nkX69n2kp1ND7yrlQifX+dtHftLp/x6qix9Y+Rfh0/EayfYoK9ssIVoD6MBh/lz5rpnDyant9rA323XdzLSMu4Lf5afs7LK07y+iAYN6hYSmDVmWqRpseZjlhG0rItVQ8BhdsrVGBLuq+COFoVmuE0lEhM9lYU5wyzE69+Pas40If2eHX3ncyFkItdM64fklg5JSlxWQVu7eXykTUN34xEVxUguTn7olM/J5C68a3O/19ynC8QH8Ol3zDATtW7sQUUWUoBsNWTDJoq9aK4gPgcG79yKuegMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(86362001)(2616005)(31696002)(82960400001)(478600001)(38100700002)(6666004)(5660300002)(8676002)(6916009)(316002)(66556008)(4326008)(66946007)(66476007)(8936002)(41300700001)(26005)(44832011)(4001150100001)(2906002)(15650500001)(83380400001)(6512007)(6506007)(186003)(53546011)(6486002)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9ZMUZyVExnVXFGZFowZk1Fb3Uwd1QvN1VYSzVwRnVFMDNkODZ1clRYMVpv?=
 =?utf-8?B?dHRsWkRJK0NPSGtpWk5sSnEzMmdrc1VBU1lFRDdCbUdRRlE1ZFVicnhwUTlI?=
 =?utf-8?B?N05qSjZZT29ZM0FmOHBJL21OMXBUM1Ixbi9XeXNVTXRWYndSMEhwemdxL0Ex?=
 =?utf-8?B?VXdsTjlxZ0ptb29TblY0TFQ2QzNtRysvR0xCYmV4elVMWW9CRmVmcHhoZVA4?=
 =?utf-8?B?a3lsdlNXYnpmQjNGZnYvdFJnZWN5bTlabGJNckoxSFNDQ0hqbXlFUTVWd21W?=
 =?utf-8?B?TkQ1T0VJREVEQzNPWGdpbUJHaDVCU00xYmVmbmdlSk1PcWxuYzFNQkFLbWlW?=
 =?utf-8?B?Y3JhYXR4QTNuMlZvRU51dEE4RDJPd0xWVGt6S3N4dVZkc1kxVzJ2WGkybGUr?=
 =?utf-8?B?angrK2x5NDF5eGZtSjdoUWU0SGw3TGdURFVGeVFwUWdkV0J1U3RpOEFwdVFx?=
 =?utf-8?B?ZnJtRDdRaE1ZZ1VGNzR4ZEc0OFd3OW9hMFg1Z292YkJYZkkzRnBBbllpSG1r?=
 =?utf-8?B?SmVCdDRoZVdKRXlnWGFDU2NLbGxDZDhsYUZKWU5QUXJWcVFhWG14NlNtNnNZ?=
 =?utf-8?B?WUcrdzRnYjhUQWZWWE5zbWxWbXpZT1ovS0UwSWJNdGpoczRVQXJ4bjJrcGUz?=
 =?utf-8?B?TSt0aG9ZbUdicW5FR3ZPVmlOSjdlMWlhZWlBT3BvaXZoOGZXSmhVZDVLUVMr?=
 =?utf-8?B?VExkTnN1L21Eblk0NWp3SWxDSFg2Zjk2dnBWOUpCZW04R0Z1VGJKUXIxbWpn?=
 =?utf-8?B?V3hxODBZcStHdzFKQkgzcG9nR2pBNjVXNmMwaXFrZzdLNTZ4dGtlQkU4MGFo?=
 =?utf-8?B?RmMzT1E2Ujl1bm9hT3JqTHlLS0lpd1poSVdXUmtuMkVPL2FNNHZ2eEZjQ2ln?=
 =?utf-8?B?NTdIdFFRVGlkQWRYTzd4WlFUZUdvSmVXUC8zcmVnWE5oUVhSc2M0dVhQUnI1?=
 =?utf-8?B?Mm4rYlN3OE9RRGdWN0V6cWpPemFWMytzVk9TazlkSnhFZUJKdUE1U3VQSTNv?=
 =?utf-8?B?WXd6bHcyZVlJM1RUMzFKTEw1citJbjZEN1p1TjZISC9tWk9GZDFCVFJwc2hG?=
 =?utf-8?B?YmpFZDRzQm5zQytTb3huNHh4cFdqMS9nNXgwNjc0aHRkNjJLRjBXcXNudVU5?=
 =?utf-8?B?R3ROWlpHcU5ZcEYrU2dndlFaMmFkUE5ZajVGMDgrSTQ5U1FISmd6eWF6ZTBq?=
 =?utf-8?B?QUo1cGMyRVE3TGFZTmd4TkNqV2JwcE9BYStwMkh3Y2YySzlYaEUvZENJM3Nu?=
 =?utf-8?B?aG11b1lNY29TZlVLSHRQbUFQQmU4NFRXek9GWGpjdVZERHY5WFFaWW5qNEVU?=
 =?utf-8?B?RlJFbER5cjM1VVMvZDQ1VkFRdEFYS1ZnclRRWURkWkowc0xtaEM0RE9HaStP?=
 =?utf-8?B?OEwrMFlNQ2FmT0ZpTFFBdWNXV1FuZjFUaHdjTWFWbTZLUlM0bS9tUmdQeTJv?=
 =?utf-8?B?MGRKRmcwUHFFL3ZvaXNLaDJJQWNYMi96QkdYTXdIZFAwc0VydXBuWnB1dzlY?=
 =?utf-8?B?OGhHd3pOYmFhZzd2OTFvL0xnNllvV1ovbWdZN3BRM21rR3dKMkEzREpNbEUr?=
 =?utf-8?B?Z0YyT21uaWczY3NJWWJObVdodWZGaUE3OWZNbTk2ODhoRk1nSmh4KzV3bUxX?=
 =?utf-8?B?ZEFlY0NkNi9GQVQ0eHg3TnUvVnpuWlhPNk5CbDYrYnBveDFPL1VKbzZTNWdK?=
 =?utf-8?B?QXFxd1NGamx1MDRaSWJBNmdPL29uZEtPSStDdTM4Um1mVVFPaG9Cd1JSNDRh?=
 =?utf-8?B?Z3JaZ3JmK0V6bjg1OVJXS0V1bUJnaWh6M09mRDREV2tpaUFmdFV0SXdWTGx2?=
 =?utf-8?B?bGVPL3NZL3pXVnE3TmI0V2tWWHFVeFRqMGJmb2VFd0hFRHkyeGhvY1NrVmI2?=
 =?utf-8?B?R2xoRjcrOEZOZjNjbW04NTVNQWlnN3BTc1plUnlFUURrNHJTYzZwc0FMNytQ?=
 =?utf-8?B?ZG5OdnB5UE5tQjZ5OVRwVGpMamdBYkRsc1JlRzRMcVNTeGh1NHRHcTdiV1hr?=
 =?utf-8?B?SFlvVWVHQ1VuaFNsbm5QY1M3S0NlTy9oYXh6VWxuUlpDSmdUcEZFU2ZlRlg2?=
 =?utf-8?B?cW5iN0ZKQnF0V2JHK2M4eEI0dStUOFVUTWlXdGlad3k3SjhBZkF4UEpvcUtl?=
 =?utf-8?B?R3VybGZyM2V1MklVYmw2RWN6WnpMTE9SekUxVmoxZE83TXplNFJuQzhWTVRI?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c8689fbc-5daf-4716-8dbc-08dac649b099
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 14:08:22.5674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxmh8yvAzixp2lX4P9M6DSaXaaPudvO3eWVb1GYXnSDaU5SaZHSwu23zwKVOn7ZjZSechwLczuCJ3NzJH6a7GTj4NQJx0w4uhjgRk443PZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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



On 2022-11-14 2:02 PM, Takashi Iwai wrote:
> On Mon, 14 Nov 2022 12:37:29 +0100,
> Cezary Rojewski wrote:
>>
>> To improve performance and overall system stability, suspend/resume
>> operations for ASoC cards always return success status and defer the
>> actual work.
>>
>> Because of that, if a substream fails to resume, userspace may still
>> attempt to invoke commands on it as from their perspective the operation
>> completed successfully. Set substream's state to DISCONNECTED to ensure
>> no further commands are attempted.

...

> Hm, that might work, but note that, once when the stream is set with
> the disconnected state, it won't be taken back to the normal state any
> longer on most sound backends.  That is, it'll be gone and won't
> revive unless you completely unload and reload the whole stuff.  If
> that's the intended behavior, that's fine, of course.  So just to make
> sure.

Good point.

Our intention: if we fail e.g.: on resume, we would like the framework 
to invoke ->hw_free() and close us. Right now, if we pretend that 
everything is okay, invalid actions can be performed on our streams. 
This all comes down to userspace calling "just" snd_pcm_resume(). If we 
had an option to opt-in to a _hw_params() + _prepare() + _resume() path, 
then things would look differently.
