Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7B4FE637
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 18:45:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2605A1843;
	Tue, 12 Apr 2022 18:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2605A1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649781942;
	bh=fVOnbeYonnA+EK18LvXC0GZykZD/IoJXlLaKrq1506g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cMEXtF9m9crE+f508UkgkpGb+ovrOR6vJkWANjVl9xn0XweT7G4krS6q4gG5K27so
	 Dw5syjq53HJOqRGJVP7AZ8a9cgNvBs45S3ZKvT/Z7XyE23cxdu3v4FZq3ntF9VmT6p
	 0iQ5OVQWCvz615Qbmzf4UsiZpbCultXYa4Zk4IZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA0DF8011C;
	Tue, 12 Apr 2022 18:44:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7F0CF80109; Tue, 12 Apr 2022 18:44:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40EF7F80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 18:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40EF7F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QC078GDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649781877; x=1681317877;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fVOnbeYonnA+EK18LvXC0GZykZD/IoJXlLaKrq1506g=;
 b=QC078GDW1KFAkEWkdtRUK8a4Rh5EXiA4wUpb8NrRyZgDScqkQXRWUQmx
 ytjA2ILovs9l8+iutIFUyOwut000wRmYic+FTxYrJAjkx3y8uNpXb0fKy
 cGnBrERwe9+1CkIIdqP8unTfnfhzhP5ZXQsrkfshrtud/kFqUmgxTwPiD
 gkUHkbTeTG0lz/MotfbYJQCXcBeZ06UQgid/CWm6TvlSKoUunLZQQ1u1c
 ejYJl+3pbj54BQMYF5FC4IcVpXHwr94+28nTBfqbjs+PloR6ktS8jO9i3
 rgMvvjKIlqzbe5Xs7Z3jknRi1pAOazh9jAz/SyJekIRpMABFirduEqQy1 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="325344523"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="325344523"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 09:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="526560054"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 12 Apr 2022 09:39:56 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 09:39:56 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 09:39:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Apr 2022 09:39:55 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Apr 2022 09:39:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJDLX/3OBh6zTGd87a52zWdQ/FdfOj8vHXvSvpc3TNDvTpeb/nbkjnhP6S0p823CTCm9ofDYsk4/xDu3L6WWRE3IjF97yPM6/SZujZdskqkFyVwgnQClrVlcq1GN1ABEoXKlvwzRKTtJbkod1DGan0BPbLk+znoVIPzhf48jX/TeNmzCyKvki6cdF8r+QWDD5FnPWTPQJaEk38IDeUL+6TeH6nDPXm3dkwM5/gFl9XSBjzfjH5NGw0KsHqqbN+W4lqxJ71JUBSVO7fEJg2iW2nQdkuypUqw6RSfqIzD30t27/GSe/1Zbe0/yAJqmse7FqAdHJN6rWGvPxDgkLvVljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fvi0xeaiTLVV4jO3uh7plrigWuuaSOB9jlyNPs0Ebo4=;
 b=f8Mzp0u1Vg9VY/IB2y4qTkqBuynSX7WuHwQg0xaa7XEpqr6QCF5JtofM23Zo7YySNdhqTrEaXlOsU++9KBNLfUx8O0l/cMFHGbFxaoOJrQtFPjR4yp+f5rQo8+2kYZcgoYCybEwEP/vTFh+bu6RWB9WtcaHjWGTmjH9B2Pls+6/tKNyKNevK3nfL/Q48M/LFLHnv8F5nrAp1bk+kocvLFyyg8TSsXldWe43nRpi/BJ/0J5UpxlrC7W1DNgbJNhoo/8sL0dH1JrDKnLWLTowK52Jh3TAfykR2wZNjmI5RVHMtB90hC9zTvEvwU9LSqiNNtWWzZuj74Tx1h17VLdsDLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BY5PR11MB4196.namprd11.prod.outlook.com
 (2603:10b6:a03:1ce::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 16:39:50 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%12]) with mapi id 15.20.5144.029; Tue, 12 Apr
 2022 16:39:50 +0000
Message-ID: <724f7a99-96ee-2df9-6d23-38370225ee4c@intel.com>
Date: Tue, 12 Apr 2022 18:39:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 00/16] ASoC: SOF: add INTEL_IPC4 plumbing
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::16) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c8ef4d4-048c-4fbe-f8b2-08da1ca30fc8
X-MS-TrafficTypeDiagnostic: BY5PR11MB4196:EE_
X-Microsoft-Antispam-PRVS: <BY5PR11MB4196BF2DAFDFB837A70E833DE3ED9@BY5PR11MB4196.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /GG2rw4Lr3eFPNoip6MFt+ms003T29keotjGhUcfqBojlbGqP8pywnL/u1UF3CROTeVEKIBND/iHKdyMDc8/nZj4GKhugIOcSmi7CQpQC3eOvoBI7nbVFQqFzKkUvIsAt5lmpGbTMYgR11OOjoyWXeXaoMtKLiz6mYhqCe+eDjottP1y9PrbP+mGJp2vrw5sNFx61+MWQmfbnZ3jBjM4VDDq/1DB08eHAstddLkPqBY/grmqoFndZPSKM2YeEOLMqSf9NysbvkOVt+OGbSzCe3aKg1sprmMgg3chVl9g1Sw6mVQ7WbOTIb4f1P28vGlJDmM5aSZuiMHbls8LNUOR0v9ypPNuDN+5ExRXREI8nG5I1PPVNHoze56VMuAIAFqA9nMXO81rpXVMuGTuZtmKNKxTjyi9VlQ6Ww2KzOPtNOAJxQudCMWH1EqW6kfZ254hlottRsfGgrFioXfAmEybcBf9IkifqDOd8y5y5kxtprSBhdfjrM6PzO6FcZn1aBFe+1pu24dd/AH1+Qps5FKDIiRuxo6hm8UfF+GhfAYzWTlzTiZCUg4+1pkvrUUHsrRqMKpKlxzsP+XmBeXrostM8Q/+WBlyDFdFQX5aPsrZu8hTDWvOsY0RCe5ilFNS6W6sKyXGTt/GXiDFMm5FNY7SivgpiwtmPpVXivcME4jrquYqT0QhuMeimHaHFALKo9thKlKSM0LWhRd0FUtmxbLn17gWytOsXZhrD16PUCkUNBk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(5660300002)(8676002)(31696002)(66946007)(66556008)(66476007)(44832011)(2616005)(2906002)(4326008)(38100700002)(316002)(8936002)(6666004)(26005)(53546011)(6506007)(82960400001)(186003)(6512007)(6916009)(6486002)(508600001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDlCWFc2QWg5TERtMjdSdFZsZVd6QnNIOHBWNmZIdko0VldhUS9wT1ZGMThL?=
 =?utf-8?B?d0NlZ0k0RUJXcTdSa2JtbFIwamNnTlJKczdCYmlkTlg4K2hXRDUvYUVOOVJu?=
 =?utf-8?B?K2ZhVVE5VnFqOHJGcFcrYldjRUVRbVdZbUx2TytnaUVyTnlrejNySm55dHRh?=
 =?utf-8?B?NmJqYW9RZlI0Yk5wRzdVaVJZd3RYa2pjWElNQ09kRjh6WHY5dGlFK1hDaWhE?=
 =?utf-8?B?YjJZZDlzOUw2QmRsYU00UGlQNFR2WE50RUlyV1hTVWFTV3hkWFlLMHNmUDZ6?=
 =?utf-8?B?UHdKYWw5SVR0enBEU3h1djBPYUtkSHZGbm1sdXFZZWVBaGVwSnh2QW1DdExB?=
 =?utf-8?B?VXNVMGR4dkwrOUFsZmMxTnJnOG5odGJWMmtFRVAxKy9tcWtKaWUrV3dZTjJC?=
 =?utf-8?B?Tjd0QWk3MzJwdU9wZmJzTlFoUmlRZk9MMU9ObE5ROEtjd3Q0UFFKM2k3dHBv?=
 =?utf-8?B?MTM4a1RFY2duUkdaM3JPT1N1RTNIWDV3cFZXLy85MlBQTG51ZzNmTHU5N09h?=
 =?utf-8?B?a25YNmtzbG1GZjlsbDRURzNNaU45dnJuZjluUUJoYTZWNldiWGpXZTNLV1dz?=
 =?utf-8?B?dnNLTnlNWTFUcHE0TkY2b2NHQlRDUFlkOG4vTlYyUndJYlBLT2FKMlNDeVpy?=
 =?utf-8?B?UmFVUE1uMGY0UUV4akdWREVzTnFiR1NZNTN4R3oyM0NXZUtTdHdJS3BUd1FM?=
 =?utf-8?B?aVc1QnVKaHNVUys5cUl2bDhmWUVEakpXUlBHOEx5eXRlUEphWm96SHlrUit3?=
 =?utf-8?B?RkxIeWJBeGgvTE5CNGZFdEdobTB5N0tJZXVHTys4VXVvYWROeTVMMkphVmp5?=
 =?utf-8?B?UXVKRmFaTUtGRlpFWWcxU2h0ZWx1d1dmRXliYkF6T1pNU0pjK05CeER1bFRl?=
 =?utf-8?B?d05HMytiZU96ajMrQWVUZUsxZ0hBMnZCL3oySjZQYUxqakhaWE0waWwrRUZs?=
 =?utf-8?B?L2hQQmRwVVdMODJWZzFLRDV3QU1qTnZIaXVzTEhRL3dtVjBtTllGZExuZHph?=
 =?utf-8?B?UVIzajV0dzY2NytXeDF6OVNHYjFiY1ExbU9nRXg2OWZxU1h4amZveW1mdUNp?=
 =?utf-8?B?K242TU9vSGJhZ2ljOUtLOWdZUGtlSW5YNnVxRzZpVlFBeTh2ZlBDS2s1ZzZG?=
 =?utf-8?B?dGZ4S3Q1OWVFMU12QnRadDFvMWJlWU5PeWNweDM3aGVJWEtHT1pjb0NZVXNO?=
 =?utf-8?B?VEoyOUNMbGFtY0dPdXN3OXV3WWdwOXFIQkpHT25mcVB5WUo5dWN5UWNtMHdY?=
 =?utf-8?B?L25iVCtJbVJuby90UmZDRTVaL21udnNpSVlteFg4R1cwZUFvMURuelkrUGE0?=
 =?utf-8?B?SnE4TkRVclA0YkhSZmQzSk9PaVRKRGFFanFFdVJjMlpyTUloVitWQkJMaVNP?=
 =?utf-8?B?eFdXMEh0b3JjMkdtK2RmMG1pSUJSWXduUFRQTUJmWHNzVldvOTVKeUxOekE5?=
 =?utf-8?B?TFZCWmJrVnpTcnp5MDNmei91NDJDR0VWblgxd3BLMlZBSEF0Skh4bzdaNE96?=
 =?utf-8?B?cklmVVg0T05LTFNRQnlvbFZtajRlZFczK0JXckFIaFR4dkJHZ1dxRkxnSXRI?=
 =?utf-8?B?S0ZhMHllLzJYZEVLd3ZKMHhjdW9lZkc2WG9uM3RSa0s4aHFOamdvOXhiTWtI?=
 =?utf-8?B?Rm1kVjhDV29WUncySktKaXZrb1ZJWVJheWovdytZWUUxdEtTUmxQc3ExNmdT?=
 =?utf-8?B?MndBakE2VUVLSVlKUDZtODhYU1pzWDAzakZqRG5pTE9DbzErVTFhcXcrK0Fp?=
 =?utf-8?B?c0w0WDBva0E4QkhrbEYxaGdYcWFTTkp6L1FuVjNTTWZVamR6V0hFN1RJNFcv?=
 =?utf-8?B?UW9Cb2FqeWNnaHAzR2ZBbEQ4Y1JBRm1TS3NHZ2k1dFFkTE4raVRJSFBvMUk2?=
 =?utf-8?B?YlRFTWM1QXM4eHNXL09hQ2hSUktVNkZweWx6blY0WEhkb0ZXbWtxcUtGQS9I?=
 =?utf-8?B?MzNITktrTHhVZzVOR1RhcnMwZzhjU081OVFvNUdwaUtYZllSZTdXeU1KaVNI?=
 =?utf-8?B?WXBtK2RNODlkcGUwMWg2WCtlcWkwVHhxb0FQWGowaGZScVY3SVJsSUhNc1c3?=
 =?utf-8?B?QVZUL0JtT3FKS28wdEZxc01lSWFPcDFUME9LaDU3SWh3anNSb0FhdU12R2Rh?=
 =?utf-8?B?bXQ4Q2g3RXRHU2FLc2w0VmtYc0FZUTBJL2gvV3dEbFVnZTFhbEVWRUI1Njky?=
 =?utf-8?B?V2dudzhSaGd1SVlXYnE3aVV0YXZXRnZLUTFJT0hZd2NyZ3RpcEUrSjlVSUM5?=
 =?utf-8?B?MUViQkZGMFBiSU9LVGJMWGoyU2JBelgzeUpGblcxVG5aQmR5aVB6N2NRZXo2?=
 =?utf-8?B?M05HZTdWWkdQY3R6RUpaRXNiSCtUOFpGWWpiTVBCcmJxUWh0Z0FoMW85L3Za?=
 =?utf-8?Q?uNvuoNMsoPEiClSk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8ef4d4-048c-4fbe-f8b2-08da1ca30fc8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 16:39:50.0484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMb7/d7cra8UWlr/1PuESbXTzv1h/BBwNZBhmPJVbNGyElABDNUhUvLxsy2NJqALr+BJ5JJiS8oNgyfuZJ6u7pyvpskAglAO/zCA1/05XSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4196
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 broonie@kernel.org
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

On 2022-04-11 10:17 PM, Pierre-Louis Bossart wrote:
> The INTEL_IPC4 protocol and firmware architecture will rely on
> different sets of firmware binary and topology files. Some platforms
> will only support INTEL_IPC4, some will support both INTEL_IPC4 and
> SOF_IPC for development, and some will stay with the existing SOF_IPC.
> 
> This patchset adds new IPC definitions, and search paths for firmware
> and topology files, along with means to override the default IPC type
> and search paths for development. The firmware binary names are
> aligned with those used by the Intel AVS driver to avoid duplicate
> firmware installs, but the topology will have to differ due to driver
> architecture differences.
> 
> In addition, this patchset adds basic hardware support for SKL/KBL
> with HDaudio codecs, which requires a dedicated code loader and
> manifest support. Plain HDAudio was tested on Dell XPS 9350 and Intel
> NUC devices. HDAudio+DMIC support was tested on more recent UpExtreme
> (WHL and TGL variants).
> 
> Pierre-Louis Bossart (12):
>    ASoC: SOF: add definitions for different IPC types
>    ASoC: SOF: add path indirection to each IPC type
>    ASoC: SOF: add default IPC capability and file paths
>    ASoC: SOF: add IPC-dependent file names
>    ASoC: SOF: sof-pci-dev: add parameter to override firmware filename
>    ASoC: SOF: sof-pci-dev: add parameter to override topology filename
>    ASoC: SOF: sof-audio: preserve topology filename override in nocodec
>      mode
>    ASoC: SOF: remove const qualifier for 'struct snd_sof_dsp_ops'
>    ASoC: SOF: Intel: hda: use common ops across platforms
>    ASoC: SOF: Intel: hda: use BIT() macros for consistency
>    ASoC: SOF: Intel: add initial SKL/KBL hardware support
>    ASoC: SOF: Intel: add IP identifier
> 
> Ranjani Sridharan (4):
>    ASoC: SOF: Intel: move HDA_CL_STREAM_FORMAT definition to header
>    ASoC: SOF: Intel: hda: define check_ipc_irq op
>    ASoC: SOF: Intel: hda: Define rom_status_reg in sof_intel_dsp_desc
>    ASoC: SOF: Intel: hda: expose some codeloader functions


Hmm.. I'd have expected this sent as a RFC first, especially the SKL/KBL 
bits. That's because we already have dedicated solution for said 
platforms - avs-driver - and this series seems to be adding support 
while using 1:1 firmware as the mentioned avs-driver. Looks to me as an 
unnecessary maintenance cost increase.

Essentially, patches 14, 15, 16 should not be part of this series. You 
can always have a IPC4 preparation first, and a dedicated topic for 
SKL/KBL later.


Regards,
Czarek
