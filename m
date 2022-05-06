Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DB51DC1B
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 17:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C14721832;
	Fri,  6 May 2022 17:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C14721832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651851020;
	bh=lFRF5vfn3x2vci7WI+1WWYKoEQOZcRAoDeVhc0MKEFg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQmgDSzVO7F7C9ZI8dsXqRE1YsbZxqMJbbFL56Qq/KEyhwnb7ncKBiB63dbaH9u9i
	 WXki0bj9pllkIC8Nv87wtI1gzti3ggHWvWI08kF6REzToLfIzfrv1pIy2jJt8TMGp0
	 peMn4ZxFD2Ix2W0MZw23z7Ep999yNpmWXORDu4/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A61DF800D3;
	Fri,  6 May 2022 17:29:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BBECF8014B; Fri,  6 May 2022 17:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77262F800D3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 17:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77262F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Yc6BBAFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651850957; x=1683386957;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lFRF5vfn3x2vci7WI+1WWYKoEQOZcRAoDeVhc0MKEFg=;
 b=Yc6BBAFpUTcgT0jCBS1DGnqmKqLqIa/sC5bpQV4Xy4Dn3tN7if4ATCiN
 ql31ZXu1c9+xKAKmuicoaDsMhULGE0GlLJQ5WSAGed4obiVIDYeX4i1oQ
 ha0GVVItt4RqxgECNWgqTDXaGrFeQhFC+cv4p/zDiUQHXFcctaZ6CHqBw
 G7rcvoGi9l65WmFCczkqSW4seVW11zAzRr2LwaLsxAf4unLArS59O8781
 mpplDZ6cx9Yb2tI0xUeC6xhZsDAYZ8iuYVTpCC7AEVcodTFR3bxpDWWzs
 ZEHQJxvMb+c3Xnc89iHrd9y56A1ZNt9gs709HigLSuNb4iZeZOfeYPJUg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="249027672"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="249027672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 08:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="518079650"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 06 May 2022 08:29:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 08:29:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 08:29:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 08:29:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTCm1KN0iOHAyExO+4Jq8fVTlbVeHb90+m//DTfpFv1xNjqBR1l5EP4wCoFWBsMusoZv5BRT4JDGESm5I7a34qpZgxiq4/GT3ifit1mnUdxsQf5TtRRJkeXCEo1zd2stuvHwQd98l3y/sJZMlJ6zRVgQ+eJWnwAN7HBm7oIQRGvb1pHz8LKM9qDV5XPE9ZeOZcvjLvP3YLReIUed7vygHjbjg1tBwNOagiG6RCIqx7eK8w7yeVrFUnIW9QPLiPwVH3hqpTIYKSYzoWYb7qxWzzkGE77gGpNjXm497zLyzGTQMNBsuwnJmMkctmSQ2I+/eGlTOrm+hzVtzvvMm4HZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rULjwa0+i/ypNID3G/V28OXUEb7lYFNB3YJi2Qcadbk=;
 b=a0nh9FP0XOsO6V2rAnflISoKKbZg0Mdz0KQKKOmlUG1dtYXw1NokerjyVy7ZutuXR2Werj5Ip/QazfXk4FmcWbD+H4nVx98uvz1fp6BAsc0GwabUVVRo2HYN1ykDrnNdjlBk1d7AfOu+4ccMbdc8PNeLfEyrsNLwd7ZWyuLi3GsCGGmx99zxK7aG7aT793sIgFWoHJBVboKCV1N3aTGcw+H95TS60aW3Us1gXnsph+xWJp12dslnwfzI72i0S8kKt04l5I4XGqPyNPPRYaCC0julms7uoNBjjVcKNxBW0swJQvX/hlrtM3Oq00ZUi84IiVKhqVlLeeMut7hPBa4poA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN6PR11MB1587.namprd11.prod.outlook.com (2603:10b6:405:10::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Fri, 6 May 2022 15:29:01 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%6]) with mapi id 15.20.5227.020; Fri, 6 May 2022
 15:29:00 +0000
Message-ID: <28e7b768-dfa4-eca4-9d7a-5e8c6f54bc27@intel.com>
Date: Fri, 6 May 2022 17:28:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-3-cezary.rojewski@intel.com>
 <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
 <YnUev8Rs42xLLE6Z@sirena.org.uk>
 <4a808f4c-83fc-747d-1536-d276138e57b8@intel.com>
 <2849fc32-83b8-4727-0aea-aa20b4d3557a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2849fc32-83b8-4727-0aea-aa20b4d3557a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b505dc3-ed2f-4a21-bec8-08da2f7524fa
X-MS-TrafficTypeDiagnostic: BN6PR11MB1587:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB15878518BC687607F7B984E9E3C59@BN6PR11MB1587.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KV19PvnqQBO2Ba36m4rRz6P47DM69QujJ7+Zi2wCtv98riBnqKUI1VrFTvduQtj8JwH2Sl217MnYjltJoUfB7YH5KjZD7ObhMmd26WKX3lVoagvRURECJnaoPkAbdv4a4RP8rYShvLeLNYqV/TtD1OUgyvL0ygPAdebOhwqCFS1u+uKQ0OI60pQgEsqN1svg+ghYzQDrrZn6wUD7boHhKQMlCs0qrSTnZf40Xq7S2R910wOUArVDAE9dymleBan2eVLbeLbf1GFmHJKq4bo0zmKdvEaJyKPCPzw403OEn4yfKP0IDjgijGKC+O/YK9Oqfo8s5h+62zvKeD5Kby19E4Hbhw/HkTG5Evy7aNHk5H8aFuOW3CQWsN9UU+ypYqso4XrJUhf63CZFuMowwnJQeGjQfoHU7MvziATtZIY+WTL9BixCFsACPqm+I9peCKP2R6tlhrUvJsIpJ/pTSUkIvmPeMru1BQsoGegx1iV7yF/zVkYmsRqaldNLOe802CoyNczkczIjEdp9Hd4waXLUHVf7JhRyVIvA3tWr5XPHez8mfxe6Rq0WC9TKmrvmYnjVPmlgCeS3sRALmkRJXmP/H/WnKqK2aB0q1yy+/bJW3+ygLfy/Deq7mc86DEACDlf7U63ctbFimSluVXV1iVt2ayW1MKe26FBS8S6QWo6bAfpcPm/uflaVGgZ9PhYP9foHF/TjvHIQnvspp7k65fGyPROvsUtPvLn4Bdtt1seyVJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(6506007)(53546011)(31696002)(6512007)(26005)(2906002)(6486002)(508600001)(38100700002)(8936002)(6666004)(36756003)(82960400001)(44832011)(5660300002)(4326008)(66476007)(83380400001)(8676002)(66556008)(66946007)(7416002)(31686004)(316002)(186003)(110136005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGFMZGdrQXNQRkpTL0FpbWhPckVKTnNzS0JsSFNiMm5rN2ZMbHE3MGJTZnJ1?=
 =?utf-8?B?bC9CT1dIOCt3R0RnNjlGNnkwYUtNeFJyZURzTU5yU200ODN1dDNoR2hsRGp6?=
 =?utf-8?B?N2dRTU93c2E5T3lDRVFUa1VLVkVuS0R6b1ZQSGJNbVJWMENpZDFJS1JzTURx?=
 =?utf-8?B?bXhDbWcxZkxPdVlmVVlTOWdrUUE0VThKNFhpdUJhOWJINHJhdVZYM2I5VVAw?=
 =?utf-8?B?R2NyN21TTzdIMTdrR2t3bWNOVTNVOVZEazV0WkVLVGF4QUgzcG9ndVRadUdI?=
 =?utf-8?B?MS9RZEgvTFZvOFlMSjR0V0FnS1VtU0UraXR6MWo4SldqNUNOM2U0UERLd3hq?=
 =?utf-8?B?c0p4VHlab25iSjh4WkM0ZFQyaVpTNUJjc05jQkl6cEpLa0w4R2tPQzdMYjll?=
 =?utf-8?B?T3lmbVdGbU9wdFpwOHJ6Mkw4b0V4bzBlaU1JVWtpYnBhMDVTNjFvUDFNWU54?=
 =?utf-8?B?OXErc1dscVhVMWk5TXFtWE0wT1JGOTFxTTB1Mmx0OUpGb1BITFA0VGJycFhv?=
 =?utf-8?B?ZTAxZFpnd0pNVDlSRjQvcUd6YXFJQUxBVmJYWWEzRVhRdVVrK0Q3SStrd2JG?=
 =?utf-8?B?TGozeUZzemJDdnBGNlFtUzRDLzlWOVVlS3JGbGZpY2dTWjBRQmFhU1Y5bTlS?=
 =?utf-8?B?K0V1ZjZQMi80QmZQMTVPaWEwTDNMTUxzZytGbzZ3Q3I0RWJ0NlN6RzRvWXJ6?=
 =?utf-8?B?cnlwT0pabTNXWTk0cEZiRFhXL3RJVzFUU21vWTBXb1I2elNoVVVvN2tZTWd0?=
 =?utf-8?B?d09xMTFJaFQyU3ROMDkzNjVoMmpxcExtNERiaFBITnFndzZYUHRod3FlUVp5?=
 =?utf-8?B?akhWY1NxYW1MMEZmWnN1MHVQZm52cHRYdHdlaFRTV2JHUVY4UkVvcXVTWDgr?=
 =?utf-8?B?T1hNR2tsUDlOa3hrS3ZacmtUOXU2UFoydDAyaXNqdG5Ndm13dW1KSVNCRmZU?=
 =?utf-8?B?ZGhFOHIwbXFHQ2ZON083TTdtYjRWZFUrZ0ErMXBFNCtlR1lMT3ZyWXZiNzg5?=
 =?utf-8?B?eE42YWRPZGNNOUlEcytsYTBCaGNVdHBiNEVJQnVXeCtSZEY1UkdkLzNQMUhn?=
 =?utf-8?B?TisrZ0RDcWUwTGZIWVorb2NzSDNiRlpuYUJ0RGlkazJxNlFmaXVwSlMydFFr?=
 =?utf-8?B?dFc4d1hKTUV2dkptR0NwalFnaEJWN3FnOVg1RTlSTEoxc0JFejhGWFFrWm5u?=
 =?utf-8?B?cC9RT0RRNWVBTzFHZzVWeGRBMnRFV2Y3dnJMd3MwQS9ra3NMOWpJTzdlYUcv?=
 =?utf-8?B?ME54SGtMRG9oS280bkdWKzRpTThYc041M1grQU4vbFViblNrbVh3aW55bWlq?=
 =?utf-8?B?TDdVNGJYZVF3dU5RZmF1bEpEQUYxZ3BPWUZZRXZVallheDZLS0hzQ3B5aDZr?=
 =?utf-8?B?amdPc1ZncnYwUVNrL1FaSUlmMHZRQ1ViYkJiWUFkU1k2d3k4RTJFUk5HcVow?=
 =?utf-8?B?UzlvVXkzUUFQSFRoZ08waEJVZTBrc0J6b0VWQU9WelhnOGJwNnY2a3ZRVlc4?=
 =?utf-8?B?RjNLakphaEZKeEgwdC9STkZmMnZ6ZFBTYWkxQVgrK2JManVKRVR2ZmtBTkU2?=
 =?utf-8?B?T2lDS2JaRlJlK2crMGlKZW94S3lEUmE3THJOTWl4OTBMa3NQbllLaFNxU0Rw?=
 =?utf-8?B?Sko3dzVLVkZQTGtMUTVXeW0wZUYwVFdVMEd5dnlPZjlBRHdPRjV0VTBSN0Za?=
 =?utf-8?B?dHhrdURYWHE1eTBOS1Q1WXd0dEVtRkVwSkM2TXBoSFZkT2ZPK2ZjM09NREdk?=
 =?utf-8?B?RjcvMWF5Yk5QMWtkUUlmdFJEUU0zRi9SdU1maG9xZTlkQkhCMW03ZnlHdGpH?=
 =?utf-8?B?U04zZ3hWaWxncWJ4ZEkwSUo5emVOZHB4MFFSODE3K3NSaFcvRzNjaU1oRFpo?=
 =?utf-8?B?WHdsYVp3cXRDRThIVlVzcHppTERnMGdVYmZVM1c0anptUTFBUVArbnNjVlQ3?=
 =?utf-8?B?ZExweUFBdEo2VEpTUjF1UThyKzlNaWxia3A3WEQwOUluNkF6QjFBLzZFSG13?=
 =?utf-8?B?OTcwM3N3eUpDTlZ3ZitWaVoraEpkb0czcW9mdU1NeVBDdVo1V1hQZitZYWhw?=
 =?utf-8?B?VHBTVUZHNGd6R01PVUNQV2dyay9xMGpZcmRWWE9haGxSYVJMSnZ5aE1CazZq?=
 =?utf-8?B?VGtEaEFyYkJRenVzQVYrUUdabytMaUNFeWJ4ZGpyNnVyODJXNEpXVFc0Nmlv?=
 =?utf-8?B?dmlIaGpYZXd6U1RTT2ZqTE1kSm5DL3A2SWNEaFczUHVsT3Jna2dkTWduWU15?=
 =?utf-8?B?ellrT2NIRXppN1VGdEI5Q2NGSFNpWnFqUFVRN29SaUZTMHgyOGh1NVhib21T?=
 =?utf-8?B?R0VrZXJtZjUvTjZDWUQwdFc1MWMwa0hlUnczekNmQlVIMEJsMHV4VHZhSGxy?=
 =?utf-8?Q?qKDs8I7Kd3i6P7s0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b505dc3-ed2f-4a21-bec8-08da2f7524fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 15:29:00.6469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lDopAInTVIRnJNrdxOT0cCnIAw5o4yjCVRhnJiSG6Sel2ZQYSS+eQIuaRey/SMtEIXF8RQTuFGubsOpDXnF8tteUUIbFSvoVCeQFgogHhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1587
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-05-06 4:56 PM, Pierre-Louis Bossart wrote:
> On 5/6/22 08:39, Cezary Rojewski wrote:

...

>> Sorry for the late response, did not realize there is an unanswered
>> comment here.
>>
>> So, the rough list goes as:
>> - hdac_hda.c hardcodes codec capabilities rather than aligning with what
>> sound/pci/hda/ code does
>> - merges HDMI (i.e. Intel i915 audio component) and HDA DAIs together
>> whereas these are two separate devices
>> - because of above, implements custom search/matching mechanism for PCM/DAI
>> - cont. because of above, its header hosts private data struct,
>> unnecessary complication
>> - follows HDA_DEV_ASOC convention rather than HDA_DEV_LEGACY causing
>> misalignments between sound/pci/hda and sound/soc/ behaviour
>> - has basic PM runtime support and does not survive scenarios where
>> resume/suspend + denylist + rmmod/modprobe are mixed together or invoked
>> in unordered fashion between this module and several others in the audio
>> stack
>>
>> My suggestion is different: have all HD-Audio ASoC users switch to this
>> implementation when possible and remove the existing code along with
>> skylake-driver.
> 
> I am not against change and will agree that HDaudio support is far from
> perfect, but it's been released for multiple generations from dozens of
> OEMs and mostly works. All the issues reported to us are related to
> codec configurations that also don't work with the legacy HDaudio
> driver, DMIC configurations, CSME authentication or system hangs that
> have not been root-caused [1]. HDaudio/ASoC interfaces are not on our
> radar as problematic.


That's why aligning with sound/pci/hda behavior is better for both, ALSA 
and ASoC users -> one place to fix the problems, both clients happy.

> Disrupting basic HDaudio support to do things better has to be handled
> with extreme caution and a ton of testing involving distro maintainers
> and community members, so we are talking about an opt-in transition, not
> an immediate switch. We've done a similar transition in the past to stop
> using a dedicated hdac_hdmi.c codec, see all references to the
> 'use_common_hdmi' parameter in the SOF code. That transition seems to go
> exactly against your second point above on HDMI and HDA being different
> devices, so this could be an interesting debate.
> 
> Changes to the HDAudio/ASoC support would need to be handled with a
> separate patchset anyways, and the SOF side changes done after we are
> finished with the IPC4 and MeteorLake upstreaming. No one in our team
> has any bandwidth to help with reviews or tests on this topic at the moment.


Agree. This won't be forced on anyone and that's why separate 
implementation needed to be provided. There is too much to cover if we 
were to refactor hdac_hda.c

> I will also re-state that the removal of the skylake driver can only
> happen after a long period of deprecation, when firmware and topologies
> have been picked by distributions and all users are known to have
> switched, so it's very likely that any alignment between "all HD-Audio
> ASoC users" mentioned above does include the Skylake driver, doesn't it?


Nah, I don't believe we need to be saving skylake-driver here. By "all 
HD-Audio ASoC users" I meant sof-driver as it isn't going anywhere - 
what cannot be said about the skylake-driver :)

> So to circle back: is there anything preventing the use of the existing
> hdac_hda.c codec in this "ASoC: Intel: avs: Machine boards and HDA codec
> support" series and can the HDaudio codec change be done "later" in a
> more organized way?


Yeah, all the pm scenarios will fail when paired with the avs-driver. 
The expectations are different. We'd have to fix probe() and remove() 
(and related) sequences for the hdac_hda.c, and given that its users did 
not notice prompts further problems with the refactor. This is very 
similar to the skylake-driver vs avs-driver case. We could have applied 
~300 patches we had internally that prepare skylake-driver to be 
re-modeled and then apply patchsets which look more or less like the 
avs-driver series instead of providing a parallel driver.

But the reality shows that such approach applies too much pressure on 
the reviewers and leaves no fallback option for the end users if 
anything fails along the way.


Regards,
Czarek
