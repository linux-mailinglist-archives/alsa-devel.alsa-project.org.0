Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98C5376456
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 13:11:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331E9167D;
	Fri,  7 May 2021 13:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331E9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620385878;
	bh=XNLV3v3FLvWKUeQ5ZjEMabq22Hy89QQ7yk7qx9tOO2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/euQSIv1ytQF55/d07uYgxXxet/dBPV4AR1C+dFpaeRCtoBMCAm6fi9xXUEqlZdJ
	 DPFU9oPZqVhS48kzf2IjXjL250KX+EoFJiOTlcbra4hWwR3Oh+M6npYV21w+5CSbYr
	 Q8jNRIcWpsR8fyt+tNQ7dVkZEbFxGc5WXfdRJN6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65194F80108;
	Fri,  7 May 2021 13:09:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDC00F8021C; Tue,  4 May 2021 15:29:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53122F80108
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 15:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53122F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zliUgqxP"
Received: by mail-yb1-xb35.google.com with SMTP id l7so12112687ybf.8
 for <alsa-devel@alsa-project.org>; Tue, 04 May 2021 06:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/BRhTEpnUP9fxfD+K9LGEgYyn57sT/mfo8VpaW+h4gg=;
 b=zliUgqxPji85MVuM2cxAmdIGtLCvTweTUHzYvjqkyKw1DFdDKq1FgLiw7mV9pHwZsK
 UNYPWJ8+d1pv3FHKwG+OH5uACLhSBfrX5oUh5tEeyGl1cSRpz40BunyzXFyCXT2NNmVY
 9XkgSQwzpmQWggXaG9OzAErU5CCPo5vc28rxA00FE8xrZUISN9W7KnFZxzrShWZ4IyWH
 0zHXDQAFrYohnLuRoHW9kJ5IMg4giaOwn5NnzlagJ7xjhIMX41k1UugAvKn+9fpmGMQi
 +pgHNzCz7T726HaoYWMzFwmIThbkuxMzph2vv4CsK/fZQNjKt8F+7S2Uz6cFMHr4QvbF
 JwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/BRhTEpnUP9fxfD+K9LGEgYyn57sT/mfo8VpaW+h4gg=;
 b=Y6lTvrli2Gu1EFA6kWWOIUjXYVWXljQVGQdSxn9EN/kwcZAw/oKYyyRqqedYp5q89p
 0qQibRXmk98A7rBZzaLDrVKTRiNSh8bEercR+daLA5KiU/9gnEjmwUS87vsh0C4zoFfi
 gmS24nM7CG3egwJJDsb6D3QODIaJKDwnHM1NJY7Kp5LROlTuvHeWpA+Gp2OKtpmQ+uW6
 PCTjFFChL2z/jxyFDG5wXvjFcAEFmAIy5PG7xji6qL1YI8MX795woSM9YruFCQRVh9dD
 M08SxFKDsdNS2q7YMAUFBvsg4LsAQVgMu3mU/JRquS3u+6DOmJI8rK+g3GWQJW5zSnBj
 0QOQ==
X-Gm-Message-State: AOAM530mPpSZTpDHTB9XYSpaTCoerqxkiBByGBBQT8IhrDhOLx0XZoux
 frIThi98QJ0z2uZqWh7PeZ/9zz2cIrWtoeoBadH4VQ==
X-Google-Smtp-Source: ABdhPJwjcqLzq5cHFekTHgpc3kqBBbnRLj4YJ8atyXG840GdCFl/o7yDSxXGW3nl7DG4qFazGfogmf6GNa3C7phTrw4=
X-Received: by 2002:a25:c681:: with SMTP id
 k123mr35487853ybf.303.1620134960204; 
 Tue, 04 May 2021 06:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210504125909.16108-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20210504125909.16108-1-srinivas.kandagatla@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 4 May 2021 18:58:44 +0530
Message-ID: <CAMi1Hd0Fxj2Y_ZheFGveCpz1XWHhOOx3UYz7xW4-8RVAN1TPAg@mail.gmail.com>
Subject: Re: [PATCH] soundwire: qcom: fix handling of qcom,
 ports-block-pack-mode
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 07 May 2021 13:09:49 +0200
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 lkml <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 John Stultz <john.stultz@linaro.org>, sanyog.r.kale@intel.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>, yung-chuan.liao@linux.intel.com
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

On Tue, 4 May 2021 at 18:29, Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> Support to "qcom,ports-block-pack-mode" was added at later stages
> to support a variant of Qualcomm SoundWire controllers available
> on Apps processor. However the older versions of the SoundWire
> controller which are embedded in WCD Codecs do not need this property.
>
> So returning on error for those cases will break boards like DragonBoard
> DB845c and Lenovo Yoga C630.
>
> This patch fixes error handling on this property considering older usecases.

Tested on Xiaomi Pocophone F1 (sdm845).

Tested-by: Amit Pundir <amit.pundir@linaro.org>

>
> Fixes: 5943e4fb14e3 ("soundwire: qcom: check of_property_read status")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 2827085a323b..0ef79d60e88e 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1150,8 +1150,16 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>
>         ret = of_property_read_u8_array(np, "qcom,ports-block-pack-mode",
>                                         bp_mode, nports);
> -       if (ret)
> -               return ret;
> +       if (ret) {
> +               u32 version;
> +
> +               ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &version);
> +
> +               if (version <= 0x01030000)
> +                       memset(bp_mode, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
> +               else
> +                       return ret;
> +       }
>
>         memset(hstart, SWR_INVALID_PARAM, QCOM_SDW_MAX_PORTS);
>         of_property_read_u8_array(np, "qcom,ports-hstart", hstart, nports);
> --
> 2.21.0
>
