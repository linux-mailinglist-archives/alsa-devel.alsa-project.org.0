Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB8B9FAA36
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 07:14:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24BD2601CA;
	Mon, 23 Dec 2024 07:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24BD2601CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734934457;
	bh=HXAZGdPhZB5TEnZYzJ6fGsLxXy+YzxMwq1xQUhouSpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dMNCLYT46k06alD0YM51JVb/d0ZSqGPaf19XmiFmndRJtf7XejpkeSFyC0tMm3OLS
	 C3yOrafTov4nIoSy0AW7FK4viXh5LL/+B350CzdMUeZsnR2Qzw0NyEwaNQZukdnAVC
	 aunt3RzeZx0bxmf8mUzEaqON6hidDqccIA5RtGUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02168F805C3; Mon, 23 Dec 2024 07:13:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96940F805B3;
	Mon, 23 Dec 2024 07:13:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0AD1F80254; Mon, 23 Dec 2024 07:13:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F8A4F800B0
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 07:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F8A4F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sPIF/RWW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2WW+E2ln9DvrajQ1DhQhgFzoTllTqAKQXclsNVMFUgDtgnjz5ZjkofoRmK5ibnD1J2jGyWQeloq8lvQd9lR3HDJCugNKUOaCQ5hBW8aJnKr5glS/QT2McNeJli71R1kJWL//eVNHkD8g5oxJtISb0/HcanKX5QeKiqyQdNqUdp+yT/z0JbcaJCZOBTZkVgtfAMDmUqzzWFiynjQD4tDy/jFAQ6O/jrObv0omfkgh8UWPyUWBbxwW2xQke22HenD95LbGPJ9IAQU5U3/Lz1cA/PnWNVF5kWIogSGDACF12lxueK4NZOqK9Hu/qoBTfl0gRVw+idtKZNMlsyFW14rDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZILfuXKErxs1cnSdDP8oFJtANVKVjx8o2wvnspLZuuU=;
 b=gx4EALDOmvFcjdv6f7nc04UI4hZFU8EMMJ4r6KNwnctQ2bbP6eIZbQdkr6XffFpkDf4KsKyL7sGuF4WgBtpK0c85pvWPjEvcRyZpSQ4QlWvEtV2K89GuyQim2BeGsQLeuGxKKqHfqKgXe1UPHrKs7kTu0Urne2uRtenOGX9VoMfaGeQHtiCHlgSC/somnP/VlePpUgAHRNwBGjQzO0MeyqSseDxiHB2QNaMrNa2I+0SbV3ziIPDCEXq6KvGoRAF5XOtMJ3DRi4Hj4ul3Qh7l8d8vfl4hqSIapTuNu9Kcm2cdRHWU3JRS5OCsbtj2n2iKsqlAKqKqroIA6FrmHiwV1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZILfuXKErxs1cnSdDP8oFJtANVKVjx8o2wvnspLZuuU=;
 b=sPIF/RWWqer5NNqQjsAUBecRKelIfd1p/QtODudXBJVZAQ8tQHhX2RWIrIZpCariH5Ry52EGISsgtSRJ2KRcz7Qx9SqfoSVq4kqBIMhbe5kAugmD3uZW4s2JJh1K/Br4FJU1vmkWSirHoS/9ObXhWXrzJoDbsBeWJQbyt+TJRxA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Mon, 23 Dec
 2024 06:13:26 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 06:13:25 +0000
Message-ID: <c7565ec5-96dd-486e-929e-2d22d9e0282a@amd.com>
Date: Mon, 23 Dec 2024 11:43:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
To: Vinod Koul <vkoul@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>
 <Z2j+VQ4BPjr3HXsX@vaman>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <Z2j+VQ4BPjr3HXsX@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0246.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::16) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA3PR12MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 986986fa-6c7a-4d4d-cb67-08dd2318e92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WTlIOGRPZ3dVMC9KVG5xUnZLaFduNzFya2xYTUtUd2pvUGNKK3pMeW56OUN1?=
 =?utf-8?B?MXpsNG9EemJjWTIvQmdySnRYdTMrUStKSVE2RGJtL3QwTkViaGY1SjAwdHl0?=
 =?utf-8?B?SSsxbVMzUTBqZ3JEMFcxb3YwUkpJWEZ0Z2pxcjh0bFR0WGFBb1ozUjd0bUZS?=
 =?utf-8?B?TzR4cGlWVCs1ZWVIOURremJqUVdDVVVvOTBHZStQZjhhVEIvQWFSd3dLSnlm?=
 =?utf-8?B?STd5Z0hablVUekR1STk5SFdVS1U5UGNmNThhcm1mTW1yYTlNOFoyWVFRRVYv?=
 =?utf-8?B?RGxuaExldU9uZnQ5THkrVnQ2Y1grVWs1cmZJODdqbXhyS1loU0ZJTlM1QnFx?=
 =?utf-8?B?MDdMb1JycmZmU3RQSEJ5aldJSHpmUnNYaDlrNDNHYnMrM2FiY2JJY3RMRHUz?=
 =?utf-8?B?WStST1NHdE9ycVQ1YUI2VlA1bklydnRvayt2WDQrNDdKMmhqWDVnd3ppM2pN?=
 =?utf-8?B?SlErZ0JkaU10Rk9VNWJxOTFDR0dGbHNkVmc1L0t5VnlYVlppa2Q1aFlzVTMz?=
 =?utf-8?B?a2t0Nmh6M2g1b0lpclRUNDl1NFlVM2ozdHgySkJic2VIYXNZbVhnWnlpUjlZ?=
 =?utf-8?B?SnBJWTUrYnA3UEhhZFZDbUd5aGN2Q3pWUlhqN3R0OU4vUGQwQVUxc3AyajJH?=
 =?utf-8?B?SGhQUGorQ3FJVGZudFVFUzF2VVlBY1V5WnFTVGJCNE8za29kQjhTV1BuOWYr?=
 =?utf-8?B?TEovOC85d2p6QmRLV0tvNW12dzNnQktIbjJuek84UmRqMFZpN2RRUlFRWkVM?=
 =?utf-8?B?b2E3dnNBamlxOUJ4NTF3Tlp5VGJYSW0zRVVDcGRtWXhudlBwTGF6bndHNHRt?=
 =?utf-8?B?UXNoVVk0U2xSdGplVFM1RlV3MzRHSXYydkZzTGpRQitKVnBPVjBXVllmQzBy?=
 =?utf-8?B?b1JaS1M3dEhDU2xDWEFrMG9wNjdoZWxBY0M3Wm9IT1hhbjJaYkdFZjFaV2Jk?=
 =?utf-8?B?ZHN4dmRML2VFanErb250R2RBSUtJelkxR3BvSk40QmllbzhqcEVwd25PUDNj?=
 =?utf-8?B?WXk0NmMrbjNTb25jcnFiVFE0ZllqcXA1bDBGZi90MkZKU0lxM0dEU0VpWWlu?=
 =?utf-8?B?TTZGUnNaRXJ6ekZCNXQ0dDFUSDZzdlBmdWFqMG5tbzdDQmMvcnVUWko0UUVP?=
 =?utf-8?B?TnVrVHZKdUE1L1NXeUFZOWJLYVViZnptRmN5VHhnaFBQSEptb1ZoOHk1THJ2?=
 =?utf-8?B?RjFKSFFSdDJtVTQ4dmJxZDJ1MWlWVk9YUHo1R0tRYVd6N2IrazhsV2I2cWZC?=
 =?utf-8?B?K200cjJNdUpOTEMrLytsUU5jb0E2cE9zRDJFa2k4bk84a0p5VmFRVXZoWThp?=
 =?utf-8?B?dnEvYUpwb3ZmQ0hTNGRqSGQwSXdsRHFqZjBwM3FMekNGRUg0d3RHWkkyREZu?=
 =?utf-8?B?bEpsaktPaS9nZFVzQ3BjMXNORU51Zk1CV1BHYkN0UWlWbWN3ekpjVXQwZFRU?=
 =?utf-8?B?N0xnalRsVUlLR1phbVY0MW4wU1FpclZUOHo4Q1ljNUhKZnRVZU55VGRYWTdG?=
 =?utf-8?B?VzRIUEZRUmhnaG9GOUsvemtJVnJ3QUFNb2dNMmpiMFg0K3NIRVY4cUFWTEZj?=
 =?utf-8?B?WVIxQW5odWJGOGZTMlNpNy81L243OFMyR0ErTzI1S3djVVRORUZRNnNaZ1BF?=
 =?utf-8?B?RmJ6c1BCUGI0cTlCRmhtd3p3bE5KRkRZTCs5dmdmVGhZaDM2YVRwamdNdDJY?=
 =?utf-8?B?NlJjNWhpUlBrS0VnQVRTTlJWaE1nSGZsV0k3Z3FZbDZiQnd2dXN2Yi93QXZC?=
 =?utf-8?B?MHVzM1psV0laUUNFWU5lT0RoYnArOTlwaFllY3JGcjhkSDBDcm5lWDZvLytC?=
 =?utf-8?B?cEtNdTVzQVMwZ3IrbXpqMG54c1RXWm5VNEJtNUhlVnRzRVo0TTRpd2ZQWlVJ?=
 =?utf-8?Q?bDruR4SVuBJ3+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WEpnYjZUc2FYeVd1WEtIaEtKRkFzQ3RVc1JkLzNXSDBmWmxiLzl4Wi9qeU1R?=
 =?utf-8?B?VmpjWEFqU1RxTkZpSGUzUUZXZ0Z4d1lXM2dmbkMyNWZ1WmM0MW9YVnVpMEpF?=
 =?utf-8?B?VmhqbjZmZWFONmhuY2tDUndpSThEWTZFaTkzd1FGRXFiT3I3WFdFelIzdXBT?=
 =?utf-8?B?OG5QVVNEQldkS3JNdzg3OTFHT2hNM0lyMzdFV2NjMlU0bWRlYXdyTW82dk1s?=
 =?utf-8?B?dUFlT3ZPSkt3VmIyd3BzSlhtalZNLzRzbXJ6bkhVWk9lNGRuOVBkdER1dFpn?=
 =?utf-8?B?TExvc3A0UGMvUlRYRmtFZ043QmZlVHQrdktqd2V2NHVWdUVpNUx2b0VpYXIy?=
 =?utf-8?B?bEE4T3Y5d25FUjBJYW4yY2s0NXVlYVFVSmVCSUdsYkVUNXBIdmZEUUlrMDJq?=
 =?utf-8?B?TFVUWUUvZFRrS0NOQmFlQUVMaXI5WllUL25jK2FweGs4cHlac09zc0Fkb2xN?=
 =?utf-8?B?MWV1WXkySWZSS1lZcW1CNmFjREF6RWV2YnM3Y2Iwd0xyYTNPanJzWDhGcTc0?=
 =?utf-8?B?OUM0ZHFRcERPL2FRUEhmNGNLYnF2dTEvLzBYWjBsb0JON0FJU0gwZXhLZXdj?=
 =?utf-8?B?TnF0RGNHU0R2ck9GaWVYK0R5NVFXQmZ1Nnl2M2tJZm42VXVVU2RFNWVVS3Av?=
 =?utf-8?B?TW43VlFEcjBNVVMwdVRrY2YyQjBnRGF3dncwRzdoVVF0RDFJT0xNaWh2ZHov?=
 =?utf-8?B?TnRSQVUzaDIyZHhWaFNhL3FhNGVieTFTckx0ZmI1alZsMm1lWTMvNm8rc0hp?=
 =?utf-8?B?ZGx4aGdITWwra1ZUM0U5cW1sOERlNFZkWitsVmsxVmhaWFl0dWRka2VBTHJa?=
 =?utf-8?B?V2UxOTN1bjVKRy9WZThxZ3JzNzNyYmpxRXcvVHBnVDc4aVROaHQzbUtiaWxw?=
 =?utf-8?B?K1grTnFFRnQ0YnR5RmxyamsvUW9iVDRRNFpUMnNLVGNWU1RrQXpJSkRxUmE1?=
 =?utf-8?B?bW05eERXOUl3YjhYbEprL1B1QjloN2haRHdGQ0JSdDVXUUk1UHJ4T1hmbVp6?=
 =?utf-8?B?TFFmWWxFcERIbjVrOXZSeDJRTVpDWWpUc2paMWNRdW03WHNyU29LclNEVzJa?=
 =?utf-8?B?ZzlPMGZydFNsRlE5ZTFlSGJCcFZNclN4a2xQNXhyamU5WDdZUkg1bkRGVlZa?=
 =?utf-8?B?bHFKZmFsY1pZRk1GUUYvdUIwQ2dMd2lOZXhNb1lNWk5pTVYzeElCTVRkbVQ2?=
 =?utf-8?B?a3ZsYzIzQW94WFNjTStrREdoeDhSenlyeXFub2JLUk1iNTNuNXZaeHZueHUv?=
 =?utf-8?B?V3ZTcUZNSGU4TEFGdGlJZVRLOWhwRERkYllZQSs1TjJBaE1OT3pLN0JiTjJJ?=
 =?utf-8?B?dXlSQm5vanRGODhuYlhWZ0pjZHFuOFQ0cCtMSHl4RjlOU0FrZ1BBTjN3Mmxi?=
 =?utf-8?B?SmhkRkpqTXJmeiswL3A3MWpiWUhHYnhjcWFFYW5LMDlnM096eXppRlk5RGx0?=
 =?utf-8?B?NHdGUWVSYjlnemYydEVTbW1XQmllNXhkZm1zdWJrZVBocWxZaWc4em5sbU11?=
 =?utf-8?B?Z0N3by9FMXdXRXBudDYySlNlZHdnZU54V0VLWTdJQktRcjJPVHlSVVBRV2Vz?=
 =?utf-8?B?bEFmeVZYV3RIRnVkSFYxY2FVMXFSM1RYd3cyRDFqajUrbHZzYk9aRkRpRHZ0?=
 =?utf-8?B?WGJubUFBaHpyUGt0d3VOMzUycWpKZFY5QVBkR0c5Y0ZSUEZaSFhvbUpJSmZq?=
 =?utf-8?B?dG9rN0l5MXRyZGlwNXY0NkFDQzNVM1lHQ0c3ejlyN1c5Vk52UXdDWVBobnBV?=
 =?utf-8?B?SDRqNVpmODFKb2N0NnZqWHZJM09MRnFwNDBsdUJDaUhKa3paZUVmUWVqNFFv?=
 =?utf-8?B?cDlzamZaOElVZjFOWTl5QWZiczFuSG92dUp6OFBCbm9iMVcvWW1xVWJoWDJt?=
 =?utf-8?B?QlU1REMybmtTT1I1UmdrS21oL2FJWW8yc0h4Q2w0TnhtaWEvbmR3TnVsV0Yw?=
 =?utf-8?B?K0JGdVJmUG9vTEhoUm5walBDQ2xWdk1rQ0pmOGk4d2oxQ2kxQWFzSXpLc29Q?=
 =?utf-8?B?UDJLRzhxRTZKaHNEdmRiOUgxZGVxa3k5cXhIMzhDOWpadHNSb3VmQ01CNytD?=
 =?utf-8?B?UGExd0ZRbGxlNlRTWVdRQ1RjRmpneTc5SElnYmlLM2JVWmFDL2VpYjh2ajJr?=
 =?utf-8?Q?5Q4FLgcfdBvaNwXDlu4RFA+rC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 986986fa-6c7a-4d4d-cb67-08dd2318e92c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:13:25.8578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZY7Kw3i5nxb7qdiwjd+19vXHxKoik5NHEbktYWE3b8WZXlbLEP32ONIopOfcrw6nrODEIil48UwCGV8v6CPj9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809
Message-ID-Hash: G5VDUUOOI2RJSLK375FNBI2IY2PZZ4JP
X-Message-ID-Hash: G5VDUUOOI2RJSLK375FNBI2IY2PZZ4JP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5VDUUOOI2RJSLK375FNBI2IY2PZZ4JP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/12/24 11:38, Vinod Koul wrote:
> On 03-12-24, 14:40, Vijendar Mukunda wrote:
>
> for...? Pls write the full subject
Patch commit title was not updated properly.
I have already respin the patch by updating the subject.
Sent a mail to ignore this patch as commit message is incomplete.
>
>> As per design for power off mode, clear the wake enable register during
>> resume sequence.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  drivers/soundwire/amd_manager.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 5a4bfaef65fb..96a3aa6da711 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>>  		return amd_sdw_clock_stop_exit(amd_manager);
>>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>> +		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
> no need for 0x for a zero value
Will fix it and post v2 version.
>
>>  		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>>  		if (val) {
>>  			val |= AMD_SDW_CLK_RESUME_REQ;
>> -- 
>> 2.34.1

