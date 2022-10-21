Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E960776A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 14:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73D63506E;
	Fri, 21 Oct 2022 14:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73D63506E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666357107;
	bh=psBAY9xdL1yW2br31WKYeu0cNqVyYbNo0ThB9eX638A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ls9gZjIswvNOVz5R3K2RfRndLt+wXYjNIfaI8H3PFM7Z/4iF/a2W/pscZyQKfnLiP
	 K6bC8p7BqFzhzNzc7pAY8pv7exG4D0LZRXtWLIG2b+isWWXX5zJtugtZHSlH4PNF5z
	 rG8oiyF0CJaU83vZeOj8GwqQT52EY3HLN0YbHiiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE45CF80118;
	Fri, 21 Oct 2022 14:57:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09FE2F8021D; Fri, 21 Oct 2022 14:57:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E192FF800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 14:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E192FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WintRhJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666357049; x=1697893049;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=psBAY9xdL1yW2br31WKYeu0cNqVyYbNo0ThB9eX638A=;
 b=WintRhJwtuwdlACFQYx1nmy4OAuOUfFqVrBsCMfvKy6ClLcaQWrcmHGC
 bM5DeJdlDY/eV1v7aF8WHqgbxCDMJqG82wu9M3VeD8VYnTJi4mBt0AMvX
 TX4ganCfvVLMho/HmD1Q6dsEc69q2D5cjpli50zWQMVbtq3KK+RbHhGUx
 pERoCcXmWWxOBy1DkzZ/koG8GLNITWOU5xz+0HAlrD4KZmU5c89lcKuk6
 Ikvfxek3GtD6Rh9bSyM56mbs2fAGfhaE6Fo2EkmhllkMAQNGT0RjY54Rk
 W7+bldyrAmv0eEm+SI7Doh27ASGRBDg/qlQa21BnR1p6OdUaUOutEahdG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="333571293"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="333571293"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 05:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="719706250"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; d="scan'208";a="719706250"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Oct 2022 05:57:24 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 05:57:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 05:57:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 05:57:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 05:57:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bK45FH25Xnk/SXeQXvmwtpfKe9AcuYpifb8g+ddxxkbo0UUfrpzvgcXPywOJHIzrXi5xWXB4ZqM+qYcn+SB1MbhZ3Xjhzc423gliv1BlAsveul0Fv5LRWptR4D1mmiClqX4OP0ELkJ8DcdR82xMxC4GN2m7OMhiwDzh3xZSfCys6BtwoGP/EzvzR6hfkVmjgyLDvBD55mZ+d9Y1bS+YFHDnsJMAmKEZqvHbuOKJ6krZKYt/stML8LJspZ/mCVJfj4t7ta1rif/24BDakeVfFwnVZeGwG0++pObjWonO5jTv103Bd7gXcT0BKT5DGFjih/RF+FoSFb//ELtFT8+YV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzBRkV/kEAw0GAJyO/i99gcx7fb2rHOkwpsShDXCPzU=;
 b=VacDTcV7uSCfSYdAkNUWyz1Zy1OF3mlg4yQcNQhCoZSygviJhKchPW+khiwBidYuqA3+c7ugOOP5mGp1heYErTLAAzg6BMC3jaA7nxGdjTCtzGeGhTWlxutNmcG2iVhuYMfpnsJs8Ahz5QV+WpHbf2BTH3cYKGwYpPEJXcrbYMxHgtFec1PbMb5mzd+PdkLSb+sFsh4qyohnSDIRGlt900h/NADqUqK6nHQhojFy1DZuxNUXJSPm2NLduFn9EJ7jzxcb8rUwLIj7+mSw7AjnmxA0aaKwqihM2xJbXj0YXcnYkRpme0XmeWhFA06eosyoNjco5YJ3FvBRwGS/jhOHyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 12:57:21 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Fri, 21 Oct 2022
 12:57:21 +0000
Message-ID: <3d49694a-883e-2535-8c96-413dcfbe5245@intel.com>
Date: Fri, 21 Oct 2022 14:57:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH v3 1/2] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
To: Yang Yingliang <yangyingliang@huawei.com>, <alsa-devel@alsa-project.org>
References: <20221021123849.456857-1-yangyingliang@huawei.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221021123849.456857-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0426.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::30) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f42933-e691-4ac9-dffe-08dab363cae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zDx3A82Ug/Ti+ZGH5aqF97b3YLDhv/KiJW9zGYVmcTMqeRKhqO53maKwdE9lU20otVcrxMzjX68y50dtpnDRWpsDnPG9cXK/pso0yFkD9YLnOvpbDvsaQ/H8s7XjDeh4ejtLXZIH9WpMg6wzfRIZtU7Z7l8A+qL+fE3Yh0rYGHhY6JUh5nPn5XF4pPZBRIztEuokFb7LvOpXppg6joj+OSE2oEjnce/rGmkxJfPHAoSfamTimwbjURkNSWA39A7wBuJKuV5FgtApn1gK1rnlqd4IXF/i7pCC+1vyu3k+i1J7rTNEeUrZkgRwooRkCooESf2O4A3O3+Uvx7xtdFdwSU26tGb+uKZ5/KoOmvc/hNYDs/ZzNMZWkUhcTCKaG088XW063Dhz4eBDy+qNnW9fFOdxP4AdZh5ltrT3da39f3Xxog0mEurJSpDrj5EzJQoqpLYXRWujaI3ckFLTzxiMPfdefWLez4VL71jnTOIJpeG6UcFsRBcBCDVVFwvYsbjOjaPi31rLD8stMrRhCN/s8ba9cFdxAwsSR8Ki6AITFrrQ59Byp++5NgoT5cVwr3v1lywAT8CsdFIwbn3/5qUlohAW55dOOp8gy/9SgNYj5ojRsoQknOZsQT1fRdSHvvXV58s4+S6YNqgnc2uF16dzHU47Cp0/XSbf5GfxMtUDlVmORAJfLr1k2VvefwDhmAahTreZJX2u76gu3hD16SRtxlwVQQjshAk3I01P426ehMveUc6VOLN749bCxq177g7ikKL7IqjkfjCKrZtE6FYogvgPdiP+rqF1qFJNUBS/6EA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199015)(26005)(31686004)(86362001)(478600001)(6486002)(6512007)(31696002)(66556008)(53546011)(6666004)(316002)(6506007)(41300700001)(44832011)(8936002)(4326008)(36756003)(4744005)(2616005)(186003)(8676002)(2906002)(66476007)(4001150100001)(5660300002)(66946007)(82960400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk51bXRwUC8yMGUxWXlTYTBzSUdKbjNneXRPdlE1ZWdLQkZ5MVNkempJWHpG?=
 =?utf-8?B?MmhkNjEzcEtwSUl6YjVoKzNhRXpxNGc3YUs2K1RmeDVTbUpGbnVjT2JVK0N1?=
 =?utf-8?B?MGt4cXNzQW83T0ZGWWhSMTlzVlpYSDg2L3B5MTQ3WGtGTFViTGtaUHV6MGJz?=
 =?utf-8?B?RklUY3h5Wmk0L1VlMFVrSUo1YWpBY0IybFNwK3N0T1NEbGtMYzQ0UXpKaUdG?=
 =?utf-8?B?Y3gwNnE2OE93N2RNTHd4VnlOTW4ranJtb0FnUjdtQmRJMVpZUTQwVGRqR3pN?=
 =?utf-8?B?NUpqVlp3QlBjdXdRMHQ4TWplUXBYVlBwcWN0eXZSZ3M1MTgwK2QrK2RCbjd1?=
 =?utf-8?B?NTJlRXpCaFBsTEkraVlocjJHQUtDRmhzY0syYzJGaVBKSVRjcmt4WkhrSVRi?=
 =?utf-8?B?cy8yMWk4M3BIclc4SzVpbzA0ZXNpME1YajZtNVZJbGZHcGdDTFhVaWxURjJs?=
 =?utf-8?B?MjFhM1hnWU92QS9uUlZrc2c5Q29saXBJTlBKUnRlQTVSZFRGZnp6WFEwb052?=
 =?utf-8?B?M0xGM2o1dzlHdGVqUXpsY2U4QjQyUUcwdHJKV3QxVm1GQ0orRmp1TFFqZXlj?=
 =?utf-8?B?RlAwbEJMOCtFMlV0Z3ExK0JWUThBQlhuOTV5UFk4V3dzUXl4R09ubStZQkVD?=
 =?utf-8?B?amRsSVI2QmF2b2VxQ0lmRk1saTNaWDhiMllxSmJ1OHBvbGNERXhFNStkdlRN?=
 =?utf-8?B?cjZXaENJYVlqQmpVLzZsRVppQWpVbTNYSTJqT1pZanZheU1TeFowSzlyN3Y0?=
 =?utf-8?B?R3hOcGt0OHp2VEd2dVZucThFeVB2Zjl1MloxZENXZ2tNTHN3bWlRVk83Z3F5?=
 =?utf-8?B?RlhxS2RWVHhaZXExRkx4VWZlaWFQWVcwU1BiYTZuVUcvMUdDUENSSXBPWThO?=
 =?utf-8?B?V3NUMnh4RDh3Mk9qZkh0L0NNOHpLVkZtdzUrZzNvYnhaV2I0aTRnS29tK1F2?=
 =?utf-8?B?TU1NUzFkL2Y1UjNuWUMrT3hYczBqaE4yaDFqaWxZcnRPb2tBMmpodCttUUZL?=
 =?utf-8?B?SW43RFpIOXpYZ3Y1R3FnU2ZXaVRSRmxsRktZY0RQV1RkeEROZTgzZkJGWmxj?=
 =?utf-8?B?YUZPVUZvSXB4a2Nsb0ZiVTBMUWw3c1QxZjVvVU9oQU83UFJaTlp3M29zc2tw?=
 =?utf-8?B?V1RQVnJnV2pNOEY3dWRHSmw1d2M2Rno5OFJ6cUdjTklEbTJES3h3d2hTRERo?=
 =?utf-8?B?QWdTUm1velRnaThqNVh4Tk1SdUs2R0tEN3VEeTBCNlVucHRzMkVDUWVDVFc4?=
 =?utf-8?B?c3dib0hFeTd6YnFCTkhwQjlDNEh3U0RDZGVDRHBNc0p2Yk4ydEh6bzNRTjdO?=
 =?utf-8?B?VXZOQk1oWWsyelhFT3d1RU1GU1E0MTREZ29DdHVwUGR6Nms0UlNGUTQ4Smxr?=
 =?utf-8?B?UC9kR1hYTGIwSmRXTlY5UU96eEMyOSt0RVkyYk5hOE9pdTNDQ05DUERhdkpt?=
 =?utf-8?B?bFBtSWMzcmpwNDVhVzNvL2N5OGxUNzYveGZyVUs1RkJaRzhseUZEcUVmMmtO?=
 =?utf-8?B?aTN2bUhiU2o2WWJFRmpaQW85NWV1dUpKMndrd2ZqRkQvUndyZnFpNTdRTTQw?=
 =?utf-8?B?Uk55c29ueEF6SkhrUnlmT2J5OFAxVjYxOU9DZ2pwY0FHTWVZN1hkaEZQYW4v?=
 =?utf-8?B?aGthZks5djBBbWlMYUdnVHhmT0k4SG9sSklKTUU0KzNwVTlNbGRJRVlyOGpp?=
 =?utf-8?B?c1ExbzJWTlY1VklUU05NVnM3Y250Y25IaExMczhKTTVtUzQ3YjRiSHhiSUxM?=
 =?utf-8?B?Vy92NTh5b0dIWVc1NVlIMmRrTUxvamFVTmlKSS83bWVzWm5JdjIrSU9UZEdj?=
 =?utf-8?B?bDRJZUdYRGpsN0RoR2ptWEpGM3lqNnhnWmQvSVpQbjlSMFNsUlQ5cDQrczBr?=
 =?utf-8?B?NzRPTjFrbHBvdFgvSlRQREMyVmtsbXBYNE54V3J1TWdjY3ZRMjF6Y2dlcnNj?=
 =?utf-8?B?NjNVejVFTGtXem50eVIxSlNOVjdUSGIwYW5BR1VQbEprVEJKaWRhNzAxNnNw?=
 =?utf-8?B?SWFXRU9zTkNXajVxZkxhZS96aFBTV2FOY0lGZWtNMHRCZzRLb0pKc2ZSSUxt?=
 =?utf-8?B?dnlXNngzekVVcnkvb3o5NS9ITHVhZG05Zk93RmJiYVBHa2JIQmJRdndwVXcw?=
 =?utf-8?B?Wk5rM0g1RXJPSHdKTDhkS3JNd2NiQ3dXMzhabFNQNEJHUTVqQWxBdlpaV21r?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f42933-e691-4ac9-dffe-08dab363cae7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 12:57:21.4768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dDwqvTDoPZIQd6aPVRhz+N0OYHMUdHWEiToiwTE5o6IZ7pWU33QA9gsZHo0SKMrISD9FaWNKpaDHYHZ4tf9dnNHlQssOB8AuXuOkPhJO0lo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
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

On 2022-10-21 2:38 PM, Yang Yingliang wrote:
> If snd_hdac_device_register() fails, 'codec' and name allocated in
> dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
> by calling put_device(), so they can be freed in snd_hda_codec_dev_release()
> and kobject_cleanup().
> 
> Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init and exit routines")
> Fixes: dfe66a18780d ("ALSA: hdac_ext: add extended HDA bus")
> Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Thanks for your report and the fix. For the series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
