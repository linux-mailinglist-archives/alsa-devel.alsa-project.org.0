Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E979853C884
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A6A017F6;
	Fri,  3 Jun 2022 12:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A6A017F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654251631;
	bh=uyeMnMcWytKHr4uDRHwCzqxAiOTnpe8wpOpPWBOtjoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CSotwSNJeZtTdLef2YSfc+Wxlniq4PTwhNmGml9w8wVLJx0NAVJ4ggGxkmVLz5IuC
	 TgTwp3ZB5hclzNRke6JuFsuQ7Y5d1r/paT3RFCHdFU+r5T7CszfHl1385o8uJdJZKx
	 oDRRLPcafH982HNFTW3rdwNKLMiLiXlegl0pH4qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F213BF800F5;
	Fri,  3 Jun 2022 12:19:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD53AF804CC; Fri,  3 Jun 2022 12:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E9F0F80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 12:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E9F0F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QQer3Cro"
Received: by mail-yb1-xb2d.google.com with SMTP id l204so12906480ybf.10
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 03:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eCANrYMxosIMh+Xvbir+KgFfAUJg6+S8lF+OrF54Av4=;
 b=QQer3CrocRzXUbJga3lT0IkLvDhumQw3omrc4pXZ8kQmhdT77qsC+nSGbTrSlKuBUd
 SCkFr8UUw1STX4eRYdkfUmIt2QCAht10BD+p+MPVoUeAInYnT6OFwC9hPSCsQsiiOxfT
 kobkQkTdkZYzMYu0Awnp5OrBM6veOfZZrVpCwGxhWGxymggg+6AyY4kin49eqx/xn6PI
 8w4DvpKGjeQwc8djJvJogfLdHppjC76lbOf3C6Ysqizv6hWc7KD7Cr3GhVrLiySsPIY8
 YYlxJnCx1Sh8qkMdUMu6/DPS5FCzIsHZ4ez7fXf243TJN+i77BFjgUsJw2BWWNZiqf9H
 BnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eCANrYMxosIMh+Xvbir+KgFfAUJg6+S8lF+OrF54Av4=;
 b=awMc/qZOF9SAn5TbhcNmC7oGTRP+G85qyyYUuh4zft6f9dBYu7klMyt2+OBAC66MxY
 Agqm5UlNzIK378X5DJVENhDtCRVu2gB/TjGPLxirWL1sWp8us1zsrvTq4iuPFgRFdNVs
 /6Ui71hRNUGsBfp/LHRh9IsL3l2G2KUzyDc1H3abfSKT3zELeXcs7Vug6m0973jk/fNo
 LLd5fAkqK4/gNB5MoB5OdgYS065EScNk+rzmiQjTzGgPUJOJXVT1k7YnOxm0e9GuZ8Xt
 4AwkVmbSn9039yRqy/ZlIQU48riTFeWw5NVLd7kGapeYNmU0x004i7C5kosIc/LnX1H/
 q/iw==
X-Gm-Message-State: AOAM533wAvC5rZYdt+G8dxAwisuB1Ovnr4Xf+LTUzDCYhrSs+5emXnpx
 78xf7tA2n/I74UYhcQu3D0vslXRK1lGvrpl/VzhIgw==
X-Google-Smtp-Source: ABdhPJzCQPE37Bt5oIHGrr2jWp33WDnmx62d0Nt6DBKxkJKjMCw9IXg5fe2neGT3z1CVqiY5P3KeqFBug68RmO96NIY=
X-Received: by 2002:a25:1256:0:b0:65d:6433:7993 with SMTP id
 83-20020a251256000000b0065d64337993mr9806001ybs.626.1654251563183; Fri, 03
 Jun 2022 03:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com>
 <1654079415-26217-2-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n50nfwZPdSS7Vw9FiV+Shfn9-bX44hfLq5ey9DBsAy0y4g@mail.gmail.com>
 <6250a441-6bcd-4ca8-782b-b7a8d9239e46@quicinc.com>
In-Reply-To: <6250a441-6bcd-4ca8-782b-b7a8d9239e46@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jun 2022 12:19:11 +0200
Message-ID: <CACRpkdbBRjgNzxYkFPzy3kx45_7vJENp5dTX0MdJw+LSQ=9rvA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: sc7280: Add compatible
 string for adsp based platforms
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, bjorn.andersson@linaro.org,
 linux-gpio@vger.kernel.org, agross@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

On Fri, Jun 3, 2022 at 8:09 AM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
> On 6/2/2022 6:43 AM, Stephen Boyd wrote:

> >> +    enum:
> >> +      - qcom,sc7280-lpass-lpi-pinctrl
> >> +      - qcom,sc7280-lpass-adsp-lpi-pinctrl
> > Can you confirm that this is the same hardware (i.e. same reg property)
> > but just a different compatible string used to convey that the device is
> > using "adsp" mode or not? If so, this looks to be a common pattern for
> > the audio hardware here, where we have two "views" of the hardware, one
> > for adsp mode and one for not adsp mode. I guess the not adsp mode is
> > called "adsp bypass"?
>
> Yes Your understanding is correct. The same hardware in scenario not using ADSP,
>
> and in another enabling DSP.
> >
> > Is that right? Why are we conveying this information via the compatible
> > string?
>
> Could you please suggest better way!.  As pin control driver is the
> first one to probe, I am not getting better approach.
>
> While up-streaming these drivers, concluded to use this approach.

The device tree conveys hardware description and some configuration.

If this is configuration thing, either you could perhaps determine it from the
hardware (if set up in hardware or boot loader) and if that is not possible
it should just be a boolean property of the device
node:

{
    compatible = "...";
    qcom.adsp-mode;
}

If you are probing two different drivers depending on the mode, then there is a
problem of course, but it is a Linux problem not a device tree problem.

Yours,
Linus Walleij
