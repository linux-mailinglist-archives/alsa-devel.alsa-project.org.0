Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B686EE13
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Mar 2024 03:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 274FEA4D;
	Sat,  2 Mar 2024 03:11:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 274FEA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709345484;
	bh=hnPVhlw0FI3loCehRSyGLO2hF5F3BiLqsrG9qCUgsIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ul2KCVMpSMNk36XlF9fSHFIp9vcai3B68vuYBvvqIVShXjpVyguL65/qsavnKAVss
	 3M6N64yfZ0kL030Sj4lhAuj/58qWGlt5OkhRtB5hjJByKyw7cTj5k5551+HBTkoGch
	 AKBIS/g9gCQuqTT2FaFQwT44n+CMWo1WxIrOdr4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EF27F8013D; Sat,  2 Mar 2024 03:10:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A4AF80423;
	Sat,  2 Mar 2024 03:10:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AE87F801C0; Sat,  2 Mar 2024 03:10:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SCC_BODY_URI_ONLY,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C5BDF800F0
	for <alsa-devel@alsa-project.org>; Sat,  2 Mar 2024 03:10:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C5BDF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AouUyBd9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9wbqztx8TmoQlAwqWK0QKafhn5MvAvnQfWW/43kEMjAYYIUoYwsECV45Hpf7JrjKl9PTrEQELNgh+cNm3Fqnlj05CU2SMBZYmchp8DQsm7jioVmNqvU46kuuEihYJ2tL090P1Fm4hDbwuFMmLmBlH0a3MizMX4LZDyE3CLoUCmgljyMZnltQRJxDE8nKcmEOJySmsxN+KOhVilhJYm/hgBZ/yiKro6HTyCRaf8umsPJStwIuEGAI1IFM6gPpCvHnraHPREoBUG0Rl4jSwHAniPlPITKAWGPxBYyZitmae2Q5nYfzNug6vK7f/PQv/sWENwW3e70kbiuMPmsjEauVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnPVhlw0FI3loCehRSyGLO2hF5F3BiLqsrG9qCUgsIM=;
 b=IG7IdDnRnHwWPTCoqaEckDm55pixE61lmanDemQA5B36ZFR+Y2IJt6KUpdF62k6WezVRfb5Q6WXtre9gcRLtscnGIsCsCY0G3QSvIWyoTrbZzMQBD40aYYKqJ0YR3NRQ2Z7imHCWJU+AiiOaC24R4xQ3DITENXgnrQGMlMICGYMmZ+P9b8brOjbu7HcSKdzKHAzVMe6NKi+HwGngXQEOf4ry9M3PJMFbD4Xm90sVxANK2ElSUNeDT4Ko0YMpzZdvDpnV9bcUR4WQCKxRaz7mP81W/Zi9OE3fZn8HhB+um+EHSafBA4kKrr3TqVX6LDIweAyx18hxRTcW0V5xbZIWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnPVhlw0FI3loCehRSyGLO2hF5F3BiLqsrG9qCUgsIM=;
 b=AouUyBd92+Bs5YKS6GEDzdZS61r1BtYFJAZ8RRmYR2SuJIDBLpSGcjwGzIkpqSP4se0nRGvi6Mt/UmsK2mjv0axgvcseZgU+bSPzfuikP5IWnKnkc3CXNn834g6hABdfJIha+DSfFvpPOj8Rnc8JdW9UQxCH5tCV7lApgb7tUww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Sat, 2 Mar
 2024 02:10:36 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3%3]) with mapi id 15.20.7339.031; Sat, 2 Mar 2024
 02:10:36 +0000
Message-ID: <ee0e9735-2f6a-4c8a-bc9e-a1179e22ab24@amd.com>
Date: Sat, 2 Mar 2024 07:40:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 vinod.koul@intel.com, venkataprasad.potturu@amd.com
References: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
 <188f7d68-0f13-42b4-99a5-897584fa46f2@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <188f7d68-0f13-42b4-99a5-897584fa46f2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::11) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc6c838-09ab-490f-e866-08dc3a5df1dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s25VrTvPpGBDmnqi99fOZjqNNhF5tPqg0LGf660djpfv0IYq/ej/BC4lvnclzJJr6u4FoJxG1YVQ+aj7zlejA/9/z+Wysl/Zl6g5Ni/qzL9L0Hf6FP7cHQUs6SyUcsXFYmtl8zV7Dy/S283YGiNWSS0Frha7aq3lolqn9yYEvk/D+MmXkg7yLP7ekJjut/C1U/eX10Nv8Y3bdSDbnJTNKI6kgmTGsVVpAXFZtCOjafHNXrlpZ7uJn/F2JVu4WZu5WWNNGGdPV8SOBu7tpH233FpMX7ofyKw/hh7eq7hS2KRyaez2kupa+tEbtQt0rw66MTM9aulZl5pJWBBD09zKY7ERS3aiclNfpQ82JP6RedFEYHIkHSSFkKIgcrHJ276Ta8wci2Dtbrsm0yZf79QDXyYsrkabGJdppZ3K31E9konJSG/NsTxl/UKdaQSt2WNLOAWi63XyXdFsYntdLWBhtzXBlUvDvUsP1dKY/yyiOsxWa7f00Ai7Kq1CvW1tm421eyFWNXs82tlK1/RmwLYCTkE3PmozG0n71BcWWNFkfMA+LfliEbT1TWjEWiiFmcBBLECeg09aLopE3I9PbVc6zWaL9WWsSsKU8hE8mpEEhcY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXBjVmcwdWEySThvU0RCaE9zRndMTm0vWlVVZWZxS1VlejY3UnRGbnB3OE1j?=
 =?utf-8?B?UkVEWFJtcEpQUTZrcTRSdFdld3doWVBLT1BZT2F3ZmNQQUQrODFabE1hWk51?=
 =?utf-8?B?bWRNY2pwRHNyNFBvRGRUVExudTFZcUtHenVoWE91OUVLd1ZleEMzOHRCUE8v?=
 =?utf-8?B?UXVtelZkU1Jid005YzRYMHg0SDduc3hJUFhCL1V1Z0U5cy9zNUxSMWZwUmdH?=
 =?utf-8?B?ZElyQU8vemJRSlNkaWIzTGlaN3hZVEZ3bExuZHRWWTcxVTVSQTNJZUY2MHFw?=
 =?utf-8?B?TC9qZks0a0ZzbFQyTytncE55RzB4R3JKWmsrWksyeEZBdHI0K2JIUkJHSVpy?=
 =?utf-8?B?VmhtRTgyc3dWd0xyaEV4MmhrNGlTMFVOdlNsSnJ6cUVEMjQ0ajlHTWl0RE90?=
 =?utf-8?B?bnQ3YUVIWEZIbjkyU1B4UnRqTUF1Z1ZoekRmRlJHMTV6UDNIbkF4cWJRVnVu?=
 =?utf-8?B?OHREd0RDckJxNzB2VmF4TDBvc21XSWx1MUdFMzVPenBPSWYrR2pMMmM1SC9K?=
 =?utf-8?B?bE5DRUpGUWVjdVFVUEVXTHR6ZmFwckRlODFTRHhzMVhMN0tsWFc4VTc2Mkcy?=
 =?utf-8?B?VW5pS2psT3JsWlc3U0p0SXdaZ3haRWlwLzAyeEpqc3VuOG41QjhCQ3VBOUZJ?=
 =?utf-8?B?cy95cFl3eUhzVWp5K1BmR1BhZUp3MWFJUXVSQVp1SUlkcFlkNG5ZVWdLeVFO?=
 =?utf-8?B?MEt3M0l0anU1R01QMGVWc2NBTjBYSDR4V00wRnJWa0s1bW1ieEdHM05neVpD?=
 =?utf-8?B?VXpVclQ4WHQ2MXh4L0g4cGlySDFxQU9kajRJdTExUHRFZ2J3Y3lqUlVndUlp?=
 =?utf-8?B?anZhQWVXRk8zMXJtaXBZeTJJQmtNVXFEbDBPTE85NVhMUkcxOWhsZVNTbmxu?=
 =?utf-8?B?SDI4RmlOeG9vRkUra2pUK0ZxYmRPaUhYcVRWdVIxdGJsWS9DclpQM1d5TmRH?=
 =?utf-8?B?bjRxcUhnQTlaR3lVa28vbEpTY0VZSitTMFNIQ3JBdjFQK1FCTExEbjJCeWli?=
 =?utf-8?B?TEI3bnBaYkNhQ0NiUFEyeFFzY1BJN3BmTVlDQjB6bVVNZ0VYS3NrQkNrZUdS?=
 =?utf-8?B?ZUJjRFAvNE9TdG5MK2puSENDdWhTeVEra29TWTI3aDBzTGhnR2lhd1dGdks1?=
 =?utf-8?B?L1pXY290YUl5NC90NFZjcXd3OHd5dXQ3SVJDenFYSUFZUzF1TElrVnR1UFR6?=
 =?utf-8?B?WUcvUEFVTkVjWHBITEppUVY1ODBXcFhLS2tCM1UxNEFQVU5lcSt1elljNWtq?=
 =?utf-8?B?d3F3bE9iMTJuclR5VmJSN0hlVTNtNHdmaWxWQmhOMXhDNEVIZHkxdzhmNFR2?=
 =?utf-8?B?Yks1U2g5UEhiZWFzNElnOERJS212eCs1NmZlV3AxYmFveDZOdkNaVUh4cjJS?=
 =?utf-8?B?N1FvSWJVU0ZudW5nZHpiR3RYayttQkpUSW5BY1F5bS9DNjEwU1U4Smp2VmlI?=
 =?utf-8?B?N3NBZ1BzbzdHY29nQy9vMnl2eDhPY0JZVncyZnVJc2hmcytTQUd2cjdaam9P?=
 =?utf-8?B?LzE5bHhBRy9mVGQxZi82eUFZZzNpTGs2M1A1ZlgweEptQWVkcGtyRlVobGk4?=
 =?utf-8?B?aUtYR0o1cVJnOGUyUndSWU8wMi82Um1BRFhYMnYzSDZuM3A2WmIyd2UwV0Ev?=
 =?utf-8?B?U3ZnOVV3TGNaYWRmbVNKQjFzWGJ4S09qWURBcytTdkdwbEowVmVySGFFSjdB?=
 =?utf-8?B?VXBuS3dBYlZmWVdWS1ZBMk9wSVJacXFNQXJXYzFpbzk3N3J2WklyYWN2VGJ3?=
 =?utf-8?B?UXYrM2VYVFU4SncrbzNjOTBHMTNXdFpkL2I4SW8vMWt3RkMybVV0VXJ6ZUhh?=
 =?utf-8?B?TDlabkRNU1VhWmVUQmVPYm5zZU05V05tVms4UnJtYkgwTEc2MjRGSStQOVZ1?=
 =?utf-8?B?T0NXRmtiV1VIN21kNGVPV3FrNndvd0RqVXhaUVhxKzlJazkvMFJleFY3Tm9o?=
 =?utf-8?B?elhWa1JtWWJ0WnFLaHBhL2V1bXpUa3BqVHYxWlRIZmRHdktLVGtoRzV3WU5V?=
 =?utf-8?B?c1BNMXZoS2FUMWRiM3hlQTJqaFlIQTVRcEhxQW1aeEN0V0xRRVV5VThKcHRa?=
 =?utf-8?B?VTFqNmxTUE03c1VQdCtGRHdqNUF0ZmRvWFczeHJkcGgxODIwbTBoNVF0Snhz?=
 =?utf-8?Q?+J3rCXSlotETQaAGxk2KeyFL7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5bc6c838-09ab-490f-e866-08dc3a5df1dc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2024 02:10:36.3941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XQq2OJsudxngnAv1fsmP2lY7zs+6Hxo0biZIC3zdyG7s3pc99io78o6+OyDmmCly0RTGSt/0g/L6SRXWugOTcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512
Message-ID-Hash: 72TRGETE5VLNYQEFMGEV7JXRG4B76BL4
X-Message-ID-Hash: 72TRGETE5VLNYQEFMGEV7JXRG4B76BL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72TRGETE5VLNYQEFMGEV7JXRG4B76BL4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/03/24 23:58, Mark Brown wrote:
> On Mon, Jan 22, 2024 at 02:54:22PM +0530, Vijendar Mukunda wrote:
>> This patch series is to redesign existing platform device creation logic
>> for SoundWire managers and Implement generic functions for SoundWire
>> manager probe, start and exit sequence which are common for both Legacy
>> (NO DSP enabled) and SOF stack, and add SoundWire Interface support for
>> AMD SOF stack (ACP 6.3 based platform).
> Any news on what's going on with the Soundwire part of this?
V4 series already merged in to ASoC tree.
https://lore.kernel.org/all/170672110716.41940.5719661789164483084.b4-ty@kernel.org/

