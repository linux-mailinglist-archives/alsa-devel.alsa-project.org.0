Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EC615A58C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 11:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 899F9167E;
	Wed, 12 Feb 2020 11:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 899F9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581501707;
	bh=CICgCkOhoTJWkHGRqN/+9LwDR8Iljyo1LdOMKlrUw/E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yh4h9IkKIlH3SwIfgYbrrRVKx0f1nzhSFt53shEw0q/Ad/UAL2tx8iAQArqBSsO4T
	 PsqXbmVgwFSnC0toMRMEysfSaN2w1nQlEq4/KZeien0mvANNXw5CXZxRMVBla1+tPs
	 g1uJBLwJVMP1JeZ958qDxWxkLKDAhJf7O/vTi4fQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A09D9F8014F;
	Wed, 12 Feb 2020 11:00:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F4DFF80157; Wed, 12 Feb 2020 11:00:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF54F800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 10:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF54F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vNmQgvcB"
Received: by mail-wr1-x442.google.com with SMTP id g3so1404360wrs.12
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 01:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TgdHUqu43QugB+XJry+tdyUlOnTQbDHzldNID7DKlTY=;
 b=vNmQgvcBd+artf/9LPE/bD4l5LGoyC7mcQ8eWEnPD2c9BJ+S0YBX6l6t6NQUVqekRD
 d9eJvrgCNzevsgfSw1LSeTea18i9CBlJTtw+tBATGKp0V3lgO2xdn7YGBdzbQAgMKnhC
 zhHNqxJTFZLTFivI+lAZU6IKyoD6BKFZ/3P0TVsW7WhfahXuS68v+iFlA9BMlNupGZWm
 28B+5W8qtN+alZHPotZySvmBg3gBx6+jAMHZ3ogJXXqCwrTTLfQjGtpbjhrAxaToIxOF
 nHKuTg6/srC6vAcUDSVrFz7wYvbLXCQ3UApDKKEVAeWK+rz70hr7fPyoS3uHqZ8QlRHZ
 fgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TgdHUqu43QugB+XJry+tdyUlOnTQbDHzldNID7DKlTY=;
 b=UrOV2Sf1D8txjg+mOH/7RlLOtUHfpVFsftU7V19uzRL8uebPVtELfARaHxXrCn5FjV
 z94/noB2XHTL0nMF+kxZ7rSG+XWnd2WQ4wATlazQrrliMwapUKykLw3PjqNsry8nB1bs
 Tu7Ke7vILe1SKXCa/2uU7jr6ljc/+fkOKPdJbPsxDL4xLxyyfn59kqiR5y8xQRJUHNqF
 VsJ0hKRbkcfBFo9lCj76CAHOMDx1IpTCxlNWSDTtS+C3YdJqsDGXjL0mMqEULanj8Nxc
 y7nyY/OLoLRqLZ/ejIzmobXQy38vJbWH6WBNcj5xlbcTgHX7/55uphDkBKCZhDOd83CV
 VPxQ==
X-Gm-Message-State: APjAAAWwggAJbRxi1Wqk7zj9QMEDhzao1DPM6tk/1XXAswYBfJtEfE3D
 Vw9kyQD8GBigg3v+fCBJAi3srYyXP08=
X-Google-Smtp-Source: APXvYqwWhJvMF+JERj9lJ5S96xuxaaQT7YqaxjBM5IG5LhDeP1ZB8cANLTbQQGoG5DVj5KHNGWum3g==
X-Received: by 2002:adf:a389:: with SMTP id l9mr14229912wrb.411.1581501597101; 
 Wed, 12 Feb 2020 01:59:57 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id t128sm38157wmf.28.2020.02.12.01.59.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Feb 2020 01:59:56 -0800 (PST)
To: Adam Serbinski <adam@serbinski.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200212015222.8229-1-adam@serbinski.com>
 <20200212015222.8229-7-adam@serbinski.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <579e0ae1-f257-7af3-eac9-c8e3ab3b52c7@linaro.org>
Date: Wed, 12 Feb 2020 09:59:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200212015222.8229-7-adam@serbinski.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v3 6/6] ASoC: qdsp6: dt-bindings: Add q6afe
 pcm dt binding documentation
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/02/2020 01:52, Adam Serbinski wrote:
> This patch adds documentation of bindings required for PCM ports on AFE.
> 
> Signed-off-by: Adam Serbinski <adam@serbinski.com>
> CC: Andy Gross <agross@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Liam Girdwood <lgirdwood@gmail.com>
> CC: Patrick Lai <plai@codeaurora.org>
> CC: Banajit Goswami <bgoswami@codeaurora.org>
> CC: Jaroslav Kysela <perex@perex.cz>
> CC: Takashi Iwai <tiwai@suse.com>
> CC: alsa-devel@alsa-project.org
> CC: linux-arm-msm@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   .../devicetree/bindings/sound/qcom,q6afe.txt  | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> index d74888b9f1bb..6b1b17d31a2a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
> @@ -51,6 +51,24 @@ configuration of each dai. Must contain the following properties.
>   	Definition: Must be list of serial data lines used by this dai.
>   	should be one or more of the 0-3 sd lines.
>   
> + - qcom,pcm-quantype
> +	Usage: required for pcm interface
> +	Value type: <u32>
> +	Definition: PCM quantization type
> +		0 - ALAW, no padding
> +		1 - MULAW, no padding
> +		2 - Linear, no padding
> +		3 - ALAW, padding
> +		4 - MULAW, padding
> +		5 - Linear, padding
> +
> + - qcom,pcm-slot-mapping
> +	Usage: required for pcm interface

Are these not specific to 8k and 16k mode ?
We should probably list values for both modes here.

--srini

> +	Value type: <prop-encoded-array>
> +	Definition: Slot mapping for audio channels. Array size is the number
> +		of slots, minimum 1, maximum 4. The value is 0 for no mapping
> +		to the slot, or the channel number from 1 to 32.
> +
>    - qcom,tdm-sync-mode:
>   	Usage: required for tdm interface
>   	Value type: <prop-encoded-array>
> @@ -174,5 +192,29 @@ q6afe@4 {
>   			reg = <23>;
>   			qcom,sd-lines = <1>;
>   		};
> +
> +		pri-pcm-rx@105 {
> +			reg = <105>;
> +			qcom,pcm-quantype = <2>;
> +			qcom,pcm-slot-mapping = <1>;
> +		};
> +
> +		pri-pcm-tx@106 {
> +			reg = <106>;
> +			qcom,pcm-quantype = <2>;
> +			qcom,pcm-slot-mapping = <1>;
> +		};
> +
> +		quat-pcm-rx@111 {
> +			reg = <111>;
> +			qcom,pcm-quantype = <5>;
> +			qcom,pcm-slot-mapping = <0 0 1>;
> +		};
> +
> +		quat-pcm-tx@112 {
> +			reg = <112>;
> +			qcom,pcm-quantype = <5>;
> +			qcom,pcm-slot-mapping = <0 0 1>;
> +		};
>   	};
>   };
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
