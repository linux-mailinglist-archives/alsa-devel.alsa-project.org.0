Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBD645CBB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Dec 2022 15:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5200D172E;
	Wed,  7 Dec 2022 15:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5200D172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670423793;
	bh=goxGbskQSsb7aa3jWCEgH8QGFGtibdXVTmAGN53Orwo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9u03NeKe1eucNZRhAAeKwN1aF2znUQ7egUKZPu15wI4506oH+yEx+CvG3TZeKaPB
	 wc2mLyKnr5tEUakBlfW8+SPizvFJ6MlBgHaiC8aFnPcZgAMgS2f1Xh8nmO7qOvZP1d
	 NxQPpwEL7DsvLvFBu7RLbT+b3iqVTGb0XURAn4hU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB35EF80301;
	Wed,  7 Dec 2022 15:35:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 673DEF802BE; Wed,  7 Dec 2022 15:35:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48F39F800EE
 for <alsa-devel@alsa-project.org>; Wed,  7 Dec 2022 15:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48F39F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VJKECwrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670423731; x=1701959731;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=goxGbskQSsb7aa3jWCEgH8QGFGtibdXVTmAGN53Orwo=;
 b=VJKECwrbBVqteome4Bl2M5JPsc+PWyr8vxODRdnq/4LyXLMoEwggRtPm
 Y/1A4sOavhzj0BV5dkpO7cklrIDpSduf2DVOxv9eQuluumerjl9vkVezy
 Qu3nO2WL3Oi2rKG1eGGAOApzybEUmFa+gku66Rc9GvyulE1ag/HKNZx0f
 8ExDquCrMNKA+NxCGAGQ+xVcdpG1BRs6h/pgYorizs260TsH7LEQb/oUD
 zyvSmGGhuILOS+VHRNYqSn4LMaf19vvCYTnwXLqrFarGBXBUOhFCPZIil
 bqT3ucOh+qegATySA6JLg1PIGrBoz0DHRR/+XrRFgWkYMhQulYSZrPVUu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="315614813"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="315614813"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 06:35:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="715204504"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="715204504"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2022 06:35:26 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 7 Dec 2022 06:35:25 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 7 Dec 2022 06:35:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 7 Dec 2022 06:35:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Or+MwpGz8QDEl7d/bAVyF1mfVg9/Uk+uibF2bJHKWz92OPLF80+bb1X6d53dfwJI9oNaGrXoH6sVSqJyKzlOoTPNPx2vHGEcqmpmcMrwV+n4eopeIFI9eHy/vrmFD/l915HROnY3EjCJyjGz0z5h7LMfoYab76HYQxpxxBCFX8aub9y8L8e63LQyj4SZ686BUXSraVPVIvUdxNAIDJYPIT17V/380qNQYFdwuulh6wKO+6IhbuERBeOrWZ4BHXrsHdewyG3uYt+nM0I69XfeHoNrfwYzepArnphUjYqEO/cPwzi5skSxigYBVcb5RUqUTDOLCPLUZSYOrbxWwT1hSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t88+yS306lZ3LBMtkZjJsI7uyd646nb/RN39eKoOhUo=;
 b=gnb3+Pg4xVNdhGpjMkAV0/LwvLPqBtBuYEKDoqeFuqW1MZiLG4CV2m+Se1umdsd60Uyz3K5TJaldEXo5odU5+N33yXNpWDdHrpSRLirDkgMFC4Dp76U0IkbIRe0liNhibx3SLT14tf5i62q++lpzelQgtuEw453YGmh06xaC8U4L8ETJ4j6SkCZZyfrFCniKoB+4ZtM6fdjsEh+hsyvBc3abpLibS3mWPFm+8UjL2fp6o9Z4Dv+EU/IgC2PIXRLWJuRQvWyhX3z6oNZwRVo9S3zNeNNk2QkTOFhKiBhSmctTj5e8C0dfvYcbGpdyYrGeY7IHXa8kot3sTm51MXu3Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 14:35:17 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 14:35:17 +0000
Message-ID: <8868a1c7-8bfc-5576-09f6-52af96dd26ee@intel.com>
Date: Wed, 7 Dec 2022 15:35:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [bug report] ALSA: hda: Interrupt servicing and BDL setup for
 compress streams
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <Y5CjDmg5B/8J5Yim@kili>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Y5CjDmg5B/8J5Yim@kili>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL1PR11MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a976e49-a988-4c82-0b85-08dad860427b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hUzPHJ2ql5JzPOTj8zIT6OJv7tvqDLUSrutLs2Tpr66OMpD0KEX4UtioK+dQufHOC9884H33W7xT2gndBQqzRm5oJ3lJuPcqBOFerrsxRwKAbl5xadWvwR+0Z1trViLE7XG7QUxZBP3mVn5PVfwzgc/zTNUpHAUqH0CFLTe7PYBpe++CXhw3/Jwsv2tsn5hm9F5tW+uPfCBFwx0Oqv4rv78Y+n4MjZssGbZ7vL67NJaJ3Zaf1bZjywHnbHWiUOkcgXnN1g0TAzdMgGbj3h8kBnMLIWma8DRqhLZ0NlcStzZGSIKOp+OLQyMVsxyrwKjdYvasTNU28dKaTytMEEUvLfrOm5mJGZWzMl1KmUi36Afqn8jhGbV0AoaohgV/npvT5ORhve6cpA7K3LaJH7qQOY7tim+chHgH7xeYpVeoKEQroCavvD4W8ISRzIkw5T0LpzQ8bhmGR0ILVWcj44FdvR0Gr6fCPMMw+1rLkhNKAkdit8OvDFoX5entw1928/13r8KnuHPuVhXXYPJy+ye160zpUVXUdnrLQAAe+XmWMSytjHzdRXHBzFAnzhszjs9gGL5DA3FVaqOa7GPNuKgCCM6M0OuSnFRgzmIz3w2CVWPVl+LHKkhiemmgmxuwun66RAcjSbfpEnlOdJ4lOs6tZPRjzIvjKHgWCEZ97Js9bLL0qSeudoWxKzfodRIlYQgVFHAmG1CMyUmdlE64Qt2ytrFxcZRP29obMOiesxpZfPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199015)(6486002)(6666004)(478600001)(86362001)(6506007)(31696002)(53546011)(26005)(186003)(66946007)(110136005)(316002)(6512007)(8676002)(66476007)(66556008)(4326008)(2616005)(36756003)(5660300002)(41300700001)(31686004)(44832011)(2906002)(83380400001)(38100700002)(82960400001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTc0dTBvbTdlekRqVnVmVnltZGZta09MWHNQalhsS2p6NU0wSTBtRTZUSTJO?=
 =?utf-8?B?Z2RJS1MvUjltTGtiUFpwS3JHZGJ5QnB1NGNhemxkVmRwSzBGa2JORjdDUzNt?=
 =?utf-8?B?ZFZFR3RoMlpJK3NYdHMxaUJWakRkWWtaZm4xUHVsbm1BQ3MrOFk5TkxFcmFF?=
 =?utf-8?B?WUhacW53OXBneEdpUzFDeHc3T1h6Y1V3Tlk2S0p4ZDUxVVQ0c1ZUNk5GY3dS?=
 =?utf-8?B?NUgwdmNiWFNWeEs5Slh3MGZncjVBQ1UwTnBCU1hpNWkvR0dwcGxKaU9KYXJO?=
 =?utf-8?B?elF0YVE2bXRCUVg3bVNaempZZDk5SnBCbXltQ3dsNTl2OGpGb3NRYkFsNkJX?=
 =?utf-8?B?aEVhTDE2TnlqN2tqUzlQYTFJb3Nmd0pTN2NrVHlhd0hTc0s3TkgyaHIzZTJP?=
 =?utf-8?B?RVFxbVZRRDEwR3NUY1NrbGt0U1lVd2xnSEdaR3FqUS80dDlKNHJKUldnWGNp?=
 =?utf-8?B?NnRrRHJtdlBFVDd1d25Cc3hGWG53VUp3UTZNTklzQjJ6bnlwYVBUdkwyaWFl?=
 =?utf-8?B?V2ZPeWpJMFRKM0d5ZHQydFFnZDF6NG50Um5GdHVSMHNJbWZpNzRheUE1NnpY?=
 =?utf-8?B?eTUzVXJzMFlVbi9MTVRoOHFKQjJ5dzVFL0VBK1cvUTFuaU1JNzF2bU1kdE1j?=
 =?utf-8?B?Ylp5SEdsZ0J2MjBSS3JmWEVhKzZDWDdUMi8zVVpYK1oxVnBPbExlTkFoZHJO?=
 =?utf-8?B?MnhpQVNvVmZsZGpFRkVDSGNQeFFrRGJoa0pPMkVNdi8xbUhPaEVMbXRSOUM4?=
 =?utf-8?B?akxMWmh2c0FCclppQ3VxaUEzbHVuV1ZaS3JORjI1NFMzcGNyV3NMMkg3ZStN?=
 =?utf-8?B?R1VNdEE2QnpPVUFLWjBCcHhZWEIrd3FYVThKWFpWSzdtRzlXMkx2bnNHYUhl?=
 =?utf-8?B?MCtJaVh0WnZjclQvRUpHSHBFenVnR3BTT0JldnNJZVFtWHRXMmVyS3R4Z2tD?=
 =?utf-8?B?QlE2dlJROW9DVEM5OGROQmFGQi9uY1VlTi9MWFI4dHZ2cEVZY3NpSmg2enRy?=
 =?utf-8?B?cTd1dldwMjVvMG5xeElWMmdJdXZHeWRKZHE4ZGsvWGdTTG5IOUIxeDNMV2lw?=
 =?utf-8?B?ZGRCTERqN2x4Q2dmbUs5bzVKMUtJWkV3b2hDSkFVUFZUKzdlOGx2QkZhTmkw?=
 =?utf-8?B?WGcxNXMzbkNWSnNWMFBBa1lhblEzTGE4KzUrYjhQOFhxTVlUaG0yZ3J1anNK?=
 =?utf-8?B?Q05nTVh6a2ZxZ0FDamxCVFJBTkZOMzZ0S2hxNkY4WS9FV01KemVFTk1FN1ZE?=
 =?utf-8?B?SFRtNFhUaWpWUXhxSmdzQjJKVncxaGZpK0Voeit4MkZrOVZ0YmpYTUxjc0dj?=
 =?utf-8?B?RVdYMUJWK1luakxxNXVlaWhudmZrRkdJcDl4MDR0bi9lUmx0M3c4Q09pZmND?=
 =?utf-8?B?bXZXc3paa0hiOEkyVFUvWmFhSmp6cWw5dnZPTDBGcUsvZHNwekFnZjIrcG5M?=
 =?utf-8?B?RmFZME1XUFJGR3lQcEJGV1hLbzl5TFN0eUVZNmJKdVY2YmIwajRlSmlkbXJp?=
 =?utf-8?B?eXA2clRpWTBTZmdQZ3FYRkFuR1lzcVNIeXdDTGY5S2d0R3hLakwvaGIvQzJy?=
 =?utf-8?B?ZGEyRm5sSHFvRm9DaVBCK0Y1N1IzR3FJVmxkb1JyTXpVYzNrZHV0Q1pIb2po?=
 =?utf-8?B?eE03ZWNKa0xUTWl1bzVIU0pLMXRnOGtHYVBiajJybnl2dFhzZ0lXdm9SVjFS?=
 =?utf-8?B?eFpGT1diK1U0WU1MRHZ2Q3d6NGd1U1FJdmZ4dXA0N3JtQndCSGE4bjNrN2VY?=
 =?utf-8?B?MWllbElLVTRmVUg0SkJNS3EyVTRYU0pmM1plMEhLV1hBYW1OSm9ac2F4ZTNR?=
 =?utf-8?B?Sk9pMzJwbnl0SHJxVmZwV3JadmE5VEpJaVFzT1VqUGI2dW5xVUczbXNvY2h1?=
 =?utf-8?B?VE1rMThUNjU4YWhXWXMvK2tsR1ZSOWYrNzAxTVVPRDNVcWsxd1BxTkJKWDcx?=
 =?utf-8?B?bU8vSnFtNVFjUVhobThaKzk4VTIrcUY3V2dTb2k4ZmwrU0VMbmIvVFJjU25h?=
 =?utf-8?B?UzVwMmQ1Z210SDdmUXpGN1pSODhObWJDdzJKMjFTNkFaUm5WQ05XZmpzK2Y2?=
 =?utf-8?B?NnFQdFZRczNUNGhMeC9Zd0g0dEM2SHhkMytCckdhbHVPZVZRWDZ3Vm05eE9u?=
 =?utf-8?B?SFQrOEYrUXM2Um5JUTZqMUtBZEFjUk5hc09XTHVpcnBQV3JJSmFzTzRyU0xF?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a976e49-a988-4c82-0b85-08dad860427b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 14:35:17.2666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cEwBJ3dbjEkb9BWYBjnxeiusTkLvXBYrTNlAK2S4xMA+f6hnGtyMe5w1BUtbL4n2CtyLwhkwe9DziDIA0SN/adK1OjxJ7/NdQcUsNDaGiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org
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

On 2022-12-07 3:28 PM, Dan Carpenter wrote:
> Hello Cezary Rojewski,
> 
> The patch 3e9582267e3a: "ALSA: hda: Interrupt servicing and BDL setup
> for compress streams" from Dec 2, 2022, leads to the following Smatch
> static checker warning:
> 
> 	sound/hda/hdac_stream.c:544 snd_hdac_stream_setup_periods()
> 	error: uninitialized symbol 'dmab'.
> 
> sound/hda/hdac_stream.c
>     487  int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
>     488  {
>     489          struct hdac_bus *bus = azx_dev->bus;
>     490          struct snd_pcm_substream *substream = azx_dev->substream;
>     491          struct snd_compr_stream *cstream = azx_dev->cstream;
>     492          struct snd_pcm_runtime *runtime = NULL;
>     493          struct snd_dma_buffer *dmab;
>     494          __le32 *bdl;
>     495          int i, ofs, periods, period_bytes;
>     496          int pos_adj, pos_align;
>     497
>     498          if (substream) {
>     499                  runtime = substream->runtime;
>     500                  dmab = snd_pcm_get_dma_buf(substream);
>     501          } else if (cstream) {
>     502                  dmab = snd_pcm_get_dma_buf(cstream);
>     503          }
> 
> dmab is not initialized on else path.

Hello,

Thanks for the report. Perhaps I should just do: s/else if/else/ as the 
situation with ->substream AND ->cstream being uninitialized is invalid.

Before support for compress stream was added in this part of the code, 
it was always assumed ->substream is valid.

So, either s/else if/else or append:
	} else {
		return -EINVAL;
	}

Takashi, what do you think?


Regards,
Czarek
