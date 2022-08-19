Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FD2599C0D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:36:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A79D15C3;
	Fri, 19 Aug 2022 14:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A79D15C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660912611;
	bh=YnnXvSCuFrFvVF7d0yD78zJO3WWug4R3EQgiFUhxa+k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r6oOYunLfm02U/sICLEjF30z6kuJRJkGe+a2049F4hV28n8LTcKaut2m8MtKLOK66
	 8HiQPKI6zzfOSLfxLAFiBd1KTVLGQbPUoedJPMP8pJaeQC5nqvUkC17OMkJPpqjoHQ
	 61Qg5FdbEeFupfYXXWfORqENpWQxPyMzCUTcSaek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80A36F80217;
	Fri, 19 Aug 2022 14:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABFCAF801F7; Fri, 19 Aug 2022 14:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4B3EF80128
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4B3EF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AO6L4oam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660912548; x=1692448548;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YnnXvSCuFrFvVF7d0yD78zJO3WWug4R3EQgiFUhxa+k=;
 b=AO6L4oam0a1zx2AWgXPk6M35mkgM+U2GYCJVr8CRu/+LyCiCim45FWUX
 ZO/ekaH2RvirRaBsLdSj8tC13PHtENzYnbgZNfIt8V/MaCl7I442+nm1T
 sBjE2TtGUk/ZsXFNw+3e3HmAUTV4eKy/hzn3BBFs6mDo8wUREco2XlTlj
 G4Il93NrcBIQwaJ0B0Lzw46jLsXfzJdeucj4gLth2thwB3o8by0KZerDm
 U2iP2E6k8hz6YoMi16pEySuWYkzTAbd5k08tJIlvVx5DqikSllGvkmHiy
 jULmfmd0+jR3Ic4ttJ2+WVcRkAVZx85GQ4eQ9mzjKH/LaBuejnRi4++RA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="276046102"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="276046102"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 05:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="584646888"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 19 Aug 2022 05:35:44 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 05:35:44 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 19 Aug 2022 05:35:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 19 Aug 2022 05:35:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 19 Aug 2022 05:35:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd7/MvgX7BPH+g3JmK0bTL9QRnYD51Lb76qP+BRE1Wn8zNAQuvI3wVU+OwZiJSny3Kl/RWp779QygDFwJL7odFnnC2mAAvfzfIXuc0edr/frC0JoRyBkst6DDFInI+SkePFgf2HdRUwbNh3InkjfksyR3aKD9V5tEqPyExu7C2Yx6KSaMmZM9OuDgtLZhDCnUCZkUu77bzV7KEo+8Z/aKdE9uD1Y1WF/Uz8s3yA34qGDvFbPoBKoxCHUk0S3CC+P7M/N4AZcu+s5a7LsXmwhj2RTasDOCrKK7tG+xjpAQy9E2JxpkgIsBdlXVKwqAfeKs9YMlosnYXiCV+MA2rPKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9dIZdtG32YH5M6R6euKMJ0kBUdqP7YizLtNZcUG88I=;
 b=bw88nWkin94/oOdcrlDkDmE1lRgU25dc0KjuJxrinOqqAS/vyj5L1N3PxjGCD4CYvAIxZrPSH73XowhsERy2IYLtj38+xcubm3ylEgvlHdGyG+LpRYLXk3vIE0SLxM1cBT+TVtCYPjvDwtgeD88LEndEz9hSQosKIqHF+lBTVHAyIgLiiXpMj4DP2+st0gOetL7zJ1atZLp0zXLM2oLPErXVyCVvtUcLH0YLPFNkC+0hFy0oyrTpBN1vLuzqM6Fg4AimWxkYtk9xHhK1uy+d3oc2iddgzfZBW4Fjlayt+PViU6zFd8L4faTvJiXNdt97ci/VL20+NkMbzMhtjfdpZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB5110.namprd11.prod.outlook.com (2603:10b6:510:3f::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Fri, 19 Aug 2022 12:35:41 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::75e3:4009:a5d1:c3ae%5]) with mapi id 15.20.5525.011; Fri, 19 Aug 2022
 12:35:40 +0000
Message-ID: <6468d5ef-791f-4257-f670-5777d9c7142d@intel.com>
Date: Fri, 19 Aug 2022 14:35:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH] ASoC: SOF: Fix compilation when HDA_AUDIO_CODEC config is
 disabled
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220819122908.3563930-1-cezary.rojewski@intel.com>
 <Yv+CozZ4IxklQaTW@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Yv+CozZ4IxklQaTW@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc4294a-4ded-462a-8fec-08da81df5391
X-MS-TrafficTypeDiagnostic: PH0PR11MB5110:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZv/7Ur3p4gIfO9xwAeGCnp2+UBgcOENVjblWmlv4tFQHsRSqpc5X7D+dRxaknTS6/V5spIZK0th7savfmu3JF7I6Ca+CRNR/QEv+/vWzpydPtVjOd5GaGAWJxHud/PxLlJse4Gi5LqomIG1O9z4PKBLhVBH6Jx4Gx6Nbwp1b+hM9l+mrBlvzb9lICPh7go6A+m1FB+e4RCcpVYq22O0Sv47WrrBplo1hlXvelhArj4fD6hYFwlmHtApSlYXhW9vko+rplhI9W5lgyJhYkgJ3EKEBgU5Qg39kRDBW2VQvKuTv/EBMtOL5+An0EqS3P9i/9jsANDQmKt2MYjMVxnu/vFqXwoZbOfLBzuJUPKchTRVO5j6OX5IayXeGP13i7I5L2eRcCQxCU17AJCM49Mqw46c3MqlC8f+BsebVEq3dckWhD9i2oc5bArHrVdM9pzDpSF+k1MoXuSDbJoCRSxjIwZqFa+c56W5gkzyzRHnab84kIH0DQA4yNfpUJmjNXDq182aAe3ESJ8q4IrfAGZnN5IgQ2lJtVFgTIlM+OWtSV+HSXczKLKjiEaodArjHMJ9WLvC2LfhG56KWiVwcqXgm6msOizlHfynUzO1n//TfxLUtjFe4mb3+pU5NJU55fZD3h6QBXpGMDOCiZ9cosGrw0Q7ceBcyb35p+tmpbyt2WiDGh63UxIZMN72Zqsvbg6oWORd5FfQ8nvfYeytjbHtN7DZudwcX/JEoG9PrW63esalDojWH0GzuG3UmNP3tC9eggm1UJLL3FUflHIICTkqFR7erB5O/UPYbkDZWyxbJOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(39860400002)(396003)(136003)(366004)(8676002)(8936002)(4326008)(31686004)(2906002)(6506007)(5660300002)(44832011)(66556008)(4744005)(36756003)(66476007)(66946007)(186003)(478600001)(6512007)(53546011)(38100700002)(6486002)(316002)(2616005)(41300700001)(82960400001)(31696002)(6666004)(86362001)(6916009)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERJMEhsSHFNK3p6M0F6dnl5M2RkNWhJWHNHL254VUJWeEUweHRhMS91MS84?=
 =?utf-8?B?RjMwZ0RQc0xlRE13OFhVT1M5RDMybG1jSmJtN3U3aWxvUXVkbGdJTVk2QWdr?=
 =?utf-8?B?SUE0U09jcFdOamZ1VzNtRzk4T0ZhdmlVTThrTmg1WWl6S1A5YmRlS1dybzlz?=
 =?utf-8?B?N0ZYVGNudHdJbytyV2FuVDFYZkc1NzREcE1rM2NmUVlCOW1na1RMbHdwOGN5?=
 =?utf-8?B?WCtBeG9sQTgvbkZKY2ZQZDZvQW5IVjhCOTk4V3dtQ1NFV0I0UUhoRHZwNTRv?=
 =?utf-8?B?RXcyeGNKRVpWeEYveVB6OUNLTGNXLzJvYnFxMzhIUHBIdGFnOVJyMEhhUWdM?=
 =?utf-8?B?YlNVN2d5V0MyQUJGdEhkSWZqbWZLVlhwaEpFdUR3R1Y5WTNzWDJtR1Z3Rmtt?=
 =?utf-8?B?UWl0T3FSa04xblhZbEx6ZitKR3FPRGs3UHdkYitrS1k1TVlubFRMNmxQRXpS?=
 =?utf-8?B?UjRneEcxczkwQnA0VXFaaE5KSU94cFRzUURvdlVSVjlxajlualVwaDl0Um8y?=
 =?utf-8?B?dVFqYmtKV1FicWJXc2xuQXlueXRZaEFzMEVkYTIzMkZKcXZzWmo0YjgrV1JF?=
 =?utf-8?B?UERQQkVGRkUzbVdQcUFCTmFaWklPSjRpYjh6RmlDNVhsUmFuTjRQam00N3ov?=
 =?utf-8?B?Zm01blpHdUMxajRsNHY1Nnp6ZEtibFZBSTRhOFlHeXpMTmR5ZnRIS1VIaWpk?=
 =?utf-8?B?N3V5TTNuMndRVUpQWitZTzdFWjRoVUlPemxHeDVEbVpicDJ6b20rY1VVSHdI?=
 =?utf-8?B?V3Zvb0x6bXpJMkUxOEFmelIyakl1M0w3ZDR0NW1FL285TmJoOGlIWEtMcHJD?=
 =?utf-8?B?N0lRdUxjczhVQjFUM0Rzdm4wNUhjSlViV2lUZjJkWUxqQlhMdVQrUlhnSmZZ?=
 =?utf-8?B?bTdpS2VaWUxHOGRrZlZHTlIycm9jY1Z2SG9TdlZleUlaWmYrYWk0STE5eFJ2?=
 =?utf-8?B?OEFqZ0h0Y1JtMXBwSkoyTTU1KzdRRjNEcnc4dEFSMTA2ZFIwMW5hUFJQTHls?=
 =?utf-8?B?NmdraklXdktVenRwMU5yUWJtcHNZNW82OUpOektkU01pM0JFRkdTOFdFMmc3?=
 =?utf-8?B?R2w0MHRsZFptWlBzQ1lFTjRkL1MyTldyZDhGdFV2WjRsd1pnOXhqSHFJNTdH?=
 =?utf-8?B?aitpYTNhRnAxcUpQRVp5WWNpbTc0Z0ZWVlhRUjZ4Mzd0WC9KNjZPTlFEZ29q?=
 =?utf-8?B?dkd5anhRQTVMekZmN2FxdFhDKy9DSnVSSFZGcWlCdTRZMFhsbHlCNkVXMFZW?=
 =?utf-8?B?aXgrZGlkRXY1TG9ZT2lOK3UwYTdlYm9Ub3QveTZYdlBWNXgzRlBrdDRxWW5K?=
 =?utf-8?B?bVduNDVQQ0hlL21mcWpmclZiQlVOb01NcisvdENwbzZ4dmVObzJiSmlFQnp4?=
 =?utf-8?B?QWdocm5SZmRhUEprbTBsQVQydXdFUkdlbGFLdnJjaElpbTJPWi9KSm5zTHg2?=
 =?utf-8?B?RnAzRml2Qk1tTzBxeWZtZTV2b1pEdHpuQ0w0NzZ4dGNLVjBVRU1DWkxpT0FX?=
 =?utf-8?B?ZnNBRStPZkt5MVJDVWp3aUVwejR1TERRYVY2Z0h6Q2dQdVkwakhaNkRvNXQ5?=
 =?utf-8?B?ajVKWVk4aE4wRU9LZlZTNFFxNTV0d3JMN0k5MW5iWGNtQndFZGcrSG1MdWpk?=
 =?utf-8?B?aUlCQTJma3VHdUlIKzJFNGpNU1p4VjJWWEEzMk9ueGNCRlA2Um1lLzd5VGdN?=
 =?utf-8?B?ejZPMVpHSDMxWjc5cFphYml5Tk51WDRsUEtGRkhPM2hVYkMrS2JrRm9sd1JG?=
 =?utf-8?B?d0V2UDl6MVZyK1hPZjMzQ015TWd2b3Z4UENYbzBLZkYvak0zM3NUOURwTUV5?=
 =?utf-8?B?UUZ3YXVBdHNuREJOYVZDNytDRHR4S1VlbGM4Y0p3NnMwdXMxM016Y0FUdG5u?=
 =?utf-8?B?UFA1L0JVQUl6RDRaUThld1BXVGxhelphOTJNTUt1dklGd0RGY25nd0U5UEZt?=
 =?utf-8?B?YkpLTVJJNSt4a2dpaTVGaTR6cy9zRG1ML0p1Qk5meThLZ1hjZjZWNHU2ZzZN?=
 =?utf-8?B?YmsyZy94OXAyNXBrTml0V0N5cTc2MzZ3ejQ1K2EwRElpN2FWakk0UzIxQnl0?=
 =?utf-8?B?WVN6WGV6WXd4MW1ET3dlT0dJdHJXcm5lYUdoSWJYRjI1UmtwYURFVGprUHhs?=
 =?utf-8?B?dVFuSjRyY1NDSEdrSkpmMUtnZHhaZ3pqc1FaNnpDd1kzOXdvZW42ckZCeXhv?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc4294a-4ded-462a-8fec-08da81df5391
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 12:35:40.8897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsmwdUxq4PWhoG7tdKwcigbtU4ADbgAVyozEMZPaPQeAYxPQFpGwMjQUHPNTX6m86WhayS3BlJD75UVO2rFCGPpSMZkQxMkg8Ggyh6iQJ4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5110
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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

On 2022-08-19 2:31 PM, Mark Brown wrote:
> On Fri, Aug 19, 2022 at 02:29:08PM +0200, Cezary Rojewski wrote:
>> hda_codec_device_init() expects three parameters, not two.
>>
>> Fixes: f2183b08c81a ("ASoC: Intel: Drop hdac_ext usage for codec device creation")
> 
> This commit doesn't appear to exist upstream.  Did you mean
> 3fd63658caed9494cca1d4789a66d3d2def2a0ab from Takashi's tree?

Indeed, thanks. Fixing as we speak.
