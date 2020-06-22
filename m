Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F29A206E5C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 09:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B82417ED;
	Wed, 24 Jun 2020 09:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B82417ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592985390;
	bh=e4u8p67MnG7uieMVuk/eesSiZuH7/n9Cu+nN9oaijlA=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmhsTTfth538qOerRS7CIJnlPE8c/QQFY85kZmSSlY/heY/tUaECUBxMdkUxiysJy
	 +rpE6v/K5lY3ApbEUTHjeUhT132159P//YawTrR1Dkh/5zmgrB9reuf9o/bVWaOY5j
	 fwpF9drGq0QWJeTQYi/W4qxyi2uBhJRlu7+9kXrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A96DF80316;
	Wed, 24 Jun 2020 09:49:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B387EF8015B; Mon, 22 Jun 2020 15:33:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AD74F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 15:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD74F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yzWbEtJw"
Received: by mail-ej1-x643.google.com with SMTP id dr13so18011512ejc.3
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 06:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DN+aIrNNSN4VZvLqRGfauOKkPbvay1cyyn1lN95aoco=;
 b=yzWbEtJwrPJKbiLaeKXvfuyfqHafyIJ0bgC41vGAyu4gMBeHvixHGOIY9b7msORZoo
 wgtBscreEdbMak8oBnBE/57VEdZZ8e3gi+zE5xNhaONMl4nICm+WQ/bOgND3hBWVGF84
 bhX8Q24cJRWVUqFoOaH/JxqIFsQoHcvI47ML1OyjHfTBECvN3Y+SYOKtFEnxPWZYUaZr
 FBg16HOe1Et13yABN5E9jsCdWGHut4nAbIX77+6qvR+jDbUqzLr9Uobe2VmwCfBHTP0Y
 Tv2p91wpWva9Oi7rg8lX2rHkyEHHVIBQg09sHId/rc0w16tEHglt+mlZSsDLY8PI0/Uh
 fF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=DN+aIrNNSN4VZvLqRGfauOKkPbvay1cyyn1lN95aoco=;
 b=WBXh2plePftjaBNQ2izSQRITgawYAWSR8FdzDR9kBG7JISiD/OVW6oaDwyVCEOtmFl
 7dZ8AeP43nZyP4tbziL3PKb4gEuBTD+tKoDheN2PauXa+Nz/l4qdpe8voOsjnuVpzVmm
 YTOEdiTGeF49pzgR+bz+hOh8aQiw4QtdQlF1yDhDSdFcBbNzdDaE90XRgivLg/8/rl0u
 SvZzz6sQbNghG7peKnk/ZEu2F2pQ2loo9XKgEp6b9wpfZZ/c9ksdyclMq9whURL9+vED
 f2dCCnXUS+73YLa+GyqrJbkGxGbGlAp+nVf7Iw18hm1HeGGZ0gWOzZzmWKbUbYjlMPx4
 pUwg==
X-Gm-Message-State: AOAM532GfNdAw25T4tYw3vcufVaPtUZsZdgPvYma9ThNpijU30IYvgVR
 lUj+NUOBh3j4Q2LvcSLK2YBnCQ==
X-Google-Smtp-Source: ABdhPJwQskSgfiCPBZPphv6mJbhvwfrvXYjmrfJ2WkcPKDBC2x2YMZVtMkHmBAfue4WjvYFeKgFQjw==
X-Received: by 2002:a17:907:1104:: with SMTP id
 qu4mr15187950ejb.382.1592832769399; 
 Mon, 22 Jun 2020 06:32:49 -0700 (PDT)
Received: from [192.168.2.2] (ppp089210109128.access.hol.gr. [89.210.109.128])
 by smtp.gmail.com with ESMTPSA id
 u19sm4810426edd.62.2020.06.22.06.32.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 06:32:48 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
From: Pantelis Antoniou <pantelis.antoniou@linaro.org>
In-Reply-To: <20200622120409.GD4560@sirena.org.uk>
Date: Mon, 22 Jun 2020 16:32:46 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
 <20200622120409.GD4560@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:29 +0200
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthew Porter <mporter@konsulko.com>, Shawn Guo <shawn.guo@linaro.org>
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

Hi Mark,


> On Jun 22, 2020, at 15:04 , Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Jun 22, 2020 at 02:34:23PM +0300, Pantelis Antoniou wrote:
>=20
>>> This looks much like a replacement for ALSA UCM and userspace audio =
jack
>>> detection coded into the device tree.
>=20
>> I wouldn=E2=80=99t call it a replacement exactly. It=E2=80=99s merely =
a way to bundle all
>> of this information about codec glue in the kernel (where it should =
belong IMO).
>=20
> No, you're encoding use case decisions into the DT here - for example
> your example will break use cases like ring tones and shutter sounds
> which should play through both speaker and headphones.  It's also
> setting volumes which may be inappropriate or may be not and =
interferes
> with userspace using those same physical volume controls.

It is completely optional whether you use this functionality or not.

In that case you don=E2=80=99t use the automatic routing you merely set =
it to off
and everything works as before. Or you merely use the route setup for
the function from userspace.

The device in question is not a mobile phone so there is no requirement
to have speaker and headphone active at the same time. It is possible to
create a function that would be headphone+speaker active at the same =
time
for that case.

Regards

=E2=80=94 Pantelis

