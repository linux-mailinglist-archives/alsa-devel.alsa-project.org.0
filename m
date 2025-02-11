Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75460A305A3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2025 09:22:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6966024C;
	Tue, 11 Feb 2025 09:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6966024C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739262164;
	bh=qKguWasAukKX/vr6LRmdIqmywBMmAG4dGs0KRHR0mkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P620+/Io/tHKdiun0W6hp+yCj9aC/cmJTo9W4lq4W+2bw9K2q4kyXnL2wXdMu+aY5
	 egD7bAw8KAAb+HL8UtxfG7IF1h8KD/oIA5cFh9rtEaBVoWqKxqMjOmTp8DGsniyaOq
	 B8oSPsjx1TXuPDGIIsEvfwUlNVLadLQeXllWoZjI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7F83F805BE; Tue, 11 Feb 2025 09:22:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A637BF805BD;
	Tue, 11 Feb 2025 09:22:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1BDAF8051F; Tue, 11 Feb 2025 09:22:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::60c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C067F80134
	for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2025 09:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C067F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2gnHYT3v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqr54alwSiNNMm4VcoeFPX1k/N4dDhiLbNXg3CThVhQzGilncQS+uD/rJo6K57/mXPcYd/20dNh+mQGVJR3cSIvnaJOlY3mWuMmoP3vrquR9lB1gTgyThDOBn0nwUk3EdFFtf3MyGvLibaAzETqfDPgPt9HYqtAG+JpI4+gXCGDMT/tpjmHiuCWWDQM4i5PYnfcmF2cCXIuCP8HuSRruBYsz2HE8bnxsRsus7xEinCXbvV8eJP2XHwq8ceCm1ftM5iHRO68jKXs7tcPXUaAphaba0fKGJJg8i17CD1wsCvHCh+4ZrbjcNwamXLamJKnC92uIit08FSvLY4x0PoPgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLCYkT7mYPYDBlK2MoFUZShMGZTdaxMYRgxP4ZlBDNY=;
 b=UyXGoPxSTKC/cLv55FCOVGLBcOvd7nB/klrfWjKzPMv3mSbuLpYe7bKW2VKimhyKuLShzf4HeiPTTJaheyIkzsvt34ZB5acoCPCaCsUBWXC3UCKQ2BA5wGYrBUPZ5hP1JCg9t0aFFJs211Pr+fz5s5AQVC0sEQjhBdSzILVeue0xtpW6nAbe/7ffSUjEOw5tDRSxz6HgxfJ2LNv0wcOxXpE0ij/O7XWYhZSfGVZahDpuICLIqfKn/S6KGmtFe8B2WZDnTmZJNbVxiSVvPS3Tsuyt7dmqCbQP/rX/m8szcbepQhg/TLPlBSHJ4jahy/GnX0QhxzlggRBbDZIIGEOMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLCYkT7mYPYDBlK2MoFUZShMGZTdaxMYRgxP4ZlBDNY=;
 b=2gnHYT3vmymwWZLqWC4EO6HCYuu06vvSv/poHZ9tbifaczFr6zcbUCSzvl9dt9BL1lrLwyuEU0Rq2ORF4pli43p7s9jaivOBddt+orUAqbbyONg8ipvgTV/NTX/bef3+6xGaphvOia07QzaaHYFQCYbpoSrVEc5y8AHHB/dOeq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 08:21:55 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 08:21:55 +0000
Message-ID: <f5f829d2-6e38-4d91-9621-94a85c0d8e14@amd.com>
Date: Tue, 11 Feb 2025 13:51:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 00/23] ASoC: amd: acp70: add soundwire and acp pdm
 support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <173920499691.65690.5029473211250633476.b4-ty@kernel.org>
 <d16ce74f-3320-49ec-a195-a473e03a9fc4@amd.com>
 <d1d08149-3b4c-44ff-99f0-34cdf70eb67f@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <d1d08149-3b4c-44ff-99f0-34cdf70eb67f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8bdc35-a632-403f-b7ac-08dd4a75253f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MDdqdm55QS9xdXRxNTg4eXJTU1JubjBVY3FwcjJ0cGN1cjBpdmdYeGpaaUt0?=
 =?utf-8?B?NFRGWTVTSC9iVWg5TzdKMnF0cTQ4S0hXL2lhTy80aEtpcXFTeUZraElvNWNI?=
 =?utf-8?B?ZHJUOXRUWTNMckE1SnhUWUUyYkd5SEF1MEphSjUxSUc3UFBTRVI2WXFRWUdt?=
 =?utf-8?B?M2c5dkpHNkp2d0pheGE3NmNMWTZxcUMraEk4c1R2OHRQVkpIMTVvQkF2N25C?=
 =?utf-8?B?WnhINmExRXlaWHNqSVA2V2NQcmhEK2lyWDdiVkFranA1aTlDdVlaL2pUYlhX?=
 =?utf-8?B?MUF1YWNtWVQ2M2d4UFNnUzFSU1VQMnBBNHZTTmV5VlQyY1RGcFlRd0kvVllY?=
 =?utf-8?B?SjZ3MDRaU00xWFVTUzVOaDRFeGVCOFNuQ21GWmVDSElwc01BSS9QMmduRTNK?=
 =?utf-8?B?K29kZTlRM2w5UDhMVnVhdGhqMlQ3S3FpV2lhTUg3Z01xYW5MUmVycTAwdTAz?=
 =?utf-8?B?L1dtMkMyeTN6SGJZY0NHajhTaFlCdElUb0pNZFpRVWtUNEp1OHRDRnRRbFdw?=
 =?utf-8?B?Uzg5TGIwMHVBL25vdTgxRGdEQ1gvenlNOC9sZnR3ZGlzQ2l5YjBoNlI0N1J3?=
 =?utf-8?B?V3VnTW8ycS9pWE8veFlmUmxZNjFNRVYyWkpVcHdBdlZlSWwvVzFWdUwzR0p1?=
 =?utf-8?B?VnJNcEZUck9YUVB2Z29NdWJqUkVCeFVCZHg3OHJneTV5NE1JYTl5NDZVc3ha?=
 =?utf-8?B?SXpwdlJ1L3hwWUliamRKZHZkS2dLdWVwb0hmSU9NRjhEN1JWZDhURURYOVRD?=
 =?utf-8?B?VlRVbUo1ZU9MMEJTem9RNXk0aWMxQ3hKdGl6NU5nRnJScjgwWjlrV1pGMlR0?=
 =?utf-8?B?aG9rUkhPSGxDU2MzQ0pFUER3VWgycFpoRXAxcnJnKzdFZ0oweThCRjZERHZE?=
 =?utf-8?B?eWFsQVkxSk5zbkR0OC9GV1A0eUlGUU5TTXY4WEgvMHkwQUE3czB4a2hTTVpi?=
 =?utf-8?B?UmN3OVE3cGc4Z1RSd2RrVUVTSnB0Z2o4cWl0LzhFUDZSczNRRzA2emUwS0cr?=
 =?utf-8?B?MG5JVmR0aGZaT2pGVWZ5clZvR1d4eG5sTVh4VG0zZkp5YVRMZkVaYkluY1dY?=
 =?utf-8?B?ZTRIL3B6UWkyaVJTQ0xFZHBCZ2tEeG5YdExXQ2JGMVg5N0FoT0l2Wkl2U1A5?=
 =?utf-8?B?RndtQmcwSVNsV0gyeS9TUklmWXdKazlOTEZpMEdQeDlaM2FGampkaWZaT0Vr?=
 =?utf-8?B?RFR0NmJDMnM4RzJIcUt1SkVhQVJZbXlUUFRPRkh2bzFFbWRESmJyVEZleG50?=
 =?utf-8?B?dG1NTlQzQm5UZFpLeWV1TVpNZG96L0s1N2dNbFR0SFZLaytITFFLMGpIZTVW?=
 =?utf-8?B?Y0krWW03UjBjQlg2QXJucTJhK1J4M1JmZEc2YWN0VzIrNWsrTWRmUFkwcXJT?=
 =?utf-8?B?QjlxNXgyY3hPWm5UOHc2SW5oWm5JTFNmbzUrRXFIVkdDTUtpQ0dSbytMNDk2?=
 =?utf-8?B?ZmtCWGIvcWpWQmNrZGQ1WUF2RThyMTdaUDdnOFNJZVJaRHlxM0RsNHZJVzUv?=
 =?utf-8?B?bkJGR1E4RzN4YXF1OUg0b0c1Q05jQWRXZGxBS0ZsZllzc0ZMUXUrME4yalRn?=
 =?utf-8?B?ZnhEcXk3bml6akJma2ZNdERQT1JGSnlNRVhFcEJ5aUVSNkEreXIvblE3QTAw?=
 =?utf-8?B?S25tSExrakJtTHZtZDliSnR4NUgxMHdiVXoxOFowSm43NWZuZFFTNUgyZGlE?=
 =?utf-8?B?RkMxckZYbmVCYzA3QzF1bmJnU21BaFF0bnphejZwT0dxWm9iMUtuQ3hpaVRn?=
 =?utf-8?B?MExjd2ZzK2ZxY1UwdE4rRm42SXpmOHlCU2dITWpSU0VwQUhsMVR2RzdTUWZZ?=
 =?utf-8?B?RGJ1RHBRVXZLeS8wYk9RaWFFMHVLcnpvekZXYmR0QjJPaW1YSnFtVWExNXpm?=
 =?utf-8?Q?h0B3NQaumDn5J?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlNKL095VEdxQ1NNVWFSazV0R1RycGdjd1FPTkpmcjZPTjVucEthUnlBZUxz?=
 =?utf-8?B?U3YzdEd3bk9tUnhtWk05RnI1M2lqMkVvZDluazZrdzl1VVlMSGhMdTAvajRG?=
 =?utf-8?B?VWZGR3hhSTBzWmVqajIzZFVIWWZrcDNpVy9MYzYxRC9Fd0wvT29pMWZ2eXQz?=
 =?utf-8?B?RVNGRXArRGpMVi91WjNWRmNOK1JnNWVSdko2SC95bGJ5Q0dhZEsxaEI2aDky?=
 =?utf-8?B?OXZQUnNFTXU1TnlrV2NOR3FxL0ptN3JoeXRwalNRQStrdkZrVkQ2VlVGSjlm?=
 =?utf-8?B?T1IyeitHNjdQUXFRNVlOdTRlekRnR08zaHAvOS9BU2wvRGtWTGI1bGpQNDNE?=
 =?utf-8?B?S2JLNnRlNFlwOW50MThWVXRqa0t1dTJ0bEUwVHhrNzVOTmphYkJENFJLVWVm?=
 =?utf-8?B?dFl6cmozb3dLKy9oZUo2RmxIL29xNWhSdW9HWXJ1N0EwQUZueSs3cjNNcnBy?=
 =?utf-8?B?ejU0WlJrOFpyT3NRdCtyamZkZTI3SEkxeVkrblUva2wvSzRLdjUyUElBQXdW?=
 =?utf-8?B?RytneU1hMFFjZXlWdlQ4VmRXL0VZcWJGSXdQYzViSlJVRlNNL2h4dG0xbUdC?=
 =?utf-8?B?MXN3RmZocmxNd3kxR1JOdG4wdXNJRUZrelVEVDFYMGJTa1VCdVpJeHJUZGtk?=
 =?utf-8?B?bTYzb1U0K3hMTXI4a1NEZFdhVWY5SS9sOUtjN253WllMcG03VDVJYnJDa081?=
 =?utf-8?B?d3NDK2Y0UHJJRnVJSnpBVjNOSGVlb2dVWGRveDNpL3ZyQVBDazg0R0F1YzRa?=
 =?utf-8?B?R2QzcElCRis1YUtwMWJBYzZ2VzBNOTc1NVIrSmppL1FvRmUzeHhlWkhhTDlV?=
 =?utf-8?B?aFlEQjdmWXI5bEVzUjhGbStNd0t4RmpIMmlka2xFQzQwWUJyN3BxNTg2Wm54?=
 =?utf-8?B?bTk3OXZhYitjNmNHeWNpNzN3ODRyMVg1cTByK0JCNkgyUHV5dW9laFpzTjZ6?=
 =?utf-8?B?SEtXa3QwQVBKemZnNVhsR2RPTVhGSTF1SnZMY25xNmJxL2tUczFPMjZkNlBC?=
 =?utf-8?B?Mm9zczdEemc0eXZHNlZzc253eDhwTFJsU0hnb1Q1UGNaUG5rNk94clZLQldD?=
 =?utf-8?B?RHJyN0NCNFBwQnBDbjNCMWUwWHVWUVhOaFBkV2hVWVU3WnU5SE1vbDNEYUdK?=
 =?utf-8?B?LzA2NVJmS09SdWlIZDl5ei9YcWFZUmtBL2wrelYxREd3dFkzMXJxOEp4a2d0?=
 =?utf-8?B?cWU3RWZQUFE4TXZDWUtHcldKTHYvYWFzTjZseU9QLzVGaUtYTzZzNWhUNzMz?=
 =?utf-8?B?UTVPRitZMStGWCtDSkVqZjErRURkbTJiWk1Cd3hKV0owSnptR1RzME8yT3Zi?=
 =?utf-8?B?N0M5eUFpelhKSUEvWFdGSXJDMXRXRlVneHJjbEFuYTUrZ3RqRkRrTXM0Rk9u?=
 =?utf-8?B?UzI5RERZTmFTY1Rxd1hYTzVpUTVndDZ1bjhxTUUvMC9ZUnhZeDNCWURYM0dY?=
 =?utf-8?B?dlB2RkU4QkpFTkpXOWpkcE5abitXZVdGVFNrVWVSWFJYRFRQV2NuWm1SRG9C?=
 =?utf-8?B?Mm9rbEZIbklmaTNuVk55QWFaYWVqaG5jdHNyUmsyTnZSdU1KWm5oMkNPdG1D?=
 =?utf-8?B?K0xldnRBTXV5RmZxdU1iekozMEtwN3FLVDlCcjlZbVRJNXBqOSt3TFI5T3hr?=
 =?utf-8?B?d2tVdzU1VW03UmxRMnJWcUlCdDEvNElLVTJFUUFRTUxGb0RMNGlqVEVQZzdW?=
 =?utf-8?B?MVRab1ZsV1gwcDkwWE9NMnQ2TTAydWhBUDJzc3UycHY1WkhER2Z5dHFUQndv?=
 =?utf-8?B?TE0zcUxCbnk4V0pkY2JQZ0F1RTFJMjhPTVhyYW5vR1FWWWQ5eUI4T2xoOU9x?=
 =?utf-8?B?ejhVMGE0UnNaMUQzWXhzZ2tGTGVxS0FaS3F2alZQdDZ3aTFtTEUzV1ZPU2RI?=
 =?utf-8?B?MytpQkgwWEZ1N25WSHVmTXdOOTl0VEgvN3NpL21udGtSMGVWSU1XK3JkNDI1?=
 =?utf-8?B?Szl0SEpyTnFsWXNESGIzakVySEtXcGx4UTFRMTRwVEJ0ejJFOW9RRWQyZGtu?=
 =?utf-8?B?RkRzNWZXc0JIcmVIZjRXdTBEV1Z2cGd3cHdnaDdRalJUMTF2dURrV2pZQWNs?=
 =?utf-8?B?V1VmTjBKcHRsWkU5dERwRjZBd3YyNzM3NUk1cmtBMGtNMTVNVzlYMFBFSWNQ?=
 =?utf-8?Q?vUSzfQpGaza6xJZR7P1ngTTFl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f8bdc35-a632-403f-b7ac-08dd4a75253f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 08:21:55.6903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3HP7eChBCvNVZKsoXaQcli8j3GarDUzak3LIPIRigdM7wWxmE+JC2S5XsPHsCPKmQwVzyT6Dh/U060JuC55Fpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488
Message-ID-Hash: MFMCB4HNCLDOFTYJG2PQIKB35NOVRFYR
X-Message-ID-Hash: MFMCB4HNCLDOFTYJG2PQIKB35NOVRFYR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFMCB4HNCLDOFTYJG2PQIKB35NOVRFYR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/02/25 23:34, Mark Brown wrote:
> On Mon, Feb 10, 2025 at 10:16:05PM +0530, Mukunda,Vijendar wrote:
>> On 10/02/25 21:59, Mark Brown wrote:
>>>> [...]
>> This patch series should be dropped and V3 version should be picked.
> All the "no commit info"s here:
>
>>> [01/23] ASoC: amd: add register header file for ACP7.0 platform
>>>         (no commit info)
>>> [02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
>>>         (no commit info)
>>> [03/23] ASoC: amd: acp70: add acp init and de-init functions
>>>         (no commit info)
>>> [04/23] ASoC: amd: acp70: add logic for scanning acp child devices
>>>         (no commit info)
>>> [05/23] ASoC: amd: acp70: create platform devices for acp child nodes
>>>         (no commit info)
>>> [06/23] ASoC: amd: acp70: enable driver build for ACP7.0 platform
>>>         (no commit info)
>>> [07/23] ASoC: amd: acp70: add acp pdm platform driver
>>>         (no commit info)
>>> [08/23] ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
>>>         (no commit info)
>>> [09/23] ASoC: amd: acp70: add acp soundwire dma driver
>>>         (no commit info)
>>> [10/23] ASoC: amd: update ACP7.0 KConfig option description
>>>         (no commit info)
>>> [11/23] ASoC: amd: acp70: add soundwire dma driver dma ops
>>>         (no commit info)
>>> [12/23] ASoC: amd: acp70: add acp ip interrupt handler
>>>         (no commit info)
>>> [13/23] ASoC: amd: acp70: add acp pdm driver pm ops
>>>         (no commit info)
>>> [14/23] ASoC: amd: acp70: add pm ops support for soundwire dma driver
>>>         (no commit info)
>>> [15/23] ASoC: amd: acp70: add acp driver pm ops support
>>>         (no commit info)
>>> [16/23] ASoC: amd: acp70: enable wake capability for acp pci driver
>>>         (no commit info)
>>> [17/23] ASoC: amd: acp70: add soundwire wake interrupt handling
>>>         (no commit info)
>>> [18/23] ASoC: amd: acp70: enable soundwire host wake irq mask
>>>         (no commit info)
>>> [19/23] ASoC: amd: acp70: enable acp pme enable during acp init sequence
>>>         (no commit info)
>>> [20/23] ASoC: amd: acp70: create a device node for soundwire machine driver
>>>         (no commit info)
> mean that these patches weren't actually applied, it's only these ones:
>
>>> [21/23] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
>>>         commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
>>> [22/23] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
>>>         commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
>>> [23/23] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
>>>         commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee
> which were actually applied out of v3, they just didn't change much if
> at all between the two versions and the tooling knew about v2 as well.
Got it. Thanks

