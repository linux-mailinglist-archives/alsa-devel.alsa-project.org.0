Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41354D050F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:14:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 298081732;
	Mon,  7 Mar 2022 18:13:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 298081732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646673275;
	bh=jT92yvlkUGkGXU0MZhlDM6UKGOEzQvD/DopddGSVK+4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DXwHxn8A5yz08BMW6+tHcOO/I1TgKPM8fB9SDG/7aNK/TZ1JkI+T/3rkPEtSug6dY
	 o1Dl6wl+ornoC1Z0nkgbTzy2Zeo135hS29BO2xmOgcFJ2cjhRG5CTyU2wgwswjwVYH
	 25sKHZTaBktt+ramP36xID5GRkt7B6xQgLQ4c0s4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9372BF80124;
	Mon,  7 Mar 2022 18:13:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCC41F8013F; Mon,  7 Mar 2022 18:13:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12E30F80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 18:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12E30F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a+8MzGBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646673205; x=1678209205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jT92yvlkUGkGXU0MZhlDM6UKGOEzQvD/DopddGSVK+4=;
 b=a+8MzGBkpmyrKrcqW4AmlrKhl2pe9PvhQMdU41cOkhL8AmAFolDi3CM/
 CXm2FgegiIApiCE9uOWqV9Vt3y0VYZqGzEisqW0w5c0Kx6viXoTU6XcWl
 Wz3HMKh0GoXK4gkHMJsQTOUmkc1FV3hOE347xoO/ESIvbXL4Z+vwKopFK
 UNpMiUct5TT/ngshrwvWvzBGAx7sOKcW+UvpvBL5GTSivbikif2WFwknD
 PcAxUQr6wqL86dOBfhN9NOhpc5TF0zzSLM7I4N5RGES81YQvbxlL4lMMn
 QFcYwm+fwqZUx7rvQf7xHcbbkKdBTXYh0vatFeFZ4UX8azeAFMkviDkMr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="252023741"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="252023741"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:13:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643325279"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 07 Mar 2022 09:13:20 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 09:13:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 09:13:19 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 09:13:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyScxOI8ibyiZZvBzoGPMSUEia48ykJJSM3VOh4jCGWuJPb+fXvjkOwPIVy1G7tBubEYag4gZdtWBNuGfBYg8TQ7b+zH0kEHllcPpD5DMpk0lb8ZqdV29JsudHS4kCHeF6E96LLBnNhAeQ0dH8WhIqoZyA4ywdFrzw3Uvvkb8KqtVKbsZ8w1RnEseXYq6AoWc7Y+y7FxO6m6XZ0fuB7dZ6bjhVTeVbiMnLtQzZplCFaBfNEFfCwbtGYMSI4J/HDFYC7m3eAAUu+3B74VSwaGTKlszil4T/kBHeAY5ChShlQKqRzFGp9AXmj8eXWjQFAFZHlbVGHSfgYRtap6haWGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5eA3lt6EnnM74X0KxvXpk/aOeh7WA4exiNWOICwhQU=;
 b=L3YGUsqdIq2oG+0jkFdFreEtchxcSm37TCs6uHorO0+lw93fDCBXEjNld4cHqrVhDCsJLeqFFUJ+euVKLfNmneU68pu2kBBCfwNGQitQivDS2PSdutP2hQnnliZv6FHpXu2S0p0LxCkOwB5a33OkoZ0BNO8oZ1ThhHlnAQDbVy68h1UOx1nuYbHD5KYRz3rnOAlOPyIpqH57Jqc436Ocn3hmwhqVBNjiB0XFlNW2Sn5eJo4IDuwU7P/OhdDqIKBlYRKIGiWRj6/DQoQW81fL3EHrhlRGcQuk+hnOjcdsByMZLeGE0UsSj+me7+XHn7xm/pgECYYTTvs2zUhsH0Fkjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM4PR11MB5405.namprd11.prod.outlook.com
 (2603:10b6:5:394::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 17:13:18 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 17:13:17 +0000
Message-ID: <f70be289-ee9c-51b5-4003-7bc567e87a54@intel.com>
Date: Mon, 7 Mar 2022 18:13:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
 <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
 <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a571f334944f3ae7762068572003299c34fd187a.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR07CA0033.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::21) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eecb8a32-6cda-4145-0f87-08da005dc5b7
X-MS-TrafficTypeDiagnostic: DM4PR11MB5405:EE_
X-Microsoft-Antispam-PRVS: <DM4PR11MB54057D00C9C8FEB9127BD38CE3089@DM4PR11MB5405.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOwHzdoIOvpkYuiAI4G2mKIDYhi41CeqhbSLr5ZRtvZYOy3mDNgxXIosU+t6dEuJM/IPhmJBI9Jnt9XSssIJaEsVy4NL53yYGohlFkqJlj89mnAfAg8npww3QBvftc62afzbesKIXCKpaRVh4TheW5yo7M2oZGqtsFL8aAQuiTL/wRXw5VGOBEogeZvCFM1smSlE2oZOPusuyYEtTmDKw7YKRr3czJ1iSAlrN/a90gYOFFJvnGdrqVw5t/V+Ls+m6EI/jrE3GVjm+uOtBhZmsFmHu8QcfsdY/13CmHtC8m6lDDIYOUnhfaeP3V26q+n92IIWtH2fm5VOxk1rlfEYZh4C+VmQf9TqOytasjBViSk1SYaG8EjLFkPlrp+X+knfuI0FVC96mQnIGNR6sFPZTxT6AsnqsSAq+wSBkp5OZQ2y+9z0EO8OpLJc850OsIL8sUUQBin4G/4zkG4/UG4b8VnJZg8MdqO0G6MsF8q3KBnYHh1o1oeP2abnhsxl4L69k4FyzHKt+iO07avyQZxe1LMNhJqC2rYIojfdLD6jrQt7x5wh1IkiN4lXe2Co+fazyU3JRo1f7P/aM0/r4vQxfZOIpjXx3CbU0bCzEr2FSrY//NcqHZHtgezEA2ENyZ94jn7EBU/aZNfi6FFychoZeII2IIeGhuRu+ojZ09Miov+94HJIcOPY2q2pJjYSy1Purtw+M01FMmGi5Ljbysf+TwJEQ6bImvetfWlgbITabss=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7416002)(5660300002)(31686004)(66946007)(8676002)(4326008)(66556008)(66476007)(38100700002)(8936002)(316002)(36756003)(44832011)(2906002)(2616005)(186003)(6512007)(53546011)(86362001)(6486002)(26005)(31696002)(6666004)(508600001)(83380400001)(82960400001)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFYxNUhTWkVSM2FVcnlTQVFLcHJrTDhxdmkxeFRFQTJ2SklIc2pEazFyb0w0?=
 =?utf-8?B?KzNCN2krVTJaVC9laTBwc0RDSmxidU45cFZ0cnhYUmdUakZEYk9lL2RaclpN?=
 =?utf-8?B?dkhPWXg5L0JwSmdDbnlmeHVNTzNDUTloQ090K0NFUlpmSFoybkMrT0xyN0lG?=
 =?utf-8?B?VVdmOUsyVTNZUFRXYk04WElWdkxqR1RwOFd0VUhhZWdSWUxoMFFzRkJoMkx3?=
 =?utf-8?B?S0RiQzV5Uk5nTEdlVENEL1BRVXBPdGRHTmh5SkJBNDBzazlscDBJc1pPaGMy?=
 =?utf-8?B?ZEtPOXg5cVBQWEhGcnlLSVljUkNyZjVPOEsrd3FwNUZ3VCt0NDRTR2ZhZitz?=
 =?utf-8?B?eE4xVDdUUm5WNGV1eTVaKzF0Rmswblh2MnZzbXZKQmhleFhOenFOQUZmNDhq?=
 =?utf-8?B?MUl6RWdkM0pTZVdYN1NuM3UyNkFBNGdXaFlhUEt0ZmcwcjVwWUFhZXh1cm5R?=
 =?utf-8?B?QXM0NGorUTFNSHo1MmgyQVAvYSs1LzZBNDFJZzc3SnVCVTk2UXoxMzlQTjFj?=
 =?utf-8?B?YXZRWW5JNVVVWXR0RVdNY1NHcEVIWW5MbDhaV0toRGZVVGN3VWpqanRhVzZX?=
 =?utf-8?B?N1RmTzRTa2IzWlpRMDJFbHpLV1RwYzgwYW5mOGVvNDdONVFQZHNYZHhGcWRZ?=
 =?utf-8?B?TVFFM2ZJTENuNVJBMGNqemhHTnByYXZMZ0syVndlUXBvaTFINHVQSnJnRk1Z?=
 =?utf-8?B?VVk3U2M0WXNUYWZvNjltdnd1UmUrYUFlMEwwaWRnQkJPSWtGVUdyTkpQaWtH?=
 =?utf-8?B?Z1owRnUxd2NKN0NoeEVra2F1RkIrUjRhYUxsNHVpcm1mamVjVDBHdFk2NllB?=
 =?utf-8?B?UjVFU3NOc0laYnptV1plQTFpNzM1WUprVDd0ZzBOekFQSGFoRXpTdndEbEZO?=
 =?utf-8?B?WjI3VjlYVGZBUVY5STB3bUlGaTdzZXF3YW1wNmloZ2pNZEllNXJ2NWRQMGxm?=
 =?utf-8?B?ejFwQlBMOFAycGhKVDk2Yit0cW9RaVkrWWx2RzZpMStqaEtYb0NZWXlJVnBL?=
 =?utf-8?B?c2xIeHVuL3NsSS9kbFp2RlZ5VTJyMlBreElLcU03dkdGT1lNK2RpUXp0dUtz?=
 =?utf-8?B?Zm1DdE8waE11TEROUWN3ejA5eitURWV5WkVxTGgyTy9MNjNvcEd3UTl1by9q?=
 =?utf-8?B?K0lvcjBSaDkvRXRzZVh5am12YWQvWmNUWUNzbElBVkQ1UWh1Z3R5M2xyZ0di?=
 =?utf-8?B?TmF0Q0JKNWExdFNCRldPVy9Ub3htSW5lSHZJRFFRWkd1UkFBcUQ4WmJaVmxu?=
 =?utf-8?B?c3lWOG4rREpLZThZNFhCS25kVk43OW95d1MvcU5EdzVKWTJhRE50OEx3TXlM?=
 =?utf-8?B?YzBLd0pkTnJjTHQ2c2RCa05uTVdVWFZiWXZOcFN1eFU0bkJyVlBJdU1jK2Ru?=
 =?utf-8?B?eVE1WTd1Z2JsNHhURlZKQStaVm1xN25zREdKb3BEajVURFRlakNnTWFrUUgw?=
 =?utf-8?B?cVNUWlFFTFhqMXRFSXpjY3FFV0tZQlZXdHZVMmgxUVRGdEJXWkcrR3NsSnJO?=
 =?utf-8?B?UUVHelFmS0JjdExQQ0tOeG91VjBjNFdWTjV0TjhkL216ak9PbzBLeUx0dnZw?=
 =?utf-8?B?NDZlcGZMWUhvWmxYTnNYSkRsNUVNcGxhTTJZc1RKVFZkWHNOUDQzUzRsekVV?=
 =?utf-8?B?TDU3RlFZUm41SXBtK0p0NTFNeUFDMi8rT1BYMC9nd2o5RXJOQ0wxY3VUV0E5?=
 =?utf-8?B?anBIMHlqRi9QQXpGUlZ2Y1hJdTUzNkY5ZHZMWG53N1BKakdzSTZMbHBwYmZw?=
 =?utf-8?B?OFg2bXlOQUpzK2dVN1YxSjdVcHJ0Q1NzK0lKKzR4RDVMWjdFdFhwMmozZmFw?=
 =?utf-8?B?U05FVXJZeW84anlZSGhHajA0aVpjV2tIa2ZlVXFhN0Nyb2taQWx3VTh4QXRL?=
 =?utf-8?B?OVdaYnN0RW5DbVovRDJzYmlwNmVlUk5QbXloMVpmaWkyVWZRTy9RZDhOc2dv?=
 =?utf-8?B?bXBFTGlhd3R3ejd4Y3BUQmI2dGxYdkZkR0pKZWFXaHBTUFBmUnpaSDRoN1Ev?=
 =?utf-8?B?em11aEQ1VUc0WGFlUGkyVGw4eW40RGlBNnR1cTV3L1N5Vk0vQTQzcllkMS9j?=
 =?utf-8?B?NDBUdUUwYjgxZkJJbGtkYytXNi9EaGR2NzE0c1F4SlZPTCtNdnlOTml0WWZ3?=
 =?utf-8?B?QWZ0MkFCS0hYR1BpSjQrdXVTZDdQQmwrUHlYQzRjN1FhQ21hdHBTdGNUeDJt?=
 =?utf-8?B?MHkya3ByRy9qbTE1NDRHdENDckUzRDlsTjRGMVZMOHlPRVh3a2podFF4WXVM?=
 =?utf-8?Q?n92Lp61jIEzcbqV9Q+dAPF+J8zNHEZVmz12pP/o3tk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eecb8a32-6cda-4145-0f87-08da005dc5b7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 17:13:17.8382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxcvedXNnn9ZBQ4QHwveRVQzbUWFmBJhMERxf8gYIMff6n+49X+ZR/BL+iWT2WTmTda7yYoO8wsn2HphFOoyzdPG+CgtME+uJxCL2Rb8u74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5405
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-07 5:46 PM, Ranjani Sridharan wrote:
>>>> + * @modres_mutex: For synchronizing any @mods_info updates
>>> Is this mutex really necessary? Can you please elaborate under what
>>> circumstances your will have parallel module updates?
>>
>>
>>
>>
>> Yes, we believe modres_mutex is necessary. All information regarding
>>
>> modules exposed by the firmware are stored within ->mods_info cache.
>>
>>
>>
>> That's just a snapshot though. When a new library gets loaded, new
>>
>> modules may be available for use and so the driver updates the
>>
>> ->mods_info cache to have the latest snapshot. As information found
>>
>> there is used when streaming (e.g.: instantiating modules), we enter
>> a
>>
>> scenario when multiple threads could be reading/updating the
>> ->mods_info
>>
>> at once. To prevent any unwanted behavior, mutex has been added.
> This is the part that's hard to follow without seeing the actual code
> where this new library is loaded. When does a libray get loaded? When
> you start streaming and you realize that the stream requires a module
> that is not built into the base FW? Can this be done during topology
> loading instead?

But that's already done during topology load! If there is no topology 
telling the driver: "hey, load this lib for me!", nothing gets loaded 
regardless of how your /lib/firmware looks like. Libraries get loaded 
during soc-component's (platform component) ->probe(). This is place 
where snd_soc_tplg_component_load() is called.

However, if platform has no IMR capability, driver has to re-load 
libraries for all platform components of bound sound cards on every 
pm_runtime_resume().


Regards,
Czarek
