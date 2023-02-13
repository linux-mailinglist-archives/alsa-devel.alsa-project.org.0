Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C711694BDE
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 16:58:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1DD783B;
	Mon, 13 Feb 2023 16:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1DD783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676303896;
	bh=y3BUrSKN1IM90TUhwjPGU3T22wTwfokp/Os1yZkR4q8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oeoJGcFlLwbsikwyle+X4GH7gGyzNByveqHQQGj4iXOHC7fXWXQpQvwxQlBoHurZK
	 /IC2ST1xsBPFpuC9SWmqxEB8jfI8btMxLzk4lB/9P/F4nufh+iBz34igOlxQi5/m7/
	 QPpgNnkO1BWyjIQirUL9WZcCcoCwBmgR/e6hwSBs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA1CF804B0;
	Mon, 13 Feb 2023 16:57:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDCF9F804B4; Mon, 13 Feb 2023 16:57:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53849F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 16:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53849F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Pc+W9a/r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676303834; x=1707839834;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y3BUrSKN1IM90TUhwjPGU3T22wTwfokp/Os1yZkR4q8=;
  b=Pc+W9a/r+3T5XB1mVP2xT3e3pKiuofW7tTKv0T8UMzDbS50pQdO30HWJ
   BAlmInv3xPthQ0GhUccwSXCFqOyyo/968GFijCTXLP19HUo3VGr7c+byT
   EaDWVQo6ANXLTzL5nSyuApmpNZrsqbmBdiNSYXZM1LGBVHeJH/AW/jX5p
   /QzOXaZRktS7LCWpCXXIIQNtx+VqD76bs+lKk2y4N7zYdPUvwwBvVSgLu
   41J93EnVQjgOHtiWlu8tqe0BgUfsQjVfA+4kKkSmDmfrnjVQCLxoJFYqn
   7d48AzxGAXAyJ4mYOjUYTyDRBh/Scpvw65a+lD+mtFZeZV+netepyMAEP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328623445"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="328623445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 07:57:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="737559314"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="737559314"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2023 07:57:04 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 07:57:03 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 07:57:03 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 07:57:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/Ssg45KSx3r4Z10jAzd/ZGEsJhjBOUoufhbEVlwyaGJJAHGdP/wC0cKrc3m0aBZcGeX1O5KtRWjq8xIm545VblxqWmMjDWxSJ15TjcHNcr4pMgRMXcBJgFY3GQ7N4o+8WZyKiQ7MFqt8b7PNsi1dsc/glf7CFAgi//EcBZnYivlSx4+OETvgY/XFT2AYuKoGfr54D0uvf5NMZLghiuc55CaliZ1qkYwAVxfuw+cJYhtML06dMeB/XKywBjUQMwptML0VbUxdksplxIu56NMBOYTcjdlzldrDN7trXqDWr2undXnQKcDSKTJ7//xvPay4UBC0auKRf40iYhtEL5Mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ODHpEUNz2qNjLu8Vk8cUTdhNF7RG3RKkjkBGKUcE+4=;
 b=TCA9sWSTMQ7pORfKoH/BOXHI0ewt8/cMCyHtmhGevLl9+xbQI++qDtMj9tUb4cGZge5fZYYlnoTMqYozN4gccn0O/S4qbEhJKt3C5zq0xsw7G26HvryWjK0H5NXYd6zkrceU/ll1TVfzWvfh6ETVuVvovT93rmcdymiqKFJKA2S2YHh47heo6+zNfAGtEhK7FvewabzEElT5IbQnn7/kP5Z7Q8/4zlbSdqwdoa/J5oA90A1AQ1wmB/KffpCANA31gH6hUihx4UoGEIw0IvFDgDOAoP0/Rsv9NByQu2ScqX60CeI1cAbGB0QYtJHcyTXMUDBw/a+ZyCjIhzKX0Sa0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.22; Mon, 13 Feb 2023 15:57:01 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%9]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 15:57:01 +0000
Message-ID: <6b11c3fa-2394-916e-a5ed-268ce6afb248@intel.com>
Date: Mon, 13 Feb 2023 16:56:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ALSA: hda: Fix codec device field initializan
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <tiwai@suse.com>
References: <20230210165541.3543604-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230210165541.3543604-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0473.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::29) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 893e57dc-8f2d-4897-2cd9-08db0ddaf1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 PnPBmjcuJkJShU8AW0iMJwjLSdUCfauBNqUZf7p3OpEVZNrfvJJ1k4rp5LNxFVT85sKAXDxWtOUuDkty9LrHFVv9oSKkVZ+LsV/NhVJcjIZnWIicSSbfng7Dd8UbstDtWK/PU/8DN0bpGzZnAmAe8eHLOTqIANGm9leqpcfMzYZ7PwY8oZMGe1O2pY5w5bOTxOBatHdhlHcr5PSfJ5vROBXKmRCrPRWitUsWbR3HQCewN5jxIWklfZEKL1P6XsLI5qFz8UYQ2EAME6CuekMZmQTTt8Q+hrHLPqCOOvBJuUz6GXw3nKy1U7FPDS8zxCD211LVQNhyEWxyNpPZDUAiooAZDTm1zt6N9YnFBB6W4N/80YqbuXIo/6ZUoJeBt2AkB0QiOK+k8BwQ+CPHpADv33a30LHD1jAcy3iwYXMfO1nx19XgEitnYbKO67voMndDhtfRKKXo6+DFugRpX0YT3GmF0njQef2MByUaIv8Uh9PvQBvXnaHt05/SpYNbszD4kBDpdhV9YuAPYA/gTOWr/OGmAY4ML2ulp8O+v5ibKOCpCqRsiMcFfb9hz2mz+oEO9qLYjLnJg0VI3EsHs1E8x9nQAo3MgcqWs7aEg3qOlGGe7ZDVQTxK0cxlmooR2Fg8DPmjodWm8FDFudQcacws4oc9X9CJ0Ycpj9dQOzvkX9JSpuz40tBdhHnJ6Z2I0PDQ5NT2iHXUJ/yuBXt4AlZVSU4c8WpK4Qn5yZ2IinFx62RXoujhI7hOFkmBvjKyWA1wUi1e1MYeQ6PbBWvWO+JF9A==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199018)(44832011)(4326008)(2616005)(8936002)(7416002)(4744005)(8676002)(5660300002)(66476007)(66946007)(66556008)(38100700002)(2906002)(6486002)(6506007)(41300700001)(966005)(6666004)(316002)(31686004)(478600001)(53546011)(186003)(26005)(36756003)(86362001)(6512007)(31696002)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?YWF4elhuMnI0MkpQV3p3T3h2aGRUU1F1UU9kTU9HYXdReVVoWjU0QWttS28y?=
 =?utf-8?B?ZG1XaHJlSmVsa1Y2SHpBaVZoeGt4QWViWTVYWFZTYTVCYXZLeElxMTVYbTZS?=
 =?utf-8?B?MlpBU05PVWZXU21pclF6VjZMSnlpSVYzVkd3UXh1YW5FU2VwR2JmM0puNlZP?=
 =?utf-8?B?MWtuSXpjZ2V5TldOSERyNlM5dFFLaWxSTjVBci91Nm5tOEhhWEwvZW5OeDlu?=
 =?utf-8?B?QmEyQUhKVXdlMXRNcWQ2V0pQZ3I2ZDNUUTM0TUtockJyTEdYWXJiVnhIMzg1?=
 =?utf-8?B?QmFIbmxuU2Q1RlNKeGdFVyt5MEtsZFhIeWMzb2VqTXZMY216MEtRdENOaHMw?=
 =?utf-8?B?ZHhQckVMcEVzVkViWlNJZTJnZTU3NEs0amVsV1kxeDRlemZycG45SENhTkhn?=
 =?utf-8?B?Z3dTbnNOaVFHY21KeUVmbzlkQk05WEszN1lCTDc2bUxOYjBoZFlZMmdWSHdK?=
 =?utf-8?B?dkJNOGxranhYQkhkZisraDU0V25ScjRWNDM5MERyRDRDQ2NJVVJUZVM3UUxh?=
 =?utf-8?B?OVJiQjRmdU5OcklnMXlhNmgwQjlHM2hXMlNRTUxSYjVCRDdzTjV6cFNQdG5V?=
 =?utf-8?B?R3ZtdHJxTDFTcUJlUzM0aWt6cmEwSUF0Q0RuN1YwNmZ5MzhHemlKSlo5WDND?=
 =?utf-8?B?ZnROejFuVTZkWjlQVGFPU2hKUTJidlJ1NGpYYVNjd3JmSlZyZ3V0S25ncDFa?=
 =?utf-8?B?d09LU3VRRE81ZGRIYXdmd0c4YStuZ1MrR1hneVRZMFY5Vmh6V2NGeWRaTXBE?=
 =?utf-8?B?YkZ2VkNGbXhabE9VYkJXdlNQL0FKRjFCVjRMemhKQXBQM1VxRlMrK0xaR2J2?=
 =?utf-8?B?U3kzWEFBTEw5WXBiT1lqaDlVUUhwMnRaMVhnb2JHcHlnaXRjeFowMEozamFL?=
 =?utf-8?B?Ry9rZzNsQjBZTGdIYXMxT1VMOTA4eUtZTlpXbGNXQzRYbDVGY1J5bGRvWDZS?=
 =?utf-8?B?SmtUbzJ0Z3NyZXdnU25aN3VPRjFpS09jS0RNMWk3YXR1L0xWYlY1NXRURzF2?=
 =?utf-8?B?aDBNaWJLQWgrWEJtN1hYT3lVa25LZHV4c0VPNVY4ZjlMazJrQlpjR1Q4ZlQ1?=
 =?utf-8?B?dUxUT2hzdy96YVBqU2RnZW9rMlhmZkZQc0U0eFlTaFhzK3pLSFlIVXNOeVhQ?=
 =?utf-8?B?UjlZVUpBaTR6MitYODM4eVBzcTdtVE9QdDkrSzNqWUhDb0ZrWG0zOTNVaXJY?=
 =?utf-8?B?VmtWdEplM0VmSTlEcUpnbUk0ZTdFczNpdllPdVNFOE53TzVnZStzei9XNlEw?=
 =?utf-8?B?R2VjcTg3NXlrVGVLTy82Z0FRT0hKZ1pFTVBmd1ZVWFY4aXRSckc3bHQ4L1hy?=
 =?utf-8?B?djJKa25iWEp3SER3ZEV2U1lOenoyWkloOFdnSGljb1RWd1NGTkZtQkRoMEty?=
 =?utf-8?B?Q0lqR2ZUQVFDSE1hOE1oNU16U2NqcHE2WGNFc0hEZDhjUnBrNnJHOEk2dGVF?=
 =?utf-8?B?T0E0N3QvQzJ4UUo1Sm5FeFN2Q1FSaE1jUzBhUXBJRExCajFVQXBKNmNYQ2NF?=
 =?utf-8?B?Z2ZnOVYxQnZ4YW5ic1cwTlZ4UnVybE1tQll5WU5KTnNDSEkzWnBlTndDejFx?=
 =?utf-8?B?aWFWbk8vWGtxRDNPaDlYSUlod0NqaG92S3F6dzVxbUxoeElaSEJ5U1ZCMlc3?=
 =?utf-8?B?MVBJeWpSVlQ3R3d4U25YSnQwdGZ6TU0xdnpYV1FlR2ZjdjcrcktWYmhFWk9F?=
 =?utf-8?B?eGpWS1VxZ0dvZVNjeUROZGNhSTA4RHEwaUg0V0w4VWczeVV6d1VIeEgyeitk?=
 =?utf-8?B?SnZPTFJDOTRUZ3ZBSU5LZ3JybHQrZ0JVWDRmZ0JkemhhTzdXM2YrUWI4V1Y4?=
 =?utf-8?B?ZXpYQjhSM1ltcjM2ZXNlczg5S1BObFd0c2J5L2tJMUJ0OGMzeUhhUDNPRFNR?=
 =?utf-8?B?T05YZnM4MW9HM2JUZWttczF2UENIcXptTS9MZHdsejdJSjZkN05QVlFFc0l2?=
 =?utf-8?B?d0hoVXZ5TXduSGhuMUhBQ0o1YnZubCtvRm96TW1Ba2ZXaXBaTFA4YVp0RXFW?=
 =?utf-8?B?L0JJRXczNXExWUUvYUN2OUZXaTREcTdoUWsvRS9iU2VFbS9ULzJHQytBb1Y2?=
 =?utf-8?B?czAwNnI1VzJ3RnpjR0I1NkFCbUp3c1R6cEh3RkEyZzJnRjNUdHFIUXpEZzgx?=
 =?utf-8?B?ZXFoRG1QNlpMdkQ3ZjNWZmZUWGIvM001OHZoKzVnRWxnQXFtNit2WGZmM1d0?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 893e57dc-8f2d-4897-2cd9-08db0ddaf1d9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 15:57:01.6973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q8afw2LM2S9RAX7ttfJ1Mczvj4PrbPxja1sihRXZVU0JTwU46s6mJJ2zXgr8S1bQxxiXw3omfylvLgDpn4tNweuBHv4Ja+flCdW4L72sdyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
X-OriginatorOrg: intel.com
Message-ID-Hash: I2FYIQA35VW3SBVGJH73CG35NLQU2NBP
X-Message-ID-Hash: I2FYIQA35VW3SBVGJH73CG35NLQU2NBP
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 jmontleo@redhat.com, casaxa@gmail.com, lma@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2FYIQA35VW3SBVGJH73CG35NLQU2NBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-02-10 5:55 PM, Cezary Rojewski wrote:

...

> A result of recent discussion [1] regarding sound regression in v6.1 and
> onward. Fix made possible by outstanding input from Jason and Sasa
> (Cced) - Thank you!
> 
> Note: I did not receive results from our CI yet, should happen on Monday
> but posting early so the review can be conducted.


Current results show no regression on SKL/KBL/APL RVPs with the 
skylake-driver.

Tested-by: Cezary Rojewski <cezary.rojewski@intel.com>

> [1]: https://lore.kernel.org/regressions/CALFERdzKUodLsm6=Ub3g2+PxpNpPtPq3bGBLbff=eZr9_S=YVA@mail.gmail.com/
