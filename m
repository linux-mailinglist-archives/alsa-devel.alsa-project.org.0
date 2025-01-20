Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E718A1729D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 19:19:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A06536026F;
	Mon, 20 Jan 2025 19:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A06536026F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737397142;
	bh=y7fomnH5A4rL1xtLbT+Dz7qf9L9CzU4m7aV1XSdkga0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IvMQhh+2MKZDIrbmtHN7hiKkoZ52frAeBDeCCwo4nT+hseU2klCdVEORM6qt3ROG9
	 yFSCwD9FFUhtlZkbV/oAPvbVndq3gQjQVQNhORR/57AJs2WbGrgO8A+Mad9gtCd8KU
	 xObLhiMBXSi7IWbFRFuyi3gU/VUZ3uFLAW+H36DQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7DF6F805B6; Mon, 20 Jan 2025 19:18:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E1EAF805B5;
	Mon, 20 Jan 2025 19:18:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B8B7F80482; Mon, 20 Jan 2025 19:18:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67447F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 19:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67447F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wf1Vm294
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2Vl2ShD0mXLW4v1hRy3xBKbY5SwH/00ZxETTGWCDs5ANlao9omNVYuq1uI/QnfCbg2jBpdBHk6rEje2YCrufrLIIMhlLdtn7TPBLvb8gwzGRehC0geSDze5Ir5RZZAwGgbiaWeSY5qrXnR7w/KCOk0wPoyS1dhYk8uL2odECDxlCDWCurILkYobJcxJOu+po6+WAWanevJ6/387IwauX9ZAcetXdVihGAm2ZbHp6h2uisdTVLR9vlJXrcFO61TTqPbBb67qeZNpY7Ku82QkjTEoZ+eDqSySwijL00T8DMC1tGsnLSfCThRRvskLPYdxu+ZjyCanJ/UEZdvaF5s8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3D/J/2sDPpeDRWknUKa8xrkx3CJmFKucICi1Q5lUagU=;
 b=hKrW6lcor46QHz+7VJe2FPm8S9w6tLJr7wZaBZgXsSkPkB1yjCyGZc1SxVCd+oHx90hmcEPA40ITSyvrlqaiJh1z8Jt+fsi1qYvHTVsP9L1UZSEYFXmjWsy1sYpH3rXzsUJFZp3ZdRpMEQb0KDWAA3Wowce/ZNyGuhonCa0S8pB9zFaxvvyhiJK+l/vWjYaQnkc7WhvOQmGVwlDYsh1PVL8adzIh9Z5PN8e6xZscoQwMKEjILMbPWmVVw0t15TU4aCdlrqJuM1wn6AT+3HJAaI9uUELOrtLoymhib/ai3jIuclwBsN/+U4dGV13V4ZsIm2d+35hZ+OJhqcXe9reU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3D/J/2sDPpeDRWknUKa8xrkx3CJmFKucICi1Q5lUagU=;
 b=wf1Vm294USqT9ZvA9M79l1KB/lILOotIiOt3zGR8iO37xJEhpgimdy4aLHR4fwkpUSL1N4XI7MrxKI+BWkvianqnM1armJ81dlXlRep32npWbIBm0uwozoJXr21xAImXpd4LcM/0GGTZgdFnk47Mh9F+t+N5flrWdx8VSXqPvRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH3PR12MB9147.namprd12.prod.outlook.com (2603:10b6:610:19a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 18:18:09 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%6]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 18:18:09 +0000
Message-ID: <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
Date: Mon, 20 Jan 2025 23:48:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
 <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0128.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::13) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH3PR12MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: abfba20b-8efa-4065-7d29-08dd397ecaf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b2VvL3NFSWh6djZIdWFzTFBKeUtpQWRkd2VjY0ROTnJncng5M2F3YmZjUUxq?=
 =?utf-8?B?bEtGZU9nVmxrbzNPN0loVjE0V3oxbDVEUWgwYWV0eVhRcEt0YXdZcnhodm5V?=
 =?utf-8?B?WDZaRW5FamNsTVE5cm84dDZONnRLYjdPMTVGVjk5bEtRR05tR2s2ZG9ObWl2?=
 =?utf-8?B?cmN5elE2bFZzWVo5RlJrSUo0TVlXRmYzZ0VqSkxITisrWjhvRU1yOUFBdUJI?=
 =?utf-8?B?dW1ZS1hpN0F2OUFOMFdoK1Y1amNoTnJDUWgzU1d0eHIyb3RvTkJrd1NnRU11?=
 =?utf-8?B?SGIwaUU1Y2tBVndTZGJ4WEtjM1Y1WEx6OVdVaE1nUjdOLzRvLzhhSmlpUXo0?=
 =?utf-8?B?a0ZqTlVFeGlYY0hha2JCUjRnWVZjMjYwN3RxMExBZ0ZyT1E5RHYzUFdsb3or?=
 =?utf-8?B?eWVXVjF4bkZQV01saDN5a3d5Y1F4QytCcEQ2WmU1MEJ1ajRteXdzKzJLRXd1?=
 =?utf-8?B?Z0QrVVBRTUtSZUdHYWZyMjJGSGhNTkhEUkkwdEJzOE1uQ0gvcVdXTm1scDh0?=
 =?utf-8?B?Y29mZHlkTmRTNEtzc1lSbGJOMU5BamtoUzVLWVpKTEJ0OVFmL1BlV2JBbTZ1?=
 =?utf-8?B?cnRQbHlzV0VVM2J4TXg1TndTanpiSjh3NE9IeWJHMFdOWU1pTzJvaFFYTUV3?=
 =?utf-8?B?cUM0Z1pseCtJeFZ0Si8rTkROUkFuN1B3M1pWVGNoMWhwak5iRGtJZjRxUXpr?=
 =?utf-8?B?aDRrckprT09leUpuVU9vU2dLT3VvdW1GK2s2ZXdSZm5rWlYrN3RHUEVETkdB?=
 =?utf-8?B?bWFFWSt2eGI3TmRKT2VSL3VlaTMrMXBNY3h3a3h5VkN2d1RDSUZINGF5dWs2?=
 =?utf-8?B?dlhlcktJQitWeTMvRmVObllHZTZSd05lWnhORlFtZ0tDWFl0V0NKY3dXczlE?=
 =?utf-8?B?KzdDcVV6am42WHkwY1VWdlZNcXRIVUtFNlVGQTE1V3l4Ny96M2YxUUMydGYv?=
 =?utf-8?B?S1FJancwV1dBVjVGUVRQa04wc0wxSVVOR1dGSWtxVUpJaVAxajNvRHdYZFZ6?=
 =?utf-8?B?c3NxY1lLZU5uaEM3K1llbG9HaFBQZHc0N1V0MFUyOWJrK2pnR3cwR0VwMGpX?=
 =?utf-8?B?TEN6VHF1Q1kxcWU5Y1d5N09Id1ZVdlhib1hXTTRjYTFlT1B0OVhmaC9URG93?=
 =?utf-8?B?Yk9Rckw0L251MnpBWERCUEYzbDdZR1kreWl1dkdVSUtmRE1lK0pRQ24xWjVn?=
 =?utf-8?B?QUVNc3FQeEd3b1dNZkJqYzZIU0hTTnhPbWNiVnpIV1VsaDZKcGFVRlNVNnV1?=
 =?utf-8?B?LzEraUlPUTdRUFFOaFFZVkNzN3pSalVNUXhaV0E2MlNHaTRNZFRWVE91VmVw?=
 =?utf-8?B?bzJjUWZZYi9RMHRUdm5oakl2T1hDNHplNFNsV0NtdS8wbHlodlhlWjNxZi9M?=
 =?utf-8?B?QkliOUVlWmlLVFhiV1Q4cmsyOVRPdjRxa2NpSHh4ci9yTndNUnc5Z21wM3FZ?=
 =?utf-8?B?dEVSNUlkWUhUdU8zeXV2dXVxaVVKRmticmZJcHhBSy9EamUwN0FINkhuOHBO?=
 =?utf-8?B?THVsa3dKLzNKUEdLWlhjM2pBL1JtcnBoQWRsVG9HVDBjRzhhM2p6anNZTS94?=
 =?utf-8?B?WXBISjNsL2hyeGlJd3c0NHdzWGVsTWNORWlkMi9GVEtoUWtRUytDMHRiZTkw?=
 =?utf-8?B?MjBQVG81LzJqeC9yaW9mNjh3ZEZYZDBrVlJ1TEhxZzZza0ZSVDR6NHd5Q1Yz?=
 =?utf-8?B?czFGQ2FUYWt2YkltRVZxei9Malh4OS8rM1oyRjJWQ1dNQ0kwRVFBR1B2ZE1t?=
 =?utf-8?B?c2tHallIbkZTUTRNR0oxd2w1Qk9LRUYwd3Jkd0tTVE9EU1hwRm5qT3BNSmVs?=
 =?utf-8?B?WkFJU0MxUTVTZisraDY0dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnY1TGVjcXRUdStUZzhQMWZkcjM3NW1KT1JtdDljNS82S21yOXViVldESmpj?=
 =?utf-8?B?SEFLbmV3OWM2RU4xUVlsMzRMR1ljTU9KMzBMU2RFOFpDMkVKMTZ3cUxGV2E0?=
 =?utf-8?B?b1F2aEU4Nks4b2hldlJrY3dRQ00ydW9YSUNzMjk0Y3hSVmx0K3M2M1JjUWdh?=
 =?utf-8?B?Wm1hZnVublBqTEFGaWdKS1Q2ZWlTcVpWTzFJS1dtWVg4TS85Mzdxbkhqdk9n?=
 =?utf-8?B?NWtOV1VLRG40SHNwdSswUERSUWgrZmNxVkE5ZHR6cDhRS1MvNk9KYmZOZVU5?=
 =?utf-8?B?TDhOL2EvaWllS2hHM0VLSWlhd3VXWTFybU9MQ3RUek1VUUhaRmtkSlJ4N1p4?=
 =?utf-8?B?MzJVSkJIWWZvN3BDN2NaTXVBV1AvS1ZNd0ZkR2twWUFkbDlzL0w1TFF5Uk1X?=
 =?utf-8?B?eUdWb3RibFNXa2l3L3pWMDFYREpOMWdzVzBwUE8ybFA3UGVrTXp1Z2R5Z2ho?=
 =?utf-8?B?dTlEUVo3UmJtMGQ2eWJINzduUjNmUFRnNjNNMlZXY0ZTdnNIZWthVGdmWGs2?=
 =?utf-8?B?NHorMmZ4Rllla1cwQUtKZi9vRUZ0a2ZmUFMrMEtldFAyakkvUUFPcGZNTTRM?=
 =?utf-8?B?MWl2WmRpUEZ6QUkxa1FMUXB0a0Z6dTNVOWlFRXpmd0ZmaWNRc2Rmb1RMT1A3?=
 =?utf-8?B?M3ArRHNMcUR0bmM3WVpQTkpZRHhKeElxNEE1aldIVU1wRWhkUjUycUt1V0Er?=
 =?utf-8?B?TTgxelY1SDlHZTJJd0x2YWI0Y3R1Z29kQXRkNlNDY0RGYkpzMHdROHg0REpJ?=
 =?utf-8?B?SEJDdzFvNkZpSDdSUXRLR0pGODBrbnQ1K1IvLzJkVFU4QnJmMUE2d3NsdkdX?=
 =?utf-8?B?YTIxN0NETlhlL054aUN1NUVuQUtVU2Zsd2xhZ1Y1SWtPb1kvZ1V1cjg4cTBx?=
 =?utf-8?B?YVZBL2NRaXRRaTBaYldLZnFwbHFqQWdRaE0wWm5DWnhhelgvbkQrQ00yTldZ?=
 =?utf-8?B?dEhLVHdGZktvSkU1VzJaZ1BqU3Zsay9SSjR4N1BLWkFUWE5LS2dicmE3MVBa?=
 =?utf-8?B?WTFzdHZZd21rMm0vM21RcUR4VTVxYzk3UlVsR0NvZG9VWnNvZTBOUlhIRTFn?=
 =?utf-8?B?bFJDVU9iL2xVODAvbmUxTFNWUFJJTHczSlNialdhQm5DYUFaOGI1bzU4dzlL?=
 =?utf-8?B?T3VhZjNjaXRoQkEvaVZIbUxCYXA5RDdsdU9GTFUvbUprMWs5NEVDcCtjbFJz?=
 =?utf-8?B?Nk0rKzEwajdTOCs0WnNBNUUyWkVGeEhqc1ExL1duTlVjZFQ5c1VzTkhLU2Rw?=
 =?utf-8?B?R2ZLVldnV3RwQ21yTXVraUhoZlFEVHpBdGxWcUlsQ1ZseVIxQi9VMk1uNTg0?=
 =?utf-8?B?VXJGMjBzV0ZlQm1lVjVrOWd4U2FpVkRYTVV4c3hEUWJsNDJWL3lrdmZsWTRT?=
 =?utf-8?B?U3BPSUg0RWd0OVQzVGZTTjlRdVdqOC9SbVgvSDZqWnZmYWFsQ1dmbk9EZEVV?=
 =?utf-8?B?QTVmd3R0eE41azBKTTZ5SURjUkhGU2FoUk9FK0hBNmZqTm5CODVJWkh1WHhN?=
 =?utf-8?B?Yzk4T0NLY0xCWEkwRUxJd21BbzNzQW5xSWZuQzBpOGx3SkhIOUpOSkJDd0FC?=
 =?utf-8?B?bFJWYnZsdlYzZGM5V1grSllHd1VJSjIwV2FTNnpyaUdYNzhjOTh3Qy9PRFZt?=
 =?utf-8?B?UlVsNFJqRjhNc2g4SDVCMUM0Vm1IOFpMampGeHhNck1yRkxwdlljd2RENEly?=
 =?utf-8?B?ZUZ2ZDROc25MeW55Q2JJUlNWNnl4VzdyZ1JpdlllT0o3Q2lvQ0hnc3pOT2RX?=
 =?utf-8?B?clpWRDZVdURUTDVQakJEYVpxdUFRaHd1dHVQdkJ3ZEpYQWI5OGVVR3huR0lK?=
 =?utf-8?B?NldrcFk5SGErNDVib3JVbFEwM3NOUXQzK0xaaGM0VWJwNTV4b3BSNmNqbk8z?=
 =?utf-8?B?WDJ5dlZ3a25WWjlBd1BwYXBtWnF5TGdRZzkxRGRsZjY3MjdyMzczS3E4bFk2?=
 =?utf-8?B?c1hveHk2Rk1RMjBmSktFbGxQbC93aUowSTJlUjBaakN1R3NwZDM4b2pXaXBO?=
 =?utf-8?B?RWZ2Z2dhSjRWSFQrSmRLYS9SVGNpelpoWXlZYWpJMzhSNUVKNS9iTUxoc2hY?=
 =?utf-8?B?SWNVTEVZUWl2bk45VFFuaVBBL1M5SEsrUzlST1Flb1RmV2hvUy9yamI5SS8y?=
 =?utf-8?Q?o/2LDN+UNAIKrwC/+VWmmUmpY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 abfba20b-8efa-4065-7d29-08dd397ecaf2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 18:18:09.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fiYR+WeIzDYufVtcVpHzh+7XVZecKagBYxSlOzP/rv9D49FVkYJ+xl2BBi6aLPWdF3VJUDCzmGo9GlP1SzD/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9147
Message-ID-Hash: ASWLYJDV66JYRZV3GO3KJMDN23G4YIOS
X-Message-ID-Hash: ASWLYJDV66JYRZV3GO3KJMDN23G4YIOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASWLYJDV66JYRZV3GO3KJMDN23G4YIOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/01/25 23:25, Mark Brown wrote:
> On Mon, Jan 20, 2025 at 03:31:19PM +0530, Vijendar Mukunda wrote:
>
>> +static irqreturn_t acp70_irq_thread(int irq, void *context)
>> +{
>> +	struct sdw_dma_dev_data *sdw_dma_data;
>> +	struct acp70_dev_data *adata = context;
>> +	u32 stream_index;
>> +
>> +	sdw_dma_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
>> +
>> +	for (stream_index = 0; stream_index < ACP70_SDW0_DMA_MAX_STREAMS; stream_index++) {
>> +		if (adata->sdw0_dma_intr_stat[stream_index]) {
>> +			if (sdw_dma_data->sdw0_dma_stream[stream_index])
>> +				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
>> +			adata->sdw0_dma_intr_stat[stream_index] = 0;
>> +		}
>> +	}
>> +	for (stream_index = 0; stream_index < ACP70_SDW1_DMA_MAX_STREAMS; stream_index++) {
>> +		if (adata->sdw1_dma_intr_stat[stream_index]) {
>> +			if (sdw_dma_data->sdw1_dma_stream[stream_index])
>> +				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
>> +			adata->sdw1_dma_intr_stat[stream_index] = 0;
>> +		}
>> +	}
>> +	return IRQ_HANDLED;
>> +}
> I appreciate that this pattern is already (identically...) in the ps
> driver but I'm not seeing anything here that looks like it can't run in
> interrupt context - is there a special reason for deferring to thread
> context?
Soundwire dai links are created as non-atomic. Invoking period elapsed
from interrupt context, causes locking related issues. Its expected
to run all code in process context.
Compared to PS, In ACP70, no of DMA's got increased for Soundwire
Manager 1 instance.
>
>> +static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
>> +{
> This really does seem *very* similar to the acp63 code...
Compared to PS, in ACP70 wake interrupt logic added.
New register fields got introduced inACP70 compared to PS.
Please refer below patch.
https://lore.kernel.org/lkml/20250120100130.3710412-18-Vijendar.Mukunda@amd.com/
Let this patch series go as initial version for ACP70 platform.
We will revisit the code and implement common helper functions in the next cycle.


