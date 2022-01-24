Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66397498581
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 17:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD4FD20B9;
	Mon, 24 Jan 2022 17:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD4FD20B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643043394;
	bh=JrHGNB7FILF2R1RpVqkOil2R1IhY5hULcEOBgZQugtI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3KljcEFSMAUOMcT4CGu81EVHwOWfXxNeQPsuZnlZpwKlzEy5woQn5wZHr76HhO+u
	 CEg/XEEXfLIVM0B7LdXjmprN4SES8URQrWQ6YW+vvbJVM/pIxiyVumrT+74Io4ZOUR
	 rfleDgMN06pvYJyuUYmUxqhczby+5l/cjK8jSPwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A802F802BE;
	Mon, 24 Jan 2022 17:55:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53BB6F8027C; Mon, 24 Jan 2022 17:55:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B0F1F80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B0F1F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Zp914u3J"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CA4A13F1C2
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 16:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1643043318;
 bh=9EEQLll5JWPzYvRo5e7XU5syPg3MM9rervJCQ5j61PE=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=Zp914u3J397Qo0bMnjW6Vb28iFCOkvPinzNOAVPhvEVjfPQKvp6I/mDx0k+T4BjCn
 BMcBkc4l8IXio05eqnqQzZMwEiI1BzPSZJf5IrWDGqLACmhdGlMV8d9EU+v36dGiQe
 a8WhxBTiQ0MxkQwAY9Yvmq8Izf/bccI9Z63FqVL8Mq0BngOc6OTry8i744HZ1mWnUj
 5FaHnHfx5Lt2omYuWwPUuJWeU++PdmtEWFMHjk3thK7rlsZx/UcPXWGw/iUJvAY/KZ
 vGC7i7j/38cTNtVZ1TgX1uvKlC63SiQgc0+vlP9gATZ/ttdGpkihdoIfl5ZjXneMpV
 tMXhs29HykTrw==
Received: by mail-ed1-f70.google.com with SMTP id
 p17-20020aa7c891000000b004052d1936a5so9096783eds.7
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 08:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9EEQLll5JWPzYvRo5e7XU5syPg3MM9rervJCQ5j61PE=;
 b=tYX6dI4qMTJk2bt7Kt3OWr+DZeDwBe2LXfLp1iA6OqzjgUhWO/Qa9t4qhA7DEanv5h
 TNrBciX4Ra9SvrV5v57ei7eoEHvM3oNbz5J+DM4dpiEd66TnuwhvZhGpFIADreqU+HJi
 Ss4IbP0aOYVvkiYGsNTLaLMxnpA1AV0Ysl7QHVZbUVXxvaPoRvi4/UrDIj9RfDACRZu4
 s0lss/LQLuJ+TOY85LxxJ5DIPaslb9wruVIPA5XWrI5zUVTIlzRLQ27t9A9pTLfVID5X
 2niOU4mCj4D0IcZa7e99CZ7l8r05ehrZPEwlDybE5KBAIyPlgljQXu6089kLpeUp0B6U
 00JA==
X-Gm-Message-State: AOAM532tG87CHCbMNDYFFw8uf7/t5r+UiwX2fc0+xooNYTtJbbs28gGB
 w023WM8mwxwkfxoCxoHgvYBwcRghx9D7TIrOrVIrg8dZuUwUZsRjEJ2Cp5fJwNxmdz9Hutk8T17
 I7pmCSzbEM64LLdCMMiqaXZEzLe1LKDU0NA/a7a000tjOFinWistJ2+3i
X-Received: by 2002:a50:9549:: with SMTP id v9mr16834035eda.335.1643043318212; 
 Mon, 24 Jan 2022 08:55:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCcCQ2xn7I2rwOCmf8P8fmxvKeYvey/cJWwAqZ0tDzbf4isWUQwXV1mSERsEcSSLZDF6CZzpYhZ/4G59YeUgI=
X-Received: by 2002:a50:9549:: with SMTP id v9mr16834016eda.335.1643043317988; 
 Mon, 24 Jan 2022 08:55:17 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
In-Reply-To: <20220119015038.2433585-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date: Mon, 24 Jan 2022 17:55:06 +0100
Message-ID: <CA+Eumj4HjM8SPoOUo7_eLBOHFYXTPPPgmx_YDYdEXDyaT67Rrg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Wed, 19 Jan 2022 at 02:50, Rob Herring <robh@kernel.org> wrote:
>
> The 'phandle-array' type is a bit ambiguous. It can be either just an
> array of phandles or an array of phandles plus args. Many schemas for
> phandle-array properties aren't clear in the schema which case applies
> though the description usually describes it.
>

Hi Rob,

I have few questions below.

(...)

> diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> index 095775c598fa..3a4df2ce1728 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> @@ -21,8 +21,7 @@ properties:
>      type: object
>      properties:
>        sound-dai:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
> -        maxItems: 1
> +        $ref: /schemas/types.yaml#/definitions/phandle
>          description: phandle to the I2S controller
>      required:
>        - sound-dai

This passes the example only because the example was simplified to
hide dtschema errors.

The cpu dai node is like:
cpu {
    sound-dai = <&i2s0 0>;
};

and this fails with errors missing phandle tag in 0.

I am converting rest of Samsung audio bindings to dtschema and have
trouble expressing this. How schema should express such cpu node?

Best regards,
Krzysztof
