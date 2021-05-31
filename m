Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7458395420
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 05:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65143850;
	Mon, 31 May 2021 05:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65143850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622430341;
	bh=I+LJWrku53jZ86tJLWIV/2mn+wyqpk+Jlp77ya0fZEg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZM/Gn361BdzOY3R5LCoTlEhgpn034ItB4dpmxlfb0PZrJ4hijkCV/B9drnsZMBQk/
	 NBY/ItRJfxKyxB/3nDPD0ei2BH3F8l3dAxh7uIFzQBt4Ck2KB6wDWw1amwFbr07AQV
	 bWrpmlK4tyWUbtJfyTJExxg4yNp707NcXbljdwpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9515F80273;
	Mon, 31 May 2021 05:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB4D8F80253; Mon, 31 May 2021 05:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62842F80088
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 05:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62842F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZpqMb5pL"
Received: by mail-ej1-x629.google.com with SMTP id ss26so14415403ejb.5
 for <alsa-devel@alsa-project.org>; Sun, 30 May 2021 20:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9zncGjWI/Ti8X4PcYn2LTWv6/sQeOvT3E+T4zzv3al4=;
 b=ZpqMb5pLMC57T5ge9mI5wiScA0lilfWuOW/WzS/iOL/Pobi10ictGNHq7So1K580xE
 t6evHt86l5Sp49kkm6XqGBAzK8M8H47X62rQ6zJ1QVuZid/NhxgwKV7hnYtqNHE8SH7n
 3dpFSHiJzHhVc1wyl3Vf8unKF1Nc9uWTTDeX6sHDzNqI0Q0r4dvv8BhVZpBUIUP/+7pP
 LwmVv+cfs0pcO6mG5VPZFkPjGyzhwCtX86UgN2r718AxHZydoQOy8U5NdHrRAf3H7lOP
 HtDmRlKaY7lD9jlScOo0NWYWo+kcuTeLR0IafCzd59/Y46A+rR6ShPlGHHLcj0mVODKm
 JphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9zncGjWI/Ti8X4PcYn2LTWv6/sQeOvT3E+T4zzv3al4=;
 b=Tz5wArcD7/ePDzvb3xYxNf0XOzfrAOuBq7QqnQJPrm9O7Ziz2CV9eYGNEsvU+Q8gTE
 r2qlMtOJydkbkh9pdhsq3MsHkY+4ZGknEbsyBGpwqKd5sOq6rkBHhtH1lLFRWDoG2+m5
 +i45RjIktLuyd2sEtokcMadj+jyYv8HA+Vv5lw7QJdk1ShY2zIQAyv0DFe8iM08nBD7e
 4YFXzTJfitoGVm2kbR10N3jgh3SYkgYCdHMRr470aGunCAp74u6ZDT8EkYKC27eM1QUG
 5e7TUG6KTENsi16gvL8GxxkMt3r088F6AshMuiDRqqyVFgP0szV3Jpi28b89iAksft2P
 pglw==
X-Gm-Message-State: AOAM532uQUW2iC/WKRLCk2+KSlcUwLhl8QBBIa3OQ2wMk34IrxZUqZnk
 UP93eAWg/7nrQX2pbbK4f5Vn8JnRUBYe+M0pz1c=
X-Google-Smtp-Source: ABdhPJxDEPa3T5UAc0cyhX2pJM3u681kMN50f7+D2IiLhhsuHCNZDsnnuQO0O7X+CyydTBL9Se8gyDjJEZsWpjQ1m5o=
X-Received: by 2002:a17:906:6d17:: with SMTP id
 m23mr21254158ejr.73.1622430242956; 
 Sun, 30 May 2021 20:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210528133309.GR24442@kadam>
 <CAD-N9QVWcEJjoziA6HVoQiUueVaKqAJS5Et60zvCvuUE7e6=gg@mail.gmail.com>
 <20210528140500.GS24442@kadam>
 <A622EB84-DC4A-47A4-A828-CE6D25DC92EB@gmail.com>
In-Reply-To: <A622EB84-DC4A-47A4-A828-CE6D25DC92EB@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 31 May 2021 11:03:36 +0800
Message-ID: <CAD-N9QVjhDDJxRnNrDzwt05BNijr1o11nE8xjvq8GrakEJ8EuQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
To: Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On Sat, May 29, 2021 at 5:35 AM =E6=85=95=E5=86=AC=E4=BA=AE <mudongliangabc=
d@gmail.com> wrote:
>
>
>
> > On May 28, 2021, at 10:05 PM, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
> >
> > On Fri, May 28, 2021 at 09:50:49PM +0800, Dongliang Mu wrote:
> >>
> >> Can you please give some advise on how to fix this WARN issue?
> >
> > But it feels like it spoils the fun if I write the commit...  Anyway:
>
> It=E2=80=99s fine. I am still in the learning process. It=E2=80=99s also =
good to learn experience by comparing your patch and my patch.
>
> >
> > regards,
> > dan carpenter
> >
> > diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> > index 25f57c14f294..dd357abc1b58 100644
> > --- a/sound/core/control_led.c
> > +++ b/sound/core/control_led.c
> > @@ -740,6 +740,7 @@ static int __init snd_ctl_led_init(void)
> >                       for (; group > 0; group--) {
> >                               led =3D &snd_ctl_leds[group - 1];
> >                               device_del(&led->dev);
> > +                             device_put(&led->dev);
> >                       }
> >                       device_del(&snd_ctl_led_dev);
> >                       return -ENOMEM;
> > @@ -768,6 +769,7 @@ static void __exit snd_ctl_led_exit(void)
> >       for (group =3D 0; group < MAX_LED; group++) {
> >               led =3D &snd_ctl_leds[group];
> >               device_del(&led->dev);
> > +             device_put(&led->dev);
> >       }
> >       device_del(&snd_ctl_led_dev);
> >       snd_ctl_led_clean(NULL);

Hi Dan,

I tried this patch, and it still triggers the memleak. My
understanding is that the device object is already freed in the
snd_ctl_led_sysfs_remove.

>
> Does this patch mean I should add device_put in the init and exit functio=
n other than snd_ctl_led_sysfs_remove? This will cause device_release bypas=
s the release method checking?
>
