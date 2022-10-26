Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D1D60E408
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 17:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 214393BE1;
	Wed, 26 Oct 2022 17:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 214393BE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666796668;
	bh=dNv13atOfSUNhjQbTZf71yVKPuPN57bDeiplqtsXE1w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SnsfVEaqFo1jg8XhTkVl9fMtDSIm0BRO9HNMPkmosZ37CUhCEI4Tyc/OaInCmnYwO
	 NGk2CGTqjuqEbfnMzYly2M1EkZSDHmz7NNDdP9F/CMf0FL2GUL1cJ7KdDbB/jpFa7x
	 jxTAD71E+UY1FFs8L02r48qHHwPYP/y/BM7TcOo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62F64F8027C;
	Wed, 26 Oct 2022 17:03:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33026F80271; Wed, 26 Oct 2022 17:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AD2EF800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 17:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AD2EF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l6iea6O/"
Received: by mail-qk1-x72c.google.com with SMTP id j21so10697385qkk.9
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vLZuzkEKYp97tAxDKW0D3/Gkrrsn7TLdMLIwN3unr6k=;
 b=l6iea6O/IfA+IU8rsKa/xzdX0TI+DG5gYzNw4EfcdDXMQWAIx3WzFHQ7WrucFjyiw2
 R6jbnPvM499FIYged2lfIzQbOAG28Fl2PeRw4xCeg1C/iLtTnQGVGlKNFJPn05JfE9J9
 Z06FwsPirlsVSXZegXXJNS+Pm2mvskZ4+PkpZaMCDb/EIYlp60NlunTlvBf18hSoP5Gv
 s6sNB2RJZRxFX9Cen0El2ParhFlnGry9Q/oOzcUNKlDzXqGp2Fu6fH4uYHzXHt4YfJdv
 sRn+uR6IoPiWHOpl3t9b0ZGI41ZInAYeE1ARtdmcHz8DiZ3mTj+YOdFcCQhHjBNe+gQZ
 TmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vLZuzkEKYp97tAxDKW0D3/Gkrrsn7TLdMLIwN3unr6k=;
 b=OUlyvEBLttoouIZWj1PVmobL/92vTkGvA+1zmrnrnXXNuN5BOYUIufwCA30iKAsZFg
 gAIruV5cSEAYwxUF4p3EsqB9tx/jPoN4vGcZhLkU3ZxCgNCJKGjCgXMYdEgE48wnuvOD
 jtEDJF17zOs/Rzi/B+FVpY1lpa9MmJSn463Lbzu+DytykIyKGscaByOAk8CMLJsfUjAv
 rStiGGiRm6I8y/z2NiJWPcB8HRS0sYKJYr/o8ApWfxVhp76d1BDL5IDtwB86rJNn0IZt
 7Pw/yiZBbH95LTtf9tE8+A91R3mtIDFq/43RZkUvHQZpMhzmCPM4J4b3fBxyRwHYM0ls
 oF2g==
X-Gm-Message-State: ACrzQf0th6XH424pWtVDedhmbWqqNqH86oGt3ZYmVEvYE7p8zIYUPDcn
 l1PI1JzbpsqClr77pc2YW6evrA==
X-Google-Smtp-Source: AMsMyM7rarxhxnKYKAQs4buid/BHIUQHXVqNLrmkLzuNgNzVpR0hobrza80y8f5pxap7RvookcNtbQ==
X-Received: by 2002:a05:620a:bc5:b0:6ce:bc87:9253 with SMTP id
 s5-20020a05620a0bc500b006cebc879253mr32009819qki.486.1666796603111; 
 Wed, 26 Oct 2022 08:03:23 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 o8-20020ac87c48000000b003a4f22c6507sm554617qtv.48.2022.10.26.08.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 08:03:21 -0700 (PDT)
Message-ID: <874e74ae-86bb-7950-1615-36e1a326e177@linaro.org>
Date: Wed, 26 Oct 2022 11:03:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
 <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
 <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
 <hXRpArckbrXUelDdaJ3Y2SErmKiuycXt@localhost>
 <66c1a100-922e-4a33-e80c-fc80866acf03@linaro.org>
 <jZCUALhj8PoqVkuWdtLf8LnPAj1wDakF@localhost>
 <38205667-d36f-e7a9-21b0-2e8597a662ff@linaro.org>
 <qNdQQJRLFWJ6gNfwM73oJ8EH56Y5nWgd@localhost>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <qNdQQJRLFWJ6gNfwM73oJ8EH56Y5nWgd@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
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

On 26/10/2022 10:48, Aidan MacDonald wrote:
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> And the remaining piece I don't get is that these are not bindings for
>> codec, but for sound audio card. You want to set "system-clock-id"
>> property for audio card, while putting clock from codec, which will be
>> used to pass back to the codec... so it is a property of the codec, not
>> of the audio card. IOW, NAU8821_CLK_* does not configure here the clock
>> of the system, but only, only clock of the codec.
> 
> The system clock is controlled at the DAI level, it's specific to one
> DAI on one component. The simple-card device node has sub-nodes for the
> DAI links, and each DAI link node has sub-nodes for the DAIs within the
> link. "system-clock-id" is a property on the DAI nodes, so it's not a
> card-level property, just one part of the overall card definition.
> 
> Since the clock ID is something defined by the codec it would naturally
> be a value defined by the codec, but the *configuration* of the codec is
> part of the sound card because it depends on how everything is connected
> together. If you used the same codec in a different machine it would
> have a different configuration.


OK, that sounds reasonable. Thank you for explaining this. You still
need to convince Mark :)

Best regards,
Krzysztof

