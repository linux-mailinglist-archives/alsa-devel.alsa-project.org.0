Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDC23091F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 13:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E6731673;
	Tue, 28 Jul 2020 13:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E6731673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595936712;
	bh=kfENBeIFab7aDdYBr6gyPiyqdZNrnkLF74+W8OQUWf4=;
	h=Subject:From:To:References:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P56alk6AYeWFOZLmiF0iVzv2MwmOosVjO0sUqLrV1kGOIGTMvBJ1vtU6m94XKt2xP
	 KK6jQzjxby08BkLdnEOX04TlcrESP2oSIT5ldkkyVyLCOGn/j9Anh4bIFwTIIri0Xz
	 bznQl2Jl5exPfofQusL2fVjw+Hj2kOm81iy9u5BM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67768F800AD;
	Tue, 28 Jul 2020 13:43:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 282ABF8021E; Tue, 28 Jul 2020 13:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34634F8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 13:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34634F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="DFO25KKo"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595936599; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: To: From:
 Subject: Sender; bh=C2g3qCsM1rQjNC6Re9u3OWUPrxkKyricosFKiC3IGhw=;
 b=DFO25KKoEFU+I4XOhLNA72O1ZK2LpNpGp+kj8zaDHFlp0OgilsBAhz1BJpYeHYhr0X/69tFt
 O2RYlfm2bRA/KD18UaEJbFo8DEnNjHG2BsrEZ+eKhc3YAw6h7P4b27B12hFsKg/EnTeNnGQu
 vPtcSqdg/Vn9x1atizcIMdI8fso=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n17.prod.us-east-1.postgun.com with SMTP id
 5f200f531db0b33fd89bcf4d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 11:43:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0815AC43395; Tue, 28 Jul 2020 11:43:14 +0000 (UTC)
Received: from [192.168.0.129] (unknown [183.83.142.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A0FBC433C6;
 Tue, 28 Jul 2020 11:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0A0FBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
Subject: Re: [PATCH v4 00/12] ASoC: qcom: Add support for SC7180 lpass variant
From: Rohit Kumar <rohitkr@codeaurora.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <d1e6d60b-9f00-266d-74ad-8c18bbf8d142@linaro.org>
 <cb02a3d7-a947-852d-739f-a5f4b823f06a@codeaurora.org>
Message-ID: <b5cb020c-4fc8-376f-3308-71bf3a244d26@codeaurora.org>
Date: Tue, 28 Jul 2020 17:13:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cb02a3d7-a947-852d-739f-a5f4b823f06a@codeaurora.org>
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


On 7/27/2020 3:20 PM, Rohit Kumar wrote:
>
> On 7/24/2020 4:52 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 22/07/2020 11:31, Rohit kumar wrote:
>>> This patch chain add audio support for SC7180 soc by doing the required
>>> modification in existing common lpass-cpu/lpass-platform driver.
>>> This also fixes some concurrency issue.
>>>
>>> Changes since v3:
>>>     - Fixed yaml documentation comments and make dt_binding_check 
>>> issues.
>>>     - Moved general fixes out of sc7180 specific patches as 
>>> suggested by Srinivas.
>>>     - Update clock-names to make it same as existing platforms.
>>>
>>> Ajit Pandey (4):
>>>    ASoC: qcom: Add common array to initialize soc based core clocks
>>>    ASoC: qcom: lpass-platform: Replace card->dev with component->dev
>>>    include: dt-bindings: sound: Add sc7180-lpass bindings header
>>>    ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
>>>
>>> Rohit kumar (8):
>>>    ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
>>>    ASoC: qcom: lpass-platform: fix memory leak
>>>    ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
>>>    ASoC: qcom: lpass-cpu: fix concurrency issue
>>>    dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu node
>>>    ASoC: qcom: lpass-cpu: Use platform_get_resource
>>>    ASoC: qcom: lpass-platform: Use platform_get_irq
>>>    dt-bindings: sound: lpass-cpu: Move to yaml format
>>
>>
> Thanks Srini for review and testing.
>
> Mark, I am planning to repost patch07 onwards to address comments by 
> Rob as
>
> there are no comments till patch06 and they are just fixes.

Hello Mark,

Are you planning to review/merge the changes till patch06. If not, I 
will resend those

patches along with comments addressed on patch07 onwards.

Thanks,

Rohit


>
>> Tested this on Dragon Board 410c!
>>
>> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> --srini
>>>
>>>   .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  79 --------
>>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 
>>> ++++++++++++++++++
>>>   include/dt-bindings/sound/sc7180-lpass.h           |  10 +
>>>   sound/soc/qcom/Kconfig                             |   5 +
>>>   sound/soc/qcom/Makefile                            |   2 +
>>>   sound/soc/qcom/lpass-apq8016.c                     |  86 ++++++--
>>>   sound/soc/qcom/lpass-cpu.c                         | 204 
>>> ++++++++++---------
>>>   sound/soc/qcom/lpass-ipq806x.c                     |  67 +++++++
>>>   sound/soc/qcom/lpass-lpaif-reg.h                   | 157 
>>> ++++++++-------
>>>   sound/soc/qcom/lpass-platform.c                    | 155 
>>> +++++++++++----
>>>   sound/soc/qcom/lpass-sc7180.c                      | 216 
>>> +++++++++++++++++++++
>>>   sound/soc/qcom/lpass.h                             |  63 +++++-
>>>   12 files changed, 930 insertions(+), 299 deletions(-)
>>>   delete mode 100644 
>>> Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>>>   create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
>>>   create mode 100644 sound/soc/qcom/lpass-sc7180.c
>>>
-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.

