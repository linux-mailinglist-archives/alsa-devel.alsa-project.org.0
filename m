Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F824EE8B5
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 09:01:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67E701740;
	Fri,  1 Apr 2022 09:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67E701740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648796507;
	bh=f/4QLzXT0CbdEWwrtYAd/2HwzIiLQ2uUVbByaCumNYM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9n5eevluoHrpKqBdC4I/jQ6So1R7OpTHZBJdOwaCDo2noJJWaj+4HZZLNl3XppOK
	 89ibkm7Ab3N9hUJ3LMq3CxQXrxTP7HSSdHvSZcCjvWUl9fNUY8UJ8QR+9XCN71BWeL
	 Umde6LJYeyLuG15koKKyAys55KM8jwVDG/q7hNNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAFC8F8032D;
	Fri,  1 Apr 2022 09:00:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25BF4F80279; Fri,  1 Apr 2022 09:00:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8B28F801D8
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 09:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B28F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eTib5CtI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648796431; x=1680332431;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f/4QLzXT0CbdEWwrtYAd/2HwzIiLQ2uUVbByaCumNYM=;
 b=eTib5CtIWsEANflLrw2rqnXoIMbKvuCWW05Y/0jgXpkYkPBzCqDEevZQ
 AKIKonsrNDfZc3JFr9Ld9rt1yX8AzPnHrnjJUFiSEfNzlO/zhyDvm6cmH
 QaLKKqWNZm5OsheVGgMB4lhwE4fBybryZVpINUE179WOauAumW2pddTBC
 VyaGtSmZSm9VGYKf0Wf9475LGUePwgHdaa7oyUSPu6HSjrEsfUQi5XuyQ
 Hm+E3ihrMS80fbu3gCFfYxUBfJQz9P4pQ8qAoT4y+Axn3QDCXQ4WTdwWp
 iZUdXgZLAeiIRyvlBOJLj/wtiTHy+FjxgFMqC0TZpWoEJkJTZ7xCp832Y Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="260238713"
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="260238713"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 00:00:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,226,1643702400"; d="scan'208";a="586743879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 01 Apr 2022 00:00:23 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Apr 2022 00:00:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Apr 2022 00:00:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Apr 2022 00:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNNTpVnbIvRzQHD6FyS/Ml8MinJzvRcGwhnlO7l1ZFG7GXhAj00r+fl1v6R22I53depd3bHvFhvSIZqr8slKLGW4Bbmc6IzMxo9qJbT8HjS0m2NvqVesJbRRELjb5H52zBXI2RO0i5uApT+UzSTkRx5/R3LglJR2fnB6eHVCkwnuu+89Woa6FHy7so2XmrMnJpp+bbZNNC09fg6iiiW2esjtORTeREYj+gSwvM1/Ixz+Ne0B9paeVG78GQXFIPw7oLOmKYGhSY/RTs7mXfncqE6ksaj+gj14Q/EtNJtuwYNLlo9HzDo+G2sdSVXnndIUmYb9+lEbsC/wA1jJdhweJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxQIQGJ26omoIBBEZLUcnA0hqNAqyM96Q+PFXmPXMNA=;
 b=ZprIHagIrb3btTrUNp8qGOygEJckMdY8tyKT/AzIS6XWFLkdV2xRVaAWHhk1HbC8jIswVkVa0BjhLzlxNkF9AilyljSXq1ynKSSR/1fxLXXJtywjV3eNuNPBqdz2oAASsc9eFaZf9igIq4De2KKsLOurYKCFo29RuSLrtUCEIagmt0x488d/T3GflCOu7igcvclOuu2MFjZ3VgpBWjCOJNSv1qZ1QVHrfqtFMbN96sFbzbg7SbRFFMoh6cD2qCZwJWmtao5PpfdpQc33auh+ROk+r/+jGZVxWlZzBeePAZmydL7eFumbqE6uG66iip4lqrR93nVKLZLkBHGr4Ye0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SN6PR11MB3056.namprd11.prod.outlook.com
 (2603:10b6:805:d4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 07:00:21 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%12]) with mapi id 15.20.5123.021; Fri, 1 Apr 2022
 07:00:20 +0000
Message-ID: <c69ee5e5-213f-389c-9d22-69addddf2aca@intel.com>
Date: Fri, 1 Apr 2022 09:00:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] ASoC: Intel: catpt: remove check of list iterator
 against head past the loop body
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>
References: <20220331215003.882143-1-jakobkoschel@gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220331215003.882143-1-jakobkoschel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6PR07CA0063.eurprd07.prod.outlook.com
 (2603:10a6:6:2a::25) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab60889d-99b7-443d-5752-08da13ad4948
X-MS-TrafficTypeDiagnostic: SN6PR11MB3056:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB30565F619D599B125CEE7A07E3E09@SN6PR11MB3056.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWMqDNelnqspVioN/INYhtCTWvECJ7+EMWf/TCKzf18zSXgyFKY99JqyEq9atZyy7dQjHz41k01vkC+EY0Ezdq0OrMMMwTpJulmS/ufpDdTCZzRCuqI1DYt6VDPKch+WioTySmp5UF/rPlMfSV94BrXD24ZLVx4XlAJD1vTAt+sQkUsT8LAZUQ89tbNtuBTw28D6WLnY1zOD0Xj+8csj8GZQyFS0FW5hQQ4tBZqH+sTNdvam0X2A6zrTG3EC6k8s3HTpkA/XbCcWnzdfBCGUiw31Sno6wHlfxHUE8D367IsfBGxlk7zZY/mqeYC5ARl+yn/+RxQqdhJtb3qWYMipYPQizOCiyytZv5YdwowU2HbIiVgY1OOyxWj+9K9vm/Z/2gOyIIVOGshTQSL6YcQvEFIHPnAcOxkG8TS9WOcvQOTaffy0sjdIj1j029O+2V5JrnG69c7lVhv4V0bepHihS4nfwkRB9ePEO6OM3pLBy/RRjSUZcXT/J9CUtArsELgRDT09mtU82sx3RL4XJ3RpQkNfrq//n6SR0KUYfVLbEMWDjHg9cBDbB+Uo33FpxQRcQsYrZz0bHkWcMM7KrBnrMhd5tUrCJRzhUgItHvpiftDgSoTEvh8h941F5fpgXIBFa0yFBbN2wjHd44BLxgRST6bBzvJwSTRRXuj0TSpzQDGqnTYXtHtd0MO2CCWMAfkxBqKkircXpSD548T2yKL7sIzkIXU+sJrvyTix6/1hMRag2Pxqlf83tdibEcPT1xhQhCJZjTaz4LS6WDDaJqbct4u2qFSRquu6vENlmk7jXKff4NdrIBr9Wqz+NMvdAqoFU4dCRh0DsEBkO8jDLgtFXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(26005)(2616005)(36756003)(6666004)(2906002)(6512007)(31686004)(186003)(53546011)(6506007)(6916009)(966005)(38100700002)(82960400001)(6486002)(8936002)(7416002)(54906003)(508600001)(66476007)(8676002)(86362001)(44832011)(5660300002)(66556008)(4326008)(31696002)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dU0vdkpEUFY2dTJCcXluOERHUklyYXNjT1NXR3hMYzcvbVBJbmRkMm9scWlH?=
 =?utf-8?B?ODJ1eGRmSVlJdU1oN3d0TEVyeitmMlBOemJWYldwM212UFhOc29HZExLNHQ2?=
 =?utf-8?B?bXJpV1F0bzN5WWJYOFB0N0xWeGw4WlVFUW5CRko3WlcxV0RQb1pDT0tBTnMv?=
 =?utf-8?B?eDNhMklUS0FvWW8rU25keVFvdjlVK1ZFYU91ZnlSYVJxdUFiVEhJVTQ5QW9L?=
 =?utf-8?B?Rmx2dkVpZHZ6bTNlQWpOS0IvQWRETHJvUzNiSFQxQWFEVGNZeXpzcm5YL24z?=
 =?utf-8?B?STJzSXRLQUR4dy83VUp3QndmMS9BbTJuZlpXS0NyVDVHV1huYkZCd25jWG1s?=
 =?utf-8?B?MkhNL1djajkxQktQU1Z2YUhHeWExS3pGNlhPZUtxMVk5Slg4VEZobkUySDR0?=
 =?utf-8?B?dktuYWFLMHFGZ01sMkI4WkVBSzBiTWErVFRhaE5XeDRrdU5sR29RNHR2NGNy?=
 =?utf-8?B?STFrdVVlQUJFZUkvUWV5VGhNNU9tR2xOMzY2OTR1dVkrK28vdm9oUHJXL21N?=
 =?utf-8?B?TWx5SFdwZ0g1Z0tmZHJEdDFZcFVNVVhHS242Z3I5MVZDUXV2bE5UT3c0YTMz?=
 =?utf-8?B?ejVBU1RkV2U0Vzd1TmNtM3ZaSmJRWFZsOGEva1FjclVTK0Y1cnlIRWQ1dEk3?=
 =?utf-8?B?WStDVm5YTEE5d3p4YnA5bUcvSGNrNFAwWEdISjlJTnhKZ1JsVUhZMndWTkZH?=
 =?utf-8?B?MG5seUlyWXlzNFdhTGNkUkR3bUR2SW1TVE83cm5GVTByUjl3TGJvbElhV2dI?=
 =?utf-8?B?VFl0N3k2TGFkU3pYRVB0azNuOERibWZ3R09TTlBzZDVQeU91Uy94YXkza0JV?=
 =?utf-8?B?QzE0eGQzRFJGZ3dranBwa1pZd29SRTlZSHMrVEVWRWlNNXVvZEYwcGdPM2xS?=
 =?utf-8?B?VCtlUnpVZkdWdG4xa0IwZm5FZHdvUkp6SXA4Zm9JRzc1cUUreStLa01STGF2?=
 =?utf-8?B?dlY3TnhhSnVVRHJhTXVYdG1WTmwvMElrQmVFejdua1l3MTBqYW45dy9xakZm?=
 =?utf-8?B?TzJ1NFpsOFVQck9NTGgySE5LTjdOWXVqSTFTdTdTdGZlZytiVzgvU1FKdWRZ?=
 =?utf-8?B?dXNiek96MGFUZE52SjVlMGdRVk9FNW9FVnRWYnlaTWNvSjNXU1B5QzFXWDg4?=
 =?utf-8?B?YzFOMWdDVXhBMEdtRTFTN3ZDQWoyekx1ZjdCTTYzQ1F6R2lzWEE2K1BTeUk5?=
 =?utf-8?B?azBrWjJQNDBFYW5ZSGdIOEdWNzB0UHpHcmlIZjU4VG16cGM2RTF3YmJ0OXMz?=
 =?utf-8?B?am4vWktHS29HQkFZN2Z3S0t0M2F3TzdSdDNwcnhESDNMN2tobStHb1RrWjZt?=
 =?utf-8?B?VGJkNzdVbWZBRitqNUpHUlZnc05DYzA4R1BXejVtVHZjdERoNmU2ZmpBN05R?=
 =?utf-8?B?Vmx6Qlc5L2NlYnJ2bXNhRXpHZldlMUM1RUNUSFducWNZdlpRTHBJSXlUWklH?=
 =?utf-8?B?Q3h1ZWlsS1FQNUlQS1ZUak00OEh3dXVCQlRxTGE3cWQ3V2hXL0g2OFRzVFU0?=
 =?utf-8?B?S3BmZE1aaENwTUpmUlo5L2lCZVJQdnlINTd3aVc1YldNdmNZQTVzUnBjdTdr?=
 =?utf-8?B?L3Jjd0I5bTBhZUM5RHdRYUtiUkduT3hCT0YvUFRnR2szblVEQStLaTVCeDNp?=
 =?utf-8?B?WStuOS92cjA0aElGOWx4SW1MY3J5VDBIdzVGYm1NNzBvdkF5anEyaUFxU1hp?=
 =?utf-8?B?TW55SHk4M3d1alZ1U2l3RkcvdndIdVR4aUs5YnpkL0hla2liK0RTOXAwN2JE?=
 =?utf-8?B?aEhCd1RJWnpXeWFCL3JqWi9lQ2ZVUG1NT1BVNnd5dktvNFIvSFFpZDJ3bmV6?=
 =?utf-8?B?cjAweHNaMldBcjBPNkc5SllqMjJqVTFyOGM3SWJvcTBuOFdVM1RocmhLZ0Yy?=
 =?utf-8?B?WmJkVzFkenBCWVV0c0k2Y3lqTTRPSnlwOU5yQkdVLzdDUzlEVnU5OURSN2Qr?=
 =?utf-8?B?VVN3amFYcy9mWGpFU2VoNlM3eFczWnNLL1dMaUFmMWVyVllGNjZZYVBtUmk4?=
 =?utf-8?B?TDRLK2ZjU2I4ejAvOVhITUdhTmFrazBhY1NLV2hPQm9FbTBBRzdSMnFzRXNR?=
 =?utf-8?B?Z3JpVnJ3R3FxeEtsOUhsbitWSnV0ZXg2b0lwUHp2c21VN0U3K0xVSGdncXpK?=
 =?utf-8?B?dEtRNnF6ck15YjVlYkFndGdERnFWNGVnWWpoQW5VL05FUFVOV0FZbWtMTkpj?=
 =?utf-8?B?OUxyZkpCYzRqeTFlQi9Mdk11bFpab0tqbFRGZUdQMTNXMzJTaW5Sc0tUVE5S?=
 =?utf-8?B?UFJ6MERPRmFNc3ZTRlhVZ3BnTENCallwYVdlanBBNXJmaEJKTjgrc21pNlRO?=
 =?utf-8?B?citGSkV4K205UDZjempNYThsOTd2dnB0aTRRMDZGdzRublE4bWVkZkRSSzJT?=
 =?utf-8?Q?m1+1p3HC42ZCXlCM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab60889d-99b7-443d-5752-08da13ad4948
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 07:00:20.8593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFZ4Izea/v/b5tNL+ty1y+sYPd3H7uauCejPRgRScjXvxY1atF//sQvUAEpmmIXCdKgz9zCMAKJsZyBAyI13Lucy8wyhvMV/QWRSMJhn54k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3056
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Bos,
 H.J." <h.j.bos@vu.nl>, Yang
 Yingliang <yangyingliang@huawei.com>, Orson Zhai <orsonzhai@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Arnd Bergmann <arnd@arndb.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Mark
 Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Baolin Wang <baolin.wang7@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Mike Rapoport <rppt@kernel.org>
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

On 2022-03-31 11:50 PM, Jakob Koschel wrote:
> When list_for_each_entry() completes the iteration over the whole list
> without breaking the loop, the iterator value will be a bogus pointer
> computed based on the head element.
> 
> While it is safe to use the pointer to determine if it was computed
> based on the head element, either with list_entry_is_head() or
> &pos->member == head, using the iterator variable after the loop should
> be avoided.
> 
> In preparation to limiting the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Thank you for taking time and updating catpt-driver along the way.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

> ---
>   sound/soc/intel/catpt/pcm.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
> index a26000cd5ceb..b103b2d4026e 100644
> --- a/sound/soc/intel/catpt/pcm.c
> +++ b/sound/soc/intel/catpt/pcm.c
> @@ -330,7 +330,8 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
>   				     struct catpt_stream_runtime *stream)
>   {
>   	struct snd_soc_component *component = dai->component;
> -	struct snd_kcontrol *pos;
> +	struct snd_kcontrol *pos = NULL;
> +	struct snd_kcontrol *iter;
>   	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
>   	const char *name;
>   	int ret;
> @@ -354,12 +355,14 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
>   		return 0;
>   	}
>   
> -	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
> -		if (pos->private_data == component &&
> -		    !strncmp(name, pos->id.name, sizeof(pos->id.name)))
> +	list_for_each_entry(iter, &component->card->snd_card->controls, list) {
> +		if (iter->private_data == component &&
> +		    !strncmp(name, iter->id.name, sizeof(iter->id.name))) {
> +			pos = iter;
>   			break;
> +		}
>   	}
> -	if (list_entry_is_head(pos, &component->card->snd_card->controls, list))
> +	if (!pos)
>   		return -ENOENT;
>   
>   	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
> 
> base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
