Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791295163DA
	for <lists+alsa-devel@lfdr.de>; Sun,  1 May 2022 12:46:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FAAA1ED;
	Sun,  1 May 2022 12:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FAAA1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651402013;
	bh=eavD65aRJo9tQ/pOdXcfMe6kaB1D0on6xK8KnK1OOqo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LcFZPTxvylpNGo041WCOSvMB8MUineHRRI8rJjkTHqS0mo1BBSNkCUqHJ+DvNB8P4
	 ex2A9fwEL+f4fC3IanU2eF4SltVYAxzZSrkJTtfYRXI5BJR7Jihyv0+3fGl0RktX0g
	 UltKbPI54/UA06hBA/4fMZ5rryu/kTEY1+S9Cia0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85857F8015B;
	Sun,  1 May 2022 12:45:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F560F80137; Sun,  1 May 2022 12:45:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA4BFF80124
 for <alsa-devel@alsa-project.org>; Sun,  1 May 2022 12:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA4BFF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Fd4oJgQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651401949; x=1682937949;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eavD65aRJo9tQ/pOdXcfMe6kaB1D0on6xK8KnK1OOqo=;
 b=Fd4oJgQVTxem43XxNufH6os3068KFVpSgffz7KzeXKiUfqbHJdMgbt6c
 mbMeV1bKoECEPmItjGHuWkSelwHilqVjMKk3RR/jo2IlELQNV055AM1rD
 AxNb8jLiZjb6dF1WAwfamAjLuVq7C5e03OIdV9hy0KQEB4BrA0NXxRyd5
 oxdLzIsRfYpWFbtENTHMx+gKdlNiGhx1b02ZxhRjnbvukr4hjxADWf3jI
 TTp/URnQyBNl++UXriYd7WNH98a9fWqc97M5xqZqvlc/TayWfFbIML74S
 6SMm7RCnevvKOsH5+aYopDSteb9j4Afvn6ZPzKq0HNwS2ZyHFO5ppjwDX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="327522333"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="327522333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 03:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="732955623"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga005.jf.intel.com with ESMTP; 01 May 2022 03:45:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 03:45:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 1 May 2022 03:45:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 1 May 2022 03:45:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUuafd8NvG8s4Dq1tixj5MBooNHUNRNJn/GzhLQeYgQtF/M3tg3+s6+if+nKeduKT9cblQeIz7BA6hCA+j8qWgirUTDz+6wnzuDvAj4eZkJrcLjzju1xqBio9/UVHVl/aRjerFOhctU+29KBsroXz4kqspEHp8WyapIs6NnmKiOgOIXK7d70wf+E+VU+BEXB4NlpcQnFHo5E4m5vYygeDrjTaN9z0aZGvE12hbA8FRBS2Ny939ltWuHqMiXfTDFV3LcrR7o8969gPAkbkTUhbFLwc40Re2/KK6Qnrin7cJd9A5zah6YJlNqhNIKJuVa9zef4hk+D/fu764mDqGLQRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTlIRiAkWWcsvuDTj5wLtwwH6EAvV4ZcUn1SfsJeCQw=;
 b=JWKlQM6sae7MAMCXWpBBvo8H4254MZl2aaC5TkOaBKvOJSTGWmCDB1qsfuJzYb98JFdWdkzyKr6tpbcsGQdEhjhTYMIZdnVeJi+E2p9lMa8tBBFqbPT5VC3813e04u5/bajjTfa4CbFaLeo0aNJCbNOIsoFdRY2Lhq9+zRPMnfXBRFp00wllIlHhnx53Kjmc6W3xMQg7zD9vdkL+uATqjLPUyAlJCU6YWeYjyhS6nTZxWowCNdWngpClcAb0F5MadWgnTJw+PFPuADMQg7cQG0sCIzkUfb/Weksi8LP1VgYq18ZOKrnYLzTVo9gVdOLvJH6EN5GAFQNMk0E+LPG74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CY4PR11MB1896.namprd11.prod.outlook.com
 (2603:10b6:903:11a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sun, 1 May
 2022 10:45:40 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.028; Sun, 1 May 2022
 10:45:40 +0000
Message-ID: <e2fe9c5f-3bdb-2083-de75-bb6977daff10@intel.com>
Date: Sun, 1 May 2022 12:45:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 02/14] ASoC: Intel: avs: Generic soc component driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-3-cezary.rojewski@intel.com>
 <988b37aa-a7ce-af9a-76b0-3c4036ba7884@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <988b37aa-a7ce-af9a-76b0-3c4036ba7884@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0348.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::24) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 880c8720-4482-478d-c05c-08da2b5fbbd0
X-MS-TrafficTypeDiagnostic: CY4PR11MB1896:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB189684584AD786E9D3E07EFEE3FE9@CY4PR11MB1896.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pqES8HVK+oF160o/49CtO+2rxQaATOYUA+BQbE5mKzBGwgZa9qoI9XwX4Lq00t0t966ceX0WEohdCiShhGwOC+jR4UWt67tgd/NZXzm8Y2UGtOKbT9G26mx1pI/rmDQRuXPWJU9357A3HBEyTNtTato26jTgrSAaisSa7Kfqznr8Xcy9BAShhQh9fkBTkQYoYpJ/pa7osLxT9aOln2FP24RRcJpXepfo8cguN6kPfKHS+HrazWpFNbjW2mHcaThF/khDDzA/2CSVj/siWZvr3wZ3oRq/a+GI4A/RGySoX5VzSjTNoeQR3O0+5i8lbTxW97UJYMil8Mv/XFrPoGJh4WGK3BXzwABuk1aECRWGn3atZhPuIvI7sop8+mB5Nog6aK3nYHHmAbhTrKfsZV99qIqti/YnX5bmh73gP9knIo4FgjQPUIKL34cRXRpL8ZbiyGrrJMpu3/fe76wX3+u5AoCHxfR50eBUCnDzYnIdoaH+i/WMx2c1R//l+w5uUab4Hi2kHbg7jblTT79X5GV4kM4GSiB12ajTSQTx9P8KqrWPwYUCWHb3xmIZ3kDwSXgDdJ+G7qQbPbRuYVAkutkayFwPrk3RVwA+5bbC6utSUv8Nd8LOV8WCofeamKuR2idV9ThLPj11yjDO2V26+jlmd9IlkXXs8rJjV3WXAl68/XYD0EP6cnVTkwnJyPvd7easR1D4TQXSk7yQEhG2QBxMp4BZt+ysWuNjxKgcG7XIp5m5GbsZw5QBuZDxOk/5z5ST
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(8676002)(2616005)(36756003)(31686004)(44832011)(5660300002)(66476007)(66556008)(38100700002)(4326008)(83380400001)(186003)(8936002)(7416002)(53546011)(6506007)(6512007)(26005)(2906002)(82960400001)(508600001)(6666004)(6486002)(86362001)(31696002)(316002)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUZFMFlUZTR2bWpkL3BlSFVhTVN5eEVxK1o5ZVcrWUduMlNWNzVnMnkydXRP?=
 =?utf-8?B?S1N0VWNFcE9pNy9iWTB2bUQvTGVVeEJWOVBkQXBUSGFaSUFUNDZXM1FodEw1?=
 =?utf-8?B?VUxmTS83QW1pa3l4Lzg3Z1B6enZaYkZ3M0dWRm9JYU1Zd3FGUEhvKzc0OW9R?=
 =?utf-8?B?MUxnOGdoZzVJMmhDS0djTGZDNE5ydjJERG5lQVdPR2oreUJZbGVNMTByS29Q?=
 =?utf-8?B?V2tOdHlhQi9DWmYxenhLdW9rYWpGaHdBWGMrK3NkT0VTTGtmYkthTUh6RG5X?=
 =?utf-8?B?OFdKVTdlTjl0YkVIMTZUL2h2cUI0VlFLd2RBUzRrbXM4aGhnQjU3aGhjTk5i?=
 =?utf-8?B?VEsvZ2IzNTJnKzQvY3BsVGZ3K1hsZ2Rxa3R5Wm5ramFZdm1YNjlvYnh6dW1Z?=
 =?utf-8?B?QU5IQmpaZGo4RENqbGExci94WWNnSm1IczFqY2pSMnZGVUZWT3FKOHBOc1Nr?=
 =?utf-8?B?TEMvaEI1ZlpvWnU1b1lIV1RNZWRUOG1iUzB0ajFTa2FEZmdKQ1lnbWxqK1Za?=
 =?utf-8?B?OWh3bk5taUEzMGdoelJiYzMyVWNhZGt4NHIya1ZhbFZSbngvc2p1MEZpblJH?=
 =?utf-8?B?OHR6OVlLZUtPc1ZUQU54NEs4MExXSE9CZDRYbURraURITFVHMEc4UTlPVnJC?=
 =?utf-8?B?T2tWcVJReE1RM1c5WnQzaWYrMnVSWloxZTZFSG1ZZXVGZkIwdERSeTFVcEVZ?=
 =?utf-8?B?cEtFV0IzcnRFTDVpYjlmTDVPeFJNRjFZR2J3MDUrdlVIdEJRVnQ5VzZnakVy?=
 =?utf-8?B?RW1hM0MxWHlRYWo2VEE2R1UwaHRBZW1wL2tXWTFCa0tKNldYWld1Qmw4S0Nr?=
 =?utf-8?B?eTExZHU0RW14VnZsOFNZNFRXZVlzSjRJRGhyRmhlZEIxb2JUVmVETFdnUGt2?=
 =?utf-8?B?WHljSFdKcFgvY3NDdUJnM0tKc0ZNUVBIRjNYVno1Q0hocXptRXR2V1dsNU1B?=
 =?utf-8?B?U0p6NmsvYmhmSENVaVg4RUJrRzBxK1k4SUxIaFB1eHFVcXNWT29oN3pBRXVS?=
 =?utf-8?B?eW0vaWZVOEV6SEhaek5nZlAxOHptUHRJTEFiZE50ODBpZGxrSzNlWmxuR1d1?=
 =?utf-8?B?cDFpTDdXSlFGRVAzLzJhSW9JNWQ2SEFXVkRDYXNkQ01sZjVTWFRCSjZEOHRr?=
 =?utf-8?B?Uy9HRXRhVU5GT0FzbW9OWm9kYXhUdk54WVV5Yk1sTnJpWHZ6clU1R0xxSWEw?=
 =?utf-8?B?NXUrZ3J3NTRDUWJaNCtBaXJkTlU2RXdiK001aGZVVzlIWmxYb1RjRG1DaEJD?=
 =?utf-8?B?bnovRHM1UTY4ZXV1eEJmTEtsdjgrM3Z2NVYvS2l4VUg4Y09qaXl1RTB2eHpQ?=
 =?utf-8?B?NjdwNFRmME92UWIrKzFEM0h1akJsWHh2bUhqMzA5MVZ5TUVBbG96TXNJaUZF?=
 =?utf-8?B?Ty9YbzgvVUFRL2ZPSUJhWlVoM2YvTXdEcE5vUy90dEFpdlZvWk01RHp4QVE0?=
 =?utf-8?B?eTNucE51VWZlSGZEM1Y3dnhEQmpmYlkydlFnck5DZzUvYzdVY0JsZUtPb09j?=
 =?utf-8?B?Y3VWZDllM3dnNG1OTVNlSkJYRGVCOW5YQ3hMUUR4UmRvTDNWaFlINlhmKzFs?=
 =?utf-8?B?SXVJUEdPWUR3aC9LY2UzdExRVUlNOWdzdEUzcGVHSEZLVURia2h5YkZxRUFo?=
 =?utf-8?B?dENOUXNxMkQ5OU9pcjNVeVhpRGR0bHI3QUU0Y25QY0Z4em1CYnhTajAycms2?=
 =?utf-8?B?dXpSYnlsdVE5M09vSHVUVHJqbFg3UXVOWnNGNitqSnBOMjZxcDVXQi9WZmd3?=
 =?utf-8?B?ei9IQWZzbDlpVTRLTjdQMmtuN1ZlK2V2VDJPcVNKR01QWHN6eWxXaHJmdmc4?=
 =?utf-8?B?dFBlRHhPVEJqMWpCN2ZnakFsVysxMGZLbXJVV3VHVHpWTUdwaFF2blFnUW5C?=
 =?utf-8?B?bXp6TFNadXAveHIrUjhEeU56c1d1Z2k0QWNwYXU4cjJWc2JrZkdHUEpSNjhL?=
 =?utf-8?B?Q2xETXVELzZoUzdzTThFM2hRZnNmYWdnb1VvYW9uSUtPdER4N3QwY3V4RkpQ?=
 =?utf-8?B?c0Z3aWsyY2NRNEhXaStzZGtaUldUWkN1OFVkbUJ0MWJROUtrUFZtajg1bHhw?=
 =?utf-8?B?TUpLM1d6REtVb2FNMzBYV1FEdmsrSFFtSEI3ZVFXczJxQUpKWU9KenNtR2xL?=
 =?utf-8?B?RC9mZWM4WDlqWVdXTGZIM2lSSmdjTW5keENZd1NNMzdkZTV3VFNvOFJzZnF4?=
 =?utf-8?B?d1ZXTnowMjhDczFQUTJXa0g2UW9MTG04dXlsY1ZHS3NnS1g2S1NKUWRJbXR4?=
 =?utf-8?B?Myt6c2RrWDNNQmc3d1FrZ29icUV0dlhCaWtRcUhqdndyTG94cXpyVEZXTlZm?=
 =?utf-8?B?UW9XTnJ5OGw5QzQvNTFCS05RdTNsM2JhWmNFWWdPWHQ2MUUzVDh5Q1dIQnp3?=
 =?utf-8?Q?0L+FuWBbVU4R3v/Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 880c8720-4482-478d-c05c-08da2b5fbbd0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2022 10:45:40.1753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4a9QL+7UcBaZxPht/KHezQGzXbev98pGZsj1xtaCjd0KN/FDTAbrhA5xH7Y8dcOPwhMyIhUZNAdDHp5TwMnJj6tYRQmL6WNSitKywzTb+8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1896
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-04-26 11:33 PM, Pierre-Louis Bossart wrote:
>> +struct avs_dma_data {
>> +	struct avs_tplg_path_template *template;
>> +	struct avs_path *path;
>> +	/*
>> +	 * link stream is stored within substream's runtime
>> +	 * private_data to fulfill the needs of codec BE path
>> +	 *
>> +	 * host stream assigned
> 
> not able to parse that comment, what are you trying to say?


Sure. This actually stems from the legacy driver architecture. PCM 
operations for legacy HD-Audio are found in 
sound/pci/hda/hda_controller.c with respective types declared in 
sound/pci/hda/hda_controller.h. Operations found there make use of 
struct azx_dev and get_azx_dev(). So, to be able to re-use sound/pci/hda 
as much as possible plus declare virtually no custom HD-Audio related 
logic, we satisfy the needs of lower level code by assigning BE stream 
to substream->runtime->private_data.

As HD-Audio legacy operates in coupled mode only, there is no need for 
it to differentiate between HOST and LINK side. It's not true for DSP 
configurations though. So, we declare separate pointer for HOST stream 
allowing PCM operations found here to have easy access to both, LINK and 
HOST streams whenever necessary.

>> +	 */
>> +	struct hdac_ext_stream *host_stream;
>> +};
>> +
>> +static ssize_t topology_name_read(struct file *file, char __user *user_buf, size_t count,
>> +				  loff_t *ppos)
>> +{
>> +	struct snd_soc_component *component = file->private_data;
>> +	struct snd_soc_card *card = component->card;
>> +	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
>> +	char buf[64];
>> +	size_t len;
>> +
>> +	len = snprintf(buf, sizeof(buf), "%s/%s\n", component->driver->topology_name_prefix,
>> +		       mach->tplg_filename);
>> +
>> +	return simple_read_from_buffer(user_buf, count, ppos, buf, len);
>> +}
>> +
>> +static const struct file_operations topology_name_fops = {
>> +	.open = simple_open,
>> +	.read = topology_name_read,
>> +	.llseek = default_llseek,
>> +};
> 
> can you clarify why this is needed?


The usage of default_llseek() or the topology_name_fops as a whole? The 
latter is here to obtain name of the firmware file requested by given 
machine board easily from the debugfs. The former is probably just a 
copy-paste from other declarations of file_operation entries for 
READ-only files.

>> +
>> +static int avs_component_load_libraries(struct avs_soc_component *acomp)
>> +{
>> +	struct avs_tplg *tplg = acomp->tplg;
>> +	struct avs_dev *adev = to_avs_dev(acomp->base.dev);
>> +	int ret;
>> +
>> +	if (!tplg->num_libs)
>> +		return 0;
>> +
>> +	/* Parent device may be asleep and library loading involves IPCs. */
>> +	ret = pm_runtime_get_sync(adev->dev);
>> +	if (ret < 0 && ret != -EACCES) {
>> +		pm_runtime_put_noidle(adev->dev);
>> +		return ret;
>> +	}
> 
> Mark recommends the use of pm_runtime_resume_and_get(), see patches from today.


Will definitely check this out, thanks for pointing this out.

>> +
>> +	avs_hda_clock_gating_enable(adev, false);
>> +	avs_hda_l1sen_enable(adev, false);
>> +
>> +	ret = avs_dsp_load_libraries(adev, tplg->libs, tplg->num_libs);
>> +
>> +	avs_hda_l1sen_enable(adev, true);
>> +	avs_hda_clock_gating_enable(adev, true);
>> +
>> +	if (!ret)
>> +		ret = avs_module_info_init(adev, false);
>> +
>> +	pm_runtime_mark_last_busy(adev->dev);
>> +	pm_runtime_put_autosuspend(adev->dev);
>> +
>> +	return ret;
>> +}
>> +
>> +static int avs_component_probe(struct snd_soc_component *component)
>> +{
>> +	struct snd_soc_card *card = component->card;
>> +	struct snd_soc_acpi_mach *mach;
>> +	struct avs_soc_component *acomp;
>> +	struct avs_dev *adev;
>> +	char *filename;
>> +	int ret;
>> +
>> +	dev_dbg(card->dev, "probing %s card %s\n", component->name, card->name);
>> +	mach = dev_get_platdata(card->dev);
>> +	acomp = to_avs_soc_component(component);
>> +	adev = to_avs_dev(component->dev);
>> +
>> +	acomp->tplg = avs_tplg_new(component);
>> +	if (!acomp->tplg)
>> +		return -ENOMEM;
>> +
>> +	if (!mach->tplg_filename)
>> +		goto finalize;
>> +
>> +	/* Load specified topology and create sysfs for it. */
>> +	filename = kasprintf(GFP_KERNEL, "%s/%s", component->driver->topology_name_prefix,
>> +			     mach->tplg_filename);
> 
> what is the link between topology and sysfs?


This comment is misleading as debugfs entry is being created as seen in 
the code below.

To answer the question assuming s/sysfs/debugfs/:

Ability to allow for reading name of the file requested by given machine 
board from user space. AVS driver spawns multiple machine boards, each 
requesting a topology file. To make it easier for the validation and 
normal users to understand what has requested what, we provide a simple, 
read-only debugfs entry for each of the boards within the avs tree.

>> +	if (!filename)
>> +		return -ENOMEM;
>> +
>> +	ret = avs_load_topology(component, filename);
>> +	kfree(filename);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = avs_component_load_libraries(acomp);
>> +	if (ret < 0) {
>> +		dev_err(card->dev, "libraries loading failed: %d\n", ret);
>> +		goto err_load_libs;
>> +	}
>> +
>> +finalize:
>> +	debugfs_create_file("topology_name", 0444, component->debugfs_root, component,
>> +			    &topology_name_fops);
> 
> that's debugfs here, is this to make it possible to select an alternate topology file? If yes, a comment earlier wouldn't hurt.


Nah, its purpose is very basic: get the exact name of the topology file 
loaded. Example:

intel/avs/hda-8086280b-tplg.bin

>> +
>> +	mutex_lock(&adev->comp_list_mutex);
>> +	list_add_tail(&acomp->node, &adev->comp_list);
>> +	mutex_unlock(&adev->comp_list_mutex);
>> +
>> +	return 0;
>> +
>> +err_load_libs:
>> +	avs_remove_topology(component);
>> +	return ret;
>> +}
>> +
> 
> 
>> +static const struct snd_soc_component_driver avs_component_driver = {
>> +	.name			= "avs-pcm",
>> +	.probe			= avs_component_probe,
>> +	.remove			= avs_component_remove,
>> +	.open			= avs_component_open,
>> +	.pointer		= avs_component_pointer,
>> +	.mmap			= avs_component_mmap,
>> +	.pcm_construct		= avs_component_construct,
>> +	.module_get_upon_open	= 1, /* increment refcount when a pcm is opened */
>> +	.topology_name_prefix	= "intel/avs",
> 
> is this intentional that the firmware binaries and topologies will be stored in the same intel/avs directory?
> 
>> +	.non_legacy_dai_naming	= true,
> 
> is this needed? we've never used this for Intel?


I'll recheck this but back in time when we drawn PCM ops for the first 
time there was a reason, certainly. Out of my head - impacts behavior of 
snd_soc_register_dais().

>> +};
>> +
