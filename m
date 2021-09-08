Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7013403369
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 06:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34F751712;
	Wed,  8 Sep 2021 06:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34F751712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631076021;
	bh=YJmFnYxvHVHkucbI8hLZESEJtuZpV02L+pDFwNZ5Fa0=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyxwEHTT8om/HFvEhY7AZRGP8qPlhCFf79M9n/CRh5G+gh4oR5P5KrbyWXI8fQL/4
	 dlRe+eFh/qJE5U0nXJX3CquCNDhPjytWN8VzTR4AWg1idIzZyDh1LkAQSGwIYfpxVu
	 2T+KcIbUhzQZuxMbnkGxhbau1Gt/f0MebHEqCKJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C15AF8049C;
	Wed,  8 Sep 2021 06:39:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EADB0F802E7; Wed,  8 Sep 2021 06:39:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9B21F800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 06:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B21F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="MEQKTk56"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631075934; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=c5x+uUqMqR66/gj4PnVIfY2Dh/QpVRbiSLzGC5KpnCQ=;
 b=MEQKTk56qOO/JOjcPV+Z0WfBY441E9Dww1SGlRfGL7x2oTjc0fEB7PKEOZOd9rw1EWA9ekBt
 YouiRd0tiFL4F+IB4f5qQpmQcow+98Bo+fnc01x7mtuS9MvZ50zoa2VWUpg+f394hSKTZZsP
 O1vR3UYmRd6iY6PQaKtTFJsYLI8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 61383e51cd680e8969d85206 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 04:38:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 090FCC43460; Wed,  8 Sep 2021 04:38:41 +0000 (UTC)
Received: from [10.242.137.170] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C112C4338F;
 Wed,  8 Sep 2021 04:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8C112C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53Zj3pp4EJ_f_kXhRm3EW=od83UO44qt91P37waEq-z4Q@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <755e99d3-4d72-3292-a5da-ad3d6045038e@codeaurora.org>
Date: Wed, 8 Sep 2021 10:08:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n53Zj3pp4EJ_f_kXhRm3EW=od83UO44qt91P37waEq-z4Q@mail.gmail.com>
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

Thanks For Review Stephen!!!

On 9/8/2021 1:54 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-09-06 06:27:34)
>> Add header defining for lpass internal digital codecs rx,tx and va
>> dai node id's.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   include/dt-bindings/sound/qcom,lpass.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
>> index 7b0b80b..187af45 100644
>> --- a/include/dt-bindings/sound/qcom,lpass.h
>> +++ b/include/dt-bindings/sound/qcom,lpass.h
>> @@ -10,6 +10,11 @@
>>
>>   #define LPASS_DP_RX    5
>>
>> +#define LPASS_CDC_DMA_RX0 6
>> +#define LPASS_CDC_DMA_TX3 7
>> +#define LPASS_CDC_DMA_VA0 8
>> +#define LPASS_MAX_PORTS 9
> Do we need LPASS_MAX_PORTS in the binding?
Yes.  based on this creating array of streams in machine driver. So to 
make upper limit introduced this macro.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

