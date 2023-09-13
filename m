Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 559F879E1EE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 10:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9304A950;
	Wed, 13 Sep 2023 10:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9304A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694593444;
	bh=SjPTZVyv3WlBfYqU0HeAXvAWlc0YNsAj9xgPscJtUuE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h1hUwWPM+z86I/H4LKq0+qwVZkrcaC5EvPWMYDV97d5rTex6gGOoUwzewsb9IBtJF
	 y/flQjMKNUFHsYQSuIl2S2wX1Mqgdm3Tmq/Jf6gJ1GCCSKJqGWiozbS6k4drAOTOgi
	 cRChEOUVkRhrVyz4D0Syp/CGKXchfva1v1BOfKF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFE0DF801F5; Wed, 13 Sep 2023 10:23:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C42FF80246;
	Wed, 13 Sep 2023 10:23:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25905F80425; Wed, 13 Sep 2023 10:23:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D87BF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 10:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D87BF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZCq1/Hp7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694593387; x=1726129387;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SjPTZVyv3WlBfYqU0HeAXvAWlc0YNsAj9xgPscJtUuE=;
  b=ZCq1/Hp7qgH7BjBTh+9IzD9HRPtOix6ju5Krnm5CQY3WDduw3b8O3NOZ
   rYk7qRBJKYSDqjIAl6NG2OeKNTpQ58hAQ570WZzSQn2n7Pk28PtsaAZrK
   RM3gWHSYz0HjY/9IKZ+4L21HCv4XRizT7I3gwLDqdKB6nLYqTPSKluDVT
   5f62ihy1SVvNDxnWTZYvaDop48mPADMJLOBWrQHzqJ1q6Mz6rGf/8BBR5
   5HV8FPMMpsTULp28rKC7l6av7hInSiWkPOGTKW7kfwX0nuQk0MZjFkJDq
   K9ykzXJZczYrAfngmbci04tD6T45E7cwvXfBG3W+R62UhQDbA0oilxzdf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377510757"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="377510757"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 01:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="859174337"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="859174337"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 01:23:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 01:23:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 01:23:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 01:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFCr6ZqHmTIc+ezbnLD0MO+Fyo+qHEplODwUqMtv6L2PxVezGiqNy5+DBlfKhpK+ruJZVjBy3QaXYJxY2/9bba4Sb5C2bh/8UNp85UDDRO6yuhakh8YMPaWVJ02xXlYB4yEJ8aIY73Mq90EbX75UcgzQz04cRMm5jN85V4D9QD/R7eBrUBTF3CMX/GhG5iUmM19Dm3kzbblX5i92b/d/sncf3Z276mZH4hrQcojr78fLCnglH/ilhVRGlKMeCCJjQ2IMACX7tCsg4mn84xyyYZDyC5pxDy5zvJLCpthvVGMmchgNa9QejkF3TWC8rmJIaPrpoblUiCADsxpUY9wTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jv+gDfM3HJJEo/Gx9p/BMtvH65eHwpp0zbIAABSqu+Y=;
 b=Zx38G/Mrz68SXJ65WyXvNKzNWuJsGgGJuPD/Fb6WKNLm0aftGKqoWLxseOPe2iduoZE0pogs76wJmmB7YmXcLbfvue6v+KbfbJs8wexO9KbL0fOg1h1urdhmktMYbaRhzvoUJ3gHFotkhqWECPZJtZNkYe8uo46xchbvg+IN/vTa0VVE+WOFTy/swYqhA1Cme7H4obb50NSfOblMRA2ow6qUOnlfPvByIOTRUZgI4uWJiG/1DZMb6fYPL4GjAAJgYhMq64g7YQMwpM9NsSDX/DBGiIJQEDuWuzZnn/3M+T0Gge+lM0Chshz+ZlGsDNIooBMIqv2AM155nWjj313Tww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CO6PR11MB5569.namprd11.prod.outlook.com (2603:10b6:303:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 08:22:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 08:22:58 +0000
Message-ID: <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
Date: Wed, 13 Sep 2023 10:22:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, ALSA development
	<alsa-devel@alsa-project.org>
CC: Takashi Iwai <tiwai@suse.de>
References: <20230912162526.7138-1-perex@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230912162526.7138-1-perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0092.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::6) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CO6PR11MB5569:EE_
X-MS-Office365-Filtering-Correlation-Id: 77eb9e72-03a2-4450-e5b7-08dbb432a31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 7IzDRcRf62vpEcMP+Ju72UGbyRuz6heZi9HCinaciN/yEdYp1LBFwC52W5dpQUOEn5AXVVCmlWnyorYeOf6ZqdxCMbtPPEwzLaGptDvJ+3EqN+9rQhIFnJk/NWCgr5WfdduL1ov8Xu5QNTM81gdvUi2/ziI32zCCd3gCGPlugmr2yoYvb1pGi+dgKEc70bkVWvEdeXYMDF1hL5mbHn1AK8XWuT+Fvu9rHnPwCDXxxRlMM7q2scIlsll5001oVVanzqBOOQaRwavpTvkQwz3J2P4aUdsjf2jAGoyIvYhWkcz2GCuEwAjxzhuqrY4hvxCdrkLxosmVROBMSj14bCAKTH7QgEf7c1GZC3wfmKwRi2PaodjKB5eq774qlQaAmk1ru7Upv4q/F40+dCtifT5fFzhuIr5owiUqO4m5j238enOXr6pLXON7ojDqPndSkMV5oWvPQTpMlWUnxXP8a21T4Ce/b6/9ALQYChub70ZHz7LkZbpvGy5HZOzDqd0JU34Oij/L3r8ZQf1TBTS3CdN6Km/E4yXbNLhUDduUJygXHdSG0ZFRcifruZPy9yyswsoVDfqLocSpUmSCdqNlsdwKhqx94SEO15llck/UX/owBgiHf0oUTH54MjMJSBWInwKeXKWLoHt2/5wBSIPxgg7gWQ==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(1800799009)(186009)(451199024)(66899024)(6512007)(83380400001)(26005)(2616005)(316002)(41300700001)(110136005)(66946007)(6666004)(66476007)(66556008)(8936002)(8676002)(2906002)(44832011)(478600001)(6506007)(6486002)(5660300002)(53546011)(4326008)(31696002)(86362001)(82960400001)(38100700002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?TW5ZQ1FOUjkzRm5McTZCQm1ZYlNnaUtuUkY1bXk4dVFzL3RIdUMrbzBuTGlz?=
 =?utf-8?B?bVRXb01WK0Q5QVFlcGxWMU83N3pxU3RNK0pYUFYxUmQzQjZ1a2VJcGhmUG45?=
 =?utf-8?B?bWU1dGUvRngyMTVFbUNQaldKOXRNdVpwLy9lcVI0SVpsL1VPRGdBWXBSM05N?=
 =?utf-8?B?K2J3QVY3MWtXUHpQdDJxSWZPRW1zVDNJZ1kva0xvMjdDUmJSaFM2eGpWQkIy?=
 =?utf-8?B?L29ac0VsSHdlUmFVZ0x5TzJvdmFTQldQSUQyU0ZBUW53K01LSHBWblByNExB?=
 =?utf-8?B?R2NBYVdLclQ2dGcvNk9nZHVZOEYxUXJhMGJONUhSTjRXUHZhWEhldDEzOWE3?=
 =?utf-8?B?TDAzVGxTQnZTQ05WdDh4NnEzdlhyVVBvZGE3UlBUeDBqZnpMNFYyR1dNZkg3?=
 =?utf-8?B?TEc1YlR6YytMMmttdFdoblplYzJpZlB5VkdTbjk1cy8yTC8ydHBCeXErZVFh?=
 =?utf-8?B?VDk5M2pZTUlKUERWbHl5TktySEJvMngveC8xbkVWcTNMaCs4VVhiZE1RdmIy?=
 =?utf-8?B?LzJOVk81OFJpd1pSVzFSMVBFVU1hdTNBVU55OUJMc2V3dDE5eWpUaG9uWGFH?=
 =?utf-8?B?bEprNml2SnpNT050cDhOTHV0RzVuNXhGckcxRnQrMVV4cnRLWC9wd002a1VR?=
 =?utf-8?B?Z3g5R1BKK0t0QnZIdENlN2s1MWhxWWNIZ3JyK3hoS2NRS2pRaUJNWGhBSXUw?=
 =?utf-8?B?aXVKM21jeTZaRmRFZnB6RjVWdVpCTW9zU1lxeVRnR0JMOFV5bUphY3Y1Ukdu?=
 =?utf-8?B?M1Zxc1A4SXEwZTVPMHhVT1J0TFArbWpJajk3NFo5TDB2WE5iMzFSUzhOY1VD?=
 =?utf-8?B?RUpQeUtXUnhaSFo3Yi84WjFsWklyQ1pmREJtVm50ZHdqZC9ucXVwcnlFb09K?=
 =?utf-8?B?L2d6ZkRFRVlVTmRKM2J1WDN4VWN3aTJ4T0Q2MWx2WGFRL0ZjL2ovdE50anor?=
 =?utf-8?B?dlVwL3Y1ZTFtMHJJOUN0OHFQOWMrckQ4eEgvU0ZpaFQ4ZGc0ZDhqNUlrVnND?=
 =?utf-8?B?aGVtZEc3WS8rWE5hZkgveW9wNjB6T05hejA3UEV0N0xqVzBWTVNRaGtmVHRC?=
 =?utf-8?B?cHRlZDZBbFlyKzlSdSt4U0lDMktrMmNSVnhCN3VsbmQ3T05IK0IyRFpScFJh?=
 =?utf-8?B?c0dGcWFxdXo4dW5SS0lhU3RGdzUyUE40QjdMdzFvMnI5T2Vyb2RhYXA0SzNx?=
 =?utf-8?B?Unlxc3VQSGZBdWNJVlFycmZiSHlYQTllL29mQjRsZERDYTNwZ3l6OGJDS2lC?=
 =?utf-8?B?WWpZSDJ3anFRSHhSREMybjlRaUl4T2NCVlZXREIzcmV4dHBSMEx3Y2lVdGtG?=
 =?utf-8?B?bWJRKzlYQVlDYVhJOGxERnNlRXRZMnZNUkppVC9tenFXL25acHB5RjhXbllw?=
 =?utf-8?B?RU5QbFVPcHdkSGcydkNPdU0wN040TXFHWkFKbksvanlKelBWbVl6WXNNU2xo?=
 =?utf-8?B?SkJyY2xiVndJYURNdWJ3bzY1Vkd5WmtRRlZuMXhwYkZsdFJtOGVDNXNoYjBo?=
 =?utf-8?B?eTdSREh1NVZvaVhDaVFKV0l0QlJYY25VU09jQzFxaHF3S2JHdy9hNzQ5QzRa?=
 =?utf-8?B?WU5wY2FzclJ3b3ZMV0Jrb29FeG9mdnRnOHI1VVVjd2VjVCtXSEExVk5hOERQ?=
 =?utf-8?B?Ykw5VFIwRk9TdzI4RFBqZS80VUMvNUFXYVdFa1Ayb0piZnNKN1UvWGliczJF?=
 =?utf-8?B?YW1sUU9YcU5UdDNPMEpSN2tFM0QxZzVaV1BxaWtpajNDMDBMejlUcFpXYmtk?=
 =?utf-8?B?czU2R2dEa0dnbTZ5ZmlYME45djZrWU9EUytSNEpjN0Q2QUZ0MWlBcmVJYVJP?=
 =?utf-8?B?Wmp3Si9YVk5RTlVtSHl2TlVSWXNrZVEyS3pMd215MUZSZEFuWGdadWhTano0?=
 =?utf-8?B?S1UzVWV1dTlqQXl5Szdaam5pY1J3TVA3c0wyZGhCTmZFTnVCaWdJS2U4RW5E?=
 =?utf-8?B?RU5ZQUZNQ0Z1WFc3cVY2M2QzYzZpUWpPbW1yT0N1MHAyZGZzRW9nZUJYWXpU?=
 =?utf-8?B?ZVFXTEFZdm1CWms0dTdiMnIyRFFuOGJQZ1JGNW44bjJwT2YwQWdBeE1nTmtj?=
 =?utf-8?B?N2tHam8rZWRkZU03RkpEamhpVm56ai94azZOZjU2aUJnbWYrTEhMZXRReExQ?=
 =?utf-8?B?RU9HemFRbjMrcXhtYUZvaU9FT00yRGNnSC9DNUl3UDZkR25mbkNrSW05c1VW?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77eb9e72-03a2-4450-e5b7-08dbb432a31a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:22:58.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BOBTZEB5XewStdz3HEwr79JAOJEdoe0GsA7srm1XLtB5GrQpVcvJBBx5JyBBdy5Zc0L4WvZiB5HrpSy1D4kgrvHY6pN5LTsVEWHpRpu7aLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5569
X-OriginatorOrg: intel.com
Message-ID-Hash: AJ6QDRNV4CZIDD5UTYPSACVG3PY2KOPE
X-Message-ID-Hash: AJ6QDRNV4CZIDD5UTYPSACVG3PY2KOPE
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJ6QDRNV4CZIDD5UTYPSACVG3PY2KOPE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-12 6:25 PM, Jaroslav Kysela wrote:
> Improve granularity of format selection for linear formats by adding
> constants representing MAX, 20, 24 most significant bits.
> 
> The MAX means the maximum number of significant bits which can
> the physical format hold. For 32-bit formats, MAX is related
> to 32 bits. For 8-bit formats, MAX is related to 8 bits etc.
> 
> The drivers may use snd_pcm_hw_constraint_subformats with
> a simple format -> subformats table.

The code looks good overall. I have few comments and nitpicks regarding 
readability - comes from person who recently was digging through hw_rule 
and related code and found themselves lost. Examples such as this patch 
are good how-to references in hw_rule world.

-

The message lacks reference to the original patchset. I'd suggest to 
have it here. Either that or incorporate it directly into the patchset. 
And I must admit I'm a bit surprised by the lack of few CCs when 
compared to the original subject.

> Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---
>   include/sound/pcm.h               | 17 +++++++++
>   include/uapi/sound/asound.h       |  7 ++--
>   sound/core/pcm_lib.c              | 59 +++++++++++++++++++++++++++++++
>   sound/core/pcm_native.c           | 18 +++++++---
>   tools/include/uapi/sound/asound.h |  7 ++--
>   5 files changed, 100 insertions(+), 8 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 2a815373dac1..59ad45b42e03 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -217,6 +217,12 @@ struct snd_pcm_ops {
>   #define SNDRV_PCM_FMTBIT_U20		SNDRV_PCM_FMTBIT_U20_BE
>   #endif
>   
> +#define _SNDRV_PCM_SUBFMTBIT(fmt)	BIT((__force int)SNDRV_PCM_SUBFORMAT_##fmt)
> +#define SNDRV_PCM_SUBFMTBIT_STD		_SNDRV_PCM_SUBFMTBIT(STD)
> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_MAX	_SNDRV_PCM_SUBFMTBIT(MSBITS_MAX)
> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_20	_SNDRV_PCM_SUBFMTBIT(MSBITS_20)
> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_24	_SNDRV_PCM_SUBFMTBIT(MSBITS_24)
> +
>   struct snd_pcm_file {
>   	struct snd_pcm_substream *substream;
>   	int no_compat_mmap;
> @@ -290,6 +296,13 @@ struct snd_pcm_hw_constraint_ranges {
>   	unsigned int mask;
>   };
>   
> +#define SNDRV_PCM_FORMAT_CONSTRAINT_END (~0)
> +
> +struct snd_pcm_hw_constraint_subformat {
> +	snd_pcm_format_t format;	/* SNDRV_PCM_FORMAT_* */
> +	u32 subformats;			/* SNDRV_PCM_SUBFMTBIT_* */

 From what I know, we are dealing with u64 masks here. Why u32 here?

> +};
> +
>   /*
>    * userspace-provided audio timestamp config to kernel,
>    * structure is for internal use only and filled with dedicated unpack routine
> @@ -375,6 +388,7 @@ struct snd_pcm_runtime {
>   	unsigned int rate_num;
>   	unsigned int rate_den;
>   	unsigned int no_period_wakeup: 1;
> +	unsigned int subformat_constraint: 1;
>   
>   	/* -- SW params; see struct snd_pcm_sw_params for comments -- */
>   	int tstamp_mode;
> @@ -1068,6 +1082,9 @@ int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime,
>   				  unsigned int cond,
>   				  snd_pcm_hw_param_t var,
>   				  const struct snd_pcm_hw_constraint_ratdens *r);
> +int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
> +				     unsigned int cond,
> +				     struct snd_pcm_hw_constraint_subformat *subformats);
>   int snd_pcm_hw_constraint_msbits(struct snd_pcm_runtime *runtime,
>   				 unsigned int cond,
>   				 unsigned int width,

...

> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index a11cd7d6295f..f414f8fd217b 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -1404,6 +1404,65 @@ int snd_pcm_hw_constraint_ratdens(struct snd_pcm_runtime *runtime,
>   }
>   EXPORT_SYMBOL(snd_pcm_hw_constraint_ratdens);
>   
> +static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
> +				      struct snd_pcm_hw_rule *rule)
> +{
> +	const struct snd_pcm_hw_constraint_subformat *sf;

What's 'sf'? I'd suggest to be more descriptive here.

> +	snd_pcm_format_t k;

Internally I was utilizing 'f' as that's what macro expects in its 
declaration. s/k/f/

> +	struct snd_mask m;
> +	struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +	struct snd_mask *mask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);

So, the reason I opted for 'subformat_mask' and 'format_mask' is that 
otherwise reader is crowded with ambiguous 'mask' and its relatives. I'd 
  avoid shortcuts when multiple variables touch the same subject.

s/fmask/format_mask/
s/mask/subformat_mask/

> +	snd_mask_none(&m);
> +	snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
> +	bool found;

Suggestion is to add newline before declaration and execution blocks. 
Also, why not reserve-christmass-tree model? There quite a few variables 
here.

> +	pcm_for_each_format(k) {
> +		if (!snd_mask_test(fmask, k))
> +			continue;

Similarly here. A newline would effectively separate conditional 
for-loop from the actual execution block.

> +		found = false;
> +		for (sf = rule->private; sf && sf->format != SNDRV_PCM_FORMAT_CONSTRAINT_END; sf++) {
> +			if (sf->format != k)
> +				continue;
> +			found = true;
> +			m.bits[0] |= sf->subformats;
> +			break;
> +		}
> +		if (!found && snd_pcm_format_linear(k))

For my own education, why checking if format is linear is essential 
here? Perhaps a comment?

> +			snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
> +	}
> +	return snd_mask_refine(mask, &m);
> +}
> +
> +/**
> + * snd_pcm_hw_constraint_subformats - add a hw constraint subformats rule
> + * @runtime: PCM runtime instance
> + * @cond: condition bits
> + * @subformats: array with struct snd_pcm_subformat elements
> + * @nmemd: size of array with struct snd_pcm_subformat elements
> + *
> + * This constraint will set relation between format and subformats.

I do not believe 'This constaint' brings any value. Reader is already 
aware of it. Starting from the 'Set' part brings the same value with 
fewer words.

> + * The STD and MAX subformats are handled automatically. If the driver
> + * does not set this constraint, only STD and MAX subformats are handled.
> + *
> + * Return: Zero if successful, or a negative error code on failure.
> + */
> +int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
> +				     unsigned int cond,
> +				     struct snd_pcm_hw_constraint_subformat *subformats)
> +{
> +	int ret;
> +
> +	ret = snd_pcm_hw_rule_add(runtime, cond, -1,
> +				  snd_pcm_hw_rule_subformats,
> +				  (void*) subformats,
> +				  SNDRV_PCM_HW_PARAM_SUBFORMAT,
> +				  SNDRV_PCM_HW_PARAM_FORMAT, -1);
> +	if (ret < 0)
> +		return ret;
> +	runtime->subformat_constraint = 1;
> +	return 0;
> +}
> +EXPORT_SYMBOL(snd_pcm_hw_constraint_subformats);
> +
>   static int snd_pcm_hw_rule_msbits(struct snd_pcm_hw_params *params,
>   				  struct snd_pcm_hw_rule *rule)
>   {
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index bd9ddf412b46..69609e6aa507 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -479,6 +479,7 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
>   {
>   	const struct snd_interval *i;
>   	const struct snd_mask *m;
> +	struct snd_mask *m_rw;

Two masks named 'm' and 'm_rw' is confusing in my opinion. The 'm_rw' is 
used only in subformat case so the name could be more descriptive.

>   	int err;
>   
>   	if (!params->msbits) {
> @@ -487,6 +488,14 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
>   			params->msbits = snd_interval_value(i);
>   	}
>   
> +	if (params->msbits) {
> +		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
> +		if (snd_mask_single(m) && snd_pcm_format_width(snd_mask_min(m)) != params->msbits) {
> +			m_rw = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
> +			snd_mask_reset(m_rw, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
> +		}
> +	}
> +
>   	if (!params->rate_den) {
>   		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_RATE);
>   		if (snd_interval_single(i)) {
> @@ -2634,10 +2643,11 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
>   	if (err < 0)
>   		return err;
>   
> -	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
> -					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
> -	if (err < 0)
> -		return err;
> +	if (!runtime->subformat_constraint) {

I'd try to avoid another special-bit in the runtime space. But I might 
be wrong here and it's unavoidable. Let me ask though, why cannot we do 
the constraint unconditionally?

> +		err = snd_pcm_hw_constraint_subformats(runtime, 0, NULL);
> +		if (err < 0)
> +			return err;
> +	}
>   
>   	err = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS,
>   					   hw->channels_min, hw->channels_max);
