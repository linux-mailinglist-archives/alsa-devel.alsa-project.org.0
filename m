Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AD968A389
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 21:29:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B92C6826;
	Fri,  3 Feb 2023 21:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B92C6826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675456154;
	bh=YqeBhjjV+lW4B2bmKEqd84qE4MV9JNhIkam5v/WyErE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EFLJtjqMA2tZq1SM/8be/sAyupmz4YMBuTAEui+dcA3U5bceWUgI1eyq8dmUrmKXD
	 VvyAOjFH2ocJxchc18AmhrC367q7tcOuQjW3WEY+Nx/ORmAuBYKKSWKiQ4a4avN1CZ
	 0tNlyogqTEVAi/Siufqz2EZm9Q78rottfzk3C3Nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E70CF8001D;
	Fri,  3 Feb 2023 21:28:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A50CBF80254; Fri,  3 Feb 2023 21:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F013FF8001D
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 21:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F013FF8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SezcXEcW
Received: by mail-wm1-x32b.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso4742098wmq.5
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 12:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OcaR471TXAjGr31MjNbqXuBFmDxa1S6cNX7l4YGYmRI=;
 b=SezcXEcWF/dRKemlQQqQWL8NAYRbNZuSckOdAlUWdAlQWpoWXU5+usWAHMA82BZBLg
 CXMBSlZbEGaxjypt6Nfl0LkI9duN6m5fNPGEgGmIGAZOb5oCE5TO/Od8nQwCnEPL40N0
 zbUDICs8/GZ8i596nTr05XvUC7rjuRvdgdoAkptotziPI32OLe9w9GB3a75qEeMMne0x
 UeQMPNIIWo2T08GbT02VdVoXOskEeQOdTZohR5myokK1bR3slxoQ7DzJMiGISiAKXEuk
 5d6EiVdMUeAWT2NKr/JXCVXQ6bLsF6Hnct6TneOHGvketNvDbD5c9etecDSFFEnA+AJj
 EcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OcaR471TXAjGr31MjNbqXuBFmDxa1S6cNX7l4YGYmRI=;
 b=USknWbzzsUKAlDbEIcZ2YhC8/Qw8HX3errDBLVrfwSbSx+ookjLlz1iqcWMHA+QUuW
 Te51JLuG6uiknAC+hzxKF1bXhv8IwKfQi0UN5VCOStbPt7guJ6AVjeiFpKuPVMnuier8
 g2ZL7V0lFYdNu9TANMfNgpf8Xb5VM/dylxp+a+OXHLBsYDZ5kraEVkM7Ah1FufolYfA7
 1hLmKRX+NjOKwTiMnEP6sWaNsf2wizwWGg14Jv/j0rw/AE6BY8S1cUNvFM7fbNyvnzNu
 g2s0Y6rGHXxlSq3/mxt+Vlm2G8pYCKewLE9oDNpuKIVnVH3zQgvpjLNwf7Ttv6h8R2MA
 f6nw==
X-Gm-Message-State: AO0yUKXG5XXPGsbFWymHkaezLudlL7C/3FTU1m22gZY8QsQ8PPYiT3t3
 8L0jMKTF3vSBTuLBD2/YQutMFw==
X-Google-Smtp-Source: AK7set96RpaTqpX9Bfu005sId7DrlnJXnLTXqwwUkaTAzF2cO0cHdxloiYdhXNMOBbDNxsyHPR3krw==
X-Received: by 2002:a05:600c:1c06:b0:3d9:fb89:4e3d with SMTP id
 j6-20020a05600c1c0600b003d9fb894e3dmr11971335wms.28.1675456081778; 
 Fri, 03 Feb 2023 12:28:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003dc34edacf8sm8466662wmc.31.2023.02.03.12.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 12:28:01 -0800 (PST)
Message-ID: <79474344-0bf1-ba0e-6bae-0ccb4e3a3aee@linaro.org>
Date: Fri, 3 Feb 2023 21:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
 <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
 <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
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

On 03/02/2023 20:34, Jerome Brunet wrote:
> 
> On Fri 03 Feb 2023 at 18:59, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 03/02/2023 15:13, Jerome Brunet wrote:
>>>>> +          Multiplication factor between the frame rate and master clock
>>>>> +          rate
>>>>> +
>>>>> +      sound-dai:
>>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>
>>>> Old binding was saying it is just phandle
>>>
>>> It is just a phandle but the bindings used to have problem with phandle
>>> that had cells.
>>>
>>> See:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
>>>
>>> Was it wrong or did the situation change since then ?
>>
>> Then define it as having cells:
>>
>> https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42

Eh, it is already defined, so my advice is incorrect. Drop the ref and
define maxItems.

Best regards,
Krzysztof

