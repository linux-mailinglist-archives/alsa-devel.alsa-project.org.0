Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2BC412EEC
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 09:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42AB11664;
	Tue, 21 Sep 2021 09:00:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42AB11664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632207669;
	bh=97qBLh2Qy/i/UImuuVnUsLJTBsJVswiKbK5gjo65MlY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIla0rSMW9uNO5lbHs6vo9U2SxzM3SIKI1qkT6VWE8jgF/f9t0x4ypUxnrkN1OJDq
	 nQn4YEp8Pdmq0+se72Nz5sxJdXPMxBDWPvs+Q32V2yEIW/NRRhWhgIw7Bl5F6giCxa
	 /9hIP9X+GNTV3Baj/Vba0vcsrafsMhtDOptrlLLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B13FF80124;
	Tue, 21 Sep 2021 08:59:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6758EF80268; Tue, 21 Sep 2021 08:59:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99D22F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 08:59:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D22F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="rGNdJEOH"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632207570; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mqWwXANTiQxXkA98c0p3Y/JczBb1em+X57YatmhzCkE=;
 b=rGNdJEOHgH0mP/FUYEnl8EvImEG4HYAjjRRoQRlTbSP3dz25aWPIORYNO3qhClz6QvVRvntj
 z6rZ+yBWxd6sKfDVbvU1k9birgXE+MygIYJrEsE+CDbpzT2ai/c82pfFZRaAs6+ijVkzabHb
 DyCfWOBaqN8q5Pb4iIE/bnfH5cI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 614982c9bd6681d8ed7b4cbd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 06:59:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 111AEC4360D; Tue, 21 Sep 2021 06:59:21 +0000 (UTC)
Received: from [192.168.204.90] (unknown [157.48.173.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DCBAC4338F;
 Tue, 21 Sep 2021 06:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9DCBAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 2/7] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-3-git-send-email-srivasam@codeaurora.org>
 <7c12126d-99a8-4572-6e95-b63131cae300@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <3e8ea5bd-9301-2605-b7e9-02ddab076fc7@codeaurora.org>
Date: Tue, 21 Sep 2021 12:29:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7c12126d-99a8-4572-6e95-b63131cae300@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 9/20/2021 6:54 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!
>
> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>> Update compatible names in va, wsa, rx and tx macro codes for lpass 
>> sc7280
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 
>> +++-
>> Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 
>> +++-
>> Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 
>> +++-
>> Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 
>> +++-
>>   4 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> index 443d556..a4e767e 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-rx-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-rx-macro
>> +      - const: qcom,sc7280-lpass-rx-macro
> Recently Rob did tree wide change to use enum instead of oneOf for 
> below reason
> "
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 
> 'enum' is more concise and yields better error messages."
>
> So, can you move these to enums like:
>
> enum:
>   - qcom,sm8250-lpass-rx-macro
>   - qcom,sc7280-lpass-rx-macro
>
> --srini
Okay. will change accordingly and post it.
>
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> index 6b5ca02..cdec478 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-tx-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-tx-macro
>> +      - const: qcom,sc7280-lpass-tx-macro
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> index 679b49c..e15bc05 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-va-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-va-macro
>> +      - const: qcom,sc7280-lpass-va-macro
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> index 435b019..2dcccb5 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-wsa-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-wsa-macro
>> +      - const: qcom,sc7280-lpass-wsa-macro
>>       reg:
>>       maxItems: 1
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

