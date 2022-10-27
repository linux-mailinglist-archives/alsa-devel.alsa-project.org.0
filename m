Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4B060F658
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 13:38:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D993140;
	Thu, 27 Oct 2022 13:37:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D993140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666870714;
	bh=RuYo8zMzxbkRbm+HKM/jlf9fI0Mfh7PgbN7hPiVDhLg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axVtRQqZtGgjVUIFszEZnVgdC1vHDVAJPMIkvLdAqbwy5EcGeVBzdr8DITEsobKtO
	 6TNYyXOROdvft0SIn8oLx31Rd9veyU/z0KCccE4LuiKE6KyawyzQP7Bhkjt1dDnzSn
	 asLPwVmg8fWDGJwCNq6UIJQyK2/5FeluNjUnhPmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3C6EF8016C;
	Thu, 27 Oct 2022 13:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E02D8F8016C; Thu, 27 Oct 2022 13:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B56FDF8016C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 13:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B56FDF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k5m3FeQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666870655; x=1698406655;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RuYo8zMzxbkRbm+HKM/jlf9fI0Mfh7PgbN7hPiVDhLg=;
 b=k5m3FeQvsCo3EsxiAi2Ii2xSgLhhO+GYsRBUvo97B8ZBLE2vhkv43Zea
 Mv3p2TF+dH5Mv1ciBrRSM/4hfiwdohN+rei6FMb7ZdUYeEURzG/CxU9B9
 bMqI53FOzSae1GaSFzNxhOyLmWPDCnmnMEX+xG7ZtimL3MoskLini/vbV
 IaRVsEkFx/rBnSTc4/PVXbqMk1y1+5cjxUUcejPHX0Ez1mzm16weUs8ls
 uxWqGRWtcsIz8sIhK7x0a0kbmwIcVlo++9mf961FEa0ma/bTDw0/DCzmy
 E0oYOeAtLgEbVIDaQOuF8YVAJ+5srogZegk3gRCiOC2ht5Ic6GiU5okJ5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288595416"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="288595416"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 04:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="634870417"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="634870417"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 27 Oct 2022 04:37:14 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 04:37:13 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 04:37:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 27 Oct 2022 04:37:13 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 27 Oct 2022 04:37:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZYIedJO5EkYoab4n6CUfn/lb7EBFALi5eUn0EAxPUlcsBE33lWp81luYOCT30VjZ9wbfNdBvNdN244CkeBceqJK2sIVPKuREMBQi9Goz0umeaYQjJ62dIRTCRVzD+iyanIsaCBwg/srJmm5KSSmhcM7oySvGJC/Vj0r1axB+LgEsHclFgDjvsrc/yvORX782bxJoKmxHG+jRbYVUnFJ4WzvXXUz1fownWQrV5YBvS0wcra396YR7mLVJYkYlesUbSUE1lT6Ckqt35Q6mibXzdaUydTzC7ugfOKYZ/9edmnz9cceX+Yep6YFB/utHUiSfTcqJVcoRudIYgt+cT4T+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4SVcB9MBZNjbNw60x4MxJvGLXszJ9P8Rcq/0efpbYc=;
 b=ISlAJafxr/Ql9b2GJF8IYsxk/UmAGkxHzYV5eOkT6J98kYGd35AxtAEhxYqyaDo85lAa+lfWWlZIxXp3bHE9s63BYkl+PxlTj7aMYnHH6OG4nSfjkx+qXfx7JPFs0o3pBTV9Cpm7vTCTm+iceawcJbZMUapWYtXfDGQ9EdceqW5qIHODk46svUPSH98Bk7dGQKs4HU2AcoTCE4Yy5OZqVmOdx5sVXI+t2ug6WGSCXyNqDJYUvCuffyuTuO5PS5M4SSzXOwM+giDuFuhbCmJb2SXcf3aZY5gi0TNW+9wZy9v4TvclWPLJovqQIvXqBqWyupv/+zXbCwf6+OOLqXRkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH0PR11MB5426.namprd11.prod.outlook.com (2603:10b6:610:d1::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Thu, 27 Oct 2022 11:37:11 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%4]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 11:37:11 +0000
Message-ID: <00db6a3f-3d9d-7e29-8171-4446fe5acd1a@intel.com>
Date: Thu, 27 Oct 2022 13:37:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.0
Subject: Re: [PATCH v3 3/9] ALSA: hda: Introduce snd_hdac_stream_wait_drsm()
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20221027082331.1561740-1-cezary.rojewski@intel.com>
 <20221027082331.1561740-4-cezary.rojewski@intel.com>
 <874jvpo9by.wl-tiwai@suse.de>
 <3977c2b3-ead3-3904-820a-d602aa04c51b@linux.intel.com>
 <87zgdhmsqa.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87zgdhmsqa.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::8) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CH0PR11MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9c1044-3373-483e-0bcf-08dab80f9626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bMUZ72NrGKYLXK0XkY59kBirB7oQ/jDzM8qUiEABL6bdDs0XX79qCwIP2AuuE/pNz7dlyHxNi8xZggzgJoTBqy393v5KAOYCewDQIzg3hTbE+ii28u/6BjVXI89Wh5wAgSexmwe7OgBLi3sA5aWMnctP96kKC1cChjLc5qwHDyHIxE2hrjBGlMujFNN6zo8y1lAlBt7JGMMafA/4gjaW0VZfdWPBiK5IGglsVxWjUJqrYtWo/ebj68PwlCmcTFmnJPfHLRTBvU4r1llLxq44zZjlDlNKKAPIa87NT6bW/wXnmUZUfSjCij1RT31ztNv6+gY4ZcEtKSpEQP6+jRtYDIsjNkeCS+aJ9K/kr1kEH9p3SSf87BK87Xek9rXPjA6ZhBQWX8yLdeoZPev8QbSy0YH5V1URkA1Eb35QiJ/4Snr/bcDGxOjskuwKeApc6gBZoDMQuzAZLCuHfUevGNCFWVqv8rEJPBa9h4GJpzl5rcZJt4C/Iz2Av7yVIdGsFA3KFtVtGJgqHzkhFtgkKu1IutunKi0f+4WksfgTNSe3AHRMW+nQuOSuMpixdA2RN1EOQAlSR0iy/pdCILDvaNTk1sNHCJc5ulO3GjVT2OMo+PuLjXQw6QF5Ho6dQkRfHzzPbnq0QP4+JxZ1QsJlWRdII4zEmzyoH4VM/mC77t0QJD8We3nba1Pts7d9yKDQrhgTu82eySumD1xh8aQm1hpqpvPVSYhgD9PRLXnzY1gogsontEuW4rMU4NtEvm4/39fEzBEidKpmHJrznzEeTsM50A9L0T24HTxGIX0nH3sM6jvOh+zEh5UBv/DSUisTG3h5UUPFZF8xEgMh9n7/XlmXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(36756003)(5660300002)(6486002)(44832011)(8936002)(966005)(478600001)(6666004)(316002)(8676002)(4326008)(2906002)(86362001)(38100700002)(4001150100001)(82960400001)(31696002)(6506007)(2616005)(186003)(53546011)(6512007)(31686004)(26005)(110136005)(66476007)(66556008)(66946007)(41300700001)(83380400001)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9FQjZQY1VibHNKWTFGT0xWSjF3RnVBWmd3TldBRytjMW1PbUxDbHJ3WG5j?=
 =?utf-8?B?NWFQaGZiQlFoVzdSWlhyaGlZZjBWQ3RBSmx3V3MrWW12RGlwVHc3OTRQRHV1?=
 =?utf-8?B?dHVTN3lYd1pnVkVSaEVHd0dwOVZrWnZBYVYra2oyUGZIWUJqUFBNQmNBY1Ar?=
 =?utf-8?B?dGZlSXU1SUgxRG1pOEYvWEVqaUZIdE1JKzEvcGNuQTl4S3JkY2ZPWTE1MHE5?=
 =?utf-8?B?VVhHK0MyeXRqV0F1ckhIaXB2YWpLaVg1WVYwMW5uN284bWQ5RDVkNWlaRG85?=
 =?utf-8?B?VEdHekVIZVVOeHRtTWxiVm5oWDNDWUpadVBtYXpuUEdXUmQwT2k0M1pkcGxw?=
 =?utf-8?B?aWZRVC90cE5KeW1mVkRQamdEQzQ0R0txM0YwUnFISmdTNFFJdXJaOG9Xci9i?=
 =?utf-8?B?UHNuVzFuS1A1amhKeXBLeVpkRVgrNmdJN1JFRVNsWkMwM3BnbjRNM00yZGVp?=
 =?utf-8?B?YVpwNlNPNDk5RG90QTJZTXRJc1c1cFNkS1lEWDNSeTRnbVRkdlhScmhVc0Jk?=
 =?utf-8?B?dXBkWktNbmc4VEFyQmpFL1JrMW5hS0FWVzBQODZIVE1weFhDNWpUMGJOaCtX?=
 =?utf-8?B?TDlxMXhpSWNHalJEdDdjakpac3ZYTkxLMHZtcFpVQlZXVUlxZFBpSEtieGFo?=
 =?utf-8?B?YUdjM1NNSnRuUFprMnNoZGNNbWRJdVRiQ24zNzRabkVGdFB6NHZTV1NrektI?=
 =?utf-8?B?WjlLTHlDV29TbFlIK0xvZEdpb1NjT2hJbk80OWd6QlovOEhrSkp0dGFQY1hx?=
 =?utf-8?B?cURDRDdBMEZVUVdmMXFtSlAvSVNRSkhyS3QveEpIUFdhRGtIeEpiTFVqc3d2?=
 =?utf-8?B?cjBLY0dnTXVhSkpvTFpVRFI3TTgxQVJKNi9UU25ML1p6WkRnVXBKUmJFenkr?=
 =?utf-8?B?ekRRNzhWWXc2V29nUHNkcUdLZERua2ZRcVlFclNxYTZDNlVvMUppbXdwNVY1?=
 =?utf-8?B?d3QxSmNTb05QSWMwRzE2VDU0SnRxQnhpQ2JsYlZzR2d0V1NCSzlDbjRRaloz?=
 =?utf-8?B?eGN3YzFwUmQ1VXpnYmF2OEhvUzNZU2xLVUl0SDlNcVdCK1U5bWFCRnF3OW1T?=
 =?utf-8?B?cFdEWWQ2ZGtWNWZ1Q1dPQVFUaWlFMDhUMGpJYVJlKzNZYWxoK2oxNkhZeDdK?=
 =?utf-8?B?aHQzTEZmM3pXLy9iVDVMRDBJazBqOUo4cWJ3SlpYaldvV0tjYmZpVXZMbGhM?=
 =?utf-8?B?d2NxdzFKMW83a2JIRXNncFdyUjR5dG9xZURidnI3eVJOaTJhNmw4RnNucTVL?=
 =?utf-8?B?Y1FUKzVPN0JOUGRhRWtXbGF3T2F5VkFUYXcydDJRMEF1c2VJZEtKemxKeXVK?=
 =?utf-8?B?eEJUUjhFMnN3TVlNUkY5U21saEZwOVhDYmFOWFFGWlhXL1JKZUJVUXJZZ3Va?=
 =?utf-8?B?Yit6TXFnY0MraW96TWVRbGVsb0hScEtlSjdhd3lwR1dxMUNGK3BXMGZ4WE9i?=
 =?utf-8?B?OTJiazVtMHFTaG5YbXcwdERDWktVS05OK0NoNGdsYVZVNkIrYUl3Zm9nMW13?=
 =?utf-8?B?U3p0ZndkUWV2UVpvRG1DRnF2QkdCVmEwUmtzK2xhSzhqeFM1Z1ZTL3Z1aC84?=
 =?utf-8?B?VmtJa2M1NHlid2p6RGg1d1hvSDc4U0xVS3g5MEhEc0UvaTNNUzZ6eDM2TzU4?=
 =?utf-8?B?S0w3cC9MMk16Q2ZjeE1QRXVINks0K2tFVktwNjUrWElRK2JxMjRJOEhsaTR5?=
 =?utf-8?B?V1N1Zk5QWXFkeTNBTWd2L1pBcXhBcmYvSWs4VEd0OUFXMHROVUxEZVl6QU5t?=
 =?utf-8?B?QVEwd3pJMFZ2QldYL05UUnZKSjVQbll5RWxzVXQ4OWFLNDJrSTVZeHpJaVRW?=
 =?utf-8?B?eHhKU1Y5RnJ6U01mTys4QUpncmpjWEV1RTdsL1F5RmJwTmxPWGRhZVZpMDJh?=
 =?utf-8?B?b2w4UitOOFdSRmtZY1RSQmNjRDVMVG9XbGJPdnVPcXk0RUx3OERsWGNraTFT?=
 =?utf-8?B?dnVxalZhZk9rTWw2QnRVVlFrdkJUVUw1ZERzbWhuV083OVhod3YxM0JMM1Jn?=
 =?utf-8?B?OFBQRmRCcGIzdytTdnVlR09aaDNEQmxZSElvaU5QVnNmNmVGbE8xTmdVYmV0?=
 =?utf-8?B?UVpBNE5UZXVHWWsvQ3pKazl1eEExOFNQNkpyM1pSUk1OQW5wTnhqVHN3K0kx?=
 =?utf-8?B?TXpTRHlTWEZyb0J2eEQ1TFRmalFsWW5HNDZuSHN3dUt1VzRMU05ZM0Y3VlIy?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9c1044-3373-483e-0bcf-08dab80f9626
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 11:37:11.1317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBU24/ppcxCi2JPMjYtTVRIQ6/BZJrhhSTDLr/FnxxYLoeTWpnK6uBvHt1i4gaZPlROleLmqOHMrPJ7UTR7S0VoZCakycDt9IwmoBa4n2HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5426
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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

On 2022-10-27 1:05 PM, Takashi Iwai wrote:
> On Thu, 27 Oct 2022 12:29:35 +0200,
> Amadeusz Sławiński wrote:
>>
>> On 10/27/2022 12:21 PM, Takashi Iwai wrote:
>>> On Thu, 27 Oct 2022 10:23:25 +0200,
>>> Cezary Rojewski wrote:
>>>> --- a/sound/hda/hdac_stream.c
>>>> +++ b/sound/hda/hdac_stream.c
>>>> @@ -821,6 +821,27 @@ void snd_hdac_stream_drsm_enable(struct hdac_bus *bus,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(snd_hdac_stream_drsm_enable);
>>>>    +/*
>>>> + * snd_hdac_stream_wait_drsm - wait for HW to clear RSM for a stream
>>>> + * @azx_dev: HD-audio core stream to await RSM for
>>>> + *
>>>> + * Returns 0 on success and -ETIMEDOUT upon a timeout.
>>>> + */
>>>> +int snd_hdac_stream_wait_drsm(struct hdac_stream *azx_dev)
>>>> +{
>>>> +	struct hdac_bus *bus = azx_dev->bus;
>>>> +	u32 mask, reg;
>>>> +	int ret;
>>>> +
>>>> +	mask = 1 << azx_dev->index;
>>>> +
>>>> +	ret = readb_poll_timeout(bus->drsmcap + AZX_REG_DRSM_CTL, reg, !(reg & mask), 250, 2000);
>>>
>>> Remember that HD-audio bus doesn't always allow readb().  Tegra
>>> requires the aligned access, for example.
>>>
>>
>> The readb_poll_timeout macro was updated to take care of that,
>> https://lore.kernel.org/all/20221007084856.1638302-1-amadeuszx.slawinski@linux.intel.com/
>> so it should be fine?
> 
> This patch doesn't use that macro...
Thanks for spotting this out! There's even more to that. The DRSMCTL 
register is u32 reg, not u8. Since we are using lower amount of streams 
in these tests, it works just fine but with a higher number, the 
scenario can fail.

'Just copy-paste things'. Will update the function to make use of u32 
equivalent.


Regards,
Czarek
