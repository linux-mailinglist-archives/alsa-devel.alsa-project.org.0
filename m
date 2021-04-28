Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12636DB1F
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 17:19:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 398AC16D2;
	Wed, 28 Apr 2021 17:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 398AC16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619623190;
	bh=08YqS18SreCxsFsQnr+qFMYGCmQK1ECN0H9FMeOzaL0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFLyC9R1Ism0piWNhqg/2n6NFXQwiZms0ZnczFN7kt1PClr9I0v7VuMvWAJCH/5p4
	 U/xcaKGLJ0BbI/QE2bWgcLjf6yI3I/5wgYB1Zq1lGKOJ+oAjmx7GaYWfLvqYAm17ae
	 3SwT/gC8+q9r1bZfgw2ZI9pBBBQrGQgzR87Syrg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F23F80224;
	Wed, 28 Apr 2021 17:18:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E13EDF80224; Wed, 28 Apr 2021 17:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,PRX_BODY_30,PRX_BODY_65,
 PRX_BODY_76,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69B64F80165
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 17:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69B64F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="HtwEG5lo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipKvV8EUfYVZE+Fz3S59YCpWjn/XFo3k/YrZhYBbdAdyXwJpk+5hYeUB2mCbc98Gu/xAhVOtjZD5P05X3EPAksP110wSasaP3w8uU8JH0BiH2VdKlCwX3Rpl6859/5MsW1FAYBw9hw+Yi7mWB4m8N26XpWbiiqxU0x2fmQFuSoJB26ykrgFaHifYdV/frV9pYzlkmCwkB6j+cptWjBybaWkqPtnQKWWBDR8Wvapto2lchDVTz7BmvzQzWGjVV7QpG6q+N287P2RC8FsbW/dP6D3wEe+J9wdvHWnFHGR1CAKtlEqFsgulKfO48gcWApVG98IeBGfeKfZJfpnNWjAc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Os8wBG5in5U+5o01Gmkz0GG8eXDy5gKq9ud7fZau5Uc=;
 b=f257VGCEjXZyL24fb5EoRQL06I9uNxoIY5zBoCNYqTmDwP0bJIxy1VJI/LquM+MEc54AB+SXbFIOPKLiurkNAh9yMMHqcQyDkR8tRcR6SOvLXOsVp05K4BC2vXBJOkXhky8+Hzbb5FXBnlLMIPzaJ1X4bkDlRq+82wxljzdEwK2/xmY4kMSAjxS1FWuGTdzGEe/tj+xLOGYrBzpyzE+RUQC8yfxi5mUXJq9dHUDB1mNEJhZNwEwbI/slonLw9ndmlEkySXqiuacqAImFfn9cA3IesZZpo+Cq8c4lfkidvqts+KXLkMocdcP4wMmxVcM9IJE7wJbLECSDD4J5biU2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Os8wBG5in5U+5o01Gmkz0GG8eXDy5gKq9ud7fZau5Uc=;
 b=HtwEG5loqCIZH0ASekVRVcnfD0kEZBMozIf9wAd+k8sHzZR/lVGkm6Cc3WBVotXcAHYEUjB1o2sz+tHRKK65pqX8BXTNJr1iGUMQHkKl+ZIpgfC9LGGn/XLoM7wV9wnU+nIYcmynjISfIiw1or1O3fLWgQywgunbvXX0Z692flQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23) by MW3PR12MB4394.namprd12.prod.outlook.com
 (2603:10b6:303:54::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Wed, 28 Apr
 2021 15:18:35 +0000
Received: from MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507]) by MWHPR1201MB2557.namprd12.prod.outlook.com
 ([fe80::cd83:259e:74d3:2507%11]) with mapi id 15.20.4065.027; Wed, 28 Apr
 2021 15:18:35 +0000
Subject: Re: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN
 to dwc driver
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
 <20210423164617.GG5507@sirena.org.uk>
 <e1268120-7a91-da49-0bb6-89d5cb4e2cce@gmail.com>
 <b32fcc42-d67e-bfbd-ed83-7f7274fb2f79@amd.com>
 <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <b86ad586-9513-8fa9-54e3-a0b4a3a7fd92@amd.com>
Date: Wed, 28 Apr 2021 21:05:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ac5244d1-643d-6577-80cd-bf6867e75ca2@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: PN2PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::18) To MWHPR1201MB2557.namprd12.prod.outlook.com
 (2603:10b6:300:e4::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.93.39] (165.204.159.242) by
 PN2PR01CA0043.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:22::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72c7e009-19a9-43f5-51d6-08d90a58e401
X-MS-TrafficTypeDiagnostic: MW3PR12MB4394:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4394E184438E1085C1F4428397409@MW3PR12MB4394.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eiy2muiLJkGwzj63qyNCYwPlNElwTsd0pkHraTipnwk25KLGT+UK7H4Ak/X1Nqmh0N43tNLDTUnmFgrVFi6V4XZ7p3cLP4t4Bd7e+pZ2BKhEogC8wt8jSjLHlWnjw2qgkGh/kvo9+DePXsSYIG0lu0/ktKKhHNhmEdhZ1pSCXR3PyL2lOD2Kzh5AwrKpn71Zxp8o5aK8Y8GC7V7Ur5DQ/1Gh1AaKN1HTwVaw9PDq/6RORaWOsC697frMFGWfyblVabdwnCcTF8DkTibdR9b8vTXn0z0oiucETppel12k7Eb37E6NBgHg4h07Hwv5jELKRGRcnLCuQTpxmGxFapVLI0dQkukAUUpnVP0203oEFz68pHty2XVXoiRUy4ipGsVofSjVRLl5/Hvq2jG9JLJn8Dr9evXm+D2OPkVwCtaOUxV/MTLES+CVnrEx7puXSq6wsjFm1/Mr+Vb9Y4TD5VfsmuyOik562k+2f4Wi5+/M3Hyam5nMGh4o4PJ+wfjubw2FKeS+Y20brQYSIUWFynWsrEp0HDc6HWmhxuJPcBKBitovRv15bNE92lvWayEcXcI9Fma0p4FMaZ62shY1LvncdcTOVVmLp4jqSr9fvgNYy9ZUdAuhNFExPWd+rukxIY61aq902aapMdEG2rBhxK5OtlJzmb01Z8i/zkFL9kvj6e+6raLDKeDmlqbor+ULP+hjDkFczRg7yKvVpGchAP+MAaHnAp9K9L5j9i4brTtFR+zCpyWrU7ha2IZQMgrC8d9K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB2557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(6666004)(38350700002)(7416002)(2906002)(316002)(16576012)(4326008)(38100700002)(66556008)(26005)(16526019)(31686004)(956004)(66476007)(66946007)(110136005)(54906003)(186003)(6486002)(31696002)(478600001)(8936002)(5660300002)(36756003)(86362001)(8676002)(52116002)(2616005)(83380400001)(70780200001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?anLpNVc9MowA3aCCPgzXx1UoU2nYHTSgUq0P4q2qV3Vanx6YLbUVHlL8?=
 =?Windows-1252?Q?B7w5yoOMNQ37PdWnQrTf0q3qp7GtLNoLzUZmNHN8GUf4KYe9yLoTd55Q?=
 =?Windows-1252?Q?HdN7jQwkZ/6AxRF81mYOZavCAcdx2dbsXUrr4nf4gsAJU5pjhvt3+17L?=
 =?Windows-1252?Q?kvFKFcCOEy+An1RA++5U4w5unRMHhcnhNes2oiBHfFcedjkX/Hyj1oo3?=
 =?Windows-1252?Q?7XJXk9m4CR1GbZuSdtBHqRlZgWXNTZGxV7HaiiJOUZWMZDlU8W7I6n9v?=
 =?Windows-1252?Q?jvLQ5+1RdjGZ4Up5XmMN6syfMeX4Pz68p3/kAukuyIKUw3VKt4l8TKfW?=
 =?Windows-1252?Q?Efx3ThqJbcvtnotnzR2XVfefVFJ0CogrhJWziGSRWU8nlL2KpTotqpGu?=
 =?Windows-1252?Q?g4xx6sA6ajkWhFRhKRU38jTK7TrnswzKBXTNtpWYagwgbh2A5nB+/1xI?=
 =?Windows-1252?Q?SJX66sRoPjyRFPzQifdJdc1Sxa6kQxowBhYTY69E31fbMCh22NWGDbgP?=
 =?Windows-1252?Q?KYrQaReUiZTkyPLQwglKB2sB+ODIDZR2hZDucOsdk2CWmxFWA/SRi0dj?=
 =?Windows-1252?Q?T6Fst6MM65EOEvxPiyHK0Z6HSq+zdwzWqwum61wV/y1vuAkiQGvB+nZj?=
 =?Windows-1252?Q?wTE1dzajsn6tB3OLJ9bfTPykSjBpgY/tcu45q54D9BQbLwZP45hmjGj+?=
 =?Windows-1252?Q?xZDtTbTtyBnJ8KkHZ4HOWQd/vtcGhB+b6xkOShNtDDer1cUZKAS2i4LT?=
 =?Windows-1252?Q?l/HaHF7+/jVQjnm0hMfK7D2kwk83cHoAT7BUZ3shs28Z62/8qtHKRlM5?=
 =?Windows-1252?Q?3sGsI9DVdkoqFAaGu7tFTWG5AlGEDca2kA5fBuuEYWqiDVsTrmetrFIv?=
 =?Windows-1252?Q?xo+cEK8K/5XkdkHJaGtqMYv9HpLF6F7AIRr/bENfKjvMPtjXpqc/EZsE?=
 =?Windows-1252?Q?/cBjt9APRuMNBRsqJMnJpQgMHmXIUgglHkLmiMRqc4cxhcGEBYcwVHAn?=
 =?Windows-1252?Q?lw7pLodtyMFLvG11rI0EX1Alo/et51WprOeRSJzqVU1oUcBT4GH4Cfql?=
 =?Windows-1252?Q?s9O/JJtorfIFahfHAr8jrGnxpYXKr7mcaga1NP/beMXLUXY58B8PcBhp?=
 =?Windows-1252?Q?Lpy7IFtxFm0s9KqPLH6b1Ss/bcHcXagrWf3mGJjKzcHCr0CPnaT0ciuX?=
 =?Windows-1252?Q?JXwcA6UVa+FDk/RzrxygJptg7WwilMENyNWQFwqKuyrT8MKAnh79GSAe?=
 =?Windows-1252?Q?+G3/4FtH0FaR1HJa6EOqrk2euXVX+fDVQeTHSryHo9ZFkFesjXd7ligv?=
 =?Windows-1252?Q?xcu3UrKy2vbnCpqM9hCYM7++zwZFC7sQrUSwtHTjCFhnv8kbx2K9btgd?=
 =?Windows-1252?Q?DzRvzGwtz92hNOLCwZUfjZQcmkHTCqvztCzPTkecCPTROQgPU/Ss3r+S?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c7e009-19a9-43f5-51d6-08d90a58e401
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB2557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:35.0836 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5Of0r/ZDi34lvKgE6G5AOFibiztxf/bdKznUt0/loXnaFUIPyVizbCIm2i0QAs5awJVztPR1OZnBgDaINHqbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4394
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


>> ACP DMA Driver is responsible for DMA transactions between system memory
>> and I2S controller.It uses two step DMA mechanism to copy data between
>> system memory <-> ACP SRAM and ACP SRAM <-> I2S FIFO for
>> playback/capture use cases.
>> ACP driver program two DMA channels for DMA transfers between System
>> memory & I2S FIFO.
>>
>> ACP DMA driver isn't general purpose DMA controller driver where we can
>> implement terminate_all() API.
>>
>> I2S controller DMA transactions are tightly coupled with ACP DMA
>> controller.
>> while DMA transfer ongoing between ACP SRAM and I2S FIFO, Stopping I2S
>> DMA prior to ACP DMA stop resulting DMA Channel stop failure.
>> Its not related to I2S FIFO flushing related handling.
>> Once the DMA channel failure observed during the closure of the stream,
>> when again new stream opened, DMA won't progress at all.
> 
> Thanks for the explanation.
> This is not upstream, right?

Driver is already upstreamed.
Stoneyridge platform based products already into market and working fine 
with 4.14 kernel version.
Currently Kernel migration from v4.14 to v5.10 is in progress for 
Stoneyridge platform and release got blocked due to Audio use cases 
failures.
In v5.10 kernel base, re-ordering of stop trigger sequence is causing 
DMA channel stop failure for both playback & capture use cases.

> 
> What is still not clear to me is which channel fails?
> A) the DMA between ACP FIFO and the I2S
> B) the DMA between ACP FIFO and system memory

There is difference for playback and Capture use cases.

Playback:

channel 1 : DMA transfer from System memory -> ACP memory
channel 2 : DMA transfer from ACP memory -> I2S memory

Capture:

channel 1: DMA transfer from I2S memory to ACP memory
channel 2: DMA transfer from ACP memory to System memory

In case of playback, Channel 2 is failing where as in case of
capture channel 1 is failing.

> 
> in acp-pcm-dma.c on stop you have a busy loop (10000 iterations) to
> check if the channel is in fact stopped in response to the cleared run,
> IOCEn bits and the set Rst bit.

DMA channel run bit is cleared and Ioc bit also cleared for channel 2 in 
case of playback .
After that as part of DMA stop sequence, DMA channel reset is applied.
When DMA channel status is polled for stop, its failed to stop.
> 
> Channel closer to the destination is stopped first which sounds
> reasonable, but on playback you ignore timeout from A, on capture you
> ignore the timeout from B.

Please refer above explanation.

> Still the issue sounds like exactly what I have described. One of the
> DMA is failing to drain because the IP is stopped?

As per our understanding, failing to stop the DMA by hardware is causing 
the issue.

> 
>> Need find a right place to implement a work around only for AMD
>> stoneyridge platform.
> 
> Is this really only affecting stoneyridge platform? Are there other
> platforms using drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c ?
> 
This design is being used only in stoneyridge and Carrizo platforms.
But only stoneyridge platform is productized.
New design is implemented for later generations of APU series.

