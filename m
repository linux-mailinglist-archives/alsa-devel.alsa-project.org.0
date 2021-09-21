Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852241304D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 10:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F8C823;
	Tue, 21 Sep 2021 10:43:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F8C823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632213846;
	bh=AOgHeIvhpzpwXrSoQk3/URmDO1eWHlyJIImlO1A7ZQM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AeVyLIg9g8VBXTuTU1yTg3eVEKYnAM/dUAlso77LyPnnkKVP+EDixdgNkaOe/su6n
	 Wq0QD/36FgXtsSA285vehIXGGaBjxqQTu5XATx7+67PiHQCNkWFaiTWksH1kNV5ftI
	 1fGXeSTnWsiB0X9/aXVkflaT2ztYJSw92pTqbaRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EEC8F8025F;
	Tue, 21 Sep 2021 10:42:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33342F80268; Tue, 21 Sep 2021 10:42:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB42EF80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:42:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB42EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="gIDEdkqN"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632213761; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=GpX5pSz4V7nFNRLtI0j1LOAwCT2IOlbzkNy46PCg7aA=;
 b=gIDEdkqNE+tWU0lq94P80hKi5fxr6A6PckVUoN0RABfV6eDsUl3GG5uSPSHY7UL9fMrWmy24
 Nq5uko1BhkecvV6aDkntLn00xnvI0+8VIL0XLwE4wePTKwHI9MOoqTmJa2v2bOXTRAjRB3yi
 FBQB7Lnv7PWT2CiXSqiL6jpVdFM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61499af5e0f78151d670eb29 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 08:42:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2EF33C4360C; Tue, 21 Sep 2021 08:42:29 +0000 (UTC)
Received: from [192.168.204.90] (unknown [157.48.173.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 67C7DC4338F;
 Tue, 21 Sep 2021 08:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 67C7DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/7] ASoC: qcom: Add compatible names in va,wsa,rx,tx
 codec drivers for sc7280
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51L7YSA4FDLv_2Q9U3nzxK1YY8hRtZ-G0cs42nomySMTA@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <48c6b8b1-bc65-a148-254d-57a5658cdd5c@codeaurora.org>
Date: Tue, 21 Sep 2021 14:12:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51L7YSA4FDLv_2Q9U3nzxK1YY8hRtZ-G0cs42nomySMTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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


On 9/20/2021 11:47 PM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-09-20 00:35:25)
>> Add compatible names for sc7280 based targets in digital codec drivers
>> va,wsa,rx and tx.
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/codecs/lpass-rx-macro.c  | 1 +
>>   sound/soc/codecs/lpass-tx-macro.c  | 1 +
>>   sound/soc/codecs/lpass-va-macro.c  | 1 +
>>   sound/soc/codecs/lpass-wsa-macro.c | 1 +
>>   4 files changed, 4 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index 196b068..520c760 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -3578,6 +3578,7 @@ static int rx_macro_remove(struct platform_device *pdev)
>>
>>   static const struct of_device_id rx_macro_dt_match[] = {
>>          { .compatible = "qcom,sm8250-lpass-rx-macro" },
>> +       { .compatible = "qcom,sc7280-lpass-rx-macro" },
> Please sort alphabetically on compatible string.
Okay. will change and post new patch.
>>          { }
>>   };
>>   MODULE_DEVICE_TABLE(of, rx_macro_dt_match);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

