Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D23804FE63F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 18:46:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8614F18A7;
	Tue, 12 Apr 2022 18:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8614F18A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649781991;
	bh=1r3iUKCdec/ny3oVMfy3Bn2XvYr58LdBvwSphgEyWCQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A0ZaS+nUmFDBAAeLXkvo3Rgwm8Gu9zcRB7dDOoibo70ojsKdqFSeEAV+L3Z7OERPj
	 6vOaYf3ecnBzeZheu4NUzfAyfbqHSIZ9+ACu6wu7pQ9rnHzdlU7ZhdqkxQE1s4EBt0
	 og4hK/C5lzizzIh5GD6pTDcq0wMODPrV4Tisp7Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD1AF80245;
	Tue, 12 Apr 2022 18:45:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C45D1F80245; Tue, 12 Apr 2022 18:45:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00BA3F80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 18:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00BA3F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AVVbJWHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649781933; x=1681317933;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1r3iUKCdec/ny3oVMfy3Bn2XvYr58LdBvwSphgEyWCQ=;
 b=AVVbJWHag26VIiJE5Iy8PpGciG7eUEj4Q1tUG8AgFFT8kk2m1OZY9YrV
 oonefKkDwxhWQDrIM1K9p2YUZUN+E3Zx3vxYJgQz9/UTyrqcbKcewHuT4
 xEmUH5FmoBPwuMkTYULYVLnPAv1qoP57ykQRgdAYjHViit54SkQKs4IRJ
 wNOU4nLbZdIkmxcynT8Tz3dWI4rvvoOJ5o09fSF1z9HdaTvsvs3bDBiae
 WEmkfPKgvPMxeOOlpcZ9Z0LnfPbQC7FwAhRBmKH+G5+by9IgZu3VBEgq3
 pftK0qShkm2d+zNvnpXd9XI3w5xC+h6CFUXhiV0ujopgH0QhcdZoSIsrc w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="242376744"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="242376744"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 09:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="551801219"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 12 Apr 2022 09:42:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 09:42:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 12 Apr 2022 09:42:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 12 Apr 2022 09:42:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0eezcTSf1stzpv0kZszteuSBfvK4DPDXori5WoUC5R8YNPv0Lp+6SZIfVLmBrYeZJR5ZQkMtjq1AE2s7hoN/OzT/TSpKnrbWbmtMItTJIIW5B8fFq24BSZQE0AINVEzFwvRS+6MrdE1j6Ef1eBp6bLZuoCfEuFzz2EOcwHEzESRTStzE88r9LQo9uRzMkSbult3TfbI0a/D0Q/glgSWY1IjzwjLgJ+UE81+D2QlMXKeQVBdhdvXzYX4Ccm+eDhuIRoVZC4AvIVRBcNc0ggAs9kUjO86SYIBkqQKAlLv1wXzPzB40M20RWBaa4+rCU18Q2s7a1lEnqpJn7X/kvI0Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcD9KYom2SinCYA5wsIV3wboESfRtjM7hNPGATtfBpg=;
 b=YpURvuQ7DduD7kyuPWdmgFtutlSHzgCd8TIu4xcKGFrcxUNf647aPZ8/cIUpNFu0YLXtnvN5u61dnIg57zIgWhgW3dZ/+sAorZ8Vz5B/HNXAgCQyJeWsVDK3V6G5MU0tD4K//mk2fhBLqwAO0LVvlI7s2Drjn2FW3cqjD24wAdvX4WDd0FGaoOOLKSieFEhkZmxVlEanllw98DhzjYbKWhsf9VSOnKn8g7VSY7rIMd5ziDIH+C7fkJ5OqzO1Gdvq8Sy5Vt2LdkHuS6BSN9LZI4e2fePE1vuVSGacNf2N3DxnKpTMfScjRzIa205d0TEzdQkyEORdpiLnZbHc/WCBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MN0PR11MB5963.namprd11.prod.outlook.com
 (2603:10b6:208:372::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 16:42:32 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%12]) with mapi id 15.20.5144.029; Tue, 12 Apr
 2022 16:42:32 +0000
Message-ID: <df4e2b39-6b52-ce66-3ecf-d93bb089ee28@intel.com>
Date: Tue, 12 Apr 2022 18:42:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 15/16] ASoC: SOF: Intel: add initial SKL/KBL hardware
 support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20220411201727.77971-1-pierre-louis.bossart@linux.intel.com>
 <20220411201727.77971-16-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220411201727.77971-16-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b250e9b4-1a7e-4adc-8624-08da1ca37070
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_
X-Microsoft-Antispam-PRVS: <MN0PR11MB59632FB52441B6CE969CB5B5E3ED9@MN0PR11MB5963.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bN/rz0yJbcW345Oj7YpuDxIH0WlKi/Cd4UFIvHhoyqpiIAux7XUeuMXLgvnBf64w9JNVjbK4yiYCBg9hGZNaeDm9zIXj6HWZ1xvbOnA3WW2C/8+JKyS9xnlGd6Epwh8ScyJZ/J0gZjOVDNFWL7w1NbecYvcHXJQGSFOvRomBga1PSRoXrP6VUEYTOLph/SQOyen0Polq3liNTV7w2SEzPaZuN1Augo8p6ao4RcGKZv2sAfES/A5yo23iGKv0XgHtgPWn0h7iN9fVBlL12OoIcKljfvQf8S3lnZtgzFOWV9ImaKVmdpz7HcBSjLBVLOjIb7VSdoYtfW+Rrbwigi6QxqEpQkUi87S7hz3Q3JCUXBFuPT5bCBe9sMOnz1NCwThtQ0nQ6HZFsd83OukBPKc/Wl4VNdI8MP8lO8SgAqpGRkJpiuPywiMGqjtEW8cMcp8+Cp5p1fJAzh7dJWYYVQCWe8++QEk+2Eq9dh5T9mbMIaj61tKnnZe/Vz/j9mSytYegJiUKqbU+qlb86Es/zjlgKjJqcrlZY3wVMJr3DpOJD5UEbPejKGzP0SOMSZaM3NVvfgJkg/ELI3xEEBavoBtaC539u55PZwoK6P04eNDoZuUpfKlQzYWMkZV2kAaRJ1cMlprrW69h+xPGBW2Zbiub2jZ2SVO9vWia3beS+e0N9OoE/dcsX/7dch1Ye8OKalxj2U1QUc6tUPmyf5ZJ3m6ksGM85UUBanKm+u026mdVqxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(6486002)(66946007)(83380400001)(316002)(5660300002)(44832011)(54906003)(6916009)(53546011)(8676002)(31686004)(6512007)(4326008)(6666004)(6506007)(2616005)(186003)(26005)(66476007)(66556008)(508600001)(36756003)(86362001)(31696002)(82960400001)(38100700002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K280d3BqSWFVdjhHb2lZZ1cxaUN3TGpIaTdpcFk3QkJDa0UxZWZrd1EwVHhT?=
 =?utf-8?B?UlhFVHBMeEdJT2dIOHRDNnRYVUc4Njg2M3JxbmEyVGZsRSt1YjUyQ3RTclAy?=
 =?utf-8?B?SjhqZGtMbStrajRvbk1meUEzYzZxUm1lTFAvQi92eEh6YVJhUkxRckNudkls?=
 =?utf-8?B?SkZTczljSlNMeXVvYTR5aHFJK1N4c0w3YW9rNDVjYTc1OTlONXpJQ3g1ck55?=
 =?utf-8?B?eC90MElxK2ZBU0JxbnBoNXZqYWZOV0Rmc3hQdnVWQ3I4ZUJaeFBBeU11S05l?=
 =?utf-8?B?dFJmZHYzeGZKZFltUzlENXFvdGFwc1FQVURJTzB1dXlQVW1jbnkxdHhyaFQ4?=
 =?utf-8?B?NGxDZHNFcXB1K0J5K1RmOExxNmNOaDEzekJ3TXd6MnZpUjV0THM3MGYyQy9p?=
 =?utf-8?B?RjdxM3ZCUnV6bW1zcUR3aVh2ZloyNmtWbk5aWXBRemVjVXRzMGFSYmdFWXVM?=
 =?utf-8?B?bUt2ZGNKOEo3Qkw4ZDZ1VVIrdzd4Qm5LTE9VaGZnTEoxV3JaK1g1TEJVekww?=
 =?utf-8?B?T3QzSUtMeDVnUVhPU2YwVDU4azYzampJNldXbUx0aG84WnpNSEVsWjNXa0I2?=
 =?utf-8?B?RkpHWjNzdWRwVlBOODNUSEk1QmtGQWxyYXZ0OEdlaVkyU24rV3Nha1JNc3Vu?=
 =?utf-8?B?ZUpZSzgwcUZFaG5aaHdRb0NzdmorMFFKTjl3R0h1UlM0UU9FOUZuSWxuT2Vj?=
 =?utf-8?B?UjArTW8zRVVseVh1MER1K3Z2Yzd4SEROei84Zjc0d2dNOEtaRmdBNW5NMXV3?=
 =?utf-8?B?TEtUU0wxRnYxdWo5aUpjUEVKRVpLUWJ6cUFWSmdSL3FLZTBQeVdhOWJFZ0p2?=
 =?utf-8?B?K3YyM1hVbHgvUXJJL3BBZTM2MSsxeEw0QWRKamNWb29DQitpWnFPUnI3NTVJ?=
 =?utf-8?B?SGJveEVxbUJJU0tHNnVJYi9kZXhTME1MQldFTG9hcVpMTHV0cFlyTmlvMFJl?=
 =?utf-8?B?K0FDS09qbW5sSDRKVjNyQlA3VFZtK3pHc3FybmpjakIweUQ1a1NQMWgvR1pH?=
 =?utf-8?B?V2pRSk9mb3c1MnU5TEpLaGdpRDRSOGtEQ054ZmdjdVN0Wm1oUmxRNTQrcnYx?=
 =?utf-8?B?K2lpMHJkMlgzcVVOOUtqOEpjYVdzL010eVNSR0lKVWMraTJSNEdBc2dXN2NT?=
 =?utf-8?B?NU1XRzZWblZIRlZPWW5qK3Z1cklJRG1TSVBsMG9OSmpVUHNPWFIwRExNeGlH?=
 =?utf-8?B?OWNlUXBQbGtGQi9YSU0zNTBJUGZxZHdxUi8zdENNaG45N2NSeS9kSzdWNUdw?=
 =?utf-8?B?dC9DNmY0NkRFOXZmdnlnbTVMWDk3SmN6MWg4M2ZIN3MzZXIyMXdLQ1JiSTBP?=
 =?utf-8?B?R1JYM1djeGlORkN4NnJjbFVzNnIrejBKbm0xM2FVaHNEOG4zQWRmLzJXaEpj?=
 =?utf-8?B?M21vSW9zZ1dSVkg5cWUwSXJUZmhxaEEwRFdDRVdHa1QxQWZLMnp6R285TFMz?=
 =?utf-8?B?MGlqdVFNMENXQklIUVphb01Wc3hMbXMxOGVxdmJERHlJWWVtbDJjd2RsSmgx?=
 =?utf-8?B?bmtyS2p0MVB6R2hTQUtIRGU2bjluZHBLMlZqaGhHVnI2SmI3eGRQSmRNdTRY?=
 =?utf-8?B?cnlhbVZrdlp3V096SmhudWNJbHJnK2xDMVkxYzh2QkdNKy9nT1dxcmg0d2ZY?=
 =?utf-8?B?cVU4c2NVVm82WW94WVdJSFVxZmlMMlo2VTR5eXJqNXlwc1dsOE9kUXNSR3A3?=
 =?utf-8?B?d1RXcjVMMnFidHpya1UxREJjR1d1SUVUeWN6Wm8wUGFjeDl6ck5GazRyUW9t?=
 =?utf-8?B?cTBleXFrRTA3ejIybHh2a2ltR2dOaFpGWEdxZHB2NExrb21NRy9MejZ0cGRr?=
 =?utf-8?B?MzRON3hHQzlPczV0M0J5WENCdFFIZnhBUzhrcUFocGJCTTJmY2M0bUk3VThF?=
 =?utf-8?B?MjlTbVhPOWUrUVV6M2dLUU9LVEFjY1ZOTmFPOUFJWEExNS82ZTI4OGRaRGdx?=
 =?utf-8?B?L2ZwWkh5T2o0a0tOZnFJQ1RMcEdXSXRvT0txbEpNcVJSV0ttemNPVFR3b0E0?=
 =?utf-8?B?NERqWVZzbmlaSzgyTThBdG9jUlFiUjVuWExTY1hUeUFraGlabWkvQ3JaMDNL?=
 =?utf-8?B?ZFRHWHRxU3ZxUVhFdUI4WlpOOGxiTjd4aXg4ejBNZUFOK0lHdjB2MzRwaUVx?=
 =?utf-8?B?bFFTVDJhTVVrL2dVV1dVai82NGMyaENDSGtzbzdOb1BleEJ2WmE5K01PRjM2?=
 =?utf-8?B?L2N0cXM5aTNXTUpnVnFzTDk0T3NHTWtqd09PZHVIOVRjREhVTVNld1B5djFm?=
 =?utf-8?B?YXBCZ2MzQnRaM2tmOWVpdVBvUnpQd1pwSGNEZXI5T0VKdTJwbWYyQmpxd2NZ?=
 =?utf-8?B?S3VyTHhHSlQxZG13RS83MWtUUVhUUkJETWp5czVnRXdmSEhUZDZQUDVJOUZC?=
 =?utf-8?Q?oXYnSDdY7/UdWs0Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b250e9b4-1a7e-4adc-8624-08da1ca37070
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 16:42:32.0828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/haH7uDJJ5gWZtYxaxWyq/ptYjXv6crAEXGvU/aTNNYBMmoBevfjxEmeYB86YgstidikgQUOvLlL/rn9yM/pV1hhDHHetPnLOdJI8FF518=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On 2022-04-11 10:17 PM, Pierre-Louis Bossart wrote:
> In preparation of the IPCv4 IPC support, this patch adds
> support for SkyLake and KabyLake boot and code loader and descriptors
> used when probing the PCI driver.
> 
> The work was initially contributed in 2018 by Liam Girdwood and Zhu
> Yingjiang, and abandoned due to firmware signature issues. With the
> upcoming support of IPC v4, and hence the Intel closed-source
> firmware, it's time to re-add this capability.
> 
> The SKL ops are left empty at this time since the driver cannot be
> tested with the SOF firmware. The ops will be populated when the IPC4
> is added during the next kernel cycles.
> 
> Tested with the IPC4 and closed-source firmware on Dell XPS 9350
> and KBL NUC with HDaudio codecs. The SSP and DMIC interfaces are not
> supported at this time.
> 
> Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>   sound/soc/sof/intel/Kconfig          |  24 ++
>   sound/soc/sof/intel/Makefile         |   4 +
>   sound/soc/sof/intel/hda-dsp.c        |   4 +-
>   sound/soc/sof/intel/hda-ipc.c        |   8 +
>   sound/soc/sof/intel/hda-loader-skl.c | 583 +++++++++++++++++++++++++++
>   sound/soc/sof/intel/hda.c            |   2 +
>   sound/soc/sof/intel/hda.h            |  12 +
>   sound/soc/sof/intel/pci-skl.c        |  89 ++++
>   sound/soc/sof/intel/skl.c            |  69 ++++
>   9 files changed, 793 insertions(+), 2 deletions(-)
>   create mode 100644 sound/soc/sof/intel/hda-loader-skl.c
>   create mode 100644 sound/soc/sof/intel/pci-skl.c
>   create mode 100644 sound/soc/sof/intel/skl.c


Regardless if this piece should be or not, let's not hide the 
code-loading implementation behind "initial hardware support". It would 
have been better to split this change into two - one for CL, one for 
"initial hardware support".


Regards,
Czarek
