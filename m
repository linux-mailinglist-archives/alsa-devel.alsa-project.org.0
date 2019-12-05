Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEB113E7C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:47:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 338171667;
	Thu,  5 Dec 2019 10:46:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 338171667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575539253;
	bh=7aLdWrG3EiyoimNWqBpRV53fg7vlKMNmwwqOca4RNYg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8dRt2txyTY5gEbtDyMrlDMctoqVjcOiVZDWg2PjkwMcmmVxpUfbYpB/qWaUHGXK7
	 /lS3v35Q/5h0ldeokGZ6ibW32BLckmn+ufrpXFzU6LO3xaCKWP489Kem65fS4tk6Ey
	 CXC4EvSJ4v+IXcGdL2oCpwuNgiiGlEhtk12pvcq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7837AF801F8;
	Thu,  5 Dec 2019 10:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E826F801F8; Thu,  5 Dec 2019 10:45:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_30, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F283AF800B4
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F283AF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A/uquqn7"
Received: by mail-wm1-x341.google.com with SMTP id g206so2889686wme.1
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 01:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IAHAPcfNyYPZewTfBhsG7qwba+YQCk2356CRIqll3K8=;
 b=A/uquqn7fzUQpqmYGO+PEXKF1NoPRxYMZ0y2sW+aDKN2NiVkv7K16K/R63JFJt3fdo
 PAqzhlml/ixjVKxynF0FGEbQBpjyn/orMffUA7RtohOKEsDFu0I2e/m4o3RSxCMcHRPl
 WxFBf9N9tp3la/OS19JL1VNiHJKI3y4h+yBPMpEsRQkJuXKF10bWuSYlx8+xHkw3mGwu
 CgsV630jVK1HXVfmmOrNxjhvEIF/6CNZuTECWJ6ux4arJzFKOk9C+ztBFKrFZ5gFiQkG
 qHjrP2okiVzBNHwpyOOJH+7tZvfC46DiMArQ1geFD4nelFOWtjAoXRxpDUIjaPrhLngI
 kI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IAHAPcfNyYPZewTfBhsG7qwba+YQCk2356CRIqll3K8=;
 b=bgkhjjR58GLCJYVE7z9S0jDUyjDc/OTCoqyNIFpubWXnufFC43YxOLNouIYeATHjWO
 F8sww1SmJEFU0x2SypWG6L0StGlEcBgwLxIPnEvaAm2dLO7PYwe7LlzPBRTJpZCJADbY
 ws7DFgE1l791o1oVIXsSI9UvizuApV6L3qvT8Ra3JKQurv/pd+2EjJlBWLevQ422lWuz
 KkvMi049p+0ZjLtUbTqgj3dUXA7GvvmUTzYlQilGthx0H/mcqgwyJa9YgWgE7CCjsei4
 V5UyAtCRxXN2cPx+FYy4Cd+FjkJ/kegJCx6d8lR5ULc0bCC1y7/0Ve6FjZuE2g/5BuCl
 ey5g==
X-Gm-Message-State: APjAAAUOgEFHwucZKYrix1EVFg2k6JCQp5tXPZSgFv0yAvjuhQY3uQMq
 HBb3lYHhApppEMz+szmEaYoIsSUYZy2lOL1BVEg=
X-Google-Smtp-Source: APXvYqwcYRc0fuaLRFVleqfgSmiyl3I2fPNK6AKFa5K8/dfNSEFtx+axt8WpebIoZlIVYXmSl6OmkUOLn9wJyytUYes=
X-Received: by 2002:a1c:4944:: with SMTP id w65mr4047032wma.39.1575539141872; 
 Thu, 05 Dec 2019 01:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20191128223802.18228-1-michael@walle.cc>
 <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
 <a5accae02f840f7e25099c2ccd7b02ff@walle.cc>
In-Reply-To: <a5accae02f840f7e25099c2ccd7b02ff@walle.cc>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Dec 2019 11:45:30 +0200
Message-ID: <CAEnQRZBm2=BrQ2VQW6ZNYSshNi_90-RdHKCYbtXi0=u3oxG3SA@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: add IRQF_SHARED
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

On Thu, Dec 5, 2019 at 11:18 AM Michael Walle <michael@walle.cc> wrote:
>
> Hi Daniel,
>
> Am 2019-12-05 09:43, schrieb Daniel Baluta:
> > On Fri, Nov 29, 2019 at 12:40 AM Michael Walle <michael@walle.cc>
> > wrote:
> >>
> >> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
> >> IRQF_SHARED to be able to use these SAIs simultaneously.
> >
> > Hi Michael,
> >
> > Thanks for the patch. We have a similar change inside our internal tree
> > (it is on my long TODO list to upstream :D).
> >
> > We add the shared flag conditionally on a dts property.
> >
> > Do you think it is a good idea to always add shared flag? I'm thinking
> > on SAI IP integrations where the interrupt is edge triggered.
>
> Mhh, I don't really get the point to make the flag conditionally. If
> there is only one user, the flag won't hurt, correct?
>
> If there are two users, we need the flag anyway.
>
> > AFAIK edge triggered interrupts do not get along very well
> > with sharing an interrupt line.
>
> So in that case you shouldn't use shared edge triggered interrupts in
> the
> SoC in the first place, I guess.

I think you make a good point. I was thinking that it would hurt the single
user case. But it is fine.

Thanks for the patch.

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
