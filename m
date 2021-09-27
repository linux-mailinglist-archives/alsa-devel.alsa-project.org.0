Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA4341996E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 18:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25FAB16AB;
	Mon, 27 Sep 2021 18:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25FAB16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632761027;
	bh=AqQSZ0LWnk6eKBwb5y1OdnvdQzHTckf+fsxfVhKVduI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GuVMj9FkDaz7aY6J+k73v92GpD6Dm/lS5YuoXSKCL7d9Sgj1tCryVDNVLJxhRbXb9
	 fNoK8YzxGAi8BtsPb9/I+RBgWGe0QzNU6udvRaRvBH4ZkfLnV7P8xwvcMGh8e8c8rY
	 E1yjwcBppYC2wn3ItX1uK9x8D1N2BbWrQFezJc/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A279F801F7;
	Mon, 27 Sep 2021 18:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAED2F80227; Mon, 27 Sep 2021 18:42:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F0A7F80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 18:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F0A7F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="gC8PsfcZ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632760937; h=Content-Type: In-Reply-To: MIME-Version: Date:
 Message-ID: From: References: Cc: To: Subject: Sender;
 bh=tNXLBU/PZ17WCoUaf0/R4Nx4u4bAHUYx6txpaYBqN2E=;
 b=gC8PsfcZCrKo1yK5IOuoLBCy+xJFxljAPDkmo1ZWaHEN50/1mh1yG8mdLFzfr09+kqAXIpfc
 AZZYRuugQdLhdHm+j9KTq0QmlmrrUJb+HHG0k63guEmsmKz38hSpUpGphMN/XYlSUU+yPyZa
 znI5wnNZE36t8reDjU3IGOW6vaw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6151f466a5a9bab6e89a46c8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 16:42:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 497E0C43616; Mon, 27 Sep 2021 16:42:14 +0000 (UTC)
Received: from [192.168.239.90] (unknown [157.47.14.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B18B4C4338F;
 Mon, 27 Sep 2021 16:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B18B4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 4/5] ASoC: codecs: tx-macro: Update tx default values
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <agross@kernel.org; bjorn.andersson@linaro.org;
 lgirdwood@gmail.com; broonie@kernel.org;robh+dt@kernel.org;
 plai@codeaurora.org; bgoswami@codeaurora.org; perex@perex.cz;
 tiwai@suse.com;srinivas.kandagatla@linaro.org; rohitkr@codeaurora.org;
 linux-arm-msm@vger.kernel.org; alsa-devel@alsa-project.org;
 devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
 swboyd@chromium.org; judyhsiao@chromium.org;>
 <1632313878-12089-1-git-send-email-srivasam@codeaurora.org>
 <1632313878-12089-5-git-send-email-srivasam@codeaurora.org>
 <e65c77f4-766c-a5ce-9cbd-f1697c1be28c@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <20ddc4ea-e99c-5492-1931-be1999655563@codeaurora.org>
Date: Mon, 27 Sep 2021 22:12:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e65c77f4-766c-a5ce-9cbd-f1697c1be28c@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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


On 9/27/2021 4:12 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!
>
> On 22/09/2021 13:31, Srinivasa Rao Mandadapu wrote:
>> Update mic control register default values to hardware reset values
>>
>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>> lpass tx macro)
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/codecs/lpass-tx-macro.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>> b/sound/soc/codecs/lpass-tx-macro.c
>> index e980b2e..66c39fb 100644
>> --- a/sound/soc/codecs/lpass-tx-macro.c
>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>> @@ -279,7 +279,7 @@ static const struct reg_default tx_defaults[] = {
>>       { CDC_TX_CLK_RST_CTRL_SWR_CONTROL, 0x00},
>>       { CDC_TX_TOP_CSR_TOP_CFG0, 0x00},
>>       { CDC_TX_TOP_CSR_ANC_CFG, 0x00},
>> -    { CDC_TX_TOP_CSR_SWR_CTRL, 0x00},
>> +    { CDC_TX_TOP_CSR_SWR_CTRL, 0x60},
>
> This does not make sense as this register only has one bit to control.
> Why do we even need to change this, can you please explain what 
> happens if we do not change this?

This register change is not making any impact. But when verified , reset 
state of this register is 0x60. so is the reason for change.

Will revert it and post again.

>
>>       { CDC_TX_TOP_CSR_FREQ_MCLK, 0x00},
>>       { CDC_TX_TOP_CSR_DEBUG_BUS, 0x00},
>>       { CDC_TX_TOP_CSR_DEBUG_EN, 0x00},
>> @@ -290,8 +290,8 @@ static const struct reg_default tx_defaults[] = {
>>       { CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0x00},
>>       { CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0x00},
>>       { CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0x00},
>> -    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x00},
>> -    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x00},
>> +    { CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0x0E},
>> +    { CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0x0E},
>
> These two registers should have default value of 0x06 as this has only 
> one clk selection field with bits 2:1.

In Kodiak document reset state 0x0E and clk selection field is with bits 3:1

*LPASS_TX_TX_TOP_CSR_SWR_MIC1_CTL*|0x32200D4
Offset: 	0x54 	Reset State: 	0x0000000E 
<https://ipcatalog.qualcomm.com/swi/chip/379/version/9247/module/11382675#>

>
> -srini
>
>
>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG0, 0x00},
>>       { CDC_TX_INP_MUX_ADC_MUX0_CFG1, 0x00},
>>       { CDC_TX_INP_MUX_ADC_MUX1_CFG0, 0x00},
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

