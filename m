Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36582535218
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 18:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA90D1F0;
	Thu, 26 May 2022 18:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA90D1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653582780;
	bh=L18z/jHfMOapXKYsR5VP1N5EgiBSjwis2SU+5mrnUnw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GazdPYdsWrBKDCzZWPRlP9iDHssZqYagnY0POJriEXA4f47Kl6JnWpx4LU29ZLXrC
	 Ai7UEayF3Jc6+9hz7u8gzdV052iRc9bWnTQ0lQQU6BaEmiG6TF1HwGiD7rI716TR/X
	 ScNuQipmiToIR9Dt8bMdE6y84Ub91RTMzl+k3NPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 584E3F80171;
	Thu, 26 May 2022 18:32:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B24F8014B; Thu, 26 May 2022 18:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64135F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 18:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64135F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZEkwJc28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653582715; x=1685118715;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L18z/jHfMOapXKYsR5VP1N5EgiBSjwis2SU+5mrnUnw=;
 b=ZEkwJc28SRiwrdJRwSW7GBSUS7Qch8gUbWXCG7IamEXlWs43qXUU5J12
 yGfqJDbCkgxniVzH7jVvCPhiGflCZnBbWApWtY/Yzf22AjqYE5n0m2Dpr
 Vxr24dGyoi7FE/8a7d+qgkH/SW8/cGrodV/oiV/xGcV7bbMm5+N0hbU/J
 uCC0ZJNOhj8mqGTG+p1KNifLWrrOX17oia1WyuopT7/H78dCquZdYfu+y
 0pArdTjFl9UGkUtTZlmRW7Jd6b9lplDxGNaLnGteWjg5VIZ+N4zNlRt9h
 QxNkMBCQzPTvc/qPnO9WgE7joTrVgW4WX2khRGg+xRw5w+h/0KKYycQ3Q w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10359"; a="254084647"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="254084647"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 09:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="609782555"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga001.jf.intel.com with ESMTP; 26 May 2022 09:31:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 26 May 2022 09:31:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 26 May 2022 09:31:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 26 May 2022 09:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kecVif2KdnKPAbURqiU7KfAZMYkNRQqjv1ZijW+gEl6KKOyxSC7IVUCUkApmMy5J21D2m53KOR6YDhn1YKaK8SocEPspTZwWb6XNLVr87U63wX3RbP0QtsNef1+oJnbzNQCz8fQPqJ/Bq21trq+wbSivSWdtdR6hNNuw/sUV1A/Tzh5TqTY0aVCefI9ZjRogQ5vzdIv3Tvoqh3mZNpyxVrK0mYPoMEzCT1Q86/qSeh5kPEC3DK5errJSjUc9/hodKXoiH8D/Vy+A3vqM75IZD1eGx9xqpqC9ll3rNik6NLSg91jngC63GE5/sDu32cK27Wy9Zqch0TazBN2bel8xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAIGhZ09JY3a6HGQud649BSlV/A4dn0kD/KfVh4Y/6A=;
 b=LuHDPDuE/8fClUwXa06xhCpj7xcLa42kVVGKdr04p29W2Nkny/N914HliCb/1MX7sVd9n9zj7nLOfYy5RYCAjk5NfUQyFirYQeneVNHi+cPbtEGiY+KzTLkkcJuDXSbmHkGhCxvEUYeZIanpxrrvmOX+MNLrPmtjZp9rVaLGfwjjvhrmaxSaSvzf6gdT1I8LrVAnSZAtNS1MA4nR/4pK5wYOd5Ng/8FAMmmMD4WjgRsnHrBEeHTtLijfkP2BfhWUdKB+wusFDo9Bkgli93zeuUgy1QihS0DfPCCsR8BPg4kJ8xUhuouoE3vim4HjhelPSAbZxZ/ENoBCXDnrEvuKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5598.namprd11.prod.outlook.com (2603:10b6:a03:304::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 16:31:39 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 16:31:39 +0000
Message-ID: <36c7f378-c45f-8406-2a8a-de6e604405e7@intel.com>
Date: Thu, 26 May 2022 18:31:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220526162443.GA60418@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7293feb2-b134-42d8-c3e1-08da3f35356e
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5598:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5598E76B4982FC792BE54819E3D99@SJ0PR11MB5598.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RfkSa0Jm2cDDSnVghd84PpkpHtfzqKooHT9QjW/9a/ZeHH7TOpZPLLGzScSwkdgcWV3CmKfzwGW25a+aNMy+qe635vpQNEVPLqChGNGn6VwyLKsjNGA+zdKqGpvuCKvCadKvKS6NNp4cvEpyeCv9c65KZLFELZUOuDcP6JWklq33sM4fI3aY6wKP+ymJKHB2MRLzVnIO5XOOUpAXs9WEWQ3VB7ZqCAcGtIhlCCJY6q+TkyWvmxfoZ7X6fFMMg2it3DecmRs2yp1NESjj1JVO1LzPO8uCQLZXQTj2+Ics9DPZ8FQopNA9DV0Wj6BDlhVHjFbQcHhRsw9xMTLncOgIYgnLp8RfUb2P6ZoFNpuQFkZcDxm+W+iYj1ElERblcNgSof9hyGV4c5wbVsvuDFGG2Mgo2PA9K7kRSgSUhB7WcRzhA+LOn26jZWE12YFW49XhU7drLx2gom4bpxver/QGOPV59Lb1/TqVhkt58SZbCzXi+amNe5U1s0+tvITFeaRdsCiuJvqZ1As7DSOId9heTk2Dq7ea/KutKJOsRK6sZrnZFPBrJ6UoFHgocLC5B7BTCuPiPI+l/N2bc60FUuQ7EiYiB8qpKn9CLpJNRpcTYzxiUcxCJQ//bMH9N+yUE0IIAIt8pb2oMjuIe4McvCoWnqd+q1s6Hs4dqzwVVlg3KEvm5uHycVyVn2Gx5K51V6Y3HZtdmh2Dji+WKpsZXQVjsozdkXowDoWezmDrkpyMc5nt/C6EOX3kluZxHImivmnn/oHOk0icySKrratd3j7vyDrVcYx1srvJ6GuEm8vYDPCHTjw3E/MXzMdbKejSM7gt0D3OQ69TxJF76pBEMiX55Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(186003)(966005)(2906002)(26005)(6512007)(36756003)(31686004)(66574015)(66476007)(66946007)(66556008)(4326008)(83380400001)(6916009)(38100700002)(7416002)(86362001)(5660300002)(8676002)(316002)(2616005)(53546011)(8936002)(82960400001)(6506007)(6666004)(31696002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JCTGs5QVgzSFFnQUh1T3BYYnAxanJBR3lDY3dsemV1UWx3dVgxQkdWK0oz?=
 =?utf-8?B?eEVISndzVnVHVmhsQVNMVVpwMmp0MHpmU0o1L0VGalJNZ3YrSXVrTUFub3J2?=
 =?utf-8?B?bDI0eFVUNUpiYlRodnJQekFST0VGelJYT3YvaExUOGFQaXJEaDFTVWtVbUhm?=
 =?utf-8?B?M1QrZ0hxOFB6RVBVSGQ2YTJqclBoeVFzMmZ0WkNnelpXSTljSDlSRHlvYVE1?=
 =?utf-8?B?M1FBRWphdGtMcjczLzdDb1NvaHFuZm44TFFtWEFpYTNicjh4a2ltcmZNV00w?=
 =?utf-8?B?a1dQVVFGRDFTZFpIVnhFcUJYQ2wxNTJSVGF5MGFTRFJ4T2g5R0xHZ3kwMVcr?=
 =?utf-8?B?Vm0xc1ZCblNCYjY2VlYrUlVCbEZ3cHRNa2t6UGVzNGthQ3JnbnlnQkVjdGpM?=
 =?utf-8?B?NW8zYjBqSjBWdjNkbzRocm9BajdvdXpSUVFidUVGL0cvT3VYZFFrbUhMcFc0?=
 =?utf-8?B?M1lwcW9aTmRrb0xUYWRjNGt4QlI2OUxzSEc4cHlvc3VDUTJwUTJrcVVLQ01i?=
 =?utf-8?B?VEIyL2dmUnpuRUZRWEhHSzJScFV0SjVGbTZ2LzF5YlFjZ2lRTWtrenQ3MEQw?=
 =?utf-8?B?Nm81MG80T0NidGJGS1V4SUszZDJWUkNpOExqKy8vQlk3SmlYM1p6b2JaYU8w?=
 =?utf-8?B?T1Y4eHRZT0ZZK1A2ekdSRkM3ZzBZYXdid0RPUWZncWdISSt3Z3dkbDk5dVlo?=
 =?utf-8?B?MFVvdlRFRkNnU3F3N0Z5NExYYmJ3bURTZ1RxSmpqVHp6NW84enpPZVlnNk5a?=
 =?utf-8?B?RzFYdmZLS2NtUXFKeUIvMkVSY2YvdFB5eE1WSzh3bDAvRVJQb0pMY1hyRGV0?=
 =?utf-8?B?Q21YSitDMGp2MDc2UU00UnlOVVZlaEpxaVhUaTFzMjI2YUl3MzZKa3RlM1Jj?=
 =?utf-8?B?bm5oTVFOWHptcHh6Y2JWRkRxalBSdTFXUGJGWDBzMnltOTZTSng2OS9KdmlB?=
 =?utf-8?B?MHBMNUpBM05JeHFHMjk1U2pLTTJ0YXNueTdkTkNPeVp6bkNnWXUrNEg4eTJu?=
 =?utf-8?B?L0xyRHRwVUYreTY4Y2xCSGswT2FoSXlsSHdLeHlCMWlZNDg2R3Bac0p0ajNW?=
 =?utf-8?B?aE1Uc2RGeDJoSU1VQWtZdDBLM0lhYmVrREpMcGUzb3hUYnM2ZENKMDhTZUZT?=
 =?utf-8?B?ZmpzaG4yeWlneUxLbERSSGNkays2UDZzYVQrOGY0SDU1L215a1Z3K1hyTzI1?=
 =?utf-8?B?ZEV4dTNHd3JGZWhPWituZGhSSzkvbVhUa3BSWUx5U3dMWkNhL016ZWloTHBF?=
 =?utf-8?B?YTdvTFM2N3YwVjEyMlAwMmFSMmh3c0tQQlEyNmpvN3dXdVBwMzJwMmV2R3F4?=
 =?utf-8?B?M0pER1kzbEEyU0djV1BreFBuczJBRFZCdHErdDM1U2NmWDdtaGc1S3NMeWV6?=
 =?utf-8?B?NW5GRGs5bWxxM2VhTzduTnhMTFlERERQUW9QTkpvU0FER3ZtdWlJRzIwaWlz?=
 =?utf-8?B?c1lXeWJ4Y3dEOVkxd0FMTDNDYmlBN0Vwa2VNVzk0OHA0dEtjR0YzdlRHNlc0?=
 =?utf-8?B?SFliNXFVeGpPZU1nMk1hdXczdjdkZ2NMM2JjTkJrdXJsOU5xZkFsREVpRlBS?=
 =?utf-8?B?Zm9NYzAxU3d6bzJKdkhuMlI5TUF6akJ3QnNUWkYwSi84NEszdGdRbEVjNDNn?=
 =?utf-8?B?ZHRvaStRa0t2ZVJJSURLR0ZUSGNCNUZpbTVoNXJtRXZRVHM5TGorN0JRWlFn?=
 =?utf-8?B?NWhIT0xKc25aaWkyQlRHRXc5TUZSdHdoblA3VkhJQ2NsS25IbFdYQnlrVXZT?=
 =?utf-8?B?YXdkcFVCVXBEcVBVL0RtYlFmV29VMnNMYTdyOVY0RFBFZ0ZMbWhXb3Q5WURL?=
 =?utf-8?B?UGh5ZHcxYm9jeWliZVBTSXI0L20xSHVta3p3NHdEUyt1OWQzd05BbWtYUm5B?=
 =?utf-8?B?b3lyQU1sS2srdk15MU5PWERTZUN6ZkdkVXkxSmk3dzdKVS93cFFBbnhURTJq?=
 =?utf-8?B?VFpRMWt4NGNoN3BRWnM4VW85VWR1UGhmbDdTZjdwRVFjMUdadURmZzNWT2xm?=
 =?utf-8?B?U25sd2U0TDZ4Z0hRTFFmMC9zUlFYdFpVSlYvK0tXbGdZRW10SmVoNUMvbSsr?=
 =?utf-8?B?YjlJMEFxYUdDU1RWbkVwZVI5N1ZzejF5OTRYbW9zejRST3pCM25xYmp5TlZq?=
 =?utf-8?B?MTZlZ01KODR5dUZvZ1ZadGtsaGZ5T09xRFRrbVZmelFNK3MwYUlxUGV5V0Qz?=
 =?utf-8?B?MkRiZ09CV0xrMkZTdC8xcVdkOGlqaUtPR3dxcHNoYlBDclZjak5VeVVvbEFq?=
 =?utf-8?B?NStNaVpVSmt0NHA2c3Jta2R3T3A4SGtySTR3bVhOdjFaSERoaHJvS2tFZEpY?=
 =?utf-8?B?WmxmYU9yQk4rSHI1SmwwcmRNTTNSMUhNYVhlMGFFUzRBR010NVcwaXhmdGZv?=
 =?utf-8?Q?JOjEwIWWPk6Gfy0c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7293feb2-b134-42d8-c3e1-08da3f35356e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 16:31:39.0801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkeaV98rGw8N1ozttpS2IwR2wB8uDIAY9D8FSyYXF8nrhhAsvc6LTFH+MZrHqlsfctjgp2AKexOS59MNcIAIsSTdWEilthdRiPHaOMSu4zk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5598
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
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

On 2022-05-26 6:24 PM, Guenter Roeck wrote:
> On Mon, May 16, 2022 at 12:11:12PM +0200, Cezary Rojewski wrote:
>> AVS driver operates with granular audio card division in mind.
>> Super-card approach (e.g.: I2S, DMIC and HDA DAIs combined) is
>> deprecated in favour of individual cards - one per each device. This
>> provides necessary dynamism, especially for configurations with number
>> of codecs present and makes it easier to survive auxiliary devices
>> failures - one card failing to probe does not prevent others from
>> succeeding.
>>
>> All boards spawned by AVS are unregistered on ->remove(). This includes
>> dummy codecs such as DMIC.
>>
>> As all machine boards found in sound/soc/intel/boards are irreversibly
>> tied to 'super-card' approach, new boards are going to be introduced.
>> This temporarily increases number of boards available under /intel
>> directory until skylake-driver becomes deprecated and removed.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---


>> +
>> +static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
>> +{
>> +	struct platform_device *board;
>> +	int num_ssps;
>> +	char *name;
>> +	int ret;
>> +
>> +	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
>> +	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
>> +		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
> 
>     sound/soc/intel/avs/board_selection.c: In function 'avs_register_i2s_board':
>>> sound/soc/intel/avs/board_selection.c:328:36: warning: format '%ld' expects argument of type 'long int', but argument 5 has type 'int' [-Wformat=]
>       328 |                 dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
>                                                                                                    ^^^
> 
> Reported by 0-day but still made it into mainline.


Hello,

Thanks for the report. This seems to be a false-positive and is being 
addressed by a separate patchset [1]. Perhaps the cover letter for the 
mentioned series could have looped 0-day.
If I'm wrong about this, feel free to correct me.


[1]: 
https://lore.kernel.org/lkml/20220525144844.1571705-1-amadeuszx.slawinski@linux.intel.com/


Regards,
Czarek
