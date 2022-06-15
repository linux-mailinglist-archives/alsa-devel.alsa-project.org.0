Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3D54CA02
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 15:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE3B18E2;
	Wed, 15 Jun 2022 15:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE3B18E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655300454;
	bh=dqcpH2keVqI32T4J17c4mDX2Yxxgxb/YhN9qLYWe0s4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXPUTVWWgYaos8NiLqICr/BaF5QYQ6Fm/j6sbosga1VvNBPHmS1qMK57XQb9fw9cd
	 kPQCBgEDSDzczd9FPTPTOIyM/NIIg2f5WyGiNBaeeMYet8TdRWG/ouxdaWQX0169xc
	 rl+0bqJ7A+xOFsPXF3XLA96pvT34BMhukbIDZGNo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B64A3F8016C;
	Wed, 15 Jun 2022 15:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA85EF80162; Wed, 15 Jun 2022 15:39:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D530F800D8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 15:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D530F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rPkstlrZ"
Received: by mail-yb1-xb2d.google.com with SMTP id p13so20606204ybm.1
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 06:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hd2Q7z9uWW7dB0gy7lxuAP2GK3dj82/CD4CwzUHIa4U=;
 b=rPkstlrZwE646fy1fdO0Vu8lKssadxnY/cq1nHk/4Drjaed9Hyl/FzAV97Qw6CvIOZ
 ukuClPhw1cqKIxSdjV+m1grXdgBQgi+gLNnMZ7HqXd0JJeUPu6JXC1gVuTwBjilsC25M
 046vbKX3N0sgQ1TA9dwRUme8KeoU1PUtU8IECplVwcTFYaJIgO/VSyyVD4xWFk4Afnl8
 7o7tzI6DEzz4TuN43YTXQPTuXTvo1omNKgiz4HSoz26G4MBgCF0gubbzX3NnlnAvpfqL
 cKHyVg2yoBW8qKIxE+KQiKn3UdKz47hR2QBV3lkKhJTUCVPlbM/fFn9AGhFZh6f1wIyx
 o+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hd2Q7z9uWW7dB0gy7lxuAP2GK3dj82/CD4CwzUHIa4U=;
 b=HbZXBln24mttYuG15kEu2ZqYLtqY6Tt83CKnd7jQgXn6LbbHHHxnCExn6EaWj6+FPT
 +Yn1qG5fpfiSGb6/6F22Je99p2RXDMRDjCXQGjNXOoEdaEYxELlc+ndhRNG1+HBkC3DZ
 xelaBF5Eson3FKXLhQqasgE9HqP4KyPhvUVqmL2jHUQGQQASuUTbiyaIyNZRKTVNtx5r
 0mJ8PgGXph6tbMu+sRjkYKMkzfkDHsHmYP7IR7hxcdOKWHpWUUuXDNF57YtctP7GZktN
 WwlVpJZyZ2Mg96flkgGXqssq2Iap4nwJSC2cBDa0EHDDWbPV4UR4GgEmNNhxdACMBk7z
 gMNA==
X-Gm-Message-State: AJIora8uMyRoU1jCsmDapH3apDN2IihqQX+O6ixbM+bWWPZKZNclA1zp
 ay1DOeyrZJbRsCpOuRE3LrfMEHr89KRmJKGvnTk5rA==
X-Google-Smtp-Source: AGRyM1tmMuIlqeQp7nqh2Mjy2GzaCsjE7hVrrxP2n3u/EC5oobfK92wjpSUNebv+96g3JYgFgZ/eKGfNefJpR0XngmY=
X-Received: by 2002:a25:1256:0:b0:65d:6433:7993 with SMTP id
 83-20020a251256000000b0065d64337993mr10062220ybs.626.1655300383762; Wed, 15
 Jun 2022 06:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com>
 <1654079415-26217-3-git-send-email-quic_srivasam@quicinc.com>
 <CACRpkdYQW7WByaGoSFKT91OwRao_jJdCAbL0pUuj3vdS6TdkQg@mail.gmail.com>
 <a2b7de25-55a4-7d31-2787-be6d0ccf9500@quicinc.com>
In-Reply-To: <a2b7de25-55a4-7d31-2787-be6d0ccf9500@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 15:39:32 +0200
Message-ID: <CACRpkdayb3Rx=jxdxW4rZxg6efEyf_Nzv1rgL0t8pLLJd-NsiA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: sc7280: Add lpi pinctrl variant
 data for adsp based targets
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Fri, Jun 3, 2022 at 1:03 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

> >> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
> >>                 .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
> >>                 .data = &sc7280_lpi_data,
> >>          },
> >> +       {
> >> +               .compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
> >> +               .data = &sc7280_adsp_lpi_data,
> >> +       },
> > Drop this and instead add some code in the probe()
> > in drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> > lines:
> >
> > if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
> > of_property_read_bool(np, "qcom,adsp-mode))
> >       data = &sc7280_adsp_lpi_data;
>
> Here, only diff between ADSP and ADSP bypass variant dats is
> "is_clk_optional" field.
>
> So we can keep something like this. Kindly suggest, if it's not making
> sense.
>
> if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
> of_property_read_bool(np, "qcom,adsp-mode))
>       data->is_clk_optional = false;

Looks good to me!

Yours,
Linus Walleij
