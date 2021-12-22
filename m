Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ADF47D39A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 15:23:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76033179A;
	Wed, 22 Dec 2021 15:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76033179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640183002;
	bh=VPHCSIGW8SxiEtVxOHJnLabQoBTpHc/HtHrQUMX4ANY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCy06D6mqy/4MiZ33IryTDpX9wcWkhfpScj+b2M8dOIXwPwxsYJloDxBSxCgk7eIh
	 msBA8JP88T7K3iv31i9Z6Fbv+yEmxu+W4S63sJ/RPhpmPT0fzrtzSF7O7+j/Vkj7ou
	 Ll2KIRJgWFjXc9ZSb7O1szMrc+q/vx7rMxlt6lvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5B2F80111;
	Wed, 22 Dec 2021 15:22:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA751F800B5; Wed, 22 Dec 2021 15:22:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80567F800B5
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 15:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80567F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GX1qjDtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640182933; x=1671718933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VPHCSIGW8SxiEtVxOHJnLabQoBTpHc/HtHrQUMX4ANY=;
 b=GX1qjDtOjCdInQerWOvFC+dZZZwVo+7YsNlXPvyeiK/tA/lU9BVm2+S8
 UASZC8F3Nso+MjH+I2XayESdbg0p+pO1GdjlBxKuJxFITxpEYucZfvplh
 Gz8BfJb5yGzCbFGBYr93G+XE1eYZ77sFTRPPjVuEcKK07ucPdydjW5GZy
 gT7/zxuG0CkTdPTejDn6DJBbFie+KBDhMkSJV5p53b2YcjvYpF+LizM5q
 uEOofmvAufOaKyC/Y1HfO6d1fF4zkANq+EW2wAVF9vBvsmFl/8gbT5X5l
 NmiUOXa6DRWpM8vUwfNGcD9LSEbWZS2GQLXxdXHYgTiMnqASznsoZ/MHp A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="303996071"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="303996071"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 06:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="468185668"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 22 Dec 2021 06:22:04 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 06:22:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 06:22:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 22 Dec 2021 06:22:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 22 Dec 2021 06:22:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkoWKqPQLm7PFhaaamCy3IgG5Jr4+8QcdfyQykXFlw5atAeAfue80Ag/9IsUtreZWov8Cb/VRR5F/it3SJH+yLxCTu49uZDeuMaU4I7I/4yY7jfxkXH1xLr3G8MEq23cVs4v1syBi3XiFPkGWoYDczMrjBYePYjqVQthioBun+gu7AgUSMq/ZuQUrv/QKbQTReXoPYvWKaPW7hn8uZ0lrf3+8frPv9y5iiWTr0LlHBGAqnhL0DmyzYBswgS4+v+ySAJNwZS2wOYXdPyMdOuwO8dQdjYzKMFOULvh/nPSpXS3UU6tnpd4zZK+7k6U/jrcBjoQVAANgyg0jMX09msw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5vWdlKm4suiBRU65CybvJ7fCFYWQoNRsxufXp1IOi0=;
 b=lvMGQJnUtXh6ddp3FZPiPS0Yc0skAZJ6hSNCEAxz0Re9qHWcYIOqHhsA52l7oK/0GI733kRG16/rjMUx24m0wWqnoBhNvZebQqTOiph2ytmoLE3cn2nE+HIs02w4JNVSbDLbE7x0owNHT/0OrzCRSjLsiff8qP8wRbmdGrglKIlKHHTtXshj07EzSw3Z8saYsSZW8T7gzq1CDSm5Qk30iBbkLdAPjcxjFfJzvWzQOSxH11bYwZlZ78WnAJFup83IZoSIrFjStGpRj0rOmYGcfljZgl+lqsV1n8AzTNq4AKYVNG2+fz4KYh7yjDHxdiz4kGZexA1okzgStT1bp4D4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN7PR11MB2724.namprd11.prod.outlook.com (2603:10b6:406:b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 14:22:01 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4801.023; Wed, 22 Dec 2021
 14:22:01 +0000
Message-ID: <ef9c9b72-a86e-066a-8af4-b08252559840@intel.com>
Date: Wed, 22 Dec 2021 15:21:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [RFC 18/37] ASoC: Intel: avs: Topology parsing
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <20211208111301.1817725-19-cezary.rojewski@intel.com>
 <YcIRRevkBpM/jIKV@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YcIRRevkBpM/jIKV@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0066.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::43) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69be8487-fb6d-4474-1fff-08d9c5566b70
X-MS-TrafficTypeDiagnostic: BN7PR11MB2724:EE_
X-Microsoft-Antispam-PRVS: <BN7PR11MB2724B6E0EA499DFE4B1B0906E37D9@BN7PR11MB2724.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3+Mu6N7kql5sJfb2MPgJF5U4E1SLp0KAU9Qqxr49+ZyJC+ZQuk8357HrIFVQS4cSbQP1ZQuipxHzjsCCb8QoVZnsEU1QPnCWMdDhc+Vpd1ci35kuQp7GoHqkl8hRhhdUcYjLZIVh0P89GFE5gwlChVPflZBdnXD6godJQ+6oDVCgsrYMtDsn+6KyAoCLmSPk7qcrb/sUoYFAFIKSqB8nx4Ce5H+d+S/1BDdv873JDkUVrlJUgpB24S4TgO2wHm0/ETmVFigYYebwdzQxnhGlnZcsNnwDNPagRx3FSv664cWFHDlN+oCczdrrpz2JMYJr6uA0SymRaH0gqNvhD5e3IyL3j3MJUjFUqrPod7hBULszQAfjHam4RpVx2ZeUxGhdEs0Fk97WZQGJ+LqIsVYNNfKt54JZbSN6WLEL+krgJ0aN6S61JPkywQA5lzJgYtrCZKWPUIPcoQnX0rdFtiExxEWq8o/S35HTbgEW5Q4zUlbbo7ry99PQa7homwMzQXziSJM8FLlS6pKbFQAkh4BSFvAIE89il6YqpAOcqgPqyJrvu1rcjMfe6Cj2mJBjy01xmJjL35tWoIhXBBjpbEpuO0/A9pYoPPVEQeRPDt4Is2U6jbFzLUUpVLFJExDY0H9R5WsDyIE6dyfvdAlNU2OScEWPmEkGEYCRltvIHX/JqbXb+374vxYJsf8KVLwIKybO2yKslcSbafDaedgOQq70nixfwTZblEjRLdqhH/abdo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(31686004)(6512007)(83380400001)(508600001)(86362001)(6916009)(6486002)(5660300002)(82960400001)(6666004)(44832011)(2906002)(66476007)(66556008)(66946007)(7416002)(31696002)(53546011)(2616005)(4326008)(8676002)(8936002)(4001150100001)(6506007)(26005)(36756003)(186003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDRiZFdvOCtIZjExWkQzRmYxaDFqUUdWZFN4dUhSbHBEbWlTaVYrV2hLNHNk?=
 =?utf-8?B?UGxTYjltT0UvM2pFcHM4b3pXSW5mSGxzMmFjaVpWeDVkbnhoQnpva3pOODlo?=
 =?utf-8?B?UkR6QW9ZT0JjK3lhdnBoV0t2V01rWG1zanFmcHhsYkJHQlJYaEFVUnh2bmlC?=
 =?utf-8?B?K2M5MVJaWlVEck5tMGk1VlhoWkEvWG5ZajArWjB2aWpTR29pUlhGdVhGUVo1?=
 =?utf-8?B?czQ1YVBRLzBaNXl3RDE0aEgra3FBS3NlcEl5YUZPTXg4TStkelQ2aVo0RVVk?=
 =?utf-8?B?bFR0c1ZvdW15WStRd0pkREF1NVVoZUtGN2xvY3RUdTVKMGVkUHR1RUdlVHdN?=
 =?utf-8?B?VmVseG9PUUJVYitVMGZPZERwVUNkeDNKaDREQ2NiYjBDbDcyRTJJYVFwaDk1?=
 =?utf-8?B?RzZWbkFZUW5pd29jMUtnazdWVG1JSXB1L1BYUkVTWC8yYjMyWWhlbTdBQ0pu?=
 =?utf-8?B?YjFCUXdyWVg3U2Y4WlphVkRBWS92MzZibFVtVmNkOG9Zd29sQWlqNEYydEZZ?=
 =?utf-8?B?YTY1dFJaL2tBUlN2RDZ5T3JBb3N2aE5odVM5bGF6clMzWWR1cVpiWG03WmZ5?=
 =?utf-8?B?VFNRQkhQblhCZXhJTUFYMDNUWXp1dnYxOGJ5KzNRRVdTWEYxZDZhbjZJNlJw?=
 =?utf-8?B?SlE1a3Z3R0NyWHpjRjlsb1ZRckNvRC84amJ1ZStTMXZVRGFKanN5bjJweW9C?=
 =?utf-8?B?YVFFVkRnWk1yOEVRS2tSQkxkb2ZJV3RKc2hMK2FTdkEzdmt1dnJFNmlVTmhF?=
 =?utf-8?B?TENTSzg3OHd2YzdRQXJqcW53U3FWTTNUeUhmU0RqdGpFNEdBUEJlc1BsNjBP?=
 =?utf-8?B?cVQ3UXRpN3dpcGhwNHNJYm8zQ2NBMlpuWnlpU0piUDkrcStRYW5OcE5Dalhq?=
 =?utf-8?B?UU1YdGYwUjRDdnJzcDNjd3g3aG1lazdwRHRnengyWnFYUnVkRGxCSSswN080?=
 =?utf-8?B?MUgxTWFSd3BPdnRJT25UQ2UzdjlLUHVMeTFBbDFQeVRCU3ZkMUU1S2dLQXpV?=
 =?utf-8?B?SnlJYnlVazd2clhKbEZFL1h3NEVsNmJPM2RwQlBFMFhjdnpsRXd6V3lQNVZ5?=
 =?utf-8?B?QXk5WG1Wcm5DcUYzOUg1VVhNejdDRm42a1l5UnJNSTlvWjZaS0YrdDJQSmYy?=
 =?utf-8?B?dzVQVTlOaW9Lbmp0Z3F0cnpiU0lRTDAySmZtSys4MGJMcHExczFoekl0N0hH?=
 =?utf-8?B?MUJQZWVrWWhUUS9WSExpUWhjblFQWS9BL1hIMkVVV0NZRjA2V1NLQ2lJVjJI?=
 =?utf-8?B?NWk0OTJHYkk2MEIzWm5WR2V0T2prbkxhYVpCOXUwRUhEZGlUK1hlWDBBK1Rs?=
 =?utf-8?B?cENwVVAvL3pWS0diRXlXcWNUeHZPN1NuQTVVcWRJeVdYK1hEVUp0eTZqditT?=
 =?utf-8?B?VkN2dGxPSHNpNkIrdnJSTkJ6REZuRDdxdDM0K3JsVjU1REVuMkRNN1hYSmJ1?=
 =?utf-8?B?Vjd2ODYxS2VkYzd4eVZkc3hNY2JXek9GVURvUmMyWG03bUI2c3NBODVLMHZV?=
 =?utf-8?B?SnlYK0JsUEFrb0MySHJFQjAzMzByK0FPY0FlTjQydkNacG1SUDhqSDE5MUlD?=
 =?utf-8?B?T1NQZlNsSGo4L1lTdTB5RHExT0JPZjlYY20yKzgyM1pLRTkxOExBb0FYdHRh?=
 =?utf-8?B?ajBQczFKOWFrTncvMCt0NDdvQWR5T2MvWTl0R2FpOEhrdkZTbUFJSEIvR1ZW?=
 =?utf-8?B?eUU5cjdHK2ZWWUsvZCsvWGZjSUNDK2h2LzcvWVRpb0lHeUNFZjJIWGE0TEI1?=
 =?utf-8?B?MDVjK1VoalhFOGEranAvek9wUnlidWxwSWU4c3VtNVBkeG1lYzI2OE5kL2pR?=
 =?utf-8?B?b29Ta2NidVROVXl5NFFjSUMwbmVVOG5xZDJzQlU5ckZQSlZId0pIRjBWdllV?=
 =?utf-8?B?eWFmRkFUemNFL2ZoUk80RnhpMlNzRmdXcVJkOXB0NkxydDBoZncwOGRWaElv?=
 =?utf-8?B?NnVjeHZCdUxEQnNxeC8yYjE4eXlxTEkxQUU3dG10WVdYQ3A4YURZSTUvbVRV?=
 =?utf-8?B?dWpEYnNWK2xodXg5bGUwTmMwUXFqanYrYncrM0J5QnR2bFFPR1QrVGpnaE9l?=
 =?utf-8?B?ZjMzVlpLUEtGcTM5SHcySVFNcEZRSHNEaXBJS2hBVVcxZGQvc25vR21ySHZk?=
 =?utf-8?B?b3VObmJnL3ovVm1zNlVxRFZMNlp4Z1VtZVRLaHIvR3dqaWNPbDlSV28xMlFP?=
 =?utf-8?B?VGQ4bkNHbnhld3BhWFRsRnVtb0R0WXk2NThxQVR2UlE4L0lrWDMyTzlGdEdY?=
 =?utf-8?B?d1Z6aGRJSWgzdWxlR1QvcHI4SzBnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69be8487-fb6d-4474-1fff-08d9c5566b70
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 14:22:01.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m3hoWDxvUTE1QauzE5Mx4jHEvty8aqg7hLtMicZQfHfOsvrSQTccX0yKL2kvuOvVpcWn4xc4lCa65WYurZvr8T5slgVqvFyJBjeHHOCLyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2724
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

On 2021-12-21 6:39 PM, Mark Brown wrote:
> On Wed, Dec 08, 2021 at 12:12:42PM +0100, Cezary Rojewski wrote:
> 
>> Implementation of ASoC topology feature for AVS driver. AudioDSP
>> firmware supports a wide range of audio formats, module configurations
>> and multi-pipeline streams. To represent all of this in form of static
>> ALSA topology file, which resides usually in /lib/firmware/, while
>> simultaneously not hindering user from any of the possibilities, 'path
>> template' and its 'path variants' concept is introduced. These are later
>> converted into actual runtime path. This part is explained in follow-up
>> change.
> 
> This sounds like it should be extending the topology code (it's talking
> about "ALSA topologies") but it seems to be outside of that.
> 
>> Path template is just a pattern like its name suggests. It is tied to
>> DAPM widget which represents a FE or a BE and is used during path
>> instantiation when substream is opened for streaming. It carries a range
>> of available variants and only these represent actual implementation of
>> a runtime path in AudioDSP. Only one variant of given path template can
>> be instantiated at a time and selection is based off of audio format
>> provided from userspace and currently selected one on the codec.
> 
> So this sounds like it's baking a table of use cases into the firmware
> rather than a separate UCM type configuration file?
> 
>> AVS topology is split into two major parts: dictionaries - found within
>> ASoC topology manifest - and path templates - found within DAPM widget
>> private data. Dictionaries job is to reduce the total amount of memory
> 
> Or are the use cases baked into the driver code if they're in the DAPM
> widget private data?

I'm sorry for any confusion that arisen in above commit message. 
avs-driver still makes use of typical UCM files, just like 
skylake-driver does. The file has just a different structure (e.g. 
different tokens used) to do both simultaneously: make use of available 
ASoC-topology structs and types while still allowing for shaping streams 
in recommended/optimal manner on ADSP side.

To better understand what I meant by 'shaping': a stream on ADSP side is 
a sequence of pipelines (a sophisticated containers) where each hosts 
one or a number of modules (processing units). The number of pipelines 
and numbers found within them is not constant.
In almost all cases such stream on ADSP side has a beginning and an end. 
'Gateway' is the word used when describing the edges of a stream. There 
is usually a HOST (cpu side) gateway and a LINK (hw side e.g. I2S; 
'codec' comes probably as the closest relative word from ALSA 
dictionary) gateway. To preserve ADSP memory and reduce power 
consumption there are recommendations of how to shape streams.

ADSP firmware supports a large number of configurations and stream 
layouts. Depending on the environment, (even by changing BE/FE formats 
provided), stream layout can differ. Let's assume 3 ADSP module types: 
module1, module2 and module3 and a single playback FE "Speaker" visible 
in userspace.

Your typical playback on FE: "Speaker" for audio format: 16b, 2ch, 48kHz 
could take following shape:

HOST [ [module1] ] -> [ [module2] ] LINK
	pipeline1	pipeline2

However, for a different format (e.g. 44.1Khz), it might be recommended 
to do:

HOST [ [module1] -> [module3] ] -> [ [module2] ] LINK
	pipeline1			pipeline2

HOST: cpu side
LINK: hw side e.g. I2S interface.

And that's why information attached to DAPM widget's private data 
translates to 'set' of concrete stream implementations (i.e. concrete 
data that is later sent to firmware over IPC) rather than a single 
stream implementation. This 'set' has been called 'path template' and 
each entry a 'path variant'. During runtime, depending on the conditions 
provided in hw_params(), a single variant is selected from the set and 
instantiated.

>> +struct avs_tplg_token_parser {
>> +	enum avs_tplg_token token;
>> +	u32 type;
>> +	u32 offset;
>> +	int (*parse)(struct snd_soc_component *comp, void *elem, void *object, u32 offset);
>> +};
>> +
>> +static int
>> +avs_parse_uuid_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
>> +{
>> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
>> +	guid_t *val = (guid_t *)((u8 *)object + offset);
>> +
>> +	guid_copy((guid_t *)val, (const guid_t *)&tuple->value);
>> +
>> +	return 0;
>> +}
> 
> I have to say I'm having a hard time telling if these parsers are doing
> the right thing - the interface is a bit obscure and all the void *s
> make it hard to follow, and of course the format is undocumented.  I
> looked through a lot of it but I've definitely not gone through this
> code properly.

Again, I'm sorry for the confusion with the parsing technique used here. 
Ack on the documenting the general idea behind parsing seen in 
topology.c file.

To give some immediate insight:
Each 'struct avs_tplg_token_parser *' instance describes a recipe for 
parsing data coming from UCM topology file and assigning obtained value 
to a field of avs-driver specific structure so it can be used later on 
during runtime - streaming.

Let's take a look at an example:
static const struct avs_tplg_token_parser audio_format_parsers[] = {
	{
		.token = AVS_TKN_AFMT_SAMPLE_RATE_U32
		.type = SND_SOC_TPLG_TUPLE_TYPE_WORD,
		.offset = offsetof(struct avs_audio_format, sampling_freq),
		.parse = avs_parse_word_token,
	},
(...)
};

Entry found above is meant to parse vendor tuples with 
token=AVS_TKN_AFMT_SAMPLE_RATE_U32 and assign value coupled with that 
token to a field 'sampling_freq' of struct avs_audio_format. Let take a 
look at said struct:

struct avs_audio_format {
         u32 sampling_freq;
         u32 bit_depth;
         u32 channel_map;
         u32 channel_config;
         u32 interleaving;
         u32 num_channels:8;
         u32 valid_bit_depth:8;
         u32 sample_type:8;
         u32 reserved:8;
} __packed;

For every member (except for 'reserved' one of corse) of that struct, a 
parser will be assigned so a complete set of information that comes from 
UCM file can be eventually translated into an instance of 'struct 
avs_audio_format *'. 'offset' and 'type' members of struct 
avs_tplg_token_parser are here to ensure correct field is assigned to 
and specify the value-type of such field.

At the top of topology.c file we have placed several helpers, all of 
that is done to drastically reduce the size of code found below them. 
These helpers are also equipped with sanity-checks - these checks were 
one of the major reasons for separating the helper code into functions 
so all the if-statements are not repeated dozens of times.

Now, in regard to types: standard types supported by vendor tuples are 
uuid, bool, byte, short, word and string. We have added a 'default' 
parser for each of them. Again, let's look at an example:

static int
avs_parse_word_token(struct snd_soc_component *comp, void *elem, void 
*object, u32 offset)
{
         struct snd_soc_tplg_vendor_value_elem *tuple = elem;
         u32 *val = (u32 *)((u8 *)object + offset);

         *val = le32_to_cpu(tuple->value);

         return 0;
}

where:
- comp, a soc component that is tied to topology being currently parsed
- elem, an instance of a vendor tuple that is being parsed
- object, an instance of an object which fields are being assigned to 
during currently ongoing parsing procedure
- offset, offset of a field that is a member of type which 'object' is 
instance of

 From here, the flow is straightforward: obtain the pointer to the field 
to assign value of 'tuple->value' to and assign it.

For all 'more advanced' fields, additional parsers have been provided - 
with more checks and such to maintain sanity.


Regards,
Czarek
