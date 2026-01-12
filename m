Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D623D10A9E
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jan 2026 06:54:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B5E260207;
	Mon, 12 Jan 2026 06:54:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B5E260207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768197295;
	bh=e0uti7KImUp87qz7caR3j1c+rTqa1WX0asWcfnaeRtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pxCFjIYSR22XIU+jg1FF6X7iCrDqhiiXKnOrLO/OCpV64tBVIe7crQUWsLGlhC7d3
	 yGr5+PcyDSAFTrPiWHZv1luPZ4SUiQfQfq2QUb9aoXDBJsqXXhstaH3dBfpfjiYyvB
	 kKxPxKFnwdD2/LbQRcgu5qctslU9vFLMrmMqQP3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DC42F805E0; Mon, 12 Jan 2026 06:54:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7AA8F805E4;
	Mon, 12 Jan 2026 06:54:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC06F80152; Mon, 12 Jan 2026 06:52:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010020.outbound.protection.outlook.com
 [52.101.193.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 777EDF800D0
	for <alsa-devel@alsa-project.org>; Mon, 12 Jan 2026 06:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 777EDF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=J75MCNZt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6zZ7/uBg5oloHpXl1S8W81PI9VrTohqJ7ddw8zEF8kwibBvWz2vXofuM5xIYqiOmm2EQFRdQbsNYdwxdjma3W3QkQRJOl/wxaZ0SX9uwUnFMGWRtz0EnDfZGR9nDYZwK6P40hMOSKhOBdhENZOenawShU3lG/76ICzDFWS38y5+qaq+yMtC9VN67A3L8texP6W/e5VYn/TLbNmgFM31xugY3HiCqi0MsUDlSnTf6HMkEq6YG7SQ7UFosfJlpQchkwYVAkzGvgwL7/PjTEwWlNdx0hbZC0na/TchGlto1GY3+MXZuu18W+FeFyyirh73/nZDj5LkClZG2d63t06F4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0uti7KImUp87qz7caR3j1c+rTqa1WX0asWcfnaeRtk=;
 b=BwA+q9EI5ix3oob0e4s402Ern1Idlr3y7fN5itGoYgf1PmL0lHsVwT/0UWXD7gMorH3c9gkBYsLrpncLDdoD1zMKvJo/jMAa2lcaLiXdtQd/dDB6HtAzo0yyVJaZXMHnTAuaiuprSXhf8mC4D2oNmUkZD/1APwgjJrSJ/ywOw2gZvAlL5gSeDGQQEofjeztv1fbgix5I/r4ns7hkNDlZP/Y2ZVfIORFlobmL5YLcKhDLd6NS308kgzbONBVOOHigOFxND0TaBMQ4/ZOjLZMzZN8tSWsTpxB4C15IeaN4kOjq1kqAI/scGG5JPPOd7fZdKoE0m7vZeZ4LTn5WFJJgbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0uti7KImUp87qz7caR3j1c+rTqa1WX0asWcfnaeRtk=;
 b=J75MCNZt3u6lNMcTsQVmWDMG/KUs7ukZxWbMQuvhgpnOposhtGfIVYJ/JYUFtDRRYwkeRGJnW1zCyPQlT1mp6RtDbMQOOCZHWykZBC/lnVTK7XnewqEMhfyObgllXJeYMw8QBKS+GcMGjfQLFtD/XTcF7fOlm0mM9OMuZHKKsEk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 BN5PR12MB9488.namprd12.prod.outlook.com (2603:10b6:408:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 05:52:35 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 05:52:35 +0000
Message-ID: <d2e8c4be-76e0-4e52-aa27-ff8924e13eb3@amd.com>
Date: Mon, 12 Jan 2026 11:22:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: soc-acpi: add is_device_rt712_vb() helper
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, yung-chuan.liao@linux.intel.com,
 simont@opensource.cirrus.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110064505.1485927-1-Vijendar.Mukunda@amd.com>
 <3baa51df-5891-4fa9-be0e-4695944bb38c@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <3baa51df-5891-4fa9-be0e-4695944bb38c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0089.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ae::7) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|BN5PR12MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: a3104ccf-45eb-4021-7536-08de519ec936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZHFuaUM5V1NBdWh3SXRSZ1hIeWUvMzhPRnJTVUR3ZGxSNEFoOG9GQXJqbXZR?=
 =?utf-8?B?ckRSUUtSWWkrb3dFNHh2ZXkyMEpJb2NYSi9yeXZFcXdIaDdBWnExTlNqWDNv?=
 =?utf-8?B?ZUxCTnJydzQrMzVWTGh3cDE0YWYxUUgwZTJCVVhvUUN1TFNoZXZVWDU2OE1s?=
 =?utf-8?B?SG5qYllIUVhkVHM1R3htZGMvK3BNMGdUV1pYdjhnaGlVTmhkV0VCUUlMRFph?=
 =?utf-8?B?ajZ6N2R0Rm9lS1grdXZQcllFMlNnbXozd2phN3Rrbm84N0pPT3JrSXJCaE55?=
 =?utf-8?B?QjZ6emJlNGk0bnNDR2FiOFloYmVnMFYrQ3lHSVhtY3ZUOXdXdlZMMXNxQmF1?=
 =?utf-8?B?UEs5b2VROHVReG5iT1plNVo5ZWlOeFBTd0ZZakluZ01DckowRzNLSExETDRM?=
 =?utf-8?B?VFp2VXJVaGxWSEd0elRNV01FUklNT2UyZVBmOE01SVpHQnpWZXA3U09jZWw3?=
 =?utf-8?B?akdyUGMrQ2FOYTJ5NStUSjRTQjNyT2daZ2tYOGtUNkpUSXVVd2Fyd0dYWTQ3?=
 =?utf-8?B?QnFEUXB0WUJrcGFQK0lDdTVZSGFaeWRYdGFrYjRnZ3JPTCtiWnFvcitIKzFX?=
 =?utf-8?B?UVFXYnAwb3Y5OUFyQTZoRFM5SzVNczhtUTJERTVad1BFanFXTEFReXlncnZq?=
 =?utf-8?B?dTFwMWpWTUNWV3dqSUFCRW04Zm1yeVVtcDNaa2pJeHVmZ1AxWUI1anBmY0VS?=
 =?utf-8?B?SE05ZFNFeG1abW9rRG53SU01czBIM1lOVGFvTEJZVHViR01IV3AybzEveFgz?=
 =?utf-8?B?MWkvc2VvZEJ2aGVaVDdIMmZXaG1ZYUNMMnZPeTJsWGRORm9XSzYxTEF2ZTh5?=
 =?utf-8?B?eVBSb0ZaSWRjY1VxUm41UUpWbEVXeWcvMmtTcUdUdU5VS25VZGc4a3E2QlZ1?=
 =?utf-8?B?REJLL2pwVmY2bDFIUlJUTU5Bc0RwQ0pPVGl2LzFaSGxra3BxU0pYOEpLczBy?=
 =?utf-8?B?aGM0NENUZXdRUkVMT2crd0JwbGNOUnpVL0d0WWo5YTNXTGdhM2l5bW5Sd2c1?=
 =?utf-8?B?dS9zSVNiK0NucGNtd2RxaklKZ0pXa21iNUgvS2NZMUdVZWIyVUZlazFpWlZh?=
 =?utf-8?B?ZWVwbDRoMTVKWWNWSERMSnUyYldkM21WUWd4SWhNbHlJYUZTZVpmVjdCb240?=
 =?utf-8?B?RStxNGNxei9tTmhJd2tzOVFvRGdMQjl4My91bTFGMUFJa3VOa2xseDNVSU1K?=
 =?utf-8?B?VlUrcXAybXNDWm45elRPUWF3dHNrZmY3eHY3eWZZUm1mZXNMbkZyRk90cTQx?=
 =?utf-8?B?YXJpd29NOWFsRUc1VytvNjNCMkc3RnNvcXZ2Y2xEUjZnT0Y1QUl5YWkwNzVu?=
 =?utf-8?B?NkphbGIrYXNVdmhPbEplRWZLSm5PcnRCa2VZT2ZWaDBFUGJlL1ErU0lXZkRO?=
 =?utf-8?B?UUlJNnltaU5jUWtQbGF0QmYxajhIWUw2QnNlR2hOMjMvUFlyUURGR3lkWjZs?=
 =?utf-8?B?OU4zREdmRzNlVWE3VVBRODBRckw3VUtlS2YvbHdnYi93Y1NLYzZ3cGJYWU1I?=
 =?utf-8?B?MUpZNjZkTXBrb0MrMFBiUjlkcWdBckhlWlQveHA2WWViNVZ4STFpOFBlMEh2?=
 =?utf-8?B?VUVGSFdRcnNzNFRBUE9vVDU2bTJ6TnBaU3ZNaTRFaEtlclErVlNuS3V1RVky?=
 =?utf-8?B?VkxpWlpmYXpZZk8yWm82aGJmYjJKcWhObnluT3VrL25GdGhkSitTN2JqYWY0?=
 =?utf-8?B?VkphajNqdXBPcUlPRWIwdGZFV3YxUVF2RDF3Y0hiSCtRTXF4WHhKZjl6amUx?=
 =?utf-8?B?eU9nNWN0NGgxQ2lIMFBKSzhaWDV6WDV3cEY2a25FajNIbGdWQzJrdE1jZTBB?=
 =?utf-8?B?N290U1UzeFBLOUxyMExVNXFGc1NDeXE0cmpVWHd3OGNaMXJxVnpyVEw4Zjg2?=
 =?utf-8?B?djRZL0l0WXZNZVNLcDMzajB6SlpUcTRCcXJwZC9PNjZOSGlyd1FldnE5RVRG?=
 =?utf-8?Q?Cx4znxjauhv+sIYeEcKnW93mt8nvz9xM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bno4KzYzMnhaczZxRjNqclR1M3IwR0o2R0JCWk9mZXZ4d2RzNTJac2lYT0NO?=
 =?utf-8?B?TGlpVjVDajJnWnhTd0YzaGFlb2IyeHlFS2M4eGR4dmdSUk5LMnhQN2xRTUQ2?=
 =?utf-8?B?MXlHMGJQTnJSOTRQYjl6ZTN2SEprSzJwbTJpZjNVSEszb3BvdXJXL1Y1OXhC?=
 =?utf-8?B?YlpBMGJib01GSExlMUpWQXB2enFxcU1yT2x0OVVoMm5BbHJuSjJZdS94TG5t?=
 =?utf-8?B?ZXlsS1BXeVBXRlFHMDNScUFnMGRoNzhDM3h6ZFMxTVkyMEtGalo3ZjZNU0JK?=
 =?utf-8?B?b2VsbSs5NjV6UEd4aEdaTmxrVUkzMWtDYnNmQ3FJU1R4ZndtdlZOOHJ2dmZ5?=
 =?utf-8?B?NDAreEgzTVpkUFpHcWtUU245TzkwWjJkeWs1Z2tHbDM2dmtwYmJ6S0MybDZE?=
 =?utf-8?B?U0NCRW5sTlNEZzRzanUrR2puTFgzek12WlNJMjNGbFlFT0NmS1JIY0dNdFZu?=
 =?utf-8?B?TEhyVHVuR3N4VFh2L3FvTWUyYk8wT0hQdGN1aHRVSUxUT2pCcnVhT2FRN0xG?=
 =?utf-8?B?ZGFlaEdDbmEzSGthejlmdURWK2N2cjcyZm1vUTBsbXlRYTNIN1drMnpDVDVq?=
 =?utf-8?B?eVl0RGlTODNvUU9VdlpvTGhaYVJMbVlXTmVWRUkyZktQSktBVzZuSlEwTHdp?=
 =?utf-8?B?cTBScExaN2xMcVlvejBLcTBCRDBBeldjcExmd3VZZ09wZUdxMjNZSm1TK1Iy?=
 =?utf-8?B?UkhlVnZCaUNtUVJveWFKOVpOc2h0R1dJUlBpeTM2ZmVRK0Y1WEJhUlZqaWxW?=
 =?utf-8?B?YXdpUkJnUGh5N21EZy9NTWRZeHgxbmF1M0liOWlIUUpMY1ZnT3NJZk1nbVQ2?=
 =?utf-8?B?SkRvSmtOaCtkWHNzWVVMQmErYm4zTFVFeWxqeTFoK1NRUVVvdVhnWW9yVEpr?=
 =?utf-8?B?alkvdityRlJReTZHMkRSeHFwZWNOS1NuY0pyL3hFQi95WEwxVTIxQ2xDVUsx?=
 =?utf-8?B?Q1ZlMFVKWFhRMm5ONWlLVHp2UzR6ME1oSS96NWdpWkl4RFpwMWhSVlZoRlc2?=
 =?utf-8?B?UC9QYzcvVGFRbitNbFlYRzJPL3ZmYTEzOGdTajNEajE2TWYzbHJaZkNvSVFh?=
 =?utf-8?B?RFo4ZlNpQkdyRnBMOWJMNUtxUjViMEYxNEl0emoycVVpaVdqeHBRdEtEKzRn?=
 =?utf-8?B?Mzl5clcrdFphMi9PS0lxeWh6ZEpIaStYT3NTTmVkaVpQZlo5UUlmb2UyL3Ja?=
 =?utf-8?B?Y3YyUVQ5VE56Y3VmWEU2UGpKTTFrS2ZJTEhaYW9Qa2dkQy9PMUVoYzEzci9T?=
 =?utf-8?B?bnd1Q3BnOCs1RCt4eXc2RmNLWm5HZFViVnFMTDRhTzd4V0F0WGxCQ1NWYmJX?=
 =?utf-8?B?TXFuNTF1cHpmWlNDbFpDZGkzYVNaUk9Sb3lQaTRzRjZwTjJ6T1cvc1ZZeHZW?=
 =?utf-8?B?ZjZpTnhjM0xNTnNGQjFlWnFFQUxmSGk4ZjVuaTc4TWhEbkxYei9SS3V2bGF0?=
 =?utf-8?B?blp5QW5hOFFsbXZiQTFteUc3QTNndSt2MndCckRlTnIvUi9JSEJiV0haV2ZP?=
 =?utf-8?B?MWFGWDExMmgvVUh5Q2ZLRXFaT0JCSkpySnFwdmJiQWM1S201b1hxbHZpSEZD?=
 =?utf-8?B?UktLemFncHRjK0NBSDlnbEZESDFCUUF1SDZqWW12MnRidGZ0ZHgvTld2K3pT?=
 =?utf-8?B?bmZ0ellKVG5KQjdkSy9rY1VRUVF3c0VQbVF0SjNmOWZIejU3QjRXK2lOcG5y?=
 =?utf-8?B?RDlrUkFvTGlHTkx2dEpRQ0NDS0ZXb1luV1g3Y2Z2dzNuU1VGb2JnSGV6TW1S?=
 =?utf-8?B?ZlB2Z1NVYlZUQjNSdENSdFJ2N0Q3VHlpOTJ4cWRsOWNKUUxic2xRS2kxNWlW?=
 =?utf-8?B?MVV2c0Z0eVplWU5ENlk5b0owYXZ0OEhzTGtaRXA4TkJta3JmV0hTNzhlY3hr?=
 =?utf-8?B?c2J3amczVStEdGtmRkwxeEhBVFVzd2MwcTArd2pKb0ZTdFdUaUMyRVNBUE9o?=
 =?utf-8?B?OVZKcVlqWCs5L2hyZGtsaHZ2WGtBQU9RM09CUDgwTm16K3p0elpwWDFjWkg2?=
 =?utf-8?B?bTR5RXBaM1k0TTZUZnI5clVPVUI0V2dpZFN3WjFFSHRweTZhMnNZNW9OWE5B?=
 =?utf-8?B?dC9NWDJDVUNHbDVJM2Ira253RVNkUzZhRUNJeVNNemdHL3dMSzY2a3VBM1pz?=
 =?utf-8?B?YStCZW1oUVJneXVaTjM5WEcrVGp2Tk5IZm90NDlIcmlxRGJRdFZtMXNpMnJY?=
 =?utf-8?B?QmR2dDBhWHdIQ3c1SXVLc1VidHQ1bmhoUDRVNTJIZjMyZldkcE83Mk93WjNJ?=
 =?utf-8?B?cStCdkNFcU5PaHE4NmtUWldlNUVmRi9iQy9qdXpSVWRYOUtiMEpZZFBVY0VL?=
 =?utf-8?B?bHZYdDNjblhMZ1NUem5TZGx4Ukg0Vk51dU5VN1pvc3dFOTdkNWNxZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a3104ccf-45eb-4021-7536-08de519ec936
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 05:52:35.6902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vJYiBa1sSRXzhJQsfQW4dIheNR7WORpDVHkikNlvs98XqrvRp0Mq6iQ5lgZ31gIlFExRm0i1o1E4VReW8Z7/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9488
Message-ID-Hash: M63GK5LX2BDMHQ6K3C3QC2DZQVZDFP3P
X-Message-ID-Hash: M63GK5LX2BDMHQ6K3C3QC2DZQVZDFP3P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M63GK5LX2BDMHQ6K3C3QC2DZQVZDFP3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/01/26 04:17, Mario Limonciello wrote:
>
>
> On 1/10/2026 12:44 AM, Vijendar Mukunda wrote:
>> Add a filter to skip the RT172 VB configuration if a SmartMic Function
>> is not found in the SDCA descriptors.
>>
>> If the ACPI information is incorrect this can only be quirked further
>> with DMI information.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>   sound/soc/amd/acp/Kconfig                    |  6 +++
>>   sound/soc/amd/acp/Makefile                   |  2 +
>>   sound/soc/amd/acp/amd-acp70-acpi-match.c     | 50 ++++++++++++++++++++
>>   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c | 42 ++++++++++++++++
>>   sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h | 14 ++++++
>>   5 files changed, 114 insertions(+)
>>   create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>>   create mode 100644 sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>>
>> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
>> index c2a60bc80ee6..ed2fa055f7f6 100644
>> --- a/sound/soc/amd/acp/Kconfig
>> +++ b/sound/soc/amd/acp/Kconfig
>> @@ -15,8 +15,14 @@ config SND_SOC_AMD_ACP_COMMON
>>     config SND_SOC_ACPI_AMD_MATCH
>>       tristate
>> +    select SND_SOC_ACPI_AMD_SDCA_QUIRKS
>>       select SND_SOC_ACPI if ACPI
>>   +config SND_SOC_ACPI_AMD_SDCA_QUIRKS
>> +    tristate
>> +    depends on ACPI
>> +    depends on SND_SOC_SDCA
>
> Does this need a description? 
Not required. This Config is not directly populated where user can go and select.
>
>> +
>>   if SND_SOC_AMD_ACP_COMMON
>>     config SND_SOC_AMD_ACP_PDM
>> diff --git a/sound/soc/amd/acp/Makefile b/sound/soc/amd/acp/Makefile
>> index 08220b9a3802..81d23aded348 100644
>> --- a/sound/soc/amd/acp/Makefile
>> +++ b/sound/soc/amd/acp/Makefile
>> @@ -27,6 +27,7 @@ snd-soc-acpi-amd-match-y := amd-acp63-acpi-match.o
>> amd-acp70-acpi-match.o
>>   snd-acp-sdw-mach-y     := acp-sdw-mach-common.o
>>   snd-acp-sdw-sof-mach-y += acp-sdw-sof-mach.o
>>   snd-acp-sdw-legacy-mach-y += acp-sdw-legacy-mach.o
>> +snd-soc-acpi-amd-sdca-quirks-y += soc-acpi-amd-sdca-quirks.o
>>     obj-$(CONFIG_SND_SOC_AMD_ACP_PCM) += snd-acp-pcm.o
>>   obj-$(CONFIG_SND_SOC_AMD_ACP_I2S) += snd-acp-i2s.o
>> @@ -40,6 +41,7 @@ obj-$(CONFIG_SND_AMD_ASOC_REMBRANDT) += snd-acp-rembrandt.o
>>   obj-$(CONFIG_SND_AMD_ASOC_ACP63) += snd-acp63.o
>>   obj-$(CONFIG_SND_AMD_ASOC_ACP70) += snd-acp70.o
>>   +obj-$(CONFIG_SND_SOC_ACPI_AMD_SDCA_QUIRKS) += snd-soc-acpi-amd-sdca-quirks.o
>>   obj-$(CONFIG_SND_AMD_SOUNDWIRE_ACPI) += snd-amd-sdw-acpi.o
>>   obj-$(CONFIG_SND_SOC_AMD_MACH_COMMON) += snd-acp-mach.o
>>   obj-$(CONFIG_SND_SOC_AMD_LEGACY_MACH) += snd-acp-legacy-mach.o
>> diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c
>> b/sound/soc/amd/acp/amd-acp70-acpi-match.c
>> index 871b4f054a84..fa39f18578ca 100644
>> --- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
>> +++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c
>> @@ -7,6 +7,7 @@
>>    */
>>     #include <sound/soc-acpi.h>
>> +#include "soc-acpi-amd-sdca-quirks.h"
>>   #include "../mach-config.h"
>>     static const struct snd_soc_acpi_endpoint single_endpoint = {
>> @@ -44,6 +45,39 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
>>       .group_id = 1
>>   };
>>   +static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
>> +    /* Jack Endpoint */
>> +    {
>> +        .num = 0,
>> +        .aggregated = 0,
>> +        .group_position = 0,
>> +        .group_id = 0,
>> +    },
>> +    /* Amp Endpoint, work as spk_l_endpoint */
>> +    {
>> +        .num = 1,
>> +        .aggregated = 1,
>> +        .group_position = 0,
>> +        .group_id = 1,
>> +    },
>> +    /* DMIC Endpoint */
>> +    {
>> +        .num = 2,
>> +        .aggregated = 0,
>> +        .group_position = 0,
>> +        .group_id = 0,
>> +    },
>> +};
>> +
>> +static const struct snd_soc_acpi_adr_device rt712_vb_1_group1_adr[] = {
>> +    {
>> +        .adr = 0x000130025D071201ull,
>> +        .num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
>> +        .endpoints = jack_amp_g1_dmic_endpoints,
>> +        .name_prefix = "rt712"
>> +    }
>> +};
>> +
>>   static const struct snd_soc_acpi_adr_device rt711_rt1316_group_adr[] = {
>>       {
>>           .adr = 0x000030025D071101ull,
>> @@ -254,6 +288,15 @@ static const struct snd_soc_acpi_link_adr
>> acp70_cs35l56x4_l1[] = {
>>       {}
>>   };
>>   +static const struct snd_soc_acpi_link_adr acp70_alc712_vb_l1[] = {
>> +    {
>> +        .mask = BIT(1),
>> +        .num_adr = ARRAY_SIZE(rt712_vb_1_group1_adr),
>> +        .adr_d = rt712_vb_1_group1_adr,
>> +    },
>> +    {}
>> +};
>> +
>>   static const struct snd_soc_acpi_link_adr acp70_rt722_only[] = {
>>       {
>>           .mask = BIT(0),
>> @@ -308,6 +351,12 @@ struct snd_soc_acpi_mach
>> snd_soc_acpi_amd_acp70_sdw_machines[] = {
>>           .links = acp70_cs35l56x4_l1,
>>           .drv_name = "amd_sdw",
>>       },
>> +    {
>> +        .link_mask = BIT(1),
>> +        .links = acp70_alc712_vb_l1,
>> +        .machine_check = snd_soc_acpi_amd_sdca_is_device_rt712_vb,
>> +        .drv_name = "amd_sdw",
>> +    },
>>       {},
>>   };
>>   EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sdw_machines);
>> @@ -327,3 +376,4 @@ EXPORT_SYMBOL(snd_soc_acpi_amd_acp70_sof_sdw_machines);
>>   MODULE_DESCRIPTION("AMD ACP7.0 & ACP7.1 tables and support for ACPI
>> enumeration");
>>   MODULE_LICENSE("GPL");
>>   MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
>> +MODULE_IMPORT_NS("SND_SOC_ACPI_AMD_SDCA_QUIRKS");
>> diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>> b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>> new file mode 100644
>> index 000000000000..63bf9e3c0ae1
>> --- /dev/null
>> +++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.c
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * soc-acpi-amd-sdca-quirks.c - tables and support for SDCA quirks
>> + *
>> + * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.
>
> 2026 now 
 This patch was implemented and posted as a PR in SOF GitHub last month.
That's why the year was mentioned as 2025.
>
>> + *
>> + */
>> +
>> +#include <linux/soundwire/sdw_amd.h>
>> +#include <sound/sdca.h>
>> +#include <sound/soc-acpi.h>
>> +#include "soc-acpi-amd-sdca-quirks.h"
>> +
>> +/*
>> + * Pretend machine quirk. The argument type is not the traditional
>> + * 'struct snd_soc_acpi_mach' pointer but instead the sdw_amd_ctx
>> + * which contains the peripheral information required for the
>> + * SoundWire/SDCA filter on the SMART_MIC setup and interface
>> + * revision. When the return value is false, the entry in the
>> + * 'snd_soc_acpi_mach' table needs to be skipped.
>> + */
>> +bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg)
>> +{
>> +    struct sdw_amd_ctx *ctx = arg;
>> +    int i;
>> +
>> +    if (!ctx)
>> +        return false;
>> +
>> +    for (i = 0; i < ctx->peripherals->num_peripherals; i++) {
>> +        if (sdca_device_quirk_match(ctx->peripherals->array[i],
>> +                        SDCA_QUIRKS_RT712_VB))
>> +            return true;
>> +    }
>> +
>> +    return false;
>> +}
>> +EXPORT_SYMBOL_NS(snd_soc_acpi_amd_sdca_is_device_rt712_vb,
>> "SND_SOC_ACPI_AMD_SDCA_QUIRKS");
>> +
>> +MODULE_DESCRIPTION("ASoC ACPI AMD SDCA quirks");
>> +MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS("SND_SOC_SDCA");
>> diff --git a/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>> b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>> new file mode 100644
>> index 000000000000..7e345a236da1
>> --- /dev/null
>> +++ b/sound/soc/amd/acp/soc-acpi-amd-sdca-quirks.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * soc-acpi-amd-sdca-quirks.h - tables and support for SDCA quirks
>> + *
>> + * Copyright(c) 2025 Advanced Micro Devices, Inc. All rights reserved.
>
> 2026
>
>
>> + *
>> + */
>> +
>> +#ifndef _SND_SOC_ACPI_AMD_SDCA_QUIRKS
>> +#define _SND_SOC_ACPI_AMD_SDCA_QUIRKS
>> +
>> +bool snd_soc_acpi_amd_sdca_is_device_rt712_vb(void *arg);
>> +
>> +#endif
>

