Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC03F213D23
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 18:00:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B72316BF;
	Fri,  3 Jul 2020 17:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B72316BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593792037;
	bh=9HEAL4ELaUy6OLJ+mEkYEmuXi58Kj/38IrNTuFbcuQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=knRhQarPPy4mNyGrzVdNHmSk4IGGTQQV+NAhipsQy7nIx9Rm32uc6vk3ChTjXeqNy
	 sb6nV9xjg3ceHDjA0XcQtnw7ed7vJHESFpS/QaFJbmqULCrllcT4zFU+WVABZNVQIu
	 IiuLH5yiTVvGacBuZphNkckTL7jxlaMH9qayV7Jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B49AF800E2;
	Fri,  3 Jul 2020 17:58:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52535F80217; Fri,  3 Jul 2020 17:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_135,PRX_BODY_29,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E6CFF800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 17:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E6CFF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="FwsjIYfT"
Received: by mail-ed1-x544.google.com with SMTP id d16so21545127edz.12
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q/N+I6wlAniI0DD0itPuT/cLgyAhUPW3fibqZYnY1tM=;
 b=FwsjIYfTY+TNSmsO90G4fVb7hDX8DqNp9MwC7g9XcICwCqgTRv/4bS8LQ1wQBuHbf2
 BKQcVeHXNTyxt0k/ICF0pOTkhXsANIH0Jzs0BrOhxJH9y0XXz6ZH0OklBNCZpNbhl94p
 2WdseA+W7RuGsPzTRuhuergDlIHGd6Y2LUoHvNEmLeVf4/FfetVlrpLGUMn+Eb/VrQSk
 VSLWnfuuEKXx9QZedyt8wJPkUKhKgMTdv2CLRlD2XIwpgA9NR3Gr3BWnAjXsNrd916+B
 jlbSt1pFNBZp0jGGNvKZrLXNtE5G43HmKdHMadRCqjWO3FJTUXf4KZjP0REZ+ruLkZcV
 XCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q/N+I6wlAniI0DD0itPuT/cLgyAhUPW3fibqZYnY1tM=;
 b=SMs6VCOVObdPhnnanbABij+rewXDDXGq8iDT8EDTALnqtm0968Zs4yUXqxOxdZe8is
 Z0bD1eK+7bv6vWDbo5ca/nuO/W6kSV+TyTCVxkI4PQX2VVJd+aPGMw+2WuAXbvdXb87/
 CEe20OxZmg/6XlOjrDJW7STd9ootcRlIkk3FLyej+DNWPiQyWgqzPst8FBNlbzKf1KGW
 FGInwGvoujc/7oAyF9FS5HhTuifFrsSUlUoQ4+5d0BnZJxl7hcSvVidozLbX22Fq5Oo2
 MpFzr/OUFdlZn/3EhI5OgOKkhiIVLveYWtESqhfLtqnUZ+m1LvggPwmEMb0mLt8/UNP1
 Js/A==
X-Gm-Message-State: AOAM531OqGCf9AzX0wosHpRfz2lDSPMTIpMBM5+kG7x/vkofdwzdGzD/
 zc+WVCzLfI0XI25BzyPBeIsKoSi2uOM9U16ZahmJmw==
X-Google-Smtp-Source: ABdhPJzNZLv2k3bDhCuqcHfUOacDVJL1TIfyfOhpyzTgJJ7gwUSV//iehtbOiR+UB8diZNgTQI4L+KT77z5xL+FrO84=
X-Received: by 2002:a50:ed15:: with SMTP id j21mr14915524eds.246.1593791926531; 
 Fri, 03 Jul 2020 08:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200703071913.2358882-1-yuhsuan@chromium.org>
 <8d21fc0c-b43e-75a0-d5d4-ed4872ec92cb@collabora.com>
 <CAGvk5Pqx475MOsefchcgs=CnVJiwFJxa+-J6eHcp1VgscVkTeg@mail.gmail.com>
 <cea2bc7e-035b-2c97-73bf-25dc55ab8801@collabora.com>
 <CAGvk5PoiWDchYCsaR_tqQ5mE0XA_hBXHy-hS5o3vFtuPzm_JiA@mail.gmail.com>
 <d5634533-3cf3-b52a-ff24-2bda3230927d@collabora.com>
In-Reply-To: <d5634533-3cf3-b52a-ff24-2bda3230927d@collabora.com>
From: Guenter Roeck <groeck@google.com>
Date: Fri, 3 Jul 2020 08:58:35 -0700
Message-ID: <CABXOdTcP0DagxzUrBh5H_TXzSAZjMAG4UaV++0sW99W4ypC78w@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: cros_ec_codec: Log results when EC commands fail
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
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

On Fri, Jul 3, 2020 at 3:56 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Yu-Hsuan,
>
> On 3/7/20 11:40, Yu-Hsuan Hsu wrote:
> > Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2020=E5=
=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:19=E5=AF=
=AB=E9=81=93=EF=BC=9A
> >>
> >> Hi Yu-Hsuan,
> >>
> >> On 3/7/20 10:48, Yu-Hsuan Hsu wrote:
> >>> Enric Balletbo i Serra <enric.balletbo@collabora.com> =E6=96=BC 2020=
=E5=B9=B47=E6=9C=883=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:38=E5=
=AF=AB=E9=81=93=EF=BC=9A
> >>>>
> >>>> Hi Yu-Hsuan,
> >>>>
> >>>> Thank you for your patch
> >>>>
> >>>> On 3/7/20 9:19, Yu-Hsuan Hsu wrote:
> >>>>> Log results of failed EC commands to identify a problem more easily=
.
> >>>>>
> >>>>> Replace cros_ec_cmd_xfer_status with cros_ec_cmd_xfer because the r=
esult
> >>>>> has already been checked in this function. The wrapper is not neede=
d.
> >>>>>
> >>>>
> >>>> Nack, we did an effort to remove all public users of cros_ec_cmd_xfe=
r() in
> >>>> favour of cros_ec_cmd_xfer_status() and you are reintroducing again.=
 You can do
> >>>> the same but using cros_ec_cmd_xfer_status(). In fact, your patch wi=
ll not build
> >>>> on top of the upcoming changes.
> >>> Thanks! But I have a question about implementing it. Does it look lik=
e
> >>> the one below?
> >>> ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> >>> if (ret < 0) {
> >>
> >> In this case will already print an error.
> >>
> >> What are you trying to achieve?
> >>
> >> If the only reason is of this patch is print a message you should eith=
er, or
> >> enable dynamic printk and enable dev_dbg or event better use the kerne=
l trace
> >> functionality. There is no need to be more verbose.
> >>
> >> Example:
> >>     $ echo 1 > /sys/kernel/debug/tracing/events/cros_ec/enable
> >>     $ cat /sys/kernel/debug/tracing/trace
> >>
> >>     369.416372: cros_ec_request_start: version: 0, command: EC_CMD_USB=
_PD_POWER_INFO
> >>     369.420528: cros_ec_request_done: version: 0, command:
> >> EC_CMD_USB_PD_POWER_INFO, ec result: EC_RES_SUCCESS, retval: 16
> >>
> >> Cheers,
> >>  Enric
> >>
> > Thank Enric,
> >
> > The situation is that some users encountered errors on ChromeBook.
>
> And, aren't you able to reproduce the issue?
>
>
> > From their feedback reports, we only get the message like
> > 'cros-ec-codec GOOG0013:00: ASoC: Failed to set DAI format: -71'.
> > We know that -71 is -EPROTO but it is not clear enough for us to find
> > out the root cause. That's why we want the detail of the result.
>
>
> If I am not mistaken this ends calling i2s_rx_set_daifmt() into the EC fi=
rmware,
> if the result is -EPROTO that means is not returning EC_RES_SUCCESS, so t=
here
> are few options:
>
>         if (i2s_rx_enabled)
>                 return EC_RES_BUSY;
>
>         if (daifmt >=3D EC_CODEC_I2S_RX_DAIFMT_COUNT)
>                 return EC_RES_INVALID_PARAM;
>
>         if (audio_codec_i2s_rx_set_daifmt(daifmt) !=3D EC_SUCCESS)
>                 return EC_RES_ERROR;
>
> > Because the situation happens on users' side, it is not possible for
> > them to enable kernel trace (ChromeOS does not allow users to touch
> > kernel).
> >
>
> Are you sure that when you know the error code you'll find the root cause
> (without adding more prints)? There is only three possibilities? You can'=
t start
> adding prints just to debug a user issue because you don't allow to be mo=
re
> verbose. I understand that might help you but is not the way to go.
>
> You should really reproduce the issue yourself an use actual debug
> tools/prints./traces.
>

Another possibility would be to change cros_ec_cmd_xfer_status() to
return a more granular error code, such as -EINVAL for
EC_RES_INVALID_PARAM, -EBUSY for EC_RES_BUSY, -EINPROGRESS for
EC_RES_IN_PROGRESS,  -ETIMEDOUT for EC_RES_TIMEOUT, -EOVERFLOW for
EC_RES_OVERFLOW, -ENODATA for EC_RES_UNAVAILABLE, and so on.

However, it appears that the various low level functions already
replace various EC error codes with a blank EC_RES_ERROR. No amount of
logging will tell us what exactly went wrong in those functions. Lucky
for us, audio_codec_i2s_rx_set_daifmt() only ever returns EC_SUCCESS,
so we know that the problem is either that i2s_rx_enabled is true or
that daifmt is too large. None of those really warrants more verbose
logging.

From the context, my personal bet is that i2s_rx_enabled is true: I
don't immediately see how disabling it is enforced before trying to
set the DAI format, and I don't see how "daifmt >=3D
EC_CODEC_I2S_RX_DAIFMT_COUNT" can ever be true.

Guenter


Guenter

> Cheers,
>  Enric
>
> > The other way we thought is changing dev_dbg to dev_err in
> > cros_ec_cmd_xfer_status. But we are not sure whether it is also an
> > error for other usages.
> >
> >>>   if (ret =3D=3D -EPROTO)
> >>>     dev_err(..., msg->result)
> >>>   goto error;
> >>> }
> >>> I'm not sure whether it makes sense to check ret =3D=3D -EPROTO here.
> >>>
> >>>>
> >>>>> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> >>>>> ---
> >>>>>  sound/soc/codecs/cros_ec_codec.c | 9 ++++++++-
> >>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cr=
os_ec_codec.c
> >>>>> index 8d45c628e988e..a4ab62f59efa6 100644
> >>>>> --- a/sound/soc/codecs/cros_ec_codec.c
> >>>>> +++ b/sound/soc/codecs/cros_ec_codec.c
> >>>>> @@ -90,10 +90,17 @@ static int send_ec_host_command(struct cros_ec_=
device *ec_dev, uint32_t cmd,
> >>>>>       if (outsize)
> >>>>>               memcpy(msg->data, out, outsize);
> >>>>>
> >>>>> -     ret =3D cros_ec_cmd_xfer_status(ec_dev, msg);
> >>>>> +     ret =3D cros_ec_cmd_xfer(ec_dev, msg);
> >>>>>       if (ret < 0)
> >>>>>               goto error;
> >>>>>
> >>>>> +     if (msg->result !=3D EC_RES_SUCCESS) {
> >>>>> +             dev_err(ec_dev->dev, "Command %d failed: %d\n", cmd,
> >>>>> +                     msg->result);
> >>>>> +             ret =3D -EPROTO;
> >>>>> +             goto error;
> >>>>> +     }
> >>>>> +
> >>>>>       if (insize)
> >>>>>               memcpy(in, msg->data, insize);
> >>>>>
> >>>>>
