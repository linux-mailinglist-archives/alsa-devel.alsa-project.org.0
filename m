Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1659BB7F5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 15:36:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B3CE93A;
	Mon,  4 Nov 2024 15:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B3CE93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730730985;
	bh=aOPt74lrxCIXZc+L7Pj2zp+ywS5Tu6JfsusiRdrSS9Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XUAZQF00EIQHQOHqBhoiG6HZVH7pJ6N1ScFcPSMBnCwoiuYrqVWATVS9Mybi5L+sh
	 Wd4n4Jfz9goPg798qaqliVsptMrLN8LzDZjh4aIonQTkzkMY7snGjRd8mnDFJyq2nP
	 qinbpDYtFI2+W6aSiU2Ne7tUuA3VmopyAuOpUHws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD732F805BD; Mon,  4 Nov 2024 15:35:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED14AF80588;
	Mon,  4 Nov 2024 15:35:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27BD8F8026A; Mon,  4 Nov 2024 15:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::622])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD2BFF80104
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 15:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2BFF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=gZqn7I45
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BF5ayp8z4JMmiq5ZGp4LnltjjgJJbUOl1w5vTRK7BrffCOQXOZeZTjHZwL290ZcM2VDYQsrARAuzjzofJjoVwvdcn3xoYnLssQSeU0WtXksVhKx3B6vcUZTWrD+KaFB+8f7N5AfQ8hZ9vFOT/O8DI0xPGx1EGm9sxZWkirGJnxe1Yi0UqYgvzXDPZ+zarKgohmYxbfeevvdvCTLkp1bwa39OnI9Biy4HntPklI4O0KD4t8TM13Wnx5DyjvRUBiv+gUG0c3DU/ER+dwlQWtLzv+GWupA+vmqluin8yNK860e63nNJIcwm+kiMYoyHPKhDBkBGMKNL89lB0n+gww3nUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOPt74lrxCIXZc+L7Pj2zp+ywS5Tu6JfsusiRdrSS9Y=;
 b=M8gLuh8MXI/ViJMqtfcbqw4MwXTsQIRkl7vXlSt8BLP1ShNudM29CjDdDMcohpGWnTQ2g1tlaXwKz3KlKDlU3pPMyr9noxN9DAptP4DwveB8valYpmUpx4M5pmhQokoP25cZSCw3YPimKNEMyI+El8SplWSRXrIw09QEsctMxAeOQ5INMvdPlTlIrSbIvhikj4ovMo0MnTU7i5TZXuX97wXx39euIZWQg8B5u3OCKav016T7TOV1Tq19CLCWDcW4zqG1tPEFp8U/ApAfDpCagBNsNNiRgTL0QTx8uIQ2CWcCajeQcvCD9czl6iKCbCRSN1mmAgZtDhVGNvX7RZonnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOPt74lrxCIXZc+L7Pj2zp+ywS5Tu6JfsusiRdrSS9Y=;
 b=gZqn7I45dcHAXYJHfOSbTLhCewtKAaCcGBzsmV6Kx+Pnzh4VBgDbA+/pe/wuo5WvCiF6OulgQ8uTha4VwhgJXZfxLAvEjNVsCCFlKPoYty43MecBJfPt9sUCgo52Z29mliDiVXaT+h6drmH7LbYPomRfw8j7iKVSn2wghCENGSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Mon, 4 Nov
 2024 14:35:38 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8114.020; Mon, 4 Nov 2024
 14:35:38 +0000
Message-ID: <4843851a-edde-4d8e-b311-46b980dab5e8@amd.com>
Date: Mon, 4 Nov 2024 20:05:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix for ACP SOF dmic tplg component load
 failure
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
 <36b9646b-8c70-4c7e-8398-ba22331e0004@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <36b9646b-8c70-4c7e-8398-ba22331e0004@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0177.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::32) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: d0cfe933-c2ea-4e8b-36a1-08dcfcddf361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1dxMkVCQU9WdGNIZlhzR1ZsamMyUjRpRTB1QVl0eUZtWHVBNnlIK0FxMWd2?=
 =?utf-8?B?ekpickk3bllXVC9ScDUzWVZJNVFGdyt6b1BvTWZuYUJTR3dLRlpqOG9qSFpo?=
 =?utf-8?B?Snp4RFZ3SCtKSFc3VXpqUlg0cmFqbkZiWGwva3ZqemxXa0N5blNUZlBIMVpL?=
 =?utf-8?B?dXdlNW1QajM5OXYwRTg4Mi9iVXV2TmVhYzRicm1zcFcvUXBQUFVrSEczSUJS?=
 =?utf-8?B?RkdNL0JZakRyWCsrcUhkank2M2lRNFFZN3k4MVlkZXhyUVI2RVpGcFppVm1u?=
 =?utf-8?B?d0hCZFNSZHdKZDhycnprcnJubGZpUVpDTUF5NGYxS2E2SFNrMDB6NitubXZU?=
 =?utf-8?B?TFZUYkMvMGYycnVZRHZESm5lUEdoU016SThKZ3BjRjFuUFV0bENsWUpKTWtO?=
 =?utf-8?B?V3FyRERzUC9pUDJTTU9sYUZaTlpJYVR5Q3o1UWhieElLRjh4c2VKdE5zNjdE?=
 =?utf-8?B?a2ZwSkkvcGIvQndWTTYvWWFybVphYktlQmpkVzJacjAyMHMxcUtDVmVTUFpH?=
 =?utf-8?B?THVxdmFrYzVoYW56LzJvYU1BVWE4bkIzWHpXc2k4TDVBWndBZGVtdHZCWDRn?=
 =?utf-8?B?RVUwMXNhUEFXWVBTMERCZC9HMExxZzJDYW9tZkV2SDUwU3d5U1pNYk5HQTFp?=
 =?utf-8?B?eG1nL1gxM1F0UGFXMG5MWXAvOHd1MEtsTXg4YTdXOVlkQ1V4V2RDdDlxMFRp?=
 =?utf-8?B?Q3NCcGZoSFFsUmNoTVZKRU5Sa3M2R0p1dk1tbXdlR0xaWmxNRllaSng5MGVu?=
 =?utf-8?B?RWdUTDhaaW1DbmNCMmJXOW9NZUVoeFg0c2FObldOY2hMUkcwdWorN1FtU0lB?=
 =?utf-8?B?dnJkZFlUZGpmcGFHOCtQZ3VNM3ZsWlI1c2xSVW1aSzM3dEc5ajZGeXVkWUN5?=
 =?utf-8?B?aitlQ2RrYkx2eE9JZ2lJc3RvTVhmYkpwRVBRU0tveXNGcjRzcUhIQ3ZrenBQ?=
 =?utf-8?B?VWVuVWlwUU43bHBvSDMxdDJ2MFdzNkNOeEtvRGFDUkVRQk1aSFliTnFQM1BY?=
 =?utf-8?B?NVR0UTJ3Q29LRndDYVN0RkFZZk5oK1J4OGpWV3JvM0l6aTJ6a2cvMU55V0M5?=
 =?utf-8?B?MzJCTFNpc2IvSHMzVHIvTEMvMGhqN1pNYXlwRlNEajljVDJueWFCUjlvOHVz?=
 =?utf-8?B?enlTQkhRemdjaXJQbHM3YUFXN2pFWlZFMk42TXNaS0NaSkx6TkZKSEU5MUJ2?=
 =?utf-8?B?SEtScllJcDEwTnQ5Rk56aExGVFhkcUZvZExERVdiUTY1VkpKdTNvT0d0a0VX?=
 =?utf-8?B?dnp0OHBBYkplUGJzY2F2K0tGQzI1MURXRUdZSDVUQU05M01Ba3YrbW5IZFBP?=
 =?utf-8?B?bzFISTB4Qi8yc1B6VlgwMEdESXd3b1ozTDNjN2p3VjhrQ2VieW9ScDVCbWEr?=
 =?utf-8?B?Y2FqRzhtYUJ6a0g0enhVQ2NML2REZktlcDN4ajBwUW5ua0s2a05QTUQwVnBU?=
 =?utf-8?B?bGlTeE1yNWVPU0IvUGdLWWU3WmhJTm1YaW12Q01McWZ6dFNhOGdLdU9Zd0cx?=
 =?utf-8?B?MFV5QmpzNDZ1MGR5Tmp2REtRdCs0RDAxcG90dEFaUE1oQTFVWG9Fa2NaeElu?=
 =?utf-8?B?Ty9kUjRQN2VEeDd0N1dVNCsrRnA1alZjeUVSU2RWYUl6a253R2x3Y0xNRHIy?=
 =?utf-8?B?YXc2TkxOdVpHNFlZQkZPV29LYy94cVV0RWs5RWNIMlMvMFYrdzFIeFgvaGtG?=
 =?utf-8?B?OTVYcWowOVFaT05mb3F5THVsOU9NS2xKdGN4YTYxS1hzNFZkQ2lTMUU2bWdS?=
 =?utf-8?Q?mOL+W+/mtNG2Z8+9ia1Jk1hAMtFCg2TM5PgiMny?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WUNVRFN2OXJWUXZJY0xaZXVGRUEwZkluK0ZxZitKWWlhQ2wxYjhTb1dnT1Bw?=
 =?utf-8?B?WEUva3FGSTIwOUErMm40cWxDczlqQS9QSDJpS0EwM0kyV3d4SmtsMzhIeG9K?=
 =?utf-8?B?TDhNQkVxVXZsNzVpKzlwNWZRNWp4dzVmWjE1Wk9xVEVpak5DcmkvajlFMmxO?=
 =?utf-8?B?a3RKVlNwM1dQNTg2dW9VRHoraTlPN1hLVkxHcy8rS3NGYnFRZ2U5Sy9ZUENJ?=
 =?utf-8?B?cG1TY2hOb0N6ME1IcTZtcmJWSUVOa0dieGJYOWJYRVBwUDFPTElJZU5OY1Jn?=
 =?utf-8?B?MjNrSk83Uk9QUTUvWUFLRklDd1YycmZyNlpNeWJGa1FLbTFTTFZMNVNVVFdU?=
 =?utf-8?B?VllKN0wyY05jM3IrRzAra2NHQVh6RWYyczQ3dmdHU1ZOYzYrZktjNHBpUDlH?=
 =?utf-8?B?OE1jc0pKMmwrMGFjelRUNUxZZUtEZjVFSGMyQkt3bC91M3Q0SnRVSm1qRXRs?=
 =?utf-8?B?R2FHK1Zkb2orRmY5Vy8zNWxQMitpTEI3UmVmenIwMG50cVEzMkR2Z3RKTWhn?=
 =?utf-8?B?OFNma0l0Mkt0cjdrK2Q1SldPRGJxU2xnTjVGY1VYd20wUEQwL28waUwzS3pS?=
 =?utf-8?B?eTNVMjY2RzM5SVNpY0tDczZJL1hxVW1Dc0hKMEJoajlhMHNnTjRTSFBYdnpP?=
 =?utf-8?B?dTc4OGFEZzRhRGkydUNrVCtXcmswZzE3a0NnWGJFejkxMUJMT1MzZXo3TkFa?=
 =?utf-8?B?QkEyZzdrRGdwME11TGcvOFhiSkNvNzlPQXovMDM1UUtCREN3T0F5M0ZMdXZP?=
 =?utf-8?B?cWtTdDNXck1NdVlHWkhOMGpjK3dac21tTzR4M2pIcktlQjZiNTI2VkNqVDZY?=
 =?utf-8?B?eHBSUWowMlF5NnVFZlRzMXFVaGtheFlFZVJXUkxwb055SEI4TlBHcEdBZEY5?=
 =?utf-8?B?NS8vUTNRWHlSdWlMRzhFT0hwRlR6TG9PRGkwOU5YbDZlaElxYlJPUUNxSDdi?=
 =?utf-8?B?UDd1Y0UvU1hjMW4yVWpCS3R1Y2ovMHBDMHBmNUJRdUNoNTQ4bkNZdXN0SlRw?=
 =?utf-8?B?cDc4Nkd6RDJjZDdFYmU3U21VWnltN051TFdPa1hCMno0U0xFeHpNRGJBUGdt?=
 =?utf-8?B?cVBNcklOb05rSXh1Yms0d0Q2SllNK3E5TEFOZnU3c2o1Z282WEtjVjZsNFpK?=
 =?utf-8?B?QzJXdTBuUzlibTZ3a2NSVmUvRFhXNGEvN21BUUhjb3JFYlJNU0s2TUNZd2JB?=
 =?utf-8?B?M2lhQnZobjEyY3hld2pmcndoQUVwYXdnYk11bWVZc1lzMGE2UlRQNXZheVF6?=
 =?utf-8?B?STNjb0lISDlkS2NoTndkTTZlM010YUlBZGQya3NnVDd6M3ZoeExseGJVOVdw?=
 =?utf-8?B?VEhUcjdvOFczZG9JM3Rtcm5oRGlOZkROenBxNTJ1WTVpejA4Wk5Wbk9YaEZ4?=
 =?utf-8?B?cVFaeG9wSVNweTNzbWxrVWVnVlpSWnphTTNDOGZ4OVlVY0lPMmU3SkdHTXNR?=
 =?utf-8?B?NzFRNTU4ZFZxZU14RTV0OCt1KzhyTHBpWGhVaStHYVFYSnRLRzh2RFZ5K3Zq?=
 =?utf-8?B?bE9NdUNicVdBOXFJeE1SOTZFdGh0SXdKOFBsVWE1eHhQS1hmaDl6V1JiSURQ?=
 =?utf-8?B?amQ5ZkZ0TnJHWVhBaU5Fd0R2VStScVNGY1Z3Q29IVjF6dFhEaHgvcnlsbWZG?=
 =?utf-8?B?Mi9JWFFIbTR3T3NFYmhGWXJYOGsrR3oxWHN1bXlFMkwvdllGc3poSENzN2pP?=
 =?utf-8?B?MEF4U0pNS2ovRXRWMW94YzFlMXV0R1J5TzlOYnUraC8xSS9MVXhvWEVGR0o3?=
 =?utf-8?B?TFpFQ3FEYmJrTVgwQ2ozQzJPd3cxaG90UC8wV1FhVUVRQmdjSjk4K0VGR0Vp?=
 =?utf-8?B?aitUY1M3eGk3MnAvY2tvUWNTMXVYQ2pRcEd5QzRiZjRkRmZiVERGeGRwNGY4?=
 =?utf-8?B?eHRNS2U2VWxvY0pUNWkwWGh5N1A4K2VsaTJkWW9YdHVndTJ0Rk5SZTgzS084?=
 =?utf-8?B?eEExRi8xQk9vYUlPcG9TVGRGamxvcE1FenoybFh1bUtTTFhKbG1HVXYxcDE5?=
 =?utf-8?B?bVJDUmtJd3I5WXArYXJqY1FZSWJnWGNnNTVBZFFTQ3FZc2UxRUFrN1FNYTZh?=
 =?utf-8?B?OGFwZVBGa0JHVHpRWE93ZEErV283NncvTkJ5Q0s2elprQUNOWTBQcW8zZGlv?=
 =?utf-8?Q?QGFNJIQj4+rPT0yUyTFpH2RLx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0cfe933-c2ea-4e8b-36a1-08dcfcddf361
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:35:38.2830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 g97NrN8jo9WGUWv9shd6wyORm0gcYq+ZPCrccHfsJC+Obl/dgrhure/rtqG3Mkj2n6/QOYbRdiq7klvJpK7JVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
Message-ID-Hash: VCP2XGKR4NENIIPO4ROCE3EFWUQ7HOKK
X-Message-ID-Hash: VCP2XGKR4NENIIPO4ROCE3EFWUQ7HOKK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCP2XGKR4NENIIPO4ROCE3EFWUQ7HOKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/11/24 19:52, Mario Limonciello wrote:
> On 11/4/2024 03:13, Venkata Prasad Potturu wrote:
>> Stream name mismatch with topology file causes tplg load failure.
>>
>> As SOF framework assigns dailink->stream name, overriding stream name
>> other than link name causes SOF dmic component load failure.
>>
>> [   35.474995] snd_sof_amd_acp70 0000:c4:00.5: error: can't connect DAI
>> ACPDMIC0.IN stream acp-dmic-codec
>> [   35.475001] snd_sof_amd_acp70 0000:c4:00.5: failed to add widget type 28
>> name : ACPDMIC0.IN stream acp-dmic-codec
>> [   35.475013] sof_mach acp70-dsp: ASoC: failed to load widget ACPDMIC0.IN
>> [   35.475018] sof_mach acp70-dsp: ASoC: topology: could not load header: -22
>> [   35.475072] snd_sof_amd_acp70 0000:c4:00.5: error: tplg component load
>> failed -22
>> [   35.475083] snd_sof_amd_acp70 0000:c4:00.5: error: failed to load DSP
>> topology -22
>> [   35.475090] snd_sof_amd_acp70 0000:c4:00.5: ASoC: error at
>> snd_soc_component_probe on 0000:c4:00.5: -22
>> [   35.475117] sof_mach acp70-dsp: ASoC: failed to instantiate card -22
>> [   35.475254] sof_mach acp70-dsp: error -EINVAL: Failed to register
>> card(sof-acp70-dsp)
>> [   35.475261] sof_mach acp70-dsp: probe with driver sof_mach failed with
>> error -22
>>
>> Fixes: b2385de2ae11 ("ASoC: amd: acp: Add stream name to ACP PDM DMIC devices")
>>
>> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
>
> Thanks. I was aiming to sort out (null) from `arecord -l` but functionality is
> more important.
>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>
> Mark,
>
> Up to you but alternatively, you can also drop my existing patch and force
> push your for-next branch.

@Mario: Your changes are required for Legacy machine driver.
This patch can go as a fix on top of your commit.

>
>> ---
>>   sound/soc/amd/acp/acp-mach-common.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/sound/soc/amd/acp/acp-mach-common.c
>> b/sound/soc/amd/acp/acp-mach-common.c
>> index 67aa0ad83486..d314253207d5 100644
>> --- a/sound/soc/amd/acp/acp-mach-common.c
>> +++ b/sound/soc/amd/acp/acp-mach-common.c
>> @@ -1561,7 +1561,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>>         if (drv_data->dmic_cpu_id == DMIC) {
>>           links[i].name = "acp-dmic-codec";
>> -        links[i].stream_name = "DMIC capture";
>>           links[i].id = DMIC_BE_ID;
>>           links[i].codecs = dmic_codec;
>>           links[i].num_codecs = ARRAY_SIZE(dmic_codec);
>

