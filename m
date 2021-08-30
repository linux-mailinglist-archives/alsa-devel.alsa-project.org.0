Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405003FB42C
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Aug 2021 12:58:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDBC41724;
	Mon, 30 Aug 2021 12:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDBC41724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630321109;
	bh=fbESV5ZqI66U5BCJhdRnvvic3uv7lvAUEvO/d42TaTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RpvV9StOxqIssZMLCqYA7jMzH/65p0QduShc1XTjceu8SdzvGfVb3WIQLqr5Qnjb6
	 KGFUkM7/9mrmmL143nQFUFvRFv5tXsc+Wz100wjkuPPoOCP4YsT+rr7uQ3T08+Sl/8
	 bfnC6rpL4G/Lu4Sz/OXx3PjImM1W99HwJ/lhsA2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F07F80169;
	Mon, 30 Aug 2021 12:57:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1300F80218; Mon, 30 Aug 2021 12:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43A43F8016E
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 12:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43A43F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gN/rIRJ+"
Received: by mail-pj1-x1034.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so9706428pjq.1
 for <alsa-devel@alsa-project.org>; Mon, 30 Aug 2021 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IuLKz1s8t6PFtB3h5yQO3vsoV8BYc4QlCilxBHWTOcY=;
 b=gN/rIRJ+8Mk/MKOcw84CamLKnAejx1PZuqVsRV51WgkCvcJS7L9PiWIKt0TnmceP+T
 LWRDkoPqbMr9zTFv9XJG9Xj6TvqGCnYGa2ohFlCriTb69HjNgWfGichEWUseAQJg8Qsl
 iStTTO2OwqYvqYUWFGIDNLosinsIhEUxZjbRsO/5KlbtLOoVF5GvI5t+lsvGViaPBnQw
 G1mpqa0KY8zOeAIG0D/9eXsQNhPiHz0rsAnndZfMmWCv2GlWNdHhtwzjFXWD865dWSqo
 SaOF8r+DOgfxRSRI67JQUnYEoeorL/SCpBhsnCahpdVRGWchqt58a1hlZ8GGQUVWuvH1
 fz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IuLKz1s8t6PFtB3h5yQO3vsoV8BYc4QlCilxBHWTOcY=;
 b=DFAExkjJw+7Q/hkFr02HEayZJ6cn/eOIGABP5KOaJwtrKaFgTbGV/YgRJiYMIgXBLg
 VGQXx2ThkeGrdfzvlZyH/ZoITZyUtSU8GSuencctK5jdWHZZ0r6VdzrnZf6tbDe3EoV0
 bY7XLKhBsUBAzXkM842gNIHw+WiEdxeZfhTsmlZb3uWp9NshcHwqRQ3/JVzvzC17Ad2G
 4oQM2QBoMFtc7vCB6HSSS9GA5oAvKTkS4JOwNB86qIqt2+bmKM+OvRO6gi8+OB603CVE
 7025Y41f8/gFDlZEipGjZvrFaD3GzXhYPpHZQ6aJ5bNwedTwPIDUyDwQOhf13qZbZ2nj
 g6Mg==
X-Gm-Message-State: AOAM533+3TVpB5sS4H02GrFLHkTQaHHUKVmXcVOk1zWHdBfBIYpX/jpq
 vmJp5vRoMefHQPCPnhxs3jClX7ZkkJo2bzSL01w=
X-Google-Smtp-Source: ABdhPJw9OgY3Xxn2H4QQ1g1xlibhj/dL2aOLnV1zyaaGrMut4CoMdwiVwchEgR4QZ2kpD0o9m8nYPxIOOJnVw03hs7U=
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr21312883pls.17.1630321019360; Mon, 30
 Aug 2021 03:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210830104426.487246-1-atafalla@dnyon.com>
 <20210830104426.487246-2-atafalla@dnyon.com>
In-Reply-To: <20210830104426.487246-2-atafalla@dnyon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 30 Aug 2021 13:56:23 +0300
Message-ID: <CAHp75VfgbA0upoHyDLPCRGrN+7H5mZiDu-GbQPxHid++Z9UqQA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: max98927: Handle reset gpio when probing i2c
To: Alejandro Tafalla <atafalla@dnyon.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Mon, Aug 30, 2021 at 1:48 PM Alejandro Tafalla <atafalla@dnyon.com> wrote:
>
> Drive the reset gpio if defined in the DTS node.

...

> +       reset_gpio
> +               = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);

A bit of a strange indentation, shouldn't it be one line?

> +       if (IS_ERR(reset_gpio)) {

> +               ret = PTR_ERR(reset_gpio);
> +               return dev_err_probe(&i2c->dev, ret,
> +                       "failed to request GPIO reset pin");

It simply as

               return dev_err_probe(&i2c->dev, PTR_ERR(reset_gpio),
                       "failed to request GPIO reset pin");

> +       }

-- 
With Best Regards,
Andy Shevchenko
