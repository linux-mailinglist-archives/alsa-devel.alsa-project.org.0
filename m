Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2323A5484A1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jun 2022 12:55:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E7A5184E;
	Mon, 13 Jun 2022 12:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E7A5184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655117709;
	bh=D8y6xKVo9CNWTbAC3YhZRxU/Vu+fKh7xeqzVVSOoUPM=;
	h=Date:To:From:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eggUaij08AJpumhUrx4/dLw3N0MbO0Eg0wfEDNpaAhnjaoi/0xsHCwlMYdypGfmjV
	 07XY0RXp0p1P+oyukeAjoJ/lsXkpcJYN+27i5+XRZIB/VursqwxDaKRPYbVa24WNKe
	 rkKZOmoBrgYB4Mcg2LS2TwnCFHwq+MbmvB57nwkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B200BF804CC;
	Mon, 13 Jun 2022 12:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EA85F804C1; Mon, 13 Jun 2022 12:54:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB51F80139
 for <alsa-devel@alsa-project.org>; Mon, 13 Jun 2022 12:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB51F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="InU++stq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655117644; x=1686653644;
 h=message-id:date:to:cc:from:subject:
 content-transfer-encoding:mime-version;
 bh=D8y6xKVo9CNWTbAC3YhZRxU/Vu+fKh7xeqzVVSOoUPM=;
 b=InU++stq+C/8ld+R6BxUcbGW75WJWQxukoQ+ofiq5k9ofkmoAJ+P9Idq
 Gtriz8Bl1lnXQSy9SbKkjHvaC9lE3VSbRnKDqNrcXb+DKQ+8PdkC6qIip
 ucS/boEh1VDGzybViGcFaWaNnH3anTC/SPIkpN4HGTGhoGQyKkWZQa2i0
 xM3YjY12paTX2pn2VUM4tCJjR2HNQCa18KABwHJf8CSvg1MK5mkW+8V/d
 wt7hLH0zef+hyC+33izTGm2B9O1VCrOpI1RVbI93rdzenl7yF+8qE4dxH
 K6hcKDsPSRRbRDFuo67KLOdYoUAirKA0E9+ykXwuRsWAJt4ZHDtd4SFb9 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="278966687"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="278966687"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 03:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="651356762"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jun 2022 03:53:56 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 03:53:55 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 03:53:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 13 Jun 2022 03:53:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 13 Jun 2022 03:53:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRfx3tjXBuE5jTRqNHzLQjn2hQwqj5M9heIgVICC5Hw9LFcoI1hZfeh2/tdWMK9KSxSYOsklmkFF6gAxTCw7pnXNq3thECQ4PC/GNepP4bAvMgYe55hN/ObDpDwUk0SC7n36V9IYXFQ4NZoCs0bfiMpEvgl/MUv7nDvyOFWwkOeAB07C7+NRwy3s3rLtzuda9yv5/aLuXM7aRvDAjI8lMUmL5IYgVHyZAOhWhgXBL9CJ3k/LEMxK72DKqFetxjC3a4oTEf0WY+rsGYNEmkeoK+uGhv6Ev7ZMINBIJ0yPUl/XV+tht2hQbeC8IHj7u8PldvEqgnSdU75UwphkuvpqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsnozsuVurtNTX2RDdglWpqQmCRP7xHLIv9nz2j+kQQ=;
 b=WRcIxYBFJJnKyzhLsi0OYZtYkEmHiSiUzE/rejyfyQMXLoJ2O+s4cFf+1HO965K/MhroXpeo5uEiCJwoi0cD4m42/UAZtRdDFsQpUbfkRRJ8tKISfnXfSr4raYTd1G7sX+Xmj/VLC17CnO8IqseTNElFofOV8egInczBCW/Qn4id5+O+WhOPBOHAlQQgiiNQ26Ugu8XFvpkyd8PI9O2TZWmrRQtw79gNbkrJQ3Q14U+VngoFmzk2pSLx9QIoddymbAdMjYENX67pDo2kKP+KA5pJd7c6sisLbfaLUfGA7ZT1B8MgaDbonuFXWfxEiT+Fm+Z6v1o5JfaI4h/m98gCZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN6PR11MB1649.namprd11.prod.outlook.com (2603:10b6:405:f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Mon, 13 Jun 2022 10:53:50 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%7]) with mapi id 15.20.5332.014; Mon, 13 Jun 2022
 10:53:50 +0000
Message-ID: <29a2ca0f-bc0a-04b0-d0c9-8658359d365c@intel.com>
Date: Mon, 13 Jun 2022 12:53:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Content-Language: en-US
To: Dominik Brodowski <linux@dominikbrodowski.net>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, Mark Brown <broonie@kernel.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: ACPI REV override for Dell XPS 13 9343
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0721.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa192b6a-a323-43d9-ebe4-08da4d2b0008
X-MS-TrafficTypeDiagnostic: BN6PR11MB1649:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1649C2720BD0C84369107E98E3AB9@BN6PR11MB1649.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aje/7Ef461/ZYN5GLcG/odcXpNYYZpB++WJjHsKcQt0DURoTxXJ0iX6Blx41CqqgwOIE6gLt2UqOcdJCIObYv1HTc8eKpGXXTj8Te59unn3aozKQlWHEw3T12vMVG8wfy6tcCntREFpsJoRHSCOnwTE4wExuCUl3bkzvLBGD4mOyrbHkaduNP7rPud/GVPYE8F4TuNT/l7gZT/0TLNmfK56ADtulF/HSl3s21VXUXbVLYk19NBZzjMhVrLjVj0d79lR/288HhBefA9WbtMPFlHd4OZpQZC4Ob+SYBjxE8SSP3UEB0B5QqQnqpJApx4GQrxVnUDPa/gSD0/YbM4xaZxRPdw+QX/nU0CiC5V8/a/Cftlm5uiLMvaNXhW5Qom/bjAP/HN8k9p681noRV17cSXe3mf/ewx8ofYu3UD1MyP1zZHiGrBPapi0dUaUOdIAHWldbI6bEJiwprYsEesYBSU2XPyYjG7RE0S0mD29FamAH24D+nWzK8UwN70rfGRapf3N8+FdLq+RgTkaFaCmtRTw71aOctPK4cVOBKEvoN+33BJ4/Y6BoCQXTc+lj2iPNMJK4Rp8SzJQTpaFD8UeuHa0BAbwC1Esqw1prFkBl9oGLHQSf6x1KKYiaG4kMN27e7mIotSHFNOgL/H25dFmWZ8WBS3Va2wnC543ZQqzr0eqn2x5V6hHkHFyaS40z+8v6SGQSHD9/cklhSAl0CDex9EGKIX7ZlBTiip/WmlwnFgXcqu3qHmDxGIs5fZzrx37BeiEqNS7HdkFZ8v/2jlFBvuIb4jAFGr8qqIuFcJYhCoue1WVS40MaljfaG8JMol5MKhNYcLvxch07HTQCum5L4uQBi7I+NR9jWemAv9Fc9Oc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(186003)(86362001)(82960400001)(6666004)(6506007)(38100700002)(66556008)(26005)(6512007)(110136005)(508600001)(966005)(6486002)(316002)(4744005)(44832011)(2616005)(2906002)(54906003)(66946007)(66476007)(8676002)(5660300002)(4326008)(8936002)(36756003)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTdCeEROdXo4T2hPYVFZMGJvYy90SWV1ZDFoVlNuNXZCZkszZEZJdG9iMUNQ?=
 =?utf-8?B?OUlBVVFZeERPM2MvL3dnZTU1TEJvZGN5VlJ6ZGRnS3k2SVhhNGhxdUJ4dWVC?=
 =?utf-8?B?RmZud3VpSk1ySk8zWHo4bUdmU1QrQk9udFRFeXJDNjZycnBTcG1zYWt3a2xk?=
 =?utf-8?B?RTdqbFdzU09vYk0xaUhiUGpocVdiZTRpVEdvYXhIa21hQWxoSUZueFBCMjY4?=
 =?utf-8?B?empQSVFXcllHU3lTZGRRbW5nY1JlL2w1OGlQVjhlRDl4MEF2bE5kVkhsd2Zy?=
 =?utf-8?B?Sk40RlVPUmZJVjFtNkdnYiszSisrM1lrMlBFYWo3c3RoUW5tRVF1dmFNQmxx?=
 =?utf-8?B?bWhNUm1FU1h3dy9jOEpvRkNIM2VmbFpiUENERTlTZW1iRzBwdmZCVEtmc2hi?=
 =?utf-8?B?SThWbGp1dDVScnhqcjV5aktDWWxWY2RZd0UyR1llaUpkM1BrSkMyRitQSGFL?=
 =?utf-8?B?YW5Nck43NDhPMDFGVHJReDc3eFNLYXY4WDB0RWY1WEMySk1tKzlST0V1NVcy?=
 =?utf-8?B?TndNdUVEZmFwaXhYckllRk9BZ1FEWmMwVk85N2dKQXVUM2p2OHk4N1hNREVo?=
 =?utf-8?B?Sy84MGFJc0pnR0g4aEZacGwyR3RDWmVXTC9MRm5MeXNzYjFjb3hwS2VjWUVE?=
 =?utf-8?B?TnBsdTluM2VBUFN0Z1VhbVA2Z1R1bklNS1IrbEtKTmx5SG1VQ0xCK0VBVmVF?=
 =?utf-8?B?eFJNUlhtaXVoRHpENzFibFRtdlR5Y2RuSmRreTRFSWF1QkpZS0Z3L3daMmJz?=
 =?utf-8?B?T1RmRTFtMFpZYkdNUVpNT1FlSlZHSVRVbGlZbHJrZk9lZHI0aGsxZFRqYW10?=
 =?utf-8?B?a3FGdHV2N0tLSTBDSTdsbmNzODVvVGQ4eTZUZDdCaUx0bm1sNm1QOW9rYWpn?=
 =?utf-8?B?NmdIemdKSlp6TzJodmNqSzY2S0FscWJuUVBObWpvVXUvNEllRzJLMVNNeEdT?=
 =?utf-8?B?SFMzdnFobGc0R1hER05wVXdJUUxGRGE5U2tYanpkL2pHaWxoWVhIRmJGR29C?=
 =?utf-8?B?WG1HaUI2MnMxbFc4WnJTMU9nZURwTVQ1UG82cGhMZEx6NWRlRUVwbWRYdFIy?=
 =?utf-8?B?QndWaUlJMmdlaXQxWU5OTnhPU1FKR1c4aWdBbWhqN2xmVTVBOUlsYklrNjly?=
 =?utf-8?B?NWZ4ZnkxSXFTVGVnUWhhV2ZMMnR5d2JHS2pPa0V5WThIYkxJQ3VpMytZeGVO?=
 =?utf-8?B?Ti9jOVZrenNSbE9qL09IMDM5SmR1NHU1YUN3VFNLbEUrTlVtdW15RjhkdUg1?=
 =?utf-8?B?SlhHY2JDRnhkNWVoS2s0cFhyZThYaUMycWFiQ0t3UEpxOUNLTWlWa2ttZm1z?=
 =?utf-8?B?QXhOQktGQmNUMFVoQSs0ZHMrbHhFUHBWbHdWanhMV0p3QUdqa0tDeEN6VWU0?=
 =?utf-8?B?ZWFqUWNKRUJIL3laWWFLenRidnZ1NitaUVlBWVVXb0FxMGNzYU13RWE5UExO?=
 =?utf-8?B?OG9Jck1hbFFtYng2QzRMV0RQeVZqSjIzai9KNFRncjNhdW1NOUtJaVd4M25J?=
 =?utf-8?B?N0NGMldHNVZBMlhpVWJwVlFIeHBWQWhXcW1YeWFFUVNiekdmMnh4L3NtWFMw?=
 =?utf-8?B?NGcrUU53YkhTd09YZnhCWExEM0drSnNWNVV6QnZreXM3K2F3VWx2aUttWUtR?=
 =?utf-8?B?UXBZaWdKOUMvKzFBVEdBTXEzc0d4ditLbDBwRzZzcUhVbzUwYkpWdW1yaHk5?=
 =?utf-8?B?MDhyM2ZTM2EvMFp2OWJHY1VqdHNBRi82K3BaQjJwYXg5dmIwNC9iQWlqYkN5?=
 =?utf-8?B?cHFGVXM0K3QvTmJqT0hkdVlCZXc5NldHbURTTlJJa1lzaTNFU01XNXoxUHFk?=
 =?utf-8?B?bTVlYWNmQ1FNT1ZmS2R2dkZkYlNqdVZRZVpuRko0YWhVUjJPMmlnVmRNUm90?=
 =?utf-8?B?bTV0SnlSZFlIUDNzYlJCM2pwQXVBdXcxWjl0YzlzNHNMbWZJdktBZ0hhRE5k?=
 =?utf-8?B?SG9PeXpCTE9yalJOdlpFdHFrZEVBdnJSZmhWNVNDMHlhSnp4TWIzdjBHL0hG?=
 =?utf-8?B?UlRYWUNkL2RacWQxckZUbmtONGJMNHlkTms2RStnaS9jcEJWOU1RYmVObVYw?=
 =?utf-8?B?b01pN0ZvY1o4bVlRT1dzUWRJNk4rUXRyYmdlNFZEL0IxRmdSWlc3THlXWU1a?=
 =?utf-8?B?cFNEMTBhL0ZWY1hjWVUva01uREJvQVhrTFFmRytZdHRiT3hDWVZoWUt5K2ls?=
 =?utf-8?B?cXJwb3YxNFdHR0FTKzdVVUdlZlNmbHFUVkFuU3ErR0ZoZWozTWlKYjJJREdD?=
 =?utf-8?B?dGM1ZmdyR0VGWUVzYWpJajBPSGhUOGJ3S0dzM1FFSU9BUWdoSGhkYXNPdlRK?=
 =?utf-8?B?RjdMNVdSWHdYaFhMZEhXMi9DTUFSTWNINzh5SUNYdzFLbjFjRnpJbjhLRytM?=
 =?utf-8?Q?bjLl/NVMkuuIFmnY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa192b6a-a323-43d9-ebe4-08da4d2b0008
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 10:53:50.7894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abSrSI9uuSEnMhJFp5+bUe2th3KKofAaMZvCwIimuLT+/kL4CS3Yzcf3MkYk3CtdM+rHH0PnA1kcV2MD/Bpppzsqpp+njRPTjdSaKl4ieVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1649
X-OriginatorOrg: intel.com
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
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

Hello,

It's been a while since catpt-driver [1] has been introduced to provide 
full support for Broadwell (BDW) machines with Intel DSP. For BDW, audio 
devices can make use of DSP only in I2S mode. In 2015 Rafael and Dominik 
provided quirk [2] for Dell XPS 13 9343. Given the description:

_For example, based on what ACPI exports as the supported revision, Dell 
XPS 13 (2015) configures its audio device to either work in HDA mode or 
in I2S mode, where the former is supposed to be used on Linux until the 
latter is fully supported (in the kernel as well as in user space)._

It's clear that such configuration was not fully supported back then. I 
believe now it is. Perhaps it is time to let the quirk in mention go? By 
that I mean just the relevant entry, not the ACPI_REV_OVERRIDE_POSSIBLE 
functionality as a whole.


[1]: 
https://lore.kernel.org/all/20200929141247.8058-1-cezary.rojewski@intel.com/
[2]: https://lore.kernel.org/alsa-devel/5115175.tbCl1JQVaV@vostro.rjw.lan/


Regards,
Czarek
