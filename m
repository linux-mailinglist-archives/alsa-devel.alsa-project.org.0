Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347646924C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 10:25:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B5321FAD;
	Mon,  6 Dec 2021 10:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B5321FAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638782746;
	bh=BDtKFnN7IKofHm1YEBHNIRu8CZtDIb1tgUagw1Nbj4w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HAi9sysetC7NoA2o7NQaNUmZKfevJjqLdV0f+ljLnVymq7CjLLl38RH0Nj6LUN0cX
	 dUldnwdDvf4X08kTWVa7k/5QVlXS310Q8Gm2uvhkCkP9BOmdvR2codTjT0CLUlwxhs
	 HuKxs7t8w6nvVqKxNfzAqF7g+iDGpXSM9nbaEw74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14292F80300;
	Mon,  6 Dec 2021 10:24:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E79AF80246; Sat,  4 Dec 2021 00:40:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0852F800A7
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0852F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="OuHQ6ZGf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638574847; x=1670110847;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=PbgjBGtolt5B+GkMimGNb9ZTzL0SOFZVmFHPY6gsRmE=;
 b=OuHQ6ZGfYzS0e4rAY5DRrHQNxaw3+k4StqJckiNNk2hQN0FJ/se1+qKj
 vezA9Dd48ykCtWjxnAOg2CyIIupmqmIkJjkmG1ALbdPPLdFxXBg/Fn+AK
 APx/2jV1B2xbNjrBQy8gWV3hiijAEVitKd2DkQ3qhjeibigCshOvJcNQ0 Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Dec 2021 15:40:41 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 15:40:41 -0800
Received: from [10.110.102.90] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 3 Dec 2021
 15:40:39 -0800
Subject: Re: [PATCH v8 09/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
To: Rob Herring <robh+dt@kernel.org>, Srinivasa Rao Mandadapu
 <srivasam@codeaurora.com>, Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
References: <1638547658-22032-1-git-send-email-srivasam@codeaurora.com>
 <1638547658-22032-10-git-send-email-srivasam@codeaurora.com>
 <1638574455.248037.1043006.nullmailer@robh.at.kernel.org>
 <CAL_JsqKf4Y84+_PQqhwMEEiJNrR92urMUYSqYTEU0_c7fYnyhQ@mail.gmail.com>
From: Trilok Soni <quic_tsoni@quicinc.com>
Message-ID: <c817ec06-6423-7408-8064-dfc4a867a251@quicinc.com>
Date: Fri, 3 Dec 2021 15:40:38 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKf4Y84+_PQqhwMEEiJNrR92urMUYSqYTEU0_c7fYnyhQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Mailman-Approved-At: Mon, 06 Dec 2021 10:24:03 +0100
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

On 12/3/2021 3:38 PM, Rob Herring wrote:
> On Fri, Dec 3, 2021 at 5:34 PM Rob Herring <robh@kernel.org> wrote:
>>
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
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg: [[0, 1658351616, 0, 425984], [0, 1659895808, 0, 167936]] is too short
>>          From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> 
> Are you running the checks before you send out your patches. Because
> it seems like you keep sending things with the same errors.
> 
> If there's errors, I'm not going to review this. If you need help
> getting it to work, then ask.
> 
> And what's with your email setup? codeaurora.com bounces.

codeaurora.com is definitely a wrong domain. It should be codeaurora.org 
instead.

> 
> Rob
> 
