Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D956D7CF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 10:26:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1938820;
	Mon, 11 Jul 2022 10:25:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1938820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657527997;
	bh=rM31SzaLJ2DJPd5mPnd2NR2ZamqqzaJAdh5oMXeUvL8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KyHigVqXlp4vFfE864Obp6jAxhjKGnssDi6cK3hmh5Wsc7OjBcJUslrTPPHf7IjaL
	 o9UbWUMwCtgHDHFSObnpChlDdAlOF/hykMQp9uAMcsvEo6JoKKXvxnN8Xm9mLJAltS
	 +m3ZutK3u53tKmop6qxwvLCKpbO9DkqDMCYdk3wE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75405F80256;
	Mon, 11 Jul 2022 10:25:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9873CF80163; Mon, 11 Jul 2022 10:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C57C9F80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 10:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C57C9F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="O7/3lhlo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657527932; x=1689063932;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rM31SzaLJ2DJPd5mPnd2NR2ZamqqzaJAdh5oMXeUvL8=;
 b=O7/3lhloa+unT8n2Z85jBPuozFQGxoY5XIOsYjxSdVLLBoToqOQQ4PZl
 ZRcSEzcKzJBQUjhJy5GyRqCvElB7xQsVtKKKdYuaiqpTC0+zJvxm+t6fQ
 I7BIwEPPsw4m/d7ushZM/e9Mw1r8YzicdsNKnF6QCxRnaQI/foDFH3t6b
 2+DAsNkKeRiwGIqL8jQ86MH3QdafZqHlCzX8btqTNzUYQ3WFjk2+JDSw+
 tNQrC5qMHUZZ801I5HEjbjnLD3YR0HHp8IOnMiakbcGZtZj0/k0NdZdHN
 76Ybwr8sU39rZaMAG4mvJYmv+balxk4DVMP2Fo90BR+ng7TGo34+rn2jv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="282157251"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="282157251"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 01:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="737014276"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2022 01:25:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 01:25:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 01:25:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 01:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBRsBMbViOkZtA9EoxV/NPQGZxVNICCPyEOfv3/byyuayhjMESKazBqvS2CW7P8wQytWrQDC6JOYBGAgbSVfdf0I2j0fE4O71SZumYW/depIRTlIBh69zzSllykDvTEYIkEJ2nfj91tPds9YuH6g+5GVXRrT8IkQQJvgGm6EisRyJp4RycSAs/EEbAjCs+qh/VdccMqxGap8FHNlql2n7AuzWrZQxKgRLuO00lUdI0uGnJyuxEtbjgVWIQL8A+mouKgfp20xO+9h/q2SgeuRH3pxwn92yP+WnNfOVliVJeQaGY4lbZHOassg5ebayvcTnYWKHcbPXHQSjvAS4Xgghw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDGlfAc29hI1QxI2NtiZIezVp6iQEt3VHhIm2+aspGM=;
 b=R5ddLv6LWTRPx/IA65qQ8EB9wbOz2dh6f3xcAGz7Afopta5+LVZaOkCtHEpBLUM8kX01YY43hvfalcy/X0dzWaQ62I8h5Ts3wMCeGyGU1dVnhV51WuondgOzetdDdjsFhHY//zJyr0jkwMuJAyIsfw5Rx8kRbudKy448NtAtxQ8DQQfHKWJjqL/DgEbzP86HRuyMqatsGOA3cLeRsI32ND2WdPXGfXghVIlEW/msmtsT2tKymD+fuYz7G920qdiLgWmLxNl46FcXs/6rMoiaUnq34D7Nh6LvjPrlKmAsps39F74G4mntJ5awqyuWful0n5laEwCfzuUQpqj9xHc+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4364.namprd11.prod.outlook.com (2603:10b6:5:201::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.23; Mon, 11 Jul 2022 08:25:23 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 08:25:23 +0000
Message-ID: <2966b410-f00d-9b33-fcfa-30d484455579@intel.com>
Date: Mon, 11 Jul 2022 10:25:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/9] ALSA: hda: Do not unset preset when cleaning up codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-2-cezary.rojewski@intel.com>
 <878rp2i6sj.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <878rp2i6sj.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f168fa6f-f5de-4a28-30a4-08da6316e670
X-MS-TrafficTypeDiagnostic: DM6PR11MB4364:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lKJy6AAZcqd/Mu0z5XjX+SMl+nM5ouGxsiwFqa9t7coq5fmNexJSv5vhrRHQHBmTg1fG/Hr8Tg5fIHFGKBbDFDlMTF7QwKo8DFU8dm+mcW1ccTQ29OIoP9I0gXEBG/wrtaLPpJ33mXZ5Wrs0c3UcxxSxg1m9N1eqeKKcfuOD7rZNthLo9cpqAOI9qnfTMCFEtQqoSTQDMbxsOq3RgyKVa4d3fEfHrJPQqPrgeySE3/3z2pOZjzKiQOk+Wfch5tKnXNYh9AnV08E2PWVyzP1O/InLqGwhY//CTDdezZ0n/pCsm7+Y6xQSAYTwlUFyPtIFKzCeLkTpkcSb5wO7vKY76twbY3Mf8e4BEr+/8mEpZ0h2QfMNYdm3zdSbZ6bsQMYcXL95TmFP5VZXut0elpqmcJ/pH1Mm56aM5qx6Mh6st19wn/19uHC+q7Wh5gdZgIaX0KMLpMf1dlVcWwxMaWbEZwQmAikdP3NJJrZ5C7ChPeWtCcYls24T3G4lcghPNyuVy/NsBNpgkGXHjHvoW1L5G/8LzUZGQLTjYRQ9npEw4b4TKynPKdvE0BF3NO6A3cvmCstFWDy57/+DEsyWMIEU5vJdKoSi5fHOAzugnunEmfzPZwa/RavpOnAsVFlFKwDdU6qhjbgB9R7mMAnON6PS+MC8FFN29NmZ7ky/SRcqE0aqFO4eFVE/C6uYJjm+w5hQ0HzqILyEnFlOXNTauHEkURuCPNIFTKhu4HIhP9h9Utz+G4PoRntNCH4BTIhi7uxhx++ds3PuHZKpkBqkf6mcYiCXcRCvaA1lx8JWeZKamb082J2A0Tq5jrmUs0qdEQaXdrroLESyN8vD6u3XUTK9XbhCE8U2PvijDrH655YgRFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(396003)(376002)(346002)(31686004)(83380400001)(36756003)(66946007)(66476007)(66556008)(6486002)(8676002)(186003)(2906002)(4326008)(5660300002)(8936002)(44832011)(38100700002)(2616005)(53546011)(26005)(6506007)(6916009)(6512007)(478600001)(6666004)(41300700001)(86362001)(316002)(31696002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDByT2ZhWjNUc0orNVRrbVEwZ2E3UEo2WkttdlR3VXN1RFJUbWszMTdZbUZr?=
 =?utf-8?B?N1gySlZnaWpDdkdiYk1uZ2JDRmp3M29DRnl1amNkOHQ1dkdMTHNPUUIxODBN?=
 =?utf-8?B?dGtscTgyTVNXTlgxUHZmY0swUVZQUEd5K1YxSDdTa3lHS2pvdlNFclg0REUx?=
 =?utf-8?B?ejlvVDFDcHM3Qy9RK2VkRmhNSWxCSW1CaW1sdkZmMVl0Mk4vZldZTTRDYUhT?=
 =?utf-8?B?bExGcmlSNk9hWXBKbjcxZzFkaVZoTDk0SURURzVHR2FoVEY2Rm9XWXF2anYx?=
 =?utf-8?B?YUN3aURXRURCZ0k5dDZPS3hGcnZrcTBzcnNPYVVFbHlpQ29jcmRlUFprdjZs?=
 =?utf-8?B?UVd2NGpLeWFlUmFLRlZrUkVUVkpEbUxmVlZoQWRCaG85U01DcmpzeG5rVUpF?=
 =?utf-8?B?c1BRZEFrWkc3SGNhdW5XRGRHbENNQVNnM1dlUURPdXdWNUlkM2M1d0hzYXNu?=
 =?utf-8?B?VUFScitISnJXbnJnUXNqZFFFcis1NnFQc2JvVVIvdnQrYk9UcHNCa3g4WHFy?=
 =?utf-8?B?bHNsWGhhaUgrUDlTWWlFU3BMaHltWWVlbWY5RGxkUytXV2I3QndWamJxY3ht?=
 =?utf-8?B?bk5RcVRBTzg4YzEveWkyd3Y4bzNnSmVmN3h3Zk10SVNGR0hTQjd2SktyY3NL?=
 =?utf-8?B?Y2F2NEM1NUxuSDlBYno4VE5ISkhyc3NFajluZWp6ejFyQmlMdzNmTFdvZzBt?=
 =?utf-8?B?MkNSaWY1MCtDbE15OHhHRTZiSzA3UkRlL2Nqc3ZHTko4UVk4SFYvdXQ0cUlI?=
 =?utf-8?B?bXQ5a2h3ekR2bWVwWnlHK1l1blZjckVxSWVvNnN6NnVYVll2VkFXYXdQdTVh?=
 =?utf-8?B?MUN1Y3pRSUlxUVUzOUh0SUEzWHBJVURScy9CN1htaGlmbG1GOWlUWmxLRDR5?=
 =?utf-8?B?bjVnRVdkVDkwUEtPYktmZVVSbWxqeU9TelFqNGk2V29DRjFkdEhTY3g2NzZM?=
 =?utf-8?B?RER6MWVCdE8renAzMkNBZlJ6WnZidWNLRmZqQ1pFRitEc1ROZC9WYlpnL2t2?=
 =?utf-8?B?Wk9lZVpZaDlPWEF0U2F0K2hOMDJKK1pvSzlkN0doQzBZNTdRYXVEZjZ3MVg5?=
 =?utf-8?B?S0ZmSklTOS9zT0NiSDNvL05BaWxoa05JeFJPUS9hdyswZ1Vqdlh6NWs4RXhl?=
 =?utf-8?B?alVsOWtnNDRQc0NTb1NVQTluTWNRU0h6Z1RHZ0JFQTBDTlNKSkxSV2F2Z2t1?=
 =?utf-8?B?UUlaeHpNN044VU5hT3VMVXRkcThKMThzdnU1L3MwSm9UNW02aHBVM29JcHZt?=
 =?utf-8?B?b3U5eHNMMitqdFV5YWRKbU8wSTYvYUZ3L0dHNlFVMUpad29VU1RrUjBUL3RI?=
 =?utf-8?B?RWp1SDZOSlRjakY0T2JXYitaWk9sRzAxeGc4RkpsOEhsb052TGtXQkRzUkF2?=
 =?utf-8?B?MDdPMnFhVkZqcEZLMS92R1UrQWdKM0NNV3RPblB4dHQ1WlQydFN3QzJ0aGJK?=
 =?utf-8?B?eVhUUmIyQTgzTzhrWUJFaTRtWG1UdnRnRGFhSzk2MWpNRTBYdkNhUGJsaENi?=
 =?utf-8?B?WFd4OVJkMXNoa3RpZmFuQm1SK05ZZnlkVXFlUG44dmQ0TGgwalI3d3hSVlpY?=
 =?utf-8?B?ZVQrdzJvL3Q2aVFMMzhFdWI0QXh0SHFvTVBxVHAxY2NiQXhQajMwZkt4eTFB?=
 =?utf-8?B?bzdZL3M4bVZpTkZCN2RZOGlzMjVtcktEeVU0bUpBVkVmbVE1QWtKU2ZNMktM?=
 =?utf-8?B?RG4yMjdlaGxnYzJwbU1ydjhzNnhCT2YyS2ZUUHFmQjZsNDZVTm45dk9TTzlk?=
 =?utf-8?B?bWRYdWlHR1M1ZHp3WFI0cTNUdG5HRG8zbEo1eUtKNDlJWWtnYytWdDdjSnBz?=
 =?utf-8?B?UG1YSlA1N25VbkMzbk1sMXVrYkFUT2d3Qm1wTUV6aTZIdGdDUk5hUXFLUlkr?=
 =?utf-8?B?dFdmVlRHc1BIY1Z3bHhFZm5uUEx6N1NMWlhHamtjY3FGSmsxVFI2TnN6NTRl?=
 =?utf-8?B?VzVsTm95ejBJRE5hZDJNMDc2NFYzd3MvUkhBWWNWczAwcC91SXJMK2xlMFRL?=
 =?utf-8?B?bkJHcG1qZjlWWEFiRnNoZUN0QUEzak52Q29qRjNUMnNKUVQ3MmVVMGcrUUV2?=
 =?utf-8?B?U3YxYWF5RUg5YXhrb0Y0QjdNRnFiZ2F5bzZnQ2kzdWxuaDk2cDd4TURIWFJH?=
 =?utf-8?B?REtpL2VLZDI2TG1GczA3LzloNk1jQkxoMEFlYldLd2tsdDJhSDNZc2J5Z2pv?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f168fa6f-f5de-4a28-30a4-08da6316e670
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 08:25:23.5075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xliJpipJ1JTo8uVx9K3xZvwzrXZKwkAMyLjZwUu6xhmzeKMKTRLE4+20hQELaKw7gJ6L7AQj7nFCbBnD81DXPMONVYTwFa+KfMJ2AtzmVj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4364
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-07-09 6:34 PM, Takashi Iwai wrote:
> On Wed, 06 Jul 2022 14:02:22 +0200,
> Cezary Rojewski wrote:
>>
>> snd_hda_codec_cleanup_for_unbind() unsets preset what interferes with
>> module unloading and triggers null-ptr-deref. Preset is assigned only
>> once, during device/driver matching whereas module reload and unload
>> follow completely different path and may occur several times during
>> runtime.
> 
> Hm, the driver reload/unload does unbind.  Keeping this field mean to
> leave the pointer to the possibly freed object, no?
> 
> And if it's not cleared, where is this field cleared instead?


avs-driver i.e. the bus driver takes responsibility for the codec device 
only. There is no real probe(), just the device creation and 
initialization of its fields. The rest is handled by the component 
driver (sound/soc/hda.c). If this field is cleared and the test is 
limited to reloading HDAudio codec module alone, we get a panic. 
Something similar to the stack found below my message.

In regard to the other question - are presets freed at all? It seems all 
of them are part of the static device-driver matching list. If so, the 
pointer is always valid.


[  136.827856] RIP: 0010:hda_codec_probe+0x16c/0x560 [snd_soc_hda_codec]
[  136.827929] Code: ff 85 c0 0f 88 5b 0b 00 00 4d 8d bc 24 d0 03 00 00 
4c 89 ff e8 e5 a2 9e ca 49 8b 9c 24 d0 03 00 00 48 8d 7b 10 e8 d4 a2 9e 
ca <48> 8b 73 10 4c 89 e7 e8 e8 7d fb ff 85 c0 0f 88 43 0b 00 00 4c 89
[  136.828028] RSP: 0018:ffff888101af74d0 EFLAGS: 00010286
[  136.828079] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 
ffffffff8b4f1b1a
[  136.828128] RDX: 0000000000000001 RSI: 0000000000000008 RDI: 
ffffffff8e323d20
[  136.828175] RBP: ffff888101af7540 R08: 1ffffffff1c647a4 R09: 
fffffbfff1c647a5
[  136.828224] R10: ffffffff8e323d27 R11: fffffbfff1c647a4 R12: 
ffff888102920000
[  136.828272] R13: ffff88810812e428 R14: ffff888102925028 R15: 
ffff8881029203d0
[  136.828323] FS:  00007f9049dd8540(0000) GS:ffff888227100000(0000) 
knlGS:0000000000000000
[  136.828380] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  136.828425] CR2: 0000000000000010 CR3: 000000010f086001 CR4: 
00000000003706e0
[  136.828474] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
0000000000000000
[  136.828520] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
0000000000000400
[  136.828568] Call Trace:
[  136.828593]  <TASK>
[  136.828628]  snd_soc_component_probe+0x3a/0x60 [snd_soc_core]
[  136.828981]  soc_probe_component+0x276/0x4a0 [snd_soc_core]
[  136.829274]  snd_soc_bind_card+0x819/0x13d0 [snd_soc_core]
[  136.829560]  ? __kasan_slab_alloc+0x32/0x90
[  136.829614]  snd_soc_register_card+0x24e/0x260 [snd_soc_core]
[  136.829900]  devm_snd_soc_register_card+0x48/0x90 [snd_soc_core]
[  136.830204]  avs_hdaudio_probe+0x298/0x2c0 [snd_soc_avs_hdaudio]
[  136.830269]  platform_probe+0x67/0x100
[  136.830313]  really_probe+0x1ff/0x500
[  136.830354]  __driver_probe_device+0xeb/0x240
[  136.830397]  driver_probe_device+0x4e/0xf0
[  136.830438]  __driver_attach+0xfd/0x210
[  136.830478]  ? __device_attach_driver+0x170/0x170
[  136.830520]  bus_for_each_dev+0xf9/0x150
[  136.830557]  ? subsys_dev_iter_exit+0x10/0x10
[  136.830597]  ? preempt_count_sub+0x18/0xc0
[  136.830643]  driver_attach+0x2d/0x40
[  136.830679]  bus_add_driver+0x28e/0x320
[  136.830722]  driver_register+0xdc/0x170
[  136.830763]  ? 0xffffffffc0428000
[  136.830796]  __platform_driver_register+0x39/0x40
[  136.830842]  avs_hdaudio_driver_init+0x1c/0x1000 [snd_soc_avs_hdaudio]
[  136.830902]  do_one_initcall+0xa0/0x2e0
[  136.830939]  ? initcall_blacklisted+0x170/0x170
[  136.830981]  ? __kasan_kmalloc+0x88/0xa0
[  136.831020]  ? kasan_poison+0x3c/0x50
[  136.831059]  ? kasan_unpoison+0x28/0x50
[  136.831100]  ? kasan_poison+0x3c/0x50
[  136.831139]  ? __asan_register_globals+0x5e/0x70
[  136.831187]  do_init_module+0xf6/0x350
[  136.831228]  load_module+0x2bf5/0x2e30
(...)
