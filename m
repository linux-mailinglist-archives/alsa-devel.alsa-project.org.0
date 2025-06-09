Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4420AD1DB6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 14:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2578A601FE;
	Mon,  9 Jun 2025 14:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2578A601FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749472243;
	bh=Id58G2GnL3umRvxU9Iufqjg1hXQDv7/rrc8DHLW1u1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=il0GmF+RAL4SJiuNl66Y9xYd8SzM9eg8zmg5MmvIkNIFmMB5EGHe2JGqfTmLQWSRI
	 eF8oXrzNtuA+36Cxr0chTP9rvlpp78A/+nyGGRcv0jZ8B5tuVmooFkpAmH23VG8Yc7
	 zKnmhA+iMPQil6h5GMekDJaT1D6ViDCNpY9P1yag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FAEEF805BB; Mon,  9 Jun 2025 14:30:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87AC1F805BB;
	Mon,  9 Jun 2025 14:30:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56719F8049C; Mon,  9 Jun 2025 14:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::615])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30065F80038
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 14:30:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30065F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=n6tK6pfM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAssVroHqQR1KWV4BxqhNU3RD4pu82MDZU+Hfcz0x1Z62ALn31Sb5OpPPoyhRjSDDWTGdPVvvXtz5NkPCbmWfHuK6hKxkJFYkKU+aOmVWHoQM/LRzVZ/5+YMrzCQkFEDOrq2OxlVuT28liJZ5reaDy7UVRvySJyui8glEycgiOMVFG+19xDnXrqvgNM8MjSFiF/Ea1LaEEnRhPwovTq3tSMSR+O7dATvGhQ5kT8waCuOSPT4PyMiOy8XfsI0YkzibYN0+FkBbmD22cOhWnDsgMSgXa148X6sRwkgtxmlOx2DWT6dRFoD7j1SDAmVe25zSdItvp+cR+EGJ7ynJSqIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id58G2GnL3umRvxU9Iufqjg1hXQDv7/rrc8DHLW1u1E=;
 b=mdig+6rI4xcL1QP0BwG54kTtZ+Tid/IPyyV8vjozLwqkCL0wnjTL0G9UfImG2UlN8+8naJ3660p9LpjLxybKGz55bDykJt5vTnO1aR0HISUfjuq8YxnEbm+dcU9YVKYzUyLe49xlTqOt2F4PAmy8BBr26Bz5EWGU1IpOMD1rTBUXfMNJ1xsE+znX5rnJGPeXuyBIeB2U1jqrLrO+vbo5paRO8KzDN+VzesQNTzFCF62SOXetLM1H36fU4EE6T0PEFDSeVyU73RuozIfEYEAdJ24xC5H9dAxC2+a56YFEXA+5jxthQq1M7xjdkwn/G4PCdruFWlioHmjkAgbGCKI2Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id58G2GnL3umRvxU9Iufqjg1hXQDv7/rrc8DHLW1u1E=;
 b=n6tK6pfM1hcG6cKT5P+Xj7xopIWLqhxUi0YVVeYcJNRKNAe5MoC10G89nbrYQvCehTKo+sJRb3hDPGbQISPvAeMI+FBQVhSmZsY/i2a/Fy00ezDM5dgIae/pi24viMSr6F9sIPrm/KRkGlyfwbzl9y4zmosQOfJFQ90mF3SrLUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM4PR12MB5842.namprd12.prod.outlook.com (2603:10b6:8:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 12:29:56 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%6]) with mapi id 15.20.8792.035; Mon, 9 Jun 2025
 12:29:56 +0000
Message-ID: <cc92a3de-0d90-42eb-95a7-a9638eecfc65@amd.com>
Date: Mon, 9 Jun 2025 17:59:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix pointer assignments for
 snd_soc_acpi_mach structures
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, mario.limonciello@amd.com,
 yung-chuan.liao@linux.intel.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
 <ea8fa344-0429-4dca-80a2-aa792128576d@sirena.org.uk>
Content-Language: en-US
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <ea8fa344-0429-4dca-80a2-aa792128576d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::20) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f649e3-a180-409c-2272-08dda75157d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2hLRG9MOXJpeWRyRENKL0hwL1NUK1RBdVYxbTdRall4TFhUdUUzQ29lWWY3?=
 =?utf-8?B?ZnZDODNncXp4R0VOdDM4ZWttaEx5eGpSZWVzVFFkTVQxUEFldGFOSXpya2lT?=
 =?utf-8?B?dTczMUhiZW4wYWVzVXVrdCtVQVdEaXNYOUcxME5FQXlIR0ZyV05KUlZLaVRa?=
 =?utf-8?B?S1YzanJpL3Nlb3NKNC9pdnhhK1hQOGxyOVpLeE5XV1E1Z01iL1d1QUZDZGlP?=
 =?utf-8?B?UlFnRVEvOVFJRklkYU45dVZxL2Uza0ZOOWFid2hRZ21RUDRYQ21ZVy9IV1NN?=
 =?utf-8?B?TSs4TkU1eW5aWmVZOUkxVCt6ZFJFTVlCSmMyS1BkZXk5RkpDQUZja1RvZE1S?=
 =?utf-8?B?OGkrWjk3elZ3QlpVSW9BbFlPWTh3UlJHQWgwUEVzNVBFekp6RU1hdGZGSmIx?=
 =?utf-8?B?SWk0TnluZUZ1WnVjb3FqclUxSVA1VU5aQi91SXZ0aUlaWkMwWDY3VG5BYm0r?=
 =?utf-8?B?eFl2WHZha0JBeDIrTnltY1pCTEVDSFFYVDAvbXE3UytFSTd2WUZXV1ZLMWMv?=
 =?utf-8?B?TTQranRkOEczRjB2UkJaTjN2U0tGa25yb25GR3lnS1lINmhMK0RncmhQY1hj?=
 =?utf-8?B?MGhjOWphR1ZLQUVyUjdGZDJ3RDFONXlseHhxNklxWHRnMTBRRVZpWUJOVG80?=
 =?utf-8?B?LzQyTWRzY3lieGRlbHdHN2JiRldQYnQzRFhNK3FRWVNiUWlvRlFiYlNKejhG?=
 =?utf-8?B?K3JTcGNXbEJ6WURJQlMyTHNKc1dmS3NIbTZ2ZG5mQUlvdUUyT3IrQmozbUhw?=
 =?utf-8?B?Nm1yOVZHbkVtbFFnTk1mNEU2c2tkcWF4cjNKdWFSQmkwNUhIVHhGUXR1TEpk?=
 =?utf-8?B?TTJpdktYUU1qZ3VOV2dhTkVaQVJ0WERTTUxoRUJ1NWx5L3pSdTYrVFErSDdz?=
 =?utf-8?B?bTMvZzQ2MXptcjVUNWhDNER4WS91SWJJYmo1aGg3dTdSNVF5cE8yWEU2cmZx?=
 =?utf-8?B?S2R0M0dYaHFENEJmeGlvM0dralFrRi9lS2RacG1VU25xekN6ZmllbGl1OWFm?=
 =?utf-8?B?Y29NQ2wvRkd6U3p4Z3BkdkFqTFZKRGRpWHIvYzFwR2J1K2d5NjM4d1hwYzFq?=
 =?utf-8?B?ai9COW5ycCtnUTJjNmFtOFI2UjBacTdvYUVyQzVla2VFMWJYbWR4WGRObGp5?=
 =?utf-8?B?QUJrNTVHcW0rcG9RU21RbjREd1Z6SXA3MU9VSnlBbXZkc0NqK1BhQzQrMXU3?=
 =?utf-8?B?ODVLeFpvVjNVWGo2S25YN1VLREtpZzF1T21iSUlNenkvUGxBYWRDV3NrU3NR?=
 =?utf-8?B?TjZXQXZ6bE5haHJnY21Kc0V0WGFWM0J3azdyNTFGMDJWbXluM1JPdzZud2dC?=
 =?utf-8?B?WmU3SlpwUzVFaCs4akp3eFAvYkNsemNlRkxDL1VUTDdFTi8xNDhwTDF6aDZW?=
 =?utf-8?B?NDB0Nm4rWkpnSlludVdPZmpoZTBBazJFQU45ZGlWQlFPTGM0MWl5MFBueFdm?=
 =?utf-8?B?VWViSFZHSVRBMjVob3dVKzE2QTU1Q3NoZWI1YTVObFNYajR3dzIydGY4WE0x?=
 =?utf-8?B?czluK0I5N3hUL3Y2dENUTmM3NVl1QXJjQ0Z1TkFhVHBXcjZBYVRCcG1MNTRr?=
 =?utf-8?B?SVY2bCs4ek9rYUNoUElOcG82Ymh5ZTRFdVlQV3NTZ2hsWklrdGxPVnBmRlhG?=
 =?utf-8?B?RzRjLzBVZXloUXBQRXptaUZZSEdnN0dQSHM5S0oraHlOR3kyUlJORFhYOUhW?=
 =?utf-8?B?Mkt3N1BSczlGaXBaMmFZOXpEVnA0blZFY0lIbGxnUnNtdHovZW5RY3FtNTFO?=
 =?utf-8?B?clpzOWRXWTdhQnVMWll1bUZoWTlweXQ3RG5NL1pRRlA5ZTUvY3d1bmE3Q1A4?=
 =?utf-8?B?RjZSVWpmZmxZbExlSktlSjF6UzN3TE0ycFlaSEgzRkd2UGJqQ1JzZFV2TkRL?=
 =?utf-8?B?aEpkUitVaFpMSlpwR2VNNWpSK0k3clJBOXU0RUNsWHBQTVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2Exa3o4RVgydGZiMGpwZ2Z0eG1YeEUwYjZPTm9xaTlqVk9TMHVpaWVWMmxL?=
 =?utf-8?B?Z2ZTM0VMeTV5ZGc4S3V3dHFaczBBOWJlWEF0TXBXTVlYTkcwcy96a1d0bURG?=
 =?utf-8?B?U0FpL00zRnNYbkVkbmNzTDgzY1M4bVNGSm53RWNKa1pQdTRXbTg0bTNPT3Az?=
 =?utf-8?B?WEVyTS8xcnllTjljTFNkSUEzZDRnWGh2bVFWM091S1RVeGw4N01VWXlVd0tM?=
 =?utf-8?B?U2JzV2hzSU1zTTdldXZiTlkyb01NTUVnSmtra2crT0hlTllSQmRkQ3dGTlFX?=
 =?utf-8?B?TitDZFN4RHdoaXkyR1VXMW0vSWNZVXBHMU9xOE8zTis0c0JJMzFqWmVhMUVx?=
 =?utf-8?B?T2oxZFpWaFBTSWkwcHhFbEdCK0k5NzI2NU5HRklCOVlGT21CWnY5N2xtbHBu?=
 =?utf-8?B?aVdiTWVhSE1PNS9BWEVmQ0M3M09uRk1JMmRSeThhM292ck1USEYxM2FvRUdV?=
 =?utf-8?B?N1oxNTgwbWRrZXZRK3VYUUw5WE1JdzhtS285WERhcDVPa2pmODNvbThYMFBu?=
 =?utf-8?B?S3hnV0Q1M0daR2kzcDRqS01mNWU4ekpmN0hnTTVPSDUwTnhlODJkdXRCVGRt?=
 =?utf-8?B?OVpDTHlSUVcrQVhQd1plNEJtcTU1R2NscjhPemx0VDU3YWJnNlBHei8rbVFN?=
 =?utf-8?B?QVpqNnpSYW1vZnNMeGhIQmRVWGNzK2RNekpvcEpCMC90RW9KQ3lTS1BoelRZ?=
 =?utf-8?B?c0NZL0I5YkxoR2hiZnRRektmWU9QVURJNlo3dWlxUENXb0RxZE1rRlVZNnRk?=
 =?utf-8?B?VlJ6cDA5ZStGOTdpRE15YnJicGxIY3BZbWRsQ0VSMFdQRWIyOXptcmJtaXlS?=
 =?utf-8?B?Q05xTEprMEw0aThNSFZxYlRIcm5DZ2FybXVKL1dVZDBTK2twVW5kMGdrSnhx?=
 =?utf-8?B?Z1l3NmxUaGk1VXBUUithamF1L3ljK3pMaUFuZU9rZ0RPN0hwVkJta1gvOTdn?=
 =?utf-8?B?MmhPZ1B0cmRLdjFwOHh3cVBFaG9OSHRuaUs3VGZ0TVhNSGZIL3hCbWl4c1NP?=
 =?utf-8?B?WlUwNHZ5U1ZJeEdoTTFQdGl5OUY3WE10bUhQSGd5WjNQckRHUmtmbEpjYzlN?=
 =?utf-8?B?OG96NHB6S3ZkS01ZbXgzOFdGUTNrMTUzNXJLUGIyUHZRN2VsRXhqeWFRZ0Zn?=
 =?utf-8?B?OERIWkVhOFdSbGZRZ3NPSGgzeUlHZXV6R2dWdHZzekJrbWpqOVJlMmdmazdi?=
 =?utf-8?B?aElITVdENHpxdWRkSWlSSER6Snd1blpmMHJGdWx5UmZXeURnS3NSRzdUWHM0?=
 =?utf-8?B?V3o3M2N5aDFPazVTNTh5QVJuNkk1cjhIMHZWUDJuazhISzg5YVZsQUxwelgx?=
 =?utf-8?B?TDBYT2FGRlV5amdrQXhSd2k1bUpSNldER0xtNndSVVRLMFhTMDFFeWhSSjJZ?=
 =?utf-8?B?V0d6NUhveTBNbFB5TUlxdjV6UWJmdzFQSkZMZDBmWkN6NGZDR3NzckRMY2RM?=
 =?utf-8?B?cGhhb2x6SlArbmVtNzVkd1hxZzNKVjQ4eEFwMUp6S2hOM0N0emRiM2JPWndR?=
 =?utf-8?B?Z1J6eFhnK01zc1ZvNU5LNmx4MC9NNldzR1JRVnlQK0s2RzZ5YVUyVHVORFor?=
 =?utf-8?B?dUI1R3VaMktSM0tSeFplS3JZWTI1c3hqSmZHQnRYVjNBSnlyYTQ3cUFOcEhQ?=
 =?utf-8?B?ZFNPUmNkOUVocEc1MUQwWk11U1JodDFIVEJKeGIvZVUxTkRhY29Ga0U5ZG1V?=
 =?utf-8?B?MGZlTm93S25rQ1FRUkZCYzc5anB1cERKUXU3SGVrSEc5WXhNVzR5c2oydUxL?=
 =?utf-8?B?RVM2MmNxcmhlL3EwWlpScUljN3hyenhDSVpuRXg0RTNKa3BSQlNwZEc1TmZM?=
 =?utf-8?B?Y1Z1ZmM1V3QzVDFmSkZQVXFkR015RnA5QUxuWFB2UUFuU0liZVNxR0E2em9I?=
 =?utf-8?B?czFxUkVONnhnd2Fqek00Rlhyb3lzQmd0SjZRT1cwYUppU1I4Z3VDQThsMFhX?=
 =?utf-8?B?czF6S2hmdzh0MGNCV0tyb2VrS0dVUlpsMTMxVjZ5WHA5SUM0ZC8zUStKaE13?=
 =?utf-8?B?VENrb1N1d24yWitNMFIrSjFoKytrVmhsREFQR0g3cStxRTk3S1E3UCtaTkZT?=
 =?utf-8?B?SlZCVnlsUVI2cUhCZHNzekI5LzhDWFlTZXZzSkduWW54eGhDbUxBNmgxSG11?=
 =?utf-8?Q?LllMrU/8ptbBiu/Lgwxqsc/cP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30f649e3-a180-409c-2272-08dda75157d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:29:56.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2w2DdbBk60sdI5O/3dKBFHVe2IMFUmo8FzslJuzfwu46T5FtQnGn5SAeAmSp/ieGPfd9uQrcw6OUgn4Ur2i6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842
Message-ID-Hash: E7WOZBBPYUPNWBCKXAXNFWH6OUYJFGA2
X-Message-ID-Hash: E7WOZBBPYUPNWBCKXAXNFWH6OUYJFGA2
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E7WOZBBPYUPNWBCKXAXNFWH6OUYJFGA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 6/9/25 17:46, Mark Brown wrote:
> On Mon, Jun 09, 2025 at 05:42:32PM +0530, Venkata Prasad Potturu wrote:
>> This patch modifies the assignment of machine structure pointers in the
>> acp_pci_probe function. Previously, the machine pointers were assigned
>> using the address-of operator (&), which caused incompatibility issues
>> in type assignments.
>>
>> Additionally, the declarations of the machine arrays in amd.h have been
>> updated to reflect that they are indeed arrays (`[]`). The code is
>> further cleaned up by declaring the codec structures in
>> amd-acpi-mach.c as static, reflecting their intended usage.
>>
>> error: symbol 'amp_rt1019' was not declared. Should it be static?
>> error: symbol 'amp_max' was not declared. Should it be static?
> It's fine this time but these staticisiations should have been a
> separate commit since there's no overlap.
Okay, Thanks Mark :).
I will take care next time onwards.
