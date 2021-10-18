Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA60D4312C0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 11:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4685818D4;
	Mon, 18 Oct 2021 11:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4685818D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634548135;
	bh=xlOVVWqTr0q6yD1h27iTbeWih2xvOIVxMxprnJ1+tL4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ODmxJ6QzGyM0cDTKYvgGH18qN2N65LrSm0vAKmj8LoI4TLTp61lbPP5CvQ1y5QHSk
	 XWj3yp6AMoOJxkwRaMrEnF1r2I29GWtvgQpR4P+4fuSNzIjMCgEB9IdhR7fWVX+xef
	 BtejcRqXFcxpTicI9gzdpCCkeWYhbjsf1daNqYEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE253F80111;
	Mon, 18 Oct 2021 11:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D98E5F80224; Mon, 18 Oct 2021 11:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33191F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 11:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33191F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="mwDr9bI2"
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="228480167"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="228480167"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2021 02:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; d="scan'208";a="482651238"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 18 Oct 2021 02:07:22 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 18 Oct 2021 02:07:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 18 Oct 2021 02:07:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 18 Oct 2021 02:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+1aOSxXDoVyyKAf6pGGNf++5mbLPE0koX6opqjfh4yxIL5HOv5GrQ/XZSgyRrcAiPra7gizW7gRiR9m4o66CTMw2KaTXc4GzkNBRTMO/dzObQKosAMnogGyiZQgVA/Wm8dK/TMEe7lCdmccVGTabgzY0bF6mi0cDf2WAoB+ykuyFijSDvIrndsdUZQToNDTRXVE7Kq+y34nmFCd51PdwbbwhkwA0JcSuB1AbCeiVgSDZmwrOkl8SRKzYSKQ0B8gL02F+8ORnyvTtX5YWL4YACDp7XAWVDlNFDmvivHKKOUCirC0cNG9oMcvUXB7yJ+qJxCrF99ij01OUUfx9E+OOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7JAcccerW9yA8NV4ezaojU7/dintdYKBH6F3IvNcmw=;
 b=EHJe8kB2h/mWQ0BJqdRe0T10YlzlOQZzns+2eK1WXtWww+73MKAIFT9duMI0k4cpqFIWJOx9+JtY6DdwE9ZQXuZQfWlD8j3tALJjBnZy+ZZuK/plW0zVOfNG2zOD7nSJ2T+zy71WjxfTUU2ZX6dV1f8WD+frXBaJeVSa9vDqZccYoZj3R0VYqEgX6pl1yyjk0RajuTumF074xOHoTLoTKP+ypi1oHu1TQPLRiXjefCrGrqlTqvCD+2fUxoc5jm3vpRD/dWVilMVXwZfclDvTBeem+5bW57yLv7JMmgQgZQZIjG9ezmiUvPXAonJ2aNtEm39LgTtGdyUDUT3OtYJFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7JAcccerW9yA8NV4ezaojU7/dintdYKBH6F3IvNcmw=;
 b=mwDr9bI2dY+jiE/ch+92QpYpFHBJbwFWOoj7r5tzXpOzcuzoc2jPROSvpZO7CLx1QYuwoLtTr4a11lXDGYLGjvgR1KkXjEqGKAT5JzrMxMSkoAHO0a473v8GSX6uC6hfrkWSjbHm9HR87HqOydIiJhpm+7WngtwHM/+260IH/Z4=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN8PR11MB3540.namprd11.prod.outlook.com (2603:10b6:408:81::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Mon, 18 Oct
 2021 09:07:21 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 09:07:20 +0000
Subject: Re: [PATCH 1/5] ALSA: hda: Drop device-argument in NHLT functions
To: Takashi Iwai <tiwai@suse.de>
References: <20211015164047.44492-1-cezary.rojewski@intel.com>
 <20211015164047.44492-2-cezary.rojewski@intel.com>
 <bb2b223e-6318-ed3c-bbe8-31ba4b8d02fe@linux.intel.com>
 <s5hr1ck5bqu.wl-tiwai@suse.de>
 <fe697391-339d-5874-4959-8f0f436280f3@intel.com>
 <s5hbl3m68pl.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <002bde61-eeea-a1d7-2392-488c5359ce97@intel.com>
Date: Mon, 18 Oct 2021 11:07:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <s5hbl3m68pl.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB3PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:8::15)
 To BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.109.178) by
 DB3PR08CA0002.eurprd08.prod.outlook.com (2603:10a6:8::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Mon, 18 Oct 2021 09:07:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 439182e9-54b3-40e8-97ef-08d99216b11d
X-MS-TrafficTypeDiagnostic: BN8PR11MB3540:
X-Microsoft-Antispam-PRVS: <BN8PR11MB35401ADCD2A8824FEA31F584E3BC9@BN8PR11MB3540.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8vSHl9W+fCni4bai6tzivU0CE+o5HZKM/rgpRrF2uXU0Vty9Sx4dn7nmIjUsMeE2RyqIC9SXZTuxSZ66f4j/hSMPdZ+uPpPmdYf0vIPT+oEeD22bTH8IPHKZ+9606Vy8RFnt1LueRmejlHsnLcyHTySRqVknGpTC0hqTMF7wiumusvb/Qb4IjG0BeilBc7sCl+u3ubj6Ir3IVgswlmKVp9c1gv+awA8bd71S0n03k/O/j09gAK6SGawFSQoWrxpkDR4PVBuACfMc4vVJAM2JrRCBQCPq0J3pd30J6Af6KEkNzAE6Uf9xzmGmCqILk4pBmX7343KxK5jHpbBA3fndhu+gjfazaeC+QAuQCNmtnFDyVN0jW1eAx00IRuafA9JAKHzQXgX01mhQDNhEGSeEG7tUhO+NEKlh+eDEKZFPDP6jtX0i8IxorFNQTU80HLWpJ7bGVdAVrb+w6hw8k2g/kwMhrK7xt844z8FxNKyhLydGNkNWdb8rWAT1SvDDJtb2Ul5Neei6sqE01b7WffdQSZw8JsSAUrkKq0QU3YvRsx+EsDULEPPDf3RuPg+u/C0uoT2T3szDRVhrjLRCivmtMYB1HAA/B3lwu0HR594PpespDxx86wgsJd610LglubjsFqyrSKc63Fv6VmEo4lM66z9I1I3AJ+GPxyDEE0dmi/2tsGk4sU/pDcYheuwkmwXIuAaOuYNJLLHcV/KgDff/HrYqSbbr72fTpHYnSVkayHTuNRa+K889vF9PTJwWgeytSK57ZtlM59XAIorAnFRcsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(54906003)(2906002)(82960400001)(16576012)(508600001)(8676002)(66476007)(6486002)(53546011)(26005)(86362001)(38100700002)(956004)(66946007)(4326008)(31686004)(44832011)(66556008)(186003)(5660300002)(6916009)(36756003)(4001150100001)(6666004)(83380400001)(2616005)(316002)(8936002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjB2MTNJRmRyTFZzVjl3akNFN1BoeGVmZlNuQUY0MytsU2kxV0dYdTFERjlF?=
 =?utf-8?B?bG92NS9JTEVRVUtxTVIrYzcwZERlT1dOdGlpeC9OL3dWNHNQT3NaZEZNTjdv?=
 =?utf-8?B?VFdDZWN6UUNMQzQyWlN0VzdKZk9ZWExRRWw1N1dNa1BIMDNmVDY5RFA2THIr?=
 =?utf-8?B?Z25sZW12dk4rZG9iVkp0c1pZVWl2WmZLMTIvN2tvdGNKbUdNTkJIR3dHaEUy?=
 =?utf-8?B?T2xEcWNmc0d3TG5ZbHpVelB6c29NN09ZSFltM1k2Nm5nTUJFR3V3ZURRSlBH?=
 =?utf-8?B?ODhRN3BUMU1sWHRlVTdnZndpSHVjQ2NyVi9sSE1LMUpnQzBITVlVSXFmaC9j?=
 =?utf-8?B?TnFIWmN5RDZocm82WklaTWJhbU5VUGdFREEzUjhhN3hvYWZGV0hEcDZiV1o1?=
 =?utf-8?B?M0x5bUhXbnNwZXI1N3luWWpBVnpqelJTcHQ0Sjh4Qlg2REkwekd6MjVyM0Yy?=
 =?utf-8?B?SUM0Zm5mcWJWRlo3Rlhtb3JsdkV6cXVsQ2JIOFBVZHF0U2hRMXFaZXh2TjVZ?=
 =?utf-8?B?aXpZUGJhMXpFRzVUVE1wNXhwbk5UYXdrNll5clhkUUdMNUVJWXlSa0tRcGQ0?=
 =?utf-8?B?SjN5YVhkTlNkMXY0WXJ6S3hMcEtFWGdORFJrQ2ZtVGU4OXhyazZWVzZUNkQz?=
 =?utf-8?B?eXNhNWN2VGNoQTllLzlscXJ5cFdudlJKNTZZN29VUVFiemxOVWZrM0I4V09Q?=
 =?utf-8?B?aEV0aEhpUitzaHdDVnU3SmkvcklDQy9Ib1RncnFRbGFaWFNYOEVzRkhJRVRh?=
 =?utf-8?B?UTJTdm05dlFIdFRMSTczR3dzOXZROXFNVm5oNG1JeUFlandodEJoamJmL25k?=
 =?utf-8?B?MVJaOVMxd2FoSUxoMUNISjA0N1ZzZ2VZSk90S3dOZ1pvY0NaTERMT3V3c2dE?=
 =?utf-8?B?RjdxWXlsNGpoS2Zydk1jZGdtZTFhNUpKMFFpMU9uR0V5V3NQZ1Bpc1dyS0Z5?=
 =?utf-8?B?ODR2RzhTVjhaWDE2aEN5N3ZGOURqSUtiK3ozWkRXbHh4c2NFQklFNnRMUlQ3?=
 =?utf-8?B?cHZsZldCRi82b1RCVlE5V2FFNjZCOGVRQUFGMW5KWWU4TmhVMExVYXM3S1BV?=
 =?utf-8?B?M2VOT29hejlseWltSEgwRTZURjF4ckZGcGJTUDlTcnVZb3JvTnBWQWZvVWZG?=
 =?utf-8?B?QjJzcXpoMmtYWlk0RFY4Ny9NUk80emZ0bGpFSUlDR29GOXo3WlBZSXk1ME5p?=
 =?utf-8?B?QndrcnUxU3B1UExhWXdXZGhWUzdjMzNWZldNWVR3SzdMQmJIS2oyMEhHaWZZ?=
 =?utf-8?B?Z0hKa0tTMTZVU3FZZWtrSUdpYmtmT0RQU3BNYkEzdEJmRkxkam9Zb1JlTnJJ?=
 =?utf-8?B?VXJEdU5vTTF5ZWxYalJxbEc4bkM1N251VlA5NmlTMnE3YnlvU3VzbTBmcXBr?=
 =?utf-8?B?SlYvNmwwOEZlZFFsZWhSOEZ4OXpnQTVWMDc2TFhvRFVPd2dFTzU4SHUwSE96?=
 =?utf-8?B?VCthNGZicFlQaWwwOEk0elVlRkNHNDdRY2pYcWFLUWk5cUxNU3I0RGNDcG0x?=
 =?utf-8?B?YkZYZVZZeitSNXRUeEV2T0Z4WmxVQlZvbmNYTlVETDIzU0p0SDY4QUhHeXEx?=
 =?utf-8?B?cThXRnJ2OEpzdFh3SVR4SlM0V0FPZ3prWmRjdUE5UXVwS3E5UklwRWZtbkdX?=
 =?utf-8?B?dW5sSVRHQ3hpeTJqSVFRbWVUdWViVkFEVWJWczlteGRuUTEvcjJpSDltSFBJ?=
 =?utf-8?B?QWx2UEducmxycnZIWW5KQmNnNzRSL0ZJTjRMdmFYNzBGeC9vbTJ0S01YWGtn?=
 =?utf-8?Q?d/GStwojXzI8PH5/yv/jfFfr2SLT78bL1UxXtrc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 439182e9-54b3-40e8-97ef-08d99216b11d
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 09:07:20.8937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zhQdycHRNwAk9G0/qKJT8o3vbWu4d8RlEp+t0vPoURkypya0+JILlENdqReCSb5yky9FipyIPXise+MDrChhG6F4IMH6sZozo6DRHKqORM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3540
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hdegoede@redhat.com, broonie@kernel.org,
 Amadeusz SX2awiX4ski <amadeuszx.slawinski@linux.intel.com>
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



On 2021-10-18 10:25 AM, Takashi Iwai wrote:
> On Mon, 18 Oct 2021 10:08:30 +0200,
> Cezary Rojewski wrote:
>>
>> On 2021-10-17 9:52 AM, Takashi Iwai wrote:
>>> On Fri, 15 Oct 2021 18:42:33 +0200,
>>> Pierre-Louis Bossart wrote:
>>>> On 10/15/21 11:40 AM, Cezary Rojewski wrote:
>>>>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>>>>
>>>>> ACPI is device independent, so printing warnings using device functions
>>>>> is misleading. Replace dev_xxx() with pr_xxx() and remove now
>>>>> unnecessary argument.
>>>>
>>>> the routines in sound/hda/intel-nhtl.c are called from a specific PCI
>>>> device, why would you remove that information?
>>>>
>>>> This makes no sense to me.
>>>
>>> Right, otherwise this change would confuse user, too; they'll be
>>> clueless about who triggers it.
>>>
>>> It's OK to change to pr_*(), but then it should have more information
>>> that can be easily identified and understood what user should do.
>>
>> Isn't the answer as to 'who' used it obvious, though? NHLT is used for
>> I2S and DMIC endpoints only, so the question is 'limited' in the first
>> place. And then, you cannot have several Intel ADSP drivers running
>> simultaneously.
> 
> Well, it's not about you or devs -- those must know which driver is
> relevant very well, of course.  Instead, the problem is for *all*
> others who read the message.
> 
> IOW, which user would know and think "hey, it's a NHLT thingy that
> must be ASoC xxx driver that spewed" only from the text snippet "NHLT
> table not found"?  That's way too much expectation.  Some more
> guidance is needed in the error message.  The dev_*() variant gave at
> least the device names that can help guessing the relevant driver
> easily.
> 
>> Also, logs found ACPI-table interface are device-less so this patch
>> makes NHLT interface look more ACPI-generic alike.
> 
> The conversion itself is no problem, but the lost information is the
> problem.

Well, most invocations that end in error will cause stack of error-logs 
(dev_xxx()) in the parent driver. NHLT reads: Non-HDAudio-Link-Table. 
The name itself points reader towards sound/hda already. I understand 
that not everyone will google "NHLT" and such but then there are ton of 
kernel messages which won't guide reader by the hand anyway.

"NHLT table not found" is configuration problem, not a driver problem. 
Mixing BIOS/config problems with driver ones leads to incorrect 
conclusions what we want to avoid.


Regards,
Czarek
