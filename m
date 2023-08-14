Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8339877C32F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 00:03:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB8D3E;
	Tue, 15 Aug 2023 00:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB8D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692050595;
	bh=0vHbiGwXdjeAX33cFcCEZh1T3GQZvFoORwRIfLgQ/cQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=csgMXHi9mv+wmDwrZ+mRjOYiaO/vxiOl2aoYBZP2VeLgSF5vBGId/qbWyRS90Wp6Z
	 ZHmZSE7TzovTj6cvlVr6/omwbPhHP4RXprK0CsuHUhsJQV6DfUTQ3TE501qrpr3fb5
	 d1dx3LNuWmV4EvfDY5FfRe3/wBE1qcjmPDCZ8Fjo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF677F801EB; Tue, 15 Aug 2023 00:02:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6880CF801EB;
	Tue, 15 Aug 2023 00:02:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51D73F80254; Tue, 15 Aug 2023 00:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C660F80016
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 00:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C660F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=dQh/oXzk
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-63fc1574063so23675176d6.3
        for <alsa-devel@alsa-project.org>;
 Mon, 14 Aug 2023 15:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692050533; x=1692655333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mwYC5y1w73XOQ+JQk9ab6pGT6BUQ0RtEcIvzv4bMiU=;
        b=dQh/oXzkAnSIrtDNcO6e5Rb9npBij+9Md2DDJpcMtgE5V8lMFH5fyRAzbjpcFej7ny
         cX6f8nkjPkuSyNj5VM+zEv3PTAUz1cC+taVXXaoZ0oS3wMR3Veesfh8jNGbx3l8U9MGF
         Dpxwc9pmNuy4v4KqYuUXV75tqbymxCExp0+zuG8YJ4erqXWQmWTUdjNvCCZkyDP0NgeY
         X0u4oa0AIVXaRRaVlJZWADjWzeknVdpAHD6sTaG8BzJoBAIcFze2JrJgFesxQULRYkzI
         smkBvJOcq9uvREbJklJeMrJQ8VEQ0TnnG2TwXZFtC2AKVNL27f2ThO/PQeAHZ9Xl9H5/
         zDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692050533; x=1692655333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mwYC5y1w73XOQ+JQk9ab6pGT6BUQ0RtEcIvzv4bMiU=;
        b=aGA9c34g0ygBoUqoM6OJXFgeAfWgcsX5pGidJRJtt3R9tFJizy/MfCVfPjNyh1K/5H
         mK5dmpGiDsTL5CoAcS2DLteMxRjvgg/UCokjMDPwisQyZpd1UEzpT6Dj/Uy/s8IWIXeO
         3wLeQEbYUooKLqQDa1aHE4uaX0KrFnd1nqf+zHWABlaQMRFzu8q4uAVN+h9uC/9Qiw47
         UILorqs53/9HiFJ5Z3nRwH3ZCw0CKxGCkdr/4/IXEF/p7M2HtiGyQWwMiCIlNEkvWjTJ
         ZxQANFyQtCCYfKZd8zrvbaPRHm+oClCIdXO1jqf+QWRhnvXJY4C/kHmHrFwQSpVSjEbn
         Mezg==
X-Gm-Message-State: AOJu0YxG/ao+02q1iJat65K40TxOkXnpT4B1Z8KIWRGYm8+YwJZIhane
	kn88j0kaScXixkON/tUUOQS3VT7ew3JQXoxDK3wBPQ==
X-Google-Smtp-Source: 
 AGHT+IH6wivOZHs37QX+AYcNTOVvJhfdvZs2Fe6L0Y0X/5iqhnofg4KtZ94BhgTJQ2RzI2U8jlPbdkhVTSh/ljoySZ4=
X-Received: by 2002:a0c:f444:0:b0:647:27ee:4853 with SMTP id
 h4-20020a0cf444000000b0064727ee4853mr2741059qvm.5.1692050533527; Mon, 14 Aug
 2023 15:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230810104749.164827-1-krzysztof.kozlowski@linaro.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 14 Aug 2023 15:02:02 -0700
Message-ID: 
 <CAKwvOdm5kiTho-b1yagjjCGX5-=HGKutGZR3NkDeYh5RRBHJ_A@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: aw88261: Fix unitialized ret of
 aw88261_reg_update()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
 alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	llvm@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MUDGDHL7W44T3GIUAI3B3YC27C4BSV2L
X-Message-ID-Hash: MUDGDHL7W44T3GIUAI3B3YC27C4BSV2L
X-MailFrom: ndesaulniers@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUDGDHL7W44T3GIUAI3B3YC27C4BSV2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 10, 2023 at 3:47=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> There is a branch in if() clause where aw88261_reg_update() could return
> uninitialized value.  Pounted out by W=3D1 clang build:
>
>   sound/soc/codecs/aw88261.c:651:7: error: variable 'ret' is used uniniti=
alized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>                 if (aw_dev->prof_cur !=3D aw_dev->prof_index) {
>                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   sound/soc/codecs/aw88261.c:660:9: note: uninitialized use occurs here
>         return ret;
>                ^~~
>   sound/soc/codecs/aw88261.c:651:3: note: remove the 'if' if its conditio=
n is always true
>                 if (aw_dev->prof_cur !=3D aw_dev->prof_index) {
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks for the patch!
I see this addressed already in -next:
https://lore.kernel.org/all/20230808125703.1611325-1-arnd@kernel.org/


>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/aw88261.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
> index 82923b454dd4..fddba2f2de41 100644
> --- a/sound/soc/codecs/aw88261.c
> +++ b/sound/soc/codecs/aw88261.c
> @@ -636,7 +636,7 @@ static int aw88261_dev_stop(struct aw_device *aw_dev)
>  static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
>  {
>         struct aw_device *aw_dev =3D aw88261->aw_pa;
> -       int ret;
> +       int ret =3D 0;
>
>         if (force) {
>                 ret =3D regmap_write(aw_dev->regmap,
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
