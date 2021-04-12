Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B82535D3D9
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 01:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BEC15F9;
	Tue, 13 Apr 2021 01:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BEC15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618269659;
	bh=hSku3cONblhSoVowrQFiLeeZD8Vc+tN7T6ffue1pFoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=feSThEqDhPCiFOEA0YNmIx4/NNG6o2oQRLHAUqihHZ9vf1ANl77LftBKTRBbd/vSs
	 FYvPLjSTrNv59pF3IwJjMXRJOFsayFv40/azMYJM8ULJktZI6b5toW0vZuK0F/OEtz
	 Rt0uJSh7ftbqVjREXmndgmf7iV18vWFxjZUagwCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A95F800D3;
	Tue, 13 Apr 2021 01:19:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F301F80269; Tue, 13 Apr 2021 01:19:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15CBEF8013D
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 01:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15CBEF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BAstBvsM"
Received: by mail-qk1-x729.google.com with SMTP id 130so1928245qkm.4
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 16:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e2Md7zEvsDYJPxvHgiGkfOkLuXs5x54Yk8Hn6ml8FQQ=;
 b=BAstBvsMA+JyaByjHQAuQKrA5phbs8jykQYTtOEK/VsliAYe7YTPjR+HKSNeHTGGBA
 vfV7g/uvZW9V+72eO91U+G2lOcS6XBzpBCNmbG0jz4hEOR1ZbkLLcebBGdlgmWDOn4Bx
 To7v4UI6Rc2jS66pEEEtBxIBPSZh1Fez5eqnGdIgzwF80Eive4rPxzokgVg/IoDs6FDx
 zbpHJ91gdu6sKx5RG6JG/09tnLv6WsRgMpUBQA+rE4qnIgiZG+Fseb8E+f9L+cYz9Ecj
 22hd4S0XlE6dXSklF7fH5hFjXojivZGAKwLfbq1fRCSshfEzpwAWvuKf3jPcTHUhETUR
 giRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e2Md7zEvsDYJPxvHgiGkfOkLuXs5x54Yk8Hn6ml8FQQ=;
 b=La92PRSHE/4Zablv7BdNwHvoXbB/D+BAhsS1frm9uDllvZAEPhojopW9IUzjHNGZIL
 8KXtQVNt/RE+rpXGvAlwLH13tFU+czVp2H+11tG1QXHb/X5x/B/ivr9xzBvHrGi2wDsf
 MLbj/PMS3b10tciuFJ3rq3V4T4lcDZUIEomXoQDoUn5tJ+uF4AQ6x2jmZgzyHMy0oMoi
 f0IOBKOSgP+kuBoKwn04kjE0uo4cQb2UcQjbD3p98lDhuwlAoNmsRvTYLeN4IT33YuYd
 knro9fHjJSQPxBOTkQZ0d6oKOYoBuUoSTHRJn42sTx8aYsLrsir+eTAhATwwKukuthkl
 OfNQ==
X-Gm-Message-State: AOAM530rQ121PB7HnFK4cE59hByZ/qAtZrPmnICrEd7uQ2zMOcWAFpsW
 AKmocupqnoxxFOd/Z5Hd/AftlD/1AxKBmtEeQ1Y=
X-Google-Smtp-Source: ABdhPJwyxldj4OV5BKrIKd0OIH01sxNrw9n/fvVmy4ntJ1G5IclrtSukHy/Z5xl20ZWPGNFVQmsJfF9obVUVpIZTAHY=
X-Received: by 2002:ae9:f40b:: with SMTP id y11mr12256810qkl.250.1618269563387; 
 Mon, 12 Apr 2021 16:19:23 -0700 (PDT)
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
 <CAOsVg8oEqEsDVA67s2OoHbvLgTy5wYjwBOTOJeX+uS29nPf+kw@mail.gmail.com>
In-Reply-To: <CAOsVg8oEqEsDVA67s2OoHbvLgTy5wYjwBOTOJeX+uS29nPf+kw@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 12 Apr 2021 20:24:05 -0300
Message-ID: <CAEsQvcsUTchyaDqp+1VOnJuREP9L27JkG90pY9aD3TBLWaAdSg@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
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

Hi Lucas, I'm happy my suggestions lead to you actually having fun with
testing. Testing can be boring sometimes, but it seems you had the time of
your life :-)

As always I commend you for your effort in detailing your tests. That's
definitely important.

I hope you, Mike Oliphant and Takashi Iwai manage to write the best
possible patch. Of course there will be room for improvement as more people
test their Roland gear on Linux thanks to the three of you, but such is the
way.





Em Seg, 12 de abr de 2021 02:58, Lucas <jaffa225man@gmail.com> escreveu:

> Thanks a lot for the information about jack's use with alsa_in and
> alsa_out!  The multiple card use issue is the main reason I don't work with
> jack often.  Ardour not displaying unless I change my gnome theme to
> "HighContrast" before opening it is annoying, but I like the command line
> tool jack_capture as a simple, good alternative anyway.  I've long ago
> decided pulseaudio to be a downgrade from ALSA, but I find it working okay
> with my modern debian install.  Because it's functional now, I already had
> tested each of these devices through gnome's "Settings"->"Sound" controls.
> It gives an input device level display to prove that's functional, and a UI
> to speaker-test for output devices.  This all works as expected.
>
> Anyway, I just used alsa_in and alsa_out with jack due to your help, and
> that is working perfectly too.  It's pretty fun to be able to record my
> from my R-26 as a microphone voice-over for all my other instrument device
> tests.  I did need to post process with audacity later to compress the
> input levels and remove some accidental loud feedback, but it works
> amazingly.
>
> My UA-4FX usual sound card was the default as "system" to jack, so I
> really was converting everything to 48 kHz, but that's fine for this test.
> This is because I started jack with qjackctl using my previous profile for
> the UA-4FX.  I had to turn the UA-4FX's bottom "INPUT MONITOR" switch to
> "AUTO" (off) to avoid feedback, since both its input and output is
> connected in the test.
>
> Then, here are the commands to get them running on jack:
> alsa_in -j INTEGRA7 -d hw:INTEGRA7 -r 96000 &
> alsa_out -j INTEGRA7 -d hw:INTEGRA7 -r 96000 &
> alsa_in -j R26 -d hw:R26AUDIO -r 96000 &
> alsa_out -j R26 -d hw:R26AUDIO -r 96000 &
> alsa_in -j VG99 -d hw:VG99 -r 44100 &
> alsa_out -j VG99 -d hw:VG99 -r 44100 &
> alsa_in -j D05 -d hw:Boutique -r 96000 &
> alsa_out -j D05 -d hw:Boutique -r 96000 &
>
> Here's how I had them all circularly connected (using qjackctl):
> system out->INTEGRA-7 in->INTEGRA-7 out->R-26 in->R-26 out->VG-99
> in->VG-99 out->D-05 in->D-05 out->system in.  "System in" also had a
> physical line input connected from the analog output of my Roland SC-8850,
> and "system out" was connected to my amplifier and speakers from its line
> output.
>
> I ran a ~15 minute jack_capture recording this way, and verified that all
> devices are, at once, capable of both capture and playback (duplex).  All
> except the D-05 have to be configured to loop input back to output, each
> through slightly different conventions, but they were all figured out
> eventually.
>
> This test has delayed my testing of the UA-25Ex, but I'll get to that
> next, and this was, very likely, more fun.
>
> Thanks again Geraldo,
>
>   Lucas
>
