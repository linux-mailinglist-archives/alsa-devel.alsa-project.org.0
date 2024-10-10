Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C9997EE3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2024 10:12:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F8E851;
	Thu, 10 Oct 2024 10:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F8E851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728547934;
	bh=vgnX9Oox/1+3ENK6JnmNGNmkfT+0CwVo4j38slZOxP0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SNynL3sirB5SL5BCDiiJYqXGgGWZT50e/6/op8NUm/VQ3/97dD86Gh7KAI6ho1VaQ
	 FPd0DAXVSq+ZXPLJx01FCCMMSgTiM57tXeydC0vg2TYKiToz6nlllk0oI4PmherW4X
	 lBlvTgoWSaPQoUcNhafqji1vu1TKagowD9Lmfgtg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B219F8059F; Thu, 10 Oct 2024 10:11:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 030DDF80496;
	Thu, 10 Oct 2024 10:11:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EDEBF80528; Thu, 10 Oct 2024 10:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6439CF80104
	for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2024 10:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6439CF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=NzxjFlga
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2hrSGRivmaLxzGLVWv7PSVEpH5ipQ89zwUJhA1Qdx44D5dYB1t0AbMzene6/KI/bqSSbqGeDARR/qF57EzUoX/5xRC8VzG2VAshvUTLhWc+oTC19/1WnD8Qn5Xtzv7HVFf8Oy8pgkDR0fsuRZBxlPECKFkKxhFtYbl9kKBAt6IWlmhJa9XIJQR3IEIEYMPPUIKAaNE3Opry/drKhscKMmwY9/C+WkNK8IzR7cNQoTyqPzy3W+mE9kc+TmiI4+dpqXH4931QL0GVY/nzrHKDRut6ts9bwT45eezQyPuKkZe8XibFPt7Bsm5IEfgqu0Cz5WTu3aA4qpX8rRu6mHEORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi6gPWFQQks0QJQ5BOEmhNWKcsM8KIMnch0/LL+Yl54=;
 b=ymzw9v0piY056RLkUGoATLQKRbHT9KHbe6lbzG48gpb36lHAwc5dFSQ2gywvZtNr1SZmr2PvP3NlY4xmg80wmkZr2eGqdZs4N30AqlvIdKaQv9yNwqgOBn4r5aAXyuiv4luaHAtyceTsy4D7FixYE8g4fLAfEBVw2fNhTYwA6axqaVl4nFdN0bdSNpoar6r4aQ7qGx5a5BPLjSxCeV/qm4SIPE7eU6JkKR3sWUeyd59vf9f6jcXF+cFrY/M0GjXj0EqKVSKkwch4NZDmEYddvoZ/jnN5wHfbE2e6bj0vXq79etc0P/lZb5oVo9SCy9Noa12G8SNSoZFo8qcZi4Nphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi6gPWFQQks0QJQ5BOEmhNWKcsM8KIMnch0/LL+Yl54=;
 b=NzxjFlgaWIJDSkmpCJy/LAHNcchRpzcKTDn3rE15Fnv8k/GCSnfmbEMkAgoOcg9/oO+Zbkr5EUA8GKEwhVvWAqxGq/CI/H6dxcRzJREqqs5pBHPuJ6Cn4pS1/diamtiekEB3ATBos8uX2x3q05jPmanAgXBImEtgDgKmoaWyfFOiXVaJGTer/xnYtcEOcCLpHsm99engNlQoIrcpSi4AU/ZbLS6ZKaBblSaFsmGPjXHgzrOs3FSRjry8VNdH2n9z5JilIjJn1xPni7GK4LHWEQrOtrB4piPmjcu1vrw8nrm7A9vabyqW8TVqUQJvPYejqAI0VD7NDuuX5sqY395nYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by PA1PR04MB10397.eurprd04.prod.outlook.com (2603:10a6:102:449::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 08:11:28 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 08:11:28 +0000
Message-ID: <6f2fe091-6436-4b28-a898-33d7939a7736@nxp.com>
Date: Thu, 10 Oct 2024 11:11:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: imx-card: add cs42888 codec support
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 chancel.liu@nxp.com
References: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <1728460004-364-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0138.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::35) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|PA1PR04MB10397:EE_
X-MS-Office365-Filtering-Correlation-Id: dc08df73-975b-4e73-0f44-08dce9032409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1BYaGU0RzkraUZwRE1TVGpUTSt3cWxHNXpqZk0wc1BjR0JrTjRzcFJURmNN?=
 =?utf-8?B?RTg0UzRhYS9BRnR0ejZvUkI1USt3MUN3UXczc2VWKytzSnZHOEVtRGZJMHc5?=
 =?utf-8?B?aGU0djIvMzJjcmhQL1BkWUt0b3FjQVlCSmhCYnhYSzJxRjVlbDFoUEpaRWR0?=
 =?utf-8?B?SlBJc21FVmdobWtYUHdqNkhqKy9PWGdFU2tZbFNaRitBNEdxQ0FHekdMK2No?=
 =?utf-8?B?eVRhRnVYR29xZU5iNlkzdzZGYVJqbDNNbHluNithQk5IWWwvcWF3M3h0djZn?=
 =?utf-8?B?NHpOay9GSk5vc3pIWU9ZbUY1OWFvc1B0RnZ1VklGWnlteVpWWjdORm1ZYmNR?=
 =?utf-8?B?UGVBS0RCY1lmMHBDYTRjQjVNRERuZ3J2WkhKN2lvdU1IeDR3NTVleGwrS0Yv?=
 =?utf-8?B?R3lQR0h6c1NyT3lLRS9XRVdQT2piU1JPdXpWcmZHaEM0dnh3cVM2cy81eXJ3?=
 =?utf-8?B?aXYranN0VW96Rmp5ZFBhTVVnbHBZeHJPTDdNTFNIbE1icHUvdEN0R0FuUjNm?=
 =?utf-8?B?YkRSREhrZ0FPczEvNEFKOTNKbXd1RS90U3J5UFpuRlZRZENEZGg0cjJSbVdi?=
 =?utf-8?B?WncrK3krUkJUNVpIa3pIcTVxeFlXb0ZHL0RyT0VKVXZmL2RoVkhwd0FVMzhB?=
 =?utf-8?B?Vi9iMy9GTENYZkh2Zm41Q1BUbmpYeDMra2krUmlhQjl4eUJLRFJtV3RhU3Fw?=
 =?utf-8?B?WVRibzhuRVdOUTh4UTdYck5wclVMWEtDdXVDTDBCOHF4Q1JOVFN3Tnh1Q284?=
 =?utf-8?B?eE0yWm5weU5qNDk3QjM2TDdDRThhQzR2ZVIrWnNEZHBydFg1UEVFVnE1OEt1?=
 =?utf-8?B?VmQ1QzJwNHhlRnJwLzBzYkRNaXZXWENUNk1TSFNRTndEeStjSUtOWUg3eDl2?=
 =?utf-8?B?M0NsQlQvNHFnVStlZFRzaU0relJyTXVrdjF0dWxzcHM3dEVrbmNobnVKSE1O?=
 =?utf-8?B?VmFUd1ZmS1F2eWV5WnR6eC90ZXd5dlZJOUowMXlMZkNtNG16L29yT1dTNjEy?=
 =?utf-8?B?QUF0dlZPMlR4RHJNdi9oc0E1bEhLd2pOZm5rV05EeVlWSXA0NmgxMGtQaXl6?=
 =?utf-8?B?V1RVcWtMQVA3TjRSeUN6ZEM4MnNkYW9wOXBYR0lEbTRGbjhCalJZYVV4YSto?=
 =?utf-8?B?VnB4a01aRlVDdUZyeGJkTXpkWGpTK2lRaGhUWU9KMzNENWFsdGt6VVlTanZH?=
 =?utf-8?B?cUF4dlBoUkVza3BEMkx4anNvSFNKLy95ZEl4bUN4QkgwOEtjVmljQjhIbG1q?=
 =?utf-8?B?ejlWOVcveTh4L0g5S21aRlF5VllscUtBRS8zYk1tbk4yaVpiVE90bFc4Ynk4?=
 =?utf-8?B?V0Z5eGJ4aVJXR2hyTmRCd29zcFdLeUpjNHh6eWc3VnMySlhoR0ZTNkNkdGxE?=
 =?utf-8?B?bGZvd2hWYVVEWGlGamVBZTRVcFB3MG0vdFFuaUVNa3BWQVNCUThUU0xZc2sw?=
 =?utf-8?B?ZmFGTEp1MS8rRllJTTRsTkkxQ2Y5OXdRdURGMGJTNUlnZnI3aDkwT2o4ek5i?=
 =?utf-8?B?L2s4VzFyaDBEKzZaVzFoYWlRQlQySDZ5MTJMcVgvOG9YMG5reFY2bzVMeXJR?=
 =?utf-8?B?YkM0V2t3bzJCK1c0NmtvYjNPckNEbmVqTldaeDl0OUR5cVdRSkt0L1Nvc0Rh?=
 =?utf-8?B?WnFyVkp0dVovcmc4b0pvaWNLVVpQWitJajlaUXFibXpnKzZIRWpUM0c2VUpI?=
 =?utf-8?B?TnF0KzRnQytRd1ZDcFk3MWNCWXRDekVBdjMvMmpPNW9tSEJpaWt3TG1vN2VF?=
 =?utf-8?Q?lvcuALFEnPHPqbpwkSsLvxM/0oywf/Y0VJXohEt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dzdXOUYrOTFRZHJFR3ZES1Z2anBvWDArMWtscHJrL25xZy82MWpPRmJrOXFK?=
 =?utf-8?B?L0lnZU9pTi9mTGR5TktEdzlKSlhiTG1hc0FTOW5ZdldCdlRUWmFVTG5wMVN2?=
 =?utf-8?B?eEpXdW1ndUZoYkRZVHQ1SldlWUJUYU05NW52bXBjNjZqQk84THBVWW1JdmUr?=
 =?utf-8?B?V1dBd1R2SmllbjhkZkc2SkRzV25oS1N3RHJEZldiKzQyS0habTVPZUc1bHRG?=
 =?utf-8?B?MExuc21rNHZodzBTQ3FWbEZUT3VHZ1Yxc2trdFg0TDZlY2xKNTBqMk9sMkJo?=
 =?utf-8?B?dU1OVWZidi9GYlN1czMvSVdvbCtoSnJZZzRUOWNTSVFOY3ZCcXdhbzVmSHlZ?=
 =?utf-8?B?d1grYUF5Qk5SeGljVlNlQ283SlhIV3krQ2FoVXUzNVRJbzcvSFRMTUQxQ0N6?=
 =?utf-8?B?RG80Tjc0VE9qb3JsNGZSdU1EMWpycDlZdmhidVRXdkhXbzdZV2Y3VkRBNllu?=
 =?utf-8?B?V0RTenNxRllOZExlWnpLdi9wcGZvMXZTRTE2Wm5aSERUQXV0NjZmbnJUbExL?=
 =?utf-8?B?UE9TbFdQR0FQeW5PcEtaQlVZNmJoS2R6L2k3OUZuNG10NFU4UWhMK1JPVGFC?=
 =?utf-8?B?dXNlejdMM0JvZkJXOXdjcXpwUGwyT2tyMTRQQ29ZeW1CNDF5empmcmJya3I2?=
 =?utf-8?B?cjhBVk1WNHRwalBSRFVKU2hRVGc3bjNMeW9XN3MzTkFiSXJ4cTNKenZKWE1n?=
 =?utf-8?B?cXNiOFNidkc2TmtpQ2tIKzZtSmRYSUtlVE52QXUxR3VYbzBGbGNZVk1iayth?=
 =?utf-8?B?SGpMMFplbnBzWEVSdEtrQU9GdGFJcEpnTWMxM1k2U3U5NW16ZU1BVGlOOTFF?=
 =?utf-8?B?cUhBZ2gvQkVkVThmRmdaNXMwdkE5T2J4SmhNajdScnRVbndlZGdZUW41SC8z?=
 =?utf-8?B?YVlZdStsYzVHSWJlem9vOFFpcTlVWnNXMVRrV0haMW1VbkdvZ0UyaldLUUxJ?=
 =?utf-8?B?MkdyaVhNaWNLeDJXZkhYb0JPMmFaYlFkN3JJalA4WmNYMW81SGJGa3dMZnFa?=
 =?utf-8?B?Tk9EL2JoZ2NTRkZhY2Q2RW1waDViNEtoNS9IdkxKUjZOL3plRndqV0QvM2lM?=
 =?utf-8?B?a1JpZXFmc0NKSm91V1h1SXA5dmZKazBRYUcvVUFaQ1pJRkpnUGhnTm5IbTRl?=
 =?utf-8?B?Ylp6eVJRditFSlpIWk0xeE1BcHdkS0FCYXM2UlJycnJLMURzdS9vOUZRQVZa?=
 =?utf-8?B?elZSa1lFM2MrbjQ0TzRFcnYvUWI1RDlRdjJ5bTRVT3k1bVVYaVRvdEZmUDJQ?=
 =?utf-8?B?NThhclJCNC9NeU4wcjdIaFlEc0l3TzV1TkdEMDJqeXpyc2JidlJjMEsyTjVU?=
 =?utf-8?B?bk95UWt2VTFrNWdycmZaajYxTzNGNko4eERsa01JcHdEUWgyeVp0OEJXdjlZ?=
 =?utf-8?B?NmlKYjFQeHdxcWdVdHNlVkVTNjQ5cmFtZzBrUVBLUkg4NUl2RjIvejFnVkVx?=
 =?utf-8?B?Y2ZTYldVV3djaHVLc2VXN0N1Zkh4am5aRUMzR2p4TlVSQkhURTh4V1Y0aDR3?=
 =?utf-8?B?azBURER3V0VPQW9aam1qWlZLMXRVZ1U1RGI4d3J2RkI1ZG5HcWN6TGZ1SThw?=
 =?utf-8?B?Zkc1Z1VEU3MrbEVJZnloOUR0TTNkNUJiMUVrSlZ1Q1VSOHBmTEN3MFVNcERM?=
 =?utf-8?B?cVh4VmR3SGZPK3VTSTgzanpkMzJ1UUh1VW02aXJDRDZUc2tISTltSVRQZ0w5?=
 =?utf-8?B?WDZ1NWIyUXAwMTBNNWV1S08xWkJBZCtTc0xUcE9OU2U3MWpqdThlNTNUb05n?=
 =?utf-8?B?VlJFUDloZCtiSXl5WG5JVW14VWQza2Q4NXVOdys4OVovY3BBYndQSEJ1WHoz?=
 =?utf-8?B?Tjhya3k1U3AvcEhXVXorRC9oYkJjZE5OQnU2UFFEUEVXdWozYWFwYlplMDNS?=
 =?utf-8?B?amlIejlOUk9vWFNWWVk5QnBSMEpBUG83RzNhbkR6c0gwWk5yQzNMT1JzQmNX?=
 =?utf-8?B?WUhlZUpBZzk3Z1ROR2pBMi9PRG5sYk1YZVJuWFdPZWR0L2xWSHN3eWlyOTBw?=
 =?utf-8?B?MXdrdld4c2t1ZjlGcHZTQnRqQUI0ajJwNDJnMktka1JIaUVMZ09qNUJEenlY?=
 =?utf-8?B?MEpXL3lWSUZqcjFlTUNidE9DbFNyTEZrTCtIY0s0dkpUejdRaW1vcTJ0Uk9X?=
 =?utf-8?Q?8Y6Jn33qWHLzP8cEJ3cSXCEsR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc08df73-975b-4e73-0f44-08dce9032409
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 08:11:28.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vflYbXNjRk/Bz9Kuwww5EILKUR5WwV9WqZRLpUUz5TrqMpkya1rzBn1LA6wvNzzj2vjuJXcMLfs07Wr9p0mudg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10397
Message-ID-Hash: DUSDF56IXOYH3FYGN4XANTP6SX4TYQ6U
X-Message-ID-Hash: DUSDF56IXOYH3FYGN4XANTP6SX4TYQ6U
X-MailFrom: iuliana.prodan@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUSDF56IXOYH3FYGN4XANTP6SX4TYQ6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/9/2024 10:46 AM, Shengjiu Wang wrote:
> add cs42888 codec support
>
> Chancel Liu (2):
>    ASoC: imx-card: Set mclk for codec
>    ASoC: imx-card: Add CS42888 support
For the series:
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia

>   sound/soc/fsl/imx-card.c | 59 +++++++++++++++++++++++++++++++++++-----
>   1 file changed, 52 insertions(+), 7 deletions(-)
>
