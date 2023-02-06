Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8EA68C692
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:16:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC9F11C;
	Mon,  6 Feb 2023 20:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC9F11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675710965;
	bh=BBK54BcATai/T/aJlyJ9IYfcphaxfw1Ba/fF3+ElPHM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tVSa5jpkx6oJg5Ukl2e0ZwZ/4jsMKVNK/9+bfcpxhVUUoMbWcXTVGskSKSaEQM7jH
	 6LRLfhnYduWxdG3BsNxWtFf73mjX1q1gIhr0+zCGeUyWdt0aLlsIZuoNlW48Zo5vkG
	 QbENZdjUm4MwhtmKHEtscoFA0cjxJDluMGWcCOgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3065F804FB;
	Mon,  6 Feb 2023 20:15:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11CF2F804F1; Mon,  6 Feb 2023 20:15:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0A6FF800F5
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:15:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0A6FF800F5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=R8VnzjK0
Received: by mail-wm1-x334.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso9657637wms.4
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iniev9+D6uZ6XQ9DZUsmrgSWAz/CkGjwKUBOylv7Xs8=;
 b=R8VnzjK0B/jAiGqqdhjoUnYsKIn08raxB+gye5CjA9WdNYJamW+KnOJze8NWgxUSVJ
 wZ8BbBFyCPXzjs19eYqKohofsVLZE40Dorf1tMrHzzbvgdLRVl99CnFdYUSo1n8IU4+1
 t6k+9Q4yc+EQb/cK72RgbqNcAKHI7ocHdXGKbdWDFyJRCiGN8xpIZJU0afJCUi8HQ5Lb
 nd5ilMooPqj/Grz5siAjCCuE+DTcQg2KcHmThu4HuYluOAMiYRrVO/5fBskro3g0Jeg7
 Mw1ifVgO+86CStcsYwo5MOPr5Rqdb1leO56SQbtsREyzCVwi2/pHy4RAyxueGTOd5Dws
 PAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iniev9+D6uZ6XQ9DZUsmrgSWAz/CkGjwKUBOylv7Xs8=;
 b=U9uAvxvJXyHu4WtZnevo4VESf3RNQ40jTWzCHD0imxbT/z8ZLEVAxUUfeP0nheRdye
 pKPDVm7pgpqiR6M6I9yy58nBNewvU3DrjWr1cM370tMJ2JDxskIgUQBb5Gyy2sqrNxM+
 QlgxJ0eWebUIio04GaukuTV3aw8p6OBaPNuMg8qWxIYSAaEuASHvCGxDKZcvn3xab/bZ
 JYjTGf18dy3bdtQphHaJMpjI0HLtzROM2z4We8ewl+A/W/1vFHLM9TyO7z5hoecOUdmH
 vebv4gjYO5gdapkjp2MQWn2EIhHNc4j6oenFtV88pdDSEpXXjA1eHkyr1mJyDZqIC5uD
 Qdkg==
X-Gm-Message-State: AO0yUKWRL/yj8b/uAmCV4QtLkKTaqDcp7bu3QnKCQWegzmFkaGF55Yhu
 aggXu4GxNESd9tH93qT/b1jbgg==
X-Google-Smtp-Source: AK7set+rmvAq7Kd2BDYlA+s7058vt+eFcngnsEXUb/HDb4/Z+Y+NjPnMTQe5zWfnu1+fv/8E3WiVjQ==
X-Received: by 2002:a05:600c:4485:b0:3e0:185:e93a with SMTP id
 e5-20020a05600c448500b003e00185e93amr725830wmo.25.1675710900467; 
 Mon, 06 Feb 2023 11:15:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c16c400b003df245cd853sm11443197wmn.44.2023.02.06.11.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:15:00 -0800 (PST)
Message-ID: <349c949b-bcf4-e31d-b4cf-51953d0e325d@linaro.org>
Date: Mon, 6 Feb 2023 20:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/7] ASoC: dt-bindings: meson: convert axg fifo to
 schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-5-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-5-jbrunet@baylibre.com>
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
> Convert the DT binding documentation for the Amlogic axg audio FIFOs to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-fifo.txt       |  34 ------
>  .../bindings/sound/amlogic,axg-fifo.yaml      | 112 ++++++++++++++++++
>  2 files changed, 112 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

