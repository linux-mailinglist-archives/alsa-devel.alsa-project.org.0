Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D094FFFF
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 10:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 535B72341;
	Tue, 13 Aug 2024 10:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 535B72341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723538338;
	bh=OVzTNhXC+YRYq2PTLE57YV85aIyqePAdfDkWsAXUKGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WqYkYG20wdYaQoch2/I/AM+2JV+jP+mWPSPY9TB/GTjMnIhJP7ycwP+7crUWlETjW
	 9f0KVGwCa5ZP1KNGxuFVxG/taDQSwIm5Owy0mhCCmbD7gZASXMHsnCjeRZ/k87Gts9
	 HBRCL1lZOJvaq6uxwqbc+Xgfd2iTcV7AW6CG5rnk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18E83F805BE; Tue, 13 Aug 2024 10:38:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69FEEF805B5;
	Tue, 13 Aug 2024 10:38:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F3F7F80423; Tue, 13 Aug 2024 10:32:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7290EF800B0;
	Tue, 13 Aug 2024 10:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7290EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=j4w2y/nP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFI/jeI+Qk/Gsx4BkqwLiVtuBx2oMZDDRnJPekKzZzzG7MZfWJxqB2mZGhwal26r2CUKvxtuBgJGrXo1CtP7vIT+5E2RhrJgggb2LzTQof7d/DsoiMNOh+erh6q7MHfIHS8s4kRonse3tYuqa4wrn7XxUG6DoYLVOWEooFuTaVNRjM/MIBAEdtQZgwP8LxEGwGG5ggGQgS8064NYzW13NGK8AizV7J5TnGAYvqrl5qoRu/WRxNkfLJ01OPpcOBnqK+3OlVxLJSsYYQEGHX0Fy3+3r7jHYO/j6rnwIeW6XxRkoQbOCbGmTmF3MBQNw52406DYAefZ3AUwT5jMJ3sg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVzTNhXC+YRYq2PTLE57YV85aIyqePAdfDkWsAXUKGU=;
 b=B7BZ/up96UMyVEKHNJBr979nR2YWwCnDvZ1tKFds6XfGhtWzREX2eHo/OBYFPZJK/VJBKG7DpRbn5iLkxmNxNN5koZN0Om4BMRGQvIeCB6/6En4bcCpb8j9Peid+g1+ypEgmUBhAQ6RchrFv9+pG/K1S936mBVMaLZhyB5MG88+Ctc/dJuYv9x0pPln6hgtkEbWOVLnTnQFX2i1bEikwJzxTizQgPgcuW2kpzJ/7WlN9IS7rwdVOhDCEaAXWQjwSdi9lRqUp2nUCKl+a+UwJaiAM5pWk8pH4i+7Nb57LQPBlfGUpu9nvsp/NDBgHDuGuRIPBcGDp5fb+p+buMVUMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVzTNhXC+YRYq2PTLE57YV85aIyqePAdfDkWsAXUKGU=;
 b=j4w2y/nPMkHo43zVzoe4ofZ9kEzZFfJY/nC2O4xVC3Q7pRBgn8WvM50TuTRNxQGBksbcd3Eihy+U/V5GFShdw068tldstME3MTUCdD+H63D5/7g/RPT07bWr88xyGzyx/K7yTXYyCmIeCmoBPEHmParEhB/D2kDcZ+i7vQdxSUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MN0PR12MB6126.namprd12.prod.outlook.com (2603:10b6:208:3c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 08:32:06 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 08:32:06 +0000
Message-ID: <f9847cc2-7109-444c-a609-d02c82c99880@amd.com>
Date: Tue, 13 Aug 2024 14:01:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: SOF: amd: move iram-dram fence register
 programming sequence
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
References: <20240812110514.2683056-1-Vijendar.Mukunda@amd.com>
 <f76c7f8e-f4e7-4ac6-87e1-1ba9b2b19a82@web.de>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <f76c7f8e-f4e7-4ac6-87e1-1ba9b2b19a82@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::14) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MN0PR12MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 411a82d1-3b50-4e9d-b06c-08dcbb726a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S0gyOUkvWEI5NVAzNGRwcTgyOWNsRmtRaTdSSC9qL1JBNkNDc0ZyaWhxVkJ6?=
 =?utf-8?B?dWNmc3BLQ3F3ZlFyeHQ0R0ZWaUg3NDY5T1U0VktRQWZzVGdzY0Vxb09tMVJI?=
 =?utf-8?B?OWdtbzNoYUdKWDlRMmRaNXBQZjNDMGdSdEZHNW1xQ3gxckVYN1p1TXdYWkdn?=
 =?utf-8?B?aGUzV3BMZFpxYWhBNUJjNGNic0k0T2xDZGdGcDRDalNzK3RMekt5LzFRODFi?=
 =?utf-8?B?NVlON1dST3E4RUpleDNIUitEMHRzQmF2M0d2a1Ezd2gyT1M5eXZxZ051Mlls?=
 =?utf-8?B?MktNQ2Qwdm1PYXM1SjdSNFdPM2VmZFRmbDJodDFQclRDblgzR0tIaHN2WDVI?=
 =?utf-8?B?eld0L1NJQTRqalZDcmMyS3lsK0ZpdFRZRVpxcThVWks3RDFSOEJydWtleXFL?=
 =?utf-8?B?TE8wMVZ5OW9SbVoyR0ZqVkhsN0NOK3VNaHNxdXdQOGp6cWxYYWN6MC8raFQ3?=
 =?utf-8?B?S3F1U2VVVk9TTHBqb25BMDhaQitKMERBb0FiTXNpVHBiSytQTjdOZW9IbS9y?=
 =?utf-8?B?S3R1Tk5JUFpEUkpqanZnWXJsZ0tSOGlOMGdDQm5vR0tlcTFnbkxYdThjN0Rn?=
 =?utf-8?B?b1lXVnVaWWc0THBEUzI1d0JwWWNtUWtLclRDaFdxM0V6WXhReStjWERTTEk1?=
 =?utf-8?B?NzlJcVNvSUtqcjRpZ1owSUtxd2VFVm12UmRyeGVnKy9nSzZ1RkJFUmF6bjAz?=
 =?utf-8?B?QlJLWGxXY0Y5WnNpc2x2eGhVK0VVUElacW9EQU50MG10VXdYVjdLMFA1dFdP?=
 =?utf-8?B?VUloYlFHNnQ1SWM2VGtmTUNoeHcyNmE5RHVYRGRTV0dyV2Y4RGdqR01ScEdt?=
 =?utf-8?B?aDVKbWg3L21ZMk1VNEQxK0liKzVvTkRNS2duUnc5bHhoTW90SUdtNGNtbUJC?=
 =?utf-8?B?TWpaYjZIMXZiNFFQdW9TUXNLajhyc3RoZ2t3ckRxWG93Z3NYNE1sSm9PNm1w?=
 =?utf-8?B?QkJpdnlUVmNXWWQ5azN0N2NQSjNkTEV6Y05jdmpZcWxRT0VVczRFcGZlU1Jx?=
 =?utf-8?B?dHZlT1I5Vi9UenlyeGlQSW9ubThzanB3S1VmOWtBeUkyUGJxenBVOGRUYmsz?=
 =?utf-8?B?eThUbjBySG51dzVoUE9uMEdaSXRpMStlRmFxc0hPZGZaTUpvdmo0cVpua25I?=
 =?utf-8?B?VHplQ1VFeVVjTGdhbXpybHFpa3ZxL21JZWlQZTRtZ3VCRlQzQkliSFp0R3RS?=
 =?utf-8?B?OTBCMlprWENXa2xKaFdETGF1ZlhvNENnanVkczFMZU5ZR1dTcWxsNzlOSUpL?=
 =?utf-8?B?OUYvSFVUN2ZJL2lmQ29Qd1J2Vm1BcWgwVWJvR2Q4eitnaklhZlFPVWFjZ3FB?=
 =?utf-8?B?bmZXODI5ZFFyeWl4UE1VMy9FZHNyZFpyblcybjFURWxEclA4ZzRuVWhzdjdE?=
 =?utf-8?B?Z0tTcWRlOUNsNUdFMDNBQXRuL3FNTlhRSGN3TlUyd0VUNGowWWtXTThYTER6?=
 =?utf-8?B?bTRydlBmTFFJUjZ5OWJmS3FoQkx4TkVJOUc1UFdJc25oZisxRXlBOGpvRVdS?=
 =?utf-8?B?eXdSelJYZkV0eWJuUHVnOEFGQy9Baml1VnpSUXhIV1FWR1ZCc1dvVVZwRS9i?=
 =?utf-8?B?TlEzd0IrZXNxTG1XK3hKdlgzelQwQnpPSktjb0JUMndvZ2xBOEUxT2U5ZHE2?=
 =?utf-8?B?Y2RxYnBXaUhDUkhUZ1pIa1FjUjFjbDNSNUdNYTdMdnVCcEpsYXFaWWFYR2Zp?=
 =?utf-8?B?SEJqamN5SFJ5N1M2NlBxS2RNRnVVSGdqUnpIMHJWakFoRUluZmtrYWRMcWNv?=
 =?utf-8?Q?dp+CGgE+b2P4iXDujo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZkR3eWY1eURCdHhjU0MxL0R5K3NNQ1RMM3lWK3NaSU9sRVY4eDZUWjh4LzRO?=
 =?utf-8?B?cGZ5TEEzTE14TUtTRGRxWXRBQ0U4WlF3WHhrT3VXd0lDRWpLc0w4bVVWV0wv?=
 =?utf-8?B?WGh2RFJYZExvZlp6cVF5ZFl0VGVzMjRIdjBVREl5MEQ3bTdraHQxOS9EY1ZL?=
 =?utf-8?B?cDVPRjRBZVgxc1FhWTR5SCtFemsxUUp5dlV4VTYvQXhxb0p2Vkx4RlJwRWQy?=
 =?utf-8?B?c2o2eVh3QzMrS2w4aC9zWkhaY0hlWCt6bVJmZ1NITGlJdkFiUGk3VDlCcnBC?=
 =?utf-8?B?MG5CWFRjRFEwM1U4eURpSHRsNXVzQWloY21EQ1IrL2ZsdXYxdmsyV1Job0dT?=
 =?utf-8?B?RFl0NnJYM0tSSGRTN2Q5d1Q2NXZjT1k4UXhVK3VtaU9KU2pmM09HY2VWSGFR?=
 =?utf-8?B?MVBtRjVDKy8wazhqbnpYaVg5bUUrb215TWVaalIyOWhwQ1RhNEdYWUtoWEtl?=
 =?utf-8?B?c21Fc2VFZVdPVldSWGk5YmhYVGhOV1cvbkxjL0tqWStnVUlwTElsdVl5ai9M?=
 =?utf-8?B?b0JpSnVqSFFGcGRaTUpFQnF5MzdUZGJ2U0dCbHhabmV3ZXRucUFqODNBYUY0?=
 =?utf-8?B?cUszVStvRXVTaXZRZ2xtZHJsWTFsVnp0UDdScDdkUmZLZ3czUnZNVFI2cXpZ?=
 =?utf-8?B?OThCYWVlT3dCb2VIN0l2NTZQTHBRbnhDay9OR2hNZjc1bWRlMmlRYzZHcGNk?=
 =?utf-8?B?emRDTnRndmhGY3lPTEg3L1VzcHVjUFdtTStuZVJOMTVVKzZYYm41bkgveGJn?=
 =?utf-8?B?ZGxRdXM0TmVINDBuWCtqYnRQWVhsN1RtZ0l3Y2hicU5zTnR1OUI1Y3QrT2Ez?=
 =?utf-8?B?L2txMTZpS3dZR0pwODQ5QkVENS93bGo2VVdvZ2NMbkVPSEZwamxpN21jM3VO?=
 =?utf-8?B?RjU4Y0tRWmhEd3FzTzkxeW5PN2FrWEViY0RRVTd2cU4ra1lyeDRsM1V5ck1O?=
 =?utf-8?B?Tk81NkQvK2J4dHFpTFhVWmNBWmJjVXJHVDQrVGdKQmF1U2ltczlFakMvS0hw?=
 =?utf-8?B?cXlPNFBrd1JzcG9zcGt6ckRUb05TRmpKNk5sZXZGdHYzSGhnNXNyNm9xeXZ2?=
 =?utf-8?B?M1hQUWhEY01BbWZnMXJOV2Q1eWRhWUpYNzcyMVE4dndSeEg4cHM4dDdjY0lI?=
 =?utf-8?B?N3FvaTk5em1Kc1NLYTdNWWVyalNBY2lEM1l3SlVIeW9lVHg5WVhLcHM4TzBx?=
 =?utf-8?B?Mnh2eWVZOFZTMmpQbFdZUllieWVUMFRWZDNML1pWN1duS1FNcTM4N3ZsL0hi?=
 =?utf-8?B?dEpYd28wc0U2SDNHenE0a2NKU0ZwWHpSS1VEV0VwQkEzWEhPNGxQbUZnMDNQ?=
 =?utf-8?B?eUhWZVVsaSsrN2h3VkF0R1hPdm8vQkM1MktXTndnQlRGd0l5Si9mOEdIMm5r?=
 =?utf-8?B?Qlc0cG5xaG5xMFZFRFcvNUU5VGpoOVhDa3M5RksvdHU2c1YrN05QdG1mUVpw?=
 =?utf-8?B?YU5HQW1UeUpYMUV6NDMwbGlJdEYxbHBxZFdEUjVvV0FDb2RHUStCbkNzclk4?=
 =?utf-8?B?T0FwY2M1N2JNemxxcWRQNm9qTjhlSmYxWE5vaXhvQlFqYmlGNkk1a3hLdVVq?=
 =?utf-8?B?MkEwQUk4VHk5WTVwdjdwTlpjVFVyeWgxWlJSV0tvZzl4UkNvSlA0NHVmM2Z0?=
 =?utf-8?B?UStZcVhYV055YURTTjUveWRwakpvTmFKTUUyQXRMa25EWkQ2Vko1MXVNQ1FC?=
 =?utf-8?B?aTZ6YUdyeHQ2RFdXTThOR3pBRDc1ZFB1OTBqTEI5TWQ2MFlXL29OQmpDa2Zj?=
 =?utf-8?B?VlVIb0kyTUdZa0ZLNGM2RE5WdlIzRUNMWjR4Z2xWWnVNM0tuTFhKYUNZblZx?=
 =?utf-8?B?alNtNlNmZmxhSXRUUlcxQmlPZTM0aXNPS1pUUE1kNkxPMi84VkpNZmgwdm5B?=
 =?utf-8?B?dXRrUUtnMDBBT0JUUmNkV0R5SmRlcXJJMzAydkNzMU1OV3hmeWNoYjhOT0R0?=
 =?utf-8?B?dExIMnNlUzdWWWhwNTFFVXhWekx6QnJlMjBrcExseGhnOWFoNXJWeThlTXRx?=
 =?utf-8?B?K3BwTDhEVURwcTM2bSs2RnR0bkoyS2c0Z21CNW9KQnhjWDJCaUxURW1CVHJY?=
 =?utf-8?B?ZEtpU1BOUTc4L1V4NmVQd3VZVUkzd25na1k2K0RFbWMrdmJMd2ovbE90aTFq?=
 =?utf-8?Q?CSCoe9JCDdBXI7rhHzlgW+ArT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 411a82d1-3b50-4e9d-b06c-08dcbb726a01
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 08:32:06.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ce3fL6QsKrjjjiWzbkJPjOPszI+zXVgYMzCSOwJhLa2eftJKelovNBcvvmXmuzLw8fbH6R5JhPi6LV/NA6mqVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6126
Message-ID-Hash: N5I7HDFZVKX6EZQUER5JIV7VNQGDHJ4R
X-Message-ID-Hash: N5I7HDFZVKX6EZQUER5JIV7VNQGDHJ4R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5I7HDFZVKX6EZQUER5JIV7VNQGDHJ4R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/08/24 13:45, Markus Elfring wrote:
> …
>> before triggering SHA dma. This ensures that IRAM size will programmed
>> correctly before initiaing SHA dma.
> Please improve such a change description with an imperative wording.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.11-rc2#n94
>
> Please avoid typos accordingly.
Will rephrase the commit message.
>
> Regards,
> Markus

