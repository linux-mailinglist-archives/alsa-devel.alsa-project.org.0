Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EEA785274
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A9C9E7E;
	Wed, 23 Aug 2023 10:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A9C9E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778406;
	bh=V6erUc6A2EEUtIIgv05Bwp4N1YFvkbVcCD0qVoFdRjM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XYzp9ejpM06ffVMI7vo4PUP7pYrts/BM6XE0SU5U+sN+HhLtt4VQFYSHBF21Vv+Ec
	 su/OW7gjQf//wZls7V3NJM8m8HOqKNOtItD+tjb9yJFxELNsFMautQgLIglcus1bJC
	 n5/FhKRvFBKODqveE5zfN+3ksEQIcLnRtFyTP8Tg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B5E8F80563; Wed, 23 Aug 2023 10:11:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 391D3F80557;
	Wed, 23 Aug 2023 10:11:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11CB7F80558; Wed, 23 Aug 2023 10:11:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FBD2F8022B
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FBD2F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kUJ5Dd6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692778304; x=1724314304;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V6erUc6A2EEUtIIgv05Bwp4N1YFvkbVcCD0qVoFdRjM=;
  b=kUJ5Dd6aXa93PI4qcBvq3vgdfBhg9mNfEYWeeaSQG4tDfqJ8WpkImLA+
   OAntcDIyKd60A7Pf32qtTT3dFgTpQB47GamjAse4L+eyw0bDSz5AKepKv
   uNJEHuCK73S3LgFKjioIUREykdWP8yKFB3CTDdJWOjG9BbGR7y3tvdalH
   ybODC/PNwKFhmeozTfVk0pbdjy4wo8fUmqCxCp71W+194viguFPsPXrGM
   CDa28IWZRLkpgYJk5p8m3XOHPf0+IBgIhbRQtqdl6TnssKhU29bM9wcFP
   AytMUOAzcWMrfLhO38qYfoLwdZfWwYna11KLQJmiXikalQnZ87dbvQrdN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="364275720"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="364275720"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730122246"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="730122246"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 01:11:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 01:11:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 23 Aug 2023 01:11:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 23 Aug 2023 01:11:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 23 Aug 2023 01:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+0bUx+eQWeDylvtBk5BgMYdM2nUcr3uszKMCPM65+mKxZMWL/FcDdcQsdw1t66v3HqCtzAMt5XkN7nvrD1vqEdnhU3DXL7SkxML8F9xq8pBQ9h2xZFYVdtaU6P3Qny3rIEeuG5vNsfh3Cm5ICOXj70nf8vQK/WPZaLRQWwzu26tpoqgwOke+Gi1/E8t2B1VrceBTj0Zb1m7d4zJjLXJNDYgIbLdH1o4vL3JyidfZP+QKOxkrj4yh3eyzVhqMDY9vG41Pe4CY8NO19GtLc2ATfavmfQonCZXQzpBQ+2YsBB7sVdxyFjr1bd6k8aynsE+W4RFMMLh39qoiILNrE5YuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/z2340PDYINp+vdUVR7PaAQoXEjqLEZFODZq80Sk4w=;
 b=QaOpulAVLpcg/HyIbdXolUvsfsoIgCeJ+etXofV1bzPBjyr9+14EXuZ5d6lbVx/AYhnDgIjkGZ7yPY9NO1VlxhxNOPd37ixJyk363AfzU20sEcI/djP8mi+VOt+NGw1Dg9qYFERRv+XimMiuxYtGw+jQ7QTyCgkDoIuYU8BbJ0jhu3v7fSdHtOewLtAJW6LqrqtQafUs351GgmSE8qGBDvl7caA9avBQkErOAOaEiHCzVOfbIez1NgKjuouK9jiidwVTyqUJAzWrB2dmrfMHK3ZSn647prChC4wilhW5s63FEJmrCAJitzekpaM8sstVGn1IrOBC98FeaYvgAuGBbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL3PR11MB6530.namprd11.prod.outlook.com (2603:10b6:208:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 08:11:33 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6678.031; Wed, 23 Aug 2023
 08:11:33 +0000
Message-ID: <acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
Date: Wed, 23 Aug 2023 10:11:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
 <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz> <874jkrdr49.wl-tiwai@suse.de>
 <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL3PR11MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a13c075-75ed-4eb7-c331-08dba3b0901c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 kylW5BdYNbUHXgcZ0iMZsQQXAg9BgZlwjrjO6TOyCb6MjS2ZZTStFmBxUdZwAnvtWCl4MmoIEk/cCXBqBlc7t+yZGiIChuworIA/nczocDH3jUKey1VCtBalvmzsdhNtIUBznyaC56R8RBHJAdcBPfU5564JdaMMcObYfZhCWpuG1fMGta9Ms71Ysx9I71jeGtPGSzColA9aPgSiiEJxun379Gp4gmLtTIfRNCgTYmVucyQqalG46tmHiiaz12JuskTBAEaY63HqYbQzUMlnbdj8LSPP1aGAJokHIU6z0JuyEtR+gGdfzCcNST+K4bRpdMFi0SgOoOUmj5TcLfQ1cBuM5uKRcsfJlP/NaV5ohBUo2wTd0RQvrJpU3EEAACfbF/9usC0PkqtCpfRULgrBFo00o2NkYM3T5m+iDBGYt/VTyJvH39YvWuoPSRSY7wdzAr+FQfI0Z/uES1EPlrqx7JagPczHdyrOJVyQkTG1zUbuN1lLkVMZtvQC/JEImJW9oDqFk2vtKjQzjd/6ZYcw9YZIt2n/bBY3FHM/EdCqXySWzop6SiPUvsMA8fknDp4XL2VNTXx06ptGdfXNZDmtlQ1sNf7u/AxooCM8hVA5W/33PmHOiSfkRJ0q0nkEQywOXzo0KCUt7lLj7oRAjhxQJw==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(2906002)(38100700002)(6506007)(53546011)(6486002)(5660300002)(44832011)(26005)(31686004)(31696002)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(66556008)(66476007)(110136005)(82960400001)(478600001)(6666004)(36756003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?cTd1Wnh5bjhKQUJjMTMzencxWGlHS1hVRHcyN1ZJMzRpTm80OGhaN0VWKzNZ?=
 =?utf-8?B?NEVEczdpak13TjhBOEQyanBuSG9Lb1ozM2tnK2xjd3oyOTNNUVIwbE5FdTlD?=
 =?utf-8?B?bmhoN29vVUt0S3oyL0FqVDkrZE9nZ0t6UW9ZUlJnMElXdFpCdjJUMGVMQmF5?=
 =?utf-8?B?dCt6NThMZUY3eU1FTHhvais5eXRwUHlTWVcwRlA1dFBWT0Q3RGFwbWxvalBs?=
 =?utf-8?B?Y3kyRVNOM3k0MGlkZGgzT1B3aFl0QWlVTm1aUGV1SFozTEg0eSt2aGt3K29J?=
 =?utf-8?B?cHBqZk1SRmhNZy81ckdBSmhCb3dXVlpacEd0UkpqZHFsMHoveDhXa2ExcVNV?=
 =?utf-8?B?SVk4NnltM1lkVHlPNWRGaCs1ZTBBNjVRZjJKQVBZNTFHVVpVdmtjVW1Ob1Zv?=
 =?utf-8?B?MHJISStuL29nWkkrWU04dWR1ZFhuZ0xYYzhJVzA0YWVuUDJyc3k3eWRLczFt?=
 =?utf-8?B?eGFwRWZtbnExL1B2UXRKTlphK3RpMms1WmtpRWpDVVk5MFFQQ3A0K3pNa2Jw?=
 =?utf-8?B?V08yODg2RDhnQmFmcVdTUFBHdWhBdDlPbDdQbFNKK0FjWkpyR2RrZi95RWZG?=
 =?utf-8?B?Q1NMOExoZ2szSWo1UU9WaXlTcU9HNjRpV3VIOHJiTDdtR1BucDA5SldnQWVa?=
 =?utf-8?B?OFhRVXhMVWdxUGNZNm9qNGJDUnF6clU1WGpUV0Z4emRUM2l1NmRSRW5yMXhx?=
 =?utf-8?B?dkZFdEt4dmNrS3d5L2NDQ0NRZUgxc1RCNWtNeU5zWHVvSjBvYUZ4bHkrWlFX?=
 =?utf-8?B?S1dXbHhGdmdwdWdwTmNJWlRpUW84U25iNkZEL1BYWE9xcDJOVEFZUG9BVFZp?=
 =?utf-8?B?SmNvM0tzVTJ6YWdvMDNnbmdCWE52MG1mbmVFYjExS0twZlIwbUdvVGZ1WjRW?=
 =?utf-8?B?dkFCRElkYzE3L0Jhb050UXZidmxoQjBjQ0FSRWtmM0FKd2VlcDd1NjY3YTQ1?=
 =?utf-8?B?bVNyUzNKNXZ0NEpaNHBRTG9qU2szYklxdjFIR3crMTJuWHpyeXBqaHl5MUZo?=
 =?utf-8?B?RnVYaE5ndjV1R20vYW03eHhnSGNEMkxLNGJKSzEyR2JoZ1dDMUVpdkIxWG5L?=
 =?utf-8?B?eWFFRkJkd1lEUmFudGdwemdsRVdKZERSL21PaTBOdWZuOHRQRTBCTlZQMVNu?=
 =?utf-8?B?c0s2RmIySjFzYVVpalV2dHRsN0UzVGJaek9hd085a0oxSmZOWHBMeURPWHFa?=
 =?utf-8?B?b1o4M2hST3ppcmtGWjlramNJVlJPSXZDa3V1a1JKWEpINFg5NmNseUQ4YmZY?=
 =?utf-8?B?VU1aMlltYzg5RlpTak5HMGNVdUFnWkIrTW1Lb1RtTlBINUNOczhZY3ExOXhD?=
 =?utf-8?B?L3JYd25SbXBwTW5ITTMrUllETGVvQmc1UWxpWTRkRkNCWEcwOEJlZ0tTa1d5?=
 =?utf-8?B?T1ZJeGh6MVhKUXVjRUhKM0dWb0ZKa0g4MkRYNzdGeGQvckJEaUFUeVJkUGox?=
 =?utf-8?B?c09wVUpabWl4VUdJRHk4RldrTDBPMmFwS3Z6RGUwV29ZZ3RwRG9oWCtjMmZs?=
 =?utf-8?B?MGRxMDQyZm1oK1VXcWcwZG9FUTU0S216ZlhiWVJTSi9Xek9CdzJEWm9VVUJU?=
 =?utf-8?B?cC9HWFBFaFRZVnVrbkhtYzhxWHVtZjFnTFA5N2xsUWxoYzFzR3NWWGhTVjVs?=
 =?utf-8?B?K1B4NjJnellXbWZvTVBlMFBSTEJhdXRUbXJyd1U2NERXcEJGcWtGcVNsUHJ4?=
 =?utf-8?B?RWcrbE9TWTFDcnZmdCtxamlqN05tZE50M1dZazZCdXBNM0g1Z3FNUEpIOEZV?=
 =?utf-8?B?VUNWc0tCWE1tcXRmdHkwWmlVeUgzUTNCUWswbTB3NmdkckJaZ2d6TW1iMCtz?=
 =?utf-8?B?c2NkV096c1JKOFp0cjlQejBuN2RXMXNqUGNyVjdDT015eDVXbWZ3WVdqcGZG?=
 =?utf-8?B?QldORHFiNWpNYy92WC8vZy9KZDRubzVPSVVMdjlEM3FjdE5NRTQ0WVJtSWk3?=
 =?utf-8?B?S0d2d0NRVnJqMU5hNzV3VkVqSWJkamFqYU5Hc3hGdERiZUVxNUxnZGYrOUFl?=
 =?utf-8?B?MzBXRUFSY1l1OUlYc3lTODhzaTExb0pMK3QzbWxCQTVSMWx6UHVkK1VrRDU4?=
 =?utf-8?B?V0V1ams5Q0xKMUJobzd2OUJaTGd3Y2sxc3NmOWt6WHorbXNpcE5TQitPblJ3?=
 =?utf-8?B?WThPUURzWUZlbUZtRGdPbitMSzdHdk9YR3cwajc4SCtGSkpJTzJoaG05ZHEv?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7a13c075-75ed-4eb7-c331-08dba3b0901c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 08:11:33.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p7iYdFD/J5xrNU9CoYetrqNU4p3rreRekbj4vEqlJCqNwYYK3iCc67s9vzCYlTDEh/hELH1T23E+PhhbSp6oAojXnHnUbLYIfqwsKCsRtW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6530
X-OriginatorOrg: intel.com
Message-ID-Hash: ZBPERDLZYSEAXLUQUGSWXLQEVBPR4WPN
X-Message-ID-Hash: ZBPERDLZYSEAXLUQUGSWXLQEVBPR4WPN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBPERDLZYSEAXLUQUGSWXLQEVBPR4WPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-08-22 9:03 PM, Jaroslav Kysela wrote:
> On 22. 08. 23 17:38, Takashi Iwai wrote:
>> On Tue, 22 Aug 2023 17:29:47 +0200,
>> Jaroslav Kysela wrote:
>>>
>>> On 22. 08. 23 17:07, Takashi Iwai wrote:
>>>> On Tue, 22 Aug 2023 17:03:02 +0200,
>>>> Jaroslav Kysela wrote:
>>>>>
>>>>> On 11. 08. 23 18:48, Cezary Rojewski wrote:
>>>>>
>>>>>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32    
>>>>>> _SNDRV_PCM_SUBFMTBIT(MSBITS_32)
>>>>>
>>>>> What was reason to add 32/32 format ? Subformat STD + msbits == 32
>>>>> should already handle the maximal resolution. Until we do not have 64
>>>>> bit formats, it seems like an useless extension.
>>>>
>>>> My understanding is to distinguish the cases "we do fully support
>>>> 32bit" and "we don't care".  But, the end effect is same for both,
>>>> user-space would handle 32bit in both cases, so this difference won't
>>>> help much, indeed.
>>>
>>> I don't think that we have a "do not care" situation. The applications
>>> currently expects to use the maximal msbits for STD subformat. The
>>> subformat should be used only to refine (downgrade) the resolution on
>>> the driver / hw side on demand. I would just add only necessary API
>>> extensions and save one bit for now.
>>
>> Well, the current behavior (with STD) is to choose whatever 32bit
>> format the driver supports, and the driver may set a different value
>> of hw_params.msbits at hw_params.  The explicit MSBITS_32 would
>> enforce the hw_params.msbits to be 32, otherwise hw_refine would
>> fail.  So I see a potential difference.
> 
> I see. But if our target is to create a complete query/set msbits API, 
> we should cover all cases also for other formats.
> 
> I vote to replace SUBFMTBIT_MSBITS_32 to SUBFMTBIT_MSBITS_MAX as the 
> second bit (right after STD). The format hw parameter already defines 
> the maximal width. We can add SUBFMTBIT_MSBITS_32 when it's really 
> required. Note that MAX should be handled for all cases (not only for 
> S32_LE or so).

In my opinion STD already states "max". The word is not explicit either 
- max in the eyes of whom? The driver'? Then the driver may reply: max 
allowed e.g.: 24/32. And that translates to: fallback to STD.


Kind regards,
Czarek
