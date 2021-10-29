Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 622984402E4
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 21:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE77170C;
	Fri, 29 Oct 2021 21:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE77170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635534487;
	bh=Dk5v3kVpiT3jq2eOrt0x6DscdUj23wXQDDNyPTQWAuU=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nNR2EcYTBZZ9dyGGApocQMrFIQZIjFfzz5azZyowuXdDSveK6ktuXg9iDSfB5wLNM
	 SFJRtMdhuJSigRq+0Z0lkMtI7oAWcsswqlVfBipYtjn4Eh5QVB9EFVZnJiY7UQYZl5
	 P1xH13Qzj1aGN4cR38OlOCz95Ax4JG6LrZvmUoX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF423F80271;
	Fri, 29 Oct 2021 21:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45DF8F8010A; Fri, 29 Oct 2021 21:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E21EFF800F4
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 21:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E21EFF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="bJM3Q7f+"
Received: by mail-oi1-x234.google.com with SMTP id t4so14718484oie.5
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 12:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=JIoJB0nrnD/FFJ0kl/mJlxgFsqLGnc24ub0V7Q5LiC0=;
 b=bJM3Q7f+i/afuWWCMK9Zl6Ay4ZGeoSmIMwgY9LnPih51xxl3kIoujkSsqObWesITLf
 6UujLqHi2tSvD7sUnjd6EaTZDSz3nEgQYkppvar8Qjp1Xv6DYm169z1MzVoio623ojKw
 SaXvZd35gNBBe55rjV6qIHWDfnQzq6Z8I73Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=JIoJB0nrnD/FFJ0kl/mJlxgFsqLGnc24ub0V7Q5LiC0=;
 b=EufXOCD6NZTcWMWpe76UqNsrGtcjuA+S7KRl7iSJ4rOWQLuxAazyVcjUsxP26F+xOd
 Tepj+sGdOgmRdh0BG1Rlg0kr0pSpghx4Aq0o+MQi710d5wdKTrdOD4AACrfU+iXCY3ex
 /indUxbCfcgUkyj7YbNcTf8RaoUnW64c3rxigxyXWPePpQIejPS6FJJywAH/2jGuHU7z
 w8Xo/XgsL5cXYsAd/m2UhIXR0Cw3TeSU+JoEJPuMmOe5MX4XkNdCL4zunbxrVibbcc4Z
 mVDumVZADe7qO9h4nDUO8jHzpX32tDeoXhwvaPRHraW8vsV+cf3JDJerXFcHif7Se0dG
 S8PA==
X-Gm-Message-State: AOAM532mZVg1QjCP0INFRjo9MGKmO2BncWKJUgGFYBiwWeiutGwphHb1
 nGuahJHPv8CTZplyX5KTA8VWbcRcL1vjxkR5OjY9Pw==
X-Google-Smtp-Source: ABdhPJx9DGm5zi/J5DHIHPM2ULFvb0dn5vpJfei1NgjU04Cz6QeqMDgJeGhpiv+KN0Wgad1XtCZqRxBYp0XeOm27aYk=
X-Received: by 2002:a05:6808:2124:: with SMTP id
 r36mr9693318oiw.64.1635534421166; 
 Fri, 29 Oct 2021 12:07:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:07:00 -0500
MIME-Version: 1.0
In-Reply-To: <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 29 Oct 2021 14:07:00 -0500
Message-ID: <CAE-0n53ok5muZ8nhpsigsw3w_qx_TSxGSdm7pf9nbb+s4K+HiQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-10-29 08:04:35)
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> new file mode 100644
> index 0000000..3a781c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google SC7280-Herobrine ASoC sound card driver
> +
> +maintainers:
> +  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> +  - Judy Hsiao <judyhsiao@chromium.org>
> +
> +description:
> +  This binding describes the SC7280 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - google,sc7280-herobrine
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^dai-link@[0-9a-f]$":
> +    description:
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.
> +
> +    type: object
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
> +      reg:
> +        maxItems: 1
> +        description: dai link address.
> +
> +      cpu:
> +        description: Holds subnode which indicates cpu dai.
> +        type: object
> +        properties:
> +          sound-dai: true

Is sound-dai required? And additionalProperties is false? I think we
need that yet again.

> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +

Same here.

> +    required:
> +      - link-name
> +      - cpu
> +      - codec
> +      - reg
> +
> +    additionalProperties: false
> +
