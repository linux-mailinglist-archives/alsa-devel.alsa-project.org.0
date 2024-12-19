Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF669F83BD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 20:03:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52DC06023B;
	Thu, 19 Dec 2024 20:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52DC06023B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734635012;
	bh=ETZJolzUc0cmrZywrO8hNOEficbFCwbSII90TB8hQnY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OVtqiAovdT/ixDSwaYq3gpWDMHkPFBqzkl2ZZRS6ZnuAX855nNoCRNoY0YyOqagTA
	 6RCHWSmcTi9wU9+axQF9W3Tm1uVbRKrhSLRB89z9rP7diBm2PS7NExlB4EXAvSotYk
	 fpsewRgi4cNOS1s/gR3+86Rdk8p+elvbXYqcRhOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E75A9F805B6; Thu, 19 Dec 2024 20:02:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFCCF80571;
	Thu, 19 Dec 2024 20:02:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 683C7F8014C; Thu, 19 Dec 2024 20:02:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EC71F80038
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 20:02:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EC71F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3cj71wRP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKxtg9G+9JcnPyo4sRKMB3yab0LvDfetU9ojs6eDH3kg/WjayIQP6aG/Qf0LzqMDWRMjjF6FSsFYcGzuuiesHJ5m3zZxKxjyHgv+K1mehk7dBtxKuoyAizGZBK6Lk2hOI4xzQCx60EA4BdcXSQEiLHvIb9MU/epEDJGxHt/W0qMS/I5mk/v/2d5TYMq/kDqnEwK3p9qsXmGXYd8bWhr8bk/Z1PW4Ja/BeV/1AceDb/djLYMDo96z4l69eVBGGtqhhhKFMHkLI6gWgQyEwGR+3uYmtEtzw06ln1DYazIvSREt5Vjm35EvStFXzXrdz1zvBEr1sS8xTyc2tnp21laqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkmZB7khlt1tUphjedAvEAdofq2QgLfvUTer5gv+ciM=;
 b=kMGa8Muq27esadxkz4V8yrAJEk1dkuBC/B5qEUHE817mdgJiJusqOgqPLiuHqEk80/pWPcrUpX4HNy2LUBXrdJtdescFZqxLvcRftKevP4vWUyFVnmIKKoeTFc1y97/pDsam7OaCCPMCKSEzCJ/wQ6wQPXSv58vWOVBq2+n/ebQ+0RkkowptLj0HLwUGCo59OWMNOOayTNNCykR6dFhExk8zwx4fie86zoUo8VCMYRJrhnQR5lhClVR/EbzHATgj7/7Dqu6s9L5X0jp4JdIHp53V7GBW0fh4JpsiTgUlBKBHw/Sn4Gb/KKDB7HO7ZKPHPd8EOLUfrvdWkM4cKNctig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkmZB7khlt1tUphjedAvEAdofq2QgLfvUTer5gv+ciM=;
 b=3cj71wRPhXYJd1gXk/gvcIeQtrO6Mq9v1l1JtBGOCpJi+NRLNmvrka5d4HR+UeDCYUDot9qVAXJXHKrVwavZERAxCHQHBs9YvJjGxKUz2t1alABKalFqjs4CxIthxQQ18ylI/URFeEc9zj2wNFZpgATBzZcIetbza+6F7bjyT68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 19:02:44 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 19:02:44 +0000
Message-ID: <908fa500-0f01-4720-99b5-22c6f7edf9c5@amd.com>
Date: Thu, 19 Dec 2024 13:02:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
 power off mode
From: Mario Limonciello <mario.limonciello@amd.com>
To: vkoul@kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
 <47f9ccce-1946-4586-b918-3de203b5c712@amd.com>
Content-Language: en-US
In-Reply-To: <47f9ccce-1946-4586-b918-3de203b5c712@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 969a2f13-fc2a-4ec1-dd09-08dd205fb838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cmdXZnlxSldxbHF3U0IybUR3T0dRQ1hvUjlFYlRES1VTU1pGMlFqdjZLeGhr?=
 =?utf-8?B?OWRjbXFtQnBoRy8rVUlpYmVzS25ZekN0RnRDWUwrVE56cTQvR1IrNnhkbGp3?=
 =?utf-8?B?WXVNWlEzNUZjeXRlcENvdFpWY0V3aW9KWW1GZWJPNldWaXdIWXFUdUlTVmdQ?=
 =?utf-8?B?MTkyRWhyZG9aLzRoaEcxU1c1VkJqQUNOUEJta2hBeW9FY1NHT1ZzdTZDMWhk?=
 =?utf-8?B?c0JmUjZsbzFoKzlmUldqQ3prOVhRUlhXeEZzMnVjRlQ4QkNzUEhDMmo3UmlN?=
 =?utf-8?B?azJoWW1IemhoTW9wUkVSSWFRTmF5c21hSHRxNTFaOGw3NWlpYXc0QTJnNjZw?=
 =?utf-8?B?WkxyVmpzUmdmTUpLbi8wRHk2OTczZk11a25BeDc1ZXNtVlM5Zkt0NU1tVHRW?=
 =?utf-8?B?Rk13THhxb2xkNGFUTEd6Slp3WS8welU2WDV0NzRXUjNVVTVrL3l5cEFCSjZ4?=
 =?utf-8?B?eTRkbE1TWFV5eTNVVUVjN28zTm9NZkVIVWp3YnpwdDliNTRnZWMzdmJQU3B4?=
 =?utf-8?B?Ym50OENJOVhhckdPT0REeDF1dTRNdmZvd2g5a0tPN3YyWXNsMUFJdlQ5TDZM?=
 =?utf-8?B?Q2tCekdzVUZQNVpwcE80b0o4alF2amxMWDBKeXJ5LzN1dWt5RmVWMVE3NS9U?=
 =?utf-8?B?RDBTenFVcER2UDhMTXhlODk4aVF0WmVIbzVELzg0VXRCLy83WDlUMndUV2Z0?=
 =?utf-8?B?dHFjS0p3dnZnRU0yUS9BNnN4Ky8xeE5sQXJGWmVRUjV2dmFxNkZJTEUxOU85?=
 =?utf-8?B?cVY2d1EvTDA2VHowSy9CT0lqR2Z0RFA3TkZxbzNoMDVQVDF1cWVKK1A0UWRW?=
 =?utf-8?B?ZW9saGhDVG1JcllOYzh5S2R2V2ZjcUM1NEg1QUUwSytPd3dnOERRWkhxUFU3?=
 =?utf-8?B?MVF6ZEFxOHZkVjNEeDJ2Z0hjNUZma24zWkhwS2RhZVpOMjdIVmVMeTcrOVI2?=
 =?utf-8?B?MTZjbTU3UjNkUG1oRGtSM0IrQmNwamtzRFlKNzBoczNDUnJ2TDJjS3FuYldJ?=
 =?utf-8?B?Y0FwTUVQVHdHNmcvTFpmVUlSU1d6c3FDOEQ1OG9rVW1Ka2E0cVZTU0U1VUJ3?=
 =?utf-8?B?eThRc01OSFZFTEhTWWMzQ3RLaUFDc3FuODhTcDdqell5R1NyRWY1WnB1MkV2?=
 =?utf-8?B?WEQ1YWhkeTFoaDUxZlc0RjJEUWxoTXVyWlpmV3BRS0lvc1lDWjAya1VCdWMv?=
 =?utf-8?B?ME05NzlRRDBPeXdIMFJDcitYTEY5S3NqOFVXTTcyRk01NFErUk9GNXlMcWI1?=
 =?utf-8?B?WjBnbUJrajJPemZ2STNkem9EV2lrYzFnSTVseWJvSWVZeUduYkVzNXVZUVBP?=
 =?utf-8?B?V0Fpd2N6MjF4c1F3WisyQng1cVZVQzdFM1o2alRwUHhRUzFqMmowWDdsbU9T?=
 =?utf-8?B?WmtPVytNWlF2OEc0dDZxQVA5V2ZxMWNIUjRzaXJqeVdqcXNrZkdrS2RHMWI3?=
 =?utf-8?B?SXRqSmpCVDNGdXhXb0dFWlo4bW1Hb2U1M1RYNHd4U2hPeGNMbVQ3YktjWnFh?=
 =?utf-8?B?ZENNaWxCQzE4bkZmTVBLUVRNNjZvRGgwNlpvNDlXYVlJczlqeGFmRElHaWp4?=
 =?utf-8?B?QVZqalNoL2hJQjdyWUlUbnpjbFFFOXMxSmcrYTg3QWlEbGFFbkthRlZ1VXd2?=
 =?utf-8?B?VmVudlFIWDVnUXUzazNjUmFsN2szakJZNG1CajlIYlFFMVNaYjQzSkVFL2h5?=
 =?utf-8?B?bGJRdDl0b3AyNW1kK3RlTGxCOHcrVFlhK0lrTHpydUZwcm0ydkV3WUcxdzIx?=
 =?utf-8?B?cGNIcFg2Z3grcUwxZ1M2WjJnUkl5b3JmallrTi9ybUxrc0x6bDFyd1dYN281?=
 =?utf-8?B?dk5ERlNxTll5ZUI0TzZyWDdNRHJEbVpaV29JOGVZVEZKVVJYWng0M2VWMU9n?=
 =?utf-8?B?T2tiS2Q5R0xTMkQxOTJ5eUg0cDdGeVBnckppNC9WdEhHcXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTR2WUJjdEdVSTlkNnFSL244SllWRjB5NHRnOVhDVDlkclFiNjNsQ1FrZkhk?=
 =?utf-8?B?WFZMclZUOC9hb1ZSMXlPWWdxdUppSW1VMDNPdndNOXg0K3R3RzJMWmtZbmhL?=
 =?utf-8?B?RUFxVlprZlkveXBJcnVTRndNTWUrTWlYeHlNbTUrUHJhdDJDakRGOStBSy9T?=
 =?utf-8?B?ZzRvTnNoRmZYeXhwY2YxTDljVkFrb09ZSlFrSFNIcmsrbSs4VVlBdEJ6Q2p3?=
 =?utf-8?B?VmRmWXU1aElMcWN1d3o1MkJHOTFHYUs4NEU0T0U2QXh6QjlJN2QzdmMrOWMx?=
 =?utf-8?B?Vk8xZEppN1hvUSs0WWxyQ1FiUlA1V0hRN2Z6SkRJOEkvaHJrd2tmVjM3a3RQ?=
 =?utf-8?B?c3FpOUpSaFpxcUdHdnBiZWpGZm5BTkFCZ3F1cWdHMU5LZzh1Z084c25oUDFi?=
 =?utf-8?B?ODVtaytTcExENlMzbElnQlg5NDE0M2x4L3ZNdU80OVh4WmVZUFBPMjl2cE8r?=
 =?utf-8?B?dDdQWkovdmg3SlZJUVp6amxUOWpVd3B4K3FnSWkyeDh0MmlwaHVwK001bHJ1?=
 =?utf-8?B?KzNGTUU1YmZXMTZMa0djL1d6dGQ2aTlZMEZpc0x1VS9PK2lnUVp4VFpOT0ZR?=
 =?utf-8?B?bmFxdVRBZHBlU1NrbFJzTGJCbC9vSUNGbUs0aXZKU0NqOG5Ncjk4SnhlUHlW?=
 =?utf-8?B?MXRXUktRcDNRdmVrK0x0WmNXSXZ6SitaZGViQXNlbXprcjBicFVSTDNyS1Zw?=
 =?utf-8?B?UlQvUWx6QWR5a3NXeVEwNVBwUDk4M2U0V3VrbTBWMG90cFhlSDlsZzNBaFdB?=
 =?utf-8?B?TW1zTWVxY3p4cHpiSWVSWnk5ME5Kc3RwZWxkMHhNdVVmMTlxRk5IRDdadk42?=
 =?utf-8?B?OHdMY0h2TWI0aXJJb1FXSHBzWUpFTmg0M1c4d1ZESW9wUkxGUVlKYWkxLzRx?=
 =?utf-8?B?a2FEZjlHU0Z5SFIrUUpoOEpISlNJN0xrSS9zRkI2bklaU1FyaTdYdm1CQzhK?=
 =?utf-8?B?OWdFeHUxOTFXcHAvZ2FRTVcvaXNEckIxZlpXUmlqYVdQenZFa0xWYmtDZFBR?=
 =?utf-8?B?MC84TzRuL0ZlYm4rZktkQ2NrQks1YS83aWhwMENJT0RqQnpXUzRJM3BCelFl?=
 =?utf-8?B?dU56Q1prSDBZVngwQWFRQUlNN3RTclhabVdKdDlWc3R1c2RBcE0wcDF6bnN1?=
 =?utf-8?B?YXhkRm5HZVd4UCsvRmVTQW8zajJUKzFwZVpHUFZXcDEvbFVUYjRsRW5yNW1F?=
 =?utf-8?B?eDFqOWU0SWw3eGcyYXB1NXBZOUZYTkpEYXZCU0UramdqODBqSTRKNlIxK1Zu?=
 =?utf-8?B?cXo5eExrOEs5TXNkMFp5VWRHcjJ2ZldRZFBzYnR2S3ozNWRnRUlJVHBCUmNv?=
 =?utf-8?B?WVliZkd0REdERkVwWFFjdE5JakdQcFE4N0srMEpJaG1SWlc3VmtaVHhCQ2RH?=
 =?utf-8?B?MWhoVUFmclowU3BrYWVKem9iejFkMWdUSW81djl4Wkw0MjcrOEZrL2JpWVp6?=
 =?utf-8?B?amM4WmExNUx4VEg2ZGRwaE1IT215ZStCZ0w2NXNPTVF3QXc3OFBpMCtSY0Zm?=
 =?utf-8?B?c0NJVks0Q1pWcjFwRWFYTFNLOC95WHA1YjVOMGtta3F4d1pVT3Y3Z1I4V3hP?=
 =?utf-8?B?bGl3WER3ODJnREpTRmp0WjNnQTQyNE9HZzYvYitaa3UvR3cvZ0dKVXZnejBi?=
 =?utf-8?B?dmhJb3B1UGZ5SlNuTE9kMXVUenowWGV3RHczT1ZWMHVZTWxQVG9USjN5d0RD?=
 =?utf-8?B?Z1ZYQ1pkZjRDTC9Sa1NjMExPM3RuRGxmNHNkQ09zamgyMDk3dlhGNlFRekdq?=
 =?utf-8?B?bUVaTDZkazIxNVJudzN1TVhpQzY0eGRXUTN5NlR4YU5LWGx4WU55cGFKelJq?=
 =?utf-8?B?NDZ3cXc3YWRHSXpVNDNuNWZqWks5bXYwQ01ROGFZWTNrdXczaE5EajVBSHE5?=
 =?utf-8?B?cFI4RWVqOC9qQ2l3Ymt2L0VWaklwZTVEbG9FSXN5ZTVYb2hwWEZBNmFCQWx6?=
 =?utf-8?B?TzE5K0dxWC8wSVFiQ1V6MUE2aHBFS2VFaHppZ2tLSnhNMml5d1BvdTJnTDBn?=
 =?utf-8?B?V2hvejFpNHQ3OFRUVzgzcWtxVUhBaDR2cnd5NUlxemxCbUtHV2h1YzV6K1N4?=
 =?utf-8?B?T0tEV0IwNmVxSzVXenFDLzNNRFduRXJvbG9yTG0vZnd2Lzh6aE9pMGZRa0lP?=
 =?utf-8?Q?KIFsTkxhdXnNSscbmhPleA12v?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 969a2f13-fc2a-4ec1-dd09-08dd205fb838
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 19:02:44.2436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gPY50WwsimU/QF0yslQjwU613A3tmmSkIDmSCk8fMgLgWr0zmPmZOkEqC8XuIb/V5Xvobcc77WIzuxMi0HkE6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111
Message-ID-Hash: 6GRLVEPS6NLBWY7FJ6DWBK3AWFNYCTR7
X-Message-ID-Hash: 6GRLVEPS6NLBWY7FJ6DWBK3AWFNYCTR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GRLVEPS6NLBWY7FJ6DWBK3AWFNYCTR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/12/2024 16:30, Mario Limonciello wrote:
> On 12/3/2024 03:21, Vijendar Mukunda wrote:
>> As per design for power off mode, clear the wake enable register during
>> resume sequence.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> 
> Hi Vinod,
> 
> Can you please pick up this patch?  There is other work that needs to 
> build on it that is currently blocked.  It's been on the list for nearly 
> a month [1] along with a resend [2] with no feedback.
> 
> [1] https://lore.kernel.org/alsa-devel/20241112185138.3235375-1- 
> Vijendar.Mukunda@amd.com/
> [2] https://lore.kernel.org/alsa-devel/20241203092144.4096986-1- 
> Vijendar.Mukunda@amd.com/
> 
> Thanks,

Hi Vinod,

Ping on this.

Bard,

You're also a maintainer in drivers/soundwire, can you take this instead?

Or can you Ack it and let it go through Mark's tree with ASoC stuff 
instead perhaps?

Thanks,

> 
>> ---
>>   drivers/soundwire/amd_manager.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/ 
>> amd_manager.c
>> index 5a4bfaef65fb..96a3aa6da711 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -1190,6 +1190,7 @@ static int __maybe_unused 
>> amd_resume_runtime(struct device *dev)
>>       if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>>           return amd_sdw_clock_stop_exit(amd_manager);
>>       } else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
>> +        writel(0x00, amd_manager->acp_mmio + 
>> ACP_SW_WAKE_EN(amd_manager->instance));
>>           val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>>           if (val) {
>>               val |= AMD_SDW_CLK_RESUME_REQ;
> 
> 

