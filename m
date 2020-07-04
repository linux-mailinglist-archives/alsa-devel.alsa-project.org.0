Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E563214557
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847B916AC;
	Sat,  4 Jul 2020 13:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847B916AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593862602;
	bh=LjHTVXlp258tsuPQjY0q9I4BJgETce4ao/7TpKyacfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QrZsQ0+uhE8AtBGjVS+76iwHlNAakG7m811sUUVXI5nBRJj/kS3iDdpzYGpRIRKLG
	 T9Kw/Us4LnXJ+mJAOzZOc1pfLm3VORyI2sVj7BKi74gCXj+pgB+VOVNFKUbsS25G3z
	 +dkdlgmVhIiwxNyI9lpE6L99Hv3c1mihMKzWDvNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7AAF8011B;
	Sat,  4 Jul 2020 13:35:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C103F8022D; Sat,  4 Jul 2020 13:34:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_135,PRX_BODY_29,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B83EF8011B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B83EF8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VYPSW47K"
Received: by mail-wm1-x344.google.com with SMTP id g75so34343254wme.5
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZhZK32moMwNKC3Zi3SUMtlpuiUvUgXFLuf1hMzSDJJo=;
 b=VYPSW47KW7mN/gi3095AnWTz/O4bIs9XY1WHoJfN9kHp1hvFuKHxtQutSr/Uf842gF
 gb/fHu1JgOyoafTpuSJSh3kV5LyFcBwLLX9h5yEs6221ky3oVcqy4oBmxrpy/dPbw8EY
 e+57TMDgoga8PPraCj9hQMzA2IVqyLb1ui+co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZhZK32moMwNKC3Zi3SUMtlpuiUvUgXFLuf1hMzSDJJo=;
 b=PwBZzF+Gl81A2stljO1xr/7/BOJoSdAP5gfTkDhgXg2b+8t6Rg0q7MzOtRtUz1r7A8
 tyUzjRgKDC5kJ2o4xDArDQ/hB6G1Nc7DJdeo1PUJGGcZxV4LfvsnoxKeItpYKYnD2rJy
 gxNhoYXjU71wrOSPr277Er65M5FkFpLphdGc+uMQlEapPBXWCUDTqEmDJg1ZuK/b/hAg
 RcfXV8/b+EjspPDl/WjZoyT+vDVSvbPquP5Z2CwCFc5a/rXfz0DqaNWbYkxaExr1uPHZ
 GJbAhRdEzoR3Hl1hwJqE4q4dL1EU7y4gVpPXXjU93MpdjqoLM8FyOg4MjMI7VqGfFszl
 SSKA==
X-Gm-Message-State: AOAM530AB/pBhr1N0p1BNPl0i3uKGLO/+wrJJk98/93HRnBhJ8Cfs49x
 VXv7PeseFXkISEAPY3Jla9+/6+hUr2/v49BNoOSlRw==
X-Google-Smtp-Source: ABdhPJwYx8vitLOJRot4DkoWUXEeX2/iSZOylj7pbyMaJtgtnxXR4z9c1TdXevNToMHrYi25FgTMNtpCiHYcQw1wbs4=
X-Received: by 2002:a1c:6788:: with SMTP id
 b130mr42087381wmc.100.1593862489252; 
 Sat, 04 Jul 2020 04:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
 <8d21fc0c-b43e-75a0-d5d4-ed4872ec92cb@collabora.com>
 <CAGvk5Pqx475MOsefchcgs=CnVJiwFJxa+-J6eHcp1VgscVkTeg@mail.gmail.com>
 <cea2bc7e-035b-2c97-73bf-25dc55ab8801@collabora.com>
 <CAGvk5PoiWDchYCsaR_tqQ5mE0XA_hBXHy-hS5o3vFtuPzm_JiA@mail.gmail.com>
 <d5634533-3cf3-b52a-ff24-2bda3230927d@collabora.com>
 <CABXOdTcP0DagxzUrBh5H_TXzSAZjMAG4UaV++0sW99W4ypC78w@mail.gmail.com>
 <CAGvk5PpKTHGgp5v3FLGARE7EX7F7nZUJucnpcncbf4epDfZ7jw@mail.gmail.com>
 <CABXOdTemH2sknDJYmUyazk38+nK2ny+OiD8BaqcS=_t7STEEWg@mail.gmail.com>
In-Reply-To: <CABXOdTemH2sknDJYmUyazk38+nK2ny+OiD8BaqcS=_t7STEEWg@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sat, 4 Jul 2020 19:34:37 +0800
Message-ID: <CAGvk5PrV2u==ZH38mX1DAUpa8YRiDmCazkxNr1qhFmOaiw2duQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Log results when EC commands fail
To: Guenter Roeck <groeck@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
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

Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=884=E6=97=
=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 3, 2020 at 12:11 PM Yu-Hsuan Hsu <yuhsuan@chromium.org> wrote=
:
> >
> > Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=883=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:58=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > On Fri, Jul 3, 2020 at 3:56 AM Enric Balletbo i Serra
> > > <enric.balletbo@collabora.com> wrote:
> > > >
> > > > Hi Yu-Hsuan,
> > > >
> > > > On 3/7/20 11:40, Yu-Hsuan Hsu wrote:
> > > > > Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2=
020=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:19=
=E5=AF=AB=E9=81=93=EF=BC=9A
> > > > >>
> > > > >> Hi Yu-Hsuan,
> > > > >>
> > > > >> On 3/7/20 10:48, Yu-Hsuan Hsu wrote:
> > > > >>> Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC=
 2020=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:3=
8=E5=AF=AB=E9=81=93=EF=BC=9A
> > > > >>>>
> > > > >>>> Hi Yu-Hsuan,
> > > > >>>>
> > > > >>>> Thank you for your patch
> > > > >>>>
> > > > >>>> On 3/7/20 9:19, Yu-Hsuan Hsu wrote:
> > > > >>>>> Log results of failed EC commands to identify a problem more =
easily.
> > > > >>>>>
> > > > >>>>> Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because=
 the result
> > > > >>>>> has already been checked in this function. The wrapper is not=
 needed.
> > > > >>>>>
> > > > >>>>
> > > > >>>> Nack, we did an effort to remove all public users of cros_ec_c=
md_xfer() in
> > > > >>>> favour of cros_ec_cmd_xfer_status() and you are reintroducing =
again. You can do
> > > > >>>> the same but using cros_ec_cmd_xfer_status(). In fact, your pa=
tch will not build
> > > > >>>> on top of the upcoming changes.
> > > > >>> Thanks! But I have a question about implementing it. Does it lo=
ok like
> > > > >>> the one below?
> > > > >>> ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > > > >>> if (ret < 0) {
> > > > >>
> > > > >> In this case will already print an error.
> > > > >>
> > > > >> What are you trying to achieve?
> > > > >>
> > > > >> If the only reason is of this patch is print a message you shoul=
d either, or
> > > > >> enable dynamic printk and enable dev_dbg or event better use the=
 kernel trace
> > > > >> functionality. There is no need to be more verbose.
> > > > >>
> > > > >> Example:
> > > > >>     $ echo 1 > /sys/kernel/debug/tracing/events/cros_ec/enable
> > > > >>     $ cat /sys/kernel/debug/tracing/trace
> > > > >>
> > > > >>     369.416372: cros_ec_request_start: version: 0, command: EC_C=
MD_USB_PD_POWER_INFO
> > > > >>     369.420528: cros_ec_request_done: version: 0, command:
> > > > >> EC_CMD_USB_PD_POWER_INFO, ec result: EC_RES_SUCCESS, retval: 16
> > > > >>
> > > > >> Cheers,
> > > > >>  Enric
> > > > >>
> > > > > Thank Enric,
> > > > >
> > > > > The situation is that some users encountered errors on ChromeBook=
.
> > > >
> > > > And, aren't you able to reproduce the issue?
> > > >
> > > >
> > > > > From their feedback reports, we only get the message like
> > > > > 'cros-ec-codec GOOG0013:00: ASoC: Failed to set DAI format: -71'.
> > > > > We know that -71 is -EPROTO but it is not clear enough for us to =
find
> > > > > out the root cause. That's why we want the detail of the result.
> > > >
> > > >
> > > > If I am not mistaken this ends calling i2s_rx_set_daifmt() into the=
 EC firmware,
> > > > if the result is -EPROTO that means is not returning EC_RES_SUCCESS=
, so there
> > > > are few options:
> > > >
> > > >         if (i2s_rx_enabled)
> > > >                 return EC_RES_BUSY;
> > > >
> > > >         if (daifmt >=3D EC_CODEC_I2S_RX_DAIFMT_COUNT)
> > > >                 return EC_RES_INVALID_PARAM;
> > > >
> > > >         if (audio_codec_i2s_rx_set_daifmt(daifmt) !=3D EC_SUCCESS)
> > > >                 return EC_RES_ERROR;
> > > >
> > > > > Because the situation happens on users' side, it is not possible =
for
> > > > > them to enable kernel trace (ChromeOS does not allow users to tou=
ch
> > > > > kernel).
> > > > >
> > > >
> > > > Are you sure that when you know the error code you'll find the root=
 cause
> > > > (without adding more prints)? There is only three possibilities? Yo=
u can't start
> > > > adding prints just to debug a user issue because you don't allow to=
 be more
> > > > verbose. I understand that might help you but is not the way to go.
> >
> > Hi Enric and Guenter,
> >
> > Thanks for your inspiring comments.
> > I'm not sure whether we will find the root cause if I know the error
> > code. But I think it's not a point.
> > We wanted to add this error log because we found that the current one
> > is not enough. Since it is a real error, it would be better if we can
> > make it more detailed, right?
> > In addition, we thought it would be helpful in the future as well.
> > That's why we chose to upstream instead of merging into our source
> > tree only.
> >
>
> Kernel log messages are almost never useful for actual users. In most
> cases, they just clog up the kernel log, making it useless for when it
> actually counts (such as when the system crashes). On top of that,
> there already is an error message, only the error code doesn't mean
> much because it is "universalized". I don't see how adding another
> error message would improve that, even more so if that error message
> is only added in one place. On the other side, converting EC error
> codes to Linux kernel error codes would help every caller of
> cros_ec_cmd_xfer_status without adding more logging noise.

Thanks for the explanation. If I understand correctly, the mean point
is this log is noisy.
In this case, the log will only appear one time during the card
probing(if it fails). But I do agree that it may create some potential
noises.
Converting EC error codes to Linux kernel error codes also work for
me. Is it possible for you to send the corresponding patch? If not, I
can try to work on it.
In addition, is it possible that one error code can come from linux or from=
 EC?

>
> > > >
> > > > You should really reproduce the issue yourself an use actual debug
> > > > tools/prints./traces
> > We are trying but still unable to reproduce this issue.
> > However, as I maintained above, it is not a main concern of this change=
.
> > > >
> > >
> > > Another possibility would be to change cros_ec_cmd_xfer_status() to
> > > return a more granular error code, such as -EINVAL for
> > > EC_RES_INVALID_PARAM, -EBUSY for EC_RES_BUSY, -EINPROGRESS for
> > > EC_RES_IN_PROGRESS,  -ETIMEDOUT for EC_RES_TIMEOUT, -EOVERFLOW for
> > > EC_RES_OVERFLOW, -ENODATA for EC_RES_UNAVAILABLE, and so on.
> > Since there are many kinds of results from EC, why not just make users
> > able to check on their own?
> > For example, users can wait and try again if the result is EC_RES_BUSY.
> >
>
> That is exactly what -EBUSY is for: It lets the user space application
> decide what to do about it. A kernel log message can not and will
> never achieve that.
>
> > >
> > > However, it appears that the various low level functions already
> > > replace various EC error codes with a blank EC_RES_ERROR. No amount o=
f
> > > logging will tell us what exactly went wrong in those functions. Luck=
y
> > > for us, audio_codec_i2s_rx_set_daifmt() only ever returns EC_SUCCESS,
> > > so we know that the problem is either that i2s_rx_enabled is true or
> > > that daifmt is too large. None of those really warrants more verbose
> > > logging.
> > >
> > > From the context, my personal bet is that i2s_rx_enabled is true: I
> > > don't immediately see how disabling it is enforced before trying to
> > > set the DAI format, and I don't see how "daifmt >=3D
> > > EC_CODEC_I2S_RX_DAIFMT_COUNT" can ever be true.
> > I totally agree. According to the source, it seems that both path are
>
> You are effectively saying that there is code to ensure that
> i2s_rx_enabled is false. Granted, the code is too complex to easily
> understand, and I may not have seen that flow. Per the same logic,
> though, it might well be possible that _because_ the code is not easy
> to understand there may well be a data path where i2s_rx_enabled is
> set. One would need to ensure that the sequence of <disable rx> - <set
> dai format> - <re-enable rx> is guaranteed, and that it is always
> executed under a kernel lock. Maybe you can point me to that code, for
> my education.
>
> On the other side, it is much easier to verify that "daifmt >=3D
> EC_CODEC_I2S_RX_DAIFMT_COUNT" is never true.
>
> Thanks,
> Guenter
The complete errors are:
ERR kernel: [    8.568171]  cros-ec-codec GOOG0013:00: ASoC: error at
snd_soc_dai_set_fmt on GOOG0013:00: -71
WARNING kernel: [    8.583312] cros-ec-codec GOOG0013:00: ASoC: Failed
to set DAI format: -71
ERR kernel: [    8.629388] acp3x-alc5682-max98357 AMDI5682:00:
devm_snd_soc_register_card(acp3xalc5682m98357) failed: -71
WARNING kernel: [    8.645306] acp3x-alc5682-max98357: probe of
AMDI5682:00 failed with error -71

This issue happened when probing the card while the i2s_rx is only
enabled when the device is used. Therefore, the i2s_rx should not be
enabled before the card is probed. However, I may miss something. I
will check the entire path later.
For "daifmt >=3D EC_CODEC_I2S_RX_DAIFMT_COUNT", it is obviously not to
be true by looking into i2s_rx_set_fmt function.

Thanks,
Yu-Hsuan

>
> > impossible. I'm not really understand the whole path but is it
> > possible for EC to return other results? I will do more tests and look
> > carefully into the source. Really thanks for your suggestions.
> >
> > Cheers,
> > Yu-Hsuan
> > >
> > > Guenter
> > >
> > >
> > > Guenter
> > >
> > > > Cheers,
> > > >  Enric
> > > >
> > > > > The other way we thought is changing dev_dbg to dev_err in
> > > > > cros_ec_cmd_xfer_status. But we are not sure whether it is also a=
n
> > > > > error for other usages.
> > > > >
> > > > >>>   if (ret =3D=3D -EPROTO)
> > > > >>>     dev_err(..., msg->result)
> > > > >>>   goto error;
> > > > >>> }
> > > > >>> I'm not sure whether it makes sense to check ret =3D=3D -EPROTO=
 here.
> > > > >>>
> > > > >>>>
> > > > >>>>> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > > > >>>>> ---
> > > > >>>>>  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
> > > > >>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> > > > >>>>>
> > > > >>>>> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/cod=
ecs/cros_ec_codec.c
> > > > >>>>> index 8d45c628e988e..a4ab62f59efa6 100644
> > > > >>>>> --- a/sound/soc/codecs/cros_ec_codec.c
> > > > >>>>> +++ b/sound/soc/codecs/cros_ec_codec.c
> > > > >>>>> @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cr=
os_ec_device *ec_dev, uint32_t cmd,
> > > > >>>>>       if (outsize)
> > > > >>>>>               memcpy(msg->data, out, outsize);
> > > > >>>>>
> > > > >>>>> -     ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > > > >>>>> +     ret =3D cros_ec_cmd_xfer(ec_dev, msg);
> > > > >>>>>       if (ret < 0)
> > > > >>>>>               goto error;
> > > > >>>>>
> > > > >>>>> +     if (msg->result !=3D EC_RES_SUCCESS) {
> > > > >>>>> +             dev_err(ec_dev->dev, "Command %d failed: %d\n",=
 cmd,
> > > > >>>>> +                     msg->result);
> > > > >>>>> +             ret =3D -EPROTO;
> > > > >>>>> +             goto error;
> > > > >>>>> +     }
> > > > >>>>> +
> > > > >>>>>       if (insize)
> > > > >>>>>               memcpy(in, msg->data, insize);
> > > > >>>>>
> > > > >>>>>
