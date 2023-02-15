Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E586983A4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 19:44:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF618868;
	Wed, 15 Feb 2023 19:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF618868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676486642;
	bh=EytwfzjUtHmps/JbIot8RDHv8/ySptv5rfyAJJl1HY0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aM3O4owB36GBrS4gcX65Kr6pTUlD1WcOfFwCfOriaUZEvQCxs38oTWb973JM2++Wf
	 AOplHd+sL9iyH37BK5R3KeplvSpykKg3VtCX4Bu3D+Q8MyGxY/FpusrGeUZgMOzG30
	 VRyUXkEWN/lHr92S0XWOdM/t52GnagJpRir+FIgU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 249C1F800E3;
	Wed, 15 Feb 2023 19:43:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C31E4F800E4; Wed, 15 Feb 2023 19:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD9D4F800AA
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 19:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD9D4F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r82h08VR
Received: by mail-wr1-x42b.google.com with SMTP id bu23so20119472wrb.8
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Feb 2023 10:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpMikJK+ogNWZgaRbuctnXBwaLqp/EN3eQexUz9qw0o=;
        b=r82h08VRbV5lg7tMiutz+RqOamX/pr5iZTHrrGCiZr7rIxgdu/QaXn6iz0BLBrUye8
         vUH2A5AsMzUWoMSBbuoW+EIvg+wwQXiIPg7g4BfxJ43ZZKqcJpIDXce0Wkr7oG29JmAg
         HwcQvoWmUowN0gujLQ38sS7iBaXf9c21lnioQRlJP8LbOm15vEkxNs4zqN5boVo/cVaY
         VHiJnYjFsSCOzfqGvHhtKmOuUeSiV6FTpJ3Ec8pr7BotetjY8kcW6LYp7rXRFfqvb58r
         OZHoi4Bj3KQlYMhI2LZ1uPMu0CRAH0niJ16w2pUQwk6SlEhz3DVzjk2P2skfS9twfxgn
         sewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpMikJK+ogNWZgaRbuctnXBwaLqp/EN3eQexUz9qw0o=;
        b=wF5EjAcOIjrll96ETRxMJyinMGsPPmBuPWYdIrM7j+h1QJw1B2xqigEgiK/dq0Q9AW
         Nd/u6cFcT5wkfP3OZkU4aKTt6DrawJ07rOdy5SJlXDa7eam4CjTqkEYvtr7PgpGVXNz1
         bQc9wXQG0u3m+albKP9nL6OUpO2N8bmVXIxvFztpNSK5Vv89m7lYgWq1+50Z6OTsi3qd
         7DwieDScDjpQNpL9Ct/5WJdJ4MKSPrFzuR+WrrRobjX7kPoQ2XwHLXWWNKAEFjlXyja2
         MLSluDknw5WWKQg98u8pj2Ja/2DZ9MHJZh141OAenWdD0PJhAKiHRuXvut4L1KJGOf5x
         ZJFg==
X-Gm-Message-State: AO0yUKXbC3TriIGLV63JkbEPtIRl7OHhqysFOLrWD+9TrGCht/6aitMc
	mcj8AswVSKysxrG7FL2IWK8+tA==
X-Google-Smtp-Source: 
 AK7set/+UqiAtt9waEuL+2YL8GiuUfkW+KuZeffARloRF5KwI/L+vVz9OvlPwY2KyAN1LSFS1/CPjQ==
X-Received: by 2002:a5d:4cd1:0:b0:2bf:cb6a:a7e with SMTP id
 c17-20020a5d4cd1000000b002bfcb6a0a7emr2624436wrt.42.1676486576610;
        Wed, 15 Feb 2023 10:42:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 m21-20020a056000181500b002c56af32e8csm2646938wrh.35.2023.02.15.10.42.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 10:42:56 -0800 (PST)
Message-ID: <7b194041-4386-3b82-c65d-f0e3ad5cf015@linaro.org>
Date: Wed, 15 Feb 2023 19:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
 <9aa09940-91cf-32ba-34f4-a57c9e9965bc@linaro.org>
 <Y+vKcGic3sC7+3I/@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+vKcGic3sC7+3I/@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KUBCZAHVV7CDVJXLGXTPY6GOCFI43EIZ
X-Message-ID-Hash: KUBCZAHVV7CDVJXLGXTPY6GOCFI43EIZ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUBCZAHVV7CDVJXLGXTPY6GOCFI43EIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/02/2023 18:52, Mark Brown wrote:
> On Mon, Feb 13, 2023 at 09:58:15AM +0100, Krzysztof Kozlowski wrote:
>> On 13/02/2023 03:13, Kuninori Morimoto wrote:
> 
>>>    clock-names:
>>>      description: List of necessary clock names.
>>> -    minItems: 1
>>> -    maxItems: 31
> 
>> Not much of an improvement here. We asked to keep the constraints here.
>> I gave you the reference how it should look like. Why did you decide to
>> do it differently than what I linked?
> 
> Krzysztof, please take more time to explain what issues you're
> seeing, what you want people to do and why.  I'm having a hard
> time identifying what the issue is here - AFAICT when you talk
> about the example you linked you're referring to:
> 
>   https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
> 
> which as far as I can tell looks like what Morimoto-san is trying
> to accomplish here.  I can't tell what the issue you're raising
> is, let alone if it's something important or just a stylistic
> nit.

If you leave the top-level definition without any constraints and you
forget to include all your compatibles in allOf:if:then, then you end up
without constraints. Consider:

-----
properties:
  compatible:
    enum:
      - foo
      - bar

clock-names:
  description: anything

if:
  prop:
    compat:
      enum:
        - foo
then:
  prop:
    clock-names:
      - ahb
      - sclk
-----

What clocks are valid for bar?

For simple cases this might be obvious, for more complex this is easy to
miss. So the recommended syntax is with constraints at the top.

BTW, if there is reason not to use it - sure, bring the reason, we talk
and maybe skip it, I don't mind. But there was no reason - just part was
skipped/missing.


Best regards,
Krzysztof

