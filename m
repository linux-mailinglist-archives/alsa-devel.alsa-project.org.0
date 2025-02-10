Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AEAA2F3FD
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2025 17:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1BF6601F8;
	Mon, 10 Feb 2025 17:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1BF6601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739206009;
	bh=w4GOQ3t8t0OmnKToYw95qyUii3UOxPAgvJSPHiDVcxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S2iHObyIWy7nTINxEZevm5gNso9JWinnxvZJ9PDKBHJ1qqtIB9sPk+7MFmhRYEvr4
	 8qNq3zrGQtfMlctPqY6SZNFWBpAQvkuXQhOdYxTsNXp/WoSpNbE5/eawsSW9LdcXNa
	 ZFwNXz5uJ/VTNClPXruqCY2OPxENQ/c5tlwD+gjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64144F805B6; Mon, 10 Feb 2025 17:46:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 531C9F805BE;
	Mon, 10 Feb 2025 17:46:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14CC3F80424; Mon, 10 Feb 2025 17:46:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD6BCF8016B
	for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2025 17:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD6BCF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jHC3tjMJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmmC2C3y3s6OuIte/h8lW3MWVM7ddIAZ79ne3PwAZMAqKJ70ZSMBo+W4p40zooTJiuwh5j8iip0+sUD4TSQ68mdl8JWeJdrdXg7FYTuKZzdPZ+m1FjurNBv5HLXDH/yJ3jHOjObpT6t99/Onhr0iSwuHQv22umlgiugh21K4i2c3Ca2NWxr8i//l8VoAhPSLd27FMyHPDLaa2e/cWOAh4X7ro37Vb6etVcmevtYqrTBVGz5ris7inbpsftjMVwLeeXN0wQCbA5hXtuPtrNw1SZBfREJDjZOf1jS9nFLzwwWfiXuBohpED6QaM41rmFGEDXndGLb3algV1n7y9kX8oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX2Ux+4JbBCqIViyA28596wUJnXfOoM+Thn2TvAAadI=;
 b=LAuoeq8gcMalNKrhFt2OAXWQ7hKeghhn6mwtqiuSQ4avU2kvuLr3TnIkD3rCj6qv7rmXZDm/aj5ne7ocOTAiwT6TxahM0ZNbzvrUEywu1ZTv//OsdijGS3R1VLQqLWN+p1Ju4bye7iaSJycCiNdO2c0VJnBfgCl0YTcG6S9m+4I6zO7VUV3wvv4ax85GNYLIePc9sHh80fOeA9H13fsrwnoogJ5uibPmg15cVWoJvMgEmA2IjrIrpuFSLBhfwC9ag3jjNW0+o3qg7r+KVbVPmWfWX3Vbr0tQmfaqlC6kejE5Ht5uArHsu4b91Tk+5ng1SYlGzVqyecL2xRvPFiMkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX2Ux+4JbBCqIViyA28596wUJnXfOoM+Thn2TvAAadI=;
 b=jHC3tjMJ7iLcYuwchmOlOy2Su0Jz75rdIL/tz0Om2bDmM6xm5HqjduHBObi3GjHNouTUyvLAr1VkwaIwaBDVGxLlI2JpkMO+NR4cxAF0mcgBFUBS6vbCPtVQ6fCNOeBIfer8jqpvybicNZZpIyPN56ubaTCsyQa17tLyvOfn98w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CY8PR12MB8194.namprd12.prod.outlook.com (2603:10b6:930:76::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 16:46:14 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 16:46:14 +0000
Message-ID: <d16ce74f-3320-49ec-a195-a473e03a9fc4@amd.com>
Date: Mon, 10 Feb 2025 22:16:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 00/23] ASoC: amd: acp70: add soundwire and acp pdm
 support
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <173920499691.65690.5029473211250633476.b4-ty@kernel.org>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <173920499691.65690.5029473211250633476.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::13) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CY8PR12MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 53be50df-a44d-42ea-61ca-08dd49f26e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S3FNajAzZzh5NG1LK2o5VjJIVW45WFBQTTNneGdsQVdoaHlnWGNXZVdpMTRJ?=
 =?utf-8?B?U3lGSEpIZTU1WUg0Q29sRTYzUGZFZE80azJqYzY4Z3kxTjg2TnpFdTFPUVQx?=
 =?utf-8?B?c3VYOEQxeHNlNTdERSs5SEIrbmlUdllJOUFaLzlNQzQ2SEMxT3d4R21OdXd4?=
 =?utf-8?B?S01pWTRnR3VMaWZva1R5b0l3RVB5Z3Jwd3Z1OXZaQkcwVDRmeUVNRGpaVEgr?=
 =?utf-8?B?Z0s3U2pJejFoQmptQmU4citUUzVIajd6M0xneXE0VUU0bnFKYzNuM05iN285?=
 =?utf-8?B?V1h6QzJIRTUzWGNDWTZELys5YmlkOVdYdGxUWjRJMUFHN0V6MWlDZ3FEMzZx?=
 =?utf-8?B?RjRsYXNDOHBxWXJTWWhJQklDeWMwUmRDSmhnNDF1V2tIbEFONlVyN0M4Z3Fp?=
 =?utf-8?B?bDRmcE9LbVZtdFVMRXFXb09sd0EwOVUzZ01NVnRxU2F4NkF2VjErd00vQllC?=
 =?utf-8?B?di9LRWxKbWRZaFNpRnh0VjJiVytYWlJTemJWV1JnOENRd0pIMW14SU53SUpk?=
 =?utf-8?B?MnNkRW0yVEozeUdkeDYzZmpPYUhMcW9EQjdEMTZ2ZnFXVk90TXEyQjl3WTU3?=
 =?utf-8?B?WEZiR3pDeEFkWW0zMDVGYld6dUZhSHllMEh5MGE2YmhsNGVTRzRxdGFWU2Ji?=
 =?utf-8?B?UHRRa2UyZC9lYnF3R3Q3OGVCdmV6b1hhb2FqZkIyZWVzejQ1Z0RCOXAySWNp?=
 =?utf-8?B?eU9kcXJTYTZxWno2UFBHS0tMRERZSThZTmVzM3NldmtRUHkzenlMYjAyUDIy?=
 =?utf-8?B?V0pRWFh3R3V2NUNIc2lRQTJQQjRwbk81SGp2NU5OMDZXOVFJcXlwaG56K2l3?=
 =?utf-8?B?cys0S2lEQmZObEhsM0hoWnFGanRoYjN2aUQrc1FZQ2dIN283UXlzbklFa2Zo?=
 =?utf-8?B?T2VNc0FQUmFGYmdwa09FY3EwWkxPK2tnNnJhMFZQcFIwTVRMa1V0T2ozSnRY?=
 =?utf-8?B?NG15aGFQTlRoRHRLTjg3RTYwR3NaYkNtRW85RGhVQ0daSE1xTkc4TkJCYjAv?=
 =?utf-8?B?REV5VjNUSmZNZmdIdnJkS2ZTZDdEV05Fd1NoQUxobW1qRG5qUDJ3ZWxsVnpC?=
 =?utf-8?B?OWc4UEJwcVZaRmxUbFJ3QlIwNkVTOHhvdzFVV0ZQbW04V0hJdmtObnlsOGF4?=
 =?utf-8?B?K0lySW1nVDVMZDBCb3hQNWpZb1dReDBpMzRES1BQZElsOVA1ZG5IeGJraFRR?=
 =?utf-8?B?MkdMQXp1bmIwMmdwQWRPT1I2MERUdnZMak16cXdlTkNSbkdMaU4ycG9qM2dJ?=
 =?utf-8?B?ZjgxWmR0YkJvSU96U3VadDJ4V2taYng3cjdMZ2syTEFBK3I5NVBJVHEzaVlN?=
 =?utf-8?B?MERyalU5SUtMRTlxcHFxWThaRE1Ja3pPaWM2RGFmMDZmSVFkVzRmc1o1MXpm?=
 =?utf-8?B?V2tHTzZFUTlVOGpPdVd6cVIvRElDYkhRZmhNUmJueE1LcGpqaVUvUHJxVWk0?=
 =?utf-8?B?OVZvYVdtMisveVphSld0dUdPK2NCQ3VQbmpwRGsyVjN3RFR5M1FuNzh5MlFp?=
 =?utf-8?B?VGpSVTZpb0E4eGdUeVhhdndzYThSM2FGeDB2ZVVLblpUSFhMMGU3ZHVSQ1lk?=
 =?utf-8?B?WTVYSnUwTDFzMmovaGozY3VCTFJ0UXR6QW9Eb1hXRjhyRWo0emJQYW0vK2VP?=
 =?utf-8?B?ZWc5SDFYbU5YeC9GWGkyb2dqekE3cU1Udmgrbk05QXJNU3pkY1NsaldCWGlF?=
 =?utf-8?B?cmEvUDVnbjU2Wm1Jb0g2N25aOXN0OVNxNHo3Q3pLT3FlWkpZdUlzYXFwQTQ4?=
 =?utf-8?B?L1Zadm1LOG8zOVNTbFlWbExCaHZGamFCUW5vcTlteDU0bGNiUnRQUUlsV295?=
 =?utf-8?B?RkZjVFZPYWIzcHpuNUp4cytpVEN1WUI4aldoR3VDdGZYVnJncTltTDZvQlpa?=
 =?utf-8?Q?5TD81+9Vz+GrG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?akJLbVAwem1iK3hZaFpWam9iTGp4U0RHUEx6RTlaZUhrN2RzSlZUV2RNSWVN?=
 =?utf-8?B?c2J2ci8rWjIyK0pkaERpQUVORnZxOGUzSm83K0lOZWtuL1VUS1hFbVlQYThq?=
 =?utf-8?B?ZnpPZkU3NGxVNkNEdnZtRU1xUDVIZldmanhtaWI4bmd5L2g3clRvRDhzUmtu?=
 =?utf-8?B?cDRwSkdTL29SRm5lMlZVR28xb0FaQjRDVXVma3FxbjhVWFpGNXFBNjlld1ZP?=
 =?utf-8?B?dDU3Z0UwRjRESEdYaWZnWm8wRFBWR3hzcFdIK0ZTc1BnNFdWL2pGN3Faang5?=
 =?utf-8?B?em1tTS81cmFpbXRIeitrQ3p1Si9mN2pPbHVDdFNKc0NXU2RQUmM1eGtxVUFt?=
 =?utf-8?B?TTRSNXFoWHFHSGZuQlJNSy9QSFUxV1JEcnpJZjJyZXlyV09YR0o2eXBZcG5N?=
 =?utf-8?B?TVplWlZJa05JNWdRQlNQa0ZBV21GMk13VElWZGplTVcyamdVVVpNWjZNNXZk?=
 =?utf-8?B?eDFraVV5N0FHSnIrNGhveUdSTmRlUDBudENKb2lrcUVnN2UwU2NuL3pBSDQ5?=
 =?utf-8?B?dTAwd1pJb0M4VXpxbkhxdHp0VWJlYXVlNkg2QWUyTWZmUGorVno3c1dXR2FH?=
 =?utf-8?B?RVgzOW8wR1dwWjVoLzBIRXB3SW1OYTgxSUIwSlhqa2c1QzFzL3lhN2xwaHls?=
 =?utf-8?B?ZHNkRVViaE15R3l2T0syZEpxRWRiUU1UT1R5Rm56V0FIQjJ4c21sSXRrSG9n?=
 =?utf-8?B?M25UMjFISnZRSVp6VEI3aFhpTlBXMDFOb2hFancydUZiTUJacnpmMEFoZHU0?=
 =?utf-8?B?bkxhajRLQW5EMGJ2WVUwaEcyS2JTeGdlWFFVNkFhR2RkcWFOM3hMZk5QSUQw?=
 =?utf-8?B?YWdKNG5JbG1PalNYcHY5ekNMemNVN0Y4RXZ2eGdQeUk3VTdCWnpKWmtVYW9G?=
 =?utf-8?B?aWgyTTV6YXVnWjNOa01MMlltMVpOMDB3U0VlY0dNNHhTVVRISEV1clpheERD?=
 =?utf-8?B?TTVpMUppaU1VaGJXZVZzc1dYQjlOTXd1MGhSbnNLc2JrSVhqOGhXMWkzb0xk?=
 =?utf-8?B?bnZHeTBEY1JnU2VwOVRqQ1JoZ2hMZlk3Z1Eza2dNbVl5ZWRnYUtpR3VoL2Ny?=
 =?utf-8?B?SEdtTGtxT29ldFJxaUFOdGFkR21FSXhrK3ZodTQ3TW4reTZlUXdkVi9qa2Iy?=
 =?utf-8?B?bXN5eG1IYWMwZSthM2x3d2JneHMzS1NPSXMyb01OSTdGY1gzOEUrdnJSSy9r?=
 =?utf-8?B?VDZOSVk2RHVjZzNmWk5oSXdSZ1hDR2VsQ3ZFL1RQd3lTMXA5R2dTYkRTUStU?=
 =?utf-8?B?RGpOcjlrRUlBVW1jMXZZSmhPUHVyYWlrVytiWXJIeUxBYXpZSXVGa3kvNlJF?=
 =?utf-8?B?Mjh2czg4RStrSGN0NXhYK05PWFZsZVl5dU1kczNzK0kyTnBwS054S3gyeG94?=
 =?utf-8?B?ZkxMVzl4V3ROZzIwZStqN2dDZmp5VFdBT0hTaXl0YlBjQiszK0gxQW44d3Ez?=
 =?utf-8?B?THdiMFZlUDhhV3JBYWhXanBXcDFKbUFReFJmdzVESDBBNG5LY2lwbURPZlNq?=
 =?utf-8?B?emErdXVuZE40Y3VINUVsNG42Y2I2QmFmU1EzdGdzTkNrRWJkNURuNWd4Qy9y?=
 =?utf-8?B?ZzlnSlN4MGViOG5ybnVVdlpxZERvb0syNzBIbXBGVi83cWprTmZ0QSsyTW5m?=
 =?utf-8?B?SG53RmNDM1d3M0hHUHo2clFCdWdkWVFBNkg4OEtrTmFJL1JYTXI1dmRKMzQx?=
 =?utf-8?B?TDc1SVd0MVZJTkdCb2RLM05ZRXFOTTBRc2dCcEltamVaaExjNlJKOG1sWEg2?=
 =?utf-8?B?anFXYStNQVU5RmN4THJrWjhkTHoyRXQzTUoyM0IrYTFVWFVMK0ZTeEpJTFU1?=
 =?utf-8?B?bktqMmZOYzlOa1pBVkEyTDVVSWF6Y0pRaUJHY1QxdTVnVTZXOENLakJZVVpl?=
 =?utf-8?B?K0orUWF0OXVVQnlMYllhU1VFNE5aR09GQkdwNlNRRlJBblVRb29BdEtlV1Fp?=
 =?utf-8?B?NXl4Mmkydk00aC8vbGp2UHMzMm1VeFVpcHR3dGZLWm04UWgrS1MvekIxOW13?=
 =?utf-8?B?dUNVQS9jWi94bHNsb0xxSGFrSXNQWlZhRUExT1Bxd2tiZUdyd3gzZVZHUm0y?=
 =?utf-8?B?NFNMak0xZ0EvZU5wNG5lK3lFeFh5eFlmdlBMYzhveW5hb3FyZU9QOFp3MnNJ?=
 =?utf-8?Q?agh3ddtEoX7m1yAncrjDb4DjH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53be50df-a44d-42ea-61ca-08dd49f26e3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 16:46:14.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 99COnMromcdSdqccFJML+4NjaFwZ2AyLzQxNA7AI/FjaB7vPpRixHnsDam7sdqLXyWiXTB2/oQ3DcnC5Q/7pPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8194
Message-ID-Hash: HREQHPEA3MVISVL4DGSF6GYZCPCJX2LJ
X-Message-ID-Hash: HREQHPEA3MVISVL4DGSF6GYZCPCJX2LJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HREQHPEA3MVISVL4DGSF6GYZCPCJX2LJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/02/25 21:59, Mark Brown wrote:
> On Mon, 20 Jan 2025 15:31:07 +0530, Vijendar Mukunda wrote:
>> This patch series includes below changes
>> 	- Add Audio IO support for ACP7.0 and ACP7.1 platforms for
>> 	SoundWire IO and ACP PDM controller combination.
>> 	- Add common driver modules for ACP7.0 and ACP7.1 platforms
>> 	(acp pci driver, Soundwire dma driver, pdm platform driver).
>> 	- Add SoundWire generic machine driver changes for legacy stack
>> 	(No DSP enabled) for ACP7.0 & ACP7.1 platforms.
>> 	- Add SoundWire machines for ACP7.0 & ACP7.1 platforms.
>>
>> [...]
This patch series should be dropped and V3 version should be picked.
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [01/23] ASoC: amd: add register header file for ACP7.0 platform
>         (no commit info)
> [02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0 and ACP7.1 platforms
>         (no commit info)
> [03/23] ASoC: amd: acp70: add acp init and de-init functions
>         (no commit info)
> [04/23] ASoC: amd: acp70: add logic for scanning acp child devices
>         (no commit info)
> [05/23] ASoC: amd: acp70: create platform devices for acp child nodes
>         (no commit info)
> [06/23] ASoC: amd: acp70: enable driver build for ACP7.0 platform
>         (no commit info)
> [07/23] ASoC: amd: acp70: add acp pdm platform driver
>         (no commit info)
> [08/23] ASoC: amd: acp70: add acp pdm driver dma ops and dai ops
>         (no commit info)
> [09/23] ASoC: amd: acp70: add acp soundwire dma driver
>         (no commit info)
> [10/23] ASoC: amd: update ACP7.0 KConfig option description
>         (no commit info)
> [11/23] ASoC: amd: acp70: add soundwire dma driver dma ops
>         (no commit info)
> [12/23] ASoC: amd: acp70: add acp ip interrupt handler
>         (no commit info)
> [13/23] ASoC: amd: acp70: add acp pdm driver pm ops
>         (no commit info)
> [14/23] ASoC: amd: acp70: add pm ops support for soundwire dma driver
>         (no commit info)
> [15/23] ASoC: amd: acp70: add acp driver pm ops support
>         (no commit info)
> [16/23] ASoC: amd: acp70: enable wake capability for acp pci driver
>         (no commit info)
> [17/23] ASoC: amd: acp70: add soundwire wake interrupt handling
>         (no commit info)
> [18/23] ASoC: amd: acp70: enable soundwire host wake irq mask
>         (no commit info)
> [19/23] ASoC: amd: acp70: enable acp pme enable during acp init sequence
>         (no commit info)
> [20/23] ASoC: amd: acp70: create a device node for soundwire machine driver
>         (no commit info)
> [21/23] ASoC: amd: acp: add machine driver changes for ACP7.0 and ACP7.1 platforms
>         commit: 638ad2bdb2f994c8bd99cc40e0c4796a8617ccf3
> [22/23] ASoC: amd: acp: add RT711, RT714 & RT1316 support for ACP7.0 platform
>         commit: 187150671d83324f1ca56f7ab5e00f16a3b9f2a9
> [23/23] ASoC: amd: acp: amd-acp70-acpi-match: Add rt722 support
>         commit: d0252b0b945ec67fd09fc764dcadf445fb7757ee
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>
> Thanks,
> Mark
>

