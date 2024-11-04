Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D089BB819
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 15:41:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70879A4A;
	Mon,  4 Nov 2024 15:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70879A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730731262;
	bh=8NCKJZtqywBCiQApD4NpE/SzEZL3TvhP43XRFMisosE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=THga7lELDh8Kbti6l1NRPI6fFulcA8WocSXXQfkdOl9LaC6jOCxwZ6Qhv0wPhI6Rp
	 33XxNImJpoC+xfWSKr6RyuPor+iNLSRwBypzu2m/V+iRsx44kxDdhFLcduOIj04Xht
	 DwpQsGSOUdwcrM85osF9n9v825voaU7D9Nru6Ec0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05AF2F805AB; Mon,  4 Nov 2024 15:40:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C40CF805B1;
	Mon,  4 Nov 2024 15:40:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBD17F8026A; Mon,  4 Nov 2024 15:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::625])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F0D7F8014C
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 15:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F0D7F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JHVz3IHG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUt6d5GzZU4o3m1Le9/UzO2qxxLH4JTkjdN14EncjI+OUENjOO+YHMvADsklLnP9cvEmrkLdhqTRCHWZZReFo3sT/7y89l3CmdoZvLVCJAprr7U4j78h3PzOJ4Us2EHj196750Dpi6BeTPgsxr2ILPmLMd9P8JaoOATAyX2h/d4QhfkQksH/lr8PZ/xMNCXdJaOdhv5VxzLIuXmJxU7tH/nYeyc783HptPQEszv2TT14qWGiMrnNusTWNxlhoTvIMnCbg4GHaC0RRz23hZZJWoZ3x4nL/i5VaC0oyka2J7PwQNuszMBOl5X3iWqb4cf5YpMDPF0cqvX8DhBQKeQhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVyR6mu7nn625JRSxpumsUFbpMf5tblq8nJT3KpgV6I=;
 b=OCSqaTHIMWjBxjIQXrwlK+qSgMJt5hzkyyAYUN7lLI8Oa+HoHipID+7v3FhtQ7R4HJzqzAj6JtsEhUMuLhwsjZon7apmRekUEW1eh0WFxKp4afznyo4nhOOwhUm+XUNfiWdqC56AxfisVo8XTlRI6CrOKlqTx98QERSW4fffoNzWBG6ZK4kSBnfvCOc6gSZfhNBF5rTqOoirTg/kwWxRp4C1hnNQgdy50TxB+cTLfa8gXIV8CuvUixyd/pWXdxuwh8gsuGU3TAtHBgT8y/ZC+FpQQvouATMxbWm1i7PIDSwDS9S03z4DRrP+tukT9bv3wuEOLS6zu5t9vh8twDZkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVyR6mu7nn625JRSxpumsUFbpMf5tblq8nJT3KpgV6I=;
 b=JHVz3IHGLAWqvfm9hX5O4C18/4YDSimQtBTMswmm8UG88d7iil8ugQl2JCuzzNVkvKofP+laIjyICP1FgwSbmgJtMcDIqiFvP2+yJB7WUzFgS0OsPLdW8k4091ui00xXJjCMFDb0RGVbuWWDNqshQL6NzNBRJq71+vvUwaXZKpY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB5664.namprd12.prod.outlook.com (2603:10b6:a03:42b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 14:40:14 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:40:13 +0000
Message-ID: <ac033fce-ddd7-4549-a560-107e10dbb155@amd.com>
Date: Mon, 4 Nov 2024 08:40:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix for ACP SOF dmic tplg component load
 failure
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
 <36b9646b-8c70-4c7e-8398-ba22331e0004@amd.com>
 <4843851a-edde-4d8e-b311-46b980dab5e8@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <4843851a-edde-4d8e-b311-46b980dab5e8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB5664:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b483bc0-6ad4-49bd-ab38-08dcfcde975b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NzNHK3VUWmFWRElaanJMQldlWHZPT0hmU0N6VFM4VHJmS2ZVTmxyRU1VakpW?=
 =?utf-8?B?Z0s2alNOd2NGRlBpSHBvNHpDL1N2RkIydnZMSVB3RmpDeFcyZGVITU1JbHlS?=
 =?utf-8?B?TlBib3J1K050SWplQURNK3dqV0puRjZNQStHZGI3MGlMMjNuL1NYU3ZsVWwv?=
 =?utf-8?B?UkcwaXRSQ29MUDMvbkkwMFdWbGdPMnRwbjZyMG1pS2M1TjlpbmNlOGRWWVlh?=
 =?utf-8?B?d0xhZEhTbDNlMjg2YnVxcWRzY1IzTFBZcHVwSWdQYTlhODZYOWdtU3pXTzBW?=
 =?utf-8?B?UkUrdHFNTVpOa2xTbGw4aUdOK1g3UkRQZDZOYnZSZGs2VGpSSnJvTlFBdDVm?=
 =?utf-8?B?QXQ4TVplUVJYdkdtQXhXRW10ZkMyNjM5eSt1eUU0MW5QN1Vqb2w5UnAyc0FO?=
 =?utf-8?B?YkJqVUEwS0l2aW15QWNzSDNJdGdoSEo1TEpZeElaeXJ1c3djZUNyMm9ySjJZ?=
 =?utf-8?B?ajBMUGs1eGRIdHM4MkhGTjZYQmVFanQzTUw3SGV5SnRHYVNWRG5LSjFTTlVz?=
 =?utf-8?B?cGduRVljVkY5VURraGhoTXhkOE9OUUdBL094T0UvOHV4cEJFZmVFaFM5dHkx?=
 =?utf-8?B?ZGZjZUtNd2VUVjZNQWYxc3NHajhGemdud3E1KzlYZzAxMy9GOXV4RUNMclFF?=
 =?utf-8?B?c0VhQklMQlJoTkxWR2xUNjJjVjV3T3pFckgzRDBORXVEV216L0xlbHBhUVdP?=
 =?utf-8?B?WURmckRmOWZOUCs1cWdsRmNFc3czdWxqWE1aenlXb3pnMHF5V29Xcm53dWdr?=
 =?utf-8?B?UTE1YUdZVE43U1huZlRneVFpS00vMHYxaW52T3NWMWRvZjFxOEp2TXA5cm1R?=
 =?utf-8?B?anE3VEIreThJSzcyZzU3enlPUnArWEhsUnNFaTgvbDVrNFNxbW0rdGU1YkZC?=
 =?utf-8?B?NVNDOXZ4VEplYlpkMDFKYXAwN2pqaExVeHBzOHRpVTJLZ0tYcHdpUmYvRFFw?=
 =?utf-8?B?Qlp4WVFBL3BhbExwOFhEMjAxeHpUY2ZiRTJzSjBvWHJxaVNGMFFkWmJray9L?=
 =?utf-8?B?MVlqeWlJUDhxMlNrUVVpOFpoU3dVY1lIRjJPRXMxYm13WndKTG1aYmRkTEcy?=
 =?utf-8?B?Y05iRzBwMC9weGpqYTAwTGl0M3BQTS8xV1VEeEJNVWN0M3RiN0RNVFlIMmV2?=
 =?utf-8?B?MTFtbmxzdnV1RnFMNW5CT2VKSlZLNFFhNWtUVHUxcGlnN3BYQnE3QlNPRTNy?=
 =?utf-8?B?czVsSmhvRSt5aTlBNlJXVE9iK2YwOUJ1NkgxdVdsYVdTN3dtdzl6MVljUitE?=
 =?utf-8?B?TjJ4aDgyVXJxZjZxVGtyb0d2d1I3VmY0eDZvSC9vb1pndTZpZVo2L0J2amFS?=
 =?utf-8?B?YVlrN2hnZVJqWHNESmsvajEzQ0pLQVFmYjFMWHZXMHUvN2JJRFFuelNKWkZC?=
 =?utf-8?B?ZFNLSFlPTXpOcUJEN2h5VkVBS1cyK3plMkhZenZ6TGdFdWFLZksvMU02NkRQ?=
 =?utf-8?B?blNSM3BQdUE0c3NZR0M2VnB2dUFDT0dDYkd0amhZWENGV3ltTFU3cEcyUGpK?=
 =?utf-8?B?VXI2blVyYUwzQnhLdlVPOVNtbGdTVEhLQk1HWDh3ZSsrVGN3KzdkVHZoYmhU?=
 =?utf-8?B?NWNONWpCaDBTL0E4RnVmUmFRRCtxUjVsWXd5OFRVWjdUVjZnSCt0enNNTmdj?=
 =?utf-8?B?OVd0R2FkUGNaK1JicnRxU3RhWEJxTjB1ajBuaDJxZVp2Q25adTg3UVBNbWxu?=
 =?utf-8?B?WGZmWlJnV1A1YVlwTFUxVGlFTThRU1ZuR3RZakNCWVo2WlFhLytTUVo4TUhy?=
 =?utf-8?Q?j5j0m/G0iKfsyRdpbCcKDXXvZrScLUPLokZmqzQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rmlza2VsazhmbHZQL3Y5T0I5bGEwWXpKcEp1OCtCeUdSSVhDU2hwNnQ1RXQv?=
 =?utf-8?B?SWhxVEJ1c0JONWcrL1QyME4wRFMwbENmb1JjMXgvTFhiTWp4bFdEVkJ4THda?=
 =?utf-8?B?aFJoMXBiQThJNWZ2ZHpuYS9qbm05VW1rV29kMHBrYnozbnJyNmpTN25mK1Vx?=
 =?utf-8?B?RW1xTEpaZDhTZnZ3emlaNDVUNG1Ia2lLOHljRTYyd1EyMHVqVXJEUGcxQ0dU?=
 =?utf-8?B?UUI2ZEpUSUlGUWZENGtnK1RWV0c0eGkrR0pmZ09IcWRCQ3JKUVI3amYrd2Y0?=
 =?utf-8?B?YWs4Zkk1S0wxL3U3ZnBNclh4aWhRNzBDWFUvVjhkK0NBaWxFalBtOWFlZzRt?=
 =?utf-8?B?M3NVWVcvZ0s1bFpjSExLWm8yUElubW5LdXBBQ1MzbXl1aXN4SVR6NlBEaU5t?=
 =?utf-8?B?d1FSakFNUkFJcGFmZXIzZVdYV0kwRy9ISll5TVZlZkVMRkxtbnI3L1hFbjkw?=
 =?utf-8?B?YzRzelVnNFhrRjA2bGVBcHdYay9qcnN1bDRaaDNjenFZMFZuRlh4SGE0b0xT?=
 =?utf-8?B?N3JUNFExQVhMbWpIb2FMV2ltbWE1RXA0c0s3MVU0NGkzSmM3YzV2N3laeDk2?=
 =?utf-8?B?akhMVVZIczZ5RWw3MGpESlpLQXZVb3Axd3dwRWxnYUZvcVZtKzhLdlp2TU4r?=
 =?utf-8?B?UmRJWWhqL0lZUW5KR3VuTUdQM0RCakNxUFB6ZUhJLzhZaE14R3h3c1NsOUpS?=
 =?utf-8?B?eEdSQk9HZWF1OUNWdmxQTkdzVzI5QmJFWDNldHVSRTQ0WUxuNXM5TEszeW1B?=
 =?utf-8?B?VWxlTml4ZHNNRVlpbGZkV0N1WmY0ZndwM1RCTWVGVHhia3dlemtySk1ON1Bk?=
 =?utf-8?B?YVNTWUl5eWNlYjFtSE1Da29hWHV3NlAzVjhKRGk0QWZ3MENScTNGdTl0azZJ?=
 =?utf-8?B?bmtqQWxMSEJ4Uk5wSmFwOWowZkJTQ01CSTRGaUljMUswak1jZFF5Z2hqeU1x?=
 =?utf-8?B?THhrZXFCOWtuY08veklsYnFZQ2svS2hzdVF6UDNldTI1WlVqMWtkcmkzU09U?=
 =?utf-8?B?Vks5RGdRN3JWa3BhemFUcm52V2tXTjFaU21COWV5OUlrQzU5UktMTTBDUCtB?=
 =?utf-8?B?bXJpcWVSb0Rkd0IydmNlR2lONlRucDdOQUh6dG1TNWRwS0FXajlBbTVGV2Zy?=
 =?utf-8?B?VDFIeU93NU9vN0lDaHM3QVNMRkxFaGtkUW5VVkt3V1hONkp3bG9odG4xbTRH?=
 =?utf-8?B?ckNrMDg2NHp3alI3c09JSVRrMEJYU3dWWlVnNlJPUFNoNGZmUFpTU1labCtM?=
 =?utf-8?B?Wk1mMVdPZ2xHZnVBazBWME8rMkptZzc0TE1UbnRCR1pYaUI3R2xpN3VNRFFD?=
 =?utf-8?B?NmYwUkJGK0IzNWc2ZjJQRFFCR3pNcVVYWWtvU2ZNcmFML2hPOEpWRU0vSzRZ?=
 =?utf-8?B?Y2J6ZjhPT2FqSXlPWm1OMnhIMGhubUh5akwxRmJhQTNrcm83cUY1bEkzQVVq?=
 =?utf-8?B?RGZra3NOVE9BMlJFOUxRcDd2UEZxVVhXek04VjQvcXBJUExHdVFubG5hQXpB?=
 =?utf-8?B?aSt3YTBUTngybGp6Y25zTEZ6WVhueGdEbFUya3J4aHViaXg1OGpDWjZsaklt?=
 =?utf-8?B?WTFGWlk1V0R5RkdPeXkrMnVHYUZ2N0RxREFtdlNHcWV6Qm55R3JPc0Izd1dQ?=
 =?utf-8?B?Zjh0TFVPNzNQcTRHZWVDSnlNSTdYSnlrWmg2SWszN0NDMDEwcC9aQUZWRHp1?=
 =?utf-8?B?ZmNsM3F5Qk1vYUc1NjBjZ3lrZklGNnNIcFA3NEpoSkpiYUJIQXJTOWh2Z3Zo?=
 =?utf-8?B?eXI2RGRPRjNJR2xFcUUxbFR2bGpwKzhpNjlKamtlLzViUTRFWTY3bnFDWUpR?=
 =?utf-8?B?MGtOWTl0WTlNa0pWMVR0UThaV3VUUFFVZUtVcTRqTmUwMFhZN2xCam5kQ1gw?=
 =?utf-8?B?UTNGeUY2ZnFSSkJIYXI4SDlRdW9lOTBoYlZ1Z2h6THRDSURpajFrOGtnSENQ?=
 =?utf-8?B?ZnljTzhaZUhJM0lvVDdUdmhSM2o0UDQyWUx4eVVoNnh5T3lxZ0JSTGxFdXVG?=
 =?utf-8?B?cDdoeHRxOXBnQU0zYXk0K0RwaUwxNkk2bHhMeVU2NmpmTnhnb1VOYVpCc0lk?=
 =?utf-8?B?Z2RUZCtWMTM5WVR5cS8rdTI3OWQwZ1lEaWZGUDcrL2x5NlZ4a204bFBpRmR2?=
 =?utf-8?Q?rXWAHDQg2SK/MgRb7RtO0Yvym?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b483bc0-6ad4-49bd-ab38-08dcfcde975b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:40:13.3895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nehmqi/S97IDpHhzW0SXjTiwmoyvJWPyiS60QOjEzWdarVQIKExA7wtdjHz+neoNsZ2/NALH5j8MuLI0gi1z9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5664
Message-ID-Hash: U5H67EIGHYSQDTLFI5WLNGPWMTIP3IUY
X-Message-ID-Hash: U5H67EIGHYSQDTLFI5WLNGPWMTIP3IUY
X-MailFrom: Mario.Limonciello@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5H67EIGHYSQDTLFI5WLNGPWMTIP3IUY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/4/2024 08:35, Mukunda,Vijendar wrote:
> On 04/11/24 19:52, Mario Limonciello wrote:
>> On 11/4/2024 03:13, Venkata Prasad Potturu wrote:
>>> Stream name mismatch with topology file causes tplg load failure.
>>>
>>> As SOF framework assigns dailink->stream name, overriding stream name
>>> other than link name causes SOF dmic component load failure.
>>>
>>> [   35.474995] snd_sof_amd_acp70 0000:c4:00.5: error: can't connect DAI
>>> ACPDMIC0.IN stream acp-dmic-codec
>>> [   35.475001] snd_sof_amd_acp70 0000:c4:00.5: failed to add widget type 28
>>> name : ACPDMIC0.IN stream acp-dmic-codec
>>> [   35.475013] sof_mach acp70-dsp: ASoC: failed to load widget ACPDMIC0.IN
>>> [   35.475018] sof_mach acp70-dsp: ASoC: topology: could not load header: -22
>>> [   35.475072] snd_sof_amd_acp70 0000:c4:00.5: error: tplg component load
>>> failed -22
>>> [   35.475083] snd_sof_amd_acp70 0000:c4:00.5: error: failed to load DSP
>>> topology -22
>>> [   35.475090] snd_sof_amd_acp70 0000:c4:00.5: ASoC: error at
>>> snd_soc_component_probe on 0000:c4:00.5: -22
>>> [   35.475117] sof_mach acp70-dsp: ASoC: failed to instantiate card -22
>>> [   35.475254] sof_mach acp70-dsp: error -EINVAL: Failed to register
>>> card(sof-acp70-dsp)
>>> [   35.475261] sof_mach acp70-dsp: probe with driver sof_mach failed with
>>> error -22
>>>
>>> Fixes: b2385de2ae11 ("ASoC: amd: acp: Add stream name to ACP PDM DMIC devices")
>>>
>>> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
>>
>> Thanks. I was aiming to sort out (null) from `arecord -l` but functionality is
>> more important.
>>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>
>> Mark,
>>
>> Up to you but alternatively, you can also drop my existing patch and force
>> push your for-next branch.
> 
> @Mario: Your changes are required for Legacy machine driver.
> This patch can go as a fix on top of your commit.

Thanks!

> 
>>
>>> ---
>>>    sound/soc/amd/acp/acp-mach-common.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/sound/soc/amd/acp/acp-mach-common.c
>>> b/sound/soc/amd/acp/acp-mach-common.c
>>> index 67aa0ad83486..d314253207d5 100644
>>> --- a/sound/soc/amd/acp/acp-mach-common.c
>>> +++ b/sound/soc/amd/acp/acp-mach-common.c
>>> @@ -1561,7 +1561,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>>>          if (drv_data->dmic_cpu_id == DMIC) {
>>>            links[i].name = "acp-dmic-codec";
>>> -        links[i].stream_name = "DMIC capture";
>>>            links[i].id = DMIC_BE_ID;
>>>            links[i].codecs = dmic_codec;
>>>            links[i].num_codecs = ARRAY_SIZE(dmic_codec);
>>
> 

