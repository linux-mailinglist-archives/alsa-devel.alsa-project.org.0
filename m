Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD5950422
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 13:49:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B9EE2342;
	Tue, 13 Aug 2024 13:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B9EE2342
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723549795;
	bh=ydZH0vv0cdMKBWTFOVgfra/dkByRh8/lJw6FaMAIB+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V6L6AWS7mfdV34wiExwcOc65CfTF0TTPYu7S9CHUxY3N3xk6yusdfvbrGoySYLDPL
	 1EN/HFu+1cJLWWW0fdHJbOHBfQmqd1w/5vWZKikAYxKKj8AmXsizbmBiIgFqFj/KdQ
	 Dt/wvbxxrZiFqZyTXauTIFLn4drJD6P1ZHCbmiZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58522F805AD; Tue, 13 Aug 2024 13:49:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FD28F805AC;
	Tue, 13 Aug 2024 13:49:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A8EF80423; Tue, 13 Aug 2024 13:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 114BAF8016E;
	Tue, 13 Aug 2024 13:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 114BAF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oNJmBVbQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=So3xaeGTZEE6XoPIymiSqtIJ/fq+2VCRqPGx5O+7blBRcr8feZD2n3VraBla2eNVFuDfKOWV5PFp8mzcoD2MMcSMYJb9GvmboLrq7rUvYXh1bd95ecwsaQQmZYQnw7hFL7PNjuNvxEg8+bL3BkI0Hb/s4jhD8o4Md4u3f9f9Z+EXOb6Giv6CrQd/KodXp8mg2Jr12TiPUF+0/2Ukc4inR/Sn0O85sveZR96T0VQxpzzZBgUcaFM17pHXn8yMblvgDZrj179rdp4giPopo8+U8U4oaQ8qfuXG4G+H+3EHxmY4K6lAr4B6kc0Nt+qIqLYhcsuWwYGMM0Be7oheBb4hcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yClQKGRVnY4id6CROoivBgMOYFvzz2jj3rUpTbJhjfY=;
 b=O8potbgo120nHVDJDvEAyc9HZkbRMBuZP48I7y9OrYILU8GsOASaACBbIOAcNmNoBGqNX1FFc5t30LRyMJOZKaCDwmjypsSJhGA4E3cPHdQnA3Vhpjt2x5EJENC34v3iyEEKGVtbj/W2oaKQAECuMHUU/zEkdtLvgIT86N3gAuYQUXPbgyin4ZYOfuIkJxzSeJskYi+BI3MdV+7AI5lLLxloZ24OmP8h1XNc6XOtos094LC9RmgikdByrlXXa5plwqdVCAlniQegfDGXH59wwTXbWhBVBtIlxE9a9rgorgXORjqfnre+MDG46REqkVU/YF8reZWm1oYCBxqrOf5bSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yClQKGRVnY4id6CROoivBgMOYFvzz2jj3rUpTbJhjfY=;
 b=oNJmBVbQua2U1cjLuh/XLdGPrtpYPzAX/uUBIEaWJcob1ElPDxdaiPQYCbTc5FpLFfe0qHhvSmSMossNo7BQEDcoPBfTwU0B41Gfv++DRiNt/FHKqp2zTtXnesxE2MU+a+opMuMYKnMx83krBR9nHyZJxqoJXMMoeNW4kCCi+2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 11:46:35 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 11:46:35 +0000
Message-ID: <0e8afd21-60f8-4a8a-aaa6-e148d4571908@amd.com>
Date: Tue, 13 Aug 2024 17:16:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] ASoC: SOF: amd: move iram-dram fence register
 programming sequence
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20240813105944.3126903-1-Vijendar.Mukunda@amd.com>
 <ac7efdcd-cc79-4984-8b36-50898243afa5@web.de>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ac7efdcd-cc79-4984-8b36-50898243afa5@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN1PEPF000067F7.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::2e) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f70f0f-b1a7-4b40-b400-08dcbb8d9551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2t5Vk1LcEZySXllWjRCeDNpSG9ITzdEZnpsazBpRDltSkdtRHhTYnBSczI0?=
 =?utf-8?B?cklTcFpubmVoN3RYNCs4a0ViQWhaY1VITTJEQUk2ME1DNzJ3cUVGTmZCb3pu?=
 =?utf-8?B?Y054bTNPaFNCWDIwa1d6UWtmYXdwT1dPa2doVWY2MWNkOHdvSDN4WlR3TElD?=
 =?utf-8?B?Y1B1UUFJTFU1TzJUUHhSWkp0RUZCOEFOb0R6dmRpRkVPMVp5Njl4U1k3cHFs?=
 =?utf-8?B?K1IwOHF6ejdWT1hjaXFBSUc0aVRSMEowLzR6VWxMNW56RGpSQnZ6bGhCSEVl?=
 =?utf-8?B?enBOTjlBZmNudHc3TnBIb2NIZkcvRFlWaUZYbnR6U3JYV1ovbXI2Q21DWFM0?=
 =?utf-8?B?RjE4RVc3S1U5QmNzemRvRCtGcU1qS1VtQnZnay9ydVVVOXEzSjRwcUJNbzVq?=
 =?utf-8?B?MEYzdGMvQm1Jby9kazQwTzFYeUIwUkpoYnpFa1VsWUtWcStCS2VPTHFzWU1I?=
 =?utf-8?B?Vi9WMCtzTTNRSHhLbHJVYXR0bXp2bDVlZGp0S1lGODNNL1ZORDBjMDNBdndz?=
 =?utf-8?B?R1UvbC9wdUpQOEo3ZlRBV0E5R1JPanNxL2Z4MGp5b2pBZGdSUFJZVTZzSmF2?=
 =?utf-8?B?cGxtMkJFdGxVT0lhZ3lpcThObTNadzBXTUxmbkFURUpiRHZ3SldIYUZ5aTc2?=
 =?utf-8?B?WlNjcnBJSWx1VmJhY0ZrQndkSzFPejRvVy9QUDhxc0FFY0N5dXUvSlpEYlFy?=
 =?utf-8?B?ckQ1SGdmSFV1YjJtTXBlcDhTQlRPVkliREVqUFBHRXNJQ3dBSDhmVjRiMHpW?=
 =?utf-8?B?VmlhY2EwTzZqWWMwbmQxS0JjZ3B4cmFlTmRpb2R5M1NyVklpVFN1V3pKZmdq?=
 =?utf-8?B?elhpR3AzdjkxeWlhUjNCY3FHQ2s3U0grSyt4eDlJZXZPeE1DRHF3RjYzZ3F5?=
 =?utf-8?B?UDBmMU80aVF4cEkrRGd5YVhiRmlDL0g1TDBxRnZCbzJZbWVEeDU3dVM1dFdT?=
 =?utf-8?B?TTdKUmRUWlN1VFRjSUJIeE5mY2kxSmVmY2JCMEdZY2ZWRzNMZmZWL2Z4Ny9p?=
 =?utf-8?B?RVVlZkZYcmEzNlFzTTBmekZCQkYwa3VHWnFCT2VrQVZnbEIrYjA1YURrd1pv?=
 =?utf-8?B?dDIvYStNRjNiYyt5LzhYcjNvRDQ0SStNU2h0cy9vTW5tZTFJbEtNT0NPRm0x?=
 =?utf-8?B?dW8zTyt5NG5GMXUrS2o4Y3dHc2hhY3o2WWlQV3o4YXZaTzRTZCtxWVhicHlG?=
 =?utf-8?B?Uy91THQ5SzRLRm9vZ0hXOWlUdEhQVTNwUHBXTjc1R1VtaDJIZVVUY01sM3hP?=
 =?utf-8?B?dHZqUFJmZ3d1NXpTZUo1b2p6NWtNeHhZdjV5WTJmUTlBcG5nMElRQWxpTDdC?=
 =?utf-8?B?elhvWDFYU05pRjl6ZkNZWFpDL1hJRitsTllRTkFoZXJuZUprVW96TnVnVG9V?=
 =?utf-8?B?WFpaaldYKzdwYnNiaVgwcGV6MEphNVIwc2tDRXJ2dlVnc05mWWlpZjZlR1VN?=
 =?utf-8?B?WkFxbmxKd241c2ZvbEVpUTlhdGttbTFCZDIwd0ZvY0d1WTk0Und6di9wQTQ4?=
 =?utf-8?B?cEdTcXJZeEx5NTJvbmRYUkFvQnR3OXZvUG1PcXdiSnBJN0VlazVTWUdjd0NF?=
 =?utf-8?B?UmdnYTlDc2ltaWRoYlVodEtPcEZlWkEvVVV1bXYvdzBwdE9LaDMrVXg3enIy?=
 =?utf-8?B?MTlpeUNqZ01xb1ovMVRGd1I4cFNabUFuZzBuaTJCaFd2RGlxWW5yYStxOWJI?=
 =?utf-8?B?b2pJYVV6S0tRYnMxeHpHdnBzdjk2QW4rM2xWN0R6V2V5aUhEUlZ0Nis1eXcw?=
 =?utf-8?B?QTBYSTlieXhSeG40VnM5ajFwRUtKYldTTzh0eURrK2U0bTAxY3NkdWdzYW1R?=
 =?utf-8?B?UUNxbUdGUVIzWkwrTXByUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VWY1bDJhVjBOSmUwSGgyYmxpUFQwbXR6NkFENVZ4NE5TcW8vYzBUUDd6RXdu?=
 =?utf-8?B?b241eFpaNFhQcTc3ajlTb0tnTlhadUNGQmNrdWtUdEVaRGR2RTJrd1Z1OEJ4?=
 =?utf-8?B?bm82RVpIelVnTmZFMkJhLzRETmUyWUM2SzVjU2JWQ3d4RTNZdHdGMnF4d2JM?=
 =?utf-8?B?K0dPM01XcFlzVjArOFg4SmQ3T3Q4MHJnSVczb2wyVVhkU2hKYWhDZG53V2JD?=
 =?utf-8?B?a1diYkZpcVdmTHRQK1FyVGg0dno2VStjYjVJQmlmaGh3RXgwam92K01xbmJJ?=
 =?utf-8?B?eHAraWUwSXhkQldYaThOaExnRTZZeGo0THcreEJMVGhwTTdSaU9sKzB4eWhh?=
 =?utf-8?B?M25memhyVlF5bGEzV3Fyb080WU9EdytEdUJGcTU3ekxrM1BGQ1V3NmJMeFl2?=
 =?utf-8?B?WjY1emM3b0wzVmRkcFpCUGtlVFBmSmlVODM0V2lnK05ETDVRZVZ4dWpDNm9k?=
 =?utf-8?B?NW1zWThuVDVyeXZSL3pQOCtCRHJ1MUFoeHBsYTFsVmtLTzJoM2NSZS9MR2Y2?=
 =?utf-8?B?NHRZNFJINkdmT1BMUEduVU9TNEIxNFZhVkpYZVpOalMvZ1g2TE1WQXVlY2R3?=
 =?utf-8?B?Y2FvT3F1RVBIaG1ZOVduV1RqdFJIRy9iVXZzN3JUTk9QV25YYkVLNm4rU1dQ?=
 =?utf-8?B?Rk1yWUx5SWhpd3VuNFFTOFRXUmdzRGRUMSt5ZW1zL0Nld1NuMys5dkJSNjRx?=
 =?utf-8?B?c3BpZFc4THFPRkJQaDdJNFBrWnEzWmV0bEx1MjJtZ0l0YjdIVDNuNDJraGRV?=
 =?utf-8?B?Y0JGKzE5WFhKb3F3S0crUXhaNzY4U0pNVTQwMHhYekkvSHUvVngySHkrNmpT?=
 =?utf-8?B?UkZvbXFNUUJZS1RkQndIK2VzUW53VTdTQVlIdHc3S3NNWkQwRWd1ZnQ1cDRB?=
 =?utf-8?B?cWpxTVM3OEpYajNnY05POWtZdjNCdE5hV0FLSXd5VnlHSlEydmxLV1crL3ky?=
 =?utf-8?B?ekxBMjE5R2h3UWZWU01wQkhPd1NYM1FnS2ZuazRzQnBsb0pMSHk2WG4yNGI0?=
 =?utf-8?B?VnRZYW1QM0lBNTBMRXpTVnNjdVN5amNpOUdOQjJONWlVQ2h6TzdKV2RyQ0Jw?=
 =?utf-8?B?dUlYRGhOcG54NWJDVVdiTG5WL05XQms1L2crWmt6SEJaaUhOZEo1bEVTOHJ0?=
 =?utf-8?B?aGFsRi9TR09CanpwUWtmSEQyYmtGZm1Sblc3NTFhSHVWUWh3TkhkOWpFVEt5?=
 =?utf-8?B?K1k0OG8xNzBTOTh0UStzKzJ1a0dmZDI1UFJTZjh1ZkFra1dsUDdCenkraXlR?=
 =?utf-8?B?cnB2OC9ONExEN1hkWjYybGJaVkhvdlRKNlZ0RzBMMkNHMU90cGl6QXM2Nkww?=
 =?utf-8?B?SndLckNJTXk3ei9VemdCcU9Tbm91MENoaWowVHozdWhBTDR0NzRIZ01DL201?=
 =?utf-8?B?ZWtIbjBUcjB5RkVORWtQd21GS3R5UVNaOU1pMnNkWTNiNGVEa3FveUFkMW1J?=
 =?utf-8?B?KytEY282TDRUak95L3hUVTZ4SmVjUFFjSkRBbkpCVzcyUVFBWTE3MnNLUitL?=
 =?utf-8?B?NjYzZ001c0p5OGI5OEJtSWhhTXVoMDdrcHN4dWE4SmZVVVlTM0J6ZnZ5Umdu?=
 =?utf-8?B?L2xkcGxBTitvZUd1cDMwZWxMOWVvVDlTa2p1c21VbU93VitUVW5GQzlvRk8z?=
 =?utf-8?B?cGN5aXc0NzJrU1ZKMjFHZHVUWjRxd2ZJUUtOYVk1Y0NTNXdVOUhEbjdUWjA1?=
 =?utf-8?B?L0NFM0xmM0lEZVhENGRLSE9yenMxQlh1YjZnbytkNUNZSnJGaTRudFp6Z0VR?=
 =?utf-8?B?M1NPTU9sSGoyaGFjdmVROUljQ2k0b3hzb1NOT2U1UnVSbC9LRTJ5RFZ0Q3hB?=
 =?utf-8?B?eFA1dzZ1Mm5JYnNLZ0ZjUUpCZ0Q5bHhhRDZtQStqOHF2cmplYmM1VWl2cXEv?=
 =?utf-8?B?SVU5TXI3ZmxjL0hKa054MDJYWHhIYnkvWWd6V3BTd1VBZVdpMlI3TUFsc25E?=
 =?utf-8?B?TFNqSlgvc1plOE9CeEhUZ29POFFmWjBBckhnNWg0ZDRzdzFXMmpDVG5PM2Fj?=
 =?utf-8?B?c0gxVE5WaDdCekdZZ0lQTlRiVkxITjQ1ajhQWERIZHFjSEZhdFZFSXlYMXRQ?=
 =?utf-8?B?TXZrN3VtREJISzZ5SVBSdUxyaDRSUUhSbjU0ZDN2dXpmUS8zbXA0VWN3bDlC?=
 =?utf-8?Q?hi2cNWNlMvarYB7oLhHI8L98e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0f70f0f-b1a7-4b40-b400-08dcbb8d9551
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 11:46:35.3345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 F/9E2QVWZbzHcEYIF56afgXlUmC/WI4FU5+Xum2FuJc/9iZT0uf6Vmav5dcegJkoRe9Z3sIfXBL7551V2byPNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
Message-ID-Hash: AFNZZZ5TT3QW7BSYRSJRZXTIEXHAFWDT
X-Message-ID-Hash: AFNZZZ5TT3QW7BSYRSJRZXTIEXHAFWDT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AFNZZZ5TT3QW7BSYRSJRZXTIEXHAFWDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/08/24 17:05, Markus Elfring wrote:
>> The existing code modifies IRAM and DRAM size after sha dma start …
>                                                       SHA DMA?
>
>
> …
>> sha dma failure …
>   SHA DMA?
I think above one seems to be okay.
>
>> IRAM size. To fix this issue, Move the iram-dram fence register sequence
>
>              Thus move the IRAM-DRAM …?
 I think above one seems to be okay.
>
>
> How do you think about to offer cover letters for patch series?
 As these are individual fixes, I don't think a cover letter should
be included in the patch series.
>
> Regards,
> Markus

