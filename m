Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE50560E413
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 17:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 782E62C26;
	Wed, 26 Oct 2022 17:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 782E62C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666796779;
	bh=/Gaj5ky02zxAIMm9HHavYcFyk7Sj0ZgwNGV3Q5oH7lE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYCsyt4Phx/EZQ3hq20z9SCzRZ4hkwkgLYzpkUEbXBs7A3W7IwCaJzRMGCeQcLfu1
	 x+leSvMejmzXE84RIGcl06rS+Z32TNUwQUQ4Qm4vTbEQxvAPpevVONbSk+deFZtL9h
	 uytKNkY5PVvKtauG3um46Ei332G5RhFqtc+/v9jM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 071F2F8027C;
	Wed, 26 Oct 2022 17:05:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B44A4F80271; Wed, 26 Oct 2022 17:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9510F80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 17:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9510F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ol7qYit5"
Received: by mail-qk1-x732.google.com with SMTP id d13so10717437qko.5
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X+Yian3XJfjwAtTtvdKaogB3HiRKzCGm7a/+W1PG+Bs=;
 b=Ol7qYit5i8e0FB2o5UVEvowECPm2l3afA/NKhZBEFTqA3cRqK2OswutA/C8AYW2tQc
 IDCbMbPg04VX0hxosA7JgNk5JLi58Yxv6iJ9Fr2viWNfMeqE6JN4d2D07kf5TSPKZjqb
 rLl6b1MOzmRd+YKi+Wq3IkZ/OqzDiCFW7k4m+KbRmQkakweDhIjhGjsc+cnZXQTZf17o
 5X490R3cQofow4QefVKFYCg77XoJuKhFqN2A8vCPsDuK1Hu736zRaae3CL7uN4u3SwYe
 5kQepm1PShNfxh2p52i44FfFhwqw4Wt1+D3pFFoUzHF5z+w1gGygk4MEKBWhsfi36k6n
 TE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X+Yian3XJfjwAtTtvdKaogB3HiRKzCGm7a/+W1PG+Bs=;
 b=nd1A9dnn+sW43o6Y9dNwsfKk5bSGBSG8RkUUjwJn7Flt4iVeGa/WBqwkguN7nbxFM5
 9IXW8KRouxA+IQLXfLXPP6RB8XKI35fGBtVgTt40qNTlHbanb4T5yX3vbMWaZURnbumg
 xWnaon4rdTgpakQNhNKjAsMXriFansXWbwo6jcAaW3CpdTXpEvB73Z08BfevsSKFD1IA
 nbTT0NvsqbLhOIoMR2pIH9mvdDGzKeXnVbvqXA9eBpQzJf6tpxBH3RrYlkrJGruXOrtR
 SFcEIwz1eG5mChhEhZMbK9+vTC7XJFHnwc8b1vmjMQ/r+amoUPSGGppltW6ODkY6r1iH
 5NXw==
X-Gm-Message-State: ACrzQf0ignrx6Af9P+xxdNCLQyOosLUavlGMiv49x8Nn1WHWPjutI7xO
 XRb6zf4JK5QVFptXik3YhR3qnA==
X-Google-Smtp-Source: AMsMyM6foj2gIjI2u8y7Jp2aKeXtSR0X0hJfnW9nxP5T5NjKIqKcVT7s6ReMcs7TNopkLjjkoQj4kQ==
X-Received: by 2002:a05:620a:4398:b0:6ee:be9f:435c with SMTP id
 a24-20020a05620a439800b006eebe9f435cmr31093108qkp.35.1666796715759; 
 Wed, 26 Oct 2022 08:05:15 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a05620a0ed600b006b61b2cb1d2sm3944483qkm.46.2022.10.26.08.05.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 08:05:14 -0700 (PDT)
Message-ID: <ac24732b-a7bd-59fb-4178-b225bc0b17c0@linaro.org>
Date: Wed, 26 Oct 2022 11:05:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 kuninori.morimoto.gx@renesas.com
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

On 22/10/2022 12:27, Aidan MacDonald wrote:
> This is a new per-DAI property used to specify the clock ID argument
> to snd_soc_dai_set_sysclk().
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/simple-card.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)

My concerns were addressed, so:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

