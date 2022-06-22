Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC78555340
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 20:27:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECBEB1B1B;
	Wed, 22 Jun 2022 20:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECBEB1B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655922456;
	bh=5mkf/ZIKYMdO/LI/Z2iN7ndS43YOlXEaB6qSEMw8+9o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FtGFENjP03jigZ6h2Pfiv1gQe4pl5WUYtkJn8qzjB9goMHnbrDKNAEUSmRxv7Zpll
	 fpLcZS9bpzvi7KmfNEwlm3oHKL7a395DgSLP5llfbV5/9lLlSwgBmm31tJiRLnl/i9
	 q7NiYHwSzDa63RIWz8v7MEUmzCdzjJsAn5mLo7s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53573F8032D;
	Wed, 22 Jun 2022 20:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25CF1F802D2; Wed, 22 Jun 2022 20:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FB05F800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 20:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB05F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J69Pmxom"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655922391; x=1687458391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5mkf/ZIKYMdO/LI/Z2iN7ndS43YOlXEaB6qSEMw8+9o=;
 b=J69PmxomcI4m8euEx/3uypEepJma3Py0Y2yc6RTepsdMf134d0DHEC+G
 BfMhPj/X56EeCEuAgWN3JsAq0IkLR+xdKAJu9KtAr6lttsq5fNZGtr1OC
 rNQVC2xfjBtHxqN4PZZXDYvDoVbCRanfj/gU6UlK/e7t50sPZNi1ypPkb
 rxXMOEVRMC7CbYhaxb0jLKbu0JA1rgBNE4DZRTrmst+654FsPkYmrZ1+b
 rUFDlpN9OwwQ4FU16SdUrsnJr2UikRsBuol3l6ZOeCVFHEVIrWmaNGBUk
 0MVz7cZdraOetwF6peOhU+ZMRFKN4HBCbwXnm11wn5OvdseAD8R9n1K04 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="263539287"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="263539287"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 11:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="914802771"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2022 11:15:59 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 11:15:59 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 11:15:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 22 Jun 2022 11:15:58 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 22 Jun 2022 11:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X778C/bCyYiguPBFs1muwMK+584+ocfEaHhjlAVQi8AOaSAHgOCVkWdCjLespBqINN4qOp44ujV8A26nI2KP5nYijRENVAXgdsHxJIBEkLOV6+3s/Hm4qvlhge4//sm1ows+Dfhk8LV+jZVLqM9qUs2/8L88wo0LQj3F3HZjk7am3oJDvFLv6tUJmN3OXBYjG5JPwdqpeqY3I1S4+9PuBFaxRrV4OJe1Ad+TdUrnDVYrPOHsGNmHQ5N1dX8r/xrkbiQYXC3hlDHjSMkDocK1EEh/WPakokyMNl4xpnRolK7ho7ij07WsVLhPuRbDUbyxW+dfy1Pc4xKAZD0AOeiOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW+y1/edcrrmIFVzpyka855ReZ946j+FFSA7rxiIxDs=;
 b=aqS5cIuXT3lHHUBa4n6hzCqOcJfaN/Av356j4AirNh9m5LKKJV4AoX7bOE2Aasy7KWDc7ilK97uJfKPXXE3kfKYFat4H+wamXDg9zPqLnHtcXpZmL+xuri9M0tNzWama7rnhD/AWKxjfkFD5TYtnjO/Y3cZqfnDeHqQYAMP1tdR1P5dAnuW4bZelNEerzp1p7/Dox8l8ZkEZygd5UwXYKXx1H746onTOCxTgBN3Yx4eFSFXE/dKhcwod7XHtAMHrlMyf0/XAa+wGj3U3Y3PIOa35hMwLAkZgYqVoWR4aB+wQrKKVHWsxQocDtXxIE3eynVEUVTUAbTINqyi29bTN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY5PR11MB6210.namprd11.prod.outlook.com (2603:10b6:930:26::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.16; Wed, 22 Jun 2022 18:15:52 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%6]) with mapi id 15.20.5353.016; Wed, 22 Jun 2022
 18:15:52 +0000
Message-ID: <58f3ae25-59c3-6432-2c7a-ca11b5f37492@intel.com>
Date: Wed, 22 Jun 2022 20:15:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v4 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
 <95a7a219-8330-628f-aa10-28a078217de7@linux.intel.com>
 <2ed532a4-a232-eb14-7122-e5b08cb79bb3@intel.com>
 <11ef5841-6c33-4647-7309-ba94da6308aa@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <11ef5841-6c33-4647-7309-ba94da6308aa@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::17) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64a46fc2-9875-4f1b-1a6a-08da547b3dad
X-MS-TrafficTypeDiagnostic: CY5PR11MB6210:EE_
X-Microsoft-Antispam-PRVS: <CY5PR11MB6210B75D7095D7D198D80E77E3B29@CY5PR11MB6210.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLcO5BTR7Xfjni1QGfatk+2QNBTbKqFXBFKkpTVPto9uOidbsPK9I7w2L16FSFXQ42vx9yDsoNdOUrjvfvB1AAgKqz0lMPdPEFIneSuptxJLXafVWkpztq5ojFNYNS8Fa8KotVc9L7426shjpYGSfwatuyq1c9PqN/bwDcTh1imNz41b5pYMeL6/u/gnpaMPErxPuzOY84Dln1qFN6ibpd5zuCqKhPloPQIW/WoO54s0memeaQB1DdgvbqQMUe90X/xc91QKgFwzeFQxUo6fcC0sX9w9xv79EAAYXAAx5jipONcK5tso17+HMlHsEZ2ZW/UzySnEJmgBjCLKUyKU6a823QDg5jDZcET/2OEdDKRgElwTPql/FZsv4uHPR+7v4LRW35ki2uyK0+BSQCsk49B/FMnpHpCtE/DXhrAZm4EdvKyiHQXB0IMTwf//WOCS7j4ZRYfuszhjzUEJvoqEIMEx24TXKt3guXLubt7DZF350swZ3nyshqmjrzJT6tEhydmDm55lEqzgj1LtzVYC1p6HfOu6q9iwwP80teGFjOj+orYYEsgM8xcNDv8ynlRE/luowsT9xT43WhZtAJ3wI6/nwxJdmY8aal9/KRmDQ8WT2Ej3qIZ/ckaNRTJKpl2HG5BAaGJzLKXgcqBKrPE2pjrc6KclKVNK+Fzkn4Tb9FUgbPbivS/qZf5wGiAnTglxjoGgL5+xZbXjavwKhcOj20DTlwK+zsv7OLCM8V5wL8Fa1cHTOMkBS9MBUiEttMfS2biT3A1R0CQUJOFY5huCeCE0qRNO5uHflpEvNRtTPk+iTN/h2ToGwkq80xXzT22nOgHMLeqx5zt4IbQTM01onfyIJP0XLQxGPqV7S02sEwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(346002)(376002)(366004)(136003)(82960400001)(2616005)(478600001)(66946007)(5660300002)(31696002)(6506007)(8936002)(53546011)(86362001)(41300700001)(186003)(6512007)(83380400001)(36756003)(15650500001)(44832011)(316002)(66476007)(4326008)(31686004)(26005)(66556008)(6486002)(38100700002)(966005)(6666004)(8676002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUVUWXM2SHNzT1plWnROUTJLZnVaQndXbFpiMUY3Qzd3S0JBWWxSTmc0Sytu?=
 =?utf-8?B?TUlzOGoycXVBUk4yYy9rNXI2Z21raENuQ0FrL0lDWnVXdlozNENIbkNYbXpV?=
 =?utf-8?B?K0NVaGRKSk0zaUNUamk4b3hGdGhDZWtGVk9DczBpU3dUZVh4QVNub0lZRGRt?=
 =?utf-8?B?OGxsMmc3Z3VhOGUvckdBTFIzQkhudHpSK2VuaE12UW5FRTd1bUpnaUV5Slls?=
 =?utf-8?B?QzBCNVErUEp5REFPMkxIeURsMGIxUjBubzJuZW8rL0FLQjlrU0VwZzNDRHZZ?=
 =?utf-8?B?RnQ0NUJOT2hicGhiaS92QnlGZFJ6bmU2MGwwNDlMTkJSb1NkNTRaOXgrekdN?=
 =?utf-8?B?bVdPcE9uSGRIcmxqeUZPS3duRFU0dlJWY2lmVWtERHMrK2NaMkFkaXBnVng0?=
 =?utf-8?B?bmxOVUk1NWRwOENjRXhPUzlNYlpubW9kM2dzSlhxOEJ2Y1ZNRlJ5TS9vOHVT?=
 =?utf-8?B?OS8vVGw1RkFSN2R4N2lqZ0wreHhHUFNScTF5MDFsdkRnSVV0elRtTFdEUi9W?=
 =?utf-8?B?VXMrdnZJUVN1NkpURDloSy9oTHRhK0pjcHM2bTU4NXhvcEZDMlc3aVcxQ0hQ?=
 =?utf-8?B?R3lyWmhOSzQ2RjA4M1A1RW1XUFVxeHRuMkVFVkNHQjcvbjFOMUtvYm8xVXNE?=
 =?utf-8?B?NVJFK3ZjMEVCVTVUQUFhaHlkV3djb0x5N1pSeVRsdC9vc1MvbEFzWTI4S0dl?=
 =?utf-8?B?NUIyL1h6K2NCZjVIMEtSMzJBMVhPU3hERTdvSnNDMXBlZmhrNUN2d2VzbGFQ?=
 =?utf-8?B?M2Y2Y0VvNDgyYUllMjJQcitaNmV5eUFNVkxWMjhRM2RRYVJ6di83WjJIZUJw?=
 =?utf-8?B?dkVHaHY4VWlnNE41OVZXWEJWcHVqWE83bThDSGMyaVJqbDdRWHRwWUFpamhn?=
 =?utf-8?B?eE91TVg3TVV5SXQwcWFFSC94VlVkdGtGbjhwUkE5REQrV3Z3a0JxbW8vdmJH?=
 =?utf-8?B?dktBRG9TVzluWVpYUnhYVW80RldJQ1o4U2U0NE9pbGQrTTlBZ2g2Q2RTRXBC?=
 =?utf-8?B?QXBzaDVnYWozLzFKek5nWXNLM3lObmlhcWxuSWNVc001Z1ZsOFI5WVNWbkYw?=
 =?utf-8?B?RmI3VHNzOW1nWHppOTNTSlBZOWs1V0xPSTFITDE4RFg0UTFMMTNkWC9kUnZV?=
 =?utf-8?B?Um0yblpZVHJFNG1qdkRTcEFzamZPOGcrQ3RBUWNSN2czSFNDclJQN0tUbHdQ?=
 =?utf-8?B?Yjd6TU9ZSjk0OWszNEkzby9ENmlRUTdtSEhlck1jT3pSVk8yMmNEWmlFQjVY?=
 =?utf-8?B?eTFSVjI5bnlFWHJ4TnlEejQwaGIyWVdiZnVHbndiV0ZoSUdpdlZpbExqZHpl?=
 =?utf-8?B?ZVNPU05zK0hRcWNqV3lYcy9ENDVkTGVYbm9zanhOZDYvZmVJTFI5U2RCMC9n?=
 =?utf-8?B?bW9RS3lHbVNYZjIvQUdBdDFHVWd1UU00QVJLaEZQbTNadnp4Q282Wm52YjFJ?=
 =?utf-8?B?dWR4MXIwR0VsUGl6eWVmMVFBQmtJQWJ2b01hNFdjdXI3bDlqd2pxK1hJM2VU?=
 =?utf-8?B?ZnU5dnh3dlltT0FsUjVBMDJQVm10K1RjRXVOWjIwUFRqcUkxMDBPaEpEZkFC?=
 =?utf-8?B?WlVnbk1mVXVQWnZpMjhlQ2ljK3M1N1pYYmhEZDdvZ3dNMlQxVFZvazIzd2Zs?=
 =?utf-8?B?TllLYXI3T2ZNa3BzNFZCZzJnZW5rV1h0WU1DYlJ1VVRMN3hGd3R5eFQraFg0?=
 =?utf-8?B?OXZ3UHFJRnZ4RFFrUFlzKzFzSC9xTHVzZVZrK3NqOEJMcmk1UXB5bXJSVUZm?=
 =?utf-8?B?U1NwQ3pFU2c4c01oa25WK2JxeVlSVEV0WGM1cFBKb0YyK2JrUnU1VnVqaVIz?=
 =?utf-8?B?ak1Ra1FpTU9ydWtFc2FFNGVLazB3UnpOWjdvQ3hWYS9YK1Vic0VuRyt4a1cx?=
 =?utf-8?B?MmRZcTdtUEtzNWRlVFpQN2hjRzBsY0MzOExueU01aWw2NG5ZNjgrbGtFVTN0?=
 =?utf-8?B?azFhN1E1b2dMQzVRNWk1VXo4cjQremJaQUphck1NSG56SnYyd1BvamFzUkFP?=
 =?utf-8?B?UTF0T2RIbmpva1FmYUZPcFA0NWwyOCtUMjBVS0p1anpkOXVTOVhqR2ptWWNF?=
 =?utf-8?B?VVZmRkJtK0h2YlNQUmtKQlFqamNSekVWdlQvREFkdjBld1RoakNaMUpjTEh0?=
 =?utf-8?B?UDNVaHpzUm9FeC8wbXBoRFRsVkhnNURvdkRyTEhMdXFvSjExbk5yOTh2RVQz?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a46fc2-9875-4f1b-1a6a-08da547b3dad
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 18:15:52.0074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgYJC0yOydewb/8oIBWQHT2LCutVWT2iGYa3tRMve+EQn58T0Q6MZFG9fjHY+xPzyQA1+FoIlEWtuNkBDkN2DfWIDrx4OPZDcBmgts7P9yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6210
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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

On 2022-06-21 11:11 PM, Pierre-Louis Bossart wrote:
> On 6/21/22 12:47, Cezary Rojewski wrote:

>> Hello,
>>
>> Thanks for the report! However, this has been reported earlier during
>> the v2 review [1]. This is also why a fix have been provided [2] earlier
>> today. Notice that shape of link->exit() found here is shared by other
>> Intel boards e.g.: SOF ones. In general, the initial discussion
>> regarding card->remove() revealed some 'probe vs remove' problems within
>> the framework.
>>
>>
>> [1]:
>> https://lore.kernel.org/alsa-devel/69e4263a-e036-cb21-2360-55b06600911e@intel.com/
>>
>> [2]:
>> https://lore.kernel.org/alsa-devel/1cff4ac0-6d45-95e1-ed9f-6abaded3f8b7@intel.com/T/#t
> 
> It's rather difficult to follow these changes and error reports buried
> in email report sent on a Sunday of a three-day week-end for me.
> I also had additional errors not reported,
> 
> [   36.125113] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin HV
> [   36.125128] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin VREF
> [   36.125130] kernel: rt286 i2c-INT343A:00: ASoC: unknown pin LDO1
> [   36.125921] kernel: rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1
> 
> it's unclear to me why a dailink change in a machine driver would cause
> such codec-side issues.
> 
> If the changes in this 17-patch series need to be tied to a framework
> fix, you have to make the dependencies explicit and better yet provide a
> self-contained patch series that does not introduce a temporary
> regression, or introduce the framework change first and clearly describe
> the dependency in a longer Broadwell-specific patchset. This is an 8-yr
> old device, it shouldn't be that hard.


The last part is not helpful in solving the problem.

This reply comments 00/17 whereas in fact you are speaking solely about 
16/17. Because of that I'm suggesting: leave that patch (the 16/17 one) 
out when merging. It will be send later once link->exit() issue is dealt 
with. All other patches are independent of either of changes.

Simultaneously the link->exit() fix, which is the fruit of this 
discussion, is still valid and can be send as standalone patch - what is 
already the case [1].


[1]: 
https://lore.kernel.org/alsa-devel/20220621115758.3154933-1-cezary.rojewski@intel.com/


Regards,
Czarek
