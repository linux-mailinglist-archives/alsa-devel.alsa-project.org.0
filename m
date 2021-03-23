Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E2346796
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 19:27:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9350D1678;
	Tue, 23 Mar 2021 19:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9350D1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616524062;
	bh=QGwP/xPhl21Vi4HRtybpy3cQOsB1yG0W2JE9cjIf9q0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oxnLuMOaHNabndoTtGIKbv/WYErv6UlK5t5PD8Q0/1RK8Twnm/5vLf5UTaI8SqUjy
	 U9Du2My4CjsnQYxCvtdsgVvjZNgO8F2Qsktc1n4YzKpCXlaawNFQmeDvmMed0n5ZiW
	 UwQfCJ+7JbEt4JMYfeTkkUHbuV9VjhhtmnYa5M7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9855F80104;
	Tue, 23 Mar 2021 19:26:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B572F8025F; Tue, 23 Mar 2021 19:26:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_13,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2A66F80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 19:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2A66F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="4MPpe9BZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDOsjuypDGY6TQCU27gFrOiialKs00kAfcJ+jDTEb/q89nPbBCbcOUUNVfLHDiDuj2wBdL9zOsSdKYCFSgXylk64lgHDKvZZISgV2s+15qXtHsID5Z4c34FAoXD000hsx2IEt1nm8eenx1U4SjlgvQ1GrqcOhDM4KJIYBJCtQjCuVcX50puxf3FjV3Wf8J3176MLYD0T/GTknRB9mq/F4WprDjyxwECF3g30UNxNgFgkxHTvkH1H+zxObVkI6jY6Gapg9ggLTtqI+5SjFOSoWsKDWE4R5biL7wWpUrFiPgHc7Ur2hOh2M7rJKVgJm6pWCn2hkcr+/7yAHb+TpmmuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5phIhF+s/gGWDocx/mGX6jiidJskmKOZ25XQNeCHcQo=;
 b=Fexj48RYi1Tt1XZyj7yI7nykKKBK2eAYrA430aKLmMFGIu/mgNqJ0ngvtNDgvdrEwc64Q18CCG4h7qiyNT2t64dFi0+GRzpy1uJcIS5GfB+zNbA5t9HiNx+EtU+CxWUlCGR1dZ8AWycnOv89xAVFPVDX5KS1n3rgTUQrITrPYsQBKuvkAv7KbhhaL8A4QUoxnLigTOI4CscxyshOmew9dX0pERcRthILWU2J4mXjRTO/LhR07Zax8ugl6JjUier3sBbJ3d/UqLH7YtKrXi79AR0qDn4aEN7NapHTAC0JB3P7WHuNylhCnUgSyhJdn+ynv6oifyCWEbYOxgzkHiYySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5phIhF+s/gGWDocx/mGX6jiidJskmKOZ25XQNeCHcQo=;
 b=4MPpe9BZvZiL9nwb/6TkjaRTIojPF0v1raRKcr/EqmWJq4AXhdSpk+EBvMJDtctldzyrglVnPnVckO0oNMDoM4N8NCet6VaSxSJ2X8W2Ac+ZOV1a55xJOfCGIHfWVBAU8Xiy2/BkuzB03HKo5/B6GlloP9lGkcvdgkcwpRYmCSE=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Tue, 23 Mar
 2021 18:25:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 18:25:56 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
To: Takashi Iwai <tiwai@suse.de>
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
 <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com> <s5hwntyaylg.wl-tiwai@suse.de>
 <ca35a9c1-82d8-8be6-21e7-b5242a2d884c@amd.com> <s5him5hc443.wl-tiwai@suse.de>
 <30b36220-ff0f-d04c-1fca-349b3ff3a19b@amd.com> <s5h8s6dbyr1.wl-tiwai@suse.de>
 <9758cd4c-1246-a4ab-74eb-0e060248a00b@amd.com> <s5h35wlbwye.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <06b2dae2-a5ea-0cc8-891f-2aaff64ae260@amd.com>
Date: Tue, 23 Mar 2021 14:25:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5h35wlbwye.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:3504:b347:a847:5b6b]
X-ClientProxiedBy: YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::19) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3504:b347:a847:5b6b]
 (2607:fea8:3edf:49b0:3504:b347:a847:5b6b) by
 YTXPR0101CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 18:25:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8399f012-e621-4653-aa45-08d8ee29199a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB43812D586D63A2C9876BF3A7EA649@SA0PR12MB4381.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tIiEP5CEGpEh1Q4lkuPXgctFpgNcH5Sv3lowcz7cX+wZuF1+Gg61Ee/ZqtQYATDCC6OlweGu4o6biFhnPF9oIgTco3BJN4UxNY3Af1WMMJaBFJQIH6FQN8e89/bdQHPg3cSQoRG1slW7k4SInfPwMA2D/QxnNNBkQqfGbbIwVzURABwz9euzvDIF6DaAOy57CRxCciN2EUdC0LH/y63rPB3yz7qCbnnWIkejQVHyRBc2GZCaGLAJY/nluGGYtz9NH6UqTmE4rCZaUszk/tLfJJmeauCRpi4sVwErSzmKYFIHRzU4u9/eCadXtOkz1jgIXMk2dhCbXBb0T/1E+Ib98UVfUuSojs/zwzw/J2iB5/UIQSxmAM+YQ1dtNAlKkyEfvZrYhntTxWdMHZGMrr/daA/YSB8nFnTdTJs+Z5SFpaG3/zNBbgYJrp0iKCdhKt/37Ane1osfZdkYp7SNvTJ1nTQ3HxUmG4UBXI8dLD5PN6rVlCiFAY4Cz6hxWq/ZUMuh1BYK6QVbO90nyndCBZgpCvcfgzXWEFC+nciYMwFO4bt8GP1aW2Uz3fqdhHe41ze28gZuN+Yi5ov4FMu72YYXE+ecfBRNicDlLVnrsf5TKgZpMc/XrncIAHQrXL5jDEKUMeVKCsuuhl7rEdiradAQxmht6s9zFO01smuavxOBP38N4qT4Z59AW7bk6/XYfG7SRmPO8vIpknyzEWDhsHFYvhdPmkoksOZybukvq9DbiJqBCzPTBdEUwt5bMHMynkjyghi/Lun5RD0Km1fMmVCHo8cifdhM9cj/WAp8UMJonBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39850400004)(346002)(366004)(8676002)(31686004)(2616005)(966005)(2906002)(30864003)(6916009)(66556008)(5660300002)(66476007)(86362001)(52116002)(4326008)(6486002)(478600001)(44832011)(66946007)(186003)(36756003)(8936002)(16526019)(53546011)(45080400002)(83380400001)(316002)(54906003)(31696002)(38100700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Vzc5bmtiMnBEeWxRckxzUnV2U1lhSmdCRTlJVEU3cmswenp5NE03UTNBdlhy?=
 =?utf-8?B?SHp1bVFvbmNCM29MZkhpMFFvRVpTOUhmTXZFWnlFQ0ZpcmIzQ0ZSOGdPMnZW?=
 =?utf-8?B?N2szanE1azhZK1FWQmJiSVArUEo0WWpvTHYwVTRUOUtENit3UTh4WTAyNHJO?=
 =?utf-8?B?ZlhNa1dabTVIZjUrN0wxRnAvL2hIYlFzb3dVbjZDMUMwcytVcFlGUU1HSjZU?=
 =?utf-8?B?azNOTDA3MzFJUDZCaTJIWE9MN3N3SnF4MW9RcEUvendVendzbzEwTEdIbGsr?=
 =?utf-8?B?Yi9oOEJUVVdZOE9QYUdnSXBZVTZDcFJYOUZCNFhXWnZzaVh6QkhsbjJ4SUdy?=
 =?utf-8?B?MkUwZGJUZU5qallGZ1h4ejdhNlp0Q0tyK29HLzRzQk1SREF1dkU5SzlweUZk?=
 =?utf-8?B?UXpqekl3eWtCdm4zb2FZQVVmd21iN1AzZ2tXNVkwYm5UR3ZEeVl4TTEwOUFR?=
 =?utf-8?B?Rk9zU2g2RzBsMklXSGNFR2k3aE1KTEtwTy9Pc0YrelBxQ2F5UzNjM1JiRDF1?=
 =?utf-8?B?UXpwRzJ2YVVucHhGR0RKMWp4M08xa0NhRUZjTTFPM0FMT1VMMFhuQUk0WXgy?=
 =?utf-8?B?NUdOaDJKOStxVkJNZlJ5VmtIdnE3Y0dwcmp0dnRlQWRxSnRTbEF3QzUxd1Bk?=
 =?utf-8?B?TGNxYnYyNjZUVXYwK1hvaEdpTC9PTHgyclhUc290VjZUTldPS1JBYkk2T2ky?=
 =?utf-8?B?WnE1OTE1MEhMWWwveHd0c3FQdEZseVE0Rjlqa1p2d0FEVFQ3N1hIZG9GVm1N?=
 =?utf-8?B?T2lPUTRqWUxoNmwvVTM0V01tWTlvU2ZFRmxBN0N0a01CemxTMUlXOVBCTHpX?=
 =?utf-8?B?VGxTb05ObjV6dFk1VjQ3OVBvRzRKc2duejR6R0tJRGtMdUcwWFlTMGE1cEZR?=
 =?utf-8?B?c2ZKMDVPWUQ1V0x0RXpYUG9MM2E1QXEyQURxQWJnRWZEMUovY1VTbmlDTFBS?=
 =?utf-8?B?VU9tVjBOZWZTOVVnbWdxcnlmeGdrdW5iR1kwbk9kSDIvV2JpSWZVM2lnNTVC?=
 =?utf-8?B?dmFIRnVBT2NiTHhkYW1jUElKUW1FY1o5VTZQZ3BJbzB3d1NZelZZWEhEelow?=
 =?utf-8?B?M292WVRYdkFhSk9SbGEvc3I2b2RMUHl0YTlHZVA2NkpxQ0h3UE1kb284T1hN?=
 =?utf-8?B?ZkcvaVhCMjk0K1VPNGRhbzNVMElkb0Q2cWZUejZBSTBCQTNhSWtrZGFGcmRm?=
 =?utf-8?B?UE9Zc0x5RDFpd2hHSm1NN0oxSTVIK08rYWJqckJ2anJRTG44aFpLSWorbkxN?=
 =?utf-8?B?eDg2UmV3T0F0OU5iSnM5dVgreXFEMWVHbWhSVjJZSkduM2lJZ2dKelo1Snh1?=
 =?utf-8?B?TmNUMWsybHNFQkw4MU92ZDluQjNnOWFsMVd6eXphQTdiRUFzd0pLVjJDNFUx?=
 =?utf-8?B?RjI3ZzRtemV6UzlRaDhLckR5WmlmKzBYUTVZWmZiNGMxODlQMXhkcC9kRHkv?=
 =?utf-8?B?Q2VXU3MzWFBRWXpTYkpMcyt2eGJ1cng3Y0V2OW5oZ1lTV0NRUlV4UVBERk1X?=
 =?utf-8?B?dU5hUmxGekxOQVk5d2RwcHdSOHBHUnlFVjYycTBIV2tiNlNWUHBhaktDeWNk?=
 =?utf-8?B?ZDFwSTF2SVZVSXVkVmdiK3N3L0t6aDBBb2xkNjBOK1Uzb29OeFg1ZnBmSUwy?=
 =?utf-8?B?cnhOR0Y2bkx3VE9RUmlvcTkwemwrcTk1Tm5TWFRMbDh1VUxja0ttUk1NbHlN?=
 =?utf-8?B?S1E0bCtqSFNxWUowUWJaUlBtdlhmQVhJNkgzSVBCeVhTaEpPK0hyZlJxVEdY?=
 =?utf-8?B?d01TZENtd2FTLzBaTkVPckVTOWVwYlhldlJUV3JzWFZmZUp5VHFnbXdaeVYz?=
 =?utf-8?B?WEhWRXpaeWN6MHVzUFg1YU5tenZIZGJYSFVtMWo3UzZGODFhak14MEhSbTdx?=
 =?utf-8?Q?9reyR25dzOgC5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8399f012-e621-4653-aa45-08d8ee29199a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 18:25:56.5800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jed8HBnLMgfRkK5hxFivLVYDRGLsechNyTWS//3Z1mJ8GaaXkaaUjDkxR38+OflC1vuIvSbhNjYYgT6E1uhQ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
Cc: "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
 alsa-devel@alsa-project.org,
 Sergei Miroshnichenko <s.miroshnichenko@yadro.com>,
 "Christian.Koenig@amd.com" <Christian.Koenig@amd.com>
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



On 2021-03-23 1:29 p.m., Takashi Iwai wrote:
> On Tue, 23 Mar 2021 18:08:14 +0100,
> Andrey Grodzovsky wrote:
>>
>>
>>
>> On 2021-03-23 12:50 p.m., Takashi Iwai wrote:
>>> On Tue, 23 Mar 2021 17:11:20 +0100,
>>> Andrey Grodzovsky wrote:
>>>>
>>>>
>>>>
>>>> On 2021-03-23 10:54 a.m., Takashi Iwai wrote:
>>>>> On Tue, 23 Mar 2021 15:22:01 +0100,
>>>>> Andrey Grodzovsky wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 2021-03-23 7:39 a.m., Takashi Iwai wrote:
>>>>>>> On Tue, 23 Mar 2021 12:23:16 +0100,
>>>>>>> Andrey Grodzovsky wrote:
>>>>>>>>
>>>>>>>> Just an update, i found the issue which was actually to wake up the HW
>>>>>>>> before doing stop/restart (using pm_runtime_get_sync), also handled
>>>>>>>> protecting from concurrent snd_pcm_ioctls accessing the registers
>>>>>>>> while the BAR is unmapped. Can go through BAR move while aplay is
>>>>>>>> running now.
>>>>>>>>
>>>>>>>> Once again, would be happy for any comments on the code -
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Flog%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C647bdeec424e470b890008d8ee212e56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521174012618001%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kJfEvDk3EhabJA10thL9NR7NZfZxwkSEhB2U3Rw0%2Fp0%3D&amp;reserved=0
>>>>>>>
>>>>>>> Hrm, this kind of change is a bit scary; we have some mechanism to
>>>>>>> stop the HD-audio hardware operation (e.g. for loading the DSP for
>>>>>>> CA0132 codec), but it's pretty hackish and error-prone.
>>>>>>
>>>>>> At least I didn't have issue with HW stopping, the problem is with
>>>>>> unampping hdac_bus->remap_addr - as long as it's not iorampped
>>>>>> back no code besides the PCI BAR move should run at all as any register
>>>>>> access from this address will cause fatal page fault. I took care
>>>>>> of most of the IOCTls i think, the interrupts are disabled in azx_stop_chip
>>>>>> but I am probably still missing some stuff like some background work
>>>>>> items or other IOCTls code path.
>>>>>
>>>>> Are the all running processes stopped before entering rescan_prepare
>>>>> callback?  Otherwise, e.g. a process accessing PCM stream via mmap can
>>>>> run without ioctl and this may trigger the PCM period elapsed
>>>>> eventually.
>>>>
>>>> Is any of them remaps the BAR into user process VMA ? The only two I see
>>>> in the sound subsystem doing remapping are are had_pcm_mmap and
>>>> snd_pcm_lib_default_mmap
>>>> and both of them remap dma buffers which are in system memory and not
>>>> MMIO space and  hence should not be impacted by the BAR move.
>>>
>>> When a stream is running, it can cause an interrupt that may issue an
>>> unsolicited event that is deals with CORB/RIRB later in a work
>>> asynchronously.
>>
>> On rescan_prepare I am calling snd_hdac_bus_stop_chip which in turn
>> seems to disable interrupts - is this enough to guarantee all those
>> won't be happening past that code ? Should I also flush any work queue
>> items scheduled from within those ISRs before proceeding ?
> 
> Well, calling snd_hdac_bus_stop_chip() during operation itself isn't
> safe at all.  It's called safely in the power management because we
> know all things have been already stopped.  But calling it out of
> sudden is a completely different matter.
> 
>>>> Or maybe I didn't get your concern correctly ? Why there would be a
>>>> problem to access the stream otherwise during the BAR move ?
>>>>
>>>> Similarly, a control interface may issue the verb that is
>>>>> processed via CORB/RIRB, too.  So what you need to cover is not only
>>>>> about PCM.
>>>>
>>>> Can you point me to the code path for this - is this through another
>>>> type of IOCTL or interrupt handlers ?
>>>
>>> Yes, it's handled in the ALSA core control ioctls.  Many of the
>>> control *_get()/*_put() callbacks in HD-audio are involved with the
>>> amp or other HD-audio verbs (typically calling snd_hda_codec_amp*(),
>>> etc).  Those are the mixer elements and handled via regmap with
>>> HD-audio backend that deals with CORB/RIRB eventually.
>>>
>>>>>>> Do we really need the BAR remap while operating the sound streaming?
>>>>>>> That is, can't we simply refuse the remap if it's in operation?
>>>>>>> If it can be refused, we may avoid a big locking or such.
>>>>>>
>>>>>> Problem here is that this feature is for the sake of hot-plug of a
>>>>>> device, this supposed to give enough MMIO space to place all the BARs
>>>>>> of newly plugging in device. Refusing to move BARs because there is some
>>>>>> app using the sound card on the background might then lead to failure of
>>>>>> plugging in the new device and this doesn't sound as a reasonable
>>>>>> behavior to me. Also note that the lock's impact is minimal as it's
>>>>>> read side lock only in the IOCTLs an so as long as hot plug not
>>>>>> taking place it has no impact.
>>>>>
>>>>> But a hot-plugged device can't have any running files, no?
>>>>> So at which timing is the BAR movement _must_ happen?
>>>>
>>>> No, the devices this code is written for are those already in the
>>>> system before the new device is plugged in, the new device needs enough
>>>> free MMIO space for his own BARs and so this features enables existing
>>>> devices to allow the PCI core to move their BARs within the  physical
>>>> address space such that enough free space will be available inside
>>>> the MMIO window allocated for the new device's upstream PCI bridge.
>>>
>>> Hmm, OK, so it's other way round as I thought of.
>>>
>>>>> And, even if we need some synchronization, the current lock
>>>>> implementation looks fragile to me.  We likely overlook something when
>>>>> trying to cover each branch code path.
>>>>>
>>>>> Basically it needs to wait until all running processes via PCM or
>>>>> control API are released.
>>>>
>>>> This approach brings a couple of hard questions -
>>>>
>>>> How we make them stop at once - they might run for long time, you
>>>> suggest something like invalidate all their mmaps and on next page
>>>> fault return SIGBUS to terminate them ? Then I need also to know they
>>>> actually are done - should I wait for their device file instance
>>>> release? What if they don't access any mmapped are for a long time ?
>>>> Sending SIGKILL explicitly ? But do I have the task id's of all of them ?
>>>
>>> You shouldn't kill them but wait for them aborting gracefully, IMO.
>>> Essentially a kind of hot-unplug.  Most of Linux drivers won't kill
>>> processes at the hot-unplug, AFAIK.
>>
>> But see, the difference is such that on hot-plug I may just let those
>> process pointing at zombie device to hang around indefently because
>> I am not waiting for any output from them. That indeed what I am doing
>> for amdgou hot-unplug work. Here i need to blocking wait for them since
>> I need to finish the procedure so the PCI core can finish shuffling the
>> existing BARs around and by this freeing enough space for the new device
>> to be accepted. I user can't plug in his thunderbolt GPU and observe
>> that nothing is happening actually because we are stuck waiting for some
>> process just sitting idle.
> 
> Then we can see it from a different angle; read below.
> 
>>> But if it has to be done so, we have a list of file descriptors that
>>> are attached to the PCM and the control devices, too...
>>
>> So you suggest iterate all of them, sigkill them and confirm all of
>> them exit instead of using the rw_sem ?
> 
> Note that, for the sound applications, we don't kill at disconnection.
> But the ALSA core stuff shuts the all operations up but for closing
> (also some event notification for the disconnection was done), hence
> we just wait for applications releasing resources.  In anyway...
> 
>> This will cover IOCTLs and any
>> mmapped accesses i guess. Interrupts we discussed above. What above any
>> possible background kernel work going on in dedicated threads or work
>> items ? Any pointers there what should be blocked and waited for ?
> 
> An alternative idea would be the analogy of the system suspend /
> resume.  That is, we forcibly suspend the devices at first somehow,
> and also restricts the further accesses by some way.  Then do remap,

But that the point I guess, how you block further accesses without those
big locks, during S3 i believe user mode gets suspended before the
driver and so you don't need to worry about concurrent IOCTLs when going
through suspend sequence

Andrey

> and resume.  Not sure whether this will fly high, but if it works, it
> should be more systematic and more robust than papering over each
> piece manually, I suppose.
> 
> 
> Takashi
> 
>>
>> Andrey
>>
>>>
>>>> We had those scenarios discussed during my initial work on GPU hot
>>>> unplug and came to a conclusssion that trying to wait for current
>>>> processes to die is not a good approach - see the this respone I got
>>>> at the time for example -
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2020-May%2F265467.html&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C647bdeec424e470b890008d8ee212e56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521174012627999%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6IlaLx6EB9RuDyGajJxCeGUe2AprvyUGjfRWWtlGpDY%3D&amp;reserved=0
>>>
>>> But should this be seen rather as an analogy of hot-replug?  That
>>> won't kill processes.
>>>
>>>
>>> Takashi
>>>
>>>>
>>>> Andrey
>>>>
>>>>     We have a mechanism to block the new opens
>>>>> like snd_hda_lock_devices().  We'll need an additional stuff to wait
>>>>> until all opened devices are released there, and this requires some
>>>>> help in the core code, I suppose.
>>>>> (Actually this hackish lock_devices/unlock_devices should have been in
>>>>>     the core stuff from the beginning...)
>>>>>
>>>>>
>>>>> thanks,
>>>>>
>>>>> Takashi
>>>>>
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> thanks,
>>>>>>>
>>>>>>> Takashi
>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> Andrey
>>>>>>>>
>>>>>>>> On 2021-03-19 5:22 p.m., Andrey Grodzovsky wrote:
>>>>>>>>> Hi, I am working on adding AMD related drivers support for PCIe BARs
>>>>>>>>> move feature developed by Sergei
>>>>>>>>> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flinuxplumbersconf.org%2Fevent%2F7%2Fcontributions%2F847%2Fattachments%2F584%2F1035%2Flpc2020_sergmir.pdf&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C647bdeec424e470b890008d8ee212e56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521174012627999%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=YwRNUglLIO2X7kYQTmRU%2BWvC6fCe0GLAR4%2BkntpmPFQ%3D&amp;reserved=0).
>>>>>>>>>
>>>>>>>>> His feature is still not upstream, all his code and mine on top can
>>>>>>>>> be seen here -
>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Flog%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C647bdeec424e470b890008d8ee212e56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521174012627999%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Vz9SqXNT%2BQ9emNKim76HpS%2B1X2SNLzANqidWB4rkh8Q%3D&amp;reserved=0
>>>>>>>>>
>>>>>>>>> I did basic implementation fro amdgpu driver and now I am doing the
>>>>>>>>> same for snd_hda_intel to support our on GPU Azalia audio
>>>>>>>>> chips. This relevant commit is here -
>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Dyadro%2Fpcie_hotplug%2Fmovable_bars_v9.1%26id%3D7ec0f60633e898cb941cebb3cd18aae1374fc365&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C647bdeec424e470b890008d8ee212e56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637521174012627999%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=j%2B9Xz7D%2BsMinhUY%2FlnKWv6NfjhnlxDPF7GehovVzwyc%3D&amp;reserved=0
>>>>>>>>>
>>>>>>>>> Any driver that wants to support movable BARs needs to implement
>>>>>>>>> rescan_prepare, rescan_done and bar_fixed callbacks where
>>>>>>>>> rescan_prepare needs to stop HW/SW and unamp all MMIO mappings and
>>>>>>>>> rescan_done needs to ioremap the BAR from it's new MMIO location and
>>>>>>>>> restart HW/SW.
>>>>>>>>>
>>>>>>>>> I am able currently to trigger BARs move by sysfs using
>>>>>>>>> "/sys/bus/pci/rescan" and the driver will go through the sequence I
>>>>>>>>> described above without hangs. Problem is that after this when i try
>>>>>>>>> to use mplayer I am getting following errors:
>>>>>>>>>
>>>>>>>>> andrey@andrey-test:~$ sudo mplayer -ao alsa:device=hw=0.3
>>>>>>>>> Downloads/file_example_MP3_5MG.mp3
>>>>>>>>> MPlayer 1.3.0 (Debian), built with gcc-9 (C) 2000-2016 MPlayer Team
>>>>>>>>> do_connect: could not connect to socket
>>>>>>>>> connect: No such file or directory
>>>>>>>>> Failed to open LIRC support. You will not be able to use your remote
>>>>>>>>> control.
>>>>>>>>>
>>>>>>>>> Playing Downloads/file_example_MP3_5MG.mp3.
>>>>>>>>> libavformat version 58.29.100 (external)
>>>>>>>>> Audio only file format detected.
>>>>>>>>> Load subtitles in Downloads/
>>>>>>>>> ==========================================================================
>>>>>>>>> Opening audio decoder: [mpg123] MPEG 1.0/2.0/2.5 layers I, II, III
>>>>>>>>> AUDIO: 44100 Hz, 2 ch, s16le, 320.0 kbit/22.68% (ratio: 40000->176400)
>>>>>>>>> Selected audio codec: [mpg123] afm: mpg123 (MPEG 1.0/2.0/2.5 layers
>>>>>>>>> I, II, III)
>>>>>>>>> ==========================================================================
>>>>>>>>> AO: [alsa] 44100Hz 2ch s16le (2 bytes per sample)
>>>>>>>>> Video: no video
>>>>>>>>> Starting playback...
>>>>>>>>> A:   0.1 (00.0) of 132.0 (02:12.0) ??,?%
>>>>>>>>> Audio device got stuck!
>>>>>>>>>
>>>>>>>>> and in dmesg I see
>>>>>>>>> [  365.355518] snd_hda_codec_hdmi hdaudioC0D0: Unable to sync
>>>>>>>>> register 0x2f0d00. -5
>>>>>>>>>
>>>>>>>>> Also I see 296.619014] snd_hda_intel 0000:0a:00.1: CORB reset
>>>>>>>>> timeout#2, CORBRP = 65535 error during the rescan_done callback
>>>>>>>>> execution
>>>>>>>>>
>>>>>>>>> I know it has to do with the move of BAR's MMIO address because when i
>>>>>>>>> disallow BAR migration by returning true from bar_fixed callback I
>>>>>>>>> have no such errors and mplayer works fine.
>>>>>>>>>
>>>>>>>>> I enabled MMIO trace and didn't see that post BAR move there is a
>>>>>>>>> wrong MMIO access - all of them are from the new MMIO base offset -
>>>>>>>>> 0xfcd80000 (trace attached including mmio trace and dmesg)
>>>>>>>>>
>>>>>>>>> I would be happy for any idea on this and any comment on the
>>>>>>>>> correctness of my sequence in the code
>>>>>>>>>
>>>>>>>>> Andrey
>>>>>>>>
>>>>>>
>>>>
>>
