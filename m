Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B115877C9
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 09:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2981DF;
	Tue,  2 Aug 2022 09:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2981DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659425287;
	bh=d6M67DGmX15FDk/zZW5mfQ75eejKksEvEYYw08d7mBw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wd+MsO8jFs8d1EL/f0xhTdijL56aJionDikqCQvSR1RsGn6usgcj0ztf6ajnpmvjE
	 muiXlPn7EEWGFbS+ZQ9gThHcQ9TssZsGY9S/2nBsu8RT/Ct5AymEivaBlX79kocuoN
	 MrTnzWaEdsxY1AFOK8Kb8YE0Yq/jG70HXXgelHQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E6CDF800B8;
	Tue,  2 Aug 2022 09:27:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D85B0F8026D; Tue,  2 Aug 2022 09:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98849F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 09:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98849F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IVrIhKV6"
Received: by mail-lf1-x12c.google.com with SMTP id t22so20744143lfg.1
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 00:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d4HkZdDOv7XNMC5h/HfkGuuWra/wdCBUbN3rR8kUcYw=;
 b=IVrIhKV6TQ2LB8/agWnpQ42D82tl2sCEUmqpSES2WT3nhnptLgRnpkPPtUsiLmXRfM
 gT+gL3l8RtiOZd9IwL/KWUMsd67aEritX51QDojFFghkW7gzh//2J5KrMZ8Iu1qhHqe4
 4a1pcioPuluo5PnBnsOPTnAlVi09nbdP6eNqkkSITGgzdAqYzhhXdqrWpVBcyMOCKvlP
 5s6LgVu5mhBKl3tD/pikVQJ6HZY9jR/Msqt9E1mb+aoHG5UnIBinhhGjXi9zaKOwmbFm
 twYYtXscQfoMAUZBxUnedqv/CaIouL2hhOTt7LNPKJxRcQsqiqpUE6mLiL8lSKwxZKjr
 TJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d4HkZdDOv7XNMC5h/HfkGuuWra/wdCBUbN3rR8kUcYw=;
 b=bAEczw6XHRenoQYpRKjPt+AqwNcWLeKF6nSsVEeKiJxKCrmMJq+HgjPDTfucezx0eD
 /VXGgY4C2lMb0HyxuUqdxOxxEn9kcK5jc0Yrc/E3box3iDeOXhOG2ZwB6k3HhwImScWL
 7Q8QOmudQHticx0jY7z1jyrBMPme7IbKBc3OrXa97ZZ7EO+jmRQlxtnzlIIJKpfZSCHT
 lj7uBrZBsAWYo0TCT9nw8YV2oraETFEDO2W1G6xdcTpdqHlCnTD7rzj0otKMdiueFRNW
 4eiOLT9kaQkZoHPEbjUwC+wUtkZWNNEP9KVCWujF0vSQXT5/yaTXPUDUm0jwk+X00JHD
 EPvw==
X-Gm-Message-State: ACgBeo2Dbc2L4Iq0JKTLi9GzI0VFBOrUsWehYyB6IAretGWaud0I6hbK
 Y9v47I9ajpf4Y1GZJZ6kwqRTqA==
X-Google-Smtp-Source: AA6agR4qI7vkwPxXKnLuW4SI41fSrQ+0NIFPJ6qbvRABceYlNlsRqTf7UV8Y8TYIvB6PTniHjU07Pw==
X-Received: by 2002:a05:6512:3990:b0:48a:e4ca:7ec0 with SMTP id
 j16-20020a056512399000b0048ae4ca7ec0mr5902895lfu.146.1659425215752; 
 Tue, 02 Aug 2022 00:26:55 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 bf17-20020a056512259100b0048ad4ca88afsm1616699lfb.102.2022.08.02.00.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 00:26:55 -0700 (PDT)
Message-ID: <ba6bc0e8-8b64-aa7f-241e-1e88dd9cfaa5@linaro.org>
Date: Tue, 2 Aug 2022 09:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: fsl,sai: Convert format to
 json-schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1659060632-4880-1-git-send-email-shengjiu.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1659060632-4880-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: shengjiu.wang@gmail.com
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

On 29/07/2022 04:10, Shengjiu Wang wrote:
> Convert the NXP SAI binding to DT schema format using json-schema.
> 
> The Synchronous Audio Interface (SAI) provides an interface that
> supports full-duplex serial interfaces with frame synchronization
> formats such as I2S, AC97, TDM, and codec/DSP interfaces.
> 
> Beside conversion, 'fsl,shared-interrupt' and '#sound-dai-cells'
> are added for they are already used by some dts.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v3
> - address comments from Krzysztof
> 
> changes in v2
> - fix exclusive property issue
> - fix order issue of compatible, clock-names, dma-names
> 
>  .../devicetree/bindings/sound/fsl,sai.yaml    | 221 ++++++++++++++++++
>  .../devicetree/bindings/sound/fsl-sai.txt     |  95 --------
>  2 files changed, 221 insertions(+), 95 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sai.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> new file mode 100644
> index 000000000000..86ee46755b0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Synchronous Audio Interface (SAI).
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description: |
> +  The SAI is based on I2S module that used communicating with audio codecs,
> +  which provides a synchronous audio interface that supports fullduplex
> +  serial interfaces with frame synchronization such as I2S, AC97, TDM, and
> +  codec/DSP interfaces.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,vf610-sai
> +          - fsl,imx6sx-sai
> +          - fsl,imx6ul-sai
> +          - fsl,imx7ulp-sai
> +          - fsl,imx8mq-sai
> +          - fsl,imx8qm-sai
> +          - fsl,imx8ulp-sai
> +      - items:
> +          - enum:
> +              - fsl,imx8mm-sai
> +              - fsl,imx8mn-sai
> +              - fsl,imx8mp-sai
> +          - const: fsl,imx8mq-sai
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: receive and transmit interrupt
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    maxItems: 2
> +
> +  clocks:
> +    items:
> +      - description: The ipg clock for register access
> +      - description: master clock source 0 (obsoleted)
> +      - description: master clock source 1
> +      - description: master clock source 2
> +      - description: master clock source 3
> +      - description: PLL clock source for 8kHz series
> +      - description: PLL clock source for 11kHz series
> +    minItems: 4
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: bus
> +          - const: mclk0
> +          - const: mclk1
> +          - const: mclk2
> +          - const: mclk3
> +          - const: pll8k
> +          - const: pll11k
> +        minItems: 4
> +      - items:
> +          - const: bus
> +          - const: mclk1
> +          - const: mclk2
> +          - const: mclk3
> +          - const: pll8k
> +          - const: pll11k
> +        minItems: 4
> +
> +  lsb-first:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Configures whether the LSB or the MSB is transmitted
> +      first for the fifo data. If this property is absent,
> +      the MSB is transmitted first as default, or the LSB
> +      is transmitted first.
> +    type: boolean

The type: boolean goes instead of $ref, not additionally to it. Just
like below...

> +
> +  big-endian:
> +    description: |
> +      required if all the SAI registers are big-endian rather than little-endian.
> +    type: boolean

... be consistent.

> +
> +  fsl,sai-synchronous-rx:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      SAI will work in the synchronous mode (sync Tx with Rx) which means
> +      both the transmitter and the receiver will send and receive data by
> +      following receiver's bit clocks and frame sync clocks.
> +    type: boolean
> +

Best regards,
Krzysztof
