Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92457BB3C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 18:19:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E5E51756;
	Wed, 20 Jul 2022 18:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E5E51756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658333988;
	bh=EioCb+CAD67Um65FD99E1IE061aaBuOCBkwN8po+IR4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3KDXzmLG5FKWdNY6uZJZ4TtxMM3ZY6FjafmMe/Rza/nEsnl3npFxxIS7Wg8Dct0D
	 9xIhUIWhDux1IaJWOSUn84VED9o5qwU638SiL7/Oh5+dvyQ62/hWljrLY1/MSWcGhB
	 ZqMXi0+xjK0Df1CV2iX7minYgKaX/uCtecj/2+R8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC379F8025D;
	Wed, 20 Jul 2022 18:18:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C85DF80169; Wed, 20 Jul 2022 18:18:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAAEDF80118
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 18:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAAEDF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zz4H+Jem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658333923; x=1689869923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EioCb+CAD67Um65FD99E1IE061aaBuOCBkwN8po+IR4=;
 b=Zz4H+JemJsgYZImucNaph1e3zBxsd0ZoH/9nVTiwQX8JjVLe14/yK1oP
 oWoHE9lNGrzxq730EAY7QLOysdzE793T0mJu0/adi3UXXOY4JhQ+wEL8s
 Pw4bIS1mIS4NqtIQiBqd6DtXZYzV17E1nTXhPNOkPcN0w0eqLbRlYyb1M
 3IcWG48mJxj4joseU9TVvAe6oWM2pxvOYiQw3saDdKzttXXoyEVuDobW4
 AnO4akVRul6rTlkOt2Ag17bjr/nDuw9cF2d19TQJhPyRHztAdA8WPo37Y
 PP2HJV1GH3N0LHmPf3OMVsOJm29Hi0WdJBjeqschM0idocrvxOrsp4epA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="348515932"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="348515932"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 09:18:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="630828334"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga001.jf.intel.com with ESMTP; 20 Jul 2022 09:18:24 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 09:18:24 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 09:18:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 20 Jul 2022 09:18:23 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Jul 2022 09:18:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TB8KdbUewTKY5RvtOmf9Vd9Jj6U4AfI18+4tZgynaqd5FNGwinH677GLapkCrJDKFdgdEGAaQ8iRZ996vnTHzkVnrAkB9kVbR7Rpy1W/YuDtWpaUkEkZmwDO/W4iHwNIXuFFp1+H0Qz6l15OAB74TuhtbFGa3WuqREsrIQYlJzgNaQ0RBusN9EPfcZEdiJEFPKZG9fap8ysUwK179hu1MzGSY7ImE7r/2MGmpPfXEfXc6o6b8jc9g0h/Ir1zH/+yLLsyvG73pCAQQjIItc6XpCVYlxo57aBTs6voWkIV2gtV8z21SQAuK8NZkoqeanxT/bk8KetT4v7l336Pl69YRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fyr6ZEKgl1yrxnHdG4VbnNRpZLdvnSHRfCyX87r9I4=;
 b=l0VI7aSzetWz80wCeRkbKFVIr6SlcjvPah4JvhTmZm+oOMCDCK0BkPMWxmnD3B/83od0RBstWAP3K4D1yfSLkEkZVc79HNWdCo/IxWj3tw3hguVyY/hqxDN5G/X0RSgkfK5CMnDLO8ujYqc7pd8xa5h2bu7JjzWlLqkHlEJdgpJqW05i5YQwkMycjjS0i+Z/+RK9MZQ1jqlAVJgj7j7JRSf+P+j68vpQYi/V4nmlF6XP656wwWhsYDD9ekPleMZZkDkWbG5FJ+odHvB4Ix/KdSJNImJKEzMSZDQqVBzFweJHmnQ5wL1JrBG+dw5HwvIaO9LjAsbjsG6MWRawvqcf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY4PR11MB1912.namprd11.prod.outlook.com (2603:10b6:903:127::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Wed, 20 Jul
 2022 16:18:21 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%6]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 16:18:21 +0000
Message-ID: <f822a128-4e9d-3961-a51b-8126d4f06a70@intel.com>
Date: Wed, 20 Jul 2022 18:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] ALSA: hda: Make snd_hda_codec_device_init() the only
 codec constructor
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai
 <tiwai@suse.de>
References: <20220720130622.146973-1-cezary.rojewski@intel.com>
 <20220720130622.146973-3-cezary.rojewski@intel.com>
 <875yjs53l6.wl-tiwai@suse.de>
 <8ff14178-7e81-68ff-71fa-7a31adef5cd5@intel.com>
 <3c3a453a-a9be-94f9-c7a0-4936fba5182d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3c3a453a-a9be-94f9-c7a0-4936fba5182d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0068.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 949e3436-13fa-41a6-a0b4-08da6a6b76d7
X-MS-TrafficTypeDiagnostic: CY4PR11MB1912:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ONg2b7kCKZOuN9gSPggZKSAd1xaDcsSsgfp/Gn+7fXFjqbMfHCj56kw9nxb1bcJpiC3KASw/Efte6YB1tCno1xfzNzaxVTAW6/Y6ktMm7SVMpP/1z5NDCOJWC9/bB3qVPoxvQ6PUcY1Rgli/g6tyFCAazbW71vY2jb3T2YQJSbUhjPLO9rTH2WMBDj9X8508y6HB5wMi+9HVRWmd1iKR05g7gbmfsAe5SQpxDsPfh1XMooi2SsF7xbQRPWmsAe0T/lVNuF5sgK3MUc/sylq0OopjLRPFtHjbdJJ/6HGjaktWZU+b6Liz5hXNmmtDIESJc0Rjq3R9clGDY3rt07I92uWhYDLfkxA8SRwykS9PmRpk9TXbqrFW8W+N9whsfFbw1zxcckUaoITclQ/NveqEb/y3vXtFyjP9u8MNP4jNGV7FrY3Fw7x0RdWWDHIFWA1wQLoPfrk3dL8UcP+ItVTcJFzXaFMTjCNTyhKTS9hrst8iYc23iHNPBXBFO6RcjMSr6SepgRVX42PYKoCuJHtJGs3juTa+tk3nydrz8sy2CJYxzSK8hKhawfC89rERl6L5YGzTpV4nPmCPyJEvB+njNwfONCzSX0WoQDB4jmU29VzSd2KSDJaXCqQ83OPHzAW5rdnsxWCIzBvaFciOz+ZLVVmjsmHJHfIRCNp6ABBsq+qBQdkDyXiiHKQp5/+4waJu9jmT2IjniLVV1u6e7Zm4N4lkDlN/S6AzO2pFRD5NEL1x0xT7LNQGpQr345asxHZJusuZEfKKu9rEsQaVp8WU8A5LjJix5+aspcFgfayGyVjZwrl6lAj36XbetQdtI99R1lOgywy747jl4nWb9TEdUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(136003)(396003)(346002)(376002)(6666004)(316002)(6512007)(41300700001)(110136005)(31686004)(6486002)(36756003)(2906002)(6506007)(83380400001)(38100700002)(86362001)(53546011)(186003)(26005)(82960400001)(7416002)(66946007)(8676002)(4326008)(478600001)(66476007)(2616005)(8936002)(31696002)(44832011)(66556008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHhkUkR2ek5BME1OVmNacDI3aGtQbXZuck9TaU5vaEJIdjdneVRuNDhCZjVp?=
 =?utf-8?B?WDZVTlpJM0lDOE5DbkpQOVpjTnlJQmNoTUdIMCt2TWc2ei90MnlUL1dvc0lV?=
 =?utf-8?B?Z1ZKeTBRWWhHamU0bk9pdGZnRGg3VU9VS1lqMUdQM3ZzQWtHcHY0OHdXNTc0?=
 =?utf-8?B?Wlp6V2Uxcmw5VkFjWWFkTjAzUEFhSlhsaWJlaVBtV1RaN3pSUDNjK0tvZ2o2?=
 =?utf-8?B?VStxVE15aGdMTUsxT3YvYk9TWHR5dllnbGxZWUphcUtiVXVibWI0QWpjOXdW?=
 =?utf-8?B?ZUJhcUhFcTFkd0xjQ1JDSkMwRXJ0Qkw5WGFMZ1UzVjlyWUpiMFlVS3FzWXpS?=
 =?utf-8?B?VVdpUlFoYW5OQ21XQ3I1Y29ZM0EvSDE4eFA0TUJXeHlPeHd6VkpQM0ZzZG5S?=
 =?utf-8?B?MGtFVmEyTnV5Z0NBdmNONVNkL0d2SXJPcVVGbmhpRkMxRGpZdzZFYmxGeDJ0?=
 =?utf-8?B?YnZhRm8wUU96YzU3aENPZk5IdnkwY1RhTzVrZVZVQi9aSzhLTXppeTVBSkdQ?=
 =?utf-8?B?UjhDRzBiUVIwNEdkU1p4bTgzbS9paVE4dHRxQTQrdHBYdFVHWklGUmJCbWdi?=
 =?utf-8?B?cTZBYnE5OVBXT29NME9YSlZZMnk0RXAzRS9peHR6TjVWd0VydXBUTTJOOFF4?=
 =?utf-8?B?RFhqSUdhZ3A3VSt6ZEhuOEVVaUw5bHFzSUZYdXE3L2lFcDdmSnlieStZbk9C?=
 =?utf-8?B?RGk4Nks3b2k0UGJHTmhSVEVyL2FIZHREaEp3cTBnbkk4VTRYZFVyVThJbVJm?=
 =?utf-8?B?Mkc5RnJaYTdwcmY2bGlnMklLTnpYZkN2eTZDVlRHU0R4amYxN3IwSkdXYVV4?=
 =?utf-8?B?amRPcXRJdHJoK1pnWUlHa1h5eG9MVGhzY0E5UEN2anBNdCt2aFU1M1NwL2Zj?=
 =?utf-8?B?MzZEMWp6ekNlWE0vUjIzMVFtV1BvRE50OHc3UE84SlBHempMUlJVQkNNOU93?=
 =?utf-8?B?REw2Yk5udktobTlDZERrUzRwbTdocDZBYjN3WGxOejlHZTNsWnN6UDB3ai9H?=
 =?utf-8?B?R0V3cmdQbGZsMG9CSUc3ZEtuTk54c1dIc20razdHaUNLdUxRMW5FVGhCVUdB?=
 =?utf-8?B?ZHVqUDBkVTN1UGc4azVkT2hxSEV1SytzcFVxaXhINHZWaXM0T0hyS3hoZ2xC?=
 =?utf-8?B?dlpLOGFKUXhMbnpGMW9wN1VHTjFTZjFsd1BXclp1RTRNZllud1lTbnQrdEJB?=
 =?utf-8?B?S1g3K1haUHRWclFVVkQ1Y0x0SDBURHZ1RmE3YUM0QkN5MmM3TlcxekUzbXl2?=
 =?utf-8?B?SzVwM0wyYVVZT05Hak9GRk93My94ejNCNG50ZlFjY2YybFRzSk9Eb0U0aXRR?=
 =?utf-8?B?YTlyaXYxaU5WcE1aTmFCbXZNSG5ncjZFQlh1cWRuYWNHbzVnclV4Rk5QMDlO?=
 =?utf-8?B?cWRjVDgzOU9ka2M4TXNFQzJUcmd1bjhJL3ZsbVBOR3VHRGx6dWY3b1FjQ2Iy?=
 =?utf-8?B?R2k0dEVkVEl0TEtPVkhXcS8vakoxR0VCNXFHOFBDYVg5NzVrS3NZNnVjQ0Ji?=
 =?utf-8?B?NSt4VWNnclRqdjlzWFNhazFiNlJkK0VEdTY4M1NpNlJUdndXMkhWSHg1dG5o?=
 =?utf-8?B?UUR5M1JQNHpCamh2ajRFUHJzS3ZCdkR2eHFrN0hqQzVCVzl4a0plclQvM0w3?=
 =?utf-8?B?dC9SOTYzVUNBV2Vub05ReXpuUUd6V3gvUDJRRGlXeXJCQXkvNVJkNE40bldo?=
 =?utf-8?B?VUFkcUs1RXJXMXUyS25ycHZzUXNFb0FONklOSlB4Q05pUzFVeWRIdnN0S3dh?=
 =?utf-8?B?UWZ3V3gyVmRzZWMwalZtUjMrRERiY3h3TW5oVDBsVzBmNTBZQ1drM2RsUUFS?=
 =?utf-8?B?MDhzcDJpalFzS2pSSHNUWllqOHQyVGlOQjhOa1VQVXpmZmJ6TXU5OVZkazRn?=
 =?utf-8?B?Mzc5WlBwTko2UThvRysxRTlIRDVKTTBXYU9GbUxldnhBS01RRXpXTWV5dEJs?=
 =?utf-8?B?RFJJd3VnN1g1ZnVvWU5WcG55RFdXaStod0JpbXZhdlRHSXpaOXZ3c2I4Ti8x?=
 =?utf-8?B?cWF0aFJiR21aMEVUT3RKWFNuZWZlUEhheityTng2ZEhhU3RNMWZzQmltSUVv?=
 =?utf-8?B?SlBuS3F5N0NIeFNubGhGZld3Q0xHcnBpdnQzaDQ2WXREdDlQckk1L2kzdmdP?=
 =?utf-8?B?dlhxa2NzK3Z6aVdEN1E1L2YzZWc4aml4MXRLeDNjQnJTR1NwOC9UYXZTWHNy?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 949e3436-13fa-41a6-a0b4-08da6a6b76d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 16:18:21.5484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZIKEbaLXJieiT+3Wwhm4wc26ypk7Gz4kLQ7MAOH/2Wu/VemJq2+hMRQtBaiaXLPIjZr+ofwxXoiDK9+PGoAAjrSLPXzDGJiqcFm0/YheMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1912
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, peter.ujfalusi@linux.intel.com
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

On 2022-07-20 6:00 PM, Pierre-Louis Bossart wrote:
> On 7/20/22 10:39, Cezary Rojewski wrote:
>> On 2022-07-20 3:13 PM, Takashi Iwai wrote:
>>> On Wed, 20 Jul 2022 15:06:20 +0200,
>>> Cezary Rojewski wrote:
>>>>
>>>> Refactor snd_hdac_ext_bus_device_init() so that it makes use of
>>>> snd_hda_codec_device_init() to create and initialize new codec device.
>>>> Causes the latter to become the sole codec device constructor.
>>>>
>>>> Users of the refactored function are updated accordingly and now also
>>>> take responsibility for assigning driver's private data as that task is
>>>> no longer performed by hdac_hda_dev_probe().
>>>
>>> Hrm, this doesn't look really right.  It means you'll introduce a hard
>>> dependency chain in a reverse order: snd-hda-ext-core ->
>>> snd-hda-codec.
>>>
>>> Originally, the ext bus code was written completely independent from
>>> the legacy HD-audio implementations, and hdac-hda driver was a kind of
>>> wrapper / bridge for the legacy codec over the ext bus.  If we want
>>> change this rule and make the legacy HD-audio codec always tied with
>>> the ext bus, a likely better way would be to call
>>> snd_hda_codec_device_init() in the caller's side (e.g. skl or sof),
>>> then pass the newly created codec object to
>>> snd_hdac_ext_bus_device_init() for further initialization.
>>
>>
>> Agree. That or drop the snd_hdac_ext_bus_device_init() entirely. Will
>> send an update soon.
>>
>> In regard to the other subject, my plan:
>> - separate code used by both ALSA/ASoC into sound/hda (this includes
>> many hda_codec functions)
>> - combine hda_bus and hdac_bus
>> - combine hda_codec and hdac_device
>> - drop HDA_DEV_ASOC
>> - drop hdac_hda/hdac_hdmi (once skylake-driver is gone; sof will be
>> updated accordingly)
> 
> the skylake driver cannot be removed until you have evidence that users
> have switched, and SOF has other priorities that will likely conflict
> with that goal. I don't even know what this 'drop hdac_hda' idea means
> in detail, we need to keep an ASoC-based codec and the split between
> platform/codec/machine. We are not going to move the HDaudio codec
> management logic inside the SOF driver if that was the intent. The SOF
> driver will focus on host/controller/DSP handling.


The evidence will be there : )
Also, there is nothing stopping us from adjusting skylake-driver however 
we see fit along the road. sound/soc/codecs/hda.c is a clear winner here.

And SOF is just breaking compatibility in several places due to IPC4 and 
stuff, no? There is no reason not to update sof along the road too - so 
it makes use of the aforementioned codec driver.

>> <story does not end here>
> 
> I strongly recommend that we add no dependencies between hdac_ext and
> hda_codec. To be clearer, we don't want to limit the hdac_ext bus and
> stream management to platforms with HDaudio codecs.

Yeah, we all agree here - snd_hdac_ext_bus_device_init() will be 
removed. snd_hda_codec_device_init() + registration will be used 
directly instead.
