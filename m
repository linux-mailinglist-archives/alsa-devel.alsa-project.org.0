Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B850ADAAE7
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jun 2025 10:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30FC8601F3;
	Mon, 16 Jun 2025 10:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30FC8601F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750063078;
	bh=mXBN7OxlejyL7pepBjYta0bkWyGKqunFy2aNiujh2FM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p0c+KXC48DLR+HFjLC9iInI0XNxKRF0/s5KI98P4ptotsmFQ6BkwzKpTJHgix1H53
	 Nw1bAFgPKxHAlTbSpfJhoZ2OEFJOL55V8Qvsw83ICooMxHnybWyANgiYautjT7Cqbw
	 lPcr3afWTsxEFqk+VQtIG08OGLRFNt4Epfk9pLUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECF52F805CA; Mon, 16 Jun 2025 10:37:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9103F805C2;
	Mon, 16 Jun 2025 10:37:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 291E2F80124; Mon, 16 Jun 2025 10:37:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1F61F80100
	for <alsa-devel@alsa-project.org>; Mon, 16 Jun 2025 10:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1F61F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DTsSDd/H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750063038; x=1781599038;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mXBN7OxlejyL7pepBjYta0bkWyGKqunFy2aNiujh2FM=;
  b=DTsSDd/HafPnauYP9UMG282VUQzBKSSvEa16DxghKWaUL5/pz/Dt38Qd
   VcaJB0Zg6IoiXy9LVERRZxswNw5sutcuEavjimGDciWAelZxNz6VZXxaa
   WbxVcD9pYeRT+RaHqF3zrAQ2/D3TbGTDLAZcPWvIV9oFAfJ6Mmi2WxxJL
   R/nnec5Fm7v3txK4i0of7jzqbLXWeFuqw4DOyLjt1tLt5M0+/7j4obNxX
   6a54pS7/qgOMZiBGs0hO785oGOwlmfK0HVZttrN0sz3TOBCXdCwAQzU+R
   6HiVm03UjPAlj4tCRo2TVJgDPGG/5ce0rTPwH5AnbUQCvabHd65bggElx
   Q==;
X-CSE-ConnectionGUID: o3DpMNXnQNi2NkT5QQ0w4g==
X-CSE-MsgGUID: SCSVJd+TRrCMSOSziOMZeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63612864"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600";
   d="scan'208";a="63612864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:37:12 -0700
X-CSE-ConnectionGUID: lP4xYbzsRy+b9Dtb2daGdw==
X-CSE-MsgGUID: FBmI90w+Q2Wc9PEGCp/OPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600";
   d="scan'208";a="148255309"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:37:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:37:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 01:37:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:36:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V25AkWtbXs96lhTFslEPnenEzdRAbvkCZBRC/nAkg6U0hM7NsPKdELLqjO539xvBuApaiM/Z0OAMAsbRS6E+pu8xMXB/Mvofucuy8u5bZ4Ee3tNf6TW+qbhNrc/XJrMmDxs/xinOFSBOpfe7FpkwPPewTwkfvtb0pTFRhyub/iCAzA8sZ3p2rjg8TPpZaSdg+o+CVNWpl5xCo7Q3+sLMazmVmVD/nmy2sPyUmGDM2L0bbeucktZcfBdjPBx4f5vf2ukxKUS81cGU7iip/+NUH3kauzggHdve3CmMvNmZVKkTB1hAUnoBLIC06YqpWeHTOH5UArfCwCmMp5t44zEbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asuTW+XSaTp2t0a+pv2IJcm6uCFAaX19F0gCOHLceS4=;
 b=x70QcHkPeer0rvaDQAvqlik7Ya8/oxseqaiJ3wq43tV6ilkIDXzERUfnj0IL5M2kjHKuX1tZOVplVtbnZF885iXAWh1rhp1ShjHCB0wN+DdH49rJMAyMlt1weoxser0+zKU3CYB6RprHOV1AirSau9TkvzFmcLgaLZr1Fs8Xb+4uHaRAeM43M+qNLpgS8P0r6ustZ0KdH7e7VHz4t5L/cYlGu/4RRuqEBbwTMIQvztanyyMc7iwYc70K8T0yNizcK3Quliw91/7DqGtMWMZvUdaZT4tUp++Kt0gsLZ6QCrwRgoJT3PG1XwULiLw5npuSpAYRFmxZi0i93LJZeZEIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 08:36:27 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 08:36:27 +0000
Message-ID: <9532d676-b383-4c5f-aca1-f72e1f615cca@intel.com>
Date: Mon, 16 Jun 2025 10:36:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: Replace deprecated strcpy() with strscpy()
To: Sachin Mokashi <sachin.mokashi@intel.com>, <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>
References: <20250613163530.1165690-1-sachin.mokashi@intel.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20250613163530.1165690-1-sachin.mokashi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a5709ef-e24f-429b-5db9-08ddacb0e25e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?ekY5ZW43cklkWkVHc1pUdHhEVGp5TUxlUUE4dnpLaEx4UjJzeDBqYUxyL1p1?=
 =?utf-8?B?eXJvLzRwTDZUS2V6dnRlc2E0M1FvVzVkckV4ZVREeERoZFVUOWVwZndOSWFL?=
 =?utf-8?B?cDQ0K21GUmVJcjV1eGZJVUlOMFZGWnM5bGNxL3Z3SHA3UGh5Vm5hU09DNWtu?=
 =?utf-8?B?ZXRsZnBmc3d3SkNYby9KME9vVlFWWjRBakZ5YlcxU09RMnZING8vY0hyalpK?=
 =?utf-8?B?bGwyYWt1YmFrd2p0TXVCc0syQkVSZWJFWHRndm51NjhPNVFaUmRYbDcyVXJs?=
 =?utf-8?B?cUN2U09MQndEcE9zQ1J4K0hsUFR5T3I2M25GbHc4OGZtM0V4STFiWWhvYytJ?=
 =?utf-8?B?eklpOWpaMzM2T3VrM0JacFNNYWNBWGhOdGtlNnhBaDhPM1ZHaTRwRUNFaXdt?=
 =?utf-8?B?ZS91OXdBc2NrcTFZbVYxYzlFc1NleE0reW44S1hMbXNwbjREcnhuS21ycytZ?=
 =?utf-8?B?bXZ3S1NSUm9YVHVTQ0hLR0RKcHhGakRzalFjN3FpdmhvbVFONmdmdysvS2Q0?=
 =?utf-8?B?aWVsUWRGZXBiWmNOUzBjWi9Bd05WMUcxd0x5WTRNUEJLVGZDVnJkQVJJT0g4?=
 =?utf-8?B?NjdONVdXeC9pcStnTkZRWHpEWkJpMm9ZRHY5NkpQUE9HQldzdEV3bWlBTXFJ?=
 =?utf-8?B?aWt4emF1dVpZMUR4Qjc4V0tJVDY0TUdIc1lBd3RlTklmT1RyaGN4RmNwRytN?=
 =?utf-8?B?Q09lQUZMdTlJZXdEbG9KV2FnQ3NKWDFGUEdzTDBVSkJXcGJNTHRTekN1NlZo?=
 =?utf-8?B?L29DUDltK2JSU2c5UHZiVUJJWFZIbjl2V0tLSEdFL1B6SURDNzZrUStxVFU1?=
 =?utf-8?B?K0dxa2FBbTFPVzZ6Z2dzMGNCUXdZaDBjMTQveDlFaThOQU8vQjQ1MWxESEFG?=
 =?utf-8?B?UkhIb25vdHJEcHRqK3plcnNzemRscXlqNG9jL2FlMlREak9oY3FydVFQSkJQ?=
 =?utf-8?B?bHk3TVc2Zit1eTdPV2lzYm1WSWE0bm9lQWdDUXdPNXVlOEVFN1ptd29yUUdp?=
 =?utf-8?B?WkRsTkI3ZUFSNk9OanVxdzNCeThUTUhBSXY1R1dZUkJiODdqRWdWWS9YQjhM?=
 =?utf-8?B?b3VnVE9uc0ZrNGs3Zm9TWGVUN1RUaFI4WVI1QU1xWExNZU1rWUROVHliLzlm?=
 =?utf-8?B?elhScHQ0aklCbDN6bncvQUc1RElqeFJ5WVQyWlg3NllTWVpXME9YY2E0ZVA1?=
 =?utf-8?B?eEZtR0NxK2ROaExtSXZMaVNtcTA4eFQrQXBSUHd1Vk5wZDQ3YklLQkdFOWZh?=
 =?utf-8?B?Z0Q3bU5STFcvVGRudGh2cFpGeU9kRzhqcGtSQUNLSUVZV0JjK0xiQXVQck9Q?=
 =?utf-8?B?MkJGVmhVYnM0VXNWblRieDM0U2VnTUJIN2hsWWdVcHdYNld1RHNpYnI4Snkr?=
 =?utf-8?B?K01nNUpkdXRseDBjSnZqcGptUVFqWXNzY2ovZlBTTTgrSWdmRlRFa3ZPWTJJ?=
 =?utf-8?B?OWJ2TC8wSmRmb0tMdlBrTVd2THJrN3liZnBGQUxDa1FPS2w1aW56QTF2dzAz?=
 =?utf-8?B?M3hlb0RHMEEwc1BoWjFMRmRUUGRoWlZHNzVIK1Q5eGNMSzNaWXh1dFVoaGhP?=
 =?utf-8?B?eXFFdWJqNlJkbXNWdWJkUkV2ajltQzVRNjNIMFY2U25xS0EySnhXNU10NmJD?=
 =?utf-8?B?ejlmUGdtT3VzM2x3WUp1R2ExM2oxSzY1MVJHWGxBWFNiNGNhcDRYVUFBdVAy?=
 =?utf-8?B?N0RPQ3VCUzNibVI2QWRxMlpQdkJ0bTZGV2lzaE44Y08zRW9sSE9PcjloY1Q2?=
 =?utf-8?B?cmRmVnduRUNYWnVtVGZWWmx3Tnl4cmE5c3BTS3lUV3Nka29sd1ErbktJYU83?=
 =?utf-8?B?eXZtek8yZDNKMHllUU85Q3c0cFZRQ2NteGoyK2NvY3ZhQXRuR0JjRkZSNVFR?=
 =?utf-8?B?WkY4dlhnNnRFVHJBbFU1cE1pYnVJdVQ4V0d1d3VBdWJiZ25RRkFQdy9vemlV?=
 =?utf-8?Q?CrCcpBf2YNU=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?SWk1U3gzeWVtQm82bzBFYlZpWDBRTXU0VWwvOGxzeXJ4VjIzcDlVb011SFhJ?=
 =?utf-8?B?cEl5VitxVUM5WWdnMW9UOGZqZ3pyRXRqZWo4UlZQaXdkUmRPNkg4YUR3bXpE?=
 =?utf-8?B?RHFXclhhWUJCdkpSREgxY3V3SXZQZWkwbjhRaTZVbzVzZkxIdW4xWURzTERv?=
 =?utf-8?B?S3BQaG53OXNkUnFRWDkzeVlCcW5MR0FuVEtIRy9aQVZzWlRXeXZUK2M3MStk?=
 =?utf-8?B?NUx6ckh1VzltRG5FaXVEeFp4VTBraUlzRXZGSFFwbnlRYm5tRVlia3ljN2hN?=
 =?utf-8?B?RFFlMHE4N1dydU9ncXY5b0F2dnFiOHBEek5KVUg4TENzanQ1RkdDK2l4WHQz?=
 =?utf-8?B?QVJ4RFpibmk1bkJCQkMyTFdmeEltbzhvdmhiNG4zS3VEYjR3YlhtQXBHaTB0?=
 =?utf-8?B?YzFPaytvajIvU0dMZ1pGYmxvdHJDUGlWYmFmazlNRW1HL2dTNmMvN0RmY1lU?=
 =?utf-8?B?Q1FxdzQ1cTNmQWhkL1dWOWtNa29OWStySlQ5T2NlNE8xYTN2aTVnbXZwUkNS?=
 =?utf-8?B?WFVNRWo4Q3hLR1N2V1BjbENYYTVoMFVrYmc0c0YvZjB4bWhZaS8ydzZQeE42?=
 =?utf-8?B?N0FETzNZeFpManNXN1ZvZXgrdFE1ck9xRHFuazZzVHIyaFEzTlFkZGtyNW9G?=
 =?utf-8?B?aGI2alowMFAvb3Nka0hFdXQ3Z2NLZnpQY2ZwTWpHSndRSXhpSUtmYlVVbnB3?=
 =?utf-8?B?SFN6ci8yRENydnRGb0UwTC9BUEZHWS9ieTYrV1ovZ1h4MjAvdjZ6RktZMmNz?=
 =?utf-8?B?ZVVpaWVoSVFBNlVYOURXbHF5NjdEQmxxbmlwTVVGcHlHUjE0YUp1UWphMG41?=
 =?utf-8?B?dTRxYmlNRnFzb0FjTGVOOHlvd0p0SDY5b2R6TzJGbnFBekY2bmFEWndzRFI1?=
 =?utf-8?B?cGZJWmNpemhUVXZKaDR2TDJEUHVYMmZSMTFpclNKWVU3V3hQVzY1OFJwRkl2?=
 =?utf-8?B?dHRCVlRncEU2MUQ2dC96YVg5SzIvNW1qcFlRRXZBd1Z5aUNna1EwcjR5Y1d2?=
 =?utf-8?B?eUdLSG44ZlZvRWJsdDE4UkdkTGdEWlZuRHJRV3dyZThLYzNtckk5Z2tYQTVa?=
 =?utf-8?B?dUowZ3lTQ3dGNllic0phTHRUb09GekVKZE12aUhQUC9BcWcyVWE4d2duaE9B?=
 =?utf-8?B?M0NWZ2cyRmYxbUd1MlNHVHlqeitDMUk4aFc1aDRweVdLSUVkZlBsd0Q2azRT?=
 =?utf-8?B?WVV5UkdON0hxVW1aMTRHU2dGMm53MWJRMk0yaEwxMVM3ZmdFckdMMlg4L1FP?=
 =?utf-8?B?TkFyc0xyaG1vbUc2UWtmSWNHV0lJaUkxMm5ZRklwWDBYZ0FxczljQUoyTGI0?=
 =?utf-8?B?Zk9QQy9hMlRqbGNVL2cxem1RdTVpY0ZHZnY1ZWJhdVBlZU9uQm43UTJZc1pt?=
 =?utf-8?B?MHMyUEVwSm5ZN2lBUEdFc1pTOFFHY2g1Z1JqM1VRcS9mN0syN29WTlVaTzFP?=
 =?utf-8?B?MU1temI2MWphbGNLKzhVaVZKNHprc09DRmRoL3gvWjAvWDNxbjNUK0l6R28x?=
 =?utf-8?B?M1poT0pwaDljd3MySXdIdHhkOFB3NEdXRWRmZzZkb1gzQk9UTUJjZytDc0pM?=
 =?utf-8?B?alhuZlhpR0NuZk9ZRml4NlF4RlBzeDRCalk0QjloK1l6OVJiV0xBbzBqZnBq?=
 =?utf-8?B?M2xMK1RleXlOVHo0OXRNYm0vcDZFUWJ5bEJEeXFCYkpVSjhEdlp5TDRtL2gz?=
 =?utf-8?B?Z1AxK21CR2ZLbGRNWVNDZ1hwdzdVQWhIalc4VU83SGIwMkRPMGhRNENPNHJv?=
 =?utf-8?B?TkZkQkV3Nzc4MExtZTZOUmF3VW4wZTFCaHpKd2luZ3B3QkMyV3JjazhoM0Vj?=
 =?utf-8?B?YjFyTU1vd1N0SUZucExOWEV2Nks3QW9jWHFCRHplcGZwMy83ajE2VWJEdStI?=
 =?utf-8?B?YWJlNWIxT2hWcVJLeWw2UloxL2tzQU04ZnlZRUtvUEF5NzFWRS9WcHVxem1Q?=
 =?utf-8?B?Z0dXZWhTRW90T3RvOWxieWNCZDF5dW92WXJ4MGxGVjJXT0Y0eC9YS1g0azhP?=
 =?utf-8?B?KzFzZml5WWJBMk9POGZYNjF4OWc2ZVNKUFZZT2pidng4Tko1Y1FaaUNCZFBu?=
 =?utf-8?B?TG1PdnpmQ1pma0Q0MzBvUHo1M01ZRkxybFZhSWhZWGticzVJTG1ZNnVHUFd0?=
 =?utf-8?B?WkJvNGp0L1doUHh5VzJpNjFqaUt4Vkl6cWxxWjVmR3lLRkN2Vnd2WlM2anpp?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a5709ef-e24f-429b-5db9-08ddacb0e25e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:36:27.0873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Yh2/jfvtCvuSBSRRjQiSiSr7JU4z95H6zSA7TtRahXtO1sWSG4RSHpJz5IJUb8evdQoBfTadRp5u/KIhca3uNoQkLR1C7vTKD0caQxDqoMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
X-OriginatorOrg: intel.com
Message-ID-Hash: KTLIMISWZZJYNDJ43FIIPK2CDQ2D4PVF
X-Message-ID-Hash: KTLIMISWZZJYNDJ43FIIPK2CDQ2D4PVF
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTLIMISWZZJYNDJ43FIIPK2CDQ2D4PVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-06-13 6:35 PM, Sachin Mokashi wrote:
> strcpy() is deprecated, use strscpy() instead.
> As strcpy() performs no bounds checking on the destination buffer. This
> could result in buffer overflow. The safe replacement is strscpy().
> 
> Link: https://github.com/KSPP/linux/issues/88

LGTM
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Sachin Mokashi <sachin.mokashi@intel.com>
> ---
>   sound/soc/intel/boards/cht_bsw_rt5672.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
> index aaef212cf44e..54c1894ee96a 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5672.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
> @@ -14,6 +14,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/clk.h>
> +#include <linux/string.h>
>   #include <sound/pcm.h>
>   #include <sound/pcm_params.h>
>   #include <sound/soc.h>
> @@ -458,7 +459,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
>   	if (!drv)
>   		return -ENOMEM;
>   
> -	strcpy(drv->codec_name, RT5672_I2C_DEFAULT);
> +	strscpy(drv->codec_name, RT5672_I2C_DEFAULT, sizeof(drv->codec_name));
>   
>   	/* find index of codec dai */
>   	for (i = 0; i < ARRAY_SIZE(cht_dailink); i++) {

