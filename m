Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5C4F6DC7
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 00:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA46E16F5;
	Thu,  7 Apr 2022 00:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA46E16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649283591;
	bh=CPhECqADC146ThgJ0MR6olgglVlteRyG9oucAx9VaM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ym/zu83RPsiuYRJMswyZCKIm1xWmRAcNgz83zZHDt/SZ18aN6EKAV3DVwQJtbS5M3
	 dC4Et1lkIrSmW5TgG9Z4jAaaVPvWPd/oX1fRm5yk4e5YSKS9oW4UVR+cNecaNol//1
	 W0QosOQpFZIZZHA4wCe6RddaIRoz1e4P7zMptYbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D9DF800D1;
	Thu,  7 Apr 2022 00:18:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78210F80161; Thu,  7 Apr 2022 00:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BAE9F800D2
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 00:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BAE9F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N8R7MGFZ"
Received: by mail-lf1-x12b.google.com with SMTP id bu29so6608540lfb.0
 for <alsa-devel@alsa-project.org>; Wed, 06 Apr 2022 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pa4zANWlurn4lYqdOaK271sbJR8UEPePP6fbBE/J4kE=;
 b=N8R7MGFZWjnMhj7QOyKsDCjHayVa9WIX1gG7JLDq5BWaMaMIWspyUd7zrKaskWI7iC
 UHkr9hqQj6fvZShD3GNG1rtFrtFNWgRZrmqfuRBL3zI4bm9J6rJvyL1Y35cARYWg02ND
 J4EJr+VbOBaFdpQVUqbNIJEHPYyMBJLVy34lk52nSHEIUN8CdJa9EZwdNrNemn40p0OR
 TeusOiQSGCnTNN32rTsFwJ9PaPPU5Z2JYKbrVox9IzU+CY7xcvGR0+t2e89A8Zs5x2Yk
 de5f2vfcCioSdg8gyeyz9SVyO1jP6DJNIFc1TKWcH/3ZlVSy1aMQkCRBXR4HJQNJ/yyn
 jZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pa4zANWlurn4lYqdOaK271sbJR8UEPePP6fbBE/J4kE=;
 b=RYPnVkBGyMYpTPOgV/1IZHBRIyzR77moms3UwrctPz3QJm2MaYTxtE4BYYQyw8XCAJ
 +0WpLr0mQ8M4GEmbaJzXdhN+CqF9ZAkjASIzr2BkTayXkDBnNmDy7M8ybDYCfF+dlMTe
 TaPBfjPKxu4+BG0yGgziddnf15AS5pnLEuypujJroI11OP3yQ6EddiYwM0NcGb/OV6Gr
 KS/pGxvLKd5VA59ypGuXCxFrfDmIs+7m6wrH0fYaanWnyzwJZlkQOsyy5RScEft+iIXW
 J/hZqSaJPXeuIo/VpatxeZy2RxOZDtTVZjm0Wf1NDfzuzss+pVThVNDsuL8SGdIXRtac
 MzPg==
X-Gm-Message-State: AOAM532BQ261PcOnjV6Jf0Gt0qN4O0kzoXMTDuATR0fyVNNb6eqCngAO
 LImiT3glb37TA5BeEFGr650=
X-Google-Smtp-Source: ABdhPJwHI8x+zuSmsxDgxAL5xnYDtATE8JRV4/uEdWX+YajahQyIksWC0vOdA/yzLTHf8y6BXoDJAg==
X-Received: by 2002:ac2:5119:0:b0:450:d4e7:99ca with SMTP id
 q25-20020ac25119000000b00450d4e799camr7259563lfb.95.1649283526734; 
 Wed, 06 Apr 2022 15:18:46 -0700 (PDT)
Received: from dell.intranet (93-181-165-181.internetia.net.pl.
 [93.181.165.181]) by smtp.gmail.com with ESMTPSA id
 bu20-20020a056512169400b0043eaf37af75sm1967337lfb.199.2022.04.06.15.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 15:18:46 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>,
 =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
Date: Thu, 07 Apr 2022 00:18:45 +0200
Message-ID: <1908101.usQuhbGJ8B@dell>
In-Reply-To: <1fa386d7-2222-f12d-8a8f-c7be29b1c6d2@gmail.com>
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
 <1fa386d7-2222-f12d-8a8f-c7be29b1c6d2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

Hi Peter,

On Wednesday, 6 April 2022 21:57:34 CEST P=E9ter Ujfalusi wrote:
> Hi Janusz,
>=20
> On 02/04/2022 15:01, Janusz Krzysztofik wrote:
> > The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> > supported by OMAP1 custom implementation of clock API.  However, non-CCF
> > stubs of those functions exist for use on such platforms until converted
> > to CCF.
> >=20
> > Update the driver to be compatible with CCF implementation of clock API.
> >=20
> > Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> > ---
> >  sound/soc/ti/osk5912.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
> > index 40e29dda7e7a..22da3b335e81 100644
> > --- a/sound/soc/ti/osk5912.c
> > +++ b/sound/soc/ti/osk5912.c
> > @@ -134,6 +134,10 @@ static int __init osk_soc_init(void)
> >  		goto err2;
> >  	}
> > =20
> > +	err =3D clk_prepare(tlv320aic23_mclk);
>=20
> would not make sense to change the clk_enable() to clk_prepare_enable()
> in osk_startup() and the clk_disable() to clk_disable_unprepare() in
> osk_shutdown() instead leaving the clock in prepared state as long as
> the driver is loaded?

OK, I can see the clk_prepare_enable() approach is more common than=20
separate clk_prepare() across the kernel code, and I have no arguments=20
against it in our case.  I'll submit v2 soon.

Thanks,
Janusz
 =20
>=20
> > +	if (err)
> > +		goto err3;
> > +
> >  	/*
> >  	 * Configure 12 MHz output on MCLK.
> >  	 */
> > @@ -142,7 +146,7 @@ static int __init osk_soc_init(void)
> >  		if (clk_set_rate(tlv320aic23_mclk, CODEC_CLOCK)) {
> >  			printk(KERN_ERR "Cannot set MCLK for AIC23 CODEC\n");
> >  			err =3D -ECANCELED;
> > -			goto err3;
> > +			goto err4;
> >  		}
> >  	}
> > =20
> > @@ -151,6 +155,8 @@ static int __init osk_soc_init(void)
> > =20
> >  	return 0;
> > =20
> > +err4:
> > +	clk_unprepare(tlv320aic23_mclk);
> >  err3:
> >  	clk_put(tlv320aic23_mclk);
> >  err2:
> > @@ -164,6 +170,7 @@ static int __init osk_soc_init(void)
> > =20
> >  static void __exit osk_soc_exit(void)
> >  {
> > +	clk_unprepare(tlv320aic23_mclk);
> >  	clk_put(tlv320aic23_mclk);
> >  	platform_device_unregister(osk_snd_device);
> >  }
>=20
>=20




