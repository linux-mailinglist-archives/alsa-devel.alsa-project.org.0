Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94498D19A9F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jan 2026 15:58:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A29601E7;
	Tue, 13 Jan 2026 15:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A29601E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768316332;
	bh=xxg79ebGwhhpPqifU8rus7+NjCYBZK/Orel67uqyHqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o/obBMvMfXc2RqWixnj1C4O26FeJB+lijy/MO0RE0KiPIhL0V6zMoi2qoZYC5+0zP
	 cCG8N6LpaXpDhGmudHFEoESXOTi1n9ckgPI5hprReuAkxq9dN1jaezrtkAOFN6NnA1
	 DrZtsAGBzs99w92MHXQnyw+BRoiNhfh7S5XQcphE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B01EF805E9; Tue, 13 Jan 2026 15:58:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA12EF805DA;
	Tue, 13 Jan 2026 15:58:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4AF9F805CA; Tue, 13 Jan 2026 15:57:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011048.outbound.protection.outlook.com [40.107.208.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B56D2F80016
	for <alsa-devel@alsa-project.org>; Tue, 13 Jan 2026 15:57:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B56D2F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=uMaj2Vk0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcP88VutlZCN0k5TGhOQdWUGYQX/Y7rod3aCZKkdQIjEOkP8ILPqPcPfylceqEqv/gmrFXe9vFzcZD6V9XY1XvDc7LMPqQU8D8qVdOncdc3LARZtq5sG1zOi2qMWzJBpgJVE6O0yCyEqJBvihzejYLLmJ6ooO2PAG8PdkRj2zyd9SZQhNHCVzrVJjgiCcMISO3s5zFeyxXMqhp84uPASDLyN4//yOoA3M9BwNXaVFIr5pbIo3v7on51oqp31Km5KN7YJL5Bm3WEHyXbB690AyOyoQLi3PcBeYVKHfJtzvl2v/yBYlFGVDAVoP1o6Uklx4/xCYueaQCqboeDzCcoqRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yPOx3ZItACM/jQPGFGXaA3iNU5ePj2f9GpGs52SIZM=;
 b=X8xLe9s74gAdAHWGhVwnQOV5XDJgCvqU2KAjr1ZZG22NMJx41PHaHhZSrUPu8bo7rMGMo4jYrsyEcfCkX9vWdaw610DjoNYFWSrABy9CwmNHiP1rF6IMNX5dl1trsf2YwPTqGi21s/G7MdwKVnYAoK9ltHvjYXTRtkkz1myKIc3FbgDF/hW30ZGYdyYsKK/PnTco2r9+uu2l/uZhneHKocEEE8T/cdgVe2sToR3DYOO+caxQqih8sv976D6ul1TF2QyvJ9BQzawSj18+PZ8KlQmZ3r/8EuIBDJ7j5FReLime2ZiP9Vb815pWFgJKEOIYJITtsG8QP+D8Sv/v/TM2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yPOx3ZItACM/jQPGFGXaA3iNU5ePj2f9GpGs52SIZM=;
 b=uMaj2Vk0xy4b8ur258XX1mtD4SHXW0YHLmbFoSfpCTQwL0ARnha3hNQeo0QKuRrT2a4PbxgDNyBhK09jnETb7UTY1DQQO3k6RKGfyW0VGVrSQ9aj+/RR2omRqLX9fVTvui9w9IFdb0XD95gxPOgH1Pogoz4A+7rG3AsTRkYNclk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Tue, 13 Jan 2026 14:57:19 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:57:18 +0000
Message-ID: <80125d69-334d-4b07-b3bc-7b9fb657f466@amd.com>
Date: Tue, 13 Jan 2026 20:27:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
To: kernel test robot <lkp@intel.com>, broonie@kernel.org
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 yung-chuan.liao@linux.intel.com, simont@opensource.cirrus.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
 <202601131155.RXGj4KHv-lkp@intel.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202601131155.RXGj4KHv-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::6) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS7PR12MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbdfe12-805f-4a49-fdc2-08de52b40c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a3dUYzlBOW9hdHZoOWhWMjZOK1RlWnBGa1Z3UjRlTG9lL1RNUHZPOExyL2xE?=
 =?utf-8?B?OVdGeUFoN1VnZ2VhbUh3d01QY0xaeGdCNTROaHdNTWw0R1RNZjk4RFh0ak14?=
 =?utf-8?B?SndTb2ZqQWN3MUhua2dJMVV4ZUZ2SmpoUzFvbjF4QlNsMGJKZktZNmtPVnVQ?=
 =?utf-8?B?QnVzdUhRZDJldWxNbWs1eDNDZGNwRk1KU0Rua1E0RG5waHZZeTN1V3dCQ2x1?=
 =?utf-8?B?dlU5WUxqTVZtYTZodjhRKzlZQWZSSFFnMm16M2YySGZnV0d0YWVsM3pVQ3I3?=
 =?utf-8?B?dElFdWRTaTFqSDFxRDBFNjBOeFpZWVEwR2N3L2c4UG5UcUJRZnM4bjBVWXlM?=
 =?utf-8?B?NENjVmc3aXNoQUFrNGUwQ3p3VTZEYkVpVWVqcWprSVpNeS9HcFQ2eUFieE8w?=
 =?utf-8?B?em9ZOUV6dVhsUlFtdlMvQjkwRkEzbUs1bUN4YWJkTWNKTVJOcjNwZUVLdUhU?=
 =?utf-8?B?cVpYQVFYVEVTS2hIYURwa2pPNFNTd2NlR080WE5iYUo0UGNFZmhQM01nZDVz?=
 =?utf-8?B?VmR0cFY4Mkl1dlhINlJsdEwzVW5CNWd0dFRvRHJ2aWlNTTk2bE5HUUpiUDFC?=
 =?utf-8?B?aFZ4Q0xBMW1TZWh0a1RyYU1vTmpXZHdmZ3VMK3diVFNudXVPUzBNVmxxT2RG?=
 =?utf-8?B?QnU0K2pIVzZCQVpMQkpYQ1VQdDlCd3pIUFR5TVZveWNKdXE5dSs4R2xiTEFJ?=
 =?utf-8?B?eVBVYk53L3dlcDFoTjJhVkE1YzZkSEROY2toVzJPNmQ2VkR5cFk1NXlYemdo?=
 =?utf-8?B?MzBlbmdmL3Mra25BdE55ZGw0M3BxNklQVFBCaTBNY21NNk81ZXdma2pvME1l?=
 =?utf-8?B?RGcxMVRpbGI0dTJTWGNFOFZscFUvbzU1QzlYOGJTb09zSWhCbkl6cG0zSVNz?=
 =?utf-8?B?dU5nMk9yVUlBY3l1d3ZSenViRnFjbXlIc3YxQncwTExUbTYraUZEbXhqdGx6?=
 =?utf-8?B?OFFDYjVTYXhtTHlDTGpHY29hTHkrK1N6RHlRYlNZakt5VDBPSlRwSFB6UUxs?=
 =?utf-8?B?QU5JRTgzWGdxSlY4bXdVWWdsdGk0aHdFNWg5YUdiNVVBQlc1NTkwb21wb0hY?=
 =?utf-8?B?WHNZMXptYVZPNzlxdzlrQ1lMREVmcy9CTG9pUTI0cjNFaHlKUTduK0lJL01a?=
 =?utf-8?B?VGpiTmRzbUUxMFlSRUxBZHhhZDEzdHYrV3VsL0l5YkY0YTJNR0UyOTRoSFF5?=
 =?utf-8?B?dDErYWpHMDJTbTQyMjJXRE5hcVFhc2R3TkhHczgxQlpsUlNoQzJpenBEWEdk?=
 =?utf-8?B?Y2pkK2s0NjhQZGRiQWJ6cmpqbWJpakxOY1lveXlESVNzUWdBaW9sdFZkaUZl?=
 =?utf-8?B?SGhEUVJseXdHNnRWN1Y4a01pejlVQzl5ZG5jMFd6cENuMUh6WmJWbEtPM3Jk?=
 =?utf-8?B?T3k5MEdZOW9WTEJsOU1jRDZPTW1ydVFEYWdiZHlrM1h5MnVuV0d4QlByQnll?=
 =?utf-8?B?Y1Q5dGY3dWxqOGl6eXZQeGlFb3lmQjNsT2dwKzAydU51dUprS1BGbVArVXNF?=
 =?utf-8?B?UGJKY3NEL1huTzdCV3JpWGlkb3VlSnB0MG1QQkloRWgrYTNMMXhJYmE1d0FM?=
 =?utf-8?B?WmhsWHhwV2ZPWDBTOHAzdHJLY2swYjNaNUd1NmNsNWJjREwyblVzWkVrbDVC?=
 =?utf-8?B?RXd3dVNISmlOaElKR2piQmdJci81S3ZaeTB2VndseHFSMlJUTkF4c1hTbTk3?=
 =?utf-8?B?YUp3MWFrdGhOUkhlZWNKRWkxemtuck9KUjJoYWNuenduY0ZiNmtmenlEbjc3?=
 =?utf-8?B?UC9LOHUzaGNpQVVYUStPWks4M05JT0lBaEtwM0FIL0FJMG8xL3l4K2NIV3Jr?=
 =?utf-8?B?K0lyRGNYK1hVUHRtblVtNTZESUl2UXBoRlpxRUc3Vk9lTVFTUTVQREFEVG5q?=
 =?utf-8?B?SzB0d0JqY1NPL280RzFERkdHalUyd0M3OXNmZGJKNkwrZmt6azNoS0QxU1BH?=
 =?utf-8?B?UjkrTG9ZY2FHNzFkZnBmdjVPaFo1dUdUTVBVODJ4QkM0MXljbEJac1NpTmFR?=
 =?utf-8?B?UjV6WHhxR1lRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dTdKNDFxZXNWSFRSbm5FZWxuVnRhejIxOTByL3FUcDNJaUhzSEpsMzNFN2d1?=
 =?utf-8?B?MTFrYWoxbUNuV0tpZHdNL052dlc0ZGRiZnVxekZ4RVFGUjI1V3FOZlo0ZzFm?=
 =?utf-8?B?NC96MXRsYXBFSWtxWDFPaENlOTd1K09rZlpwKzRoUExWQmdGRWxqdEczNGhl?=
 =?utf-8?B?UG1hRGljSGdKVGFjR3AxdHZDdHVEMHNMWHo4N2ZackwzVzRGbGJoWUxDbjc3?=
 =?utf-8?B?UzUzWGQ4WDNYL2dnYnIvbjZWY0xXSWQzbGYrRHV2RjF4SUl5TkVaNEgrMTZS?=
 =?utf-8?B?YjFrRXRQMWYyUXJUS0tGek5xZG5LVlBmRDBGMWxaVE53Q3preE04YmFBSnY2?=
 =?utf-8?B?VTlLL0pSMjdaajdwLzlCdlo3cXJmMzUxQ2VSb1BUUy9JVzFpdERPNCtMM1VD?=
 =?utf-8?B?YVkvS1QwLzFORXlQWmZIY2RPVWVjdVdoMmI0N3FGb0NLTThtdjFtZFRBQjNL?=
 =?utf-8?B?MTlCUTJvWncxSlFjZXJPeGdDS1JFdGFOOVcvNE9vUHdXQmlKK3pzSlhaVVFV?=
 =?utf-8?B?SXU0KzdTQ3J1WWNWL1ZqYkp3Tjdtbml3YUs4RHp3YzBHRmtROTFWTVNyWkh5?=
 =?utf-8?B?RDhUejJINStJN3RWQ2kxK0ZtaVFyVXo5RDRMeFJ3RnBLOE8vaXBpWmUvN3o0?=
 =?utf-8?B?ckZBU2JLaVZjcksrMTQ5RkdmMUxoZlBxZHJUWkFoWWlUeDhpYTU4bTRjZDl4?=
 =?utf-8?B?OGN3ZGVxSzdOYWhxVDBmTlF2ZEMwSjNYWG14Nzc0cVgwNVJqQnVhdzlnOFlx?=
 =?utf-8?B?b1VLZHd6NFV1NFlIRlBSVnRENEpYYVZJYWhoejI3YWdYM0NyR3JDR05oZjhq?=
 =?utf-8?B?YTlEcUVPUzliSGJPbUdEVWhqSXdCL3Y3b2swZktrMDV0dUhac2dWSW53L0h1?=
 =?utf-8?B?dE4rWGcrMzZpc09KTDdHZmI1WTdoMy9namRsRTlVTEM5S0JpL2cxRGY5dVlB?=
 =?utf-8?B?SmxxNmoxMzI3cURWV21rOHoxTnRMNExjT3IvalNtc2VUQUhjVjdLam9VcUdn?=
 =?utf-8?B?Zy95Y0toaEdUellVK282V09aUWpRSlZtcERaWmNEQlZuSHJCeHQ2a2s0cjI1?=
 =?utf-8?B?eFUzbHM3VTFubEhSQVkyUE1xRFhwOVBzUy9jc1pWV1RLUDNWUFJwWWxFVk5a?=
 =?utf-8?B?Mk5IMkpkMXVzeVQrbWZBSlRaZVAveWVFaXA0Zm13WFU3bW5yT2FWWlNJYzlh?=
 =?utf-8?B?UTU1MFBTZHlYMTl2QlR6OEl2M3B6M3ZzdTY1VmdCZUN1VXJYaHNKcFk2aEJr?=
 =?utf-8?B?MXFxUkpNdGZEK2VPSlVNeWU0cFc3bm5obUxQMFZHUy9sYllkdUh0UEtoN240?=
 =?utf-8?B?MHJWeUZFejBianIvV2Q4QXMwcEVkMDJVZk0rZys1d29MRUROMDBFenpvdDNT?=
 =?utf-8?B?VVN4cUNFUUVNZFFzL3BlbVV4dm5ISXBwNG9TME1GSm5PNnNRWitiTXhPYnNH?=
 =?utf-8?B?MldUR3orbmxpeWh3ajY3WVJxVGl0K3Z4YURYNGhXRDZoR2c0bU5VbmpKa245?=
 =?utf-8?B?WHlZRG93ZmRsLzE3MEtSVEtBSEVSVkRlNXVlSVd6RXZPS1VMU09Bb0M3Ykpa?=
 =?utf-8?B?VWgvTmlJeDZNRzJ0WDlMdXVzMklCVmlSczY0dzdxTHNpelVWNEVKcGtkV0l4?=
 =?utf-8?B?eWE3NExGL3RXK2NZRlpDeVMvejdoMmFnM0V1M2VPWWQySTRERFZnTXBDQXRN?=
 =?utf-8?B?bElwbVBWdmk5aVlkdFdrQlpXVGpITVRWSVZ1T0FzMDlSOVo0YW1vK2kyYTd2?=
 =?utf-8?B?R2xkTXRKa3piM0dsUjZUQVBjdEJNR2FPdVVkZktnQS9rWmZhOE1SbElYWG40?=
 =?utf-8?B?ZUtjZXpzeFUxV2oxV3RnODFwVW5MbGVkL2UweGt5N25kYmFPY3QxYTQ0Rm5D?=
 =?utf-8?B?ZGdpRENPY3A1dDBlOFFUa2JXbXVKK0t5dGhmNmVwU2FqT2hOaDdCVHZiWXFH?=
 =?utf-8?B?eHRBUHBKa0pQdnA1eFpaTDhIbG1lMXc5cDBTSlczcDJhRjlKSGVsRjh4VFRT?=
 =?utf-8?B?UzltMmFsTTFxb1VNU1F0UWVIbUxLbVUrN0lQeUlDK0ZGbjh5aGEwUFRrV0NV?=
 =?utf-8?B?TTdTd2RkYW43aVM0ZEF1cnFCZnBObmRVaE9wNnhkM0JodmdaWGtwT2I0QVp5?=
 =?utf-8?B?ZUthdHVXdWVqbkxuakVlMmlaTUNhZ3dtOUY0NTJFcDg3N0d5bldINVZWWTFi?=
 =?utf-8?B?YVZEWmJaODFYcm1Wb1c2eXA3RlZ3L0xPODhtWFlYS3o1VkI5ODJlRjUvOXJ5?=
 =?utf-8?B?ZFdxYXNCUU16eDA5NW02VTJNZHpIeGFRbVB3NUM0cjdnZkttUGNveFJZcnBZ?=
 =?utf-8?B?bytpeFRyZzNjUWJYY2g2TTlDb0hPK3U1b0hnb0VHRW96OHZCN2FIQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6cbdfe12-805f-4a49-fdc2-08de52b40c35
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:57:18.7918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QKp8+aIjotP1YIL18msAdpiCEBoYkho7rxJ6wsPfdfxps1o4acgMJunFwvOQU5NSI7pwCHiEoSWtmAI4D3Nejw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333
Message-ID-Hash: LFZ37TXXE6DSLXP6UW6M2AG2RSMWRVS3
X-Message-ID-Hash: LFZ37TXXE6DSLXP6UW6M2AG2RSMWRVS3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFZ37TXXE6DSLXP6UW6M2AG2RSMWRVS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/01/26 15:55, kernel test robot wrote:
> Hi Vijendar,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on broonie-sound/for-next]
> [also build test WARNING on next-20260113]
> [cannot apply to linus/master v6.16-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-acp-soc-acpi-add-is_device_rt712_vb-helper/20260110-144723
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20260110064505.1485927-1-Vijendar.Mukunda%40amd.com
> patch subject: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
> config: x86_64-kismet-CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS-CONFIG_SND_SOC_ACPI_AMD_MATCH-0-0 (https://download.01.org/0day-ci/archive/20260113/202601131155.RXGj4KHv-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20260113/202601131155.RXGj4KHv-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601131155.RXGj4KHv-lkp@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
>>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_ACPI_AMD_SDCA_QUIRKS when selected by SND_SOC_ACPI_AMD_MATCH
Will check this issue.
>    WARNING: unmet direct dependencies detected for SND_SOC_ACPI_AMD_SDCA_QUIRKS
>      Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && ACPI [=y] && SND_SOC_SDCA [=n]
>      Selected by [y]:
>      - SND_SOC_ACPI_AMD_MATCH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y]
>

