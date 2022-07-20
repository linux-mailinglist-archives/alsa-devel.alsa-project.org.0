Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622A57BAA0
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 17:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E02B1721;
	Wed, 20 Jul 2022 17:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E02B1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658331644;
	bh=qxchg+4HeEyiulGTtUMRXx1iGSjg9Q995lWHzFk8oj0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VBo6q1FuvkgRiFfqA6iZqqjA/SrozTtN0mMaME4yNIwifqAQxM50dCkeF2ilkSOvW
	 gLWtSxV6jLAKdvhvW+g3nUsCvqKq/dpKlW4+oFGNeVJO266rySrqs84DoKSqkd3qEx
	 ClUDWQByF4H/lqJM9SdEzFEPykEbDRAfkSDbRQu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03F4FF80169;
	Wed, 20 Jul 2022 17:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBD9CF80118; Wed, 20 Jul 2022 17:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59EC3F80118
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 17:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59EC3F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FaaVneWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658331580; x=1689867580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qxchg+4HeEyiulGTtUMRXx1iGSjg9Q995lWHzFk8oj0=;
 b=FaaVneWYWxvJdTmlM+VvRZvfBELRurNBJeEhNYGCDbsoSCdHzpfrckDz
 PzN5BS3cUurjQPfc4kVESjpEdgtR7l7++ZZMgHc/E20nwvQIhedePWNP7
 nWaZyC315Hj0pWbN+B7aM0ILe+MMRN3nzUwp9WYlN+IKwAGJGQ3WQzwLo
 gM2qdmgVOYbheH1nIwsQRPbsZ+16dwMdpKPgLBQ9EGoembB5W7P1KmAHb
 dIVM4vFPbxZomOadLlYVk6A51SxNeYpjF1WMdPsI1REyWs/k9JhvVYd1q
 8cRqIwSBZrhT730Ag8qIVH75kNdaEGfx/YfUu6UROYSaB7+2qfNbdfSRW g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="267210882"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="267210882"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 08:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="656323166"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2022 08:39:32 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 20 Jul 2022 08:39:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 20 Jul 2022 08:39:31 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 20 Jul 2022 08:39:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kF6S0jxda1v0CMq34ZCXBwy4wK5BamDOcji1O0HfmyPjKxS0xEHL5hiXtjblQ6NrKyliwtIosK/1HGgf/0VyhsKLb1OVYtyf5IXzgH4DMLezdFnm4cSsrnkF2enaHvj6CqewOL4XdwxTnebnKPGkXONA7cpIMB2xCysIKYD3HlWQ0alStxea7VGhU7+0IT3t0to0Oh/9xpDFZGW+Qs6Y5RVN+n8O8orfjHBlTCkYKUWxtY5f27eE8D/S1BgMpqcm8VgRkZ6ePOTUZzIIK4W1Jv4UiJR6iKCWLhw7k7sDD1C8ZKZZ3/qlSrLz4avzGu7k97DKLMpsq1grGR4Vb0PD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBJpR5QyHA7vAeSuTehkwGKkt3ujeHwfmiUl8s6RmZ4=;
 b=bOUfKG/vVoNedYEH73tt+ffet9aOqlX+exV815UcV9jSAX4/Hng/2pSnWbZkgwPF+IE8EM8dkxA3s0uwUJWQKL8+hu+eHnGUdC2Sk2E1PP/bIPcuvLtGO3m5yqrDYanMfvZnrJ7j0dGwzhFVcZQAvpwKVoRhIowKenX32Te5r2D1dzGTxabZGK56QrMkNFTGQ2eSAPEv+z9VzFuDl5yxVTTulMVsLKDHI/Eqosi2PS4kPghh6M93pLAV4WyNT7Dzy5utE0SbBmsFiEaLU8ENVSitc+JPTyxGapBnJXgGk4mC+XwyePv3xfQWgqn5shNMIr2qlABp1abr6WhDN7y3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CO1PR11MB5042.namprd11.prod.outlook.com (2603:10b6:303:99::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5438.14; Wed, 20 Jul 2022 15:39:29 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%6]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 15:39:29 +0000
Message-ID: <8ff14178-7e81-68ff-71fa-7a31adef5cd5@intel.com>
Date: Wed, 20 Jul 2022 17:39:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 2/4] ALSA: hda: Make snd_hda_codec_device_init() the only
 codec constructor
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220720130622.146973-1-cezary.rojewski@intel.com>
 <20220720130622.146973-3-cezary.rojewski@intel.com>
 <875yjs53l6.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <875yjs53l6.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0681.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 388f521f-09e6-49a0-2b2a-08da6a6608f5
X-MS-TrafficTypeDiagnostic: CO1PR11MB5042:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L3Z+qj7H1ltyF1C1m/yGJqBGkrBOAm43UOsWhzx+m4ktVSVRkiFO6UBLsRXkuHMTND1iwwEYrdl4YnLaEZfGSD6I3TFA0YLo6S08Y8xHdNnTuU94Mp0HSlYEgsov731vbKP0tiTrMP41mC0YuoEizWrKboldIvFnkhB2yrQ9AMMSuWx0OOfvyGFHYl0JGYhJaYTeW1OyHip5KOEnW4ce6og3NaY4QDtkH9mhHzl6OMzNt3nzkFNC3rqcFaakcNFM8uq22BjnwaMi/DfwxlODf9tvNhIoN9aygIlgeQ/V4CwCDfMKt9rHaVkfVW9AiPeFR6SN04vKDW1lMXo8PCnX71e/rveXVXTObxNUf0zS/bL/2/piO35qyd+QBAE0OZMG/mAB+Zw53dFKjVg78ZvN3jt1d3k2Pw9cux0Md5fjaq7pzQ+G0syxj04+getNyumrnn/IuTMWPThJ/4giUL8rCurhpJ88S9BNgOEpkt37JipwJ5Zh2kIifT5Y+/W1tpoDz7fm+412FU7kGKb++wJ4qqZdONZAYd60UxSXVCpTnHxqORpWzZ0iCAcuWi/nQfYMTvCk4joriJCex2RvkvnSJDYm4yixO4dKTzM+d4740JGnBfsdrylF7rkBcqUmeNboIQpyjF3kTLwouH1dWZ3ZAQixSoUlsYi0gBOeGTLH1f8BbR9hrzBEqexm+D7eEDfndgngu3HGnwthF+PuovGA6JfGOFG6t1kdf9WrEvsvXxtE44tyeblxe0JUsJZF+fGJ6Bbn2Yy+3ANdaErNwlFJK2v4wpBzo/uZBjRn7hEetaKckLt5dHOjGbkwN0byV2d/h6eGh2EUNJ/M/jeGgAMRHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(346002)(366004)(136003)(376002)(6506007)(41300700001)(6666004)(8936002)(478600001)(5660300002)(7416002)(26005)(6486002)(53546011)(6512007)(44832011)(38100700002)(66476007)(83380400001)(66946007)(66556008)(82960400001)(6916009)(86362001)(186003)(2616005)(36756003)(2906002)(31696002)(8676002)(31686004)(316002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFDcXpuN3ZaMmRWdTJSandFTDBBL2t1eDhsdnZ1Z1pCNXhKdVJZRUlEN2dF?=
 =?utf-8?B?eWloUEFKeVNPSHZJR3p5Ynl3UzFpVUtVTnJJUDBJbkF1dUgxOG9lam9wR21K?=
 =?utf-8?B?REpiT01UZ0ZRdU5FTzlBT213c3g4QnR4ZDdzRklxcXJaNzVxSUFHL0JoSDFp?=
 =?utf-8?B?U2x5UndoTkVUdU02TE5SUW1rMEV3d3NwOEViVHRQWHJRbVhxUEFBWnh0KzZJ?=
 =?utf-8?B?c01Gc1JCVGp3TWR2R2ZrZUIrNFFLU1RDZUNiUGcyV3NCSTZ2Q3JJWjJ2WVlZ?=
 =?utf-8?B?dDJhK0tpa0xUNDl1WElHYVpmeExPV1BWanNobklVOXVadUdhTEx4ekFaZ1Nw?=
 =?utf-8?B?em5Va2dWMWFjQVJOd3d5NThjR1RQWGJKS1hVZm1ZdVFZendXbmlIWkg3VE1U?=
 =?utf-8?B?QjZRYXpZMS9ucmVDZHdvZUpaU0ZhUjNNU05PRmpMUU5WVlFLcE1yVS9wZXdH?=
 =?utf-8?B?WlFMaTlDbytuYjdDMTBTT09GWjcySWtyZ3cyRzBXL2diNk0zT0tmcU1pN29U?=
 =?utf-8?B?ZU80Vk9tODRJaHQ1MzYvZFJjMVpIbGpESyt3RjZQdWZOejNOTmlKZUZEcUNs?=
 =?utf-8?B?bXo5eWNXYVpPZG9ETm9oR0xLaU5NRkpvczMwUklteHZMVFh4bDNuU05PSDU4?=
 =?utf-8?B?eHphWm1RQ3J0bFltZ2FhNGIwNUFhRUd6bzUwOEdQT1hpTFdZbGNqNUdnN3lU?=
 =?utf-8?B?Z1pvd0lWbGIzT1BJUlprZ2o4TnhxbjJKa1VSaWlwbkdBVlZUeUlXdEhYNnBs?=
 =?utf-8?B?akN4ZUlBYzNsVFhuTlhHejB2MU9nY0xITzJnV3BPWlg5SStBS3pmZEcyNmxh?=
 =?utf-8?B?c1YwK2VQSGpYeFRYcnh0YzZsaXBWVlc2eGx6NnJSdHBNOE8rQy9GR2xrNG1q?=
 =?utf-8?B?NllhWnEycW9pR2Q5U0I3c09QMERtbks1eHVTcjFwR1VwL1A3Z2M4UWkyelFp?=
 =?utf-8?B?aWdoUXU2NlNXQ2xka1ZPaVpNZ0xIMWZsRWFpOXAwYXAvdFcxbE1pRklrblpz?=
 =?utf-8?B?MGgxdTNEZytvTjNvY2YvYUVXNlVlTUsxNHVsaHAyOGtnVFI2ZlFOTlNtQXJO?=
 =?utf-8?B?Q3Fqdnl0MDh6Z3l1cnI1Z2svWTFCeGJZVXpkTGJONjRhVmZJcnFSR1ZoZWdq?=
 =?utf-8?B?UEMvQ1A3UmIzUVprUHpqSk03eWE2ZFJ5cnZuZFRDd0k3akpteHJDMnNEL3ZD?=
 =?utf-8?B?NThpMFJpTnVvbW93WnpoNUdISGFPMHNlMDZ6bUtYSnJleUJUcFluRnh6cVRH?=
 =?utf-8?B?RndINk1xVWw3VHRFcnFxZ0xEclozeTZ2bEgxajQra2lYd3RZRU95YmRnTzlN?=
 =?utf-8?B?dUtTZVdnY2FINkIzdFZVU0srZWFUcUxZRDlkakllYk45bkN4empyeEg2TlFO?=
 =?utf-8?B?azk2OFdFc05iN2M0aWNja0hpUjlDQ1J6a01MREg2QWZNMkhzSlhJb2Fic3JC?=
 =?utf-8?B?Mk1mOUNzczUwOXJaZWU2bzZtRERScW4zcGJsUXV3enV0RlFNS0xLYVprTWxI?=
 =?utf-8?B?VWdEOWlEVmRsa1RRNWlEUFB1ZG1CY2hhV3ZheksxWVlNbEtwZkxkbUR2aXNV?=
 =?utf-8?B?MXBCTElYMUR3OU5yOHo3M1NsQnN5R1MzUnNGREVqdlBXQy9saEl5ck5paDVw?=
 =?utf-8?B?VEJhWkJCT2k3UjdGc1h5T0RyMVFBZ2NQcHorM0wxd2g0K2g3ZVFjSVYvM0RH?=
 =?utf-8?B?NXQreDMzSldGcC92RDI3d2QwMzludXg0MWxoZG1RVmxLMi9uT2hhS1pxcXlt?=
 =?utf-8?B?bDJyRDN5LzNaNXlnUzh0bThnNFJUR2FqU3JDanQwWlFKeVhRQ2wrYmhMRWV3?=
 =?utf-8?B?ZDVEeUJ1VXlHUWdyeVcwa2R5QnVkdnRXd1lXU3Uxa2dxUjBUcXVQU2V2dTNl?=
 =?utf-8?B?cnpUTzVpTXVoYXE1T1J4clRpYW5leFBrcWVnSEtYUDZXSXFhWXBYNXpmZGRJ?=
 =?utf-8?B?UFo1aXhGZStmeFlFYWpqaXJNeHVyUUlOTWtJU0Ryc2VHcmNxTEZ1YkxvRFVG?=
 =?utf-8?B?S0tEVDI4VjFFRGNWY0FKelpNZHppenJGSWQ2K3ErRmRLOUpXN0gwYlU0Tk14?=
 =?utf-8?B?c0ZCSEdyRWJjUUhrbk5NUjA3ZlZQbmoxUUN2UmVoUGZ6c0ZIMmFMYU9yMEJz?=
 =?utf-8?B?WFhZWEljNEsrUThIWHpEUm5seG9tUEIrcHM3bTFoNGFHRkJYZDYvNjk5V2pZ?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 388f521f-09e6-49a0-2b2a-08da6a6608f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 15:39:29.7870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+opLqhhMan5q2iufifBGmd2CswNOe2PKggZZ3e3GLpi2O7fSJ+uyjAU7srrHRXxSoOK9c0WsehPxJ7Vt1+usu6R6ZXBTiueYHjoN7owVTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5042
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, peter.ujfalusi@linux.intel.com
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

On 2022-07-20 3:13 PM, Takashi Iwai wrote:
> On Wed, 20 Jul 2022 15:06:20 +0200,
> Cezary Rojewski wrote:
>>
>> Refactor snd_hdac_ext_bus_device_init() so that it makes use of
>> snd_hda_codec_device_init() to create and initialize new codec device.
>> Causes the latter to become the sole codec device constructor.
>>
>> Users of the refactored function are updated accordingly and now also
>> take responsibility for assigning driver's private data as that task is
>> no longer performed by hdac_hda_dev_probe().
> 
> Hrm, this doesn't look really right.  It means you'll introduce a hard
> dependency chain in a reverse order: snd-hda-ext-core ->
> snd-hda-codec.
> 
> Originally, the ext bus code was written completely independent from
> the legacy HD-audio implementations, and hdac-hda driver was a kind of
> wrapper / bridge for the legacy codec over the ext bus.  If we want
> change this rule and make the legacy HD-audio codec always tied with
> the ext bus, a likely better way would be to call
> snd_hda_codec_device_init() in the caller's side (e.g. skl or sof),
> then pass the newly created codec object to
> snd_hdac_ext_bus_device_init() for further initialization.


Agree. That or drop the snd_hdac_ext_bus_device_init() entirely. Will 
send an update soon.

In regard to the other subject, my plan:
- separate code used by both ALSA/ASoC into sound/hda (this includes 
many hda_codec functions)
- combine hda_bus and hdac_bus
- combine hda_codec and hdac_device
- drop HDA_DEV_ASOC
- drop hdac_hda/hdac_hdmi (once skylake-driver is gone; sof will be 
updated accordingly)
<story does not end here>


Regards,
Czarek
