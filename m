Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DFC4D0150
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 15:33:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F20E416C6;
	Mon,  7 Mar 2022 15:32:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F20E416C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646663609;
	bh=r6ltGvbUS0cqz+IRYroiy1GJ5YLB86X22xeA3+33QPc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HdMpCdgBIKJpybAckkBx2iqwwuPgRnha7ufznBaWFTynvM8evkgrnpDaHXg8J3ez4
	 3fCXRNZmCFD0scee8bpKPXfY6AK4swhvBRuGK02kD82GUvc2/fOKRMoa/IoQrYQbmm
	 YhxajoMfk/VeUNqp43tsfHC78l0/32soAvjIAbJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62DC6F80159;
	Mon,  7 Mar 2022 15:32:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C149FF80124; Mon,  7 Mar 2022 15:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D9FDF80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 15:32:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D9FDF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ct1C61HD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646663537; x=1678199537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r6ltGvbUS0cqz+IRYroiy1GJ5YLB86X22xeA3+33QPc=;
 b=Ct1C61HDvJM+VMRWQ00dzjqIJ3MSJHc4v5J1fHHTSGzQgTH//veiXDPQ
 EyGGly8KVyqZeX7YcAd+CUhw6kLBnHgLbckZQXdaARR2k4fDsBo5+b6HS
 l5Otm4mQPzwRS2jppMxJNCV4V509MNzkLNnCzNmyvP8VyHGHtI3elx04R
 qlEdOG/o0Njb23C2AgQkxFi+CxRncRumoUaDo7xG9TBciqfHiBW37Xm98
 3d7mTphm3M4lLp7102b6uJKI1tAR3znAv+nXGAddVfLUrfu9Xh+l4m6ZM
 ipIat4FTmVKMujCrbdPBEsCfrrYFfXS1nD7wovLLUnEQtTwjX4AH38QAG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="253234346"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="253234346"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="595517325"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2022 06:32:12 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 06:32:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 7 Mar 2022 06:32:11 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 7 Mar 2022 06:32:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Az9BV0tdCQH/wd5IvoQw/edyi2Yu6ZHuv1m19zhIGy2pWnyU84CS61TGhzvpZSMv/ZgPWRqq/4rtxf5teE6ysUB3wPFn/RIGbCx1jnOjJqLlqom8pbvT8y7oCz3gogYUpRfWvrXnYE9SSYsJ49BVZ2LpIMud/r9Z98wkXyEowGu0/VxJzFPlWEpZnHSUf8vnE3D3sOVjXpqwN7OCVWgJF4/tI0WLu31AS6YDw55NjrcLPd82dDhzQ01cqm8IBN5OSK9EzybeKCriuRgVNFr2JruV4ikd4B3gQMaW4tgH7ZBqOXLqaLlb68W76ryVYEZ1NgpEaSyWDFiApTiv+Wh1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jdfJtWtKp/ntMIsu5ncZNiZR4VKS/1lOX/ZGY5Odlk=;
 b=ZvY601UNFUfG6hxhmz2SmqM4omWvIoZA0qyzUokx62XqHDOPKMFxQYiUkOCpBV2Zu8seFaBNaJlTT3F9xw2EUjEERruK+HCu49I5/ImvP5L2QB/1p7jlZ721Udpqq/SmBIwt9oo6h36yg2f+VlWJc6l+N2O0W2vdnn73muib3MSNT72/TiyIkFA3AfPmYrbutm08vhadpc5vGCid1QpHD/BvGGj1cPA+m4jDfJpG9fzO8etzNTvB3w9RLEZcmucl8iSFXRuBHeuaQpJynr+lSocvReUxKM67zMXDzaZDEpZozIclsLThN2OtKeLd8gzAvGz1RyyjtYmPBYJPKfpOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB3337.namprd11.prod.outlook.com
 (2603:10b6:5:a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Mon, 7 Mar
 2022 14:32:06 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 14:32:05 +0000
Message-ID: <2e2f65a1-9d29-e59d-b853-a6ad803da094@intel.com>
Date: Mon, 7 Mar 2022 15:31:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v3 17/17] ASoC: Intel: avs: Code loading over HDA
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Ranjani
 Sridharan" <ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-18-cezary.rojewski@intel.com>
 <2b75e00683d7f7c33ecdf78a9889748aeb50555a.camel@linux.intel.com>
 <9d8381af-aa03-743f-7ed6-93dfc18e5a54@intel.com>
 <c4901de1-9db4-d771-3218-d6dea3d38cbd@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <c4901de1-9db4-d771-3218-d6dea3d38cbd@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0083.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::24) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88390a01-d41b-4b6a-c810-08da00474029
X-MS-TrafficTypeDiagnostic: DM6PR11MB3337:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB33373B0199F8EA94DE0B2059E3089@DM6PR11MB3337.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBDunwNqU8t+LbqQWzb734AIvFuavOYHp/lpqNKSkxuIM9+HTFg+d8alPj6xsHCAtSx3FOWolSa8PmpN765aROOoGWYUQo7BbD3Vu/xER5hbyyc+b/Qdfywla8p6GqUh1vsLtXyiM9YrvXTU4HMIOyC94VU41F2roJA5eGp8XKoSiR1QvSXxMw55zFzW1vIOxFomW4gM1uepVtdM59EJKqmAP96uJn+dXcQLw+RJwNOOeO65uDO0KQjIw+dFiit4bpc6ybql+0NXPupEOUfv5d54NCkatJVTjU2b6aLOKi+bMjirk3WXQTPPlApO8v/V/n6iA8WJftlOQtcr1kfPyLUZv7ztSFoG5rKy9icqoxmV+B9191ZSWiVarDFxvwpk7urr2yB3q4zAxG/FVuYEGwrGDj7QMWPrXX/6Tj1Q7weUxE22/471VzcNiUcNDrE+zel1qlU+TXmQqQ9akD19dVTjqOkclLXe+LzXY32u+CXwNuOr0+d1vkPBmaZK+1eGaCF8qgnL+M7UoiilZxidTSkRI23BRnOmbOa0ej3d6Cn4pb/7D85uhs7lCzrTNawrRYMnotXk1r3fgviLE+SjQL2nK4vW0s7WPHuswlyKzV5o6pm6hchgx1uofdhbY0vEquQi0kNdMCM/te7Kq6SMqlQa4Ptgg+Tgnx1Tm1kx30YkLexFTzy1FOH5NOipLAJ2XYRag68ipmK24g78fmtKLGrR/SZtVIo1GXwC8ZXhLdROPfQqW9skG2cZYU22VPlZrEPY1xUr06T9cC4aG8vwE6RJTfbSjld1uzTqKFOJYWnnOF9PIvpPl/J5ipLAfETj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(2906002)(31696002)(66476007)(66556008)(6512007)(6506007)(5660300002)(8936002)(6666004)(83380400001)(86362001)(7416002)(53546011)(44832011)(8676002)(66946007)(4326008)(110136005)(82960400001)(36756003)(316002)(38100700002)(508600001)(966005)(6486002)(26005)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdBWkRPVDk0ZGpFSzdSb1djb1k4SDJzeVdYQnJJSWYrdXdydlR6emxjSnI4?=
 =?utf-8?B?ZTNlSlZma2FtWE4vYlBjQUwzenhOYjZxWDg5UnNPTTZHVW1KMGpMVUtJWFdj?=
 =?utf-8?B?WnJ6RDh6TjhJSENIZ0loQkhha2haclkvaUtTTzQzdzZaaGF2SjVZOUNXWGUv?=
 =?utf-8?B?UUlzbGJudWVIeWt6ZmxCN2p0WEJ6K1luQThVUHp4bno2SlRUa21YYUhSdzJu?=
 =?utf-8?B?MG8zNHlKNmpFdWtORWJGOE1CUVdCV1JNMmJwZmxRM3dpTTJLY3hmMXczczcv?=
 =?utf-8?B?bFRFWEVCR0IrMUQ1N0pldGNLd25uUzFnTWNHUFlEbG9MWm5qdjdTTjh3ejJj?=
 =?utf-8?B?WlZuSkJtTmQ5b1BVMHlBc3Z4S1BSZGhWN2RRY2p3amRkdVp4YUNTZ2ZPWnc4?=
 =?utf-8?B?MW5aUE9wM0FZQTJqT3NRVTRxNEp6bzRyRlUyYXhJS1ZWRTkzcXlMUUt1Nldy?=
 =?utf-8?B?VkVzMUlNeFlTSVF5Y1FYZ3Q3alZlcUVsQ3VOTkdYVzl5SHhYc3JldUtPZVVU?=
 =?utf-8?B?Ynd1V0hUbE1vZ3VUTXhOZDZIRWRTM042Q2dyaTJpQnEvVzEySGV6T3JCZFlt?=
 =?utf-8?B?SW1ZQ1ZvQ3ZOWVp3MldIQklNTVkyL011Tk5IUUFib1JBSzZES0NtaVBXUjBX?=
 =?utf-8?B?Y2lzU0RuWFZTbXZCYmlXcUJpNkM1Tk1ZK3VzQjc4Yytlbk5YMW5kTXZWbmsr?=
 =?utf-8?B?YmhsR2lBNCtLTmxjT0M5ZHo0c2dydjUwa3FZaUoyYzBHT0oyc1p4YUJvMTl0?=
 =?utf-8?B?NGlRMi9nNTNpQlFoZDRpdmJ3T3NqdWFmRGs2M3JZS2NJU205cjZNZlZqN0x1?=
 =?utf-8?B?MW92Vk82ak1YMU1nZlNCQnJ5Wjk0YWFNVmd3ZkZzTHBtK3ZEMGplYmJRdFNY?=
 =?utf-8?B?R094cDhjQWNSUHFwelZteWF5bTJXek83a25BczVGQ2I4eWE3RlJUa2haRDNE?=
 =?utf-8?B?M3J3cUwxVHk5dG56RE9QZTQ4S3F3OHBLbnpzRlZ2Sks5cjVUVDl6OXU2Z3lO?=
 =?utf-8?B?aVNEaFFhU2pUSnZWNXhwRTlqVEw2VDA1TUYwZ2E3QWhjRzhRM2l4SVFianYw?=
 =?utf-8?B?MjlpVkp5UEtNTW55dmxQTTdJbG9HS0lqVCt0Q1loM0pVaWZnVTJRdnVhdnNE?=
 =?utf-8?B?NTFyVno0OTgwL2JXbnBGOWtock81ek1tK3hjUjgzTjNxRWZjRURkdnZHUy9z?=
 =?utf-8?B?V2ZON05xZjZTeXVIMTMwTXoyU1IxTTdRZUxRSkM0L09xeGVDOGlwUE8xc1pM?=
 =?utf-8?B?TndnK2QzN3dnQUJQOE5JTEtEajY4TCtnZ3BYS2hMWUw2UUlWTEYrblVTaitV?=
 =?utf-8?B?YmpRdXF3bXB0anRqcXFNd0NBT0JxRUxGZTI3emFmTXFWS3VGNUtVWFF1cU4v?=
 =?utf-8?B?SStrR2JjV2lZVkJhaXFJRlZwNENiQXN0bFpEdzUxdWE1TXF3REpGUk5hcE5s?=
 =?utf-8?B?a2l1NnNJMkxBNmlnU0lzYndkWVRpdGd5TFZkWUI4c0FBQ1R0K1Zsdk9XSzlT?=
 =?utf-8?B?MncvWmxhOFRXSlIzVUdONmdqNmM3ZldFZ2MwYmVqMHN6YmFzOExhQVZaSXJv?=
 =?utf-8?B?K1d0SnJQeHpmOXpDeHlxSDVmc25XZEVzTzdUd2dNclh4bWxJSnpaM0lKazRy?=
 =?utf-8?B?MUNYaklkUnBORzdjTVdaeFovV2VzeEtoYmk3NGxBaVQrOXBQVk5TM25KdW1j?=
 =?utf-8?B?cDVQeW9vSk5nNXN5U2YrcW0yUWM2eTRodkovbUxnd1Z2cHZtZ29tcXZQRjkx?=
 =?utf-8?B?Wm1jaW0wbWI2VEEzcWx6SmZ0b1l0M0R3WGlNQkpNRVpMTFhCWmlILytHenF3?=
 =?utf-8?B?UE5YTklyQjRyK3A2L3RicUlpUzQvUnFkZm5xcWJQV25ibTFXMkh3OFZ2TGpL?=
 =?utf-8?B?NUx1TTlsSFVLNmpWd3YxMkw0bm9rK2Y2bGdQdHR1cGRzS05tK29WWVYvZlNa?=
 =?utf-8?B?cGpBeDRlTTNlWEt6V3k1M0NrMHU5SDVYOFh1dFNVU0RyNHhjaUdKT1ZEc2FD?=
 =?utf-8?B?RmZJbDhDUDBEbjJ2c1B5dDZTWjZzQWlZVEx1RzZGWG5ZTkN1SW1ZNnROMHVB?=
 =?utf-8?B?OXJPTnZQcDFnOEsvV1ZoMnhNM0R1a0U2SXJtakV3ZVNMZ3kxSjFTR0MvbkpL?=
 =?utf-8?B?TnJwb1diQ1RyamhWSSszVDl3SjVZZ1FsQ3VFZzhGT2JOZ2doT3FlalZTV3dM?=
 =?utf-8?B?d3Z2TjdJTmVONFdEQmdubkVydmo4dGRENUd0TGtDQjFIeVBRWm9KTjZLMEU5?=
 =?utf-8?Q?+oWrSLTxcGHc8VF67mJpl8KqYtLjDtX28/IfHdgdm8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88390a01-d41b-4b6a-c810-08da00474029
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:32:04.9410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/5SFM6qSIiLeIViXPbJVcsSnd0gKLFKtfdUzEpVwUBm8IGdDpi7rYCiBI/IKQv2rGwK7JGIGxrzD041mwdiBmfJ22xuGC4AfvkSbOLwwco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3337
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-03-04 7:56 PM, Pierre-Louis Bossart wrote:
> 
>>>> Compared to SKL and KBL, younger cAVS platforms are meant to re-use
>>>> one
>>> Younger? you mean newer?
>>
>>
>> Isn't the meaning of the two quite similar in this context?
> 
> younger doesn't sound quite right to me.
> 
> 'cAVS platforms more recent that SKL and KBL...'


Sure, can reword.

>>>> Module loading handler is dummy as library and module code became
>>>> inseparable in later firmware generations.
>>> replace dummy with "stub" maybe? lets use inclusive terms
>>
>>
>> Is 'dummy' categorized as non-inclusive? We have several usages of 
>> 'dummy' even within /sound (e.g. soc-utils.c).
> 
> Intel and plenty of other companies recommend a different wording. 
> mock-up, stub, placeholder, etc. see e.g.
> 
> https://developers.google.com/style/inclusive-documentation
> 
> Yes we have plenty of existing uses of 'dummy', but that doesn't mean we 
> should add new ones.


No problem with rewording this one in v4.

>>>> +static int
>>>> +avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool
>>>> purge)
>>>> +{
>>>> +    const struct avs_spec *const spec = adev->spec;
>>>> +    unsigned int corex_mask, reg;
>>>> +    int ret;
>>>> +
>>>> +    corex_mask = spec->core_init_mask & ~AVS_MAIN_CORE_MASK;
>>>> +
>>>> +    ret = avs_dsp_op(adev, power, spec->core_init_mask, true);
>>>> +    if (ret < 0)
>>>> +        goto err;
>>>> +
>>>> +    ret = avs_dsp_op(adev, reset, AVS_MAIN_CORE_MASK, false);
>>>> +    if (ret < 0)
>>>> +        goto err;
>>>> +
>>>> +    reinit_completion(&adev->fw_ready);
>>>> +    avs_dsp_op(adev, int_control, true);
>>>> +
>>>> +    /* set boot config */
>>>> +    ret = avs_ipc_set_boot_config(adev, dma_id, purge);
>>>> +    if (ret) {
>>>> +        ret = AVS_IPC_RET(ret);
>>>> +        goto err;
>>>> +    }
>>>> +
>>>> +    /* await ROM init */
>>>> +    ret = snd_hdac_adsp_readq_poll(adev, spec->rom_status, reg,
>>>> +                       (reg & 0xF) == AVS_ROM_INIT_DONE
>>>> ||
>>>> +                       (reg & 0xF) ==
>>>> APL_ROM_FW_ENTERED,
>>>> +                       AVS_ROM_INIT_POLLING_US,
>>>> APL_ROM_INIT_TIMEOUT_US);
>>>> +    if (ret < 0) {
>>>> +        dev_err(adev->dev, "rom init timeout: %d\n", ret);
>>>> +        goto err;
>>>> +    }
>>>> +
>>>> +    /* power down non-main cores */
>>>> +    if (corex_mask)
>>>> +        avs_dsp_op(adev, power, corex_mask, false);
>>> What if this fails?
>>
>>
>> We are still in happy path, worst thing could happen here is increased 
>> power consumption.
> 
> 'happy path'?

The question is whether we value user experience over error-checking 
this case. I've never seen this step failing and the step itself is 
quite.. extraordinary : ) It's also invoked on very limited number of 
cAVS platforms, for everything else it's just: 'return 0'.


Regards,
Czarek
