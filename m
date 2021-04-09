Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC8735A6A2
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 21:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE02168C;
	Fri,  9 Apr 2021 21:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE02168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617995149;
	bh=gPyYLF8usTTpF67rVyHAl7PEJECF8Ju92h+zXdlsp24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEaHeqgIxi+GCYMimQvs8I5PjL+88WftzTQGiFUIuy9j0oSN1RBqI31SdplbfUp4f
	 o2D9P4EttQApJFbc+4m8NqxZg3XDhVUmVTlH7UZCImTWcADGS52oOMXcd/Csb/gJEs
	 CLLVtRIqeH/mwGWkj2BMIkG5RbPv38Eoo10nBx7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D65F80113;
	Fri,  9 Apr 2021 21:04:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D22CF8016A; Fri,  9 Apr 2021 21:04:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODYSUB_1,PRX_BODY_29,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FB83F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 21:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB83F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ivZ6Emim"
Received: by mail-qk1-x72d.google.com with SMTP id z10so6868638qkz.13
 for <alsa-devel@alsa-project.org>; Fri, 09 Apr 2021 12:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mMrVsiS7eFjHD0mN6YmnO2GtxcOxC4+rOtFhqnDYBog=;
 b=ivZ6EmimTNP5pHCRd8Y/YIv7b83ofZG9Ppp2yTSYJ6fXZRMcdP/YcBMFRataueqQO6
 dw9XXVkevXLWckLMaGgsjA1VNzkfdh/rk1FQHc8z2EgPc91an4qqHeCocLiRlzYBYlhu
 x2bzSNFo/eEQlh/R0D+Gr/S/kHWPD90tFlmgdolTLx684qnK2Z2up3E1Gi04Ja+PPaEb
 qEIsMSRV7uib4OzlJpwtA/2a9fABfIdHPFCIja3IXVe3K9JAqpSokxFzi2gPsWwG/f/Z
 yrcU3igEWuuJYzgIcFGTlnPBuKMHASJPt/vvXltpEvaFZlZkeur/wxitSgytVHYqG2qx
 mVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mMrVsiS7eFjHD0mN6YmnO2GtxcOxC4+rOtFhqnDYBog=;
 b=cbCtHwTdzK22cuv0gKEL5iU3suLdGCajKWVZRQaNmXvBogvaUQczmjz3kOBpHvP+fD
 9wRHiCRIra9yrjksemTpGBJL0A/u5bxRXRFjr9+zKXqgCtk8BzZEAf/M/n2Ywn5Bd4pX
 Lp8UK2Mx4BjF1OE9/HYPj4URSoomf+9KhWtS/mG27b0u6//3qQDtUWKiwaep3R64TSE/
 6+l8LfyDh53r48p5wUlf6PEjmqMlftdtD+0UfSlKvqBRAg8WGDFeUGquhKWz1ePT+S/S
 FptMXekHEm9KHz4vJu+FMZSQ7Gl2LED2C3BidTlbV9MqAfhqC6HowCNk2a2o6Yq7fo43
 jT3g==
X-Gm-Message-State: AOAM5336FFoEbzqkaV3ZoORVsKOPOnCHJPYSuQu3Dk6uUMwhRNpEjCj/
 JwlFFbEA3NRnFCLIQJooURqhoaxCm7LYa6AJuQg=
X-Google-Smtp-Source: ABdhPJy2ivQ9e954iSREbLkaqurxFBLprmK53r+Kj5dCUoRWoavkKmC6IYEEh6gVgl161CsesJyxOVFl5tLfROuSewY=
X-Received: by 2002:a05:620a:24a:: with SMTP id
 q10mr8262243qkn.366.1617995040096; 
 Fri, 09 Apr 2021 12:04:00 -0700 (PDT)
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
In-Reply-To: <CAHXb3beJxepHYraSXGCB4n9RBbBnLo05dcG=7nED1b_ZGRrMaw@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 9 Apr 2021 16:08:41 -0300
Message-ID: <CAEsQvcuwKtAHpkJ14jF7fFsNYCoBZPNXfbZBFv+x33kRSaTFpw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Lucas <jaffa225man@gmail.com>, alsa-devel@alsa-project.org
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

Em Sex, 9 de abr de 2021 13:47, Mike Oliphant <oliphant@nostatic.org>
escreveu:

> Hi Lucas,
>
> Your observation that the Roland D-05 still needs the capture feedback
> made me try some more testing, and I think the GT-1 actually is the same.
>
> I use my device with jackd running for both capture/playback at the same
> time. This works for me without capture feedback enabled. But, it turns out
> that just doing an "arecord" without playback fails. Enabling the capture
> feedback makes capture also work without playback (and everything else
> still works perfectly).
>

Mike, you were incredibly lucky to have posted this patch in a window where
Lucas saw it and was able to test it. It will save you countless hours.

It makes little sense however that arecord should fail when used alone. I'm
not an USB know-it-all but by my logic if you're not using the playback how
in Earth is the code getting feedback from it? Can you see what I mean?

My suggestion is that you check the dyndbg logs to see if the capture quirk
isn't just forcing your device into duplex-mode. Maybe these devices aren't
meant to operate outside duplex, it's hard to say, their behaviour is
esoteric to say the least.

I mention this because your lsusb -v is quite clear in that the implicit
feedback endpoint is the capture one.

>
> Given this, I agree that it seems likely that most, if not all, of these
> Roland devices work the same way. It would be great to get more devices
> tested, though.
>
> As to an actual patch, I think it is probably best left to Takashi to
> decide if he is comfortable with making a change to
> snd_usb_endpoint_start() in endpoint.c, and if so, how he wants to make it
> conditional for devices - whether an ID check in endpoint.c, or a flag on
> feedback setup, or some other way.
>

Mike, remember that any criticism from me is always meant to be
constructive and to improve the quality of your patch. I do encourage you
to submit your patch to Takashi Iwai when you are confident that is
polished enough for mainlining.

If he decides to change everything you coded it's his decision and there's
little we can do, but the point is always to make the regular users' life a
little easier with devices that just work under Linux.

Thanks,
Geraldo


> Mike
>
> On Thu, Apr 8, 2021 at 9:55 PM Lucas <jaffa225man@gmail.com> wrote:
>
>> Geraldo, you've made testing kernel patches for me quite easy, so thanks
>> to you!  And I'm happy to report that your patch, which I manually applied
>> because I forgot to remove the "if (false)" change, is working perfectly!
>> I am now able to use the, minimally mentioned, Takashi UA-101 MIDI patch
>> with the UA-101 set to USB 1.1 mode, on the same kernel that has perfectly
>> clean Boutique D-05 playback.  The Takashi UA-101 patch is here:
>> https://bugzilla.kernel.org/show_bug.cgi?id=212477, just in case there's
>> curiosity.  :)
>>
>> It seems to me, that since the UA-101 in (USB 1.1 mode) isn't compatible
>> with the "if (false)" endpoint.c method, it would have to be matched for
>> exclusion, assuming we would ever be able to more simply match with
>> Roland's/BOSS' Vendor ID of 0x0582.  I still think that would be the
>> ultimate patch because, as far as I'm aware, all new Roland/BOSS devices
>> use minimally-differing forms of this implicit feedback quirk.
>>
>> Thanks. again, for everything Mike, Geraldo, & Takashi!
>>
>>   Lucas
>>
>
