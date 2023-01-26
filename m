Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBFD67CA8D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 13:06:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 553BCE74;
	Thu, 26 Jan 2023 13:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 553BCE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674734808;
	bh=3PfAbUeQlaNFei7I2y6asKMB0+nGcB3bmz40nisO4bo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lrZEcvtSiHh+vb7l0+QPOXqHfBpMmQhU69BEpDb5rEQ/3QA0AiPU5w96vSKPWnJ1H
	 nb83O2csjrDg/Uu/R3RKEYhzwPyJO0pFeaa/GNhjlPnClqwHgqgSqDZt2RwAhbPOqc
	 YGVpxSHnwy9k2J7NNxd+MSm7M8UHcBjd/EYreAy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68F54F802DF;
	Thu, 26 Jan 2023 13:05:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 041CFF802DF; Thu, 26 Jan 2023 13:05:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C14BF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 13:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C14BF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zxk3G06q
Received: by mail-wr1-x429.google.com with SMTP id n7so1543227wrx.5
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=73ycqz5Vr3+tOURurZAagwhA0jCPCZF47oym0B2wObg=;
 b=zxk3G06qdF/I2uUN1Fxy0Ib1meLLbwiy+FUznNmkeOJDeTot3WNnzI+b7fum/2ng27
 HLeTSiylgez9NZQU8lHAav3shXV2URLW5Lo3N5Pb5hiHxCinVuE9q1hsMalmjWg2rhRd
 7vrjU15UhVm+K/hDKM9sAq29nbjbXrvqvlGFbxZLuKmik3r+pMwmyW0sZdN59EGEvMvI
 H7cXVwmYrRb4V9v6O11nMFNbCoLU0Hx7n9/5dUOfKJbvW6+kMkW5+20eU8JxwH7CwX9Y
 /HHuBFQ9GMQQSt9f+BpJIZqdMINkoBzZoMcL0GGW6WfGXeFLZQcSdelU0PkNmNK/c/DL
 6cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=73ycqz5Vr3+tOURurZAagwhA0jCPCZF47oym0B2wObg=;
 b=FfdCIoVxNNumxPLrOlRbjjjRjjTLXp0CoVNn5dqw2NbvZ1G3aFM10fscb8EQSwVtrw
 nMVU0sJr+mn8dc7P1H2YJ7NISOVqmHYdWJTypmrARv5Cd0aI/t9k2bOgWcaacnikCdk4
 nr6JPPJfXak+D8DY0/dKtFXg3nBQeGcKPVkJ1qzE8M3BXdK0hyL6bfe70m25mS3zG6tQ
 hLagQRmje7r8uoImKd50rCTbsDabVXFnga5r8uF+tvDJTMi2GhVkB80AaE9WQtynu1ZK
 hK5BK09O7/TpGfNrQ4iUcdZAOxUKIR6XqJHD3kSnAX4Rx4WUR0DAprPVuVldxFyJt8Bh
 XaVg==
X-Gm-Message-State: AFqh2koWT9y0Y5f4sPf2V54RlRZ+wG4t/Ho+gdUgqosVIl/woK/4qjUb
 x4sNAEQC1bDzCDjNxseIEqZZ9g==
X-Google-Smtp-Source: AMrXdXshQ57vEOT3LPS1eQ3YLZssnfmBDJVIwVtYoUuqSuUrdKv1clQP4CPZX1GEx+hl/WwpY9ADNg==
X-Received: by 2002:a5d:6b42:0:b0:2bc:7e6c:7cd8 with SMTP id
 x2-20020a5d6b42000000b002bc7e6c7cd8mr30098482wrw.26.1674734741293; 
 Thu, 26 Jan 2023 04:05:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a5d488b000000b002be5bdbe40csm1345948wrq.27.2023.01.26.04.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 04:05:40 -0800 (PST)
Message-ID: <77b189f7-18ba-a8ec-20f7-a5d1287ced4b@linaro.org>
Date: Thu, 26 Jan 2023 13:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 22/22] ASoC: dt-bindings: Update example for
 enabling USB offload on SM8250
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-23-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126031424.14582-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26/01/2023 04:14, Wesley Cheng wrote:
> Add an example on enabling of USB offload for the Q6DSP.  The routing can
> be done by the mixer, which can pass the multimedia stream to the USB
> backend.

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching). Missing piece is "qcom,sm8250:"

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 70080d04ddc9..60cd84e6727a 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -216,6 +216,19 @@ examples:
>                  sound-dai = <&vamacro 0>;
>              };
>          };
> +
> +        usb-dai-link {
> +            link-name = "USB Playback";

Keep consistent blank lines between nodes. Other nodes in this example
have them, haven't they?



Best regards,
Krzysztof

