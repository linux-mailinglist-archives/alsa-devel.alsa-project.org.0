Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 084C779A9F5
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 17:47:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8516C1;
	Mon, 11 Sep 2023 17:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694447255;
	bh=/ReKMWOTyudtlIpZwDRbWl2uWxYUBVU8UAWe//yKtjc=;
	h=Date:Subject:From:To:CC:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MhDBuOxKW/kjVLYOaPyfovHxiXrLtG8rkOv76uLDowdeCU2MSDY7U+DzL4nDrVs6E
	 DSorjGkmCzLLdzKn/Jpn/r+HUEoMM5PZ/7XdAMLWeTogAVsbsBgiI88pGd+8Tco+en
	 3Dnz73M6FqY4bp+BVyd692LOPOeXFvzVKsPRVKxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E75BF80431; Mon, 11 Sep 2023 17:46:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23004F80246;
	Mon, 11 Sep 2023 17:46:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A069F80425; Mon, 11 Sep 2023 17:46:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AC77F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 17:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC77F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NtXK9vZp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694447190; x=1725983190;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/ReKMWOTyudtlIpZwDRbWl2uWxYUBVU8UAWe//yKtjc=;
  b=NtXK9vZp6NCu9iPiqQqfbRUjwg6iZYTWk1vQJYnKn7svCSBE7xy7kDi1
   vrcw9x3l/Gf7hOmGFFlAuTdwED12ZhO5hNxrAzHIYP/cPQEOQr1ZYOcQy
   AUHdaNLJ0c1ir4NkAPr0sojaa9eNLG8aEkx3ef7wI41Q7YgmROnTtspFe
   zEOPhUL+o+aLiLqqSE8l2zBAkwb8VtA4nWsuhsLIIlLgJOLzBMr8XTjWv
   NOYlwK+C1DLDscWX5TdgFx3uqpQkT5HZJ3FcqaK7pyDNIcNjhZz3rkq+3
   8SE6bCLQAEzvcuR9HaEa4MScYywy7jc30ex7w7U3eb4mbGhOJ1ZcW9FUl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="377029195"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000";
   d="scan'208";a="377029195"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 08:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074188756"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000";
   d="scan'208";a="1074188756"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 08:45:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 08:45:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 08:45:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 08:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nacQydAAawjsUl4lrhTe8VpTfhQGwJotApzSIOp6cwQgCHYX4ibopoiSFE9wWye4IEFpziKCBskGG6vCBMvuNW58WuyJQTvbpFcfpoRwuhJZ8FxPqr/2aguGzuT7PjzJD6jwThZMTQ2fMlU5eOCdmxGTiswhwuviWnJPv9v9eR0fTMdLZ3I+2VWLPlrae730Dh/V46QKknDTN9jcIfVedn0oZZLMAWyZc8I5a2koTgStiO4BbP6+IRIlYpdxqJxojtbwN33I2FPBjyknZhxSnTrdIcSGnNNDErX+z1vah3utZERqLmOR0zwPosURRrxei3ECUAnjzCOABtPdPWc0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QhcPbrreJThkmMXDRc4CKjXtYHrqq8mdEizQHrpVbfg=;
 b=nNq3gEMltpFsOGG1NxalU7P/qmLi1FWo2Be0OWZgk23TW+bLKECGPMIwExp76LKYJ1DBlUaRUY+jal/k02o9C7VRIHXbUy37KZkWkd+iuEzoqWcVPe8ZxYUm6bdRmsVim+iWCvTkhWaibiMqHCf3tSL22vPaQwndduH9nUJ474zKmWtrqcCW/XN7NR1tCB5JoKiS0t0J3HK4St39pRuy/FtgtAw5wl4xQs/bOZVlTzPd/y99GkeFP68F/h6padXkBPf+1Yc+KjMBfkzg1QH3xGLrHDneJpnsRmNaKJsBEpJZqxqDYNdCZ00FCtfjm/DhHLV9pCbzUCsvaLgikeBcOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW4PR11MB7163.namprd11.prod.outlook.com (2603:10b6:303:212::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.34; Mon, 11 Sep 2023 15:45:46 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 15:45:46 +0000
Message-ID: <8d76a1d8-e85c-b699-34a0-ecea6edc2fe1@intel.com>
Date: Mon, 11 Sep 2023 17:45:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>,
	=?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
 <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz> <874jkrdr49.wl-tiwai@suse.de>
 <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
 <acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
 <9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz> <871qfuhyog.wl-tiwai@suse.de>
 <85eec185-b024-573e-3fc0-31d179c832a3@perex.cz>
 <dfac60f7-e043-ca57-8005-3a744b0f920e@linux.intel.com>
 <52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz> <87zg2iggn5.wl-tiwai@suse.de>
 <f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz>
 <6ee5dad3-c46a-4598-3b5a-cac59979ff6f@linux.intel.com>
 <7d2d56a5-698e-7ee3-e6ab-95757012537c@perex.cz>
 <36fb8f83-9b39-966b-c105-7ef1bcc17afa@intel.com>
 <337fe790-fdbc-1208-080d-5bcf9264fc65@perex.cz>
 <cd163597-a15f-a52e-fb24-529f8e855171@intel.com>
In-Reply-To: <cd163597-a15f-a52e-fb24-529f8e855171@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0208.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:89::19) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW4PR11MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f03724-8598-4c32-141f-08dbb2de2a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 74NGTQ8WmghCE5qss6F8PKGhB9FCGCSIPPkyw2/xI+T77RNaP9D3wQ4XT1usGSiI0j6oI71OeIAGx7YxXJCCbMm7zkrp8tN1MpeohMdJubB/SnxvgtrHR5NaTdFVgwF2cZZYfMsI4h4XNUPfXy0T84uNbLVtKbZllrH/q2jLt9i2XO1ICcYNJxIoQFaqR8gMR7YJNr57+CAayWp7t1BviD1jeYnOpYq0W02cltluRidtTTPTy6Y5NqoByKiGhdrJDX8hIM2O67Yp9W5KSwo9kqr8SpdRe5ujs3YmD8CIogx2YbfejVZzZTgqI99qyyViwmHOg4dO7eH7UQ4L3SvqO59GeyKkVaSs1xvVyXguHa0WxJ/YckXYYvQ40s60oFAbKjbCWc86ri3+ZHJzBvz1Hkb2e7ryEd7cd3crZ0bM2sQ346rZe8BvHqlNkHKJHTmAYzTMz+YkwL3bfsOTjbd9lezAectN5IJkYsdGTNOkhRlAHmYujlGB9tFfVUEN3tGQSKIQtVhzxslNVxmsI4/84OmecWLT8gKpFVRNlssDRm1usgIsMsio7YDqXzqbSFoVJO5LmUIbZafQHJtGHfcXaWGZIDGP0l40XBUPJFy8a0bX5enuCBh8X7NXnqNd1mTG6EEFpRnbS6dOhzab2QD6ZA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(396003)(136003)(346002)(1800799009)(186009)(451199024)(53546011)(6486002)(6506007)(6512007)(966005)(478600001)(6666004)(38100700002)(83380400001)(82960400001)(86362001)(31696002)(36756003)(2616005)(26005)(5660300002)(66476007)(66556008)(66946007)(6916009)(4326008)(8936002)(8676002)(31686004)(54906003)(316002)(2906002)(44832011)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?cFBDUGQxNjZWTEJvd0kvSC9yYkxWQzlFOWN0L3pzRkVhZjBqa2RpYUp4VHVj?=
 =?utf-8?B?OGR3djc1dk5XbU95WkU1N1JVbEhrOGNLWVlYeXhyMnBabjl2NnYwMnI5bGRo?=
 =?utf-8?B?VlRHcGtyUFF6TWdsT2FwNCs2bklodWxjSDZGYWxQdWFjVThsekhFUTFpZXN5?=
 =?utf-8?B?b1dMNkY4c2M0bFc5OWJNMFp3ZHpGNEVESmtENFdiNEw5ejJZdjRGVkNkWFFD?=
 =?utf-8?B?WHhSR3RETG01UmI2VVd3UDUzVFFweG9vZVpVOWFQWjQ5bnZ3QUtLZHJWTS8w?=
 =?utf-8?B?MU5aOUwrREV0aGZ1bkRORGprL1ZmaFRIN2NkUW0xQ2VkcGdBc2xSZUN5YTBP?=
 =?utf-8?B?QndKbGxnK2JwNmdEZ043V3pHcHBuOURRM1VuMWY4Rkk1N3k3SkRtMUhYWCs4?=
 =?utf-8?B?WUw4YUFZLzVHY1M4MDl1dVlScUpxM2xrL0g5ZWFwYkxKaFRneWE4SUx5em54?=
 =?utf-8?B?dndsYmh3WHJMaUQvblcvcUc4OFROQk9hU3ZjcmxqcEl0V1VUWm1Kc1dGVUx2?=
 =?utf-8?B?eWJkNVJiUWlJd2xQQUtIVThlcjd1TTF4elN4bHkyOEtUNnF0YlduQWFXeU55?=
 =?utf-8?B?M1dzaDdFNUpvdFdPOStONnFzWUtZY3lIZjBseTN4STJHcXNDUTVSODU4VFpa?=
 =?utf-8?B?dU1JNVdnVXpIR2x4TXM1QmJ3NWVHVWNGSGlLWnZOaVpXL0FZR0pSTEpHYytE?=
 =?utf-8?B?MDg5Sk14UDh1ZlJIUUdBVGg2L3pYWEZvcnBXdEdTRnJVNUxEOU5TcnJORWFq?=
 =?utf-8?B?a1hDV2xqbTNkeG5haUZrZFM3eXFjQjJKb0cwTlVIRkpwSmJGY0tDTTF6QTFa?=
 =?utf-8?B?R1B4aitOVXM5WjZYblpseDBPeS9nM1F6WDRRK3Zzd295TENveXFaWGdSQ0hC?=
 =?utf-8?B?ek1kbmd1RDJuRnBtZU5HSjBJenp0cTh1N3NBbTlZZnE2S3RQZVE2YUwzSnk5?=
 =?utf-8?B?TSsvcmthR0ZONU9oQXN2NUpvelQxUnhvNDJJQ0pVNFJjL053dC9mT0owSitt?=
 =?utf-8?B?WUE1NlU1SU4wU0gvbmpGYmdSSWV4MzV3UXlDYXVnWm00bTF2OXExNHdJRlpk?=
 =?utf-8?B?bE9mTEh6NzRFcFZSa1FHV1pydUNIUGl2MEVlZnNYMVNIZkpVTm83MGJKbGxT?=
 =?utf-8?B?K2k2Z080NUd6Y2djZVlXUmozSTdyYndXK1RHSVJFM3ZjYmZFVEwzRFNvaUJy?=
 =?utf-8?B?cmlaSXN2T24vMDQ3T0x6L2JDQk4rUmlPcTI5V25xTER6c2hVci9SR0U2T1hz?=
 =?utf-8?B?dmptUUVIWk5GS1BXL0swUy9FcmxTZWhwRDlDRHc0TmZsLzI5RmFiMmNGSkdX?=
 =?utf-8?B?a2EybEhSY1crK0txM0lwNGFESUI3MmlEd3VYYnZPMVZBeVkxMm10K3kwQWhi?=
 =?utf-8?B?UXFQSmZuSDNzZHIzamEydGtNVjVGM3FsMThOaGlhMjdRR3hLZzhFNVA0RldJ?=
 =?utf-8?B?YzhKOTJrbC9UZmJWUkdEbSsxYjJ0NStVYnhZVXpVS2pPWlg1bjV6U0k1VUZ2?=
 =?utf-8?B?Qml5bitud3p4cHJRVWkyN1ErRUZUTzVmUm5zUGlwQnZpVTgrczRsT25XRmR3?=
 =?utf-8?B?S1duSm8yd2I1MHIzK2ZCVWxSZzdXK1ZyWXNYR0xiQ2ZyZmhkRHc4emMxbkIz?=
 =?utf-8?B?T2FUNFFFTzNKNlpmRXIzcnN6NVJ4WlJyOVVWclpTb2xKUDJWTlhqbndXM3d1?=
 =?utf-8?B?SUdZUjlPTTBhVGNrYm9wdjljWlRmUkhEdkVhWFRLQVFJY0V1TDl4WEZPUUpN?=
 =?utf-8?B?SEUzZk1ndG9vTHk0bDdOSFdmN3RyNmYrWmtnbCtzdUd1QitDNmhtRzlsUDJZ?=
 =?utf-8?B?MUpzZVBxN0FMTmJYRVY2UEh0MlBqVW1Hc1BRMkM4c1dSK3dVM01kNVZrY0Zy?=
 =?utf-8?B?Q0JXY0xDZlEvT2wyaWVHcndpUnBVMWdpYkRUS2ttWEo0WTkvcTF5WnlOcXZy?=
 =?utf-8?B?R21UR0dCSDFDUldCMDBGdVd0QTB2WFk4YlJzMkFvd2RjVWhYeTNwRFFaaVJp?=
 =?utf-8?B?ajNkODlsUHhQNGNRbFhzU3NzOHZLM05zOVIzeFlMOVhOUzM4SUlIdHdwem1o?=
 =?utf-8?B?TFZ1Ty9JWmhhWkYzWVFlUDJBQW1DaXJub2RMb0IwUTRFRUFGV1d0SWhzUU1w?=
 =?utf-8?B?Z0piS1FwdFpDQTB2bythOG5GK2llT0tXZVdiQ1VwVHcyWFNFU1QxalY3L29W?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50f03724-8598-4c32-141f-08dbb2de2a55
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 15:45:46.7439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ROU0s9gTfNQsKFj0Fe7QyfNY3zq4D19wtJqDb2n2Ptzhz8Z617b/zArmG0nX0xTzmr6Hq5oThOOSvJu9kvG9bHHrMYUPulCpJQBeY9PQ88M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7163
X-OriginatorOrg: intel.com
Message-ID-Hash: M7EEFV2WIEJ7UVW6MQO23S4RWZEDU6Y4
X-Message-ID-Hash: M7EEFV2WIEJ7UVW6MQO23S4RWZEDU6Y4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7EEFV2WIEJ7UVW6MQO23S4RWZEDU6Y4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-11 10:43 AM, Cezary Rojewski wrote:
> On 2023-09-11 9:35 AM, Jaroslav Kysela wrote:
>> On 08. 09. 23 16:36, Cezary Rojewski wrote:

...

>>> After reading all of this again, I'm fine with rewording MSBITS_32 to
>>> MSBITS_MAX.
>>>
>>> As I do not see any other points to address here and review of v1 has no
>>> points to address either, I'll send v2 with this single change. If I'd
>>> missed anything, let me know.
>>
>> The subformat bitmask should be also refined/updated depending on the 
>> selected format.
>>
>> https://lore.kernel.org/alsa-devel/f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz/
>>
>> It requires new code in pcm_lib.c and ASoC PCM core code.
> 
> Could you help me understand what new code is needed? The 
> get_subformat() example raised more questions than answers. The patchset 
> defines snd_pcm_subformat_width(), perhaps you meant that I should 
> update that function by adding paramter 'format' to its parameters list 
> and handle it accordingly?
> 
> Any guidance would be much appreciated.

What I come up with is a hw_rule for subformat that I add in 
snd_pcm_hw_constraints_init(). That piece, plus both STD and MSBITS_MAX 
ORed into hw->subformats in snd_pcm_hw_constraints_complete() make 
things spin.

static int snd_pcm_hw_rule_subformat(struct snd_pcm_hw_params *params,
				     struct snd_pcm_hw_rule *rule)
{
	struct snd_mask *subformat_mask = hw_param_mask(params, 
SNDRV_PCM_HW_PARAM_SUBFORMAT);
	struct snd_mask *format_mask = hw_param_mask(params, 
SNDRV_PCM_HW_PARAM_FORMAT);
	snd_pcm_format_t f;
	struct snd_mask m;
	int width;

	snd_mask_none(&m);
	snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_STD);
	snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_MAX);

	pcm_for_each_format(f) {
		if (!snd_mask_test_format(format_mask, f))
			continue;

		width = snd_pcm_format_width(f);
		switch (width) {
		case 32:
			snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_20);
			snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_24);
			break;
		default:
			break;
		}
	}

	return snd_mask_refine(subformat_mask, &m);
}


However, this means snd_hdac_query_supported_pcm() becomes confusing as 
you need to MSBITS_MAX regardless of what the codec supports.
After spending additional few hours on this, I'd say I preferred how 
things look with MSBITS_32 instead. STD and MSBITS_MAX existing 
simultaneously is confusing too.

Czarek
