Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0569B23
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2019 21:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9091669;
	Mon, 15 Jul 2019 21:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9091669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563217735;
	bh=33LZbnqZrilGWYHPKIqJ/I4pn/t/jUp/L4b1IRAyPHk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSf40Eo4hDEwyXOuDW5bPjjypvoEudNRD9R68cySpPm4BvlceNPKoDoOF5jLyYQV2
	 MWm+Q4QRUcffX0PH1jU0NQnnWMxiEqeLZACK4wt2QwlsjVct9vgGB0RDVnXrVkIevI
	 WZtYVL7T8/h9kjy6DzNCUnLmLD33AF1YyZM5W2lU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2C93F80363;
	Mon, 15 Jul 2019 21:07:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36A1BF80367; Mon, 15 Jul 2019 21:07:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13414F800D8
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 21:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13414F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NeEF3bD8"
Received: by mail-lj1-x244.google.com with SMTP id k18so17373165ljc.11
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 12:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kBAMan59214L8DDiod4rlTrGDDyfBwlvbOMs/TY66n8=;
 b=NeEF3bD8BG5kFPsjgZXesEI57E1k1h7thRsrKPDmO5vUF2zHfBOj8m9IxkMPW41qlQ
 TyxIRhFFLSuWXkK+Y7DC0w6o49Uu8/2FgJGUfi/NUatEGNUleg5H5aInWT5HYBL0vcpe
 nxtgQ7QjHSX8f5NIqvEZTkXqUTcQRk1I4M0JWNCKT4afaDPt9q0EY9RkdXPNsq03NvCO
 zUpCCDW0+I1ycwTakFW6s6UcyY8Y0x0QW+SjJpBezQza61lusL1MBKMw311mxLteMzEb
 kAseYX+0IAGJ4YNSy0mb2T5BdO69BHUemBNlpNG7bJoTjS9kO0+cnOjW1T48HVPWnPN9
 JF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kBAMan59214L8DDiod4rlTrGDDyfBwlvbOMs/TY66n8=;
 b=ptT2AkWzqhXfGRD6nz7O+1bfjSOHzafKErzquFrGSlSjCyBAgtHKA2Dm/gTKFaUvw9
 TPyiQ8kgdhjfZmAiDE7BzgT04SAgpNfwNU1XBG45eQwYJttSzk77c3qB2iqHsi/ZTE6L
 tzFDxmdDGbrw0tFe20crbilet8/730Hodbl3VwHy97AgUFrATmmpg3A3U7O7NMJz7tZi
 G691lY1BoKJ5c+wE9laf0PRLpDyMBoqoshjy/rWGj0slPN6x63LCtOWy6FqOECJAD6po
 QAkngMFK1TloP7tJIKi/IyFrhBrdLT+5mY9xD/zyAYD707i9UtS3g/79YFQaIW8mC564
 OpYA==
X-Gm-Message-State: APjAAAW/KkPda22dp33c+qYloIy67PNc4O8dHB5lWEbtbDE8hEu+bLVX
 dcT6U4XCd513QDt6NPQd2r3VGnVw7FuhAlhOMbE=
X-Google-Smtp-Source: APXvYqy3CDW03EM/RCHOc9BjFKyYKM6GZ+jrLPwYgDUJzx1zvSJb3RVZkrMtFlqP1DkuIICN6aEXe5AGDr5sGUcY3xs=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr14182194lji.115.1563217622646; 
 Mon, 15 Jul 2019 12:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jul 2019 16:06:57 -0300
Message-ID: <CAOMZO5B00XRb5GqtYhyg==sVek_uWhLRDQeSStN1AzfKRnV+Dw@mail.gmail.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 0/6] VAG power control improvement for
	sgtl5000 codec
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Oleksandr,

Your series looks good, thanks.

I only have one suggestion.

On Fri, Jul 12, 2019 at 11:56 AM Oleksandr Suvorov
<oleksandr.suvorov@toradex.com> wrote:
>
>
> VAG power control is improved to fit the manual [1]. This patchset fixes as
> minimum one bug: if customer muxes Headphone to Line-In right after boot,
> the VAG power remains off that leads to poor sound quality from line-in.
>
> I.e. after boot:
> - Connect sound source to Line-In jack;
> - Connect headphone to HP jack;
> - Run following commands:
> $ amixer set 'Headphone' 80%
> $ amixer set 'Headphone Mux' LINE_IN

Could you please make the bug fix patch to appear as the first one in
the series with a Fixes tag and Cc stable?

This way the bug fix can be applied to the linux stable tree.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
