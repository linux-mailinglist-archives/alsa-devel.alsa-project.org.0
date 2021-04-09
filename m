Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A2135A3F4
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 18:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEF531687;
	Fri,  9 Apr 2021 18:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEF531687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617986959;
	bh=rnzez1ODrswh0RO2qc16RQ/7aeWLA3JZKgoB6cflseY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h3rioNKJCMIKtZl4unIW6TXrYSBwaNa6QtA8Xv88ygZAK9ZfXmda9QqcODxy98bOM
	 0m9mfojPRgReImcz/tluA5/fkcm63J80Ry768VuLjtSM0K/Rdxo7z248I0QPHKmtTA
	 YNl2p/tRPJ5sUsTCrBV1I5lyqUpsrJOoirX+4c3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52A41F800EE;
	Fri,  9 Apr 2021 18:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20972F8016A; Fri,  9 Apr 2021 18:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED1BF80113
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 18:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED1BF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="frBHsOFJ"
Received: by mail-yb1-xb30.google.com with SMTP id c195so7257005ybf.9
 for <alsa-devel@alsa-project.org>; Fri, 09 Apr 2021 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvwGbn1gskPI1Il3c4qJ/NwxvfKaM5EZuMBeAwwegr0=;
 b=frBHsOFJEEHn6rjR2Ul9Y0MYCSh/Q2cYgpMmYgSkgjxlxDwe/+khckxyFvAjc332jz
 YoUvFu2Jj/eICMiGd2w4b0I5naGsQepTLkn6ex8tk8kyPmyD4lkKF5qTAVVxrQd4ZY37
 MaK6TfY2zgXhbxusOTZlgfYmEBozIUy5o9XVFXleKqtLq3EcNflFfvsKyWWjZr9yiPXd
 u++tN3OFcvuEwZdC6jJT+2T7aNJdqqJvDSEaKuSRdH29eRtbBeDu2ALt0M0AyH2zVrnS
 4p1lgsrzw1Hv7SrsbDWkh9D6Rbllj8hBOnjQqQmnd6QlINKzHrOA49+AOYb5FBIWDL/6
 bdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvwGbn1gskPI1Il3c4qJ/NwxvfKaM5EZuMBeAwwegr0=;
 b=nQkgZmuN38SdZbA45niV3sdg4/Hn3uUAfRcmAtqW4iFt2WoYt3CPuzpRrTn7Ec7+7H
 AqY0XnvRvJAwqSkt4nfv0lUKM30RAAvgoBHo8He8HnFjmywhqdGf2ELNXqF1XnNteWNX
 SjeQvTemZvW6EAdnBPQ/Ot5xdtZ2xBQZ1TtBqXF+C2Fmiw46UkgLJNBCYr2EG6lJX/Lk
 SqcFm4mXvBNfkxT3WabzOkXXE7HxLtd5FYJztmUs3/hsk1aPjwnbjWz2IMn7AntQS36q
 V5kflsNfycldlvoWykFVEJfPRfseJEgpXXG1H1m9h1edCh9P8moOqQTyTapBooEGYdeG
 hT/w==
X-Gm-Message-State: AOAM532TIGFVd6RElKkaYS3suAa/Vc6vkSnN0lC1FxhuSvcOk3wEIwWj
 Z9wLdhLPT2ydqotBNhNCv6bhS1JqEJ59XYpf0RnNeg==
X-Google-Smtp-Source: ABdhPJzM91wlrolIheV8RsEUrxOlEyknVFYVNaPkqbGrwJE2AWVc5mARIXr4aMYxjIGRIu9gla+plXAumUtBEWide20=
X-Received: by 2002:a25:946:: with SMTP id u6mr4930256ybm.144.1617986863686;
 Fri, 09 Apr 2021 09:47:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAHXb3bcpUBH9F=K9npwK-xO5sX+H11EV0_Nc7Otw7o93M=DKYQ@mail.gmail.com>
 <CAEsQvcs8HasvcJm0oEr87gNPxB6o2Km_NtAojTq+VkEX9EZd0g@mail.gmail.com>
 <CAHXb3bcMRrtMtfoHOCikNAkXxemnScfTPvJ702N_z6o5xj-G5g@mail.gmail.com>
 <CAEsQvcuo0g9STXn1d-Wux0TOH32mc88=Lw44r0ng+QocztcG3Q@mail.gmail.com>
 <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
 <CAEsQvcs7y5Gr9X2vNkMHZU9akJAuBw7hE-XKcYKj9CJdO=GM8w@mail.gmail.com>
 <CAOsVg8rrJMdzADsRpjTOmi7Dk23bfej+KRFQWD77s9pmNW=g5w@mail.gmail.com>
 <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
 <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
In-Reply-To: <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Fri, 9 Apr 2021 09:47:34 -0700
Message-ID: <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Geraldo Nascimento <geraldogabriel@gmail.com>
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

Hi Lucas,

Your observation that the Roland D-05 still needs the capture feedback made
me try some more testing, and I think the GT-1 actually is the same.

I use my device with jackd running for both capture/playback at the same
time. This works for me without capture feedback enabled. But, it turns out
that just doing an "arecord" without playback fails. Enabling the capture
feedback makes capture also work without playback (and everything else
still works perfectly).

Given this, I agree that it seems likely that most, if not all, of these
Roland devices work the same way. It would be great to get more devices
tested, though.

As to an actual patch, I think it is probably best left to Takashi to
decide if he is comfortable with making a change to
snd_usb_endpoint_start() in endpoint.c, and if so, how he wants to make it
conditional for devices - whether an ID check in endpoint.c, or a flag on
feedback setup, or some other way.

Mike

On Thu, Apr 8, 2021 at 9:55 PM Lucas <jaffa225man@gmail.com> wrote:

> Geraldo, you've made testing kernel patches for me quite easy, so thanks
> to you!  And I'm happy to report that your patch, which I manually applied
> because I forgot to remove the "if (false)" change, is working perfectly!
> I am now able to use the, minimally mentioned, Takashi UA-101 MIDI patch
> with the UA-101 set to USB 1.1 mode, on the same kernel that has perfectly
> clean Boutique D-05 playback.  The Takashi UA-101 patch is here:
> https://bugzilla.kernel.org/show_bug.cgi?id=212477, just in case there's
> curiosity.  :)
>
> It seems to me, that since the UA-101 in (USB 1.1 mode) isn't compatible
> with the "if (false)" endpoint.c method, it would have to be matched for
> exclusion, assuming we would ever be able to more simply match with
> Roland's/BOSS' Vendor ID of 0x0582.  I still think that would be the
> ultimate patch because, as far as I'm aware, all new Roland/BOSS devices
> use minimally-differing forms of this implicit feedback quirk.
>
> Thanks. again, for everything Mike, Geraldo, & Takashi!
>
>   Lucas
>
