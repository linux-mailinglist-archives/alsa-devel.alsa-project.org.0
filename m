Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352453C8A9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 12:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7641828;
	Fri,  3 Jun 2022 12:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7641828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654252205;
	bh=cGXWUL92tqdMlZDb0H6gx9tDyxt5ghMcJ/4xNTpSTbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kbbg01zAWJR+KG3/h5PjEcYHTa8keqU+dqrA+fVqfmckmbsTzW07X37PtxXMVZ5OV
	 IR/+p1LZqZjUEcHbd4/kO/4s+AfM/O+yYHs1KVCylrUBgk3GIdy7wbx/YINDwsh1l/
	 3kTVBw3SvYY/v/hM0vmHqRxmyzH/DaLslD7daVP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CCB2F804D1;
	Fri,  3 Jun 2022 12:29:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A15D9F804CC; Fri,  3 Jun 2022 12:29:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE01CF80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 12:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE01CF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oG7zOFP1"
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-30c1b401711so77838477b3.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dC0gx01b2aNajXfhT3RxUnH0OHK3FMPo/gpngxGlMwo=;
 b=oG7zOFP1DbQh6Bo8e9Qpq/xhX0tcm0Z686SDBT7H504JhHxqE3dnOrHBJ6SB/2HSK4
 twuSJO1lPcK5rLD3Hh+gKG0l3jtSoA8EYExYCLiyANJoCWRY1XSu31iiJqtN8JeP4jR5
 KeCcRWNG8k0cKAwK+B8C+LiKyAUIyY35Rc2HDoJNL490sEJzAybFKJGosi2vB+5kM2fb
 CkFMly+sSSmDyfTmzvsm3PvJr8kwCzkRW05trOUye05ZR8AscObGzjpJwvBL/YOzAVbN
 0mw8bc8FHPkItci37uxaWwIcZPeZfUqrdb+ftP4a7ZovA0miQgbeVm9d2jAyuRTdKt0d
 Do2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dC0gx01b2aNajXfhT3RxUnH0OHK3FMPo/gpngxGlMwo=;
 b=i7uTuYCLciiynKTca8/psLVTfge8LeQHC0XGs5r77qHoBbVRJYjDu0aMmEpItdaqjX
 zGFNdLoLZAMN9KIuMFxxWvks9Kdx4l2gi6GEKMP19yieqLrNLRILJ5jOI4kkOVM8rKR4
 AQokjZsDgR2Q+178wNbXLVCi0LtZaAGpRIivHbO+64aNEnXlX1/0bSRj6Df7odK/weTM
 PRtI6BTjH4J47WsTP00Yf+TgnqxCHvw6KE7guAKMwVcujPHVTx+RRtJIuLBL4BLAuf7M
 MJm0TOnhLnBbQNZYZ70aMWZKgXNFTMeYW+s6fno5X1o+KKbOzf5ikwXjO1r6VENe1KG3
 azMA==
X-Gm-Message-State: AOAM530d0ZrxpCK0AabcL7x86h89QFEFsaeuWrnV8XUnQleZnjptE0T9
 BXolSzAc6UbWmYoT8aQ9Id4FMJCnq6Dw1KdT0/6H5w==
X-Google-Smtp-Source: ABdhPJxdb0406KtQA0ekY0TlTv81qQUxI5O/FyeeUoVHX8/Ot2ByU9RnuJwh7E4wA3eNsSCbGkhyW44rUkeitrBqRsM=
X-Received: by 2002:a0d:e246:0:b0:30c:5e77:7104 with SMTP id
 l67-20020a0de246000000b0030c5e777104mr10997642ywe.448.1654252136425; Fri, 03
 Jun 2022 03:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com>
 <1654079415-26217-3-git-send-email-quic_srivasam@quicinc.com>
In-Reply-To: <1654079415-26217-3-git-send-email-quic_srivasam@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Jun 2022 12:28:45 +0200
Message-ID: <CACRpkdYQW7WByaGoSFKT91OwRao_jJdCAbL0pUuj3vdS6TdkQg@mail.gmail.com>
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

On Wed, Jun 1, 2022 at 12:30 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:

So one way to just use a propert and avoid more compatible strings:

> Add compatible string and lpi pinctrl variant data structure for adsp
> enabled sc7280 platforms.
> This variant data structure rnd compatible name required for
> distingushing ADSP based platforms and ADSP bypass platforms.
> In case of ADSP enabled platforms, where audio is routed through ADSP
> macro and decodec GDSC Switches are triggered as clocks by pinctrl
> driver and ADSP firmware controls them. So It's mandatory to enable
> them in ADSP based solutions.
> In case of ADSP bypass platforms clock voting is optional as these macro
> and dcodec GDSC switches are maintained as power domains and operated from
> lpass clock drivers.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index 2add9a4..c9e85d9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -134,6 +134,16 @@ static const struct lpi_function sc7280_functions[] = {
>         LPI_FUNCTION(wsa_swr_data),
>  };
>
> +static const struct lpi_pinctrl_variant_data sc7280_adsp_lpi_data = {

Remove static and export this struct in drivers/pinctrl/qcom/pinctrl-lpass-lpi.h

> +       .pins = sc7280_lpi_pins,
> +       .npins = ARRAY_SIZE(sc7280_lpi_pins),
> +       .groups = sc7280_groups,
> +       .ngroups = ARRAY_SIZE(sc7280_groups),
> +       .functions = sc7280_functions,
> +       .nfunctions = ARRAY_SIZE(sc7280_functions),
> +       .is_clk_optional = false,
> +};


>  static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>         .pins = sc7280_lpi_pins,
>         .npins = ARRAY_SIZE(sc7280_lpi_pins),
> @@ -149,6 +159,10 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
>                .compatible = "qcom,sc7280-lpass-lpi-pinctrl",
>                .data = &sc7280_lpi_data,
>         },
> +       {
> +               .compatible = "qcom,sc7280-lpass-adsp-lpi-pinctrl",
> +               .data = &sc7280_adsp_lpi_data,
> +       },

Drop this and instead add some code in the probe()
in drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
lines:

if (of_device_is_compatible(np, "qcom,sc7280-lpass-lpi-pinctrl") &&
of_property_read_bool(np, "qcom,adsp-mode))
     data = &sc7280_adsp_lpi_data;

Yours,
Linus Walleij
