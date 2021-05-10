Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DB337951F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 19:12:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9F3176E;
	Mon, 10 May 2021 19:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9F3176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620666725;
	bh=vq+kI2hNAi1zXYzVDXUGF545GWlvN9SEU9ng2pkfGHQ=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7CRyW24cnz5huk08JBTF2nqpyXSQ/caz2m1YrOVSKW3eiURlWnbXNlfHUxxp2IpV
	 CzmI0eVDbEg7HaQpPbnVQFGxzIAX7bdkaXgfBFzv83J3tGgTDuEAk3XDdHUd42BLzR
	 lhYUhabOBn/ww2iuW+YlYIbWegFkmiIfJ1umXZQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA927F8026B;
	Mon, 10 May 2021 19:10:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9796F80240; Mon, 10 May 2021 19:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_65,PRX_BODY_76,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4726F800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 19:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4726F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=amd.com header.i=@amd.com header.b="NQ16Yj+L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1+vDs2ovs60ZgRKukuaVz2ewPAbRIO3dVQ1VOMofRGKj8Y4lOaQ1wj46PjtjWv0gD7aUvhjjgTaRnKTheS8K0rbdZEQWuDGd+iJ1g+3+fLcEhyKOoiRZg2ohJLgPazvD8RiMJMJd9BSRwxIhkLwMC7P2e0wPTDmQIltcatigGYaZz+4/6Ht7IrYbW5zuZemsvPRjN3mSGUAJwCauXvvJ7YDS+Mt0qVpY1ew3suovKGzrJL+X7UkBZgQ9OcNgU4SE4FN/kb9Ukub0x0OUth7wK3pJOqoUl0JnQW67oUrXlLjtMo5iAx90AJ6zm3EKJsky/dynGkJMXwbfgitHdr1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3wKgOKwm5+Bsh/GnCBU1jNcmSE/qYFe5SvMzGeo+C4=;
 b=dyf9V879a3WzjT0VfZCtRO8oGnYz+qC+rS21Q/WSXrOD7Gq9/d9It3VvBvVfj91sf0Ki73NAFOZ9S4H2vPMZOOiOp41vO8N8hraqX7iEunX987RFwN+rjVaYYYzkZHa7ldhV5cVEboXVYCmtigkhNNMxCED/o2iSGU3ibRcICGwM0h9YOpyLq84ge39AmP7AMXsnikf18K3fy9jzUbCkllxPPkW6L0tXV8k0YW0mIiCzpClAVfjnYB3byVzzr/kTov/Tc3Q8R82CmytV7YaDn5dKZ5HPdKRlDfkpkeEfJUbfxXcJn3Nh59MTixqgqsu1XhNK/rHg4IzC/aK1a/xFnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3wKgOKwm5+Bsh/GnCBU1jNcmSE/qYFe5SvMzGeo+C4=;
 b=NQ16Yj+L8kg4H5QoeiVOVDw0cCWPDoOrtB8530spj2Wm5zHQp338sYqW+iVa35jAoJJwl0Y+OFceN5u3hIHXHlSVfJpNRxlQPRrel0RLMkp5cWG3J5YZ8yXzsWyri2BXXKtVFhGbAf660M8tPTt6BguBWzlsF/CNLTTaZgPxvZM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB0272.namprd12.prod.outlook.com
 (2603:10b6:301:52::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 17:10:10 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507%11]) with mapi id 15.20.4108.031; Mon, 10 May
 2021 17:10:10 +0000
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
 <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
 <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
 <b86ad586-9513-8fa9-54e3-a0b4a3a7fd92@amd.com>
 <070b4e5b-b7bd-b8a6-beea-593a94ec3078@gmail.com>
 <26c79eec-5e74-38bc-465b-0ca2b2d9a6f5@amd.com>
Message-ID: <9b689495-e956-6242-0784-af3ccf7c3238@amd.com>
Date: Mon, 10 May 2021 22:57:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <26c79eec-5e74-38bc-465b-0ca2b2d9a6f5@amd.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.80.7]
X-ClientProxiedBy: KL1P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:802:2::25) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.31.162] (165.204.80.7) by
 KL1P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:802:2::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.2 via Frontend Transport; Mon, 10 May 2021 17:10:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48d05afd-5d1e-41e4-984e-08d913d6779d
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0272:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB027224637F03B053F609C30597549@MWHPR1201MB0272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFw/0t524tOC55Fib8xAsT5FaWdS8JMwd5bGdkrh9BGso32nkSlGSSAi7cgFkQB3s4VdmeT+ssAYa6/006xMhQpSi4RsnDTXQrjmhG/AiA3F5wheycVbTcsdjU0ow27dWerOrD4R3OOXNdneFSI9MjTmpgqZjFAMgyK5V2A8vm+99n2HIjxK/jc+rLEX8JKt67ptBloO1kN3csm1VGJkZzIXS6uzTSjGGQ7VHedV+/h4RHoNmxQ1ZbX6FWM4IyirWlsTPn+E9E3Y8jWBQ7Aj3q/hJRkT8QZ5rbnK8m0AvsIVtAVrLvbtHhG3TP9Ijf4yZox/VPU4xSVg24BW/+HA1tgWXY9Q+Gg4Jeh0yEK8+a9H/o0wkZq+9cYxf+iGzRRaVCb1M/z6QRVhQnEZpceSIyniqaD9reUcDwcrgOa6Tw7M0RluCshnGlKsDnePwA3EFOOoxqmrxZj2qINuXNuZgzsNoTdOzMdyx4b+OatnGNjlqHdPSoyebP3GyqbrF7uqZnh7y/uqoP7VCL0MjPHitL0SpQtZOie01Q6zRjLkiKhmAhLx5ZhmUozkamu4s24dIGNEJBN9eBee6s0ixcTJz61FCwYleAQN4iRip7DUG/UKpAzJhL/uwwI+PGq+TMei7Y9OK9yEq0r576UtisDGdgBumvOXhTtD7Aer/xmnopA9RV2V0w3ftR1R/7TtFpAOpLAxtFyBidnR9PH87X+XtuBByOKyIhjpEu4KYrYoaAXfTe1ZioMAutBved4youQn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(66556008)(66946007)(478600001)(36756003)(6666004)(66476007)(38350700002)(83380400001)(6486002)(8676002)(26005)(38100700002)(8936002)(7416002)(86362001)(2906002)(956004)(186003)(66574015)(16576012)(53546011)(316002)(4326008)(31696002)(52116002)(54906003)(2616005)(110136005)(16526019)(5660300002)(31686004)(70780200001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?fIF7Zxb1WvceqdFhz5WXYj9t34TN31iBtx/KT7/4u81z8VNYV8IZf3PS?=
 =?Windows-1252?Q?yWw+1gvUhIQgpwynLUL3w/l2JsS0K5nKB2Tz2sisjTK9abuGl2MOopeh?=
 =?Windows-1252?Q?MWZWmt9gpqi0w3AlC8yhvMRFTHYCIaFVrs0Ncxe5oqMzKK50wriyyG+C?=
 =?Windows-1252?Q?qpLgfe5cs12FaE3XpA2+8HltM+M5WC2KVYPlanPm89WXMWIw+u1cFt4p?=
 =?Windows-1252?Q?kDYfcddsaPRmPf6RSw+Rg02jMlfWwsNkluf56NLtdA2lFjwz0j1XbdBy?=
 =?Windows-1252?Q?rsu23UVSG7ma2S17jKkN8Vx8qj/fkMdCh4SB0e7xbg9SYvGy0/R8RTK1?=
 =?Windows-1252?Q?ptD85fsZIoxjAEJh5VGr4XJBKsMcILEYgyg1G7yS+dUMv/3Dwt5kBAnB?=
 =?Windows-1252?Q?SaVu0Qc3Gmq3NNAsiYHLE22SOsMTsa3W0JxsN2KqzXSb6G1Ebl7/vbPW?=
 =?Windows-1252?Q?6siPL2VtaUpPZuGnhzzSH9IVpMChDne8AoO3dVyosAsKz4HpHGe+WATr?=
 =?Windows-1252?Q?9pg8iRdcbG+1kvxhsazXBPZcy8wUuqPnSD3nenA8FxVuWk+L0ao9L2Ju?=
 =?Windows-1252?Q?v3gJXWrt5mOF6G8hy0dJuaFTDSPg82l7f3yR3FLwJl4ZFuH8Ofwq7ohK?=
 =?Windows-1252?Q?zGKRHIRr9QcOs/j2wB4f+qlXMcfayqbIJxGcLXZpYO5GiEqREY8R73Us?=
 =?Windows-1252?Q?wK7JP3p+4OoOZuC1YFmblekZy/hXOAt3xMzaWf5tDPJ4A7Tq9hzxpfQF?=
 =?Windows-1252?Q?QSJR58cCxx3qCVN8VPjjCYjNoqS9MJ6LV2FD0GN27wDVKm7dEI4ReeaH?=
 =?Windows-1252?Q?VqZYaq50tP0m+sPaglowlWez+Dgiqbbr9ffU7+ojtZ2RRM/tBownD7L8?=
 =?Windows-1252?Q?OrdTWGubkKcFOpMy4DgRqEDbphAneyQAG/Um3D8UW4xdNsK2wskQgSkz?=
 =?Windows-1252?Q?xReNCpu9QkCCnhtM8BTo1Cj3IZcYTkvVrAm6Upljup5Zf0q29I1dA+hM?=
 =?Windows-1252?Q?+6aKW1/RCq/2CHXiOKa4LRlqqotn0+9wOARnAq9d+iE841mr1ACUOxxm?=
 =?Windows-1252?Q?BJ/R2CoqgzlQed5P81A3FMAaExHZ8aWp3eIoOkk9k1Mhj+krauNnIZ4g?=
 =?Windows-1252?Q?5YSBM13CSSjryb4YQ/eHKiHN4inMbZWAIP3QZaPeTWd8LHQHCJOhcOyQ?=
 =?Windows-1252?Q?9BD11I/mwhO2brr+xSF6bWzWr3nK3ws4ptZqCF006GlGF8gaZnIiZcw2?=
 =?Windows-1252?Q?u7QlmbNHYXY/HIJilw0cx1gANhfGd6kPgLSshx+45JA59LbnzR3ZITHi?=
 =?Windows-1252?Q?8kNcqnVLwLIeSMm8OXHuquJ7hsDKAhWT7TfYZZ2ALIdQPiuwFhDThy1l?=
 =?Windows-1252?Q?QuN5NCoK4iP7ZdH+YmZO1fxX1jheb0NteL/aXSILs3wy6eIWuiiHhbM0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d05afd-5d1e-41e4-984e-08d913d6779d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 17:10:10.2910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIVxzl7TQTgczN2kUBHFZtBZjbqXkp6T++kEcXcuJhg9xNChyx7736zhaWKTAby3hDgfsPxvoU/CaozZzmG5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0272
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 amistry@google.com, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Alexander.Deucher@amd.com, nartemiev@google.com
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



On 5/1/21 12:05 AM, Mukunda,Vijendar wrote:
> 
> 
> On 4/30/21 11:12 AM, Péter Ujfalusi wrote:
>>
>>
>> On 28.4.2021 18.35, Mukunda,Vijendar wrote:
>>>> Thanks for the explanation.
>>>> This is not upstream, right?
>>>
>>> Driver is already upstreamed.
>>> Stoneyridge platform based products already into market and working fine
>>> with 4.14 kernel version.
>>> Currently Kernel migration from v4.14 to v5.10 is in progress for
>>> Stoneyridge platform and release got blocked due to Audio use cases
>>> failures.
>>> In v5.10 kernel base, re-ordering of stop trigger sequence is causing
>>> DMA channel stop failure for both playback & capture use cases.
>>
>> The dai - pcm start/stop ordering has changed in v5.5, more than a year
>> ago. If the support is upstream it should have been noticed by users.
> 
> AMD partner using their own repositories where kernel is not migrated to 
> 5.10. Still products are running with v4.14 kernel only.
> That's why users hasn't faced this issue.
>>
>>>> What is still not clear to me is which channel fails?
>>>> A) the DMA between ACP FIFO and the I2S
>>>> B) the DMA between ACP FIFO and system memory
>>>
>>> There is difference for playback and Capture use cases.
>>>
>>> Playback:
>>>
>>> channel 1 : DMA transfer from System memory -> ACP memory
>>> channel 2 : DMA transfer from ACP memory -> I2S memory
>>>
>>> Capture:
>>>
>>> channel 1: DMA transfer from I2S memory to ACP memory
>>> channel 2: DMA transfer from ACP memory to System memory
>>
>> Yes, this is why I used A and B to refer to the DMA channels.
>>
>>> In case of playback, Channel 2 is failing where as in case of
>>> capture channel 1 is failing.
>>
>> So channel A is failing.
>>
>>>> in acp-pcm-dma.c on stop you have a busy loop (10000 iterations) to
>>>> check if the channel is in fact stopped in response to the cleared run,
>>>> IOCEn bits and the set Rst bit.
>>>
>>> DMA channel run bit is cleared and Ioc bit also cleared for channel 2 in
>>> case of playback .
>>> After that as part of DMA stop sequence, DMA channel reset is applied.
>>> When DMA channel status is polled for stop, its failed to stop.
>>>>
>>>> Channel closer to the destination is stopped first which sounds
>>>> reasonable, but on playback you ignore timeout from A, on capture you
>>>> ignore the timeout from B.
>>>
>>> Please refer above explanation.
>>>
>>>> Still the issue sounds like exactly what I have described. One of the
>>>> DMA is failing to drain because the IP is stopped?
>>>
>>> As per our understanding, failing to stop the DMA by hardware is causing
>>> the issue.
>>>
>>>>
>>>>> Need find a right place to implement a work around only for AMD
>>>>> stoneyridge platform.
>>>>
>>>> Is this really only affecting stoneyridge platform? Are there other
>>>> platforms using drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c ?
>>>>
>>> This design is being used only in stoneyridge and Carrizo platforms.
>>> But only stoneyridge platform is productized.
>>> New design is implemented for later generations of APU series.
>>
>> Right.
>>
>> This version of ACP is only used with the designware I2S IP?
> Yes this version of ACP only uses designware I2S controller.
>>
>> I would try to find a way to force stop the DMA in case the DAI has been
>> already stopped.
>>
>> If this is not possible than the only solution is to do this in core, 
>> imho.
>>
>> For that you would need a flag to say that the platform (DMA) needs the
>> DAI to be active when stopping it.
>>
>> If the same ACP have problems with different DAIs, then it is a property
>> of the platform driver.
>> If the ACP only have problem against the designware I2S then it is a
>> link property.
>> If this ACP only used with the designware I2S then it is again, most
>> likely the property of the platform driver.
>>
> Hardware signal broken between ACP and Designware I2S controller with 
> re-ordering the sequence.
>   > It is surely not a designware IP issue, trying to solve it there is 
> wrong.
>>
> As it's not a designware IP issue, initially we started idea with 
> introducing quirk that applies for this ACP version based AMD platforms.
> 

Hi Peter,

Any suggestion on the work around for this issue?
How about declaring a flag in sound card structure and this flag will be 
set in stoneyridge machine driver.

Based on flag check trigger stop sequence will be re-ordered.

Thanks,
Vijendar
