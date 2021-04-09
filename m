Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFE935943A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 06:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40DC82A;
	Fri,  9 Apr 2021 06:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40DC82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617944231;
	bh=6X9RKh7MGziFFyUsymdEzlHdR8Y7MUs5chJpm9vRSus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MfuTYnF8OvvQLoj3EyeDVByZXY9L4D8VeQBZg8TDvcTtRiztMpQfp8nlexNeGX4Sw
	 AG5546DQUOGobnuySIzBKHiQJGsyvUZBeUbl5zQzW+PILO69c5am4lK02Kipcv2R6M
	 m87hf8JoZM6F3JIzK/RhUsDGesIwH/FI8CPQM6o0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3EFDF80168;
	Fri,  9 Apr 2021 06:55:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8620EF8016A; Fri,  9 Apr 2021 06:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA44FF800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 06:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA44FF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IdP7R1vD"
Received: by mail-ej1-x62f.google.com with SMTP id g17so3820196ejp.8
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9xW0MpvQFiDe2cxnaLqp4rUK3SPa2tmBE39DSBDj2A=;
 b=IdP7R1vDEi2YYVW5mUFx9ZNLM7IIK4SRkBOztvkmjfz6hCbPFeDh5oP0wOMgl+CJ0H
 tSFpfClFs6AkuzNywv6jxD2Dsd4sKMWi1c5c7mJmidGj4buJ1rUaOs9UfoxWKkA3+mIL
 l0kfeZUZEtCSGCWpFpJ3Q8Cpanl9dHEsDVr5Q8QEDO550mJrLoJr/Tvsnc2XFbwLk6Hg
 rT1j+Va4UL3+0NU1BdH838cb7mXbDi/B4SKJVx8A68sQRZw4rkKNlo5ye9azWxqFowgP
 sPhgWQNZjoK1Dr5SywKAjhh33sC+Gh1Xy0fDJExqUEFCNnwDE4mZ7pu3wdmUEJzOJfmS
 6uSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9xW0MpvQFiDe2cxnaLqp4rUK3SPa2tmBE39DSBDj2A=;
 b=jNJxtQiX1OMDC9zbZFr5lzbJBGqhKo2S1cMlfX/id943XdEdyfZJ6WwUCJ8e2/kyT4
 YI66ITOEHoLU1wnxCBjqf2oQd7ace8edplxf0rsqz0FqnfEznqlyZnrixhKE/jWe9CGH
 bQK90ek6kAgizZT679KEs4RQDjaaQDRb3LL23Encl8zIcMS0KVB48nJBEMql9U6A8hRZ
 8s3O0MABn/0akk0Vsd4WFBPcD1Su3lCCYN+w3/oBW0HT/B+C7zV/wj4f3SyaBsV9KP5J
 QU1aFvMTjMPUtX4IshLRsmtYZe52vM+wow5gj8ddjeWyhk2FkzPWtNDLbxpxZLhkmH7R
 g0YA==
X-Gm-Message-State: AOAM531EUOplprRZKCxK5YMC9C+GrGfhooCHccChCno5oU6xM4TfH+v7
 frGsuuATuB034fx4OZakR10p1tBGLUDHDAHeldg=
X-Google-Smtp-Source: ABdhPJwPGPvO1esoBpK32PeBHfnf1IqJT5DP/uEymYEs2UXeHtWtt3e4a+qoUNvzae7Iwsg9z01FEmAIFqW+V/WJSX8=
X-Received: by 2002:a17:906:f9c3:: with SMTP id
 lj3mr3533404ejb.134.1617944136742; 
 Thu, 08 Apr 2021 21:55:36 -0700 (PDT)
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
In-Reply-To: <CAEsQvcvUJ0p4bPLJhzppJR-uFjoyOiu2_=QtAvMvNwPh9AfAFA@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 8 Apr 2021 23:55:25 -0500
Message-ID: <CAOsVg8q_5yWBOR6DROJT7=Xv=R2yVNWSEjt4MUAx0QpQ6Af14g@mail.gmail.com>
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

Geraldo, you've made testing kernel patches for me quite easy, so thanks to
you!  And I'm happy to report that your patch, which I manually applied
because I forgot to remove the "if (false)" change, is working perfectly!
I am now able to use the, minimally mentioned, Takashi UA-101 MIDI patch
with the UA-101 set to USB 1.1 mode, on the same kernel that has perfectly
clean Boutique D-05 playback.  The Takashi UA-101 patch is here:
https://bugzilla.kernel.org/show_bug.cgi?id=212477, just in case there's
curiosity.  :)

It seems to me, that since the UA-101 in (USB 1.1 mode) isn't compatible
with the "if (false)" endpoint.c method, it would have to be matched for
exclusion, assuming we would ever be able to more simply match with
Roland's/BOSS' Vendor ID of 0x0582.  I still think that would be the
ultimate patch because, as far as I'm aware, all new Roland/BOSS devices
use minimally-differing forms of this implicit feedback quirk.

Thanks. again, for everything Mike, Geraldo, & Takashi!

  Lucas
