Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7BE79E113
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 09:46:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47BDEA4D;
	Wed, 13 Sep 2023 09:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47BDEA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694591172;
	bh=amd9ZYdu9NVaiqK2LogEIuyzMIgPZtvbfWAAz0zeVdc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZfkdpIJh3r2GIXQUNVWW/J6+x5YniRIW8SNJMdiWo518jYOv9dKywsX49nzk54ztb
	 sK2Ofuc/PCG0siwyCn+wQA5t7Gq7ubh2WHkdaxE+rSmk73wYccIj06NHM6cdpnHCJD
	 5hNmDUL0IJgdGk5uFpD+q2bAoI8cMI2CbVcIUGDs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96D10F80549; Wed, 13 Sep 2023 09:45:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C04FF80425;
	Wed, 13 Sep 2023 09:45:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19BF6F80425; Wed, 13 Sep 2023 09:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59C64F80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 09:44:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59C64F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Rp/bc1w/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694591094; x=1726127094;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=amd9ZYdu9NVaiqK2LogEIuyzMIgPZtvbfWAAz0zeVdc=;
  b=Rp/bc1w/Sb/8Z86BJMewMQZKlgyhn0te0jQo7TE4ytkwODEpRKKKFpdL
   6Cx6VFd2iLBa04GVfDi5TewPTlIr6At5TALvHfF3hGSamTkBfiNhzo9Om
   2RCxwmsUUwxtAEEnOBzIYPkBuwLeVrL+K+z6QaMjFeZETjT/NK7S3pXZV
   NgUPtyrfpI81HZr2Xp1DjzcoJ+OHMpJjqSxb/1xRCwo/Vwba/pn0dX6lK
   WFNQ0seiS2Bv3YYC8eN0q+4DYmh4tzFKZ/1fH9dE1uOeMaicueZMqirbx
   7o0zpcuWY0HzL3HFEO5PuBQkM3t9OtbNMJ3yAC1TtZpUQACtAg8yPea+J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="363625753"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="363625753"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 00:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="859151916"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000";
   d="scan'208";a="859151916"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2023 00:44:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 00:44:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 00:44:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 00:44:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 00:44:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9VM0+G63LrS6NuID5vt2i+L6nKx42ncjICQHr+EFFLxk2LRdAa49U4RRPFXz3Gq4ujWGE0bE3eU0MwynR3qC9wabjNfAHChFRoir64FdeGL3Bsp9UcWx+n0sSIYDb2WEXHe0EKLxyeZP7xqt76mclbxnEYnpgbP092x2vsVJpzdothL96M49kJfFis2JsTybENPG5AuSaHsGiwmpN/8exgGRYZg+UT9g0LwOpzPXGwIfdxXuBOCq99NelF2lm4m2ZGKmarHDsYl53Jr3+5aWh4sLOpTFzp4NeBmQL5/wwaQKaLTjQGo9/J7+xh+KiKekcIBDC/zq5V6KpdK9Q5Lmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoUd3ESYPFRVDduzAZusm42wewSM7km4hHpEhCSQ+zs=;
 b=Srv1ia7/Merrl6oowmKZp3tuGmG7kqJjycK+N3bGn2PQiAC8SmUwGZS80tFhpLmCY6D88KB8NgFy9ku3v+/uoNcIBEZgu0hwP7wtQTgnq29Wf9LL5pumcxHdCLwHRmTkw4Pb3sivsnk8pBculLDup9Gzk7iGD7Kbx2saJZx6dVXkCLfs6wkCcaElHfjha8+hOgsVU2K9grJKpqclYkdFJyEcS8UkCLFTXNmiBJH0hIY4Tg6LgzzZWYsOngB7PHzXTVZpk8iDjN2SrL+aImq9obG0rkIsv48/ju4TnKBQdBF5Ewlyyr4g5jrUBuX3Xu3OC2t381RZqMwb5ziVR+z3Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH0PR11MB8236.namprd11.prod.outlook.com (2603:10b6:610:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Wed, 13 Sep
 2023 07:44:46 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 07:44:46 +0000
Message-ID: <faddd2c6-78fc-beab-1960-ba024d5a7a38@intel.com>
Date: Wed, 13 Sep 2023 09:44:39 +0200
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
 <8d76a1d8-e85c-b699-34a0-ecea6edc2fe1@intel.com>
 <fe7af3b9-2393-d8eb-221c-03363b281a26@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <fe7af3b9-2393-d8eb-221c-03363b281a26@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CH0PR11MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 0555d38e-06ad-4859-ded8-08dbb42d4d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 RMiBk7xZ1J8pPFjQ6QaI9fHRkcNEq3MYY2Y7CxrhiJJiVuxJMrOsCeWZXt92gl0C77MgFTPqbkoGiArLKCPX66JzhFY+SYuRzt2cCsaZrElkkDOjJ4ABnm6wINeOMDAejpyVjMZWEPtpDNn6ybTv5oCURt+wb93Ds5m+6fCIK/HZvvcAGFTMYbcHw9Kjtg/bet+ld1vPyOOBd9Pte8LrygSvJyaunxIsrGGxdeNy5B7A/iq1htDJelZ0OP8elkwnNdg3NY1823zeXmTtm2VfEIx+wKh1vq/PN7FZfHSD+WqeOj/WbydhVMjyC6uooI47U5P0IJ6qV0zA2WNz7oCzIH6OeCeZjgKKK87rrMFvaz+iuGIqgZLbCheQrpv/4F7KX0Xwlwm3rvzYFQJdLXTW6keAGko+KDoGrW/+8r+6Ze5B3TRsP0+s08X+uhWcgub3uBleJ0go4BqrdwmG4xi18wj36oGNyDYTlKncH7Np9HLuSjcrYatBunuSFafz7t+maAljJSoWVZ0zhS2qUFnuL1XQANCfOm7C3vG7qOctA4ahB8jzCOh6gQ3aO3/k2+0KZ9/ccKEiaYZuaqTLbAoiVB6lvQsAt+DyvlkfcwDJ4KbtGka/E3axWBYTowdaDlXj1eV+CU0C1o7x1Agdm8nEJA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199024)(1800799009)(186009)(41300700001)(66556008)(66476007)(54906003)(66946007)(316002)(478600001)(6916009)(966005)(38100700002)(2906002)(86362001)(31696002)(36756003)(44832011)(5660300002)(8676002)(8936002)(4326008)(26005)(2616005)(31686004)(83380400001)(6506007)(6486002)(6512007)(53546011)(82960400001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?ZnN2SXY2QUsrNmFrbXpqc3gyNWhXQ1hVUUVRcUtSVjBiL0UyMjBEemFuNG9N?=
 =?utf-8?B?SWorQUIyN2YrS0FoM0FNTFAxUFB6UzlKNUxaSUJrYjlYNTNzUWlZUVRpQ2pv?=
 =?utf-8?B?RmlXdW1Ya28wR3FuTE9WRFZ2WFphYTM3ak9OcG4rY05wWEhVc0kwOTlNTmNa?=
 =?utf-8?B?TmtWSGlGNldkUXgyNm1naWZ1ZjdCUXJySitVb3djTHBJRHMvb09VRkFlOUZp?=
 =?utf-8?B?VlRzVyt3UkFJKzZpdmlrbWM1ZC8yVmg1alRqOFEwMnVxU0FUWXMwdFdDeWE2?=
 =?utf-8?B?cTZnWXB3SFMzVXRjYUsvZStQYlMveEVNQmpLUG4zZVJKRitNKzM2ZHlaZHNk?=
 =?utf-8?B?NWxJWDN5WUFvYkYrSlFoQjZ2MkN3dTRweEJTb2F4bE9lR1VQYTk0THN3ZEQ0?=
 =?utf-8?B?TElkRnJUa1pFOHpoWWZVMkNpcHJJY1dUTm9IVVdTcEZQQkJCKzhKeC80akxT?=
 =?utf-8?B?bG9TWDNDNHIrQVJCRHpBSUp4TXhJNTNUeDJUU1ZaZnNhdXEvWkZIN0t0dERp?=
 =?utf-8?B?M1NTL0EvaHp1WXlGcWpSeVJCRE1Qb3UxTkNtYVhBbnlwbkFyK0pRY1VmUnZo?=
 =?utf-8?B?c2puOC9ZSWhEOFd0djBFMVRpSjc1Q2JITlFYeWMyRjBtM2hGWkkvNHlUcEo0?=
 =?utf-8?B?MUVrbFlsNmZQNldjb1cvOXdKa0ZxRlhrbGpVYnZuTXN2Mi9uMDB0WjV3Qm5m?=
 =?utf-8?B?cWxNakhrTUJLZ2tlbzNzWmREUXhmNnVJc3F2bTArQTRMcDI1K25vc05WNk1k?=
 =?utf-8?B?bU9PSHQ1Wi9OcHpHT0pPWnk5UHRqVEsxU0VXcWRoRmpKMnZKV0hSdFQxM01o?=
 =?utf-8?B?QmxEYjhZNkVwMWc3WU95NExDVTVvNEI2MkdrZDAzVDFTVjIxUUVYUzBVM2NZ?=
 =?utf-8?B?bmJhZlN0Lzl3eDVnbVBSRzJVbGZrVldicVJuWHI2eFJ2cUxUY29TMU1OMTcx?=
 =?utf-8?B?cGMyZXJtYVpiV3ArT2xRV3JXSEJHcWlic0dOWWIyaUpoNjIyR3Q0VU9wMGIy?=
 =?utf-8?B?U2lVNVZQd3pWR3JvNFJlRzdrT3JLSU00aUVXb0wxaDJtWHhncWVjT1JJY2ZJ?=
 =?utf-8?B?MTlITUV6ZzJCR2ZDVURTTm5ycUpRKzcrRlJCck1OOFJrbzNIOGZrdnZrYXRE?=
 =?utf-8?B?dy90SVh5V1o0d0xNU3djN1NnbWdoZkpSUlVwYzNvaS9pWjd5a3ZOdUR6cHlH?=
 =?utf-8?B?MkNlb05uZkVWWHRURzlsUWtOTmpJLzlkWC9JTVFnT2s1dnN5azVhVXBId0Fm?=
 =?utf-8?B?anRsdzhjWTZFUS9ObitRUmJEQkZlUnpRUjVsWHN3QXFXaTFtTmJYTERjbkJj?=
 =?utf-8?B?NzIzbmk1dmZ1YzdNQnZjRER4SCtaelhYNFN0TUs4WFd3UmR2Vmo3QUZJUzBP?=
 =?utf-8?B?VUwxd1ZjbzFWK0RodnJzYkErSlh3Vzl2Z2tKd1pUOFNaY2VlYjI3L29KekNs?=
 =?utf-8?B?RFBPUGlFYlRIWjc4anNXbjZVeHhQMmtlUTVUZm1VWTQ1L1JDSzNMSUxpNXJp?=
 =?utf-8?B?MGJ6NU1BOWxZYW9GRDZoNHBtZUFsMmY4MGdSbHJ5V0NSRjJPaUh6MDlTRzdu?=
 =?utf-8?B?emVYbHN6dlljUVI2MFBxcG1tV1RaVnVpV0gycjlEUzAwSXJRQUI5Wllpd2pS?=
 =?utf-8?B?K05mRkF1UzIrWG1RTFdZUmY0VHVYbm5QbzVNWWgrRWVxRHJWY3d5SFA5VDZQ?=
 =?utf-8?B?aDVXOU5jZmFlalZUVEhCMi9panViSnlIYWg1Y0JOY1JaOHBzVnpING9TcGhL?=
 =?utf-8?B?TmJPd0NyMDViVWprcG95L2ZxRWc0akQ4bEF4NVh5MkZUK0diQ2Z3M1JRekFx?=
 =?utf-8?B?bUJjczZLN0dlNGthMU02d21qVjZvL2FxQytKSVRzUDNZdE41TUd6bXlCRlY5?=
 =?utf-8?B?UWhDMVlHT0hlOW9LckFheWE0VUptNk1iM0svQy9LSGJUWjJQcWlDV1J4VG9J?=
 =?utf-8?B?aVNWUjMwTzR4MzlQeFkxcVZNSW12NnJXQlliTmZQTTQvbnFIODFmSmlYcE93?=
 =?utf-8?B?NVNUdGM1aVVBRVRRMEM1ejdtYjY2MHA2dUV3cjI5TkhpTnZibWpBK3dJY2py?=
 =?utf-8?B?ZEpJRXg0WkhCaTlZMmxZNnZYMFBvM0hHSHY1UUdnUUw5VkgvenFESWxjN21i?=
 =?utf-8?B?c0tpbDAvMHBiUU9QU1cvZVdKeUVyVCtzWlJZSDJmUFV1c1pGdm1FeUF5Q2gx?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0555d38e-06ad-4859-ded8-08dbb42d4d38
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 07:44:46.6707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tuM4VcxcQOV8i60S1YLC4qtvZOVWHAbe8Uhu8trWz5N1TcwEZSpNFHKFs1GGFIqHfUaAMTMVm5e2uin410XNE2O8nf4mxji5p0k0pTrVK4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8236
X-OriginatorOrg: intel.com
Message-ID-Hash: 6YDBZQVBWSCGKTPCT6EB7EODB2FJ65IA
X-Message-ID-Hash: 6YDBZQVBWSCGKTPCT6EB7EODB2FJ65IA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YDBZQVBWSCGKTPCT6EB7EODB2FJ65IA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-12 6:30 PM, Jaroslav Kysela wrote:
> On 11. 09. 23 17:45, Cezary Rojewski wrote:
>> On 2023-09-11 10:43 AM, Cezary Rojewski wrote:

...

>>>
>>> Could you help me understand what new code is needed? The
>>> get_subformat() example raised more questions than answers. The patchset
>>> defines snd_pcm_subformat_width(), perhaps you meant that I should
>>> update that function by adding paramter 'format' to its parameters list
>>> and handle it accordingly?
>>>
>>> Any guidance would be much appreciated.
>>
>> What I come up with is a hw_rule for subformat that I add in
>> snd_pcm_hw_constraints_init(). That piece, plus both STD and MSBITS_MAX
>> ORed into hw->subformats in snd_pcm_hw_constraints_complete() make
>> things spin.
>>
>> static int snd_pcm_hw_rule_subformat(struct snd_pcm_hw_params *params,
>>                      struct snd_pcm_hw_rule *rule)
>> {
>>     struct snd_mask *subformat_mask = hw_param_mask(params,
>> SNDRV_PCM_HW_PARAM_SUBFORMAT);
>>     struct snd_mask *format_mask = hw_param_mask(params,
>> SNDRV_PCM_HW_PARAM_FORMAT);
>>     snd_pcm_format_t f;
>>     struct snd_mask m;
>>     int width;
>>
>>     snd_mask_none(&m);
>>     snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_STD);
>>     snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
>>
>>     pcm_for_each_format(f) {
>>         if (!snd_mask_test_format(format_mask, f))
>>             continue;
>>
>>         width = snd_pcm_format_width(f);
>>         switch (width) {
>>         case 32:
>>             snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_20);
>>             snd_mask_set(&m, SNDRV_PCM_SUBFORMAT_MSBITS_24);
>>             break;
>>         default:
>>             break;
>>         }
>>     }
>>
>>     return snd_mask_refine(subformat_mask, &m);
>> }
>>
>>
>> However, this means snd_hdac_query_supported_pcm() becomes confusing as
>> you need to MSBITS_MAX regardless of what the codec supports.
>> After spending additional few hours on this, I'd say I preferred how
>> things look with MSBITS_32 instead. STD and MSBITS_MAX existing
>> simultaneously is confusing too.
> 
> This is not a correct implementation. Many things are missing including 
> the proper subformats filter. I sent my own version here for discussion:
> 
> https://lore.kernel.org/alsa-devel/20230912162526.7138-1-perex@perex.cz/

I do appreciate the input but I expected that, through guidance, this 
patch gets updated. Sending a separate patch, not connected to this 
patchset - not even a single reference within the commit message body - 
is not nice.

I'd rather send v2 with your patch incorporated as a part of the 
patchset. The subformat improvement alone, without showcasing the users 
is confusing to the reviewers.


Czarek
