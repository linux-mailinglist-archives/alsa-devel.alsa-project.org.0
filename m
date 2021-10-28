Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE7A43F2B3
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 00:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3C1216E6;
	Fri, 29 Oct 2021 00:22:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3C1216E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635459813;
	bh=EuunFU6F7Dvu2kYNSw7CevxvBHdBkbt2hyGll4tBNTM=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STs4REjjLdqzqcvz3ZqZ2AW/1nbuGWLsSAwms8o4tr3uYdD27w3CDjQyDqxGV1+nw
	 vjvg71+aN0MuryjCZnGWJ0gVP99kCD5ZVsgl+apSEHRpt4g30LQx+EGwnjtsgH0LHO
	 +mJyI1eGG8eACVvN1fwX3+xC7hyPOGLvcxWaJEbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E750F800D1;
	Fri, 29 Oct 2021 00:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00E8BF802C8; Fri, 29 Oct 2021 00:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23BBEF8014E
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 00:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23BBEF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="U0ZkmgyT"
Received: by mail-oi1-x229.google.com with SMTP id z126so10407600oiz.12
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 15:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=safjzndEbzjU2SwVTVE4zVWj+HK5y+hvxFtF+3nUUHI=;
 b=U0ZkmgyT3PB6z8814OGZKCNDizIxnQdvyYawTAPG4+SG23OU7CcuGn81meGhTVps2h
 26NJy4m5OjlUnqEWnhqsu9dCo07ur5BZor+93s5vKlA5qdw7WV0S/K9zTk5tQ6ej+TSz
 5rB5I89fDFJwaM6vz/CYeHumeD+voBqWcR/k4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=safjzndEbzjU2SwVTVE4zVWj+HK5y+hvxFtF+3nUUHI=;
 b=lXRRjP9KjpUdCBq1LZpYExsp124qaJ80LXUqC1IdBYtNaP++1Dv9HFgLm7gYOu8XvC
 j/3IQZxGXXSgrFFDvNVWvABtM+0/mSASHJMFGQIZnOcl9HUhuCKtyoiK22XFWgw50pRg
 q1UOQazb7ZNJ1iMzqAZUH3reot5wEs4HE+bBfvEakqcZ0i9D06HpX1s17itRzh4QduTw
 WoqwWpykhujUbnqOi48LeFOxca5Nnj3t7RY1SS3H3OVrmIPOswUdcFzgZhBbwKN0st5O
 4jk0vZV440QOGMR48GsJRDnlgS+B26iN5HZQyybbOD/KTseVKmVozwbPOskmt8xVnAo1
 xb0Q==
X-Gm-Message-State: AOAM531DZ9v0YMbMJFHUC2URwsLWdihCNzZM6pKKSEsfG9MTcA1HvjXN
 O+P+mVXVDq4IVLOaj8RXoh5P51gfVsuqjQB5YBdlng==
X-Google-Smtp-Source: ABdhPJxwad3KZP7ykLYAovaRb+WkgtPUCXvy7JwNFEV0mCgGDN/cpVWWW0Gfk8jtDIeN7WucT9ADa66p1oLzUwiatZ8=
X-Received: by 2002:a05:6808:2128:: with SMTP id
 r40mr3516798oiw.164.1635459721995; 
 Thu, 28 Oct 2021 15:22:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 15:22:01 -0700
MIME-Version: 1.0
In-Reply-To: <d92c73d1-32b1-8d95-f3b5-ff103b330621@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-3-git-send-email-srivasam@codeaurora.org>
 <CAE-0n51qO1q5ZF-fAf2Gma9a2B+iSyoQnJdJ8Fnmsz+DG0rwPg@mail.gmail.com>
 <d92c73d1-32b1-8d95-f3b5-ff103b330621@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 28 Oct 2021 15:22:01 -0700
Message-ID: <CAE-0n537neZdwb3vP4=8N5vj0EwYnDnA-U7O=fckPvP52baCrg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl compatible
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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

Quoting Srinivasa Rao Mandadapu (2021-10-27 00:47:52)
>
> On 10/7/2021 11:29 PM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:38)
> >> Add device tree binding compatible name for Qualcomm SC7280 LPASS LPI pinctrl driver.
> >>
> >> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> >> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >> ---
> >>   Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> >> index e47ebf9..578b283 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> >> @@ -16,7 +16,9 @@ description: |
> >>
> >>   properties:
> >>     compatible:
> >> -    const: qcom,sm8250-lpass-lpi-pinctrl
> >> +    enum:
> >> +      - qcom,sc7280-lpass-lpi-pinctrl
> >> +      - qcom,sm8250-lpass-lpi-pinctrl
> > I suspect we need to split the binding because the function list needs
> > to change. Can you make a whole new file that's probably largely a copy
> > of this file and/or extract the common bits into a meta schema and
> > include that in both the files? Then the function list can be different
> > and the clock property can be omitted in the sc7280 file.
>
> As most are common functions and fixed number of LPASS Lpi pin
> configuration across platforms,
>
> Only diff is ADSP bypass platforms 2 clocks are optional. Otherwise
> clock design also same for SC7280 and SM8250 based architecture.
>
> So I feel Keeping common file is better for now.

I don't agree. We want to be very strict about what is exposed. It needs
to match exactly what is supported on the SoC, not be a superset of it.
