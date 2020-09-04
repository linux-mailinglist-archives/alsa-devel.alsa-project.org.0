Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8462F25D717
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 13:23:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED87D1B03;
	Fri,  4 Sep 2020 13:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED87D1B03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599218587;
	bh=8pVmz0o3OoIQ5HbXtj/1WjtjF6Iyr+tVEffv2fUGSQw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXI6mukK0B7V2kMXfiS3TBs+Cs3RqEaUSun7xqV3kOp46LpDWSPII9s6VzEi0D6XD
	 2n5p8LZYnb1bivkLLF9ibLfCd/H36B4YwiCKGlh9lNeO6s4sFve1mEu4Yv8aecvIcR
	 cLMTJRvtaKaz/ne0ejTOxuPMZH4rqNdRIQ+75qAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 306D2F801DA;
	Fri,  4 Sep 2020 13:21:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29B6CF8024A; Fri,  4 Sep 2020 13:21:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,
 RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from a27-18.smtp-out.us-west-2.amazonses.com
 (a27-18.smtp-out.us-west-2.amazonses.com [54.240.27.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE38DF801DA
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 13:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE38DF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="NI8hdYvZ"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="O+K8UB+C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599218469;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=8pVmz0o3OoIQ5HbXtj/1WjtjF6Iyr+tVEffv2fUGSQw=;
 b=NI8hdYvZzz4LRN1uMPKrkj3ikxmXX13JSC/1yWOWeB2LxkV7NshLhn7ItJv8XiiK
 c88t6drJBgiqhMMSfjdWEtmt+pNdWDDExnkhpLggvLdBdcr8nVKvdkR1pZDoCQxnrlS
 eby+CDSv4fiRymsEE27dTCzrW6Fb3WPwc6GCDBpg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599218469;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=8pVmz0o3OoIQ5HbXtj/1WjtjF6Iyr+tVEffv2fUGSQw=;
 b=O+K8UB+Crou5eaGDv634ai5Hx7Ow9osaMoABDmwJjqZ2dcJL7Kr9LuzMQpEh72Z2
 21uN0ZhyotLbIwi0yhuxqaJRWYfl0870/ehlRkNRBpFkTlWrPm+Z9GHHMsXf4H1/99R
 GlBXXdRTHP3fOqUv/X82h5CWFinTVEeaOtYxg0Pc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D58BDC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
 <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited
Message-ID: <0101017458d94a50-5b66b039-ef71-4af0-9120-40c9e6c4fda1-000000@us-west-2.amazonses.com>
Date: Fri, 4 Sep 2020 11:21:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-SES-Outgoing: 2020.09.04-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

Thanks Srinivas For Review!!!

On 9/4/2020 4:11 PM, Srinivas Kandagatla wrote:
>
>
> On 31/08/2020 07:39, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Upadate lpass cpu and platform driver to support audio over dp.
>> Also add lpass-hdmi.c and lpass-hdmi.h.
>>
>> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> ---
>>   sound/soc/qcom/Kconfig           |   5 +
>>   sound/soc/qcom/Makefile          |   2 +
>>   sound/soc/qcom/lpass-apq8016.c   |   1 +
>>   sound/soc/qcom/lpass-cpu.c       |  64 ++--
>>   sound/soc/qcom/lpass-hdmi.c      | 684 
>> +++++++++++++++++++++++++++++++++++++++
>>   sound/soc/qcom/lpass-hdmi.h      | 129 ++++++++
>>   sound/soc/qcom/lpass-ipq806x.c   |   1 +
>>   sound/soc/qcom/lpass-lpaif-reg.h |  48 ++-
>>   sound/soc/qcom/lpass-platform.c  | 287 ++++++++++++----
>>   sound/soc/qcom/lpass.h           |  88 ++++-
>>   10 files changed, 1225 insertions(+), 84 deletions(-)
>>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
>>
>> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
>> index a607ace..509584c 100644
>> --- a/sound/soc/qcom/Kconfig
>> +++ b/sound/soc/qcom/Kconfig
>> @@ -12,6 +12,10 @@ config SND_SOC_LPASS_CPU
>>       tristate
>>       select REGMAP_MMIO
>>   +config SND_SOC_LPASS_HDMI
>> +    tristate
>> +    select REGMAP_MMIO
>> +
>>   config SND_SOC_LPASS_PLATFORM
>>       tristate
>>       select REGMAP_MMIO
>> @@ -30,6 +34,7 @@ config SND_SOC_LPASS_SC7180
>>       tristate
>>       select SND_SOC_LPASS_CPU
>>       select SND_SOC_LPASS_PLATFORM
>> +    select SND_SOC_LPASS_HDMI
>>     config SND_SOC_STORM
>>       tristate "ASoC I2S support for Storm boards"
>> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
>> index 7972c94..0bd90d7 100644
>> --- a/sound/soc/qcom/Makefile
>> +++ b/sound/soc/qcom/Makefile
>> @@ -1,12 +1,14 @@
>>   # SPDX-License-Identifier: GPL-2.0
>>   # Platform
>>   snd-soc-lpass-cpu-objs := lpass-cpu.o
>> +snd-soc-lpass-hdmi-objs := lpass-hdmi.o
>>   snd-soc-lpass-platform-objs := lpass-platform.o
>>   snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
>>   snd-soc-lpass-apq8016-objs := lpass-apq8016.o
>>   snd-soc-lpass-sc7180-objs := lpass-sc7180.o
>>     obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
>> +obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
>>   obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
>>   obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
>>   obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
>> diff --git a/sound/soc/qcom/lpass-apq8016.c 
>> b/sound/soc/qcom/lpass-apq8016.c
>> index 5c8ae22..a1bc7e2 100644
>> --- a/sound/soc/qcom/lpass-apq8016.c
>> +++ b/sound/soc/qcom/lpass-apq8016.c
>> @@ -289,6 +289,7 @@ static struct lpass_variant apq8016_data = {
>>       .exit            = apq8016_lpass_exit,
>>       .alloc_dma_channel    = apq8016_lpass_alloc_dma_channel,
>>       .free_dma_channel    = apq8016_lpass_free_dma_channel,
>> +    .id            = I2S_INTERFACE,
>
> Before going into detail review, I see real issue in the overall 
> approach here to add new interface to exiting lpass!!
>
> Intention of struct lpass_variant is to address differences between 
> SoCs or different lpass versions. But you should not duplicate this 
> and use it for addressing differences between each lpass interfaces!
> All the dai related register offsets should still go in to this 
> structure and driver should be able to know which dai its talking to 
> based on snd_soc_dai_driver id and select correct register offset.
>
Do You suggest to use separate structure like struct 
lpass_hdmi_interface in lpass_data?
> Also on the other note, can you please split the patch if possible so 
> that it will be easy for review. Specially I would like to see header 
> file changes specific to adding new interface to be separate then 
> followed by the actual interface implementation  and then the user.
Okay, will split the patch.
>
> I also see some unrelated changes like changing buffer sizes, which 
> should go into different patch!
Okay we will separate the patch.
>
> --srini

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

