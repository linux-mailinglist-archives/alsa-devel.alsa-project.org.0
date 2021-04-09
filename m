Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C793591B9
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 03:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0EFE1616;
	Fri,  9 Apr 2021 03:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0EFE1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617933392;
	bh=op9xTUvTfchK7qhQJmbuN3GweXfMDz45HFdw7uVs3vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXiCCQh+mY4ERAJkG2bNRMOovpybATrm7PG4SccGeRQeD6gh8qAB8hqKG8zV3yG1/
	 +kJaSDtsVTSpBhT+Xmu9pxfPshoFTCM+gShNY7uU6P6NN7atBkaipgSgwaAAElKOkx
	 jbtYL0nPzivoHxNQPqLdvEm1Bjc2VH7lVSReSoCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74FDEF800EE;
	Fri,  9 Apr 2021 03:55:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 312C9F8016A; Fri,  9 Apr 2021 03:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3C7CF80113
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 03:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C7CF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SFZXsg3a"
Received: by mail-ej1-x631.google.com with SMTP id hq27so6125895ejc.9
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 18:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ccHaUQZWplZGIJdCuih/vxNxIxVBdz8LvJHBDR2EgY=;
 b=SFZXsg3a9s2mUww1W3CTDXp17v2jFzEhzd8N7sMzSp4AvmOR1RrDzUtskTvu0VlF5N
 S82Bn8NSoN41lUAhS1/Gv6jG7C99WiGC1kglYZ8bokquN0/o76GIaHWA2Ts0Ud1rILad
 PZZYT2YCsYysxLazLt02qeQZhBsF4CVIuAtOD1EnhyxR9jbQBoLFSEm+c0yZ5YNti5Pd
 1g7DMOROb4pTxWnmPsUhbIUDPe3Y5AY7Qx3ilw8fFFk3qeWJKRu/8WOGglv8luChUv8Q
 mIojaz3/euDyFtfMyypRIxj7qf/hmAEtOPmlZheYyy9ZVH1XjsN/kCYwB5pQgtAHcEgJ
 nXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ccHaUQZWplZGIJdCuih/vxNxIxVBdz8LvJHBDR2EgY=;
 b=CATMlfxC5zTEkPrmkeeku3UCWs4mk3jo2aH6kws1uppdM4mMgyoeDW15IDA8Y/rbZj
 leY5qGbMTdH31Frc7cEP/HtUaGXCfkfYT0Df/sTVNUmmfoZgwevXy89PfXUP1L86h/Fj
 +lmInZvfkRBafYc7zzhe3/1qyq1DwJ2KCqXncrY1UsqEjNKNu5YXEkaFVQK8sJS+WIEI
 NFh110rrtmtWOkV2/9IFlUwZbwqGK52ti+I6LvqMzXARTpcZBojngbLkaz3TgMxobhz1
 7qKt2EQXfIEBjgXiTx41Uz6lrTeHyXh8lA9qYMWzxKbM5dxBricOrZTO/hzPR5+6W/4o
 XtYQ==
X-Gm-Message-State: AOAM531CQaycft7Jg//HExtScR3fUw/zW7fI8jHUTA+RITFiOgMqm5kj
 pt9YCTmQ9k3TGYnlxH9ec1CE51KWAYMgK93ZhHY=
X-Google-Smtp-Source: ABdhPJzhJfnsTC+skgzgOCHG5dRzugk7Mq6T4BRf0cYrcJ4DyOi/NN/b10fgj2RNqdXBSozUn6mQwdfZSySsPLJh05A=
X-Received: by 2002:a17:906:2793:: with SMTP id
 j19mr14184259ejc.205.1617933291547; 
 Thu, 08 Apr 2021 18:54:51 -0700 (PDT)
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
In-Reply-To: <CAEsQvcuo0g9STXn1d-Wux0TOH32mc88=Lw44r0ng+QocztcG3Q@mail.gmail.com>
From: Lucas <jaffa225man@gmail.com>
Date: Thu, 8 Apr 2021 20:54:40 -0500
Message-ID: <CAOsVg8qWkYnW4sYP5S5A=BWvQWeBY08DrC7JZ9nNF8_nrsNArg@mail.gmail.com>
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

Sorry, this is a question that has nothing to do with your last, but I
previously tried creating a patch for endpoint.c that tests based on
USB_ID_VENDOR(chip->usb_id), and USB_ID_PRODUCT(chip->usb_id) but they
aren't recognised there.  Do you know what I might be able to use there to
avoid messing with every other snd_usb_audio device?  Sorry, I just haven't
looked the code over long enough.

I may just try your quick recompilation method, as I realized it shouldn't
create any new files the package manager couldn't eventually remove through
the usual "apt-get remove linux-image-5.11.9".  Although, I'll probably be
rebooting anyway, since the last time I tried to "modprobe -r
snd_usb_audio" it refused due to dependencies.

  Thanks!
