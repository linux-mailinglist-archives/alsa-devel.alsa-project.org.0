Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874B3566E92
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 14:44:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57B0C16E0;
	Tue,  5 Jul 2022 14:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57B0C16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657025043;
	bh=z+Z2mboHdhD+b9XyNuzqMoaa2+hkTFW7ef6oz25QlcI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gdGgb3ct/GVdbz4TaQEY4NCTFYvCBLwF0GxYqDTWa624Vh00Chpumd/QuXLkfR761
	 SZ92bFnrJLh2WQ+cDQdBJdjaqgO2yh+qacHwvewzDCzSHmHy1xR3IaGPtKNNd9dBUg
	 UCAEOWqVdfPWRq90zkI02NLKWLtlkuzAjfn2oLDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD42CF80212;
	Tue,  5 Jul 2022 14:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3E36F80104; Tue,  5 Jul 2022 14:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09464F80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 14:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09464F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RgRQsVaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657024979; x=1688560979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z+Z2mboHdhD+b9XyNuzqMoaa2+hkTFW7ef6oz25QlcI=;
 b=RgRQsVaFblDJBfsNLuUCCF3AygN8PLnF4qUXa9aoviAlfIkAe+p+t5RQ
 3t3gcMIqFp80JjZVjdGmtg+FCd/wOGuDJV9FZ+Fh4ALob8frRppfhd9I9
 sNcxF6zXKgVAaz1genQXVFfFI9WKmkzGyMKbXOPp2lGB0nOxaC8T8YMAR
 H+lIxcLpKNXp3QBI1OyRvVPIOqNCeric3+bYDWscneCRpDynLH4xfWAfT
 48Bbvde4txuxyP29Tgs0lGxdPOgzOJ7Y5en8EFxWnB1RIsz/rSGGssKl9
 Ms7ukPgeBObMZLIqWbhiCfyTuCygeekuf0EcLMY1zLRCDtOEVXZEgWJNa A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="284455242"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="284455242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="695651617"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2022 05:42:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 05:42:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Jul 2022 05:42:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Jul 2022 05:42:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lENHFkH0UVSbOhMEb2/ml/FyMQcncsmmMb9qehKN47oJmSvb6IXc5RJOXhC+kNu+w/8i5fdvFpXdMNgqc9/C3yA5tadRcbU+Lju9CJDZbESNkldXQGy1sL+onBqAV8zqJxFYx9ga4YiRWD+ZW7xXdJ8JXncirCfgxmKwF9Lw72aoB/30C1VOqteQgDsT+h6MLdAR3EByvooRvZ0qNu7SlFquZsp5APjnEMNU+kSRFNw2OwsVrncrfLbLNPheMn+trnRyXHbD89g44LVpNdn81FQJDQfAt8uFuaa/MrSrwo33EJEQiCDzYs2EpJRFa2enYeSHqm+MYb2U/xCgT5WJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Xbc9Dd43Cv1ekrQ3sqxbYwGwiCV/4uXyO6v8Gqan88=;
 b=IjR597iXK4fBUpAFJXx1MtPbpnRh4otUzlcMGGda1j2L25l0EW5mvjZnqFkR1Mol7nC/bHncmucNbKCg19SXbArpipQd2WgTOFpf4aSfPVGg80A11ZNcZzrQWa1BQGbSrystlEMzBPQpBHNj9Fl9HJCpxIZ5Fxz7IyT7JBPYbmSwLO/hnH+rC3cm0ERmu/89ZMoEK/5xgjcoBwyhSIYbxMWpNMqR1ngWGtcAiSMpiFIzEH5L7H7KbR122GOqLCOPa3dODXqvppWM7fm3DLg1ePd0+V+yJBcr9fhqTcew2ZdIpcItWlM1msyoW5bVYHuIqO2mI8ihlqD7HmdFxrhvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BYAPR11MB2696.namprd11.prod.outlook.com (2603:10b6:a02:c5::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14; Tue, 5 Jul 2022 12:42:38 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:42:38 +0000
Message-ID: <fa905bab-e8bf-feaf-aa20-d4ce967a3d36@intel.com>
Date: Tue, 5 Jul 2022 14:42:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/1] ASoC: Intel: catpt: remove duplicating driver data
 retrieval
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
References: <20220703145152.62297-1-andriy.shevchenko@linux.intel.com>
 <9c67d656-9990-7206-58b4-3de25d8341a0@linux.intel.com>
 <YsMTXVYv/ks+nyqu@smile.fi.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YsMTXVYv/ks+nyqu@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbd1101b-a27f-4360-0e42-08da5e83d7f5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2696:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufT29G75s+l+SpDQoaXPOF0WgjGxn3Ct/PWRFz6AH2aHNAXThQ9zw/F7dYNZaa8fFwvAoIG09l+GfV0YlpAJKjqmjzgP2D8qEwOLPXMyQcpdYk/mGiVbYfMrWllVhYTP3oabUy4EGiTDVBiF5QLv5du87fHagYqd21zaRWggz9WX8SBvdKHYllvzyAXIU5VoyjB890mKmOJYdu1pXPW1H8Zi9rAfSRj+TmSwq20BM4yNT6kbuT7zyNf0um1AFZHF8scBRUGovCm+jSs9alWsjY5+NEgAHFJti8WrZ3LqwVjomW/kHlS1fqGmSHANzvvSzcy/Gzft2R487sFOsL4WJNMmfG120UqmUvu/0R8DrcGRrE/jWR2Atp4yB2u9Tyi0UKGVnQ8OkoGr3dfC9fVweno+lH+p2VPgaZ+bMCscXlfWWOX8W/y0mv1Zqp+9eaYT/oRjSbLX5dgdWYhs6PXUg/IHLq3hbRLrAoShs1+RKktiWv26u69cr8npvzTwJaMpMkY09/1nMZFqFWc7YakhqOQhSP57R7CsmpIa+jDdEoL/+3K+wmGYhR+EhcxGIXTikE0AJQrD+IBehOTumlTMdhLWNkO3HMxtv66Xo/D77LPc5xCmn0RtgPwn4+UMiW0K16+JdSccrqeoLR9Swxs1ojRTIMQ1n7zcAn/hzPPSj3cRXJ9bnsNtakRHa+YgKronqHKVSWEx7BRQNeAe9oV/SmdOpzpZEgKyJuhSEs5wYTdVDJVldTa+dE2q1+dLNnXdO/QNi+AhRZnsZqVa2ztu+imrEfKkziX1N1kMbnKr4gwQHE5kZIlTbfLcKo8Z+yIvFI1wcehJXNMcWDjnxbTqtLQT5qcmYniasuEbLH80bo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(376002)(39860400002)(136003)(38100700002)(26005)(36756003)(186003)(31686004)(2616005)(82960400001)(6506007)(54906003)(5660300002)(4326008)(8676002)(6512007)(66946007)(66476007)(66556008)(66574015)(6666004)(41300700001)(8936002)(316002)(7416002)(31696002)(110136005)(4744005)(53546011)(6486002)(44832011)(2906002)(86362001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxWWE1LK2ZjMHBEeFg1Rm1oekhhQU5hQUtMSE1pNEpSaDJTdXowOEtpM2lI?=
 =?utf-8?B?TTJUdWRtSGR3NGF6K0NraCt4eThvTmFnRWt6ZlZiY1Ayck92QzkzaTRJNVVU?=
 =?utf-8?B?MDdiTE1YcCtuUC9SOXNBVjUyYlR1OHpPL1ZPelU4VWZ4NzVJd0oxUkxUaFlS?=
 =?utf-8?B?R2crcFVhT1JlaU1sK0ZYNTI3MzgxRGdwOFE2bVNjVjFFNlpYaTg5b3VxcWFE?=
 =?utf-8?B?OUt1VEJpUEVQR1U4MGJHNGlTSGtoQTh1L1dZK1hCRVoxTUQ2eXFmYVRMWk5o?=
 =?utf-8?B?dWNQbEFWRFpqYk1FV3JyNUJqU3VINDYxUjV1WjFXblJpNFJlTDRNZkhjY25R?=
 =?utf-8?B?bjEzckh5K21QTzU1M2hPVHZQTWdGQ2p0a2N0ZUtuWmEwRW1GOVVhZzdHMTVt?=
 =?utf-8?B?Lys4TEhKRUlDb2JKNGdzSWp3UnZIVjB0S1lESC9rMGRNczQ4MGxwMTNZdU5F?=
 =?utf-8?B?djJXK0w5bElEYzhiRDFHZGZEclVRbG5TeHc5TUoxVlBuS2VHRFd1MXhDZFNJ?=
 =?utf-8?B?d3lKaHhkeEorVkF1bHBEU2hQS2J1Ujk3SVV3S2hRMHNvR3F0bnlLdzJQeXo0?=
 =?utf-8?B?VWFaUEJ1anprTENubEsyTUg0bFF4ZDM3TGZvc20zR2kxUnVPb25LZUY4Tkli?=
 =?utf-8?B?QWFYZ3RGSTJMUGZtNVp0L0pKMnRrbklRQWVuZDFIZ2M3Qm1DenNXeWFwRGJa?=
 =?utf-8?B?QU81ekx6QUtzRmxmaWNieHZRajEzN1dXQ0daWUZIM0ZxMVQrZXk2YWhoZjEw?=
 =?utf-8?B?emdvOXFTOHdxb29WeG03YnovUm9EZVhRVTcxbmcyZXpuMVdlQ3pSY2dSTHJu?=
 =?utf-8?B?Z0F3U21ML0kxRDZxT3ZkSnl6WWVzT2NYRjYzSUgyZ1dqMDc1TThvbnZLbk1z?=
 =?utf-8?B?bjNsc0h6ODhFZkR1U3FkVHlEdU1lcW40NUJrQm41UFlFYVZ6ZnltSnZ1d0VQ?=
 =?utf-8?B?REhEcFo1WFNINlE1SFdVZWg0N0NZUnptWnVFcVpadEZyQVp0cFdoVjgxbkkw?=
 =?utf-8?B?SE9IcDNLeFZ6Nkk4QWNxVkUvK2UrdERqUVp6Ymx5TUtmZWhlYW1IMjRIZ3VL?=
 =?utf-8?B?bDRObnNtV0ttQWhpWDhvSU90T0lJY1kvUzIwaEtjaVAxYmVJb1FabWRKOXA2?=
 =?utf-8?B?bFNYdUxtcG1hMis0Wml5clFoUVhITTBFK2RIL21UZ0lZZjNTYnJSR2tNWWcw?=
 =?utf-8?B?L3NXSHR1QWdEaGlRYUZTVVlEdUprTGI2c1h2eE5nNmlHMWlkTVQ0OURPUVJx?=
 =?utf-8?B?cWsvWW43YzBJS0hsSG9yamtySmVGZXYwdkJ0dngwYW5JWU1FazlJTDlGVzl2?=
 =?utf-8?B?MjFPR0ZzcXVnMnhJMEtFb21OVXh0UnpqZlJwNis0RHBMaGo2Z0ErZkR6Rzhw?=
 =?utf-8?B?ZFJPQlFWZkQ0SUlqcElWUU05ZXg1QStyQlBKdVd4Qm11Y1M2NWRUeDg2NWVw?=
 =?utf-8?B?WHJKb1AvYlhXRXVNVmtZMUlQS1RkamhwMThrQ0c5RWMxM1dKMnh4d1U0Y3BU?=
 =?utf-8?B?MHNwOUJlWkxCTHpYRFlBQmhlRU8wTmFNaGFadGhDQkg0MUdaSzV3SDZPZWJ4?=
 =?utf-8?B?OHpkNE9HOG1yTVlCcy91N3dUZHI3MWJxV2dZYVJ5Z2ZxVUwzUXFFOWhmMTZp?=
 =?utf-8?B?bVE3bWMrbjg2eFlLMVJYTVMyTHp4WkpBRDk0QW1kdXJzeTdlMVhBenZWVmZ2?=
 =?utf-8?B?OEVneld3V3Fjem9NdndiaWtXbHh5a05yVzZYYXpoSE12Wk0yN3Y3WUozZEJ4?=
 =?utf-8?B?UTMwZ2hRbUFRZUVlQm1mcEZhcGhiUUxrQTl5dVlVNXd2aWZib0ZLaDg4MVBv?=
 =?utf-8?B?bUw1M1dmQXpUekRKUnowcE9ZTnE3WVdLNHVqcEdCaTdHQURmdlk0Sy80Nmgw?=
 =?utf-8?B?SVlQb0puRDdWdjhYUFlGdkV2Wk5HRFNCa3lmSjRrZjZuNm5ybllGZHpYbHJD?=
 =?utf-8?B?V2Y1ZkJXMC9yVjJUNm9ldXliWTEvODhmblQybGY5dUFTYWNRQzUra0FJK0pG?=
 =?utf-8?B?NjhiYnRXOVhoMEVHQ29HdDMrb3lUNjJObDZ2d0MvM3hHTlZtREVtRmZENGlz?=
 =?utf-8?B?a3k3cDJQbDg0OXY0ZVR5SE5hMGhqMTlnWlRwOFFTRVBDVEs4dUs1Vk8xNWxX?=
 =?utf-8?B?NWlJNXAyM2t6RDBxcmI5WG85RjB5RDZkV0tKdFJKaTdWdmtiaEp6Lzl4MXZF?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd1101b-a27f-4360-0e42-08da5e83d7f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:42:38.5109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sc5hSBDkdpkLrMgRbCYqB19Aiwa6YXrD+prkMIpxoSBUGHtMt01obp0SFxd2VrF1xvTrCgUP0tHipVeB7zdmB239sn/PZevBUnFwwzUpzEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2696
X-OriginatorOrg: intel.com
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-07-04 6:20 PM, Andy Shevchenko wrote:
> On Mon, Jul 04, 2022 at 10:36:33AM +0300, Péter Ujfalusi wrote:
>> On 03/07/2022 17:51, Andy Shevchenko wrote:

...

>> We could just pass the "(const struct catpt_spec *)id->driver_data" in
>> place of spec to catpt_dev_init() and we can get rid of the local
>> temporary pointer?
> 
> I would not go this way for non-POD types.


Agree with Andy here.

>> If not, then I would cast out the spec before it's use:
>> spec = (const struct catpt_spec *)id->driver_data;
>> catpt_dev_init(cdev, dev, spec);
> 
> This I can do (as well as in the other patch).


Agree with Peter's suggestion here too.


Thank you both for taking time in improving driver's quality!

Regards,
Czarek
