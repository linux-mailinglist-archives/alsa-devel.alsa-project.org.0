Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2E3B2BBB
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 11:45:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E752D1660;
	Thu, 24 Jun 2021 11:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E752D1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624527906;
	bh=yOpcYe1VImC2Ru3j1mAesgD8NLFGduXso588+LnpwWE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9e+8Ry8je9L8fWPWqLqcsufjJxpgTjBRNNcWPdGCtkxaZO0iXZVcJ4TIwWu3mQk5
	 aX2iuTqMfyx1W/1GqTcWOJcP4zw2goq1+3bCj37WeaiJR0dH7KibKHQL2RcN3BK4tV
	 VBBRzEwaJVGeovYyEOk3B61XPiR5Adq+Ne2HzQi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51031F80268;
	Thu, 24 Jun 2021 11:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A53F8016D; Wed, 23 Jun 2021 15:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9A1DF800B5
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 15:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9A1DF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aQRnJM1y"
Received: by mail-lf1-x135.google.com with SMTP id j2so4024630lfg.9
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yOpcYe1VImC2Ru3j1mAesgD8NLFGduXso588+LnpwWE=;
 b=aQRnJM1yCclqTGVTvhmY4RFqBfzPYZy676af5RSeub5reF6XCYAf0su79QLyByJiIe
 PdkRgVBkhK4jrTsiY4W7iPqV2yQ1FyYQeS62scFfMRYW1xbBgK0X6FA6SyvzzU4pr2Ry
 2hFqc3zEFy9+6D6MCotRMNRJgP99c81d9fEJJPgUBY8yGwIcaxjjlm+Ux56OreZS0uKw
 EJx+FsTfX1IED7myoNgesZlohn62Mf6NJv2K94cHX2F9K2RzK6jfjY5rC/IOGck7NHac
 DWNXigHBSgfdNjX1yJVOKbgCLxk7hB+VXZW8RiwjS8+5gT3yJ2Zq+doEKTucGRdP24BN
 Ff4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yOpcYe1VImC2Ru3j1mAesgD8NLFGduXso588+LnpwWE=;
 b=EatI7EG7bdKuDXqKD2E1vboksbDkD11aetVdlVSQwZXXoPEkLOdqlVJB3OA2mVLvHm
 3nGMR1VeuLaJB560EOb7O5SiheHlsS07WE86mh0Zswn9jHQgQ/pDKiXU4RhB1slq22yR
 30OPR70pvFPCBGq+ysMOR9dRj10Xf/eRmm+AmnQzLd9nxXmBgNkEQT402nuSPADojUOG
 SOudcsNM5EiyPkrZP0+7johws66uh+HFNRTVWaYG3A4wnN4L1U6iv7DxoR0GGq6VhChF
 Nuomlo7guGzqZ3HZf4YZ0RGgSZ473lvjBa95h2B5NaG/AANbIZ58fTjfUkmyX1395eqz
 DVGQ==
X-Gm-Message-State: AOAM532h2Asa73BSyJ50cHy0H5IzfTph2h4wmCsy5Vqh6sJCaY3WWxrc
 UiWvLL7KI/tUpXufuNClc9ASyDV/i7htL9tLIHE=
X-Google-Smtp-Source: ABdhPJzjZgNJWxMYRIckLoI3N2BfkhWGRVxcQmTYv08rmlJfHjLQ9EjDl8TKrpYZ2UfzHHkgdXzOQL4ENANxeVfhHT8=
X-Received: by 2002:a19:4345:: with SMTP id m5mr6892671lfj.599.1624454122461; 
 Wed, 23 Jun 2021 06:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210610122550.jnriewchqspdcrwk@gilmour>
 <20210623121311.qlbnije5gn7o7so7@gilmour>
In-Reply-To: <20210623121311.qlbnije5gn7o7so7@gilmour>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Wed, 23 Jun 2021 08:14:46 -0500
Message-ID: <CAPpdf58AmzQkAQBx8x_kjfREto9qugYS0jLV+0qfp+atDFRimA@mail.gmail.com>
Subject: Re: [GIT PULL] HDMI codec improvements, v2
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 24 Jun 2021 11:43:34 +0200
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
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

On Wed, Jun 23, 2021 at 7:13 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Jun 10, 2021 at 02:25:50PM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > Here's a PR for the changes to hdmi-codec that need to be shared between
> > drm-misc-next and ASoC.
> >
> > This is the second iteration, fixing a bisection issue with compilation
> >
> > Thanks!
> > Maxime
>
> Merged into drm-misc-next
>
Not sure if its applicable - - - - - but - - - - I've been waiting
wanting to use a 4k monitor on hdmi for a number of months now. There
is a bug filed where I wasgiven to believe that my issues were likely quite
connected with hdmi.

I would be quite interested in seeing any hdmi fixes also added into 5.10.????
kernels not only the 5.13.??????? stream.

Would that be possible - - - please?

TIA
