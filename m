Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D2A944742
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEC47376E;
	Thu,  1 Aug 2024 10:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEC47376E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502808;
	bh=tJIgHDbLV3WoLZN3wFej9u4lKJSwZ+P2FeMO5KyWb+E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uaHyyshG3l4iOwZby/pJe4GUaQgrArd12TGLBtgGDOUOTe6fasM2g/eqZW3eJo2dD
	 bWHYUs8IPOMuJYDCuY+tSHis3RywmWRsGoj1JGzZudSrSrLLz+zPrYG2tLur7cG2vB
	 ENVFlpUzdlxSYlqmjugO9hZ8z8jAmOTAzkFCfzZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F41E8F8059F; Thu,  1 Aug 2024 10:59:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A629BF805AB;
	Thu,  1 Aug 2024 10:59:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4C5FF8026A; Thu,  1 Aug 2024 10:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26F58F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 10:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26F58F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=RIStTxRh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ0RuIpJlu5qT31G9lHl/g26+YTx7idL9Etmml3P56uegEWAPQqSBy2n/NpIsURLPBpRJTIU4sYEh6hVjanZcGsfHiJ1hRSbsW7yzDrvlqrXZECpAcwHzB5RBNyYouboY/lgJUwLTBAa1wNA1vp/vIAuFduviTDyVRDglRdChx/TEm5K9uBT0X6JqSVsval3o45LJiSp9BK5SAsgdpFv/RFOh8qNzYwLOU4QzNf2aVzzNsp6UqpMxcFXIMjxNut8YoDQtJB/v/S/UaTa//CcfCocmT6BRDBLYrIF1CjTDNi6uVJEwxqnKfPyQ6rzTr2G1ZFCXOSU/LQWgoxCzPJS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWaBTQ9+u+DZdnvfII4aTlV8DcxC6yPWAFxjsQPL/RQ=;
 b=vVfnuXuqI/h3dcnhBaIYy4r+P4DQeZKucpJ0CRBTGKGYnSf316XllUGNtYNhUf4ihpXkW9sBKV6AzdilC3DUo/abL9Qba2VHukUdx+MCqFCc0f9oNJDKg9AKIqT/flMTUTk232HR1mh3uHHqQJAgY4se7Nc+nGrLZCviGzSFtq0YhxYc35NPlk2pdHYWWxqrzY0CUfA97mtGC4Z4bv2sgl26CXCoq5zBHqp3wnaoQX+8342t2V1bRdO6xY8F0WdCX06w3oOkmy6iVk7WnO0BomLSQjj+e4a78meBVpO6kCVylNizvIbYvZXHFfvGlSM2kC0JdUsFrcjFR1JgfVkC9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWaBTQ9+u+DZdnvfII4aTlV8DcxC6yPWAFxjsQPL/RQ=;
 b=RIStTxRhMTotzVH40STg4/l7I5rSQ9vsyoWKqUHD3QWocx7HKvpZlJmvaQjp762dqPPg+YBXvJmGEnmTiwztRDTzkql8H6WHXmaouMljq392Iyl5bje7LjYFeDzH7USLEZnBlglt90NWU6G8ZPCHXs1wOm2PO+EstSdB7gBs2g0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 08:58:38 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 08:58:38 +0000
Message-ID: <a170e7b8-3f37-4cd7-aaaf-40a1b4a10eb5@amd.com>
Date: Thu, 1 Aug 2024 14:28:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/31] AMD SOF based generic SoundWire machine driver
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
 <c8c86058-42d3-4950-97ce-b1859f6e42b5@amd.com>
In-Reply-To: <c8c86058-42d3-4950-97ce-b1859f6e42b5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::10) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: baf7fa5e-1abc-4e96-64a4-08dcb2082200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?THpudEYxQ3Uyem00cFZGYk4rUzdlQUphd3Uwd0UrQ1M4OWc4TFJEb0NVOXdh?=
 =?utf-8?B?MlFmdGp1cEEza2hXc3dOOU9ydXdGcTBmdW5PSFdNU3l2bDJaaEFBbVJ3Tm90?=
 =?utf-8?B?QVZCWlZ3Zko4N2t2cGNqdFM5YW4ybFRmRXBKOFNOMDlyYjMxSDJ2TDJ1b0Vi?=
 =?utf-8?B?cnNqcXEzdEV2RjFYL1FIL3ZLdklLQWdEVVNTTnhQOU9SSDY0akNXWnBJZHRj?=
 =?utf-8?B?aFZqR3RRZHBST2d4TVRFL2tkRU9JSmVMWG9WQ0p5T3YwRnhVVVhTMTh3bUt6?=
 =?utf-8?B?OTJqWWtVSFZsMyttWm8xOFJxZ2lOM09UckNNNzdmUjc3V3I3RFd5UnB3VXdN?=
 =?utf-8?B?d3FCVk95THZMekFRR2svaENMWWg4OWQ0QmdkUWQzeXZuZ0tzVlFha2pQOG4y?=
 =?utf-8?B?QWRHT3UxTGw5L0s4NEpkcmx1REI2SkZBMmRaSTYxVXBPWlRtTlpvQlpKMWtG?=
 =?utf-8?B?aWQ3a1drVWdHM2dKNXZRQzI1aTByUVF5SW9VUTM4bTFyMkJGYWk4T2dWTWtF?=
 =?utf-8?B?Umd5VEIvTnZQd1JTUjliOGNLOUdmbUhQQmhmdm92QkhRZ3ZvbHc3TXAxVGZx?=
 =?utf-8?B?cW12elJEUnpDN2xRVkZuR1lycStMaFdrMHNGaVZncURDT3RGSlFjajY0eG44?=
 =?utf-8?B?V01QVnVicjg3a1IzV29VbkdrWWlrUFhuV0pPWHMzbVdwRDF3bUI5WWpiNDIv?=
 =?utf-8?B?cnlSSnR4bmZUc0RxVWpKQy8veXA5R0JhYmUwSi9OVjlBUEV3L1A2SHlVVlpp?=
 =?utf-8?B?TndoTjQvK2gwSW9waWo3bmxZS2RPaHRpWmY0TllLY2dxSmt2RVZxYUlzNUY5?=
 =?utf-8?B?ejZteTBUVTg3OFdMeW8xUnhiZlo2S0cyUEorUEdOWEQ0ZG5pMlA3ZzF2SWxh?=
 =?utf-8?B?VHp5K05HWE4xSXJ6T0Z5Z29IQWp6VkJzbTRNUzA3UkJmVkF5STZSUzJEMFkx?=
 =?utf-8?B?TVdISmN5ejNmV2txMzRCWk16S1Jta2J1ZGxJZXp4bks5TXF4MG9hVUZENVJw?=
 =?utf-8?B?N1F5MVZjemF2WVZNdnRjbmkzS3M2Ri9VMHpTcXBUUnVMRHE0YVN3NXlDQnNh?=
 =?utf-8?B?bXFqLzNDR1QrcUtLY1phSzcrMFFpZmtWLyt5WTcvdFhaMzBUNm40QVRZR1BS?=
 =?utf-8?B?dGREd08zalpxTGRJalpxL2xGR3RROXE2QjZzV3ZOZ3hJSWNNL0E4RmF1ZmF3?=
 =?utf-8?B?bjdIbHhhc2hxdXBOQ2VORDRKbUppeFB4ZXZzdWFMbnEwT0NUMXBBRUVvdXdn?=
 =?utf-8?B?dE5nNHY2cVpRZm95WHVwcWZpUzhXc3plajJPdWtlN1lHcjIxeUczeUpxODRN?=
 =?utf-8?B?VGRTMjFPREZZYVBBai91aUlkSVIxM2xyMzhlbS9xakoyNzByMHF2aFQvZERj?=
 =?utf-8?B?S2hrTERMMnRqQ0F4bVVvMjRHQkw0Y1oyejNFR01LSDVYMTRYejdmUG9LM2Rk?=
 =?utf-8?B?NTNCMDZwRTZ1Q2UrYWdqVVlmUllKZmRhekF1Ylo5OW4zbTc2N1liajgrY1BD?=
 =?utf-8?B?VjI2UUlsTzBnUGhWNjR4c1pRTmpJQ2xkWU1vMzFDeUlYS0o3MXVwNnJhMmdl?=
 =?utf-8?B?ckFQckFDVDNMNHhNa1dPMVp1ZEJtWnlseUJsOUthdHhDaVZPUEllV1ZSQVds?=
 =?utf-8?B?WFl3UGdBT2ZtcUEwTVJLeWd6TWhYUTYwQlBjL3BleHpsQ2JkRnNvRVdnb0RN?=
 =?utf-8?B?c01qTS8zakN0ZzNHaTZrV1d6MWwyZ3dxRGxmRS9DcXhtQUxWelViam9vbUwx?=
 =?utf-8?Q?HJps/pAsMZLO5D7P4s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VElTVmdmR29aQU80b05YNDYxUUVtd1U3N3gyQkVBNURIaDBIdWlxSVVGS1NR?=
 =?utf-8?B?QnI5SGwrcjdDcFU1Y3lON0ZtNVlMTVZQWUpZNmMvajF3SHdLV2t1S0FTcHZh?=
 =?utf-8?B?OXNuUEtWbUFMVXVDS3RFaXZhK2FZQzFhZGdseEtHbTJZVmJERDZYN0tSVEl0?=
 =?utf-8?B?aml2b1U2N0dHbVlYS0FpMkE4SER4TzNkY0EyeFQyZkFkK2tVSmc2MHExbG5I?=
 =?utf-8?B?N3ZWZWJ6WTh4T2FWbXNuVHhtMmdYRVdNbHNNdDhGbkpFcnRWL2VMY25HbXF5?=
 =?utf-8?B?RVY5QnFLelp5V00wNnpnUEhacHRibnFVdHN1aUZHOTZlczNDOURrTi8xaEYr?=
 =?utf-8?B?M2FvNXdzTlRNQ3Zkc0VqeVlnN3NTbGQzeE9kaTFiVW1GMkZBZC84QlFXcjhl?=
 =?utf-8?B?UmZkOWNwTXNxdGJrT0R2YllzRU94a29JZDZDdDRLT1dEak1oR2N2MXp3czlq?=
 =?utf-8?B?UnJzRWFkRDRZUDl4UWw0UXB1dThiampuaVk3eTRqTnptTzZkNW9idmJZQWpp?=
 =?utf-8?B?V1EwSkdSTkd4MlJ0dCtTbE1OTEhuNzdNelBYbkdreXBkVzVwU294MnNBQ1JS?=
 =?utf-8?B?aWJoMmVnK1BYUHQrSEpPcVdOL3FZOVpBbzV3VXd4MUVBeHkrWEhMdTBIcWtF?=
 =?utf-8?B?cC9vOG41SzN3b0h2VTQrMXVYbno0bXVCWEFXN3JoRXBJVkZUdE5ZencxL0R4?=
 =?utf-8?B?dXZLZXRLOXk5T1lpQndST2FWVXVhNVNDOFEvV2RVTUxjcWVYelhnYWRVUUV5?=
 =?utf-8?B?b2xWcTNMNml2aXB2ajhCMDU2WklZRE00emlnc2pxR3lzUEV6a0hUQUhMVGMv?=
 =?utf-8?B?OStDUTMzMHlhcGpLZXNnaGJGdm9rckFNRDVKd3IwYThHUFBhaHRVVXNLNG1D?=
 =?utf-8?B?VFBwRUpOeFh4aWRLVGJDTVRrakRwQmk5czZPV2ZOQk02aXVZd1ErM2lZN2Jy?=
 =?utf-8?B?aFJORUFHREVPQTlZb3loZjVQcUFFOC9HQmx0WkQwamhraVZ6anpDUldoY09y?=
 =?utf-8?B?YVV4b0MwTnlCK0pvVTJUdTk5OWcyWWdlL2hrQTI3ZUlzNnMyT3ZsUk1FSUQr?=
 =?utf-8?B?WWhsK3A5LzVBaVBudWNYK3c1UDFpUDNDL09rWjlKeEVCTHBGdVZHSnIwZTN2?=
 =?utf-8?B?NWRwNWEzKy9wYXZxdmFVTUZTSDdXK0JOdkJIcmF6eFRpN0VwS2FvWmJxcy9y?=
 =?utf-8?B?eWZiQ3IyRjJEU05RenlxUzY3d0hWWkprSk4vWmk5VVlFMzdEVTB4UVRkclVN?=
 =?utf-8?B?YUp3czV0eE0yRnAzRFZmZC9GaGRiN2ZXUnFiK3lBVHgzaVIwSUhndFU0bTN1?=
 =?utf-8?B?aStBV1dZKzIwamdLVU1XYnRSTUR2aHZhZnhuU2NKUXlHL2labkFpRE13cXRw?=
 =?utf-8?B?ZURLYThrS3NMN1c0eWVGQ09SdC92dmhmK3FraWFyUTQ4UlpXNTZmUzdXNUFE?=
 =?utf-8?B?R3U5eXdyVThZWTJ5cjkrdkNlM28xVUJZTG9udC8zWEdEdUpKVkE4R1JDUm5k?=
 =?utf-8?B?Rmc2ajVXVCtuREROWFRiMW1xOWdSVUlWdiszc3Q5dE5YRHV3OVBQMGQva2hX?=
 =?utf-8?B?T1dBRlJYOXk1RXhXaStHUmhJdnFtL01jZGVIYnFVYzUzK2EvRk5uVlprWFF1?=
 =?utf-8?B?TmF4U01EUm5mN251K2taVExhaUEzOGd3S1BxYjZ2R0FhV3Y2VHlHbUNEcGl3?=
 =?utf-8?B?czYzbGhGamdvbkRaSnhkZVZkK1crak5qV2xkSGpHK2l5Slg1OE5aL05oWVNp?=
 =?utf-8?B?aXNmWVN3dkt4YUFaTk5ybXA2QjlNWEtZY2NiVHdDcDBqam9VNjd5UE9nZXpW?=
 =?utf-8?B?akpadXJ0cmNNRFBPYyt5WlpiNWZUVkxIL2Y4S1NDQTJDQStYalpUYzFQR2J4?=
 =?utf-8?B?bVdYcldJNGdlcDRiN21jeUtDUTY1S3pmeUZqSVJ1b0JxckRlNHVsRjFWdzk4?=
 =?utf-8?B?QXZIbVY4YU5LKzZqQjEzRHdFeGVKcUVPQjFoc1VoRHpyU3U4NkM2TUhueDg3?=
 =?utf-8?B?N2IrSHI0SnFKdllIaWl2M1BrMEt0RVVmc1VRRXhWNUpXYzNKVjQrYTBJNi9z?=
 =?utf-8?B?c1kwaHB6enhlb3pVSFZjTnZqTTFtSzN5TFRuQk4zZmZrQVlXYitURmRWdnM1?=
 =?utf-8?Q?gd+nT6rbFEKOcjf0MviM1ZhuJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 baf7fa5e-1abc-4e96-64a4-08dcb2082200
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 08:58:38.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mV/M2w5MJa6RytEKNWMIAzTTTOTmc0+064j0z+IgCrPlqyAamLrPYHcGEUtwa3ANPhPbUCEz1a+NsIBRt7u/Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
Message-ID-Hash: HWGFRFKFLUKYM4YPLMZLSOB35G6Q6F54
X-Message-ID-Hash: HWGFRFKFLUKYM4YPLMZLSOB35G6Q6F54
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWGFRFKFLUKYM4YPLMZLSOB35G6Q6F54/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/08/24 12:39, Mukunda,Vijendar wrote:
> On 01/08/24 11:53, Vijendar Mukunda wrote:
>> This patch series majorly consists of below changes.
>> - Rename structures, macros and codec helper names used in Intel
>> SoundWire generic driver to make it generic.
>> - Move Intel SoundWire driver common structures, macros and codec
>> helper functions to common placeholder so that it can be used by
>> other platform machine driver.
>> - Refactor few SoundWire common codec helper functions.
>> - AMD SOF based generic SoundWire machine driver for ACP 6.3 variant
> I am able to send 21 out of 31 patches for upstream review.
> Connection time out is occurred while sending patches through
> git-send-email.
> Could you please suggest ?
> Do I need to resend the patch series again?
>
> -
> Vijendar

Corrected default mail timeout. Will resend the patch series.
>
>
>> Link: https://github.com/thesofproject/linux/pull/5068
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> Vijendar Mukunda (31):
>>   ASoC: intel: rename codec_info and dai_info structures names
>>   ASoC: intel: rename soundwire common header macros
>>   ASoC: intel: rename soundwire machine driver soc ops
>>   ASoC: intel: rename soundwire codec helper functions
>>   ASoC: intel: rename maxim codec macros
>>   ASoC: intel: rename ignore_pch_dmic variable name
>>   ASoC: intel/sdw-utils: move soundwire machine driver soc ops
>>   ASoC: intel: move soundwire machine driver common structures
>>   ASoC: intel/sdw_utils: move soundwire machine driver helper functions
>>   ASoC: intel/sdw_utils: move dmic codec helper function
>>   ASoC: intel/sdw_utils: move rtk dmic helper functions
>>   ASoC: intel/sdw_utils: move rt712 sdca helper functions
>>   ASoC: intel/sdw_utils: move rt722 sdca helper functions
>>   ASoC: intel: split soundwire machine driver private data
>>   ASoC: intel/sdw_utils: move rt5682 codec helper function
>>   ASoC: intel/sdw_utils: move rtk jack common helper functions
>>   ASoC: intel/sdw_utils: move rt700 and rt711 codec helper functions
>>   ASoC: intel/sdw_utils: move rtk amp codec helper functions
>>   ASoC: intel/sdw_utils: move cirrus soundwire codec helper functions
>>   ASoC: intel/sdw_utils: move maxim codec helper functions
>>   ASoC: intel/sdw_utils: move dai id common macros
>>   ASoC: intel/sdw_utils: move soundwire dai type macros
>>   ASoC: intel/sdw_utils: move soundwire codec_info_list structure
>>   ASoC: intel/sdw_utils: move machine driver dai link helper functions
>>   ASoC: sdw_utils: refactor sof_sdw_card_late_probe function
>>   ASoC: intel/sdw_utils: refactor init_dai_link() and
>>     init_simple_dai_link()
>>   ASoC: soc-acpi: add pci revision id field in mach params structure
>>   ASoC: amd: acp: add soundwire machines for acp6.3 based platform
>>   ASoC: SOF: amd: add alternate machines for acp6.3 based platform
>>   ASoC: SOF: amd: update mach params subsystem_rev variable
>>   ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
>>
>>  include/sound/soc-acpi.h                      |    2 +
>>  include/sound/soc_sdw_utils.h                 |  216 ++++
>>  sound/soc/Kconfig                             |    2 +
>>  sound/soc/Makefile                            |    1 +
>>  sound/soc/amd/acp/Kconfig                     |   22 +
>>  sound/soc/amd/acp/Makefile                    |    4 +
>>  sound/soc/amd/acp/acp-sdw-sof-mach.c          |  742 +++++++++++
>>  sound/soc/amd/acp/amd-acp63-acpi-match.c      |   90 ++
>>  sound/soc/amd/acp/soc_amd_sdw_common.h        |   44 +
>>  sound/soc/amd/mach-config.h                   |    1 +
>>  sound/soc/intel/boards/Kconfig                |    1 +
>>  sound/soc/intel/boards/Makefile               |    9 -
>>  sound/soc/intel/boards/sof_sdw.c              | 1142 ++---------------
>>  sound/soc/intel/boards/sof_sdw_common.h       |  166 +--
>>  sound/soc/intel/boards/sof_sdw_hdmi.c         |   14 +-
>>  sound/soc/sdw_utils/Kconfig                   |    6 +
>>  sound/soc/sdw_utils/Makefile                  |   11 +
>>  .../soc_sdw_bridge_cs35l56.c}                 |   56 +-
>>  .../soc_sdw_cs42l42.c}                        |   13 +-
>>  .../soc_sdw_cs42l43.c}                        |   38 +-
>>  .../soc_sdw_cs_amp.c}                         |   18 +-
>>  .../soc_sdw_dmic.c}                           |   10 +-
>>  .../soc_sdw_maxim.c}                          |   56 +-
>>  .../soc_sdw_rt5682.c}                         |   12 +-
>>  .../soc_sdw_rt700.c}                          |   12 +-
>>  .../soc_sdw_rt711.c}                          |   38 +-
>>  .../soc_sdw_rt712_sdca.c}                     |   10 +-
>>  .../soc_sdw_rt722_sdca.c}                     |   10 +-
>>  .../soc_sdw_rt_amp.c}                         |   32 +-
>>  .../soc_sdw_rt_amp_coeff_tables.h}            |    6 +-
>>  .../soc_sdw_rt_dmic.c}                        |   11 +-
>>  .../soc_sdw_rt_sdca_jack_common.c}            |   40 +-
>>  sound/soc/sdw_utils/soc_sdw_utils.c           |  990 ++++++++++++++
>>  sound/soc/sof/amd/Kconfig                     |    1 +
>>  sound/soc/sof/amd/acp-common.c                |    3 +
>>  sound/soc/sof/amd/acp.c                       |    1 +
>>  sound/soc/sof/amd/acp.h                       |    1 +
>>  sound/soc/sof/amd/pci-acp63.c                 |    1 +
>>  38 files changed, 2475 insertions(+), 1357 deletions(-)
>>  create mode 100644 include/sound/soc_sdw_utils.h
>>  create mode 100644 sound/soc/amd/acp/acp-sdw-sof-mach.c
>>  create mode 100644 sound/soc/amd/acp/amd-acp63-acpi-match.c
>>  create mode 100644 sound/soc/amd/acp/soc_amd_sdw_common.h
>>  create mode 100644 sound/soc/sdw_utils/Kconfig
>>  create mode 100644 sound/soc/sdw_utils/Makefile
>>  rename sound/soc/{intel/boards/bridge_cs35l56.c => sdw_utils/soc_sdw_bridge_cs35l56.c} (63%)
>>  rename sound/soc/{intel/boards/sof_sdw_cs42l42.c => sdw_utils/soc_sdw_cs42l42.c} (82%)
>>  rename sound/soc/{intel/boards/sof_sdw_cs42l43.c => sdw_utils/soc_sdw_cs42l43.c} (73%)
>>  rename sound/soc/{intel/boards/sof_sdw_cs_amp.c => sdw_utils/soc_sdw_cs_amp.c} (66%)
>>  rename sound/soc/{intel/boards/sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c} (71%)
>>  rename sound/soc/{intel/boards/sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c} (63%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt5682.c => sdw_utils/soc_sdw_rt5682.c} (82%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt700.c => sdw_utils/soc_sdw_rt700.c} (81%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt711.c => sdw_utils/soc_sdw_rt711.c} (70%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt712_sdca.c => sdw_utils/soc_sdw_rt712_sdca.c} (74%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt722_sdca.c => sdw_utils/soc_sdw_rt722_sdca.c} (68%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt_amp.c => sdw_utils/soc_sdw_rt_amp.c} (87%)
>>  rename sound/soc/{intel/boards/sof_sdw_amp_coeff_tables.h => sdw_utils/soc_sdw_rt_amp_coeff_tables.h} (97%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c} (70%)
>>  rename sound/soc/{intel/boards/sof_sdw_rt_sdca_jack_common.c => sdw_utils/soc_sdw_rt_sdca_jack_common.c} (78%)
>>  create mode 100644 sound/soc/sdw_utils/soc_sdw_utils.c
>>

