Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FAD35A6BD
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 21:10:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369A315E2;
	Fri,  9 Apr 2021 21:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369A315E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617995453;
	bh=ggqZ5kySUiZoYvGtCly43yWqXySBndp+6qAQlFZPKZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5s0Y0tL0/EALWohJ2ey1KZyZYa41iwEqI1Su6VRulRRG0ugu4K64LPp15koEcD72
	 Y1cNQV69BDLVp54HLN6pN4rAdttiGbp9ZCySXJVuk09XgQQLtxnja8rN9T/4oOUt16
	 j+WSSq+zLW36qOFbuBqfqJEUIsSe18V1Kqzzbut0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E079F8016D;
	Fri,  9 Apr 2021 21:09:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C785F8016A; Fri,  9 Apr 2021 21:09:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1EABF800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 21:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1EABF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eecHIB9M"
Received: by mail-ej1-x62a.google.com with SMTP id n2so10276632ejy.7
 for <alsa-devel@alsa-project.org>; Fri, 09 Apr 2021 12:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pIF0jIppNhaigCYUffRniAiSSvrvuNPK80wMIKkORuY=;
 b=eecHIB9M0XYmzXGTadzjCfGHXDfKOVE9mCBIQRIISJ6MzQVROLvwk8M16ngLCLbatU
 IJjYcXSefriH+xU8N6pAlh6B8D9dm8aNuLLtieCad84gW8Tx2BkPrygkQ6j2o6s+AZso
 hE+chZUTycsunu5T2NK8OflbFuXim6viYbqeTEaPgoNFw8SIb6uJViec0tZHe4mOEXN6
 JqfUD3qGX0//EXe+GN+fM/PfPEje1AL65xDzjn+7G3V+nSC69icAq1inKaHiarV83Tlh
 +GXLPsaaizQr1yti6+WVuaZZ2Hi12/WMCxbwU+gZwrzLl31NtmoCXVNoN9P7s+h8lB8o
 glbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIF0jIppNhaigCYUffRniAiSSvrvuNPK80wMIKkORuY=;
 b=Tj7vORk9N2R3nkK9KEl+Avujcpf7XuN4+TtM6gCtMVupLH3FDSmc/URZ2E7Lt+HxqW
 qnpQR8K3XqiPdXLOGTP6WrqORXe4XphDD0AZz5g66UqIhqF739Zlitanj6kjjnZAf1Wm
 HrC1buNgFuILDrcQUe7udsfN5foVvcZ7xh5c1TInUcJ1rzKvfQ5B4gNibWf3bFKxFNMB
 LmS5yt/j5c/PuWXbW+f1yKBhPGcZ6rQHuRQSUmVjPa12CpeSLXV8Qn9YuKPEFK0SsWXN
 s8q+wEKdGcLz2XyntT7ngdacYc5OBH4iLFtiQKM2RXDlKgwHwqlrFKp9ELY+T1xS8Quf
 Sttg==
X-Gm-Message-State: AOAM530UudUheX6oixNiOSCWNvIBOj+SlRH/DF51woxW6WcwffsxAGhg
 aGm07mKhKlflqqFFD7l0f8ZyQEl2CeVzPjKFghs=
X-Google-Smtp-Source: ABdhPJy0fsATiSv4E5gUZXb8zNX/7gBAggNte19o4M487SZMz8QzeeOzr5us6MKImjcyzb74KhutGTUE+Nt8/35jOPY=
X-Received: by 2002:a17:907:20f0:: with SMTP id
 rh16mr6009050ejb.320.1617995352035; 
 Fri, 09 Apr 2021 12:09:12 -0700 (PDT)
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
From: Lucas <jaffa225man@gmail.com>
Date: Fri, 9 Apr 2021 14:09:00 -0500
Message-ID: <CAOsVg8r85TsJypOSm5ZRv49uv+v=MZyNONe32AgGZL0fbYNayw@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Mike Oliphant <oliphant@nostatic.org>
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

I wholeheartedly agree with everything you wrote, Mike.  Takashi is the
person who knows best how to implement these changes, and is definitely the
most capable.  I will get back to you about retesting my other Roland
devices with this trick, although I only have a few of the many devices I'd
ultimately like this solution implemented for.  Also, I haven't noticed the
sync-related clicking with the other devices I own, but I'm confident they
won't be hurt by the change.  I'll let you both know, though, when I get
around to testing them.

Thanks as ever,

  Lucas

On Fri, Apr 9, 2021 at 11:47 AM Mike Oliphant <oliphant@nostatic.org> wrote:

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
> Mike
>
