Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A968C67E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A67FA100;
	Mon,  6 Feb 2023 20:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A67FA100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675710788;
	bh=Xk6+icmqwpGgR2V1F3Mgl3fuZNcA1Os/yycBeinLnLE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PoijY9sQZyH8DwrAxUbgCto7oXVuk6rB82cevtJhsSVzrLp5q+5DzPgmTqYaU53YF
	 dlJbCGGu+Yi265kkZ2Gs/gZTlYXGtNeauREsMxEfsY98nLjKGTPYWewVqAVxlfyKxQ
	 wQBQG66LJw4xc887pHulfG2pVgG4Jc4hLhCon4M4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6183F800E3;
	Mon,  6 Feb 2023 20:12:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F8E4F804F1; Mon,  6 Feb 2023 20:12:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEDC7F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:12:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDC7F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NgFUTRlQ
Received: by mail-wm1-x335.google.com with SMTP id q8so9409758wmo.5
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z7TeXUZSUDSF6HYQKz6bhsTXkRAHdJ9pyS5ZC6tmFPI=;
 b=NgFUTRlQYbLYTeTRD3Of8qS5nSQO0qb3dJ1o8dKsyUFGdBMO1OxY2HZZ0w3wNnPT0n
 Bgk0rpi0vqTs47pPAjXLCthSv65D4CnAgr3ry6aejPYzTwJKkDX6qxYQDodu/WphR/nl
 2HuQwuVRMAg2cPEmPcaDgdQ3MzZXaWcuSebyalKpO1XictcReXjkNuFsO6k78OiAJ0zP
 td/N3aGqV4OarT5yCRattp/A8AvFVwM5GA4USh9ltvu2v1EWMjarpDmlwX840Y9/qxVM
 b1Dfu7Es8slXSthDPkdGSUNEtfvhOE62GgkfQ1CfseD9CyCxjS11t9Mw5QZKqaL1Hwt+
 B6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7TeXUZSUDSF6HYQKz6bhsTXkRAHdJ9pyS5ZC6tmFPI=;
 b=uyYCvfA+DUP/TiUA73MRfI9iQ2tcgPny5Ppc4T9JmGpitEGz5S4tnI6hih7uIJOUXn
 s0rusqR7CU2t2Y6JU0UhdR71QjB4IkYnngtUVX37+d/ToI7OnfWWIM2trKiiN8Hr77/A
 aGfxGJR7D07/zI2h/AkkX1TOJg5C2ZVopWjNtF+IwoNVjGhA4nmZ1cElHYrqEXKnm/+q
 TSI02VN8rE2uQ5aGtz1MPloYqHrBmZpUglM+0iYS6wr6tJPZzfk7GWayNjqsISoXGTac
 VIJODi8wA6QpXOrSqcDMyvwv9H3jujSRIfqAiJlBnuWzBpJZxhLOS7DtUnu8/ZyEDfgx
 BqTA==
X-Gm-Message-State: AO0yUKUvUSuykT0JosHoBRiEcnkbMp90DZ7+05wAR88R2U3v6yZfvODT
 fbSWiQew5dZ0PTdZidAHPRpQtw==
X-Google-Smtp-Source: AK7set8uZ5B2m9aXDXsHQl3JhF94bRUla/vOWPgrTbzuMopuJzj/areKdz860Av+Y/KvoolzxtJ7yg==
X-Received: by 2002:a05:600c:4484:b0:3de:b1ec:7f95 with SMTP id
 e4-20020a05600c448400b003deb1ec7f95mr690448wmo.18.1675710724147; 
 Mon, 06 Feb 2023 11:12:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c4f8a00b003e0010a9f67sm4404639wmq.44.2023.02.06.11.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:12:03 -0800 (PST)
Message-ID: <7452928c-f134-8f11-a966-1f3bdc792cb8@linaro.org>
Date: Mon, 6 Feb 2023 20:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: meson: convert axg tdm
 formatters to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-3-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-3-jbrunet@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

