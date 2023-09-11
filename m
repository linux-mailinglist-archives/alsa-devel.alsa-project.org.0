Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA05379A62A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:45:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 735B1820;
	Mon, 11 Sep 2023 10:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 735B1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694421899;
	bh=Anu9C9C8GsaDRiiy8qaMsEGafgM0F+cp1LPar6siGYY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qd4Ocw1yqRE0bFVp/qhNJQtul0Z3OX7HqaeKOK+ES82WcVsjwmuKNUST8wXlK+D3Y
	 z6U2zqpZIG9LSyQP+CF55sue4HKmLaihPaaNaXOHmTn9LiCstwkT1q9Ri6NfACfjaD
	 hkJEMuopMQvRWg9iRp296QEn1236kYFQp7w/9enk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6691F80552; Mon, 11 Sep 2023 10:44:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3471FF80246;
	Mon, 11 Sep 2023 10:44:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 789E5F80425; Mon, 11 Sep 2023 10:44:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B362FF801F5
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B362FF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mdr9Xr7J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694421835; x=1725957835;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Anu9C9C8GsaDRiiy8qaMsEGafgM0F+cp1LPar6siGYY=;
  b=mdr9Xr7JbVOqlaLtbOweu4ZEqvsnitIgQBmJlD43pIs00F65CbQUgaVI
   RoZbUOSNWprSyLsa771F7ytJe9w7X+3lK0NuQB8HPUwt9OPYUxc/NJVL8
   sK36fw9g1RnYIMFmmEf0OwuneCvxlKyHDZJ1rDtkZHrUh+p0841ERnxzU
   24EEWlWxF1iyKFcwlh5TdzCKfHi7AxyaPevhNxCywAY4b6pr0fWxUt6dB
   w4gDKTmte8sch33dw/pCvcGj25bFq70DqClEPHiJNeOxnr7axO/tuETwo
   hDadE2smprVd+WhHCQn+CvjfmiLXSek9zogoaMNgT1H7ZIedf5QpctE0v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="464402972"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000";
   d="scan'208";a="464402972"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 01:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="772505726"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000";
   d="scan'208";a="772505726"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 01:43:51 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 01:43:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 01:43:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 01:43:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 01:43:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgwh2TgnVqCERFJU3cNfub1VB5B1nrkvIxHJmHnpux20ZIogVLlpo5GkO6/6ncLjo2hez26HdPqn+qo1d1UKbSO90HcrFX/8Ktoq4qSkzV5gellYfPwXj1qfrQKtLPSmtFBaSEZH+jg/qZOTMSH913hZ9Juc+k6Il1G3+88aHDnus8IlfVHWxNNRmO+5BGO/7ywmZsIc8OY/fCd6zAaQ/je7b2Jbwji0R+6Zdrdwp7Rx887Q0eMg3GIBarQLTN3KqR2JppiRR1/Z+cLEC9KNEfBXDBB9NZT8svatSZKXlEAGxO7BJJsLfWHOhrKqJbsgCblOlshHoZWWx9rUsMG2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+IbwMTM83t0okKcA/03D3SGL/u4I81cnuo04nzVpf8=;
 b=JOSNp87Gjvsc3M02jKQtUFOE3CHI+Xhlc+i9Qz/e5VJs3JrWRBCGI7Xo2GUygoEiC00zZXbHkL0e+3WAlHAJL45Mp/OPcPwx+PEftACEZ1iW6aJGUwzgNlPUOg43AHylxdnRd0a6grAEO5twDRgNjif7jYLdH1asiddxQk7Q49v5Z7qDiil5c2JoGm1v5Wk7HqCyl0hFu+gMRpiB2kpB6M3/FgvvDJWAQwY9M+BA7QeyeLF79C6aCmOFeDOAIDEfZkndO3QuuUdRBoNZn/0Kdin92lGz2hF9I2TLK4saNQKDh4GKMp/HGhibCyXp9b3WgI4t65mcNgasE/y03ttFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB5471.namprd11.prod.outlook.com (2603:10b6:5:39d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.34; Mon, 11 Sep 2023 08:43:48 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 08:43:48 +0000
Message-ID: <cd163597-a15f-a52e-fb24-529f8e855171@intel.com>
Date: Mon, 11 Sep 2023 10:43:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
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
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <337fe790-fdbc-1208-080d-5bcf9264fc65@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::16) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 69dce92f-8703-4288-0489-08dbb2a3373d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 /2mtbqqY0gPpSVd2SqImkaagUF47H1t6gtHgU7HR+vru7ahdxfGASTyu0eoOuVhqYC10m9RtsiMluji95agrzD95Z5Cc8fbz5UA6xYXaVR2SnjCT68e8Hk2bR2euDAlx8AHsvL2Xyh2+lLOjWg1V79Mq89Sw001bLKVzRg9vkUIB79P09Q7fJ57zozVHez1SfdBgNN7PIyUy4wiCKQZQaqNfIAX39nKluTUIZOJMqY0gi7rZ9ekMLuPGWVC5Lfr3F6i02fex8OJ1Fzii0YI9zz8xURQ0ukY0pl75hBYEjN9smZFCi85SusDEM50Ru4Vye3alvAiVNmSZqSR422u59XILEdlaZ54LYhY1k1MsnTKGABbidkS/4Lx1T26XDD9Uv7UaPPeyAhnssNe+G/b0SfynDB2bNI29UnIK/bxoUK30n7ODb14KWP6MWNMUUXXKJqTvm3vJDmAARm+95uSgVOTNt8Q2whL/+rAObiYDa6XBtOkMW94zY6caTq95KGl0/iExkjA8WrbHQoaVCsiTXM6gg3DVPHLqxeJVcaxM0/Rdwd4YIf3s71Y11g0+rRWV6EadNXR3EjKeONLrPn+jSgNpylZI2k2frFfEngF67vIGLBeW7Zuv5A+kSzMCJW4T3rPq+bvU+OZUD44VuvQcyw==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199024)(1800799009)(186009)(31686004)(53546011)(6666004)(6506007)(6486002)(86362001)(36756003)(31696002)(82960400001)(38100700002)(2616005)(26005)(4744005)(6512007)(966005)(83380400001)(478600001)(41300700001)(4326008)(316002)(2906002)(8936002)(8676002)(5660300002)(44832011)(66476007)(6916009)(66946007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?VFNqcUNUaEhDOEJ5bDByNTZOeVpaRWVZMWdlSDlrUWJjVkNXelc5WkE3clFI?=
 =?utf-8?B?NUhKYVRuSmU5K3BGaTBETHIvUzQvTWxtL2pVcTZmNFRldk5VYUZrRzJiMnB5?=
 =?utf-8?B?NG9qNExucmFPK09YdWRWczQxTFlFVGkvSUpwa0ZYU0hNc0dmNzMrTkZpbDRT?=
 =?utf-8?B?dHBvY0M1eXliT3hDZ004UmtpckhMMHh4RTYwb0I0c1RaWWNUVVlFZTZRK2N4?=
 =?utf-8?B?cCsyZGVtTEZYbWdsamhIS3lPa1pUdi9KdWhrVWhmR1pVVUN2MnNlb1RZKzRn?=
 =?utf-8?B?bEtxdUxkL1pReDdkUENxZlBiMFovaGc4a0RCT1FQcVlYR0tMOU9OOFFEWUJt?=
 =?utf-8?B?d3lWZy92RW9GU0lPM2ppY2d6cnFOcCs5RFpZUmhYQ0FWOExpeTl0bHB0ZWxp?=
 =?utf-8?B?T0pLdlBRa0lmanFtQjdZUzFQaFlVT1JBbzErdEhqWU1LSEhQSHJobThYQ1Y0?=
 =?utf-8?B?K0ViaFFsbXlqbTMxVnhPNXQvVzVYK3k2endxLzhTNlVNdTVOeUFoNGtoYWpK?=
 =?utf-8?B?djc0UGRGcFhZeEV2Um9mR0xBYUxkdnc0QkkyanFDM0liUzB3cTkvRUIrQ1NM?=
 =?utf-8?B?cHcyOFFQaEEvTmYrN2tJVTY3a1BvWDR0bTdMMU8vOFlrQWcvOUxqakRwRnZW?=
 =?utf-8?B?WW44TlZpUnBWQkJKUTJMYm4yNldBVWlnUUY0eUtwQzZxNTlFYS9UVC9WVHFt?=
 =?utf-8?B?Y2I1WFFkN1g1S3lHMXRVODRaUTNiaGdVcFp3Mmx6OU9mRSt0TFR3QlBWY0F1?=
 =?utf-8?B?R3hySXM3Yzl6WlYvL3ZSTkhSVGFiUHZBT1A2Y2p1c2MrYXllQjMvSnhrT2Vk?=
 =?utf-8?B?R2V0TmMzK0hvejVZNGI4M0RWaHpHOHlhL2NWMGViSkdUSXJYVWZ2VnJpTkJD?=
 =?utf-8?B?OElHbldVbGFFV3FJVW5Hd1VXdlg3c01LdE8zWjNyRHpPTkp3WXV1alEvVVpy?=
 =?utf-8?B?ZHRJSTVqQ01YbWZUWm03RExDWWdGaER6a2FJWFMycUJPeXlxQ0lSbVFnd1FG?=
 =?utf-8?B?WGtoQW54dDBJSGZwaUFyeXA2R3h3NTRoaXg2NlRISmlHSFd0TDlpSjRpNWV0?=
 =?utf-8?B?WkprUkZ0cGd1Zm1tODBvZWN0aEJEZXNEL3QwZjQyMlRCZ0VrV2R3UWZ5NzNs?=
 =?utf-8?B?K2U4Tkd4SzdXdkgyakpVWC83SXV0RUVXY2FBZUZJbVVGWjVVRG4vQkhUNG9K?=
 =?utf-8?B?V29aV0NmUUxhNDlNQjdadENjUGtxYm9qRFF2Q2JtZVprMjJ4VklScVFLRkNF?=
 =?utf-8?B?NVk5ZWFsZEt6czNSdTVzUVF6M0VMbjkxQktlWjNicXpLZGZFaFU0Tk9rU3dl?=
 =?utf-8?B?M0NFRkxveENpeUloaTMxZVNIeVhrVmMxK214Q0trTm83eEJxY0lzUDVjK1BT?=
 =?utf-8?B?WUMwYk1vSFdQa3dyYTU5SnAzRU1ZcHJUTDh5MVpNRll2allaTlJxU0NwRzdm?=
 =?utf-8?B?NkhkSUZ0Y2wyZlBoZ1o4TFRBYkRZSm0vcmwybTcyVUU0M1QwN2EyUEFpbmxT?=
 =?utf-8?B?ZDhXbCtFclpmaHJvbXErdENhdDBQSTZUWGR2eWE3Tk1qc1VTZVVkbnZJVmU5?=
 =?utf-8?B?VytrRVVvRGZLOXBMaG1FcWJjazVQaDV0ZFEzdjU5elY4Z2ViNmtTMGVPMzk1?=
 =?utf-8?B?cFhhZHBRa2YyTDY3NFpiWE50QXJWS2VZSHZEcWgxUURhOGJzUmNuZmU2R09X?=
 =?utf-8?B?ZFo5ZnJQTEdhbWhxSWpVVWtwR29yQS92bFRVUmtTeldGYTlEbDE3d2Z6OHhZ?=
 =?utf-8?B?MlNLNjhHS2FpZ1F5eU9mRTZBQTFNb0E2NG1EN2xFNXR3YmpaN3VUd09OY3A5?=
 =?utf-8?B?RXJTWFlUTDZzNUJHa04xaFNmVFJrb2podGV3Z3MwTWRjc2hBMzcxUnV1cmRt?=
 =?utf-8?B?MGY3SzlQWUJUc0lVTDMvTkR1QlZRTk9rc1h3R0IzUVpHVDBITDMyMUlCSjNm?=
 =?utf-8?B?SzdML1UvRW5CV3A5K0htQXRtZEhZSWM1ZXRnelJWODZ5SVRoRzZ3ZG9Fbytn?=
 =?utf-8?B?SGFKSk91RW54WnRDNHMzNEY1RmUxYnQxSTJRRXlrR1VIVEp2TjkxNmt5aXdt?=
 =?utf-8?B?YTlLeXR1ak1SU1MwbFZqcWRLNUJWaHBrVW9BQnB3dE4wZk8vd3NxK01OVlJG?=
 =?utf-8?B?ZzBQR3dOU1ZxK0NBcGVFNi9CNkhpdUMyZXg2dEIvK0V1bmdYRWVJb1EyL3pi?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69dce92f-8703-4288-0489-08dbb2a3373d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 08:43:48.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7mAhxru9VW1c/yFdj7n0+dXqmYEKbqRCj9zyj4K39TTTwrKeEAvFmxBfDnlgK53n8/0wjT5DHUtjsJiKHfav9x8iayEJ+gIpV/tnEnnjwDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5471
X-OriginatorOrg: intel.com
Message-ID-Hash: S7JEQWHHH54VCXJZ5H7UDW724AIMN7FK
X-Message-ID-Hash: S7JEQWHHH54VCXJZ5H7UDW724AIMN7FK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S7JEQWHHH54VCXJZ5H7UDW724AIMN7FK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-11 9:35 AM, Jaroslav Kysela wrote:
> On 08. 09. 23 16:36, Cezary Rojewski wrote:

...

>> After reading all of this again, I'm fine with rewording MSBITS_32 to
>> MSBITS_MAX.
>>
>> As I do not see any other points to address here and review of v1 has no
>> points to address either, I'll send v2 with this single change. If I'd
>> missed anything, let me know.
> 
> The subformat bitmask should be also refined/updated depending on the 
> selected format.
> 
> https://lore.kernel.org/alsa-devel/f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz/
> 
> It requires new code in pcm_lib.c and ASoC PCM core code.

Could you help me understand what new code is needed? The 
get_subformat() example raised more questions than answers. The patchset 
defines snd_pcm_subformat_width(), perhaps you meant that I should 
update that function by adding paramter 'format' to its parameters list 
and handle it accordingly?

Any guidance would be much appreciated.
