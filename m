Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E8A2135FA
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8BF616BF;
	Fri,  3 Jul 2020 10:11:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8BF616BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593763961;
	bh=51Ljhl5WHqNRq59ZjzEAA+9oM0/o2QuW6NQ11SzDW/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ofZ3PKcT60iHpb0fzT+qAE3Bk7y6UAomr43bb8XpcEV56WyBnST6B2Ga0OE/EsTlX
	 6veoGxekQfPoVDRFBDpj3O+PErz+UZBzRJiLI2f0rxcdhsjefkn19UyGv0BngW9o98
	 J8G21t49FO2j5/zIwDqnEuXSwESY889foupIiK9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8E3BF800ED;
	Fri,  3 Jul 2020 10:11:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73B43F80217; Fri,  3 Jul 2020 10:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B70AF800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 10:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B70AF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="WHa7wIC9"
Received: by mail-wm1-x341.google.com with SMTP id 17so33073485wmo.1
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 01:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RhXU/shYl4I18iyGPVD6lf1/ryMOjlMTWXMnIVHwxHA=;
 b=WHa7wIC9Cp235EQtCgtS/QrzR/3IT8+1JlGUE/lrcD+CFI5wqQG00Vn7R1Ex3A4Nty
 jmne9LDywJ5PqLiqzZfWFdPsu9YYHVs8sjrlNxe7wFStnRgN1Zw302Qb5iMp349s4/Dn
 yOfE2e4+hRLMzix1+FPOe66atzr05M9mW9OAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RhXU/shYl4I18iyGPVD6lf1/ryMOjlMTWXMnIVHwxHA=;
 b=T5ZJPZeSbczbhJ2cD40/1X0qHF40c/sF6KSo8Pid+G8RPxjJ4IAeCIa9jxplhkt3mD
 KqMZZkZoo5Njacf6ebOsbsx4L6vWZTir6jS9d3iCTApooOZCgT2zkjDVExnZsbqNS9ep
 cP1ymhz4Cmwnq9qgDDZ25DE9psqKWIzpUY89LcA4eVkXxfZKFVp+D5Pkzgr4qbdmAmtI
 ZaOjeq0ZKqNF3X3QNl5nx4qNQ3B8qwPYdxeke+FpuU++htV/WaDtRJ879ioj2OhJ5vCF
 50G5iglMgJAjK/HsXhNDr3srrqEsfhNz6QRyWrXk3Ln9XghrMqVdVuS3ciHAm61V2AIe
 XQkg==
X-Gm-Message-State: AOAM532p3OaiLRFbRhfOOhXh+P3fKjIJA+fkz3jorvEh2X/F4zmaItna
 Egmpn265o0Yvru3hmQAi9W1Cx8jMGpQ5m+jFXK/Wlg==
X-Google-Smtp-Source: ABdhPJzsT1dmTHVeTD6QEDdeal+6mGCCF0UPc7BZQcA0v0N6TkV126o349aF96Pd3keeeXFjy3LF4hTjm8rmadmo7CU=
X-Received: by 2002:a1c:e088:: with SMTP id x130mr34133709wmg.14.1593763850259; 
 Fri, 03 Jul 2020 01:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
 <CA+Px+wVQC0vu5osOECC+x9JdsxdS8VpN+ni6y1k6YvOErsmKqA@mail.gmail.com>
In-Reply-To: <CA+Px+wVQC0vu5osOECC+x9JdsxdS8VpN+ni6y1k6YvOErsmKqA@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 3 Jul 2020 16:10:39 +0800
Message-ID: <CAGvk5PpSO5yjsvF1jq6v+EdPBvZVeEGgPJJeuixjZJ7MS-DvWg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Log results when EC commands fail
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
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

Tzung-Bi Shih <tzungbi@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=883=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 3, 2020 at 3:19 PM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote:
> > Log results of failed EC commands to identify a problem more easily.
> >
> > Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because the resul=
t
> > has already been checked in this function. The wrapper is not needed.
>
> Alternatively, you can still use cros_ec_cmd_xfer_status( ).  I guess
> it is okay to have 2 logs for an error.
>
> > diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_e=
c_codec.c
> > index 8d45c628e988e..a4ab62f59efa6 100644
> > --- a/sound/soc/codecs/cros_ec_codec.c
> > +++ b/sound/soc/codecs/cros_ec_codec.c
> > @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_ec_devi=
ce *ec_dev, uint32_t cmd,
> >         if (outsize)
> >                 memcpy(msg->data, out, outsize);
> >
> > -       ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > +       ret =3D cros_ec_cmd_xfer(ec_dev, msg);
> >         if (ret < 0)
> I am thinking of if it is a better solution to print msg->result here.
The problem is the msg->result is not always meaningful.
In cros_ec_cmd_xfer_status, we know that the msg->result is meaningful
only when ret =3D=3D 0. Therefore, we can not print the msg->result
directly here.

In addition, adding a conditional operator here to check whether ret
is -EPROTO is not a good way, either.
We should consider the situation that cros_ec_cmd_xfer may return
-EPROTO directly.

>
> >                 goto error;
> >
> > +       if (msg->result !=3D EC_RES_SUCCESS) {
> > +               dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
> > +                       msg->result);
> > +               ret =3D -EPROTO;
> > +               goto error;
> > +       }
> So that you don't need this block.
