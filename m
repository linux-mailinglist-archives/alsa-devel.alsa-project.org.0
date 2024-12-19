Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173889F81AD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 18:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450DD6026B;
	Thu, 19 Dec 2024 18:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450DD6026B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734629076;
	bh=JCEN7j3mbvZ0Ey2vUz75qzuBGhL12MDWAPWPUPpj9H8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J4Si/4t3ItfJpvpO+0LDQtukEVqCiwojhAHHpfub1ZkC/CCHysa7vm5X6zAR3BmcP
	 OFjbTfb8Y8phDtOF5k5xb18f/idY21l22rdiAUD/IiQxSI59BZCZfxJZOX62k2SPBW
	 EMB6JCrRG3FB5urYCZKFkKAb9BiEWAL+h26ZzoD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EBFCF805BA; Thu, 19 Dec 2024 18:23:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD65DF805B0;
	Thu, 19 Dec 2024 18:23:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75640F8014C; Thu, 19 Dec 2024 18:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::61d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED2CBF80038
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 18:23:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED2CBF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KqkRz5Fk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnk76OCHvWM2BAO+/J1kMOs9p5u6uc7z2uKQ3zt8tZkipCqdjVzUdJg05b6oD5c5QEjfQ0n2A9kHmtcXCoR52o1ThWfDAKrXO2R/9f81xygS1cjZy8pJ7BbpD0x/5W/ZDMv8ql0Z+cyOIjUv/rPt4iF+V6pbS1iXBYrzAhaZCDIV/SZNradkJAU616bImIvcuP/GAZJRjq3aeckdtqJ8zcU3WyooB8cg0eOkFQKF3MyOQhqBAs4cyXUBe4N8gpTqv8NqDZOTE/yJj0Zb15KFYy789BFTNf9xgRIl3Wcxdb94v5+grmylfv+FcGtOSdmrk8TfX7sl3f/80KBwQyDBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR/Bk+pwg/69PbWp8qQfWZA0F56Mzq/W0Mihw6h1SOY=;
 b=xD7N3GLpoEjNZEtic7iomxRj8q8MXiICdSSm2M4CoP6Q3fJHH/v7KHhbOEakN7VAqF1eLJt5ys2IENyJE14tAn5M05387XatddHAEwQfdHMhWsH2c/NtBqNJD1be+B2j/YxpQ110+gfXpUEvUy78Ujq326yWScuyGtnZe8w3QL5/lp80fb9PNMb3FJH8WtJPC245Df9B4/Aw2HMHTrq7K8YW/MG0/8k8YdJZKyeRtbvTM19VGyv/lQk6vpsl0PRqpgLgQiLnP6RkdOpABFSiriEIkEN3xm25OS/uJTkoVSdgTMrMAZs+9iHkKjFDS0Vta2MuWjTSevVL3U1WwgKa5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR/Bk+pwg/69PbWp8qQfWZA0F56Mzq/W0Mihw6h1SOY=;
 b=KqkRz5FkrJtyLbOow8FkmEIVL287WpLXCgrpWkAAj1LF+JVmRcTUPX0D5qqv09KPZxgzRdZs/mO3CeQinFtXFXSvvK8b4QbgxG5zixPjV8a6CyJHP1NX4WcfCBAtXSJ9jHhyo9Szh7sZcyToQohWiuRvwXCO+FNEuYSnElC7B4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM3PR12MB9392.namprd12.prod.outlook.com (2603:10b6:0:44::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.14; Thu, 19 Dec 2024 17:23:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 17:23:39 +0000
Message-ID: <e805eb22-9177-47c2-84d6-c32d93571a44@amd.com>
Date: Thu, 19 Dec 2024 11:23:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/21] ASoC: amd: acp70: add acp pci driver for ACP7.0 and
 ACP7.1 platforms
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
 <20241219054857.2070420-3-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241219054857.2070420-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0179.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM3PR12MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 30732f63-bdf3-444b-05b4-08dd2051e121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a2dQNnYyS0RBbmFlZkJBUnF3UTFBYzhOay8zSk9NanoraFFXMjJvYStnakI2?=
 =?utf-8?B?WDZ3MzVZYmw1SFF3L3ZWUFlUVjUxTGs0cGdVSytBZkZsenJCOGh1a3NXb3lJ?=
 =?utf-8?B?RjB5M3FnbmVYbkZuTEFVdWRrcXVQK01NZ0ZPOGhLNnl5NzdLWmc1QWRFSm1r?=
 =?utf-8?B?NXh5MTVsUWFoemoyVkVhTEhjam9EZ0ZNWWVJVGFOZ0tFeS9mWGRWdGk2R0Vy?=
 =?utf-8?B?N2FqdWdqeWc2ajJkdWtxZEp3Vm1iT2NjL21IVHV1VFAwYVA0bTNBOVJZUGF1?=
 =?utf-8?B?NnFyc1FXS0NBRFNPS1kxZUVtbHpzQmY1MUdqWlVmaVpBTHJzakg4dmc1bFZt?=
 =?utf-8?B?Y0tLTW9ybHhDdmk1OFBSR21GUnlHRC93bHd0eHN6ZERlV3lpeCswa2FlRlhU?=
 =?utf-8?B?eHdVb0QrQmFwZHN4ZEtVd3prQ3BUZTlyUDZBRW1GKzVIKzJpR3FTb0FXNHFU?=
 =?utf-8?B?c1gvYzZvU1dxS1orTnh4bHNuSllFcVhkU1JULzl2OUEvKzh5L0Z5VDhiLzUw?=
 =?utf-8?B?RWVFeERoaXdla1dCTFlTRzNXSUU1cVNJWmc1MGc5YXRXUyt1S1BnUk9lYVpk?=
 =?utf-8?B?WEFNd0xMTmFEbHk0MnZoS0gyMFNsTGVyZGtmYVBUNVlPMEZNdHZsVHdPLzRK?=
 =?utf-8?B?RnBZTGRtOVAvZGI4QXdFYmZIa0p2RDFYSVdzaExvZWZSR1VCcUhCYWMyU3VW?=
 =?utf-8?B?YW84NTdYZFUrdUJHRm43MDJVeE5WWjRueDZEOUdlZllGZWY1N05BMWdLSytp?=
 =?utf-8?B?Z1JjQVRWZ2gyamMvU0xHbk1rVnV5SVBsK3R4V1U4Q0NtdXg5aGJxNHZSWmpW?=
 =?utf-8?B?d1ZGeXQwcFhpMk5nUVFmOWtES01QeDdhN3p6UitmdVlvMVBqMU1rUkJzd3Jv?=
 =?utf-8?B?TUsrNFI0VWRDckxvYjZ6YXREOTMyKzlMWHdmOFlFQkN5d3VadHhva1JWU292?=
 =?utf-8?B?OVZaWitnU1NrRW51K3lZc0FFYVVLTDR1d0JpRTZhc2Rxb3NiVlJFZ2JtZFVO?=
 =?utf-8?B?RDNYVDdXbHd2RDBmQTJSRUMxNGIyYUxaTWtRdEJESXFlMmgzaW91SnB3UnJ6?=
 =?utf-8?B?bUZzVlFxMXVBQmhOTERmK2RhamZNbnlzV1BUOS9xS0Z0KzlpMFFIaXlOajl4?=
 =?utf-8?B?dUZyemJ0elBFY1ptZU9iQ21BR2IwUjBkemNrY25mNGYwNWZUM2MyS3o3TGk3?=
 =?utf-8?B?aHdLVURUUFlWalBYZkkyRHBLa1lzbjZLMExNNktPamVJYWR6MVhMTk1JVGll?=
 =?utf-8?B?L29YKzA5c0p3bzljZGdmK1ZwSXQ3ZCtpY2YrbGtTWnB2RTI0Q0YzRmMzczQ2?=
 =?utf-8?B?OWFGbEt2RVhnQzZXcUpXL1JQRENkL05wYlZ2OXlRd01IYkxDd1pxOFpjTHVS?=
 =?utf-8?B?MnVZaHJmWW5hSG5UcUliMEpvVUtrZDRHSWl0L3ZHVjdkZWQ1dGtmK2kvYWZZ?=
 =?utf-8?B?TXpFVnBSRnV1YWdKck9wdVVxcEZBRjhoQ3IwejliTzcrS0czdFpENlFQVUhE?=
 =?utf-8?B?SVlYQXF6aHpHdUhrRkswNE9iaFR1cWJ0d2IvRUNDMTRYRDEraGJrOVlKNVdw?=
 =?utf-8?B?RmkrcU5LTFRhdkRRZFJCMTZYNzdIQ01EdC9vMG02MTh5SXF2RC9iUitYR1A0?=
 =?utf-8?B?Y0t0SXBPdkF5NEYxdnpDUjVUbnZGV29ycm5XSWFrZk9uanJNejVTMTRiSHB6?=
 =?utf-8?B?UXBhcDhISjAvMHZ4SmlRbXFlakhsU0pUdzFpMzJ1SUJUb1k0OGRLV091RjVH?=
 =?utf-8?B?UStXMmtRMVN0UnNQKzZsaE5kZkptRWNYSGZYTzd2dHN1Y2ZGdHR0bnU2ZVZU?=
 =?utf-8?B?VHpyNUd4QWJMRnVaYWc2LzhMVGNnRDR1VFJ1RHc1RC9teUU2dGJjL2I2UzNm?=
 =?utf-8?Q?TLiknXMOhesPS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VG9iSFJid3FyV1BGdWxsVmlROWs3ekhTZ0ZOZzBobmlNc1JWZGpob0xuditJ?=
 =?utf-8?B?RURBOENpS3RyMjV0MnJqVndBMUdSckk2aVdyTTRPZjZBcDNOcjFtd20wbmhF?=
 =?utf-8?B?ZGpQMFJXYUVmUWdNb2Jjck5vVWUvbWxwWWVxd2lDTGdpVk9zSllzWVVGNUsw?=
 =?utf-8?B?UXFoc1htK0V1VE01SWJuMzl4S3Bucjc1cEdrSXQ0UnVpWE95MkpIeW94Vllh?=
 =?utf-8?B?Z3NETEEwMXpIc0cxSk9mRW1WTTZWWVVXUTBWbVh4eE9XUVVnMnNIWmR0QVNE?=
 =?utf-8?B?aExVUUQ2aGUxOEdwS2dBVktUN3o3OGhHRmdhSHFyOWVuS1Y3NTdjMnhpelV0?=
 =?utf-8?B?NXM4VXpROWNNT2pucWFxV1hockxrV0lmeTI0R29tRWdRaFEwVUhTNjMwWEor?=
 =?utf-8?B?d3FRZlp2N0d0eU5uSzNFMUQ1Z0hPT1oxYVFEZ3FjWlFTM1dsSjFoUURjNDd2?=
 =?utf-8?B?a3ZTVWFaY1B6R3RZcE0wb3IybUZmTUNnVW9sVHhWbm5RemxaQldtenRwYmt1?=
 =?utf-8?B?WUZUcXV0WEV1NElpNmdla3M2NUhldms4dkY2S3BhOWRUeGtwWC80aHdFWUQ0?=
 =?utf-8?B?WjA2Sit3UHZxaGJrT1FkUG4zTWRadXM3V0JCbEh5Z3BpWHdNZEkyVUUwZDBn?=
 =?utf-8?B?S3BkNFlhUXlWMEVlKzRjVWl0QTlSYVYwazZtNnA0WXVGcjdxb3FCSHlLbmM5?=
 =?utf-8?B?eDFFNFQxZVBJVHBhbU1aMndzajFkLzdHOEZXYU14b1Y4N0s0Y3FrT0dqVFJZ?=
 =?utf-8?B?Zk1EYTJZS1RxMXdRcjdCa1FCMitDcXIzMkFLSE1HSjc4a3NZSUtIa1Zsc1FY?=
 =?utf-8?B?QnVpVXRkOFh5dEJTKzE1Uko0S2xuTEhBaGpFTDIySW1Bb0N1a2R3MER3TEUw?=
 =?utf-8?B?U3A2MU05VkdZVlBGMENic2RmWnJzRktUelNsenIzWElJalFzejQvU3UxOU41?=
 =?utf-8?B?SU5XZ0dCcCtobUMwaEkxcWtsZDlMcU94OG1WUklrT21oR1l2dDJ6ZkZheFh4?=
 =?utf-8?B?L0VJYzBwekl1TktYMzNPZGNndy9zYTB1Y0szczVVcHhaZE5zQXR4SFpJRkZY?=
 =?utf-8?B?QTU5NGtDMUxYbXd5V3d3K3ErZ1NDQVNKOGprMmhRY0ptOGdlZkpxa2x4RnZF?=
 =?utf-8?B?TVZJUENZa1hsUFZMV0xmdEJjZFVHNXIxUFdsczVrMnpYQmJwZUNBOUV5djY3?=
 =?utf-8?B?VHpOTkVYUU41cVZmeWNuREZJclZjM2VLQ2NZTUlVeVk0WEpqWmNJcmQxd3dz?=
 =?utf-8?B?ZWp5RnZmYy83akd2MVpmdW4rcGFVdE4xcnNsamN5UHJBaFFFUGx3bjlXNmpt?=
 =?utf-8?B?OTh5RlVVcWpTMy9XNEErMFJqY3FMSXc5TGtnZ1ZJUUFud3BTK0dDUkdZUEto?=
 =?utf-8?B?QkhmQ3hxaVZNSmxSU256Ty9JS3BOa0RxL29pRytoeUFRb204VzlKMGhXTUFP?=
 =?utf-8?B?cXBBUnUzNFFJUEw5Y3pnWllLbVphcG5Ka0VBdWNjTXVIQWtOSms2ZkpCKzlZ?=
 =?utf-8?B?ZXJqZFE1ZnNmaVBjRjRyd2ltMHpVRHlxbkxNaGJGTmRIVjJKbHM5UmlXVXF0?=
 =?utf-8?B?Z2JXVkViNXRLdnZ5MlcrMVZnc3BLcFJQN0VYVFo0ODl6S0VBME1HeGNJTW1y?=
 =?utf-8?B?VmIrVlB0NzRPUWErUW5Ubk1FZ3ZibEpETmgyRVcrVDVPN0VTbE1zd1Q2SkNB?=
 =?utf-8?B?RjJjZDB3U1JlZFQ0ZHZnQjQrazR4czVVRGNnRXpkV0pYZW5uWnN4MWMvbU5a?=
 =?utf-8?B?R29LaXhsdjIwdlo4RDdrZW5raTNSTVZ6MEYxZVMrd05XSlA1NjJOaTBhSEJo?=
 =?utf-8?B?V2tIK2crOE9XdDAwMjczV21jeTdqcDBFY1hjTXkwREpoWFhJR2NLV3hJMFRL?=
 =?utf-8?B?STQ4ek5vT3BVa3dHNUxUUGtBSkNSang5NjlVUWQ0bXYwa1U2eEFvcHVSOWlN?=
 =?utf-8?B?cWIzdzg3VjUzS3BUNm1oUkZibjdyZzlhWVI0aXplTEJMMmljeVQ1TVhuRjZx?=
 =?utf-8?B?MkNjeTJXT0cyVjJFS1NsTlcyVUxVZGN6YjN4NXR2c2lIOE85c293cHF5OWVi?=
 =?utf-8?B?dG9GcjhKcVN1TXdlWEFLdnF3L3RxSWMvcVordkJOaU0wQ2ZJOTRPMVVMV3V5?=
 =?utf-8?Q?sfNyb5Uy4tBlLf4bEs7badTHT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30732f63-bdf3-444b-05b4-08dd2051e121
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:23:39.9070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9bYkYX9RROsYT0inErsaADbqbHWxXIXw+B8LEZ+piC0Q5nSD6lzInkupPx3icOxowewRzpZTNA2NwHETDbruFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9392
Message-ID-Hash: HK63VMOFNTUQXWXGGDAX2BKVVARTMBCG
X-Message-ID-Hash: HK63VMOFNTUQXWXGGDAX2BKVVARTMBCG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HK63VMOFNTUQXWXGGDAX2BKVVARTMBCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/18/2024 23:48, Vijendar Mukunda wrote:
> ACP is a PCI audio device.
> This patch adds common PCI driver to bind to this device and get PCI
> resources for ACP7.0 & ACP7.1 platforms.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/acp70/acp70.h     |  33 +++++++++++
>   sound/soc/amd/acp70/pci-acp70.c | 100 ++++++++++++++++++++++++++++++++
>   2 files changed, 133 insertions(+)
>   create mode 100644 sound/soc/amd/acp70/acp70.h
>   create mode 100644 sound/soc/amd/acp70/pci-acp70.c
> 
> diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
> new file mode 100644
> index 000000000000..28a46f0c2026
> --- /dev/null
> +++ b/sound/soc/amd/acp70/acp70.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ACP 7.0 platform Common header file
> + *
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
> + */
> +
> +#include <sound/acp70_chip_offset_byte.h>
> +
> +#define ACP_DEVICE_ID		0x15E2
> +#define ACP70_REG_START		0x1240000
> +#define ACP70_REG_END		0x125C000
> +#define ACP70_PCI_REV		0x70
> +#define ACP71_PCI_REV		0x71
> +
> +/**
> + * struct acp70_dev_data - acp pci driver context
> + * @acp70_base: acp mmio base
> + * @acp_lock: used to protect acp common registers
> + * @addr: pci ioremap address
> + * @reg_range: ACP reigister range
> + * @acp_rev : ACP PCI revision id
> + */
> +
> +struct acp70_dev_data {
> +	void __iomem *acp70_base;
> +	struct mutex acp_lock; /* protect shared registers */
> +	u32 addr;
> +	u32 reg_range;
> +	u32 acp_rev;
> +};
> +
> +int snd_amd_acp_find_config(struct pci_dev *pci);
> diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
> new file mode 100644
> index 000000000000..23e47f619bd7
> --- /dev/null
> +++ b/sound/soc/amd/acp70/pci-acp70.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AMD common ACP PCI driver for ACP7.0 & ACP7.1 platforms
> + *
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include "../mach-config.h"
> +
> +#include "acp70.h"
> +
> +static int snd_acp70_probe(struct pci_dev *pci,
> +			   const struct pci_device_id *pci_id)
> +{
> +	struct acp70_dev_data *adata;
> +	u32 addr, flag;
> +	int ret;
> +
> +	/* Return if acp config flag is defined */
> +	flag = snd_amd_acp_find_config(pci);
> +	if (flag)
> +		return -ENODEV;
> +
> +	/* Pink Sardine device check */
> +	switch (pci->revision) {
> +	case ACP70_PCI_REV:
> +	case ACP71_PCI_REV:
> +		break;
> +	default:
> +		dev_dbg(&pci->dev, "acp70 pci device not found\n");
> +		return -ENODEV;
> +	}
> +	if (pci_enable_device(pci)) {
> +		dev_err(&pci->dev, "pci_enable_device failed\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = pci_request_regions(pci, "AMD ACP6.2 audio");

Presumably this should be "ACP7.x audio"

> +	if (ret < 0) {
> +		dev_err(&pci->dev, "pci_request_regions failed\n");
> +		goto disable_pci;
> +	}
> +	adata = devm_kzalloc(&pci->dev, sizeof(struct acp70_dev_data),
> +			     GFP_KERNEL);
> +	if (!adata) {
> +		ret = -ENOMEM;
> +		goto release_regions;
> +	}
> +
> +	addr = pci_resource_start(pci, 0);
> +	adata->acp70_base = devm_ioremap(&pci->dev, addr,
> +					 pci_resource_len(pci, 0));
> +	if (!adata->acp70_base) {
> +		ret = -ENOMEM;
> +		goto release_regions;
> +	}
> +	adata->addr = addr;
> +	adata->reg_range = ACP70_REG_END - ACP70_REG_START;
> +	adata->acp_rev = pci->revision;
> +	pci_set_master(pci);
> +	pci_set_drvdata(pci, adata);
> +	mutex_init(&adata->acp_lock);
> +	return 0;
> +release_regions:
> +	pci_release_regions(pci);
> +disable_pci:
> +	pci_disable_device(pci);
> +
> +	return ret;
> +}
> +
> +static void snd_acp70_remove(struct pci_dev *pci)
> +{
> +	pci_release_regions(pci);
> +	pci_disable_device(pci);
> +}
> +
> +static const struct pci_device_id snd_acp70_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),

Do you still need to specify the device ID since you already have a 
class entry in this table below?

> +	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
> +	.class_mask = 0xffffff },
> +	{ 0, },
> +};
> +MODULE_DEVICE_TABLE(pci, snd_acp70_ids);
> +
> +static struct pci_driver ps_acp70_driver  = {
> +	.name = KBUILD_MODNAME,
> +	.id_table = snd_acp70_ids,
> +	.probe = snd_acp70_probe,
> +	.remove = snd_acp70_remove,
> +};
> +
> +module_pci_driver(ps_acp70_driver);
> +
> +MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
> +MODULE_DESCRIPTION("AMD ACP7.0 PCI driver");
> +MODULE_LICENSE("GPL");

