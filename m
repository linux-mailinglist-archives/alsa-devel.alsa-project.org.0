Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C06C51D973
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17DA1779;
	Fri,  6 May 2022 15:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17DA1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651844470;
	bh=Q2a3RSvep3x5j9mZQH8KW5Fs7iacClbrsTKrUX4TPrE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Df2fCb1pwXamlwQ6yDOo3fDRRF8d/p9FOgl221uBVfPFw/62xwr3kmWyHBCZqqT8E
	 DGRcLcl5YdxM5AK200UlHSVkP9oCRfZz3+6gI5MWsulTjQGISr95R520w4lxPScKjO
	 AvEuFL96CqrW5vR4iRvrHdAXl8vGn8g7ruegIi40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF42F80171;
	Fri,  6 May 2022 15:40:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BBB0F8014B; Fri,  6 May 2022 15:40:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 451DEF800F0
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 451DEF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ApX+cC3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651844407; x=1683380407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q2a3RSvep3x5j9mZQH8KW5Fs7iacClbrsTKrUX4TPrE=;
 b=ApX+cC3ztz/LvOoc9vWDmiseJ79OT2RcLQIy2tIg7HDY4qkouTu20yGO
 9hPrud8u4J6Wuu9QalnexF4jFO6cGCJqVL9T14KXmcLj7e/r/ECqIzebh
 /DV/7uTjiy5OQXZYEz/E3auyXK3MHmF5tNE4IpxEZrElAw2nbSTN4ODzA
 6CL8R/T+Cln5hrroeusQkR9YiMBxhKJO31CTcuxk68p5+t+L0Dgb9Abfi
 H+3XJ0voOHWkqojNXVRTrDbp5Po07w+MTAjPX/LAngpyfqTASLHcOfi3o
 9A5UaytzSYEnc5J7Z3cN6n/nEr3JoWNgMojmaYA7A4MsTrbGL46ZkYso/ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="329012554"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="329012554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585975688"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 06 May 2022 06:40:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 6 May 2022 06:40:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 6 May 2022 06:40:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 6 May 2022 06:40:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tohe1cH7Wpw+JUvnCl5wlKf/JIUzmoZGIK/DDNIe09qvmAJ1iv4fabvgTVq/AlvkwiXK4jVhqazioPxFEiu0i1f9FR+hxNAHzQw0FHW9igPFNeKU06yuxuU7izFRisyCqOvl575m2JRYOCqcmklO66NIe1tGZfTJ7Jz43p9Qo2zR/sGgfnZqLrtSy6/tInHemvLeXEGGHIixoe145Jew907hulISG50xz5ZBu0IL4dm7Habr2o5ryxLIu+yhkLMzB1EGrbAGGXEZ7xxjmpQKwLDHoZkK5qenDGxPK+ajkJxghW1lKXvXG4m+D/vwA3+SUN1MZ8cFxPty5/5+R/zcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTOUxLV9/In7qvjEJnW3XJVQPRulN2VNIA7CoMoOHPk=;
 b=a9nMcp8rvOVjJSSjYG0/8Na6AXtS3IiqVN9b+V3E6b/8slwJnrXz/uVgDaSLtoJa8wAXahVRaqFUwgRw1jOuccoxriaQQCDaZGA3DrjQ137f9659C5yxIQqosvgNmCp/A+uxwlUx2p1FoSIgM8diEojEPzyaiAw+/KjMcrvno6Lspv12syfII8576YUMAmF7Xen+QEJbsd0K1SogY+6evPwCW7JF6h4/nvclYXYTYtBPG+Wl+ez6tW4YQgZ/UFXTarJIF0Gyc7r2hcanUAieOvD0xYhUFJMY+DjGGqnf6q50Fsbs/Nym9GSqw73FS2lsBGHMquPZ5gveYVNqRqeESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BYAPR11MB3045.namprd11.prod.outlook.com (2603:10b6:a03:88::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Fri, 6 May 2022 13:39:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%6]) with mapi id 15.20.5227.020; Fri, 6 May 2022
 13:39:58 +0000
Message-ID: <4a808f4c-83fc-747d-1536-d276138e57b8@intel.com>
Date: Fri, 6 May 2022 15:39:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-3-cezary.rojewski@intel.com>
 <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
 <YnUev8Rs42xLLE6Z@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YnUev8Rs42xLLE6Z@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0320.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::19) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2aa02d5-7303-4061-044c-08da2f65e96f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3045:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB30454B905328CCE5373FEB5FE3C59@BYAPR11MB3045.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zptqedBWwgyqbRd3jfQHbXHPt9Gau98ZKGnxVkJ4sR61Y7EQJ+C6cpeegFKWFysvNjNyeUdIMmEHgZKKEjOdEer3VIx1wPWxPMudwm87IvFQphhVhnsBl1Ol+ZewbkqHBtXSQX7lOmgJn+lxIsY6POEDSe5L2yp2GJboqwf/95my6vaH+yVDppHWTgQG/tR5WeC2ZarYRapbP0bwPsO67SYLw23wIZQxGdMgDJiNXjICyN9Pt1rQN6G+dVM+lfY8bo2CijAKOCYBumFrnNtS2SJSy9nB0xLRXA0LU+XNXM8EuOfh8FMCERtCOM5uniu0yvP7TxDvJYwCfC2NQNbHNt9Kp2els8+fIDWlHbd4P5pgb55iTwPhr5jCQDu9z37iEG9wO2aGqCUzHV840qLFyCz6BNIF19eclBNSylJjdHY3ra016c2IJolxK+yXS5N8qwjd4aHjS+z/L3SO8bSVfdvevA/k47n0g0cnbOZrvdfCg8CBqG5f+XdTomZcjlxKyYZdAR2RKO9CoeLhhCt0mqgintLVHc/bJ/hB9fiZAjV6sgnL97nSJp7M2MZhqon5VClNWIdiSDpSV3FmXDuuHsQDOh8PVtF2w8i+m4qkZ616X5VRG6R4XT+72xI59IbFoDR6l0bOqnWWL3PX7eCGcOxGkRsKU1ULokzNDXG/oh0BMU/vtB/mpK1OSNHrDirvSENVN/5KMFBK+KgbgGxgJ87hrL5+CBZwr/SlP61Vxoc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(110136005)(26005)(316002)(38100700002)(6486002)(82960400001)(6666004)(2906002)(186003)(508600001)(31696002)(86362001)(6512007)(2616005)(83380400001)(36756003)(53546011)(5660300002)(7416002)(44832011)(8676002)(8936002)(66476007)(66946007)(66556008)(4326008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUtvSFp4YXNqNFptd20wVjY4UWZmYU5IeUNZTmovQWhXNGROYzhhUGhVdkpY?=
 =?utf-8?B?WFkwMy9HeExtNjE1eG42RUpISjhuQ2xCM01KYmdvaVJQNXRjRXE4NDRBQjBC?=
 =?utf-8?B?K0tacDE5VkxSL280MHdmdGZxVTUyeU9NKy9HUm9yTHBnYUY5QkI1QU5vMTZO?=
 =?utf-8?B?YjJGRDArTVRsZzZ0M3dDMnJNbDFOWmh6SU5iUXdlNE9ycDFVb0lad2FWeW12?=
 =?utf-8?B?TDlqbnpCYkYrYVpaWklSZWhaaDBLWkVsaXlERzJWYTk2b0RndHlKYUxqMGZM?=
 =?utf-8?B?MWFEVkw1ZUwwaGdra0kxUnhXa3hiRHYwS2dSdnJJbWtJU3RQUHRpQ1BSQ0cv?=
 =?utf-8?B?R1pyTmRtcDQyeFI5SmJONEJ0dkhxWkxhaWJEMVl0b2VicXVDUFpvbW5Va3VZ?=
 =?utf-8?B?RmZBbFBObHIwcGFhRjhLUE52TjkzMXoxWDQwZVB2V1FMMEdRREZWell4RlQw?=
 =?utf-8?B?ZWZORFF2NHU2ejZ0RjU5eHV2b2RuMUFXUlM2NUFvb2NuRnZjTkZCZDhGNFp4?=
 =?utf-8?B?aS9zSU5FaDkyQXZrNGlCTUV1U29zK2I4eXZKS2NUWEtkQjZ6WDQvVWtYaDhS?=
 =?utf-8?B?TjdSYUtoMnVnWXE4NDJDRjdrYTZiaGxmZk0yWjNYSjNobWdOM0xmdnhiVzN4?=
 =?utf-8?B?TkVwcnZKdWYvc1BKTEFIcWVxUVBkRnMwNmdxVUVJSjk4UWJVdm5LbStHNFkw?=
 =?utf-8?B?aXpDYU5SYzRjZm5VTVZMSlQ4VTI5Ni9yZWdwOTZNWnRzcVFkWWhmZXorMHlt?=
 =?utf-8?B?c09peXlYaGFjajRaSHNrVGJxSjNiaktrOW45VVh1VjlwK1hodkhuVmVobVFP?=
 =?utf-8?B?TW4yS2dFdjFYR3NUbGNsYTdoaUNYS1pjMktzNXVZRGg5ei9yRmFTRFRSd25U?=
 =?utf-8?B?Tm13ZGY0UTJ0c3IxMFFGNUIwVHZFazAxcDdXYjFrL1MrSFJwZFJtdnhGSFlE?=
 =?utf-8?B?dmhxVW9MemFpY0FKY3RWMFNRSUowNkhlRVBXMWkyY0dXeHdBY05pWUtxZ01R?=
 =?utf-8?B?WExyNThlbmJjTG5MbTNrMGtIS2N5Y3FwYkoxNjB5c2dpV2diNWowYW9ZTktF?=
 =?utf-8?B?ajYvYmJJV2RIZXNiMC9sbXlOd0Noa1MzdWxGSm5yNjZnR1labis3WEZ5NThP?=
 =?utf-8?B?ekdSSm5DTDBOTUJmbWIyUDB2YjFsUXcvYXE2RmNDN3VYUDBTcGZ2bTZiQm5h?=
 =?utf-8?B?Q3NET2dlVmJ3T2t5cGJFcUlMK1g4dVl2UjZ0Y1c0c1FVNUtadndPQ0x1cWF5?=
 =?utf-8?B?Sk5COGllNTNpYVdKdi9NZUQ2ckNYTHJzMFBMemJ3SGNIVHAwWC9pekE2djR3?=
 =?utf-8?B?dzUxK0kwTkZGeFFSZG1lanZ4VmhxdlZkUDBiR2QvRDRyU1lzcENqMUJ5MjNZ?=
 =?utf-8?B?bjFPMVJKekdOQnVjamRiMWRQOFIzcU5nc3JRcjZBNmpLd3V3dVRaaGU0REt4?=
 =?utf-8?B?UnZtUW16b24xYi9qTUJwOExKL0ZsdXBMOEdjU1RNMnZPSFFtcDMwbWN4Rksr?=
 =?utf-8?B?SFEvL2JzQnNhbFZZY3pUTnA0UjhrYnlmY2VRV0duT1RPcm0xTXZSZmtJcE1H?=
 =?utf-8?B?L0pJTDErciszdTJkR2JndmNyNFdkelNCY21KOCtjMTEzd0o5QkVONUZ6VWNz?=
 =?utf-8?B?empNY0w2T1BpcHRYcWhndEZIVm41LzJsM1o2ancyRCtvNitZVUxWamluZC9a?=
 =?utf-8?B?YThkSlR4MFpHUTczR0dJYU90M0swYlEwdlhuWE1jd2UwWC9tc2I0eXYrbkl2?=
 =?utf-8?B?aWxpSG5yMUxLMzFYYVpxWHoxSVR0OVlJdS9vQXkrSElGbEJyanhOSElBOFVE?=
 =?utf-8?B?Z2xFUG83eDVwRlZNTGNrbDZ1ZzladW1NRWczbFZMQVZjdjAxWFM2QXVwZk9p?=
 =?utf-8?B?K29HZjFYWXJiMU9ZYnJzZDViQmtjbkJmZ0VYOXBkMkhDaEJTVDB3d0lSOXFp?=
 =?utf-8?B?MWVhWExVS2lUN2NMTGJwNVNzQWhFSy9pOXQ0ZEh1SlpFNCtwSExERzN3YkJ2?=
 =?utf-8?B?dCszRTNGdXYzTmYydFhLckoydDhBcGc4SFREK1hwUHBYNUZEVEVuVmgyL2pv?=
 =?utf-8?B?bzBFaXp2ZitJU2w5TlhPSG1wdVUwWGMxejNvSjhCRkZTZXpEVTQwVnRHcWRS?=
 =?utf-8?B?dDhsWXhpeFlXRkEyV0xYZDcyMWVXSldwWTRSR1hKMHdPQWtDYkRoOC83N1lr?=
 =?utf-8?B?RGtFdjJaVCsrRWlITmEweU9tai9aT0pOUXA4RUovSy9MWnAyUWlHNUpmbzRS?=
 =?utf-8?B?ZFZERFd4OEtzUzBDWERWSUgrZGxUZW9vMkRTdUdNbS81czFlNk5JVENSczY5?=
 =?utf-8?B?VFdvU3FpSDlISkhqS250SXBGRmhFWnUxK0dhSitvZnlsdlBEc2JBQjIvYitB?=
 =?utf-8?Q?8WrUPOd/fT3TNnMg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2aa02d5-7303-4061-044c-08da2f65e96f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:39:58.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4dM9YtxaCbGs2pPc//CLuvGDf4tZs3vgnU8YtzN25ZEpJuTV3WIlWr+7j5TVEkt+Fqk34s7bz4UjxoPN4jN8H0lvItq4HZF1Qa70jN8cdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3045
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
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

On 2022-05-06 3:12 PM, Mark Brown wrote:
> On Wed, Apr 27, 2022 at 10:47:12AM -0500, Pierre-Louis Bossart wrote:
>> On 4/27/22 03:18, Cezary Rojewski wrote:
> 
>>> Add generic ASoC equivalent of ALSA HD-Audio codec. This codec is
>>> designed to follow HDA_DEV_LEGACY convention. Driver wrapps existing
>>> hda_codec.c handlers to prevent code duplication within the newly added
> 
>> I am surprised the explanations don't even mention the existence of hdac_hda.c
> 
>> I thought the series was about adding machine drivers, but this
>> also adds code on the sound/soc/codecs/ side which I didn't see
>> coming.
> 
>> I am not qualified to review this part of the code, I just
>> wonder about duplication of functionality.
> 
>> At the very least an explanation on why you decided to NOT use
>> hdac_hda.c would be useful to reviewers and maintainers.
> 
> Right, why the duplication here?  Can't we fix or extend the
> existing code to do whatever it's not currently doing which
> compels reimplementation?

Sorry for the late response, did not realize there is an unanswered 
comment here.

So, the rough list goes as:
- hdac_hda.c hardcodes codec capabilities rather than aligning with what 
sound/pci/hda/ code does
- merges HDMI (i.e. Intel i915 audio component) and HDA DAIs together 
whereas these are two separate devices
- because of above, implements custom search/matching mechanism for PCM/DAI
- cont. because of above, its header hosts private data struct, 
unnecessary complication
- follows HDA_DEV_ASOC convention rather than HDA_DEV_LEGACY causing 
misalignments between sound/pci/hda and sound/soc/ behaviour
- has basic PM runtime support and does not survive scenarios where 
resume/suspend + denylist + rmmod/modprobe are mixed together or invoked 
in unordered fashion between this module and several others in the audio 
stack

My suggestion is different: have all HD-Audio ASoC users switch to this 
implementation when possible and remove the existing code along with 
skylake-driver.


Regards,
Czarek
