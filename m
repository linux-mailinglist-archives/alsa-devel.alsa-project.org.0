Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE11F4D0418
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 17:27:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82AE9173C;
	Mon,  7 Mar 2022 17:26:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82AE9173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646670453;
	bh=3fKC9azA06KiscE+q5iXbnaTbIaJ/+BbEvGf7KXY9+s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QK3TgS5dCForbD70hMP/ej57mKEpKEpoVv2zCa1NguPLAfJWmR8eHJh+TdgFqMOjQ
	 k/tt3XBR/fjFsaVramjmEOb8DLVkLfM75H+rc7dt7dtkMajew2bcbmIBjE5zKTWENw
	 vhedPhJCklgF2GYI8NQQixU9p5T8mhTPO9NmZHMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B6DCF80517;
	Mon,  7 Mar 2022 17:26:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B1DF80516; Mon,  7 Mar 2022 17:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B59DF80508
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 17:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B59DF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NvwReRV4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646670363; x=1678206363;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3fKC9azA06KiscE+q5iXbnaTbIaJ/+BbEvGf7KXY9+s=;
 b=NvwReRV4xFFJ11kj5wT5ltMY3KcefGBNzW7rnXzAOk2XByAuEp5n6JqE
 zeZBFkSmaGdHm9EMJY82um3mP9eqXNdZBNz99a76tdLWrYlSG8hIGOqYt
 xQzigzt9Kz0UNf/oSAsWGg0NX3IIKKxnTA9ESE1N83G9rMoG0R9kZu8kk
 PyxvGGlyn3qxDz4+Q2HkV5q6Proh0uOAgZmMSXuIso6ezWFjUTAZkE65N
 3U9Sg+B/yy6xP90ypc6XTsPNoI79YJtzjUI3J5Fi7kOCHTX2RDuqNgswR
 utoiKYFxGcqf+BQo+EqE8lfgH/hJZIj6Ygh+DNDQU50T0aSi/oesVVieQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254373924"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254373924"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:23:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="553220112"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 07 Mar 2022 08:23:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 08:23:34 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 08:23:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 08:23:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 08:23:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+Th9UgnZidzl24N53iZMke7sTWXEKVhPuVYBCTOJ5hGUTK2ywa/COCRou0iv7wWwkLZ5Go5jaeC+WAYT0E9fXmfh98eDX7/BNsLHRuy4IMAZJjnVgj/tvduXyIeCf3Nu71evrf4cfK61E2pnVlOrtnXsY3tahfYPgo80RTJIZ+Bt3J4/sQs53IRnukIi/+NuBg3Mp7+bX4yeAJqglrnC3MKpODtI5AkCnuezJnMVxq/qBin8V/+amB+20yMQJq12HfaHRvJONjmpvif+p0TN7WATOdtPK/yNrPbh++I+jFCErRnTH+BDxB+uPYSl9U2QypIpk9lDRNZ9iKGzI5J6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRED+Z2+Ucu5+d+CytAUgYBiCQd1YP6BVUe3f8rfP90=;
 b=kTdQ5KAnHXxMFPImBBQ4HWwLJkkUhV0qkX7pNxJZGJq4rnMGwxHoZfk9qvVTHy0MzzPPn58nuWmhHQkTGghB8ONXHNOcYQSa3pBL1V3XML18qdNSjm1+e7P+cRPJrRDf2RipKx5gN+rlk3spv9yq7J/ADCRKLTuPQkuuFB6LAj/MDMRlmMCeVYGJHglLot5sw82Lr1GzLEdR3Q8Q0pBDPStYN5+Q/d1b2Ok6oW1P0x/pi88JkzzUe+MWVZ8V9cP1AgEB8tTlfHa4GEPrXqPQlV0JHeislmVuUkrbVlUXSdjlJqcnldeWRhmroYb2u6F7ILWXQqEzxlbuB6U3OuC4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB3868.namprd11.prod.outlook.com
 (2603:10b6:5:19f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Mon, 7 Mar
 2022 16:23:31 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 16:23:31 +0000
Message-ID: <13300b7a-a626-3d8d-d33d-736a63298b81@intel.com>
Date: Mon, 7 Mar 2022 17:23:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-5-cezary.rojewski@intel.com>
 <3a4bd57f06b9dddca6b7726c462bd0ccaaa508ff.camel@linux.intel.com>
 <9a536988-4d21-256a-254a-d5b422eceb42@intel.com>
 <3bce930519d6211499948cb219294560b9c8786c.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3bce930519d6211499948cb219294560b9c8786c.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0341.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::30) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5d16c4-4b88-402f-388d-08da0056d1c7
X-MS-TrafficTypeDiagnostic: DM6PR11MB3868:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB386808DAB304EE44D74ADB8CE3089@DM6PR11MB3868.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RyZpntjiSUtf3eNiKFU1iKWAJMtSlNpudrT0Syh0HO42o5x5YB35yVfEfFeQKrLVZvolyAGAoyZt9z/XF8k18aXcl5pDzSzZHyA6RpHpD9TewfqhIGhrHMEE7WAwJsaOhlxX+BsY06A1WyJBzyVLulqMZQ0uHkeIhsjx3fzuEX7RiNNBwFkU3tGlyyE15jS3ODy7Ut1oNV+aBqwL2SUSu+VynJLbGPWGQF0uisGxwAg7H+9s/Iii0HvUYbVFxiwakqpZizhWKQ9aFs3hsbtgKQh9kDLxIEsMucL5OFwltZ+1iYv5F0yy5L8APcpyZzZRaXpR/WGTg0kDChSobKmeu7hOv6a1HNu/+nW9tZf/TGtskuEOt+S+WUVp3Pnm3E5gxOM4Sf0xvzRRwr+nvUHl3Tjfn+x5vinB8RUJ3XmCc5aydNffG0qFyLqpkrg9ayl/w9YU0CabUgGUHZmUfaB6V4+HL9OS/Ke/3W0O9m8G2qwm+se88pxiHkMFYLhCcml7+0cIJGJQBluVj1LBsB765l496c5xE8tRI5sq1/EqBWEk0mZIPGasrFJPGdP3FKotPkyu+p4qPG6ImTF0WxuFh5FDEBsb3yLpDZsSyefb073LorrMVSSKfF/GidUnf+Ag9OHlef+Br65MzPVphiwDiYFeDQEhraajBSrOGviPyedO4meMqAINyjtA4bzdSrnp1ZFBR+ORgHjgh/ldQrhOxDnS+dv5wCcAEjtU4nXlf/4zffw9wTNMeWiJicHiRCr+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(6486002)(66946007)(8676002)(6512007)(66556008)(4744005)(44832011)(316002)(66476007)(53546011)(6506007)(4326008)(6666004)(31686004)(38100700002)(7416002)(2616005)(5660300002)(2906002)(82960400001)(26005)(508600001)(31696002)(36756003)(86362001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWVWWnJjRUNoSmtyT1E1N3pQRmdFZXNnQk0zbi9wYXBodnpYRjdEc0JFTE5X?=
 =?utf-8?B?SzV2R25NYXkyZTFwSTNUVXhRWUp1K1UxdUhXTHQvWGsraXR2eXFTNFNzV1RE?=
 =?utf-8?B?dVBTU0dGd3lPZkg4cFhlcW5lM2thYkJuMThDdDQ4blYrTkZpV3p4S0hZOUlG?=
 =?utf-8?B?akhaNCtGM2ZPbEhGQ1lXdStLa3NEdlltRHVObHJaWjlZRWZyTnVwTzR6ZXVE?=
 =?utf-8?B?dzZyRk1JK1FiNHhmZW9FTTNmM0N3cmNTeThLN1pXLzJjclNMcU1iMnBraFh2?=
 =?utf-8?B?NEladmlQTVVKWWhzZ2VEZ3dleStxL3lFSmRLamtFdTFvUVNaaGFRWHRlMzZD?=
 =?utf-8?B?N3dkWk1IUGlGZ1NRdjd5YUhUazVjRjA3eE43YUN5aGsxd3hieFJJZElHd2hm?=
 =?utf-8?B?SCs5VTNZYjM5RUxDRFNpKzlOZ1IyNkMrK2NTNG5jYkd1VDV3dktod3hzMTF2?=
 =?utf-8?B?V21SdTM1ZFVHMmZCbU1yMkdmd1pPMmRlZkdjeWZNT1draVQwdElHVzM5SUV5?=
 =?utf-8?B?dytXZ1ZLakw3cTlhTm40Tm9SRENWZEFWNW5rdFlpdU9vMlZ0YmlNcStuRjUx?=
 =?utf-8?B?bnhtamFtUG9DdEZDMDNWSGd5Vk9GemhFUW0yVE9WK3BDTUVJYlcvWUZSbDBL?=
 =?utf-8?B?bTliWnV6RzJvMUpZSnBocndQVUYrVXpwdE1MMENFVjJYTXgvOGppK0xYYlRi?=
 =?utf-8?B?OXg5MTNpdWhEWWNJaXFhRjZhRkdrWTFTWTIvQlQ4WnVzZnJESzEzR3JCOGxY?=
 =?utf-8?B?TDhtUmVEUjh0TVNLUnVwbDcvN2JURnRSbm9lVUZuSGVFRXhEVWUyVTkrUVYx?=
 =?utf-8?B?NnE5SFgydDNxeHcvNGhvZlVSUkM5YzNQT2RRU3RxWnhHcE1UVi9ZZWtYRklS?=
 =?utf-8?B?VzQxVU9YYWFTVjFvWHp5K2kxZm5KV092N1BtQmtZNk82TWpCbW5DcmNJTTds?=
 =?utf-8?B?Rzl0eVppSEsyNkFFT2FqbzRaT3MzRm1yME5ML0JnSnNSVDQwZDJNZnRIOGx0?=
 =?utf-8?B?dGxvVzk1a1kzWnFjN2xTSVF0TzQ0aXdjQlR6MmtPdVpaKzBFNTdPSUtRWUdZ?=
 =?utf-8?B?RUp0QlY0bXdHaXd0eHkzSG1tbGYwVlNYSkpLcjFHb0FDV0sxWWtUbVNKT0xI?=
 =?utf-8?B?cU00YVV2ZUg5YWtaWWFQQUJWZHN3RzNiaWlDK2VEVVR5VEt3Z1RtWTZFZkpV?=
 =?utf-8?B?V3ZVU3gzUG8vQVQ4clUrWG9meFJ6L3B2c2tVR21zSndyaWhLdEovOWNKeFYv?=
 =?utf-8?B?NExMVk1wL3gzSE1JdXk3Sm9TcTVyRGdkNXdjSWhnN2h3ZXV4ZkdXZ3hXNXRN?=
 =?utf-8?B?TE04alZ5d1dHR1d4V3VxZk1xYmcwbldjV1owM2RFTmRQb0lQNno1aWdNZjZu?=
 =?utf-8?B?ay9IVG9FQ3ovWjRkSkNVVnUzODhoTDFHb0hrV1U4ZDBUSVNsRHdLdUQwcGFq?=
 =?utf-8?B?cExiT0lCVEZlb0ppS2VZaGhpTkhPY0VVV0xMSWJialNja2JHWHBCODJDdVBo?=
 =?utf-8?B?YUFkeDZsMzV1NUtRQWFRRXpBVDBsOEJPQ2N6cTZna3ZYVTcyc2d4WmVkTnVM?=
 =?utf-8?B?TEhRUWRqTVJKa2ZpYVdoQlRDc0ZUK1hCMktnaGtHV1RuOTdodmlGaG9BQ0Rm?=
 =?utf-8?B?Y3NJMkJIZHRES1YxbEdJZjJqb3NxeTlha2xNV2hSeGEvRGUrM0NrU1dYUlFM?=
 =?utf-8?B?SW94S2V6QVJwQklYckIyZG5yTmlPcjFtL283enJJRiswYXE0WXBlRTc4cWUz?=
 =?utf-8?B?YWltSmdjS29pR2VGZnRMMVhKTWhqWk5YVTUyMGRCS0JwbUNBSFNib2NoeW02?=
 =?utf-8?B?MlJLVENlTjFnSzRGdXA2K2pxVEx3TFRTMGhmSzM5REJiVStyWDRKK203OURh?=
 =?utf-8?B?SUswK0NES3o4TllCc000YTRzVG5hTFlla3dTdUxaeFVRV1c0MWxTb0ZVVzVH?=
 =?utf-8?B?RmIvcFNmUzM0VlZScWxNZ2thUWU5VWpUVnh2VE1VajlyaFZZK2ZZT1A1dnhR?=
 =?utf-8?B?d2hnazgwMGMzWnlCRHNIbG53YmlMVlA0QUttS09JOHhTVUJ2ZGVuQWRLLzBO?=
 =?utf-8?B?ZU1CWWZyWHpiTzVMQ25VcndTV2p3aVgwU1hzNE8xQXB5UjFEQ2pzSGlCRDZr?=
 =?utf-8?B?emV5ck1pUDRWb2ppcFpQVkNFWEdQdnZyOUQ3dHRrcXpEQXJuTG9BTUZTdVN5?=
 =?utf-8?B?VW1lc3FYSnpqSGFWd0FJWXZaVGhDSFZPWjU0S0lHa1p3VmppSDd2WnRzV2h3?=
 =?utf-8?Q?reKzRLQV+vGnjmOkd30r4Oz8tfUnOZnm4sDgYXYlVk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5d16c4-4b88-402f-388d-08da0056d1c7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:23:31.5840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbWdxOh2elJ9x8MJ9d4Y+4Um3fHfX0Hdwmx7DF/P2w5QFulvCVOuZ6dwd7eMNzdngIB7k2PDR30OLNs0iPzmgCZC8np0meNJN4mOg1zr2Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3868
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

On 2022-03-07 5:15 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 18:11 +0100, Cezary Rojewski wrote:
>>>> +     * -EPERM error code is expected and thus it's not an actual
>>>> error.
>>> And what happens in this case? do you retry the IPC after recovery?
>>
>>
>>
>>
>> Not at all. Why would you want retry IPC after recovery in the first
>> place?
> So what happens after FW recovery? Will this lead to an xrun and cause
> usersapce to restart the stream?

If DSP dies so does the stream. Recovery is not guaranteed, it's an 
attempt. What userspace does with that is for userspace to decide.


Regards,
Czarek
