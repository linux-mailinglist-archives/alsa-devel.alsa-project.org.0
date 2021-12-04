Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C99468348
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 09:00:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE9022B0;
	Sat,  4 Dec 2021 09:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE9022B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638604850;
	bh=Zln2aKJz0zZQyiiakVGBGHV2ssqKTmvUobKfpfHXas4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XEnWN0h6j0tuSlgDh6qlqHrlLNEGv7mDqxpIs2HGmg4GzGJ0EcI5xmbw1gTB8uT04
	 IxwNR0nQbbogcz0gXArLi3/e47LWWX8AZZJ8WtB2soh0bTOrRgPmdNwXRlHtijqCGG
	 xS7m2fM/AJPvqkM4izpfFZ2spg0en2sPluI5iP7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89058F80240;
	Sat,  4 Dec 2021 08:59:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D7ECF8023B; Sat,  4 Dec 2021 08:59:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 148E3F800D3
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 08:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 148E3F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="fV5jGNBr"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638604763; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RPYFRq2tetZ3XfrNaT2ZW8JmIgt6VIgZNLFs/5bLiyw=;
 b=fV5jGNBrPdmoVMp5cPAol5OCmHcUJR14FG8fPBqjl7criYXJrP2fupPTcskCirkgie6Vdgcl
 hRY6ExeXB3XakUCbp7afqZoCoSIryOlsFPhI5OgpZD9cyYsebVSYXZTLkS9gFqplLLvBd0Vk
 Cyuj7gEabkELLAA5/9b/fTkYCc0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61ab1fd9e7d68470af316bb1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 04 Dec 2021 07:59:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9089FC4360D; Sat,  4 Dec 2021 07:59:20 +0000 (UTC)
Received: from [192.168.29.24] (unknown [49.37.168.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B7A07C4338F;
 Sat,  4 Dec 2021 07:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B7A07C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v8 09/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
To: Rob Herring <robh+dt@kernel.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
References: <1638547658-22032-1-git-send-email-srivasam@codeaurora.com>
 <1638547658-22032-10-git-send-email-srivasam@codeaurora.com>
 <1638574455.248037.1043006.nullmailer@robh.at.kernel.org>
 <CAL_JsqKf4Y84+_PQqhwMEEiJNrR92urMUYSqYTEU0_c7fYnyhQ@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <07f5a5f2-cdf5-75de-9635-0edcd5e5c905@codeaurora.org>
Date: Sat, 4 Dec 2021 13:29:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKf4Y84+_PQqhwMEEiJNrR92urMUYSqYTEU0_c7fYnyhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, linux-kernel@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org
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


On 12/4/2021 5:08 AM, Rob Herring wrote:
Thanks for your time and notifying the issue!!!
> On Fri, Dec 3, 2021 at 5:34 PM Rob Herring <robh@kernel.org> wrote:
>> On Fri, 03 Dec 2021 21:37:37 +0530, Srinivasa Rao Mandadapu wrote:
>>> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>
>>> Add bindings for sc7280 lpass cpu driver which supports
>>> audio over i2s based speaker, soundwire based headset, msm dmics
>>> and HDMI Port.
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>> ---
>>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 70 +++++++++++++++++++---
>>>   1 file changed, 62 insertions(+), 8 deletions(-)
>>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg: [[0, 1658351616, 0, 425984], [0, 1659895808, 0, 167936]] is too short
>>          From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> Are you running the checks before you send out your patches. Because
> it seems like you keep sending things with the same errors.
>
> If there's errors, I'm not going to review this. If you need help
> getting it to work, then ask.
Actually, the too short name errors are coming for the existing names 
also. could you please suggest on how to go ahead?
>
> And what's with your email setup? codeaurora.com bounces.

 From December 3 Qualcomm mail domain got changed to quicinc.com from 
codeaurora.org.

May be that's the reason for bouncing.

>
> Rob

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

