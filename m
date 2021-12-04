Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC64686CB
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 18:52:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4DED2531;
	Sat,  4 Dec 2021 18:51:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4DED2531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638640325;
	bh=s+ik63dAmfrjlC/j0Y0a0PtyupdfmbhVwiYFKIQBD8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Llgtv+hVcZ1kmaK5P3BPiwB8gjdEhBE6sjTuxb1GPhfr0+aCWRsKGhOfhSE4vpvNP
	 Idj+tSInwZuVVEQP/rlOfOwDaNMSQugETDXeFVZyhwro15j8RSJrs3p+3DPcyVMYK6
	 sPv6JK8QqjPus0vRriDWW6ExJ4ev5UyWzE/ueAIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44315F80240;
	Sat,  4 Dec 2021 18:50:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D1E9F8023B; Sat,  4 Dec 2021 18:50:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BF82F80085
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 18:50:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF82F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hfAWqiz4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCB8560E84
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 17:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C01C341C7
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638640238;
 bh=s+ik63dAmfrjlC/j0Y0a0PtyupdfmbhVwiYFKIQBD8w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hfAWqiz4EzBFWN0BCXcDb6gYiXLNKL6IoYeJW/pX7OYRu9scMuiJJdoSO/yXl089O
 D1KgvFK+oif16qtUR0rWiihTWEFta3UpKaQSv3i5VUrMjLvE5k+gO2cQpzh74tGDCg
 w29B85Qyeph7glRa6S/indeJ5SrcjSDxb5LoidwzhUDWV1DId9ZpAT0U06GbRdht7/
 8I1FU6rVFawMj3jeVueDI3OsjNbXr6XF6nDwRPGbYBV9US4JzAgFAZGRloE3+zM3OR
 tOE9JohJij1HwkkC21IRGqHBQjpXh8Gqkb9jgOW+KRGaRPXNqDhGLz/NU4SETNuRBo
 s/CVjr1pi4eCw==
Received: by mail-ed1-f54.google.com with SMTP id e3so25060846edu.4
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 09:50:38 -0800 (PST)
X-Gm-Message-State: AOAM533qHNQZcodlzfYEQXtF0eRGRncDDyxmWPLRX843yfFX0jC95Yd3
 DpfaQNPyOfH7IkdwThBMG6tSl/0xv8jAmC+/Kg==
X-Google-Smtp-Source: ABdhPJyG/uUnEPaVHkUuCxpNDT8h30alMo2zah2d3OzMYnPU6Qi4lwNW4/braAAARZrtS3ljjIUbVvgWJoy1uXJAO0E=
X-Received: by 2002:a05:6402:35ce:: with SMTP id
 z14mr36838701edc.197.1638640236433; 
 Sat, 04 Dec 2021 09:50:36 -0800 (PST)
MIME-Version: 1.0
References: <1638547658-22032-1-git-send-email-srivasam@codeaurora.com>
 <1638547658-22032-10-git-send-email-srivasam@codeaurora.com>
 <1638574455.248037.1043006.nullmailer@robh.at.kernel.org>
 <CAL_JsqKf4Y84+_PQqhwMEEiJNrR92urMUYSqYTEU0_c7fYnyhQ@mail.gmail.com>
 <07f5a5f2-cdf5-75de-9635-0edcd5e5c905@codeaurora.org>
In-Reply-To: <07f5a5f2-cdf5-75de-9635-0edcd5e5c905@codeaurora.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Sat, 4 Dec 2021 11:50:25 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJgjdeYmwZUcNFQniYn2TR0frSUEVGfpXs00NvOBcBsfw@mail.gmail.com>
Message-ID: <CAL_JsqJgjdeYmwZUcNFQniYn2TR0frSUEVGfpXs00NvOBcBsfw@mail.gmail.com>
Subject: Re: [PATCH v8 09/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, linux-kernel@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
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

On Sat, Dec 4, 2021 at 1:59 AM Srinivasa Rao Mandadapu
<srivasam@codeaurora.org> wrote:
>
>
> On 12/4/2021 5:08 AM, Rob Herring wrote:
> Thanks for your time and notifying the issue!!!
> > On Fri, Dec 3, 2021 at 5:34 PM Rob Herring <robh@kernel.org> wrote:
> >> On Fri, 03 Dec 2021 21:37:37 +0530, Srinivasa Rao Mandadapu wrote:
> >>> From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >>>
> >>> Add bindings for sc7280 lpass cpu driver which supports
> >>> audio over i2s based speaker, soundwire based headset, msm dmics
> >>> and HDMI Port.
> >>>
> >>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> >>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> >>> ---
> >>>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 70 +++++++++++++++++++---
> >>>   1 file changed, 62 insertions(+), 8 deletions(-)
> >>>
> >> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> >> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >>
> >> yamllint warnings/errors:
> >>
> >> dtschema/dtc warnings/errors:
> >> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg: [[0, 1658351616, 0, 425984], [0, 1659895808, 0, 167936]] is too short
> >>          From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> > Are you running the checks before you send out your patches. Because
> > it seems like you keep sending things with the same errors.
> >
> > If there's errors, I'm not going to review this. If you need help
> > getting it to work, then ask.
> Actually, the too short name errors are coming for the existing names
> also. could you please suggest on how to go ahead?

Go read Documentation/devicetree/bindings/example-schema.yaml and the
part about default address sizes.

> >
> > And what's with your email setup? codeaurora.com bounces.
>
>  From December 3 Qualcomm mail domain got changed to quicinc.com from
> codeaurora.org.
>
> May be that's the reason for bouncing.

No idea. Just fix it please. I don't think I've seen this problem from
anyone else.

Rob
