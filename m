Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A57D36B2B5
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 14:06:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBB41689;
	Mon, 26 Apr 2021 14:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBB41689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619438772;
	bh=s5SpwcrEoof9JO1fNiIevMJ5wySqx/gcAdY5joTKFS8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fas/ieYTfwVLqwv/j8hAc7ee/e1UCoLHRRPN/mJFv4b2Vinx6cwl823IsYP34rzqi
	 JdFZBbgU8JHYpPcH3vf1pXvNs7kS4E9uXCG/PXadbi4yFXVBPd0+FBTq+AxzefQs1w
	 jc/EDUcIInpkng53jFj2qkP2wGE1zZhq/aQ1QSWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E6F1F800E3;
	Mon, 26 Apr 2021 14:04:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AB20F8016C; Mon, 26 Apr 2021 14:04:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS, MSGID_FROM_MTA_HEADER, NICE_REPLY_A, PRX_BODY_30,
 SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 981F4F800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 14:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 981F4F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=amd.com header.i=@amd.com header.b="VxzN7IcZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlXGvZC717hNqOX21CkFVXtcYIkDfYV2XlPIwawF972jtmAn8TlNU/q7ajf525Xc9LxLOn8CO4BQUMLuvWHMtx1Icp68Q+Kvv1HJM3zLge1cCzG1eiU3/66qHe8NqRFM9kAj6UMfKM5JcHpK0CktnFijKM0bMzphX4aNoiXfjAyCOSubmTmEufoB1wZ1WhwMcKWf68BJDIpryWEErz1MdfPnI/z1UFZ8rQur/4fKfQ27V2VHz7gR7o5f+cgjZBbHt/o3WgLNX1qEkEmgsEnVPjZdsKkuroNboq1RvwifepFWxN1qLemcJ6JarYwYeet1p8wtXjpy3fw6cTszWBCi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea71Ie4OBjkku5ATaHGSYlraz+twlSnPWdmFLAy3cVE=;
 b=RlcYC3c4y5HV79LDaYieApzhJgBcLlXm6Nvh1wR2QhksvMvgiLLQgIdAXhqBPT2UjqY5qf7cE+h2KthISZRGHPY7KMQkIc9rh1Zi+aP1C1T8wpxP0zT59/Uk9GK18JiLwaB38AFbYNYcG1IGwwhO9IoRfiCxffVuD17XRmhntt3ekQE2j2QSqwj/adhNCMIciTHYj9eU1aZUzfMsOEoaEqi4zOF26MnuK8UhPfSp2n9BTZX2g0BMVlwqp3NY8qzodLsyg6/Bcgli0ZGaRqApRcyfhab8JzmPaLqHH3PTrIrClfpJ1QXFFcocOS+4xuIir53SfTvNW9zKYBCITSWrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ea71Ie4OBjkku5ATaHGSYlraz+twlSnPWdmFLAy3cVE=;
 b=VxzN7IcZ8yLkXlCCg4ONd9/J+/DDcxAITnMEXrciFIfnsE/zmViRpo6sl/ANSffYI6+Kx6msSpEOh0lWp9ICgIpnCPhJfyb2Gknn8pOwv6sm+F0ht2zHMJ5m3GFGUFu9pf/fBmUe5dXejYt4A8jqT7xSdVHbLNZVjDnpfGhV2NI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR1201MB0157.namprd12.prod.outlook.com
 (2603:10b6:301:55::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 26 Apr
 2021 12:04:15 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507%11]) with mapi id 15.20.4065.027; Mon, 26 Apr
 2021 12:04:15 +0000
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
Date: Mon, 26 Apr 2021 17:51:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BMXPR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::12) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 BMXPR01CA0026.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22 via Frontend Transport; Mon, 26 Apr 2021 12:04:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c82d3e79-aff3-429f-4e04-08d908ab697a
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0157E90F88EFEDD0240B9A6497429@MWHPR1201MB0157.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dZYvfW0eqXgq9m6wf47450e6b74Hlk7nkNCqx3UEEU+7lLJkEdd8ZIN8yinpFejB3lZIVAQHGbZJqDuxB+GTpydGneqoFK3c/fqloAMkcX+JWC3nmo9SJxKSRl52vnZ7CnKmIpxqsODAW4EAK14IJoVjh+5S3UbL9JXIi8RS1gODr17GxTFIde3Yj2dAeeu9oePO/UdhzVtK2WLHv+3NitGLcC4H3CQANecQjRTbN5xwBpTDPH5IiKv5sPdhrV6OJJBk5Et2O/50W9hLs8WJxQkSQl5DcLYDqrgzzwp6e+SECRoCZiJkMbasIhzulfjwiR+JTQSLzfs92jk+3uP1bP8FO6IdITXtU74MoMmwtp+wg/Nu72czgghtgASm3FzCysrHIesiKNJ+Z46bj3vi0zQlYVqdMAC5j+Poker39heKp65MsEwDwfWiLwhgQqOecMazFdOtrfBbqTd0H1Q9OGc0cB78EBkslA5fp9T7DDCx1LjJROTH9KNx5zAMd3UIx7qNVdY6e3TE3cfeZq1fqvqwiyGeGOpVNRL4u8ZTXZ14xjPZ+KfJsnjSTndtF3NMxIzUC+adRn1qWLXWyOt7EcgLWizsbew72tqAoYQJYuAVynwCGK03rb6XWQ4GGsDtxZFF8u0qnfJ4vPYYiNPOhWyJ+qfS8IvSWiz9tBS0jHme/e+KFr8C+GwQaRCrC9RNlw0g7EYhc0KEl5bBE7S4+Wy+uz4t/F0IF2JHQ5NuKqDuJSWo7AqaQQ9q3nAKaAI/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(16576012)(110136005)(316002)(83380400001)(66574015)(478600001)(6666004)(52116002)(26005)(66556008)(31696002)(38100700002)(38350700002)(7416002)(8676002)(54906003)(956004)(16526019)(86362001)(186003)(2616005)(6486002)(8936002)(5660300002)(31686004)(36756003)(66946007)(4326008)(53546011)(66476007)(2906002)(70780200001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?KgBI8/X8O6BkyvZH0GHfMHJtjwSEfn8RoyjxS7nR06+rU6X2kF7ltuXi?=
 =?Windows-1252?Q?enjkO/ctV/3+VZwylICuhZBb/kxPc0vuaoSrCqEQHSjEDzN4SinuXlbZ?=
 =?Windows-1252?Q?oM8d3ZJGCFihA9T/r+kK3bm5vZubfFg+H6otoLdHjgOBPHI7jVxSDC08?=
 =?Windows-1252?Q?OglAcZUtZN4U+YvsX4QgqPjDgP/pjm3MTRrGIEZj6YGFw7ShxEghdpDR?=
 =?Windows-1252?Q?8uxuUqEEIv8PbEdhYNqws8gS/AYKHlWyM0adhuGGEol7Gsm52t/VbFfN?=
 =?Windows-1252?Q?zGYzUtYKg1eH82HlmtOX0y3LQgprcm03/TTRvm+4GPiHNKaaLoe00ABQ?=
 =?Windows-1252?Q?W8cLPPy4kHas1C42R0R0twQVJwBjxBDtNyXIKZvafpt22vcMFO//+8FA?=
 =?Windows-1252?Q?5y73o2xmGh7+Gf78uSc5rNafzKB6Y9ZiO/IhJAuAoggQDlTjxZTGp6QG?=
 =?Windows-1252?Q?uCzLn+vcGO0dQ0Det+QWe5jvtxxCMxDRCs1BVp0KIkIx8iDzQmqq0IjA?=
 =?Windows-1252?Q?0RuDPfbK3D9tAVubDVr6zmIP8YN3dkiNU01GQ4nipDHw+1FhIS9FLLg2?=
 =?Windows-1252?Q?4oqGZNfF48bYI271vHqENYo1eaOPHX19cwMsbQ9n/GBQ7gPEcoO574n8?=
 =?Windows-1252?Q?Y9lRgVa0+szRVLK8hTOKgANophfDzgAhQH2HA0DS7aNho25OxM91YfSc?=
 =?Windows-1252?Q?SKuN31sRN2f4bWgEQ6h6YdDjTGlEvvgicY4cvELrDopNPJZv+h+2VvF/?=
 =?Windows-1252?Q?lUCfxyQLjaiUJwgW7kx+zZiDWeENvqo6N6plHr+//3KF5pRS00FDhC30?=
 =?Windows-1252?Q?93s2NFAezMZ3aXsj7bC4oT4j3wzrvcYYByMMUBVDgf2umXC/4bigYK2P?=
 =?Windows-1252?Q?Dt3zfMBBRUG0T3lYX5wam+1UDsCKk7/lpWUAgU2H/TWx86SJCZy8MJmh?=
 =?Windows-1252?Q?jDtejGHUXk0bgfhrAToW11Jo6tJew3DPYmNhwQ6KP1hqmfUGhW+fUqVK?=
 =?Windows-1252?Q?Fsu7qlOhfa8mB8wWHnQldvhcNZPEyRjgoOo76Ih+1nTfl3F7MNX89qRh?=
 =?Windows-1252?Q?xJKqw1sKGkvgQxDdT6nKego6Rzhbj3VNceycPXn96TQBa8BN4DxKBjd8?=
 =?Windows-1252?Q?G4Q4F+i1rF5vvPaxDX3kqGFbjsOqI0tVDbLrR2/b41ZzdjzOTimDxC9M?=
 =?Windows-1252?Q?ucaVnChLwhUu3wjjL0VMozzwI7RCjbJmOob2+cb15oWmDgWJTsxSLuL/?=
 =?Windows-1252?Q?yW1sMnGlbGdHXKjjh8sX0lQXILjLOF3S7MUQ+3gZ6wS1LwYuqgCx5264?=
 =?Windows-1252?Q?u4DpyEcPrX2i8c5Dse2hB5OG56rCQQ2nuqodakFuqEub3nE4yVVk6E9/?=
 =?Windows-1252?Q?pA/xIapxaQUnKspP7GjqEA3vZjH+KGzjc7Dr2AcntSUP4l8IQNTaUy2S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82d3e79-aff3-429f-4e04-08d908ab697a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 12:04:15.5287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrVceyY5gB08ffrYDNNwk3nyCXyprlXyNyZAObg0iY2Ijg25TLGDDYNKfj8L8LtmFQNV9uuOITSDrKh29cljxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0157
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



On 4/26/21 11:49 AM, Péter Ujfalusi wrote:
> 
> 
> On 4/23/21 7:46 PM, Mark Brown wrote:
>> On Fri, Apr 23, 2021 at 09:54:38PM +0530, Vijendar Mukunda wrote:
>>
>>> For CZ/StoneyRidge platforms, ACP DMA between ACP SRAM and
>>> I2S FIFO should be stopped before stopping I2S Controller DMA.
>>
>>> When DMA is progressing and stop request received, while DMA transfer
>>> ongoing between ACP SRAM and I2S FIFO, Stopping I2S DMA prior to ACP DMA
>>> stop resulting DMA Channel stop failure.
>>
>> This again...  copying in Peter for the sequencing discussion.  If we
>> need to do this I'm not convinced that bodging it in the driver is a
>> good idea, and especially not deferring it outside of the trigger
>> operation - for example on a suspend or pause we won't actually do a
>> shutdown() so the trigger will end up not happening which seems like it
>> may cause problems.
> 
> It will certainly leave the i2s running and can lead to hard to explain
> issues

Yes I do agree. Moving code from trigger callback to some other place is
not a good idea.
> 
>> We'd probably be better off with the core knowing
>> what's going on and being able to reorder the callbacks although
>> designing an interface for that seems a bit annoying.
> 
> I agree, it would be better to have some sort of flag which tells the
> core that there is an integration issue between the DMA and peripheral.
> I believe this is only affecting playback?

No its affecting both playback and capture use cases.
> 
>>> This issue can't be fixed in ACP DMA driver due to design constraint.
>>
>> What is the design constraint here - can't we fix the design?  Or is it
>> a hardware design constraint (presumably broken signalling between the
>> I2S and DMA blocks)?

Its a hardware design constraint.


I2S driver is not directly exposing DMA interface to host.
ACP 2.x has unique design where ACP driver controls data flow between 
host and I2S as mentioned above.
ACP IP has different IP blocks within it which includes I2S controller 
and DMA controller.

ACP DMA Driver is responsible for DMA transactions between system memory 
and I2S controller.It uses two step DMA mechanism to copy data between 
system memory <-> ACP SRAM and ACP SRAM <-> I2S FIFO for 
playback/capture use cases.
ACP driver program two DMA channels for DMA transfers between System 
memory & I2S FIFO.

ACP DMA driver isn't general purpose DMA controller driver where we can 
implement terminate_all() API.

I2S controller DMA transactions are tightly coupled with ACP DMA controller.
while DMA transfer ongoing between ACP SRAM and I2S FIFO, Stopping I2S 
DMA prior to ACP DMA stop resulting DMA Channel stop failure.
Its not related to I2S FIFO flushing related handling.
Once the DMA channel failure observed during the closure of the stream,
when again new stream opened, DMA won't progress at all.

Need find a right place to implement a work around only for AMD 
stoneyridge platform.



> 
>  From the description my guess is that stop on the DMA want to flush it's
> FIFO (complete the in progress packet, segment). Since the peripheral is
> stopped it will not pull in more data -> the DMA will time out internally.
> 
> The question: how the ACP DMA driver's terminate_all is implemented? It
> can not really wait for the DMA to stop, we can not use
> terminate_all_sync() in trigger, it must just set a stop bit and make
> sure at synchronize() time that it has stopped, right?
> 
> What happens if the time between the DMA stop and the DAI stop is less
> then it would take to flush the DMA FIFO? You would have the same issue,
> but in a rather hard to reproducible way?
> 
> As sidenote: TI's k3-udma initially had similar issue at the design
> phase on the playback side which got solved by a flush bit on the
> channel to detach it from the peripheral and set it to free run to drain
> w/o peripheral.
> On capture however I need to push a dummy 'drain' packet to flush out
> the data from the DMA (if the stop happens when we did not have active
> descriptor on the channel).
> 
> With a flag to reorder the DMA/DAI stop sequence it might work most of
> the time, but imho it is going to introduce a nasty time-bomb of failure.
> Also your DAI will underflow instead of the DMA error.
> 


