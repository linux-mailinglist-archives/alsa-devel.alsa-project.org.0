Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EDC40AE4C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 14:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFAC21786;
	Tue, 14 Sep 2021 14:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFAC21786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631624106;
	bh=oMnYDodGXLIKJPF+npz+/WoTRhIUvTosOvojYmQNO0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FyEJkXum/22RrQqPTv51bR2mLPJHdw4AyB3hudbmeeys0SEJpI5CQ5aH6hvuusQ06
	 AP5cpi5bx153XMx2YS+AuL+P05juw+GXzkTzrCUolD/hUBIm9OhLsWJTN6lODjhdhL
	 XQRFq042FeCYWpC9mMIZM9IzBrF33tQr83sjamCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3801DF80271;
	Tue, 14 Sep 2021 14:53:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08758F8025E; Tue, 14 Sep 2021 14:53:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B674F80132
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 14:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B674F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lJCZqAw9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08C0661130
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 12:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631624015;
 bh=oMnYDodGXLIKJPF+npz+/WoTRhIUvTosOvojYmQNO0M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lJCZqAw9vkA2mhEbWjmS3Q7P4rkSJvJTNMfuT0QeHDF9xeTGcHo7b63VzUcYzSgbJ
 L+pgfjlDNWzs9w5W3BNIcW1Me5/9aOnWO70q6a1KnE88VmepL/Jwgs9oeKwIw6ZKvA
 rcSXobSaJEDlLbcnt52zRn58fmXtR+q4tuSvybb47IdKgHdYN/tSULyR2aSNGUqhG5
 A23qozqwUVdFoKBfCVqI53IeEurea3YUnw1QU5E1oQsf0+UjzarFbIRZMMp89edSy7
 0MNfY8KBqwaOOT/TMH6MNtzNdarBENtVSLtyjk60LRYBWIPMzdsUf1waVmWtruL0yq
 uE3PFght8ycSw==
Received: by mail-ed1-f48.google.com with SMTP id h17so9603259edj.6
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 05:53:34 -0700 (PDT)
X-Gm-Message-State: AOAM531a27ojEdn71WSVi1nhObazOjL3zHjbS8L41879+iic35bui4wx
 e+NtZ3qtMfvQEqcXUF/7PZvBnrUh8WaKGqKNOA==
X-Google-Smtp-Source: ABdhPJxjU7AwljGmpMkruTh5XZY/mSxaoaXtgEIb6u5sLpW0CLUDd0BSFGJn4Jew8gbbKOhsB0aflcoTS8nhYKAaAco=
X-Received: by 2002:a05:6402:150a:: with SMTP id
 f10mr19146056edw.318.1631624013507; 
 Tue, 14 Sep 2021 05:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
 <1631124057-17155-2-git-send-email-srivasam@codeaurora.org>
 <1631190773.288819.200339.nullmailer@robh.at.kernel.org>
 <f683c69a-58bb-15ba-8db5-6eaea6e1a062@codeaurora.org>
In-Reply-To: <f683c69a-58bb-15ba-8db5-6eaea6e1a062@codeaurora.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Sep 2021 07:53:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
Message-ID: <CAL_Jsq+uUceorjp75FYABeQYaK2YgRkmDakFNwPL7uwaHGcDLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "Gross,
 Andy" <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 judyhsiao@chromium.org, Patrick Lai <plai@codeaurora.org>
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

On Mon, Sep 13, 2021 at 3:20 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
> Thanks for info Rob!!!.

Don't top-post on maillists.

>
> This error is due to missing dependency
> patch.(https://patchwork.kernel.org/project/alsa-devel/list/?series=543829)
>
> Could You Please check with the above patch applied?

No. How is a script supposed to handle that?

Where have you noted the dependency in the patch? Without that, I
assume you just didn't run 'make dt_binding_check' and the maintainer
doesn't know to check that the dependency is applied.

Rob

>
>
> On 9/9/2021 6:02 PM, Rob Herring wrote:
> > On Wed, 08 Sep 2021 23:30:56 +0530, Srinivasa Rao Mandadapu wrote:
> >> Add devicetree bindings documentation file for sc7280 sound card
> >> registration.
> >>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> ---
> >>   .../bindings/sound/google,sc7280-herobrine.yaml    | 169 +++++++++++++++++++++
> >>   1 file changed, 169 insertions(+)
> >>   create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> >>
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[1]: *** [scripts/Makefile.lib:379: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [Makefile:1438: dt_binding_check] Error 2
> >
> > doc reference errors (make refcheckdocs):
> >
> > See https://patchwork.ozlabs.org/patch/1525980
> >
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> >
> > pip3 install dtschema --upgrade
> >
> > Please check and re-submit.
> >
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
>
