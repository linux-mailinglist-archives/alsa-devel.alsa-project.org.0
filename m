Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0275F2D0D16
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 10:35:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 738CB170D;
	Mon,  7 Dec 2020 10:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 738CB170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607333729;
	bh=yB2//7V8kSSfD64/pJH+8A9QrdJ/dpCYlb4X0NZbUG0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcPhigAVjopW39nX5CCE1OBNlK0iOeLVhPiPl3RfkGTwU0A4jKTVKyYnPGLBLRDVA
	 ZJdH2AxtLvyO98IvkqUt2iF0/EdQZWx0t2zWUJ6M7Iwxi7KAEpmtOI4d9RG1fsHbcx
	 q5y7DYcw+Gb3B4KHuWQjMzYE+DIHFmh/k8WrrMnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A0D2F80217;
	Mon,  7 Dec 2020 10:33:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEEA4F80217; Mon,  7 Dec 2020 10:33:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81020F8020D
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 10:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81020F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="yCt9fJD6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJPRc52tY0PZUE4UBrp3ff5YGo8so7I8OxWzSqO2Qw+1kfYBU49FhKm/82t7Gbe726ZS6LmKnM54M4jJrk2E/02k314Jsek4B0iHwinVIivlJSoTRSzx1HUQM85KJ+QRmX5D+Dhd+fhEh8GNORLOxIPHriCJzdOR9A5X9tZz95E4QuPdOl08PldVP4/Nv9iNRTCt/+hrm/R7CyNDn0KnaUrNpxWHhAqkwLJr14ZiPEje3E851ll3bEm6JevApr3rxfhPZQgFaptBjONWQkGAXMl4ecI1Oxp3sEsC/MbN70gnFQ1PI10gOABnwjHCCqrztsNMR+IFvYAq7srGAfSAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SBO3Mg1BlCr7wK0Ygaup2J5m8WdaVv8j24h4foRlFo=;
 b=nRbLn5m1TXWOw4qXxy1WTv4peNhFTgS3/tMpmQJ/VvvdnFpfAiaX0gONSdzTyDqgSsGymhFoa9h2D9R6iA90vz7e6YVAJhzeOnPTQFydM7sAfOFQvM2oBp1fvWbxlxq8D6sYhpFHDQWprd7KxYj+2ErfNKp9p0MVG0d4lE20/0umsBxlzur4jZsAo9FkmWsOoMd9plVsXUQXwGEoYuLvEriED3t7VZKkcwdJK58kH4/w3QxY96eGZyGhpfPD3L5OQ3n2hPpb5v6lcWGmadxRFOQ6M/8teNupa1UK5dyLvRrTjtXNaG6W4sXdWzMy3WSQbgaMTWlt9atUAgTabGrOgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SBO3Mg1BlCr7wK0Ygaup2J5m8WdaVv8j24h4foRlFo=;
 b=yCt9fJD6rp7i3FwIKjcq1rKyV7Nqc6Usi6HhAUgamL1UxynEyDL59+dQWius59ehR3fN1vzyZDN6wFuFUHbpBdE0gVlOI5nd+vXq99ipEfCBln3X6Ln97q0w8KUb2APjzVFhh5lsWO0EY8mvQDM+8qClPLtIdQIL96sq+Ofl/e8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR1201MB2494.namprd12.prod.outlook.com (2603:10b6:300:de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 09:33:38 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 09:33:38 +0000
Subject: Re: snd-rn-pci-acp3x - auto dmic detection unreliable
To: Jaroslav Kysela <perex@perex.cz>
References: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
 <MWHPR12MB166388C29409E3D488E5C85597E10@MWHPR12MB1663.namprd12.prod.outlook.com>
 <a7f011e4-0fb8-b861-ebc8-be6de0d46d50@perex.cz>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <86f7bb6c-21ed-f18f-2c9f-d86136898cae@amd.com>
Date: Mon, 7 Dec 2020 15:19:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a7f011e4-0fb8-b861-ebc8-be6de0d46d50@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: PN1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::15)
 To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 PN1PR01CA0099.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 09:33:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0e1f80b4-f580-4dfa-051e-08d89a932d56
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2494B365BC911630BD08387D97CE0@MWHPR1201MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OPzeIY+Thnanbbe1LgguBSkvlN6xMGOX3Zw7azvtJ4i6ncv4F7OMqeiTJS0N0KAKxL946GLAiUUyDEycg3hhXLMn0XkyCVrn7lkoNQ24opmgtjJ4ZKf57kztEN0AM3EZvglHPfZnOkYEARFaunGiGXd//WpzRE10/X7dNioJU9RWZfgER0pvmLZCjujsiCuENG02siGq/LlNEGGrdWI2IwTnfOwp1ISi+e1hJmH/pB5U174Z07I2kW+c3Dp2/pqW9XRBX9HARKN12rp12gt++4CHxQs4rHvGV1Cg8trGJLrXSirfu6/gBjkjD6+E1hl8t6QzSm+C6Qb+pyiAMXfL6GW4De8TAeR6uyPSsRKF2KJbrT0C7pwgsYOELzLvQVzs547Ec0hp8JBguOgd62Q/6lB2R8ufYgoYxEKffkv+R1SHPLNpoAEgtBH6fv8GWD+RFKfGBPayQDcDSuK7qolp7G0OqB8zisx0FfKAymiVMD5JumHGuhDLdXhz07NuZ3Ad
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(45080400002)(83380400001)(2616005)(31696002)(86362001)(66556008)(316002)(16576012)(956004)(2906002)(6666004)(36756003)(54906003)(186003)(31686004)(478600001)(53546011)(6486002)(966005)(66476007)(5660300002)(66946007)(8936002)(16526019)(6916009)(26005)(52116002)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aGtkcExlMUoxcGk4QnZlb1AxblZMdEVFSWNSY1J6YVFib0RIQkxoWlhoV3Q0?=
 =?utf-8?B?Rk4ycDlNMGwzSm1jemg1Yjh1eDNqS284K1NXT1JZd1JYMGltdzNFalpCaDZw?=
 =?utf-8?B?TmlIUzZISjlTZ0QzZVl3WmpERmdwMHhrbVl5bnBKZVFJVDYraWZsWm1FRldV?=
 =?utf-8?B?aDZjS1l6Kyt1WkpYUWVYaDRxWWFlOE5ycStodHRSSlVFNVgrWEhVWnpGV2Vx?=
 =?utf-8?B?bkc0OWxQemR1RDhKa3VMQWxndkVUZXAzUkZReE4yTGpWNEtuTjE3aTJqKzRK?=
 =?utf-8?B?NGg1bEZVOXZ2dklpaFBYSENtVWozYVVKYUtKRkNlRFdBQ2dTS0ZFWmlyVytl?=
 =?utf-8?B?NmdRd3ZXRHJwK1VUZFQwOEVTV1lxZFJ3cGdmMnZEOUxiNU1VVnVGT0NhcGdO?=
 =?utf-8?B?V09ZYldWRW5uZGpoMGZiMDNBckp1SkhGUk9GYkRFSk84cXNzeFNrbW5lSUEz?=
 =?utf-8?B?OE1YaGNtYmhiM0hDU08xSm00ZnowSUdRYkhCcy9ONjVzWFZidkZ3ZXdLaWx4?=
 =?utf-8?B?WVBvVEZ1NW1RaEQzSUZpNG1DbEUyUE12ei9DOGpaWnpRQ3FpT3NwYlY0clR0?=
 =?utf-8?B?bXdhMlZzWmdpZ014VDV4eVBmenF4emYvbm1lSGhYWkMvL2dpaElkWXdsbXZ4?=
 =?utf-8?B?SGRsdkl6MWtVR2NsNC9CU3IzSURJcmVrYlIyZXFOTXh6dHNHSU1EcGlGd2dU?=
 =?utf-8?B?WGc5TUhicjBVRmlqaklPZFVFN0VNcmYvYmRKd3VCc0FYaXZOZy9xRWNWQVJS?=
 =?utf-8?B?Z3gxMUJpcDdFZUVncWVXQ2VwYTlSQ3BidGN1SVRkM3A0dktNbEdzOUY3d0Rj?=
 =?utf-8?B?bkxDSmIxRVZNSXdvdS9ZRldRUzY0R29vSmN2dUV3cER2Qko3dFR5MWhuNFpN?=
 =?utf-8?B?WG5ZT1plK0ZhbzdUUGlnOWdoMDN6WkhqSkF0a2MxdUhzUGxsZzFpZEpjZ2ZI?=
 =?utf-8?B?WEl3YXRFUEhHSnpBandmY3NUY2c0MU9mY01jWnV0UEZYRUMwQ01KYk1IZUd6?=
 =?utf-8?B?T2IxREM5UHdFSElyR0NXcnBEbThEMkJyZFl4ZkJrYzN4NnRRSXp3MkJwK2JS?=
 =?utf-8?B?VVFheHE0cG50cktuOFQ3K0J4bFJ5S29vaXZ3anAxVkg2VExsU1cwN3pTQWw1?=
 =?utf-8?B?aEszZmJqQ2lYNnNqbnc2TlBVOXhDMjVVOFRGRnpuMWk3S05iM1FLZW5La1F4?=
 =?utf-8?B?ckVrQXp2L1l4eDQzRTltWVd3Y3FmeXp4WnpCU3F0SkM3WUlVcXdVTkVyMUFW?=
 =?utf-8?B?RUFtcEVJdDJQSFI1VHVQaUJIR1ptU3U1NGd3eTI0WmhPTUVKZGozNk5WNmlW?=
 =?utf-8?Q?IY9NIeEXD2w2gwE4UE2ZzxrAsdBYnDgJq1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 09:33:38.2718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1f80b4-f580-4dfa-051e-08d89a932d56
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6lgUzav0VcW9rRpCFrKAjhnVyh45EnQwrirmZtG8wBHXN60IFi92UyRHFNf4m1SlYqjlSY4ss4MorZxGa0a4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2494
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



On 07/12/20 2:22 pm, Jaroslav Kysela wrote:
> Dne 18. 11. 20 v 10:25 Mukunda, Vijendar napsal(a):
>> [AMD Public Use]
> 
> AMD: You just replicated my original question without any answer (2 weeks+).
> Do you have something to share or do you not support your code?

We are already provided reply on 18th Nov.

_WOV integer value should be set only when DMIC is connected to APU.
When DMIC is not connected to APU,  _WOV integer value should be set to 
zero by BIOS.

  DMIC doesn't had auto presence detect logic on AMD platforms and DMIC 
connection to AMD platform is simple wiring.
Whether DMIC connected to APU or HDAUDIO codec can be decided by ODMs.

ODM BIOS has update the _WOV method value based on DMIC connected to APU 
or not.

-
Vijendar



> 
> 				Jaroslav
> 
>> -----Original Message-----
>> From: Jaroslav Kysela <perex@perex.cz>
>> Sent: Wednesday, November 18, 2020 2:37 PM
>> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
>> Cc: ALSA development <alsa-devel@alsa-project.org>
>> Subject: snd-rn-pci-acp3x - auto dmic detection unreliable
>>
>> Hi,
>>
>> 	it seems that the ACPI auto-detection of the presence the digital microphone connected to AMD Renoir audio bridge is unreliable. It may be that hardware vendors do not provide the correct ACPI tables.
>> 	Could you clarify the usage of _WOV integer value? It seems that this value is set on those plaforms which do not have the digital microphone (the microphone is connected to the HDA codec):
>>
>> _WOV integer value should be set only when DMIC is connected to APU.
>> When DMIC is not available, _WOV integer value should be set to zero by BIOS.

We are using
>>
>> Lenovo IdeaPad 5 (15ARE05)
>> Lenovo Thinkpad X395
>>
>> 	In any case, we should probably improve the auto-detection using DMI or other platform info.
>>
>> 					Jaroslav
>>
>> BugLink: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1892115&amp;data=04%7C01%7CVijendar.Mukunda%40amd.com%7C99b9a10b76674aa6a28a08d89a8d75fc%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637429279661047562%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=CpZLrKf4pVdN6MmnmWUnXCLevFjySGuFW%2BJeLoYW%2BjQ%3D&amp;reserved=0
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>
> 
> 
