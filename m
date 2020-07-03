Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 748842136B2
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D35C31695;
	Fri,  3 Jul 2020 10:49:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D35C31695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593766219;
	bh=2TxZiKKXF+Tb6fDcz3HDp4rEXEr4PSSHIWtZpmv63pw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSHrMxIol3M+om9D+LTBl4gQmKUSSckniXnkkSQJLzzCAGSXJ2rkLkVKaUf/8LTdp
	 4Uv5MX8iCFqX/4OuYZRBqfgBOjwUBjWXxyxuyjgoOeSEyFYaXUTj6Il3vgJbn8lCCF
	 CkhvXzGPU85+iHm1RLiudWj/a2XOSmEA88LKQtOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E49F800E2;
	Fri,  3 Jul 2020 10:48:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7366F80217; Fri,  3 Jul 2020 10:48:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6CAF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6CAF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aJEAYlF8"
Received: by mail-wr1-x444.google.com with SMTP id f7so28796340wrw.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 01:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xb10fGbQEewc8w4Mpzil0TOmZbH7lO0KwQ7/eQ52SrU=;
 b=aJEAYlF8aIECZQxzcfyfyqdjftWvSSpF+csFfpJMo+/vgoLKbm9luSQlNJuA4kgtwh
 zk0HpqhMsz/+aCQ70TdIAMpqtdDSQhyg6EHVBd18s4yqb7gkYykoclDaZzVyKdEodXC8
 QmXpy+lal9YXxC12KfcEN7PFy8D+5YYdLb24I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xb10fGbQEewc8w4Mpzil0TOmZbH7lO0KwQ7/eQ52SrU=;
 b=X3iVnVX1dyU1X2ehxMZKXENBD/LcGfAAKSq7o8vPFfb9BlapsdeVvAFsRcKCflDdCD
 LnyV4uFR+88XtKSlMKDn0vmGOV4rFKxIv20nMuDQ0RZe+Numi+hKCLfgxZrknkHq06LK
 whQ+LLDnVk1YIAtxnXer5YTtHPBzYsCP7aU6DENr3yX3wBZSpGERRqSnaRIRW5ZLBMcf
 PP3S/6aOf5p2QRV1ncaJuHbRlP2njGz33uffflnIBa885AvSY6ygGbk7/tQIk2Qik0Mz
 8mbeEXCAKEVG67ku8Nhko9XgicHOUJdpXJ02oaM0XrfFSa2mkuKreNmrQNeM5G5gxAXe
 rb3w==
X-Gm-Message-State: AOAM5301kvwwfxWYPZhRNODs69z5QayukjPNTFrGZEHrnJI3/lU6deRq
 H9wWif3rAMyEflVAu/pLf4MLSVHtzFL8yEAUbr/0gA==
X-Google-Smtp-Source: ABdhPJzcWVgNiu3r40nGMGWUt3AisZNEy5A+lTnetC8tnFv/zE5OGnjdkTmf8V4AYxA5F1l8MVug9qB5V3mxK10CATU=
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr6866927wrj.14.1593766108964; 
 Fri, 03 Jul 2020 01:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
 <8d21fc0c-b43e-75a0-d5d4-ed4872ec92cb@collabora.com>
In-Reply-To: <8d21fc0c-b43e-75a0-d5d4-ed4872ec92cb@collabora.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 3 Jul 2020 16:48:18 +0800
Message-ID: <CAGvk5Pqx475MOsefchcgs=CnVJiwFJxa+-J6eHcp1VgscVkTeg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Log results when EC commands fail
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
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

Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2020=E5=B9=
=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:38=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Hi Yu-Hsuan,
>
> Thank you for your patch
>
> On 3/7/20 9:19, Yu-Hsuan Hsu wrote:
> > Log results of failed EC commands to identify a problem more easily.
> >
> > Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because the resul=
t
> > has already been checked in this function. The wrapper is not needed.
> >
>
> Nack, we did an effort to remove all public users of cros_ec_cmd_xfer() i=
n
> favour of cros_ec_cmd_xfer_status() and you are reintroducing again. You =
can do
> the same but using cros_ec_cmd_xfer_status(). In fact, your patch will no=
t build
> on top of the upcoming changes.
Thanks! But I have a question about implementing it. Does it look like
the one below?
ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
if (ret < 0) {
  if (ret =3D=3D -EPROTO)
    dev_err(..., msg->result)
  goto error;
}
I'm not sure whether it makes sense to check ret =3D=3D -EPROTO here.

>
> > Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > ---
> >  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_e=
c_codec.c
> > index 8d45c628e988e..a4ab62f59efa6 100644
> > --- a/sound/soc/codecs/cros_ec_codec.c
> > +++ b/sound/soc/codecs/cros_ec_codec.c
> > @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_ec_devi=
ce *ec_dev, uint32_t cmd,
> >       if (outsize)
> >               memcpy(msg->data, out, outsize);
> >
> > -     ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > +     ret =3D cros_ec_cmd_xfer(ec_dev, msg);
> >       if (ret < 0)
> >               goto error;
> >
> > +     if (msg->result !=3D EC_RES_SUCCESS) {
> > +             dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
> > +                     msg->result);
> > +             ret =3D -EPROTO;
> > +             goto error;
> > +     }
> > +
> >       if (insize)
> >               memcpy(in, msg->data, insize);
> >
> >
