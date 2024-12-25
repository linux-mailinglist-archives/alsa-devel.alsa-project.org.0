Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8989FC3FD
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2024 08:34:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D2FD60296;
	Wed, 25 Dec 2024 08:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D2FD60296
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735112081;
	bh=1HEoY1Ks4eMzgu0eoyJuspfZVMDhG1iRMLS4/z0n0as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hm1sBgKDu/cu8m1Gg60QN8XVfj2ZNrD3OtCyIa+3zzvoLt5jTA82C4jKtyPfIapn1
	 GQFtGqcSR5ftlQWZwoMRQYoQpIQ5+9EceiODKuNDSJ62D75O+5cTq7T/2dirKCba+a
	 Rx+SqVfipRmJi+O2AH0KPbbn0xzMQZFlnRkhkNbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17C7BF805BE; Wed, 25 Dec 2024 08:34:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96287F805BF;
	Wed, 25 Dec 2024 08:34:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E160F80269; Wed, 25 Dec 2024 08:33:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D13DEF800B0
	for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2024 08:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D13DEF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wThvIe3S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKEfQ2SbzfGLrIOvP/iHd/vFPO1ZtyD+Dd5kKoBvtEcUgJMrjdmEP8XBhRLljd+zCZuH5do/341/pUAlyUy/ncDlwhvDeMxa3ODIhmjoVaQ5JNe/13JWdfX6ArLv15rNXe4vpPkNR73czyj60Vg2eKMSB9NdXtanC1X4Rd4WVH0zbykso4SxzLZhm6xm6AixX6LtcDHja1uZnYIBpi+OmuKCSdyGWgck/YCyJwcZTQJpP3JEHSTcd1A9IOWnhHjuQVtmdhTZ3Fg+HH1NmRFxxXnkL636Oq3hv7SDPDRlhBFY/MGxgv+01N3iHImiivkQNTmMNzKrY8kq3ptDsGH7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H81gVgeUd97dYVDwEzjFkT8K8SBrfwqrIKq9qyU0ydQ=;
 b=AI9jsaS3T9sfRdOFu9uIw7BYPcLkuUQuIDCTQnf6OWnW88CA/co5xFPmuoAHG053dBqZxr8kfy0r7i/XInfa3NFmwYtNNIlc8lvRA+Np2efdAMTRhc+zRI+fX6zYs1K1NpFGc4VmSLFA0KlY6hF+BZ7p3fTexGpEQYW+kVfFup61duLa/+FwibGoAhzsihIUWSIvBKNmL8LvunjaHjEXtntMpdIZ5NZsDL7BaSrTrOgSezAE+g8yEDXIkK10j1ay9ERPU2jtqaxcaKgo2WFICWZwSxOBx4tY/ma6ZfPDdt4XCb64VWj17XRoHX0bN5jvBssXwqaLCsEpl01fr8Yh8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H81gVgeUd97dYVDwEzjFkT8K8SBrfwqrIKq9qyU0ydQ=;
 b=wThvIe3SAGBRexwYTkpCtA5DFM4QcHLA2S1ZrwEUfFPTMUV+JHzu/0K5Cc5Q2qLY8O/URJL5oKF8JBwKb7StDM5qo9gIEkHaWmflRtvRjNnqmq5LYZnyuOindPWhmOh3foHLC5SeQlPgbqcx+P+pLs7uCZdeNIrQRMDwh5d+1KA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH0PR12MB8127.namprd12.prod.outlook.com (2603:10b6:510:292::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Wed, 25 Dec
 2024 07:33:46 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 07:33:46 +0000
Message-ID: <1f1138e8-5ee0-43e8-b0af-6bfad6a3532d@amd.com>
Date: Wed, 25 Dec 2024 13:03:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] soundwire: amd: code improvements and new platform
Content-Language: en-US
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0209.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::20) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH0PR12MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 4067696d-87a6-4332-6dbc-08dd24b67769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dkxFVDU1bmt0dkNzR0IvOUtQR2xmUXRYUlZ4RlZZdVhvNnN0ejZoTXo2WFRG?=
 =?utf-8?B?ZEUrRVdwY2lyODVPYTl5N3RLeGZzTUxpTU5TTTU5WEFhYjhzeS9NUitJK2lj?=
 =?utf-8?B?K1hDbmNISTdUeTZRaDRJMHVhT2VpWVpWRWhUZXozZWdGVXR5SUd1bHI5ZEdV?=
 =?utf-8?B?dXVjd1htWXJIbkVuZkpoRHp4emlua2xwaHRoTFlBQ25tSU5Cam1id0p1aGp3?=
 =?utf-8?B?bXM1L1lJbXNPWHFHSG1SWDNmWFhaZzJJNlh1TjA3VEJpMjB5ajdidVNKZlBt?=
 =?utf-8?B?anpDaERvSjN1emZ3dVo5N0VLSU5sWEdlWE9jSGN0a1p4NWJxYkRZTEtiNGU5?=
 =?utf-8?B?ZFpXZittTXdtakt4bTFteEswT3VtYmhEYzczMTlBV24vZGJuVGZQUmYrRmtx?=
 =?utf-8?B?UHhTcTgvQkY0V1oyK2NVWlVoa3BFUXM1TnhtUERYYmJpM2dQYTRYWFdEaDlM?=
 =?utf-8?B?dDkvK2J4dmFGaDNxYnVoOE5TQ2h3ZEdseENMYmtlZ3V3WUtmTjU5RGVUVDdn?=
 =?utf-8?B?VGVLSUNWajJjQnRubWp5Q2dQeGVITG9VcEdBNUFSdUgwZVdEUDFrSThLY0hU?=
 =?utf-8?B?VGpadTJuMmF5aVFrYXYyL1NxVXdpTEhUTXkxY0NwaGMwTkRpRE13MUlNZzdK?=
 =?utf-8?B?eGR1eXBFNEh5Q0lRMkNPRm5ZTEh6bzNHOHkyTjE5UmhFVERpTTlvRDRPQnI2?=
 =?utf-8?B?SmRFYllHM0FLRHpyK3JITHFtcWlWWFMyS3hIR0YzZjdQbklkVXkycFlxWUJw?=
 =?utf-8?B?c25QQ3RiOVBwZExNcFVUcElUek42K1BoT3MwVU5lbHY2RFhrRGtVT29jcWpV?=
 =?utf-8?B?a3BCSWN6MisyS01lcHhnNEI2Y2FJSThEaENHUjl4SDhXTU93UUFRQmk4cUx3?=
 =?utf-8?B?Q1pCSkNaSjZmSnFzb09vNWdqa3NGb1kzeWZjRmIzeGJ4VHplVkliUFFtaU5H?=
 =?utf-8?B?cE8rcGpnVGs2NGx5MDNrNE01WUdPVzdvR1FwazN4bk9EOHRHK05JRTVzUksw?=
 =?utf-8?B?empGZEQ3WENFUnlpbHlvMldydlhpa1FVaWtVaG9qbWFIYktyUWd3V3ZvYXRK?=
 =?utf-8?B?WXMzanFMWVVNTDAzVHZWYVJIWC96N2FSY1MwcE1YbU1GM3Q0bUI4akRQSnpX?=
 =?utf-8?B?MWJYWG9EWU81b3dndnBlS1MvbnVOQnZ2MU1JN0xEQmNJTWlRRTVicDhpUndh?=
 =?utf-8?B?MDUvN1ZlZnhYbVBrSjdEZnhHc2hITEoycGNuRDd2N2NPWUFqSVpyU0RndTVN?=
 =?utf-8?B?dSswNHBmR01aRko3N2J4RlBFeEI3MUNYUnVxRytwY00xSlpJWU5jZFhXRTVp?=
 =?utf-8?B?L1dvY1hqbFVMTlZoMlpLRTJmU2hndEZmOXJlVmdoS1VTMTFWYStvbVNBVFpz?=
 =?utf-8?B?L1hBc2xjQzBLUVRhZGt1SkE2dTlRajhwUFc1RkJUQmtJWmlLeGVXTUo3dEhy?=
 =?utf-8?B?U1gwaEcyZXR6YVFUN0hJTmxZc0I5dTd2QzVGQmdjRm1ld3ZtMGM3SEJYdXY5?=
 =?utf-8?B?aWIwSytkU09YUXk2dFZicmd6VW04REhSWStVaENGMUV0MWRFYUp6TldBb29M?=
 =?utf-8?B?QlVXU0t6S3h4amp4Mi9abUR5bVRJNU94a1EwUVp4Ulk5T240RXYxTHNQTVhO?=
 =?utf-8?B?S3FVbVZzUjN3bmwvMlhxU0EzL2VMeWJ4SFdnYktKZEVEd0hPTnVtUFg5aEI2?=
 =?utf-8?B?ekwzUG9SZVFnSzlrU0c3dzd6QkE0UWZ4WDRobFlQVVNjOWlLaTMwcEV6Q1Jp?=
 =?utf-8?B?WDFwZDA0eHlaVjlldGd2clZzbjFqd0FQbzdyVy9sTDBTWDA5S3Y2NmVkUmkx?=
 =?utf-8?B?RmF5VXU0aGNSUThqV25QZ25KQ05wbGhDa0FwYWpMMHJtR3lORVRnVkx6Znp3?=
 =?utf-8?Q?wIM4NnKWsS6Ud?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Ti9UYXJSOVM3YTBza2V6aFNseExHNXVxaXIxTDhDRU1uY21MUFU5SStkNnB6?=
 =?utf-8?B?aGpWTHNWeEQxelp0U1R0d3J4eGFCOTd5UklTVFFOcWZ0eHVYTkU2UWpCclM2?=
 =?utf-8?B?aW4zeEhFR0xXMXJobkFRWDE5SGFUOGJSeHhSS3F2cCtsWC82SkRZS3JpUmlo?=
 =?utf-8?B?UE1oSlkxb0kxNFVCazkxY1U1NldyRjJoWHRxNG9WNC9aZDZ2K2cwbUVrMm9w?=
 =?utf-8?B?ZnloZUp0L0RxWWJKWVBmWGN2Z1BWRVlGTzJYTzAyQlFxVjFTRDB5bE41dGFP?=
 =?utf-8?B?ckQwOEtpYTByR3F1WUIxRm1YbE9EcnExUWRaSDR3ZDhsb1U4azhnY244ZUJT?=
 =?utf-8?B?a0xKRE8wQktHSGpnanNTL0pXcU05d3VxdDVzZmdMOGRLd3VBWFVlMlpqMTNr?=
 =?utf-8?B?WWRsdFVTSjRmK3NoRnE0akJnNUE3TzF2MEwzN1c4NTlwbi9kcXA1ZWNxdmxU?=
 =?utf-8?B?RWdJVEdDMHVwRjlKTlk1UFkzYlFsZlpHL0greWNkUytuS0lSSWFsZ0x5Z0hV?=
 =?utf-8?B?aEhhWGd6WWIxUXhabVVUSVQ1YlpqU3d4RHN6Ti9xYTVLZXQ2SkY0VlM4RWJF?=
 =?utf-8?B?MVlrendGLzRJQkdCamVleGJHTzR4V2g2d1BaSE5vTW03bzhFcGFHRW8vVnh4?=
 =?utf-8?B?RWJWNXZIVGppTEpxbGgzNW0vdnZ6S0l1OXBFdURsaVhmUVYwSDJoWUlPRGVX?=
 =?utf-8?B?aGxTR3lpa0x2ZTRhRGtJNHd3Y2JEZ21BQVFVSUtBOS9qOVF4UXphZGhKbFpS?=
 =?utf-8?B?dk12UjhVd2xzVkJTZnd1RGpNUlNVMVdRU1hXMjFnT0xSQWJCVThrSWE0MjdS?=
 =?utf-8?B?Q0l3aVdKMVZRSVUwa0h0YjNLejQrSmlIN3hiUXp3ditDNzY3eENqTFFxZm1r?=
 =?utf-8?B?c2ZybytLMVA0UDA2VFJrclJ3L29Rd3B4MUMxdzZDUjlGWUFJcm94Ykg1ZXpT?=
 =?utf-8?B?SE8yTTRzTzVtaFJmZWxwQm5WMkdVS2Z6R01wV3F1S2hrcEprenJVTyszbWp2?=
 =?utf-8?B?ZGNEakt4MUEwVWFoYW5ocGE3cDhhOWljMERMV3BsMGJkSGUyRVNYK3E5VG85?=
 =?utf-8?B?dmp4ZlhoTVFwQUxySjluUElrQzJVTzg4d3VmZGxqc0s5RzhJajcyc2taYlQr?=
 =?utf-8?B?eThOT1pRdnltSmFHd2VrUWZyWEwrZ2JpejRVUmtKQzV1Y01aUDJkMmNHY0tv?=
 =?utf-8?B?RDk1ZHc4aHVGRHJIZUNiS2lrL01LVkF4STd4SlV4VkVoNHBaKzhQUDRBWXdX?=
 =?utf-8?B?RTBGZWFIaElqL2N2U29UdmZ5OFRLRnYxSllJSm9QMzAvNk1weGhHTkF1ZExL?=
 =?utf-8?B?dmxyUTh5REhEQWFRWlZlcThJWGFOR3VqeWN6M3pNTktneUMzeXBBYnZLeWVa?=
 =?utf-8?B?TWdMejEwYk1BYVdxWlF3M2xFVTQvRHlwZlg4VEd0aHFUNHNkQTFRTHoyVUNN?=
 =?utf-8?B?VFRjK1AvRmpFUitERjBxUlZic2R1MjFNVHJsUHNBUEluZDRtQ2lzWGtMTjIv?=
 =?utf-8?B?ZE1yWEtRcXd5ZkNvZVBWMDArZVJhb3JHbXlGUEJMNWgwK1pHV3FEQTAwSndq?=
 =?utf-8?B?ZEJiOHYvKzBkcEJ3ZHpYNWExTVEwbldEd2ZRVmhudWU1MnpYMklaaGI4VExD?=
 =?utf-8?B?bkVwSlhjZjhnNmlwdEFKVlVuK3dxOWRUV2RVWnZDSnZIZy9qajZYOExxT290?=
 =?utf-8?B?aE5YSDM5cC9MNjNPUXBIOXZtRVFMZjZQYWNadzI0Q3pvcWZJRGZjNU1XU3Nl?=
 =?utf-8?B?RE8vU3hEOVE3SWJtaDZaQ1pyWS9vZldhWU0zTWtaeVZKdTcydHYzTFl6RmFk?=
 =?utf-8?B?NnRpZ2dsa0huRThyOWNsS3BWa015OGZoN29UVWZ6dkFwVXZuWEs4allsSXdS?=
 =?utf-8?B?N1J1aFF4Y0VPZ3R5Z0RvbCtLYm44OFQ3eVA5dVQ3b0I2amp1M2lGUDRlN0Nu?=
 =?utf-8?B?OWQxemZzL3dTRkFZMS9IUDUyYUM2RXZkZGtnNWpuNFBLZ0FPZVo4ZDg5SUlt?=
 =?utf-8?B?d2NxNzliOGg4a0xZVTgyYmI3SXI0YSsxbnBYY0tiYkt3NjYvcWxsQ3ZZQ0k5?=
 =?utf-8?B?dzlBVllFUGg4elRZMDV2VWtEc2JhbUg2S1Zkd1BBNCtHTklDKzd6VkpPTE0y?=
 =?utf-8?Q?u1xMglX6fMW0ZI6NvQxtHAoSB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4067696d-87a6-4332-6dbc-08dd24b67769
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:33:46.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 h8rJuvkB2wHp+VkBkK6t5qU0qvWMfF4ppbUHXcLTP+G/ZC3mIjeKHVqiEU+Z6z2smN/lQM7HmAXRQnrWEQ9jSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8127
Message-ID-Hash: ASVMXVMFBXHSQ5TW7MGTTDHVRAQERF5P
X-Message-ID-Hash: ASVMXVMFBXHSQ5TW7MGTTDHVRAQERF5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASVMXVMFBXHSQ5TW7MGTTDHVRAQERF5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/12/24 12:53, Vijendar Mukunda wrote:
> This patch series consists of code improvements and new platform support
> for ACP7.0 & ACP7.1 platforms.

Subject line was not posted correctly. 
It should be "soundwire: amd: code improvements and new platform support addition"
>
> Vijendar Mukunda (5):
>   soundwire: amd: change the soundwire wake enable/disable sequence
>   soundwire: amd: add debug log for soundwire wake event
>   soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
>   soundwire: amd: add soundwire host wake interrupt enable/disable
>     sequence
>   soundwire: amd: clear soundwire pme wake status
>
>  drivers/soundwire/amd_manager.c   | 102 ++++++++++++++++++++++++++++++
>  drivers/soundwire/amd_manager.h   |  27 ++++++++
>  include/linux/soundwire/sdw_amd.h |   2 +
>  3 files changed, 131 insertions(+)
>

