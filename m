Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 339D659710E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 16:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B831D1651;
	Wed, 17 Aug 2022 16:28:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B831D1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660746583;
	bh=G/KJnOahGZT89gmxBr1GTlF+62xc7BthIE9o4dhuwBI=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oD8qamujLNmPVThieA5MAjFbCqAkA2CJGyyEDCdrJPNfCbWtUsF8J3H2MLuOqMRav
	 oi9iL9UL0AEq8FgCuD4Jdn/EfrYjQGaqWBQjoYKSIBSoByTAMo1z38nM1yT6raWLwf
	 LWRUpnpxwRB9XUNEkyLSHAtAfmAeGHem/42htqUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C98EF8021D;
	Wed, 17 Aug 2022 16:28:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54AF9F80130; Wed, 17 Aug 2022 16:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 318AFF80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 16:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 318AFF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hzsfIV2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660746513; x=1692282513;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G/KJnOahGZT89gmxBr1GTlF+62xc7BthIE9o4dhuwBI=;
 b=hzsfIV2CRRn+muHlz7902yAGRnKeUnIGkqxj1Q+0i1hpMlH3TpBcDDm5
 RzoKLv8AHQWUu7w0nvvUgjEWd4KL97sil/pgX/GY9HRWu2TyOrsO9qPXy
 GBUmRgeihEtQhO38Zve7GhCsEgGUhVL7+cbauNlKUpcS79LqG3PIhjjIH
 hnI7zGdZ/0gVwOuPfJ6iJwKoIgNQzw5q+l/Crxuz1P16oiJdR15vyA8/1
 ecyEjbKiYRGtd5Bfa1/bkYBLz1UBhxRxXz6YnJccgG8bUGUiymtK+hGw3
 oGCCp21Bh/rO3mEvR+RXkrbYqq2S+cs2hF/Tn1xrw3qnNGtrCDg5l0ZzN A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="318515315"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="318515315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 07:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="783426719"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 17 Aug 2022 07:28:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 07:28:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 17 Aug 2022 07:28:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 17 Aug 2022 07:28:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 17 Aug 2022 07:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP0vsOjtlST6IBMk2OTaIkCDKoIPL23zLLnmq2IP/QcxXTcz4K9MtIFz8rQ/2ySWaco1ylvw8RM9GpoHYb8lTWWGCay0UDF0YwfaUIV8lgEnRoMIUyzfuYU1F4OWPuxXM9HrQ246uQY7DPveUGqpUBFd9EDQgMkMSWdo2YqZWUnzdRXu5SnFQFcCUudUicJ/UrAAQE3MZH0V6+vd2P2T7oEtk/t4XPvK9Hwjev7xRFyirS/Aq1vOl2dw80OngWy/xCBRTxqNbawm3bKI/kGhS2WmGsw6ZwOo5ejl73QL2JnKFePeV+WDwH1Gs2PQQR2s+o8Ck3ImFjfEWtyAoAGzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koiNODQM/0rSGwx19/ztgR3AhnVwK7dXIzjROHF8T5E=;
 b=SAQ0ifNwKnShKEMk8tDYj4sG3/IJeag3jegJS2jXG+6X87Ux062dFAcG8a6C3OYzL2FD/e+AxGnCtUBx2FgK7FriaHeF7KGHLtX4FRjSVt6HifkRCapFXqhgA2lApAu3Mf+fCecOw2AgyD+5/m68MGN9Ai1xC5mwlMB0rMXc4XakSoDOjH0doGe8SfBS9By64XgRkjSLvKEpmOIyMMP5TJnGfRyrM8oP5glXwlI9cLd8eB9+nuGy09yrepB0/7Ba6v4xruRaycYP5+H5X2PAt3kiEYAHx6vSPtEoCUFjrEzOfUT6IXzeqT0fMIobmvB25uGXywD+CbiRsDHLMsRK9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.23; Wed, 17 Aug 2022 14:28:23 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 14:28:23 +0000
Message-ID: <d332aa95-540d-e939-50e5-d3e8d855047e@intel.com>
Date: Wed, 17 Aug 2022 16:28:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH 0/4] ALSA: hda: Minor cleanups
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 <alsa-devel@alsa-project.org>
References: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
 <617fce3d-4661-bba4-4e64-a43dfae38ea2@intel.com>
In-Reply-To: <617fce3d-4661-bba4-4e64-a43dfae38ea2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 214ac90c-e4e5-4b4c-77fb-08da805cbd4e
X-MS-TrafficTypeDiagnostic: MW3PR11MB4523:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lzCKXAYzpbkKJAD9TlheOKNZyKJ3n843LMnMuiNlYurasTWasoBsWJXsDJixSpfzNyddbzcOEXCg1gEsiO/uUQlKghOk2oVEspQC5ZLUiEfQvMnxkkcHyiy/cymMHjEv0O294qcWSX9z1OErN1j0HVl3kQVX533ujweGwAbBMr14xLsmMzujvfbuLby4w3vob5zBYC8CmpNkS/yVpdvRwMBKlb+m0704lwgCS1uqZZOd0KbxmrYpmcuYZGinRGggojMd2wAg6+h1PT3ox6whci/5pFwqiIytzjg1ljIocBhOt3qttFDs0VamkGR/M+0c5h3eDPmRMVlfYTZ95ThM0PyJRhu4AHhgkqWHs2IE4kShgrbCusc9WU90ekHF7uT6iGwFlfS2QjblqV8fp5Yh2n42GkI+/ZV88991uOECB7MKoJre5eyCg/RvpQDJMa3T9c3gIQjUukjr1gtxttwmMHoPHzAxr2MzBT7x0Wn2cxX25GPCk+Y8u2o0KpGdGB239OX4XXlfxLYWi+TSb/zzwuj7+GIRXWyOp9unBDGg6V7foymEOGqhmAq1QBlFQD0rUIMc6lC/3Ywk3oboMjdVg9wyL2ICrE9nVUtBms6XW9v7hsjify+a9Uqd4rZktiaYN8wlnTaMNdWVRk+BS2Cjiu/ITgOfr3PlJA9uIwSQFeCJaABu5GTUwsDc+/U4nSGvikcg2Yr1XReYncpzIk7GguYmZyK4zoEzbIFXZorxLb9OMs1yrs4EaIqwfgrL/WWTaRV+PqReFsU4tJxHiJ1+bIHttJ+MuSsbQHFF0zRH8eZvThe1UCJJFTA9BuSqc6gI5uJuPa/Pd2NRzIZE3OBGDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(366004)(136003)(396003)(376002)(31686004)(66946007)(66556008)(4326008)(8676002)(54906003)(316002)(110136005)(5660300002)(8936002)(66476007)(4744005)(44832011)(38100700002)(6512007)(82960400001)(31696002)(36756003)(478600001)(186003)(2906002)(41300700001)(6506007)(86362001)(53546011)(6666004)(83380400001)(6486002)(66574015)(26005)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTgwWFQ2dURkTG55dU5ScjFadktpcnNjNENrdWViZnpuOHJmTUVpLzAvK2Yx?=
 =?utf-8?B?aVZNd0QreitFQlRNT1dHODloODZObkppOVY3QjV3cnVCSkhRVGswanYzaGg0?=
 =?utf-8?B?QTRjb08yYXpUdG0yaHdUM0hQclRrcXpmMncrOXBSU2p4dk5ybVgvOXFMTmR4?=
 =?utf-8?B?Qm9tNDB3djdHU3JPVC9ENnVnT2pjcVFDN045bThaaUFnaGIyN3MwWG96L1Vv?=
 =?utf-8?B?SDBNajFaY3ZNVm1JeXRpdFZNdm1EU0wyWDZuTnB2NzhmcVlSY01WRk5vNGxl?=
 =?utf-8?B?UnVHT3Brd1VQTkRXTXd5cUNvZE1vRHphdVQrMGpZcVkwZlZCVExkT0x6dWxn?=
 =?utf-8?B?aWw1ZThmZ21vbHJyU1BSYTVZeDY2THBFUmtGUU5mNTRhU2Vkbk9VenFYRmdE?=
 =?utf-8?B?Tmt5eFFhM2lab2NReklYUjZkK1VtWk5YUDRwRzR5eDh5cTRxRkV2L3doTVZY?=
 =?utf-8?B?eWRsVW1IZk12SWFqeVZLaEI1djZpTUlDalJsemdjTFMvU3MyWVRYdDR1eHBJ?=
 =?utf-8?B?cDR6UVhPNUt6ZzhpbEdWUzFXa0hPZWJSdWhxaDdTeCt4a3Q0elRHSnFsNTJr?=
 =?utf-8?B?UW9RR0VLYXlhUHVWY1l4dU1iWDhVRmxsaTVxRDNSOFI0MTZuYnlybmY3NDNC?=
 =?utf-8?B?emQvYmkyWkljSElWYnpzT2dqRmxockhCV1VPU2Zad3czcGlvYmtYUVQ2WXNM?=
 =?utf-8?B?YU1VVUpUMjB1VHFrNDEzNGVaWHJVS0ZKTjl1a0FZV3JYN0VvTUxjVnJ0RWVB?=
 =?utf-8?B?ZytJYmpMdGZoMU9pelYxa3U0SVg0NUpyUVlodWU5Z3Nxc2dDSjVkbHhtbWJa?=
 =?utf-8?B?bmMrUytQTW5zbGxPaHZzSDIvcUUweHhSRWNmZDRIL09GU1F2WFQwY1pCQWhn?=
 =?utf-8?B?SmtJN093bFNzK1lOcnlFOFVFY3FvWHdYZzhkcVBKLzRMYWI4Q0IzSnErVkFM?=
 =?utf-8?B?aFhtMzUyaVVvRUs4RDlyektrQmo1RXRhN2gxZ2RRY0pwcDR6WTFvaVVNanNH?=
 =?utf-8?B?QnZ3MWJuc3g2WnFSQWFiN2FVdDNhNzJoMFRsWjliTkNaWFVrL1orcFY5eDNq?=
 =?utf-8?B?OCtNbzUzM2NNUTI1V0lNNmhVQldza2w1cU93TkF3L2o1TWllb0JPa1c0RHdl?=
 =?utf-8?B?WHJqajFMNDg1WXJVYWpHZ25acUExTTQyMk1wbXQ1MFhSaVFlSitvOTdsaW5R?=
 =?utf-8?B?c1duVUR4TkN4eHBsTitwYm9kRS8vUmlNWGZ0aFZMam80QmhFRmJBMi9Gbm5p?=
 =?utf-8?B?Tis2akdjbDA3SmpsTE5hbTNoaHoxNUg5cjgxeG1UeXZEYnVMYmtiQmxRemVI?=
 =?utf-8?B?b3krUmhOVjNoNHVwNDJXU3ZFWWU4NmVLdW80RlorY1RWNnRoWXl6VXBTVXhR?=
 =?utf-8?B?Q3IvQ0x0SG5uT0FjcUlZYkw2S3IwU3VyRjJsZjhrVG5ra0JYaUdRbklVNzBX?=
 =?utf-8?B?SWx3ZUJkZU5xeDloRTRFdFJydXkzZUlvR2tSSTI4enFYc0FUL1RqVFRBWkdU?=
 =?utf-8?B?emZONFZ4RlFGdm9ZOGRrbUhGOEV2ZmtEQjUzMFFMTVU1WjFxZlhmanBqR1VH?=
 =?utf-8?B?WE4vT2I5QjRvWnl4bUdXZkZpcTZEbFk1RTI0LzkwZ1M1eWFZZC8vemhtajkz?=
 =?utf-8?B?V1phcmRONlNJSW9iV3IzdGdaMk5HUVNnMGZsVWpTdCtma0hEQ1RDMk1WWDZF?=
 =?utf-8?B?L25LRDlpZm1VNTU2Ti9IeWxselpDWG0xR3BsNDRFU29TTzBLMEs5TVFiVlJh?=
 =?utf-8?B?bGJleHYyTW9SalZQK0VGVDNTRnpwQ0VURmptVmg4NFEwYkRWNGFCMTlMT2Jw?=
 =?utf-8?B?UFdjVFJhU1Nid243d2RyRmVoejZya0ZUZW1sSzhKVnFpQlFucmJMc0p0MDVy?=
 =?utf-8?B?L29iT2F2aE5qSXlrTzdBb0h0NjlqdDFMVk0ybXYvbElkaVZlb24vVlhmTWVZ?=
 =?utf-8?B?ZkhiaFkvSHBEWUpwTDF4Z1dMdGlmL1lJa2E2K0dCQ210bktVc042d21KN3B1?=
 =?utf-8?B?Nlg2MUxTSXJveFEwYmh6WW9JSXl4TkNRY0Iyai9VZ0I5ZnJSY3I2TlVCYi9B?=
 =?utf-8?B?TTViZW90cU13dnVOZVZNMjhvWUx6ZTFjRXQwNFhGTmlaNXFRc2FjOFlJTytR?=
 =?utf-8?B?ZG1sb0FxSndVcDM0WGJnWk1DdEh2U2lhSDRWcmlLU054M1UwZHhyRlIvNC8w?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 214ac90c-e4e5-4b4c-77fb-08da805cbd4e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 14:28:22.9916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eip+1zLIHwYOvJv4RXthy+75GCEGNaWGE9iuXmZgC5eqOvEC/PYvVbMFppiRIXa5YuWIvn1AGSvVwO0kgN0OK7I7O0HOLHCPgxlXSPCDd1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-OriginatorOrg: intel.com
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2022-08-17 3:23 PM, Cezary Rojewski wrote:
> On 2022-08-17 3:11 PM, Amadeusz Sławiński wrote:
>> First two patches are small refactoring of code to use poll macros
>> instead of open coding register checks.
>> Following two patches remove unused defines from code.
>>
>> Amadeusz Sławiński (4):
>>    ALSA: hda: Move stream-register polling macros
>>    ALSA: hda: Rework snd_hdac_stream_reset() to use macros
>>    ALSA: hda: Remove unused MAX_PIN_CONFIGS constant
>>    ALSA: hda: Remove unused defines
> 
> 
> Reviewed by me before sending, plus from the test results patchset 
> causes no regression in the avs-driver CI.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


RESEND. Patch was blocked so my tag did not make it to the list.
