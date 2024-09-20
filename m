Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA6997D2F1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2024 10:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42343DE5;
	Fri, 20 Sep 2024 10:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42343DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726821830;
	bh=JBXUQ4WpFR4QSjLf52V9h28A8kOSkijKT47Fyfgra6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FCxLM0F9EnYDP3CT6eQ/F3HruODDnmX9MMstLIqB2UQZWV5cJQCWHNQck13s+b6D8
	 RIxbIiWqKtP18S1Qj9RaQX4mCWcyoIq28ku/NUNqUpXyNbREgruBrqkM9rl2H4Tqi2
	 MiPTjyLn1yI3CJkbR5jjWQvmA3vr0ydNkV/qZXC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B7C7F805B4; Fri, 20 Sep 2024 10:43:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 956D7F80269;
	Fri, 20 Sep 2024 10:43:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08128F8020D; Fri, 20 Sep 2024 10:43:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7182F800D0
	for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2024 10:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7182F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NvVf3ttN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIYZOOOkoIyAQfSC4Q0+Gca92KkP+/M+VON+AUqd5SDyG+Pjo52j8IK6gvlm0K8oR3s34hUpPe6RdMsJBMXGJRbLm/+zRvpElkHYHQOS7BDEW34VckRUlpW2Mv2vDfBlecj/PpUVhLSidrsjwGp5nM0OsrPIjiNwr3kem5hXEG2x3PBpbq4UyU0lbKtitcdvBuJV9X2oBQYee9XgexYzfSw33vB144ml6HRBk0aKvcXUHhCWTkkSyQesHYkh6tR0SP10VRvFQubV4wMx67WTIw0sVNMThNvXGA+BwB9H8gf+KeGeIKGWF8V8o3kh9np5ctfBCFw1d+hegJ8he0GJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvN2pdrZEZ6PC5qW8VKMTV9xulnhcF2J/m/LBKIwOng=;
 b=oAWknr0foBgXz6w/2OUFOPWkiuLiWXWtsa0xRYRHLHXJyWPjAzS77Zjw0Htd0kLMciuucXtIkuxe1TIRUWOiFMy9Aene++QWI5R/SJE3TgipRFkLzB6CCefFvlnSXyt1HRQE0Aq0pCbm9mvRBA39cGZM2EH1DhV/FI5lrFVyoZLniNb6sSWX6JA6OXMnOgO+XmU8TMrhHHVzcgY1l/YMpHJjxV5NW2kQPEV8kURhy16zbJRtb7cyqCa5tLj0ckFAAHlhld/XIbwMOULXt7woYY60YpmRqxJ33sRp/MxJBsS9YIdpeUfP5WbqFA5lA0uhBAuly0LNBaVTLgEK21q4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvN2pdrZEZ6PC5qW8VKMTV9xulnhcF2J/m/LBKIwOng=;
 b=NvVf3ttNTsaTkNoRRkTLsxpTZv+Pb5rcxBUOhcV8KKNdMB91T33mmbZiyJJnXXIu724UrVyP701On5D0uWSiE/ifItiCgHeoEaA0KlAPzKJ/3Kj+YPJ3WcMqutl0HmEfq/+RJG1Kgs7H8SRQEsMedDsAN8HRWW4pJ8DQiM2alD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 08:43:07 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%6]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 08:43:06 +0000
Message-ID: <97a0db99-2cdc-4ab2-a6ac-a08777e9b957@amd.com>
Date: Fri, 20 Sep 2024 14:12:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ASoC: amd: acp: refactor acp version differentiation
 logic
Content-Language: en-US
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::22) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: db3c97f1-e826-45e4-6e6e-08dcd9503f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R0h1Q1BKU3hTaU9RbU9jMm02Y1FaVVpWODVnWXVIRFZpR0xMelRxL0NrcmlE?=
 =?utf-8?B?ckRBQjVOVWhKMHF6Zlc0bjZEbVBhZk0zNFh5c1FUMVpSODNRVDlzQkhtSVBW?=
 =?utf-8?B?WUFtNEJFM1E3S3g3UFArRWZsTUo3c1JhUlRIL01JSkU2VkxTNGM2dlI0TjhH?=
 =?utf-8?B?dTZuT1ErVEhTWURtdC9SR1Q4MWl5Q2tjMzlyRXBCQlk1Ynk5YXd3Q2tHWmxh?=
 =?utf-8?B?VSs4V0R0QVBYZHFzelRyaFpnemlZeE1LSXZWWmJ6ellDSVU1Z3JIRjNJNTFi?=
 =?utf-8?B?QkZETUxDei95aHd1c0dOenQxN1h6RW9wTUpsSE5EdE4rcUxISnAyZ3RZaGVR?=
 =?utf-8?B?OFRMT2tHSklWUFFWQTJaN2M2cWpTb1BXWCtkVE1paThaS1NwaHl5NjVuNmpk?=
 =?utf-8?B?blMvcmpKaTNOU1drK0NPWFI2c1hUSlBZamVBanNmeGdXeXBJRllIOEgrQlZm?=
 =?utf-8?B?Uzg3YVdTd0RXU1llYm8rM1BZeisxdXlqQkMrek5kWFRyeXNwcENLRVMxTmIr?=
 =?utf-8?B?U2ZIYzlaUFhLZjROY0ZXWHlINU9JT0xkdVdVajhDWXRkZlJWcmNyTnZ6WjdR?=
 =?utf-8?B?WE9JVW8zL0p0ZnJZNlpnKzRqdUVKOGthdG1Pc1l4eVBqZjFNejRlRTFFRjNQ?=
 =?utf-8?B?OXI5aUxXczZqRE9JQnBSRDdEQ1ZRWHppU09ZdHVKTjZwSE1kVDZJaTlPSDky?=
 =?utf-8?B?ZDFKNjBtL0lIKzVBVHhoUkRzcDRHZ2lwM1VhZG1pYlYrUGdvYUtndWROcTE0?=
 =?utf-8?B?SmRDWW9mdEVNSGV1RzJqSFh0Q2JFY2pkdUdTSEhxdFdQVC9vYVU4aXY4T2M4?=
 =?utf-8?B?Rkx0ZU1WME5nZm9xdUh0bm1PcEEvaExaZ0xwaG5ZSU9KankvQlVOWUtjdE5s?=
 =?utf-8?B?bWt1R3h5UHZOaTRMcFNUaU1DSDRPZ3F1S1ExSExnTUFqT1IrQWFPMDgwUDND?=
 =?utf-8?B?bXV0NENXdXZKY0lBaUg4cFpqZjdXSGVRS29OVVEvWnlDSnU4Yk00RDd2ekla?=
 =?utf-8?B?WlljTzg1YjV6d2ZRd2ZVWE8xMTdzNlpObE1CaVRsd3Q4akZiQmN2by9aTytF?=
 =?utf-8?B?Ty9uSk5XWkxKWGhWOS9Ldzc0dEt1aGhOMmZzWWFIbVBpOXIydm5SNjZmVlBP?=
 =?utf-8?B?NlpIdWZHcUNWRVBRM0VYVUdydzYzWFZVRkxCSkxtV1AyakNrUzIvMDhqVm9J?=
 =?utf-8?B?MFlIaFRJa25hbjVPa1hkRTZsUEJLQ1VaU2QvdTRBdUU3cUJoT3R2WG9TTHBE?=
 =?utf-8?B?L1FIZTA4WkJZZmxaVitXOWNqdWVabko2ckdqUkkwNW0vUmtUSVY0RmR0aHFq?=
 =?utf-8?B?ZFVzZ0Fkb1pCZzhQUEJqdzlNK3dwZ0JCUHAvOXB0bmg2RWNxd0FGUzNkUWNP?=
 =?utf-8?B?MGdCNTl0N1ZQNktYaWZ4ekVwMmF6dWU3bWpiUVBaV2VDckVvU1NmUTFtN1V0?=
 =?utf-8?B?eDhuMnVjbDRqNlcyK05RS0ltdWovL1V1UXoyZzd5emFsMktJU2IxbSs5NWM3?=
 =?utf-8?B?empYdUllOExDTGFBM1BiQU9RcFZMNm9oL2QrTnNUdUZwWEpTWHkvcFA1STda?=
 =?utf-8?B?MjRvNVJzWGRmNlJISXBPb1FjMWsrbUt0TG1qVkFBWGV3MFZJN01mNkdFUjdN?=
 =?utf-8?B?KzlKS1NrZW9FY3hCUFlYSXB6WGtEaWdDdHJIZnJGb1M4NmhxL0Foc2hjSTR2?=
 =?utf-8?B?cWQ5N2RNeGpxSEtWdE55aWloUTk0ci85emlzVFhOa3Z1TDVXTDZESFc3RzJy?=
 =?utf-8?B?ajVqUlUrd0pjdWRqZE9oaWhJU1hvaTZjbHRiTGordk9Tb1FUM0FQRW5IRHlC?=
 =?utf-8?B?L2tZaEU4NkNSenRPSzJ0dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUMwVnAxaW1HOXZWM1JGRHE4MWxuSHhVR05tdEE4S0NuZW9JN29IZyticnov?=
 =?utf-8?B?YlhmWDdSMGRkcWdqUUJsTDFzYnpaclVPcEZMaUM3L2wrOXVwNmNpaW9FeEFs?=
 =?utf-8?B?ZXA2alh2SXNuNkZVZTNNTmhhOHN5a29IZjkrbVg0c3Y1OW1aNEtIV3ZHTHpJ?=
 =?utf-8?B?dzNrR0hxNm1NVExRZGZ0TkwwZzlDdHhXNVpKODFpSCtVekdUclQ5YnBiN0NH?=
 =?utf-8?B?aGNHcmRlR0YxWW5EdjhFMysvVVJ5emVKazYzQjlmNHhzdXo3dURlL2I4TmdN?=
 =?utf-8?B?Y0VhOEdVQ1NnVUJxclVDSUpmRU5UYnlMQWFLOXI4ZlBRZ3JteE1CSk5JWmc5?=
 =?utf-8?B?b0ZBeHdiL1dqUGN5WE15RkJFZ252L3BJTEhKb0NOR3JObnlxTTlDQ0Y3WGFL?=
 =?utf-8?B?eTlwSllncWdUZTRxd2F2UzdLdVFvbDVVSmdpRHFxQVQvcFVPNlRBbTYweE1Q?=
 =?utf-8?B?VTJtTlRyeTIzYU9HN1BsdlZvbzR0cG9FcCtmbk1BeGlsYldUY0VPZzdrVWxs?=
 =?utf-8?B?Y3VhMk8vT3c5MmNnYkRSeGx5SFZpNnVGOVJTMUhyc1lrbnZzZjVjUlJDc1JG?=
 =?utf-8?B?M05DejMzRHFOaVpWaXY2cUxBR1ZGMmxvbTUva3RhcGl2M0MrQjdIM0lCeGVs?=
 =?utf-8?B?bWdKUWJBQVpDN3JyTDZOU01wbkd2TjYxZXRxT1dlQWhneEoxMVBQTnVwVGJ5?=
 =?utf-8?B?Z2I0NGQvSTM1c3AwRm9qV3IvNjM4akN6QUtuU3YrcFhtaHJxcytLMVAzZE0r?=
 =?utf-8?B?VDBYQVVENGpLR1dHbWdiWVZsdTMrZ2VTNkpteW5rcFdLSk5lKzVPdVNwSktP?=
 =?utf-8?B?QXRzR1IzVmtWZlRrMFAvZnRRWHNrajJyVWZPSTZhVFpzQURaVlRJOFc2U2gz?=
 =?utf-8?B?bFNRSWNGZStJM3AvL1Z0czdEUFd5Sm9XSnpmcVIrVm1CMTM3YXplVUZxdlVZ?=
 =?utf-8?B?T3RGWnFjTVVZb3RTZXUrN1hqd1NSd2dSbDljbHd6VUFjSUlsMjUvNUZHVWdx?=
 =?utf-8?B?Z3ZraUh3Ym9KaFh0SkN1RGltVmFZRW92V0lNWmQ5TzdPamZtM29WaGtYS3Ru?=
 =?utf-8?B?VGt5UGlPUm1LbmxMdEpTKzhuUlBWaEJWMUJRLzQrQWZMMWFFOFhMWklaQUxT?=
 =?utf-8?B?c1IrSVBveUhSSkdDb1lKcm5TbGx3V01mMjltWUw3QVR3LzIyZVVWbmZmd0JI?=
 =?utf-8?B?a2phbWxkZmpLcjFHcHlJUWlhcmRTcDZvaG01aHpScURnVVltdjJIbzlKZWJr?=
 =?utf-8?B?TUhLang0cUJzRjVicUpKL1VabmZaaVVXdEhIVG5TL1JIRmFYSFF1WnRNNEFS?=
 =?utf-8?B?V2kvS21LZTB0TlMvOW5vYld3RkVpUmVKSkViRi9PZXJtcTZzclZmWGRYSHFj?=
 =?utf-8?B?WE1PUUlJa0lCUDJLQmYvL0NKb2paY3hCRGNOWnp0U2V6c1FMVWpBY2grcnZJ?=
 =?utf-8?B?V2FBRktQOWg3MVFxZ0JyeHJ2dzhDMGs4MUZ2VzQ0NlNjU3VmNFFJRWkwajA1?=
 =?utf-8?B?N1luNXFVSk1MbmZRa1c2Vzd0MURrL2xpUUljdjlIa0RxYkVXTTROd0pqT0ZE?=
 =?utf-8?B?U0N3SFQzMGl2Mmx3VHYybmpOZC9iTElrNVZ0cmtKK05HQTBoTlNmR2dKSTlC?=
 =?utf-8?B?WGRSSWtTUE5jY3ppMTd4ZG8reEx5RXQyWUduaEtxWmdqZFBzLy9UQ2RyaWVz?=
 =?utf-8?B?MnhkTmpCOGRtN2swM0lGMlNBakI0VFdVeDQrcmNHNE83ZFhDWkE3b0tFSXdk?=
 =?utf-8?B?Y0lZQnY1Sy9yVmNYRWNhWE05ei9MWk1hbHRacWhCck84VUREQ2NkN2g2NEdW?=
 =?utf-8?B?VmVVS2RtVERnWitqYUhtUlZzVjlKTUw3b3VYc1J0S3BnZm9pZGpUUENLbzRC?=
 =?utf-8?B?Q1lHSEFpaFcwS0k2YjFPQ3pqSVNBVHFYaEw2OFpMU003ZWRuTDhBcU1wdVNI?=
 =?utf-8?B?VkphbjFudzc0Z2dQOUhzL2ZTUUdGYlc1a3JDeTZCYVpGTFJUK2FjVEdqdVVk?=
 =?utf-8?B?VVZiREJockhQTVY3YlNXTWRQaUxtUnZsVzFqY2MvLy95QUVlWVdOVFBhdm9o?=
 =?utf-8?B?ZmNzYStBTm80bzBwbXlBUEF5TFhIMXlqTCsrTFQvUEkrQS9xc0FCdHNxMmhO?=
 =?utf-8?Q?KUZjunDUtxk4HHxkeSI08veIe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db3c97f1-e826-45e4-6e6e-08dcd9503f68
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 08:43:06.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 197W7fZ46OB34Rr7Y/P8E/k86oFNmgUQFDLmsr90oUvEPf4myfcBj9i09mmBT+lJ1YSWtkQdsYnwPvw5konxLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364
Message-ID-Hash: N3NZQXR34LHFIJOIOFICGWK5RS6KRE5Q
X-Message-ID-Hash: N3NZQXR34LHFIJOIOFICGWK5RS6KRE5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N3NZQXR34LHFIJOIOFICGWK5RS6KRE5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/09/24 11:45, Vijendar Mukunda wrote:
> Currently different logics being used in the code for acp version
> differentiation. This patch series refactors the code to use acp pci
> revision id for handling acp version specific code.
One more patch is missing in the series.
Will add it and re spin the patch series.
>
> Vijendar Mukunda (8):
>   ASoC: amd: acp: simplify platform conditional checks code
>   ASoC: amd: acp: use acp_rev for platform specific conditional checks
>   ASoC: amd: acp: use acp pci revision id for platform differntiation
>   ASoC: amd: acp: store acp pci rev id in platform driver private
>     structure
>   ASoC: amd: acp: pass acp pci revision id as platform data
>   ASoC: amd: acp: remove unused variable from acp_card_drvdata structure
>   ASoC: amd: acp: replace adata->platform conditional check
>   ASoC: amd: acp: remove unused variable from acp platform driver
>
>  sound/soc/amd/acp/acp-i2s.c           | 38 +++++++++++++--------------
>  sound/soc/amd/acp/acp-legacy-common.c | 24 ++++++++---------
>  sound/soc/amd/acp/acp-legacy-mach.c   |  8 +++---
>  sound/soc/amd/acp/acp-mach-common.c   | 38 +++++++++++++++++++--------
>  sound/soc/amd/acp/acp-mach.h          | 12 +++------
>  sound/soc/amd/acp/acp-pci.c           |  7 +----
>  sound/soc/amd/acp/acp-pdm.c           |  2 +-
>  sound/soc/amd/acp/acp-platform.c      | 14 +++++-----
>  sound/soc/amd/acp/acp-rembrandt.c     |  4 +--
>  sound/soc/amd/acp/acp-renoir.c        |  4 +--
>  sound/soc/amd/acp/acp-sof-mach.c      |  6 ++---
>  sound/soc/amd/acp/acp63.c             |  4 +--
>  sound/soc/amd/acp/acp70.c             | 14 ++++------
>  sound/soc/amd/acp/acp_common.h        | 19 ++++++++++++++
>  sound/soc/amd/acp/amd.h               |  9 ++-----
>  15 files changed, 108 insertions(+), 95 deletions(-)
>  create mode 100644 sound/soc/amd/acp/acp_common.h
>

