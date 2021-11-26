Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19245E6E9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 05:41:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58C9318DD;
	Fri, 26 Nov 2021 05:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58C9318DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637901670;
	bh=Mx9mWGCvY4XzqIEJNhqMBkTcFKubkKPBUm+dmYaNStM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K1jcghG44K9Nwzbv377r1P3+UN2H5VFeQTrZAZIvjNHB5wJU/tI9wzyTYGj77Li+q
	 v7lIJwQEOGjoee4Lyo4SLlXFv22DcA6+kHini5dhtPy/9G7gVp/yle67VgsoH4tc4o
	 8/XLAIm8z6vZvKrmTnm6+7WunMRPluvyZpgo5PJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6811F80245;
	Fri, 26 Nov 2021 05:39:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78D52F80212; Fri, 26 Nov 2021 05:39:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 654F8F80132
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 05:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 654F8F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="sr4sTVbH"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637901584; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=+pUbjW7Z8WLps/cKoiWRu8LdT/rmntmlr+hAGcdaE8Y=;
 b=sr4sTVbHvOnvk0f2islkiKJ6mRNN3/rRKrrvXop/dlYawFpUrMxZssGS4Izm8pX5KVIdqTgp
 m/kxtg9nxBCkNioXQPRjx4e43H1+D+EAyfK3CzX8TVrPu/s7JOfhdFm1XwxILXyCvLw7E+wZ
 stSdd4JoXzJ/FopyOCK8wDpBXjw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61a0650ebebfa3d4d5dc2bde (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 04:39:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 30A8DC4360D; Fri, 26 Nov 2021 04:39:42 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DA7BAC4338F;
 Fri, 26 Nov 2021 04:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DA7BAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v5 00/10] Add support for audio on SC7280 based targets
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
 <5f750cfc-dace-59a7-2eb4-4831a313064c@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <f8d17e44-c131-8ca5-6abd-baea44d72044@codeaurora.org>
Date: Fri, 26 Nov 2021 10:09:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5f750cfc-dace-59a7-2eb4-4831a313064c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 11/23/2021 5:58 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!!
>
> On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
>> This patch set is to add support for Audio over wcd codec,
>> digital mics, through digital codecs and without ADSP.
>> This patch set depends on:
>
>>     -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=570161
>
>>     -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=572615
>
> Except this one, rest of the patches are already in sound-next.
> and the only dependency I see here is the final patch which adds 
> Kconfigs to the soundcard SND_SOC_SC7280.
> Why not just move those two lines in the patchset that adds the 
> soundcard?
>
>
>
> --srini
>
Okay. will move this dependency to corresponding patch.
>
>>     -- 
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=559677
>
>>
>> Changes Since V4:
>>      -- Remove unused variable in lpass-sc7280 platform driver.
>> Changes Since V3:
>>      -- Remove redundant power domain controls. As power domains can 
>> be configured from dtsi.
>> Changes Since V2:
>>      -- Split lpass sc7280 cpu driver patch and create regmap config 
>> patch.
>>      -- Create patches based on latest kernel tip.
>>      -- Add helper function to get dma control and lpaif handle.
>>      -- Remove unused variables.
>> Changes Since V1:
>>      -- Typo errors fix
>>      -- CPU driver readable/writable apis optimization.
>>      -- Add Missing config patch
>>      -- Add Common api for repeated dmactl initialization.
>>
>> Srinivasa Rao Mandadapu (10):
>>    ASoC: qcom: Move lpass_pcm_data structure to lpass header
>>    ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
>>    ASoC: qcom: Add register definition for codec rddma and wrdma
>>    ASoC: qcom: Add lpass CPU driver for codec dma control
>>    ASoC: qcom: Add helper function to get dma control and lpaif handle
>>    ASoC: qcom: Add support for codec dma driver
>>    ASoC: qcom: Add regmap config support for codec dma driver
>>    ASoC: dt-bindings: Add SC7280 sound card bindings
>>    ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
>>    ASoC: qcom: SC7280: Update config for building codec dma drivers
>>
>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  69 ++-
>>   sound/soc/qcom/Kconfig                             |  13 +
>>   sound/soc/qcom/Makefile                            |   4 +
>>   sound/soc/qcom/common.c                            |  39 ++
>>   sound/soc/qcom/common.h                            |   1 +
>>   sound/soc/qcom/lpass-cdc-dma.c                     | 195 ++++++++
>>   sound/soc/qcom/lpass-cpu.c                         | 245 +++++++++-
>>   sound/soc/qcom/lpass-lpaif-reg.h                   | 103 ++++-
>>   sound/soc/qcom/lpass-platform.c                    | 513 
>> ++++++++++++++++++---
>>   sound/soc/qcom/lpass-sc7280.c                      | 416 
>> +++++++++++++++++
>>   sound/soc/qcom/lpass.h                             | 150 ++++++
>>   11 files changed, 1669 insertions(+), 79 deletions(-)
>>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
>>   create mode 100644 sound/soc/qcom/lpass-sc7280.c
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

