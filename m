Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 804014D0540
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 18:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 098F3173B;
	Mon,  7 Mar 2022 18:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 098F3173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646674198;
	bh=Xxu/KdQsKinK7jI68VbYrjnWYKN2Ug+N2oLvW2Na4Zk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uikoBhKt/huxiVRdrJBnw/YKfzQ6NJt7ZDOUueJtsFHwlxSZrrQexc3KTXws8K60Z
	 RPRd2f3Vv/eeZtHUhVnEQGhhkydAdqXmQBTFa1fJA6MEqVkdgEmT4GGCpSBkwcga5O
	 f0sHxSYuKDLXb/eW5WBbnArRfvKJ9qaonceKTTLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBBF5F80517;
	Mon,  7 Mar 2022 18:28:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 996EEF80431; Mon,  7 Mar 2022 18:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DEC1F80431
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 18:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DEC1F80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XXXrBz9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646674132; x=1678210132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xxu/KdQsKinK7jI68VbYrjnWYKN2Ug+N2oLvW2Na4Zk=;
 b=XXXrBz9sEgQqPlRj/5U3a33WC2MEa8sC+wg9NjTkdf9y8+pAbnLrp32o
 fEqm8Cp5C7AMhACsTOJ6oLfUwTxFFoDD7nvTE/X4c+8Csz6KZpNuE4ZGE
 Z0PQTM2TWC7pkHpxIwo/aDD2/taEadDA3+CvFQxmmhYW0uy+nJdUJSOsB
 /gex/8sy1JEfrM+C2G0qdrqsTBfTepONC5b2Ao6vEI0+/0nzU/PbbDu/J
 RL61sFtYisVAXZyYW8+EnNo3Tp16jGquSVokg9Y93bS+gQpOQwxB59d8h
 R0DIo39naCI1l9eZZND8p7zEoNBmRvV7M0auZNXvDBr2Fo+Tberholpzy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234407125"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="234407125"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="711188696"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga005.jf.intel.com with ESMTP; 07 Mar 2022 09:28:45 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 09:28:45 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 09:28:44 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 09:28:44 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 09:28:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1yLbDHFNu4ODY/d4SaVYwgm4P+RRTyjLk4nzSG6SZnw8PGwOh3kAnClo9BQgdCphQ3G5bOkzCj7cpjIIUY0oNMI+Q/TbIB3UNlo0wdgEvS3mD7LuJKnX45c1Cqb+b68aeGzb9Aq58TNGDkbP4PCSd9BJoObQkrCC33t/lHXmYivkILESQPWCClhEbTFErMGRtuFTl/2J6B0MP3VKBdsGm6XLmfBnNKB79MVOOHILXp6NF4bW198Q4rmnTva6oAmeoIcb62sVctyfnCbT8opJ2iQegC42jQaqPz1b9AxB4vjir3BeT3toaZ8h7bQG29wRtV8w81bhzgiypSCFRsjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAxI8zVFWuuAPQVacqRjB5C1uaw261JEIUUW13IFTPw=;
 b=jJPg2ZV8/4jyw99FOQbz2GpWZCWyujVE/XPhhHzWWh1g9BdGmZF5kTCCzmUDOxuO6hlfTw+KnBcj+g9VFMnR921gO6IES3tb7KLbJWLBGgvt1wXAnPX4BkSiq2C5IrHEngvLEU5VgO+dWaboqQkEdbEd+toh/Im/VKi589lI5HgKKRiDrXr+hQIr7i6qwNVmjx3zLkkl0aZ+4lx/Euo4bKL0CxuSQHDeete24LvX4gN7JATYEtiDeRlCS/Pl9Nnzm7O8tZnj0Q4VQCE7luOix9VwwBU4csw44QdbiB/alEatOZO7pCfrhczcLTudELXw3/WkTKTRD7hOBEY8WYwXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB0033.namprd11.prod.outlook.com
 (2603:10b6:405:63::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.20; Mon, 7 Mar
 2022 17:28:42 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 17:28:41 +0000
Message-ID: <8cb014ba-f9f8-5db7-1911-e828dff0222b@intel.com>
Date: Mon, 7 Mar 2022 18:28:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 10/17] ASoC: Intel: avs: Add basefw runtime-parameter
 requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-11-cezary.rojewski@intel.com>
 <2bc36351e4c14bd4b3d55f26eec2cda1b77e7728.camel@linux.intel.com>
 <b6cfd47b-1ff7-a012-f663-b7bb649be2a5@intel.com>
 <75e4e6e483a90057831fa8b9ab3ece6ef5cc2f12.camel@linux.intel.com>
 <e26c1dff-1797-b18b-81fc-5a741006d399@intel.com>
 <64f3d41df8e8978af23471ebe05d678f80d3e271.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <64f3d41df8e8978af23471ebe05d678f80d3e271.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0092.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::10) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30ac8e50-89cc-43b7-658e-08da005fec6b
X-MS-TrafficTypeDiagnostic: BN6PR11MB0033:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB00330764D8876E7E4835800DE3089@BN6PR11MB0033.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W9JYMrgBMNV/ZKmijHh5sTURf+XNZghf64grlp1gUkrKIkOXUoAuKtM1JvOx2CYd0zQgaJtOoBwYc1owWLCQ55GF3DADmc//Jf1vvY1nG/7j+mKnmn7Gk9epyuNiHCOMzynmAGP+uapbWDIDLXvyoWofzdzDkBU68XyX+uDCHN0yhrbICU/xJaWoq9zH3w5Qvhgp9EQEtJY39xOSc3m2MP5LlcYgfyRtpwpZJ5fxXgDGTLrSrwJdwwCe5jDhZJMZWq+8GEPljQh1AKaAvcbdbZVjBZRuj0k7fep2lCB+NbEqyGiwSoDIopJR77VA/0VPTkG9CzjzuCe/FegmXAtkxg0Oa3ypvblHtz6iolzk3xwsTtVtYkv1tAJzPVLGZD2KY+0p3Py1SnS2vZLfc7DeJYfJ73dL26hk2uE19YlYFoU+WUEeN5T4UH8MzGYEEohcZr9RFqywo8teCvWXXCdd6b9CevFgYFE02T0Br28Bmta4hioMJ2BqkhwK2JLRZCJxTPezqY34Y1p+PCDGoFP3G6oW74JDTcn7fbLTmh+XlXoFKOgJRWTZT6wFDaP3DxrknwlEnzi3WlJ5k+j2p7N+U1ScuQuRAvnWtP+oYBANxV8t6zwQDNM/DhUwKFIVh90yC3Vjf4i5NaoKvnrmkOZCfo3RHcO2H6Y/luVsQTdkjlKs7zenqfIWAAhYf7Y30/LKmaD0MOi66w5fNWgG3fjLZyDyu8MSJfGZrsjMipD54E/gJeU79QRho5gZklXZaGw3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(38100700002)(2906002)(7416002)(2616005)(86362001)(186003)(26005)(316002)(44832011)(4744005)(31696002)(66556008)(66476007)(4326008)(8676002)(82960400001)(31686004)(53546011)(36756003)(8936002)(6486002)(6666004)(6506007)(508600001)(5660300002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDN3aXhVMnlxSkUwMzdHc1YxYlVpakMxWllHR0ZYcm1melE5eUJVZWhiK1hh?=
 =?utf-8?B?b0R4aDg1dHJUaDV4TVRyZmw3MlNIeXczeHRsSGpibU0xa1hIVVdrbGVSOWxk?=
 =?utf-8?B?eEd2TWFLSVdGS01Qb21ZS1lhZDJBK3Q5WWY1RDdqeUxsdDBHMnBIMkZ5Yjln?=
 =?utf-8?B?Q1VQTXlXRFo5R1VQYlIzM3NFZlFPSE5YMG5zN0hmSVNUN0hMOHYvQUp4cnNM?=
 =?utf-8?B?SkFYL2FpNVdlTnUwUkMyVUdaYVVvd1pueTBrVUVTdi9VTGpOc29HZVBPdjAr?=
 =?utf-8?B?VkdDcEFnVTNQRWgyU2dQVUtJdXFXU0xJbEdCSHVzVWEvSHlEVmt5N21yWExU?=
 =?utf-8?B?V050OWJVVExBc2JqVEhaRldoU1JvS04xbG1qQXhjODBiRTJlTTB1bVVtU1A1?=
 =?utf-8?B?MUlibmtLWHlZTklvU08rd2NrYmlHaHB5dHdiVldyVUE0RnZzRzBHbkIxcm41?=
 =?utf-8?B?ZE14alVDTDl2Rko1alFiYTZlYVBWSFIza0dCZENaTzdxK2RtSDV5L2ZDQU5Z?=
 =?utf-8?B?bG5kQnlGQVpaL0dKTEFDcElqVHhicU5TZllQWExsRTdWNTZQTGxOSzlkS1I1?=
 =?utf-8?B?WG1wcW1HanpkZXNwKzRBM1VsVUN2eEp2QjhXTko1WlZmUDVuSncxR1o2Qm9U?=
 =?utf-8?B?Z0twNmgwcUtoVEVDWnBEVzFjZlBzOVg0SlhyMW1MOEw0ajNTQWp1eG5QeXgy?=
 =?utf-8?B?ZTJYMEtkcHB0VlNKZzEyZUp2UUtQMlcyOThpbXhESDYvaVN6RUh6OW01SkhE?=
 =?utf-8?B?UFl5QmdkcGhQQUprdUVsbGwrbWtTV2x0UHBKVklhaU52Um9Udlo1MHdxVkFI?=
 =?utf-8?B?bGdnMjkwOU1tZ0pwYnJNU2ZGWjZ1eDUxaVZkRUcxUWhtbnRmbFZ6Nk1SQVdW?=
 =?utf-8?B?RzdPOHYva1VsUnVOYVlOT2NRMW0wVUlTYkRXOS9yb0kwQndzc2oycnR6T09J?=
 =?utf-8?B?ZFNVREdqc3ZqY2tXRWhEeVkzYTZqckVsZVBKQm5SQWZaUi80K2RidXF6VW1S?=
 =?utf-8?B?b001RU91VzRtKys5eStjMVRTQUFDVkFBQkJmakM3V1hhK0lnKzdGSTQ5T0FN?=
 =?utf-8?B?VXRmVHNLRlA4c3M1MjFRYmQzL0ExdUZ5VlNoK1hveHpnN2tkVmFmbnNwQzJi?=
 =?utf-8?B?TkRVbWtzbHkyTHhZTUlCTFZTaTJreUZMT0FmaTJrYWlVd09LVEEzOEcrUDFz?=
 =?utf-8?B?aG8wVHZzOFVxSTdLVFNCdU1jaEc2ODFPZGZHUGV4UkZDYXBGdWZ1aWpvRGp5?=
 =?utf-8?B?ZWtrbG1KdmFVcWJGUEUzQituYkR3djRhMzlmKzZNMUhLN3NwMVk2SStzUHZT?=
 =?utf-8?B?LytUc3pjS1h1UkQ5Y2QydmM4Y1BPcnBVd1lyUDNCMFp2T0dZMlphZ243djhL?=
 =?utf-8?B?d3ByTEh1U2NDZVFIZHJCeS85eXRaS3dQYmNMcGl0TlYxUFdkbmxOc3ZSMmd6?=
 =?utf-8?B?L25NYS9JZFBqcERMczlTMUI1ckYvUm9Bb2hHdUgyaFVEcTJBbnR4S08xYjZH?=
 =?utf-8?B?NEp3SjlIVHJCQ0pYQWdOdnArams0T1I3dWhIZ3JmZUdJTFZkSlpGdUVNSGFZ?=
 =?utf-8?B?eEZsdEljeDZ5aVFPd1FnaTFCZS9NclRrK3NGZ1VYeGt6bVgxb0JXM0Mwbm1D?=
 =?utf-8?B?VFUxUXlHSHZ5VFo4dFZMdG84OUFBR2J1dWRRdURuZTltSU5DekxnMDF2MXVq?=
 =?utf-8?B?UkltNlIxOWl0RXJTaTFEVGpFQzRaeDNsUnF0eDJqVzlnK0tUUkJ0OUJ5bktK?=
 =?utf-8?B?UWttSldqdEF0MGV6RmVtYlh3bVV1RFNQMmtDQmFVOGxiZ242clFpZnNmRXl5?=
 =?utf-8?B?MlVibmplV0IwR0J0QnZqTm1kZWwyREVhY0p0dDlGVXN2ckRucDFPcDR1TmFB?=
 =?utf-8?B?SUdsUzc1SDN3RFpWMW5CTFJFTXhJWFQyTHRibTZ6VE4ycHVzNDZ1WUhoeUdJ?=
 =?utf-8?B?bEdFTzdHSi8xVFU4WVFHTzJPMExDRGkyMCtHYzdaMGN6U1Z0MVJYNVRpQ3JM?=
 =?utf-8?B?SWI0R0I3OTZnZXFPYVBORFNaNGtvNW8zQUhidktrelFqSXhZc0t4R1gxcWcw?=
 =?utf-8?B?U3VkK2dGQUYzbm5jVm84czlkeUM2a2twcW43NE1DS2ZpekZFbVd2Wk9qY3pq?=
 =?utf-8?B?OXU5Vm9FTkoycTd5bHVuRUYrRFdMNllyWEc4WDVxb2xaRlVpd1h0M29JdHlG?=
 =?utf-8?B?WS9IeTRIMHZweHJmTGF6T09ScTJnUzE5azdnZzl3QWxhejZOVlNzZnc1c3VI?=
 =?utf-8?Q?tn6E/TO4lUtI85z7YADCEq2Vz6ukGEYKEJQTywYcLQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ac8e50-89cc-43b7-658e-08da005fec6b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 17:28:41.7669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rxsB9d8D/qPyUUZ/+m50BEKxnTTT7FWnX9Orcgyj1BoS8K5hn2dEu+8ljKGrepfAuCLhEV4E+PbBVwlhdKjOJ4s4sO0cZ2kYNxNw43nS3dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0033
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

On 2022-03-07 6:06 PM, Ranjani Sridharan wrote:
> On Mon, 2022-03-07 at 18:02 +0100, Cezary Rojewski wrote:
>>> What could make it simpler is if you allocate MAX IPC size for
>>> payload
>>> in this function and then copy the right size in the
>>> avs_ipc_get_large_config(). payload_size tells you that information
>>> anyway right?
>>
>>
>>
>>
>> As stated, there is no clear winner here - you had to repeat such
>> code
>>
>> for every getter.
>>
>>
>>
>> Since we are getting payload_size already, retrieving payload itself
>> is
>>
>> just fine.
> 
> OK, can you please add a comment to state this in the patch so the
> reviewer doesnt have to track down where this memory is allocated?


Sure, will add in v4.
