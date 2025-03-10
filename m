Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2834A593BD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 13:11:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44B3D607AB;
	Mon, 10 Mar 2025 13:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44B3D607AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741608672;
	bh=HfrixilfGCP4D+uaIPFvzdGFhLsUNwwA6aPMzfdvU7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ucZxxUzfT/uRTfw4grZmaIXwqsvWY+lMT3Hy0Ta+OpsObVIHBOix9Tl3bSmYsvxxY
	 Uqw3BY7LgxOXXLXiWNMfkFGOh5+oxbgRO+CuK91Gz/9lSGa1Cswsv7IFUd6Zq6jONR
	 gfsLUljNw85iQL3IMkBbRMNd9SjIBQTNnSEL7paw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5A74F8057A; Mon, 10 Mar 2025 13:10:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A30F80529;
	Mon, 10 Mar 2025 13:10:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E2F7F800ED; Mon, 10 Mar 2025 13:10:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::613])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2ED5BF800BD
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 13:10:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ED5BF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XWAPGmJG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxiEtSftWhx8BFM9YkrDlLsrcBkYaIsqRG/ZPckXVMZdHA6S9cI6cqmGXZWTWoErXIJUrE6Zz3JudTqtLuPmnvHwelrbmDNwQXIv5bZ1ujuoRH5wutqaj1S7NJ8XBvVGpYYuj+TW+oxkd+ioEwJHnyjAORM9z3t9hshFxwXX6HUvUY30JPl2/+7G2zzkUv377cgOVdC2mKjyAoizt7imU+eIg3XAI/j5caD+F2HHo/sqlkDVswOPJtcUivsLXHfPN7qMhPYs8AV49Q8BY91lj/LEKTbxjqd9mIFz/6Ihxx22MK9GYPPnBR3B5OYej3xpKHyXfoJAp0jVkarNm0s6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6Acx4L+zOypZNra/9Ge/KbRCV+Ga04uETHIfge/u7k=;
 b=LRnq9x1oPtpRWTs+4zW8u3vYYwmHxc95yvMBrrNC35mJgRZoZ3iuurOhm3xVSgwDotkFzuSnzDttWSblmB8p6gSz5pOzeFUThAjkQq+OjqGP+QemUEJE0H78FYPjmG86DSYF9wFCyEZ4bdkbEnUJAhGz73T44KRA/NbhWpSt1Mjky7S6QivTYxgWJM2RD0QTrCuEYTcOmAOE3o9rndp6YpSTyIjmP3ou9j1XZ9+6JcVVWTKoG4UcbkxgIC9hSgI9NGQzHQLWb24lPrqSymbcxzaadmPMER3hIoOXug3kHeBPkk7g7udwNXeQqsC+5Aw1KfuuYCaCUItYRU6KSKYL3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6Acx4L+zOypZNra/9Ge/KbRCV+Ga04uETHIfge/u7k=;
 b=XWAPGmJGYJPMNSNVdrXZ2pIyHcv2S0xxVzN9XBxSm4ACMXg8pcc2e5FSuFXLpvGfFYVzscvpwPUoOEp7WvGAN/OoP9B/7iDEv3ibYK6YYPgNb144wT3vmPJ2uwTHg4tHj3hM9Ygp6QdH7LJ2OB2bPYpVXc5pYJo5+VkoWO3eFw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by SN7PR12MB7252.namprd12.prod.outlook.com (2603:10b6:806:2ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:10:28 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%5]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 12:10:27 +0000
Message-ID: <09a88230-744a-43de-9346-16cc06766c1a@amd.com>
Date: Mon, 10 Mar 2025 17:39:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] ASoC: amd: acp: Refactor dmic-codec platform device
 creation
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, mario.limonciello@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
 <20250310104601.7325-4-venkataprasad.potturu@amd.com>
 <6e892094-ff90-41ef-ac56-b7fcf6abf2a8@linux.intel.com>
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <6e892094-ff90-41ef-ac56-b7fcf6abf2a8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::18) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|SN7PR12MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 1caa94e9-943d-42bd-a23c-08dd5fcc8b6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFl4TThZUXVhMVBuQU02cWNPaHJVN3JOSEVhc0pjS2xsWkRPcFlwdFJ0Q1VT?=
 =?utf-8?B?c1hTQVRPeTR1Qm9ESHRVNjlkcVYyM1RxZmMxUG5kamZGcDE0VEtLTlJYNFBT?=
 =?utf-8?B?MVpLWmlJYjg2amhOOUY2bS9TODRIL0dpNnVjSS9raE9lZVN4aEgxUjJvSk9K?=
 =?utf-8?B?R3ZOM1ZUS2tzTi9qWWZNVEdwd2NNckg4Nzh4amlJay9adW03a0JKS05hM2Mw?=
 =?utf-8?B?TVdmRlpvN1VjY3pUU211WW9WK2RGS2hxaUdCaE9lQmlGenh4K0l4eTBSMWJv?=
 =?utf-8?B?UHlxVHVXS0JwaUJlNW01aUJ0QkFnWDhMTGxjNXFsNTVvTXRMSHcrblMvVUZE?=
 =?utf-8?B?ckVrOFFLTHhITHBMR3VJbFJtS3pGSS9Ud012WS9RNGZ4Z2Q5TXJ2WHczeXU4?=
 =?utf-8?B?TFBuYjFOSDkwdlU1UnQxOVoxMEVuNG1MN1dSNE9KT2d3RWpoYUREcHlVaWR2?=
 =?utf-8?B?UmZoYjM0a0k4SXY5UUE1UXBxc1RPc3kyOHAwZFYrSG5rRWVvY0RycDc0U3Qv?=
 =?utf-8?B?U2txR3RKWEoxNFNiL2ZjMWpNQXhuOEJpLy85UTROZmpvUUdONkw4eWdGNm9V?=
 =?utf-8?B?a2ZxMlh5ZTBxc0RlM2RUaGFxQmEraVVQeUx1anFqOGVHYjlkeUhyY3MyMytn?=
 =?utf-8?B?VllmMnc2SFV1LzY4NHczYTM1WUl5QndyU2tJTGlDZzNWTTRmeUR5alR5Qkt2?=
 =?utf-8?B?bHN5cXBnd3hpMkhKK1V0TWt1QkpaM3drZGhoNTlSeFVUc0Jvc3hlZ2VYWVR1?=
 =?utf-8?B?WlcvTjNnZ3ZCNkxpcWkybytKMWhTVWxzYW83eXdCaG1ab3MvSFEyNWQvZy9E?=
 =?utf-8?B?emRwOTBzbVdKR01QcDU4MkZlZmFEdVVZOTM1VnhYWWZEdnI2eS9uNUs4ZEFP?=
 =?utf-8?B?SzZhR2pLaDFPSUEzMDJGNWt0VFU3SzFFQksxL2xZVDBkT2ZHelZMUDBodXRC?=
 =?utf-8?B?Y1VQdU5TdDhWVTlrWG9vR0FEV0dFcXJDMEpRbWRDMjhsMm9YakpPRzUwZ3hk?=
 =?utf-8?B?S1Vyc1E3dHVBbW0vang5K0FPUW8wT1lFNUQzdEVMWVV2NlBWK0FIREFHdThC?=
 =?utf-8?B?bkYzTVRvbWZWenVPbjBmK0ZYdmJMRTgzdjByL3B5anZ0Ynp3Rzkwd3p6K0s1?=
 =?utf-8?B?ZkNwYlgzWVl3bU44dzBXTVpic3U0ZVRkaE1jbUEycUYrazlxTDljaFlDQW9o?=
 =?utf-8?B?S0htN2FpNFpoUVJ2TDM1T0JBdUJBT3lqWnNFUitzdk83dXJYSmdnZVdGWDBN?=
 =?utf-8?B?MnZGdlRFbmVSd0NmRVg2SVZ5WEc2VFhBZlJhL1IzdklwdHFmeG1IblArK2VB?=
 =?utf-8?B?QTJHeHZxL2c0Q2NkczdUSWRPUlBaYzBXTk1ueldELzZpd1RKaEh6dzJUVHd2?=
 =?utf-8?B?NkpLdXczd2NBWTlRZjhORnhGTUpyNGhvSWZvYUJXckloRXBqUGJTSjlHMTJ1?=
 =?utf-8?B?UWZZZmFKZGloc0N6cUVFOHVoVmR1Qm9qOUdkeW1STWhvcVFaWUtVc2x3ZkZ2?=
 =?utf-8?B?NTNTTndaR2lCYkhDWXlBdCtBMWY5Q3p6d0w5THl3K0ZWaDdoRElXaVY0NzBl?=
 =?utf-8?B?WmYwNkhENjhxQ0FObW1kTFYvdE9yeGJlM2ozRVM0cE9aaTY0ME1qcXlOTDc4?=
 =?utf-8?B?STAxOGk3Yy9Ia3F1WmlYQkZRaVdDNDkvWTJiRlJJZ3c2Yml4SUtLRk5Lbk5s?=
 =?utf-8?B?bXkvbnYyWW9qSU9XTEdjRGlhd2VHaWp6c0hEYUlHYWJrcGVPdjZLQVM0dDEw?=
 =?utf-8?B?ZGROZmlKdEltRFFRTnI0aEhUMmlsUjVOWGhSdnZzUUtSS05tcy8vT0N3dXg5?=
 =?utf-8?B?QmFFaDFKZW1udk4zSnVoRWVBcG9ZOWxyOTdVeVVKb1hxQWd3QUJyS1FqYlJh?=
 =?utf-8?Q?IUMotejUZFJ80?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFFiWmZTTU1jbksrYVBVU0xoOEpVbXRONkN3NmtqSkxlQndvalYyL2NYMXZL?=
 =?utf-8?B?bVQrblc3Q2VEQnVUT0Q5YVR4VHE5a051cHBhYUlMMUxNbnMwclh0M3RCMU8w?=
 =?utf-8?B?QlFqVjJoZ0NDMzUwZmUyMWpVaVBqekpCc2VUeHFHOSs1RzNXQUM1TzJRTkVm?=
 =?utf-8?B?Mnp2bGZxL0tFZGxacUhnbUhJT1BxdDA0eEE5Z3BhMks4eEx4bWVJRE5EVGZr?=
 =?utf-8?B?dEl2SHp6a0gyb1RiU0pGanBSSHJrSXVYU000QnI5eUpuN1JtOVlJQlBCdDJV?=
 =?utf-8?B?ZHV3cE9PREtBaWJpMGVGME82VitsK1VSbm0ranh2RXkvQnhHS3JJOS9mUFEz?=
 =?utf-8?B?cVpsN0pCSDVjaXQvT3lmNmx5ZkI2S1AyN3VFYTJKbEo0YUVJRWhlMjhBbVA4?=
 =?utf-8?B?cVZycFBTNjdENDR0bWVQbWVzVjZaOFlFaER6RmhZUm82N2ZURklWb2hkeUdG?=
 =?utf-8?B?WGw2b1RiLyt4R3hneFl0enEzeXM2K0hZQlB0RzM1bU85Q2hUWE0rUklRejRJ?=
 =?utf-8?B?c1dPSjhXcWFEdEVpZEVJeWg2blRYbnVkeGFWbm9sMzJsRzBZZmJxZytxQzVK?=
 =?utf-8?B?aGx0R1NHUU1jaWI2OUZkdEVMd0VaUS92QmVycGsrRzN4VjZNT0NxWVFhSzZQ?=
 =?utf-8?B?c0RBOTdJbHZOMkUzSWQySVNzT01tMktuQ1JhY0htOCtzMzhSQTdjRjZ0ZXZJ?=
 =?utf-8?B?a2dsYnhpdUhHd3FmSlFKMFJaYmM3Nmg2MEZwdDZRZXA1Q1ZxaGNWSEtYSEpx?=
 =?utf-8?B?L014aU9mU0t6Q25vbEZ2UGl5Ry9RbVdsVzJSeHVtZjhCOUFpWHFYR29IMEc4?=
 =?utf-8?B?dUVmR2lna2NLR01KNTZVSWJQWUl1Wi9RU2puVmpiNWt1QzZ5YWJKdzA5eGx5?=
 =?utf-8?B?M09BMVRkWlRmaWJwUEQ3UHkrQ3BIOForaHpNOXNvdWpmRk50TSs0NlhWMHJG?=
 =?utf-8?B?TzF0ZVp6eFhzdXczOFBqMzJPQVRQS2JkeGtjRXZORXJFYXp4KzNtZWM3K21i?=
 =?utf-8?B?aW96V2pES2R3Rkt6SDBtTnRHRUNmZHpSSU5yYi94S0NnblVOcjdXamN4UTFS?=
 =?utf-8?B?UXlmNmNIN1U2TVhkRExEQTlWZUc4OVVkT3dhM1I0dnpvUTJFV0cvb1BjQUk2?=
 =?utf-8?B?ZUR5WVo2SlA0emlxSE9oUm95K0ZmNXcxMkxveHJsZjZBUlBCd1RUa3ZSRk1l?=
 =?utf-8?B?MnJuZUc2UFl3NCtFbERZeDlPYnAzZ1JDTHF0dUE1TzBEQ0UyT3BRek4wMVdG?=
 =?utf-8?B?R3c3NDR2SEEvQml3YXFMN3plOUdMUjl5aGtnLzN6VFFlYm9JblZxTEtjZTk3?=
 =?utf-8?B?bnhxNWN2cTFVelBjNktDRGVmRXM0UEQ1TXE2VTlMeWNERVJ5d1VtRmJqMDlB?=
 =?utf-8?B?OTAvd1JkWTExbjIvT2tRQ2hvWmVMNTNPTVU4czdZQUJnQzkveXNxNjFMNnNs?=
 =?utf-8?B?WGM3TXZRSDNzOUhTaStmVzdYMkhBVkZVTWRWN1p2TkRkbGpJcm1wZTUrdW4v?=
 =?utf-8?B?WHZ0NE1ISlgzNHlscEFneFpjL09lazJvM1FvMEdPblJPU3JJK1lWanltN0k0?=
 =?utf-8?B?blJqa3VhNE1kOWp3Y3crL3Rsd3Ezc1NEUm92UWp1UkNBeUZDVG8xUGlzTFQv?=
 =?utf-8?B?TlYvSkxCdWZTbGRLZVlPdlA1L2VnUHZqMVF0cEd2VW1seENDazVZVlNGc2pn?=
 =?utf-8?B?Z1NMN1V0WU9OMHU4Yi9sQzRVcHhNSEVUMUVPUmliUndsalc1UGR6YnNiNGxl?=
 =?utf-8?B?ZEI5anI3QmI1OUU4V0dtaktvREtPZDlDWTFYY1FRTnA1K1NQeThzd2hjQmh6?=
 =?utf-8?B?RUJUVzA2c0c2cXArdWRjSlhOaW1UZVRSZXM4RzdmS2ZzNzhXZkNFckRhRWFJ?=
 =?utf-8?B?WVF4U2FHTmhTV2lWTHVnMVZrb1lNbEY2d3RhMXRMQ2sxZ01Cd3hxa2VxTThO?=
 =?utf-8?B?YkhiM3lURUg0VTduTXdXTFZXMHBCL3ZtRHNwSlF4UjJpVTdZeFU1OStvY0VR?=
 =?utf-8?B?TEh4SHgyRDkrQWpQckVrVWlMV1dlYkVvcDBzMGE1ZGk5dzEranVVUDQvVnhD?=
 =?utf-8?B?QlhhOHh5Uit4OWsvVmp5Rm1hczJtZnprSGVQcTI1VWJqTjFyUDZlVnEvZlJG?=
 =?utf-8?Q?8Ro3DTY8Y5w67y8shfAwGcXJ/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1caa94e9-943d-42bd-a23c-08dd5fcc8b6d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:10:27.5174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ybyYlmx2i2DZR6zzmtDotOAIYr9fr+o2xfKmjfns9JtHreLBKZ/6v9/bzgtl1aUQYW134UcPSGoYyzjP2AArcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7252
Message-ID-Hash: LLEJBXE2E6IQ3WSG6GNQZWQFJUFBPKEX
X-Message-ID-Hash: LLEJBXE2E6IQ3WSG6GNQZWQFJUFBPKEX
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLEJBXE2E6IQ3WSG6GNQZWQFJUFBPKEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 3/10/25 17:00, Amadeusz Sławiński wrote:
> On 3/10/2025 11:45 AM, Venkata Prasad Potturu wrote:
>> Refactor dmic-codec platform driver creation using helper function.
>>
>> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
>> ---
>>   sound/soc/amd/acp/acp-pci.c | 49 +++++++++++++++++++++++++------------
>>   sound/soc/amd/acp/amd.h     |  1 +
>>   2 files changed, 35 insertions(+), 15 deletions(-)
>>
>
> ...
>
>>       addr = pci_resource_start(pci, 0);
>>       chip->base = devm_ioremap(&pci->dev, addr, 
>> pci_resource_len(pci, 0));
>>       if (!chip->base) {
>>           ret = -ENOMEM;
>> -        goto unregister_dmic_dev;
>> +        goto release_regions;
>>       }
>>         chip->acp_hw_ops_init(chip);
>>       ret = acp_hw_init(chip);
>>       if (ret)
>> -        goto unregister_dmic_dev;
>> +        goto release_regions;
>
> ...
>
>> @@ -168,8 +187,8 @@ static int acp_pci_probe(struct pci_dev *pci, 
>> const struct pci_device_id *pci_id
>>       pm_runtime_allow(&pci->dev);
>>       return ret;
>>   -unregister_dmic_dev:
>> -    platform_device_unregister(dmic_dev);
>> +de_init:
>> +    chip->acp_hw_ops->acp_deinit(chip);
>
> On init you call acp_hw_init(), but here you call ->acp_deinit() 
> directly instead of acp_hw_deinit()?
Sorry, over looked will fix it in v2 patch series.
>
>>   release_regions:
>>       pci_release_regions(pci);
>>   disable_pci:
>
>
