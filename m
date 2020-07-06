Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE1F2154F3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 11:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33C91673;
	Mon,  6 Jul 2020 11:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33C91673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594028911;
	bh=c0W+t/dUUooUAVfP8+w3CI+N1q/WolmIPbbOk3xjbdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=benCNiFAAwpzefJj4Ug6qWZqVWi7TeipZE8HkXBcW5u9fMyfRSAbqww5H3ph9Skj1
	 OvGlhPWcazOMPAfOYusBZ04AEraE9TsM2hPtx8VmmURVuV/DGFheJz1OWYJMdW6E7p
	 5VZjnpjjhactdWWMyOGLvSzaX1QkpXI8Mf6OFQSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3820F8011F;
	Mon,  6 Jul 2020 11:46:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D141F8015A; Mon,  6 Jul 2020 11:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_135,PRX_BODY_29,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AEAEF80125
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 11:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AEAEF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lIQqEN+6"
Received: by mail-wm1-x342.google.com with SMTP id 22so38536428wmg.1
 for <alsa-devel@alsa-project.org>; Mon, 06 Jul 2020 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K9WAWrlcNRulKKO2wx4Nu7cqwFD0/LsS+g/zpNhzEgA=;
 b=lIQqEN+67TNPlFFoWtCmF9Owz7a/HVzMMEFPEhIE1RuzesKYCvHiekdLwg1a65+tcm
 nSsEACRrmXfUwwJQ2x6zzQ2WKTFrGrztQ4UKVt/5W1CDvIMU0e/vxVX/VonnUnFjoxtz
 /ZA43ostyq607QaHmfikyW/DQrzJXYOosjIU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K9WAWrlcNRulKKO2wx4Nu7cqwFD0/LsS+g/zpNhzEgA=;
 b=ObhupZ0PMeb98RjCLG9NpMKeGh65r80p/GscmW1fOXJ9ne3ZDs4ZuXwICp+kO0LgVT
 Zj4pcY9tsOkOtQUND5pFsQVhiFpUAWXgCrAe3zSTj9+DQeLDD7dAcA/6Yu1mpNUVWBiG
 8WRYeOs9ggl3f3NBpzvDRS+zeekNhqoJAiFx0tQEGEPtEIYJGFKTNghUAXZ6emHkI2V7
 HerHkk9AskwKjbsGBcxKt17EqTzPFZNsYmdN2JougC2+52sqS4Syjn/9OCdVSzr9FuZb
 Lw90xFaOyILU6mZH0b4yE3ADkZEiTNB2KbirL12uNif04vgvUQd+igoPqn6fJi2xF19i
 UaBA==
X-Gm-Message-State: AOAM532BzAUQRy1zXf2CnuRsnuER+4f//3SY4JztlLmXKpQ6DdYsfxZ/
 bXa3dLHIWkl/2nYo0+uuNgNuG1AIqW3b9xfBFKnvCg==
X-Google-Smtp-Source: ABdhPJxRhUpPLkB0+m9CtAHR7OnfdR5JCbHPIhC2WKNfs7ZjXh1OBqmLCXbJwMgs7tvQ47rFLrDUMAJRSI7j7CMShQw=
X-Received: by 2002:a7b:c4d7:: with SMTP id g23mr6415983wmk.17.1594028799064; 
 Mon, 06 Jul 2020 02:46:39 -0700 (PDT)
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
 <CAGvk5PrV2u==ZH38mX1DAUpa8YRiDmCazkxNr1qhFmOaiw2duQ@mail.gmail.com>
In-Reply-To: <CAGvk5PrV2u==ZH38mX1DAUpa8YRiDmCazkxNr1qhFmOaiw2duQ@mail.gmail.com>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Mon, 6 Jul 2020 17:46:27 +0800
Message-ID: <CAGvk5PoXmErm9Tn4N65XwRMuxA5QezrMyM9WkrgdXJ9=qhdQHw@mail.gmail.com>
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

Yu-Hsuan Hsu <yuhsuan@chromium.org> =E6=96=BC 2020=E5=B9=B47=E6=9C=884=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=887:34=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=884=E6=
=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:28=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Fri, Jul 3, 2020 at 12:11 PM Yu-Hsuan Hsu <yuhsuan@chromium.org> wro=
te:
> > >
> > > Guenter Roeck <groeck@google.com> =E6=96=BC 2020=E5=B9=B47=E6=9C=883=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:58=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > >
> > > > On Fri, Jul 3, 2020 at 3:56 AM Enric Balletbo i Serra
> > > > <enric.balletbo@collabora.com> wrote:
> > > > >
> > > > > Hi Yu-Hsuan,
> > > > >
> > > > > On 3/7/20 11:40, Yu-Hsuan Hsu wrote:
> > > > > > Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC=
 2020=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:1=
9=E5=AF=AB=E9=81=93=EF=BC=9A
> > > > > >>
> > > > > >> Hi Yu-Hsuan,
> > > > > >>
> > > > > >> On 3/7/20 10:48, Yu-Hsuan Hsu wrote:
> > > > > >>> Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=
=BC 2020=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=88=
4:38=E5=AF=AB=E9=81=93=EF=BC=9A
> > > > > >>>>
> > > > > >>>> Hi Yu-Hsuan,
> > > > > >>>>
> > > > > >>>> Thank you for your patch
> > > > > >>>>
> > > > > >>>> On 3/7/20 9:19, Yu-Hsuan Hsu wrote:
> > > > > >>>>> Log results of failed EC commands to identify a problem mor=
e easily.
> > > > > >>>>>
> > > > > >>>>> Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer becau=
se the result
> > > > > >>>>> has already been checked in this function. The wrapper is n=
ot needed.
> > > > > >>>>>
> > > > > >>>>
> > > > > >>>> Nack, we did an effort to remove all public users of cros_ec=
_cmd_xfer() in
> > > > > >>>> favour of cros_ec_cmd_xfer_status() and you are reintroducin=
g again. You can do
> > > > > >>>> the same but using cros_ec_cmd_xfer_status(). In fact, your =
patch will not build
> > > > > >>>> on top of the upcoming changes.
> > > > > >>> Thanks! But I have a question about implementing it. Does it =
look like
> > > > > >>> the one below?
> > > > > >>> ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > > > > >>> if (ret < 0) {
> > > > > >>
> > > > > >> In this case will already print an error.
> > > > > >>
> > > > > >> What are you trying to achieve?
> > > > > >>
> > > > > >> If the only reason is of this patch is print a message you sho=
uld either, or
> > > > > >> enable dynamic printk and enable dev_dbg or event better use t=
he kernel trace
> > > > > >> functionality. There is no need to be more verbose.
> > > > > >>
> > > > > >> Example:
> > > > > >>     $ echo 1 > /sys/kernel/debug/tracing/events/cros_ec/enable
> > > > > >>     $ cat /sys/kernel/debug/tracing/trace
> > > > > >>
> > > > > >>     369.416372: cros_ec_request_start: version: 0, command: EC=
_CMD_USB_PD_POWER_INFO
> > > > > >>     369.420528: cros_ec_request_done: version: 0, command:
> > > > > >> EC_CMD_USB_PD_POWER_INFO, ec result: EC_RES_SUCCESS, retval: 1=
6
> > > > > >>
> > > > > >> Cheers,
> > > > > >>  Enric
> > > > > >>
> > > > > > Thank Enric,
> > > > > >
> > > > > > The situation is that some users encountered errors on ChromeBo=
ok.
> > > > >
> > > > > And, aren't you able to reproduce the issue?
> > > > >
> > > > >
> > > > > > From their feedback reports, we only get the message like
> > > > > > 'cros-ec-codec GOOG0013:00: ASoC: Failed to set DAI format: -71=
'.
> > > > > > We know that -71 is -EPROTO but it is not clear enough for us t=
o find
> > > > > > out the root cause. That's why we want the detail of the result=
.
> > > > >
> > > > >
> > > > > If I am not mistaken this ends calling i2s_rx_set_daifmt() into t=
he EC firmware,
> > > > > if the result is -EPROTO that means is not returning EC_RES_SUCCE=
SS, so there
> > > > > are few options:
> > > > >
> > > > >         if (i2s_rx_enabled)
> > > > >                 return EC_RES_BUSY;
> > > > >
> > > > >         if (daifmt >=3D EC_CODEC_I2S_RX_DAIFMT_COUNT)
> > > > >                 return EC_RES_INVALID_PARAM;
> > > > >
> > > > >         if (audio_codec_i2s_rx_set_daifmt(daifmt) !=3D EC_SUCCESS=
)
> > > > >                 return EC_RES_ERROR;
> > > > >
> > > > > > Because the situation happens on users' side, it is not possibl=
e for
> > > > > > them to enable kernel trace (ChromeOS does not allow users to t=
ouch
> > > > > > kernel).
> > > > > >
> > > > >
> > > > > Are you sure that when you know the error code you'll find the ro=
ot cause
> > > > > (without adding more prints)? There is only three possibilities? =
You can't start
> > > > > adding prints just to debug a user issue because you don't allow =
to be more
> > > > > verbose. I understand that might help you but is not the way to g=
o.
> > >
> > > Hi Enric and Guenter,
> > >
> > > Thanks for your inspiring comments.
> > > I'm not sure whether we will find the root cause if I know the error
> > > code. But I think it's not a point.
> > > We wanted to add this error log because we found that the current one
> > > is not enough. Since it is a real error, it would be better if we can
> > > make it more detailed, right?
> > > In addition, we thought it would be helpful in the future as well.
> > > That's why we chose to upstream instead of merging into our source
> > > tree only.
> > >
> >
> > Kernel log messages are almost never useful for actual users. In most
> > cases, they just clog up the kernel log, making it useless for when it
> > actually counts (such as when the system crashes). On top of that,
> > there already is an error message, only the error code doesn't mean
> > much because it is "universalized". I don't see how adding another
> > error message would improve that, even more so if that error message
> > is only added in one place. On the other side, converting EC error
> > codes to Linux kernel error codes would help every caller of
> > cros_ec_cmd_xfer_status without adding more logging noise.
>
> Thanks for the explanation. If I understand correctly, the mean point
> is this log is noisy.
> In this case, the log will only appear one time during the card
> probing(if it fails). But I do agree that it may create some potential
> noises.
> Converting EC error codes to Linux kernel error codes also work for
> me. Is it possible for you to send the corresponding patch? If not, I
> can try to work on it.
> In addition, is it possible that one error code can come from linux or fr=
om EC?
>
> >
> > > > >
> > > > > You should really reproduce the issue yourself an use actual debu=
g
> > > > > tools/prints./traces
> > > We are trying but still unable to reproduce this issue.
> > > However, as I maintained above, it is not a main concern of this chan=
ge.
> > > > >
> > > >
> > > > Another possibility would be to change cros_ec_cmd_xfer_status() to
> > > > return a more granular error code, such as -EINVAL for
> > > > EC_RES_INVALID_PARAM, -EBUSY for EC_RES_BUSY, -EINPROGRESS for
> > > > EC_RES_IN_PROGRESS,  -ETIMEDOUT for EC_RES_TIMEOUT, -EOVERFLOW for
> > > > EC_RES_OVERFLOW, -ENODATA for EC_RES_UNAVAILABLE, and so on.
> > > Since there are many kinds of results from EC, why not just make user=
s
> > > able to check on their own?
> > > For example, users can wait and try again if the result is EC_RES_BUS=
Y.
> > >
> >
> > That is exactly what -EBUSY is for: It lets the user space application
> > decide what to do about it. A kernel log message can not and will
> > never achieve that.
> >
> > > >
> > > > However, it appears that the various low level functions already
> > > > replace various EC error codes with a blank EC_RES_ERROR. No amount=
 of
> > > > logging will tell us what exactly went wrong in those functions. Lu=
cky
> > > > for us, audio_codec_i2s_rx_set_daifmt() only ever returns EC_SUCCES=
S,
> > > > so we know that the problem is either that i2s_rx_enabled is true o=
r
> > > > that daifmt is too large. None of those really warrants more verbos=
e
> > > > logging.
> > > >
> > > > From the context, my personal bet is that i2s_rx_enabled is true: I
> > > > don't immediately see how disabling it is enforced before trying to
> > > > set the DAI format, and I don't see how "daifmt >=3D
> > > > EC_CODEC_I2S_RX_DAIFMT_COUNT" can ever be true.
> > > I totally agree. According to the source, it seems that both path are
> >
> > You are effectively saying that there is code to ensure that
> > i2s_rx_enabled is false. Granted, the code is too complex to easily
> > understand, and I may not have seen that flow. Per the same logic,
> > though, it might well be possible that _because_ the code is not easy
> > to understand there may well be a data path where i2s_rx_enabled is
> > set. One would need to ensure that the sequence of <disable rx> - <set
> > dai format> - <re-enable rx> is guaranteed, and that it is always
> > executed under a kernel lock. Maybe you can point me to that code, for
> > my education.
> >
> > On the other side, it is much easier to verify that "daifmt >=3D
> > EC_CODEC_I2S_RX_DAIFMT_COUNT" is never true.
> >
> > Thanks,
> > Guenter
> The complete errors are:
> ERR kernel: [    8.568171]  cros-ec-codec GOOG0013:00: ASoC: error at
> snd_soc_dai_set_fmt on GOOG0013:00: -71
> WARNING kernel: [    8.583312] cros-ec-codec GOOG0013:00: ASoC: Failed
> to set DAI format: -71
> ERR kernel: [    8.629388] acp3x-alc5682-max98357 AMDI5682:00:
> devm_snd_soc_register_card(acp3xalc5682m98357) failed: -71
> WARNING kernel: [    8.645306] acp3x-alc5682-max98357: probe of
> AMDI5682:00 failed with error -71
>
> This issue happened when probing the card while the i2s_rx is only
> enabled when the device is used. Therefore, the i2s_rx should not be
> enabled before the card is probed. However, I may miss something. I
> will check the entire path later.
I finally found a possible root cause. EC does not restart when we
reboots kernel. It means if kernel crashes while i2s_rx is enabled, we
will trigger this issue. In addition, the issue will stay until the
next time rebooting EC.

I will work on the fix. Thank you for very helpful information.

> For "daifmt >=3D EC_CODEC_I2S_RX_DAIFMT_COUNT", it is obviously not to
> be true by looking into i2s_rx_set_fmt function.
>
> Thanks,
> Yu-Hsuan
>
> >
> > > impossible. I'm not really understand the whole path but is it
> > > possible for EC to return other results? I will do more tests and loo=
k
> > > carefully into the source. Really thanks for your suggestions.
> > >
> > > Cheers,
> > > Yu-Hsuan
> > > >
> > > > Guenter
> > > >
> > > >
> > > > Guenter
> > > >
> > > > > Cheers,
> > > > >  Enric
> > > > >
> > > > > > The other way we thought is changing dev_dbg to dev_err in
> > > > > > cros_ec_cmd_xfer_status. But we are not sure whether it is also=
 an
> > > > > > error for other usages.
> > > > > >
> > > > > >>>   if (ret =3D=3D -EPROTO)
> > > > > >>>     dev_err(..., msg->result)
> > > > > >>>   goto error;
> > > > > >>> }
> > > > > >>> I'm not sure whether it makes sense to check ret =3D=3D -EPRO=
TO here.
> > > > > >>>
> > > > > >>>>
> > > > > >>>>> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> > > > > >>>>> ---
> > > > > >>>>>  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
> > > > > >>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > >>>>>
> > > > > >>>>> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/c=
odecs/cros_ec_codec.c
> > > > > >>>>> index 8d45c628e988e..a4ab62f59efa6 100644
> > > > > >>>>> --- a/sound/soc/codecs/cros_ec_codec.c
> > > > > >>>>> +++ b/sound/soc/codecs/cros_ec_codec.c
> > > > > >>>>> @@ -90,10 +90,17 @@ static int send_ec_host_command(struct =
cros_ec_device *ec_dev, uint32_t cmd,
> > > > > >>>>>       if (outsize)
> > > > > >>>>>               memcpy(msg->data, out, outsize);
> > > > > >>>>>
> > > > > >>>>> -     ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> > > > > >>>>> +     ret =3D cros_ec_cmd_xfer(ec_dev, msg);
> > > > > >>>>>       if (ret < 0)
> > > > > >>>>>               goto error;
> > > > > >>>>>
> > > > > >>>>> +     if (msg->result !=3D EC_RES_SUCCESS) {
> > > > > >>>>> +             dev_err(ec_dev->dev, "Command %d failed: %d\n=
", cmd,
> > > > > >>>>> +                     msg->result);
> > > > > >>>>> +             ret =3D -EPROTO;
> > > > > >>>>> +             goto error;
> > > > > >>>>> +     }
> > > > > >>>>> +
> > > > > >>>>>       if (insize)
> > > > > >>>>>               memcpy(in, msg->data, insize);
> > > > > >>>>>
> > > > > >>>>>
