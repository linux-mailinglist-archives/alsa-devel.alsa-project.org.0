Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B312D4913
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 19:34:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CD4D16A3;
	Wed,  9 Dec 2020 19:33:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CD4D16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607538882;
	bh=xmS/CZMjM3hyBz42zfb955Wbq6BFn65pnKM79YYnjY8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jv4kazqYlJeVOHk7Jk/xYKE7CAyxMIrWvP1OeoIaVlp7ShJXA9T/TH9oYmZksei1r
	 Sv7s5aSMmPX9rp9BE+96NZAU9fULio+hKScBOmVo5uGXuYmplOALGOuDFPt+xx++8x
	 QPozUdFn8ddvP7GdYR5kKjPBD/lY4AL/WHR7WgHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78011F80217;
	Wed,  9 Dec 2020 19:33:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB5A8F8020D; Wed,  9 Dec 2020 19:33:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C643FF8012C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 19:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C643FF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="M6ijDzqh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8jQowPXVH4WOSpytfk55s1KKO5dp1odM7Jtwrn7WZKpKLEvYdC2bXf+ugSexDgG74H9P34hEM0bKjrcIRDFkcCteS3r3YiI0heeW3+rV1D6OlAUkRMQiqCuClrFOX0JHXMDoHNNXiHFa30Fghiqb6GL1n7go8tOsBPItoCU6QTVrB2UMTxkG8DfJgLVHt2XFVaqRd+/3xp50K/0xOE8sUgwqzCtK/5W4yZyV3VNYEsTlWNmD/NeA6ydHfgY9xhJp48EvrWy7mQjSLpRBnhMe0waST4xw9mn0xmQX9UzYvMrAn9t30791iHRYBUwg1OIeVYVJ/ylB4HlF+BuE8wx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H2TwWqteT5J/MQAO+yG/YJfXN7D+xBWv9oyDxHfwjg=;
 b=DPXMaN6Pc7RgrmNzFMqAOwT3xOwTcL82gS/RMpH8jLUmvo//+rm5oSqKP5RtfSNH2nqiEfbsyQYoeiC16x+iE5p27FhDfi9QZk6gIP+MMXEYwes3jvdYUekHmcdWImppV56HXy0tuvj2huCnb1uov35p3bgemBNg2wkil35VGTVy7M5xeudaS1UyCrjMtOlSw+Z5hchcdby12YUCTZtANWZNnTj/4Oa6e9L/NK2NdgEjmrakjfrXPsFc/l9nhbFTG8NhMIv1Snad1lS+Auj+4PVDwN1An65+E0Lghht9OBQ1/vIUW+a70sGqJgRK0PvUNuoo4yKdLUYqDnL7M8QZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H2TwWqteT5J/MQAO+yG/YJfXN7D+xBWv9oyDxHfwjg=;
 b=M6ijDzqhYRyBI7JKQMgcZYEEsrAUsoMQQjmfug4kZgs6UHioM7krPa2/H6teWgayXU0g7seGol+BjHve3ARA557LaEK9Jyga2HN1CoM5tg7qBZO6jraLisweM9qzAyAD/TVQGyiQ+eP+eZFJUAD8cpw5rkaRFTrVroMoq2fisGI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR1201MB2542.namprd12.prod.outlook.com (2603:10b6:300:e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 18:32:33 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::c02b:5213:d160:9a34%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 18:32:33 +0000
Subject: Re: AMD ACP raven ridge: invalid audio mode 2
To: Janpieter Sollie <janpieter.sollie@kabelmail.de>,
 Takashi Iwai <tiwai@suse.de>
References: <07aae8e3-1ee2-60a9-daee-a0172c1012e7@kabelmail.de>
 <s5hczzkwd82.wl-tiwai@suse.de> <d4e099cd-3600-43d8-d2f5-9f7257da80ba@amd.com>
 <99e81caf-2742-32a0-cee1-7ff3ea8c6913@kabelmail.de>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <3d8b7ad9-c6a4-0e2b-7e56-62b8d898eb23@amd.com>
Date: Thu, 10 Dec 2020 00:18:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <99e81caf-2742-32a0-cee1-7ff3ea8c6913@kabelmail.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.251]
X-ClientProxiedBy: MAXPR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:49::36) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 MAXPR01CA0094.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:49::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 18:32:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 35b512d4-b65f-4a1d-d959-08d89c70cb56
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB25429D5739BB9F45DF3EA33E97CC0@MWHPR1201MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7yI64u/4adF78MszjhaHBOgx9zJ7uGdQvzz/2kK9eWr/ZicU6uwpBx8bLoHt/RaU/lypdaI4xjQDN5Mn7YcafvbDK6cTGc5hZm6cVSFLh9/Fu6OP7nK74BekftZIglr33TH8hixQu7K2E1p/WwOKrY7tpACXQicNPlBmko418zG/DDzR7SR94YwD/lphtsUB8Ai9ecet9sGsRLCWORO60Q+OPJA26wh0GDDRqdRmQPk1VTgfaxh5uJn59Df/jjck/LwtWvKx21Yc/Bb+KFW6kKXHKaE8+/+pLcYkxKfw5uN1vdA9IFsah5Q0fNZU64fS+QD0yh+qQRdR7AdqXxMhI0I1mkMfM5x/fTzXPNzZnoPCv46DyPUBXEBb0v1/6dfEbSI2BuAZtqZN6qSwIYe23CjI4QsInzAoqdfJs0Y6m2T73xQWE2IQn7UJ71b+AjVWEdZtIDe5xqsRJF15nyBcLUeQ9UfaftRXLtjf8bNO31sr1SP7UYES7tczoaj0MIMD0mhiX4GmpDC5eXcqgvtiDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(8676002)(26005)(2906002)(66556008)(6486002)(52116002)(66476007)(5660300002)(508600001)(66946007)(45080400002)(31686004)(31696002)(86362001)(6666004)(966005)(186003)(53546011)(4326008)(956004)(16526019)(110136005)(36756003)(34490700003)(83380400001)(19627235002)(2616005)(54906003)(8936002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MTltKzd3cnpDTytwNmFJNGxoSEUrMXArbmhidHZQTWgwUjNsS0lzcVM5UFY2?=
 =?utf-8?B?MDhPTTFnaHFGU29KMHNvOWo0NXNjZ01KN0d4ODdZRTVnRVRRT3h3ZnVOSE93?=
 =?utf-8?B?b3VvTXJVUG9BcXpEOU9JZzdXMFk3SldsUUtCN2xwREJvaVcySlhwU0hiUFl2?=
 =?utf-8?B?MjlENWJaeDdsMUFOZzlhclljTHlFbnZGcmJ2dEpzcG1GZndJdG1EMDBGdXJw?=
 =?utf-8?B?NFdtclZnbmk3cGJNYlNnWVh4eGpudGdRenpKNzdON2VqK1BOTVNjY2IzR3pu?=
 =?utf-8?B?VGZDM1Y2ZFVVNDNzS1E1OTdSSWxvSHNFaUNiTDFNbXZHaWJ3UzVqbHduUERm?=
 =?utf-8?B?SGVNTGIzY2h4eS9QSkNwYTk0UWZpUXFwZHplbi90ZVdHNGpzd0xzbjRXbFor?=
 =?utf-8?B?SmxxUjBvb05ZMXk2WmdQWTducGVjZDlXS0RHMU1Pa0FhVHVIRWE5bkZ4WU1R?=
 =?utf-8?B?S0pTOVUyU1ZXaFRrWGEyM0I4ME9OcldsVmMxOXgyYjBhUks5cXlscHJBZ0ky?=
 =?utf-8?B?dnZvM0pZcXg2ZXpRNVJVcmxvMmhHMkJJK1RDLzlQSUtBS3BsbjR1OU5mRnJY?=
 =?utf-8?B?WllPSlRsU2dSTUszZnVPWW9adk83cWV4OWhueU1rMUZsdjIzWnhqK01DdWc0?=
 =?utf-8?B?VENHSmtiN2JHTWdja29JVmY2TDFwalJvT0lCeld6ck9SQXhuaERGZ0VWcnhZ?=
 =?utf-8?B?QkgxdWZTUThCYmNNQ2FuWUQ1eTJCZVJtRk5uVHYyZHpDRlA1MGxiQTE0VGNZ?=
 =?utf-8?B?bmVKazBFNktrdnRFNlFpblZRa1NhaVo0RFB3YmthMFZ4WU5yYVArNmxYdnJ1?=
 =?utf-8?B?TllOV1dvUzZianJMcFR6dVJieEw2RERJSTB1QllhdEs0QVh1SHVya0p3M1Zl?=
 =?utf-8?B?dWFGZStDdTlsaEovcTE0bHJ3ZElDMmRocGZsUS9uQ1pja1RZUWYvYkovb0p1?=
 =?utf-8?B?RlY4Y0xKVXdZS1ZBQ0d5T2RYNkY0bVpEVzRxOW94Z3htRll2bEM5ZFJPZUhj?=
 =?utf-8?B?SjRzNzI4bHZrRlNnay9WZUdBQUZOa0tEbGcyOVpKMzRUSEZLdVBwUHFuSUhE?=
 =?utf-8?B?NVdPMmNsazhJSkRMYm1xZm9JV09EcCtHTllmcVhDK0VJT1FmM2o4emFYRlVU?=
 =?utf-8?B?VTVXU1pJTnhZc25oK2dVNk42d1A4c1B6UkQ5THBoYXRub3doU1pqUDdHaWNY?=
 =?utf-8?B?UTlLZGJIWlFwbHhXQUdkL3oxU2xnNkY2emVCVFRBM0JScEozT0ZmZkhVMDEr?=
 =?utf-8?B?eUxiN0lTTUljVXpXVVlRb2h6WG5OYXJzSDdBQWYxamZ4cnZ3VDRPTGNvYk83?=
 =?utf-8?Q?3xQCvsLwdYh7sSHeVCXle2iyqecxqTi/+q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 18:32:33.3442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b512d4-b65f-4a1d-d959-08d89c70cb56
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBK7FdL0ZwCobtpnx8oX1e7Er0FazstftpL67j6X+neKFGOg//ru8bEep3pjdZLJcQpdF8FOpfCVkvR4joha6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2542
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



On 09/12/20 7:58 pm, Janpieter Sollie wrote:
> Dear Viiendar,
> 
> Thank you for your answer,
> 
> The .config file includes the following (no idea why the uploaded config file does not include
> it, you'll have to take my word for it):
> CONFIG_SND_SOC=y
> CONFIG_SND_SOC_AC97_BUS=y
> # CONFIG_SND_SOC_AMD_ACP is not set
> CONFIG_SND_SOC_AMD_ACP3x=m
> # CONFIG_SND_SOC_AMD_RENOIR is not set
> on a raven ridge, I believe this should be sufficient.
> 
> Indeed, I found the device on the PCI bus:
> 04:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Raven/Raven2/FireFlight/Renoir
> Audio Processor
> It builds the following modules:
> snd-acp3x-i2s.ko  snd-acp3x-pcm-dma.ko  snd-pci-acp3x.ko
> I tried to initialize each and everyone of them one by one, but all I could was:
> frisbee /usr/src/linux # modprobe snd_pci_acp3x
> frisbee /usr/src/linux # dmesg | tail
> [   23.326984] elogind-daemon[3633]: Watching system buttons on /dev/input/event4 (Trust 2.4G
> Keyboard And Mouse)
> [   23.327261] elogind-daemon[3633]: Watching system buttons on /dev/input/event10 (Trust 2.4G
> Keyboard And Mouse Consumer Control)
> [   23.327533] elogind-daemon[3633]: Watching system buttons on /dev/input/event12 (Trust 2.4G
> Keyboard And Mouse System Control)
> [   24.560093] elogind-daemon[3633]: New session c1 of user frizbee.
> [   24.803864] fuse: init (API version 7.31)
> [   52.527742] elogind-daemon[3633]: New session c2 of user janpieter.
> [  572.817028] snd_pci_acp3x 0000:04:00.5: enabling device (0000 -> 0002)
> [  572.817192] snd_pci_acp3x 0000:04:00.5: Invalid ACP audio mode : 2
> frisbee /usr/src/linux # lsmod | grep acp
> snd_pci_acp3x          12288  0
> snd_acp3x_pcm_dma      12288  0
> 
> So, if I understand correctly, the snd_pci_acp3x module initialised the acp to mode 0x2, and
> then decides the mode is not supported?
> doesn't this sound a little weird to you?

On Raven Ridge platform, ACP device enumerated by PCI root.ACP PCI 
driver creates child nodes for I2S device.

Currently we had added support for only I2S configuration.
We recently fixed audio driver probe failure issue when Audio 
configuration is set to other than I2S.

When Audio Configuration is set to other than I2S, load the ACP PCI 
driver instead of returning probe failure.
Below patch already got merged in to asoc-next branch.

https://lore.kernel.org/alsa-devel/1603476441-3506-1-git-send-email-Vijendar.Mukunda@amd.com/


Thanks,
Vijendar



> 
> Janpieter
> 
> 
> Op 8/12/2020 om 19:27 schreef Mukunda,Vijendar:
>>
>>
>> On 08/12/20 8:34 pm, Takashi Iwai wrote:
>>> Adding AMD people to Cc.
>>>
>>> On Tue, 08 Dec 2020 15:01:24 +0100,
>>> Janpieter Sollie wrote:
>>>>
>>>> Forwarded from:
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D208699&amp;data=04%7C01%7Cvijendar.mukunda%40amd.com%7C911b15bd9f9c43be7cda08d89c4eb426%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637431209140985281%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=hF0MK83C2tch%2F4vzTNnuIXH%2F4P4q0oSpAGDwkxB71lk%3D&amp;reserved=0
>>>>
>>>> Anybody who knows what this "ACP" actually does? what's its use?
>>
>> ACP(Audio Co-processor) is an AMD Audio IP which has multiple generations
>> support(1.x,2.x,3.x..etc)
>>
>> ACP supports different audio configurations like I2S/AZ etc.. endpoint support.
>> Based on the platform, Audio configuration will be programmed from BIOS.
>> For example, to use I2S endpoint ACP_I2S_PIN_CONFIG is programmed as 0x04 on Raven Ridge.
>> To use the AZ(HD AUdio) endpoint, ACP_I2S_PIN_CONFIG is programmed to different value.
>>
>> On Raven ridge APU, We have upstreamed ACP PCI driver and I2S ASoC driver.
>>
>> On Renoir APU, We have upstreamed ACP PCI driver along with PDM DMA driver. You have to enable
>> ACP specific Kconfig flags for renoir platform when platform has DMIC support and it is
>> connected to APU.
>>
>> I see from the logs, you have tried to load ACP PDM DMIC driver but attached config file is
>> not matching.
>>
>> There are hardware differences in terms of ACP IP for both Raven and Renoir.
>>
>> HD Audio endpoint uses open source HDA driver.
>>
>> Let us know what is your platform configuration?
>> What Audio endpoints your platform supports?
>>
>> -- 
>> Vijendar
>>
>>
>>
>>
>>>>
>>>>
>>>> Kind regards,
>>>>
>>>>
>>>> Janpieter Sollie
>>>>
>>
>> .
> 
> 
> 
