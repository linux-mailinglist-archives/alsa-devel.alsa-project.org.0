Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188E6B3950
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 09:55:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B48216D2;
	Fri, 10 Mar 2023 09:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B48216D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678438514;
	bh=aVF9lWFJP6UXPEkRNnNghHaXDDVaJnZ4b3v1cyQFCag=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oQ7eoE9DTZBG0kwldLnGsAW1Z9dg5puFhdcMR9KxzQ57QWiYXkgmLod1J61aruZju
	 RWxHwp7j8SxCKZReg7yq5e5N6pwp4NpZjamVslonMAMgKlR84nD1BFj7/UBXURaVAZ
	 fb0G7HsPfBAuMaaZVUVGaQCbWIZLG2Aab0gAOilY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A50FAF80236;
	Fri, 10 Mar 2023 09:54:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F861F8042F; Fri, 10 Mar 2023 09:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2142F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 09:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2142F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yrmRhGUK
Received: by mail-ed1-x533.google.com with SMTP id ec29so17545172edb.6
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 00:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678438457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0G4CMlZfkEr/pUVhqqpiK868gP5MCbnttTXJO4riC/8=;
        b=yrmRhGUK9n/vSM7XBc3U+wnQugThzSxbvwnySaViTDrKExvs1c4HFCowjA0XwEY6sj
         gNSuFvCoGm+bRk7Ypzinz/wU6AeqmFekGl1qpWvqCbbZVrDKhw1PuiUBNe41bi/uwvVe
         Z+IE/E30eh5wJ9JrGAsg+6qnJ5bLgntGmAQ5Kl/D8eW8c/4nSuTipaPu7p9hircNa39E
         c9bHuzX0hV2OCZVQgM1LHAJa2t0acEavP4VoD23SVq0b7oah98F0TYdg11JHZaZ3vwpP
         KtXz66qeb2g3uh9gVoYvMPPT6eruYLe8EzzVoCqfIGzvJyVIOIt3ktPFLbYX7ThYJjeb
         zoRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678438457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0G4CMlZfkEr/pUVhqqpiK868gP5MCbnttTXJO4riC/8=;
        b=prXuPAYFRFrqSP7zsUBybm1RPwseYdHJHsDVn4Bbg5lvUuiYqXFSRdRlqXay1jlDqN
         CXR6Q1TwygzS7PD9N8WOqqMsj2CEgS8GgaOa7uL6mHe8skDozpqhiOxZgAwpCIJOiNJL
         mdW8wyt6eDiTwiIJQnwD3pC+ZNxDI6/3a8zKNbzDdw1DBSaIpvL3IQZCaOSvhM78JexP
         Iw/b/JuAhZZ7zvs7x7ZUbcNmInutEjKFrsgW287IkTuAugqDU7rr+4X3bAn5v97MDEKk
         3R51JhMmDALL90i0AAPgGBBJZYG3OFVP+l9bApFGDnOHBUkAfMozhY1eo/qJspcwD4nq
         zFCQ==
X-Gm-Message-State: AO0yUKWhp8CnbP1fNUpXBQxJDxzWkWfcetPEJcrJQZZFYxVszpG7f34I
	EIkdurrucTxPNq92QPEHKVhspg==
X-Google-Smtp-Source: 
 AK7set812Bofrp/sGeq5amwMWFXsz5YA/xM5fstbRrXekWsK6vQjpuABBLx9AIKzPFBTukuBbo+tBA==
X-Received: by 2002:a17:906:d8c1:b0:880:3129:d84a with SMTP id
 re1-20020a170906d8c100b008803129d84amr24317473ejb.60.1678438457012;
        Fri, 10 Mar 2023 00:54:17 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974?
 ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id
 r14-20020a170906a20e00b008d7a8083dffsm679457ejy.222.2023.03.10.00.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:54:16 -0800 (PST)
Message-ID: <499ee440-0c52-bb21-d04d-086aebc0cf4e@linaro.org>
Date: Fri, 10 Mar 2023 09:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/28] ASoC: dt-bindings: Add Q6USB backend bindings
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, andersson@kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, tiwai@suse.com
References: <20230308235751.495-1-quic_wcheng@quicinc.com>
 <20230308235751.495-21-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308235751.495-21-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P2J5GRDA2ZKOPR7V6EB27K3OLJS7DUIX
X-Message-ID-Hash: P2J5GRDA2ZKOPR7V6EB27K3OLJS7DUIX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2J5GRDA2ZKOPR7V6EB27K3OLJS7DUIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/03/2023 00:57, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../bindings/sound/qcom,q6usb-dais.yaml       | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> new file mode 100644
> index 000000000000..8477abc511dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ASoC USB backend DAI
> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  The Q6USB backend is a supported AFE port on the Q6DSP. This backend
> +  driver will communicate the required settings to the QC USB SND class

What does the "driver" mean? Linux driver? Then drop and focus on
hardware/Q6DSP.

> +  driver for properly enabling the audio stream.  Parameters defined
> +  under this node will carry settings, which will be passed along during
> +  the QMI stream enable request.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,q6usb-dais

Can q6usb mean anything else? Why "-dais" suffix?

> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  qcom,usb-audio-intr-num:
> +    description:
> +      Desired XHCI interrupter number to use.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Why this should be configurable per board or SoC? It's the first use in
DT and in the same time sounds generic...

> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - qcom,usb-audio-intr-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dais {
> +      compatible = "qcom,q6usb-dais";
> +      #sound-dai-cells = <1>;
> +      iommus = <&apps_smmu 0x180f 0x0>;
> +      qcom,usb-audio-intr-num = <2>;
> +    };

Best regards,
Krzysztof

