Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6785671AD9
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 12:39:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E3756381;
	Wed, 18 Jan 2023 12:38:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E3756381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674041974;
	bh=QHXCSI1rndu+DsyA6pnmfHyvx2lRsgHnMFqgPKIxpLI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jF8YuPZTL0HDOk6DSPqYsg7LJoQifUV5X7VADUxMyTilhGKEmM1CJFeZAR0ckegis
	 rtzrqsqvvk8+3+UQ0kRJjvl0ga1SrlDsqr3wdfDG6eVC+cWTrq6nXm7lfeFXaxcfQk
	 JWQ3bVJ2kQ1eq+IXrJ3Au5wIJw0dY2DGWcKXlKQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE5BF80482;
	Wed, 18 Jan 2023 12:38:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFE0FF8026D; Wed, 18 Jan 2023 12:38:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07574F80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 12:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07574F80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CHYyZrbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674041908; x=1705577908;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QHXCSI1rndu+DsyA6pnmfHyvx2lRsgHnMFqgPKIxpLI=;
 b=CHYyZrbfvPZK8/gAtNliVNB/ZgehTFyhx2gEH+WlHRFuByq5ZpNuIZ0Z
 VR8TbJoqw4MTk1L47OWf8tMfzxjJca6Ndqj37qJvizO63NTiLmAcaAtnE
 p3ubs/ACav8gknTWSLn8mhVVwPUg9P3E+XmIQYD+VF6bzo+UNodz4zwQn
 GUKDnIH4exuk+Nkg2utZw5W9zJqHomavcRzIpmXBuWNIG6z97aFOOfBFD
 X6qzC9lTjatxYNEdjEPmHAKo3IJngTqphxwm3Gc+RdzBM1ZZChHZyB7z+
 HEc+VhErCfENqJ+cM1MX3hSUSpwNzASS+tm9qLVRHRSj5HT+3UTNrdspr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326233605"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="326233605"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 03:38:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="661671231"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="661671231"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jan 2023 03:38:24 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 03:38:23 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 03:38:23 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 03:38:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW8HnnqO2tqpEOXzH2uPLfeU5MDRhK97INBuSaDlETUMi9Sq46aUwD0qP7QpHy+3uC6OZPbLyePTCBj/StJI0J6zI2uuq+W1GmB29yzqM2o0EF62xlYq8TeK6UxxDIgapjJC7iV3H+JP7w/sSWKp1kzvvrpYD5YYYK3IWfUEy0pk+jz0jSxV8HGqV9V0H/J0PyrxCgvf/XaZ1YMHjNZ1pG6IUGTCD/EZqV9N2E6lmC8RArgfd/U17Ib9Ct3Zr9Z4K584rl0EYmnVY4mH33LCM+a4utguhr3o1YWXfmKwNiMHt1xu9YxbbVvOFqE8ucrCIv4hn3q+6utTp4stsw2tHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiYaBfnhbnuIVUWJrPD6PlLojdFwhlvrcACgAnDT3qU=;
 b=GvYD0LSyuEg6qes8e8wIA2iQWVyv2Z4cEa7bsVgLltxV1GgpJ3DZcwFyuFFWxsUQpIZevNz+HDoCqGnoCv7UeZF48HCgJMtEFg0YMGvWwTAwHZ0+q6mdZg0OYN6UcreZMUBjN5JiZKEgo0IabEnKTt2nYnI9RSs1S4ZZp4x5kxo2ZNVwheCqvd5/eVPbzB9oMELyqSP1yxz/NW+TXlVQde2KhgTFrSf9IU/QS7sHAvia6OzBiTghFq6yO05RvthBiQ/CeGu2qq2UgMHBHHrcOVQCGeIyOQY+9K55s8bxTTrwYEIK5/NwQkdbOlbFM5L5yyToqnrzgHUuKHd6GZik2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB5016.namprd11.prod.outlook.com (2603:10b6:510:32::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.24; Wed, 18 Jan 2023 11:38:21 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%3]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 11:38:21 +0000
Message-ID: <533b79eb-443b-1181-5ef0-8e1c6bc62e02@intel.com>
Date: Wed, 18 Jan 2023 12:38:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20230117154734.950487-1-cezary.rojewski@intel.com>
 <c4c5c2b6-7a73-eea0-e249-73441a6434d7@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <c4c5c2b6-7a73-eea0-e249-73441a6434d7@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::30) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH0PR11MB5016:EE_
X-MS-Office365-Filtering-Correlation-Id: 7718b84c-e825-47c0-9ea7-08daf9488059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0w+k251vcwUuRg8woCag/SlAZqgoH5XLQPbYLLS1FAAxWJr1g+fxt8b1M/BQSdd7K5hXSH0trua12lucowCFtld80GgQJESdwklQmxFud+/ZhclXSkspphvZk7udKvDOAdXtthLkj9uMPix9CCII1y21/jm2Vuvl5dsqUdr05XVVw67o+3t8X42ZVGpDIGfJ08mHYuXRf+YALMRCmd/wve7G9Xye/0u85t2hbnCxqLvx7V33uqjPWKhPs9jtv1JRLvGi5f0uEmfqSr9yvxUGN+9XrYpuB1kR4FGHLNqiVFAgW59X+M4nIs/VmR4tKLaszK0e2pkbc6SY6KWvF89BH1J4WaBnyEz6HM3jj31VYS/QW95xJwI9s5kVlmPr+8HF9ItvWAhxcC0fnXUN6z6u1raThaSvpv/OJbgYLQcuwwGppn2/1XCV+FPS35VJfVwvyKk9an/3R+1QW5xfc2Z3AuK4sftng/HspUzcI+X9ZKbKsLzJ6kQab9CP3V5Z6nD6jtOFEtP3d0AzpSxjF6CsVSChprZGJ/r2u4tAaRUut9VpN8sFZ21gh8NtSbqsUBQTO3fx2ExQPcRG+bn8vo10gvRNQJE5XByfe7jP9MCd8btx9Byb39UB/v3kzvRGtEu1npYTN6dtSv4YkloF2AQIeXB1FvTc2prI2mXaCueWeS6wQvAcEJDkepxvln3cyXrLQmcnG1tAKfVURxGqrtYM4tGZxK0roAReiGey0n9Hlyo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199015)(38100700002)(31696002)(36756003)(82960400001)(86362001)(31686004)(2616005)(6666004)(6506007)(53546011)(478600001)(26005)(186003)(6512007)(6486002)(44832011)(8936002)(5660300002)(2906002)(8676002)(6916009)(4326008)(66946007)(66476007)(66556008)(316002)(41300700001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnNZK0lYeXIzNi9SVWdKdkxNSWJZbnZLdDZxa3E1bUNlQ0lJV0lvbzkxcHRH?=
 =?utf-8?B?QURtRmIvb3A4bnBPWVdhUDVtN2ZpVHZXd09ZUzVSSjJWUTdUWDZQT0RNamtZ?=
 =?utf-8?B?VkZWdGkxOXR1dHJvUkRNblpuV3Y1dnVZdzhZdXp4NkdnQmUyaUpFTnRLaHA4?=
 =?utf-8?B?K3Y1ek82cm94VkZGbjNMUEc1QUhMMDNhT2wydXJHTnZQSU0rdEQ4T3BzOVA2?=
 =?utf-8?B?a3E2eU9xN1lFMER4ck44alloL2pYa0FRaCthWWhtY0w1TG5hVkVmMGxXK2VG?=
 =?utf-8?B?dTVvSjh5NDVkNkZldml6NkgxUVY2WG1PeUsxWkxhQllZeTZ0dXpzSnQyUzBX?=
 =?utf-8?B?dk5Jamd3SG9EY3IwUkRyU1NMdG5LODgyejFBckp2ZzZKcGw4aGdFaTQwcldU?=
 =?utf-8?B?UnlhWFN4T2VvNzJIdU1qMFN5bUhHbnRXVHhFRWZBRkJlZ2R5MXB4TFBERzlN?=
 =?utf-8?B?azZQRU5QK00yMWFhV2pXM3NtMS9zamdYZFFzaDd4Y2tJTFFwV0EveEh4NU1B?=
 =?utf-8?B?Z2RCWExtUys2TWswU3N2UlRaeUZrWmE1YmVQalY5M2F2Ykp0YjNrMHdzd1ZB?=
 =?utf-8?B?a3dEOXYvSGE4MXNJamhLWFZDbmwwdjVTRlE3cUFXRjkrYjJzOXI2Tkl5U1Mx?=
 =?utf-8?B?TjdFSEdkam1QL2dFWEJ5TTB3SmJUd1RBTkNZbGN5QkpjcWVIU3hzdVdtVFpr?=
 =?utf-8?B?eDJ1c3FGeVpBZ2lwM3Urb0xZRGNxaVFVeW5aS0lXVC9BVTlXM1lPYVNUWHkz?=
 =?utf-8?B?ZXcwOHVGcHUrZ3ZkUHhrT3BxTmN5STBjM3lSeVNMcGtlOU9aKy9pNnpPbE92?=
 =?utf-8?B?eHBLQ1daVWFXbHVvdlQ5cUtiSkpVeXVpdnBzYlcyVmFpSW9DWWJBaE5PMEJE?=
 =?utf-8?B?ZzBKZ3lsUzN1KzhuQXJmQ1lNMFpyLzBpQnR5VDJEdnZrVUl1Mk12cnZvejNq?=
 =?utf-8?B?M29aY2ZPQSsxdlMvK0dLK3pYOTI4c1llZWQ5WHhWTkQyc1ZKUm1yWWlWNENj?=
 =?utf-8?B?Ty95N1BSVG5LNmhhbGQ4TlJ4UEsybGwzaHV0S2ZFZlR3NWplaTlTa05FTDdh?=
 =?utf-8?B?R2RpbWljT1dlTi9xbm9rdWZRR0thdkJuOCtTQisrSEJnblZLd2ZuNEtsVFlu?=
 =?utf-8?B?dVlwUzRhZUQzSkdXTVNJWDBTTFNmYWtDRFkxMlFOZGw5M1lVRFp3aGFYM2pE?=
 =?utf-8?B?RmFlMkVyVlQ5eE52S1VicXdEL25uV0hSUXc2ZHZ2SHVReS81d0ZnWWRVOHNu?=
 =?utf-8?B?d21aUk5LZXlUSDA3SzJyeWpEazFWT2xVUUQ0WFFINTZROFQ0ZDExT3FhZ2gz?=
 =?utf-8?B?UHBQc2szcVlkUHNpVGxZWUEwQ2wxK2lIcjdnZ3ZkMW90OWtMdlBKY0FkVU9k?=
 =?utf-8?B?a1JPN0xYakFLem9SS0xSMUNYei9wMVhheDNlbEt0REk5ZndndVRKM0tXNWJM?=
 =?utf-8?B?bzk5ZVlxM3hMQ0tYZWM5cm1GaGRSY3JCM1NCUjcvL0d6Zy9nN2tWYTBvUElt?=
 =?utf-8?B?S0QzbmhEaGhNNUdwODhwNjZyK3hDZWNnT2YyQjNITUxjS2JTRmdLYXhNMUY3?=
 =?utf-8?B?MnV6enE4ZUVHZmFLOC9KZFhkV1R3OEVnUUdjSHBCakxlK0lOZlNBcStwU1JR?=
 =?utf-8?B?U0hoQ1VCZ2RPVVIvZTkvNk95dUdDWXNBeldhZ0RvZVU5TG5WVUdpQkZacTJK?=
 =?utf-8?B?ekFzV21wWDVySk5WUyt6MTBlN2twYisrNEhOaWgyV3o4Z213aDdhQ0d6L2c1?=
 =?utf-8?B?ZDVOZnpBbE5acTZaU1A1aTFzWDk3MGVJQU1KcklxN2p6UGd1MHIwakNielJO?=
 =?utf-8?B?K3l6STBOMDlMNGhaQ3pVSHZnUmRsaUErSHFCUjZuQ2JjbUhxeXJ2Zm5GM0JO?=
 =?utf-8?B?MUhGQVlidEhmSmFHVVBEL0drckNXNlBwNFpOT0s4UzdzZU9yNXNlUzhRN1ow?=
 =?utf-8?B?YlRRNTB5a3JDNHJjM2lrajMzc3hUM1Ixc2E2a1F6aWVySlJpTzEwV3kvNno3?=
 =?utf-8?B?dVBnWklTbHJoV1A1aElXYlRWVnNXOXIxTHhQdFFVSVFYMzVUYUZiRlNIYm9l?=
 =?utf-8?B?bUM1SktnN0JGZUhOQUppQkZIaldwVHBrZjVTZHFKTWM1OG1pSHBsMHhtNU4z?=
 =?utf-8?B?dzEwYWFIL3hCU1I1cXhXaFdlTlVLR1dQV05jSmJUUmpEaXlWamtmL0NMQWl6?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7718b84c-e825-47c0-9ea7-08daf9488059
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 11:38:21.5008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTLH2ADYs3ly4ItPwjtQZUTd59sfklMuBULg7pfVZ7n1WkuQp7qIIcOE8y97iEFwdhIt8EQC1jVPq+l4T1Qq4iemMFBC9zn9s6qwUf680zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5016
X-OriginatorOrg: intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2023-01-17 4:48 PM, Pierre-Louis Bossart wrote:
> On 1/17/23 09:47, Cezary Rojewski wrote:
>> Several functions that take part in codec's initialization and removal
>> are re-used by ASoC codec drivers implementations. Drivers mimic the
>> behavior of hda_codec_driver_probe/remove() found in
>> sound/pci/hda/hda_bind.c with their component->probe/remove() instead.
>>
>> One of the reasons for that is the expectation of
>> snd_hda_codec_device_new() to receive a valid struct snd_card pointer
>> what cannot be fulfilled on ASoC side until a card is attempted to be
> 
> very hard to follow.
> Is there a spurious 'what' to be removed?
> Or is there missing text?
> Please consider rewording with simpler sentences.

Thanks for the comments. 'what' is here on purpose as to my ear this 
sentence sounds reasonable, but I'm not a native English speaker so I 
might be wrong here.

The following is being explained by the commit message:

- functions such as snd_hda_codec_device_new() expect a valid pointer to 
struct snd_card instance
- for ASoC hda codec drivers, when hdev_attach/detach() are called, 
there is no possibility to provide one to HDAudio API as card components 
are not yet enumerated
- once component->probe() is invoked and succeeds, component->card will 
point to a valid sound card
- hda codec driver is now ready to call snd_hda_codec_device_new()

>> bound and its component probing is triggered.
>>
>> As ASoC sound card may be unbound without codec device being actually
>> removed from the system, unsetting ->preset in
>> snd_hda_codec_cleanup_for_unbind() interferes with module unload -> load
>> scenario causing null-ptr-deref. Preset is assigned only once, during
>> device/driver matching whereas ASoC codec driver's module reloading may
>> occur several times throughout the lifetime of an audio stack.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
