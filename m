Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6C4514AF8
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 15:46:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC7E3E7;
	Fri, 29 Apr 2022 15:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC7E3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651239986;
	bh=ZDTVzugrvj9/+wJ+v9xQiT4etN0mOSz+jS3GwmB9pzQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N16DosFC9LuyjPCIJXOKT9uQTdzMSqLTmIDa3fDigHXiGyp6MhbRradPoWAWl8WWP
	 dd8YdSjKsq+CHXDkjUaCOdjURrwfd8M0sfMWSk4PE80EuoqVyxbkO854KbhDBQQBBg
	 0Qm+wbo3sF5BSe1t845f+MBb64NTMgsdXDsttgAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A75F0F8012B;
	Fri, 29 Apr 2022 15:45:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A6E9F8012B; Fri, 29 Apr 2022 15:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59BFDF8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 15:45:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59BFDF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YmguRYcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651239920; x=1682775920;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZDTVzugrvj9/+wJ+v9xQiT4etN0mOSz+jS3GwmB9pzQ=;
 b=YmguRYccK/7AQ/HI9GIuwSMv7rrcgbX896CYoTnrbMAtEsEMbjB++2aw
 2JOUEohTC4kXYozzTeU/tT6x4kFE7WFVkBlQ1w0eQe+vdSaRGOTX4O+Ew
 bn+4qFsnr3ckjObCgHLW7EsAYOUQRRCMz1bia7/12qzLQLWgV+8AhZStv
 cMN59MFHSUjozhs8fzgOQW0RLVQNz7Y8kFILYJgJgiS29tm8LjtFJq0Ke
 P72/1H/HU+DxZCqSsjmm9sZPYh1a4jjYciNfStpxVX8fkIU8MGrV1c4SQ
 vdAbFJ6gKKLqnle2gD6Fre5t/bF8WYRQAgub78VaWVhASK96FB7XQZ4am w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="266464872"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="266464872"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 06:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="630080947"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2022 06:45:14 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 06:45:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 06:45:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 06:45:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBGFkLCqPzbyrSRtCU6COvGsuu7KGFtx8hfFAkUg3U79h3O2FMZ5eguDx8bmWvWmJT9AkB/3vHc7IhHzCMCa5vrfkh/TPIFtfYUxH5zvP2NbutuRywF98rmNf8y8gb5Qo4Uhe3sdgEbUC7c7Oz8crkDDXpHS8aSzE7S7BVustwIkjVzhYbuZYwKl+Mvci6ToiBNfWIdL8CvRLcyGkP+uToifGO8CdL8CMdLszYMasovG3V9fUteKHxnGrs5vAkUfpxPdZ4toecJE0GFRDr4Eh5i7UUAChzjcWICXRtOTmc8v8xzytGdt4V0QoRyQbSMBy24pKcUJFf5LhqpnKIoz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pFjsgmYy++dIOgkqf64uuoq3W5iKlItd0VQtptamT1s=;
 b=fpOezpDwUACrZHF1veWV9vH6O61oc4vwr1Z73rGv2OPEsMyiXEFM7MRynMdBvVImd/gO9nCSF6UeMXFDF1pN6M/IEAFdBf9fQ0AHTysMfGF8rcZ1d8xnJNNZD9/FgrkQFFMqa3N52TE+NKYm/WGigHVwy69lIdv+e6REdUiFVH9AOjt1qT1Tz7BXIpQr+pHar+48miv2lNmFiRwhBdwlL9T8B0g7zyBS90Dq6lpr/hMT1KI7mETuCRCMtEca/x+8i53FebEqgEH5jkWyNSfOapqHen4gTuJASxUQafRuUoAhz7ZqZZbxBQ91HcD9/y4t5859ifeSpWVQ2mdXgtzDyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BYAPR11MB2550.namprd11.prod.outlook.com
 (2603:10b6:a02:cc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 13:45:07 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.023; Fri, 29 Apr
 2022 13:45:07 +0000
Message-ID: <15376fa2-317a-8883-263f-d7ae8a2e6c60@intel.com>
Date: Fri, 29 Apr 2022 15:44:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 12/14] ASoC: Intel: avs: Power management
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-13-cezary.rojewski@intel.com>
 <da55736f-61a8-dbbc-7253-7e3da70931d1@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <da55736f-61a8-dbbc-7253-7e3da70931d1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0340.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::16) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76476f20-28c8-41c7-4cfc-08da29e678d2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2550:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB2550FBB5F4CDB25B0D74E3DEE3FC9@BYAPR11MB2550.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zvtdtgZe7o3b4m0Ql4sVRjVAPu5gkpDADFcJuFh+I6CQdybbB3eR0ZUuN88MxLFULHDHHiRy0t8J+7goUgaCmE0JORA9pVtwVy5MTRbFvF1tbqsSXKpuwEEZPoyy+bs4fFyRvl8bBlQluswZxI2SRJi9lgnW0dEj3v826D/kvz5oR72MbblZBcNKRk2hhsb/P6pPVkI50ASZwrjUTIFpwmGdwdniLkCYJYkZ9aU0GblGnU7h4NaFtnDCO2JXlI52FqEQbzD4V/PW1kTisqqCTyYiUH+NemEL8CYd977gYrLabFoOaLR85xXxt8lkCXNs5HQrA0ZgxoE+oYdmcw29UEwC469trIHmHfmsFbnobXeuzG87e8xPTvxJQsOQtcz6v7puzM9MzOto2u02pQLHkJMe0R+/x1a+YHaDcp6RkojIcDUwt5+fZ3BtslKf1ITk2OZYyDqKFTvRkDwcZRxU0rZvl0iAk6pJzr5AWaxSKTZLYvuAMGKGjzQ8l5HmpdLKKYQ6fqVPVh2i1FGDRkJFz1kbQ+0zWjTgTgJSZRd0Tze826jZ1Ax9AqYsLdM3gs37yS8Z5WcVQP0PdohyLJ0e/AhDxzUQJiW0cEGXQ+ygIWemtD9MZ+U5UZ0rOVOvY1eN0BYbf8DTAe5V3OqTCAMIOIjN1B67vcGx51OHa9kwYv3KvGNgBQmGJLMFd+iAcoqqC9jUNcDIFhJ5/aDxIe7ySPkh3wzIT5UFw9apBKsJcKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(8676002)(8936002)(4326008)(7416002)(44832011)(36756003)(316002)(6666004)(508600001)(6506007)(26005)(6512007)(53546011)(31686004)(6486002)(2906002)(66946007)(66556008)(66476007)(186003)(2616005)(66574015)(86362001)(83380400001)(38100700002)(82960400001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHBjY0Vob2xzamc5MzQ5Sm1sS2QwSWwrUTdoaCtsdzhwMHQrUGdtVE9lRVdt?=
 =?utf-8?B?S3pCV0QzbGpObXVwc3VsRW03QzZyWlBEM0ptcGtNUXVtN2ZOU1h4ZXA3T3Vr?=
 =?utf-8?B?YlFtM0oyTUw0WFRISERndFBnK0o2VVROKzR3VnM3cWl1eGFBb3RsMmdwUk1r?=
 =?utf-8?B?Tzk2emxwQlAzU2Mrdnh3dzJtZVZYNnpMWGZEMjQ1ZmNyYmhhaGNyODlLMytw?=
 =?utf-8?B?eTdZRUNaeGV3WWJtZG1rL0JMM3A0WGUwNVduMDcya09JQzA1N1hWTHVCQTZU?=
 =?utf-8?B?MjZEVFlxSXhhK0RhV3MrbmJpNlBvY3d1MzExS3JOVzVybFl2ci95Z2tSc3g5?=
 =?utf-8?B?YTF4UFBjUEFqRU16MjBZZGV1eVVOcVpBbEtFVVhOUjl0SUxzZ2hkdGdmYk1H?=
 =?utf-8?B?aDdSN1djSmlFeEM3OEU3S3h4aE95ZVpISDBIanI5VW40V0N0VTIyRUw4QjB3?=
 =?utf-8?B?Ym1wNDE4MzBkdUxvVHArczJnK0d4blZieFovWXpDZ0J3bmlzZytySDlLSUsr?=
 =?utf-8?B?YVErWFMxbHgyZ1lzNXFsT2doZDBueFlvZk4rK1lCdUFmaURCZ0NYWEh4b3pY?=
 =?utf-8?B?Zi9hVEhsM1d2clJocFVDd2I0Q0Vub3l0VktvcWp6bXo0dFdEN0NyblVXN01B?=
 =?utf-8?B?S2tLWVMvWDIrWC9pVDZPb0ZxU2J4T09vNUxhYUd6aVFLeDNOdFlXZjhFelJN?=
 =?utf-8?B?eXlVY2FaRmpUU1EvZUFuOVpjV01iQ2FiVzNDeitkY3c0Yjg2QXhSRTNnSXFO?=
 =?utf-8?B?TDRsNGFsMnpmaUZTMzAxQzJXNHhGTDVkYVVDZERLa3pKMllmWGRCcno1eDZr?=
 =?utf-8?B?dWxEaERFbnJaZEhwc0FaWVhLc1FBSnZsN2wrVlZ2aHlsUEtCRWtEMTJjclNs?=
 =?utf-8?B?dGdVb3RkRU1sVThqaUgwYjZUd2tjVm5uSjd6VEphU0MwaVlIM0hUNTdsYWpC?=
 =?utf-8?B?ZmpjV1Z0SUFrWjdvd29rc0dnS09hckhGeFYzQjJKSzRsNzkrNXJFVXZwQnBt?=
 =?utf-8?B?anpVaHJMd1RrekpyaHFydW9qUUxqTld3aUtGT0NTcnZWRXp3QnZ3Ris4SERO?=
 =?utf-8?B?WktOSy9RVW5QZytZY0pVMnJVRGhVYnZ1ZGJBbmcrbnBDRHJkMkc0QW5keTVm?=
 =?utf-8?B?aURBdi9PTnl5dTIyL1NVRDMzeFUraXJIY0dnVFNoVTlObWgyd2MwckVrWG9q?=
 =?utf-8?B?blZIUm1OOURVVGFadlRZSHpsR05WR2FaN1p2b2dpSi95VEYrN2VHZGpIWk83?=
 =?utf-8?B?d2dCa2piT1BTUHFpbEI1SldISWxFOGx4MkVCaU5WOGlFZGoyZjUzTGZWM1B6?=
 =?utf-8?B?eGZReWV3WnMyWmovZnlUcTlQc3RPNXRsKzUxbzlOdFNnYXR0MXBybW9PL25Q?=
 =?utf-8?B?b1lIZVE0OTZwcE5TWElUTjZ1c3RGRTE3SVhuOEw3UFJ4clBvTi94WnhhTGcx?=
 =?utf-8?B?NUEzcHVSRU42MlFzbUxONjhZSmhUL1REU2hnbklHOWFyUXlBdWljL1ZleWFJ?=
 =?utf-8?B?YkhtSkRwbG53VnZOWkg0KzE2d0h2QVBVY1ZQbEpGcSsvTlc5YlJML3FrU3dE?=
 =?utf-8?B?MEVFOGVRZ0Y0V0EwamE3Vk9hVkVaV1hhTldPQUwwSWtXdGRrdGFrSmpxRlBm?=
 =?utf-8?B?NUtDT3V5dFc4Q0Nrc0d6WWhnbStJQU5FUE10SWpOeC9JQUxSS0dxOEI4MkMz?=
 =?utf-8?B?amhtOCtvak5PelRzQUtDU24yM2tISFZFT21ITWNweHRpd21wN05GQVFWUHhW?=
 =?utf-8?B?OHMwcmtYNVU3QlhtRE5TOW82RlFOVmVRa2Q2NWYva1RmTWJuT0tRNjBmbnls?=
 =?utf-8?B?em1JazFzOVVjeTh4d0VuWklPQk8wbU1qYUlXZlNxQVRzS2ZYRW1JWCtiQjY3?=
 =?utf-8?B?NVVOTmZNMVVwcllzYWhxZE4wTjdVUXRXcWlXczlsSU5yTTVzWDYwRFpOWXFO?=
 =?utf-8?B?eDN2TVZyTTNRM2ZoZm1vNTRMQ2hvS1VtQ0FsVXpENXp1ZUF0OGlCbnNYeGQ5?=
 =?utf-8?B?N0NxcWJwdFI5MGJlcUlJRGduV3JHVmhuYVo0UEJqZHBLelRtSTJsd3ZsdE94?=
 =?utf-8?B?ZVFzNFdic3NDNGdpSC9FZWI0YURuZTc4MTRBRndzQU51aWlnVFVleEF6YzhC?=
 =?utf-8?B?dWhEbi9GRDlQWGF3d0RNZnRYT3drTnBSK25mNER4amVMcDY5WEFwcU9aeXlL?=
 =?utf-8?B?c0ljczhWSGp1N2JBTEl1Y3FMc213OFlKZzNzTWRsM1JZcnVucUd5SXdIRnhn?=
 =?utf-8?B?RjJsODUzdVVYaFdYRWEvUm1xTG4vRWxxd3R5blVtTWREOG1Nb2I3Rmpya3FW?=
 =?utf-8?B?eTRGV2FaR3Y1c0U3ck5vNUlkQ1pzQ0lTZmcrbWFHOW1UVnBadUpMV3I5dGUx?=
 =?utf-8?Q?pOCHchjYoMCA+scc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76476f20-28c8-41c7-4cfc-08da29e678d2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 13:45:07.5892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBgqWeFBS60pxjMQ9ah+sg1dDdr1L/amolnNJE4Ib+0QWV64IlbPZ/XCic21l4d4FA7UZv3CmtY4xMF1dwlf3sfk1y2Ib4xOpzYLEzUBdH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2550
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-04-27 12:18 AM, Pierre-Louis Bossart wrote:
> On 4/26/22 12:23, Cezary Rojewski wrote:
>> To preserve power during sleep operations, handle suspend (S3),
>> hibernation (S4) and runtime (RTD3) transitions. As flow for all of
>> is shared, define common handlers to reduce code size.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/avs/core.c | 125 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 125 insertions(+)
>>
>> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
>> index 93180c22032d..c2f8fb87cfc2 100644
>> --- a/sound/soc/intel/avs/core.c
>> +++ b/sound/soc/intel/avs/core.c
>> @@ -536,6 +536,128 @@ static void avs_pci_remove(struct pci_dev *pci)
>>   	pm_runtime_get_noresume(&pci->dev);
>>   }
>>   
>> +static int __maybe_unused avs_suspend_common(struct avs_dev *adev, bool low_power)
> 
> low_power is not used so....


Indeed, this argument should be part of the patch which introduces its 
usage. Removing in v2!

>> +{
>> +	struct hdac_bus *bus = &adev->base.core;
>> +	int ret;
>> +
>> +	flush_work(&adev->probe_work);
>> +
>> +	snd_hdac_ext_bus_link_power_down_all(bus);
>> +
>> +	ret = avs_ipc_set_dx(adev, AVS_MAIN_CORE_MASK, false);
>> +	/*
>> +	 * pm_runtime is blocked on DSP failure but system-wide suspend is not.
>> +	 * Do not block entire system from suspending if that's the case.
>> +	 */
>> +	if (ret && ret != -EPERM) {
>> +		dev_err(adev->dev, "set dx failed: %d\n", ret);
>> +		return AVS_IPC_RET(ret);
>> +	}
>> +
>> +	avs_dsp_op(adev, int_control, false);
>> +	snd_hdac_ext_bus_ppcap_int_enable(bus, false);
>> +
>> +	ret = avs_dsp_core_disable(adev, AVS_MAIN_CORE_MASK);
>> +	if (ret < 0) {
>> +		dev_err(adev->dev, "core_mask %ld disable failed: %d\n", AVS_MAIN_CORE_MASK, ret);
>> +		return ret;
>> +	}
>> +
>> +	snd_hdac_ext_bus_ppcap_enable(bus, false);
>> +	/* disable LP SRAM retention */
>> +	avs_hda_power_gating_enable(adev, false);
>> +	snd_hdac_bus_stop_chip(bus);
>> +	/* disable CG when putting controller to reset */
>> +	avs_hdac_clock_gating_enable(bus, false);
>> +	snd_hdac_bus_enter_link_reset(bus);
>> +	avs_hdac_clock_gating_enable(bus, true);
>> +
>> +	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused avs_resume_common(struct avs_dev *adev, bool low_power, bool purge)
>> +{
>> +	struct hdac_bus *bus = &adev->base.core;
>> +	struct hdac_ext_link *hlink;
>> +	int ret;
>> +
>> +	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
>> +	avs_hdac_bus_init_chip(bus, true);
>> +
>> +	snd_hdac_ext_bus_ppcap_enable(bus, true);
>> +	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
>> +
>> +	ret = avs_dsp_boot_firmware(adev, purge);
>> +	if (ret < 0) {
>> +		dev_err(adev->dev, "firmware boot failed: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	/* turn off the links that were off before suspend */
>> +	list_for_each_entry(hlink, &bus->hlink_list, list) {
>> +		if (!hlink->ref_count)
>> +			snd_hdac_ext_bus_link_power_down(hlink);
>> +	}
>> +
>> +	/* check dma status and clean up CORB/RIRB buffers */
>> +	if (!bus->cmd_dma_state)
>> +		snd_hdac_bus_stop_cmd_io(bus);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused avs_suspend(struct device *dev)
>> +{
>> +	return avs_suspend_common(to_avs_dev(dev), true);
>> +}
>> +
>> +static int __maybe_unused avs_resume(struct device *dev)
>> +{
>> +	return avs_resume_common(to_avs_dev(dev), true, true);
>> +}
>> +
>> +static int __maybe_unused avs_runtime_suspend(struct device *dev)
>> +{
>> +	return avs_suspend_common(to_avs_dev(dev), true);
>> +}
>> +
>> +static int __maybe_unused avs_runtime_resume(struct device *dev)
>> +{
>> +	return avs_resume_common(to_avs_dev(dev), true, false);
>> +}
>> +
>> +static int __maybe_unused avs_freeze(struct device *dev)
>> +{
>> +	return avs_suspend_common(to_avs_dev(dev), false);
>> +}
>> +static int __maybe_unused avs_thaw(struct device *dev)
>> +{
>> +	return avs_resume_common(to_avs_dev(dev), false, true);
>> +}
>> +
>> +static int __maybe_unused avs_poweroff(struct device *dev)
>> +{
>> +	return avs_suspend_common(to_avs_dev(dev), false);
>> +}
>> +
>> +static int __maybe_unused avs_restore(struct device *dev)
>> +{
>> +	return avs_resume_common(to_avs_dev(dev), false, true);
>> +}
>> +
>> +static const struct dev_pm_ops avs_dev_pm = {
>> +	.suspend = avs_suspend,
>> +	.resume = avs_resume,
> 
> ... all the 4 functions below seem unnecessary?


If we exclude 'low_power' then this is true. Will move this to the 
'low_power' patch as requested!

>> +	.freeze = avs_freeze,
>> +	.thaw = avs_thaw,
>> +	.poweroff = avs_poweroff,
>> +	.restore = avs_restore,
> 
> we've historically never used those, what drives this new usage?
> 
> on the SOF side, we've used prepare and complete, along with idle...


No streams may survive S4 what is not the case for S3. That's the main 
difference.

Yes, there are many opses vailable in dev_pm_ops, perhaps a different 
set of them is more appropriate. Let's have this talk once 'low_power' 
patch is here (PCM-power management patches are not part of this 
patchset but depend on it).

>> +	SET_RUNTIME_PM_OPS(avs_runtime_suspend, avs_runtime_resume, NULL)
>> +};
>> +
>>   static const struct pci_device_id avs_ids[] = {
>>   	{ 0 }
>>   };
>> @@ -546,6 +668,9 @@ static struct pci_driver avs_pci_driver = {
>>   	.id_table = avs_ids,
>>   	.probe = avs_pci_probe,
>>   	.remove = avs_pci_remove,
>> +	.driver = {
>> +		.pm = &avs_dev_pm,
>> +	},
>>   };
>>   module_pci_driver(avs_pci_driver);
>>   
