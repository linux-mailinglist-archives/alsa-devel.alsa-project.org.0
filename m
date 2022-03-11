Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD924D64CF
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:41:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CAA118FC;
	Fri, 11 Mar 2022 16:40:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CAA118FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647013287;
	bh=aluRv0hamXXuVY7zQAjq4mFepzMn6/XCFdpJKlWieT4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S9RXEnQuGUXILYLe1eXq4RkMo88zoOBWI2SgUZ95PDq1/JmaHO+v1t2NO1zUM9OS/
	 6SiXu4m++BXOIQfTgRsbk+RNZgqd+YREiLwdO1Nmd0s4mf76Y00L+4mHcSXiWoHevF
	 fZFRBZLH5fA7+aA5ezGnvbkrxntihqFRnSZOo07M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B42F80238;
	Fri, 11 Mar 2022 16:40:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 825F7F801D8; Fri, 11 Mar 2022 16:40:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D3F3F800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D3F3F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dk+yMfHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647013216; x=1678549216;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aluRv0hamXXuVY7zQAjq4mFepzMn6/XCFdpJKlWieT4=;
 b=Dk+yMfHRch2g9GHe3/jOiWFs6xZTRkGZrUWVQvgQ9wWIU7E7eeGx9jIE
 uhqoOwLA8u/mdarsLV39dDCAePKW1b6tOTdL5hBvKu27ftEuFbwqoBrqI
 PTY3A9yqls3Biyc3QWqaxpAR8P3NoqyjmUvXEXhkYYe1rflP9hWsbpQOZ
 jBNHfAPJIvEHIXl9e8PkuSkEysn08iyR6LEzxqVDarbpO+686YIMLvir1
 WRvL9Ddbkvm/9hnIwb9JVs+qcaARmpAoZKBsCDyM5qgSCWvWpjyzf+1ll
 6utgAR31ZWhLHKuT0KNQdFrlU+WDaZDkpH1t2i6cMLBpD/+0uKK7S0EMF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255327655"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="255327655"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="643011488"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2022 07:40:11 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 11 Mar 2022 07:40:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 11 Mar 2022 07:40:10 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 11 Mar 2022 07:40:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ui5CckK2g3+vgaQA2OUa/fbQBlwzbfdTcMT5FRdFHi8hkiUn4Ywe3NRzhtYkVjbBlVUBOTmx5Bg6vjPUcyrCkGN/5dF1el+G2MsUz4ngnOIfZ6LQS36wmYGNBcRhbty+Jnseek0+X3j8WiPtihO4oZwICn8f1SJgkUAA01lBiAkd7pYb7VN4Y/CCqBuekqqXE2mWDxFF72udJGekNWoTUVCX8NH5c5Ahbk+/YfpwSib6/67nw4fU0PRDTofBWurW8qfxITA4PXxkl6BnF74vz/5bl0Z5hImmhXB+Pri1vBDBfJyfrR86inCbvgykhF4cBHT+mZ609mGWDNfjFsu4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtB/JNhdreC23DDnhaPbvAe/aRooKEZWT/e7vsV3LaU=;
 b=mN45/Mw7iAp9Ek+DE1iwJrBJ8jqEXLC7bVmPpFMQhn4v11DF9y0CvbwUjAYNyLdKEZIN557Iq//U23zwLvAxlctCpD+jcRNyn/6CwVzilFHlAMZmTPjPD5OMitaEcALpBotCzjQ7/4HT3Y4zjaz31McYTpak7FAQUVT6cpF4S5iFcz9cCmWMfwO5srZ5NNnHGtzCT4DcFe4WulRMsIj69w+q6rZAK8uzxuIr25e7RqXFtkvPX4OaZ/g+Gwii8+nhWMHYaAc8C2GewybIGS48WIGMg9Zbr8zzdxDnTERoRH5tEwlNOIhppn7XHSmU6fer+boj2JZV0lHtTopgrD12CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1690.namprd11.prod.outlook.com
 (2603:10b6:3:15::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Fri, 11 Mar
 2022 15:40:09 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.030; Fri, 11 Mar 2022
 15:40:09 +0000
Message-ID: <9e495c5e-e8c1-8111-1526-3354e2cb59e1@intel.com>
Date: Fri, 11 Mar 2022 16:40:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH v4 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220309204029.89040-1-cezary.rojewski@intel.com>
 <20220309204029.89040-5-cezary.rojewski@intel.com>
 <e0f4bc39-91e6-aead-a6c4-90251298d37d@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <e0f4bc39-91e6-aead-a6c4-90251298d37d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0089.eurprd04.prod.outlook.com
 (2603:10a6:20b:50e::13) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f31f94-40af-4656-51a8-08da03756c29
X-MS-TrafficTypeDiagnostic: DM5PR11MB1690:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1690B5771FF306A5C4750035E30C9@DM5PR11MB1690.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGMz8qMlQZzWI0FRNu7wJBA4YETnX8lbqCC1T6OcWGanLxTT3TvCxV7Y5POvWDaQ/fUUiXV51GZ6snVErz/HgzwDVEJevANEYh81rj0UGJ7KlKIZeLpJmgZ5txx2lKVEfqy9h736Mx8b2iFaU6+tEw19O8yJZqzf9xVLohFyhIhyzpQPZzKRVV1QdpQz18sh7N6pb3FkLUPVRsv6nrfd/5S2bRucheMiJPPZDQLRyUVZj2Dz00Itr6om0q1BiuBE4H2Eaxmx1UC0uvOlQ4d5YD7kUSK/u5wEvYb4YtxChmdHV8wX7STle6+HZ3C4RfIYw0gsT1QXqpb0tBe9nPZ3hU5QQhwXdh06RvYkWWSK4iKzYaVbdZMKLkIB1UaItcPg+KJYPWA3abR72uD2nWdu0q5bapxyhOSLdJtWmXQy6nTjJ16AArikUjaDZMvHgSZhty+mStr40HDH1TRUNHyqPGefelbtlV6dluA6boa/oTdzLczYUuLXDu/xAJHzCmpXDikodxHqkCzHn2pq3phm14zOhWwl+xl49YcBjKcYnGRdqHRQ2iKWWrCdvbT1kV80P3SlpzgZPffHWWZ0g8wPoc1DFY6JAQyZV4fiwN4JcdfecEZjsFmcvk4GIsq0WEpqC8ItFjw4mrcl9YLkE026hhoantLcCql/PiQm2+HpSAIOBHHvrBFu/ptkz1Iq5XHbgPLCEYokcM+FiRjULf1JwCQ7iiWxQBuX8dWn12Qr09WfRa3l+a9kN3LLXfDsrwsz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(53546011)(2616005)(36756003)(5660300002)(186003)(83380400001)(6666004)(6506007)(26005)(508600001)(6512007)(66946007)(66476007)(82960400001)(316002)(4326008)(8676002)(66556008)(31696002)(86362001)(6486002)(31686004)(44832011)(8936002)(7416002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU9kZGswbGRyV0RhcjZBRjBtbXFvKzduTUpIUmtMclc3SzVIbUpDUzVPbGgx?=
 =?utf-8?B?dGJIY1BjNU1nNC9hdE40Q0tNb3FFblFrLzNGWTRNTUNLY0Rhb3lPWVEveXdU?=
 =?utf-8?B?aFhQZ1gzcDh6VVBDUTB0b2U3US9ITFBCNGl0Y0dOaG1mQkp6dk0xVCszVnla?=
 =?utf-8?B?OCtqT3I2Uk9qN2F2V3RTdEtCUmc5WUM0NG1DWTMrdVhUMC90Vnl1UWJydC9r?=
 =?utf-8?B?cEExYnRJZGlBdHNMQ09Menk2VU04YmNLLzlWOWNsb0VXVlFNQUxWekoyb3d4?=
 =?utf-8?B?QkRFVkJXM1dNVkszOW5OVUxvQkt3SHVlZ0ZWOVFPYThjSEVMZHNDSTRySTc2?=
 =?utf-8?B?a0RlanhXTHJhYTBLMHdidEdZMjFtWkVjdFFDelR4TmttbGJYYS9VZGZSTmJv?=
 =?utf-8?B?MjlZd2h0bjV1R3dNWTQ2cjgzU2VoYjJZUUZKWXJ6WEZRdUpaNkR3azVZT2V4?=
 =?utf-8?B?RzFLQzVyTHZ4UTVFbVhzUEJQRnV0WWhud2VJM0VCamFxWm9XWFp0bnd2VThM?=
 =?utf-8?B?WE1ha20vdElUN3dNRlExdSsrYmUwTGYwOXBoRVlkK2RONU5kL2RVM2dQcWJj?=
 =?utf-8?B?RlJmRHg1S1JEdGhRdGtZZS9ydEdrMzFkWW1jUEtEOHlhL1N5NHhjZFkzV2Ix?=
 =?utf-8?B?bms5Si9OU244MmdPTitCVXJVTFJoSVN4cVRQalVxY2NwUkpHaUNCMFlMcDdY?=
 =?utf-8?B?dUZDY0hqK1pSMFl3NkdJVjBxYjA4K3RqTTcxMjlkQzAwZ3JxNFRDZkM2RDJQ?=
 =?utf-8?B?S2F0MDB3WTdHVWtScDVKaVZIMDF6NlJYdUgrYWw1YWdPUE5HbGloZWF0Q3ZT?=
 =?utf-8?B?T1FyZGh2YWtJYys2WTE4azFwR3VMc2VpenYyUENiZUtPRFVlaWRaemlKaWxL?=
 =?utf-8?B?ZlBFWmUzU0E2SDc4ZFQyTWkreHZHd0tnMGF4SEJqNU9LUnVwOVN0VC81KzJX?=
 =?utf-8?B?eHBPdWZMbUZjUE90dXA4cWxsY2hSYmU4YmdWQ2g1dlUyak11OG91YXdoNmtk?=
 =?utf-8?B?K1UwUktkRXQ1c1lPME5oRWdyc1B5Z1MrNndEbnVIT0IwTlRXMXY4alZsSFZK?=
 =?utf-8?B?SWhNcytTQVBCRGM4b25ad2xheDFXWEpzQUFjSVFickt6R2VFaWY2Rm5WakFQ?=
 =?utf-8?B?Q1pINzBBWkd3dzYrZFlyTmxLN091NWN2RlFDTEdzNENDS0tpSi9ueEpmY0ha?=
 =?utf-8?B?aGQ5RTI3eHJqSnlxTzhtN01qWHFydGFyMmdWVzY5TXltZXZFNVY3ZXBpNlBV?=
 =?utf-8?B?U25xWkVOWndDNzdFT2xjb2ZTSzh3MkVsNmVQNFM1aEZNSTd5dFZsaURNdi9h?=
 =?utf-8?B?TFlFRW1MTTV5ZTRUY21zM3lNSS9XRGNsdXJyWHU4T2E5eFR4UXJoNTNQZVor?=
 =?utf-8?B?bVJBU21Sd3c0Y2hTM0xUbnpDUGViM0RPelFNckRJajdYWC9WRzUwbjM4NTVG?=
 =?utf-8?B?dUJ6cmNiaTFlMWFYM0h6UldhNngzaWQvNXFnSGgwWkl6MHZXc2JiVU1hT3hq?=
 =?utf-8?B?eWVUazFYNExZaStMcGxHU1dnNGZQYnJ5NFNrNlV6eUs5MnhPc0JOb0FtTDkv?=
 =?utf-8?B?NkZJRTMzTXhza2Q5Q3UwbnpMLzlQZDVvWko1MFQwUU05RzlkRzFXdkJtZDBi?=
 =?utf-8?B?R3F0eWhNdG5NaGdQNWNqRFhrOFhCOTIwM1kxQTdJOUFoVTgva1dBUDlFT2JM?=
 =?utf-8?B?d3hjT0FyWi9RZGZQV2pyY1JiZkdDOTIyN2dmOE1PcHlodnhXUGkvcUxJcW1k?=
 =?utf-8?B?TjJCSmVDTlhCaVZ5RTVDZUdQenNOY05WbmJtcWR6SU1RWGxVakN3MVVPN20y?=
 =?utf-8?B?SFlWdU1ORkw0QkgyK2pBOHJqVHI4N0wwcTdSbkZaNTBxUDZja0VlTGhIbHpC?=
 =?utf-8?B?K3AyZGw1d2kvL1ZNb2JtVzljKzNpc29Oa3g3cW5BRm9LYmQ5OHRrc3VXSFhC?=
 =?utf-8?B?SGNVQ1djSFU4K1UzcHNFWEpvWVlDRkVYQitJcjJycS9PR3NzYVMydVhlRlha?=
 =?utf-8?B?eit2TGw3Tnd3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f31f94-40af-4656-51a8-08da03756c29
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:40:09.0487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uL7C0FRq/63ZEFSegBowmHKjns+SLrUI6pa+7znKszkPoF7IC95C4c39N+FpxoOBxv1PO5hdW4rlMqkCNo3vO7Gbvcfsev943kCZCFx04g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1690
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

On 2022-03-09 11:10 PM, Pierre-Louis Bossart wrote:
> 
>> +/*
>> + * struct avs_dsp_ops - Platform-specific DSP operations
>> + *
>> + * @power: Power on or off DSP cores
>> + * @reset: Enter or exit reset state on DSP cores
>> + * @stall: Stall or run DSP cores
> 
> nit-pick: the description sounds like boolean states. add "callback to"


The title i.e. struct's description reads: *DSP operations*. And thus I 
believe the *DSP operation* prefix applies to everything below 
implicitly. Otherwise we have spam of: "A callback to do <this and that>".

>> + * @irq_handler: Top half of IPC servicing
>> + * @irq_thread: Bottom half of IPC servicing
>> + * @int_control: Enable or disable IPC interrupts
> 
> callback to ...


Ditto.

>> + */
>>   struct avs_dsp_ops {
>>       int (* const power)(struct avs_dev *, u32, bool);
>>       int (* const reset)(struct avs_dev *, u32, bool);
>>       int (* const stall)(struct avs_dev *, u32, bool);
>> +    irqreturn_t (* const irq_handler)(int, void *);
>> +    irqreturn_t (* const irq_thread)(int, void *);
>> +    void (* const int_control)(struct avs_dev *, bool);
>>   };
> 
>> +/*
>> + * struct avs_ipc - DSP IPC context
>> + *
>> + * @dev: PCI device
>> + * @rx: Reply message cache
> 
> cache? I find this confusing, what are you trying to say here?


The goal of that member is to reduce amount of memory allocations needed 
during message processing. That's why it's called cache.

>> + * @default_timeout_ms: default message timeout in MS
>> + * @ready: whether firmware is ready and communication is open
>> + * @rx_completed: whether RX for previously sent TX has been received
>> + * @rx_lock: for serializating manipulation of rx_* fields
> 
> typo: serializing


Ack.

>> + * @msg_lock: for synchronizing request handling
>> + * @done_completion: DONE-part of IPC i.e. ROM and ACKs from FW
>> + * @busy_completion: BUSY-part of IPC i.e. receiving responses from FW
>> + */
>> +struct avs_ipc {
>> +    struct device *dev;
>> +
>> +    struct avs_ipc_msg rx;
>> +    u32 default_timeout_ms;
>> +    bool ready;
>> +
>> +    bool rx_completed;
>> +    spinlock_t rx_lock;
>> +    struct mutex msg_mutex;
>> +    struct completion done_completion;
>> +    struct completion busy_completion;
>> +};
>> +
>> +#define AVS_EIPC    EREMOTEIO
> 
> I don't recall if I already mentioned this but I don't see the need for 
> an intermediate redefinition of a Linux error code.


Hmm.. I've already explained that code makes use of this macro to 
differentiate between IPC protocol errors and *other* errors. Otherwise, 
if code gets changed, every single usage -EREMOTEIO will need to be 
addressed, not just AVS_EIPC declaration.

>> +/*
>> + * IPC handlers may return positive value (firmware error code) what 
>> denotes
>> + * successful HOST <-> DSP communication yet failure to process 
>> specific request.
>> + *
>> + * Below macro converts returned value to linux kernel error code.
>> + * All IPC callers MUST use it as soon as firmware error code is 
>> consumed.
>> + */
>> +#define AVS_IPC_RET(ret) \
>> +    (((ret) <= 0) ? (ret) : -AVS_EIPC)
>> +
>> +static inline void avs_ipc_err(struct avs_dev *adev, struct 
>> avs_ipc_msg *tx,
>> +                   const char *name, int error)
>> +{
>> +    /*
>> +     * If IPC channel is blocked e.g.: due to ongoing recovery,
>> +     * -EPERM error code is expected and thus it's not an actual error.
>> +     */
>> +    if (error == -EPERM)
>> +        dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
> 
> %# adds the 0x for you.
> 
>> +            tx->glb.primary, tx->glb.ext.val, error);
>> +    else
>> +        dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
>> +            tx->glb.primary, tx->glb.ext.val, error);
>> +}
> 
>> +static void avs_dsp_process_notification(struct avs_dev *adev, u64 
>> header)
>> +{
>> +    struct avs_notify_mod_data mod_data;
>> +    union avs_notify_msg msg = AVS_MSG(header);
>> +    size_t data_size = 0;
>> +    void *data = NULL;
>> +
>> +    /* Ignore spurious notifications until handshake is established. */
> 
> there's no handshake here, just an initial notification after which the 
> IPC protocol can start?


There is no *real* handshake yes, but the FW_READY is sent as a response 
to us (the driver) programming ADSP cores and loading firmware.


Regards,
Czarek
