Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7345471A2
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jun 2022 05:27:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD2B81A8F;
	Sat, 11 Jun 2022 05:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD2B81A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654918047;
	bh=BxpVDGQMnUe59DqqCqnT+3odqnpr5cw/QEol59C7Yx0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDTjha2GCzYDmlwa5LNGKOi0RUTZokUKzlqiF3UOmUEZWmiyPe5egvt9OvDndygoG
	 zw+0SzvezUCDW1Fjhmpp8TD283sTE58l9bvd/1+/E4PXL4GAOiRs9OE9i0niQwK8TR
	 pluS3IajY1RyDY2KRCTouYm5/s2Hrn4vbM1pb7+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27BF3F80271;
	Sat, 11 Jun 2022 05:26:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73AF0F8025A; Sat, 11 Jun 2022 05:26:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F17DEF800E5
 for <alsa-devel@alsa-project.org>; Sat, 11 Jun 2022 05:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F17DEF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="eix62cfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654917979; x=1686453979;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HVSSV8LGOw92Phwdzd7AfIW3E8dYU6iGxh+I+4+CoQc=;
 b=eix62cfG9xO5L+vJ6n6v6WO8Q8Cc4HZhUwVA36I/RwigzBh4LlGn3CLb
 LiXw2NPiexw8LLv9Og70M1snahm6JEnGuDAwQnOcRC0vcZLmIe73CiaWb
 QMSoym1VkF4tetN8cefzjgVJ6xqKuHieo3lPLWNJOroH5DCBj2/6Xz6e+ A=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Jun 2022 20:26:14 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 20:26:14 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 10 Jun 2022 20:26:13 -0700
Received: from [10.216.8.205] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 10 Jun
 2022 20:26:06 -0700
Message-ID: <ae46345f-cb39-bfc2-16d9-70b5729eee6c@quicinc.com>
Date: Sat, 11 Jun 2022 08:56:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: sc7280: Add boolean
 param for ADSP bypass platforms
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <agross@kernel.org>,
 <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
 <bjorn.andersson@linaro.org>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <judyhsiao@chromium.org>,
 <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <perex@perex.cz>, <quic_plai@quicinc.com>, <quic_rohkumar@quicinc.com>,
 <robh+dt@kernel.org>, <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <1654872335-4993-1-git-send-email-quic_srivasam@quicinc.com>
 <1654872335-4993-2-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53NdTwAO4DY0x7Fy9h4eRVR-3iKnGfqfZ-ggyghfsC9UA@mail.gmail.com>
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Organization: Qualcomm
In-Reply-To: <CAE-0n53NdTwAO4DY0x7Fy9h4eRVR-3iKnGfqfZ-ggyghfsC9UA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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


On 6/11/2022 1:34 AM, Stephen Boyd wrote:
Thanks for Your time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2022-06-10 07:45:34)
>> Add boolean param qcom,adsp-bypass-mode to support adsp bypassed sc7280
>> platforms. Which is required to make clock voting as optional for ADSP
>> bypass platforms.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> ---
>>   .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml          | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>> index d32ee32..ea9920c 100644
>> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
>> @@ -17,7 +17,14 @@ description: |
>>
>>   properties:
>>     compatible:
>> -    const: qcom,sc7280-lpass-lpi-pinctrl
>> +    enum:
>> +      - qcom,sc7280-lpass-lpi-pinctrl
> Drop this part.
Okay. Will revert this change.
>
>> +
>> +  qcom,adsp-bypass-mode:
>> +    description:
>> +      Tells pin controllers want to make clocks optional for ADSP bypass
>> +      targets.
> How about "ADSP is in bypass mode"?

You mean, description like below?

qcom,adsp-bypass-mode:
     description:
	ADSP is in bypass mode.

