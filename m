Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A139243C45E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 09:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D77C16D1;
	Wed, 27 Oct 2021 09:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D77C16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635320970;
	bh=pyTW4zEXRe4uCe0kUzuLXJBf+/IUk3wiSGGqjt6yi0A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWEa6UHBo4jXn/znPFkc/dlVefl+K7trtbTU7cYHRCiTsFRk8JbzdM24eRIjOl35M
	 SKE7EgYU71qgVdsP1OZxCRxl890Y14rPfjMJlvQvsouVTPXDEiUuBi+xUNHUrwOBUm
	 kyvubq5Tn5Y6ZQIg0oIvzDL+o1HmZQ7lZHOsRTCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CFC2F8025E;
	Wed, 27 Oct 2021 09:48:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4881F8025A; Wed, 27 Oct 2021 09:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 727AFF800D1
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 09:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 727AFF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="TgwE1mfp"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635320883; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=sC0yyA4Ai6oK5LtbInVCUdqb1RatXgE+DLE9qmVuBzE=;
 b=TgwE1mfpP2WBFsQrRix0pbBY4KQLb9VX3p2EEn74kcIAKRLuZtd0RAg7MtgF9clRU/tHOQYY
 ZjVqa72Hg/AJgpt2YPVx33YKWJD/Sso/Y2grgt4rbBxrngfAXsV6avlRj+FX9INfCpGN4xJT
 XKL9xDBBMHJqmY558iZqUyI63mM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61790430c75c436a30ca602a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 07:48:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29170C43617; Wed, 27 Oct 2021 07:48:00 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E225C43460;
 Wed, 27 Oct 2021 07:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8E225C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl compatible
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51qO1q5ZF-fAf2Gma9a2B+iSyoQnJdJ8Fnmsz+DG0rwPg@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <d92c73d1-32b1-8d95-f3b5-ff103b330621@codeaurora.org>
Date: Wed, 27 Oct 2021 13:17:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51qO1q5ZF-fAf2Gma9a2B+iSyoQnJdJ8Fnmsz+DG0rwPg@mail.gmail.com>
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


On 10/7/2021 11:29 PM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:38)
>> Add device tree binding compatible name for Qualcomm SC7280 LPASS LPI pinctrl driver.
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>> index e47ebf9..578b283 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
>> @@ -16,7 +16,9 @@ description: |
>>
>>   properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-lpi-pinctrl
>> +    enum:
>> +      - qcom,sc7280-lpass-lpi-pinctrl
>> +      - qcom,sm8250-lpass-lpi-pinctrl
> I suspect we need to split the binding because the function list needs
> to change. Can you make a whole new file that's probably largely a copy
> of this file and/or extract the common bits into a meta schema and
> include that in both the files? Then the function list can be different
> and the clock property can be omitted in the sc7280 file.

As most are common functions and fixed number of LPASS Lpi pin 
configuration across platforms,

Only diff is ADSP bypass platforms 2 clocks are optional. Otherwise 
clock design also same for SC7280 and SM8250 based architecture.

So I feel Keeping common file is better for now.

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

