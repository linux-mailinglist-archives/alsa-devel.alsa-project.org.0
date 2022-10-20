Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C72605FCA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:12:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C3CB934;
	Thu, 20 Oct 2022 14:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C3CB934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666267927;
	bh=QK+DqQVtpbrZcX/xsHewTGcnc6waRZiykjZmUAfvVk0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sYrElZyNYTLjYzTrgfEPjZYL7v9h7VYknLkkIv5rT1R6hpQ8NSQERF6WWvDY0jUVU
	 /1A+ijuuPepRPy30Lq5x4OTDA8LDQUmj3XNBFk8t7qtRBpOHqOCwokFwcCygMGCRJz
	 /JD5dNXbkW04FBbyrYLeMlunC9C9CkjtIPBCjZMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 756F6F80137;
	Thu, 20 Oct 2022 14:11:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A22E3F80137; Thu, 20 Oct 2022 14:11:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F0AAF80137
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F0AAF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nn/ZBlBG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267866; x=1697803866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QK+DqQVtpbrZcX/xsHewTGcnc6waRZiykjZmUAfvVk0=;
 b=nn/ZBlBGEUfVv+aEBs++e01xtoyhGVdwimVX5H+RhNv3+XM+1AkM7AGk
 8vm+F6ykGwkjbHfp1eOYFESwnnKrTuxPUREylJjawNJ1Bh6oh9kZQpaZw
 HPf8X+P+ULuk+aYgIGiJWOSEMeNz7Fb7TPtgbQYPq/07jP5puoukUcE/W
 NifaPy+VqycIDY8jyLP6DbsLEmQtUHJkAIN2N0J1CZ/b/9GExZAqlsLEq
 WQCNB1srZ3wndBmtzh0SSf+8/DkcA90lTX1wVEEDdn+ZmyskbtloCnElP
 NE/FH+G2sRrO2Dq2XGRIc3D21rp1AdWZ+YykE3+7kYn9OOPCrSeJb+Uxh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286406614"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="286406614"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="629777556"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="629777556"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 20 Oct 2022 05:11:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 05:11:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 05:11:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 05:11:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 05:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lClO+gBScjSpyOZIkDRtNIZt6R8gAa/UxnN+gBAutmoxsOepn5jqBAbhl1AEh9TLTNsAQmvfqgmD5DlitqP3hTafcKG5UZ45yTCXKkk/il5Riz3BL7MpoeiLAFd3vdd6M2lfttDQE8pxPGzKjLzKhkNBgwby8YhXesafd+2rguzAuYQIzNSE38mzpLmjB3tToqSMug9hnK23+f3TBGvzemMKov6QzZxvPGciDYkaiegrkQf/Xg86uO4o0ogORiJWNqX6Sr7z+qdMoywk1uRc4sjc1j6U2juKbb9J+2e77V6QvpEKCRXBY5XoOTXz/dXdxtF1fHU/hhVUvFZosbAd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3CP1UiI5yJ8R+uUhJqy6ohhtfuCda+UIkR0g6NmHl0=;
 b=VcVlId8Me3BC5YZ27tbY7X3VzSYZ1pk4x/cmnpsxtdEDjh6CNExrebsRIbJBaCBt1hM6Shi+Ky12/T7QoQq6oTYTBTbM3KqtTLfPTSK+Z6CSu+ds0YRqZ9IZNqTeG9yCUAB2tMtBCb1Hg0l79oGT6IZp5+bZhBgQHSuyVDLZymXQotz0uUaG/a2/qlECiOLBfyEXqNLbMomBkc59qwKQgLW3fltHiNoGkwQA6BXGbo9Ine1t54QsA+DDnnbCGYAH7SMeoKjNvxxnICkIXkGZtKMB7ukRqOZF42v0QpBDptTJcPZ8JGlqv+HUXAeqBY/MKlnDK9sn+GuoVws48SA7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.33; Thu, 20 Oct 2022 12:10:43 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Thu, 20 Oct 2022
 12:10:43 +0000
Message-ID: <61e23a97-93bc-a9e9-3677-e1490a886bcf@intel.com>
Date: Thu, 20 Oct 2022 14:10:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH v2] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
To: Yang Yingliang <yangyingliang@huawei.com>, <alsa-devel@alsa-project.org>
References: <20221020105937.1448951-1-yangyingliang@huawei.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221020105937.1448951-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0517.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: a03ad2f9-8490-478a-c3a3-08dab2941c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: toqJ0Gl0MXrYXqPkcmY+Ra2fjDY3ue2RinHVPenFh6L0y0iEABHarv9vJEcfBwkjHNjldvmiLtv4BiuGfhHqgce40SZ/75+xYDkc1wuEhqRAAW2W0LCxBmHdJJMdq4rD/VDQ4XELz7yTvudfhyNImYrU5ectCeWX2TLCAtvR9mMrHejSfX8WGFd4ogQG9GZHHMdnKTSm/YJG0s1Z2O0rK5mznyzMi8Dlgyfo7pPppduhSscOXt9Rk4UKrlABr5/bBkkdJiUPYIDVLOz9WAo8430X+6yFjfBzbjwQEeCLXIaVFnfOGt3Hx0KiivxKm+1Nqxu+UjGwUsmWNiY/9ZiPTxteLs9ZD6cHuZIweWdQp5HWwcq/9iaae6WQ5I9PCXAhT9nqJ7PY1MkjBXo7WkYyY2BmlOUP2hVe8YyZP4b2NRiIw01/VKCTcxDfm49+6u1d/SImZZwd11fqRo4f4Lly6DyUwQjQHzKT7qoywt4s7eVrYG5R1/I4P9R6bmCAfqLM9L6Z8JnzXAK5xfA0Ow7tv/SdsDj8H/VxG997+LWKuClBElbCMYhkxgHTR5tBM+uwF0uDZBIYD4kDOm5f5tsII6Nm+qf1+H0k2wBmWY+MqGIiWx/8W/xgwqO+5XtnCxb5TKC3atButxEl/ohcc1ac8auHmCSYuQm0cH+7QRkC5apKnM4+izW96qqxaoRdpGv+rFL6XT6ypgaOIaCQHJj/NxinkMA6Aa6kP6+atEVTz837W82JVl+KgqUJQUYcsTQzVQMoqa+e5syiDnvT4s2ww6gYwPsPNBhSYv3TnYaKr9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(366004)(396003)(346002)(39860400002)(451199015)(36756003)(38100700002)(86362001)(31696002)(82960400001)(44832011)(2906002)(4001150100001)(6486002)(478600001)(41300700001)(6506007)(66946007)(8676002)(66476007)(66556008)(5660300002)(4326008)(8936002)(6512007)(26005)(53546011)(316002)(6666004)(83380400001)(2616005)(186003)(31686004)(66899015)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjdNSlJWOG1uMVhLTy80WXVlbWZOWkY0aXdXQjFBaVRZa1E0VFNhekgwbWhR?=
 =?utf-8?B?eVFhdW1tSW5CazVLTEdPZ0dWSjF0Ny9TU0NnN2dYaWRlUHV5K3lKMXNiL3Q3?=
 =?utf-8?B?UWNnd3hYTTNvTmF6YzUwbVNtTDE4T2tUZ0ovZnhUQzBnWDdyQTJOMHpRM1dV?=
 =?utf-8?B?ZlEyWVJqOWF0QUQydzJQbXlLOVFYQWhtVUZ4bDc0aFFUNU5hUnZCR094NFJq?=
 =?utf-8?B?eXk3RzR6R2RYY3g4NjM1dGdzQzkyck8wR3RYNFYyWmNWc0w2QzMxRTJleE01?=
 =?utf-8?B?L0h2cXg1K0V1cllUV0h0Um5sZzk5SzFTZFJRVG5aLzhqQWRtUlIzcmFZaVk5?=
 =?utf-8?B?NFdwN29mYVRodUh6eEtsMnFUODZBVU9ZU3NDQi9EaHBjWHpuODdCeWFPTGho?=
 =?utf-8?B?YlgzbjI4d2VCM1RyRVM4YWxjS1BBeDh2eXZ4VFVBRkdTVStjTm5lcXpWUEly?=
 =?utf-8?B?dkJPVUlaZ0p5YmNSdG9UZ2pKeWE3Z3hzWnpMU1hKMmt2Z0NoQXFjUmc5M2RU?=
 =?utf-8?B?TnFETlNBc2Y4QXRnaWtUc21xRXZhTktmVWUzN1lad0ZwS0xDM3BzcnFJVzJS?=
 =?utf-8?B?bU53NUxHZDEvWkV2UFJqOFFaVCt2Zm1wMThiKzNSNTJVUTlPR0dKOHZDU0tn?=
 =?utf-8?B?SDRqc0NvU3BDMHllZW5XY3QydmxXdkVlSXoxcndMMmQxUk5UR1hLUi9rQ2pK?=
 =?utf-8?B?Rll0eTB2bVB1eVlZcmZ5Tmo4dXprRmt4SFpNYmhGelNaditYNjRuZ21COUw4?=
 =?utf-8?B?THlydk8yaGdVSy9XWE1KZjIxZFg0QmRXNXF3WWdaYldvTHJ6MHk2Yzc5ZWhw?=
 =?utf-8?B?L3M2ZmRyUS93alU1RVNPbXM2TnFoNFBQOEFkZU1mU0x5MFEySzNYbmVzVUFC?=
 =?utf-8?B?YiszSFpOMzBjTG1aWE5SM1VmbHhkMnFaRGdEb2YzeWxDR1Nsb29SclNXWTZW?=
 =?utf-8?B?WkZEK3hSNElWMGZaZlVLTnRtRlpvYndON2lKcFZhV0I3QmQxNFNSNmZLRnFR?=
 =?utf-8?B?L3ZrWkNDbjE0Vlh2SkF1NHlNb0dHekF4aEdTbUJ6OXlIclMrNjF2UU4yUmJl?=
 =?utf-8?B?K2ROSitwVzFyV0MxWnpTelE0NmFXSEtROXJ3UnluWllLMFBmOC9ZZTlNeFRJ?=
 =?utf-8?B?VDBnYVBQQ0h3SUJUanc2OHhqUXl2Y3dWM29VazhRZDJBUWNCc3p0MC8vSi9x?=
 =?utf-8?B?ZklybEkySy9MUSt6U3l0R0dLUHdOSGxxTXg2andkeVpqalFYTit2NWlXS3NW?=
 =?utf-8?B?cENwUC9NcDZ6a0RMU0xnWG8wRVJWenhMbTFNTGhMKzZmR0x4TVY4VkRoNnZ1?=
 =?utf-8?B?N0FoSFZZaU1pMXpONHdvS3M2dVE4V1cxNmc4WU9WZ2FSZ0NPRWllTFg1dEF4?=
 =?utf-8?B?NFFqQXpLZUhpZWhmVnEwcjcyR1lOVm8vN0FiRGVxLzlZMDJPM3EzVkIvcCtC?=
 =?utf-8?B?SWhUOFpsMDVRcm8xcHRDNUlMM3ZJWng0TFI4NThKRVN0eTBvcWJLNDNVaVEz?=
 =?utf-8?B?c2dxTnE5MENJWmVPRzQrZ1VnamRCanZaUnRnZ1RSeVFTRjFOTnJKOTdxSVFP?=
 =?utf-8?B?NVlaQ2wyVVFmMDBLdGNZZjQxR2IzSDBPSnRjSW11bkZ2eDBwZXR0em54ejFD?=
 =?utf-8?B?UTk0Wmc5R1d6YjEyd1dJY1lKTk1ISWVKak1ucTQ5YkUrMUEzSy93UDBwcFpv?=
 =?utf-8?B?OUxwL3lwNVRib2lTbXdETldUK2dpUzZPczdjLzZ0KzhFSE0rRFRJYUJxbXdh?=
 =?utf-8?B?UGdzajV6blB1ZXBnTEhTUXpFOTQxaFYzMWx6S1Yra2pWWkl6S2NvQ2RQWVJw?=
 =?utf-8?B?RUxSbmZNWG1vSG5RdzRNOEFWNW8yRVE1bjZpa3JKdERTYzRLY0FlVXMyUlhv?=
 =?utf-8?B?bjNXcXNNaGJyMkNISkFZL1FWMG5yL2NSVWYxZCtRd2hxYWhpamZxK0dVWEZl?=
 =?utf-8?B?SDJ0MGFreGJuNW5VemVTSU5OaVUvS2h3STgySGJPRUh2a3VNVWc2MTFCMUJm?=
 =?utf-8?B?Q1IrSE1ZSklnbE5HYlpqNnIvWTZYOHpqMzBHRVB4V20zemZIZVRzWnRKK25K?=
 =?utf-8?B?Z0tEeCtCSm9wRy93WGpLcjJEbDNEcUxoakY2VXFtWXFPUzlJZy8xMGhseito?=
 =?utf-8?B?TTE5bC9XN1NzaTQ0bCswYXV6cHZNUmx4MUF1QTdlVU45UTEyREV2SlFId2JC?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a03ad2f9-8490-478a-c3a3-08dab2941c84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 12:10:43.0806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Xvb+M9jJjqHBpq2dFHpa0gxhp4N7eODX7W6HPGisX06I892F16vtk7bKdTD6QXqaHoP1l8WjZCD+qioa9f0NDDUf1J45zEBhYQTiCnMx+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On 2022-10-20 12:59 PM, Yang Yingliang wrote:
> If snd_hdac_device_register() fails, 'codec' and name allocated in
> dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
> by calling put_device(), so they can be freed in snd_hda_codec_dev_release()
> and kobject_cleanup().
> 
> Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init and exit routines")
> Fixes: dfe66a18780d ("ALSA: hdac_ext: add extended HDA bus")

I do not believe the second Fixes-tag is required as it's not connected 
directly with the fix you're providing.

Tag:
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>

would be most welcome though.

Also, if there would happen to be v3, please bundle Skylake and SOF 
patches together into a single patchset (still not a single patch!).

> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

...

>   sound/soc/intel/skylake/skl.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index bbba2df33aaf..3312b57e3c0c 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -689,11 +689,6 @@ static void load_codec_module(struct hda_codec *codec)
>   
>   #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
>   
> -static void skl_codec_device_exit(struct device *dev)
> -{
> -	snd_hdac_device_exit(dev_to_hdac_dev(dev));
> -}
> -
>   static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
>   {
>   	struct hda_codec *codec;
> @@ -706,12 +701,11 @@ static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
>   	}
>   
>   	codec->core.type = HDA_DEV_ASOC;
> -	codec->core.dev.release = skl_codec_device_exit;
>   
>   	ret = snd_hdac_device_register(&codec->core);
>   	if (ret) {
>   		dev_err(bus->dev, "failed to register hdac device\n");
> -		snd_hdac_device_exit(&codec->core);
> +		put_device(&codec->core.dev);
>   		return ERR_PTR(ret);
>   	}
>   

Shy question: why my suggestion seems reasonable, I did not test it yet, 
proposed it based on static analysis of the code. Did you test it?


Regards,
Czarek
