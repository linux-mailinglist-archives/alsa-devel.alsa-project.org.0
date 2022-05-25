Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B9D53376C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 09:36:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8A7163F;
	Wed, 25 May 2022 09:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8A7163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653464197;
	bh=I+gP2fgpMad/HzGG5gzm4bfoDh1wNh5Wf5cP2c/AJEY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LNo3RsTfP0BimO25bB4lr6WdfYy3bkhU4gsBqvO07BoMtVorex64NCyf2Xmu670+S
	 HDHm3j53YmGM/UnU5XA8wmQdgcI8vxAuIO7AaIjY6yoFNz2n366tVlBzDM7glymHUv
	 +i4wTxGmKsfPJzb1PTk4WcpPkwegoEFFYrPvy128=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB2FF80100;
	Wed, 25 May 2022 09:35:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 636FEF8016D; Wed, 25 May 2022 09:35:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id 69E5AF80116
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 09:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69E5AF80116
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3])
 by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee4628ddc3e020-0383c;
 Wed, 25 May 2022 15:35:27 +0800 (CST)
X-RM-TRANSID: 2ee4628ddc3e020-0383c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.26.114] (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2628ddc3e16d-c8e67;
 Wed, 25 May 2022 15:35:27 +0800 (CST)
X-RM-TRANSID: 2ee2628ddc3e16d-c8e67
Subject: Re: [PATCH] ASoC: stm32: sai: Use
 of_device_get_match_data()tosimplify code
To: Olivier MOYSAN <olivier.moysan@foss.st.com>,
 Mark Brown <broonie@kernel.org>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
 <YovZAf4S0XphBsco@sirena.org.uk>
 <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
 <d5ab354a-eb10-d31c-d55e-46a4c4d1a4ce@foss.st.com>
From: tangbin <tangbin@cmss.chinamobile.com>
Message-ID: <cd375914-a3e6-37c7-4a16-551937006f92@cmss.chinamobile.com>
Date: Wed, 25 May 2022 15:36:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d5ab354a-eb10-d31c-d55e-46a4c4d1a4ce@foss.st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com, tiwai@suse.com,
 mcoquelin.stm32@gmail.com, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

Hi Olivier：

On 2022/5/24 22:30, Olivier MOYSAN wrote:
> Hi Tang,
>
> On 5/24/22 03:44, tangbin wrote:
>> Hi Mark & Olivier：
>>
>> On 2022/5/24 2:57, Mark Brown wrote:
>>> On Mon, May 23, 2022 at 03:28:48PM +0200, Olivier MOYSAN wrote:
>>>
>>>> The current patch requires a change in the driver.
>>>> Either changing STM_SAI_x_ID enums, or replacing data by a struct.
>>>> For instance:
>>>> struct stm32_sai_comp_data {
>>>>     unsigned int id;
>>>> }
>>>> struct stm32_sai_comp_data stm32_sai_comp_data_a = {
>>>>     .id = STM_SAI_A_ID;
>>>> }
>>>> struct of_device_id stm32_sai_sub_ids[] = {
>>>>     .data = &stm32_sai_comp_data_a},
>>>> }
>>> Either approach works for me (or a revert for that matter).
>>
>>      Thanks for your advice, I was thoughtless.
>>
>>      I think change the date of STM_SAI_x_ID maybe simple. But if we 
>> don't change the id,
>>
>> what about add a "#define" like the line 47:
>>
>> #define STM_SAI_IS_SUB(x) ((x)->id == STM_SAI_A_ID || (x)->id == 
>> STM_SAI_B_ID)
>>
>> then in the judgement, wu use:
>>
>>      sai->id = (uintptr_t)of_device_get_match_data(&pdev->dev);
>>
>>      if (!STM_SAI_IS_SUB(sai))
>>
>>              return -EINVAL;
>>
>>
>> if you think that's ok, I will send patch v2 for you .
>>
>
> If we allow null value in STM_SAI_IS_SUB(sai) check, we can miss real 
> NULL pointer error from of_device_get_match_data().
>
> The simplest way is to change STM_SAI_x_ID enums I think.
> But honnestly, I feel more comfortable to let the driver unchanged.
>
Oh，you are right, I am sorry.

Please forget this patch, I'm sorry to have wasted your time.

But I saw some codes is useless in the line 48 & line 49, I think we can 
remove it.

If you think so, I will send this patch for you.


Thanks

Tang Bin


> BRs
> Olivier
>
>> Thanks
>>
>> Tang Bin
>>
>>


