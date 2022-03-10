Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3E44D5006
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 18:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 473EF1941;
	Thu, 10 Mar 2022 18:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 473EF1941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646932532;
	bh=QSGfayL5lXyHSu0iviTfzWPDHyWvmfvpcMNWdYS+HOY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cI+GS50KFfULKRrGREzAkDDJ8urSYD9KMJBVDZto/AxMz9o/p9b/PpA/tzjRFaSEt
	 9ZtuAklQJf/nfG8qK5CUSSWSEc1a5ILeV20Y6y4cfzItlaJR3yIFinIIX1x9hjxuWS
	 QKodkZWVaH5kBTA/LoX3m2+gq+jgAzaI7yahxjrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35662F8013C;
	Thu, 10 Mar 2022 18:14:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2703F80137; Thu, 10 Mar 2022 18:14:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58640F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 18:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58640F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fZKk/sTs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646932454; x=1678468454;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QSGfayL5lXyHSu0iviTfzWPDHyWvmfvpcMNWdYS+HOY=;
 b=fZKk/sTsQ/fhpEPNx1k04S5uT1rgFSo2k8vmEKpCPMx78t6BN0Y5E98h
 9Mjw0SDcn36V59ob5HhYnEaI8hs/A0xphVQpBj81QuM9ApNps3hR6aRcI
 3S+XEUZ2LbuTE1UDPHTX6Fae4CEfylBcmfvCAkvaz3wdCNjnEH3l1IECM
 0sY6OC0+PLcC/uDwEhzNO4TU6hnQA56btD8la0qufhJMCGjHuTr8WS4k+
 hhbzey2ud7a77AzPMWSLcMGhviPDZhMpvPfcgqj4AOZGyXCOjjWWhP3Hg
 onUEOhbprovSD2M59BaaetkVT2Up8EDQCkfCIuoQWcRnHp7DsDM4TI5Uo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="242756252"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="242756252"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 09:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; d="scan'208";a="510979220"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga002.jf.intel.com with ESMTP; 10 Mar 2022 09:11:44 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 09:11:43 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 09:11:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 10 Mar 2022 09:11:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 10 Mar 2022 09:11:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwed1DFQZrxyfkRmbd5nmUaF7fdwuyL6uVFXfZZSW/ytUfjPNjUujZjXMU5vmvEbZvmbqK/FAgtOu7z/Plc7MGuKwFyMmEhvplJxCOcrZ/ZQ/tGeEdJrZp3djEou9b4Hm34YPSSLgVFblb66HZxTfP00nSaBe+JBGjty2eC5t0NC/gwBJVN9GoX7mIHaCFcXGbQr+wVL3DsiIPQxXviG+lzpNeGuYl8sbULyqv1ZA0R7R3jLJxT86fM5alz9ZL9wxVt4kuqKrxEEoO8GIBHOxpg2xHJtadWXRjzcLaW/jvFkRDBweSXlILHNhKr5+JPZkgO4PEzSmpZuBPrK3J8TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WybRb03/s/4/J5HQwQTvsDmSLjbfh7eWAMA3vFrNYU8=;
 b=Y3ld1mNWkPXfkKKRpbXStuqOip0rFQ9VeF5jjmJrY63TieIMrkEJuT+zeFQ41arn7VqO238tUSQW5QzuOJSlmFR9+m7Csawnm99x0UAfZpKP/+zUVhrIW9Kayj2n7JHzP+bvJLE3w5K66m7ICCQJteu0hFPz1fAEk3U82SWEDU29BN+AAFUHQknD3O0/7jnUaDzO0aRPgSPjkXN5wSGofht09l6DQCgsSQkvL9uxh9AQ+SgrmAaL87dQri73mnYhB4JpUwVUcA86RuriuEu+Z0oNcE7h+Wwqu/wgnRM6CkMR3oyMWnX1Ph/34R85/S5F42NXVtg5MMvf+A2kgxGzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB3548.namprd11.prod.outlook.com
 (2603:10b6:5:143::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.18; Thu, 10 Mar
 2022 17:11:40 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.029; Thu, 10 Mar 2022
 17:11:40 +0000
Message-ID: <7e3f87d1-d50c-63a3-9e06-c6a38d3a4cb8@intel.com>
Date: Thu, 10 Mar 2022 18:11:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v4 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-12-cezary.rojewski@intel.com>
 <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <5e47e4dd-bef1-8c3c-ba28-d651fc2dae9a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::25) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7a00e57-90da-43b5-6201-08da02b90b1b
X-MS-TrafficTypeDiagnostic: DM6PR11MB3548:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB3548264290409774E42864F9E30B9@DM6PR11MB3548.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jUMYlKP/h/WysOGfN3/VXS4PWjgNZY3GxOTKrXsPbtcTtvvLHOf1kSbTGattruHoDVsiZfuJ7IB+lGplScuDsNbydbYBaThxEPOF32ltQLN0osD4rIEzq0AfMPD8YMo4TKfY6u/QErrl3w8wmMmemo1fN2o6jcwl7nOnrj+ySFOzYEOjOBhBmEhUVGP7DERXSAWmRMP2wn2MUxckRrwXK8QsmExOfe9o3svi+EYyDOfJ+TYkLDAV6nAWAiLGOn/Zg20k8oROLAvAf3ZxlUCXPqOPvxcFThEg6OlSWrLYrBlVVrLTuwqtrMBGCfwDu06XHK96bab144NeHw3GD6nLp6xOuWdw0s+HxHGtLNLVz6fIHUNXJ7EqomFfHXVlqlM0mzWdWwHkqKCexoE/htMDh6BS/Dy9jsQCgDs8RwGX+Qm/zsvL+Au7ouNG0uSCOuzJPVLPplcY4+pz3Et8bFC/srA/tvGYCpb76X8BluCnA6JNGYXBgMfRBpXVWmxNFHf6Q2fhc+tMMPR2TiYy3MSmx3s2kMhunsh3fiMU/fbvVmBASDFUcfszFyUWu1cGtBkWmvEPlzb3yHzCww/JdamRp63iT7F9KvfttYCjL3Gwa1eQVmcmU7lkN/36YuRwuLWbi207scXah6zSByFj9sw2av+jebuaBUghIgah+2wj4kwznRbGF5aZ5AL+5KdJ8dPKwESH9nUBVZqs3FY1PSfdKF31BtQYWh83CCEfc5pcOmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(2616005)(31686004)(186003)(8936002)(6506007)(82960400001)(38100700002)(86362001)(44832011)(6486002)(316002)(2906002)(6512007)(36756003)(4326008)(53546011)(4744005)(66476007)(66556008)(5660300002)(8676002)(66946007)(508600001)(7416002)(31696002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJQVVloKzFJaUFSZ2UyOXhRVkxQNFhtRDhOUVBMZEMwbDdEVjJtb3ZVaHVj?=
 =?utf-8?B?YkFFSVh3c21FZG5SUHpBZlR3ZkJPMWNCanY3dldtWHplM3hZNDBuNHhmZ3VT?=
 =?utf-8?B?TUIvSlIwR3hlTytBS2crOXpvdEJMaExxalJKOHVLSG9BZG1JRjMrcUFKbWJv?=
 =?utf-8?B?ZzlRZ1ExZ1dzVi82WHFLL2o2NHRXSkFXNVFzS1JmWUFCR05sUUVjdkNVTmh6?=
 =?utf-8?B?ZWw5dm0xc0p4S0NZb05lMFAvQS9EUHR6cHVrT1U1WnJZeVczVDNQN3FmMTVY?=
 =?utf-8?B?R3dGTXo0c05WZ3VueDBqZGxTb1JiUCs0UUlGZnk5MmVWTHg5U3lrVnNzZmI1?=
 =?utf-8?B?QXc1dUhaWTBTSTQ2eGhYbUV2NDVFZTVpNGwyNGl3dHlVaXVzUEJneGF5ZEIx?=
 =?utf-8?B?RnZDTW1WYjBJVFBEd0RPSlliWXpOQzV1UkovYW1NWWc1ZjNwTGRPUzR5V1Nr?=
 =?utf-8?B?enBRTlA0QXZxT0R5dU85MWhkT0dFN0d2enI2emZCcE9mQkRyU1VCVDRDay90?=
 =?utf-8?B?bFdSVTZkTmZIYUkxQWNLUGozNVM5U1V0ZElMcmZqQURFVHRPZ0phVy85WDF1?=
 =?utf-8?B?QnBsQXVnT0ppVnFHZnBGYmZNc3RiNVFjam10T3djViszazY1WE5FSkxCdmsv?=
 =?utf-8?B?bjNlVThMN1c2NnNrZEFFM05PRUxhZnZXMWJReFp0RCtwWUc1cjJFMnZYdTd3?=
 =?utf-8?B?QTlRaStjYzFQT2dOYzZTbDgremtJbWZETm50d3JrNTdPdVI0N2ZMUENFOFRS?=
 =?utf-8?B?VkJlTS9sdE9BbWhpczQzY08rUCtnL3JlNEFzZ2UrOFdRcjFFT2JHdXAvUldI?=
 =?utf-8?B?QkppdXlxemZTMFFRb1BXa1JYV00wK1JXYzNqcnFpdmdZejJDRU8vbkhReVNy?=
 =?utf-8?B?aVh2Z20yOXVDM20yS053cEVqa095d243NitvT05JcDdoL3hKbVFsTlpjTFhx?=
 =?utf-8?B?OWwwd2JnM3VmTmp4TWlZU0duU3Rtc3ljVDhveEdpT1QxUkRzZTJwSmsrOTNC?=
 =?utf-8?B?TGlmeHFqRWsvalZqT2JMSDYyTW9EeDVjcFAwTkd5dmRKYVdZVk1UdVhxKzdN?=
 =?utf-8?B?dkZWTjNUVW5tSHFnSUhGL3FUeFhWb0IrSSsxOTV1TWNFN09oM29tQU83TVF5?=
 =?utf-8?B?RG5qTmpRYlRwU3BiMkdiWEVyVWpMRW9waTMyekRraGJwUllPVXJOeTdqRlJO?=
 =?utf-8?B?eEd6QjBLZWI5RUhzR1c0T2RQVVYvcWFIczJIQWMwV0NHTFFFRHRWeC9sT2hU?=
 =?utf-8?B?M3pxV3RnVlhJZWp6d3dqa01ReTFrdGkvaWJZTFVSekxEd1J4UFFhQ0dsb3o0?=
 =?utf-8?B?ek5CQ3ZiRmltVEsyWTFvNjF3RHg3c0lpeDN1Z2VhU1lLYWhjOXBhUXQzRHpy?=
 =?utf-8?B?MUdWL1drdzY2TERDWWhkQW8vSDQycXdRQnd5SnptaFpaalVHZmFOQS9rSHFa?=
 =?utf-8?B?Ym83WGhtRVo1SEgvKzN1R3JSMGxCbXg0VUhPcnJpTXBtVWRNUUZNbWtzVmlr?=
 =?utf-8?B?OUJFTXFCWWc2dzFpRHg1SWJscEpoS2ZsMkZrQytZK0piTUIzbFFvVzRFbEd4?=
 =?utf-8?B?ZW1ITlBTZXNHWFhQckJlYzJGcWt2N2JySTA1UE9wNHpYaXJobm9TVU5DOGdE?=
 =?utf-8?B?R1M2Wlk4MjRidm14YzI4b2FwVWFQY3drVVZFWnNhMjZMSHFSaUF6SlFVTFdu?=
 =?utf-8?B?dER0QzhWYVprR0RwZzgxMVU2WUNrY0I3NDZUMm9nVVp4ZXRzcVVYMzd5YWla?=
 =?utf-8?B?Yjk5cGlsWFN3ZHM4aUNNeWtlaVMzMFZXeXdxbWQxUVgwNGFNaGUyQXRvWThP?=
 =?utf-8?B?dTAzWnJOQVVwUVVWWFZSVkZ4K0NSVTFQNlZxWmoyQ0ZzZnFpS1pwSnVPVHZC?=
 =?utf-8?B?ZHM5Zlo4MG81elgxL2tDVjZieUg4WkNxZUtPV09kT3RaK2dwck1mZ01YK1JE?=
 =?utf-8?B?RFZHZk8yS3F1VTJqV0hDbFZVQWpvRWxkY2g1c0c0RXk3c3dYbnRSMHAyRTRT?=
 =?utf-8?B?NnR1QUxtUHYvVHVvNkZnSXZjbloxSFBhSk9pWC9KakJiZmVOMitJWVI1c1d0?=
 =?utf-8?B?SlRlQTVXa0JZVkp2QnIzZVlUUi9wUzRZMW9NNmlMaE5jNFdpZWVrS1JzQnAw?=
 =?utf-8?B?OCswL0RWVm1vWnl4MHB2TmY3UFk4WXpnZVNDTzgyRTdSbW9TT28wbU9oZHd1?=
 =?utf-8?B?M0tUYjRnMmdYblcrdWNKeThnSHQrNklaa3hpWGFTWDlGWHZXMjZzcGVUM3kv?=
 =?utf-8?B?WGNucjRXQmhkaUVqVVZzZTdlQTlnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a00e57-90da-43b5-6201-08da02b90b1b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:11:40.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45dBjjtycTA/Xp97bpcqxfTcwFhTXwjfEgvv7pkb7Ebl536v4GyLRpx75KM8fYZ0iX3BZ1VBoAKp5tb5l1qy6UvzlSNKHa62T6UJDJTCtsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3548
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-09 11:36 PM, Pierre-Louis Bossart wrote:
> I am running out of time and will resume this review next week.

Hello,

I don't believe any of the comments provided are a strong reason for 
re-send. Given that last revisions were mostly related to addressing 
comments, rewords and explaining stuff, series is in good shape and 
ready for merge. As I already stated, team continues to work on the 
subject and there are more patch-series to come.


Regards,
Czarek
