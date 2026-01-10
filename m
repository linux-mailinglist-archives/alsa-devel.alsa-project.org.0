Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3B0D0DEA1
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jan 2026 23:49:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16FD601F9;
	Sat, 10 Jan 2026 23:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16FD601F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768085367;
	bh=wu5Q18ZaMpEPYIcyYoPGUsXrqtpfA0g3c001T0ujNw0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AucgteBPLck2awnOTr20g905VWoIWsJUvowZY6oDJmp56pgkBK6SvtcO+17r0M+gK
	 166fBLcH6Jl+7d8cnwBFBcI5fBW+5YYKpdsx9bal75mNimUcpdhTehlh+clA+MoXrf
	 aA7S5QdYW8vgEMT+YNpFmXA2TeOf5f01E96EIT50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E36F805E1; Sat, 10 Jan 2026 23:48:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AC80F805E3;
	Sat, 10 Jan 2026 23:48:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA32FF80496; Sat, 10 Jan 2026 23:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012050.outbound.protection.outlook.com
 [40.107.200.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F969F80162
	for <alsa-devel@alsa-project.org>; Sat, 10 Jan 2026 23:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F969F80162
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fZvHGUVD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rUb9RbGKwrAh7zdB022Uol3a0HUHHSQZwWL/j6xnqHX+rGV63WHjqcm2fV1jlebGlPttt4ij9BRgPf+LfqA8DXlkcU7dxMDsMOv6wUO60c5QKpyF78SPXcRikIEv3ktbKolaZOmvLVfkyEgjMYZZ4DWXodH5TlLPGTpYEtRFxW9Cux267w/OmGtq4ZAA9FmyMs0GLzzGIFHe7Yd8yo0MRPxPf6lgnzDblgZyNMIgQiCKDcAQy7jUnvnw50GO7BEpYgFiQHCXQ0AZiO+buBLst9b0BlxWX5qmfk2l2XbHy0zDJsaqj0I23w63O4iTwZByW2Yo9ukZgN7t0WMA+EKcCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wh6G78gWz6vexqz5Inb74Ieutlzu8njmNN6kMbxdiI=;
 b=U9uOPZ+3F9pykRqpeeZM/NBf7S4OZ7xShkjcV4R+RCcrXRloVBqAQCaW/qPjYp2b9WhRh4PJgR+K74/BNDQi5i+oO2eWBXpSsILnYImmMaZgKP+X/LeYKAdLLeumu1zK3T6bGnqMDn6vJNQ/XXyE0+8NRST/cnwsQh9syxc4FIEAAwanVlA+/dtYu2c1ol8VfwS2cxzY9wElgpwmu6rYg/uxMkDI5M3s70V8QAsQUB8fqLDI5ejeVxmqOmfyTdXAsBXyoZxldU3g+yM2s2DGYJBryTflmQr/2Dmvszd4FzXFnDCVLei/CM5M8Oh83Of+JoZGZhsobrHgvENhPF/+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wh6G78gWz6vexqz5Inb74Ieutlzu8njmNN6kMbxdiI=;
 b=fZvHGUVDnTTP8IzCG8HnnngKQtcPFQpj9NArDD8dBHnYBy/L4eqt7pXqVUKmQ4ghA2H5XEP0/EadU/cDwFjgb0JMqWL/IaCaJ0l6R/pZ900g7v6acN24NF2Uo1ojwWbMZe/9YV+vC0u8xrucPDoR4iS1IU+NbH8CUkfaGVprbNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.6; Sat, 10 Jan
 2026 22:47:48 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::94eb:4bdb:4466:27ce%4]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 22:47:48 +0000
Message-ID: <3baa51df-5891-4fa9-be0e-4695944bb38c@amd.com>
Date: Sat, 10 Jan 2026 16:47:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 simont@opensource.cirrus.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P220CA0042.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:223::35) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6cef2e-f39c-4de4-7dec-08de509a4715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MmFjd1QvV2t1QjRLVHYrTmhLMlRQTWpkcDEzK0p4VmZmSjhydUlqZHAxS2VF?=
 =?utf-8?B?OWpvY05EMGVLaC93N0pvOTQ4aDJSY1poUkhOQ1NzdGJOc016V291OXBUOXIx?=
 =?utf-8?B?b29PcWFqbXZnai9vTXgrS3o5a1Vsb0pTRS8zUnlKdDB4T2pkYjhLbGFuUHlK?=
 =?utf-8?B?MGtKeXpqTWphazhMSnlaVGxxd0U2ZGx5Y1p0MnM1OUFicEEvakhYbFNFTVlr?=
 =?utf-8?B?QkkzUEtNTmVFWlJuUkU5SHN1dWs3ZVByV05yUGMxaEJhckNzaDJObDVKZ3Nx?=
 =?utf-8?B?Yzl6Sk9HWEJsWHdxVEErUU5rbGdCTm1kVEhMMGVuSDZzWndsQ0NORE1LSVVQ?=
 =?utf-8?B?bk4zUVlkTkQ1M0FqTVlxQTlIaE8xc1ROdFVTbFV5Y3hhajhYemxtOUFhTW5S?=
 =?utf-8?B?R1RoS3ZFWm9GTkh6U3o3aWxxTW9ON0trZy9Wa3I4eGJLMlo0a1dwUHN4eXM4?=
 =?utf-8?B?MTg3Wi8vQTR1TEoxaHdYT3hXdVFYMUZ6MFB4VjFWMFh0QWVCUENvektqalRm?=
 =?utf-8?B?TFhnK0cwUGZzRDdCNms1bG5BOVhzcWpYS1lDdVk4cU1aYTRPWkxIRTN3OUlY?=
 =?utf-8?B?Zy9FdGJaZ1IrYnB6dTFoRVFtanI4cWN2MHMrS2N6aTBSYUxETHpSR0hiOEtM?=
 =?utf-8?B?QnJJUFFYVmRybDdVTVpMMEJRMUJtcUNQWFZMNmhiRVZSdEpXRDFZVThJL0Fp?=
 =?utf-8?B?NTdSTmY2d25oTjZJeVhXOW5kMWxlbFdxTjI0TkpuVzcrQ1VhbVRqQ1FZZXhS?=
 =?utf-8?B?RWZ5NS9TaWpta0EyNDkzMWk5TTVsSm5BaUc2N3JPSXMrdDdaNnpGM2o3cWpS?=
 =?utf-8?B?Y05lczN6aWhycS9kSmZGaFhLWnpDMVRieS9vaDVRK3p0UnBsR1kxSDF5Z0x2?=
 =?utf-8?B?NkF1YWpiU1JLcFIxVWNCWGladXFDdHE2bDU0VTZsN2NGTldtQzVkM1lEUWlo?=
 =?utf-8?B?eFhleEFHK3hrYVQxSnBuNUxCcXFndVVuTlpwQkNXdm4waURtMkJvM0xGYWRu?=
 =?utf-8?B?WG45N3V2dXFnaWhjQ1l5K2F3aDQ3TklyanRLNGhDSXNubGwxRitRM2hQMkM3?=
 =?utf-8?B?MHNhNkVhL1IrRWgwdGFsNHNQNytHeHBONzhNeFNNRVhBVUEwWit1eGJXWVc5?=
 =?utf-8?B?VFN4eWpzN1VYaWFLZXJkQ0ZUUWw1NERKaDdqWTRGMUlHT2ErcHFDdWlFWTRw?=
 =?utf-8?B?dFhOYkNmcDBLci9TdnVmVy9UR21VbFZKMm5QaGl3SXhvTUpTWkhnR1ZDVXVL?=
 =?utf-8?B?WURjREQrV2cvbncrUUlWSW9YYmlXaFpNelpBUlZaeVNVM0VDMWVBMU5OTXUr?=
 =?utf-8?B?aWxrenlRWjl1MFNCYm1OMmF0elJNL3l4Z0FqYzFVNWJ6ZVFQdlZBdDJwSVhm?=
 =?utf-8?B?dWNkc0FPV0Rtb2t3bnVqVmxkL3M3aVdFc3pMa3g5SStOQ3RlREZyT1JNV0cx?=
 =?utf-8?B?V3BzTTRHUE5Ic09Rd1BDU0dtZ3o5dUgwRUhxZHBERDJtNXZKWXJ4TWRjczhj?=
 =?utf-8?B?eUtUY3pYUlZBendjTXZnZWJPWG4vSUxHVlROZWI2UEJXYXR3VnBKcVFXZ0Yr?=
 =?utf-8?B?aU5wY0JqcHdYZSs1cGhTL3dYSHVuamNwbnM5b3hDY1hzaTk1cDc3dGdENlE3?=
 =?utf-8?B?QzVORWI5cURjMjhOWEp6VXRROHd2R3BLVE1UVnRIUEdwNTRNcVFtVzVJRC8z?=
 =?utf-8?B?K2MyRXdiMk5BYXNKZ3BHMTRkUm9OOGU2cFlGWlpHRE9IeXdCNENLQmUyK1dY?=
 =?utf-8?B?dUJwMDNwWXNLaW5wc1pmM05NR1l5TlI3WW8xS25qa2trSkltMGtVVXlyQ3Nl?=
 =?utf-8?B?cDZKS0MvRmdlTTZEQXVYZWpFOWFBTUEvaHlLZUhMdWFHN01SWnRwZDlaMHpo?=
 =?utf-8?B?OStQekUxL3haOG9SemZkOGRuWFVteW42S3UzZXJjWE1XOC8wVG5Wcmh2SXNM?=
 =?utf-8?Q?sQmC7Y0vKd7DeIZS4AoOy28oRE5VAiqG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGY2VGZuS2VsczJlZnRva3JNNzd2dnh2REpPbmJ3Y3pjM2dvc2R4VDJPTW13?=
 =?utf-8?B?bkIrYUNEdTBFbHJCdFhLL2dHUXN4YlVpQ2RzYlBiNllmREE0TlplYXpZdkVM?=
 =?utf-8?B?ZGNpb09SSkp4cVJPamxNd1Y2NHcwczZSZzZ5SjRGd1MrdWliKzJhVnk4YVFh?=
 =?utf-8?B?RmNLajgrdDdsREpyM3B1MDExLzJaMFhucjhWVGFiVDBFZmUxdEpuRUdlZk9v?=
 =?utf-8?B?SGlPV3J0L1BUdjdtMUViZk11blk2Qyt5L0h3NVlmc1lBUVZUblJIZEF1WlhP?=
 =?utf-8?B?SFFndEZhUlM4Um90amV4TGZaT01VS09aRTFyT3VhekRIaDJ1TE5LRnMzVlZL?=
 =?utf-8?B?ZzNKU1BMT0x2R2J2dTZtckZLU2RxbkMrbHZoVFoyVE5UNnZpTUFwYk9mTGVp?=
 =?utf-8?B?eGVIb2JkdGVvZXRpcGNJOE9GUjdTVE5vaVFvV1VzbjM2LzBieTV2N1NaVWtw?=
 =?utf-8?B?NGdhY0ZTVTN0WGNYdGpCc0tRTkJkSjFBZlllWE5sVlBKM2FWclJhTlIxa1Rz?=
 =?utf-8?B?M1hWNXB1ejFUbFVVMU43cjJVRVlFS1JnU0k2K0FZNERicEY2ZmIwdUFFTlJh?=
 =?utf-8?B?YVdRWFVYNm1mNTQ1YldzT0l2V29qUSsvNkszcE5EbWRFMXV5V2N4Y1BIYUdx?=
 =?utf-8?B?SnUzdFRQeXhrNG5Kanc5MVQrdkdtQXg3QzNrMXZHaXdQR1pKMHhPWXROUWxZ?=
 =?utf-8?B?dVBWbGlORVI4bkxzZFVGVGhteTRWQmI4c3RIY2Q4a21QN05pVWlpWVJHcUhT?=
 =?utf-8?B?T2d2UmlhNGhvaFowYWZLSmo4WDR3QnRodVc1Q2pTZUZXdmNiamVXMW9SSFUr?=
 =?utf-8?B?Q1JhTW1kRFZoaUh4VlEyRXZjSkJBMGdqckp3ZGZBSk85NzUrTG53VGhIWXhu?=
 =?utf-8?B?cFIwVTlzdnhvUmFSYVRGZyttcXl5MzVvUjltaUx0REtSNCtQclYyVFpoTFBj?=
 =?utf-8?B?L2VRRld6QWw3U1Z4NXNPMnpvbVNZRVFYaThQL2J0Z0tvdUwxMXF0VU04MERE?=
 =?utf-8?B?enVETldzRDd1eEwvMUFZOWpTd0Noc00vVjFlMTBYVXViWEl0S1ByU3JOODZn?=
 =?utf-8?B?WGg3MFdLc1k5YVlUekk2K21aeUhVU3graGxTemhLRWowTVBaYVFrUUgyZGlG?=
 =?utf-8?B?YnBBUVRKRDI2RW10cHk5dWpqdTE2OTg2c2svTlUzc3BhVWpRN2RLYU40eU8z?=
 =?utf-8?B?K2t3ZFUrK0NDR2grVkhaaE12bFErZDAyN0dGRENOemV6a0lZMnhKRDlRcllH?=
 =?utf-8?B?M0pCTUdhVkQzYmF6OXhiS1hDSmxKQTVMSUFFdEN3bzdDL3FtaFJXUlhMcEts?=
 =?utf-8?B?ZzJXdUcyblpxWDhHNXRHYkNFZFArcG1TVjFkNjN1UXBGVTczQ3g0SFZJMm13?=
 =?utf-8?B?OFZOUXhCMTdBc3RNOURHRGRWdzRYTHlyY3lrbFg1NHBTUU1VUUdlK1B5S1ZD?=
 =?utf-8?B?ZkMxMllFdzNHcDZSSFJQZ05qMjhZYkN1SllSb0p6RXExYTNnKys3dVZBZzZj?=
 =?utf-8?B?cVV3em9hRnNDYWtadlhadis2aXZBRmord2J2aEJMMEV0NjlWWFJFa1kzbjZI?=
 =?utf-8?B?cTREU1Q0T0J3RkFvOFE3OE41Y3ovWTkwb3JnL0x3Qnd1aEVRNERBNVN6b3RC?=
 =?utf-8?B?a0crZXpxRFRoNE4rdi9tMEZEZVBmQW40c3J6OVZNdEw3QWNrYUdWaFdpbkJK?=
 =?utf-8?B?dytTL2kyNG5kUTBpUVdZRU9wOVZPWTJSd3BPa0JLeHdwdUhpaCtubldzdWph?=
 =?utf-8?B?N0JpSGlOb0R0cS9lTUZpSnFUdXVwTnN4Ykc0akh3cnVOZXdaZjlCZEFWYnVi?=
 =?utf-8?B?bS9Fcm4rMWw5UDZSYTZITkJWZXNkN05GY2Uwd0NqN3BDbnFJZE96cG5zVW9N?=
 =?utf-8?B?TEVwdFh0Ky9oV0RoaXdRWFlJSHpsQkIvK25sS1dSTWEwL2pnNFIrTlpQYndj?=
 =?utf-8?B?UEdraUs4SnVyb2UxR3FXaVFDNG5zaW1idlc2SXB3S3A4Z0NOQmNXajdLSGJD?=
 =?utf-8?B?bFNqMDdwQnBWam56K040aUFyMDViTis5VnM3WGVORkM1cDFiZm9nM1ZtOVlT?=
 =?utf-8?B?dmVLVUE4VXJUMDhZeG82Nm1LV1RkL04zcTlINDgrK3lDTjJPejJ4LzlSSVpv?=
 =?utf-8?B?TTR1bEZjVkZiNkxXSmlseXR0MUw2c1RKaHM3VmFCVVY5KzkwcllzWHFXVHR3?=
 =?utf-8?B?LzJKS1ZiMlFOMlpHN2NmUVloV2RlL2dxTmpwVGxHRXFjbW9Xb25BbUcxdXB0?=
 =?utf-8?B?ejV5ZGs2R0FDSTdUMWRwZVJ2U0hMcGd1K0FMM3YwWFRacFlFWjNvUmE3azI1?=
 =?utf-8?B?NmZnM1YrL0c5MkpBYU1tTmpVT0FmdEt3alUrcHdhNnBaUC9oWXdDQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6f6cef2e-f39c-4de4-7dec-08de509a4715
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 22:47:48.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gkA2+zKw8sEe8Sfi+EYq6iBkciZFj3di6maKiGO41yLC8ZH/uRcJSwMcQFej8O1FH6M1hw3ObWUGSgXE6xGXCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374
Message-ID-Hash: DVBAD7JF24CKEKWQTTDWH2OOBFSATL5X
X-Message-ID-Hash: DVBAD7JF24CKEKWQTTDWH2OOBFSATL5X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVBAD7JF24CKEKWQTTDWH2OOBFSATL5X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 1/10/2026 12:44 AM, Vijendar Mukunda wrote:
> Add a filter to skip the RT172 VB configuration if a SmartMic Function
> is not found in the SDCA descriptors.
> 
> If the ACPI information is incorrect this can only be quirked further
> with DMI information.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/acp/Kconfig                    |  6 +++
>   sound/soc/amd/acp/Makefile                   |  2 +
>   sound/soc/amd/acp/amd-acp70-acpi-match.c     | 50 ++++++++++++++++++++
>   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c | 42 ++++++++++++++++
>   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h | 14 ++++++
>   5 files changed, 114 insertions(+)
>   create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>   create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
> 
> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
> index c2a60bc80ee6..ed2fa055f7f6 100644
> --- a/sound/soc/amd/acp/Kconfig
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -15,8 +15,14 @@ config SND_SOC_AMD_ACP_COMMON
>   
>   config SND_SOC_ACPI_AMD_MATCH
>   	tristate
> +	select SND_SOC_ACPI_AMD_SDCA_QUIRKS
>   	select SND_SOC_ACPI if ACPI
>   
> +config SND_SOC_ACPI_AMD_SDCA_QUIRKS
> +	tristate
> +	depends on ACPI
> +	depends on SND_SOC_SDCA

Does this need a description?

> +
>   if SND_SOC_AMD_ACP_COMMON
>   
>   config SND_SOC_AMD_ACP_PDM
> diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
> index 08220b9a3802..81d23aded348 100644
> --- a/sound/soc/amd/acp/Makefile
> +++ b/sound/soc/amd/acp/Makefile
> @@ -27,6 +27,7 @@ snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o amd-acp70-acpi-match.o
>   snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
>   snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
>   snd-acp-sdw-legacy-mach-y += acp-sdw-legacy-mach.o
> +snd-soc-acpi-amd-sdca-quirks-y += soc-acpi-amd-sdca-quirks.o
>   
>   obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
>   obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
> @@ -40,6 +41,7 @@ obj-$(CONFIG_SND_AMD_ASOC_REMBRANDT) += snd-acp-rembrandt.o
>   obj-$(CONFIG_SND_AMD_ASOC_ACP63) += snd-acp63.o
>   obj-$(CONFIG_SND_AMD_ASOC_ACP70) += snd-acp70.o
>   
> +obj-$(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS) += snd-soc-acpi-amd-sdca-quirks.o
>   obj-$(CONFIG_SND_AMD_SOUNDWIRE_ACPI) += snd-amd-sdw-acpi.o
>   obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
>   obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
> diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp/amd-acp70-acpi-match.c
> index 871b4f054a84..fa39f18578ca 100644
> --- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
> +++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include <sound/soc-acpi.h>
> +#include "soc-acpi-amd-sdca-quirks.h"
>   #include "../mach-config.h"
>   
>   static const struct snd_soc_acpi_endpoint single_endpoint = {
> @@ -44,6 +45,39 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
>   	.group_id = 1
>   };
>   
> +static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
> +	/* Jack Endpoint */
> +	{
> +		.num = 0,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +	/* Amp Endpoint, work as spk_l_endpoint */
> +	{
> +		.num = 1,
> +		.aggregated = 1,
> +		.group_position = 0,
> +		.group_id = 1,
> +	},
> +	/* DMIC Endpoint */
> +	{
> +		.num = 2,
> +		.aggregated = 0,
> +		.group_position = 0,
> +		.group_id = 0,
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device rt712_vb_1_group1_adr[] = {
> +	{
> +		.adr = 0x000130025D071201ull,
> +		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
> +		.endpoints = jack_amp_g1_dmic_endpoints,
> +		.name_prefix = "rt712"
> +	}
> +};
> +
>   static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
>   	{
>   		.adr = 0x000030025D071101ull,
> @@ -254,6 +288,15 @@ static const struct snd_soc_acpi_link_adr acp70_cs35l56x4_l1[] = {
>   	{}
>   };
>   
> +static const struct snd_soc_acpi_link_adr acp70_alc712_vb_l1[] = {
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(rt712_vb_1_group1_adr),
> +		.adr_d = rt712_vb_1_group1_adr,
> +	},
> +	{}
> +};
> +
>   static const struct snd_soc_acpi_link_adr acp70_rt722_only[] = {
>   	{
>   		.mask = BIT(0),
> @@ -308,6 +351,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[] = {
>   		.links = acp70_cs35l56x4_l1,
>   		.drv_name = "amd_sdw",
>   	},
> +	{
> +		.link_mask = BIT(1),
> +		.links = acp70_alc712_vb_l1,
> +		.machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
> +		.drv_name = "amd_sdw",
> +	},
>   	{},
>   };
>   EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
> @@ -327,3 +376,4 @@ EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_sdw_machines);
>   MODULE_DESCRIPTION("AMD ACP7.0 & ACP7.1 tables and support for ACPI enumeration");
>   MODULE_LICENSE("GPL");
>   MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
> +MODULE_IMPORT_NS("SND_SOC_ACPI_AMD_SDCA_QUIRKS");
> diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
> new file mode 100644
> index 000000000000..63bf9e3c0ae1
> --- /dev/null
> +++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * soc-acpi-amd-sdca-quirks.c - tables and support for SDCA quirks
> + *
> + * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.

2026 now

> + *
> + */
> +
> +#include <linux/soundwire/sdw_amd.h>
> +#include <sound/sdca.h>
> +#include <sound/soc-acpi.h>
> +#include "soc-acpi-amd-sdca-quirks.h"
> +
> +/*
> + * Pretend machine quirk. The argument type is not the traditional
> + * 'struct snd_soc_acpi_mach' pointer but instead the sdw_amd_ctx
> + * which contains the peripheral information required for the
> + * SoundWire/SDCA filter on the SMART_MIC setup and interface
> + * revision. When the return value is false, the entry in the
> + * 'snd_soc_acpi_mach' table needs to be skipped.
> + */
> +bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg)
> +{
> +	struct sdw_amd_ctx *ctx = arg;
> +	int i;
> +
> +	if (!ctx)
> +		return false;
> +
> +	for (i = 0; i < ctx->peripherals->num_peripherals; i++) {
> +		if (sdca_device_quirk_match(ctx->peripherals->array[i],
> +					    SDCA_QUIRKS_RT712_VB))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL_NS(snd_soc_acpi_amd_sdca_is_device_rt712_vb, "SND_SOC_ACPI_AMD_SDCA_QUIRKS");
> +
> +MODULE_DESCRIPTION("ASoC ACPI AMD SDCA quirks");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("SND_SOC_SDCA");
> diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
> new file mode 100644
> index 000000000000..7e345a236da1
> --- /dev/null
> +++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * soc-acpi-amd-sdca-quirks.h - tables and support for SDCA quirks
> + *
> + * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.

2026


> + *
> + */
> +
> +#ifndef _SND_SOC_ACPI_AMD_SDCA_QUIRKS
> +#define _SND_SOC_ACPI_AMD_SDCA_QUIRKS
> +
> +bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg);
> +
> +#endif

