Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D49BEFFA
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2024 15:19:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13B3AE97;
	Wed,  6 Nov 2024 15:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13B3AE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730902788;
	bh=JUDj+gNlKtDOHwWG5whJnZ/QR47rONppvZSX1l+C0UI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TLw93i71KdysYbkMESbWMYZ8jj0AfqJqzBjeKIrqe2jQGxfEKsjuNoVJd7+8PjQVv
	 PGtIXyya+hHkfLvuQrJAoxDbRYmbl6Y2DeuPhPeQNd9mlaz5jVoS9oaEVUJ1rEDPlD
	 lm0ZOT4xdw+fE+jLidUglp2nQP8ueq2b3QdwgbGk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B33FAF805B3; Wed,  6 Nov 2024 15:19:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8F5CF805A0;
	Wed,  6 Nov 2024 15:19:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D89CF8013D; Wed,  6 Nov 2024 15:19:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::60c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5455CF800C8;
	Wed,  6 Nov 2024 15:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5455CF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oCdV0mP8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SezUiWJ1AUwKqWuvFDaiwp8uSkK5WUHf4O/F2WFqxgYN8zTAA/MA/hUgfx6pwUcKQHjU/1156KRZjcdyk1bw23fwOGe3/b8tx2OkjyIPeriTpfKtNoPcSYSxK2GEGz2DbLfrD7mhwzGTMvz7x6Czsyttx/Mxloqcb/l3Jc1os8GD9iIVtfg8/IXrV/uNXun++2DdK2pRobI9qr89QEqS0+L/bJhgKsY39cmX9rXvObEtSKeprIyfC06K2PXlmX1TAhw2TWHZL1+tt1ySpAEuntzZacvTkrKS6p5Eo52MIgN4khqE8+5x1/paJL0/Ovi7FcQmEgxwaZW9X9RTAx/Hfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUDj+gNlKtDOHwWG5whJnZ/QR47rONppvZSX1l+C0UI=;
 b=zR59DHuq1BPlBriOUNWg7oOzPC15elwdFt7R0NCOhhqqQlE4OrFbirjqHnbBdm5YJcXxZZ8mUb+LZHlcCqOST48EiH7jFp6biRLUNDuLXhgdVaIvHAkbSDdcc7CjIKl7tlXfj4CG6rgGvIctTBoIbKW4Wak+CSaFXJ2qtrDWshWGJAYCC+ZMOFS1wpr83qdtiufGXF5LutWnaFGbNiYNfkNtpmtnR3piX76iWz2xrtXP6q5mer7PyPiA7Je2df3M0Q2OlVreTqZ2YlnRINqqVRlRs+Y95l7lGzVM9vNQpKbkX9IS/X9/tIRBVU4ysqQoYhpI1pNIPCKJIOn04jwnNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUDj+gNlKtDOHwWG5whJnZ/QR47rONppvZSX1l+C0UI=;
 b=oCdV0mP8OA4SjD4lUCjN0UTciLacEnEuqaOtYovAiV9VAgk0V7WhXF3yfLipul32aVl/vF227/CznST4ROgBVCQH08Tgnnl3TV7fHsaHA43sWGtuGE5ZXQC+5cY++7pjDBIYYmjYyLoOAbhNXujIj4fwf3tdFVL/n8oykiUTgw8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 14:18:59 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%5]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 14:18:59 +0000
Message-ID: <7841e33a-bced-462d-a2ed-ee80ca726b1b@amd.com>
Date: Wed, 6 Nov 2024 19:48:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: amd: Fix for incorrect DMA ch status register
 offset
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
 <sound-open-firmware@alsa-project.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241106101455.1229113-1-venkataprasad.potturu@amd.com>
 <5e1f7675-1f64-4078-a923-ee51945f3c03@sirena.org.uk>
Content-Language: en-US
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <5e1f7675-1f64-4078-a923-ee51945f3c03@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0136.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::23) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 080c197f-be6b-4801-0e24-08dcfe6df49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTkwUmxBeU8rRUt4RVFTVGNvV1g0QldFNmh5YnJFZUJKYW9OeVJENUQyL1lK?=
 =?utf-8?B?cXJMMTdiTWl4TkZMTzlzQkJTeUhTYVlhbkVqWm82U0NlT0wvK3liL0FWWFNM?=
 =?utf-8?B?TUZleTdFd0FXTFFua0pKR1hkNnlQQXZzQ25Kc2FXR1BINjJWQjhoV3FhVXM3?=
 =?utf-8?B?T3lMaythZ3JjSmlNM29yTU9lR0JldElJdVROYUMxSGtNNFk4TFdleG5QRTIx?=
 =?utf-8?B?aW9XVUMwUlQxdHczSVVYV3l5dzhod0tKVklmN2VGZWNYWHErY3kyb0FPbldT?=
 =?utf-8?B?OHpVNmUyeEtZd1BjdnM0THFEZDYzWlZmOS96a3ViaVE3RVdsR3FBbnh3Z2Zw?=
 =?utf-8?B?QVFTazdMUFJPKzVEWGJXZ1JEYWR2N3YzaFJrODJDWEFvL0xrR2lyWDV5M2pa?=
 =?utf-8?B?dFJNKzBSTkxWbldUNjRWTVVmSjhSMDhJVkF2ZXpwRUV1M1diWkR0QjNYUXRT?=
 =?utf-8?B?dGhzY3VqRmVVTzE3Tyt0aTNlLzZ4UjRCS0RTMWhqNS9RczNtWWtnRlZ3STBp?=
 =?utf-8?B?WUZFN3R2Zml2UjEvNzBWK1dzZUNpVmgxejh1ZVA5RFFiVm9jYlhaWWVML01W?=
 =?utf-8?B?ak9ic0dwcWFocVdhNjQ4K3hLbkV2cTdxbnVSdW9URVNKVzJCRkxsU29SQmtQ?=
 =?utf-8?B?S2dnUFJzT0c0eUZrLzhFZkJXMnNsYksyTHZnbGwvakMxL0JQNXlzQTZiWlBU?=
 =?utf-8?B?NGVMOEkwWDhxRjVCbWdoTDNWc3U4R1hIVisxa3IvcXlmRHV0Mzl1TGVFL2Zu?=
 =?utf-8?B?MWp2SjNqYXdXQk1vQ1BQQTFKclhFVDhEUGtSV0xSMTZhWHJ0QnR5aCtZRzZG?=
 =?utf-8?B?YWJ6ams5QlZnNzUyZitMb1pmWUJ6SUpiWThIalN5SXFBSWY2VjNnWTRSZ2xu?=
 =?utf-8?B?MGVoenl1TnU5S2NBZ2wzbHpCYi9KUm1wUTdlY1Iwd0lmV2FBbWZidGZobTh3?=
 =?utf-8?B?SDdVVUI3aTArSDZkQlpZU2VibWEzYkJiNmtNTnZwalgrcGdlVEJocFFCT3ZI?=
 =?utf-8?B?bWFQRmdza2c0MDVYN3AwaXdGdDhydXRlZFAydjFDNkw0NmhiT3FCcGNHd05K?=
 =?utf-8?B?SGdDTFlxYkppY0tENjJ0Vm51bFVmWW5kSVF1VGdYNUlpRE9mTDdDL0lObi9E?=
 =?utf-8?B?bGh4ck5TRkJJbVowUjIxUmRmZ1JpdDlDWjU0M3RyRm56cEs0TnA1NExzRHVh?=
 =?utf-8?B?OXNidFdmWnRjT2JtLzNIWVRZNTYzc3ZlZGRkb1NKbHVzTXJyYXAwamlBSGtT?=
 =?utf-8?B?eWRmUjVBNldKU3NKVUVGRUQyR3FBQXhkNGNnQnJMSTIya2MybnE5cVJqZkx4?=
 =?utf-8?B?d2ljVzIzdzJyd3A1ci9uWU1iczNNM1FMUFBmdWpyZXh0ejZ5YWl2MUFIanph?=
 =?utf-8?B?SjBteFRrYndtdTJjanVRQ0k1SkxSK1dvMWFLOVJTeE8wSDBxZWV4S1E3a1Rv?=
 =?utf-8?B?ZC9uVUJEcll6VWNKTk9oK2htdzk4VVFWWEhWR0lyTm5zbXh4UTgzZmFBbHI3?=
 =?utf-8?B?SGtWdUI4UENUVTZ2bDZXZmJWTG5Uc3V3R3RCdHdqQkZBeGxOOXIvdGdiUDlP?=
 =?utf-8?B?NjFLbW1GcWFvNDlBR21iZzlXRE01L0MrN3NLQkFLaU9qUHRZUFpvNHNIakUx?=
 =?utf-8?B?aWltSlI0bkZLblhtQjZLWFN6N0dSUHBxUFpVazJUYVZqRGd1YkRXYitIT281?=
 =?utf-8?B?VjJmQWJtdC9wWlZkeDNzci9MRFRWbjNkUi9mS3B3TjRhVXlGbWFYbVE1aXhj?=
 =?utf-8?Q?x9PxAhgwROn/0dayUmox3aImgoQkS20KwkIrFYG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ckM4VGg2Nk1xQWtDSmN2bzRNWndlS3R4Y3lkenRITmhwcnlUWElnZmllVFNG?=
 =?utf-8?B?OU02bVBtdzZLVHNvejkrRnF2cmdLV1A2dkJxREVVZlRwTjd3am9BMHVac1gw?=
 =?utf-8?B?TEppZ0JEQXhOYjZ1WnN2MVRpSklvdVBlVUxUblJnM25pYy9YR3FiM0lKaE5x?=
 =?utf-8?B?NkJtWGtwS0RNczhxeEwrMnROVGxNQTRvdVVCVVhaaWZROCtZOUl1c3g0TDZh?=
 =?utf-8?B?aEdTMGNwcW0wMm9XSW1BNVhKbDRnUFZCT0VhaGdkbjZOQWgwVkNHaG96Zko0?=
 =?utf-8?B?eTVwWC8yTzdLRzkwVXhlUFhtbkRqbnd0bW0vUkxxTXlseTZIZjZCSzE1WnZB?=
 =?utf-8?B?aEFpQWNFbktTUFVmdkpBTndTdy83bVFKMzV2OUZObnhFYjFRT3QwbU5lRS96?=
 =?utf-8?B?TUdiSVhJdUVjSDRiYWU3cnFKVWJTeVo3dVZQemJtcHVUbkQ1cXdoSUdCQlJG?=
 =?utf-8?B?MlJiak5mS0luODN0dEs0WGVtQWgrWkZpdURzbmJiUTBmYVZFU1A2OU1qamNl?=
 =?utf-8?B?a2VUU1VLbTF1bW01WlRsRUJwZVVZNkUyUCtlNnc0ckZwN1VuMDA1dW94TTF2?=
 =?utf-8?B?OVBITnVLV00wME5NTTl6eWR6N20xUk1zTnlzWUN1K2JLQ0JYSjJRR0ZNaVNa?=
 =?utf-8?B?WW5pVGhMVjZIYTJVVE1LdW05VHRwb29EYWZPWGMzSElxNE01Q3hwejJSV3Y0?=
 =?utf-8?B?VE5HSStLYnZHTWx1OTBmeUNkTXNjbGdtTkpIdjhTWlJud1owRWd0MTg4dWY1?=
 =?utf-8?B?WlMwUFZrWUNROWVhdUE0MGJSZFQzejlIejh5QUhmQXhLSHdNc3gwdVFFc25H?=
 =?utf-8?B?dTR0VjQwek8vcEpSTE81cjhPTlRLTU1GQVBBUzFUdGNkYzY5RXNLWTZzWUEw?=
 =?utf-8?B?OHB2U0JRZWNXQ1MxNlpoU2RGYysySDdrOU5za1lqZHdUbHo5Q3gzVWFSQVBR?=
 =?utf-8?B?NmVmYWJubDNnelBTbFlyYzdyTnBYc1NkL25RZm1zRlFqNDVlUVBTZjlBek15?=
 =?utf-8?B?Z2pRZVE2eHVDZ2VLZHk5cDRmQkp3eEhqb0toZENPeW11RkY3TzJjdHlnK05k?=
 =?utf-8?B?a240N0Jxbk90WUp2YTlSRHZiWGJORGlWelFGMm45U3dybEE3bnU1d1FzMFQw?=
 =?utf-8?B?aGs1Y0FOZE1UaTZaK05HZHRDMzBZYkMzcmY1VFBrKzNod1FTcnhpK1pFRy9C?=
 =?utf-8?B?U3htKzcwVUxJZ0xNenFuUmlzSU5nVmM2WEtlSUk2bi9tc1VxM3JDSTZkTzFp?=
 =?utf-8?B?ek5QYTMvc2k0WDd2OWNjZE9TUzIreHpZbkg0bXRoYnhya3JsVWx2cUkrbW81?=
 =?utf-8?B?eTZFSkIvOGZRK2k1a1FoNVZYVmpDZ3lpY2hBSVBzY1JmNW1kSCtiU0psMnBy?=
 =?utf-8?B?aXJtSE50RmNYMkNNWnFTMVdaVEZwdDFzUzFPNVRiR0lDeURrRC8vbHEycENK?=
 =?utf-8?B?aFZVRjVMNFg0dzBmdDlPVmloYk9WSmxONm9pWGdnSm55MU1saytJS1FibUti?=
 =?utf-8?B?VWkxVm50TVhIeVpYRkpmOThXYVo0UGpWMFRGK0kwYm5qbVVwekJDcWoyaXhI?=
 =?utf-8?B?RTRIaGR2NzdFUEMycVJZVXFyb0lpRVpUUkhoVzlOck5lbnE1cHNGOE5HNjlO?=
 =?utf-8?B?cXcxZnAvMnkranpySDJ3cGF6VWxiRDJBbzBXRDFHa1pTZm1ZSmVYVURKVDZw?=
 =?utf-8?B?RU8rN05PUmp2M0ZOaDRNVDZ5a3ZDcGRtVEVlSm9xTUxxUDl2Z0craHRYdlJH?=
 =?utf-8?B?OFNReXF6U0luQzZqK2QyNXp1bk1EWm9uUkFvcXl0UXROQ2sxaXQ0OTF4Ly80?=
 =?utf-8?B?bVFwN1h4Q3Q5UnFCWUsvdzg3dHdJN0JmQkVTb01kLzVpR1RVU1FEUlNac0lE?=
 =?utf-8?B?YTFzVG51YjVHWGFyWFZWVEQ3Qm9mc0dYWFZ1WjdPSnJDQS8xWVpKQkFrNk4r?=
 =?utf-8?B?U213OEhncEsxaTdaU0d6YllFZXUzV0lFZzExUG5SWU8vSFFoS3BzV0xPRGNP?=
 =?utf-8?B?L0NIR01MMFp0bWVDazFkWTJONWpXNFNSamcvN09ITTZaRG5TazRqaVZqNkVT?=
 =?utf-8?B?dHZtR29hdENsN09QTGEzanB2SzV3YWR2Q3pESm42cmZSdlRuemlZckpKcW42?=
 =?utf-8?Q?0JTsI7uvs6TLrQx9kSiGMMYtu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 080c197f-be6b-4801-0e24-08dcfe6df49b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:18:59.2279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W1liaLA7qyBdX9WUdDtlhxXNpAU0yRGJRC9rgHfcf+UgC3PwyKcxNO4DdqE5GhtPYfTJ614HPp7le+LHeWNXqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5951
Message-ID-Hash: VKP7Y3W2SMR3AU3O5SG5V44Q6JSWMGHV
X-Message-ID-Hash: VKP7Y3W2SMR3AU3O5SG5V44Q6JSWMGHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKP7Y3W2SMR3AU3O5SG5V44Q6JSWMGHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 11/6/24 19:40, Mark Brown wrote:
> On Wed, Nov 06, 2024 at 03:44:53PM +0530, Venkata Prasad Potturu wrote:
>
>> Update correct register offset for DMA ch status register.
>>
>> Fixes: bff3c2a4062d ("ASoC: SOF: amd: add support for acp7.0 based platform")
> I can't seem to find this commit.
Sorry, I used commit id form sof-dev repo.

I will update commit id and resend v2 patch.

