Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9068A325
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 20:38:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D1182E;
	Fri,  3 Feb 2023 20:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D1182E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675453137;
	bh=GdSTIttsvdoS9nDIXJuIT7rpVrt8eGh1b/7FEa6Hl/o=;
	h=References:From:To:Subject:Date:In-reply-to:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ToWI98MTbtt5HwJ2HbO6V9STFNyqccumX9LO2oiraxTkDKYO8dal2Z1UG9StHdCos
	 nQbRI/ZC1NbFrX79qYfIFfD187+AoAXX4SdXoLH/4ktdTO/WdScy27gf8CbTHT0Q4q
	 BbxYsWlzMGB9sC9bNj9ovQ3NLGqFPws3aRMQav7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BF64F802E8;
	Fri,  3 Feb 2023 20:37:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69647F80254; Fri,  3 Feb 2023 20:37:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 949ACF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 20:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 949ACF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=NejcbZPM
Received: by mail-wr1-x42c.google.com with SMTP id r2so5574657wrv.7
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 11:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=db6MYL6B1qCC0WghXqCqpmCV3BHmf50h/GnlGcgDEws=;
 b=NejcbZPMYGHRsiENQYz73HwZK/9UL8brsL56ssuMEEaDh7BfaeG5MgjlQC13JxmepS
 M0sYVmEsXS7mgyYEFXcu4HOW8U7sS38JF88Ic27hOSq1v25TcP8kgLdAdw9iypZUoOz1
 GTZ4vYsVM8mntAcvCueB0/hgRoiTp/G2YeyAwFXMIxTxCjXaztDHASyidKEKxWE+HcTZ
 ZGXUyltBkanzVFc2TNFwKp6tjcusPMlQYO/sIubxAXr/971nn9I2CplF5cDqUc1vvQk9
 fWbn4v/41QLAhtgfB/9U5F1fwFL96fXJ1N9HTRd0mzYAr0uk/PapTsrZNdEEcCBZW4wq
 bxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=db6MYL6B1qCC0WghXqCqpmCV3BHmf50h/GnlGcgDEws=;
 b=RzhH7ZIrtxNbPZoHzrHQsc+COsNzrE7Ncj+LjLwdAp5+bUYx1vg5Nubrz0VE4SAylo
 +O8+X+hrJ97ajtdOblTOkc9GGOkd/fpuEF5Slas543Y92v1EC/4KKiCVnNSAL884lCO8
 ULw4sDXy2M0i4MQpFkNJIDb6wf9Jy1WuSTB9PpK6YnzFr9S9DiG5VQPs3eT7kC1nxlkr
 XxmSabfidQQ6fjj1+mu4K4qnarS55iIc5gsvLoGcNdn3UzP4LunLJRzh0a+gWAiLoAzl
 dU20DFLULVTZMCNxXRsCSZzGzuJC8eX/qm2R39xbMHVZXYzPY5JdbMb9qp8F5QziQFTV
 l67w==
X-Gm-Message-State: AO0yUKU7VFZYd8IeNiLrHVGmgfVELCBTzymK38ulZESrLUE2mUrO7Lvx
 R8jygWsAb2esVJPQHO+i7hJxmw==
X-Google-Smtp-Source: AK7set95ZxUhUht3lmVwu6Z+ambqGhwtxGfLtaPaosE/50HAbN2VkxWC/Qzfga+8oosSaxr+m9qmXw==
X-Received: by 2002:adf:fa84:0:b0:2bf:ae15:ac15 with SMTP id
 h4-20020adffa84000000b002bfae15ac15mr9307669wrr.62.1675453061095; 
 Fri, 03 Feb 2023 11:37:41 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 o15-20020adfa10f000000b002bddaea7a0bsm2744105wro.57.2023.02.03.11.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 11:37:40 -0800 (PST)
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
 <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Date: Fri, 03 Feb 2023 20:34:21 +0100
In-reply-to: <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
Message-ID: <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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


On Fri 03 Feb 2023 at 18:59, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 03/02/2023 15:13, Jerome Brunet wrote:
>>>> +          Multiplication factor between the frame rate and master clock
>>>> +          rate
>>>> +
>>>> +      sound-dai:
>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>
>>> Old binding was saying it is just phandle
>> 
>> It is just a phandle but the bindings used to have problem with phandle
>> that had cells.
>> 
>> See:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
>> 
>> Was it wrong or did the situation change since then ?
>
> Then define it as having cells:
>
> https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42
>

The card is provided with the phandle.
Whether or not the phandle has cells or not has nothing do with card
driver. The card just consums sound-dai. I don't understand this comment.

>
> Best regards,
> Krzysztof

