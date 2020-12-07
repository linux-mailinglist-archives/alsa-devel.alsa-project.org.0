Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B6D2D0D70
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 10:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8741F174E;
	Mon,  7 Dec 2020 10:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8741F174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607334841;
	bh=8ycil3MDyvu21o0aMBAlkqEvWiBOWhw/uSv9dkehmTo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=snaWrhlVom52cjnuIe5Knx37LDPhGwC4jBo2Mz6Whne8/jNUg5kKsrr0teINWL7mN
	 TCQgcrVqsGI2O1KW0c9tUV3kBs8M0PFGwos4Xi1TtsCHcilbw+liBbzu2IuvUbjg49
	 ctTedXpL2+0AAueKCBRlmp9AZgHgXyNJPGdzWzd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8902DF80217;
	Mon,  7 Dec 2020 10:52:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA909F8020D; Mon,  7 Dec 2020 10:52:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770058.outbound.protection.outlook.com [40.107.77.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69A86F8010A
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 10:52:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A86F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Hw+eFzoT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2pYEt26MLChpbfDmXkP1GCY1c6dNB4FNuLai3fjBCgNx9Qd1cV5PEMH3xj9yn0dvCtJJOstNqtFB2mysrhqqrnEG8v8Is73oWZm4rAKpaPUMxKh+zE5Rv58XO7vVS+3Ow0jJ33KMOdXEUgvdPWUdLq1jUyFL/c1yr/9pLVfXCdfgmjTMwLNSVx0uCYuWTcoyVPkUZx6l81TnPGXXypQwO6owH8xMZI+0xBB8THQoxN2QQhSrBZUCEfNCsKYNn36DSeNV0KBXUfTD5cQ/WRNk/vdoOmwCqPoYmNGF5MtXUr0iArBCLaBL/RIVcEym4i7qkaKdPYA84wDyltilLPsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+prTZfx+S8yY/O3wZZ7DWYecm1oQe7m0Ah8CO99kqbg=;
 b=TBLEyv2fbSz94c4eU40MAYXBiCWG9E5m0lj3Q5KPqinuLF7f65z7zWQ90qe1CYSPBZYpUyDdRyBnGS7c76ZTnL9TvOATlPqfk/tuHOOHdnYPgv/vwsHCjs2+lBLrrJxvZjRc2ASRk/+F2zCi9TecXYHnQ5GwNqIBwqb8kuBojJwK91Z1H8Qkj9UnAvdRg668jj1R7xBdxXoSL6S0U9LBuLmtLrYqxfxQGGzwh6vGzSOqLvP8ciZs92RSv81EvHKaT9H59oCzhRgNNrMmP2MR2xeqRyvkAgobiWayTBNWmqiIi2J0L+g66ZSPSyZHM8qn1xONSmIXX1+8L3vj+Hrbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+prTZfx+S8yY/O3wZZ7DWYecm1oQe7m0Ah8CO99kqbg=;
 b=Hw+eFzoTwrmFECS/pL67nHa7MtYI9lEkUkK87piS524BcI8Av1NKaL1RpeKc/jbg1qFjshM431CvFKsBDc7QcYTzABm97yligixIB7bkEgFwmS6KXchm5mFmoTQOcHvSehQzqsCbfKwtQqQd13RVg3gcu3Hf0v0QP3Ui2zl6+T0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR12MB1520.namprd12.prod.outlook.com (2603:10b6:301:f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Mon, 7 Dec 2020 09:52:15 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 09:52:14 +0000
Subject: Re: snd-rn-pci-acp3x - auto dmic detection unreliable
To: Jaroslav Kysela <perex@perex.cz>
References: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
 <MWHPR12MB166388C29409E3D488E5C85597E10@MWHPR12MB1663.namprd12.prod.outlook.com>
 <a7f011e4-0fb8-b861-ebc8-be6de0d46d50@perex.cz>
 <86f7bb6c-21ed-f18f-2c9f-d86136898cae@amd.com>
 <c893265d-f71f-9be9-1bf5-879ff26d13fe@amd.com>
 <7cdfd2fa-2724-b42e-116a-f8697834ec4a@perex.cz>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <6e5b5101-8644-6d01-83b7-26b857766575@amd.com>
Date: Mon, 7 Dec 2020 15:38:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7cdfd2fa-2724-b42e-116a-f8697834ec4a@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: MA1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::18) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 MA1PR01CA0102.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 09:52:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbdc7777-cbfd-4bda-8a04-08d89a95c6d4
X-MS-TrafficTypeDiagnostic: MWHPR12MB1520:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB152075FF1F55C131D31B6B0597CE0@MWHPR12MB1520.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2P9uUODYFz7BO+e64ToMPZe0gfnBCH8gGfoUgz6LB7r+BFAbJ+/jxo3m7kNqUvQTI1qLeVO5Ihng+XkejadqLy3TTOot2h15cKnyIKSdAd1pCinUWwA4lM4Tknqxbzo/al8rl0e/BR1hODSieTkdRC7/feqJqQcjB/cWRZoNPFt5ZvYceBHJZzSpguqMpywI0KuZBDlD1v5dSiQuH0j48BBC5/i/e+tLY8rgLq/L0499EM72EP7bTAg1o6FOwTmduHD+GXD4bZuNGK4ZuSqN0c8YH6Vzw/Suu05P1pOhKU6Pc04cc67BDJDJh7zorH1c10mq4gmAlveapzIiEk7LASZU8mXv52mn1K7uJAlZXWvknYbHLlNQ5ZDvXoGxQy4wpcS670+gpFJt/k2iTFAuOW7hDCjDc0Mk6s8VFD+pwqgi1ouayTtCtNmCUPvNl0bFjzD9Tpcom6fq7i/1ZTAbakDfXQExpZzolwD9et4IKxCsxhJmShG0Hfi/hN/oeAe4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(83380400001)(478600001)(186003)(45080400002)(5660300002)(52116002)(966005)(6486002)(6916009)(31696002)(4326008)(16526019)(8936002)(36756003)(8676002)(66946007)(2616005)(54906003)(16576012)(26005)(66556008)(956004)(53546011)(31686004)(2906002)(86362001)(316002)(66476007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZnpObCsxaVNHM25pZnl6dzhNWHgzSEQzWEQyWVRXcUpBam8rQUNxbUpla3BW?=
 =?utf-8?B?U3lKNjM2MFRYQ2ZGU3p5RWk4R3V6NU10clp2MnRObFpjcGtpNHpxYUFSbndi?=
 =?utf-8?B?NmdBWHU0SXgzSlNsa1BqaFRMYTEwVHRYbTdrS0E0Zjc1WTJBVUdSV3JLM3Nq?=
 =?utf-8?B?NWE0bzRtSTRXeWh3RVdKSFg3d2h4MXFVRHVWa3dJdFpBVWE3NXlqcFFZL3VB?=
 =?utf-8?B?UVpkdER1WExhKzhsU0Z6Ry9nSkRuNzgxMUNVRk9SaVVwekpJTm1GOXlLZDJ3?=
 =?utf-8?B?RVVpRTFjVzR0NVgrUURZUm4xeU04TUgwODJsS2M0Vmhhc1ErOVBPNjNuRndW?=
 =?utf-8?B?aU1mOVRUWFVvUzRWT3JOUlVjWFBqOVZxUEMrcU10cjJSRENVNDlnNVZ1RWth?=
 =?utf-8?B?Wkx4c2cxNEhWZG9KbUhmSVV1V3ErUDdmbFFhMVl3RWx1UFV2eVVEOEE4dEN3?=
 =?utf-8?B?MWV1ZkNQWDl6d0pRZCtGZW4yKzZua1Q5TE1pUVpvRHgzOHUzcWJiSVlEaTNw?=
 =?utf-8?B?ZWRWZmR6T2s3YTc3d2w5RFBrc2t5ZDBsSk1HTlhhL08yLzJpd2JyYk5DeGR1?=
 =?utf-8?B?Y3B1MHI0MnFoWFNSMnppSTNWRWZZb0c3NHhnL3RPc3FIc09odDQyUXBoTFEv?=
 =?utf-8?B?c2hkc3hFTVJrcG4zRkVhTEJBYkpxZGR0SjNGS1N4TjdXZnUrek5lcWVXR004?=
 =?utf-8?B?MnpTRFVoT3puWkpWcnp1RHZGQkJyYWQ2Y016dDladEliVXJXWTFFMXE2MTBu?=
 =?utf-8?B?dS93QW5tQzRwNUgyek45UGFKOGtaNC9PV2J2WjYvRzU0djgvcXpLSGdkN0JR?=
 =?utf-8?B?SVQreFc0Ty9HMzArQkY4UWM2ZkZudWxja0VVRkozSHZPV0dGOEY2U2NNdEty?=
 =?utf-8?B?czc3WjFBWlF2S01UVUc5Szh3RGFyZFhVSlVGb3FGbW9NV1Q3eFFCTFZEa3hw?=
 =?utf-8?B?VDhzdTRsUVAzTDQvZGZFS01yL2JiTjVSUE9NektYYWdlK25sLzNtK25nVVl5?=
 =?utf-8?B?blVzT2p0WjEyRjFCTVhLRldocGFCQ1hLUkh0cHFPbnQwNzhhak1jaUNmcExw?=
 =?utf-8?B?SUpmWUZVSlVOcjYxZEhhanVFelM0eWlyb28zR2UrdmJQSGhaTmRqUW9vOHBE?=
 =?utf-8?B?azZIcWwyajB5MHVIb0JCSzA5b3RzYm1tRzh5SmRvVEg5eVFpcytFdCtvZFA2?=
 =?utf-8?B?a1lDdERNeitYYTZtTWlaRFV2cy96YXY0NnFHUU1nTE8wMGNxUFg3WWExWnp2?=
 =?utf-8?B?Um05TTBoVTBPampiVlFXVnlpTENoZkZrcXJQUmZoWjJFU2VRR1pzMUE5N0FJ?=
 =?utf-8?Q?UVjDo+mtfvR3KowGcjBz/h/Kutm0mH0myJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 09:52:14.8787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdc7777-cbfd-4bda-8a04-08d89a95c6d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RYSKVnXUTvcH7xwN5WpG4x8SeuwYvR6KX9ODeCdsqkAK/u8oriW/4//e4Cl30kSsAS5O9DnyFXWEj5dV4xoulQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1520
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



On 07/12/20 3:15 pm, Jaroslav Kysela wrote:
> Dne 07. 12. 20 v 10:51 Mukunda,Vijendar napsal(a):
>>
>> Corrected typo error.
>>
>> On 07/12/20 3:19 pm, Mukunda,Vijendar wrote:
>>>
>>>
>>> On 07/12/20 2:22 pm, Jaroslav Kysela wrote:
>>>> Dne 18. 11. 20 v 10:25 Mukunda, Vijendar napsal(a):
>>>>> [AMD Public Use]
>>>>
>>>> AMD: You just replicated my original question without any answer (2
>>>> weeks+).
>>>> Do you have something to share or do you not support your code?
>>>
>>> We are already provided reply on 18th Nov.
>>>
>>> _WOV integer value should be set only when DMIC is connected to APU.
>>> When DMIC is not connected to APU,  _WOV integer value should be set to
>>> zero by BIOS.
>>>
>>>    DMIC doesn't had auto presence detect logic on AMD platforms and DMIC
>>> connection to AMD platform is simple wiring.
>>> Whether DMIC connected to APU or HDAUDIO codec can be decided by ODMs.
>>>
>> ODM BIOS has to update the _WOV method value based on DMIC connected to APU
>>> or not.
> 
> Thank you. Please, format correctly your e-mail messages, do not write your
> answers inside the old text without '>' markers:

Sorry it's my bad. Due to limited access to my linux machine, Last time 
I have replied from Outlook server instead of thunder bird mail client 
which resulted format related issues.

-
Vijendar


> 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fmailman.alsa-project.org%2Fpipermail%2Falsa-devel%2F2020-November%2F177218.html&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C9aec4eab94f2443adc1e08d89a94cfd6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637429311243402463%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=wn7KBu8KbQOWaR9PEnyDwbLR%2B%2B86Z2xFRAnyUy%2FN3YQ%3D&amp;reserved=0
> 
> I just overlooked your lines inside my forwarded message.
> 
> So the problem is that the hardware vendors do not do the right job in this case.
> 
> 			Thank you again,
> 					Jaroslav
> 
