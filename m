Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF4F4D8B40
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 19:02:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E81D176C;
	Mon, 14 Mar 2022 19:01:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E81D176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647280920;
	bh=tP/CJDwI4EsfKnLNNE85NG2pKjN6jGLeDeGJ67ZKcuk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6EPvS9Gukue5LkIQa5hs1QSijiHER8/uB+13G1gm9c8ztwP5vpQv0d2+sitktawO
	 /IZHLn25PykpThVuCcnVXNUffx+uF6PL0C7diX+RdGVUW6yTiacPg+XtlPLXyP2Ssy
	 ne1o+9Zm2bUEqJpgBU4lCeU9EOdPCpVaPCT+B+2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECFC1F80095;
	Mon, 14 Mar 2022 19:01:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97407F80515; Mon, 14 Mar 2022 19:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 610ABF80510
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 19:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 610ABF80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SzYvV6BM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647280861; x=1678816861;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tP/CJDwI4EsfKnLNNE85NG2pKjN6jGLeDeGJ67ZKcuk=;
 b=SzYvV6BMo/nKa+aJCm+DLxMxmUz7x3EEWPss7az4p7UlS3zJSObCP8y+
 SDAtrtCQnh5uFtFzePOC9S9nOGe/wdOv+z5OKVp+DMfaDp2HlzaoLsg+H
 NhAxia20iIekcLhzFrVhMiAyk+y9Ue4bLorwLObBT+Bvs8JPQvVXJ7JD4
 h0u+gxOHj5+E3Bh+wwGhYUUXRF8qzSmL2f7p7KsXdoVL032OKrM+WC7vR
 jXFCuBxq1tBQozoKQDkkAjJqEyGj2a+E6WQq6sw6WnhVB2V5HTTmGt/2M
 QjZLtpQ3roPFAeXQ6uoHWG6Bgqcn/lDw2e+0jYMJo98IZOs4dlSDpJRiV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="238272020"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="238272020"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 11:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="689910973"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2022 11:00:41 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 11:00:40 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 14 Mar 2022 11:00:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 14 Mar 2022 11:00:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 14 Mar 2022 11:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIiesk0Y+iPoDdatfG9bX29UDqgj93w9vuSUsFM3LyIe7TnFdUfKU0fyciG5nPKDqWHvUWGQUNpxX/J5uUtXKiBTiR1fAw6Dr69phK4zvSqi6FtBhrjcSMKoXZgeWRxU2ab0PymekyVH1R2sP7ROhOQ3hNLA6bnWylOmaLLCr2obHmlEnSCulFdG43jbgC71IRYveYaCYfZJrToe+uuN48CCz7jNmOL5rMpNbATji5pMm7X9E2zLj2qoPFqzlHMmV0v1ZtP3LVL3EcPEc6GfhHfUXck3oWMy7j1Wd5R259RBHwUwyq1lK/XWoLwr41Y7tF866Rz9UduAza5dyPcysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8fhVORwVg0actSRRp69n4oHDbzvsBPjENHYBhd+EGg=;
 b=nY5nmkracs/NafLYLX2sZwg4o6KMpp1/gumUAmxFj+pUj4zRYv1J+npUx0V03Q5NAVA94EP956scIZkDrFS1176FYsiZ/N6IxnbsA4+32UgEwchnXaWxPAkV19gqWXXb05tRHia+WtWhMGl4F5bG6xqHkjHnI9PVuvFTj2X2i177IWRzh9MVbT2QHid02SsNkLqoF2ISNMQQKeZ5J0UzO4aba2dxgHVQDTn8FNwM9BP9HED7HRmVCHBvkEjtPUeIrqZB39bg7rL21mYhOuXK2va0agsvPX0QoyKz3ed1xhO3Rqp4vSimP5bWolLnWmIOrTybJTNsxEWU6+baeI3wfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1818.namprd11.prod.outlook.com
 (2603:10b6:3:114::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Mon, 14 Mar
 2022 18:00:37 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 18:00:37 +0000
Message-ID: <42c1a74c-3439-8bb6-c274-1546b50260bc@intel.com>
Date: Mon, 14 Mar 2022 19:00:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v5 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
 <YiuwB43XHnAYEfmo@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YiuwB43XHnAYEfmo@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0397.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::25) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1785c06d-d137-4374-a9c1-08da05e48b4b
X-MS-TrafficTypeDiagnostic: DM5PR11MB1818:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1818173D751868601CA8F80DE30F9@DM5PR11MB1818.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: URtEw8rR5BjqKB5saB4ygT5x4c3rDWrlbT5y59XDooXhP1ooFtWbgJ37ZrbkeN11do7w5a7pLSOkxtfUZxMEMDus9/pEGEic/FajdDN3llAYGA+L8GJFRqUXFArnvNCAZNMGFm12P4BC3TzVwB5KbM2+xShYIY67NgJk7OxzOp8faYnfPFzQ7GdTg3OOVK7GL/WAY/t1NA1VgrNVzdHuCrNQgUkKz+ItpSZ42eAaFCjwxPWWEQsgI7XQQp7nRq+fTYyPRkjAYN9fNp3/6xbQL1hzlg8xVikfhrjAjZBYSVvdXUX8IYnUjLCgiQKIIqoFWuf/ZrMhH4+U34io3TH2DTB3ymniOe9r3785yqLcfCz0BPRSCYVFICeoUEkzAETwP9cJqmkMMVCB/vE0wkTRvmOlAgv00a0B8uw4KMmqFc3948eGhjnqvuw5YjoUcQ3YXIulpo6YEOPLyNV6+4jZ2CXiVkuEakhRKfDnWoLgPvrH0KI+dZrWiNTL5/966qsHyYjSG11l5sI0FBydEgdsxtN33rHHJ2QeMXxwPi5L+Jv4ndj1lZJrszFy4na7Rg7JZ1id3TA8aIKhav+zxCzhFAVMbooom2IU2yl2oLhxdlPRKdpJs7t8aoMAcScFEXIF6An8Vnfd+rs6SrPKncvYFBLR6aYWRlUm4TutZiLWpDHtw4hVmyuuhy0tRDfHWItq/xYY2eQZnh6ypLh3yXtXP5UTIYxu5X/rCc9e5bskSKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(8676002)(66556008)(66476007)(4326008)(82960400001)(38100700002)(66946007)(53546011)(8936002)(6666004)(6486002)(6916009)(508600001)(86362001)(6506007)(316002)(5660300002)(31696002)(31686004)(6512007)(2616005)(36756003)(7416002)(44832011)(4744005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0diZ2FJN1hnTTlCOGI0TTZpdlAxZDZGRGxITGV6dkEzTTZxTEtZMWQ1anZi?=
 =?utf-8?B?bFpoVTRNUytoYWowY2pBQlFYRE9tMldIR3lmSFZhai9YRnhlZEloLzROTEhw?=
 =?utf-8?B?MzlWRWo3bzgxNjlvRkUyTlBsWTZzUlJEamRsSVZwWjlVdElIY2pBRVBLSmt6?=
 =?utf-8?B?UC85Y1dWNGpmamNGMVovMWFZS1FhRE1Yai9Gc1NOMmF4NnVYaEVmSkgxSkFS?=
 =?utf-8?B?aE9pR3Y4THNrSHFlV3RzR2M5WGQ5OHVuMzZKbmNFWWl3K25kR1ZMbVdjMnlo?=
 =?utf-8?B?Tlp6OGtUaVd6bGdOYlRkMEprYW0vNmRmbExWekt3NHMxOWNOZVA3VGpESTVE?=
 =?utf-8?B?M1hNalA4OFZRRU9Ccmp2TlV2UTExVHJsdlljVmZkZ3BtekJ2RWhDMVVpWmZY?=
 =?utf-8?B?TTc3MUVTMUFqZlVCbDJDTEdCQ0hHVklHS3FDWTVrZ0kwbGEva3k5WWduaUhj?=
 =?utf-8?B?Q1duMW0zcE5ZZjlveWxMSXA0UVQ0a2tjRDBOdkpLSzBOcFF4QXBjVjZIdzdK?=
 =?utf-8?B?TVgrcnlmMkRDR2o3Qm8yaWhOeGYzYnE4TmZiTGVNdTdtNjdrd0VueGJxUzNv?=
 =?utf-8?B?VjRNVkNsc1JiYzBmMTF5WXY5eWYxZTBtb1ZPOExKRDZRY0k0R21LenNlSnk2?=
 =?utf-8?B?cDQ2Z1krK3Myb1RsWEtUQlVJMzVRalhWZHZBa3gybXlBWk5uRU00aTNxeW14?=
 =?utf-8?B?Zkg1RDJMQXh6eXV0YVA2NnN3M0tqNzVFVU1IbDU1Y1BvaGdkMjYxUFVLejFp?=
 =?utf-8?B?aS83SkdrbnE4TFlHVlJnY3FhQ0RSR3FoYmkzK2N3ZERjelNmazVXdHZkWXUr?=
 =?utf-8?B?WVZ0d2ZKQnQ2dHBPV1hHdlZJTmgxOHJITDRwRzBuSWVKZXJEbHBGSFEzUjRK?=
 =?utf-8?B?OW5uR09tSkhDYkR3dUZSTU9RcUNXNWdNRzA2V2hMNStEYjYyeDVLeXpFTWhv?=
 =?utf-8?B?cVRDM0dPeG8wc1ZwcnRXWlFkMStxMmk5UzNYVG5TM0kydllhU1lMV2NmQ0JB?=
 =?utf-8?B?c2xjSXQ5dDZ3MDJMOFZyckJJQitXb3d1SldiL0JyM1pyOW5weGY5VXlaaXhv?=
 =?utf-8?B?UFlaeEZzcmNVcmpIVGxGRFEzdldIMXpKNmVTamlFK1JNZGE1R29nYWZSRUUz?=
 =?utf-8?B?VkdhNDZSN3h1U3pPdU5LNHNETVB4a09OY0ZxYzhVMzB4a3ZTVEw4eVZxQ3JE?=
 =?utf-8?B?MDA4MEZ2UVk2ZUhwRkVmNXdOKzVzZ3VGS3R5S2U4K3dEdUdoT0JyZ2twODNT?=
 =?utf-8?B?RGpLV01UeVYrYzdNU1VnMEw1b3FUcjk5cUZnTk1hbnJBTVYwbEphVW00aG9i?=
 =?utf-8?B?bEk1NFFVVXVjSE5ySXlhRzEzSmJ3R2NyRmpRdThwVDhPRjNremlMLzE5VDBt?=
 =?utf-8?B?eHVsb1RiMVl5cVJGcDV5OW5TenBvQVpSWGZTcnBNZFFmMjh6TUI4MzBVS3Rx?=
 =?utf-8?B?NHN6dDExQTFaem9OTUN5NXhyUW9uTk52U2R0NXRWdUk3eDkzZGhETVRnNkZ6?=
 =?utf-8?B?WlVTblRNMUoySDhCSG5ocFFac3FNbEVSUk8xNURFeXJ0TG9uWUVMZDJ1aUlW?=
 =?utf-8?B?S01Pakg0djBlbWxXYnZKcE5KQXhaaW1WdlFPem92QTB1bnNyM3ovc3dTTDhJ?=
 =?utf-8?B?bXQxYi8va281MUs1VC84c0ZQNTFyWkRzSmdRNGlMZm5BcUlob0lrUFdxaGg4?=
 =?utf-8?B?NDBJSE9RV0hBc2ZQMkNsZG4xVFRNY1lxaG1OV01Fc0ZQOS9HcFI2VkY3MVlh?=
 =?utf-8?B?NmhNaFFGcFF2Vk94OGlsL2trQ3E1UEhXVWgxZkJmVVdGV0JaZXJYanNzOFVl?=
 =?utf-8?B?cGdJck92RmtGb0dYSS8zK0N1Z0ZONUFidGRkMGlsM1Y2ME1pd3NHemovZmV5?=
 =?utf-8?B?VHI4eE1hU0pnWVNKcFZsYXA0UnBTVHF1RjFHRDVYSlNKdDA3SWRCWlpSZlRF?=
 =?utf-8?B?THVrY1poYnFLMnVwM1UxTEJiem5JcG40SG14OW5ObTFEcWQ4STc0eGJpT3Bp?=
 =?utf-8?B?a0FLUE5YbW9BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1785c06d-d137-4374-a9c1-08da05e48b4b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 18:00:37.7457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fz7qnWDzpl/rOVp6mpLSGRMdJJV8nkVAhg8Y2qyXk/kpG1OsVDlefWuOnIz5GuG6Uac5R35O8roNM06BtIbgdQOWxBrehbkit9L1TanYilw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1818
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, rad@semihalf.com, upstream@semihalf.com,
 harshapriya.n@intel.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 hdegoede@redhat.com, ranjani.sridharan@linux.intel.com,
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

On 2022-03-11 9:24 PM, Mark Brown wrote:
> On Fri, Mar 11, 2022 at 04:35:27PM +0100, Cezary Rojewski wrote:
>> A continuation of cleanup work of Intel SST solutions found in
>> sound/soc/intel/. With two major chapters released last year catpt [1]
>> and removal of haswell solution [2], time has come for Skylake-driver.
> 
> I've applied this but please do look at some of the clarifications that
> Pierre is asking for - there probably is some room for improvement
> there, but nothing that's going to require a restructuring of the whole
> codebase so it seems better to apply and look at things incrementally
> than to have to recheck the whole series again.  Splitting this into
> easier to digest chunks is helping.

Every comment and review is taken seriously.

I'll sync with the team shortly and proceed with the discussion around 
"avs path" series too. Did not want to spam the list with several 
avs-related topics at once and thus the delay.


Regards,
Czarek
