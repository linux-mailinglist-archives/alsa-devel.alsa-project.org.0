Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A812C9E1757
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2024 10:24:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C96114DE;
	Tue,  3 Dec 2024 10:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C96114DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733217886;
	bh=srhE2265ekXcDB86qyQEnnsjpxARt+o7CXLkpMLUy18=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sGldPGf/ED6bREYd8rC8lY9WYZ06AhEOOr2QmTn01IHXJJ965mUJKQLLO8czUivZp
	 ZQShMJq0nhcnM0i1aHkYycAZ5yVq/Pd9riio/uyh5gacXiDnT0ic+Y6pFRkm5iC/QR
	 iGyIEg98hglDHK7xeaFgMnxwlcqYoM59/2S+lRBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE221F8032D; Tue,  3 Dec 2024 10:24:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E964F805BA;
	Tue,  3 Dec 2024 10:24:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05088F80272; Tue,  3 Dec 2024 10:24:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CAD7F80073
	for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2024 10:24:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CAD7F80073
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YXOdcKCd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYTnpyyfD4xB5pDITnI2nP5aIEeSkB5+McS1hUzKT3DTf+UfqoR/D9ZlH697SCZPr5ns4/JU67Sx4jC0bW4sQZZDmyWmi99sd/NeAySq9smXAvJmgVU6Ojdd2LjdSX5yQkim3KhU15CAt7Q4aTWFYL5mRRGPRLhkR/89j+LMhmj0nPMKukPxFLr7ogiFmL1fdhoC6imTUzvJAh+UBJQF4YV0fUik+uv7aSHXbvj1OumIQDvmPm5+pXwB7LjpKRhzfEiDrTqIDdqaEJdj33giLFFbz/ofB539KLb/8nMBFNkL8nocudWJ0yKYQT5tmHuertuVnnp9Y9AGDunA+SBrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ns4VoJFXeRedwoYg15qjWrvyxuSnkzVWO7rJp7vA988=;
 b=Ppla9PTn0t0nbloTtzeBoZ3HvaYO4UwFdQHOoJkmI2ulA4SaRyYYQk4+AgFGs3rZKZGyLc67tyRAEkw6C9q7/fxMjToVrnq0CEcshetQ5VKEui51E8+I4EfrSOZl+ifa7OV/19ZfP6t0mO7In51+Q/NPUa2N4bxlCN2aj7hyu0mhRIrKuVQzw/7Kza6qb7gDLeiQrbgyIaxC3uXv848siFyP7gDTdIs4DSb7h5vHpePBbsN0yZCwPxNnZRTyQWc+F9y71pL5U3TxB/M4h7b/tI1+CncA5NCWDL+3csaV8N8rO+MAOCwsISV85l4R/lkcRMbmlK86hSdsXoT3skC1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns4VoJFXeRedwoYg15qjWrvyxuSnkzVWO7rJp7vA988=;
 b=YXOdcKCd9Y2b6rzbAY4kRnbynP7oQS5291w315d/4PvcnXoPz8QqnMSqQxB+u2KpvQgGOqGtN/RufJYBxUM8q5jmFIVhEOC5atewIv97S7A4/aiLaNTjHfzU77B2nB+AETc20wo+xhCURnEf5xNyldPEEcsqqSko6hGEsJQfA6M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Tue, 3 Dec
 2024 09:23:48 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%3]) with mapi id 15.20.8207.014; Tue, 3 Dec 2024
 09:23:48 +0000
Message-ID: <08a82ae3-659c-4de1-b3c2-d7ca8c0c7483@amd.com>
Date: Tue, 3 Dec 2024 14:53:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20241203091006.4096890-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::7) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 2331cc92-9915-47e6-97e9-08dd137c311c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2k4Y3pmUENvVDRuSTAyMCtvT1dtY0FadzE0SjBsR3ZqSWdqNlQrdm5IVUhm?=
 =?utf-8?B?RWMxRGJpOUQ3ay93ZHZFL3ZJckxZR2phU3F1eC9hd2lzMVR2eGhuMkJISTh5?=
 =?utf-8?B?NjVLTmZHSzhrRk9lNlY1MU9DeGVRVmVaaTdlR25FT3d6cHF2ZDVOQWJEckFQ?=
 =?utf-8?B?MjR1NFdtS0FxZGpWVHZEYnBPNG1kek81V2tEUDJ0WlhkcVYxYnZSNENWdjN6?=
 =?utf-8?B?dXB5QXNXUTZORTdrVU0rcFJMSVJNUDRNeTZ2bitFblp4Y3AvdHZscFZlczZp?=
 =?utf-8?B?VmZoMlFNTlpTaGxhZE8zeDE0aXBSa2toOHZOZ1I2bVFCaVVnTTdKMGJuQlBI?=
 =?utf-8?B?T1lRbGNWR3VsOHJEcjlxYmZUR2l0aGc0WGtyQ0xxNTBHa3FnTEZiM0cyOUt4?=
 =?utf-8?B?STFReVZJdG5abEU2UjBzYTRldmJ6V0tRdlhLVzI5YTRiNzJPU2JGdTVGRW80?=
 =?utf-8?B?ek5icnhFSVY4c2xWRVoxM2ZnWW1Oa1lkM0hTdGYvTVFXd1Zwc3gwM0RSa2VX?=
 =?utf-8?B?aEttZnZ4T0R6Y1E4aDZoUGsrUVRjYlVVVE1oVXYreW5TUlV1OWl6aXNrVS9X?=
 =?utf-8?B?c01nRlc4WEpxMnpNMExRUHhjREUyR2lJelIzcVJXK2ZzWEd2Y0k4RkNXZDRI?=
 =?utf-8?B?cVZSelVwSWxJcWh6YjJNR0diQlkyc3E0S3NlK2ZwWHhUcTlKZG52M2Z2Y1hw?=
 =?utf-8?B?bjFid2V1aGpCVWNpdGdaRzRhSXMyVCtFVldKZEZkT1JkMnFoaEF6QkY3Qm80?=
 =?utf-8?B?V2dpN0UwNnRvVW1iK2s5WjRhS09oTXZUVTZmYUh2Z1ZiZGdzZXM0QXBUUE9w?=
 =?utf-8?B?T1BaUThrRlJBWXNFcDgycEN4NGtxa2UwYlhjRC8xL0pQbVNvTytVM2t4alZX?=
 =?utf-8?B?Wm53UTBWdm94d2dOcGc0ejhxYlNBalZEM25IaWRQMEtlaDdXZWU5Z0ozQVR2?=
 =?utf-8?B?MVdvaklGY3lmWmFZQngvcGZ1TFVvQUNPNDl3U0hOQnBVcWpkbUw2Y1FkM0t3?=
 =?utf-8?B?NkYzMWJpbkxldXhJWjhxWjc1dmM1THZ2Nm5CUmRUQUpHZGhRT3ZPQUUrT2l0?=
 =?utf-8?B?NCtOeHc1eWpoYlk1RXFHSjRVbkRtaW1IUGhRLzFKMTRBSGUybTlnT2tBVUtw?=
 =?utf-8?B?SHJsMGlndWRsOXhoYzhpMDFZS0V1Mk5kYnQwU2JML0k0MVdwYThzMjFiZVN6?=
 =?utf-8?B?UUtURDA0aFFWV1M1N3V5bDNOb1V3VkpMNTg2U21yQitraFBhbHNhcnRtVGds?=
 =?utf-8?B?NEdWK2tSV0w4YmRRZ1h0RHJQR0tYbXk4K0YyaDA5RlJpbEFkZ2hIdm1jRERl?=
 =?utf-8?B?OW5NRG11Vm84Q1phTkJKcHpROHlSRnFpU2U5dmZmRDRHVERQalBjQ1BqMVdx?=
 =?utf-8?B?UXpRZHcvbzRjWmtOR0hZZmlLenduMHB2N1kySzNMekYvR2pBemluZHFhOTNP?=
 =?utf-8?B?QUJKNVlpTmlSRmgyeUd0d0k3Y0hzWkdZVXExdXp3WlRPU2gzY0FMTFJKR0tX?=
 =?utf-8?B?ZExHQngyVmsxZmZ6QkNYYmU5eDJjUTBNVW02aHVKK1FMaDN6c1ZIdG1RSDds?=
 =?utf-8?B?RHdiL0srQTJwZmQwdk9sYlp1WWF2QXFLVDhxMncvQTNXZDJQdVI4eUVvTVEr?=
 =?utf-8?B?bGlJRzZBN2R0UVFVUEhSTG5rZTlZdXdWdDdleWpPWTdhOFFGNGwrcXV5TkNw?=
 =?utf-8?B?OUoyT05LOHgrNVRwTVU3bGkycWhNRXNQSmZ6aDBzQmY1WDlzd2Z4bDhJMTIr?=
 =?utf-8?B?bXZlMHNXZ2xtSjBQY2wvem9mY0dlODNaNVRPZ0xoZ0k2M3ZYQ0NzSngrYUtC?=
 =?utf-8?B?eTVhd2hqUFY1cjJzTzcwUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d243bEJWWkNsS3E3bWxDejhoWEVYOUMvU2YxUmk2NVFNcmRCRzMwRExHR0Iz?=
 =?utf-8?B?ZGt1b1dEb2l1Q3hSVXljb3B6OEpPLzVLZFNtdjRwdW4rSW5vRWdnLy9PWnI2?=
 =?utf-8?B?SzBXUmE0aFhqRjFWeTcwTUh0MkVxWDVFK2c0Q2FkV0RQRzRrNG1ZMVk4L09N?=
 =?utf-8?B?amROTU42TDV5YkRUWEpoekdraFFtYXFUcHZhZ0lLczR0WDFaM0p1Q1gwTERv?=
 =?utf-8?B?V2Vad3d2K3hTazVRem5idXY4VFBxSWsrazgxY0krc2dXZXdOb2RiRGFrTnNa?=
 =?utf-8?B?M3ZRVnMyRCtFRnBxenhKSzFBZTFYaDZzeTNQUHl5MWJEQmtUbGVla2VqSzc0?=
 =?utf-8?B?Z01UT3BvaTc0WUdVOHY0TEM4dGNHR29wNW85RkFiRFZFdENpdDZiQ1NMVE9D?=
 =?utf-8?B?enUvVVN5WTBkaytlQzgvcnZ1dmNwKzZxOGlxdUsyK0R1THd0SzF2ZTBjcnFu?=
 =?utf-8?B?elJtZnFMbVJXZVlJMDhKSnJFNDBiaG9saytNTENIR0ZuRkdhNDRlM3p6cVBw?=
 =?utf-8?B?dEg1bGxiZE1ISG1CZllRS1B6WFNOZS9xYWVybjZieEdqd1d3VWtxTFRnTFJI?=
 =?utf-8?B?d0k5akVEQUxUcVh6Q0FtTzFENEp3ZmQ1Z1EwZlZvMjhlaFUySVVNTEdOdkRN?=
 =?utf-8?B?K09ZQldLRUxlc3RYVlNyN0NxdHV4MXdDbkVOWlVpZEc5MllaVmdNeEk2S0Qz?=
 =?utf-8?B?dlRVd3JFcjFLL0V2WEVseExmbDhpSFRyWk04TVdmbEo3cEx2Y0wydFk1REll?=
 =?utf-8?B?L1RZNmlSZjZlb0pPdjdOc2NMME50U2tJekFacjIvSnNkVlh6Z2J5QllJR0JH?=
 =?utf-8?B?Q0U2c0grNTZ4U0U0QzdvY2o3Z3NoazgxQTNLUm1iY3lEZmhudW1mTDU1eHBZ?=
 =?utf-8?B?R0l2UEVtYVExUFdIQXl0MVdLL1Q3cUU3NW9DQ1gxZCsyd2xSNzVJYjIrTkh5?=
 =?utf-8?B?WmhUdzJsRU96T3E1RHVpb1B0TVJDNEZGSzcyZWsrRDQ5K21SUzhISUNXK3JO?=
 =?utf-8?B?dlZKVmd1cDZIUWdUWWw0ampSeU5NcWFwV1ArMDA2WUNDYnJ6MC9xd2p0cWZp?=
 =?utf-8?B?MHRGT2VnR1pqUmFNRkpESlEwOFlyd2x4dGVDbHNucnpzNDR2N1pRWTdFUzhj?=
 =?utf-8?B?K3hzaThKK2UxMzdPMzMwWVUycmF1ZFBQajNEVUJTbk5JNXpkSVNleWxQM1N4?=
 =?utf-8?B?eFFxZ1pER0pBWkZ0cGVZLzVLRVBXZnlXZFJIQmszbzIvTTZnZVlVT0UvQ1dw?=
 =?utf-8?B?cjFmQlVOaWNpN1ZBV1RIdzZBdHhVbWwxczR5RGViTWoxNkhCa2pJemRXRGV3?=
 =?utf-8?B?ZFY5L29UVHJUdk1FMHVvZWJuOThTMXU3QTZLdVMraUdqTk56RkNwOVRpQWlN?=
 =?utf-8?B?V2tPMnNxQlo5eVRsNWZwQ2o2Q0xMdHNVK0p6VFl6cnpPV0tRaHg3YmtTakdP?=
 =?utf-8?B?NjUzbUlFR0pRMVIwR0t0Z0U4SWExczQySC8vOE9yNW82UGplWGp5MUtJSlRX?=
 =?utf-8?B?VUREN0FORW9WY3dEdEtBVXRKOERhYkx4T05Cc0MwWEZJWDVJTGxQQ1hCcWJI?=
 =?utf-8?B?SDZlSmNocGE0NzBHWjhrSnh2OHg1eHovdUpNaEFDSlVIdlp6TEhwTDlvWUtS?=
 =?utf-8?B?VFhUQlcrMktvTHoxRk1IOUtWTmxDWVNoQVduMXJBSUprQnFxRlRRc2ZadXdm?=
 =?utf-8?B?NHgweWRWd2ppZDArTVhmek1nMUtKR3RqZnBSQWtad2EvNnF0c1BrUkVBQzli?=
 =?utf-8?B?R3VabWJYVXBXMXdrdFZlOUJVeHdVZ05CTkEweTgvcXdXeHFUWEE5VkhJbjF4?=
 =?utf-8?B?ZzRoZE0wenlYRS85aC9CNzUzUEFYOGR1V2NySjZBd0xVb0l4WENTbmd6dWwx?=
 =?utf-8?B?MmlCSzBkNkxWZG9zbys2cFZVOTdoL2wwRnlETzBFQjFaUWRjUldTTVIvYUcy?=
 =?utf-8?B?ejFUMXJTWEk3RmEreDhsekNPN3Q4cDEvdktIcDRjZDJnbytTYlM1aWRhRDV1?=
 =?utf-8?B?QnNVMG1mL3BtUUFJcUlLYU84QkRhQlV0L2U1RkxSSEp4YzRrclJteTVuM3Y1?=
 =?utf-8?B?dDNURU5wSUVrVHh3UmxROE44S1dTYTR0N1NoakJibHVQQzFEclJPRGRzL3ZG?=
 =?utf-8?Q?k+1UIfYq9rFANRb1l3XdJSPzw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2331cc92-9915-47e6-97e9-08dd137c311c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:23:48.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ADIkhb570GV8WHSkCWsLd0jgNTdZjbA6Bzyu796MOU+Nrnywp5u0qwV+rZnr2/QSgA4Ony6vEz71glsRyfWkWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664
Message-ID-Hash: SBLRQN7XX3BKP4KFZJ7U5UUSTYLX6CEG
X-Message-ID-Hash: SBLRQN7XX3BKP4KFZJ7U5UUSTYLX6CEG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBLRQN7XX3BKP4KFZJ7U5UUSTYLX6CEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/12/24 14:40, Vijendar Mukunda wrote:
> As per design for power off mode, clear the wake enable register during
> resume sequence.
Ignore this patch as commit title was incomplete.
Resent the patch again.
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 5a4bfaef65fb..96a3aa6da711 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>  		return amd_sdw_clock_stop_exit(amd_manager);
>  	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
>  		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>  		if (val) {
>  			val |= AMD_SDW_CLK_RESUME_REQ;

