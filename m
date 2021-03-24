Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AE347B34
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 15:55:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 535E31687;
	Wed, 24 Mar 2021 15:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 535E31687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616597726;
	bh=6/uqsDaGku5GLQhc/rjfoHeircBfd/K3xiUxEJPaW20=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3B5IsUKkJJpfbm49yel8/lXcABggKal8Hx2ziHq4mbjtCoVwOW+IvqmazASxKfk+
	 alaovs/Tqvgsm+3pQcMuUJkRVjKBvZHGuMFuvoy/nlQE2b4zFqHBc1YtFmX+KYaned
	 2aNKed5lKj9soDVcfx9yibdyF1Px66KDYOKMpp90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C48EBF80156;
	Wed, 24 Mar 2021 15:54:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49DEEF8016B; Wed, 24 Mar 2021 15:53:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FE11F800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 15:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE11F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="SQ90Jge4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGUfyrmOzb8m6GS1Xx1v6iSFPl2levN6sb0fP7e2KgHSiTm9YtmSwKQA8nD/Bd30NtMvvPQ+M3tqkxTOz8u6T5ea8gHyQPdzwP9IXd1c8gkJyp01bPUnIT+2NbP8/MWuCMzOwDYRhwsd5iJJerSoT2ZCzhS3pX3tdUvz9+1H0zjPsVNkvCKSmK1dtVf+dRZ/xA6lqGjQDTVmVwSQA4MHP6lFlsywjnbWFw8zQ1o4+kcAXCQb591QQTFwWhmqjeFtnKJwfHStY6Lw6ShJXtQxqPiMZCMiiwckkL9hpdusFqyJ6hj1fifWsVk2NbSNhKx9bRdJPdvMXekWM75eT1xdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtGuBtcn+oW/+nt5VJlC9U3ncxykzXPrp61C7W0G/mk=;
 b=amqmT5LfHZFzI8s8oEog5R2XB0DT23xJwwaNDxAbb7DXd3yBHcSY7cksxlq2OmQLPsfHWvsTtTkLRy4aSQBYmGiJQjAVZ0trgI85Ar7rDzruoZTEtacLwoHTc0BKokYhZbKnSHVjlrT5S5g7fs0yVylGPf5f/n/W86ewpiCwYdalkXt6Q/2r5uKzrFDVULWmvzE8ijlN8j5WcjpRFHUdG8wiaznFlDHEfsuLDwk+hHGS333BhYm5FZoycZq++74alSuUcQZUBW2zZcdToj98TRY/8Xp9nCUc0zY7s2x0/uTCyES2mOdeC1ms2iw5FV7QLf4rcySErFypIeN+Cp8cYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtGuBtcn+oW/+nt5VJlC9U3ncxykzXPrp61C7W0G/mk=;
 b=SQ90Jge4EPzW5iNR+FzebhEwa9SfS8J1xordzOc6Ii9udPan8PHmmwvnjdfvWGgksj/Lr8eLyxVgfMwXfTXavVuUDCh9ATE7ZkeZbkqrDVUc9GdyHQbzXlVcKCDLiFwbzBacW7A/4tLYwflKo6G2B6ruKZKaZYVerLc9AQODEmQ=
Authentication-Results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Wed, 24 Mar
 2021 14:53:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::29cb:752d:a8a7:24a8%6]) with mapi id 15.20.3955.025; Wed, 24 Mar 2021
 14:53:35 +0000
Subject: Re: Adding movable PCIe BARs support in snd_hda_intel
To: Takashi Iwai <tiwai@suse.de>
References: <e25017c6-e5e4-7a24-e793-14a2e70a434e@amd.com>
 <fe61113f-5b8e-53a0-23fc-65246eb08ac3@amd.com> <s5hwntyaylg.wl-tiwai@suse.de>
 <ca35a9c1-82d8-8be6-21e7-b5242a2d884c@amd.com> <s5him5hc443.wl-tiwai@suse.de>
 <30b36220-ff0f-d04c-1fca-349b3ff3a19b@amd.com> <s5h8s6dbyr1.wl-tiwai@suse.de>
 <9758cd4c-1246-a4ab-74eb-0e060248a00b@amd.com> <s5h35wlbwye.wl-tiwai@suse.de>
 <06b2dae2-a5ea-0cc8-891f-2aaff64ae260@amd.com> <s5hv99gan2r.wl-tiwai@suse.de>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d9bc41d7-bbad-24e3-6ad3-90e6dd8466c4@amd.com>
Date: Wed, 24 Mar 2021 10:53:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <s5hv99gan2r.wl-tiwai@suse.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:3504:b347:a847:5b6b]
X-ClientProxiedBy: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3504:b347:a847:5b6b]
 (2607:fea8:3edf:49b0:3504:b347:a847:5b6b) by
 YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Wed, 24 Mar 2021 14:53:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5057fac-5751-41b2-516a-08d8eed499c6
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB457617F380D4667464C49190EA639@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AgXkvpUm8aFjLWcBumx3RHVtdHPs67uQvlZz/KRd+0aZlG+ab6VPJY8HNEs28qo7DoVvm47WhJbHEL0d4+5btifcGaiRDCft/7c3QnFlPLT2vOaggKt5uGqTxtA+bvwwJtX3K1r++VfqRKgoiGJMUt2P0v5XK+noWTFqYwG8neYsHj3xnhqmKGQJXwXksAYJTm9COCkIDicoJee3+Mjx+3vdSZZGIhu8vtIE4/MuuIB/XC4h56UUfkafi6Blwpk6ItzzFoSMWrwZ9Ydn7JunGzQxjniO2DbOHvp9IVW17OhtrC8LzX8cg/jc7ka1HOzw7iheVcwB+u7gaUmCoFNRsVUs8g/OR52AfnGSfszePeuRXMrw4h3hvUd38ckDtHlq4svZKi/U3jW0/A4l+SSiuje2ZkXL1zMumQtbhBWVeCBtLRznqWTGIeK54k5AlnW0O+PHyqbuKjbMxk52h1NjSnHXIJpOj4Ev7dNUKt4DRX0CnVf24GTcjj9rwOKCWpcoEy5ImbUiiex6LBBdSSTSRc5G/VlPr9QLj4QQyf3zBLywObCMqW/UhqobxsAhrl7OaVtMInShuDMrsAQKx1tOGsiglW1NafmGLlcmC7dLC6duahXmbabQTNpXWB9a0SW1p1vlRZ7MMpUCz5CQLpQGYjrLfH0mfMshdeCtLCnnrGdlREfYP73RNc1KHBhNvHNcdS0AKrgh7i0u9ehxSU6JjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(478600001)(83380400001)(44832011)(8676002)(6916009)(8936002)(2906002)(31686004)(186003)(31696002)(38100700001)(2616005)(16526019)(66556008)(86362001)(6486002)(52116002)(53546011)(36756003)(66946007)(54906003)(316002)(66476007)(5660300002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?WEfNBwwoelRlxj7Wb2U/9zt3WTJ8cx7G4VYN8zBZDhRIGIfdtCh1mrpC?=
 =?Windows-1252?Q?pO26w0uc16eJ/dtTFeCc2X5HHfVdPt7GzIOxr/FDMZcsuGYJyye4XCTz?=
 =?Windows-1252?Q?hKdD9A0d61064SLgY3vHNBeowS3/jwfTxk8/5L1rwAw7lIDtX1CfjiJX?=
 =?Windows-1252?Q?DD5lLjS9LgycJpeKa9rqu6Tc9YcWwZ2t3rYHV0Hrxh1Ie+Td+UuXxiFQ?=
 =?Windows-1252?Q?6JK0HnU4YXYwMrFSKeEa/4X9xbQyarcAIChDwtDEQEngb40r3T0fYTjk?=
 =?Windows-1252?Q?Fk4df1aj+t78K+H+myw8m6jYmH2K+fBCoZF5I88njhZ/WNH/ugsTBA9u?=
 =?Windows-1252?Q?536bGWIXieareUUIqMGxRA+V6Nh56kMq6tZc65DLqjdI3khA8Od1/SgD?=
 =?Windows-1252?Q?9F+JyvFOt1X6Bol1Ny0fRdtvp5qFKwcfhOp3p6D/3WFybDk8Gp83YbbI?=
 =?Windows-1252?Q?w4JISEiWSB0TCxMcvYh6/cN1vJmNTWKUb5xmxyYyBh0bVkdQpWCWG6+d?=
 =?Windows-1252?Q?8Mi7hEzkQG/LHBV0guJrPLAavbcwKSHJuXxbIO74GC/iJ7Ze3naS3U61?=
 =?Windows-1252?Q?mvFCJDqMSgt//DSnOUwsE4cVCSV6ge0KILZ0ozsrysGGwywptlVd1OXJ?=
 =?Windows-1252?Q?j+yYkyAKQ6Fr6/M7+o1KIM+C5G7mvcG+1vdG5W3OajT50kILIuG5NGVJ?=
 =?Windows-1252?Q?67wxCDkWuRk1UI4+/XGL7zrbew7wCHi8HJfAnEVrJb+z6U/SQ6n+oche?=
 =?Windows-1252?Q?l/bWQBPTmlGAAbdXm1YK/m5CzslB4U0j2V8FGQvvTwxWfSfB8V6mDOWB?=
 =?Windows-1252?Q?pnJuwPwXBCqUfy2SaFJfXtZI066iU4b0I/XH14kNyYpLlTyeIrDAXgj+?=
 =?Windows-1252?Q?NTnoTuLRxDMQTEXQH556fMLxcPrTMxI/QpMyH9Z1FfGVxvhcsmUFV15t?=
 =?Windows-1252?Q?pqjFxWQH8X2JxmApJesRiwqQN03uTBc4tkKylgAOEmFACI1M7n3gVsII?=
 =?Windows-1252?Q?6Mo2UlsMBrZinfpQq5fvQ3htyNinsf184iC1dqUEZN57JfHnGAqKVYmN?=
 =?Windows-1252?Q?5oLpl6lSybDdtAiEkCy0mA8Jw+Sw6b/EixBfygJJYNPCUHLwGAKFLe47?=
 =?Windows-1252?Q?53/sFhd9hF2Bt3nkAuzswWJkHud4YlffOKWnKL+1PWsOhUTUpcnJCDv+?=
 =?Windows-1252?Q?V5RwRrU0638NSkSJmwdXiC+zj2V///hSsP3m63QlTZsMDhTuG/n3+j32?=
 =?Windows-1252?Q?8UpHYNXoq5IBSya1muzklPu1ljdNk+eyAX1YWfzm7qxliAm8ngGxQd+J?=
 =?Windows-1252?Q?I1ZwyVTAQMtTlhIBXCvkiXn2NL+FY/jWMxXOijoR2FQhjO4LqIdfORK0?=
 =?Windows-1252?Q?ZgHCV/Fm3MMIgYBNE+xZtRyuAT/AA/3er9GlmVonGIu1fzNbrrvhAFFo?=
 =?Windows-1252?Q?1apVTa9p3y8Drs6xlJGuwJdghDxSl+UY5Pu4Ro94BZv9SNRAr+H9C/Ly?=
 =?Windows-1252?Q?ty7GssKc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5057fac-5751-41b2-516a-08d8eed499c6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 14:53:35.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzKU8IXrr+lx+JkR8uaVhlplJbnHDcdLeKt+BWz01SzGkB85ysa24XMazbtD6y1cvRE6Hk2jamvA0w6fMWgReg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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

Appreciate you investing the effort in helping on this.
I will start to merge it now as it doesn't apply cleanly on my branch.

If I understand correctly your main HW access prevention mechanism during
the PCI prepare-rescan period is by bailing out on IOCTLs with the check
of power state == SNDRV_CTL_POWER_D0 or waiting when a user process closes
it's device file descriptor in patches 2 and 5. For command submission
prevention you use the freeze flag from patch 6.
If I haven't missed anything I don't see how those all protect when
new device is plugged while any of those operations are already in 
flight. What prevents concurrent HW access from an IOCTL already running
and HW suspend and MMIO unampping in rescan_preapre which starts after 
IOCTL began ?

Andrey

On 2021-03-24 6:00 a.m., Takashi Iwai wrote:
> On Tue, 23 Mar 2021 19:25:53 +0100,
> Andrey Grodzovsky wrote:
>>
>>>> This will cover IOCTLs and any
>>>> mmapped accesses i guess. Interrupts we discussed above. What above any
>>>> possible background kernel work going on in dedicated threads or work
>>>> items ? Any pointers there what should be blocked and waited for ?
>>>
>>> An alternative idea would be the analogy of the system suspend /
>>> resume.  That is, we forcibly suspend the devices at first somehow,
>>> and also restricts the further accesses by some way.  Then do remap,
>>
>> But that the point I guess, how you block further accesses without those
>> big locks, during S3 i believe user mode gets suspended before the
>> driver and so you don't need to worry about concurrent IOCTLs when going
>> through suspend sequence
> 
> ALSA core still has some legacy card-level power management code,
> which was introduced many years ago at the time we still managed the
> power state via an extra ioctl (hence working individually from the
> base PM code), and a few pieces are still effective for this kind of
> purposes.  Through a quick glance, a couple of places need band-aids,
> but the rest should work.
> 
> A bit more difficult problem is the floating control API calls.  The
> get/put calls might be still in flight when we perform the PCI
> rescan.  This has to be filtered out additionally.
> 
> Below are a patch series I cooked quickly.  Totally untested, just
> checked the compilation.  The first patch is a fix I'll merge in
> anyway, while the rest are RFC.
> 
> 
> thanks,
> 
> Takashi
> 
