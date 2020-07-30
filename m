Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FCE2331B0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 14:09:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A356A1794;
	Thu, 30 Jul 2020 14:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A356A1794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596110998;
	bh=uN9I4oNGbNHeWn67ULd1vN3s5xusf0b3CGj/hPNfkic=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyQAkmdjiuBDs1oUF+ZaMTHc57jhnLzR53AxebAu0SMazOp9RjIvumPQAG4PzYPDK
	 ELx084hJW7SGo5+SoJ/SQRY+wGty+VXjX/4c9I5VBNHwTkCfqpw5V5qO+ddYGGsDrb
	 rlfuhSz4eUMJ2dM8ZjbMd0gY1BgfGmVXc2xFVkYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACABEF800C9;
	Thu, 30 Jul 2020 14:08:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8211F802BE; Thu, 30 Jul 2020 14:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67037F800C9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 14:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67037F800C9
Received: from [123.112.106.30] (helo=[192.168.0.103])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1k17Lt-0003yY-Ry; Thu, 30 Jul 2020 12:08:02 +0000
Subject: Re: [PATCH] ASoC: amd: renoir: restore two more registers during
 resume
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org
References: <20200730075020.15667-1-hui.wang@canonical.com>
 <5d00fc3f-acbe-cfb5-38fe-cd787c509a2d@amd.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <3b67744d-405a-6216-be6d-af3ccb016268@canonical.com>
Date: Thu, 30 Jul 2020 20:07:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5d00fc3f-acbe-cfb5-38fe-cd787c509a2d@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: stable@vger.kernel.org
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


On 2020/7/30 下午8:02, Mukunda,Vijendar wrote:
>
>
> On 30/07/20 1:20 pm, Hui Wang wrote:
>> Recently we found an issue about the suspend and resume. If dmic is
>> recording the sound, and we run suspend and resume, after the resume,
>> the dmic can't work well anymore. we need to close the app and reopen
>> the app, then the dmic could record the sound again.
>>
>> For example, we run "arecord -D hw:CARD=acp,DEV=0 -f S32_LE -c 2
>> -r 48000 test.wav", then suspend and resume, after the system resume
>> back, we speak to the dmic. then stop the arecord, use aplay to play
>> the test.wav, we could hear the sound recorded after resume is weird,
>> it is not what we speak to the dmic.
>>
>> I found two registers are set in the dai_hw_params(), if the two
>> registers are set in the resume() too, this issue could be fixed.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   sound/soc/amd/renoir/acp3x-pdm-dma.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c 
>> b/sound/soc/amd/renoir/acp3x-pdm-dma.c
>> index 623dfd3ea705..8acb0315a169 100644
>> --- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
>> +++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
>> @@ -474,6 +474,11 @@ static int acp_pdm_resume(struct device *dev)
>>           rtd = runtime->private_data;
>>           period_bytes = frames_to_bytes(runtime, runtime->period_size);
>>           buffer_len = frames_to_bytes(runtime, runtime->buffer_size);
>> +        if (runtime->channels == TWO_CH) {
>> +            rn_writel(0x0 , rtd->acp_base + 
>> ACP_WOV_PDM_NO_OF_CHANNELS);
>> +            rn_writel(PDM_DECIMATION_FACTOR, rtd->acp_base +
>> +                  ACP_WOV_PDM_DECIMATION_FACTOR);
>> +        }
>
>
> Could you refactor the code.
> Remove this logic from resume callback
> Add this register sequence in acp_pdm_dai_trigger() callback before 
> invoking start_pdm _dma() callback.
> Remove acp_pdm_dai_hw_params().

OK, got it.

thx.

>>           config_acp_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
>>           init_pdm_ring_buffer(MEM_WINDOW_START, buffer_len, 
>> period_bytes,
>>                        adata->acp_base);
>>
