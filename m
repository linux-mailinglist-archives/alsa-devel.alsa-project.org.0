Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 919CD213FC9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 21:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8EED16C0;
	Fri,  3 Jul 2020 21:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8EED16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593803596;
	bh=/PANOEygWsjGuGKQAV1AV0cJbYsmCO8lRNcAF32SHsw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZ7Q/FIMlxatz/RUN9jOw4q2jdGrXs+LbfZpxlx4toROnDuruqxiZv4XGsmlXZuYD
	 taLlNS+JiFEbMZAidAQX033E7vWPSPNfanR1a2VYVf+5HP9iBuQotd3ikRmubY4yZ+
	 z0+6vDtIFyq5Rjxf3LQFab+uN2hml7s79E4fiv3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB7CF8021D;
	Fri,  3 Jul 2020 21:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F4EF80217; Fri,  3 Jul 2020 21:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_135,PRX_BODY_29,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EB65F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 21:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB65F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EbSrIYsG"
Received: by mail-wr1-x444.google.com with SMTP id a6so33791634wrm.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 12:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pCP+1HZxn+tsKMBNz33uyfOsq4XBUKWSgs+6uGDsAcU=;
 b=EbSrIYsGTORFUAvtQkgz3HYhwMLbSYoO+gjQcJgEq0xURy+FUajjikfhcFJQB6CKGI
 WZdlZtphq4me8695bU+S1g46OxHEALrMI9mw9hBoBc38RChyIlAxBBK2kO6ZKcDPofS2
 bcUbnR54GPmrzjS6d+zZu/1pPnyJGAP2t8J6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pCP+1HZxn+tsKMBNz33uyfOsq4XBUKWSgs+6uGDsAcU=;
 b=tirK/7D5DVkeLltwUfcXmUjI95psodcvVBGXJ3E3ADWHucn0Oj3kTMuGmPeMLrhnLG
 72iKUlsgnTHg8MwdXA9QYewBLX3GPyYfjAmU0BiERoaAzWqDELs7ye4YAQS7rtzggwDk
 OhYEm+Sag/NjDQ4IEQ/rDsz0IU2DAUgmFwsszhtkLdZ2hiBMBxD7MyaqxhBSCH87VzzY
 M76pIOoXuFWADwD2NYxjWXGjH92Kyy+uY/qN0795b8aebyaODwlqhTu0fUwfseehRY3q
 HmhqHBtV1N+SNJv9RX/jrX0c6mIPaqktPFByknJw18y8Uj+qGXuzotJbCNFo4eJMg4lq
 mXTQ==
X-Gm-Message-State: AOAM532Z2mnTH24DKHnrX5A/pNK/MLivSs8G0KeBv+eeJWzMX0Fag+mA
 h8L8iwvaCvc8KKJj+ONC1VrrtYtzBt+4DBFmEoieTQ==
X-Google-Smtp-Source: ABdhPJyrT/LgK6PdaSFibq6fztGk0jI82mt3ucxNiVLRwpNcfMYf+pQXqhRWLU87NjMJgEIAvIYTae7G7aQA50ai3Ww=
X-Received: by 2002:adf:cf0a:: with SMTP id o10mr9313725wrj.14.1593803485389; 
 Fri, 03 Jul 2020 12:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
 <8d21fc0c-b43e-75a0-d5d4-ed4872ec92cb@collabora.com>
 <CAGvk5Pqx475MOsefchcgs=CnVJiwFJxa+-J6eHcp1VgscVkTeg@mail.gmail.com>
 <cea2bc7e-035b-2c97-73bf-25dc55ab8801@collabora.com>
 <CAGvk5PoiWDchYCsaR_tqQ5mE0XA_hBXHy-hS5o3vFtuPzm_JiA@mail.gmail.com>
 <d5634533-3cf3-b52a-ff24-2bda3230927d@collabora.com>
 <CABXOdTcP0DagxzUrBh5H_TXzSAZjMAG4UaV++0sW99W4ypC78w@mail.gmail.com>
In-Reply-To: <CABXOdTcP0DagxzUrBh5H_TXzSAZjMAG4UaV++0sW99W4ypC78w@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Sat, 4 Jul 2020 03:11:14 +0800
Message-ID: <CAGvk5PpKTHGgp5v3FLGARE7EX7F7nZUJucnpcncbf4epDfZ7jw@mail.gmail.com>
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

Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=883=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Jul 3, 2020 at 3:56 AM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
> >
> > Hi Yu-Hsuan,
> >
> > On 3/7/20 11:40, Yu-Hsuan Hsu wrote:
> > > Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2020=
=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:19=E5=
=AF=AB=E9=81=93=EF=BC=9A
> > >>
> > >> Hi Yu-Hsuan,
> > >>
> > >> On 3/7/20 10:48, Yu-Hsuan Hsu wrote:
> > >>> Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 202=
0=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:38=E5=
=AF=AB=E9=81=93=EF=BC=9A
> > >>>>
> > >>>> Hi Yu-Hsuan,
> > >>>>
> > >>>> Thank you for your patch
> > >>>>
> > >>>> On 3/7/20 9:19, Yu-Hsuan Hsu wrote:
> > >>>>> Log results of failed EC commands to identify a problem more easi=
ly.
> > >>>>>
> > >>>>> Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because the=
 result
> > >>>>> has already been checked in this function. The wrapper is not nee=
ded.
> > >>>>>
> > >>>>
> > >>>> Nack, we did an effort to remove all public users of cros_ec_cmd_x=
fer() in
> > >>>> favour of cros_ec_cmd_xfer_status() and you are reintroducing agai=
n. You can do
> > >>>> the same but using cros_ec_cmd_xfer_status(). In fact, your patch =
will not build
> > >>>> on top of the upcoming changes.
> > >>> Thanks! But I have a question about implementing it. Does it look l=
ike
> > >>> the one below?
> > >>> ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > >>> if (ret < 0) {
> > >>
> > >> In this case will already print an error.
> > >>
> > >> What are you trying to achieve?
> > >>
> > >> If the only reason is of this patch is print a message you should ei=
ther, or
> > >> enable dynamic printk and enable dev_dbg or event better use the ker=
nel trace
> > >> functionality. There is no need to be more verbose.
> > >>
> > >> Example:
> > >>     $ echo 1 > /sys/kernel/debug/tracing/events/cros_ec/enable
> > >>     $ cat /sys/kernel/debug/tracing/trace
> > >>
> > >>     369.416372: cros_ec_request_start: version: 0, command: EC_CMD_U=
SB_PD_POWER_INFO
> > >>     369.420528: cros_ec_request_done: version: 0, command:
> > >> EC_CMD_USB_PD_POWER_INFO, ec result: EC_RES_SUCCESS, retval: 16
> > >>
> > >> Cheers,
> > >>  Enric
> > >>
> > > Thank Enric,
> > >
> > > The situation is that some users encountered errors on ChromeBook.
> >
> > And, aren't you able to reproduce the issue?
> >
> >
> > > From their feedback reports, we only get the message like
> > > 'cros-ec-codec GOOG0013:00: ASoC: Failed to set DAI format: -71'.
> > > We know that -71 is -EPROTO but it is not clear enough for us to find
> > > out the root cause. That's why we want the detail of the result.
> >
> >
> > If I am not mistaken this ends calling i2s_rx_set_daifmt() into the EC =
firmware,
> > if the result is -EPROTO that means is not returning EC_RES_SUCCESS, so=
 there
> > are few options:
> >
> >         if (i2s_rx_enabled)
> >                 return EC_RES_BUSY;
> >
> >         if (daifmt >=3D EC_CODEC_I2S_RX_DAIFMT_COUNT)
> >                 return EC_RES_INVALID_PARAM;
> >
> >         if (audio_codec_i2s_rx_set_daifmt(daifmt) !=3D EC_SUCCESS)
> >                 return EC_RES_ERROR;
> >
> > > Because the situation happens on users' side, it is not possible for
> > > them to enable kernel trace (ChromeOS does not allow users to touch
> > > kernel).
> > >
> >
> > Are you sure that when you know the error code you'll find the root cau=
se
> > (without adding more prints)? There is only three possibilities? You ca=
n't start
> > adding prints just to debug a user issue because you don't allow to be =
more
> > verbose. I understand that might help you but is not the way to go.

Hi Enric and Guenter,

Thanks for your inspiring comments.
I'm not sure whether we will find the root cause if I know the error
code. But I think it's not a point.
We wanted to add this error log because we found that the current one
is not enough. Since it is a real error, it would be better if we can
make it more detailed, right?
In addition, we thought it would be helpful in the future as well.
That's why we chose to upstream instead of merging into our source
tree only.

> >
> > You should really reproduce the issue yourself an use actual debug
> > tools/prints./traces
We are trying but still unable to reproduce this issue.
However, as I maintained above, it is not a main concern of this change.
> >
>
> Another possibility would be to change cros_ec_cmd_xfer_status() to
> return a more granular error code, such as -EINVAL for
> EC_RES_INVALID_PARAM, -EBUSY for EC_RES_BUSY, -EINPROGRESS for
> EC_RES_IN_PROGRESS,  -ETIMEDOUT for EC_RES_TIMEOUT, -EOVERFLOW for
> EC_RES_OVERFLOW, -ENODATA for EC_RES_UNAVAILABLE, and so on.
Since there are many kinds of results from EC, why not just make users
able to check on their own?
For example, users can wait and try again if the result is EC_RES_BUSY.

>
> However, it appears that the various low level functions already
> replace various EC error codes with a blank EC_RES_ERROR. No amount of
> logging will tell us what exactly went wrong in those functions. Lucky
> for us, audio_codec_i2s_rx_set_daifmt() only ever returns EC_SUCCESS,
> so we know that the problem is either that i2s_rx_enabled is true or
> that daifmt is too large. None of those really warrants more verbose
> logging.
>
> From the context, my personal bet is that i2s_rx_enabled is true: I
> don't immediately see how disabling it is enforced before trying to
> set the DAI format, and I don't see how "daifmt >=3D
> EC_CODEC_I2S_RX_DAIFMT_COUNT" can ever be true.
I totally agree. According to the source, it seems that both path are
impossible. I'm not really understand the whole path but is it
possible for EC to return other results? I will do more tests and look
carefully into the source. Really thanks for your suggestions.

Cheers,
Yu-Hsuan
>
> Guenter
>
>
> Guenter
>
> > Cheers,
> >  Enric
> >
> > > The other way we thought is changing dev_dbg to dev_err in
> > > cros_ec_cmd_xfer_status. But we are not sure whether it is also an
> > > error for other usages.
> > >
> > >>>   if (ret =3D=3D -EPROTO)
> > >>>     dev_err(..., msg->result)
> > >>>   goto error;
> > >>> }
> > >>> I'm not sure whether it makes sense to check ret =3D=3D -EPROTO her=
e.
> > >>>
> > >>>>
> > >>>>> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > >>>>> ---
> > >>>>>  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
> > >>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> > >>>>>
> > >>>>> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/=
cros_ec_codec.c
> > >>>>> index 8d45c628e988e..a4ab62f59efa6 100644
> > >>>>> --- a/sound/soc/codecs/cros_ec_codec.c
> > >>>>> +++ b/sound/soc/codecs/cros_ec_codec.c
> > >>>>> @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_e=
c_device *ec_dev, uint32_t cmd,
> > >>>>>       if (outsize)
> > >>>>>               memcpy(msg->data, out, outsize);
> > >>>>>
> > >>>>> -     ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > >>>>> +     ret =3D cros_ec_cmd_xfer(ec_dev, msg);
> > >>>>>       if (ret < 0)
> > >>>>>               goto error;
> > >>>>>
> > >>>>> +     if (msg->result !=3D EC_RES_SUCCESS) {
> > >>>>> +             dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd=
,
> > >>>>> +                     msg->result);
> > >>>>> +             ret =3D -EPROTO;
> > >>>>> +             goto error;
> > >>>>> +     }
> > >>>>> +
> > >>>>>       if (insize)
> > >>>>>               memcpy(in, msg->data, insize);
> > >>>>>
> > >>>>>
