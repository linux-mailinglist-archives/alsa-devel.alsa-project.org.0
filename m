Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB5447B3A
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 08:37:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9289B167D;
	Mon,  8 Nov 2021 08:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9289B167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636357054;
	bh=/o+Mepa7ZVvwmnqwogW7NqLNTsn+Sfjvdjni72pHOBY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XP0scGT/+yC8NRSkj+u/xzpuhZGZV/Gi7SQB/8tRvsD4dtYwdZbh9+v3CM2u0ISfA
	 87HyQWBrHU706rvhNSJydXsAXuYG1ZwutFq1fDF5/5BrFstQpQgCzlyh14tOqY8q+y
	 jpeDhknsnuIevLa14u7ZkuPtwduIFr+qXiq2waes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D829AF801D8;
	Mon,  8 Nov 2021 08:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A559EF8049E; Mon,  8 Nov 2021 08:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E245F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 08:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E245F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="SwRHpEpI"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636356968; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=l9kiI4uHR2rmwPsreo+RrcGqVZDlNXEReTYLuPyDcGk=;
 b=SwRHpEpIG6EZ8pXIGYhWRZD8XaKueVVgW4uYMZV8CtxCDhwjFpw20gssB5J19hWmicYYRROP
 +IRUTBMCJNerSr/fLfyHxfEiirGAE+CiLGdDNoQLT0Zl5IzJgtb0Wl9KhkQiLzpW/0I2Jp1F
 4AZVEo0uj75esspO5B/1ZPH1Ovw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6188d356ba0f6a7824faece4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Nov 2021 07:35:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C7144C43460; Mon,  8 Nov 2021 07:35:49 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 564D5C4338F;
 Mon,  8 Nov 2021 07:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 564D5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To: Rob Herring <robh+dt@kernel.org>
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com>
 <0cf52203-249a-2f6c-6106-888631ac85fa@codeaurora.org>
 <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <b1f2280a-b349-6862-c6e1-f74a5584c9bc@codeaurora.org>
Date: Mon, 8 Nov 2021 13:05:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLxJ4HYUEcdCu-5EiakXe9e3yueOdxRa24K2r04F1Zqeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Gross,
 Andy" <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, judyhsiao@chromium.org,
 Patrick Lai <plai@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


On 11/6/2021 7:00 AM, Rob Herring wrote:
Thanks for Your time Rob!!!
> On Tue, Nov 2, 2021 at 5:57 AM Srinivasa Rao Mandadapu
> <srivasam@codeaurora.org> wrote:
>>
>> On 10/30/2021 12:37 AM, Stephen Boyd wrote:
>> Thanks for Your time Stephen!!!
>>> Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
>>>> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>>>> new file mode 100644
>>>> index 0000000..3a781c8
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
>>>> @@ -0,0 +1,170 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Google SC7280-Herobrine ASoC sound card driver
>>>> +
>>>> +maintainers:
>>>> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> +  - Judy Hsiao <judyhsiao@chromium.org>
>>>> +
>>>> +description:
>>>> +  This binding describes the SC7280 sound card which uses LPASS for audio.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - google,sc7280-herobrine
>>>> +
>>>> +  audio-routing:
>>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>>> +    description:
>>>> +      A list of the connections between audio components. Each entry is a
>>>> +      pair of strings, the first being the connection's sink, the second
>>>> +      being the connection's source.
>>>> +
>>>> +  model:
>>>> +    $ref: /schemas/types.yaml#/definitions/string
>>>> +    description: User specified audio sound card name
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +patternProperties:
>>>> +  "^dai-link@[0-9a-f]$":
>>>> +    description:
>>>> +      Each subnode represents a dai link. Subnodes of each dai links would be
>>>> +      cpu/codec dais.
>>>> +
>>>> +    type: object
>>>> +
>>>> +    properties:
>>>> +      link-name:
>>>> +        description: Indicates dai-link name and PCM stream name.
>>>> +        $ref: /schemas/types.yaml#/definitions/string
>>>> +        maxItems: 1
>>>> +
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description: dai link address.
>>>> +
>>>> +      cpu:
>>>> +        description: Holds subnode which indicates cpu dai.
>>>> +        type: object
>>>> +        properties:
>>>> +          sound-dai: true
>>> Is sound-dai required? And additionalProperties is false? I think we
>>> need that yet again.
>> Okay. Will mark additionalPropertiesas true.
> 'additiionalProperties: true' is almost never right. It's generally
> only correct for schemas that are incomplete collections of
> properties.
>
> Rob

As per Stephen Suggestion. thought it's a solution.

The sound-dai required here, and same is fallowed in SC7180 machine 
driver bindings.

Could You please suggest better approach on this?


-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

