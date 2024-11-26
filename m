Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D89D8FE6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2024 02:27:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17BE3E64;
	Tue, 26 Nov 2024 02:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17BE3E64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732584447;
	bh=5TO1j03OSgJd5ybMDhzQGtqvzuhhYyR5T4eyIaIjUno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ejoTf3xzYdhNQCBm5qK2itHyO8erHsMr5Ng8I8r4rJDltzMd2bmNERDAHl1r2jO1v
	 nZ4la4fDDBiHRMg6jOo0/mdWhNaG/j+6MjwbJv1rw2VWcMy9KQfFtG9Ors2t7sqxMB
	 Pki5Esn13j5Bevmbp6HdcQA06piGoQtLaPARRfgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75FDAF805C6; Tue, 26 Nov 2024 02:26:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70081F80496;
	Tue, 26 Nov 2024 02:26:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D559F80496; Tue, 26 Nov 2024 02:26:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D4C8F80073
	for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2024 02:26:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D4C8F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MWPx1a7/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6VK4k8uKVQabLrZICQTgoUyMbeCwjyId/n0r+hMR7B4/6m/DtMFjNBMTtPoGnGMlXr15lg5y1/lHRKliTRvXoL4mflDG/g+97+UiLGX7nNuMH92nqbM9M7fvnYAJNZwp16E/dYLjt2Ivqv1KC/6uk/FAIFeLY1Ata52C8rptfBLfd3oVWvrsFqDBPKdO4hUh8yLCN8l8pID6AYoBItf9PFasAwG+QugCrshGNF/Jt9DKk3wzLCYEeIY4OUBqxk+iu09Zkg6pRemTwKI+ijgVecGuLjuImm9qwrYoRjqrpppnY16KY1/EsIT/g61ODhnfIK2lZSVSHIixrSuzF3Fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG+NXP5URyDs0Bq4CdYuf5CHHwZB8EVnXDECY1MLU+4=;
 b=hg7nARiFRPgiWYqG0o2/COuD+lXTw9Ij3C7u3VAfzdhmV4xuprdvMcADNGtAS42vQjV8wM5DxDe2vj8HDAR1UrNDkF3xx6nByyvNyMh0kcX4jkUJ59TtziEVtRLxNZV5C8vcwh/d0qG0cws0UeBmz7dxVohIKEYuX/avI+DKViX2G4wZDQuuEBQYWtQjnIhWiBPjupAfHcgUaTM23cW4pUTcl2S9xq7p+2YV9jKchtyzPpqvNnk8Qw8AlkRo/JdDnfkot0nH+/1/NucnmbUxyKJCzX5+5g99gxvDmG4sWYW7sWvtVUdy1U4Bipyrf9hNXv+FfcOssg55znch1S/JoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG+NXP5URyDs0Bq4CdYuf5CHHwZB8EVnXDECY1MLU+4=;
 b=MWPx1a7/1NGzxItWV7BLj1zznMpKum1teiOlSdZoNAJh6I5XCAWAM4u/ySBCevFLPLkxJvdqVBudH7cWa6QbSnQ+btgpnZjy1DSMaQ9dQL64NvO/2YdPH0Hd/Y2vb1ZZ2OAKS3bmWkO3Bcmep3PBE++JhZqkytt2IfWJtIJj9zs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 01:26:29 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 01:26:28 +0000
Message-ID: <4c32e1f4-dc2f-4d56-a757-deef151fbea9@amd.com>
Date: Tue, 26 Nov 2024 06:56:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: clear wake enable register for power off
 mode
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 mario.limonciello@amd.com
References: <20241112185138.3235375-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20241112185138.3235375-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0230.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::15) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MN0PR12MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: d604e12b-13c0-412f-20b5-08dd0db959d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0dlcHplaGZ6SDdCMlFQZlAzRzBub29TcExDYStaT1JKcHZ2YXhGTUNaMzhT?=
 =?utf-8?B?aXBlekZNd29ZZllHTTI4VGtyWjZxWGVQckhhK0RERHBsR1ovbE85RFphOStF?=
 =?utf-8?B?THVvMGp0T1ZqeUdkUjFHQ3A5aU01ekRoL1lKUkwwYm40S0R1Vmc3N0lwN29L?=
 =?utf-8?B?N0dRRTU4U2RwQnR3TkVpekt2eDVuc1FVQmtsdy9oZUdnNlJQN3BPWDB3TGho?=
 =?utf-8?B?a0lzWWR1VzR0MTNtVWQybkd0dHM1VGdlT1dMTTJpVXRqSTVGZGdLeS8xSmkz?=
 =?utf-8?B?K2tyeFFVWmtTZ3JsMzlXaU1LOHdYVWxEZVlTZTRGWjFkelhwWUVKNU82akg3?=
 =?utf-8?B?d0pMUGlBenhNbFg2cjI5cnl3bDkwZU9aMHhxVXZzcFdIWUhYYklVYWxoTnVq?=
 =?utf-8?B?dUs5NjZTeFUyWllVM29IRTd1cC9vcWJoU0lOYXZWZ3VWcEtVZWt4b1ZHRTVj?=
 =?utf-8?B?eUdlaGpyRUVSZndBbkFkN0kzakJ1UHR3Lys1NU5ackhwTmpDZnhMTnRUd09L?=
 =?utf-8?B?bG9xYzVDRzVBU2dXN2J3VElFd0RSQm9MOW9KQWl3YTE3K01CUytuTHVCNzhD?=
 =?utf-8?B?RFJIYkJMSDVzWi9XN2w4WVlKVHl3MXZyYmw3UEFNNHUySmFTSGpSQnRPbmdT?=
 =?utf-8?B?T2RoVnlINmUzckNGM0lZeHNhZmlwaGZSbjlXdHFaQWlsTkpVMWxoVHhid2kv?=
 =?utf-8?B?czVJQzBxU1BRM0F2clRqaDBTcG9wUU00d0IrL001WTVpTjMzTHJYZ2ErUDFP?=
 =?utf-8?B?V3NVME5pQWszZGxPc3l5L0JhOS82cGJTQ0JYM2hkTDhHSklLY3NXS0E5aXgx?=
 =?utf-8?B?SjExMlNkVWdLMDZHMERtVENLQ2RVNG9IK3FjbXUzMGxtWi9CcFVIYUZabzdH?=
 =?utf-8?B?OGk4eHRWck9JN01CMlFhcFVFR2tJOWNLNjB4ODhjMFI3ME4yL2RiRGRkTEhW?=
 =?utf-8?B?Z2Ixb2hibmVIQjZFMnh5NjBWejMxQzYxMU52UFhtd0w3VHNkb0x6UEFxZHRR?=
 =?utf-8?B?SmpLQStUWmdTUXRWcXlkT3IvdTBwdFd6Qlp4VVFaNXZCN0dHb2hoa3BpY2pU?=
 =?utf-8?B?ZEhQSHh1N3ZRV08yOXVETmlRcUVIVHl0bVI3RDlFZ2NvZ1RhZEc1ZExIanVR?=
 =?utf-8?B?Q05DUmRBbGxtUWtVYk5jMkpmMFg3eU5UUjZVLy9rMGJoK1RBR21nL0piV0N6?=
 =?utf-8?B?SHc3VEJTcWNWNXRVL1RrUkZwMnZzSmZrWDB4cjdYWXF4RDA4OWxiRHdHdlM4?=
 =?utf-8?B?YVZZZjRhVk9NNEllUGk2cGgxdWJGcU9rd3haMVMwUHFtQlBlS2Q4eUNhWVVo?=
 =?utf-8?B?M3ltRExlYk1NbjZnMUZYYWtaazJzc3VnaHZUU1FaeitObVgvNVBQaWFqSjl3?=
 =?utf-8?B?bmJqbzJibG9FRWRoc3VDWWkvQW1idmtJUC9BSzh1QUswbURrQktNM3lqOEp5?=
 =?utf-8?B?NUF2Ui9OaWZ3V1l2ZEtWMStBQU4zWXYzV0lncXZtT09EcGFoRWJOSEJWT0ZC?=
 =?utf-8?B?VXR2bUErOUxhM0ZoR0VFWUVoUmplZmRMM1dmZ0VEN3F1aXpraGVlRE9OcGtG?=
 =?utf-8?B?WHArTGlkMXlWR1dCMjVSbisyNERET0JtZENTbms4czgvTVFGOUpZVEdCUE00?=
 =?utf-8?B?MmZuZjdHeW9Ta3M0SFNSaCtEeUhlcUxFZ0hDS0hsU1EyV3pGZnZ0aklQTTZn?=
 =?utf-8?B?NFdVTnAyMFpWVDNyVnhndWFjRVo0RUpGWWgycmV3Ny83R1BpRWI5SVhrd3ZL?=
 =?utf-8?B?Q0xEeGh4YWNEZlNETmZqU0NlZXA0bmVTNS9sc2tTNmYzUzl0dnU5WVhDTmRv?=
 =?utf-8?B?YjdXS2R2RUJRSU8wK0tvdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z05JVk5hR3d4djZrdXhEWG16U1lsSExlcXVIS2RwNjlxY0tESjB1OFZIU3BK?=
 =?utf-8?B?ZlJJemNRTjRRdnBwMkZYMjZ6eGVoMVBGWDdBRXh0SDhCNURQMENPelY1bUdw?=
 =?utf-8?B?eENLVWp3ekMvN3NuNnlneHpGTHR3d3pYT002Rm05NGJJeHh1K2xFcEVZRitB?=
 =?utf-8?B?cmU2SnpyMlN5SkMvb2hWNDhQRHBISzV6TE9mK200Y3huamJFRENTYWltOVRw?=
 =?utf-8?B?NmhTeGNzbkNKenJaVHRaY1pvUzhuNEdDMEY5OER3SnpmUG51TitreTBNSlpL?=
 =?utf-8?B?RmlmcEV6UnMzeFJSbi82U3loSnV0ZzJ1UjIvWThYeUFjL2puMENpK3ExblJx?=
 =?utf-8?B?SzE0Q3BGZkNKUDQvSFNlZDlBdFFEN04yVEh3MUUwSmFyQmRkTzJqWnNYMkxD?=
 =?utf-8?B?L05IRWhycEJKSXhxemlVVGh2U09JbzhnOUg5VkxydzBQeExERWdrWm1OdC9T?=
 =?utf-8?B?cThMc3NHNDFYQ3llV25VN2FwWnNFVk5Sby9UQTVFa2tFTlY0dHJvakw3cEZo?=
 =?utf-8?B?KzgrbEVWVFRWcC9UbXZiM2U4U3pKSzZTY2NOVUZFTHpYTFk5ZlM0bTZob000?=
 =?utf-8?B?Q2htMjMwYTcySTg2eDJBbldhRHFHNjNvVTRRU2NBd2JHQ2JXdXZiU1h4Z0Qw?=
 =?utf-8?B?OG5rYlZjUkNFQW1pY0xIOUhrSExoMXFQbFlYWldka25xVllqd0QzSGJSWXNo?=
 =?utf-8?B?VTVvOVA5blY4T0p2TDRabjF5NW0ySzBMTXhvNS9wZmMwQ3NWRmx6RDNQNXJi?=
 =?utf-8?B?N25XUHZOaFRJbFRwd0dLNTM4UWJiT2JnUTloMTg2QVFMRVpRV3NXNjc3Qjl2?=
 =?utf-8?B?UFB1TG1nU2tFcnMrckIvdTRPUFMwZUtramw1b2daUVozMnZKZEUyd1hta3B5?=
 =?utf-8?B?RjVnckhXRDlKL0xwdThTVzlLWUZmazJLVVJ3ZjRPRmk3RUtIVHlHLy9CRVJh?=
 =?utf-8?B?NnBMdHJoNFo5WmJ5Y3E2YjZFZy9jRThmUjF6akZuZURIL0dWNFZZa08rNXlr?=
 =?utf-8?B?TWZQWHo2T2Q2QjZUeDgrYVVKYnFCayt2UjhwdnRVK01JM05SR0t0dlBQaXp1?=
 =?utf-8?B?NEVXd0pZU0YrSUhMTjJLQkd3T2s4UDdFL3ExUS8rWm9keTRwTFVJUnh6L2RK?=
 =?utf-8?B?eW5HYUVqaUFwdnBoUityOGFlZGF3cHVFS3J1bU1QdXdpMmptRGFvblZGa2pY?=
 =?utf-8?B?VGVKVEpQWm9RV1ZuZTNIRFQ4K2s1M0RsZHpKU05OaWJzVStkM0prSU5Ka0lx?=
 =?utf-8?B?TjllTXdWTDhTaTEyUmVPVVVqY0RwcjVOb0s0MEVXNmkvL3krRGlEYlZSRFNQ?=
 =?utf-8?B?Si90WmhoT2FWd2htZTJ3aGoxNG1VTnZLQS9DVXNOblZjRkR1elQwQno4dEhS?=
 =?utf-8?B?YzY3MFYycmNER3BEQUh1a0lRbDRpa2pWdURZbEdmekQ2SmdCM2xMZzZGSnl1?=
 =?utf-8?B?a1N5MEdKbGlQRWFyb2EyYVZOcW8rdkpBT3JhYlN3SWxycFFiMFdza09SMXhV?=
 =?utf-8?B?bW5pOElBZmRPZmQ1UWZKakIwUHBvV2dGbzRxSk10NFR5MXpSVjRFVHRjNFVV?=
 =?utf-8?B?YjA3QUFMZG8zanhKeVl0alI2bVZRdm1WL2YxK1lidTFRSTdsNGtZRGN4Sm95?=
 =?utf-8?B?c1VNTGlkeEdSRG9NSnJKVldBRlBTdG1zUFNvMVR0TWdBeFcyd0J2OTVOdytw?=
 =?utf-8?B?dDB0bStCN002cTZ4bnNwNDlvajE0RHJ5SHhMeFZYVW9hNWk3WlNNQ0QxY2Zz?=
 =?utf-8?B?NXNqUy9qZ3NaUStIN3NsY1lDTHo5ZTNmQXViYlJwWnFWSEV1SFo0OVFLdUwv?=
 =?utf-8?B?QzdBY28vRmtna1B2ZVI1dnRIYnVRUWMzMU9wZDVYTUhWUGNVY3g3aDhzcmhE?=
 =?utf-8?B?ZG5Wc0J4MVAwU1o5SVd5WGJkTXA2ZitxUVhIZ2hIemt0RGNYckdUZm5sQVlk?=
 =?utf-8?B?bTF3S2xqNzFhVTVReDVjMGxSMGRobEpvVjZ3QktSSHcwMmwyS0pzR2M2UmN1?=
 =?utf-8?B?RVd3eGhlSmlLSjlEQWlPajFmTSt1N1ZhWHpDdUNuNXZNTjNtck9kanNkSGxO?=
 =?utf-8?B?RmVOTis5V1VDa1BJWmsvVWlPVDI2WWJrR2liMmxWcDN0YTIwb3E5dzhVckRr?=
 =?utf-8?Q?pnY1+e6RVsclVZkgyJZxr7Ekl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d604e12b-13c0-412f-20b5-08dd0db959d2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 01:26:28.8847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kL8CPU5pvgQfEzajFeuaB8fqnHQoVlhWtKMMMFEB3X1yFwJJKjEPt27SwKnAR65NwptNcybPXGu6oNHBb37TbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295
Message-ID-Hash: 5BVJO322IKLNGCXPUVHMQXJ3FAXSSUB2
X-Message-ID-Hash: 5BVJO322IKLNGCXPUVHMQXJ3FAXSSUB2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BVJO322IKLNGCXPUVHMQXJ3FAXSSUB2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/11/24 00:21, Vijendar Mukunda wrote:
> As per design for power off mode, clear the wake enable register during
> resume sequence.
Hi Vinod,

Could you please review the patch?

Thanks,
Vijendar
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 5a4bfaef65fb..96a3aa6da711 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>  		return amd_sdw_clock_stop_exit(amd_manager);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
>  		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>  		if (val) {
>  			val |= AMD_SDW_CLK_RESUME_REQ;

