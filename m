Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E12944A5D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 13:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 595E13EDB;
	Thu,  1 Aug 2024 13:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 595E13EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722511660;
	bh=oxCZr22yhGNnyP3wR+525ub+2W/NzVhChYtzLxv64VA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q/uB/ma0nw+Vo/SFUYP1P1iHcQNvDDFol8mGaRW329ven4rGhXtXUDgMyn6/ZZR0Z
	 jLDS8ZLokO/pNlvc6qag8cxhBX7R9EnzxgUBDFRmdejhzQ0jlM7btg+00CWHDNpdCq
	 a44sxuH5SFKL40XNk4oqri5WL2qQrwYaRT2etUns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ECA7F80753; Thu,  1 Aug 2024 13:25:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D53EF80752;
	Thu,  1 Aug 2024 13:25:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C608F80448; Thu,  1 Aug 2024 13:23:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 856A9F8007E
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 13:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 856A9F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TZb4E0/X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVWImJsjxWz90DzV3aMmCF+nDoiUd4+dPaP8i8pkm0/8Y3mNxIlBMxMcoog1Ev3Ige3NNTNjM7rKvxculEcBSQCW1UzPrLZuPgZhWlSp2PGnudI1InuIJRCXVUQO/NNrIKXt/pM6N1fjLPDHfOjpIKHcbKxTZt32XAeI4Db8ilnkYOTKTo1OOW60xuCMGLmvlD9y3vXRQrCL2HWm8SAdEfK2fe8nCnDfRktmzOD6fE2Ak0PvOvCA57haoKaklPIxRKSHrIkCn3izRCgkA6GnnfKWVxmd11b9OdsW+2xup2Melb7LFege1uOfcGlxo0NNp5yKITf1f36MsFcK3IE9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxCZr22yhGNnyP3wR+525ub+2W/NzVhChYtzLxv64VA=;
 b=yJVVnnznW7VwJVuQAXDxLsnNp6eI/RWSTvSxFLSGmhJMmuuyfzeUFtxuHHs3Yr2CNIG9gQFr9A+XRk98UrzIaXwULNeSpDgva+xC6bDdu6+XXteJPxuvJKbUO1cmjIZeIpZ9GoNtSPpXcD4hXcLvuIkBcyALogQgfH/25eU1p5qoamOtLx88z5ci19xVCfQs3NpKwqOYXcmYKOek4MSnGyr29zQ5T17Wo++AwXLyiJhyrrAg8SDAVwF2gZ6Cxw0ruS3ZgC3qkZhjkOVjL5fx04v7/sijceFRhGldiWdyVhkmxPouOT8q5kYsIaANaxPwOgQ3+BBh7AYSLJudBW/Xmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxCZr22yhGNnyP3wR+525ub+2W/NzVhChYtzLxv64VA=;
 b=TZb4E0/Xk9oJUqxHVgsityYllK28PqPQNvbCIlmzang5DsQZXMPQfweWhKz5F1Qz9jcdMY9NFblvM6sglFDAu7TByeWqhyItkbLa4AAeAW1Zm4w4NSTc0QgbHLAHMRsX3EnS6FcMDkuMtc6tthKZgl08bbfrTbZIEPFemY9BhZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 11:22:53 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 11:22:53 +0000
Message-ID: <2308a144-c468-4ff7-b440-9c07a1c94bc9@amd.com>
Date: Thu, 1 Aug 2024 16:52:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 00/31] AMD SOF based generic SoundWire machine
 driver
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com
References: <20240801091446.10457-1-Vijendar.Mukunda@amd.com>
 <ZqtqAbGR9brhQ5dz@opensource.cirrus.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <ZqtqAbGR9brhQ5dz@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::14) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 02cae90b-f20a-46f2-a31e-08dcb21c48c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1V0NUFCTWhHQjU3Z3N2enczeHFBZ3B6QXBTbmxFWmhOL21mK2F4a3JueWxY?=
 =?utf-8?B?YW5Kakc0TWhYQVJINEtMa3B2V3c5S0FIY28rY0pTbTNQc1JPenFtRGhsdDVx?=
 =?utf-8?B?UytXZ2tOOVNLbEZvMzM5SGs2L3FzRzJIL1pjUktJYzNLdWoydHZENXdwYnQr?=
 =?utf-8?B?aUNpNXNtU2hKUGhvc3ZlT1F6RW1lTE1VL1NPZks2OG5jSDI1eURNenhITWJD?=
 =?utf-8?B?K1paRE5ZRGlyUCtGbUdEdTh1TVBQVjBjUHh3VzE4czh4c0pKM05UNlk2SWpa?=
 =?utf-8?B?VE1YczJVVCtoUGRUVkl5SlNNa1hkSHRMZXBISXNBT2dVaEo2TWpLQ2lHNTZx?=
 =?utf-8?B?eFNzUGdqMUw2SnVCYTMwS3J0K00va0dLR0RlT0EzYWlvZFJBRTFLYUV4N0tj?=
 =?utf-8?B?TkNpNmFjY1FJbDB4Qk83S0tBeGNPakxtd3k3L2ZOYTlaaDFEUDA2eEs4ZUJq?=
 =?utf-8?B?cVlqYmlOZmYwVWNsemo5T2o3Z1dQck1TeUNFS01GSmRtM1FPN3AreHFvNXJn?=
 =?utf-8?B?UWJpakt6c3JsS0ZkQkF1eStkd212NWgva2Q1YWhBN1lPWk9XeGtRYThKbGlx?=
 =?utf-8?B?VXYyQlRYdjFaU092aDJpNVRJcVpBd09sRmRINHgyVWR1aTdROGV5ZXd0Njls?=
 =?utf-8?B?c1NDZFoydHNSZTZhREp4R0traEVxemJxMFo0WWtCaUtKV2o3b0tudE9rMjZk?=
 =?utf-8?B?UFhSWjR1TXhTZ0VDdTNWWmtiY0hrZ2poa3pSYTUyL0o2U3JWREhCbStTck85?=
 =?utf-8?B?bFgyYjl2eGIyT05GY2tkdStvbmt5dlVPaTd1blNWVENrYTFvZWY3NEltUm51?=
 =?utf-8?B?TDRKRzZEWlhFNWZCamw1d3BTa3FlVUFzMUpwNnd6ZXY2Ky8rOGx3T2FmbDAw?=
 =?utf-8?B?aVRVZEVWemNxV2FLTDB3SE9xR3J5UDVOU2QxR0NEVEZHTVhmdkdYTElSNTBG?=
 =?utf-8?B?M0xnV1RTelhxWUIxbCtxL0ViZnd5QVIzZ09BK2JsUFpCYzQrN3o2ZHZXUXQx?=
 =?utf-8?B?Q2hkTk1EVmIwaW84T2lRem5ZdDhzckFPdUdDVzNNZVdHL240MGdhSjNYRXRJ?=
 =?utf-8?B?SU9IdWtsRzBqMnpJT1RrZVZhUEpaZ1M2c3EvVVRyK2RFY0Rsc1FBclhpTHN5?=
 =?utf-8?B?a2Yxa0l6TlFxd0ZiZmZFU0ZPOGpZclJNM01BOXhMQzJaZkFRL2dPd3FKd1Y4?=
 =?utf-8?B?RVBid3JLWlJBb2FGaEIzMWFoSFRzSmJjRnhqOWEzWmF3Yk4wQjJlZzVqc3Fi?=
 =?utf-8?B?cmRQcDQyTGZLcEU3K3VtKzdXdS8rM3J1Mi9QTlNSSThrekMwMmRrYThEY0ZR?=
 =?utf-8?B?Q1lvNmhpWUNvU3NsY29BbWFHNTlOczAzaXVGNUVGNFdKVUViSm9BeGNXbzcz?=
 =?utf-8?B?SWdyWnM2YklmYTV6QXNrNEU5T0dIQS9EWVhFanhDSWNDVDVPaGJTYnpVb3I5?=
 =?utf-8?B?ajRWL0JDWXF6cHFubWtoOWlkTzhKODJTcVhZL0MrNkp2WGhhQ0R0eWxCb2Qv?=
 =?utf-8?B?NUtoQnpTT2N3V1pSODFlOXlHWUpPeDJBVXNQUnhyQ2ZlMlBKOHQ4Y3VvNEhJ?=
 =?utf-8?B?UktoQnhGRU9UZ1R3ZjlqYm5iU0lQcEhRQnMxWWp5c0dRWXBEMnhFMWdPVXlY?=
 =?utf-8?B?djBWYmM1czY0RDlMejhnWFlnYS9LUUJIN2JaWTlISnUwYTZLTmZPUWVualFP?=
 =?utf-8?B?enRHSUoyWkpxeEJlVS9HUHdScGtBZm8zaE10ajNOWGxhNS9NSHh0RHZqSVJy?=
 =?utf-8?Q?wKsImlzRnoEgMToAg8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UkpYR3FUZ29FWW4wRFl3UWZrY0F4TDJMeTkzUDBWbE13bEJQdXdoRzREUXVO?=
 =?utf-8?B?QytkOGVrb0FWUW5VNDhEc0xNNWtERlVhYy9DQXNZWGZ1N3VJd01QdFFpazl0?=
 =?utf-8?B?V1haV0tzSWFQRUo1cFVSL3RpU2FkdGEwUnBPNWs3K00xWElWZnd5UUwxbUxJ?=
 =?utf-8?B?T3VDV2ZFTEtkZGh3VzNXTUFmQXh0Rm10NHBQRjJFa0c1NnZSaVB1emxGWVJV?=
 =?utf-8?B?Ymo0MzMxbkxlYVMrb1JlTWZ5RzVoSVBucUM3SlB1V283TVZCckIyMHFxOWdx?=
 =?utf-8?B?eHBtRzJsNmRqQ3dXQURNdXg4Q0ZrSXFJbWZldk53QUlJUk03Vm16VmJobkJo?=
 =?utf-8?B?ZU1iWXFSR2VlREtCWWJjcDF0a3BIMjJ5SDZNVnNzc29JSFJXamxLVkRveFA4?=
 =?utf-8?B?Y2ZwNkFucWdZclIzVHRUeHcvbFEwZW53eVVXN3B3cGo0Z2VQY2VHUnloNVUx?=
 =?utf-8?B?ZEhlRXN1b1IvVmJ1YVlPTVIwdEcwQytFZ2plVmkrcExNVDEzWThtRDJaQmJ5?=
 =?utf-8?B?djBUUHR4MTZ0MEovdFNwR3ltempWTk1hNTdoS2pYUnRLb0I0N1JLbXVkMUhs?=
 =?utf-8?B?eUhSNXpBdWV0NjRZc0h0c0szc3NocVliY3h4Wlc5bG9wcnA1WTlhOXhIc3o3?=
 =?utf-8?B?ekJSckthcTA0QkdUUHFTWmdrRWNmL0Fob3dCdHE1ckdUOThvbWxZM1l0cjRY?=
 =?utf-8?B?Q1ZkYWEzVStOeHRkVlRWMXJFbFFjTXB3WTN6UHBiNkhxbGFEZjRXNVk5T2ZR?=
 =?utf-8?B?V0N0TnIvTmJ0dVhOaWtNUU1KT3V6ZEhVU1RzQWZ1bW8vbHhuR2F3bngrKzcx?=
 =?utf-8?B?UXZrOFlHNzVUZEVXR1Q2c2VYNmdTVitLbmNmc1Y1UkNLQkZBRzJYdUh3Z3RK?=
 =?utf-8?B?cm5WcENVNzhEZC85aTA0UnVHMDFHNEtzMG82YWhoWWoreVBYelZIYWJzaW9L?=
 =?utf-8?B?Nm5KcnZlZ2tKbk50dmU2a0dPV2RuVFJWUDVtQXU5NDJjemJoY09ZYXQrOFJO?=
 =?utf-8?B?UDdnZnROK1p3dWQrUGJDN0tWWWQwSG4zNGdMeEpKUDB0VlBlVDRsdWFEN3RU?=
 =?utf-8?B?VUVkNVJzZFJpMVUza0dVR1cyWVNaYTJweDZZN2w4Y09namRtS044TGZqSDFF?=
 =?utf-8?B?aFZWYnpXTE5LRFpNR2QrY1NjUjBkWmxjL2RNWEF5a2c5blhGeno5ckNieS91?=
 =?utf-8?B?STJrZEQxWTAxWXRoSGJlM20wMDBSeDRFTk1mSDJRcVZIbVZWUlhmRVNvL2Nk?=
 =?utf-8?B?d0tKNmEyNG1CdmluYTNhUkhhYkZUaFhGZmE2WGdndVI0ZVIvNDA4bDhzRHA4?=
 =?utf-8?B?bUFMUTBWUDk2dzRSbXFWeW1nNy9uMzZER1RtS0lXVWw5TUdia3dmb001MlNt?=
 =?utf-8?B?MUNIUG50VGZZbTlKeUtEMDJGbzNwVk9ZS3czWHAxeGVMb3lLV1AyL01GQll2?=
 =?utf-8?B?OGNZUzdIMTBUdHMrN0ozb041dkdOVWdOMG8zOXoyRzlqaTNKVVdOMzB3b2ZZ?=
 =?utf-8?B?WFhHY3ZacGFXa0hRcGhSSTdDR2dxK05IbGIzUUM0c21mTDBRbHVBNnBxQW9q?=
 =?utf-8?B?SGZpblVreHNhc1hXeHN5WGUvZmhsZWRvcURPRUFpWGUrejh6NU5FU0xYVTcy?=
 =?utf-8?B?SmdHTE00ZHcwdTRrb2ZEemhJbEJnVnVPTm9EbjdncGdEekRROW00V1lIRVF5?=
 =?utf-8?B?RWEyWHRYZi9zZ0VRbk1wTHhlanRZZmFmQ256MXp1QWlwSUt3VGVOZzRHM1BO?=
 =?utf-8?B?OGxOZE1MWFNBelpiaGlCbnJxTkY4K0RFUGZtaHZRNXlMa1dkTEVVbnU1TldG?=
 =?utf-8?B?TThldVlxRUhuQ2RRSi80M3E0MEFUZm5ZdHRPbFFJTDRFeTF0WHpPV1JzK1kx?=
 =?utf-8?B?S2w2eUdWbjU0U0hRdnQzclRhN1Nyb28rSXIyM25Eb2lHRHFBQ240RVJuU0VK?=
 =?utf-8?B?T3RyenRKSWFndFY0a2x3TEQ3UTJoTnB2dkxRZ0tpaGVGWWlmeEgyZVRpVGYv?=
 =?utf-8?B?NmNoL0ZIYlJNenlHMW9jcVhNQTdSdnl3WmlKN2F6M0hFd0F3OVUwbUl4ejFt?=
 =?utf-8?B?ckJOL2wrUzVGSEdqV0lPbjhqbVRpY2E3eVozaExDeVNTM2NrK0hmK2FQcGlj?=
 =?utf-8?Q?7gnrkvTlYZXS+U7lSKgUF/kGJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02cae90b-f20a-46f2-a31e-08dcb21c48c8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 11:22:53.3369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZgOZJp1VQ6z2jYKPc4KSy97XHuTHVFXrQkup/jIisMJPLQryIDmYagul37ZIVslPFNJv814+aJozeeHrdkRTBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091
Message-ID-Hash: 6BERMUNGGZQU5OCOUTIULHZUBRK7WNNX
X-Message-ID-Hash: 6BERMUNGGZQU5OCOUTIULHZUBRK7WNNX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BERMUNGGZQU5OCOUTIULHZUBRK7WNNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/08/24 16:27, Charles Keepax wrote:
> On Thu, Aug 01, 2024 at 02:44:15PM +0530, Vijendar Mukunda wrote:
>> This patch series majorly consists of below changes.
>> - Rename structures, macros and codec helper names used in Intel
>> SoundWire generic driver to make it generic.
>> - Move Intel SoundWire driver common structures, macros and codec
>> helper functions to common placeholder so that it can be used by
>> other platform machine driver.
>> - Refactor few SoundWire common codec helper functions.
>> - AMD SOF based generic SoundWire machine driver for ACP 6.3 variant.
>>
>> This work started a couple of months ago to avoid duplication of code
>> that wasn't really Intel-specific in the "sof_sdw" machine driver.
>> The code went through multiple iterations, was tested for multiple weeks
>> and a couple of build issues reported by the Intel kbuild bots were
>> corrected.
>>
>> This is the initial version of SoundWire machine driver for AMD
>> platforms. Additional code refactoring will be done in the next step on
>> the AMD side.
>>
>> Link: https://github.com/thesofproject/linux/pull/5068
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
> Would be good to also include the linux-sound mailing list on the
> cover letter, if not the individuals given they are basically the
> same on each patch.
>
> Also assuming your mail timed out again, you should be able to do
> a separate git send-email for the later patches using the
> --in-reply-to option to give the Message-ID of the cover letter
> and they should append to the same chain.
>
> Thanks,
> Charles

Thanks, Charles, for your suggestion. I have shared the rest of the
Patch series.

-
Vijendar
