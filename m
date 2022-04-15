Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD65031E1
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Apr 2022 01:32:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927F51726;
	Sat, 16 Apr 2022 01:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927F51726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650065529;
	bh=mSbmN+iUSOivVKO9ql2CnpJluSCzYAonuLjKirxMOh4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WertEzhT3lfYN1k/kiNNPFNg1XtsZZ8rcs2/eaVghdPOxlEoJgNjtz98lfSFv8UeD
	 i3tjv8jHFtIWfjKlj782MpOx3cDWATREwQ5b6mw+0T1d7LW3CiWzw2YaC5+0EhIMjL
	 G4RHyufOYKUQaS/3gHJvrsGhJsV62cG2E9OzdsW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A50AF8012E;
	Sat, 16 Apr 2022 01:31:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44CE1F8016A; Sat, 16 Apr 2022 01:31:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F2BCF8012E
 for <alsa-devel@alsa-project.org>; Sat, 16 Apr 2022 01:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F2BCF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="f/GXfSwM"
Received: by mail-pl1-x62a.google.com with SMTP id q3so8159964plg.3
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JK6vmV6CXxSuLt5gndd3I1PiZrARcDydn2Wml9uJek8=;
 b=f/GXfSwM+5LX/W7A1esUlhdeSMjoxf1vJrysnBaF+q9BlCzCoB9Uqgs/oQoHFeGBbG
 HN/LUnNyWa4ZWN7AOwZ0ZwIhHs6BKIEtSPOdjpBTOLprCH4vf9iZWhd5lxPYKN4EeBxX
 +vHUTD/PYLRWSbsAQf5HaTBEls5y1dy9o1+ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JK6vmV6CXxSuLt5gndd3I1PiZrARcDydn2Wml9uJek8=;
 b=mVvKGkc1qM0NFDiBv396vzT+OreMd0Q6Yv4KTeG1mH49BsbfRezlmLArP4tujFGfl8
 44QYtOQYJTJpt6LHO3nYhjNGvtd4DuVkbmU0mvEeERSrQ+FzBstTYRi8448TVqAZgXe2
 LZI1tVK6hw1p4kVlWtwtw5u+rDzrvMsZWei4wlra6Utr09oUp1RSh/usp5NlVUVO9luo
 /5eSJpMSlnZd4iy7+CmzKvhW3UucXrT2hresnMMFQZBzzWEjul37YmsN3UMsqtvxxCEN
 OqJLkIvK0Kmlbq20SfwvT9Q16TzrkJ8dg3Erj3fTJ3OXt7pKojhrhS5LpQrPBZdioVja
 w4uQ==
X-Gm-Message-State: AOAM532itqWGtFlGFh7IUxqZ62sgVwPIVuZxjD0xk2wbJm66tQ4rZKRM
 3cfp0lqS33ZF1TWB1ozUuNbQ1g==
X-Google-Smtp-Source: ABdhPJwpzWjVGLQj1ej7a1CNmp4Aw0aH9mAFpi57+mfdJpa3vF8S709hIIbPjez02GS3l1QWAJhWuQ==
X-Received: by 2002:a17:90a:e7ca:b0:1d1:22ce:86c3 with SMTP id
 kb10-20020a17090ae7ca00b001d122ce86c3mr4346128pjb.10.1650065460896; 
 Fri, 15 Apr 2022 16:31:00 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b27a:b3e7:2e3e:e4be])
 by smtp.gmail.com with UTF8SMTPSA id
 i5-20020a17090a2a0500b001cba3ac9366sm9571478pjd.10.2022.04.15.16.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 16:31:00 -0700 (PDT)
Date: Fri, 15 Apr 2022 16:30:57 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v12 6/7] pinctrl: qcom: Add SC7280 lpass pin configuration
Message-ID: <YloAMeEdb2kGvDSY@google.com>
References: <1647447426-23425-1-git-send-email-quic_srivasam@quicinc.com>
 <1647447426-23425-7-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1647447426-23425-7-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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

On Wed, Mar 16, 2022 at 09:47:05PM +0530, Srinivasa Rao Mandadapu wrote:
> Add pin control support for SC7280 LPASS LPI.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>

>
> ...
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> new file mode 100644
> index 0000000..d67ff25
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
>
> ...

> +/* sc7280 variant specific data */

nit: the comment is a bit redundant in a sc7280 specific driver

> +static const struct pinctrl_pin_desc sc7280_lpi_pins[] = {
> +	PINCTRL_PIN(0, "gpio0"),
> +	PINCTRL_PIN(1, "gpio1"),
> +	PINCTRL_PIN(2, "gpio2"),
> +	PINCTRL_PIN(3, "gpio3"),
> +	PINCTRL_PIN(4, "gpio4"),
> +	PINCTRL_PIN(5, "gpio5"),
> +	PINCTRL_PIN(6, "gpio6"),
> +	PINCTRL_PIN(7, "gpio7"),
> +	PINCTRL_PIN(8, "gpio8"),
> +	PINCTRL_PIN(9, "gpio9"),
> +	PINCTRL_PIN(10, "gpio10"),
> +	PINCTRL_PIN(11, "gpio11"),
> +	PINCTRL_PIN(12, "gpio12"),
> +	PINCTRL_PIN(13, "gpio13"),
> +	PINCTRL_PIN(14, "gpio14"),
> +};
> +

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
