Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA2A54C37D
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 10:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E4E17B2;
	Wed, 15 Jun 2022 10:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E4E17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655281869;
	bh=RqKbyfYoq50Fz/QqxNXEClorMifPynRVMxzM9QWqHH0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KtICrM7D72Xd1E6WgDvrXX8TcsqopFjyHtWO7fkj3X6B9ccRHXgAaJvdHT6Eq0jCc
	 NhKfY4xfeS3vcFDQxyRBQNNrdlLVu55zvmnGulLE0zRkCjRAAj8jHROo5B/Rc1iQR4
	 8rYJzG8jhIynshb2r/SmBQunjMVdxvBenUfFeY4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88408F800D8;
	Wed, 15 Jun 2022 10:30:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F38DAF80162; Wed, 15 Jun 2022 10:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0725F800D8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 10:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0725F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QPULYb7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655281804; x=1686817804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RqKbyfYoq50Fz/QqxNXEClorMifPynRVMxzM9QWqHH0=;
 b=QPULYb7OBMUci03cLZY9iJQy9FL4NkKSPAS1v15JyWFYZOzTmxt6wy8U
 Ow9dwFuDSFAxyJgOkYfDITMoClvGRK5y9f24wmcaRKdRu+eHC1CPLAWSH
 QROYrMneMD9EPwPWHsNIluw2EjMUm0InceJ10djp6xL4qNqQryGK2D/AZ
 bofX9rPN81Hzp57LVof7i8k+6sZQQsR7vq6zoJityl0Acf+p5v3uOZS00
 Fvz7D3fWu1e5A2r6GCpkKiYXqgsYqhzE1xG46TARC/0r7/6Q8DP0Ivujz
 E36nFzz9/rqk2b2ICLSjm47fsCh6J1sgzK0okKoHUatruFwdI8Pb8Zcrz A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="340543699"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="340543699"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 01:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="687175570"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2022 01:29:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 15 Jun 2022 01:29:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 15 Jun 2022 01:29:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 15 Jun 2022 01:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItlcQ1QDV+ohL9vowmRvI7f5os1Doq2HIbKuqGpz+s+13LhxZy9ENZh2JcSYC9mKQg8ThToeZqVi42h74eXQcuKdV6UKcQN5H1Xo51a2GO2uvlIlDcaUYo990Tf4bprHxz/+75GR8Wrts1EanWNq6HKS9OJezB8J2b5RyDlFr41AMPX8R7s+bUuyMNt6U4IPhmHD1qpr5OumhYaWMra2yzZTnnYVemVMCHyyLC+LUo4gRpoRnYBMmbYdr0/dTUuP1lnGsSfF3U6Wo2v8MwhMRKYIPuUXISViNUtFUkQD+zyHHJ35ljMmfajLNVe5AZPeVRJPSADQWqghuAWngWBPBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU8JlKiBM9BeGdikNmSVcN7g0dKDGPKtNIwsp62WWOc=;
 b=ZjFDArnijZBQJuyryDx7h3/FDOWyrz8YmLxqCpZj+C9chXRNx3YyvNdqQlRbkqxhc9aP3k5rht7iMDTgrQTBqvILzp8L3GFKbOL/0ROtdbb596fQifj5WcWv/5Kjfspx61HY5PL5z6aWwvBb61jfKuRgESCom2c4HUdevVzdXSAAIgkabgLZdSRV8XN/4+qkF+7PWqzOogc3LsttbhQvkvB+JdZDTep6n/SBLbY5uNx+481wFIFnaLRWqWLO236sr0emI6HUZRy/81QhRbv+vNoI4fp+nzqysg9MeUaMrI6bmcEA5Vjv2vzzpCYTuyneX4TvlTAuJTRRVd99i3OFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Wed, 15 Jun
 2022 08:29:37 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%9]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 08:29:37 +0000
Message-ID: <bacd42b4-d251-fec3-cf4b-55a59a27e8ad@intel.com>
Date: Wed, 15 Jun 2022 10:29:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: ACPI REV override for Dell XPS 13 9343
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Dominik
 Brodowski" <linux@dominikbrodowski.net>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, Mark Brown <broonie@kernel.org>
References: <29a2ca0f-bc0a-04b0-d0c9-8658359d365c@intel.com>
 <47431e56-9acb-7c7d-307f-83d81956ec5c@linux.intel.com>
 <fb13198a-3d38-4304-6212-966561725d55@intel.com>
 <398e4885-736c-d9a9-a18d-34f69f2b63ca@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <398e4885-736c-d9a9-a18d-34f69f2b63ca@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0774.eurprd06.prod.outlook.com
 (2603:10a6:20b:484::29) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8260adf0-baae-4ed2-359c-08da4ea92f36
X-MS-TrafficTypeDiagnostic: MW5PR11MB5907:EE_
X-Microsoft-Antispam-PRVS: <MW5PR11MB59076B32F52CC9326250470EE3AD9@MW5PR11MB5907.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f0KiePPtjuRxTIF/kHFKb7x1cal/vQBpAO9sjvrgXARGfIM5Lr7J2mvoNcDshECXFDhaijiwKtB6vX5QYMD831GPR0CjxrD6Jq6du9QIVaOTDaHelvVQeeBA7qV/cTNonl0vmogVMGJVuryRpz9gYTdypqM3ygz7bsyMcF9zqcYqFf7Ve4emaDvdZMF1KpVbiueLfHwp2kS8XPXoxmspHdm07kblKbvMQAQlbW5Zu8ThaSnIqi5FBPaVWcgQOPK6/TINuO8zcMEx0oLkYv/JPPUWxWoNA0vKnnntKR+xDeOH/hk2jxUT4CgHP3DqON+CRSNR/HHmy3wzelY968xuSO2R5uCcamVKsrnYmp99tVKRcH19cpmD2KykVD+oUUScKXlMEtbFhN1JSooHU0U6Ult0jFPSiQdUFd+e0JesV7jeQBVlsGz8WiRtSuw1uOKnhimMfV8pxiIEj8U+s/Cse7JC+6ZaaanqGkrodsejXePSLWp37LovId/Nftvx2NjQPCOU8GljvQ/nFFZFd3hMMLgFrjHJAvB/Bb6RikymvL7N3AfIuygd23XRUED3Tw1nBbyHTPBeaE2tWzkvBJzqav02lYaIeLOEdXuhwW+JWYNlGUfKcyQdMY8XPCu1GhR43U7Xo4LK5/60dGflQWn4o50dzz464eiYLTRtwVMPKuUr5vlmxwY3wQj75AsCXFrF5qUV3YAzNdtWorpGElnUcXiOVuo5fb6goIJO2iWxo6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6666004)(36756003)(53546011)(66476007)(44832011)(316002)(5660300002)(4326008)(2906002)(8936002)(82960400001)(508600001)(38100700002)(186003)(2616005)(110136005)(6486002)(8676002)(31686004)(54906003)(31696002)(86362001)(26005)(6512007)(6506007)(66556008)(66946007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdZWXVkanlRcjBiYmhvQkRtTjNWTjUrTVI1Z1FMdnJmQnJ3cmJ5V3pqVzZN?=
 =?utf-8?B?LzNsQ3A3TUJTNi9MaklETU1paEhtYkpSdHFpYnZyUzFaWkU5dWgxNjlVYW5S?=
 =?utf-8?B?dHdrbmVKUE9GR0MwRTBadzFPOGZZREZ5ZHlrY25OK2FXTmV1Z0JCSTIza3RY?=
 =?utf-8?B?RzVtYlpjblFqRnIzMnI2QVJzRXBPZkhIV3BKZS9qSlNFKzFENVU0ZGxlU3hU?=
 =?utf-8?B?SGVvcFZKL3VPZ1dHYUxjVTJVR2xQc1l1eXp2ZHFRdmdydXJiTVBFWHVuNDl6?=
 =?utf-8?B?ZXN0NUhNbEZzNFZHbzdVTmpGd04wdEk1MHdtaHg0V1l5cHNYZUhzWE9iRGV1?=
 =?utf-8?B?dE9sM1JFRWovS2ttVlh2L1RucDl3QjQxK0VZTWhJUVFkd2tHdU1BcWtMYzN3?=
 =?utf-8?B?d2ZIaUZaRWdUYjZzMHhqMjA3UXB0aWxXcHhEbXh0WERCaUFxbGNNWU0xMnNR?=
 =?utf-8?B?SGhLOTJWUkgrYksvVVg1SDRpc0NjUVRCVkNnbElOZDVzQ0tFSEllZWEzQVlr?=
 =?utf-8?B?MVNlMk9ORjNqTjZLeU1rZFdmRWpKbm14bWc4VkdaZEV3ZVdHZUsvM09ueFlK?=
 =?utf-8?B?NlRYbnhXd0pxVjFJNXdpTVZ0YXVoYjBHK0drRFJIbUN2WjJhVlJRcmZieE1l?=
 =?utf-8?B?TGtLNmZhL2JSK3VIZCt4NDUwT3VKU1JlOEhSVllTVmVIQzBNV2lRUU1wakw2?=
 =?utf-8?B?R0F3TmRwNlN6L3VtdTFUVHFPS1J5VUhXcTJFbWphbUEvRENlYnU4V0pYVUJ5?=
 =?utf-8?B?bDZlbUdkWnNRVlNiK1JMM0h3TWg4eExkbHpQQ0RXTkdNUXBuWk5VU0toS3JI?=
 =?utf-8?B?VG5CR3g1bnRHTUZ5MDEyYTM1UXpKQUtBckVPaU1ER3ZwV1p6NXZOSjA1WGhz?=
 =?utf-8?B?MU4wSVdVYUhDeGsrTE1mb0NaK1huVlJRemdSUnYzQ2NwMm5XUFRKdU1uWWxi?=
 =?utf-8?B?SWlsa2ZxV2ZBQkxxOWo0R0V0a01FTzd0WVlXZ2VFOVd6OEp1VWU5QVhxMTUz?=
 =?utf-8?B?UVd6K3VyMkUrZ01Cc3JLUU5GVG40N01NUGlJdWp3N1B6RFZMTmEyUnlEZDkx?=
 =?utf-8?B?MzFxWDN6dThkWmhrMExZbjJsbmwrVnlYdVdJRG1DOWtYcW52S1BLbWhGa3ha?=
 =?utf-8?B?K3hVbGVCWHVmQzNEQnFVTEhXOElKK3ZvWkNjNGZTQ2tuMmIzS0JmU0FPR1pp?=
 =?utf-8?B?eDJvVHNGaG83bE5mQU03ZGozNFl0U3BibHVmU1pqamlpRE1JNWpqNGdCcy9N?=
 =?utf-8?B?Z1V3anp3ekhPNTQxNjRpN1hwQ3VXN01kMTBZMDFvZTkzc0s1amJGNTA5Y0JS?=
 =?utf-8?B?YzJKN2tqY2I3YnVNL0pIUDBqc0NGeDduUU5yWm55djdnZk1rVFUzMi9POUFS?=
 =?utf-8?B?MFdsb0JaYkpaaEZ6SUpmV28vTkJqY21VRnVLSDh0L3kvWTNJcXQ0ZDl3ZEZO?=
 =?utf-8?B?cG5ZdVVPTHZhRkpwd29NS3Rkd2E0VFBlakRYRXNiN0syM0cvS2RyeU9WR0pV?=
 =?utf-8?B?R3JsaWxFVXA1QUlFbGgyMG53Ri9hbkdua3luc3ozMWp2NEgzbjJpM1hVd3pj?=
 =?utf-8?B?YkloTXlkbGF4d1FOR2trWVd1OGY4aDhQOURzclptYzN3a2hPWCs3QmVkZzNo?=
 =?utf-8?B?T0JDY3RvbWdFUmE5eUZDNmEzK0Y1Y052Wm1UTHZoeW1qVUFvRm5meFBFd0Z5?=
 =?utf-8?B?ak96M20vUXBHZ0NQSXJpWEt4Y3loWUZDNDNqMzZqSDhwU2Z2Vy9CU2hIN1ZJ?=
 =?utf-8?B?OUhZM2YrTW0rUEJNNi9mS2hwdlh4ZHRFcERCRDNuYmVGU0hFTWExWStVSkdk?=
 =?utf-8?B?aTFYdVFPS1U0NitZbjl4Z2ZXdFNIRXhuSFhTMXYvZWt4R25Xd2RIN215bnhT?=
 =?utf-8?B?QTlRTjh0b2lZYkZ4Z01ySWR3b3dxSWFFVFhidVJER25qQU5lNnJmZUVoWG53?=
 =?utf-8?B?bVM3L2Rxd3hQVVovcTZWYWpwS1p1TVYxekdDck1CdmxyRk5vV0s2YzJiTjVt?=
 =?utf-8?B?YnduOXM4Z3lYaE9PREFlS0txY3VpS1kyaW1Pa3I4RXMxU2Z5UnBnWm1lTXQ5?=
 =?utf-8?B?WEsyaVRUbm8rSkxyWTQzSU1pZkd2K0xrOC9lc21wYXI0Z01HTjgwaDB3Znp0?=
 =?utf-8?B?SlMzTGVHNEFleml2NXY0clIzODR0cnNyQ2cvYlZuYVBLbklhdkIwV1FhUW1z?=
 =?utf-8?B?MFp4SkpZVlFmUlA3WHNwRXJ2c0h3QWJobW1uZ2daRXJDdTV4MVRsYklta0JO?=
 =?utf-8?B?aHlFY3Z5WlhaS0tJZTFnT3lCNm5rMHlhVlBnUnY5elN2NmZnWGY2R2NtazNH?=
 =?utf-8?B?UHVNMUtaY0g5ZDdhMUU1eG0wMXluVm1LZ0ZvVEYzczYyb0xVQWJ2R3U2aXVh?=
 =?utf-8?Q?E4YepojV6tQU2U1o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8260adf0-baae-4ed2-359c-08da4ea92f36
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 08:29:37.7054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enXbvD7MtXrt2m/p3paA+XSHd9ksYWFdoN/8eNTJRs3ef+SHLPJ2vk4Ku0Vazwt8Af0Y66Y8xlTOwLa0Lcns6OoNhOHnGKzbrb5qK5Jz3oI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
X-OriginatorOrg: intel.com
Cc: Hans de Goede <hdegoede@redhat.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
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

On 2022-06-14 6:51 PM, Pierre-Louis Bossart wrote:

>>> If it ain't broke don't fix it.
> 
> to clarify: the HDaudio mode works just fine, there are currently zero
> issues or missing functionality reported by users.
> 
>> Not much of a fan of the last statement. I believe challenging status
>> quo is the right thing to do. We do not want to bloat the kernel with
>> unnecessary quirks.
>>
>> The broadwell-rt286 UCM is part of alsa-ucm-conf repo for years now.
> 
> The hardware supports two modes (HDaudio and DSP + I2S), the former has
> been in use without any issues for years.
> 
> Even if you make DSP + I2S the default, you've got to leave HDaudio as a
> fallback, so there would be no change at the kernel level.
> 
> It' very very hard to remove stuff, and in this case there is limited
> evidence that distributions use the DSP + I2S mode. You could deprecate
> the ACPI_OVERRIDE but you've got to leave time for distributions to switch.
> 
> Challenging the status quo is great, but let's keep downstream in mind,
> shall we?
> 
> The only option we removed was Medfield several years ago, but we had
> clear evidence that no one would be affected by such a change in the
> upstream kernel.


If the entry has to stay for the fallback reasons, then it can't be just 
removed. And if so, regardless of the default it's going to be there - 
no point in providing a patch.

Thanks for the feedback!


Regards,
Czarek
