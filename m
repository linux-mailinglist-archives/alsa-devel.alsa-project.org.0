Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 933AF9F4D5E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2024 15:15:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE5826B;
	Tue, 17 Dec 2024 15:14:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE5826B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734444905;
	bh=GgQF2K25hMaRVX2jjzIDIN5ypdJqaVhjD7LUNxnhfBA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TyB4OyxfZSSTYiaILpYwg26oCml+TTYT+PL4V+zSncwKTwIgH5bLOHEHksYvmqTdJ
	 isOCSI8vXMZW6QlevVzRmpSZBfy5GKkb2NOzglubVQ592jZfjFC9a0BpuxJpj16+9r
	 yPei8TDkOgdg0/12dcLHuTGoIx+qxaeNb5i0PlMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F64BF805BE; Tue, 17 Dec 2024 15:14:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DFDF805BB;
	Tue, 17 Dec 2024 15:14:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B12FF80238; Tue, 17 Dec 2024 15:14:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53EB8F8001D
	for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2024 15:14:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53EB8F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=fmxpjfUF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0vSOEC3zRT8TNuDmCElRwekto8G2GUyoCEiqK3xuPOTTc6XXmcQBAlmNWXOpnGkjtwotm+74xJcTFzredmuIFUN6bH5nNnqToWIl9Iccxg9g8+cSzD509DAewfjAd/rIIq29W6akxv6mxOuL5TklJnaHtmnoNlDK8Rx8KTbMO3lR1t5d9x/vRKOSPsq3eDYZ2XoanweNkDu05ymN55TvH/gG9xsFpLNNRKedDb23EE7mTX3m6Tf+qMDJakwMjVr+7K2xzvANNdiQgqRHhpp9yUln+obuMMZ/TRg08mKGGkB2QTZ2PeIYCucczuEXVEdIz37N6Mo5iABUfZaCFOakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NG1c4jBI9nOK+TsnC3dbsDWDW5SWHHoFK1juUM2PEAo=;
 b=Q0gMfu1dhhWj2L2koJ03zMCyjXn4Kj6Jbp04elKxwK9KXXw1+QqfjqFWRCu2dL7a59oEZ0WH147ugpd4pMdzAxnKn7bT/ikkexoQ7+dnw/exwuJkRnGlef2fpOPFZma7RECxpakciotju3nqxx3OuFtcAONTdic4AijWbbgRw3N7Cj4ws50T2vbRujbNTdYZWa791oSim0zw/GK9rytyegbdGhvR5mK3V4w6roeM0rxjr7JvKoLFur7RvujsESYXYlMwNwmc6AkhHdHD16YxeqXv2HtqwTwI3fAekqEl+Mzjio22LI2L9yXWe6T1sfDaObDu3yBkRP4o96NTMxxAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NG1c4jBI9nOK+TsnC3dbsDWDW5SWHHoFK1juUM2PEAo=;
 b=fmxpjfUFXEkrDLjSnBuTRIQqDY6LXWK5VZ4ggMHx+TkJx1/1yttpn3/aMcFVDKHs7Eb+BerVuMeT1B9nZeVTcH03dN1z4jD9xJolzlzE4DcUNPsyTjrbOWKHQnpD/L9hIJfn4qS12mol0KNtG6SBN2gq0eB+x/8Suf0aS2wj4Wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 BL1PR12MB5947.namprd12.prod.outlook.com (2603:10b6:208:39a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.21; Tue, 17 Dec 2024 14:14:18 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%5]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 14:14:18 +0000
Message-ID: <511e8690-f5a7-4d59-af3f-58184727dc1b@amd.com>
Date: Tue, 17 Dec 2024 08:14:15 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: amd: yc: Fix the wrong return value
To: potturu venkata prasad <venkataprasad.potturu@amd.com>,
 "..." <end.to.start@mail.ru>, Mark Brown <broonie@kernel.org>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Jiawei Wang <me@jwang.link>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org
References: <20241210091026.996860-1-venkataprasad.potturu@amd.com>
 <173384228352.64342.12647978237032666087.b4-ty@kernel.org>
 <1734430927.112015823@f318.i.mail.ru>
 <e5a42dbb-ff8e-486d-ab2c-66798af1fd80@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <e5a42dbb-ff8e-486d-ab2c-66798af1fd80@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::13) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|BL1PR12MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: 248fad2e-3a78-494a-a1d4-08dd1ea5184f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WkszSjY3YTNyTlAyalRxTGR4L0hJOThjS3BwalpIVnMxdEE4aTBJN3NmSUVr?=
 =?utf-8?B?UmpidVRVQXNWendGVGJmeWVRd3NlU2g3RGFMOGlmZm1EUlNOUmtzTHpPbHdt?=
 =?utf-8?B?Q1Y4SlliVkZxbDhMZHdwQ1VEcCt0alFlRTdsRllxME5uWVgzUkYvazUwcVg1?=
 =?utf-8?B?b2dwbDdLZDNTU1RKK00xdld3VUlSeGZhN25Ya3hKTm9DS1ltWHJnUU1TcGpQ?=
 =?utf-8?B?WDJTUFNVd05iMVRWZUFVbkF5bXl2K2J4ZGVPbENSalhoSHNLSFJTSGw2SlpZ?=
 =?utf-8?B?dndRS1BvaHpjWmc5MnR5YWh4Y3lSRHZvY0ZnMXNPMVdva1oxVkhnd2swVCt3?=
 =?utf-8?B?RFR3d2JiMEJHdFVnNzJTakhWendIb2RFQ1lGbGROeFJjeDhjTm9xL3E4a1Ax?=
 =?utf-8?B?OFUvY3BhM2kvbXRXaG1jUUcyajNZaHRraXhrZzlvdnBHRUtXcjZERTJWczN0?=
 =?utf-8?B?U21uUTZUUEdLaGI3TGxXc25ZKzNHSjZ0UHBERGtmRGdHd05peXpUZ0xNSWRl?=
 =?utf-8?B?bjUyZWZrUFpvT3RBeGtYSk0vZFZnUzVMbHNqZEpQM0dkOG9pVWp0Z3l1NjVv?=
 =?utf-8?B?STY5VWhUdEV4c2VRT2NaTysxTjBLbjRvUFhGUG1ocDBLUEIxQjI0UlNDeGVw?=
 =?utf-8?B?QVFIVm14eVYrY1hBbXdyaGhtOVZHQXV1TllXWFErb2JGM1Q5V0RiNlZCdjhJ?=
 =?utf-8?B?TWd4UU5oN0Zya1Y1ZkhqSkNtNGJJVzJtQ3c4cFRLSHU4STBEVzRYaS9KK0N5?=
 =?utf-8?B?V2kvQXV5bjRqNUh4K2c0RXd4elloekh0L2NrSWpHREdSNDBVcWM3WHBESldq?=
 =?utf-8?B?VEdIS1ZHcFBCbHRZdnhxQnVLK3BUcXlKd3ZaREVpYkp1ZEx6RktQckdoZ1pk?=
 =?utf-8?B?a1NhYjdkeVZpZWtwZHNVMTdCQ3NnS29DaE5RYWxRQ01ibnN6K0JWbXI2NDl1?=
 =?utf-8?B?dDVLdy9UZWlxVFFiSFowdHh6Vm1aNkhsZUY5VSsvVTNHYkhZaC8wMmVRb3NC?=
 =?utf-8?B?NEtIVmNRSFhjZG13NWg5ZUJLZWdrNjBBZEJyRnFzTHE1RVFSVzFJZGd2cVRW?=
 =?utf-8?B?VnJGNUtCVTJRQVBOaDZPMnlwMUZvK2VVNzBhclZXUC9uRm9YMFQydmRpL2Iv?=
 =?utf-8?B?NDl5WTdHbzErd09vckJjNUpnYkFVVjUyY1ZTdUhMVFBJTXdmSVJGb2gyOUZh?=
 =?utf-8?B?MmF4eXNLOUgxNFQvUy9lY09uTzBDMFFLRy8wMU85ODR3b3A3Q2lRcERCM1N6?=
 =?utf-8?B?cEN1cHVrbFRDdFZIQjhkbEd2YzJMNVB4MTNrOGJlSzR6cThFeHZFbVhHSjdO?=
 =?utf-8?B?MWNWZ0RPN0NKbFlnS2FmV05RWWVBVTcydkVUTDNMMkY4N2s3Zng1OE11ZXdM?=
 =?utf-8?B?WDNpZlBSTEJ2MVhOT3YzMUVySk5QamV3R2pGZlZ6L0VMWnJXdStqQkVmYmxW?=
 =?utf-8?B?SmxkS1ZKdzRJWWh2TnQ2WllLdERMVU42eDFFVGZETEJacndvZWUxdFovOU9B?=
 =?utf-8?B?bWoyR1FiUnZDbkNjdmNnby9YTFd4UEdVc1Roem9XN1I4UzNtUk41UlUrbldv?=
 =?utf-8?B?Ujh3cG5KcEtjQ1BrSlcxYmw1WWtTUUprdUk3eWc0QklkZjMyTXU2NlIrSVB6?=
 =?utf-8?B?a3RRNDhGZUpCQ2VMOEhjaS92RE5zYTMvMWdiK3ZSNUVmRVlKSXptelVyM1dR?=
 =?utf-8?B?UVlsQU44YmZJaHQxVWhYZDZJZkFJMGdKS1pLSnY2bllnN2lmdWdaQ2lKSFk4?=
 =?utf-8?B?Z2I5MVp5cW9kRWNjc1VWRWtKWFd3bHl5SlJDWmtodXEzK0tLQnRmem10NEVn?=
 =?utf-8?B?a0U3RXcrdUMyZUF2eWFFZTF6UlFRcWRkb2ZjdjVsb1Nsa2N1dU1LZEtraXFN?=
 =?utf-8?Q?j74Kz9gNIZ/wN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L2NTb3NqdW5DUEZNVC9hU1Y4Y2VMYTBLNU5CM2J3MnRubThNVmVoSW0wTkw3?=
 =?utf-8?B?SGpPVFQxT3NWKzV1RjlwalFSaTBWRzBXQkowelNBTVBnOXZIdWhuY3N5c0x4?=
 =?utf-8?B?UmpqMnh2SlNUZHlkeEtybjJvd3JwUWlRM2dPcXFXSjVoWDRiOVZ2alRaSHFP?=
 =?utf-8?B?V1hmSmRIK2RFMnN4MVFkejN5cTNOeSttNGJWWDJ3cDZWNUtwdGNpeVNjSTRV?=
 =?utf-8?B?YlJDaFA0Y2lreFJNbnJHRnBPWi9vNzhqZHZXZkQraHFjdDNaUFQrQThQa2xZ?=
 =?utf-8?B?QXRndWpnQ3ZYVVZXUTc5cDdPTWZDTWIyQWlCTFRYRUMyQkZJZUFGaWF6cUhD?=
 =?utf-8?B?UUtucGljaTBYLzFPeFhNSjRNRlhoMElLdGQrY3ZsbWZQWk5JQjRRS25uN2xW?=
 =?utf-8?B?dnc3MytqN1ZiQkxqTHhaYWNHS3Z5dmNvUzJzeFF3SWVpUUZFamFWRVBnRlZZ?=
 =?utf-8?B?dUlDWjhhcWk1blNxeSs5YllqemZLREYzaGJaL2xwSU9NZ3pld3RFdzBhdDQy?=
 =?utf-8?B?a1JETVVVem9NWnQ0NVFDdFhRV3djOThyNE9GNEw0c1NCZFJXWDdjUUd3aElL?=
 =?utf-8?B?TUNabitZNFVwTm5HdGJWRlViYnlTOHpoZHZReUVPZ3R0YTJncWtrOWdkdkh2?=
 =?utf-8?B?SThva0VrVTZsWGJqMGQxRG9lTjV3VW9FTitKRThJbTJsc0k2VnFSeFBJbnJh?=
 =?utf-8?B?eG11RkgwbnFsb0tPU2hrVjJIdkpDVEo1TmNqMytUOTBWQ2hmelVRZ0RWUldB?=
 =?utf-8?B?TWd1SlB3Wjg1SXZkSEVFNWNqcm4xbjQ5WEhpRHhwWVNDTmJRMXk1OWxtM2p0?=
 =?utf-8?B?aitaYnA1S25WcnUrZkYrT2xJSjVVc2RnclNWcnJFbWJKa2w1TEQ5RXpXdDFu?=
 =?utf-8?B?K1ZEZm5wNUlPc2VUaUQ2c3ZFcFNXUUhjNmtBYzFZR1R1NlpUQTExUi85MzRK?=
 =?utf-8?B?aENkNUdQdm5vVDVoUEd6cDQ0U2ZudDNZWE5Xc0txR2xxL0U0UTVRbmRiZ09M?=
 =?utf-8?B?NVFkbngrKzFISnpFeWFwcWdmbkpjSnZlR0V5T0pxYlRpMHhhbVJlZkdKWkVO?=
 =?utf-8?B?aXpUVlpFYzhOd0t2MEp4N1ZkTWp5K09jQmQ0Vld0THVrRjdMSlJralc2Y1pU?=
 =?utf-8?B?a1FBVEhLTVJHUUkzVnBQempoQnY2VEVodUIwcmRXbEpaUGxEdDV1SWY1ellt?=
 =?utf-8?B?TVRiMDRQZ3RxWmtpWHdNNGN1TmNtZ3JJYldnQ1Y4dEJYNU03eURScWY2R0Rj?=
 =?utf-8?B?R25CbFRPbEt2L0dVNGx6akhHWk9INmJ4WjdqMEdoZnhJejNBT0R1R0hoVjBL?=
 =?utf-8?B?NVVCYWoybVRVV2g5cDk4NDBKL3NhMkZ3R0R0MFR1dDNpNzFaQ0MyOHFqOWZr?=
 =?utf-8?B?cUkza2RjeTZkSG9DSy9pSmtXNE82TkhVUktyZE1yaDBhRXRPRGhNM1ZGaVg2?=
 =?utf-8?B?SGtxd0dwRFpNcm9sdWZDTW9WQXptQVRzOWtseHpEbU42QXByUzQ4bnh0akZX?=
 =?utf-8?B?YTFOYm0vQUcyYi9WZmp3RnJWWGI0V2JRNTV0TGdhbFg0eiticVJtdGVvQnVZ?=
 =?utf-8?B?UWFXMVQ3cmg3TlNjZnhFY2s3TlAwMnRIa2tLZ2Zubmx5YjRIei95YlBVQmls?=
 =?utf-8?B?TzZZbE8zbnhqc241STJ4TVZmYzhVcnJYUDRHUWc5ckMyT2dvWlJjVUVSQkNX?=
 =?utf-8?B?M1dYV1BidXVudWhwSFFCOUZ0RCtvNWQ5aXloMnk2QndqLy91TmVTZmtUc3NI?=
 =?utf-8?B?UExneGNCMk84NjcvaEY4RW8vcFRHZGtoKzVaZTdqTE9hZGF2ZEROb09Td00v?=
 =?utf-8?B?cW5sZHJna0tKS05rbDZqamJhMzFRSzJtWGxvN1d1MUJ5TDE3NzZxM1FkcDZN?=
 =?utf-8?B?TTZ2bTZaVUV0SGFBbDA4U0NxcFdPYmJFTjQ5M3JtMlRkUTRCZ1Y2MUV5OXEv?=
 =?utf-8?B?WU14cFQwckx4NC9RdEVDTjFHVzhQNVpodjQyQ2duR2VKWG8yaFE3RGdNQk1P?=
 =?utf-8?B?WHhNN0M5emVHbUxpWHFiT0c0QWRkaE1zR0huc2ZOODVEeXhPazNiWDlDa2pl?=
 =?utf-8?B?V0ZqWTloMWh5cFY1cnFSQWttbG03b1BwVnZ4bVVWZzNkN0R4cy9zLzhKZTFM?=
 =?utf-8?Q?rD3Rd1lzTpwJBxUhcgN/5s98i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 248fad2e-3a78-494a-a1d4-08dd1ea5184f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 14:14:18.4243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 94T1lD4m/tDdGbp+RO4ZDSwbI+J2noZ75FchObeyKmZBCO4X8k29bTJ40w0JFuuxjU15zMfnvI/R5Rs44GLUog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5947
Message-ID-Hash: PGSJGRHTG5LXTY3OURIBU4YFJO47E4XQ
X-Message-ID-Hash: PGSJGRHTG5LXTY3OURIBU4YFJO47E4XQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGSJGRHTG5LXTY3OURIBU4YFJO47E4XQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/17/2024 04:34, potturu venkata prasad wrote:
> Hi,
> 
> On 12/17/24 15:52, ... wrote:
>> the patch that has already been added to the kernel breaks the work of 
>> acp6x and the microphone no longer works, so far I am looking for the 
>> reason in this person's code, but it is obvious that this patch breaks 
>> the work of acp6x.
> We have tested this patch at our end, it's working fine.
> Could you please share the dev_dbg logs.
> 
> With this patch if ACPI method read failure then jump to check dmi 
> entry, if dmi entries also not found then driver won't register sound 
> card it will return -ENODEV.
> 
> Could you please share more details on this issue.
> 

Do you perhaps have microphone disabled in your BIOS?

I think it would be really helpful to open a kernel bugzilla and attach 
the output of the following:

1) acpidump > acpidump.bin
(attach acpidump.bin)

2) dmesg > dmesg.txt
(attach dmesg.txt)

3) dmidecode > dmidecode.txt
(attach dmidecode.txt)
