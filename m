Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B435B9F7
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 07:59:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7109C1614;
	Mon, 12 Apr 2021 07:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7109C1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618207180;
	bh=+aPaGGXd0Avmpng4czfXeG3fxgGjFQuVWfPHFLozYIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWJkOfdbsNiL4VQXq05Oe4kmEHxqGG/1c3/Cz0pd5OXRiD5jlPPpFdOdkacS4okml
	 WRhl8nSY4EFZJudOi3+IEgMwQIgy0ga8RoRQJgr8/VXywTy4NzgvUuIA6sf3zxzTAD
	 juhpLXVOs/eYNTtuDO8PnSVyDsmS+5TIzJFMaIRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F3CBF80269;
	Mon, 12 Apr 2021 07:58:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B410FF80269; Mon, 12 Apr 2021 07:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04693F800D3
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 07:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04693F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dlTih46I"
Received: by mail-ed1-x52d.google.com with SMTP id 18so13559340edx.3
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 22:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lt+TWWpMyOb3biF1a9iQJyIakzgrkXlsH2aVosmAB/U=;
 b=dlTih46IsVriJSn1ITWLKnBsJ6tcBOqdu2FKsZbHox3tzXoFetDjedpRi0SbzK2QMw
 XPXT0AudIctj86m2C6tpk4srCN4n9ygjr8GKVRCnRXNxCkPI97wHiwuoe5IB2Z8OHArV
 ItQPkZiPwsojxNTY4ha622p7fFdGynILqgLzXc4q6JmpgDcDqHOATXGOn1VsVI7sNtaq
 2TEeDCT3WkWprTvySBo3kO2k0oDpIbHicW9iLHSI328aGWaGKe1Sq1d06VsuUpOBTiko
 StGC/+bAFw8BCwXOQ9SGkrNw2NzaPAH6ojwRTUIThlQeGURU8mnNBx7fGZJAzImeCIrV
 VyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lt+TWWpMyOb3biF1a9iQJyIakzgrkXlsH2aVosmAB/U=;
 b=t0hI3oMTbEAi13vFv93xmnOs1U0jgWXmU5db+L1MxhuaNYbjU86lVjOLNZbrIsIvLd
 ERkBeuIz5d4849zzIX6NfL8beGIleDIEaLKFydqv9iNQrii4RV6uI7Dllyl0HkLs6MkA
 BTbH6CRnda2pxTYU3HNE3FiKwGoMRdst89tiXaaytNT8WLJk0aW/H/KacbKUi7aQhW7s
 cBcZpfdPxd6VGKeelcKnHNylYgxUzWqazo3yU65zAidlaAKm3zjByZ6KKoV3vxb/uwQs
 Mew2GvO3DjD0UU6UQRnKrIpURxf1bIgOW62TZPiGJoedq7enptKELmxn6NuCT7NVIBzw
 ti3A==
X-Gm-Message-State: AOAM531T+qs/msaeLHFQX3Mk5PLwsJZNFWH8WL+OzJ4QHuxq+mL6wIX9
 vHsggvxLy8GOkn/jruvP3rxF7Vj2fGHxuS5Ri7g=
X-Google-Smtp-Source: ABdhPJwh+AoRjq0XdJfqqUCkKIXh4hbroXiolXatwXe6RStBSLdCx7B5FbDEude1L3RNQs6KUf38nFpeijy2OTt+2I8=
X-Received: by 2002:aa7:c7c5:: with SMTP id o5mr27489786eds.31.1618207081900; 
 Sun, 11 Apr 2021 22:58:01 -0700 (PDT)
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
 <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
 <CAOsVg8r85TsJypOSm5ZRv49uv+v=MZyNONe32AgGZL0fbYNayw@mail.gmail.com>
 <CAOsVg8rD==rjuVU0MR8rkp4VQi_6=UfO16huhsZx4-hM-su1xA@mail.gmail.com>
 <CAEsQvcuJF9D8nxbBXWbYKer5oTr7RbMQw9YiXzqb+Hof=gehCg@mail.gmail.com>
In-Reply-To: <CAEsQvcuJF9D8nxbBXWbYKer5oTr7RbMQw9YiXzqb+Hof=gehCg@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Mon, 12 Apr 2021 00:57:50 -0500
Message-ID: <CAOsVg8oEqEsDVA67s2OoHbvLgTy5wYjwBOTOJeX+uS29nPf+kw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Thanks a lot for the information about jack's use with alsa_in and
alsa_out!  The multiple card use issue is the main reason I don't work with
jack often.  Ardour not displaying unless I change my gnome theme to
"HighContrast" before opening it is annoying, but I like the command line
tool jack_capture as a simple, good alternative anyway.  I've long ago
decided pulseaudio to be a downgrade from ALSA, but I find it working okay
with my modern debian install.  Because it's functional now, I already had
tested each of these devices through gnome's "Settings"->"Sound" controls.
It gives an input device level display to prove that's functional, and a UI
to speaker-test for output devices.  This all works as expected.

Anyway, I just used alsa_in and alsa_out with jack due to your help, and
that is working perfectly too.  It's pretty fun to be able to record my
from my R-26 as a microphone voice-over for all my other instrument device
tests.  I did need to post process with audacity later to compress the
input levels and remove some accidental loud feedback, but it works
amazingly.

My UA-4FX usual sound card was the default as "system" to jack, so I really
was converting everything to 48 kHz, but that's fine for this test.  This
is because I started jack with qjackctl using my previous profile for the
UA-4FX.  I had to turn the UA-4FX's bottom "INPUT MONITOR" switch to "AUTO"
(off) to avoid feedback, since both its input and output is connected in
the test.

Then, here are the commands to get them running on jack:
alsa_in -j INTEGRA7 -d hw:INTEGRA7 -r 96000 &
alsa_out -j INTEGRA7 -d hw:INTEGRA7 -r 96000 &
alsa_in -j R26 -d hw:R26AUDIO -r 96000 &
alsa_out -j R26 -d hw:R26AUDIO -r 96000 &
alsa_in -j VG99 -d hw:VG99 -r 44100 &
alsa_out -j VG99 -d hw:VG99 -r 44100 &
alsa_in -j D05 -d hw:Boutique -r 96000 &
alsa_out -j D05 -d hw:Boutique -r 96000 &

Here's how I had them all circularly connected (using qjackctl):
system out->INTEGRA-7 in->INTEGRA-7 out->R-26 in->R-26 out->VG-99 in->VG-99
out->D-05 in->D-05 out->system in.  "System in" also had a physical line
input connected from the analog output of my Roland SC-8850, and "system
out" was connected to my amplifier and speakers from its line output.

I ran a ~15 minute jack_capture recording this way, and verified that all
devices are, at once, capable of both capture and playback (duplex).  All
except the D-05 have to be configured to loop input back to output, each
through slightly different conventions, but they were all figured out
eventually.

This test has delayed my testing of the UA-25Ex, but I'll get to that next,
and this was, very likely, more fun.

Thanks again Geraldo,

  Lucas
