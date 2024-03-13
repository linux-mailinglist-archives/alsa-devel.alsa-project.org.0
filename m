Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7898F87A2AC
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Mar 2024 06:28:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E18A4E7D;
	Wed, 13 Mar 2024 06:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E18A4E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710307698;
	bh=axekxr5KbwRWgbzvMavrsQv3fVZ60IyiqJ1DWDBQII0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qi7RXpHbu0LDN401Adf31tno1znAee/mf0IBoVb+n2wVsWJ5ZvEVTZNrGmOMugWJE
	 xnjsrgnfvd1OsOckGhSUkjUi08aYUyavuxguH4j2MhntXLtsxntV9IQDBdAEB8wNRD
	 yjtRAzLlw7FG7giKrNej4frXS3JaeusdlZ+KLHL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 797D9F8057B; Wed, 13 Mar 2024 06:27:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D316F805A9;
	Wed, 13 Mar 2024 06:27:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B481DF8028D; Wed, 13 Mar 2024 06:26:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DC86F80093
	for <alsa-devel@alsa-project.org>; Wed, 13 Mar 2024 06:26:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC86F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SaZXw7Ez
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS/073n795+/XnsbUcj/V8bR4PY0DhDaN3ynl4gv7u6UtBhtyD6SASKMJVI3K1TM2j8V2NfGpgAQFD8wQpi8WZSjSuRUJBCRoceUchkT02K9ST9uE0x2vIjzVM8npGscJlUEfKlNmApl1iIekgrW8G1iWCjaobI9zftxm0gCdXSG5vyp8UoRfJsYjjjx4ir850gYfWQO+AFIIk1ELsNPE971xe/D+GEWGfTKXsBKALedCmhJD4JvCgUnBzZFFblbAzXJMZOsg2gKMqEq86CUks8AKKZNAOSFGqrNX0GOjvPMRXmbqzJKaVjcBlIJsWSyatAlGAqpUmj/rT0T7eo4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p4jwx85LP40IcK9kmtEGiq4Aa/IxQ7pxiUBgOEITnU=;
 b=QZhQJE8E683+D8sagUjNlLQNFpRCHYrCnaglbMljppwu8iskuNV6NxlLC+5PaZ/JOacNPG2OQs5PcY4bhwLLqXLuCGdwrV9axGpCl0aTLYy4+fanU0+R0QlgWu8hxabB5y+UseOjLGf2Hd8argtlxSpE9EQk4QNFMl8YSBBl4q4rAWwwfVr9prTCFUMsl5x4jYrqDUAI0ZCh48KRJxiArWrvxQBCwGAlCl+H2oA4CwcQEAlQHuFtqSM0PviGlvXHXwuCWLPJyo+xjMQoevoGN9vmWg53elBn3WLobg57CeG4wHRZ2D3Ipueh99Kyx9TOpxOIuhTZwWNRwJq12wHtkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p4jwx85LP40IcK9kmtEGiq4Aa/IxQ7pxiUBgOEITnU=;
 b=SaZXw7EzqXlmuA2g2d5Rs5eMccage5QVwPRix3zBsdAsGsqpKw2RunewGScf/4A6OhV3l49JZZE6PkW06te9yTouaEoF9EA8jyL4VFlE8LQ9Sxs/GsRu+sphkmGPdKZXd1g+iPvxZ7xwR/sYya34E8qlDJQp/ged7Ys8f95lrKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by MW4PR12MB7440.namprd12.prod.outlook.com (2603:10b6:303:223::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 05:26:26 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3%3]) with mapi id 15.20.7362.035; Wed, 13 Mar 2024
 05:26:26 +0000
Message-ID: <d5a0ab6d-3eec-4072-82b9-4267a6bb5b58@amd.com>
Date: Wed, 13 Mar 2024 10:56:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 00/13] soundwire/SOF: add SoundWire Interface support
 for AMD SOF stack
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 vinod.koul@intel.com, venkataprasad.potturu@amd.com
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
 <565b9a1d-a074-4bb6-b4c5-2b9be9095a3f@sirena.org.uk>
 <581a81f4-e540-4de2-b17d-51bc192ae6ec@amd.com> <ZfBmoe4Rv2zjS7PV@matsya>
 <e6ec31d5-ab6b-4c28-8fbc-c706b56c7630@amd.com>
 <05bbc2e0-e8ac-4db0-9ed5-7e3ac765f252@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <05bbc2e0-e8ac-4db0-9ed5-7e3ac765f252@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::15) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|MW4PR12MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 860359e3-4dd4-476d-c263-08dc431e2088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ex2sezL1bstdVewldUwCBis3iNMMlSybZXLxVZgyVCKlWgx5RMr8eiHoZ1FXXkYZu8RPd2Fqx0vXxgjIcv487eCVCDhBR6BAqdmEDES4yosoqXg7JuKy8L9G4p/NE32AqdtSkxFIZmAY5GCoE1rlVL0FWu9Ch3gQogTVlIBik2Tk4QjqPb7bvl52JPJounGv8xQqdMfIlpaREi1hqxTomLMkMoYg2+hhEK23Jd0Ekga3gGZTGv+qwtXAcUFSxXlO6P+L2iQW50dCoGzFu9y+PT34+idVgRko2+hTXe8Wcy18J/tlw6PaXNRBt1Ixo/UroYvaTNy/etjFFrH37fNiifrTPRxqMYS5DRSOOx3nO62+61mBeWIDqQzMbfQ61nv4lPA0StKgaUsbBjNBFE+Kc2lVS1sunFShCpcY2NCeXZg6b+sw4Q955/SGe8FbZR3a+EOGvpHQQ2FpaZY1KEJzuDk+fnMgzobjiNQ5CfZmfjVJhHiqWmAC6xBzlgxuae2pDHIoOEL2a2zWXyDMRrGWLI1x4Rx7Z8M5GIZEUj97ntCb2Wez+FlCLbTPnerVG1RGy7dbVuDOFub2wKehFJHpsW6fnrBKfhYpjI10RZRt0u4Tom8MsRzsA2QpWSAkXwngc79T+q0YQxvjdr/QKl8M5apm+3MVtHbQIkE0OjG42pU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2pNQ0U3RVR4dHlvUHlrb0xDb2p2aHBVeDhubkxzM1pyTXB2aUlGU2RBcEQv?=
 =?utf-8?B?UGZFeGdJVkRzNXVyNEI0bm0vQWVEZnBIVW1pMXRwcjR3YUNtcFJ4RmZ1M2tP?=
 =?utf-8?B?a2k5eEI3TndncUJGRnUzTXFkYUFGNHJESzZpTUEyZ2t5WFRUK0Qwa1pXT0Fq?=
 =?utf-8?B?Rm5oMjM0aVBuY1pCN0J2cGk0bmFzWEtQTkdwOFhVOFNwWlEvY2lwWE5RbVNG?=
 =?utf-8?B?L0NydkV4WmJXMmdGYlRHSUpyd2p4OWg4aGV2MEZNdGh3UjVuQzBqT3BFaXlV?=
 =?utf-8?B?RHllT0V4Q25vU0RlSC9OcE9FWno1NnRvNWJoMUQvTVZ2WExLZDBud1MwcXFT?=
 =?utf-8?B?ayswaGxtYVc4T29JOTUrUUwybm5EYUEvd1lzbWxYVTJDNHBTNlNmUnZKM0x1?=
 =?utf-8?B?Zm01d040VWd0RDZwc0hMeWFVUEs3cWxFTS81QXBuWVhINS96cDJrV3R6MXhW?=
 =?utf-8?B?bmFYajZIWDArZXQrQ2ltRzgrWnMzMVBIRmZIMmg5Umx2UWF6aEJuYndtMjZr?=
 =?utf-8?B?T1YvMFEwR3JlS3k5VjhuOWRuSE5PRnJEdnRjUDNjVzBwQm9nVnZyNnRkQ0Qz?=
 =?utf-8?B?SzdIajAvcE1wTFhhMHZhRDFYUktJcFpNTjRleGMrcDdid3JkeG5xMTk4RGFo?=
 =?utf-8?B?MFIyYjRsbElpMmF0bXhQOVBmY1dmUFNWdGdSOWZLazdTQ21Va1FaRzNFbTdW?=
 =?utf-8?B?NEttazhUYThjeU1RT3JreHl3L3VnUTdrZDl1YzNpVjAwenBSNnlOR1JrK1NC?=
 =?utf-8?B?UVNoZGR2N2Q4NEpidGlpbWc0bytSMUttQWpQQ2toUTZyQlU5WGJYSDFTTDhQ?=
 =?utf-8?B?eTZBazVpTjZyMCt2aXFJdUYxK29WYmhwUTVJMXoyWDdHNkFPbDdXQ1M1OFRL?=
 =?utf-8?B?cXdSSjJDK1RaQWNYbUhrYU9qR1V4SG0wSHB6N24vL1VnOGdLWURsN2s4aGxL?=
 =?utf-8?B?c085emhZaVY3V1l4YzZ4NGJRMWZoS0JZUlVsWXo1ZVREU3REdFR0eXkybWFj?=
 =?utf-8?B?alNrVWsralhlUjJod0RZaSt3UmtJSnUxTWJQaVBLZFVFdnJjNXdPaDd2K1Jk?=
 =?utf-8?B?MG1Ua3Rlc1RNeFRsTFZ0NVc0U0xVWk5UVjM0V2U1RUxzL0s1ZGZMOEluelJC?=
 =?utf-8?B?SzRRTUJWTVppM1hhZUxTSTAzN1gwZUV4VHdFN0VqVVBhY0JpZmp5TWhVS3Rh?=
 =?utf-8?B?YmVWZDFPUUg5TVRPMFFxVTYyQnJQY3pkNUFobnNaVW1yZkQ1VmtwSnBIMVJH?=
 =?utf-8?B?Z3p1Q0NRdHFWSVV6NUhOR1p6OExLNWxRUXNhdkhqTnVvMDZkYVordHpFd3Bx?=
 =?utf-8?B?UEd6MTJnbkdJSnY3SklWQkRHZ1hxeTJjNnB2SmtmVGVacGQzc1JPVHNpYkM2?=
 =?utf-8?B?a3NVVHJPMlRiZE5mMmNWUUg3TWxPbzBUbGkrTzdjeWQvRWFlUFBQTllURGpa?=
 =?utf-8?B?MjFmOWZ3U0crMW8wWkpDM2Q2RWNLdVZmb2NvM3hnN0JTNDBZN0FFL25lSURm?=
 =?utf-8?B?SVU2blExNU1HeUlKZ0o2TkdHY296RXpNUVBqSjR2MlpTMURKalJWWjZtQXo1?=
 =?utf-8?B?eHhHL0xmS2ZXUzUvZURTdExvRUJmK0IxN0N4aHkwbnhyaGFBNHhldTI3Zm96?=
 =?utf-8?B?R3hBTW5HMWRSWEthSC8rWEFBTUV1SktLRE5KZjJoanFYV0twQTVpb1JsTXFy?=
 =?utf-8?B?KzQ3OEdsWHByd1Q3dkcwOE44b0JBQm5jMkpzZFJWa0d1R0loRVV3OG1UMm10?=
 =?utf-8?B?NHhiejA2Rk5hSUh2SUovWUlJMkNCTGhZZDhIeUVlbkxLRXRpN0dLR3VuWDVw?=
 =?utf-8?B?Yi9qWG81V3J3MDYvbi9QdUQxWmF6SmFuOWRidVp2ZmdvZ3dYSUYyMXVWdEZy?=
 =?utf-8?B?T0x6dVN0enVzelhsNW42eXlEWGxSTURoVm9pUWJQZERtSEV0MHZrQVFJcW9I?=
 =?utf-8?B?cXhDbEtScEY1K0pHOTVySnRDV0diVDErQUh6L0pGeXlHM2E0aGwrT0t0MlEr?=
 =?utf-8?B?UXoreG1UTUpFMjdLWmpsUzNleUxjTUc3R2tlMzk3MGpsZzdLeWJCakRuMFNL?=
 =?utf-8?B?aHhmWUhBRnFtTE0zUWNtN210RFNtdjkrYWc3a1Z3VEF3U3JaWlJ3eW5tcWdT?=
 =?utf-8?Q?wcgCs/AQUy1G//6AVln/4Iw9J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 860359e3-4dd4-476d-c263-08dc431e2088
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 05:26:25.9233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EXFSIzvVEvBbQ44BQZvQNkSyu9dZTLNHjDQNaMbT1PqWP1fwprfocP1EGbzHLPePP8Pp6jn7i6lxnmWdwcsB3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7440
Message-ID-Hash: 2RONUC2A2TB46YNF4GSJEXLHTUSY2CGB
X-Message-ID-Hash: 2RONUC2A2TB46YNF4GSJEXLHTUSY2CGB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RONUC2A2TB46YNF4GSJEXLHTUSY2CGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/03/24 22:16, Mark Brown wrote:
> On Tue, Mar 12, 2024 at 09:59:09PM +0530, Mukunda,Vijendar wrote:
>> On 12/03/24 19:58, Vinod Koul wrote:
>>>> We need to send few fixes on top of this patch series.
>>> If you had told me earlier I would have pulled. It is late now in merge
>>> window, pls send the patches after rc1 is out in two weeks
>> As patches already got merged into for-next branch, are you going to
>> create new tag for SoundWire patch series for RC1 release?
> I'm not sure what you're expecting to be tagged here?  I expect
> everything I currently have applied to end up in -rc1.
Got it. Thanks

