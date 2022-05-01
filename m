Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7B1516501
	for <lists+alsa-devel@lfdr.de>; Sun,  1 May 2022 17:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57391616;
	Sun,  1 May 2022 17:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57391616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651419246;
	bh=vuH1ULV1r+OY8v+RVO0UXmADCZqcZAfCrd+7xBsVSzE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfJboZmm8Pbj+LRz9E5bLxaI+9SVrAA47gGoZXx9PZv4CwXp8fgGMLrQTrQD1/7ct
	 bRGlBGrkXF1rqgf1Amh8b2vGWQ9zVczTIgI9eKhYF03X7ZHlowp/85YncDRMWIUBJL
	 0lMfM3zwu+P3apfPEPAInBjNAudZ5Q1hniuc8gW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 336E8F800E9;
	Sun,  1 May 2022 17:33:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DA8FF80137; Sun,  1 May 2022 17:33:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F5FAF80124
 for <alsa-devel@alsa-project.org>; Sun,  1 May 2022 17:32:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F5FAF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ImOLZcol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651419179; x=1682955179;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vuH1ULV1r+OY8v+RVO0UXmADCZqcZAfCrd+7xBsVSzE=;
 b=ImOLZcol7fgswDJDkiKxQgMfWtgTt6pppT8iyVmwI4ZLshuuJ3aEcUSV
 X9trPOFi4U/fHKzSRSZ3VVaG7sadg8gh6JNSOcGof3LwZFP7mOf3vkRrZ
 Va5UQn8/8MdivbCIBROqybgWoQnPDDaPrOCByvXKzxJ4BJFFdDLIUHyxg
 xQBJ4BnbuxKHSjAzQLehkq8AQuDVbqYuXES7ocCOotYOUbVhyZrP+9+ja
 Vga7xrRuxieShzUn44P7Yy4lSiNWvyTdmN52YUy/xUWfwKXzsG1ElLfrt
 O21C2FmygQ8Pub2Sk9MIgF4oY4zPiyG9zpfkAEeGLrG0ugjHxbLMOnG6r g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10334"; a="247577601"
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="247577601"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2022 08:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,190,1647327600"; d="scan'208";a="630769464"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 01 May 2022 08:32:52 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 08:32:52 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 1 May 2022 08:32:51 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 1 May 2022 08:32:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 1 May 2022 08:32:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ny+YXZvnYfaS48MV9iP70wkbPqKr9I5YBHC5n5bZsVEpVE6AY6I7WWqWld8S6oyTyFARbdATJKYLdWoAH70rVMAz/2lzf/WgC1rdDubWvT+DOCvGAClZncgAwGjVPl38G/PiWzCjQUviJN58mdbh62c7XHtFy5gETDOIdoJIUCfG4qr5olIuA3YNd2DA82vBTJxwEHU270TJ1DzEryHpKN7Cxx/KzxnOodTHiQNN0fsezHHTgDESNxYIoEBl/tYt2vH3sVFZPUoLHwYWefmfe4czE3YFrSsHGngUBQyVHsIKtPnUTZuGWHbr2dEaGYvTJ/2Hs2FOLVR98OpiwQ763g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cl0RmzB4JsLCPGfDO3j+xtIa1UeBUKx4V5cO+wMblt4=;
 b=ep0bs/vpSTFEZAMMP2a2A/tILF0hUr/R2FYsPwZpWZQt+rK8xrzBrg/Mv7s3TaTIFN+r7t9ie6pVoRqTmw0GFeAJrXMZRe5esuYALtbx1bf/5HkrTr/08BKiJGRAILeGNRCRKORyjVwWWk3eQW+0lri5dd+sYDca0dhzY+mev4t6sfVHwMyu2hsy21bnznz+MyAcfN670uMvfaDmAjcD5VEl1iDzeUV55CjUN38clqzyQkekkoH4qXk8BBBCm7yiGKVtGzyYCmlh/q1fJY7LzpennbcW9JOIcsL3GJizYW51JCBJy/yA+VGoS85ZSCUR97vyzpvV+1d+jpCiUXcGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB3946.namprd11.prod.outlook.com
 (2603:10b6:5:19d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sun, 1 May
 2022 15:32:50 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.028; Sun, 1 May 2022
 15:32:49 +0000
Message-ID: <f20f3d72-8f5a-1878-c1fa-49dafce784d7@intel.com>
Date: Sun, 1 May 2022 17:32:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 06/14] ASoC: Intel: avs: Coredump and recovery flow
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-7-cezary.rojewski@intel.com>
 <d80075c7-3658-52e0-b09f-35182961d5df@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d80075c7-3658-52e0-b09f-35182961d5df@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::18) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6969132-9baa-4c92-a46d-08da2b87d964
X-MS-TrafficTypeDiagnostic: DM6PR11MB3946:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB3946FEAAE556A7867D5966A7E3FE9@DM6PR11MB3946.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EuwtA0Vsd2YA/7KvEfR8qbDQVDYmwXYNn7lOUjWkjmxmIXiyUVycf6GPjBVe30GYUEs+OEZvr/sj/mFzNv1p47sT3QHUEAvTkOaSnF23Fp86J24/uENwLi72tYSEavUFFVZS2R6dQhWu4ipS1PAJF8eD4pVhS53D3yzsMf3FqvF5IVZNPTF4t1pBER/M3yt3d4iRh1G7j8Jtdt3lBjm970KE3hQlcItEjaZIf+qbaVlrGzeJjhzeHjnvF8YIib/EZmQibgiRdBCcQrcXbU6c/HPufY3vPu6sz88QOoUG6rPhSkOFHmE6U8u2RWrEHS9Mhsbj1jl+h70ESRs2ceCfiAyE/h7qvTOo/U1AAvUGsT542sq1vJs4J4Jq+hn4mEaPsDztSFffNW4CX5Qmde7v1dqijnbIX5nnngg1ddBVNoETwQVWqqBwHnD5xjMEH93KocU84fLyUbcCG90U8D8504JeFMn39DDFaG3v27ToObSqXGGnOso9uc7e6CzvuX0l+v1WEwcM28FCLjDkmc1s925Xtqpwmmu+0ckGEnb0c6FBIMhBFgh/aMNL/fkBj7JduG5OJeCGNBDfo6LCpX4IRqgMSAmEWDD0JgStW4EgEu6Y66fpeZVyYp8BnNoIlvTYyytnknxHLnPBuanFXyEPaBMm2eef6WclHbLXvtKhXt53DTLfwRcaZcuiNdJbqMXSQh6kdLzi6FI38AnDvM1VaKqAgykioYjoo+QWbR4rYBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(66946007)(66476007)(66556008)(7416002)(31696002)(8676002)(86362001)(4326008)(186003)(2616005)(316002)(66574015)(5660300002)(82960400001)(83380400001)(26005)(6512007)(6666004)(6506007)(36756003)(53546011)(38100700002)(508600001)(6486002)(8936002)(44832011)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDFHd1RhVWx2WkFiR0NJY29iMUhXZWhoN2JGYXRpZnRQR0hESk9HVG5LQkxn?=
 =?utf-8?B?WC9QOStld2NiWDFwYkIyZlliQzJST2JIUUpSeDl5SXJJS0RISEpxYXZnZnlE?=
 =?utf-8?B?RFljeXV2cmhoUDJpcHl3c0pCcHFoQ0RjbXZLQ3pGaHFONWg1Ym9Qc1c1NWFZ?=
 =?utf-8?B?cm9BQ0pTWSt5aXRUeFZDNUFUaDVXTUhGTEhOVEpZZmNGYjZMakVZWDNQak45?=
 =?utf-8?B?cXpyaWxzQ2lrYW9rMXFVZjBTV3VQOXNic3VuL3NWbkRVVVJTazdtQTJTKzZa?=
 =?utf-8?B?ci84ckpSTkZ5Tm55VHVSL1Nid1BVSGFiR1lXRWRiVzBNTG5aRXprMHhwZFpB?=
 =?utf-8?B?YUtvMks1SG8yQzMwU3B2ZkRJWkFleDFjYzhTSEFJM0d2TTlQMWpIdldEUVla?=
 =?utf-8?B?c0JNSXRXcHZKK1pTZmxhMTBQelExbEN1SFdtS1FqbThmWHNTUmh6c0tCemhz?=
 =?utf-8?B?VloydlVrZU9wZnpJcVdmaWZSOGhFeWIzalF2UDdYU3hKZmVWWDd1VG5heUU0?=
 =?utf-8?B?T0ZHOGRKN0FLQWVMQk12eG5DL05sZ2dSSHJsNTg1ajk4VmxyeFREN3FEZFU1?=
 =?utf-8?B?am1GMUp0aGpRYTRickU5b3RIZkhVRDJOU1dSeXJmUW1TRjBlT2IwWlQ2YXBo?=
 =?utf-8?B?UDBJL0ZmNy90bVRJaUFUWm81V28yQUxCeHNlOGdtMlpGZHYvU0g3MHdaVmZP?=
 =?utf-8?B?QUNKM1RaQUJKaUlTc0V5WG1VMGRRMG9KZStaWElrcDBsVElQTVl2WjZFRWhj?=
 =?utf-8?B?bDYwUnJUMnJtd3JUZjFaRDJIUGZuelN5UEVHMW44UVlFZnJadHlzUnoxY0pr?=
 =?utf-8?B?aXpySWt4MlJUZnNtR3MweTFEYkhxTzlMTTBYcE1nYnF3UVJQUmhpMnJqb2x1?=
 =?utf-8?B?WStFK2hPNWxNMGZWRitjN215QUVqVW1IbnArTDNYLzZxeEE2Y3NaUThMYnJZ?=
 =?utf-8?B?V3VCbzlkbkhqK1ZaK3V6cFVaTlVRMWZrdm9ENHBTQnhUU0x6V04yaktHV29F?=
 =?utf-8?B?dXJlTXZTcUg2NmVDaHJkSk5NTUh1OUFkbHdodFFOQ1ZuRmFYUGxIRm9iSDZO?=
 =?utf-8?B?VzRENzZTWkFFeldzeG9GS0ZCbzBzRlozRmdpUTRiZGhCWWtyYTJqYjNnNEx6?=
 =?utf-8?B?WmF2YnpNRzdGMU04TkpBMmxiQjJzRnBPdnF0QjJNOVlENU9iQ09VeThMZm5q?=
 =?utf-8?B?L201SkpYZFhWRE8xZkFrUEJUdG1JVHh5cnJ3YlZsMU1NNWVScVhFYnZZeDd6?=
 =?utf-8?B?M09xU2xUdEl4NFRsRkl6eCtoVXlqVlljSktScGRqdWk2SkgybHVDSkVPM09p?=
 =?utf-8?B?M1pDbkVIT2dXL3llRmdSanNSWTJoS2tJRXNPa2xsSjMwY1g5cE5kMFJIalo0?=
 =?utf-8?B?QzUyREFOMmFUOGNVVDIxY2dETTZGNlhOTVVWRFZUZzd6MmROQk1vV1FvTnVX?=
 =?utf-8?B?Vk9XUFk0eTZvL0tKcGdFV1VOY0puWi9zbkZDRUp2MXJjSDBQcDVFL3Rud3dt?=
 =?utf-8?B?SS92a3RDRHByZEw3Y2UzRnVVejJ4TzJHVkVTaHFvU3ZQakdxWGtETjAvcHVH?=
 =?utf-8?B?QWxOdE1yYVBtNndoc0d0Qy9xNXAxSFdhMFdZdlBwbDlGZUFwT01ZZytSTjRm?=
 =?utf-8?B?L1p3S3ZZUGpDUUVadm5vRFV2bXZXNEZ2SjJJWmlIRTZubUhJMlBkaDUySFVo?=
 =?utf-8?B?TTdCK2NZRVcxTWZ0dUJZbDVkVjBMSHJ4aWhnM1JiWitrVnhXUlg5Nnk0UXdM?=
 =?utf-8?B?YkhTdU96d2FSVGZJRWpQRTBCUDVqb1FEOWl1cUlmSjdDS3Uvcm8rZnllMEQ0?=
 =?utf-8?B?blZEYjc5Vmx4aGRxNkV3d0pFYk9pU2NBQmgwVFU0MVBNUFZyYkV1TzkyMDBO?=
 =?utf-8?B?Rmtoa2lrdElEcXpZa2pERC92cWg4Ujc3QmR2Y1BFNG5rK2J4K0pIUERsak1X?=
 =?utf-8?B?SnhBZlVhSENrb0h0eSs3N2EydHBUT0RybDNTNHg5SUJQRC9LaXVOOUEydzJC?=
 =?utf-8?B?K2EvNWx6OXJSaFo4RXk1RW1jTWozd1YrZEJCSXNQSjVJSXpRQUhVeDQrWVB3?=
 =?utf-8?B?RzBFWmhYZ1dwQXdSaTBmRHNFT2RzWjYzR2wzaWJidWFkc1hYWklwMFJ4akJv?=
 =?utf-8?B?RkNETlRaakMzb2tkOXRlUUNuSGhwU2J1d1ZueFNobndDRk5OYnlIYlo3bFVs?=
 =?utf-8?B?cXo1dHhzcEMrS1phUUxDc2k5WUdsVXZpWm1SR3g1WUkrdzhkNjlqZkRUNEFt?=
 =?utf-8?B?bnNEZ082Qk5relY1Wk9SaGlyOXI2dDdYWmJWd0E5dk44T205MlFGRVcyQ0JJ?=
 =?utf-8?B?c1RhZ2tNTWZqYXFQNUFkd3V1Rm05Mi9KeEROVjZpempQY1JEeXpKVHhCWW5m?=
 =?utf-8?Q?xrn6le9G39fdDvys=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6969132-9baa-4c92-a46d-08da2b87d964
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2022 15:32:49.7458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaIgXKsrHZ9XUPG3XW2cnbIJJeklDVZSe9JQfdBZeQ4rJh9vM02c0+EU1vG89RsHu4jD9X/uqnQy3YUapEcbGfjryxOBVuKN1cAaXF/tLQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3946
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

On 2022-04-26 11:53 PM, Pierre-Louis Bossart wrote:
> On 4/26/22 12:23, Cezary Rojewski wrote:
>> In rare occassions, under stress conditions or hardware malfunction, DSP
> 
> occasions


Ack.

>> firmware may fail. Software is notified about such situation with
>> EXCEPTION_CAUGHT notification. IPC timeout is also counted as critical
>> device failure. More often than not, driver can recover from such
>> situations by performing full reset: killing and restarting ADSP.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/Kconfig        |  1 +
>>   sound/soc/intel/avs/avs.h      |  4 ++
>>   sound/soc/intel/avs/ipc.c      | 95 +++++++++++++++++++++++++++++++++-
>>   sound/soc/intel/avs/messages.h |  5 ++
>>   4 files changed, 103 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
>> index c364ddf22267..05ad6bdecfc5 100644
>> --- a/sound/soc/intel/Kconfig
>> +++ b/sound/soc/intel/Kconfig
>> @@ -218,6 +218,7 @@ config SND_SOC_INTEL_AVS
>>   	select SND_HDA_EXT_CORE
>>   	select SND_HDA_DSP_LOADER
>>   	select SND_INTEL_NHLT
>> +	select WANT_DEV_COREDUMP
>>   	help
>>   	  Enable support for Intel(R) cAVS 1.5 platforms with DSP
>>   	  capabilities. This includes Skylake, Kabylake, Amberlake and
>> diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
>> index e628f78d1864..02c2aa1bcd5c 100644
>> --- a/sound/soc/intel/avs/avs.h
>> +++ b/sound/soc/intel/avs/avs.h
>> @@ -42,6 +42,7 @@ struct avs_dsp_ops {
>>   	int (* const load_basefw)(struct avs_dev *, struct firmware *);
>>   	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
>>   	int (* const transfer_mods)(struct avs_dev *, bool, struct avs_module_entry *, u32);
>> +	int (* const coredump)(struct avs_dev *, union avs_notify_msg *);
>>   };
>>   
>>   #define avs_dsp_op(adev, op, ...) \
>> @@ -164,12 +165,15 @@ struct avs_ipc {
>>   	struct avs_ipc_msg rx;
>>   	u32 default_timeout_ms;
>>   	bool ready;
>> +	bool recovering;
>>   
>>   	bool rx_completed;
>>   	spinlock_t rx_lock;
>>   	struct mutex msg_mutex;
>>   	struct completion done_completion;
>>   	struct completion busy_completion;
>> +
>> +	struct work_struct recovery_work;
>>   };
>>   
>>   #define AVS_EIPC	EREMOTEIO
>> diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
>> index 68aaf01edbf2..84cb411c82fa 100644
>> --- a/sound/soc/intel/avs/ipc.c
>> +++ b/sound/soc/intel/avs/ipc.c
>> @@ -14,6 +14,87 @@
>>   
>>   #define AVS_IPC_TIMEOUT_MS	300
>>   
>> +static void avs_dsp_recovery(struct avs_dev *adev)
>> +{
>> +	struct avs_soc_component *acomp;
>> +	unsigned int core_mask;
>> +	int ret;
>> +
>> +	if (adev->ipc->recovering)
>> +		return;
>> +	adev->ipc->recovering = true;
> 
> don't you need some sort of lock to test/clear this flag?

Our stress tests do not confirm this. I'll not ignore this warning 
though, will recheck with my team next week.

>> +
>> +	mutex_lock(&adev->comp_list_mutex);
>> +	/* disconnect all running streams */
>> +	list_for_each_entry(acomp, &adev->comp_list, node) {
>> +		struct snd_soc_pcm_runtime *rtd;
>> +		struct snd_soc_card *card;
>> +
>> +		card = acomp->base.card;
>> +		if (!card)
>> +			continue;
>> +
>> +		for_each_card_rtds(card, rtd) {
>> +			struct snd_pcm *pcm;
>> +			int dir;
>> +
>> +			pcm = rtd->pcm;
>> +			if (!pcm || rtd->dai_link->no_pcm)
>> +				continue;
>> +
>> +			for_each_pcm_streams(dir) {
>> +				struct snd_pcm_substream *substream;
>> +
>> +				substream = pcm->streams[dir].substream;
>> +				if (!substream || !substream->runtime)
>> +					continue;
>> +
>> +				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
>> +			}
>> +		}
>> +	}
>> +	mutex_unlock(&adev->comp_list_mutex);
>> +
>> +	/* forcibly shutdown all cores */
>> +	core_mask = GENMASK(adev->hw_cfg.dsp_cores - 1, 0);
>> +	avs_dsp_core_disable(adev, core_mask);
>> +
>> +	/* attempt dsp reboot */
>> +	ret = avs_dsp_boot_firmware(adev, true);
>> +	if (ret < 0)
>> +		dev_err(adev->dev, "dsp reboot failed: %d\n", ret);
>> +
>> +	pm_runtime_mark_last_busy(adev->dev);
>> +	pm_runtime_enable(adev->dev);
>> +	pm_request_autosuspend(adev->dev);
> 
> there are zero users of this routine in the entire sound/ tree, can you clarify why this is needed or what you are trying to do?


Unsure which routine you question here. I'll assume it's 
pm_request_autosuspend().

pm_request_audiosuspend() is being used to queue suspend once recovery 
completes. Recovery takes time and during that time all communication 
attempts with DSP will yield -EPERM. PM is also blocked for the device 
with pm_runtime_disable(), performed before scheduling the recovery 
work. Once recovery completes we do not just unblock the PM as that 
would cause immediate suspend. Instead, we "refresh" the *last busy* 
status and queue the suspend operation.

>> +
>> +	adev->ipc->recovering = false;
>> +}
