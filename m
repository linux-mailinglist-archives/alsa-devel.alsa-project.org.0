Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0765163E6
	for <lists+alsa-devel@lfdr.de>; Sun,  1 May 2022 12:56:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7FB3868;
	Sun,  1 May 2022 12:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7FB3868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651402580;
	bh=qZIDegtYk7t5ec+1yA98Ku9bJE3Lu30fhh8xRLkzLXA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rV1znYSWJpirzMVYHnPhYkyeCP4y5Lhie93UX7RDWXLfcpMq7qJdkLoucKb+1OSXR
	 WVJlDrPTh8jOrNjLKiF7rKu/AnzHzf6UcfuDxTDi8J7tN6zQNFznGeZuIEYT3lO5Rw
	 5nsJTLGV5p29aOcmjKUWEEjCDJGwy32AUpOpCk2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 462C3F8015B;
	Sun,  1 May 2022 12:55:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 596FEF80137; Sun,  1 May 2022 12:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B312FF80124
 for <alsa-devel@alsa-project.org>; Sun,  1 May 2022 12:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B312FF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="efNN78Hs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651402518; x=1682938518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qZIDegtYk7t5ec+1yA98Ku9bJE3Lu30fhh8xRLkzLXA=;
 b=efNN78HsxmFSYQXeT6dcaSztmn1Twt7YW+jX2OriSXwJri9DoQfYxU2d
 TLmMSGumHTxlBrlarMKWcXxXm7CJZ56G7sv34xEyA0NiJxSetkxEEyufW
 gZfK8ddWoRZlw1SmA1Y5nzSZYIBKJfr4moq36L5tzK9sW458YjJ+EOXs5
 eK/ZmPUwLdVh479lCSo21q14uFzKoM/Lo4cuYgkEIqVcT7UJc/Uh91uvY
 dQD1b9ibX1jE5YAskF924CgjEblvRQUn+qTp8JKBFixlw6CMJPho7bRH7
 h+Kx8ry6o9mO5LvObxzgo5M+eKI+hHGs7eaRn/Ghs3PDfsUWY3VVtbQJU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10333"; a="327523205"
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="327523205"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 03:55:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,189,1647327600"; d="scan'208";a="707204411"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga001.fm.intel.com with ESMTP; 01 May 2022 03:55:15 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 03:55:14 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 03:55:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 1 May 2022 03:55:14 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 1 May 2022 03:55:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+pB054xpYtWj0MUDTEFajPKVncEW17GqdAqgzjxUnALJglCc13mke5vfYhqnekWvXmEwTERlgjr3ZNe3f2wRXoFX+H149VZhlkeNQ82t008acY0f7QOnygawYUPo7+q/fvuoo2SQoxItVptRW9sMDKi54QGzK5GidQTBoehNPMk5Npm9plCd2Ff+AsYs5io137kuIOSLeVrZR+oBrIpaoH2naOZgc+j/V2n3JXyY4hkbw3SNecEANOhZ1YPBk0zXZVRDRkrdEOOTt4JlQ8IDvUe19J5wSvI9uRM4au8fBCOEYuhYMjmCyS5mO98VC9aNiUEva0ku5TAZtJt/6Cj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGp7XDRW6D2r7uRmWQJp3ILLtv7d6FE2p4kEyi+nY+Q=;
 b=a5F7cavkL2JV75SujH1XLkN6cSEq8Wg0SwS0LrwoTTH2DUdVw4I1nMEhlh0GvyLc3dDtRAbBkfp8nsvmc9RvZqFt/NA6QG/LNVLzrb41emvw70yQqzPzOBWefr5fLPaa58P65v9cTotn9eJcQDnFFZ4SJR0Z20CgqShl908000Z5FGjQxjpW42n/xU3DAfc0a9F0yT+JYbEO220JJvIV4SLWB+ExrruZLZOZkmhOxApHONq1PpA8P/n+y83D8FlGZj99GCZAyj/FLe616j8w2FmQnBymIkaKtOHroh842j9wxpMLmuzaXjMZ6/7Gq3nvUDO0DOeYpOcJ900TbBj/qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CY4PR11MB1896.namprd11.prod.outlook.com
 (2603:10b6:903:11a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sun, 1 May
 2022 10:55:12 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.028; Sun, 1 May 2022
 10:55:12 +0000
Message-ID: <a02cd818-a6db-fc1a-d434-77cae3959a80@intel.com>
Date: Sun, 1 May 2022 12:55:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 05/14] ASoC: Intel: avs: HDA PCM BE operations
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-6-cezary.rojewski@intel.com>
 <6331fe1d-3bbf-8ba9-bb81-c670093d41c9@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <6331fe1d-3bbf-8ba9-bb81-c670093d41c9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::7) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4845b5c1-0c28-4c5a-b312-08da2b6110bc
X-MS-TrafficTypeDiagnostic: CY4PR11MB1896:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB1896370829384FA3DEA27119E3FE9@CY4PR11MB1896.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lbU+q0aihN3WBqNdPmKznIoioYGoi9rPFT8k52esQavkHxvJASe8CX1b6vt1WuHYH9B/X/+RA28qypZmTxNtu9glZ14jnxZ/wuwFwUkaff0rxUluyPLhVxvo0a6sg6Z97c9XUfyy27bgsgHZvSS/FkkuSkTrBrdmB+GRMmVgz1kzYhHSH9wZPdL/BhVdyPk4zn/JQ5m+uwwgpa8hB4MC3HyPlHHKpeSF6JCmyRShd5jluC42KDg0U4a7dHGqYmyAW4trmPLYnV3SeVpg9DkdEFIdA/tI+6H68pBDvAtAFdpz3vdUleAXH+QAuf3aFG3AcSgR4jprGZaOHgWeCwkHt4S/atWm1DlmldIbwp3iBHwEofdZNgAz0c/yIeeItnv9EAwLYx1fLRpTjcFtntkU4qA56/5M6KVuijfHUd87vExlu9djzruufBizO8DWxmzwo/rd/Xa34BoIfMTL37IfmzvzYxPyptxDd4iRXwSN9Ic82UqrvhXWIUqMHgSXz6JDd7fVuzHu7fbLUlZ8BIPtaqmyMsNnjLxrvfxVWDEwLoCHttDdK5a3XJTzDsjfKjsIBQqpvsWDruVykU4i8oq/+2uqa+2llB5EuvlYTWDzcqIp00kfypB+4ElcUlwxzP3DmapINREDcsi6ad4Wn/a8jQy1CgFyj+r1TRmIEvoZglj+MTf4bUpC2GUQ8eNr0nSfb+FEOvlGyJTL0jfxgY1n5rAsKXgkRwwmG8RtVemfH2Q+8lW7zjHi0H31swoMBqSg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(2906002)(6512007)(26005)(53546011)(86362001)(31696002)(316002)(82960400001)(6486002)(508600001)(6666004)(66476007)(66556008)(5660300002)(83380400001)(186003)(38100700002)(4326008)(31686004)(66946007)(8676002)(2616005)(36756003)(44832011)(7416002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0tHVSs5V3ZQbGRGZS9QSENIbzJZdHF4cXQyNVNHUXJoNzd4SHppRTJoVGVY?=
 =?utf-8?B?RWtRMVY0ZkMrUHI5a0grQzVGUjBzMUVQSm9nWHYxRUhBZE5qalNHSzdlZTJa?=
 =?utf-8?B?eldHQ0ZUOTcwR1kwUUVzTVhaSU9jaUIyckltcUVkME00alI2aFBSUG82UHRI?=
 =?utf-8?B?YmhMcnprTXpmYWpTS2hXQjVDSmV2eWNmWWt2bU54cFF5Lzd6c1dMZCsxNDlk?=
 =?utf-8?B?MlVBSURDM09SZTd5OG1OUW1mTzlFTENYQlZ3RUhZWWdNZzFoblhnL2tpYnYw?=
 =?utf-8?B?Y0RISTc2Y0k5MWpQYTYyanF5THhkTHZFem9QdUMrNHJpS0NrZU5sN2RidVlq?=
 =?utf-8?B?dU9aeEpleU1MNlFidTdRMkp3N2VoVENyWnUvcmUvOWVOYzZ6R1YzYVJlanky?=
 =?utf-8?B?RE1tQTRvZDBLMWRyM3V0YmRKUVNBMGY0WW5pZDNQdkRBUUpaSVBWdkhOWllz?=
 =?utf-8?B?cFl6anFWcUxFUW00NG9GRytpY3AwVzNPTnZNODVoN3FueGl6b0p5bGp1Z05B?=
 =?utf-8?B?WEpGUGNiUStXcU1uM0FtdkxWdWJ4WFdxc0ZGaWs5WkZ3WCs5TzZiRDdkbmVJ?=
 =?utf-8?B?eHQ0THdFcjhXc2ROWTFyVGthMlNmbkE4Rk8wTG1DUS9WeXUwY0dmRjIzNU9D?=
 =?utf-8?B?SHlLVHFvdGpCejd5bXJuRUdKMm15WkxZRllmcmMzUG16ZUZKVUxmVFJGWXU2?=
 =?utf-8?B?WDNXSFBUMnlXa3pXYnVpbXE2QVlnK2JUdUJRdDhaODh3T0J5NEN4V1VPM3h5?=
 =?utf-8?B?V3VsRGhHWTNJSnIzRzBJdVVjeml4WHRGSEZxdUZySGdkMkYwdDM1emFiMTdn?=
 =?utf-8?B?K1NLdHFJeUpFWDlKVUhPYW9wekc2QmJoWFlTTVE2a05QdEtqNzEwTmE4RXNT?=
 =?utf-8?B?MVh0Nk9EbjF5SDZIWGlVUU53RzB0OXhUUk1yeHNWbG5MRHdiVjJDRVBzRFBy?=
 =?utf-8?B?TmsvYXpvQ2hqRGphcU9KYy92QzFSUUVrSXJNdk1KV3BkTW1mRUYvTks4MFly?=
 =?utf-8?B?THBzQkRVdjk0RmVzSk13OGxGUFRWeXhITkpNR1VqdTRMRElERUZQN2dHK1pj?=
 =?utf-8?B?MzR2bUNWS3VsMGxhc1FueVNLNW9jL25saTB3aG50UlAwOXZnMXNmd1pMNlR3?=
 =?utf-8?B?SnBNU0R2aDJZQ1NWbzhhRmoxLzM2L0FrT0ZGV0lWTDBCZVUycFBsSUNOMnlh?=
 =?utf-8?B?aDUvOWpNUlJsMlFxcnZuaEtuYjI3ZkNlU1Y0RmF2RFFid2k0cjlidklNQmcy?=
 =?utf-8?B?TFdldnkwbDQraDA5VXN5TXltOGRNejU2K0Fpb1loaDREWldPaC9yRnIvYUdx?=
 =?utf-8?B?bmh2Qm9CVTJwSnpITGsxZjJudmltRjBXbDVKRmRZd2k4R0tYVXJXVmRoN05s?=
 =?utf-8?B?U0JZR1c1SHBhVGdSWUhONVZOVHFLK1QxL2E5eGlUdnJwdUowM0FlZmZFV0xW?=
 =?utf-8?B?OGp3NHBFS3RXRjl3MWk5RDhEVTJNY2lJUWpvTVJpbVBIeitrVUJiNHdFNW83?=
 =?utf-8?B?bUQ2WUZ5RWpPTWN3cHNxbFVFTDlWaUg0SGt0Zmh4bHpseDk4WHVNVlgycFM3?=
 =?utf-8?B?YkVmT3FOS3h3c3ZhbnEwOTg1ekdRWUdRa3dSRWlZUGZ6WXo2ZHJnMVBxWUF5?=
 =?utf-8?B?TU56MExhS0g3VzdVUlBjR3A0Q25IVllVMU94eFVyQUNyVG4xR3NIUW1EQlk4?=
 =?utf-8?B?Rll5K2s0ZVJHWXBlTkx6UVU2NTd2VGV3OGR0TVpJdTN2UTlJcFhhdXFrTGRx?=
 =?utf-8?B?SFAwVE1rTlZxSE8zc0c0UXJzak1uazcrWUlFWmJnVVhLTk4xZmE5UVZFeUhY?=
 =?utf-8?B?eTBUY3JhTlgzckg4bDNrZ2dWeVEwWVBFcEFCa1RSekpNb2JxRnVza25zcnVa?=
 =?utf-8?B?eW5RaytPTnRuRXJXdHdTZGpIUHVxM1dIOEF6RFE2SmROK1JZckdDVGlXQ3cr?=
 =?utf-8?B?ZFhBQmorWDZtcUtvUEs0c1B5elVxRHN6aXpHb1YyOEw1L1pRUnE0ZnlnV2Jj?=
 =?utf-8?B?M0hobFVJaXplZTVpamR0ZW0yU1EwbzJzTWdTREVWZDA4bjFjWEtQb1Vxelc4?=
 =?utf-8?B?cGVUYmY0dTdtaW1sdmZobERJWVdXWkxDV25WTmgxWFNBeFFmWlpnU2FwaU9u?=
 =?utf-8?B?cXVIeUt1SkdBZklxWi9QcURuTFBhUWViMnhzVVEwaVhTVzk3NzVjZUw3bHB4?=
 =?utf-8?B?aVEyZkFqWTlKNWVxWUhpK0pOMkJER0tTaHJldXdBOEdxN0F3ZjdkZ3NLU3RT?=
 =?utf-8?B?SG5zZC9TeVdXbnJGMVFXLzMxS3lXUStnZDFyUTFvSzJwM1krNW1yeG93bklP?=
 =?utf-8?B?c2N3Zy92eHREMnh4RTQrcVQ1czdqMWVIc1QyTDRhN0JEVXdiSGlEei84Tzlt?=
 =?utf-8?Q?h/K9BibcSbSo9I/U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4845b5c1-0c28-4c5a-b312-08da2b6110bc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2022 10:55:12.1470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fdrmlAeQZNPpdMF1Bhop+ZqeuwDsP/D4iuXQV9QcGeUK211/Lf3nKv3ARz2JyroXwKvb+YPfQufy3sAqomSqX3wgjiFPa6hVHBtfrJ5R5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1896
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
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

On 2022-04-26 11:45 PM, Pierre-Louis Bossart wrote:
>> +static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>> +{
>> +	struct avs_dma_data *data;
>> +	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
>> +	struct hdac_ext_stream *estream;
> 
> host_stream, estream, there seems to be multiple naming conventions for the same thing?

I see your point. Have the stream be called either host_ or link_ 
depending on which end we speak of (FE/BE). Current pattern:

- hstream for hdac_stream instances
- estream for hdac_ext_stream instances

Will reiterate and come back :)

>> +	struct hdac_ext_link *link;
>> +	struct hda_codec *codec;
>> +
>> +	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
>> +
>> +	data = snd_soc_dai_get_dma_data(dai, substream);
>> +	if (!data->path)
>> +		return 0;
>> +
>> +	estream = substream->runtime->private_data;
>> +	estream->link_prepared = false;
>> +	avs_path_free(data->path);
>> +	data->path = NULL;
>> +
>> +	/* clear link <-> stream mapping */
>> +	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
>> +	link = snd_hdac_ext_bus_link_at(&codec->bus->core, codec->core.addr);
>> +	if (!link)
>> +		return -EINVAL;
>> +
>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>> +		snd_hdac_ext_link_clear_stream_id(link, estream->hstream.stream_tag);
>> +
>> +	return 0;
>> +}
> 
>> +static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
>> +				  struct snd_soc_dai *dai)
>> +{
>> +	struct hdac_ext_stream *estream;
>> +	struct avs_dma_data *data;
>> +	int ret = 0;
>> +
>> +	dev_dbg(dai->dev, "entry %s cmd=%d\n", __func__, cmd);
>> +
>> +	data = snd_soc_dai_get_dma_data(dai, substream);
>> +	estream = substream->runtime->private_data;
>> +
>> +	switch (cmd) {
>> +	case SNDRV_PCM_TRIGGER_START:
>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> +		snd_hdac_ext_link_stream_start(estream);
>> +
>> +		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
>> +		if (ret < 0)
>> +			dev_err(dai->dev, "run BE path failed: %d\n", ret);
>> +		break;
>> +
>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>> +	case SNDRV_PCM_TRIGGER_STOP:
>> +		ret = avs_path_pause(data->path);
>> +		if (ret < 0)
>> +			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
>> +
>> +		snd_hdac_ext_link_stream_clear(estream);
>> +
>> +		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
>> +			ret = avs_path_reset(data->path);
>> +			if (ret < 0)
>> +				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
>> +		}
>> +		break;
>> +
>> +	default:
>> +		ret = -EINVAL;
> 
> TRIGGER_SUSPEND?


As explained in previous patch, PM for PCM streaming is part of a 
separate patch (not found on the list yet). Because of this, all related 
triggers are ignored in current series.

>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
> 
>> +static const struct snd_soc_component_driver avs_hda_component_driver = {
>> +	.name			= "avs-hda-pcm",
>> +	.probe			= avs_component_hda_probe,
>> +	.remove			= avs_component_hda_remove,
>> +	.open			= avs_component_hda_open,
>> +	.close			= avs_component_hda_close,
>> +	.pointer		= avs_component_pointer,
>> +	.mmap			= avs_component_mmap,
>> +	.pcm_construct		= avs_component_construct,
>> +	/*
>> +	 * hda platform component's probe() is dependent on
>> +	 * codec->pcm_list_head, it needs to be initialized after codec
>> +	 * component. remove_order is here for completeness sake
>> +	 */
>> +	.probe_order		= SND_SOC_COMP_ORDER_LATE,
>> +	.remove_order		= SND_SOC_COMP_ORDER_EARLY,
>> +	.module_get_upon_open	= 1,
>> +	.topology_name_prefix	= "intel/avs",
>> +	.non_legacy_dai_naming	= true,
> 
> needed?


Similarly as in previous patch - will re-check. Probably impacts (or 
impacted in the past) DAI registering process.

>> +};
>> +
>> +int avs_hda_platform_register(struct avs_dev *adev, const char *name)
>> +{
>> +	return avs_soc_component_register(adev->dev, name,
>> +					  &avs_hda_component_driver, NULL, 0);
>> +}
