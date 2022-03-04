Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D2B4CDBB3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832D01F0D;
	Fri,  4 Mar 2022 19:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832D01F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646417034;
	bh=lQjgQCx6tIUmx+ulxuA/ZGTxmeWWMqIKj3bibUb6i8Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dxNP76x+nGWEImmCrmGP5Rwa7ch/oHAkwFFiHhHl03g6x3YToLGOoAsfbPE7b0STY
	 L8GOpONEMTSEWCm2vhyHanahkuRmRjaveolq4ZF1jGD7pIWBTfzjkYtz8P0zOlwUmf
	 siRIH3yiHUxfqjsqQvQWchAnHkAQyX8Zd2MiNcUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3696F801F5;
	Fri,  4 Mar 2022 19:02:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7352CF801EC; Fri,  4 Mar 2022 19:02:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 067E1F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:02:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 067E1F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cgMfsWKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646416961; x=1677952961;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lQjgQCx6tIUmx+ulxuA/ZGTxmeWWMqIKj3bibUb6i8Q=;
 b=cgMfsWKJ1KIgsJSX+lDwoWcWz822m3axqa7YeHB0Bj0uRUSJvG7RtAF4
 D8jk1nAnuZ/ERhGLUjGYdb/AyY+gbmEqyKnxE51mMZajqs6RhZMWRK+/q
 5Cuc5hWwMS/vViguglDHEKxwt7ruknKkhdsGdxW7OrPcX8P7qziYmn+SL
 j85zFKf/LcKRtUJB+npFopqsV5loxlTBkvGpKe79eZqTbVB6zb2HkBRJg
 U9K1j3UTs3oPz8DLePZrKdNn53C+3l/s3wY57oRYNar/T8xlQbGneqfj3
 aiR9OxU3bRRQJ/5c4mJVmf/dUVVRB2/00/82pZUxKswA7XVnpsIw0ipnG w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="314744059"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="314744059"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:02:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="631226359"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Mar 2022 10:02:33 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:02:32 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:02:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 10:02:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 10:02:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mj4+asDr4hi1h8RdqxzYZ1tXsBhObQ6wsJtGR28kYfCWOBXh1dMaYQ6eP6zghqBWUV7HHCSpI3gxavuTpjMBubJ3cBfFup2ClXygw8xkOY/Amhb9uTyIRO9z6D7RxdE0d45zA+MKdBTVZ/e2FZek2bpHIOwdnTaTjiy6sTegtMk865GYt+ivO4oM8v6sVck5+wDdTKDq8JKIkCnIVgT8m5yzO5ko8v8Euc8drp795y4YspkGabnfx9mNZaiSLQ44/6bmKrODvU/G0awhnnZc037piiVl/TxAfz+LYI9Usf41s2hvxDrPy/r0ehYt3ED9tVQ1H2xsqCgbwCwyMbD69Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeYgR77WJBNpjmfYYn6A4KUBBfA5U4vJHoyHM6AsQ4Q=;
 b=aQDdEIfei/hu4WilZyOAj3hs4g7ZRVLieWzXN2tTXYrIrAAmwsWBgWpd11ILGXNE/zYMGZ3/M6K7zYaoeOSvf124wUJtluLwLEwO4dlSYyKnzZdE7e+43fQpUzQ1i/yavC23dhP0ntddQIoUhpNNwrosQYUndLOUwRi9/ATKpqsYAwVF80g/ezSfBhSKFU3rfFWd2D2JTAvR4CI1y8An6s2inPEwxi6lL+PrMAnZR01pdWQGkKKruLGnLOwF2V7SyeY6RBQHmqmuEWepkdYQX9GXRv6jvrux/yXWROM3RQvRUsM6EIlntwecU5YoLWl4ilMITZCfP5qOVJKSIaVxkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CH0PR11MB5331.namprd11.prod.outlook.com
 (2603:10b6:610:be::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 18:02:29 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 18:02:29 +0000
Message-ID: <d7676598-27bc-fe5d-1167-c82795e533f7@intel.com>
Date: Fri, 4 Mar 2022 19:02:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 11/17] ASoC: Intel: avs: Firmware resources management
 utilities
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-12-cezary.rojewski@intel.com>
 <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <66e20563567955124488eb9f9b53ea6a2bc5d744.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6PR0301CA0066.eurprd03.prod.outlook.com
 (2603:10a6:4:54::34) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89c69cd3-42b9-4dbe-a185-08d9fe0925e4
X-MS-TrafficTypeDiagnostic: CH0PR11MB5331:EE_
X-Microsoft-Antispam-PRVS: <CH0PR11MB5331E880BD8E3EC3C070B05FE3059@CH0PR11MB5331.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L+Ega3HdSMarCN1tW1l9u3+KXcWrJ7UNwsW+DuW4CEdgq2lkd8s1+/znKgDH1uj0Av7aXvkhQTBWLQ5qT2EBwuoiMl2YyqzZf/GcaT7jeJ4cKKv34InIOwPUx1A5uyelI/l23nSCKLQeMFSl63nZJWCX3hAxGQtY4x7N2gJcNtFoINjvyDR3UgHO/xW3xoFZJhdm2Lw9mnoQHQMqA0BTpsWiyf+72nuphqBLUw/3IGsDUuJu7H7sNZmDG2Ed9XRTTQgaKW/2Fgr75GOIt72TuHz7aZc3uNe4Sb6nf+uv3kkfe8RzlWFxUVp3/Qs3kir5LMFTQ/UvgwHof3o60jscefIwLnU50g9a6JTksXPRJ/tXOnrmZ7bjP7gMoFdT1gpwB9md0N2FwoXHPbcOLSNhRFWS/R3v3jB7dBVzjqC2x99k01l0LHeRevti6GoeWCloqyGIzfk+19fgaKcrt7Tie1sZ5WNfS0bie4tF9+5nuf6HYgA8BsHQFRSOJuNsuLMras4ulrhfIaqtrwneB2Tmbp8IzrDbkUmHRmS98+zoZ2cbrE1n4lR9oAsnfDm67xfwG4o95BgH5mP4xi6PcNhVKZXeD36POw4majUDl723Fr+/r3bmDhvTBrgE+kb3yRjIfGpDh1VjEKKtlfrrGUnl5RnvvyzkeBKmFL/gGXNrX+iiAbeRJClXw/Yi2grztk/TmGnhc1zphcqoAKTKFHIRchwW4VEXGkZxsF3jnCb1Rzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(4326008)(8676002)(66476007)(26005)(186003)(66946007)(66556008)(6512007)(2616005)(38100700002)(82960400001)(6506007)(83380400001)(6486002)(36756003)(31686004)(508600001)(6666004)(44832011)(8936002)(86362001)(5660300002)(2906002)(31696002)(53546011)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmVJMWpSY2IveUd3OTA4enBtam1YTzhVTW4zTXlxOXBZOENOeUE1c3Z1dC90?=
 =?utf-8?B?T205MWJJZVNhK25ERzU1Z0dJT3kxYjJuM2JZYyszeTFaNFl5UEhWQWlFQlhz?=
 =?utf-8?B?S3RNWklidW9TN2d6TnM3RTYyTG83a1RwVVVUUW53VjFxblhETFlzSjhYSFZN?=
 =?utf-8?B?eUkzb01hYXE5OUZtL0NIVTVnbnluNW1mVFNqcnF3ZmU2UEJqNnlYK0N3d01Z?=
 =?utf-8?B?MGY1SHBtOE5kVEZWd3paN3lHK1hNZVFGdUx6UTFLNFA5OTZEMkhjTEU3eTFZ?=
 =?utf-8?B?NlVUZGVtODFPdEttWkJYaHJMTWxlZkppRklLbCtkRExuNDYwUnVhNC9Xbk1I?=
 =?utf-8?B?QTZvZ1lRZ0VCc3pQWG05TXFTSXU3YWk5azBJNjI5MU5RNTNGV09zcXEzUk9j?=
 =?utf-8?B?MDRCcjZ6dDVJTENPeFBLSktSVFdMQ05YVmg2ZkZpRTd6SU1hZ0ZOUTNCT3JP?=
 =?utf-8?B?d0YvSTBnTDFaS3N0OUFMai9tdWFRUzd2Z0M1elhwb0RxOG10SXZEZ1loQXNE?=
 =?utf-8?B?KzhZSy95ODRzWXNGOHhWOU11V21aTFpkbjJGa0h5MUFXWWFsMkordzBqSUpH?=
 =?utf-8?B?YmZ2Nkd2bHorQnJaUTFoM1ArYXZETkFZWHVwcTRoY1NhUWN0NWZRZWROcDFo?=
 =?utf-8?B?a09wVUhINW1jYWlBcWwwaERRYURoOWJIaTdKYnJTREhsMU1ZWnlaOER6dVgv?=
 =?utf-8?B?cWVOUmc3YkJ4NTBJTGxETnR2VXk5L0pLaGc0US84akRjS1RXVzRTbVpaUE0v?=
 =?utf-8?B?SStZdDlQU3dQRFRWU2xwNnlwTGorZXYrT3VhNW1XQzdqM3pnK2ZwTnVSLzRp?=
 =?utf-8?B?QkdWM000SFArc0JHbzJJc0w3a20vSGpWVm1adW1UdzYxT0NiL0VqbGxoZ1BC?=
 =?utf-8?B?TDUzSE5UTzJxYk1peXdIcW1KRjBWMG4wNDkwOElERk1WZWIySkRpcmR3Qnda?=
 =?utf-8?B?VlFFTCtTZHFiRUNxcTBLRXpydGdEM1picFBvYmgzTktLUnd1QzBZbVhVbTYx?=
 =?utf-8?B?UlIzOG1GY0hJNkFLNnE3ZklzdjVNciszcHRDYVlnMTE2S0t1YTdESXBkN01l?=
 =?utf-8?B?aGJNbWg4UjlmNWRwRTEvRUQ0cHh3cWFYSkFucEZSN0E2UFByZy9JQnFUa1Y0?=
 =?utf-8?B?WDZRZTQyeVVhd0p3YnJGOTMrS0xyQ3U1QVRwRkZZcmlraForVDdNQVpDTXp2?=
 =?utf-8?B?N29xc1JDSVlyN1hPMFRCQW9ROUtZNVdyWFJYUTBEWjloTytPODVUTkxkYTY3?=
 =?utf-8?B?S3VhZFRqeC9IUlFxd3dsY3JEbGhabjZFTVpFQTFnZXJQbFAwQUFOdysyR01n?=
 =?utf-8?B?WFgyblFTZkF4Sjczb2tIbHRNNU9RK081ZUJMM05sdUNNMUhNT2JBQmtPcjMv?=
 =?utf-8?B?RUhxbGkrcUw1UW9kZUVjajZ6MXoyM2JYZ1R0S0dpa0VUVHFOWkwxQzBzKzhB?=
 =?utf-8?B?dFYwTDlJdFpPRTQ2bTFsdVhtdFRoRVFTRjFQVHp4QlhXQndOQTJ3WE84djFQ?=
 =?utf-8?B?SlJEZDdzVjJKVkQwWE9xVVhhRmc3R0x4aXF5L1NlVWdDUkZ3NkgwTS85eStD?=
 =?utf-8?B?ZVdtamkreEZvL1F0dldQNTE5dzJ5bEJRemJCdTFuUmY2NlNncmhnNjNUQm1E?=
 =?utf-8?B?Nkl3MW9ObDRRSjJVUlRtSVNVUFNPeWZYYkx5Wlo3S3QwMEJ4Znh2US9oenpB?=
 =?utf-8?B?R0dkajhZdmR2RDFESkQ0a1RFYVg2WnJITWR4aHp6bE5FMWVYS0JkTUpGMld3?=
 =?utf-8?B?Zk45S0JZblM3NnBjRUFNcW94dEVEWWNrRCtSMDRRRXlMZ3QxOXJaSmxxU1V1?=
 =?utf-8?B?N2N2a3Jtakg0MllSMGord3U0am9Zb0hNT1NGVmx4TUtxQkRyVnVOd0ZTUEFn?=
 =?utf-8?B?YkhPL044MEVQbThEQVJnZG92VkZTMEo4VDBnZnAzblg5cVNnZFdsbXpqVldQ?=
 =?utf-8?B?bktiUXA4VWE0T2hMbVdHRVFmYWpZVFFUN0RjYzdqU3pYMy95djI0eFRiRUxh?=
 =?utf-8?B?RXAvNlVoV0crVmZWQkpTWjJCOTZSazdzM1dCRERjd3RUenF4aFJIZDJSd0lK?=
 =?utf-8?B?N1ovRTJBRTQrQmxEbXA3andyd3BibEhVV2NmQnQ2WXIvMlNxQ2FMKzVxQXk1?=
 =?utf-8?B?UWtDc3VaRG9JWGJJQUM5UzhMVTRwNUJrZzcxeU9oSmxzOXNZWGZSMUNqMFQw?=
 =?utf-8?B?SXpTOFlnSVZXTXhKMHhkVngzbHNqY2h5S3NCTnYwVmFmUzg0MDNIQ3dxNW5n?=
 =?utf-8?B?RzA4dVdvWm8zdXlHeHZnNjRQdWhRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c69cd3-42b9-4dbe-a185-08d9fe0925e4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 18:02:29.6818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sITXV+1FOmWvZT1uYChw/EvlPCTGUwW1XO55M2YQGmnipC8r8Uc34UgKJ81m6FBPxp9tzKk3BbZ1xpvGU/OL3NwKsK9KQJJrHt6Ty2pBq0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5331
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

On 2022-03-04 5:41 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:

>>   /*
>>    * struct avs_dev - Intel HD-Audio driver data
>>    *
>>    * @dev: PCI device
>>    * @dsp_ba: DSP bar address
>>    * @spec: platform-specific descriptor
>> + * @fw_cfg: Firmware configuration, obtained through FW_CONFIG
>> message
>> + * @hw_cfg: Hardware configuration, obtained through HW_CONFIG
>> message
>> + * @mods_info: Available module-types, obtained through MODULES_INFO
>> message
>> + * @mod_idas: Module instance ID pool, one per module-type
>> + * @modres_mutex: For synchronizing any @mods_info updates
> Is this mutex really necessary? Can you please elaborate under what
> circumstances your will have parallel module updates?


Yes, we believe modres_mutex is necessary. All information regarding 
modules exposed by the firmware are stored within ->mods_info cache.

That's just a snapshot though. When a new library gets loaded, new 
modules may be available for use and so the driver updates the 
->mods_info cache to have the latest snapshot. As information found 
there is used when streaming (e.g.: instantiating modules), we enter a 
scenario when multiple threads could be reading/updating the ->mods_info 
at once. To prevent any unwanted behavior, mutex has been added.

>> +void avs_module_info_free(struct avs_dev *adev)
>> +{
>> +	mutex_lock(&adev->modres_mutex);
>> +
>> +	avs_module_ida_destroy(adev);
>> +	kfree(adev->mods_info);
>> +	adev->mods_info = NULL;
>> +
>> +	mutex_unlock(&adev->modres_mutex);
>> +}
>> +
>> +int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
>> +{
>> +	int ret, idx, max_id;
>> +
>> +	mutex_lock(&adev->modres_mutex);
>> +
>> +	idx = avs_module_id_entry_index(adev, module_id);
>> +	if (idx == -ENOENT) {
> Can you please help me understand when this can happen? If all modules
> required by the topology are already initialized, will this ever
> happen?


I want to help! Just not understanding the meaning of: "all modules 
required by the topology are already initialized".

Will answer best I can though: topology carries just patterns, it may 
happen that module found within topology file is not actually exposed by 
the firmware. In such case, we drop an error. This keeps recovery 
scenarios sane too - when recovering, libraries may have to be 
re-loaded, depending on the firmware generation and whether basefw 
recovery was successful or not.


Regards,
Czarek
