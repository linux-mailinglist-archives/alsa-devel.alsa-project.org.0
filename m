Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0FD35950B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 07:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 715371616;
	Fri,  9 Apr 2021 07:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 715371616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617947942;
	bh=KvSK1qmDAP9RPGBAar78Oa+GkMVx7mV/GhIj+eBk0h4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZAW679LtwQNn/rpetxVkq9iAE6jscgAwo8af3fbcREwT0ZXAzVN1Kg8zWpMuoEfyL
	 gRgeVWQSkD5aCftbt5ghVg3ko1rfVYvZCiD3PYaoYagJMHYRoEEDbtwRrxIFz6yTh9
	 FgS9CxkjhmKnRzr1s2G2OUkf44p1/P/4rLdvVQ6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEFAF8016D;
	Fri,  9 Apr 2021 07:57:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 192EFF8016A; Fri,  9 Apr 2021 07:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, PRX_BODYSUB_1, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7153AF800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 07:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7153AF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tOjq9pR2"
Received: by mail-qt1-x830.google.com with SMTP id 1so3434762qtb.0
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 22:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tq5pJuxnupnqdMdmJTYo1jMNZm/uJmeJOhvZCkEEOlk=;
 b=tOjq9pR2YV1bFl/5bG3uR8iYbv1jEykyivgCAyEgK3nkRf2CifbPgOdwIDyV2SqEtg
 nZGl+x9PxK5v8bYEZPgSUjoeD2eApIwgbUroaalzh2wGpyuOQCTAlehmWeU+HQgR+ZrI
 0ZBb9aaYC1qKYG7fClQlwwLqnNywmpcxL6GKB/PLM83rKXT2kwHSMgxu0iNEFn9cyuhx
 l2+t7IPgzDDPsdbST610JkHYjr/VJsAefOauukj9BwlcUCldU1Q0bIiVg71barR2RmZI
 X0CKW3IlU1F6fMoLZJEnlQnTmZDqg3NmjTCFxifaqsOeeJiq0lujgFip3QCjk2s9ubTD
 QZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tq5pJuxnupnqdMdmJTYo1jMNZm/uJmeJOhvZCkEEOlk=;
 b=JiOn/PlyzTZhizAxpJ60OQ/aqKbx12mFO9m6u9z9ltfmO/QQfrvwdvTTv3AfH+4z7G
 cjlwG2wzsJhUn/qzbVVoC+rP41k6p2rbpQwCtXjkiUT6DcOAcRtOkRVaQTAt1RCXt8DJ
 +96f7j7tjxBmcNtTPXj+iAiIEjCSILBb7/lKJIaDycj4iZOU9XdsQLiNkgVj7t5ccvDW
 d5lHDVnUHX8BDziGhzwVTh7EH/f6wKDngP8mUl4pf5dhtEbj7rJKy6/JrW5LsE1f8FnK
 bvEhBB1868AGm0UXSjSZdoJwZxJJq/vYIvG4ya+cm3NauBmBJuGhcblyP7fwP2QwpBcz
 hZXg==
X-Gm-Message-State: AOAM532J2U+1zZ/0toOeak/12THMvVBjUPTijqikPFOzmvdLQfOsvxgB
 WM+W7VXapye7PeL3pRXRFqyxA2bfhUlYzLLwfeA=
X-Google-Smtp-Source: ABdhPJwRlFWt5Aob1OHPzIiy+igfkOUcYb6nVrpe9CoJ2ax1AMpJ+5b1LjGDzrgJHL6Jj3FXhyVplBEFqS4d12Z3gGA=
X-Received: by 2002:ac8:5c82:: with SMTP id r2mr11086280qta.201.1617947846533; 
 Thu, 08 Apr 2021 22:57:26 -0700 (PDT)
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
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 9 Apr 2021 03:02:06 -0300
Message-ID: <CAEsQvcvnF=YadysOXhETVy5=G+YSV13JM25LK-n-trMA3ECYnA@mail.gmail.com>
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

Em Sex, 9 de abr de 2021 01:55, Lucas <jaffa225man@gmail.com> escreveu:

> Geraldo, you've made testing kernel patches for me quite easy, so thanks
> to you!  And I'm happy to report that your patch, which I manually applied
> because I forgot to remove the "if (false)" change, is working perfectly!
> I am now able to use the, minimally mentioned, Takashi UA-101 MIDI patch
> with the UA-101 set to USB 1.1 mode, on the same kernel that has perfectly
> clean Boutique D-05 playback.  The Takashi UA-101 patch is here:
> https://bugzilla.kernel.org/show_bug.cgi?id=212477, just in case there's
> curiosity.  :)
>

Thank you, Lucas!


> It seems to me, that since the UA-101 in (USB 1.1 mode) isn't compatible
> with the "if (false)" endpoint.c method, it would have to be matched for
> exclusion, assuming we would ever be able to more simply match with
> Roland's/BOSS' Vendor ID of 0x0582.  I still think that would be the
> ultimate patch because, as far as I'm aware, all new Roland/BOSS devices
> use minimally-differing forms of this implicit feedback quirk.
>

I see what you mean, good observation.


> Thanks. again, for everything Mike, Geraldo, & Takashi!
>
>   Lucas
>
