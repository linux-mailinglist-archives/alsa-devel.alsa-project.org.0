Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E2C37005C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 20:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 480D71698;
	Fri, 30 Apr 2021 20:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 480D71698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619806785;
	bh=EIkPsqOy7wzrE3WjtT6CmEUQgv31CsraEs5gKta5uzI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTsTaEdYPVFbUlpYgxcDjS2BZgltqGq74kAGZKwHkf9B710zUk9KFlyIV5KyQtigw
	 GOmKF82ICIuqCzQA2fRNDFeAeiBkBZppYNG+tE9JAvazOzQHQjibwfjb7eGr2OPFmO
	 ysjtpZGamLSDL7LGexSFEyXFBj+ytz+XAp+8VKGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8EE7F800D3;
	Fri, 30 Apr 2021 20:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2138FF8016C; Fri, 30 Apr 2021 20:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_65,PRX_BODY_76,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EABE2F800D3
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 20:18:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EABE2F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=amd.com header.i=@amd.com header.b="TMK5kdAW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFOe8i4n7HsBIwPxx5QZiGtsvAIe8Rq/KtOP9BEFwQ1w0V8ufA34P8HT8kQZIT9yhmah/ZyorB1gYqlgKQyMVdKDYoXxo4ZbuzA63ycKBWfwmFT/2ze3gjHTDZqQiwsxvn+w+DVJf1eSO0tbBeqzl3yBsgaHLY+0GmdJnTvzJkHhIKaRv5BiVV8NGLHNpB8qyjj5jhjLmFpafDGEOAFbM0y6VQd4xOvHa2Y7AKeQEH1WESp/MZC7/faMVxCZ4RN+cSDvIrbWRqoLeZE2lXoQykH5JOGFFYahSGzd8HKLLWieCrfpF+B7/Y9d/Pt7YnWn8ax6NaZKPU5UnN4MucGL5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76up+YgQzFqQ8mJpXA4fFEgG1/MFufQZeA8VbIRioyY=;
 b=F4sdW88LcePoVixE2WL/RLhYjZh1CbMRbCBS9YzDeEN7dl5WEOgjX0UlhlSqKcn35ZPh6Q2XGH99RvtQIeFiKJWaVpqVY4/UnISmCzv7eWwQn8SYGa1vTaL9/E/3SFKF9Pd6zkvpQs6TP+8nGVbjFs60mZV+iS8IRqUQf3/7TBkKomngOu6Lo9BRzyCobzgHTdOImWNQyq/LGXv0cxW4zYYUt51p/oiboageUPUdHjEvwj5A2ZCpimL68b5fKxutlLftN6Pc9PSTNQSvzi3dZqgGG1xoS6g7TqVI7OPrfikyNWRxygPizey/0KyKz7KmvBRg10s+m//zBz2QIfKKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76up+YgQzFqQ8mJpXA4fFEgG1/MFufQZeA8VbIRioyY=;
 b=TMK5kdAWjlprVudnJfXG66bD0IQSCci04pmIJKTImri13d08WJdw3Dlrkgt6wV3dtOY9qwZ9MCMXljAf4XNpAUKQpandj5YW9N3w4ck7Pw84Dv0xkKItCPhoElYKOsMNtJAsXqFEIpsFC3uyYEOHFx21ZhzrhUTjSa5XWZ1bdFc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MWHPR12MB1392.namprd12.prod.outlook.com
 (2603:10b6:300:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Fri, 30 Apr
 2021 18:17:59 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507%11]) with mapi id 15.20.4065.027; Fri, 30 Apr
 2021 18:17:59 +0000
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
 <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
 <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
 <b86ad586-9513-8fa9-54e3-a0b4a3a7fd92@amd.com>
 <070b4e5b-b7bd-b8a6-beea-593a94ec3078@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <26c79eec-5e74-38bc-465b-0ca2b2d9a6f5@amd.com>
Date: Sat, 1 May 2021 00:05:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <070b4e5b-b7bd-b8a6-beea-593a94ec3078@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.80.7]
X-ClientProxiedBy: KU1PR03CA0044.apcprd03.prod.outlook.com
 (2603:1096:802:19::32) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.31.162] (165.204.80.7) by
 KU1PR03CA0044.apcprd03.prod.outlook.com (2603:1096:802:19::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Fri, 30 Apr 2021 18:17:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 875b7c6b-ae05-4199-af7c-08d90c044888
X-MS-TrafficTypeDiagnostic: MWHPR12MB1392:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1392EBF20B9B9DC391CC3E45975E9@MWHPR12MB1392.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIb6q5F4IlXhjoBplw13jQ+BUm1EM7v9LFA9CwkYWYcKQD+hA4V8tjE/thpognOdOuwWxoSyy6RDU+RNbQh5uWCQWyRSaEBifk3jfndwZrxIZ6ob+XKOyAv7iibXCflQer27TVbX6vY1VQMxyx4C2EHc6ynCzqciZYImrIlFa20RvjSS+r+8UcZab4JAZZ9JKSq2ked2FNB51mgDuVHtneTjxlKQ9oFgRfrFk+tM4AduwuuEGWomn/oR1ca7yZtv8AKGJVJrZE74YXrXauhIT4ExYxqbAHso7SmVnkKlrVdL28OZq1XA/L7vOSHF13sHYpv4/uUXz+ufIZ69KIhdCiQL1EZ8vhqgSMZDRD3xeDkFjDXMZKVVVVzDOcP/19yxUiV4yjUXZtjrtpX+6nanHI5scjgou2+efL/VLiYJkJ6vCCuUipG+vk/rS6AfqNHmcSWzJJ6dCXIar+4jYri0qbX57l+nwsQasftE8tFFrDOm2EziBrgJCs3xubshLrK4YSQlmISoKnNPq7MtAgagzRR6HaQ0tPbp7TTVdcqlc66lIPYArWvWCu9eg3XvP3RpLa4Jqo1p/4zpoMH+EOFjzANm3/zG8A0XLwutU5on9FeZJL/r29+zCQ+G0/RXzw3c4XcBeHLr7aCsdyEtZhA6fJ7ScWCL6AlR4iXghjjwarwmFjsmq7KL7hQHxWqFf3mtk8Bl4GtygtEFfCorffMq+n57F8IkMUb88PGyVl0L7y3q+R+vftXoNdK+9At6NuM2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(8936002)(83380400001)(31696002)(478600001)(66574015)(6486002)(110136005)(54906003)(36756003)(26005)(2906002)(16526019)(2616005)(86362001)(956004)(53546011)(316002)(16576012)(186003)(31686004)(7416002)(52116002)(5660300002)(6666004)(38100700002)(38350700002)(8676002)(66476007)(4326008)(66946007)(66556008)(70780200001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?nC6SWNgF1t/A1Q6dAaKT1ZZBX381JYAo5iuVefQjWi6Es5QRt+Ix7G4A?=
 =?Windows-1252?Q?+WuPCLB+PQ1xzJWax+RSHEF1BwF3aVWd22DDkk0frYglYLURmrkEgHdj?=
 =?Windows-1252?Q?i961pfjzP9r4gwJlQnpokutH47r482NSYd5O1Qj9Zk55jy/6mbLDJv2r?=
 =?Windows-1252?Q?QEoFLMPYkbjId5xt4f5FXHuYMO0E4cSoBKQ0fhmdV9LIslNDRRbVSTql?=
 =?Windows-1252?Q?OvEU6Fyc6a6sakEiNMVsRK4oWH/80ghK7YofggfU5GFiQ9SzJz6uRmYS?=
 =?Windows-1252?Q?qDqW906+9isKYKPEgM62r6R9dgIiuWJBR/t0I/OzaVCXjDxTIlYIwjcF?=
 =?Windows-1252?Q?ih4M8xcSPaWLXlviJD4XqzJ6MWRFvVvvze9+n9iQkYZFWp9sKKWKxB3W?=
 =?Windows-1252?Q?GDt9Jr79T8LlfmUcY99zYuqLIQwkkuRHsD01szPxqEMBkQiUBZT/zldH?=
 =?Windows-1252?Q?SyGTy8mdtJaINsu/rixDccljLUpe/cGp99i3jqFBcE0Tf6s3GoIPTnmd?=
 =?Windows-1252?Q?7kspuqn/50sNJyXotw43+FdZfwfy4BJ4QyYpXCmybI83DTTXPZ7FiSPa?=
 =?Windows-1252?Q?jAmQ/gGC/xx+2Y+bXHSviYQYxKuoH06hjhJB1xP5egE7wYkSnuFUzLIK?=
 =?Windows-1252?Q?Ya2JMGnNj/oOn41GzoL3ZtmGeEiDt/KciP9cWBSioCRQ0fNFTfK8yvX2?=
 =?Windows-1252?Q?nahdHZiobYjQ0QQ3NG+GSYV5ycWzG/GDt1eDcAVo4TUvahilpxZxaj4x?=
 =?Windows-1252?Q?6UVw3F+dR9rkWMhH/RSiuGA+tD/0XscgNAwSOsoN9zGxTNyeDSVwxJTc?=
 =?Windows-1252?Q?tOUuFSR/zT2TXPDbXgpcmL6E+xXFHpPJp3co8MGMt8DBB5O0N08oTxS3?=
 =?Windows-1252?Q?+clGlEwdxBiYisWg7ksHkKS8oDP28kVco1Kguaye1AppGKFw57tECC25?=
 =?Windows-1252?Q?VWjtv0yil8HQfaCb2LXXbts63HcW7s/zLqa1H5/YnbWBmei+HJ1hg+Pm?=
 =?Windows-1252?Q?TVTaAZ4WRBpzyTI111p68V6PlKpFQmDEYd/ZUWGS7WqjDPqUdAiIT0Ow?=
 =?Windows-1252?Q?BO0N6zjUwTN5lGAAsQqiF1fZtgh3wkrd7AQNCw0OrTg9tBhU81ahuHcu?=
 =?Windows-1252?Q?o5saNOO96Lj5n+8eXXPgnrTJi+qYfdb1J0hnygZ4/MIFsGizOoSDN0hm?=
 =?Windows-1252?Q?2v24p4s4L3NJPOfS1GbDxkRLmPuzQHOpU9YonuiNQqqJoQodEjlBO/gZ?=
 =?Windows-1252?Q?gYKA1U3usbqy7nv7VyYPVpjT7GuDGod8+k4Nt3iXMpzvVbppyT7yeyVE?=
 =?Windows-1252?Q?lrFcvpMMMb+GCOJIrPLPSLIilHqMAz1zBquDFc2TP4z+VDQzzzjhF+2F?=
 =?Windows-1252?Q?vYePiOSc2lSfpxFWU1cfqU4yw2MxDCpyldkCkovy32diGv2gC4bJJHW+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 875b7c6b-ae05-4199-af7c-08d90c044888
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 18:17:58.9484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4UVNhLYFMNVUCuDbyd02M4FKtlWtF/S+ZyE6o9KbSaq2WY9IDXIXdcNEa8oKIbY1Oo/6dN7RQeMctELb3ZRyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1392
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



On 4/30/21 11:12 AM, Péter Ujfalusi wrote:
> 
> 
> On 28.4.2021 18.35, Mukunda,Vijendar wrote:
>>> Thanks for the explanation.
>>> This is not upstream, right?
>>
>> Driver is already upstreamed.
>> Stoneyridge platform based products already into market and working fine
>> with 4.14 kernel version.
>> Currently Kernel migration from v4.14 to v5.10 is in progress for
>> Stoneyridge platform and release got blocked due to Audio use cases
>> failures.
>> In v5.10 kernel base, re-ordering of stop trigger sequence is causing
>> DMA channel stop failure for both playback & capture use cases.
> 
> The dai - pcm start/stop ordering has changed in v5.5, more than a year
> ago. If the support is upstream it should have been noticed by users.

AMD partner using their own repositories where kernel is not migrated to 
5.10. Still products are running with v4.14 kernel only.
That's why users hasn't faced this issue.
> 
>>> What is still not clear to me is which channel fails?
>>> A) the DMA between ACP FIFO and the I2S
>>> B) the DMA between ACP FIFO and system memory
>>
>> There is difference for playback and Capture use cases.
>>
>> Playback:
>>
>> channel 1 : DMA transfer from System memory -> ACP memory
>> channel 2 : DMA transfer from ACP memory -> I2S memory
>>
>> Capture:
>>
>> channel 1: DMA transfer from I2S memory to ACP memory
>> channel 2: DMA transfer from ACP memory to System memory
> 
> Yes, this is why I used A and B to refer to the DMA channels.
> 
>> In case of playback, Channel 2 is failing where as in case of
>> capture channel 1 is failing.
> 
> So channel A is failing.
> 
>>> in acp-pcm-dma.c on stop you have a busy loop (10000 iterations) to
>>> check if the channel is in fact stopped in response to the cleared run,
>>> IOCEn bits and the set Rst bit.
>>
>> DMA channel run bit is cleared and Ioc bit also cleared for channel 2 in
>> case of playback .
>> After that as part of DMA stop sequence, DMA channel reset is applied.
>> When DMA channel status is polled for stop, its failed to stop.
>>>
>>> Channel closer to the destination is stopped first which sounds
>>> reasonable, but on playback you ignore timeout from A, on capture you
>>> ignore the timeout from B.
>>
>> Please refer above explanation.
>>
>>> Still the issue sounds like exactly what I have described. One of the
>>> DMA is failing to drain because the IP is stopped?
>>
>> As per our understanding, failing to stop the DMA by hardware is causing
>> the issue.
>>
>>>
>>>> Need find a right place to implement a work around only for AMD
>>>> stoneyridge platform.
>>>
>>> Is this really only affecting stoneyridge platform? Are there other
>>> platforms using drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c ?
>>>
>> This design is being used only in stoneyridge and Carrizo platforms.
>> But only stoneyridge platform is productized.
>> New design is implemented for later generations of APU series.
> 
> Right.
> 
> This version of ACP is only used with the designware I2S IP?
Yes this version of ACP only uses designware I2S controller.
> 
> I would try to find a way to force stop the DMA in case the DAI has been
> already stopped.
> 
> If this is not possible than the only solution is to do this in core, imho.
> 
> For that you would need a flag to say that the platform (DMA) needs the
> DAI to be active when stopping it.
> 
> If the same ACP have problems with different DAIs, then it is a property
> of the platform driver.
> If the ACP only have problem against the designware I2S then it is a
> link property.
> If this ACP only used with the designware I2S then it is again, most
> likely the property of the platform driver.
>
Hardware signal broken between ACP and Designware I2S controller with 
re-ordering the sequence.
  > It is surely not a designware IP issue, trying to solve it there is 
wrong.
> 
As it's not a designware IP issue, initially we started idea with 
introducing quirk that applies for this ACP version based AMD platforms.

