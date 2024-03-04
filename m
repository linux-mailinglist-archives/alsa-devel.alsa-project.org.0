Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB2870BB4
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 21:41:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128473E7;
	Mon,  4 Mar 2024 21:40:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128473E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709584868;
	bh=Fv431xRMdCQdJdSI7jVxPqB0QcYfe/7zeipmmlJ5YUQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pIfLig7X6ewSW4Q+pfTFrNiZLr5gutEPAHCnPCY0b0wsO8ERhRo8dt+L97NCvgcsL
	 l/bF6uXCIx8G24QHRlfyNIQILPB4B8PfpWcwkz/36PYkpKD0n0W+1g+7DG6N4RKgIJ
	 y529Wi1X+COzn9uWSL0xA3CJ6IUWOQfLwzPrUf+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2E3AF8057D; Mon,  4 Mar 2024 21:40:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 585A6F8057E;
	Mon,  4 Mar 2024 21:40:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2703F8024E; Mon,  4 Mar 2024 21:40:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 267DDF80093
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 21:40:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 267DDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DSJZhlJa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709584823; x=1741120823;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Fv431xRMdCQdJdSI7jVxPqB0QcYfe/7zeipmmlJ5YUQ=;
  b=DSJZhlJa0JrVukLXnKrlRvLDCGDsQ8Hq5UcLh0xbi21RlDGP+tfOt6x8
   VNqfUQh/+WrrdTxd0w7ilXw4KDoDba+GfqOZeDO+wvLSpiPwW4VAVdsnf
   618NRZCnptE/vxC2ltFFYrOytiR9JLObC4BM/PbR+TV0ZtnJ9y3Fk3M2/
   MXAvoovXExYBYQPXChYUT2TIu9oIO9JWCg34x62OhuR3/8Y2MBFPk/DJo
   8vhB0hSn9wUvqGo71eeNvZN7J48mjyRQks/tFb8CA2yYmNHd+/rdvmlG7
   aVDH7tn2Bmvq5vqbuvWC00SloEWN20sH6y92i9mjJaLp7Ah2yyCN8Ac9J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="7869601"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="7869601"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 12:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000";
   d="scan'208";a="13690445"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2024 12:40:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 12:40:16 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 12:40:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 4 Mar 2024 12:40:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB3CrsVlWIThmulD750GVpkw3EEkyXjHq0S9q/UiFy0vmhrj21njZCfQykMjYtthInaiOc70KHDMSsCksr6JwBSkr0KX+8phc/J1/vTSquuMf5VEicYfAmirTeJR62w8s+G1f9V9m2fvs6fqS7OZq9hPFgdrXQMbdMwMeQacTUn1WDqsX5byk7HLYUjR1Iwb/tB+ti7JiayGGmDP6o20wqB+7a/E2cpTIAo6imINpj10GL6ySpSWeMte7Mtta1c/Q4oeRF3L/Z581jzMXIsXnkvR5LfAlKKtt5jxwd1qNlnWAHSUb5Vv45Lrn2c2PxzWIknzyh/7HJuO0US7Qvu39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPx391c+ECLZ142RJZQzn2D942j+opSeaqvFVjdAqJc=;
 b=QcYInpwo5jejG38YBDTujVV3VEYnKhjFDjFekxaeeEHLsP8l0GswosvEAYjfbi0G9bpNDozDZYrkfTPpYYCXw8La7NsEV4EHv6loyfNR1p2hb2PHt7EhonBIMgU/NAfneevx5Mr821uK82gFNBRgvdNuFngZv9zECCszeVgwN9Z9ytxJQUKgB29cjJq+mmY33lrDhWDRoRFU1FKXbaqPj+9m57TeB9AZpW+0SW5dGlVUrZUipJNeqen2XrsVL3X/kh3rrVkdLzLinHe5uAhn/SPiBxcKFgZeZPhgT4a7lk/nyYFK1E7fOY+2o4L6moX6s2yAUluOvNJlhH+woRX6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB6496.namprd11.prod.outlook.com (2603:10b6:8:c0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.23; Mon, 4 Mar 2024 20:40:15 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5%7]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 20:40:15 +0000
Message-ID: <87c39d2f-fac0-4414-9c9f-53e45de70e79@intel.com>
Date: Mon, 4 Mar 2024 21:40:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: Intel: Disable route checks for Skylake boards
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-2-cezary.rojewski@intel.com>
 <ff674cfa-19d4-4de4-80ec-9be88f8cb4a4@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ff674cfa-19d4-4de4-80ec-9be88f8cb4a4@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0189.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::14) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a147a0-7003-463a-b8f7-08dc3c8b4bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 8FkU5/H1kUH3oD70nQLyNIAcjbQZ25blJ/qA25DUfZ0GaZmTl3TGTyJrpQ+i9cXhOv3myb2QtjOrX6Ayt6R9cp1VJCGmmG+KQfllvTgXs/esUO2fnMVjmCfIMRegb0H84BfJUf4IWA2SWynqGIdNbs/RqQuVHxK/BPyhosUULeZxe6wBe6ZfnfuURAN5rtMRjksERipE3xVhAFewkY2L6T7Gsdpx+kxr+ixLn03e7JSdFzxy3Lz9545BsR8R9WBZspYs5QgfwIGhleHbPFo/LTPJwIQBBXbNFaV35lPljXstERcOYCq+plBWf0c9GPMB5DQG/gvFdhI38IfclllOoYd3ontdZfmbp/SAKpumxRLijxzHTvWrwAT3okUepGLnCulHdOAflJa77NOC3cAn9ZM3mtbxnRybHzNcJoctD6Z5fSgyqwhCJxqLouUPONe8X+mcveVm9aetfFSsyJr/3VTSkm2GU7XGfXS5ciD0EEuE+nU/X1sb1J9QN4FuCrXdVxj/mjj3xE2ZK3/4qizWvffL9NgVeaMd6lkGoEDYTCvlwLXLHu1eksesFPwLg7Zwg89CNC62osnDR9yo8Pvag8ra0jKflKGKYPdgUCeCRq6rtq6NoH0B1EQvV0YNMZ8F
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?ZDM0RzVnMWpYQmN2WWlvQThvejhWYjZaU2FMcXYwNFV4N1pRaXUycE9JT1hG?=
 =?utf-8?B?bTJPRU16UTBjNTlkRUl5azhITGtycEFGeVJqVHBMNHg2c0wzZlp5VGkwZlZz?=
 =?utf-8?B?c2hVcWpiOUtYVis0VWJYQnpWdjRkUFVoeTRQOENETWFySFB6WGNVaWZZbWxW?=
 =?utf-8?B?WVFLUzZTbDJvQWVKU1g3ZXAzMWpiT3FRNDFYaE45V0ZmSGZwUWFqVkpsUnJ1?=
 =?utf-8?B?dk9sWTl2cSt4R3NkRUJON1pHMzJBK082ajZjeGNSSmd5bXZQT2cvVEhtLyto?=
 =?utf-8?B?V0pwMnlQRmlMYnZLZU9lRWVBaUQ4bFJRNjhXZlhyMWdyWGdJRk9KVnhDazlF?=
 =?utf-8?B?MUlpcUJkNFd0S0VHM3JTR1JuZVJIZ201U2wwaW1mYmVQQjN4V2Y5MUZHZWhv?=
 =?utf-8?B?ZkxMMjdZRzA4Y0RabGJaako5YmlBVmY3a3NCeVBPQUNmRVVUdURSMTN6eHR3?=
 =?utf-8?B?VGZ1WXpINGNGTExDTXArVEczWC9Ra0FGaTJLTnUzeUV1c29mNkQ5UzFBeFRt?=
 =?utf-8?B?LzdhcitOaHZJeFZWMU5MZkJMOGNSWGJVWHFGOHNmRWdKUk9OSk1zMDZuNExr?=
 =?utf-8?B?cmNHUEJkcFpJRU50RmJKampScllhVVVaR3hEU1gzeVY2ZVJ0M2VaZjdYeFVS?=
 =?utf-8?B?K1JnT3dPakQ5UUI1MisyYzRESmo4NlVxRlZxWk55Q2J0eXNwQlBpcTNzdTFC?=
 =?utf-8?B?V2FidExiUkphTTQxT2NteFJvbW1Panh0SGdvL293K2xuZmJ5ZFk2M3VjcGNZ?=
 =?utf-8?B?dnNZUXRENzlGK2dQcGt3MmZUR2NQZUJ0M3J1ajZLbzdNYlhZN2tmM1NFTDFV?=
 =?utf-8?B?U0s4MHg1d0ZlZm9HRWczTmNpMTJUWXlFZEVxM2NQVk1wWmJWUFlENUpqbGNz?=
 =?utf-8?B?UGJaWXNqdUhac1lldk5QNGVVN01zVlFWd1BiYkt5SzMrcGxmT05SejQvenUw?=
 =?utf-8?B?Nm82bFBmR1NoakNIYXVoUzRLQ2k4RU9adk8wL0orbDdwUkNJb1dNRlY3Mkx4?=
 =?utf-8?B?dkpaSVVWaitvSHBSN3lKTEVob09NMStNVHcvUW1zUEptMWZiV20vcDJnWkM4?=
 =?utf-8?B?SjVCR1VURzNTUXZ0VWFnaGdQaXh1R1pPVnNXKyswbk5VeWNYS1ZodHNhNFM1?=
 =?utf-8?B?NC9Wdlc1TFo4bFd6MTFWNWFXUHREU2JEeUtVT21RUXFQcWk4MU9WcUdpYitX?=
 =?utf-8?B?MVdXZ3laMG40MVc2bzdWR3I1SHg5a05DckVwQ1B2bHNCejFYSXJ4QkJXMVdy?=
 =?utf-8?B?NC9XOEEycENLQnEvMzU2aWtOOFlkZzVMYW1RMXdyTHk1d2IxckZuVklLY1FT?=
 =?utf-8?B?M1dUcS9UcEdXZXNzaVU5T2lRVDVvcnNFeXFtWCtsSDBQYThtRGdlS2MzMDVr?=
 =?utf-8?B?TzJMRDlCd1paK3ZQRWxNVHRnS2d4TThCNVd1QnNWaEQ3byt6RGdWWURDWEhB?=
 =?utf-8?B?T25WenFLZndmNFdiaTZmd1k2K2tmWmxoK0t3a0F3TEpVSUV3cm84dGhWRE1a?=
 =?utf-8?B?b3JjK3dTSnYzSmZoenNXZTB0bjVac28xeGhBY2tNYURZd3dRWTdpOGtWTGhi?=
 =?utf-8?B?M0FwNVVHemtEWG9JZnVYdGxCaEE0eHNvVlF2Q3JMYkR2Q2xWTUdpSmhDdmJZ?=
 =?utf-8?B?NUNnQkorUTJFZWVvSGNRQlovTVhaM2xZNVI0bzRDZzVkNC9pZ1JYRklEczgr?=
 =?utf-8?B?RkpZekxjUk5pdktRNG1LZERvQmp1Wm04Sm5nUEFMWmg4dG1NN1FtR3E4ZTlF?=
 =?utf-8?B?RmV4bWorNkYvck1DMk02OHgxNGZtQW01ZXI4UXZwdkVobHJKbmtNdTNuQWJ2?=
 =?utf-8?B?OGxFUXNWc2laZUtSdU55cVdpbHIvUmNiMHJnTUhVdzRqNVMxSllYaGxiRzBE?=
 =?utf-8?B?WTNIdWJ3blNvekNZbDgyeDF6b1ZIWHRxcEdWQVc0YWN6ZjB5T2I4dWlYWWF6?=
 =?utf-8?B?bE5Vb25ZcXpTa29FbVVlaHp3SElpa1RJUWhwT1FGL3ZQbWdHRm1LSmc5OGFy?=
 =?utf-8?B?a2MvODRFUm9WUCsvRTJXUE1lVi84eDd2Y0hUNjVnQVQ5VWFpQUNhRjNXVjlC?=
 =?utf-8?B?TmhGQkdPYkxIWlcyVHNLR2xobkFHZWhHTUU5cFdYbGs4TlFJQ0pCcVkxWjFv?=
 =?utf-8?B?UEZPbm9ldVFhTHBOOC8rK0J0cXJobkRBWVRaaXVFR2FYL1NvNk44Wlc1bFRY?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87a147a0-7003-463a-b8f7-08dc3c8b4bc6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 20:40:15.0086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QANFNV8M2AxdO7zgtILvslqWo1S5fboAROkEGZ0d2KXEwZD4h8HXfOmoG7HZUfYilzIBRcuoKCk+biAKs4RLG2fnMKTvpIiZDwWYzY8gIOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6496
X-OriginatorOrg: intel.com
Message-ID-Hash: CYIMKXJ4UIIXVEUKY6OF7FID5WOZOQCA
X-Message-ID-Hash: CYIMKXJ4UIIXVEUKY6OF7FID5WOZOQCA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYIMKXJ4UIIXVEUKY6OF7FID5WOZOQCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-03-04 8:28 PM, Pierre-Louis Bossart wrote:
> On 3/4/24 13:05, Cezary Rojewski wrote:
>> Topology files that are propagated to the world and utilized by the
>> skylake-driver carry shortcomings in their SectionGraphs.
>>
>> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
>> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
>> failures for Intel boards have been partially addressed by commit
>> a22ae72b86a4 ("ASoC: soc-core: disable route checks for legacy devices")
>> and its follow up but only skl_nau88l25_ssm4567.c is patched. Fix the
>> problem for the rest of the boards.
>>
>> Link: https://lore.kernel.org/all/20200309192744.18380-1-pierre-louis.bossart@linux.intel.com/
>> Fixes: daa480bde6b3 ("ASoC: soc-core: tidyup for snd_soc_dapm_add_routes()")
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   sound/soc/intel/boards/bxt_da7219_max98357a.c       | 1 +
>>   sound/soc/intel/boards/bxt_rt298.c                  | 1 +
>>   sound/soc/intel/boards/glk_rt5682_max98357a.c       | 1 +
>>   sound/soc/intel/boards/kbl_da7219_max98357a.c       | 1 +
>>   sound/soc/intel/boards/kbl_da7219_max98927.c        | 4 ++++
>>   sound/soc/intel/boards/kbl_rt5660.c                 | 1 +
>>   sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 ++
>>   sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 1 +
>>   sound/soc/intel/boards/skl_hda_dsp_generic.c        | 1 +
> 
> This HDAudio machine driver is shared with the SOF-based solutions and I
> see no reason to change the route checking...
> 
> I don't agree with this change. Why can't you fix the broken topologies
> instead, if indeed they 'carry shortcomings'?
> 
> Same for glk, this an SOF-based solution.

Perhaps the flag could be set conditionally for those two?

Even when you address the problem in the topology file, you do not get 
any confirmation user replaced the invalid file. skylake-driver topology 
were not part of any firmware-alike package. Please note that I actually 
did all that I believe could be done to repair those topologies and 
provided valid references at avs-topology/for-skylake-driver [1].


[1]: 
https://github.com/thesofproject/avs-topology-xml/tree/for-skylake-driver
