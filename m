Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB82D31CD
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 19:12:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E6116E1;
	Tue,  8 Dec 2020 19:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E6116E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607451156;
	bh=pE+opq3LGb2JZIVJaqL03yTsVe+4NBUGJwcX3QVmTEE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oGn6Ja1lwS1/kvZt3yXe2ndjM75FlstBPpbZyDieVLpAutZdZDrZsP3hsrEXBV+Et
	 /zfjVmimBfpP9DmTY/fFROqrBC8BB9VvnE9RiFIDsLETBbxut6WKb5tqjq8Cjo3OgR
	 Rl59QQNWglsEttCn+EIz1jF5/p6pjoB1pJUJ/Aaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70280F804C3;
	Tue,  8 Dec 2020 19:11:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1891F804C2; Tue,  8 Dec 2020 19:11:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44150F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 19:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44150F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="R9shIpi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgBk3b01teqNmN34PqSpihyz8Yq8wyKW1oWlU25aiyVUP7Mm0pgy7EPCqIl6438F0QXzCjL9BHTx4ImRga4b0AjUCS8rSAUfDMG+iP05jidjJI1UhaTyIAdt5xwlzHdjY6vZLOlfkmds5w5GgoQNZ1iK8e3452NzpZCemzm8pIsZNksVqKg5yk/zXPNLisKXhxj2SZHKm18UtVg5MpQzffJY5lTEttylfHUVtiomUyH1ltqaez15av2S8XBRbcSyn1vVg/Ei4o31qBClo2AlJJcAPOAeQDUgwsDRT3XeP0zKFBpZuJ/7g98mLHav7acf1csyf4q2dmU47TPu6b9oqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrKgqoFNha2mvdQY/xx3kjWAs0gobO3EDBkZTQVLXcA=;
 b=fhXom00N5HXKjb3bQNrT0BiB1Wd0G3EVKfDLYdZSD+rDgeEnCfGyH5nGZjmyygI0pJv9+IMvOYLGC7/9agpkxlrZNy9iIKCy94H1oGTkswtcTb6Q3DJ5N7xNhNXrT94CdcXDfIBl/CwtEjZLIn7aK0u8mOW/gBLLN4HoqB3LP0P9mPdQiDumi0xXT/XWgro5cnfgs9E8gFKweBGQA7YSMhSoDhGQgWUFNIKKo8dRkvUwLWMfuCrCpRaiqJ7votoeHQncoB33X0oqkVEUpR2SdYsmF+tpjSlf9D0+vg1VZ4IsV5E8yTlNdUE9c0hdSud5IHO4973AoK0DpDO/tDMKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrKgqoFNha2mvdQY/xx3kjWAs0gobO3EDBkZTQVLXcA=;
 b=R9shIpi9AA7nLgtuBlIl/2bCherdfSZ88CkSTcl3U5+parIfqMG3neb2rtzE8jbFwB5B/4Ag/HSSCcbGS6R2MLbD6j25iYcIbZ0JvPGRP3eot4c71EvzVxnrCdF6KTdpX/3E12YU1/WaJhLx6doxA58785dZGy8jEcJiemAub/o=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR12MB1181.namprd12.prod.outlook.com (2603:10b6:300:e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Tue, 8 Dec 2020 18:11:13 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 18:11:13 +0000
Subject: Re: AMD ACP raven ridge: invalid audio mode 2
To: Takashi Iwai <tiwai@suse.de>,
 Janpieter Sollie <janpieter.sollie@kabelmail.de>
References: <07aae8e3-1ee2-60a9-daee-a0172c1012e7@kabelmail.de>
 <s5hczzkwd82.wl-tiwai@suse.de>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <d4e099cd-3600-43d8-d2f5-9f7257da80ba@amd.com>
Date: Tue, 8 Dec 2020 23:57:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <s5hczzkwd82.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: MA1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::26) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 MA1PR01CA0110.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 18:11:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b6e05bc-1c49-4941-4caf-08d89ba4a642
X-MS-TrafficTypeDiagnostic: MWHPR12MB1181:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB118164EA219228FFD54DBAE997CD0@MWHPR12MB1181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WXBWO+MmMwc/St3YJerl+P9rhamSOvjmPxC9wlwMEHMqQDKndcN6nliDdiHPe1pk67Ik68WqdcpyXWSNQNfWTRpB62FLcRF2Y4V2dAif4zVriC+uuAeuo1q8wFgUYXS6ASt27rGx6K7QDDLsMsxLXyhr/kXTkosX06mT9s1XbUcfRKO9zzH9A2bx63XYl8q6qo/7BhQVrSRvlmNrbR3fykSl2noe5N7zCZwMLWmu+/F4RmnDdNnqIfz0DKIAPaPvYGkpY86ISX92AtmWfxAigX4FbpTOGcfyveXJO9fwZrbDE7tRIHuwW28toTewLYjpI3bg/E5Q9i4WAZZM/5WGsJ0K8nNRIGlA3ZWoVUf+yUWP8/efAoAmbA7P9YBauIJTtiixidQRn4nbVFlD7z69v0ffICAZls6tv87SydmPMNO+BAWnUeVqu8NcUfit5B2WdyhfpBlbXT3AUi+XWQ7aJUK9GgLts3W7A/S0iVHJ/X8U2x6s6rAT+FTRS8HekibHH/8y8sc+P1cS7g9Go32/hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(2906002)(34490700003)(45080400002)(110136005)(66556008)(66946007)(66476007)(8936002)(83380400001)(6666004)(966005)(54906003)(5660300002)(8676002)(36756003)(508600001)(86362001)(31686004)(4326008)(53546011)(2616005)(956004)(52116002)(26005)(16526019)(186003)(31696002)(6486002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UmY5dkVCRUNybFVnUFVPclEwaEpxSXd3L1VhMEdqUEpjSE84SEZ2WEUxZlNC?=
 =?utf-8?B?Y3ZFTlJ4clBVNGpHTjhVanBMKy9USnJIeUQ0akRvNHN6djluS2hINjlFck1l?=
 =?utf-8?B?bzNSR2pNTGtpTC8wNnI5WXhBT3JlY25rbk52T29DUnVNTWFUL050SkF3TS9E?=
 =?utf-8?B?ZmNobTk5MU9qUU5YK1EwR0NUNXpjdCtLZE00OWpiWDV6cDV2UTVVSjlaWWdX?=
 =?utf-8?B?R1Z6MnZWV0RjWWI3U1pnb2gwMUtoZkNOejhvM0xoeFF0QjVvUEdYWE05ZldZ?=
 =?utf-8?B?QVN0UUtXcFhnaURYTXlvVlBkUW9BcG1yc0tBYUVZOFE2SzJRUmRkaFhtdVNE?=
 =?utf-8?B?dkl0UVQrV09hWXJYTjJYUldBVC96TnoyUFgwY2tVQmozMkgrcHIwT0pQb29j?=
 =?utf-8?B?UWZ2SUJabDJyUjhGeW9ZK29aZk1FejJYa0tMNDVpanRTcVp0cUJnaWo2eldY?=
 =?utf-8?B?TjhYVUlnQVZ4ZnRRRlRpazl6N0dGWXRwMWI1M05MTnhaUDNxZTdqYjJGUG9U?=
 =?utf-8?B?cW1sVnFTa1UzTW1qV2pBL3AvcWtGNVAyZ3hFKzZuYUhhM2puMllNRG1INjhm?=
 =?utf-8?B?K2ZyVURxR1ZvMTlCRUdVSHRBajBoOTFwWGJPeExuRytCUWRTaTY4SDFtOXBu?=
 =?utf-8?B?TGpvcW5NU1BrTmh3RXhicFVuRklxV1J3MHlybzF5dU9kd3NBY3J5c3U4OVd5?=
 =?utf-8?B?S3k3bTRPTXpIRG1hK1pSdjk5alpVNm1xSHgyaHJwNHRTUjFUV3M5T3Y0Y0hH?=
 =?utf-8?B?ZFpQZktnMFhqZnBVK3RSdzdndC9Sc21IWFJjaG9QTDRQZzl3SzJ3Zjd2SHV4?=
 =?utf-8?B?R2RIWkIrWHlUWjRlQ3lTcG1xa0tLbTJMVmtmcEI0d3RaOUhyaFYxL1ZqOTdz?=
 =?utf-8?B?RDZPZnhqSGNjeWY5cmt6MEF4TUZHNmM4TmlMdEJXbll5M0hOMGRRVGVYQjlZ?=
 =?utf-8?B?UEpDRk5MbU9SUnNXNHlRUDBmN1hLckVMNHplUEQ4R2NNekR6aDBwa0RNcFN2?=
 =?utf-8?B?TWRxNzJhbXVXVmQySmYvQ3dvZ3pqdUJrU09GWDBaZmhUYndwWUZGVWx6T2RQ?=
 =?utf-8?B?MURZNWFpZWlWL3BXV05vak9OWldhWkRoVHdWcjNBalR2U1A4SnZnU3pUelFj?=
 =?utf-8?B?Qnp1UDJSeXA5ZjZER1JMTGNBYmNPSkdXaGVVSlk4bWIrMDJ5aEtoWlZNQzVz?=
 =?utf-8?B?RVJ5eWU3dDAvVGpna0xmRzBidVJwZEYyeHk3cDVTLzM4V0dwc0ZxN1l1TGJX?=
 =?utf-8?B?dG14ZGxSWFZIV1dkMmxoVzBsMHFraWNNSDZrWENyQ1RIM1FTV0pNZEZ5ZFdC?=
 =?utf-8?Q?JIfNxkVfmsBjM2Klro9cnfTkdLwkNNg+h9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 18:11:13.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6e05bc-1c49-4941-4caf-08d89ba4a642
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a4ILTO2KRIK9eMcm0CzzYon3xgjHvr3ntshHKYhTFIEeIOiXq7wX2RXoHwpNDEMGDPpOo+gc4yxIjOOyg5wzqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1181
Cc: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 alsa-devel@alsa-project.org, Akshu Agrawal <akshu.agrawal@amd.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 08/12/20 8:34 pm, Takashi Iwai wrote:
> Adding AMD people to Cc.
> 
> On Tue, 08 Dec 2020 15:01:24 +0100,
> Janpieter Sollie wrote:
>>
>> Forwarded from: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D208699&amp;data=04%7C01%7CVijendar.Mukunda%40amd.com%7Cc55d2e5a7fc8472e14ce08d89b8a9a5e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C1%7C637430367345025555%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=LnNjfKSgSFcozSegpZ52afwMtmK%2FE5AbcHwn0r49jdY%3D&amp;reserved=0
>>
>> Anybody who knows what this "ACP" actually does? what's its use?

ACP(Audio Co-processor) is an AMD Audio IP which has multiple 
generations support(1.x,2.x,3.x..etc)

ACP supports different audio configurations like I2S/AZ etc.. endpoint 
support.
Based on the platform, Audio configuration will be programmed from BIOS.
For example, to use I2S endpoint ACP_I2S_PIN_CONFIG is programmed as 
0x04 on Raven Ridge.
To use the AZ(HD AUdio) endpoint, ACP_I2S_PIN_CONFIG is programmed to 
different value.

On Raven ridge APU, We have upstreamed ACP PCI driver and I2S ASoC driver.

On Renoir APU, We have upstreamed ACP PCI driver along with PDM DMA 
driver. You have to enable ACP specific Kconfig flags for renoir 
platform when platform has DMIC support and it is connected to APU.

I see from the logs, you have tried to load ACP PDM DMIC driver but 
attached config file is not matching.

There are hardware differences in terms of ACP IP for both Raven and Renoir.

HD Audio endpoint uses open source HDA driver.

Let us know what is your platform configuration?
What Audio endpoints your platform supports?

--
Vijendar




>>
>>
>> Kind regards,
>>
>>
>> Janpieter Sollie
>>
