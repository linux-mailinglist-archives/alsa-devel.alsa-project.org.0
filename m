Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 297DB2D0D25
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 10:37:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0104174A;
	Mon,  7 Dec 2020 10:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0104174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607333871;
	bh=rLWuwBvkj4ObbE+PzStejtcmzI3Zx3YnBGuI7oIBE2Y=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RwCYDyJ10XvSqonVzBNJmTfqlfAdkVPx6EMJQGMojSB0NvaVsKDBHrnAhyFWqAamF
	 9yZRLr3HD1R+qklLs0+gvSXcnNmja8YZLoIQPzBb/XxX/oy3CuvxhkhCc8A6fcEmx2
	 LhQAw3YIEtBUfGOMW8ATytBfdIozoCExT4Dgps7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEEC1F80217;
	Mon,  7 Dec 2020 10:36:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA9CEF8020D; Mon,  7 Dec 2020 10:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1FD4F8015B
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 10:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1FD4F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="inU1e1/4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaK7q1EwZRUNyizxgY/bnmo5NoLOg+urB0r06JpgC0Nxm5wScDIiqCMTszc3TfzHOzCB0JqS0mcyYRTP1Fvy4IeUZMnwxfxJy431OjUFYcI1PSp0v8jUdoYnB3ay3b9hp99C1Ag4OQe5S0vZuR1ixT6KhHKV4jnkk7C8xMNs5xz4B3U2HY4Ml5Klj4myC6lDlcyHABFR6aI00CtXKcHJwaFrLhvF4OsU5+BMayea5DTWXN+GV9crRjDwmJnWSQ3v/A/EBd0rfnKv03R7ZnZwj2Ov68pLDZ1QbwDPbQYLOV6q4c2MjNfXR2c270At6irHOogiw4e5svzOCXYCJ5rDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5oNFBIDnH55pzGVYKAI1rsDhOMiGhNoq84LKJa2Snk=;
 b=gwnxOwH6x260XyG6Y+Eh3zphLhNRhFZiW94+QNqqmQCdC9+yOdbmDm/qaZ8y0HFYnWaOlzizNjb14CN18+kr1TXm+tWNRNq8GhzWQbMd1JjAYK8R2dC63WpnFWMzkd1Th+48KRPPeG98Q8/Upx843l4T6JiN77ThbJHxZAoBbOuUHDbUm1eYQE+bEPQ+F7nbmivX+XVQj99OKzitG91a7ENLoqudV0UQgf4Vn8D6QkwzKgD3Lq072wM8jmBDTbJKftnTyq5yNk+CjWgB+eOioPU7DNxdLuxeLb94h3IuGkXTmJMOkAQNy/fzygal9dhmba2aE1IoHo7lilIzIX5NXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5oNFBIDnH55pzGVYKAI1rsDhOMiGhNoq84LKJa2Snk=;
 b=inU1e1/4MoWE6Q1e0qO46z3CTdNPmJGNvQMVBpHZ1UaFl6wZpnYgDv+8AfkmCYWgFO1I1kbU4QO5fhsPZkmeokA1VHPo5ScTpfcIYtG61lEwtPSjBhn5mvdrdRi8WByq5x7xXAAUEP/bz5bWlz2fHN20TVS3AOkFkYRJE1BLIro=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MW2PR12MB2522.namprd12.prod.outlook.com (2603:10b6:907:f::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Mon, 7 Dec 2020 09:35:56 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 09:35:56 +0000
Subject: Re: snd-rn-pci-acp3x - auto dmic detection unreliable
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: Jaroslav Kysela <perex@perex.cz>
References: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
 <MWHPR12MB166388C29409E3D488E5C85597E10@MWHPR12MB1663.namprd12.prod.outlook.com>
 <a7f011e4-0fb8-b861-ebc8-be6de0d46d50@perex.cz>
 <86f7bb6c-21ed-f18f-2c9f-d86136898cae@amd.com>
Message-ID: <c893265d-f71f-9be9-1bf5-879ff26d13fe@amd.com>
Date: Mon, 7 Dec 2020 15:21:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <86f7bb6c-21ed-f18f-2c9f-d86136898cae@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::9) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 PN2PR01CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21 via Frontend Transport; Mon, 7 Dec 2020 09:35:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c818732-f3dc-4367-86f8-08d89a937fd6
X-MS-TrafficTypeDiagnostic: MW2PR12MB2522:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2522CF9B4F05415FD2F6436997CE0@MW2PR12MB2522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tUgoSSGfFVyKTR8/UcZkEFxWJb2U6Cnzwu52W6Zs9g+JXAqnV7WMevgELFZIlK1wpxBPqfU/Xmt1WAg3RaWrIBv76YhtPRgVLaZ2Hbz7GfpvVKcsRRWb4OCFN2ffkZUEzOkt6DsX9CxZArcsWl1VEqJY1jUuU/xF7xJf7gC5xoSyE3mgnJVkDBWfZJAhlTLcNBUyuqzA1NSYaGguC0DDjgGSKb9eWVfClLpp7ZDOLqjWkUhu/VDEKrBvnJ298kQ80o3tUWpYbqnKBXHwDdAbKQXxV9qOxwjTJ6b0/uuzfVftitipgHjEICZmkJ3N3SFebiL/TElk6LEyRjQsNmoU0jA6ZSLDT3b+kw++yOU0TYUPlulseR2allWoNTx+J/KAdYI4vjYFMpzsHa76M2ApxcDSHyBBMiURqcC4s89mJEDBRlal6iNLdpGz7sw/JHH4LH0G53DDnsEFhbb7hemdJHfBAXPbNdyQg8XB+YrrZBQkPryj5foT366Pkzak6iJs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(366004)(2906002)(26005)(31696002)(956004)(45080400002)(8676002)(5660300002)(6916009)(6486002)(4326008)(86362001)(53546011)(31686004)(52116002)(8936002)(16576012)(6666004)(36756003)(66476007)(54906003)(66946007)(478600001)(16526019)(966005)(316002)(186003)(2616005)(66556008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SnIxSVYzdVZHa2VsUEdSbkw5YkVFUG80TzdqamJUREdJYVJUYjNUUyt0VkY5?=
 =?utf-8?B?MjEzQ3gyc0NZN3pJVWdUWnFrdVl2ZmxaWnlzNHJaUGhodkpqbFFPQjZHV2pT?=
 =?utf-8?B?OURadEM3WFU2eFMvcWNaR0VPekhKbExKN1dYTFJRVkNzNHJST0JoaWJSUmtZ?=
 =?utf-8?B?TFcyWnBDZGowVFM5YiswRmFMOG9XRHM3VFhueWZjbkxRQ1htckpWMlR1ckg4?=
 =?utf-8?B?b1J1QzZDbjI3UElzOTZLN2VubVJza0U1Rnp1RzYyMWwyQndyZnh3a05HZnpG?=
 =?utf-8?B?WVdQUVpHMDNMWWhlUUtLUFlmMmgzOXpOUHN2NEptUW5XREJuNXBnbVlhZFhN?=
 =?utf-8?B?NVdFenEvaEZMVzhkV2xaTUNQcCtqZ3NvMFJZWGVlNExTdWhzaXNIekZvTlJ6?=
 =?utf-8?B?M0VYdXdRbE94cHFCR1dRSTYvVzdQYzFqWkhUeURXQTdIQW5XS3drVXRMVTMx?=
 =?utf-8?B?RHNJY1J6Yk00ZlIwc0pLc0U0WGgvVHc0SjVudHpBMUErTnROWk5idVkySnJQ?=
 =?utf-8?B?Mk0xQ0RHM3FSK2haUHpSM1MvdU5wMUhNcXNEb1Z0VDFnSXJOcUZtSDdhRzdR?=
 =?utf-8?B?d2hPYlJNdTFCejQwYzVTL3pHOS8yNzdlTklzWENhRUNCZHBlQ294aGRnSkNG?=
 =?utf-8?B?WTUxd0dNL1ZvODhXUlZQUk1xSUd3Zng2L0hpbWh1dzZsRHcyYmdaMnROSmpU?=
 =?utf-8?B?TjhPcm04a21DVVFBVXYydWtIcm11b3hEa084KzhMbVJBdkFlVDZkY3J0c1pk?=
 =?utf-8?B?TTd1eHVLck5zWjdXMnNjRmtkYmVLR1NTZ0gxeUNSQWd2blRaSUxkVHZVSE1l?=
 =?utf-8?B?TmxEZk4vWkRrTDJBMEIrd0FMVnZXcURtOStlU2k2c1dnOEpjQkRmV1lGaUV2?=
 =?utf-8?B?UlJoVzdJS0hWblpzSFV0WVJpWEtpVmlRN25RR3Q0UXlzMFlPT0xYQnNXd0ZJ?=
 =?utf-8?B?b004L0c0YTVLWTZHVGVDUHNHV0QxSTFRU2EzM0l2RVl6d0VLQVRKcXlCMUlF?=
 =?utf-8?B?Yitrc1VIQmFwSHV4S3dKa0N3NFQySHMxLy9jS3llMFNlTTlDNUpibk1BYlBG?=
 =?utf-8?B?VGx2YkdaL3FaS1BzdnF2bTZIMFUzVC80WEtjNFdPenVWdU5Kbk85UFczSEZr?=
 =?utf-8?B?YUZpaFhoaXRnaEl5Z3ZkaUI2UkppSGJzZTZ0UzE0ZXN0djFPOGpnak5DZzNr?=
 =?utf-8?B?UFBGT0JvNEoyQjlPclgwRk5ISFY0SWV0a2VrMmZFTlF1ZTNoeU5NVGtiSk9y?=
 =?utf-8?B?RWZycy90ZHZERFJScG1rN2tpUlkvRGZaOWpWWTBJUlBIdVU4VzZMQU9qUkhH?=
 =?utf-8?Q?yas8x4GmFlG+2K1PMEvpnw0KeLOoASTlaI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 09:35:56.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c818732-f3dc-4367-86f8-08d89a937fd6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FhQtu0ZCm1LC7ocq55/NQJi42G6DmRCm2Y/wO+PjqfPZ+xMNQQJ7sTfbLaSou6yNZN7HSmINkiTlNxK+meZiSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2522
Cc: ALSA development <alsa-devel@alsa-project.org>, "Kandimalla,
 NagaMalleswaraRao" <NagaMalleswaraRao.Kandimalla@amd.com>, "Arya,
 Virendra-Pratap" <Virendra-Pratap.Arya@amd.com>
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


Corrected typo error.

On 07/12/20 3:19 pm, Mukunda,Vijendar wrote:
> 
> 
> On 07/12/20 2:22 pm, Jaroslav Kysela wrote:
>> Dne 18. 11. 20 v 10:25 Mukunda, Vijendar napsal(a):
>>> [AMD Public Use]
>>
>> AMD: You just replicated my original question without any answer (2 
>> weeks+).
>> Do you have something to share or do you not support your code?
> 
> We are already provided reply on 18th Nov.
> 
> _WOV integer value should be set only when DMIC is connected to APU.
> When DMIC is not connected to APU,  _WOV integer value should be set to 
> zero by BIOS.
> 
>   DMIC doesn't had auto presence detect logic on AMD platforms and DMIC 
> connection to AMD platform is simple wiring.
> Whether DMIC connected to APU or HDAUDIO codec can be decided by ODMs.
> 
ODM BIOS has to update the _WOV method value based on DMIC connected to APU
> or not.
> 
> -
> Vijendar
> 
> 
> 
>>
>>                 Jaroslav
>>
>>> -----Original Message-----
>>> From: Jaroslav Kysela <perex@perex.cz>
>>> Sent: Wednesday, November 18, 2020 2:37 PM
>>> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
>>> Cc: ALSA development <alsa-devel@alsa-project.org>
>>> Subject: snd-rn-pci-acp3x - auto dmic detection unreliable
>>>
>>> Hi,
>>>
>>>     it seems that the ACPI auto-detection of the presence the digital 
>>> microphone connected to AMD Renoir audio bridge is unreliable. It may 
>>> be that hardware vendors do not provide the correct ACPI tables.
>>>     Could you clarify the usage of _WOV integer value? It seems that 
>>> this value is set on those plaforms which do not have the digital 
>>> microphone (the microphone is connected to the HDA codec):
>>>
>>> _WOV integer value should be set only when DMIC is connected to APU.
>>> When DMIC is not available, _WOV integer value should be set to zero 
>>> by BIOS.
> 
> We are using
>>>
>>> Lenovo IdeaPad 5 (15ARE05)
>>> Lenovo Thinkpad X395
>>>
>>>     In any case, we should probably improve the auto-detection using 
>>> DMI or other platform info.
>>>
>>>                     Jaroslav
>>>
>>> BugLink: 
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1892115&amp;data=04%7C01%7CVijendar.Mukunda%40amd.com%7C99b9a10b76674aa6a28a08d89a8d75fc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637429279661047562%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=CpZLrKf4pVdN6MmnmWUnXCLevFjySGuFW%2BJeLoYW%2BjQ%3D&amp;reserved=0 
>>>
>>>
>>> -- 
>>> Jaroslav Kysela <perex@perex.cz>
>>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>>
>>
>>
