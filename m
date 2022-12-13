Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7EE64B587
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 13:57:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE80C18B6;
	Tue, 13 Dec 2022 13:56:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE80C18B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670936226;
	bh=1xU0guRzuQUmRtTNmS33J9uT9O9/Qe+jJFkOOH/LS7E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KFae+3RhMp+sBonnnQ9iwFqhIfbNKrXRmBHa5KjzrmBkEk0NIqYy0Yeffszm+V/d/
	 xiKzwRDnOaJPRqJhQ9qCp8Y+mfngvEzeAPtoZZPMk+l1oRnNt9JK2WL5j2IJS9EE+2
	 oS5hj3K7LxYp9tcX/4mt/59khf8tbmX/MNavh3S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CD4FF80141;
	Tue, 13 Dec 2022 13:56:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A417F80073; Tue, 13 Dec 2022 13:56:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E15B6F80073
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 13:56:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E15B6F80073
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lul275jU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670936164; x=1702472164;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1xU0guRzuQUmRtTNmS33J9uT9O9/Qe+jJFkOOH/LS7E=;
 b=lul275jUNofh6oDFkjcKjpAXTaUr4Wryktu3H00otryQmDKW1KeG9Jb3
 c7MLLHag44DMAz7O/M9ZC98iErDWyGVa+bu/AJX6WXwdJxxUuipD6rTT/
 vDcHvl63K5QrVDU26wFHJCxilxy879sNfZcR/tEQB5tAlLZ2YFBlpvZ99
 KPJQ7VTvXrSMA5DJobidmipKG8r3FbLyvfl9+HMEq52fuHdQYSoQV/EFU
 KJNUXU54hkMEzWrBlvhb4VNXSJxVAPXHyhLIdWMQvJkaY9TnjI4wTJ7S6
 hacleLzoVR0Q9uj2BqAQBmaPZNQC3yR/e8LQs7f60xX0+TeVDnlD5sGjr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="318151777"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="318151777"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 04:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="712050700"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; d="scan'208";a="712050700"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2022 04:55:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 13 Dec 2022 04:55:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 13 Dec 2022 04:55:57 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 13 Dec 2022 04:55:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0LuczZ+Vt83M9IS/x1Qx9+geBtuJvNOV6N+QQe5Fo1Ffw4ErzhAwqS0lueieCgIaXTFlccVfYyKadQJSrrdOwwihnluu6hAT/reyjsLyA28EfP874dnR3C3l/uthIWf3paj9d0YxtQBIl/DUn6Nn9sDFxrfgaJyE0avYYI9CcDa3lkkP7xbJFpbMaO4JSJv9SB1Od579DTWrV5hoFI3iTIsoPhzV1gJy0GsN+ZvfGIYWjaEl3UYFGiCkq+zDBO6OMp3cHq9s04oXGd49uYfR+JBh5JqbDw+sNxA776mItqYJuznYoJBWTgfypmfzUOzPRxEfLHMaY4UKijf68+0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KudcxEOYqsvjdZudmtI/fWKZEL1qIFrMD6WIvUwYgdc=;
 b=gmHQl2aPyOIoCDXpmNB2phkKUU+ebxNwnIy25byyTMEG6QZuA/EIXms1RRqfo63+zKUjphEYqR2Ihtxa31h+xsdNVbs/S2SYBK+6eHFBu4bvoh4iwyG3Vi8taQu3AhZIVh4onKuodbb0JgD/M0piL+A6YiEZIEt1/HAeCtCdi62uND1SlmVIWEaBtVePJCE/55O8RhSxauRQ4d4L1tjFlsEiXbwsROtPkg0gRVHkgDwdj4KH6Zb8jGrIqTOQEdTva5gFj2hi0vjU5RIdWiWDXi04nKIQB2PDD1Ho3FCAVl9Yon+1fGrCbXO095RNek6PQo4YUy9IpM04n4MWg1BTZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB6882.namprd11.prod.outlook.com (2603:10b6:510:201::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 12:55:55 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::e704:6db3:620:b94]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::e704:6db3:620:b94%6]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 12:55:55 +0000
Message-ID: <c490d006-20f2-bf47-fe4e-61d9ba29b6a7@intel.com>
Date: Tue, 13 Dec 2022 13:55:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: rt5670: Remove unbalanced pm_runtime_put()
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
References: <20221213123319.11285-1-hdegoede@redhat.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221213123319.11285-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0654.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a680cb-9c2b-41d1-3054-08dadd095f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d3/Ilt5+sDCNK50HiF3DwFITpk+Wz9hHsEUVqECn1cjWNupOyq/AagzKLCHi1pmw7MAILv3zj7JsbX5MJchSC/WDG9c4XpJf2Voq2sY8k69Y9c+wV8QG9wzsfX+ckCzq8NwCFz/+b+zoLyrFSPUBX99Y0244noAt5JL23Uzj2eIJlrJxUjQTAFWzXcikO8g3WT5wkRntYBgwvhHqq5IK0+E+w/gscJUC9jYe4ni+vOYWfkBex/klV5aFEaGNF+bKt+wsi9RUwd4IqXYO2Pfnx+gS1tWQwWzjqvz3ZrVEUfVLa6ksil3TmxIuOZwNdY4OhpgE5zfgv+iVFXwVocnY2Gep2gxj/0uY9ynwmQDNVU+u+chUU975kpQgKQfGZ/S9f6pwPs1m6gX0Qm7qnFPG7BBt7UN6WuTKeTFc/XLjIou6kNRJ24LUxckhwFRGW5q9AEgN75yFGVlPPZplXtcFbH9lt7Zl4VX2wk1qj7jrk965mnQD8clYNZxoXe4QjucbeB4y+vfVneFMgHhALL6jTa+7bkcoQpZiQOGgzzxaCsn34ZEeapqS7YdkBR3angt6znbqY++NOB1maAYQiIu6/FVkghEsWZz+f2bP8YA6Xyd93SWqdXg7yihu6rrc4/9W6+aCQqiXCFNdTFMoL6X+JvvD8n5PWTAR7S8MHfC6R0svo5Ph1qmFSyT0OevDwG0K9tnfbPsrE17eHYJRR+VhunTTp0BGGydeR/lA1Bgugjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199015)(36756003)(8936002)(6666004)(6486002)(31696002)(478600001)(82960400001)(38100700002)(86362001)(41300700001)(53546011)(5660300002)(2616005)(31686004)(44832011)(6916009)(4326008)(316002)(186003)(54906003)(4001150100001)(66946007)(66556008)(66476007)(8676002)(26005)(83380400001)(2906002)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzBHemJYNG9hTVczZkJIYjN3ZSszNzJTUUhKM09BRXByQTRIN3IxT3lsT2Jz?=
 =?utf-8?B?NVJEbis2bi85OXJtZ3dMSFRIMFF6eW96aDZPNUxtVm54Rm1mcUZOaGRiQ2tR?=
 =?utf-8?B?aWtJdHFOT0o0QWpWQXMwUTZNVDRZTDZqQ0xETVU5cVFqdDlvVEp3KzhBaWd1?=
 =?utf-8?B?Z1duOVU3SzBxaklLb0lSb3I5bVM3Z0M2VGcvTFM5akZ5VFQ3UFM4eTNNVWhE?=
 =?utf-8?B?M1NLaURETXoxOGZDWDVUYXhObEhvWDU2SHpIY3RCeG5RcGp2djVjMVNyN0tK?=
 =?utf-8?B?SW5qYmdHcjlTYnFxMklwdjhZa3ltcG5reXZJRS9Sb28vWWEyOStwQWsraVFO?=
 =?utf-8?B?Y055ejdjR2lVYjBLaVFQTng4WWY2ZkxTWHdyZ0VGd1l0Smo2bGVHS3RGalg5?=
 =?utf-8?B?TllRT2dSdytnTURCUU42bGM2UFdsZUZZWDVIenFEMW9ZdmVTM0JGVEpWR2pH?=
 =?utf-8?B?WFZ6NXRxOXUvU1htZmFzbVZleGM2QzNHR0MvQ00vclpraXZxSDNnVldmOWdU?=
 =?utf-8?B?M2hwVjlMS3RtakZJZFRkTkVWR1gvMGFjbjVlV1JJTjZ1ZmZEQ21maFY4SlBo?=
 =?utf-8?B?anFCK3owcFRhWGNmNXJLbE9EN1ZUaVJiWE1BMU1XTTcwL1hNS2tkczNQRnpZ?=
 =?utf-8?B?RkdrTmpQbElHOUZSd0xDbU1hejhNVDQ1RFlLUm1ZRElhcUl6R3o4cnR6SkdQ?=
 =?utf-8?B?NFlQUFpOOHlRdExQeTViVFRNTUs3SlhiZUFDeXV2MlUyYzArdE1hdEE1dUpr?=
 =?utf-8?B?S1hWbkROYzBNbms4Y2VYakpRcHhXcUVONDJJanN0eWhlQ0VrWnBXMDBPaDBi?=
 =?utf-8?B?VmthVGxxMTRrN1hmWTdmOEpmYXkzWVRnbjNPVXBHZ2JPaEZEM1hXV1FhVVpu?=
 =?utf-8?B?Yzg5QllsWFBxd050cStQWERzYXNsOTVWZlpWekdZTHZCYmhyVWRwSjJnT0lZ?=
 =?utf-8?B?L0tSVTVwWTdIdldKMms0SjRFbEpxUWcvK3pLMnN4eVc0eG13aENxNStWalVw?=
 =?utf-8?B?MnQ1WmtVKzFUSE5obEFCb0NWYkplaGV1ZFNaeC9KN0cwVnhZRDVSaDl6cXZq?=
 =?utf-8?B?V0JUcE9aaklGaVZ3RUQ4VWJMS1RhTGVGR0FNY3JGUWZRYnFXRmN6K2xod1Rs?=
 =?utf-8?B?THJ6cFQ0cUJkVThtdnBKaCsrZ3dYMExPb0tZbTl6SjV5YUVSSFRBTTduNnd0?=
 =?utf-8?B?bC9VLzQ2NmJpK3AvdjliRE9iNFBoR1IvMmZSaVBtYTBXL3lTSkJsaHRmMmIy?=
 =?utf-8?B?YU9vVTE3WmZmZE1SNjhWVWN2azRTRS9SRkxwTkpJbzhGb1Nia0d5UmFMb1Z2?=
 =?utf-8?B?V0c2NzQrRXJLaWpWMVcySjZkbmNpYkhzbmJpS1Njdzd0VHZKdFhNTk02N1ly?=
 =?utf-8?B?UmticWVPQjVGZmNQZUs0WkN5MTFrblJxSmJmTXBMQmwvNzIrM3loT2RFNXM0?=
 =?utf-8?B?MGRGTWxYT1psL2ZqWmVvblk0UG1qb09ORDRCRE9ydlhFYzd0K0doOUFaTGpX?=
 =?utf-8?B?US85TjBEMFJ5QXlSZEpqaitVMVJsUit5bWdCTWgyYzNXN1lzVjQyV2NSWDZu?=
 =?utf-8?B?cVpWYmpqQUJyRXB0aWE0TWtDVGpYK2dSa1dMbWhSd3d0cHhxMWU5amlMZjZx?=
 =?utf-8?B?Snd6bjZJQWozRllxYU5qMGhuTmlYSHFrd1VZWlo4ZkhndkpJZFRSbUdlQVBG?=
 =?utf-8?B?cTluOFR4SUl6ODVrVHBjdjhld29ORVlncWNqckkyWVpMUmtIRUJxSXl5Uloy?=
 =?utf-8?B?cExFUktSNnhuS1JxMUY0cWZtN1d4cmhtQlFYVzBIcm9MK1Jmakl1SDFSb0RL?=
 =?utf-8?B?QVJjN3loVXIzbGRYb3ROM2p1ZXVnM3kzalhEUWFRUXJ1NW4zbGhnWGN4ZStp?=
 =?utf-8?B?QXQzWVphYWpvT2U1dGsyYTh1cTZHdlh1N2paaTRPbVZ6SnY2alYwV1JhOGFN?=
 =?utf-8?B?WmRnb1QrZVAxVE1qWmhIUzk2ZzRHNVBGU05CQUNKMkM4cmxaN1dwRktKVHhL?=
 =?utf-8?B?bzhtclV0Y3ViR2pndGR6d3NSQk9WUXdzdnk4NWt3cXR6U0laYitRY1JlNkNM?=
 =?utf-8?B?azhIUFlKWFFkRDduWEtDUG5HWWU0VU9RR1V5VExvOEtJek1POUhnSXhEcXNL?=
 =?utf-8?B?c2p6VEY1c3pUZVU4R2ZzeG9KZXE4THhrVjl4SGYyL0xNTDdwRWpnS054aXJS?=
 =?utf-8?B?Z2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a680cb-9c2b-41d1-3054-08dadd095f66
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 12:55:55.3354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbVfs7KhA06iGDw3BF7YI807PGO0bfR+OVF5fKSIqS3uyXuPuqhu511vNSczAka24dACNWXkRK9hU4D3/HdJCtgGoHmF8t8EpnBCGhyJ3fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6882
X-OriginatorOrg: intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2022-12-13 1:33 PM, Hans de Goede wrote:
> For some reason rt5670_i2c_probe() does a pm_runtime_put() at the end
> of a successful probe. But it has never done a pm_runtime_get() leading
> to the following error being logged into dmesg:
> 
>   rt5670 i2c-10EC5640:00: Runtime PM usage count underflow!
> 
> Fix this by removing the unnecessary pm_runtime_put().
> 
> Fixes: 64e89e5f5548 ("ASoC: rt5670: Add runtime PM support")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/codecs/rt5670.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
> index ebac6caeb40a..a230f441559a 100644
> --- a/sound/soc/codecs/rt5670.c
> +++ b/sound/soc/codecs/rt5670.c
> @@ -3311,8 +3311,6 @@ static int rt5670_i2c_probe(struct i2c_client *i2c)
>   	if (ret < 0)
>   		goto err;
>   
> -	pm_runtime_put(&i2c->dev);
> -
>   	return 0;
>   err:
>   	pm_runtime_disable(&i2c->dev);


Hello Hans,

Good finding, weird one though. I just analyzed commit pointed by 
64e89e5f5548 and it seems that entire change could be reverted. The 
rt5670 i2c_driver does not assign any PM ops, only ASoC component ones. 
The later is tied to machine board driver though (and it assigning 
snd_soc_pm_ops in its descriptor).

 From i2s (non-sdw) Realtek codec drivers found in sound/soc/codecs it 
seems that only rt9120.c defines PM ops and configures the PM for the 
device. OTOH, there are several which define suspend/resume on ASoC 
component level and do not touch pm_runtime_* at all.

Thus, voting for a complete revert.


Regards,
Czarek
