Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D574776BA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 17:06:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5028281F;
	Thu, 16 Dec 2021 17:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5028281F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639670778;
	bh=o/DrxhBIyHeTatBb9h2p8SwJI2rh7AmVc+w4FH2EE3c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DB7EaIjvGxBuDsvBXXoaTjpHFL32NmWZ8wEx3OY74kTP5D24VKD4owI97acXv15TZ
	 PylcQVgkZdHAx7C42HDpawQU4DU62Qbn918od22psXhBcCFqEspaG5bw2RZ6X5TtOH
	 Q48U273jkCCv9EvjU4KMo0IsC3cgsxBHwU8Y5bwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C04DF8015B;
	Thu, 16 Dec 2021 17:05:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B675F8014C; Thu, 16 Dec 2021 17:05:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C7DDF800DE
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 17:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C7DDF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ei5SODeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639670708; x=1671206708;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o/DrxhBIyHeTatBb9h2p8SwJI2rh7AmVc+w4FH2EE3c=;
 b=Ei5SODeqH0PlcKTPc83HXDBtx1Cip9gjvmayq97hFM5oOg92T1zQFc+G
 V31iCKet+tIDtfLOjD2tUuMu0mB/Hr4z/ipu3RVgxV5BmZLHd4Jywf+E6
 dq3nJ1HzEsOLaFdspNnMr4mNNULI/Rt9Md7TDRGUk0rzBRpVKDNxcEN1g
 3+dMva0XMocMCUzeeu5xSYtDMH+HRLeTG3cJ/4e/Hz3Un5fvmXcmoRFE/
 UHvvqAveI+1NgFrkbFdzmFeqClwb7PJF0VNgay/J+O2WX72geHRKqYdCR
 KsV2LmYehHODSQ8gOlhxhU4LzWWaIr/t5NP9XaDqz823ySnp+Mrb9yrp6 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="325810225"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="325810225"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 07:59:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="682994132"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 16 Dec 2021 07:59:52 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 07:59:51 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 07:59:51 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 07:59:51 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 07:59:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crmCF1egPTQIwi4hg9WEVMUjPdc+l39XwPVoCAv8/3Bcykdoq6JFJMVFoskWkKbTAIFfP8fjikY89rmt6FP3oZizu+rjd1EtKoKt2xDufwGeGUMB4cL+SfKelF3Yh3VwA0xWlc7ELHvwCvGSs+Pp/uT2ADp5ipdMoe8YzSqAQ6tcv0u6vJFt7AqmGEr07O5CFGy75hh7xrfmgguDU7aZ/glrEzZqfZGT5zGrEfLzOlt5VgFB9ZFGgSPmETKmbw75PRrK9AcbBOGkht2zGXrEcoFyZ5OB4vjQptxBV7vP3PMunDkPFOE8z4n1aLaV7mzYpwMv1wn31MK5n1TKoqb4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jpiSGz7Sg0gtmOqRq8OPeKulUCIGwP5NkfZE2+VBGw=;
 b=bwo8FgcXQa8qIpriLFFzmfFitwjWz9cvJGkOo/sieSQkJWZwVYbsyaPcgdr4sD/x6YgK3wi1HjX9vdI2r3l6lb9iScuY19sr6ukHmy6OZUNjxyWYYpZe+4Tqd103aA7nLHA0HW43w2npImjdGdYS8IovyW5phFYCfhvxefQn/D/b1V7Zh5RB4allymut4/y+BaZvM7MKn/RF/seJ6E2vohow2uGWLkq43O1xRXi214JHaD8zms86BSzLoMJDQEheDMM5k7MQthILd304ndzagwVhFRsmPIu3FTGBqwxc9Vo8sJgvkvNzhiSHWzw45eRIbG3sdbmqsz5BOmQpr3g8aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN9PR11MB5322.namprd11.prod.outlook.com (2603:10b6:408:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 15:59:50 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 15:59:50 +0000
Message-ID: <9da26018-aad9-76a6-ad93-8941a68c645f@intel.com>
Date: Thu, 16 Dec 2021 16:59:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
 <20211216115743.2130622-5-cezary.rojewski@intel.com>
 <4a8afa77-217a-9d1a-7704-909ee895c4c7@linux.intel.com>
 <2377ff39-2ee2-c1fe-844b-aa9749f4e026@intel.com>
 <261b8815-6c8e-7e0a-4b34-e7948efb6884@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <261b8815-6c8e-7e0a-4b34-e7948efb6884@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0035.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::48) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 078e05f7-30fe-4a62-d175-08d9c0ad1714
X-MS-TrafficTypeDiagnostic: BN9PR11MB5322:EE_
X-Microsoft-Antispam-PRVS: <BN9PR11MB532242B60ABA25FBE09707F9E3779@BN9PR11MB5322.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTbsCk6012EOkbxDdruBSWXoItqGoYPHZ3CUgIiOk5WA3DemqFz1HHAUbxvcF/p/es7IJYeoGHi/3+TgGEY8FpZ0rZ0OjH1i+p3yeq6+47/MKBoCuqUqALNaA9VllLrVuVD974uIZr2JyjvhaVrPcL1JT1Br0XFgMin1AYveyCk1YBw0zsYWLkMw9V879YsDDffHdq2raX2+DGnABD2TBNxR1s5vZs6rGnMRtLD++8Jrmh7tpZVUpIac9/rw5QmkuvX8ccz4Kwn8GU1piOCt4aW6uCrktN2MCRM+IzcjqrU+Vt0PgQBrU88Ud0vtTZcxqzDEdzK/i8J/2K2+6Lk+nmaANNymBptkCE+fXdWz48/rMd/RukDcIzW0ilBN7+rgYd1Sxcus4mRv5Bbrf4yrSRdHL9yQeG2ZWTmo1kFYHGe7Op1JNx+91B8Xg45MCuyXgg87KugDcifIs0gAOHCoWK1GqpqpwFUTDAdNKiombW5qIcx6w4N/LpIIRRe8hGSpehhkAt5E7rl76SLPvcvUOk6mNH3+xutTr6tk8Jeyu0J+LxdHwbXu5n0a6uoyXtZenfRdH9ZZ51jLaJZCfSNnLNkrDUgQgqsvKYQC4Ous7RDV3+LULcEBa1Hu4cAaGPayxlYSMXeKbAZYKwOAs5hNYXK66iuEn36sxJobTn8zZ/5JtsNjTl9qmGt5TpxmNuUMPteNGEyZdINs7dUrQ3uiUmtQMwbV4w4ig32oyNIBQrjkL/mWsC0az0EpSS2H5tcgJhQY4MRXoh+LLIGuWsxwZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(66476007)(508600001)(66946007)(26005)(6512007)(316002)(2906002)(6666004)(31696002)(38100700002)(66556008)(5660300002)(36756003)(6486002)(86362001)(4326008)(82960400001)(31686004)(6506007)(8676002)(2616005)(8936002)(53546011)(4001150100001)(186003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDNtZWJ3Y2RvNkNKQUNLVjJ0RVB5VDk5QXdxS0svUFJxVXRzTk9rUmtEKytx?=
 =?utf-8?B?MkhYMWM0Vm5zWW0wUnNIVDgrWmtNeGxnWmc5T0VXVi9ZY3Q1bE5FMmZxK2Iv?=
 =?utf-8?B?R2M1cE1YemJyak00Z1ZEcldUTHpZMEFBMnVJdVNvUkd6Ri9zWFB6djlnWURQ?=
 =?utf-8?B?TzdPb1loVlVTb0NVdXJCaDBKZEtoWXg0cFBGeFdOU095TWhkZExROVZ0a200?=
 =?utf-8?B?NUo1VXcvd1BMeU9PZlQ2NW04K0dqQmpiMHo3ZkpzTkVxRnZ4dVhDb0hxZWNP?=
 =?utf-8?B?N3ZNK2YvQ3NQWCt0NGg0a2NSTHhZd2diUkYzR29sajAyZlZqSWNOdFNYdTRI?=
 =?utf-8?B?R3BicXJ5VHYyVEdZZDBJU1IvZ1AwaWI5VWRQWUp4R1N0Z3g3MUh5anl6eXJk?=
 =?utf-8?B?VE8yREFDNUlkWEU0VzRpSy9JSGJpcjZueklVNzJtbGpDQ2lBdVg0TFYxMFU5?=
 =?utf-8?B?WHdsUURYcnJzRkgrQkVhaXZiZEovZnhISEhkN0NwM3FlS2xuMlMzakpoMmR3?=
 =?utf-8?B?MGJ1Tnp2MVhvMmtCd1VTdDZzS3RMaWtBWFdTdUdacUc3c2Y0RmFBYXZudDVu?=
 =?utf-8?B?WmxQczk3VWZDbzlGYm10QVZ5WEQzTWsvZVUyQjhoV0YwSnlhZU13NjR6R00z?=
 =?utf-8?B?RHpqSGs1SVBBTm9kNnpkbi9vdWM5TWNEVHErYnI0QU5JU243V0hCVFhPdm1h?=
 =?utf-8?B?WUNDdm92NFNxZVpMdVBPbUx6SFNTUldVRmpzRk1sRjUzQzVXcnRTSEVNcjFH?=
 =?utf-8?B?OG1DZ2pnZW9iektHVlk4NVhCTENjS05wSnZ0K3RQL0g3OTU3UmtsMW1jMEt1?=
 =?utf-8?B?ZG1aejVOc1ZBQXNNdTUzZFMyclllalRGR1pBRHhGMUhoWFl5VlhibXRGMENn?=
 =?utf-8?B?dnlaT3k0ZE8rNXcxOVZ3VEtpMXBIaG9rR21uM0crUDBxVjdFYTBQVDlyWk1K?=
 =?utf-8?B?dU10ZWdyNUNWNHh1ZmxJSTg2KzVvaTBVVUhsK0JMeWZJNC9Tb3p1dU8wYkV5?=
 =?utf-8?B?MlVpL0pTcmV2S3dCeFNBNTdkeGxJY1RJb043NmpYYUhDT1NVRlUrbTY4MTJj?=
 =?utf-8?B?ZW5pQys5OE1CNUxDRjIzK05pR2tjdll5TTRwNUcvK051aWVPMUplODdLTy9Z?=
 =?utf-8?B?V1RsRGwrVG5pUVpoTUo5azYvcjFLTkNBLy8wM01LWmpPWTVEMStUWExCTGhv?=
 =?utf-8?B?U3IxdSsybmNRL0ZFQTZPZDVLWThSeksvSVJTVTlkRnZqN1dCelkrK0lweXJa?=
 =?utf-8?B?bVBJcWNzcmNITVc1OVBOZEIzd3dZYU1NdkNuKzBMQURDbmpXRTI1blVaeE1I?=
 =?utf-8?B?aWRWbnQySkdkSVdYTzV3YTBQaUtBS2lLT1REWTJHNm5BT2tQWnBGcHVWbjhI?=
 =?utf-8?B?UkdETG5NbkVVVDZmR0x6N0lYNmFiWXVQbkhMaENqMFAzQktQWjNCSlA2cytn?=
 =?utf-8?B?UHdGQWtnaTExZEJNOGNiZ0l4OHhBckViWUg1QVNZRE52elByVGRwNGswSm1W?=
 =?utf-8?B?U0NZN0p4TXgwVklqaE5NSlRaQitlYThoQlBnQTRYK3ZaY2ttbGUvaWlMZ3BF?=
 =?utf-8?B?bmtUVmdIM2MrYlpybk5wOHdJSXovTDlLSzQwTkFhSTB5LzBlQTM5OHZLME9R?=
 =?utf-8?B?M0k5VjUzcFkvdXFsWmhuUzlFZVJzN0hoMUpuejhQbU1jZ1FkSzRoTHpwa2FR?=
 =?utf-8?B?ekFiSGRLMmtHaWUrc3RJZEg3SFNtMytqT2JUMTJWc3cwV0ZSY3owWldsYjhw?=
 =?utf-8?B?S3Vhb3RWc0w4akxsU1FPS1VpeUU4RDYvTC9kZmI3T3VHcGV5R2toMGlNRmNm?=
 =?utf-8?B?RTZ2cXdxYmdYT0czZk1ET3NuN01pV3RGeEpmT3N6aDZySm5OUmwzMjFjNWNX?=
 =?utf-8?B?cGQ4NHo3d3c3aDFlaVIvQUVzRW5FaHdYSnFUTGpDTVlkem5wUnVrQ21CRE0r?=
 =?utf-8?B?K3VIc21QclViV1BHb2VXTmlxSmRJTjZ5MVhvdEpHeS9lUWphZWk0MU1pZ2Mv?=
 =?utf-8?B?Mk5oZW41d3FRMmxCdHNrNE5ZbFM4SCt4WVlXZWd4ejdBek1VT1B3d3loZjRN?=
 =?utf-8?B?Lzg0bXo1R1JLRGROUXhFOUhvbHUwdDN6U3FFZDdwUTFYaGQvV0NnVUszelNi?=
 =?utf-8?B?aHlBQXpXdlRVSnFXeXZwQUF3YnpDckYzWGFKSEk0dUtvS1poRWNlOGMzV2U5?=
 =?utf-8?B?MmhaRnR5ekZEQlJHNloyTnhxV3ZXNTRLd3dRQlpPUjRWSDZwTFNBTmdLMTdq?=
 =?utf-8?Q?sTh9HRhraOms9iv4UCw4nUDTSc8lDf/8ZrbguJ5eFM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 078e05f7-30fe-4a62-d175-08d9c0ad1714
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 15:59:50.1010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfDf9xgkGr3CPr77oaJPsJkOWJ2cUWPyVGJLYCcPbtzvd5MrBavK6/f2yOfHl8VDQgY3aZljIhmTxNA34yYu3dUiBkhMrnPAIOi+79Nx/Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5322
X-OriginatorOrg: intel.com
Cc: broonie@kernel.org, tiwai@suse.com
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

On 2021-12-16 4:13 PM, Pierre-Louis Bossart wrote:

...

> I don't really see the point about the number of fields, this is a
> generic descriptor used for I2S/SoundWire devices so mechanically there
> are things are are not used in all platforms.
> 
> Another example is the quirks field, it's only meant to be used when
> there's actually a quirk.
> 
> Note that I am planning to remove the sof_fw_filename field since it's
> redundant with what is part of the PCI descriptor, but the topology will
> remain there: it has to match with the machine driver.

That's why no new struct is declared. Simply the tables are moved 
locally, and there is nothing wrong with that. Cohesiveness and 
readability outweighs the duplication of ACPI _HID.


After thinking about this again, perhaps in the future, this generic 
descriptor should be split into more specific bits e.g.: like the struct 
pci_driver which wraps struct driver.

i2s_mach = {
	// some i2s-specific fields e.g.:
	.acpi-id = XXX,
	.mach = {
		// some generic fields e.g.:
		.drv_name = "a machine board name",
	},
};


Regards,
Czarek
