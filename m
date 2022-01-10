Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A8489DA2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jan 2022 17:33:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 438FD184D;
	Mon, 10 Jan 2022 17:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 438FD184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641832393;
	bh=umNhPAY37/nrSSrNo3nJT6Xq6DTjzH7sf3MpY6mrpVY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s45BmW0Tf1ZOI3KcL9338LHhTm6EvyidSeD4e34zY6Cbbf5wbHr3gGMatoXkCtMQv
	 CA2/GBSxmr5KdH8aCB0/fn+3cf4IgGj3dpdtOM8VnUCPnkHRsGaMK//8+CAGLuPNHJ
	 QOsjAhb2PIuWQn+0cyhqj/cZiyl0rUQHkca1xBME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C29C1F80125;
	Mon, 10 Jan 2022 17:32:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CDFFF800B6; Mon, 10 Jan 2022 17:32:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 726D6F800B6
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 17:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 726D6F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="arNdwf4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641832317; x=1673368317;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=umNhPAY37/nrSSrNo3nJT6Xq6DTjzH7sf3MpY6mrpVY=;
 b=arNdwf4kHC4BjFdIpMsgt9+1SraBmfPpPfnd2/1keypiCPNt1dq0aOSY
 ONk3BpNo4hlHbsvzOYa0lrH5pSqvbRIWd11WYLo0NtLMoVXu97jXEki84
 H00FTPx7ot4hNAZTvocZVmZAi0npgDiZBrQYCB+ORuhL+UByBR3SrDpEn
 j6u7aJ8TyWD/WOEfEF/o5cscdZ8JYse1n41vhSNo1ky3mV+XbzpCBdR59
 6TETyYKeQoYIDqi6nB+hUwLc8dY467209151QQmku0R62g0SiN+nOAqcW
 54y1g2HoUoqjZLVr20g1Yvt5gISCf4i/j7IVqRc9f7yblRFHvbDdWHJVR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="304001379"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="304001379"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 08:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="474181870"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga006.jf.intel.com with ESMTP; 10 Jan 2022 08:31:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 08:31:51 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 08:31:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 10 Jan 2022 08:31:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 10 Jan 2022 08:31:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkNYh7pMfh/ToeFp4OmqF/Gww0YWgu7L5aKZMaQAPhwzWV9kWgyLIBVPoD28UwiiWhr0roBZGe0qYFu/EZ1u/F/SKL57xUoiLccU6zt2H6eS536chHybn3iZ0e1Jx2VMhTYoYNFAGvHBrIWcAs+xCepc/rL9R4zq3xWahiNjiv0SpdZ5k7ftVp9uJJvdKkfk70tRGhtleQd2lyEUwW9mBC/7LQag45uyZQxI0PhG2tJvMlUqHkyjaW6rno17rKa/ETc1WTL8w8M6VoZnzw92KvrNdYacGEKOzJvHGTS21+undoHKtoZhUNpefHjh8q1OI/qCrSSVgl2ASfLHUD9UKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxz387c2/5bhINBZ6dpC8+rHf6Mt1OkhDIa3+ria5tk=;
 b=cvrZ2SVXyvU9zG8a55vFYTzUi3EbIBjSTAfhEzWvMnve+VfmoM5SyKq6WGJMUzd27NX0oOLiKx1Rkg01fT40QoJldFQXG/CYP1q8elSfP+sNIOk6TiB95X4hLcX1OdypCejaP1xBoXdyb/TQXflJlWndVY7AtKyh9XkdZn/3DmHqAQYDSQyXG+PTjfmRm3pO40uzGW1IOCOJ6NXS59QSXb13p3a5JG1J4p9XIQoVixsIRp0kOmap1cSlt8ZwQe3XOx/Bo4f1obbIjrlcFGbt5qXwoimQ1FQ6i1qBv03dvgBpRmw4MH8W3T3VeW/A1pdMWuXxJgC7ti84LVu9xze6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB1475.namprd11.prod.outlook.com (2603:10b6:405:9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 16:31:44 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 16:31:44 +0000
Message-ID: <25f49c99-3feb-dfdc-1077-2f3552ce2ef1@intel.com>
Date: Mon, 10 Jan 2022 17:31:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH] drivers/soundwire: remove redundant val variable
Content-Language: en-US
To: <cgel.zte@gmail.com>, <agross@kernel.org>
References: <20220110104749.646995-1-chi.minghao@zte.com.cn>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220110104749.646995-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75dbf3e2-2733-4c6e-1050-08d9d456b084
X-MS-TrafficTypeDiagnostic: BN6PR11MB1475:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1475F01B0A3A4250EEB1DD1EE3509@BN6PR11MB1475.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/XX9nwInn+mmujBXaZIa251r+Yfd0gY/Vv4jTgBchxHFyHdmC+vEDnlH/QJsSi2npCRAxGJIxZ/cqtFMBlua6pziRAkDq8wCSAAsx9gNGhN2BNIaewSU3FvTxLuFFFgAaqsPKrR5YjLtBBsTPuNMceALaDEd5pvyJ7qkvHivYxEhRxY+roYj5RqMzB57uBXTe71Cy+K1+Egq3pIEYyPwlcSru8uzGlwvnH9WtfTsq9badeCy07cz/1He76GEJCtVtVdJez5GIPzr8eLKKle3qA52BPz5rHr8KEaYCGk/K5qyHNqpzmyq32GWAOtGzsYolrUotIohePmSaU96ddxsreDbDQUmyqGvASJCEiwunKdrpoxjGK0Fh2zutEKYRvZ+Rw0K+2ha6M8XzP7t5wT302pYq/QdGk8dYGeqU0w7amUsxeAHKyjU9vfPmzSr5LRneIWGApIdX3vtTAwlxdGpyvlgO5ATK1iPQSfVCrxw0AJBE6YOoJI/0jDLuYKlO5Q05SmCD/VdWrtNmOPEG6YRl3DdYoqJUzjEk1dlRnUTzRnMMj79i4HYZoSfOwl4DYOU0UjyI/wKxWDzGmGU1OTHZTkZEpk9M83XFDyiQkX/2qp9qJGP29LXHk+2K6fEymTLrb0HMJTLD58ASV1aOe6HWwP/08w1c38wcw2qkvwaXCN/K5YqXva7R1Vys3jUczHn8irQHBxgLUcnOUmItb0mQjs+g1Dpp0I9dGMSUh8InI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(82960400001)(66476007)(54906003)(2616005)(508600001)(31696002)(38100700002)(8936002)(7416002)(4326008)(83380400001)(36756003)(66946007)(86362001)(6666004)(44832011)(6512007)(31686004)(53546011)(5660300002)(316002)(6486002)(6506007)(8676002)(186003)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LytRZDJDVnYwaFFHYzJNM0s4TTFhcThESE9rRzloU0tzWE41YkNvTDZGWFZU?=
 =?utf-8?B?QWVabGtRY2lEankwcDh3NlRKaVFtTlE5QlpTN25nbVpadjBacGJ5SHlzNTVw?=
 =?utf-8?B?Unk5dDRzOGtiMFhwNW5ua1ByMFVuUTF1S0Y5V3lEOVJWMzhxMzVxWkloZVRi?=
 =?utf-8?B?SEFUNG9HR2t6YXlPb1B3UjhNbi9SeitlbE9ybStNVXJRUm5FWlBuRVdjNGRm?=
 =?utf-8?B?QWwyZDlwbjF5OWVoR0kvejVkdGQrWFQweUxHdXQ3RTJVM1prNThlYWFNcVdR?=
 =?utf-8?B?MzcyckdoRlppa0lyQ1ZDZnhNbG5xY3VqTkpnejJkWndlVHZsTTJzWVdXb0VX?=
 =?utf-8?B?MWhRRG16ODdiM0dSRldRY0t2WXhhT3h3VTlyTnVMc0FpdHJBS2ZvZjZ1L1Rq?=
 =?utf-8?B?aUgxZ0N1MlpxWnlEdndvMDNQR3FXK2xJZ1BiTE01aXlHQlV5b1l6eW1iQkcw?=
 =?utf-8?B?SVN4Vi9WQUJaazFRdHZZeFE1K0NWcXNudGdPZjF2aGd0ZVhsOHhNQ3JOazJD?=
 =?utf-8?B?RzJVdStRU3Y2Z2tiY2NjbVBsZWw5K0VxQjdSYWcrcnJtSysyYjQzbkMrTzhT?=
 =?utf-8?B?NzFHYkFHUzlDQ29SMHhrU201S0pibk43WDA3ZnFjNm5wQ1BNdVdCbUFXQ3Bv?=
 =?utf-8?B?Qm9LYXI3YXprc2thcUNZSHFkUFRPR2IyNENxQmdsWmVrUSs4Z01TcEVoZ0Vm?=
 =?utf-8?B?RzlDeUxHOWV3LzhuRFo4NkhyNm1ERUU3YVB0L0RTRFFxUTNCVy9lZnlhQjJT?=
 =?utf-8?B?bVZxU05sZjhjSEdzSU4wZk95YzBqdUtFNVJjaW1NckxHdS9SV0hYUVY2YjhB?=
 =?utf-8?B?bFNEVUpiMW5LNG93TVIzSnlBNTRIUEZhVVh5ZTR4enh1Vm53Y0tBUGExdExn?=
 =?utf-8?B?ajlQRGdkejRuTm41QWxxQXo1TnhObDRuU1Z5K1c3OVVZOHZuQlBBVmc5N29x?=
 =?utf-8?B?N0k2Y05wWG82dEdhR3lGWnUzeGZMU3pxL2I3TDZSUU1NN3gzT1FFZEc1dExr?=
 =?utf-8?B?N0VpK0ZoNjJ4cVVVbnlOYzlSa3JSWnVUUmxIS2JsYXhkK1VzY1pnUHczVGJG?=
 =?utf-8?B?RTByL2kxd2dPVFVFeFpYNGtuK0pQQlVLZ1lMMThjK0RWOVo2cng4VGx3NTJl?=
 =?utf-8?B?VG0rbkVqN1pmVlpZcm5QMDRJMElISjRldHF5d2N6ZHZwTnVaMklnQzMrR3hm?=
 =?utf-8?B?bmtLVzFnbk1ERS9lLzBncGE5Qy9JTlNlU2c1cUpWcTV4SFA4NDNSeEg1UW4r?=
 =?utf-8?B?S0FSZVNFYlVLd3huazdqQ2YrZFpVWXhTeTBpN1hObWIvTzFBU2JQbjBpTjEr?=
 =?utf-8?B?ZTNTTFJDRmZ1eGRUanlmNmVydmovbTBickMxaHM2T0tGY3dXbkppYTNFdHp1?=
 =?utf-8?B?VnJHYlhJNkljQnVsSG54ZnorYWtIOTNwNnFIeUZtbVQ2YkNUMXZTdjZ0ZkQ3?=
 =?utf-8?B?ZzgxcE5JRVdtUHhWVVNzczVsTis1OUpDQVhKbzBzUURPV1RBU09vMkpVaW9n?=
 =?utf-8?B?WXROVmMySURrS1VhazNkb2hLQ1hQTC9vMjhuY1BqblVMcVB5MGhmcnpISE9S?=
 =?utf-8?B?RlNNMm9LZ3pmK2s0OUg2RXN3V0FxcGJXcXBlbTFyZndGeGFUV0tlaHJJNHRM?=
 =?utf-8?B?bEc4dU9ZT1F0eFBidVMrNjVJZHJRbjFSRXZqU29ENnRKTFJIQTcxdUViV09u?=
 =?utf-8?B?QjQyczRCcnJlc1k1dTAwcEFvSC9XTlBWTEpHbWZPSkwvcjdVV2JveUVkOXQ3?=
 =?utf-8?B?Zm1renhiak9BVTdWdE02R1FpUnJHRUdTWG1kNjhjeHFVTmNqdmg0SkVBSXN6?=
 =?utf-8?B?UU5ZVW1OdlR1cW9uUTdyMFRjZWxQQUF5S1lyWGEzV09lMWhjR20xbVZjRm0v?=
 =?utf-8?B?WDZRNjBQcTV5S2N4SU5GVmcvSmpINkdEakFZUFhTMllFSjlQcFJlUmZQaHYv?=
 =?utf-8?B?MXNRUHZwNkRTNDNYRG9IZldDWlp3VTRpVDZ5dm43WjBSSkZ2SC9sU2lqOElk?=
 =?utf-8?B?d2JNTzFvbTNJQVRKMUh6aHdzWDdqYVMzREhqVFRhYjA2L3NxdXoxNHVIVkxx?=
 =?utf-8?B?VGx3U0wwT2tGYitJbng2aU90cUYwcDRRWjl2bHJ0c2plaXhZdWs3anMzeTMr?=
 =?utf-8?B?b3ZMVlZ0U3VPdDBBa3BqMURvc1puVEdqVnhRNVVRYXB3dGNDRTNoNEhFaWdK?=
 =?utf-8?B?KzI5enpQT1p0d3p5QlU3ODh1RDdiV0MraE81K296VlhkaEhLRCtMSGJ5Z1dK?=
 =?utf-8?B?akFuUGo5TWZLSjNkbjlqRk5qeUVRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75dbf3e2-2733-4c6e-1050-08d9d456b084
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 16:31:44.5315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzXxIQwm3a4wH4nNLZ8c4A4Hbkls5zwUl2c96LD4TmCyBZUT/ZwTUYiwoslmvM0sayitYFSDoLEUU1U+w3/Eht5x62KV29wphs3YLR3Izbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1475
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, pierre-louis.bossart@linux.intel.com,
 Minghao Chi <chi.minghao@zte.com.cn>, bjorn.andersson@linaro.org,
 vkoul@kernel.org, sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org
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

On 2022-01-10 11:47 AM, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Return value from SWRM_REG_VAL_PACK() directly instead
> of taking this in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
> ---
>   drivers/soundwire/qcom.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 54813417ef8e..77f9c90370be 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -235,7 +235,6 @@ static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
>   static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
>   				   u8 dev_addr, u16 reg_addr)
>   {
> -	u32 val;
>   	u8 id = *cmd_id;
>   
>   	if (id != SWR_BROADCAST_CMD_ID) {
> @@ -245,9 +244,8 @@ static u32 swrm_get_packed_reg_val(u8 *cmd_id, u8 cmd_data,
>   			id = 0;
>   		*cmd_id = id;
>   	}
> -	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
>   
> -	return val;
> +	return SWRM_REG_VAL_PACK(cmd_data, dev_addr, id, reg_addr);
>   }
>   
>   static int swrm_wait_for_rd_fifo_avail(struct qcom_swrm_ctrl *swrm)
> 

Hello,

While the change looks good, the subject (commit title) seems off. 
Please take a look at commit titles found in drivers/soundwire, you'll 
find several good candidates there.


Regards,
Czarek
