Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28059553506
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 16:55:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B58882007;
	Tue, 21 Jun 2022 16:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B58882007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655823319;
	bh=gMFGObbqPvgxvQ7WoxRP6RrJnG0E4d552B67yvNsZDM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7DVJyP7qvgOr4k2aroXehS1rXOl8HXwjbmMYcJioDOSrYENkbXeaVm6v6kzDb1qr
	 bQiDyF4wnrjrUFt2UJtS4wMXGXzG57J5r+/pCoSMXPPfMKkBnmitLc0FrKUrO2nMaZ
	 5BARFUcWQuMckFu5Y7mDj6fKELkIUDMEEnRdl4SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1F9F80253;
	Tue, 21 Jun 2022 16:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A49F80155; Tue, 21 Jun 2022 16:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78426F800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 16:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78426F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QkVisxby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655823256; x=1687359256;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gMFGObbqPvgxvQ7WoxRP6RrJnG0E4d552B67yvNsZDM=;
 b=QkVisxbypYhr8wl/DLwnLBgUT0eSnSzkBJmu+iy2iyMXardUjx10rSyt
 GDwazKbhWoELMZv3ouBqpMtgilqOWEUXtq2xDK4piuI08lGYZ8vSTYMvs
 It2Jvx8zXAB78aaUQReN/0GmtZqWUAykoA591DRWlVDX9O+8L7uNzELIw
 A6v4xtQ96pzx9OVBvLw5ZsyWqQbMOTQ9c1VnFhE8tgEzQi3iZU0CoJ51v
 8s2eQ8gS1nc0pN2Po3/bjLaZKZWWmuQV86D+htDTwewYHWQvdrJ6rHxEm
 DntBPiYYUjLTCOyFtVQnxkNHALp2ziub0VzqMapGOKEqy5FNRsxZBVLiO Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="344128443"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="344128443"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 07:54:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="715001165"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 21 Jun 2022 07:54:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 21 Jun 2022 07:54:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 21 Jun 2022 07:54:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 21 Jun 2022 07:54:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 21 Jun 2022 07:54:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwF+pO+GShAM0Xi4GTgctHRU1Rkx0eMihU7Vj3fHqhuqzSwELPku2vMGVSZnPMBpKWnc1zK4pBq1p99JV1KkuOv585LSR1XU4H1RyrI69zYgxdu1qWaI7VInaTui7q4vwD9IgMGiBOwykFCGiyAwq3ok26QquAyNBx7XXtqvgJhT8A5u+qPj1iqRdO+eXiOXeucBmeKqZaE7j7k6WwqkyGXA2C1RMIlb43Wx0ShlBzct8yCkKaYaWSbq+fkGBfk/YeSwNeRF0P+FcEt2mJAW36+bNNFcoKjuzldwfmvoCd45ePL/wtyRgISDOOyoMy2v/e90C9VElfxfKQ/b5a0RBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8Ehx0E//QYxPqMpFObAOPvS1Y54sVsIFrsvBm6pTTU=;
 b=F6ihsYWjL+l/Ly1y1Kc/09aWXacOcyZ3pJtP3bDWmpG0lSKBtlhkdSPyM7pUxSyMe3dHm4yeXkuRvFP1hWBmEwGK0QGS+IINyCt6x+rER+8r0sR3aDcWYF68+3q+s+fs2av3hT0A/X+U/NvxAEIohhjljFCkccbw1g7UE3psKyZvOLf6oGf3bFvTYSMvmcuThVpWuT3TOYx4EI8iItZ9zZj5iVr4ds6Rsf3wunPo7EgvNX/pfTzOjcgqtqjwPJw8QkaXCI4jjeR3fVNSOxjBBvrfmNGCxSP+KsKrc3Mjvfr2NzoLN3Cq/Urq9uXn5PbWl5YQwomNilIn3/LYu8s0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 21 Jun
 2022 14:54:07 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%6]) with mapi id 15.20.5353.016; Tue, 21 Jun 2022
 14:54:06 +0000
Message-ID: <1cff4ac0-6d45-95e1-ed9f-6abaded3f8b7@intel.com>
Date: Tue, 21 Jun 2022 16:53:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: core: Exit all links before removing their
 components
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220621115758.3154933-1-cezary.rojewski@intel.com>
 <24925485-9d0b-74c3-1e7f-b4906a3314ac@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <24925485-9d0b-74c3-1e7f-b4906a3314ac@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0050.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::27) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f2b706d-58d5-41da-ac98-08da5395e400
X-MS-TrafficTypeDiagnostic: BL1PR11MB5954:EE_
X-Microsoft-Antispam-PRVS: <BL1PR11MB59546E620CEED674FF2D66F9E3B39@BL1PR11MB5954.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AyGwL8mo9apv9/t6/Ht/c1y5WiBAkRCz2hFpv6gqFJ9WhQAvobidES/G9JmPiPZDFIjqme45CMFY7+O22UAc7AgDkOv4bcddKkC2fGhxt2KmBTQnU3Acrpo1Pmmb1SYK3ateLqsu6lO6t+hWroW3a649Fj67u6R1Ioik5hPXhqeM2dQMcK4U3QO9vSbCSManEhqr4EfLwf/IeUFdaXbiQkntXCzLfayjst0VFnm5/HFSkbYVHNU9VYwliUbjWlU+kNdW3ucnf3EbDVp3xUjBYWDnWln+lJmoPp811g6GFo96lEo9LGYB+avbh3xNXqyH26JGKSfsjDjczdrJP/XJWvJ2o0OIbeGp8Y5Tb/HCcq44xalmv/4BUBEmM1gdx4ZPFBoKMyTd5/VRnUBsaRdxK7g7xzjmf66T2OgIv3ngSZGy/cg206o31+vSjGa+yjPvEr9+iIbovSRmPeQVLyNTyJzVRZl8ZvIHdIdbbAksU0MCYmfh9l/ZNImdSCx7vMG99LgCAMydFXIIczwnxC2YnOR/mci5xwi2jd2UNVVPZdLSLJmxMs2s+2j+IdDkA2jI4UVPDERivkwNEI7S4t5SO4OqEbGlaH2H+9LxRMKQsMTk8Uxq7QVcsj5FfUHySpEfs02FiN6qJMs63BGccQiy478n610SxFSVMQG3mO9EOuw7OuQSf1TMThFQuTuyYnmSQtebDJH1xnfTwhavJo/VmxHDX8IVhbA0E8CvsbtUumE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(136003)(39860400002)(346002)(44832011)(2906002)(6506007)(66476007)(6666004)(316002)(8936002)(5660300002)(31686004)(86362001)(4326008)(8676002)(66556008)(66946007)(478600001)(31696002)(6486002)(36756003)(26005)(6512007)(53546011)(186003)(83380400001)(38100700002)(82960400001)(41300700001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1ZUdGp4dDJhVENWSFQ3NnQ5cG5zUVJwUXdUR3dlSDlmdHNZakZWcHpHNmUy?=
 =?utf-8?B?Rlg0a3JUU0JyYWRsREQ0R1NCNVA3dHcvRGduajhGYmI1dFFtR0RIMU5OZzZQ?=
 =?utf-8?B?eU9uRkYyNzBtZno0bmMrS2g0OXAxSzZKdDRzaDNHU1lxcmdFWlBQR3QzaVpm?=
 =?utf-8?B?SHQ2R2Ftem5SWXVlM2o3aGFrOWE0T1dnWDE0OHk3TWJveE9TV3hKa3JuWGpR?=
 =?utf-8?B?S2V4ZHFxVjB0bkpoTXF1YlRrV2FRNDhIYjg2d0pveE5NemxmblY0bElPYWFj?=
 =?utf-8?B?OGZBTTVxcnkyd1VUZ0tsMWFNTi9JQmhJTzJaSFk5ZWpJRWhkQTF5akhCYlZn?=
 =?utf-8?B?V29FVGNZU0g1bCtYNHdLL3BRNmJkRWU3VDdLblFNcjNqR2pmL0NhUzc3cCtr?=
 =?utf-8?B?dWJTRDFTa0dmVERDaTQ0WmcvSHlzdmNQWUlxTWdRcllBREVISWU2QVhkZUww?=
 =?utf-8?B?WFJqbE9JVHU2YmNXSDdTUE1ycjN1ekZiYkFhc2NScGNCUVJ1d3ZZZEhXVmpD?=
 =?utf-8?B?dlcvNkd6MksyNG9VWnh4Um1PVXFMYTlCNm0vaHc0eWcwdlp5MkVvM1BGd0Yy?=
 =?utf-8?B?U3FUWU8zOFNBV25lZjZDK0I2TCtueVlLaGJEYjIyZGRHZmI3eCszQUlVUXht?=
 =?utf-8?B?TUxOano3WWdKUW1XYVcwa0p3QTJ6U1czdXdkS3RDQm5lc1E4Yk5qVzdLWjRo?=
 =?utf-8?B?ZmpVSEFXeis5RE9yN2t5OFhwUUtPd0I4VDNMNzNrcnpnUE9yWitGdFl6KzZS?=
 =?utf-8?B?VDVWYUg5WDlldytzOTkzbWxlWnB6ZjVmTUxtTVZCcHdRNHREc2hJeTBxODE1?=
 =?utf-8?B?WUhWT0I2SU13aSt0VWtqWVRYM0MxbmJYQlNRbmpoZ1dYSURvbThsSEpnTFZm?=
 =?utf-8?B?SDdrakgvaXdUaFg1eENQTWRXM3NWeWJ0cWp6d1QvenhwVkY5SGpsUFJCUmQ4?=
 =?utf-8?B?SzBPWnRCSW4yQlpzUlhvbEh0bmcvMmtpdENRRERXakQzWVE2Y3FIOFZiQmVS?=
 =?utf-8?B?Qzh4MmhXa0h5cXA3NUtWR2VZcXNmR3A1anVZdzFSclNwT0ZnNUd0ZUQwWENn?=
 =?utf-8?B?MDMxcVY4TWhlN3lzbjFtR0ZGdVhjUDg1YTRwZlJEODFTUFA0MEZTSUluWG94?=
 =?utf-8?B?RTBWUDQva3R3L3JvRWlkOEdWVWxlOEVzNmsyNm5yUndLYStpUWFXSmVqMGJn?=
 =?utf-8?B?R1JvOUxyM0kyNTI2Sk80c1FZazAyak1NUnhtVzNTdWRpTXJrVGo3YmJsdVpp?=
 =?utf-8?B?aTJwc25nUlhiQVVPc1JyK3FTZ25XTGxkNXlZenh3MjdCbHM4MEJJRG9jYnFQ?=
 =?utf-8?B?ZWt6RUdPTXB2WTZHZEdTMlBVUmJRNGs1eVJzcVBRTHRNOG0wYmw5ZkY5dkl4?=
 =?utf-8?B?ZXI4a0p1OFR4Q21vQjQ5NXJNaE5oMTlwMkNRK1VVcHZXeU9IWU5TTDVTVXlQ?=
 =?utf-8?B?UEdsazJZN284MU1sRXlqSkVLUWtmdkY3Z3BYZXlYK1IzbEJBZU02aTIrOFlE?=
 =?utf-8?B?VEdTeldRcCtZbEtObEw1ZnBoT0cvZE5xK005Mm5KRXRlUWV5ZXcwMDE5K1hO?=
 =?utf-8?B?SGVFMVhUVUZPUTZXQ2ZlWWpuYlh2M3hQdW1KRlNhR1lHcVlIcHZ3YUhNazBH?=
 =?utf-8?B?eHFrbndPSjVBQ25XZnlqeG5CRncyazlUVUtXNWNrcGp4REFpOVppUlhEQkdR?=
 =?utf-8?B?ZEt6dUtsQzZ6YVpiQ1JXa3hPWG9TcmI4dE5ZV3pDVTlEVDN6TU5Sa2VHSWF6?=
 =?utf-8?B?aHdMeXoraUJWN1RLMXRYaCtaZUVaSGVhdVdEKzV4QjFpcklPaEoraEtELzNj?=
 =?utf-8?B?emJkTFVXektDZVMyZFpvTUhCaVkzU3ZPZnBGTENxY0xydnpvaVJIYmFIZktz?=
 =?utf-8?B?Y2Q3TDBqOTZtNFBKL1ZyUnhPZlVpaTVUd1VZU0xEenNMUGxWeDlFZVVPTDJL?=
 =?utf-8?B?K0ZRRXAwZ2JVRFFrNUQvMGNhemdFaEVxUHpQSjl5ZnljL2FLaE40eVZGYzAv?=
 =?utf-8?B?RVVXRjFCMU9PUkJWU3YrdmFJUmF1eW5BNFEvUTFldmhJVDdkdFhIdVd1THJM?=
 =?utf-8?B?eFlTcWluRlk0eTF5OWpvVkFRUzdxSTJVVmI1V0plYXRrYkhubXQrTldPRy9G?=
 =?utf-8?B?UnBZSHh5QS92QktHajZ6YWxyTkMrUVdaaWh0U1RSdTF6TElORU5hdHZzM1F2?=
 =?utf-8?B?YTlteFd0N2pXcWdJQlNMR2JvNnIweGl5YTBzOTFUdXVjbW5aUUhqenUzblZa?=
 =?utf-8?B?ejJZRjQwaGlSRldEVzNUaURwazlhRXArMGs4V014eGszbTRPTjQ0bGxaTW9H?=
 =?utf-8?B?Q2RHQnQzaUhvTDNGZnBDT3AvVFZRejNWbnFldmZoT3hlbjRHUjhLN2ZueUdF?=
 =?utf-8?Q?x9wrOqeXK2UPQlmM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2b706d-58d5-41da-ac98-08da5395e400
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 14:54:06.8859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDhSEhzpYKw2G//sBV2DzFzZVAEYy+RTsPEtzDLES+XNb/wYw1Wa00LGGYHqQVuQOfPCo07H2lrciAIMlfOJ/IseSUimIX/Mad9mrduToSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

On 2022-06-21 3:31 PM, Pierre-Louis Bossart wrote:
> On 6/21/22 06:57, Cezary Rojewski wrote:

>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index 4a3fca50a536..638e781df3b0 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -935,9 +935,6 @@ void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
>>   {
>>   	lockdep_assert_held(&client_mutex);
>>   
>> -	/* release machine specific resources */
>> -	snd_soc_link_exit(rtd);
>> -
>>   	/*
>>   	 * Notify the machine driver for extra destruction
>>   	 */
> 
> .... what is not shown here is the 	
> 
> 	soc_free_pcm_runtime(rtd);
> 
> which will call device_unregister(rtd->dev);
> 
> ....
> 
>> @@ -1888,6 +1885,9 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
>>   
>>   	snd_soc_dapm_shutdown(card);
>>   
>> +	/* release machine specific resources */
>> +	for_each_card_rtds(card, rtd)
>> +		snd_soc_link_exit(rtd);
> 
> ... so there's still a risk that the link exit refers to memory that's
> been released already.
> 
> We would need to make sure rtd->dev is not used in any of the existing
> callbacks - or other functions such as e.g. snd_soc_close_delayed_work()
> which makes use of rtd->dev
> 

The lack of soc_free_pcm_runtime() included here is done on purpose. 
After revisiting probe and remove flows it seems that there are more 
de-synchronization than just link->init() and link->exit(). However, I 
believe providing incremental changes is better than providing one 
single big patch which has much larger impact of the framework. Moving 
just the snd_soc_link_exit() has very limited impact.

In regard to the flow, we have to remember that 'someone' has to be the 
first one, 'someone' has to be the last one too. If the probe flow ends 
with link->init() (for the selected range of functions), then it feels 
natural for remove flow to begin with link->exit().

I've scanned the repo for usages of link->exit() and it seems only Intel 
platforms do so. Given their (functions) current content, status quo is 
achieved. AVS and CATPT drivers reload-tests show no regression too. The 
DAPM-pin warning I'd mentioned earlier in the bdw_rt286 discussion is 
also gone.


Regards,
Czarek
