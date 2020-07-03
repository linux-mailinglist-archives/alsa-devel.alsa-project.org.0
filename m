Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6322137D7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 11:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89C9116D1;
	Fri,  3 Jul 2020 11:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89C9116D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593769363;
	bh=+uT4/ugJepuzJfRXEfUbL9ym4yqXL84mVyZkxqlatWQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGWCyHS0DcBMng8mrWyjdKjLIzeAw7PYaD8g9yrU9WpkIt7Y2ua5R6y4MWWlUTcIp
	 9i7W83yQwmW8vyP2VUv46YsgfggjkOrwm3onSr+FT7MbCDz44jyYvtYu4ZKlp+cN1N
	 vIUvGGrBJztuGHQuqIv+WKRXne42+hSHKC8oQ3Gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6C07F800E2;
	Fri,  3 Jul 2020 11:41:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF59F80217; Fri,  3 Jul 2020 11:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E57BF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 11:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E57BF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aCP0cShj"
Received: by mail-wm1-x344.google.com with SMTP id o2so33417307wmh.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DdinKhU6Vgfi2yzkEzkWpZ1cEblZoAeY2Qj+FjvvzvE=;
 b=aCP0cShjbrykQvr0g1Vb+DEj00lwAxg0T78dsiIDjyKDfQDVu3sax35VsD+5BopxBx
 Xk1fdV5P6jRSIY3aeIF3Auv39STfQHSfFib4ytai0iieU4CPbdF4Idi+KfDPU565e6/t
 JK60Gs6fQ2v3r7hZrbrjVy3+FWxGjTx1n1jQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DdinKhU6Vgfi2yzkEzkWpZ1cEblZoAeY2Qj+FjvvzvE=;
 b=m4RRI1Vhom5yARo3/IBPaTN7UtPSG0DwO5RUpbPE1LjPmU1kOpU9BD1Z6YjSI49sfz
 wgLEs74NZDXSu+WHroybzjq5DF+u2IBHzWs/LqXVOxpnqLkCGV30u5igg1a1PiAtNTM7
 ItbsH5NQUzbH8+Q4kUg50ovPPlCcW5uGHAbJ4xggRCSy6QsjJURbX5cTPhENk4eTHcjG
 ozioa+vrgyKyuGzny6fez+pjKUzmOQGWyGB4A8RutA4gvjO4kaB35wWOaerEWaH/pJ2p
 03q4PTTdiehHEFAJ6yPuNCpibNXNQ0oEU+OZmY2ccrBYXErfBoC5Hok1rKLEFgyAm0UB
 4WHA==
X-Gm-Message-State: AOAM531b4cNlVTU6DfTxkl0L0eQ8+mrERAlyEnMs3rn21XTYjTnB5ZPz
 skRVWKxLkbgsZjNGAEJYXLjBo8/X+AwLDA55n3083hRe04g=
X-Google-Smtp-Source: ABdhPJyK3bZA5YHuYaknx92LE0w8p979gJTs+4780PHItenqBWsn4/F2bJXGGYP51jn4Y3LxXJfRoekc1uTcz5f/J10=
X-Received: by 2002:a1c:bb43:: with SMTP id l64mr36903087wmf.151.1593769253122; 
 Fri, 03 Jul 2020 02:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
 <8d21fc0c-b43e-75a0-d5d4-ed4872ec92cb@collabora.com>
 <CAGvk5Pqx475MOsefchcgs=CnVJiwFJxa+-J6eHcp1VgscVkTeg@mail.gmail.com>
 <cea2bc7e-035b-2c97-73bf-25dc55ab8801@collabora.com>
In-Reply-To: <cea2bc7e-035b-2c97-73bf-25dc55ab8801@collabora.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 3 Jul 2020 17:40:42 +0800
Message-ID: <CAGvk5PoiWDchYCsaR_tqQ5mE0XA_hBXHy-hS5o3vFtuPzm_JiA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Log results when EC commands fail
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@chromium.org>,
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

Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2020=E5=B9=
=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:19=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> Hi Yu-Hsuan,
>
> On 3/7/20 10:48, Yu-Hsuan Hsu wrote:
> > Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2020=E5=
=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:38=E5=AF=
=AB=E9=81=93=EF=BC=9A
> >>
> >> Hi Yu-Hsuan,
> >>
> >> Thank you for your patch
> >>
> >> On 3/7/20 9:19, Yu-Hsuan Hsu wrote:
> >>> Log results of failed EC commands to identify a problem more easily.
> >>>
> >>> Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because the res=
ult
> >>> has already been checked in this function. The wrapper is not needed.
> >>>
> >>
> >> Nack, we did an effort to remove all public users of cros_ec_cmd_xfer(=
) in
> >> favour of cros_ec_cmd_xfer_status() and you are reintroducing again. Y=
ou can do
> >> the same but using cros_ec_cmd_xfer_status(). In fact, your patch will=
 not build
> >> on top of the upcoming changes.
> > Thanks! But I have a question about implementing it. Does it look like
> > the one below?
> > ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > if (ret < 0) {
>
> In this case will already print an error.
>
> What are you trying to achieve?
>
> If the only reason is of this patch is print a message you should either,=
 or
> enable dynamic printk and enable dev_dbg or event better use the kernel t=
race
> functionality. There is no need to be more verbose.
>
> Example:
>     $ echo 1 > /sys/kernel/debug/tracing/events/cros_ec/enable
>     $ cat /sys/kernel/debug/tracing/trace
>
>     369.416372: cros_ec_request_start: version: 0, command: EC_CMD_USB_PD=
_POWER_INFO
>     369.420528: cros_ec_request_done: version: 0, command:
> EC_CMD_USB_PD_POWER_INFO, ec result: EC_RES_SUCCESS, retval: 16
>
> Cheers,
>  Enric
>
Thank Enric,

The situation is that some users encountered errors on ChromeBook.
From their feedback reports, we only get the message like
'cros-ec-codec GOOG0013:00: ASoC: Failed to set DAI format: -71'.
We know that -71 is -EPROTO but it is not clear enough for us to find
out the root cause. That's why we want the detail of the result.
Because the situation happens on users' side, it is not possible for
them to enable kernel trace (ChromeOS does not allow users to touch
kernel).

The other way we thought is changing dev_dbg to dev_err in
cros_ec_cmd_xfer_status. But we are not sure whether it is also an
error for other usages.

> >   if (ret =3D=3D -EPROTO)
> >     dev_err(..., msg->result)
> >   goto error;
> > }
> > I'm not sure whether it makes sense to check ret =3D=3D -EPROTO here.
> >
> >>
> >>> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> >>> ---
> >>>  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
> >>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros=
_ec_codec.c
> >>> index 8d45c628e988e..a4ab62f59efa6 100644
> >>> --- a/sound/soc/codecs/cros_ec_codec.c
> >>> +++ b/sound/soc/codecs/cros_ec_codec.c
> >>> @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_ec_de=
vice *ec_dev, uint32_t cmd,
> >>>       if (outsize)
> >>>               memcpy(msg->data, out, outsize);
> >>>
> >>> -     ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> >>> +     ret =3D cros_ec_cmd_xfer(ec_dev, msg);
> >>>       if (ret < 0)
> >>>               goto error;
> >>>
> >>> +     if (msg->result !=3D EC_RES_SUCCESS) {
> >>> +             dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
> >>> +                     msg->result);
> >>> +             ret =3D -EPROTO;
> >>> +             goto error;
> >>> +     }
> >>> +
> >>>       if (insize)
> >>>               memcpy(in, msg->data, insize);
> >>>
> >>>
