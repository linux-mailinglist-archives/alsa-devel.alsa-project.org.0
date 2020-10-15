Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE64328F39C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Oct 2020 15:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 502901779;
	Thu, 15 Oct 2020 15:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 502901779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602769696;
	bh=NQmOIVxc9zZPiBhbW1gBn77j5LD0Q7Y0xDbxvKiCurE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RtotYzHvxQFwhoFNUj5s5hh0CLrXMahLNt8f8iMElRCAU45miDRZaptsuYRziULOh
	 7NTe5JFjqAXUAPuERsY3wo1YmOd77gmHCeXCRHyNYhAwtjtqHfn7yJmsfm8YkBkVd0
	 jSdz+bg4Yd7thL4ZBqr3j/dLOWcn8cbMeaVW/e8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0223F80269;
	Thu, 15 Oct 2020 15:46:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94790F80268; Thu, 15 Oct 2020 15:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC46F8012B
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 15:46:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC46F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="VZfFogEf"
Received: by mail-lf1-x144.google.com with SMTP id l2so3712762lfk.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Oct 2020 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lpSXdaWuU/6COGOcHpr2bLNzbwX0ucQjW3uoyXQpUkY=;
 b=VZfFogEfemTr56xl428GCHtrlFvPHfhh5dj8KtBbktrwjRkJi+4dgFayYmHCqkSqgi
 tQKfTotWUZ8FPjZrJTAV7AP+O5nFRhbPeJFj83M+OTxv7pnYgBCvFz60tBRdkOxzUDB+
 tOqMR5NX1erw+FWRkAk65Y2ErReviykrP6S+IlyTgiQ3mGuZ83SvxmeGoGciLYGvC/e3
 AIP6pAOa1BvDIrUBHrqYHbR2VoF3ZGCv+bu4Wh+Kj6uqNkqAGeNSqEwwSYvd+QMG35+c
 H3xBAn3vG24e/AJwiJxNhlNDjjKAoVrWrWLrLQOLzxsYLVUOPOsuP60xlNyU5hZUCagH
 O1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lpSXdaWuU/6COGOcHpr2bLNzbwX0ucQjW3uoyXQpUkY=;
 b=kP9kj7RVQUIc/DjnssM0su1+lNsZ8SPJqkyhdtdDTOvGkuVdR3zwVcsZrcSyAuRsW3
 OknR08usqxc+e1/H0tA6GZQeAKmI6mYLnCIJsRXmi9LXvU4R0Bba8GFtIJl1kQcxcGZ0
 wGC53NmEmyFCI4ReCHhU7D0LIRbok1cS12qkfB2vSEbiBsWeIfO/sobHAhjrW3gutuXk
 fWlIHC3Tk4g3qrWNsGQ/SRhwY3BFI47gOyH2xV/beAAdHMTHY4tcTyUrp5gTlDkRlTkG
 uw3bS4AenOVUXJ1NwiPXAVT9y/5viSAmbi6uemrS9hwK6lMFnFH/cxXi2qKRFwXPQBvr
 eDJg==
X-Gm-Message-State: AOAM530mo5fJsg/NkIq7n5ghaD4LBaj27mw1FsWEz+W2gtMO/DxSFgGN
 CpH33kKmvF8jpATUvkQMCikAdR+i+LSTP9Ch0CVo5g==
X-Google-Smtp-Source: ABdhPJzQVhr0MMNzKgdiVR0noDJaHS0oQ/mwqQtAcL1VdTct7o7Hm7xA6/UXYjE4L9oM3GtTQnnlnCttl4RmK5sn+2M=
X-Received: by 2002:a05:6512:3b6:: with SMTP id
 v22mr1043854lfp.536.1602769589120; 
 Thu, 15 Oct 2020 06:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
 <20201009135231.GA6655@sirena.org.uk>
 <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
 <20201012135025.GF4332@sirena.org.uk>
In-Reply-To: <20201012135025.GF4332@sirena.org.uk>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Thu, 15 Oct 2020 21:46:18 +0800
Message-ID: <CALprXBYfuqtJKtSrK=5pAS9N0V0Jb3CYv3EMZeGZ4OxF++dMAg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajye Huang <ajye.huang@gmail.com>,
 Patrick Lai <plai@codeaurora.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Andy Gross <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 tzungbi@chromium.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Cheng-yi Chiang <cychiang@chromium.org>
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

On Mon, Oct 12, 2020 at 9:50 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Oct 10, 2020 at 12:07:54AM +0800, Ajye Huang wrote:
> > On Fri, Oct 9, 2020 at 9:52 PM Mark Brown <broonie@kernel.org> wrote:
> > > On Mon, Sep 28, 2020 at 02:37:43PM +0800, Ajye Huang wrote:
>
> > > > Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> > > > for 2mic case.
>
> > > This doesn't apply against current code, please check and resend.
>
> > Thank you for your reply,
> > This patch depends on  Cheng-Yi's patch series
> > https://patchwork.kernel.org/patch/11773221/.
>
> That's "ASoC: qcom: dt-bindings: Add sc7180 machine bindings" for those
> playing at home.
>
> >   If I misunderstand what you mean, please correct me,
>
> A version of some SC7180 patches was applied.  However it does seem like
> that didn't include any machine driver bindings so it must've been a
> different, similar looking series which is presumably waiting for a new
> version - please resend based on that new version (ideally these patches
> could be picked up as part of that series).
>
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet access.
> I do frequently catch up on my mail on flights or while otherwise
> travelling so this is even more pressing for me than just being about
> making things a bit easier to read.

Hi, Mark

Thank you for your reply, I understand you point now, I will resend
when it is done.

thank you.
