Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE6A33E91
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2025 12:59:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6FA60235;
	Thu, 13 Feb 2025 12:58:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6FA60235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739447939;
	bh=4H3S8l0csqVIG+MiTWEuXHT9x7d77ETMBL/U6kTdeXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZFSXidXYLrvEObgbM9OEWiwEnJDj3NA3iZVpJWmaJjuQmK2plr/XGYkl3qbVejWER
	 cUxEbB+SeuUtU0hD7Nj1/aIfiNn3ve8j7mwl0aerPRW8hUBUWFfFmzzmV+x2Auit7k
	 zQo1bZtCET7vZMOEZgCe6fW5jGshTN+hYl+PE708=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E8E1F805BD; Thu, 13 Feb 2025 12:58:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03317F805AE;
	Thu, 13 Feb 2025 12:58:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F568F80269; Thu, 13 Feb 2025 12:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0497F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2025 12:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0497F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AWjz2zvM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjU3rHQxZ+1waTZwOlrm4v+t3wc8WTV1jA+PEc0PnKzqhBMW//9j+mfLOKQv3TDlWoMVKhfLnXlJptAsIjClrJ0RlaoEjocyA+TUptrOEeykyuC/K2QBSzTflto4qO9fbHRrspYF2jMOwzB6dGrejsVirb2MIa3M/BYu7RlNm+F5i3JchhW6r+2g7KlfcCDe52cK99a+QKfwpa1YLv1FOKrbrWRDoKlJIsqJ3+p5AKI7c0H/KBReT/RQ2Qma+D5e/cyh3DRVy9mj/qXhwhVRNDSvYK/ecFatWdBkxAvCNO88TEg/GYdAW9G7TK6HjwcCvwdLKiNJJOxSBQTAIkklXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5ZSmzDlFmQCH8BH6QllUvFD+plY4qOhGItVy+9IEuY=;
 b=Bkgf168cSN4ORnuef4vFzVQQc1EFfy/XwJ/M0KnbbLCY1UdNMzqM8Uy9W1usPkajWG7QHCR+RTeAxqTJMJltvBpWGAUGGldp1Q/p4CHK0GOeevJ9H0snjT/KVaFIoDF3XVi6PInEomSL8pXgRNj8VeqHZK5rVqyPxRMWmhNuTwWlp/4VspW2s5wS8robGLKkgCZU7eqDpqQZuwiq6wR22f5UmCKmy8HzqkMwEEpWR6MY3t9RDlY0CjwTPvI7TzOXbtXB2MYezp9R104PNseqMNI70XVeFWiweMNz5AAR8eDdEeegLMCk47MDY77yr6FTbpa/G49Nhx1jctJX4AZZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5ZSmzDlFmQCH8BH6QllUvFD+plY4qOhGItVy+9IEuY=;
 b=AWjz2zvMiG0C0zHeH21FwSWIQDGVEME4Ojpe+Ghl7sSluR8AgpEP5/QBl82Wd25AKXKyx4iQy65br5t/2gVXh7vN8afIgK3NGDRm8pZ1AUbpPtgACNz3Z6WJIZXX11+vUwy8PyZqxer1RhjS3EtBoYHC82Tjb1uqUaHFan2ugEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DS7PR12MB5911.namprd12.prod.outlook.com (2603:10b6:8:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 11:58:10 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:58:10 +0000
Message-ID: <d15ab61b-2656-4c5d-be8a-9e070dfc2b99@amd.com>
Date: Thu, 13 Feb 2025 17:28:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 0/6] soundwire: amd: code improvements and new platform
 support
Content-Language: en-US
To: vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, sanyog.r.kale@intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::23) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DS7PR12MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fff2d6-33fa-4702-7d15-08dd4c25af5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dTJEWTFjY00yUEYyYnRoR0pGeS8wZmhzQnZ5MEllK0VFRVJlaVhuRHVyUjNv?=
 =?utf-8?B?RFRkR1gwNWRKMkZaZlRPSUZwTnZIbHlGNFpNbDNsOXR3MzYvcXJpM1dLdUhJ?=
 =?utf-8?B?VUhHZFJ4OUtuQXVNc1A5MzMxZUFxMzkrSGU2UUtYSzUwTUVoUWg1Wk9mU3h0?=
 =?utf-8?B?UFBmaGk4WmdiSVZPSUl3VXg3c293Mi8vaThVckNraEZsSUlpQTcvWCtuSGZo?=
 =?utf-8?B?RVhrdVdWazZLUldPN3FMNUxKTHgrblRaaEpBZjJlTm5jd2EvU1daR1E5ZnZN?=
 =?utf-8?B?cG5xV0F4MWF3QjUzdVdvTWRWS0hJMWN0YnM3ajNoYW9rbWVablY2eXhjYUdQ?=
 =?utf-8?B?dmZqcGlnS2lLdHpPcTA5Y2JJQS8vQzVsb3ZpRGZhN1FMWHdDVHpZdGJZMk5O?=
 =?utf-8?B?clZiclQrK0xFdzd1WE9YUHY4QXBxL0NzbnhrbTZsMHduSG1obmJPd2hvNUc3?=
 =?utf-8?B?dDZTVXFWMUZQanh1ZUdhSjQ0cEtxTVhHRDBkc1loZ05RV2VGNHlHeis3VTFx?=
 =?utf-8?B?bHZPcWxXTzVPeStMdTFqTnRjQUJ5UlpnQlcrNEVGMUhieFZ1aFVQa0o0WllQ?=
 =?utf-8?B?U3BoYmpmWE00azNzU0lDaldhN3Q3K1RUcktEYWxUcHpIZ0g5UldQajlLTzdV?=
 =?utf-8?B?ZFN4Ukp2Z3ZTWGkyeGhvbzBwek5BdVVxaHpIVTN2cjlSRUlxbkl4VFl0emxG?=
 =?utf-8?B?VWthYXcwUUZyd1lySVgvRE8yS0xCT3ZVcGp6czBrWUwyQms5MlJ3RGlnZFhm?=
 =?utf-8?B?M1NlMTFzV2o0ZkhXa2dFa2xsRE1ZdWdPL3lxNllueCttTnB4aTdrN1hTcmpl?=
 =?utf-8?B?YmNkQVJPcjdSWkxZTXFnNWx2cms1djBMSjZPQ05GV0FKcUJtYWlaVVRrWld2?=
 =?utf-8?B?NXhrOUlZNEgvQWFGOHJhTk04OEpZV2ZkMHgvKzdmQkxvNDZWQ3VtV3JjR3BC?=
 =?utf-8?B?QkxMMlVoYmZWbnFyTGNLOGFnWXNrMHlzbm9meWl0bEd1eUp2Wlp2R2tqc09J?=
 =?utf-8?B?K2lCTFJ3b2sxZEx6elZta2I2THRwalBwVmpYWEs5RnREWmp2RWZ2cGpsS1Y3?=
 =?utf-8?B?VjlaYnk1dHJMNGFZaW5sdXRzUmhmNmlRWk8zbHlBWVltaDZvSVdVWXFLVjVm?=
 =?utf-8?B?WnZqaEVjNGkzRHVvV0JhVVNxd1BlaC9uSTBLNFZTYlFBTlNmQzZvZWxTbjlD?=
 =?utf-8?B?akYrZFkzNHlVbE9qV2dXK0lGekNNeGRCaXcyVnQrNStwLzJDOFNFSEhNYWxS?=
 =?utf-8?B?U0t1Z3dzSnJ5MXVESThKU1Z1T2ZEMmNSTCtwYmtDcU5TU0g0ZmtOaVpTdjda?=
 =?utf-8?B?N2JjdlhEcHFoeFAwMDRQK1FJVG43UklvKzUyTVRkeHZKS0lWQ2xMYmx5YVJx?=
 =?utf-8?B?N0l2SUVrN2dOMTllUGRmU2xyWlk3RzZEQVNKZHY3bmhCZ1dQekxPYUNhemxQ?=
 =?utf-8?B?ZE1oVjRYekZzN1Bab3BFdDA0NHlqa2ZRb0lrclFmS3N4VmlpQzZKR0JGN3N1?=
 =?utf-8?B?dVVBMFpxSGNGUHJaL0tRaXNjN3VHeUJZQktuWForWERlci9pMlRIN1l6Nk1p?=
 =?utf-8?B?Nm1TYmhyUlowY1llcWFBTXA4MG9sZFFXS0tCTHl1cENIZzBWZ25sYmFubGV2?=
 =?utf-8?B?TTJxcVRqU3BMaU9NaWlHOUVOeldxcERNY21ndGQ1MlBYRHdsdzBEc2ViSDBr?=
 =?utf-8?B?TG9JbWhuaGhhbkJQNlpSclFTdHZrcHNhbm5yMUtET0Rab1Q5YjhISnVLNFV1?=
 =?utf-8?B?cU9ZbENmY0ovaXpvOVIvU0RkM0haV2lIbWxKOVJsTW5hdjJESm9wSWp6VFR1?=
 =?utf-8?B?VjZJVEZsUlo1Zy9QSExmSzQ4dm5SUDQ4OElVYU9GV1Z4OWdKeEZzNVdxR2FB?=
 =?utf-8?Q?m0aAyn/djbxV+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVJTL2FJVnh5Rm9ERHRjQ0tsWFlsYVJwVGplYUZmQkQ1Y3pVbVhBRWs3ekhD?=
 =?utf-8?B?YkZtUDRxSkRXMnEwMUZ4UzIvTlVnZUcvMEErTExmWjl3Z1JpY1RFQlcrbVBr?=
 =?utf-8?B?NXJmM3IwUlNUTGFYTkIxcmlUYUhYRHl6TGRUb3dDZGFBRTZzbEFwVHREc2p0?=
 =?utf-8?B?T0pNNGowSi9hUFFkWUkzbUFFTjYrdEMyOHhmTUw1RCtpSHQ2cDNHNWdCUHAw?=
 =?utf-8?B?MzVkVTdHbkt2OWNpdVV5dEdJQkRXTllhY3BWWGd2N2laeURnMHZCWGFPRzZ4?=
 =?utf-8?B?cEhhSDNxaGFONUczSVo3QlRSSmRicERuaTRCWUtYY3FaMkJjMHhLcHlEL0xt?=
 =?utf-8?B?OHByUWwxZkZwYW5KMDV0b05yZlJ5VjM1dkZRbHVWbHpMaFh2ZDNqMU5yRWhN?=
 =?utf-8?B?WnRMdHpyQlo4VVVKWjRic0xES1cra0kzYXR3M2M2bm9LREU0eXF5VmxwbUVP?=
 =?utf-8?B?N2Z4dk9abmJrQnlTSmREYkZnbTNlbkxVTk9ib25VbmNidmYySFNWaVlyR055?=
 =?utf-8?B?U2lkWUYvK1pxd3RCdjBMbGZXRkNXMVZvQTRzVk4xc0lEbVBzSGpVcjJjWjVx?=
 =?utf-8?B?eXg3OXRlbW14eHhTTngzemxEUzMzamppSTBIeVJ0cmF2dUlGQUZXekJRb2M0?=
 =?utf-8?B?QktIdFlMQkhCN0ZUdU51NkJVV2ZwVmFHNGxBenlmK3dyRjF6NElYMWlmTkNp?=
 =?utf-8?B?TWlBakxvZVkybjZnYVhHMm5oWWpHaE1iby9hcFp5VFlhNkhiTW5xVGNNZHB1?=
 =?utf-8?B?ZTJUNjhpY1RlOHdtMmxvWWpFWjRwTTZNb2ljdXV0eGEzUUlPdjRqS2NmVDBY?=
 =?utf-8?B?czJQVUk4YnB2c3JURDJVam5sbHZ6aXhORTNkTTgyaUZjSlo1aUNBeDdVVmdH?=
 =?utf-8?B?ajY1S2t3ZmhZQmx5TnRMaDRSOWMvaU1CSVRhTjhsclMzZkNXNDJtL0twdmRY?=
 =?utf-8?B?bGVERi9JbEhiVjFlS0ZTemoxRFpRM0Y5Vyswb25RVG1SS2UrZ2VHYUUrUlpF?=
 =?utf-8?B?SUZEbmJDNXY5NE0vM2FSZTlyb3NSd2lsTUF6V21WTnlleXZ5Q2pwQW5UbWVy?=
 =?utf-8?B?c01YRlUwaVZicVdDVEV5bG5PblVUYlhpLzF4TEsxbTBrZVdGYWl3Q3BuUVdC?=
 =?utf-8?B?a3hIVlBZYzNKckJnKzhvYytVdUtQVXNwNGVySHBpQ0VPTkUva05LbktJbG1M?=
 =?utf-8?B?RjFwd053alM3QXhMWlJsQWZQUVFkTXB6SUU1a3FrbFFrNk9qT0ZuOFppckJt?=
 =?utf-8?B?cVJpeVVXeGN3RmhWNGVlOTh6YTRQSVlWSEFRTndGOHZqcko5aEdONnJFVXRO?=
 =?utf-8?B?OXRJT003S0RrTERSZnJCSlNaUGtvb2lNOG1hZ1ZNQVFmSG43bXE2K3lCOHIr?=
 =?utf-8?B?NC9BcTcrUEQ3SnU1RzFyTDVLTEtHaDNmTUJmdjRpUkE3Q2dpZTk5VG9lalVC?=
 =?utf-8?B?eUhXN3FWTjRVYStId3lIWXEva1FCVHp3WVExeGVTdUxnWWM4ZTVzeWc1Yk1V?=
 =?utf-8?B?U1NUWG5BbE80aERNNzF0VzkycENGT1c5TzhJUEhZV3B4OXMrU0VWdVVZWUp4?=
 =?utf-8?B?TXNwUVVaWCtYRkU0V2NZVmQ2TUNWbGRMZWtPTHUrYWZLU3RydUgxZk9zNEFV?=
 =?utf-8?B?OUc3MzRrQ3RiODNXdm1pZkVoVFE4NnQ5WTNOMEJleDZVb1FudGk0VnZHeHdU?=
 =?utf-8?B?dzR2RFpEY2tNMG52RjRZdkJ1cjA4VGMyTHBnMU53aE4yaHZwOVd4TURoSjBW?=
 =?utf-8?B?VHkvOHJ2NUk0K3dITGhoMmhCZy9YcDV5S2lSS3Fmc04xYXRENWtBR2o0RlVG?=
 =?utf-8?B?aG15NStKRGlkQkczZituQlphTEV3SjUrSUNudmRtSkd5eGxnM3o4MUhOUHdi?=
 =?utf-8?B?cFlGcHlQN3hibnFweExlVml0S3E1ZEdoMGM2QzlnTHFkS0ZLcmo3TjRLWXV4?=
 =?utf-8?B?aWo3QWlzb0hOeGNsTW9OTDQxdVhpVUU5REplQmFlRG1JZXJUWVM2YUtiVzI2?=
 =?utf-8?B?NHRwQnpCL2RtRkpORFl5aFJpaWpCRUFCVHY3K3orbTZhbmlUK0tpd3VGUXRC?=
 =?utf-8?B?K1BYeEJZYkdGNHlwSXBCak1JVVhML3FKZXA5NGNZUHAyb0ZQRkdCTkdrNDc4?=
 =?utf-8?Q?kNbDU45WdofXaNNorvu34ZimP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70fff2d6-33fa-4702-7d15-08dd4c25af5d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:58:10.1209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sChWbJmB63q44/l490pqcGkuTqAQtEbY3NmWgOKfIMOOCmxNTol4PxykZdsyh7OtHN9oLrBWHz4HnS072NG2Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5911
Message-ID-Hash: Y4TJIXHQ5F6XZO6FVHO2HMZ5IJ3Z5U5P
X-Message-ID-Hash: Y4TJIXHQ5F6XZO6FVHO2HMZ5IJ3Z5U5P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4TJIXHQ5F6XZO6FVHO2HMZ5IJ3Z5U5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/02/25 12:28, Vijendar Mukunda wrote:
> This patch series consists of code improvements and new platform support
> for ACP7.0 & ACP7.1 platforms.
>
> Changes since v3:
> - Remove extra white line in amd_sdw_manager_start() function.
>
> Changes since v2:
> - Rebase the patch series after dropping the patch which adds conditional
>   check for SoundWire manager device resume when wake event is asserted.
>
> Changes since v1:
> - Drop white line insertion in the code.
> - Add a conditional check for SoundWire manager device resume when wake
>   event is asserted.
> - Add new patch to set ACP_PME_EN during runtime suspend sequence
> - Split the existing implementation of host wake interrupt mask
>   enablement and setting device power state in to two separate patches
>   and refactor set device power state logic.
> - Drop PME status clear logic.

Hi Vinod,

ASoC patches (Which adds support for ACP7.0 & ACP7.1 platforms) got
merged. Could you please help to review the patch series?

Thanks,
Vijendar
>
> Vijendar Mukunda (6):
>   soundwire: amd: change the soundwire wake enable/disable sequence
>   soundwire: amd: add debug log for soundwire wake event
>   soundwire: amd: add support for ACP7.0 & ACP7.1 platforms
>   soundwire: amd: set device power state during suspend/resume sequence
>   soundwire: amd: set ACP_PME_EN during runtime suspend sequence
>   soundwire: amd: add soundwire host wake interrupt enable/disable
>     sequence
>
>  drivers/soundwire/amd_manager.c   | 149 +++++++++++++++++++++++++++++-
>  drivers/soundwire/amd_manager.h   |  26 ++++++
>  include/linux/soundwire/sdw_amd.h |   2 +
>  3 files changed, 172 insertions(+), 5 deletions(-)
>

