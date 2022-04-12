Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7044FD4B5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A8B517E6;
	Tue, 12 Apr 2022 12:07:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A8B517E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649758128;
	bh=SLGCp1BGVGQqLL0GBYK7U0vtdyTRR955jmg6xmc+FXc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKigtFamIqJfvXvqdnl5N4fuHwPoLPqkj2TOGXYw85SWnMtLtX6r9LdpEVeOAifmQ
	 J7HNXWT0hlkcdtxrt5KobacJ9VZJq57blQ+zOOOfMP9F07XJ66iSKEhOrD9C3XZoZt
	 k/06oKk23SDUg+VERY0UwZn2xhZgtyrv/us3iUmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82E40F80245;
	Tue, 12 Apr 2022 12:07:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1174F80154; Tue, 12 Apr 2022 12:07:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3399F80095
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:07:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3399F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TAznbcQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649758061; x=1681294061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SLGCp1BGVGQqLL0GBYK7U0vtdyTRR955jmg6xmc+FXc=;
 b=TAznbcQ7/oBqP1Yl35boNIpPUm1GbRCj4Qc2cd9nsNdvORe7RJNKmxHY
 RK/U63nuaWvwJgmoSLINMLHx5tVOH/QED+i1qanZmxiN8BW3cmUrNzOyV
 HT0FLl4YYoj9H6m1H8sVjt0pNxmsrGOn8JyFJ4wPLGGfhKPP3KkWBXJXr
 qAvPcRh0+iuwdgPYCRtFtF8o4GYwyRKb8expemRiqVPgglOaot37F573t
 gx5kVBd3pc1ryDlx5jk5faQ23lJXKNd9D9JxOFD1fLqN+YU+vaS+cnKEL
 Y3JoX6ixjpz3IALps4S8adX6cJ3+Ul4MFGvqsd7A9I/3BvmA8Z1nW05aK g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262516944"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="262516944"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 03:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="802174697"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2022 03:07:37 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 03:07:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Apr 2022 03:07:37 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Apr 2022 03:07:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OiVcXSeCjBAHu/p6YqmgEiqakBfOgiWHWx6MkW3MYj9UK6tfm5aAr5/jpTtppJIA+I8qNR5QZi2zll7wsrcKmF9AjPJLZSBQT8WJJh4N2fsmpdsZJ1DhQMYAgx/c22oaNZdsJnt454rFCx5NyJqi3I5U8jkK+e2aEILzvgsHUYoin5mFb3v2wFWjpb8J9jx0rC0TggMmiKBom+SHn3yM+rd9NA23nFGRp4GusIr1hX1IPz9X+TvDHmn/V5NqxCfFClqGewaKKX09kncnJssroTxePDqUr/4uGHY9M9bm74IBex9AyVKPVHlAmV9H8wWgsijuD8CNNjCvaPaaYbKyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwpKp6gvPmUrxTfQmqHPSddsNbAWV6ZURpQT1rd9vUo=;
 b=W2O/3C/shFCbhm5djev0YSbXBypzlYI2x/Jw8+w6jTJdSNWBB6nUKkRPLWLpfKf46u1wewAaGQzQu4gIeOnvi/0gwFcbHjEOJV5QAcbDlv6wyZDPJf8iopa4NheLwhd3MFeLDgPBo6hV7coU2M7OgCkLUhIz8MH/RGXxurLny5PiBtxL6A2R7C9i0d2BQmVqQ7q7xpbgPXrGwmyY1/463Qr0QJ9ZQCat9qJ47i8J3GIE7ZT8sL+QyoEMHiDWPv0Yq+2Xg4l0yP7ZsC31W2WUqrWW6uJxUb7wTJw+ckYBkT+qgYkoHZF3CNh1odY4bJlzR33TEzD7dntcJ/lwV0HOWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN0PR11MB5712.namprd11.prod.outlook.com
 (2603:10b6:408:160::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 10:07:35 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%12]) with mapi id 15.20.5144.029; Tue, 12 Apr
 2022 10:07:35 +0000
Message-ID: <c36aaba7-55c0-578d-6cb4-87f79b24fbf9@intel.com>
Date: Tue, 12 Apr 2022 12:07:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ALSA: jack: Access input_dev under mutex
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20220412091628.3056922-1-amadeuszx.slawinski@linux.intel.com>
 <s5hwnfuab69.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <s5hwnfuab69.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::34) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cb54223-fbde-44d4-7dbb-08da1c6c443e
X-MS-TrafficTypeDiagnostic: BN0PR11MB5712:EE_
X-Microsoft-Antispam-PRVS: <BN0PR11MB571218C4C9051BB6C59CEAF3E3ED9@BN0PR11MB5712.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtkO+x/iOW1z/H7JrZMkdjFPJoS0DhtZ3gVA93ziN4jvNo+d8V39BDJQUBWtl7tzeS8mcDvSRjvoXb8fNWNwB6eBr0aULro/0KaPEjQxRADElR93zZGSerdPuIqWRv68Blep2GrjQUB4k2GPXIWpJ9HPqsqxXYod2QQKNibcM9bdpU56iyZ1AYDYJ8GGjInAd3j96a9BCY0EBZvFXGLzw9LYCskKT1XibM9U+yaRNX3/xYSqDsYm4KzOdnVBorMG87layRLsUdBs5jzHq1Yn7ZmeQeCyOTYFmFu6CdP6o1hCXV2ErfI297B7iXzEqZoCJJjNfQu/oMCbQTIUYv6N4YfRr3StD3XyPggPJWg4lcIniC21k8rIN4dHqRJYNPfnpjyFndLnic1wXa/VOS1SvuvqLxs6Z5wtXs0ZlJmyHuWq1M4ohVtxZS5NF/eBVS0gEBnK3Uzu+1NVP8xiFe5wBSgABrHtYpRzzZRO1FTTBQUixTtKp8WTt8gaUoMlX1dJOm249qRZCP6FWD0Nqt0jVmPa+OoFwSi7LCuZ9lVGCoRn+BXSZENKovFaW95mezj7JfdJO8IiJ3gT8Dy1+901x2YteNfG+TRq2Rqwih7zf8SiJj5Z1OZ2VVgjALHC4DnRP4/g3kYmAOcn3NCjUgAhlv44eskWKp65cmj5RHdlV10P2ra57tk7OU/AnhwWhxJtAp05hglfFQJYa1x474Atc2VDKacazo8WK/lo+1hd6RM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66556008)(4326008)(2906002)(8676002)(38100700002)(66946007)(5660300002)(31696002)(8936002)(82960400001)(86362001)(4744005)(44832011)(36756003)(53546011)(316002)(66574015)(6506007)(186003)(31686004)(6512007)(110136005)(54906003)(26005)(2616005)(6486002)(508600001)(6666004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejU1M0tORWM5d01vVUFFeDhjNUNHTUJ1R1dnYy9JMGJIUXMvNUpxanIvaVV3?=
 =?utf-8?B?T0dGNmVVVW1UUkp1V0ZnUlBhSmUvWnhUNTU1RDFuVGpxVmU1OEM0REM3OVB4?=
 =?utf-8?B?bkt6V3Y0UE94UXU0bWYzZG1saVBMTTc3UXlZdnY1MDdoTWpscGI5WTh2QU5j?=
 =?utf-8?B?aER4N2x4UXBTMjkvM0pLNnljQWxIY29JL1ptRzNPSy9FYUJzZnVZYkdkNWhL?=
 =?utf-8?B?UmpMVnJrY1Q3OGxXTHpVdDkyRVNyS0JxNlJKT1hVd0d1ZlBubVZpL3pqbTlK?=
 =?utf-8?B?OXRSdGx0TzNDUiszN2M5ME5hZ0s4TXZKejNuRWIzRGMxV21FWHRMWllnZmhy?=
 =?utf-8?B?c3c5RnpvZ3RtNGZBdk8rd25mbS9TZ09zYVFHMVdmY3FUS2lzMVFKa2JJc1hj?=
 =?utf-8?B?aVFDQkRuOE10eGoxNkVBYVZwT0FiUGxBRGFyNjhoWkUrZklia3p1a1hKNklK?=
 =?utf-8?B?YjNqMG1tVjJ0N1FJanVIQ2Y1YURjc2d4NEJaUXJHWnREQTJycDkrcXRGcVBF?=
 =?utf-8?B?NkdLbURwb05xWHNlcTBTSGh4Qzh0eEhFdFViRWgzVjJndENyeXQra3JUaDJt?=
 =?utf-8?B?RUJkOTEvenZQT2RDOWJUbEtocTFLM05POEdjcE5rK0pwcmcza1J2bUVSdno1?=
 =?utf-8?B?SkFaKzh6bnVCUUVpeFExVjQ0R1NHSlpkRGE0SmVpRHVsUjRjS0lQYXFFaVRN?=
 =?utf-8?B?N09ZSFpBRmh4NmFlVU1TYlZydnN2dm1QdWZueUh5TzNHdkNQY0dDRVFxbHdl?=
 =?utf-8?B?Wm1BTDkwRHJBYnhqdklRNmM5NHZUalJnem5BOEl5UVRpY0NNLzZLMEkvYlFm?=
 =?utf-8?B?c3BMZzNUV1orZXN6UnllZmpEUG9RWGtlOUtDNkNVWVJ0MDUwT2VDdk4rMFRk?=
 =?utf-8?B?a2ZnZDYyTDFWV1liUXErWHA5VUVnMlZsT2J4U2tUbEQwUVpmSk4yZ2IwTS9X?=
 =?utf-8?B?S1huMkk1TktxUStxRnJNdW5GL1dwbW1zOXgza0hVclI0SXZTcTJSN0ZqYkox?=
 =?utf-8?B?aFlHdHM1WElaZGl5MzdLWlJML2lML3ZCS1lhRXp3ZkZYNjBZQ1AyWlhHemZF?=
 =?utf-8?B?S24yY3dmMTdQbnBqSkxHeEdpRmpQUnoraDBBUERSMWhZYjFHMzRvRVg0VUxE?=
 =?utf-8?B?NW9TaUFxY2NRTVMrVmNzaGE5WjlpdDlLemRxZkZsbjVJZVdCYWU5S2dhMGlY?=
 =?utf-8?B?d0xMSXRmN04ra3ZFMThIVjFIakQrRyszNlNiZ2daRnppVUROR01GckFhVlIr?=
 =?utf-8?B?L1RoQWxyQUNVZG0wWURPdG1qV1J3My9xV1RPTWhDTXBRTC9kaFE5a3VGTExY?=
 =?utf-8?B?ZXc4Mi9pV0lBbEhPZlRneEZJTU9TSUtwaTBiVmtTbWdZbjlvaHZDQWVRN0Zx?=
 =?utf-8?B?VERqcmxBK1BPV1JLb2lSZGw2Z01jbk1YT0lzOU5vTHNzQnRxQW5IYlNxUXRW?=
 =?utf-8?B?WCt2blVPVzdvYlBUbzkrMWN2ZHZERkR1eGpoVG00ay95bFdNeG1hYWtSUkg5?=
 =?utf-8?B?UFNZNEZvTUNhREFTL0VGeC9XYjBQamJYZXVKUGlnVGxLNElkRDQ4Q3pYcWtZ?=
 =?utf-8?B?ZjdDWWg1ZkVVT0RCb1FscnluaUtabks1amZrQTE2Vm1heWsvVVBoT1J4d0lM?=
 =?utf-8?B?WTRoRC9pNmpkSDJUK2g4eVdHK2xVWWJ2TE1lMXFyTFV0OC85ZTNGMzNDaGZJ?=
 =?utf-8?B?dlllUEhLc2pTcWdQYlZBOWZUUFc1emlhOHh0aVF0NWJ4QWF5TXJ5VzNVMlRm?=
 =?utf-8?B?UWZ5NGY1N0VYS292aVRCOGV6RmVYUlJEN3dKc1ZtaUR4bENTNm50aUVaUTVO?=
 =?utf-8?B?aVNRaFN3WGZRSDVYdnVIcERWeEZGYlZ4TnBCWHBIcGNDem1udUVLdjFsTDBU?=
 =?utf-8?B?Sk9uWHFtKzhPcC9pVDkrQ1ZRaUtJWTQvSzBsTmZmQmdQcld2endoNmJnRE1t?=
 =?utf-8?B?M3RDb01GdlE0SVNVbGlYQlFSUmtzaUZMVlFMTW1HQ0MzOG9GblJZMk85WTlK?=
 =?utf-8?B?QkhFbDRuSVozQ01mNzhHdVBjVjlRTCtodEpnSGxaWVZlY0ZQNjFiRlVnNDc0?=
 =?utf-8?B?dzIrZzN6Uk9YVHpvQmFRSkZVYUNzd0NCNExLVWNuc2JyYmNuQ0xHTTlNYW0y?=
 =?utf-8?B?M0JXdnpOTkY4VFRVK2JpZHMyRkI5eU9tWks0WWtXMnBwN2thRGhSTUNnVDZt?=
 =?utf-8?B?WHlRN2lsbHMzVGlldHVpOTcydFgvNm93NDAvT1d0NjMvaVRyZ1F2dWptYXQr?=
 =?utf-8?B?dHpZZHEwSnVLbkErVngxbURPZUtxSFBmSXcxdVhmcVdQUFNnemp3ZjFyZVYy?=
 =?utf-8?B?Z2Rvdld6UmN1N0RUSVJtSlYyVlBsNGdyWE9lVVpvYkQ3MXpSWUxuMG1uZnZx?=
 =?utf-8?Q?u3YB9XFKR/RS9q5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb54223-fbde-44d4-7dbb-08da1c6c443e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:07:35.5838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogG6UCecgnsltH9wulc5tEN57rgsDwlN3g5C3HEh5KNmxrwCiAxDIEVU6hwTQO63KmjdzI67UM954hsL1ZpkF24kVMVRSjWZV+jgSgSlLpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5712
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
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

On 2022-04-12 11:44 AM, Takashi Iwai wrote:
> On Tue, 12 Apr 2022 11:16:28 +0200,
> Amadeusz Sławiński wrote:
>>
>> It is possible when using ASoC that input_dev is unregistered while
>> calling snd_jack_report, which causes NULL pointer dereference.
>> In order to prevent this serialize access to input_dev using mutex lock.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>
>> Changes:
>> v2:
>>   - drop mutex in snd_jack_new
>>   - add comment that snd_jack_report() should be called in context where
>>     it can sleep
> 
> Thanks, applied now.

If you would be needing a reviewed-by-tag, you can safely apply my (it's 
missing in v2 sent by Amadeo).

For transparency:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Regards,
Czarek
