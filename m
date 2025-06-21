Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 662EAAE28FE
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Jun 2025 14:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA49F601B6;
	Sat, 21 Jun 2025 14:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA49F601B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750509644;
	bh=8GRiU+z/5BsyCj3Z89mTPy8lJQsFDrqWPFzAFn2A+w0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UIOnPtp1VqA0L4ZK/634pjs5wm6wNIMm2ioqKfK6VcI9L41C03JkT2WgZ9EMTuVPA
	 Q9ei43ylnfdYU4+ZwAun4LqGxuRw6rXLmRmP+85uLUoRnkgT00rZsuS8tuUQFuMpn4
	 iinD9rrfVr7qeGw8OMmD3AF4/mQX+8cpVHE8Yo/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1FC1F805C7; Sat, 21 Jun 2025 14:40:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A9FF805C0;
	Sat, 21 Jun 2025 14:40:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D6CF80269; Sat, 21 Jun 2025 14:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2518F80038
	for <alsa-devel@alsa-project.org>; Sat, 21 Jun 2025 14:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2518F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I9Idt5J1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QR5EsIHdFgfDLYt8YToIi6n/H4+muoURIcYnYYvUTMC0soYCj2G7KWMFr3+Loh0SjYk7xkksl23eRNSilzavWkB6gQaFaa0Rtp3TXOIM4xi4hOBZ9MY6sepkwUqVbPuRKYGt381XLf3ktc8ABClmq5Xu+86XutqMG/2L9MEpmrNek9l5EVIFiERT6XWht0WkrAkLu+JwY2lyKY+b3girht8SQ/XGhiU2efff/ITsDNWKkUImQSqOpwe4foYGjryGqPPm+SHF6eZ45aNdgVpxx5SVHBg64leGnKin3cOx1Pf2OpZgcHkgVIbuo33QdmAs2jHi1a1hCWEw7aBEiMPA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/r5nKLOpLVqtysU7Ue9BISGQW4R4frbj7crEdX7oPk=;
 b=r7YuZWiz+7VkBJkH/yvHqpYB7+r60Am9qdqov1KUcSQMtJUcb71Nz6BWG2RvwEjLf2zba+da/W1Ebjhph6IUPsGXwgmXRmlUEVY+SvPiyFaTAdjpMUkI1OI7DqupTRo06s+rvPOMOYAgGTnJn6ohD5aS0M2UfYHrLFSYL8+wbRb89fvg60ad3sqJY3lqEkV8HyFN6tTqo/+INsR3UNIBCrDs5QyHScsERDrS6+jV0m2VA90Z6AXpH4g49wl7KVEeV668dgqwQ5x97MXsMhsIfu+PIAf/1FfPYMKpHTcKbFRpjqrsaS2RoiUSRTaTcN9NGJsvRvAcUu7OQLa9b8UPsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/r5nKLOpLVqtysU7Ue9BISGQW4R4frbj7crEdX7oPk=;
 b=I9Idt5J1K0bNODvRHqbseiza5I5iq7q0kOcxgNNoUu+FgiOKzhlOaO/WYRaFn8UrLS4lN6/PtCjbs/uZdyJo93956LcUpyzcuNF7LW6V42m7+akQjPyd3XFqeLqoSneGhfXkgxfg+G3WwsmMdoq69OAICsOOlxIEKRnxVVs+aoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH3PR12MB7569.namprd12.prod.outlook.com (2603:10b6:610:146::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Sat, 21 Jun
 2025 12:40:00 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 12:39:59 +0000
Message-ID: <feed5d33-63a5-4657-b9d8-34bd7f969ed3@amd.com>
Date: Sat, 21 Jun 2025 18:09:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: ps: fix for soundwire failures during
 hibernation exit sequence
Content-Language: en-US
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621095002.1336167-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20250621095002.1336167-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0173.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::28) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH3PR12MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dd3252-e535-4c13-2f01-08ddb0c0bbce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RHE5U2M4WksrR1pIRXZVUE9CNlZTc2FNK0tpcGlGdXVQSGFiWUpVTFVBeURu?=
 =?utf-8?B?MHZSejVUTG83VEJqMXdYWktRVEFjYWJqWlB5SHJ2VldJc08zamxoajIvSHZr?=
 =?utf-8?B?TDQ5OWVRUUpSZ3E1N2Z5bE85NmdBd1RXWE5XMTI5K0UzcXFMZUIvVnRVSEp0?=
 =?utf-8?B?K3RRQWtwRXp1N0ZtRnRaWCthT0p3MjNoaTVBMnJpTFZ4UjRraVh2MW5FdFRW?=
 =?utf-8?B?bnNLcUhRNGpCejByNWFtMEZIcmRqYjEweWN1R1ZaZ1Q2K2hZRTNhKzZvckhP?=
 =?utf-8?B?aWhxeTd6ODE3a3gyR3U1YnVLZUdVZXRQK05HWnJoaWZmNzJmeFo0UkdBZ1pS?=
 =?utf-8?B?V2tLUFN6eEphSS9DUFBCNFp2OVpRVHYwaUVmS1BVbDR3M0ozOEtOaHM2YnJ4?=
 =?utf-8?B?dWxaR2FFWkJjSEQwaFlpQU0vekp5UnlkWEZXVkhqcC85MGd5RXh1bWVmQzIw?=
 =?utf-8?B?cDRnWURUdCtvd0RJNWhXU012OU9hTEVkOVdtMHd2alVPc0dmUytEQXZXQ3V1?=
 =?utf-8?B?WFdwMUVrU3JJbE5RNktJM1hWWkY4L2JoRjJsaWxKUXRhNGFHR1Uzcml4OVZw?=
 =?utf-8?B?cnUzMGVzSU1mU011VFI0ZUtFbnF3VGg0ZDJIdmxwQk4xc2xaK3NEL1pEWEky?=
 =?utf-8?B?OFB2SUZKM2tJV0NYVWRGR29LaytYbzAyUU1XaDMzakgva3pkQzZqdXlwUjFP?=
 =?utf-8?B?bWJFT21NQ1lVRTZVNkIxd21NckZGU0N2WnJZcmlDcnp3dWN0WXZ0MVFRSG5t?=
 =?utf-8?B?TVBlVDRlVHl5U1FSS2JrSldDRjRCSzA4UDRBQlBtNVlraFNsTkxoUXJlYWJN?=
 =?utf-8?B?Z0JPR0RXQUM1UzJuN3hMWWdRS3dNbENYZmRCUDZ3bjdVKzVvUEpWeUZTdlpD?=
 =?utf-8?B?MDU2V3dKaDdNN3R2TmE3RERSK0d6cDljNnp0UlkzQVlQZFJ2L0RhaWJxMUt3?=
 =?utf-8?B?M3Jkd1dncWVTS0o4T08vankyejROajVSVVNpVHhrTE5DSnM0aDFNd2UwL1Bh?=
 =?utf-8?B?bVNvR1NlbVVBbUdTeTBPTEJPTSt0Wm42QUtBd0ZBQjY2cFBtMWJmQjdCcTUv?=
 =?utf-8?B?a1VGVzNjbXJlNWgxb0cxN0piMHNRR0twcDNPYnJNRzR6bXBscnZMVXdZQzJ0?=
 =?utf-8?B?ZmlEL0VBYVNDNjAvNkVpWUgxL1hvNmFNeDZmM2lGY3ZJSnJjWUY0cEtyV3BZ?=
 =?utf-8?B?amNwcWN0MHZmN1hRSnQzTUplQlhtSnd1VVNyQXowWUl0akpOd1BZMWpob00y?=
 =?utf-8?B?YmM3cDkwazlYSUJmQkZDVmdJbGhMWnVYaVVQMVl0Qk1ubGd6K080cFp5R1JP?=
 =?utf-8?B?L0FNNEwweVIrdDc5d1Q1ZG9kZ0tiZ2tUblhCMHZ1VlJnNytQaGg1YmFPWDQ0?=
 =?utf-8?B?SXpZTXBPOWwvblBxSjFqOVZSRm1LUkZ6NERkQmVvYVY4RWMva2RIenBmNXNX?=
 =?utf-8?B?ZmliNFdXTnJUdkhhSEZNVklJR1FDeTJsazVYSW9UVXl0RkhJWGI5VHRVckFR?=
 =?utf-8?B?aDRCeElxUjhGeGJWTjNGYTN2eEg0a1ZIZXcyS0NVN2RyamRFRnNLSStSWjRW?=
 =?utf-8?B?UXZ3VEJKVGwzbkxBcGpVQXo0Q1lYZ3dudHgxNkNqVFpSWEYybE1Sc1ZlUTlB?=
 =?utf-8?B?OWhBU0RzWUlYcSsrWDY3NW0xTUw0c1U1WlJKMUNIbVZROXRISi9NeHVPQzZI?=
 =?utf-8?B?dnFjVjRYOXpaakErNmZmNzJ3QWdlZStJQnozdlNEREtQVXpvMzlkOG16UEJ6?=
 =?utf-8?B?V3piUkx0QlIrc2o2WC9BQWFWUWlWaGFKc3ZmaEtmMDZOMUlUbGJVVmdWM3RW?=
 =?utf-8?B?TWl3aTFwWGxkaUVacE01WEVzdVUwdXY0RGtLZ3lUN29KS2xGcUdvRGt5RXgx?=
 =?utf-8?B?UVBxdWZKV2oyc1FnaHRJZG8xZVFGc2UyckFTTFdCSGxMTUVPRHBLMXdJMW0x?=
 =?utf-8?Q?8f8f+PfaWD8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTZNTlhzNVFWLzl5RjVkdE5OWElWbmRxWC9oWStYNG4xVG5hblpuWlJOc0da?=
 =?utf-8?B?aEE1aXA5dWlDUElmenRSVHNKOEU2aFFiVEt6VjJkNDRyKzdURTZYWTdUam1H?=
 =?utf-8?B?WHE4cGp4N0pWQkIvRVFQRU8rTmNISUhkZGdQQXdReElwYWlzSktYeWh4OWhV?=
 =?utf-8?B?REpjbER0NVdPMnlRMEVSSlJwR0dOU29wcnN2cUVONldNRTFGL1dlSkF0VDV5?=
 =?utf-8?B?MHc2ZzFLdFJzUUsyOHQwK3pGS3pvMktCekZlN2x4T1g2dUl6dHZ0TUhJUVpF?=
 =?utf-8?B?anRodXNzaXJQalZJR1dnS0lrM0Fla3R1RkhJRldoQ2pybXNlWVRoVHhBdkVz?=
 =?utf-8?B?WUQvV281dU4yaWVTNmRpSW13MkZEVklHNEJIa3pERnVFQUdOb0ZTa3pYb1E0?=
 =?utf-8?B?VEpQZnRFYjZZMUhpdTFLSTRwQ1NDZFhxUllYZGtlT3UwbnFEUnRhNXFJbFZr?=
 =?utf-8?B?eSt2S3l4R3BBMml0VEsvRUxqSGVaYTBhUnlwSU84MVk2a29aRTZTUjE1SlNT?=
 =?utf-8?B?K0RkM21OSVhaUmtJT2Z3ZVhidVIzY1hkZjgwR0ZIVFoxZTR3ci9tNHYwTmhl?=
 =?utf-8?B?TGFweU02cHZ4emUxMmJCTkkvZFZ6dGV2V01xeEI0ZG9XcDdQdXZtaFdsZHRW?=
 =?utf-8?B?SHZVdVlXR05pOVl0ZEtFYWRUb3hKKzBTdW45bGdycldkOTVTOHhGSmdab3Vq?=
 =?utf-8?B?VkFHRE1SMlgvaEROcUJTc2xOUXYzR3QxU3B6TFBROVNhSjJOa1dTN3V1VzRV?=
 =?utf-8?B?bitCelM4M1BUMTFjMm1xR2NaRjFNeTFzMk14R0hNb2VpMXM3dXU1Y0NDeXQ3?=
 =?utf-8?B?cEF1VUZ4TjU3OGplZTlNSHgzWUxoTkJIWE95R0lueEVjY0RsLzBaREt1Ynoy?=
 =?utf-8?B?a1I0eS9QVm45dDJDOE5OeldudlhJSzYvM3ZjMUMyWUUrRG96UCtxTkFBTHk4?=
 =?utf-8?B?U1lEbURWZU9FMDRWSW9YL3A5OFlOa01YMzJybWdPckhzNFNpVU9aVXpFUE1r?=
 =?utf-8?B?OEtWeVV0WUF2alRQRjVNZ1FyNjdDbG55ZnV2eHM1MUdKczUwZTFsZEg3YUpa?=
 =?utf-8?B?enhvdkNHcGZsK0xla3RkRnA1SGZtcmpMUDFXOVR4bU5mQWk3SjZ5ZUZLQm5x?=
 =?utf-8?B?N2cvK0pIMXYvMFBXQjl4SmJJVnVWWlpyWVAva0o1dWZzVnIxT0RXMlFUUXVJ?=
 =?utf-8?B?UkUwc0dyZ2R3OVlOaCsxVXRNTTkyZ2tVbkR0Z05vNDJsaWRqUUFzc2s3MUhW?=
 =?utf-8?B?QzlzeTl2Wm9pY2NwdDR5KzNHaVkvaEt5Rk0ydEFjSEcrelJjK2U1OGtEN2lT?=
 =?utf-8?B?UVM3a0JtVWx3ekpvR29CYXIxM2VyU1ZZbEl0MjJLUWx3aFlIOGhXRTQ3bGU0?=
 =?utf-8?B?NXpEaDlZc1E4VklFTUNnQXZUYmM2blRMcTNwdGQ3SXlCZ0VQNmkyZXE0bHV5?=
 =?utf-8?B?L0RtNGVkTzBpSHIyZ0xQQ3FQSThFcUM3OHgyRHB4MEJJRGdlWk1vY2pQanBV?=
 =?utf-8?B?ei9xVzBkbGViUS9IZk1zUU5hWVo0aTdKT3pWN3lUemF6cTA3UU5jRVM1Rk5W?=
 =?utf-8?B?ajljbFdjVnRFTFZlaTFDRy84dVBVWmVYRTl4amFZWTE2ZFZNWU42LzRnSncv?=
 =?utf-8?B?cm9xMEI1YzhZYUVDR1RIbkEwTzdHeExiSjNOUThYSkl6aUZaaFFyQXJuYWlt?=
 =?utf-8?B?Q0xrY3dLSWNueFIxNzJ4NjNZS1pPbWRSWlJMZlEzM0xMSDNVajVBcmZZelJF?=
 =?utf-8?B?LzQwN2c0OWRQMllnUit4dTBDNVpDSGlaNWd0QUdNOWhMMjRkOWZhNnBld0c1?=
 =?utf-8?B?elZ0MHpyZHYwcFhadDdHdnBaM2pCVE0vQld2cHd3Z1QwTHYwUHdRQ01LZHpi?=
 =?utf-8?B?NUd3KzNEM05XUStobG9JcWUvdTdZSXg5b0FKb1diaDlmVmxBbHF1algvTHJn?=
 =?utf-8?B?SW5xV2QrVU1telZEMjFPdWV5bURNVUlhZUxta0F3dHpUUkFPTEJsdWJpWUxi?=
 =?utf-8?B?OGtGZW9KL0pqanZUbEo0S3BMNDFhQmdFVDRRTDAwRTI2clRmbk55YkhjbXFN?=
 =?utf-8?B?OXZRMVNxL3VGZ0N1VnRZUVpDK3VzeXBoQitWdXpEQWFkYUowTzduVHhUZS9n?=
 =?utf-8?Q?XzM5Dbi7UZC9axQJ0WrLxPJyW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54dd3252-e535-4c13-2f01-08ddb0c0bbce
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 12:39:59.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yw5/Ltf0iyjhLbik/n0i8L8YCCgIDeNljBqI40b3XAoxQm4RXZo35pQ3WPmroyULfYTmax445qdJfmVUOau6kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7569
Message-ID-Hash: 7P7FM7TVFOSBGZBNLCD56LHVVL6JEFVZ
X-Message-ID-Hash: 7P7FM7TVFOSBGZBNLCD56LHVVL6JEFVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7P7FM7TVFOSBGZBNLCD56LHVVL6JEFVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/06/25 15:17, Vijendar Mukunda wrote:
> During the hibernate entry sequence, ACP registers will be reset to
> default values and acp ip will be completely powered off including acp
> SoundWire pads. During resume sequence, if acp SoundWire pad keeper enable
> register is not restored along with pad pulldown control register value,
> then SoundWire manager links won't be powered on correctly results in
> peripheral register access failures and completely audio function is
> broken.
>
> Add code to store the acp SoundWire pad keeper enable register and acp pad
> pulldown ctrl register values before entering into suspend state and
> restore the register values during resume sequence based on condition check
> for acp SoundWire pad keeper enable register for ACP6.3, ACP7.0 & ACP7.1
> platforms.
>
> Fixes: 491628388005 ("ASoC: amd: ps: add callback functions for acp pci driver pm ops")
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/ps/acp63.h     |  5 +++++
>  sound/soc/amd/ps/ps-common.c | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index 85feae45c44c..babf2fa7ea27 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -82,6 +82,7 @@
>  #define ACP63_SDW0_DMA_MAX_STREAMS	6
>  #define ACP63_SDW1_DMA_MAX_STREAMS	2
>  #define ACP63_P1_AUDIO_TX_THRESHOLD	6
> +#define ACP_SW_PAD_KEEPER_EN		0x0001454
>  
>  /*
>   * Below entries describes SDW0 instance DMA stream id and DMA irq bit mapping
> @@ -334,6 +335,8 @@ struct acp_hw_ops {
>   * @addr: pci ioremap address
>   * @reg_range: ACP reigister range
>   * @acp_rev: ACP PCI revision id
> + * @acp_sw_pad_keeper_en: store acp SoundWire pad keeper enable register value
> + * @acp_pad_pulldown_ctrl: store acp pad pulldown control register value
>   * @acp63_sdw0-dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
>   * manager-SW0 instance
>   * @acp63_sdw_dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
> @@ -367,6 +370,8 @@ struct acp63_dev_data {
>  	u32 addr;
>  	u32 reg_range;
>  	u32 acp_rev;
> +	u32 acp_sw_pad_keeper_en;
> +	u32 acp_pad_pulldown_ctrl;
>  	u16 acp63_sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
>  	u16 acp63_sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
>  	u16 acp70_sdw0_dma_intr_stat[ACP70_SDW0_DMA_MAX_STREAMS];
> diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
> index 1c89fb5fe1da..f18d2a0d83aa 100644
> --- a/sound/soc/amd/ps/ps-common.c
> +++ b/sound/soc/amd/ps/ps-common.c
> @@ -160,6 +160,8 @@ static int __maybe_unused snd_acp63_suspend(struct device *dev)
>  
>  	adata = dev_get_drvdata(dev);
>  	if (adata->is_sdw_dev) {
> +		adata->acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
> +		adata->acp_pad_pulldown_ctrl = readl(adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
>  		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
>  		if (adata->sdw_en_stat) {
>  			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
> @@ -197,6 +199,7 @@ static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
>  static int __maybe_unused snd_acp63_resume(struct device *dev)
>  {
>  	struct acp63_dev_data *adata;
> +	u32 acp_sw_pad_keeper_en;
>  	int ret;
>  
>  	adata = dev_get_drvdata(dev);
> @@ -209,6 +212,12 @@ static int __maybe_unused snd_acp63_resume(struct device *dev)
>  	if (ret)
>  		dev_err(dev, "ACP init failed\n");
>  
> +	acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
> +	dev_dbg(dev, "ACP_SW_PAD_KEEPER_EN:0x%x\n", acp_sw_pad_keeper_en);
> +	if (!acp_sw_pad_keeper_en) {
> +		writel(adata->acp_sw_pad_keeper_en, adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
> +		writel(adata->acp_pad_pulldown_ctrl, adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
> +	}
>  	return ret;
>  }
>  
> @@ -408,6 +417,8 @@ static int __maybe_unused snd_acp70_suspend(struct device *dev)
>  
>  	adata = dev_get_drvdata(dev);
>  	if (adata->is_sdw_dev) {
> +		adata->acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
As register offsets, ACP_SW_PAD_KEEPER_EN & ACP_SW0_PAD_KEEPER_EN
are same, will use the same register macro and post the v2 version.


> +		adata->acp_pad_pulldown_ctrl = readl(adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
>  		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
>  		if (adata->sdw_en_stat) {
>  			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
> @@ -445,6 +456,7 @@ static int __maybe_unused snd_acp70_runtime_resume(struct device *dev)
>  static int __maybe_unused snd_acp70_resume(struct device *dev)
>  {
>  	struct acp63_dev_data *adata;
> +	u32 acp_sw_pad_keeper_en;
>  	int ret;
>  
>  	adata = dev_get_drvdata(dev);
> @@ -459,6 +471,12 @@ static int __maybe_unused snd_acp70_resume(struct device *dev)
>  	if (ret)
>  		dev_err(dev, "ACP init failed\n");
>  
> +	acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
> +	dev_dbg(dev, "ACP_SW_PAD_KEEPER_EN:0x%x\n", acp_sw_pad_keeper_en);
> +	if (!acp_sw_pad_keeper_en) {
> +		writel(adata->acp_sw_pad_keeper_en, adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
> +		writel(adata->acp_pad_pulldown_ctrl, adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
> +	}
>  	return ret;
>  }
>  

