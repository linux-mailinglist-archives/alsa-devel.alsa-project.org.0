Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41704462BF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 12:32:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F541684;
	Fri,  5 Nov 2021 12:31:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F541684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636111950;
	bh=trJnjraUIgPh9L87Cow5yXG1Ehljlq/hhwHOvpse/V4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jF2faZG5oAkdcw+o6Dolfi1YCgfm00iIOc+Ssxppj8e3yH4Glv23rFxiYuH/5q97H
	 WyKpjld/4ukscdy3l38X+kQc07Qb0HGtCDaNrfMBAs+OOTJH/JbUpXOH2wGWEoWsOv
	 UmtO5dADc1XnL9uhZ0ixWyfuNAQcEGtsskBYwuDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB55F80279;
	Fri,  5 Nov 2021 12:31:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C152F8026A; Fri,  5 Nov 2021 12:31:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B9FCF8012A
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 12:31:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B9FCF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="Nikq7RFN"
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="230607710"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="230607710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 04:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="730509641"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 05 Nov 2021 04:30:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 04:30:57 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 04:30:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 5 Nov 2021 04:30:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 5 Nov 2021 04:30:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSQ7T10/jcBbF/kKtMUzSESwEnKftpsWsXVF/asBppwzXrTtkYoNSoYZ0p9tBIuPDgOpkgaZFlPz7hUMc13r/CotPBMMi42gIlZSq/tV+uZn8SVLoVa53mo0fhZ59AnUpLhgCsBVNG/v6xUGiryjJ/yHofbjuNrnajHhG4CKFoVcyzD408So49GgsEbkT5rqj4uAj0clHzsA4PlCnv3whellDy+mM2QOq3JKpPTteijP3KJBAj6Gkwex2SSwbqm0uyQLxYxIpxtiSFh+23V12aZkOFcNJQ4u2ziSOsNjARmWGC+is7hMiotz47rC885AV45KPboVOXHS2BASr0AN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkDrXaD3gfKfQz2ji3Xp/nWGblTThXloZgXvtDXe8RI=;
 b=WkCYK/TI1XrCpBvsgU0tOLfKift1+drzehg6NsYl7c1tRjMFylebfIfyjhGJPv6tlhFqkZRaUtou5rwGi7Zu8TOnsoaB5UqjHykwBBDCOwVsgRagX1c1WE/G1w214rL+U7y0S886WLZqnjavFBUnjiNodY90B/1XBNJqdc9QIQTKIPRi+fEFjVZrUTsRUvt9WCyQfsTSOkgqI/J+qiYEq0qnCAsyj6gr8Y1MyYCLIESguX+E2FjMXS9qE8eRw+sLYSFQ1ZgO4AS1Uz7LabfdGIVOnElOLLr6joMEDR4pKddPIdlHUHZH0TeKb3kJp7vlWzJbpX3XDlmDdlY8VlEpUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkDrXaD3gfKfQz2ji3Xp/nWGblTThXloZgXvtDXe8RI=;
 b=Nikq7RFNfx5WIoIrLNh2oBAis0ncHwEx0Lo78ZnOTYzVDNBKUtv/kU9DxoKWhsbpGjxTS4IUPtT8pgMUN/G9ez4PR13UwMHD6sjkhcU9uEWfyxqmMxrJcsmKstLilWZ5RZrXQ6mX/uoQ22lL2hZhwlfZElsRRgIK8pTPwisyYcY=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN7PR11MB2625.namprd11.prod.outlook.com (2603:10b6:406:b9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 11:30:54 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 11:30:53 +0000
Message-ID: <bd3fbedf-6210-530e-2eb9-106a498bb23b@intel.com>
Date: Fri, 5 Nov 2021 12:30:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH] ASoC: DAPM: Cover regression by kctl change notification
 fix
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20211105090925.20575-1-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20211105090925.20575-1-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::31) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.111.254) by
 LNXP265CA0019.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 11:30:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30be003e-0e2e-4361-e1f6-08d9a04fb9f9
X-MS-TrafficTypeDiagnostic: BN7PR11MB2625:
X-Microsoft-Antispam-PRVS: <BN7PR11MB262534C1C50EFE81314E0BF8E38E9@BN7PR11MB2625.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xrFHXONTRQD5wrF+8T/YSG5qVWhlNLWTOTZloPyxr4r7JPb3gkxGPvRkhnWwbdkRkxJbocEnah6sM6evzFCK/jtqO6YBIHMfG/NS8wczMDsGtSd6YK0QacXOPg3z1dt86P5i3bUoeDQcthyL505ci93/s1OAyzgDk+v5n0okXJBfSOteitF0vLFST5pnRdI9JFXhcXmJ5doZDiOIFPJWAXW5kHTBrqgrfZ5O8Fr0utVv30bHtR+Ip0J4+4Gmgrw67Xuxc8y6ePMyxhy0S+Hdi7nYinvyPXIuK4NGr02Y70+GWhlgFkYDBYrdBQaEhkrZGZiVtO5wWO7vXFxw+tFoFh1c/udnaYJ7LwFm78CbszofYmybmr69dLQOrAc9TJySPtLrECtzBCZhHCK25yi7yuy1TJ9pHN5TgEfu8msM9sKM9/+mNkCIC61fYiml3ArXTCwGRDwEEi2HP6gVsGVhgzWh8FB+ZYo7yl/7rn9CANBZcApx7eibdEA084fQhbFkcXKOLJ2tknvJ6Ve6iitsR9nGfL7dkfa31kYP0UVgkkLhKJuh/Luq+vlzrW/oD2V3XnAFPx4FBs2VSUbOQH9r9iv06n0gxO5uGDAkOPVecUJFQGOUdH9yoCJWR6A0dN5u6vPY4PCp+9SapJFda+d/Yso+B4ZXlm+9smfRBwkPEF8ZspHfxS1vY5tOvzDP4vfaXzfWUXX8nAVmdeOmPMSyAhI37lgOKx4xQepzcV2aRts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(53546011)(16576012)(66556008)(66946007)(956004)(186003)(66476007)(2616005)(508600001)(31686004)(31696002)(86362001)(4326008)(316002)(8676002)(36756003)(26005)(38100700002)(82960400001)(2906002)(83380400001)(6486002)(5660300002)(44832011)(15650500001)(6666004)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnMxRFRPdmxvZUM5ZmZFUVV1RGdZTHJQMG4xMG9iN1lkeWhLZStpbllXWWMr?=
 =?utf-8?B?RWdPYitnU0ZOUzZYNVI1WjgzUFhOcEt1aFNsamJnTHhzWUdMbFhNWldIeWlN?=
 =?utf-8?B?ejVJS3hqQWhTRDE4cjF3bnNESlIwckluaE4xTHg0WitsdWJGYzFzSGtMQUJk?=
 =?utf-8?B?N21Tb3ZaVndNTWJyNkFqLzU1UVE2MEZlb01XaUE0OHZZd0FBOGd0YXNibXcw?=
 =?utf-8?B?V3BjaUJUMDVrdThHTDVleTFHTmc4UDBnNTU1eW1vcWlXWlAzVHlUeDZjeVJT?=
 =?utf-8?B?am1MR0NCbTgxYUM2QWxlNWtNS1FTeXNkbEdCTDAyZE95b1ZjTjZaVW5mem9p?=
 =?utf-8?B?VjlhbDgwK0RoNm9OTEh0KzV3NFZDR1RZbm9iMTlBeUVFdlBPcSt3UnZWMkp1?=
 =?utf-8?B?YTVndXc3OWhJZmJ0N1ROZGpuMldjTTVWSWM1L0VydlQ5MHE0RFI2T2dtdEtK?=
 =?utf-8?B?UHV5ZHlrTjVudWN1UXBrSDNqSXU1b21IbjV0RkhPYUdaY05xSHVmOUV1K01S?=
 =?utf-8?B?blJQRC82L3J4cFg5dm5BVmZRcWEvK3FoS1E1K1VkQndTYXh2NzRLbDY3Zmli?=
 =?utf-8?B?TkJjTXZiL0x5WkplY2tkeGNPR2psSnRXMEdJRk51bUdnY0MwWGhLbXJaYzJ4?=
 =?utf-8?B?WnBoNWxWQWxINEEzeHFOUE5TeXNjUHVLYTFIbmhQeXlhUUpzUkZ3blJtTnd3?=
 =?utf-8?B?eCtXcVZmSjJQOFNEa0VoOE91ai9xdkNRd28wQUpoa1BpdXZhTW5TcUlmMXZi?=
 =?utf-8?B?RjNTOUJja2JUYVJ3UjcyWDN6TjFtWXhWdG5qV1NzeXhLQ3dXNmx5V2dlYTQ5?=
 =?utf-8?B?cVNxTkxoQU96eW41R2dIQTZHRXcyK2FUTlJHZzZOMlhFUFQ0cm9qUWRhekoy?=
 =?utf-8?B?S1AwaWxQemsvM050b1FuWVpUQzk1RWVrTWYxUDFvSm9WUHdUTVdsTGpBNUpG?=
 =?utf-8?B?czQ4YzNLUCszcTAxMlBSbTJ5VlJBMWVmMmV3Ti9FcG96UVcrd3NiRVpwamRv?=
 =?utf-8?B?WHkyWHQ0MEhDN1ZwQmRTQWtOL3NjZEtKQ3FLamkrRWwrd3BrMVE4V0J6TzNa?=
 =?utf-8?B?QitvQVZKeGxJRmU1UkNXbnY5WENXSi95SHV5VlhKbWRud1BoYTdMZkFuMWhX?=
 =?utf-8?B?dlgrMU1oS0E5R09GVUh0KyttYWJ2SUxnUUZmcGRhN3g5cTZZQnFQT1pDZVEv?=
 =?utf-8?B?WFhhc1EzaUhabVA2bTBkcUE1b2VlN0tEZ3gzejZUcDJ2Z3Q3OXNmK1RvYmxM?=
 =?utf-8?B?VTVTYWhrTDlqOVdwajRtQUxBZmM3SDIvU2pQQVZidFZsYm9aU0FEek1vNC9J?=
 =?utf-8?B?RXE3TFhDOVV4Um9OZWdkam5uZ2NIY0FFR0JreEtiQjlQZWQ3RG4rOFREVThq?=
 =?utf-8?B?QVBUWEtVUkdHZWhBUllBMHkyakgwUm9va2cxWW5UdzQvbGRBelpxRGpDTHpj?=
 =?utf-8?B?blFYK2UwMGpwRDJ3RFVWbmVUMWNPUk9TdytjVE9na3hBM2E3M3NPWGpIKzlw?=
 =?utf-8?B?a092TnpUdGZ5TWw0Z3FlNG1xM2xSL3BNWC9kK2pWeW4wdEhYRnlEcGlodW1x?=
 =?utf-8?B?OGJoZWl2emZIa3VoazFkVDdwbnNxYkpCOUYyVWp6c1E4WVB0bkxlbEhNMHo3?=
 =?utf-8?B?dnJzK2tNQ1dyMGFrdUp6b1JSMXVYaGxzVjE3dVZXSlBoUXhicnhkSlhOWVVn?=
 =?utf-8?B?QVlQRXNway9hTG8wVWx1aXpEZFQ0MWFmZ1FidWx6NkJMZkhwVGRmRjVaQ2NZ?=
 =?utf-8?B?bTAwa21iMG4zckREUzUwbWFFTXR2SVV1YmJGMmU3QmE0UUdORzFVbEpIUFgv?=
 =?utf-8?B?SHY4S0R1aEJpc2VxZFRQSzdvTy93YnhEMDB3Z1lsNVdHUlJOWll1RUpzdnY5?=
 =?utf-8?B?L1lPQlBTbjIyTEh5Szl0TTloZTJRa1FQaFZSbHpaY25zbkd0M3ZjdFJMc3Z2?=
 =?utf-8?B?bThRUndReFBSdUpSeFJKZjhzZGJxTnpTNXBkeE16U0ZOSkN3UUViK3FrSEFz?=
 =?utf-8?B?REpra0l3L3NXUWh6VldyQTF6N0Fub3p3dStORkNXNVBid01YUnFnNCtBY1R2?=
 =?utf-8?B?SUZ0SWdqN1BENWp2YWZGVWxYTU53K0VPVDh5a25VMzdzSmZCam9UMWRrTS9V?=
 =?utf-8?B?WHJEUHpjTkFoUW40V1N0dDJhZ3Zocis0OE9pTnpKdGg5YktqclBvUUNkNFgx?=
 =?utf-8?B?cnFTdW1YLzI3LysyeFg1VDZ2eTVMT2NoejdsV2t3N29HOVEwT0phK1VRSnlX?=
 =?utf-8?B?ai83UFZPdElreHVabDY1Mkk3Ny9BPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30be003e-0e2e-4361-e1f6-08d9a04fb9f9
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 11:30:53.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrR5+Tq5gqbuGXoRCDW5NT5cEe6iA4HrkU3BZo7iF1HTRe2+LglFSMqkTK3C4M4cKcKtdWoe93E2uWH211QrS/xJn6EKj4YQ7TNeGm94Bgg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2625
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

On 2021-11-05 10:09 AM, Takashi Iwai wrote:
> The recent fix for DAPM to correct the kctl change notification by the
> commit 5af82c81b2c4 ("ASoC: DAPM: Fix missing kctl change
> notifications") caused other regressions since it changed the behavior
> of snd_soc_dapm_set_pin() that is called from several API functions.
> Formerly it returned always 0 for success, but now it returns 0 or 1.
> 
> This patch addresses it, restoring the old behavior of
> snd_soc_dapm_set_pin() while keeping the fix in
> snd_soc_dapm_put_pin_switch().
> 
> Fixes: 5af82c81b2c4 ("ASoC: DAPM: Fix missing kctl change notifications")
> Reported-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Hello,

 From my research I've found very few places which actually check the 
returned value of functions mentioned by you. And thus we could use this 
opportunity to adjust the kcontrol-put behavior according to 
documentation for all users without adding any additional functions 
which are part of this patch.

Board:
sound/soc/intel/boards/kbl_da7219_max98927.c

seems to be the offending user. We could update its code instead, 
leaving ASoC unchanged. What do you think?


Regards
Czarek
