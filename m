Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1C406913
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 11:27:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADB06836;
	Fri, 10 Sep 2021 11:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADB06836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631266037;
	bh=DVFS+eVz41agY/LHCK8rL4V7nJDyggFRtTLh4EVSn9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sGLxPExVZHkeE9BL+dPtCBRK2QnC53cWszVJ4064fsNX8ezZAXAzuXl5do7M5ADl1
	 v12Q7bC+r3syBVTMnJL2LHG/l6lG248ZkRwVwbtwa9DaP959o9mPe5f4RxZ9mWJC4E
	 4SA/zt3Cwn1XPJ85NJcDAFiy82ofeRg4fcmWjvIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B35AF80143;
	Fri, 10 Sep 2021 11:26:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96AB6F80143; Fri, 10 Sep 2021 11:25:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF99DF80143
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 11:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF99DF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="i+sQegrD"
Received: by mail-pg1-x530.google.com with SMTP id q68so1257325pga.9
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 02:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UGop0docc8B1GTvJpl+G3gqt2RijBgvBnLsR3KXqGLU=;
 b=i+sQegrDeleL+EsqVBRnH6teWJyqBXEZWpTSs6BihLyoJfpoFCPKlTZkyKYuOVE/c0
 vnTs3WgNTd1E4tLNobmBwvay+fYn0/V34Cq2YSv92uQ27pOzDszytMQ9ikclGQQTXf1o
 M0qKKLmR52SAA2MBFtxvHh1VPuORAIO7Qjg5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UGop0docc8B1GTvJpl+G3gqt2RijBgvBnLsR3KXqGLU=;
 b=xcDuyCxf4ZUoEvPayHzmjHrOZIo1dpGJVeG6RnatPeMGufpUZ4MvT+V6vM4/lWWac4
 CvGuWpTojgdMTZacnnAeWtebI0Zt3vc2uedXurk8WSzTA8zSyXcUVYInmKR7EB6qdZH5
 cgN6kalDqYrXeZadwmB5KmSDoqjovvbfM1VK2Xm2ep2O5HehP0pzjOZZOftnbHHCfZ9A
 4q6E4BpxbExcmnWtphQ7TiTNjoivrK/8tcS8uPsGbX0MIoyHDwt4jjAdnoPDXKL7WZdz
 uIiwHy0omgZysZX4auz1oZj2Fft93+4Np0tzzVZA5WhgetcQTIfP+J7B8ApXOqwo+wIc
 k5ew==
X-Gm-Message-State: AOAM533iWMfSzK7rB09iCbGoZv6qUEkVIe6l0qJMJItNfou0cXdFF5Ni
 BflKw5SwOBQWxJBOloQVaLp+KsUuTf7rSkLcFi7j6A==
X-Google-Smtp-Source: ABdhPJzstRkDBXxYK9B9cnY4DMWTP023/mJF/td/1O40MZ2HMxJLQFIxIT7o2CcgzZdQ280pHhM4q86YIDwJCdxAfCA=
X-Received: by 2002:aa7:8617:0:b0:3f2:3cb2:33bc with SMTP id
 p23-20020aa78617000000b003f23cb233bcmr7386342pfn.36.1631265948700; Fri, 10
 Sep 2021 02:25:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADDZ45UPsbpAAqP6=ZkTT8BE-yLii4Y7xSDnjK550G2DhQsMew@mail.gmail.com>
 <s5hfsudq3jx.wl-tiwai@suse.de>
In-Reply-To: <s5hfsudq3jx.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 10 Sep 2021 17:25:37 +0800
Message-ID: <CAGvk5Ppn2CK=GUgs+YoxoKLBm0zHUmSi4QrDk4ahO24_FPfqsg@mail.gmail.com>
Subject: Re: A portion of USB Headsets loses previous sound volume setting
 after a suspend resume
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>,
 En-Shuo Hsu <enshuo@chromium.org>
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

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2021=E5=B9=B49=E6=9C=889=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, 09 Sep 2021 12:21:46 +0200,
> En-Shuo Hsu wrote:
> >
> > Hi
> >
> > We recently found that some USB headsets may fall back to their full vo=
lume
> > after a suspend and resume. We think the issue is caused by the logic o=
f
> > mixer_ctl_feature_put in sound/usb/mixer.c:
> >
> > err =3D snd_usb_get_cur_mix_value(cval, c + 1, cnt, &oval);
> > if (err < 0)
> >   return filter_error(cval, err);
> >   val =3D ucontrol->value.integer.value[cnt];
> >   val =3D get_abs_value(cval, val);
> > if (oval !=3D val) {
> >   snd_usb_set_cur_mix_value(cval, c + 1, cnt, val);
> >   changed =3D 1;
> > }
> >
> > The existing codes get the existing mixer control value and ignore the =
set if
> > the val doesn't change. However, in the suspend and resume case, the US=
B
> > headset's control value is actually changed.
> >
> > Removing the cache logic is a potential fix, but a better solution may =
be to
> > properly handle the suspend resume scenario in snd_usb_get_cur_mix_valu=
e. We
> > may need to mark the cache in usb_mixer_elem_info to be dirty.
> >
> > The issue is verified to be reproduced with Dell WH3022 and Logitech US=
B
> > Headset H340 by:
> > 1. Boot to OS.
> > 2. Plug in the headset and check sound output.
> > 3. Play an audio/video and keep with low volume.
> > 4. Suspend.
> > 5. Resume.
> > 6. When audio/video is played, the headset's sound output can't keep th=
e
> > original volume. --> issue "
> >
> > Would like to know your thoughts on this issue.
>
> USB-audio driver has an assumption that the normal resume code
> presumes the configuration while reset_resume needs the full
> initialization, but this looks too naive, then.
>
> Could you check the following works?
>
>
> Takashi
>
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -1080,7 +1080,7 @@ static int __usb_audio_resume(struct usb_interface =
*intf, bool reset_resume)
>          * we just notify and restart the mixers
>          */
>         list_for_each_entry(mixer, &chip->mixer_list, list) {
> -               err =3D snd_usb_mixer_resume(mixer, reset_resume);
> +               err =3D snd_usb_mixer_resume(mixer, true /*reset_resume*/=
);
>                 if (err < 0)
>                         goto err_out;
>         }

Thanks! It works. Is it an appropriate fix to set the reset_resume to
true in usb_audio_resume?
If it's acceptable, we can send the patch.

Yu-Hsuan
