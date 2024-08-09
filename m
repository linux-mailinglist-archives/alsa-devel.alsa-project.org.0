Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047A994CC15
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 10:23:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA68E67;
	Fri,  9 Aug 2024 10:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA68E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723191810;
	bh=KReTU9ZVNmXINJ7DYPwZr2Jk7r5h5UfasvQtmf+Ftt8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fBZJn5bIbLwbP71cskIji5Ercgx9ndchYP13kSdrIKyOgILF5tEeWLT77rKgrFtXZ
	 jtdi+x9nnueYUBuBoA4Fzya67k5kP5IbrgwEUk+t/vJea3LdQdP1QWxUhHnuPq3oFt
	 jqH1Tg7wSpFg12bfgql/Ldj7hjq7fO91tz8yIjsk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2B0BF805B2; Fri,  9 Aug 2024 10:22:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E80EF8057A;
	Fri,  9 Aug 2024 10:22:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 457C5F802DB; Fri,  9 Aug 2024 10:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23A7DF800BF;
	Fri,  9 Aug 2024 10:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A7DF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YqlHhUEb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp4e95/2HNJDLP+dt/7bKlF7uXscTvuA5mLVpaWZDZz7XRYwt5LP4oqz9/XSnllDv25tSd/kINhhB3ZF4hXaLpvEemqXgJpqSrIhlG2+B3tWomt4P2gQ0T8h1kGg0SNpDeidRHfYIcJg9bFut83IPr0otHvukSoMYdMPCcSRnvBZM/LkI7i/AUlaWJF9sqSviYLeX+Dlce9nre0zM7hdXGz+wh0tiT84sfcncTM4w90olZPGpBSMeBF4z5oTOs23VNWUKnWxBR9O7pLAOOc3MxinLqpGPwu2P9cFceSfl7aP891WskU9Id9NV5g+HyyjKqDT6JRjqfCXUmOymoJpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iY+jbxACSYN1cPziumWETJw8b6T4Dcv1UvHKt2L3aaE=;
 b=YgZynrHbxV3OaLv1gWAJdDQ29aobE9NvSyc8v9WmIvRx7EeVP5XTh24MdMVcZk2fw3TPt7iLk/fySkqQxlxsdXrn0/vyMM2jkbiL+BXZAEm1/BsRL1nri0PClcPtn9c6bE7K5O7HAnnCjI9mtTrtyGbaRxCWe9SuEM10hsdN9hFS26AA4vAOlDTGwrncdgAfZOtByV4otgTznGjajB5xiK76VSKZrFfdzQ/TzGfTDF6Dp4bWauztIAJDgfLk84PMDHMcc5dywprPeJbJD91wEydKd1pCE/gW+8WdIDXbuPp3HZnOPPx4tg0geELMvXx+QDdYyAQ5N2av3Afh7qnslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY+jbxACSYN1cPziumWETJw8b6T4Dcv1UvHKt2L3aaE=;
 b=YqlHhUEbyZeYwHjjYdMoBJaWheJtMXzG37OHhDYyWDuat++NBQc8RaI/SX8UZeP0O/yxcnJLAv7WMhDidsP1glpiqyI00MwTu1PZg1HuK2i5mvE/s1fvrfX4muC23gZb4OMISjq9zWbZ5LNHM8VEwtZIJ+XnkZ6n+6lED7tgyp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 9 Aug
 2024 08:19:49 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 08:19:49 +0000
Message-ID: <adeb6cf8-1fb6-4bf7-8d36-504b22c366be@amd.com>
Date: Fri, 9 Aug 2024 13:49:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] ASoC: SOF: amd: fix for acp error reason registers
 wrong offset
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
 <20240807051341.1616925-2-Vijendar.Mukunda@amd.com>
 <ZrUdOyGiFRH0sRlt@finisterre.sirena.org.uk>
 <a6a0c975-728b-4379-b074-b88ac928c58b@amd.com>
 <ZrXGzmhgyIJ9ID6I@finisterre.sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ZrXGzmhgyIJ9ID6I@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PEPF000067EC.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::28) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: f5d1de76-621f-4306-5ba4-08dcb84c08df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEh5eEdlcTZKbXNsMVN6dEVlV0NacWhoSkJ2REhEUTk0TkZFNHc1UXZ4dTUz?=
 =?utf-8?B?U29VaTVDRFBVYUNRaHBoV0Q4dTk2NGlSSTZSUFkzVGpjWS9uZFpOMjkyRG9p?=
 =?utf-8?B?UEc3TDdCWUtIZm50TktGOFgwVURBTVU1Tmw4QndobHpFRklkd0ZCTW1wNWJX?=
 =?utf-8?B?c2JBV3h4WE93M09GUG82ZlE1Y3dRMjZvL0ExVkNzNlFLeFFMdENkMys5ZlJU?=
 =?utf-8?B?L1IxREVzczlhT0l3aXgzRVRZY2ZLY1VlakFVL0xWZmVZV0pNcU5JNjNMQllq?=
 =?utf-8?B?VDZ3K1pQaXhxUmdYbzlDTnpZRFRCdlZFeXdYaXl0NE81VVRHVkdSNENZREhV?=
 =?utf-8?B?Y1JEUjRaV0kyUGliaXl2STFIc09HNURvNUt5UW8rTEU2bU5iQVVoRzlTSGMv?=
 =?utf-8?B?ZnZYT2IwQWkvaGx3RFhabm1EV2RpcGpwaURPZ3hpYWdWKzFHQjJLcEk1OVl4?=
 =?utf-8?B?MnVpa1piSVMyT1ZCYUdxT3dISncrbDVRUW0wRmJiSmtXSE5vVE5RamxiRTQ1?=
 =?utf-8?B?TElqM3VNalpEVE13QWdZaU5rM3RvYk1TUDRKV1c0byt0cmlmVlgrVGVJbllI?=
 =?utf-8?B?aWd6aFREcEJDMk94dlF3RFZlRkdqSnU2RXltY0E2SHRRS3ZySG10UXR4R05m?=
 =?utf-8?B?Vnc5Y1pzNG5zaXZiRGZ0UWFHWnVBKzJaYktYektrSVBDenVRTXVNL1VObzBC?=
 =?utf-8?B?eTFFY1NaVEFsSzBVMTBkVzJrdElwaGxnbHRsUEhRTkJQbGd1NGZtK29Sc1Z0?=
 =?utf-8?B?ZG9EWDNBdlhqb0N6Lzhtd1pMekZ0Q1UzSHQrbkp4bmprU05Fa0V3MW5sSEpo?=
 =?utf-8?B?M3gzNUYvVjgycXBndUVMb2FuUWRWck0vSldsWmdVY20wUm9YNVVBV3ZhT05o?=
 =?utf-8?B?bkpxZStMQXhnMVUxNnpZeVAra1Y4dUpGbGZLcm1ha1dzWFN0T2JJNEFrUVhG?=
 =?utf-8?B?VVl3NG1SWTVHdjZ0YnNQZzVtR3ZOZ25hbmVDTXkwcVdIQjBrTGJobVFPdjhK?=
 =?utf-8?B?VGZNUmRWOGlYYWhqR1Y3RUQxYndCT3NnbUo4QjRTQWxZOU9WTTY4RlR5VHp4?=
 =?utf-8?B?UmRmWkJKcHdlT3l0dFJHK3Y1UE4rTkIxUVl6R2VOejBXbGVNcENST0EzUyty?=
 =?utf-8?B?T3V1UHR0RWlLMGh1N1ROeERRMVpiOGhvT3RxRytDdCtneW1rRytaaXgxaHJz?=
 =?utf-8?B?T3pLcll3ZVZrWk9wRUY5MWU0dDlsa0R4YWwwUkZNc0F5ZGdNdURyVlR5dzBZ?=
 =?utf-8?B?T085SXM0Y0taQzk4NW9hQkJNbjV2ckoxZFNPRlZ5Wk13cksxeTlxTTFyMnhV?=
 =?utf-8?B?RGo5RUdRTXFiN3haMUI0cmFmSlpzTmh4UjNKb2N3dGwzcHUrcnB6SFRLL1pL?=
 =?utf-8?B?R0R5dGxIczAvN3NjMkJ4L0p5QjM5QlR5TnJFRitlcll0QitkQnZKemRqblp5?=
 =?utf-8?B?T0l4QTJzMEoxUmFtVTRhZ0RHcTNnRndZTWNiamE2YWRvNnJJRVlPMXoyV0JK?=
 =?utf-8?B?WXNXWGxoZUhRSzFNeDdublNJWVNBeXp0dHZzNzNpSzl1eGlNTzZhd2FSeXFa?=
 =?utf-8?B?aERINDBZaWZzOG9BbkV3ays3dGtBeWo0QlFQbGxyWmdwbC9TYUFud2hITW9V?=
 =?utf-8?B?SGp4Y1RtVnYzdXpvaEVPUFJTNWM3MnkxcFEveUNWWTFIRTJhelRSSjQzN2V2?=
 =?utf-8?B?K2xMeVBvYWd6R0lsVm9PZjNPUUpwaENYTTRJQllSR0prQzZGeUQ4TG9EYU5y?=
 =?utf-8?Q?LMSfVk9BMPntu1s3hs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVZjWXBJNFJBUktJaHJTSjVaLy9YRzZRdkhpV3VNeStsaFR1RlVhZ0pKQk91?=
 =?utf-8?B?VXh4SDJjS21wOGtaVUk4Z3R5dkdsVGtPTnh1dTBKRFlEcHcxRFpxcEVKMzhX?=
 =?utf-8?B?TlZsRVRSajVtbUN3Uk1iMExZOU5FR2ZVdXVKRWZMZlV6M2JpYWtkZE9zVEpv?=
 =?utf-8?B?S2o5UTZsdGxWOCtoSUo3NFlKeEZkUEp3MzErRnhqcmlnTGVCUFlqeHcxTWZz?=
 =?utf-8?B?U09sa1ByWDdjMmk1ZVhMMi90cU0xYkFpcHcxUjJkejBsVHNxcUhVcFo5WVpj?=
 =?utf-8?B?cUlFVkk3U0k5YWgvbEUrK3NtOWY3NUFvajBsRFJlSGwyZktaTFJhREtJY0NL?=
 =?utf-8?B?bkNRRWhlT095UkxXdG1vZGU1TUJ5eEpyajZoYTRucTNmVnhlSFFyeHl0bmRP?=
 =?utf-8?B?WExyTWM1QVFSbWJRajBRMmxKRkpzdC9FejBBZk5RQkhXTlhDWncyV2dOOVJ2?=
 =?utf-8?B?TE43S3ZXM0dVYyt5WGppL2lwUWQrcjhIZ0xlTmc1bmc4ZEF5TlFHTjQxNWlz?=
 =?utf-8?B?bHFzUUNEdWRlKzNCT2N0UDNrY3Z2L1puYkloUVVsR0RvYjljZzAzb3hBRjVV?=
 =?utf-8?B?RVlhYzFIVk9SN3NZSTUxbjZxcHhDbStLNXRmbVJMYVBncWRmV3JiRDdZOE16?=
 =?utf-8?B?RDN0WXRWSzJyd3EzRGdXN3R0VGM4VzJuTGoyQnNSZ1c4endTOEZnNEtIczRX?=
 =?utf-8?B?WWZaTVU2TXNJZ3ZWV3N1ZUozMkJNME9lUzkvWXlWanRQekgrbXgySGhRSzVB?=
 =?utf-8?B?c3BWMXFnaE53VTlFNmluZXpxclN1djZ2U0VaWGpMdWFlNnkvaXBYZzN3eXlJ?=
 =?utf-8?B?cXo4ZkxjZktqdXkzZlVKSFVCdU5EMUxtM0RQOUZiajZBZ0wycWM1WlV2Q0lm?=
 =?utf-8?B?eUF3Q1FaNHR1VGJ6Vk5PUTYxUWJyN1BKOG96Qmdvc1Q0YncxTE5rYmxlTTlx?=
 =?utf-8?B?VXk1QkdMaml2YTVOSHpIVmZWTmFHbE03ZXlEa0tWejR4ajFLL09hZURMSWs1?=
 =?utf-8?B?dFpqbG1FQkN0eXJpMnJPYzlCMkcrYnY1RTFjK011eWh2Z3prUWxhWHBtbjZU?=
 =?utf-8?B?ZWwrdXl2OG9lZnZJbHI2YUZjblBsRHloeWh4ejhOMWRZVU1VVmdYbzVIT3dk?=
 =?utf-8?B?M0s5MWZ0YUk0NHBNaFIzOGZJeW52a3hRa3pzb25VTkluWjVJYlRuZkZnQllt?=
 =?utf-8?B?RnA0N3BLQm9JdUVZcnMza3hBODlmUFlna3c4OXROTDJjT3BGYXNmRFFaUFAr?=
 =?utf-8?B?YkdMQUdZejRTVFppUGZrajR3dU5abmRDT1VsWlFhS3BBVDB1TnVaRHl2dWt3?=
 =?utf-8?B?eG5pNHc1R2FYelBkNEphQUhOdW1MVEtuZjg3SHdrOEFncisvWmZwY05WVjFL?=
 =?utf-8?B?LzA3V29MT2xJOWhka2ROVEFYTXQvQzlKSUs1Q0hkVnFLczNuUFI4Z2ZoVVZt?=
 =?utf-8?B?TkNNMGQ4Um1wd1ZxS3BDdWp3ZTFZTnE4TFpIdU1DUWR3a0xPU3BlVlFXVW1l?=
 =?utf-8?B?WTNkSGw1dm8yTUlDaGhldENrVkRNazlZL3RBa0JqZEx2WWNrck9zSC9qUWdJ?=
 =?utf-8?B?VFNBeVoxTWEvS3dmbTE4S3ZId2hQWjRlM3RVMnAvK2NWbnpNWTdRYzc2R3Zh?=
 =?utf-8?B?WW9HUXNaR2hpS2puTkdPRkgzU2ErRDNJQ3hJemVtZjc5bEwzR3RuZmJUUWpP?=
 =?utf-8?B?UFhZQmZ0RkhtUEpWWEZsUUhQYlRXSzR3V0IvODZQNkJrN3RQeXhDNlBRcldz?=
 =?utf-8?B?aDdyUnFWUTRmTGY0NElCQ2lpdWdVcWtMbnMwY2c1K2swY1Z0bFgxVTlyYjAv?=
 =?utf-8?B?STFGVHpzc3hONGZadUswRmpaNTZCVk13WGVTZnMwMjU5ZzZHaFJ0cU5UeGdt?=
 =?utf-8?B?c1NkazBwTml4MjNQK29odlpYY00yV013V1krUUFEZVZqWEh0bGVHakc4dVo5?=
 =?utf-8?B?UGNpR3BpRC9abTlYbWFlZVA3NGZuWXZja0psRjY4VVBjZy9Ha3ZwTFBLaVU2?=
 =?utf-8?B?Ly9SYlQzVW0ybHZXeUNHT1VkWERDeldWUzZua0ZYdExwd3NrRlNjZGpxVm8w?=
 =?utf-8?B?SXpYTmFDL2pnSUpTWEFCbnkvNHZTd2xCNG5sYTRiNzgrQ1d6YXA3TEtKNmw2?=
 =?utf-8?Q?7WDHJptOMxjaHJAdXJ2wLd/FZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5d1de76-621f-4306-5ba4-08dcb84c08df
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 08:19:48.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nTU9dOY56XVXFrbdg58GyzjxPfC9dzzamv79a0stWVcTv6iVs1JN1IZToRH6KOPBMQegFuXGVOfEeKVuZvCD7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275
Message-ID-Hash: KEVH4E2WKIOGPCF6OVYLPLX2OFT5AZ6C
X-Message-ID-Hash: KEVH4E2WKIOGPCF6OVYLPLX2OFT5AZ6C
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEVH4E2WKIOGPCF6OVYLPLX2OFT5AZ6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/08/24 13:05, Mark Brown wrote:
> On Fri, Aug 09, 2024 at 07:30:54AM +0530, Mukunda,Vijendar wrote:
>> On 09/08/24 01:02, Mark Brown wrote:
>>> /build/stage/linux/sound/soc/sof/amd/acp.c: In function ‘acp_irq_handler’:
>>> /build/stage/linux/sound/soc/sof/amd/acp.c:407:26: error: ‘struct acp_dev_data’ h
>>> as no member named ‘pci_rev’
>>>   407 |                 if (adata->pci_rev >= ACP_RMB_PCI_ID)
>>>       |                          ^~
>> This patch is part of https://github.com/thesofproject/linux/pull/5103
>> which got successfully merged into sof github without any build errors.
>> This patch is dependent on
>> Link: https://patch.msgid.link/20240801111821.18076-10-Vijendar.Mukunda@amd.com
>> which got already merged in to ASoC tree for-next base.
>> It shouldn't cause build error if the dependent patch already merged.
> Are the patches it depends on actually before it in the patch series?
> We want the resulting git tree to be bisectable, that means testing each
> commit not just the final result.

This patch series is prepared on top of
20240801111821.18076-1-Vijendar.Mukunda@amd.com
which are incremental changes and also has dependency.

As 20240801111821.18076-1-Vijendar.Mukunda@amd.com got merged into
for-next branch, compiling this patch series,which is prepared on
top of it(20240801111821.18076-1-Vijendar.Mukunda@amd.com),
shouldn't trigger any build failures.

Within this patch series (20240807051341.1616925-1-Vijendar.Mukunda@amd.com),
few patches are dependent patches, as changes are incremental.
That's why I have resent whole patch series with cover letter again
(20240808165753.3414464-1-Vijendar.Mukunda@amd.com) so that whole
patch series can be merged at one go.
Each commit can be buildable sequentially.


