Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0F67A78E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF2F17DB;
	Tue, 30 Jul 2019 14:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF2F17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564488271;
	bh=3p6nOq223X/J649r++RN9eI8OiNclbObgWFn/mPvsGQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MizOLKQNfW/O4LITIXLTEtEWtzdBnasT1bMfBPa/URczK/4warjrpWJj2sXsVpBl+
	 Goa1i5Dx4aZpx7ENlDpmHZCEF+u1/YMYhaJ5gWLf9ZTJnQrWBT9pOe8qn6b5LtZpCL
	 mYAUz7aNG/O7Bl+gogvul3Rz4mWsl24wqLDso+JI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F6C1F804CA;
	Tue, 30 Jul 2019 14:02:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B2C8F804CA; Tue, 30 Jul 2019 14:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16C5CF800BF
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:02:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16C5CF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DdTchBIz"
Received: by mail-wm1-x341.google.com with SMTP id f17so56382252wme.2
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 05:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tt3AOcyXKV0IKTdpiUgJmlQW7AFYrTvWnfWkl3EFYV0=;
 b=DdTchBIzR49p1do0ixk4FGygfA12+2grKmIoZ2yLj1ahaobmMEjFjuAVbAzJ75eEBJ
 W0BU0ufoQrtTv95Df+kramh8NuyZqPKkDG8Ehv8zjjnYMANetIi52daq984sEQdAhrj0
 TeMD6LnqG1kwFsfgJPUqO+yjQRoqPyHxArn6LwcuXc6/ZyAHtMZn7797XwY1BfBQxgkf
 xrqjR+q0LA/3J+aecFu4pB6tyFiAyF2CBbPbU5SeBkV/2fDw/DUgBp9YCS4f+gRQkvKI
 gygk4s9xcDwm4ueMdql/4ATbDD/OjKgwVQbUaJ44IVTu5nlv5GHfU4EEIe03lwhoDIhp
 O4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tt3AOcyXKV0IKTdpiUgJmlQW7AFYrTvWnfWkl3EFYV0=;
 b=DUik2uqDhW2wL1gjAb1zl7y6NjVSHLK1edVfKhAolmEQYK6XPBlWVii6rqAL1FMT6I
 Pk8ACxjM37fLp7daBniZdqVyldT64f8nVzPH0FWEPhGBGG2c9B3TSLA3n8ek6Ef+Oezq
 rSC3tT1uERPkL2Vdy4mrq03xX+gSOOCnfwPizxZYnMByHZ7GlJp5uK1u/AT+mZEQIOta
 gFsNMQdHc+07d2fhSXNKiVimE+UdGsLWOqe9ArVTX0TOCdAgSKmS1s/PLD30dYDLbxq/
 R0GnwhfehN4lCcZNtsbOKsJRyL4n12xoyZJL7oXXxpFCHPf1v5Z2mlUqtJPj0gXFgX+N
 e69Q==
X-Gm-Message-State: APjAAAXUzLQpVwbnIXCzek/amL75jbuCqlIOHGUnDBdsulSeTkIUFeEX
 VXdDp4orxQxCSRtAbBiwan6+km1DSsnido6R73E=
X-Google-Smtp-Source: APXvYqwghX6WkVGHF+i6a+U4+65mHT4/Hpn8Bch0SCYfGIaMV4TncRfMk7olObeb7KKke5CJSErAP7e2stA6hFGyGps=
X-Received: by 2002:a7b:c247:: with SMTP id b7mr109385481wmj.13.1564488162043; 
 Tue, 30 Jul 2019 05:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-8-daniel.baluta@nxp.com>
 <20190730080135.GB5892@Asurada>
In-Reply-To: <20190730080135.GB5892@Asurada>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 30 Jul 2019 15:02:30 +0300
Message-ID: <CAEnQRZAUOzmP2yPb4utyDTnYUDNyqesXJPb5-Ms0tfPy8TMBig@mail.gmail.com>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Viorel Suman <viorel.suman@nxp.com>,
 Timur Tabi <timur@kernel.org>, Rob Herring <robh@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mihai Serban <mihai.serban@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 7/7] ASoC: dt-bindings: Introduce
 compatible strings for 7ULP and 8MQ
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jul 30, 2019 at 11:02 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Jul 28, 2019 at 10:24:29PM +0300, Daniel Baluta wrote:
> > For i.MX7ULP and i.MX8MQ register map is changed. Add two new compatbile
> > strings to differentiate this.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index 2b38036a4883..b008e9cfedc1 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -8,7 +8,8 @@ codec/DSP interfaces.
> >  Required properties:
> >
> >    - compatible               : Compatible list, contains "fsl,vf610-sai",
> > -                       "fsl,imx6sx-sai" or "fsl,imx6ul-sai"
> > +                       "fsl,imx6sx-sai", "fsl,imx6ul-sai",
> > +                       "fsl,imx7ulp-sai", "fsl,imx8mq-sai".
>
> A nit, could have that 'or' :)

I removed the 'or' on purpose because I don't want to move it
around each time we add a new compatible.

Anyhow, I can put it back if this is the convention.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
