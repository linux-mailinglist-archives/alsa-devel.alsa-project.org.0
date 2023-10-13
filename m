Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975B97C93EA
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DA4EB1;
	Sat, 14 Oct 2023 11:31:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DA4EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275939;
	bh=wMjWb+MEJleKQyBP78j7HODdSMMr0fW7vzrxoEeP5sQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFto7eniiLVKMAkVf0UdXYULJedu0QqpogeUt3H3fIshfn/id5MAi0J4T5Pr1koqE
	 toRsVvoK08jdBlcmsdnTtqU9TwUuOGdKv2PphxGXB9hX9j/tIf40mdKdzoxZ9HMBab
	 iF2YLHa5U+1KjJh9ooPlfCpXHIPOb/BMA+pY6dH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2122DF80552; Sat, 14 Oct 2023 11:28:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A4EAF80614;
	Sat, 14 Oct 2023 11:28:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBFC1F802BE; Fri, 13 Oct 2023 23:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64B32F80166
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 23:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64B32F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=KrtjO5Ia
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so396488766b.1
        for <alsa-devel@alsa-project.org>;
 Fri, 13 Oct 2023 14:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697231522; x=1697836322;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UHVs5ZMbCMnK4OZxIw3w4X3jAnHxQSIJjis2sL1D3HI=;
        b=KrtjO5IaRFUQ1oWVnHxYbdmfUFkd6+oJfUxislaT0daqwPl09oddKUgSCuHK36m3+6
         L8igQSChq6minUmT+0OZthBl7QjVXvZVuk9rRF0qCXpOhgE/Vn0GT0Ad6jm4Zpu3yIwD
         dJyH8EeKKTOj4AJUFDMWrTQQA27zlMGP/+7Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697231522; x=1697836322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHVs5ZMbCMnK4OZxIw3w4X3jAnHxQSIJjis2sL1D3HI=;
        b=KPyazUXVHM/pYBv1HoM5NVTB33fo84xP7Jh0PjEBeFxZcj4O/Ipc3nMPOiT5xPWPPu
         M0R63gHkJk+h9Ud8GpJi1cg3/vulfHHZI+lW4GyrAKtP6O5veOIzW33Xfmo5N/z1yphw
         6/4oS5pPfLVubHkdAwEdWXKcu9afjKemqz6haBG5fjRTOj4rHzNNDylR8wQUFW7JCmPt
         PRxuYozOmMctWRH3+oU/IIo/9ORy0dTjphE13HP62vKglnyVExLDsOMVyhdXtXev11YV
         AdO5gLXIcvyR0go2mJOLM176cYLdH1VxqnlZJWleEqT0j0iwoov57o0pIPWiRy+2lUHF
         In8w==
X-Gm-Message-State: AOJu0Yyy21CjPraXJd7iFKIhgZj33MMLsBV5Ksz9XJWBdmGVaI1XIUp/
	tYFc66e+wfErPBfHGFY5jiQhk/lwO2WyaT21AaQt/w==
X-Google-Smtp-Source: 
 AGHT+IEuNA+Q2Yxxws7amOJuXWe3ey6jbnUkGbWIJda+AVzB6s8jOrXT89FhBxT8kIo26PoR154bP2xzv0Ano/B3pdA=
X-Received: by 2002:a17:907:60cb:b0:9be:7b67:1673 with SMTP id
 hv11-20020a17090760cb00b009be7b671673mr337821ejc.1.1697231521525; Fri, 13 Oct
 2023 14:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231013200851.347042-1-robh@kernel.org>
In-Reply-To: <20231013200851.347042-1-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 13 Oct 2023 14:11:50 -0700
Message-ID: 
 <CAPnjgZ0Uh7RTvYfLjEL7g1NjC1pO8-xJuj9RBSVVnwviAwzF0Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
	Julien Massot <julien.massot@iot.bzh>, Trevor Wu <trevor.wu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: sjg@google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N5YXC3EVE7OZ4PGB3LULM63QUGRNYOE2
X-Message-ID-Hash: N5YXC3EVE7OZ4PGB3LULM63QUGRNYOE2
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:27:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5YXC3EVE7OZ4PGB3LULM63QUGRNYOE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Oct 2023 at 13:45, Rob Herring <robh@kernel.org> wrote:
>
> The common reserved-memory bindings have recently been copied from the
> kernel tree into dtschema. The preference is to host common, stable
> bindings in dtschema. As reserved-memory is documented in the DT Spec,
> it meets the criteria.
>
> The v2023.09 version of dtschema is what contains the reserved-memory
> schemas we depend on, so bump the minimum version to that. Otherwise,
> references to these schemas will generate errors.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/Makefile    |   2 +-
>  .../remoteproc/renesas,rcar-rproc.yaml        |   2 +-
>  .../bindings/reserved-memory/framebuffer.yaml |  52 -----
>  .../reserved-memory/memory-region.yaml        |  40 ----
>  .../reserved-memory/reserved-memory.txt       |   2 +-
>  .../reserved-memory/reserved-memory.yaml      | 181 ------------------
>  .../reserved-memory/shared-dma-pool.yaml      |  97 ----------
>  .../bindings/sound/mediatek,mt8188-afe.yaml   |   2 +-
>  8 files changed, 4 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
>

Reviewed-by: Simon Glass <sjg@chromium.org>
