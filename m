Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C67945A41
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 10:47:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FF53FB0;
	Fri,  2 Aug 2024 10:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FF53FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722588390;
	bh=IMZ9afgJlv+tg/Uw9KV2Z0a6YCgJkDhEPIYhHz2LBY0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L1YRL3CUFUAmIlczNXY+2HC/MHDJena0fFjQygN0TbzoEPUKVyy5BVqKF6LWoGmJX
	 wClCB71PheOqmQc8FcqVUkSOsS8tUKSWEDwz7TjgZqiUYPJSF2IRdQKvx94V2Oc/vw
	 vBgNpL3vQccU7wfAFuFpgPnsXthzFJ7YBmeVvUIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52E7FF80269; Fri,  2 Aug 2024 10:45:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5778CF805AF;
	Fri,  2 Aug 2024 10:45:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CCAEF8026A; Fri,  2 Aug 2024 10:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5334EF8019B
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 10:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5334EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=K33+XRaG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qFf8IO/JCul+j1+50HL6h8NIQ4O8b1AouF5R1hETyQf0dfUuFVm6qJt7q70hjzAbWV5xPqeWMHFBbA/Z9YAH3dSKmIIDLsLKvhxZXPI3MkFRu3ACd0V9nCVx0JIKYKSNn78122GReanCWCDJPh/GrM4WjGpbCpgAhxTd+J4pNuDxxDbkdZuK3mTEfigh+J9cxnDcg/x9GmbjkfdufbxqqHCE+YAasnYxCLhDxTAZXvTgMhY1Nar0ZPVcDvMQ5G1B2vb4Bp3kwHwM+pj5mtNNqMGxyZk3fyYS8EGv3LlUZI8TgkROt+vKkPuk1irzbGwSODLO9jtS3RcNAA6Te0otCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WjRYgZsIDxh51j0FbvSEsSAqDR3NYLxof5kCMz/RhY=;
 b=ShKPrlC6yHu9+/DwHDpOEDU+1uSbQo2VCgEwTfEJVNBuBKEtnuTpibHBbQgTBI20aHXUXIDTJfTRFVO16+7CveV4x7zOFf4JusxuVES3xk8W8JGUnWopyRKM50cENg/NLlqfMrJts2oLFfdJ5mD72yRSfzDfFd8EWRBrCacQSYMRcNvSNm1Jp/XalKHUjbENzWvohY6gGIzEo1AtXe4I2HH504BYlDOn05UYr6ex2QmAO5nYUedQpHJQhIvNI/PBVvKajKrZsvwLdUyDigAIPrD0nzwFQwPxiEDOqFgm7T3iUnhHu2DksVz7bJg/g67jxJm+ARJ28g7oMAcpMLtE8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WjRYgZsIDxh51j0FbvSEsSAqDR3NYLxof5kCMz/RhY=;
 b=K33+XRaGImHwj8P6EgInjZNLJJ8VtahNhuaEeLVgU1pMF9A6PHTd2kRaht0uTKLUEG6ec4lJQ5UAY71K8CC7Fc2dynA07J5bEF2pEaS05aRCNM6D+cVKI+m3NZSX0tRP3tvFwWe2stLof//HX9/fFkBRBhoPPlAK5RIhOL3qzZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DS7PR12MB8251.namprd12.prod.outlook.com (2603:10b6:8:e3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Fri, 2 Aug 2024 08:45:27 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7828.024; Fri, 2 Aug 2024
 08:45:27 +0000
Message-ID: <9383df48-2d72-41a6-978d-3b7217947f54@amd.com>
Date: Fri, 2 Aug 2024 14:15:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 31/31] ASoC: amd/sdw_utils: add sof based soundwire
 generic machine driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 venkataprasad.potturu@amd.com, yung-chuan.liao@linux.intel.com,
 linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Marian Postevca <posteuca@mutex.one>,
 open list <linux-kernel@vger.kernel.org>
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-1-Vijendar.Mukunda@amd.com>
 <20240801111821.18076-11-Vijendar.Mukunda@amd.com>
 <64839bd4-f8c8-42da-823a-13fd6dc34238@kernel.org>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <64839bd4-f8c8-42da-823a-13fd6dc34238@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0255.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::18) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DS7PR12MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: beb8a393-ea8e-44d3-66c3-08dcb2cf74ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VHBlOXMrZHdVTlNqV1dYNVZ2NndIb0ZTa1RKMzBVRTdCa2RJbGdJNndxRVhQ?=
 =?utf-8?B?U3h1Ukp5WHhuSUM5dmxNenMvVFoycFl3aG9LSzI0MzFlZTZNRmhYZFNlb2s5?=
 =?utf-8?B?emNCTVhGK3VvMkxzQ2M0VjFrVlFLOFdOVThBKzV0dnh0cHJjamQ0TndGRndS?=
 =?utf-8?B?V201WnM1MDhQM1RpNStmZXArOXp6SkxwTGVySGxZNm9OMVEvTVgzNHJ4NEJM?=
 =?utf-8?B?WEYwNnJiUzdqZzRrWU9zNnc2ZWFIZUtYMGxxdXF2emwwTWNxVmV5cGdpKzBV?=
 =?utf-8?B?SkdwNHlMeGJHNFJiSjJmNzZsS1lSSFlURFMxbkpoS3Jwc1VlalQ4bys3RGh4?=
 =?utf-8?B?YkxMNHRCRStIRjdLZVFtOHk3U0xQTWt2bjNkNlFoZk5RcWp4MFV4VG13REJp?=
 =?utf-8?B?MjNidVlNUkVPL2FleXB4UVNvdFh5emxVaUlnKzlTT1RxckNnNDJMQ3Jxc2lp?=
 =?utf-8?B?UU5XMDdZdUltM0FzRU9BUm9nWEtlTWY0ZXpDTUtsUWMvUWtMT3ExR0RMaUM5?=
 =?utf-8?B?T3FDSEx3b0NySGt4MFNRaHFJZ3pZcS9KV1RTRkFEVmVBaktmdGNtNEk1VzRu?=
 =?utf-8?B?MFRTbWt3eHlmeVZPY1padjV2ekZlOUhyU3dPb25zSHg2bTJOTUIvOUlSOVJD?=
 =?utf-8?B?WGgzZHpnSlNEQWx4TnVZY0YyMkl1c3kwK0JiRkdRUWZIajJxaGFTNjZzU3Bs?=
 =?utf-8?B?R0ludmtNVzRQZDV6SGNnanA2WGl3VU5jV1Voay93WTNrc3UyL3ZORUVzR05R?=
 =?utf-8?B?dm1obVpYL0NqV2xGTytuSnU0UTNSS09aTHJ6ZFNkWStHSFJZUldmUlkxTW5k?=
 =?utf-8?B?RjNmZzZPL3FuL3ExR0FPMzc2SUNvWElWeW9pWTErTkRoRXQ2TjZGMkFFcWJP?=
 =?utf-8?B?czhxM0NFRW5aRzJFMGt1amsrYlhlRUhZdXhEZlpORTV3VTJLOE1JQWVmSDM5?=
 =?utf-8?B?enZLaEVLVTFRL2lSM0lVbGUwSGhHaDdtY2Z6QWxPV3NXOEF3NW5URHM4U1Ev?=
 =?utf-8?B?dmpvRXpVbVV3SElPejQrQUJTQ1NZeVl6T3JNTzBudHFyZjI2WFFYNGlOeFF3?=
 =?utf-8?B?WHRXaitwWUxqSGg2Nk5mWnA1TWVJcldueUFVYVd5NTRHYzY2Mk92OUJtdlVB?=
 =?utf-8?B?RjZXSU5ZNURNVFQrSVArQ1lQK21PZEFpUVFnLzJKTjVtN2ZyUVVlWTZQSU0w?=
 =?utf-8?B?MG5EcUYzQlZsZ2gzeDdBaFp3Sm04aVp1UU8wanpvUzV2TnYzaDFvYzBQNHQy?=
 =?utf-8?B?VGFzL3RnMUtNSC9UMEh2T0tlRWI1UTJyK1Z4bnZXdGV3VUFGQzNuQWVhbEkr?=
 =?utf-8?B?MDJYc0pQMTMydFVjZWNwV2VkaE5YUGtuNHpFL3R3Vjk2SHZ4UER4bEw2V05M?=
 =?utf-8?B?NjA3RnI4ZUVUdXUxK2QybDNiYmpNN2xmVDZMOFdNeU5KMFhrU0NUbi8xTlpl?=
 =?utf-8?B?YkhKWW1lOFkyR1JpOFZFMk00cHVJclBKUzM2a1Y1alc5VkxLR0lVMkpWS1NL?=
 =?utf-8?B?Rjg3MmorbzQrdE41UFVCZTNsN3JuSVR6bGcvQ1Yrd2tleXFyUXJHMkN1M0N2?=
 =?utf-8?B?eTJVU1FPR2xCZmZSVlRrR3hyTjRpYVlwZ0wvSEIzVWYwUGpDUDBiOHozZnNH?=
 =?utf-8?B?RFlCY3dtTWJDK2JGNGhVMU8ycXhtZVZqQ1BiZVRmdWNWcTQrdUtWSzVuWUNS?=
 =?utf-8?B?MVZKalR6TFNDNm5iLzJVaGRlblZBZ0VpWS9mRHhKSzJXYXMyRlh1T1lRQVkx?=
 =?utf-8?B?ejhyaXpBNVVXbDR5NWdpcDVVVXZ5bHhFV05jL2kzWFB1V1VTQms1UlZHYkgy?=
 =?utf-8?B?WDNuanFLaDFobGQ0ODFNUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUJKckdZNW43UXE5cWMyMjZhMXFtU0xxQnVMWVlXYUZ5UkNsdUdkVDVUV1FI?=
 =?utf-8?B?MkhSdFpmU0I5UXdKbEFaMTRxWGE0alBUNFkwdXZuMWs2ekxRNk01d3h1SVJh?=
 =?utf-8?B?UUw2ajRLMmorUE54SDdpSC9XUzh5TUd6cGpCNjJCQ1QrVHZ3UVdXKzE3aEFq?=
 =?utf-8?B?b2lFNWhmbmRYRW01M05HOEhsTmxWUWNBWFhPZm5WekpxMzc0Tk16TWhCNTJQ?=
 =?utf-8?B?eExMbzA5VXhETzZwZVpkR2g3RVY1SGlhTkJCNkJTQXBLQ0JoQ3Z1Q3JWNGZC?=
 =?utf-8?B?bjN5U1NpdCt1SW5idUdyKy9GQm13NG1oNiswWHFEdVkwQkV2NlNjeXhvYyt6?=
 =?utf-8?B?R0t4Y3NKQ0RHb0lWUWtUdmRVU2Qrcml1MGhzOXhWZ1M1WkV4b2ZGVWNyWUJZ?=
 =?utf-8?B?TDhsQVpwMUFMNDM3UjZoOEx1SzVtVmFQZjNtQ3JFazk3cmQzMGVXUi8rK0RY?=
 =?utf-8?B?aExUUFFtTTVoR3dyM2htVGw0ak9sQ3A4UVV5SE4xUVorVnh1WnRyMDFJaWpq?=
 =?utf-8?B?bVJ6dU8yekhRcHZDNkp4Q1BsZkFNN0g4TU43UTBKRmJRQlNENzlWOGVqZHcv?=
 =?utf-8?B?M2ZBaVcwN2pFY0ZlRHR4a1YvL2lrVWlFUTYyTU5JeWNDVDdrajV4aGF1Tmpz?=
 =?utf-8?B?em9VRE5kNVdsVlBPeWFyTTI0V3VIYzgrSmZaN2tYQVZEcWtFYk9xRnk1OFR0?=
 =?utf-8?B?TmtCQ3MrS1FJT2JYeFVaUDZaYlRSYjBiUUhuR0pyRGpOeHdaWHp6dXZmTkR3?=
 =?utf-8?B?bTBiWTh2ZXBPRVJBelhERzFXbHhteWZMaldKUDdQRlhTbDBZRzMyYUFxRjFv?=
 =?utf-8?B?TkU4a1o2S1VRTVU2OFBsUnVMbldCTW16Z1FIRTNNRWx5T1JqNnZPT0hMQTlO?=
 =?utf-8?B?clo1NVEzdW1TWHNaTWdMdHVNbVJnQTFyVDAzUXhINTk2eDVGeUhKQ1lMR2xK?=
 =?utf-8?B?VmlTTzAyUHR4a2JQcUJCT2xTR200NE9RbVlpWTFjWm51OTQ4THNnaWdYZE9N?=
 =?utf-8?B?Q3o5NmR0VWFxUmpGaTB1eU1pTElQRFRsZnRwcWRaS1VSS2tJbS84d2J2WVdD?=
 =?utf-8?B?dTRUNjg1VWhWMVVFMW5GQmJxS0F0MzcyYU9oL2ZEc3JSNWJFMURwL1FyVTNp?=
 =?utf-8?B?RTg4VmFGVGNucFhQY2RVcCs2MDFKZHN5dmFKbnpYa29PUnhSZjIzYW9URnBS?=
 =?utf-8?B?dlFPN2RoU2p3bndGU0dBaWdOdVFvL24wYm1CU29jUndLbjNMZ1BacWdxOW82?=
 =?utf-8?B?Z0VnM3hYcE1CblpTZE9IK29HdjlPanV4aVBHNG9UR0NsYWsybWI5UWVieFlO?=
 =?utf-8?B?MGR5aFV0ZC9Na0JrQldWV1o3N0ZzUnpiWE1QL1BleGwwQXc5WjdwZDBNL0wx?=
 =?utf-8?B?bDB1NjhGTzh4dmF5em14TDRQRzdqejFsbTlnd0pidlY3TFZrT1IrOG50RVpm?=
 =?utf-8?B?QkFDQ25ZbGp5ZkdXT2dwNzdLY0IzbFl3eTJ4a0RaanBhZTk4L0V3dGtHOG9a?=
 =?utf-8?B?ZGx3Tmo5WFJhMTFET2thV1FBOFl6NFgycGF3TjFiQ3pBdm9rSXZnbE4wVXBD?=
 =?utf-8?B?WWRFMmRiTElLaDhuUzRkTmI4K21qaE1RQURrVUVMUU01M2x4Ry9uL25UWDR6?=
 =?utf-8?B?cWdzcEorMUlYejByTXNhak1KUS9UbFNJa2J5ZGlMRWlZSk0wSlk5eVhOcWdQ?=
 =?utf-8?B?clZ0N21oSEpmTldldHpxWWk4bCtHWDI4MmhrOFJKVHlQbHFGaG1CY2o5dGhv?=
 =?utf-8?B?NGZNYTQrbVByVm5OemNTNkt5WVVlMnZzTGZnTzVEUkVRSmdlZUo5T0dFR3VQ?=
 =?utf-8?B?dDMzOE1wMDFBMWsvdTFiSHNXdkRVckx4OFJ1NWl6bzV5bXd0MDZhRE9IU3Vw?=
 =?utf-8?B?ei8zTTdYLys1SVVTSHFBQ3o2SFdNKzM5RDBLT1VsN0tkTld6NU0wVHhuTnp0?=
 =?utf-8?B?WVdzaXVYbmJZSXBWTTJIUzROM2NRelBUVHdabnU0Z2F3UEllYnhxWjV4M2Ft?=
 =?utf-8?B?QXd2WGhvNUltMUNVaDUrcVZ5c2J3ZURSa3pJcHlkVG9WdmhWcUlZdjFNYVJt?=
 =?utf-8?B?anJ2TnIycUk2c1NHa3QvbERaRWVacnFhYzBLZTBuK2o3bUdBaVhoNXc4V21n?=
 =?utf-8?Q?lJMLQXEOpQnBPRstmGUruCQyg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 beb8a393-ea8e-44d3-66c3-08dcb2cf74ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 08:45:27.3021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 024RvN1vMJ8A1cPz60bWIEpHvYwBEujgqDsvOk13NEwkjQqwT10InURs6voG+xdnzIy+rxs81b5DEv7zkH9yig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8251
Message-ID-Hash: MSHIQ33GACIQNTLGWMVTQITRAX5SHTS4
X-Message-ID-Hash: MSHIQ33GACIQNTLGWMVTQITRAX5SHTS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MSHIQ33GACIQNTLGWMVTQITRAX5SHTS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/08/24 14:07, Krzysztof Kozlowski wrote:
> On 01/08/2024 13:18, Vijendar Mukunda wrote:
>> Add sof based Soundwire generic driver for amd platforms.
>> Currently support added for ACP6.3 based platforms.
>>
> ...
>
>> +static const struct platform_device_id mc_id_table[] = {
>> +	{ "amd_sof_sdw", },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(platform, mc_id_table);
>> +
>> +static struct platform_driver sof_sdw_driver = {
>> +	.driver = {
>> +		.name = "amd_sof_sdw",
>> +		.pm = &snd_soc_pm_ops,
>> +	},
>> +	.probe = mc_probe,
>> +	.remove_new = mc_remove,
>> +	.id_table = mc_id_table,
>> +};
>> +
>> +module_platform_driver(sof_sdw_driver);
>> +
>> +MODULE_DESCRIPTION("ASoC AMD SoundWire Generic Machine driver");
>> +MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:amd_sof_sdw");
> That's a total duplicate... standard form letter:
>
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong (e.g. misses either
> entries or MODULE_DEVICE_TABLE()). MODULE_ALIAS() is not a substitute
> for incomplete ID table.
Agreed. Will remove MODULE_ALIAS().
>
>
> Best regards,
> Krzysztof
>

