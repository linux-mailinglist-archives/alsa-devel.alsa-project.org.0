Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6932BB0B5
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C0FB17FD;
	Fri, 20 Nov 2020 17:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C0FB17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605890316;
	bh=FP5RA1gLDtTuJogOhwdjudEg+bmSs2UKeSCRh36mqZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VqXh8oZwogEpScpSgKgVxD6M8hJSr9kJ1jbUubeICbWr55plefCecG6v8lpXAI9Fm
	 znTH2/S8mXnoC/kyLHck7bESK9kyqf3guqkWL/9HEuVhuCZs6e+VXd3Liuk1ILcSNO
	 cytT9QedokjgKRhLaePnfSfph1PvQIMWbsqSbTHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4394F80166;
	Fri, 20 Nov 2020 17:37:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA1FF8016C; Fri, 20 Nov 2020 17:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBFB9F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBFB9F80166
Received: by mail-ej1-f67.google.com with SMTP id oq3so13718712ejb.7
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 08:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S1+8z3yNNlDYJv6/l1QyHGY+01X4guwfwj1g0QgjnEc=;
 b=rvFGQZrN5J9u6cbEzNMjfqyqI5+xFLD9bi8WbAP4Q257dCQUSbczxsMTT1iTylJziW
 2+5rbfCCpwTTlujD5R5QhCo1QqLQXYi4T6zdAmQzFUSaeHaXDVgx6AfuEMX32NxXXh/n
 1TKQtdnZ+xX66Sm9E7l1iwwx1dWX2NEwIx5OMA9ciWSb7DsTRpBUGuhuydlfOglZO1KP
 agBqmIHj/YxhpAlfRAvnrywesIaZZeRR2ZJigpls3N0LRY1cl/r+ttRt3w85OV7Sv0o3
 pTOUnE/ZBCNDYR09CWTcOBdm6OPquoOl/rKyEHBolGAj6aLIelm2wg+8fBKKYULfJmn+
 lWZw==
X-Gm-Message-State: AOAM532VaZdAstiWcNYdS+pwRVXoLDwdl7yaj5ELhs2QOOR7grovgFFJ
 JwKilfrvrJWmfwR5pJfxf6w=
X-Google-Smtp-Source: ABdhPJxqdMGoZzc6qF5UhhTkPZlu8GkMGDOe+DAxPYzUUAb8Icw7z+1lPxeUche0n6jibG3V8kdEzg==
X-Received: by 2002:a17:906:71d3:: with SMTP id
 i19mr6287685ejk.187.1605890218153; 
 Fri, 20 Nov 2020 08:36:58 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id p20sm1318352ejd.78.2020.11.20.08.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 08:36:57 -0800 (PST)
Date: Fri, 20 Nov 2020 17:36:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 29/38] ASoC: tas2562: skip of_device_id table when
 !CONFIG_OF
Message-ID: <20201120163655.GA519670@kozik-lap>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120161653.445521-29-krzk@kernel.org>
 <cacd0acf-708d-0b56-8229-b76690b2d289@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cacd0acf-708d-0b56-8229-b76690b2d289@ti.com>
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Jonghwan Choi <charlie.jh@kakaocorp.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

On Fri, Nov 20, 2020 at 10:21:56AM -0600, Dan Murphy wrote:
> Hello
>=20
> On 11/20/20 10:16 AM, Krzysztof Kozlowski wrote:
> > The driver can match by multiple methods.  Its of_device_id table is
> > referenced via of_match_ptr() so it will be unused for !CONFIG_OF
> > builds:
> >=20
> >    sound/soc/codecs/tas2562.c:805:34: warning: =E2=80=98tas2562_of_matc=
h=E2=80=99 defined but not used [-Wunused-const-variable=3D]
> >=20
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >   sound/soc/codecs/tas2562.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >=20
> > diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
> > index f1ff204e3ad0..19965fabe949 100644
> > --- a/sound/soc/codecs/tas2562.c
> > +++ b/sound/soc/codecs/tas2562.c
> > @@ -802,6 +802,7 @@ static const struct i2c_device_id tas2562_id[] =3D {
> >   };
> >   MODULE_DEVICE_TABLE(i2c, tas2562_id);
> > +#ifdef CONFIG_OF
>=20
> Should we use #if IS_ENABLED(CONFIG_OF) ?

I think it does not matter:
1. OF is only bool,
2. This is the existing pattern in many driver (for OF and ACPI),
   see also: Documentation/firmware-guide/acpi/enumeration.rst
3. ifdef should be faster for preprocessor (less macros to unwind),

It would matter if OF became a module option. In such case anyway a lot
of existing ifdef CONFIG_OF would have to be corrected.

Best regards,
Krzysztof
