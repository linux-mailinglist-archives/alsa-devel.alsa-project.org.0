Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D828E06F
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 14:19:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8436A16EC;
	Wed, 14 Oct 2020 14:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8436A16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602677978;
	bh=q3qdr+MKLtWAU4wR6KbIKXJw7z34PHaR3V7obr7582w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wvo1WoMed7yroSTCUuJsiGpX4E/NYYXRurM2XZj8TlgKHTTgMyld4bD4hEx5bCdwK
	 v8tZC5LeJhhyPH+LUCJiWwMLR+8pC0HFw6Od12XUFJ2aZ9+Q7p0SZSlGLXsBbzXzta
	 D1zhbGE+UMCxZVOXEtWqjyhZMAnCOMJqY5gIObIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30835F80118;
	Wed, 14 Oct 2020 14:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21A31F80217; Wed, 14 Oct 2020 14:17:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7860EF8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 14:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7860EF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="3oIsvH3a"
Received: by mail-ot1-x343.google.com with SMTP id s66so3217196otb.2
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FWWoT0Tm9VeHD+0AM/lZ1f6RB5boylO2rE11r6LyaO4=;
 b=3oIsvH3aXvxEjwowYBwsDGv8deQ1MEzDkO4h0Bk9XH2W3FwuJk/idOLQ5DITM/GOgA
 +6Na8COrsIcSD5GJr4Dc6djMA0q4FfqDAwq2Gblu/RNAakg3cVbfyErh2Fo5BDqEywI0
 3F67xIHwzqzTQfZ4I9tDX+TJfhJDzY5rKaAtjZ//wWs4kOomIyiLj37wWbFMdfC2Sj8/
 1hpT1wSEX4egx1OXrPpyXfSWlCDq3a9/eF9qcn09/zRatSRLm+Du5ly3f0FMBAEAVYbh
 h6emNlfqs11G0wr/XZegWVXsJ5HgetgrmmwuP9AMM/3Xbezd8tcfsNaOoF9Ixs8w1NEG
 7tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FWWoT0Tm9VeHD+0AM/lZ1f6RB5boylO2rE11r6LyaO4=;
 b=GtdI3CtpM8oFVoMjPYzFYB0rvPTUIQZyjWV1NlQsdt3tTNCiPim4ToU6xcH7iIA7R+
 hWjlzR1Y/fGRuLVjvYpTyYq/Gp0BTEQlyR4Jk45UY43AkBQS3R4BSshPS7gwSyZHRtig
 l89ilL7I/Tm6a01k6xdtUFr6NRkkSg2AMrLDDSWrA8g0qQKsLzIe9lwdSFYL9WDhD2mH
 sZCJW4VwIHYWY6W0NulMXJZeXyEpPmA7D+H5HTMdJVn3nuAjrDFWaP2LPUOAJBQL8RTW
 2vl92+MCt5AhCqzk4xjZGhf8KiralVJ0QaLprAzsoP3MGFPjUgKHEJt3CUkq9wdJrTcN
 od5Q==
X-Gm-Message-State: AOAM533aDl2aseiFyNqADyz9k7TN4eQRy+XMAUhcvy96ECg8Ub3p6rIt
 oqYh3RGIgTVXNSMAeEDb3fu+xa/ROcD6O62wZ4jfOW6GcC4TsrJF
X-Google-Smtp-Source: ABdhPJxtkgVeLpjwYD39W5Miy2Zj9ElaFgdClKRaXRkwjralCruLdFWZsgVbLjKzvz4eEfzm17N5EF0vfBP20O9g1Sg=
X-Received: by 2002:a9d:1b06:: with SMTP id l6mr3097870otl.313.1602677866248; 
 Wed, 14 Oct 2020 05:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
In-Reply-To: <s5hftjriy1q.wl-tiwai@suse.de>
From: Mailing Lists <maillist@superlative.org>
Date: Wed, 14 Oct 2020 13:17:35 +0100
Message-ID: <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
 Katana amplifiers
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, Mike Oliphant <oliphant@nostatic.org>
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

Following up on this, it appears there are a bunch of the newer-generation
Roland/Boss devices which need similar treatment.

So far I have tested the GT-1, the GT-001, and the BR-80, and others have
reported the RC-300 as working with similar modifications. I have been
using the following change to the code in pcm.c
set_sync_ep_implicit_fb_quirk:

    case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
    case USB_ID(0x0582, 0x0130): /* BOSS Micro BR-80 */
    case USB_ID(0x0582, 0x0138): /* BOSS RC-300 */
    case USB_ID(0x0582, 0x01d6): /* BOSS GT-1 */
    case USB_ID(0x0582, 0x01e5): /* BOSS GT-001 */
/* BOSS Katana amplifiers and many other newer BOSS devices do not need
quirks */

There's probably others too, such as the GT-100 (I believe the GT-001 and
GT-100 have similar hardware).

My question is, should this just be submitted as a patch to pcm.c or would
it be better handled in quirks and, if so, how?

Or something else?

Personally, I dislike the approach of hard-coding exceptions into core code
as it seems that's what quirks are there for, but there seems to be a whole
bunch of exceptions in there already.

Cheers,

Keith

On Thu, 17 Oct 2019 at 09:20, Takashi Iwai <tiwai@suse.de> wrote:

> On Fri, 11 Oct 2019 19:19:36 +0200,
> Szabolcs Sz=C5=91ke wrote:
> >
> > BOSS Katana amplifiers cannot be used for recording or playback if quir=
ks
> > are applied
> >
> > BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D195223
> > Signed-off-by: Szabolcs Sz=C5=91ke <szszoke.code@gmail.com>
>
> Applied now.  Thanks.
>
>
> Takashi
>
> >
> > ---
> >  sound/usb/pcm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> > index 33cd26763c0e..daadb0c66eee 100644
> > --- a/sound/usb/pcm.c
> > +++ b/sound/usb/pcm.c
> > @@ -348,6 +348,9 @@ static int set_sync_ep_implicit_fb_quirk(struct
> snd_usb_substream *subs,
> >               ep =3D 0x84;
> >               ifnum =3D 0;
> >               goto add_sync_ep_from_ifnum;
> > +     case USB_ID(0x0582, 0x01d8): /* BOSS Katana */
> > +             /* BOSS Katana amplifiers do not need quirks */
> > +             return 0;
> >       }
> >
> >       if (attr =3D=3D USB_ENDPOINT_SYNC_ASYNC &&
> > --
> > 2.20.1
> >
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>


--=20
--=20
Keith A Milner
