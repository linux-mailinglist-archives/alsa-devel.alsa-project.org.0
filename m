Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C18A176F1
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2025 06:23:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E19C66034B;
	Tue, 21 Jan 2025 06:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E19C66034B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737437014;
	bh=vyEIwBjaaXkJ+pej9BHB1J78t96d+zbLnS5trOL2r4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zc4GY4xusv3XPeMzEC/8E2lLtf5Mjya929zf4wvA++GCswEYE9jb/Exg1QPCuwY3J
	 sUk5vH2Z8ozvlztjj9j2Y/AJV14oWkyEn333EflPAt87CT6GVm+weDeoYpzD+/yMLg
	 0UTRg5i4R7D7uawEGunJ7n+Fwae9m1Af7ajbVpgw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7672CF8013D; Tue, 21 Jan 2025 06:23:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADA9F805B6;
	Tue, 21 Jan 2025 06:23:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51888F8032D; Tue, 21 Jan 2025 06:22:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::61b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E14EF8013D
	for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2025 06:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E14EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=F5mag4HE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSs2PIf+AMklKdSW/JnyuqFM5KJUAufahEUeNoorCAUcPCR/PvNuhYssTxD6BuTkhEdGRT9t47mxNPbkUeWVfMj7HtXivVAjxD03M/1X3nkOTwg+4AJjc5QZEabPvresDrWUjTzf0s4C9BfbGg9tJH0qxXlf87UkG0d/4hU+ev4oxE4gFE1hqdX28nsJoYh4IVnLqmCv7vmXPlvobom52uPnSsFGCw+C+wQZ60Eae9iBDAkOQRyYrNvUuz3ybzMpWUTJTtUAhbTC4nyb2SXixrV5Mvlrt3eUB0CZR0Xe/bZ6Ycbox/AYXpbm9e2VUdH/RWVi4efcEUui0771ei/caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOJ0ICd0MGNRFFRwfA+a1fRg7KrNfU4Pqv+5bb657c8=;
 b=SHgHsqcwfNY7xrov8eDU6xmFMtIovB91nmo+yDTQTtlXly0h1C6eabhJgEKOvpTiXvsLUYsNOg21bNJfC6D5bIkbc1TH/QGMjekQuA/2X1mnuHTSdrEiFp60bli5SeZ06MeWefFxRj3Tb3+ufqvWOnzHo7RZSSgZcXBrv8TmhASMOTjVR7ViQqJMwblPCqSsYWI72UM10lqvRXLbVBiw9ryG6h3iCXnaWbPgBxGxV5wLVaiYfplKOqRqV9vn94iBfk2jM4CXrRbAIkMFjFMtOSfhcK/yMpwJosA0272bMDVD4Ee8aIGRsdXvory1Dx/I3DaKBFpbt3vsdxC61A6lrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOJ0ICd0MGNRFFRwfA+a1fRg7KrNfU4Pqv+5bb657c8=;
 b=F5mag4HEJFFL89thktxQGBo4U+EyOhDgH8iWz7ALnnEZwaPVblzKRSbuUuZyZde4wLphDUOmMkrOsCh89n7y2bSynKF5K4xkRrh2aVgN82xVbuJPaX8aqIRvkBfKn9Hq2Jy6RhGg8jvz+yey0p5inKCRilf7ar2aPkcs+yqT0kg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Tue, 21 Jan
 2025 05:22:38 +0000
Received: from CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055]) by CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 05:22:37 +0000
Message-ID: <fb88cec7-fc54-456e-ae6d-62bb4c2504ba@amd.com>
Date: Tue, 21 Jan 2025 10:52:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
 <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
 <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
 <208098f6-1022-437e-9ae2-964e9bc89942@sirena.org.uk>
 <1e10c851-f4fc-4e76-806d-5f1214f29bdf@amd.com>
 <365c47d1-6b19-452a-b4f7-ca8a64e2754f@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <365c47d1-6b19-452a-b4f7-ca8a64e2754f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::10) To CH2PR12MB4120.namprd12.prod.outlook.com
 (2603:10b6:610:7b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4120:EE_|MN2PR12MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: 933a6425-c859-4cb5-eddd-08dd39db9e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RUQzUEhGZ0VDd3lZS0JUVHFxS1EwVStwdkxzY3pZLzJsc29sbTdyWmUwV3V5?=
 =?utf-8?B?UENYWDRXbXphdFlaVEZLNzB6RmwrbGdNem9VNmVpRTIvTWtKeUxYdTJwOHJR?=
 =?utf-8?B?TnRPcXVVNWd2MGp0a1RqemdOTWc3WmplNTlLQlozb3Y2WmVuRFJiS3hpdDBG?=
 =?utf-8?B?bUxFSXF3aGRGQ0p0dnQ4WEZFdGsxRWZEaXdScDU0SXBlVWNzTlhhc0NxRnBv?=
 =?utf-8?B?dkpzdGpDK3FKYmVXQ0dwaDdKdnpab3QxUElpQjA0MUtlSUxTRUJtY1QveXRp?=
 =?utf-8?B?bVhjN0FSbjVZWUJ1SkVjWWRSMGt2aWJwMWU5Wm4yTXJwZUtaQjlGQVVLaURk?=
 =?utf-8?B?aG9ZbmhBWWJ0UzJpVklYUk1jN3J5elpSbitBNlFNczVDZVFGVmZTRnA4Q3di?=
 =?utf-8?B?K0VWZlpWQjZJQjhNOVZ5NEt2ZUNENUphekdLMGhXRml2eUZDb3pPVll4WVRw?=
 =?utf-8?B?QWhQWlNoY3pXcXlDVFRYSTFLNkxDdUw0ZXpldWRsZXYxdEVLNEFnYnZLb210?=
 =?utf-8?B?RUtXWnpBWEtwZVhPMjNkUnl2SmlzSFcrM0ZjTkVZaHZMaGk3MmpQK2dwdzZ4?=
 =?utf-8?B?MSsydEoxeEd5WlNZcTRkSU1vaUhHWDFGSnJPa0lSeWpvT3RmN29YbnBhWWs4?=
 =?utf-8?B?dmx2dnlLeDVpWnJFd05JbmFaOGxUMnQrR21RT1prdDNEeTFRVkh5N3VsZUox?=
 =?utf-8?B?cU96Yk1keVB3bjQxQVRLd2pwMWxYdzZQOFRKanJKMXR4Q0hXR00yUUthcGVV?=
 =?utf-8?B?RVNtQXMrZ1NQZWRyM283WExPY0NLYWlweFZhNW1EWWdKT2lnc01BTnI5RndI?=
 =?utf-8?B?VVVIeHREVUJrYTRaQ2pVRmd6RUtFUmRWVnV1SDRqOGp2VisydVdETXFQeE1y?=
 =?utf-8?B?YWl4Zlg1aFd0YncvV2JKYWpzb0ovSjRjdnBzc0szd3JqWWxRSzg1dDBlV0tE?=
 =?utf-8?B?bUJndWdDZTFxTUFYeE9oak91NUJxYnhNbFNOOGVxUVNHQ0lJeGhYcm92WTR0?=
 =?utf-8?B?akxLdzJUMU5EL3NjZEpaRHFYZG1YdHBIdGpoM081bnhodTVKbENBMi9naTJm?=
 =?utf-8?B?RmJMclloek5NUjNTQys3WTF5WGV1NmpFbnlOWUl1bEU2MlJhVk1JRkFVRDB4?=
 =?utf-8?B?OEEycjB5ZkRDNzZiTWxOZzJNdkc0K1dEd1B3NTByYXVYRzRHMXFQTUNoenV0?=
 =?utf-8?B?N3lCbVpqZXk1MTN0OEQ3NWVLL2xFR0FFOHJnY2dqbjFKN0pHYWZlQmhNc2Qv?=
 =?utf-8?B?cXZsRENWbG9IQW5NSDgyQTJCdExkSVpHdHpVVGY2aXlDclpWMWErenVGQTg1?=
 =?utf-8?B?UjFjajRHbTh6cHJiMDB5bUpOdVVPOTRZdE9VcUw3aFJJSTQxYk1hN3RvK2F2?=
 =?utf-8?B?bHg2UVBYZGE5MlFEMFRxMDAxc0lWeG9JWTY2YmcvckNPYzFDZytzUVZGSC85?=
 =?utf-8?B?bWdJK3QyNEhxNU9tR1cxejRTK0sxUlFLbG81dTlSakpsZXpWQ2hSN1VNZnNE?=
 =?utf-8?B?Q0xtYlVhcCtuRWpzZ0ErRmVrWGNqKzF4M0JtWlhRN3NaSDhhL3I2V2VwNXFB?=
 =?utf-8?B?KzRGZStnWHk2NFZ2Y0tmUkRYSnVsbXZMVm55WUczSWwwSE55SnJBSUc1M3pv?=
 =?utf-8?B?SEVVWkZvUG5EUUZ0V0pBVUZzSWZOR2J6dUplb2F4ck44aldYbHBSbHUwdFdK?=
 =?utf-8?B?cHlRcUpBd1JZYlo3ZnZYeFUxNHp0VzNJR0JBdEtPR2s4Z01YR0lMaU1HQzBN?=
 =?utf-8?B?RE9oWUk2TFc3RmxsNkRnMzFBT1VxYzhFKzVkQ2NTcWhjRjltYmR1RFE3d3Q3?=
 =?utf-8?B?bmNyd3lnVWZmZFVYK3RNNXRmQndDeXpyTjJNSEdZUXkybmFaejFpdEZ0QmNF?=
 =?utf-8?Q?YW2zIR1rR31le?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4120.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aEpVQUg1OEJqUEdaditDM1NvNDZPTzNjT0NxcTdIZWRGUE9UcGxCMEhnTkl2?=
 =?utf-8?B?SzBzRTAyTHpjK1BpcWpuTVhqSFgvS0wrdzV4cVV6U2JzUk5qejZleXpCdHpX?=
 =?utf-8?B?NWRhNEdSV3pDZjNCdFZ0QnpvNy9JM1A5UVY1RVlSOFE1aG1HckF0Um9TVUxK?=
 =?utf-8?B?RWJBL3o4dlFPVlNqb1dDcFNSQ1FvTHBYZUIzcGhMUVIvdGRlUytZWWFlbWJy?=
 =?utf-8?B?WXpPTDA0UENnV3dJOUNBOHRTQVI5eTk1YVl3VE83SHFHZVdjTkJWajVMQ2Zo?=
 =?utf-8?B?UndFOHdnOGRFTWIvNEZ5Zng1Nm9tRWo4SGszbjYxZnc4RE4veU5aN2xlNlZG?=
 =?utf-8?B?aTFLbGc1Rnk1TXByVm9JN0Q2dk9QT25PSU82eW4rUm1acHkxZTJHN2hnZzBD?=
 =?utf-8?B?enk1RmpCSkdSY29JQVA2Qk5LUzBCSGdKS1d3ZkFISTIyVWNod1ZFSzhmR0dw?=
 =?utf-8?B?QVZSdDlDK2lwYUljWFl6Q1JNVFBkbk9OV29GVVVrRmRsMVQvZEx5UW9nMlZu?=
 =?utf-8?B?OFFUMTJRa0Z5Rzg0NlcwSmJDbmRYWFBzOHE2ckZFOEpDeXhzTURvc29sR2VS?=
 =?utf-8?B?UDdTdGgyVktLRmFtRENJVzBOVFNiVTZyU0dkNGRkZTBVVU9uQVZuaE5QOUUv?=
 =?utf-8?B?ZFIwK0x1TFZjcmh6VkhoWEtZOGhtQ3BDNTdWRWl4bzlyU2xTMllya0RVNFRN?=
 =?utf-8?B?VWsxUGxDdjVsM3R1WmpnaWNuWUt1azNXOHQ3b3VGbDlTNHBzVDhLd0llb0FY?=
 =?utf-8?B?TTFpUnVrU1RSSlNQSjd5dUE3L1VRaEhCUXBpTmtzK0FSZkxSaFQxK3lsQjBt?=
 =?utf-8?B?Mlptbi93SGJjQlA1WFlzaG4vZ1hKOHd0L2YwZlY0S2tpUFVsb1NwRDJ1YWtY?=
 =?utf-8?B?dDlCM2lTTjJHcFkwcWttOVE0UlI1N3RhOWFIUmFFMUd3d0NlamJZOGlZdW0y?=
 =?utf-8?B?bHVHYkoreER6N0F3MnBRM1lxdEUrN1VWaEJlM3h1NFFJRmdTMVFxSU5FTVdJ?=
 =?utf-8?B?eW1kSUVPN2h6cGhNWktKck53K1FGYkpScWgxN3Bwa2FwNVJZSW9uY0pJM0FX?=
 =?utf-8?B?V3dSdnV5MFh6bVRBNDgwWjJsZ0I3L3VNTEhzeUF0OU1LbmhjYmtDUzdLcUlF?=
 =?utf-8?B?VDlsL24vV2JGaUgrb20yL0xHQW00M0JTTXRqcFl0R3lQV0FBbnBHaVJ0djMv?=
 =?utf-8?B?TlJnK25wUjY2Szl6TjFuU2NaL3pTNmFMVnpqZjRFWSsvd2EyY3lyUzh5QTlj?=
 =?utf-8?B?SkpQN2JuOVlScnluVWZsVjViZmZVcUN2cmNXdUU0aHlXTjJadGpVck9jOHRE?=
 =?utf-8?B?ZmcxQmFIUUdHTlFpT3RpQ3hpRUsvdTlsRUFwd3FWRzZOSi9FeUNtOHlDSm9C?=
 =?utf-8?B?UkhnZkw0YzJaLzUwTUdOZEtRVEEzT3ExS3NOSUI3RlNrOFRMWDlaNGVjQzZ2?=
 =?utf-8?B?anVHcE0yZFQ2dTB3enVLS3pMWDV1RDgyMG9iSzlUZ05CVkZjOHQxWGtCRlNw?=
 =?utf-8?B?cG9FQ1daYnA3Q2FUS2JHbWxpVk01UmRUb2lMRkxoRlkxdGhoWE9tK0dTcWZ6?=
 =?utf-8?B?Q1NZL0Y2ZGZUVjAzREMvUGwxQit2VFNVQXdKS0tlQVQrRjZJSEs3dGtHUHBp?=
 =?utf-8?B?NFY3MURCNlp6aUJBeXovU0RwYUErampzTVpXbmhzeStnQlR4cE0rQWRxM2JE?=
 =?utf-8?B?Q1VTblF2bmtSK1hTNUJ6UXVXZzlZR0ZaMEVwMUNQY3RqSy81Z21MdEEyZTAv?=
 =?utf-8?B?bEJvVDJkbXdLMnJ6QVB0RE5oVmQvK2dhSm81QUlCaDhvd1RtUGFES2ovY0Zr?=
 =?utf-8?B?WFFzM2hHcGxyWlpwYVBiSDNnbDVCYi9mM1BxUVVqV3cxNGZuWFd0RUJDdTJJ?=
 =?utf-8?B?NGRNeGJkQmVDNWtHMnVhMk5ISk5uVEtDMlM2eHhkdCs5M1BzaVAyZUwrZWxa?=
 =?utf-8?B?YWUwTmI2ZW5EdElEcHc2eGNWakU0S0ZKYlF2L0xNNUhKcnVYY3l6NEUrQXgw?=
 =?utf-8?B?VFpqRTNjZ0FjZUxFME96eXVQUHI2QWdIR1FPUERhMk9SZnpyRkdhR0RkeTUy?=
 =?utf-8?B?aXZWR0dKaGhoc3B3ZGtWL1RwcnhYT2p4RGhGOWp1R0g2V0xHSVc0S2U2enBI?=
 =?utf-8?Q?I6pQCt27gdMUxYlbypY2Y8NPj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 933a6425-c859-4cb5-eddd-08dd39db9e3d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4120.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 05:22:37.7999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 niGtNgXQM5K1YaqxedmuzKC1aKhiVIRIRoDitDCTMe8XlaRRPTNfX5cI9HsXJUELNl/2DC3qVE02WFYUFmxp8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
Message-ID-Hash: UPG3BMWMVF3JYLLOOYGWLK2BVBQZ2A4W
X-Message-ID-Hash: UPG3BMWMVF3JYLLOOYGWLK2BVBQZ2A4W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPG3BMWMVF3JYLLOOYGWLK2BVBQZ2A4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/01/25 00:58, Mark Brown wrote:
> On Mon, Jan 20, 2025 at 12:47:18PM -0600, Mario Limonciello wrote:
>> On 1/20/2025 12:39, Mark Brown wrote:
>>> That does feel like quirks and new features rather than a completely
>>> distinct IP.
>> I see it as different forms of tech debt.  Either you keep track of which
>> features the 62 vs 70 hardware supports by different drivers or add logic in
>> all the relevant functions().
>> The former increases LoC but reduces risk for mistake (IE avoid oops, I
>> forgot this is only supported on 70+ when adding new features).
> Until someone fixes a bug or does some subsystem wide cleanup which
> affects both copies of the code (perhaps that already happened since the
> code was copied!).  There's a reason why this is the general kernel
> style.
>
>> Changing code that affects a lot of hardware means a lot more testing too.
>> Perhaps after Vijendar's series lands he can split up some of the purely
>> duplicated functions into helpers or callbacks and arrange all that testing?
> Well, it was getting a new spin anyway for the bits that didn't have the
> serial numbers filed off.
Will drop code duplication and come up with new patch series.

