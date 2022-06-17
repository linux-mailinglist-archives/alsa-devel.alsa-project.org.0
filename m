Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B2F54F778
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 14:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D91331ED8;
	Fri, 17 Jun 2022 14:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D91331ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655468789;
	bh=yUpVtCRvJDaRrWWIZpmFw/Z5soHw42vAKXj85n5i/hw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=df3oVCuMi+l14sfz5Yy7RvJP97CW4rnNEWGZh8MEC7Oxg7MzXQ44Qdk9BLJQnlK2e
	 FVRZx4BIOoCCwzgSDtDgeEh5BZs8krRjFQn5yCaAqsauDC8PPIzgBMowyOc46R3pnh
	 DtB1ofR+Kr6z4EFII9Ux50tTqQGhZxiX568Uhm0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E54F80528;
	Fri, 17 Jun 2022 14:25:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 940D0F80527; Fri, 17 Jun 2022 14:25:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20C73F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 14:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C73F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fgRunmkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655468723; x=1687004723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yUpVtCRvJDaRrWWIZpmFw/Z5soHw42vAKXj85n5i/hw=;
 b=fgRunmkY4Sz+NMRY48w+07oUj5vNtjPvY4eoa9GrsAtJRwwONezApGFh
 4KVr0TWbVBjY6FTXuRJr1FI1qu0hcEc8wTfdNZjwozp5WQqniWor5V2C1
 GT6hV6/JOlMk1IoSxQKv9/QXL+IqPdpMamakIlWQ/wNokQfP7C/oT0aYb
 y8YPpYA/0HW91udiqJlps47Pb/1toi6RDh47n5wa9BWO/S1ZZyDO/R6an
 Q0wIDQ1t9vIsZl7yRi3V2dCL4ce/BNtfjZe+bGCOa98KZPBhzpdr4dJMi
 ljBSGybRjAmcGsRI7UqwSZUIrhaA2PymoJWgcMD4Z8ue8sxne32jQQFn/ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268191736"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268191736"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 05:25:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="713757548"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 17 Jun 2022 05:25:16 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 05:25:16 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 05:25:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 17 Jun 2022 05:25:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 17 Jun 2022 05:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1IeVxMIe3LnAoIV0nU+zkK/uO4lc++IwrvuBxxea8Co7jVkDQtjJEiS6QHmFX/XYCpqe0GlP1P3NCDOqJrr7pB4p8aw9Ql2XHawxLulzeE5sM1doMATInbD5Vo7oEUoVv1bt/YxmtfEX2I8gXGsmNLzkyaSXw4MW71rhAX51pbV2v/7cc31LBOgp/3gxm1m6vB/h5985u5gdEH+HQVMLKhTSHo8+I1V7yNjncDlv3l3JW89GonQjHh08LrXGbz+dnTgsWjD7buqmNtGhK1CslWwJ9OnZ8hYUvx+YhcoNweDuebWyAIDheCLlXwdfoSygjJ4bBOKckbzZgykHUxy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUpVtCRvJDaRrWWIZpmFw/Z5soHw42vAKXj85n5i/hw=;
 b=GHC9OiCGfYKgfGgZ6rBYdMLsvMpGXCfAHbtH0gxIXrwg0YjkeUs8aC6/4N3Hp+w4YiIDibS8QYd12PKFKby7GfyId5RS8VlmzH8pSaEVk5fZJjDGDj7n0VhUA7fq7erlRZ4sNwylZDBarxVAbuUb/AdrtoWTJUJtPCU95c84DOPnorioXt0KC9dfsTr8pUP1mUu6PGl01n01SmUch3U63yS9Vm+WJkS7MC+kBQdOqk+lPlFYeS8mY0mI6p2cLlHOT3MOWE31m2/F9Oi46UEpWDytuczo2VmFGMvlHxva9DkoGhhMi7+BNVAhlnnlgfh3jVA/iYWEg5kYsLLHp1OiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN8PR11MB3715.namprd11.prod.outlook.com (2603:10b6:408:85::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.14; Fri, 17 Jun 2022 12:25:14 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 12:25:14 +0000
Message-ID: <71f8069c-e69b-080b-5117-584f15f5e02f@intel.com>
Date: Fri, 17 Jun 2022 14:25:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 12/13] ASoC: Intel: boards: hda: remove use of __func__ in
 dev_dbg
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
 <20220616215351.135643-13-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220616215351.135643-13-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0033.eurprd07.prod.outlook.com
 (2603:10a6:20b:46b::19) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acd120e0-99b1-4ac6-6d85-08da505c6e0f
X-MS-TrafficTypeDiagnostic: BN8PR11MB3715:EE_
X-Microsoft-Antispam-PRVS: <BN8PR11MB37152D314E98B2ED631F9498E3AF9@BN8PR11MB3715.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tiD+m2ST+VsSziNU+DJA9j4b7yImvA5f6VDU+sW/TX1rjOeGu8MSzVJfRjHr2ofbLaMXwy6eXoRH/yR4M18E8aZI8LWqFD0I/dNOY5rSRmcOi4Pr7JAJzyYjysfY/moIuok0zDArb918/8pBBPJLkB5rp2uw3RSqlrJ6TVHYIwIFN//xCMJaUSFdYJGI5NAbBnbVQ98ZzO37oKzhEQNKcwqe95f+9KrRBXdRD0weg40/4qOfVhiUsHHsiLOQi9jWHOv/takusm0lst2chAAhjNtl+wPeQolleW4WlfleaI/Uii5sK6QPhTj96kasMihc30ogKBfnGvZPN8LxlLLMcCGQ0HHpT5nutwDK0u/cgac6mDbQDJXOxs9q0hia9QpcxMP1ZIuxhgugaiCn09wM2A53uvnCDKPbFWrGCAoyZJ4joEMlmLBUPJX6itUtrFixyT21gU3u6mftg0x7d4Rfe1aMignebIKcqRGwsSUzuNP/D2IwBlV0wLoVI1AqKcTzZyAYwEljLn188X0TsowEs0HJFjLRrl8hSDIxe1/2zDb2eoifyWFk77uIp1gh6c4hrjXaue3KpoEno5dU4bU6ddCcAspvaZKzdYGIjhQWTd3rdDtX4vT0YEIg844d0yFRi2lEbqqZ9bDYa02zTALwnmKdcXm/aHLxSf1+/62UAxbqHUzqXsk1hYjrHpk10ef3n7v+kCS6MKpECilPCwq/1EfwAfHksEjR8Vflpq0mFik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(44832011)(38100700002)(558084003)(36756003)(6486002)(82960400001)(8936002)(6512007)(5660300002)(2906002)(6506007)(498600001)(31696002)(54906003)(316002)(186003)(6666004)(26005)(66556008)(66476007)(4326008)(8676002)(53546011)(66946007)(2616005)(31686004)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHBwdnQ3Q1QvQTlnNkgwYjEzaVlJcXlremFWcTBiQkNwV3NjM01sR0lJMHYx?=
 =?utf-8?B?N3ZCL2tEOGhJcytXaEoyblNuT3BmMUtMM29IMnpkRlRFdUNQc1F3Z0xZVU5N?=
 =?utf-8?B?bExhT1dPWHNQMmIzK3dpaDhtcExKazR5bWNDRjUrdEQ4TUx6NFZsS0plaDhU?=
 =?utf-8?B?QUpiNjlETzFTV2s1VWJwU0pvbXFFaG8yRlpkQlJlQmM1S2ZGUG9VS3UrQUUw?=
 =?utf-8?B?MUxSS2gzNDBpT2IwQndibVJIYVE1QmJ6bXV2Q3JTSXluSy9OcnY3Y1RiOTY0?=
 =?utf-8?B?SlhaMmhzNmNuTEVFdmg0R0JFTnNTaE9aZXFESWozNm5zT0o0T0Z0bnRRaHdn?=
 =?utf-8?B?eG93WkFVTVZubWRYaGJsVkliSHByQUlWTW1PUUVqNEhHUVFpZjZRK3hJMWI3?=
 =?utf-8?B?Nk13WXFVRlliTnFoMk5TMnd2YXN1VWtmVU0zNTl6ckRpMGo0VVFyemlPNmJF?=
 =?utf-8?B?c0dGRjE5dnIzNVhWdm1JN1JIVU5SUHFEdTBic3IwQkppTnhaMWUvY2pSTWJB?=
 =?utf-8?B?cW53YzgxMkdqT0JUSy9lTjVWOExxSlZ3dXdLZWd0clBmSGw4M0crUVl6VTVq?=
 =?utf-8?B?RjRNTmN5bzBQeXhMZlVkVFkvaURNaERQc2pHdDFHV0VKb1dJUk1oeFRuanlS?=
 =?utf-8?B?QUo4RUdwY3loMFdDeTdxR0lIdlFyZkNpYWtOTG5ENmN0VlIzVDN3aE80OTRi?=
 =?utf-8?B?TTlobWMxRlA1SWxrVzM3OXpZcGRrSXJFQ3BxT25nbUNjc0Z2TEREQStKM0Zn?=
 =?utf-8?B?cWRRM2JBaW5lZ3Qxc3Z5WVROYmRuM3VPanlyRS9DYUZrUUtmSTlGUzFzZEM3?=
 =?utf-8?B?bmpxamNDVk56KzkrZk5yTnE3b1hpd2wvL1hYMHRybWwzN3JUbUpDOWFJWFI4?=
 =?utf-8?B?TFkreEY0VUhXTllUVkpPamdXYjRaK0VvaHcrSzl1eURGZjBxOC8rQWpkRWRp?=
 =?utf-8?B?Nk10aWRnOFVxNlJXMkczRS80eVFUMm1IODBQL0phOTJuUEpYV1YrQmhpYkhl?=
 =?utf-8?B?YWlvWnJZRDJkRG82bEJVUldYKzc2RUkxa0dZbTl2eVZoejVlUm1wS1kyNU01?=
 =?utf-8?B?Z0lmdU5iU29wMDZvWDkxR0pUc2REazN6RmZ6TUdwckhWSUt4ajdMYU1NdDNr?=
 =?utf-8?B?b05nTkNwS1BjaU5PMFBSSzcrZzZtM2VaYnlCT2FkVE9PZ1dUN0wydXllMnVS?=
 =?utf-8?B?TDFPRWx3ZVA1cG1CRFE3dTNCdU9XWTZDTzNJOWJMTloyRHVzMVYxNTFRZFVN?=
 =?utf-8?B?a0Iyekk1anpxOTJMbHlYUENSQXVtM3MwQ0JZMUlMV2hPOVRJNnlFOC9iZGo5?=
 =?utf-8?B?MlJka2pTZitFV3phU1paR0h4dkV6d3FFMllYRUllMjYzMkcvLzVMTlVuZEl5?=
 =?utf-8?B?NzExQm04NHlPZ1J1ZlFsZ01FR0RGZXlVRXM5dzlsR2VuOFBXYWFNVE5EaWxV?=
 =?utf-8?B?V21OUXJRdzJYaGV5WURoZy9hTEorckQ0OEFWYjNML1BJd1pVSDNrTG5VeW5C?=
 =?utf-8?B?d2FtMFhGbGppdkhIUVNxNUFTNHNYRUdVRXZFdWtjMXd6dGJ1VmQxMFl6ODJB?=
 =?utf-8?B?WDVoMExlUjZad29iRVJvRTBLQTJLTUhBNS9LcGFtRGJBVE1QakRVZmYyZWg2?=
 =?utf-8?B?WVRXNWRtLzdPSW5TUFJhWndTZlR6L2JzMlBlYk5zdHh4dzlSNHdvbmxLOEVR?=
 =?utf-8?B?YlZ2M205b3hmWHpzbUpQRVVnTldzTTZTZGxYbDdjNWo3NmkzdnFDc3pmbmpX?=
 =?utf-8?B?cHkyeVk5QkQ5SWZ5SU0veHFsN2Y4ZEhvQ3FaWHNZb24xUlp4WGVXdU5mNXMx?=
 =?utf-8?B?dDkrdkd1T3dHMUlGckUwOC80Wis0L3J1K0p2Y1ZXOWVuT3pmUzZIbUQ3T0xH?=
 =?utf-8?B?bFNaanhUNWRYQndVek05VStEOGtCNzhTYnFXdEhqSzZUTnpyV0xRZzRBOXVj?=
 =?utf-8?B?THZiMUVLTUgzZi9nODMwZUZ6Q1hFZVpqbFBaYzFoRDVXSTdKQXRZRnZ5dmQ2?=
 =?utf-8?B?TlQ3YmRYckR3VW9LM1pLcU1jcXdqR0lQUzFhbGZaVkowd3A4VlZWZ3FFcWNP?=
 =?utf-8?B?dGpwVytrNWhJQmtxUWZUY3ZXZmhkR25Ud1RLNjJMN2RwbjM0MlNPcFJVaUI4?=
 =?utf-8?B?YnJDdjNRUGFyV2pXWXpGTGc0cFphUk1lWDlYcDhVZFpYOGpBelMza0RBYTdN?=
 =?utf-8?B?L3JWSGdLbjJmaU5PTGRTTlh5dVJTTE9XSzBOQ3RjQkU3VVlzR0F4U3Y5OURU?=
 =?utf-8?B?ajBKaHN4c1ZOc0E5R2drb2h0Zk41VEQ2ZUw3azRHbHZZYUE4TzVMU1ZMNVR0?=
 =?utf-8?B?K2RYTTBHMFFwZlYwSzdSdU54Q2swcnUwYlI4VDY3Y2dPd0xzdHA3dUFpbzVi?=
 =?utf-8?Q?chj8ZL+ebGU7kE9g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acd120e0-99b1-4ac6-6d85-08da505c6e0f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 12:25:14.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhZF01hV81qmtyhuHwXF5c5Q2JCAK2XFkzoYRxS16MT2cNky1RaztfHXbfhZGcOpH5Q03YAh6NKdR1D8nCwtwFChECgAlbAb5+s0k1KBtNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3715
X-OriginatorOrg: intel.com
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 2022-06-16 11:53 PM, Pierre-Louis Bossart wrote:
> The module and function information can be added with
> 'modprobe foo dyndbg=+pmf'


LGTM

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
