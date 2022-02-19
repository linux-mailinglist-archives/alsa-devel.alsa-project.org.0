Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E524BC4FE
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:44:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA1D817CF;
	Sat, 19 Feb 2022 03:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA1D817CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238688;
	bh=014ucoLmLZKoW+u9rrEk7PlAOl6zKSpKB5MHAKfT78s=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YkWnVWBlpSgNMfMB4hb4V8ORdNCT9wKCdcT8WRZ4e45TUjbK15ptgVO++GTNPhvrl
	 EO1O/0nkqUoNj4PmyNG0tJB5bKnWffakSi3HJcSOIlsO6tqux93kZq5Wekr8r6mBwI
	 HrlxmGlakcMIWl0+ShE+8livWpmwsGRPFzN9gahU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B415F80118;
	Sat, 19 Feb 2022 03:43:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 153AFF8047B; Sat, 19 Feb 2022 03:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91683F80118
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91683F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YXQoib1c"
Received: by mail-oi1-x229.google.com with SMTP id q5so5077900oij.6
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=T6YKxmWEz7AOdGW5A6l/US7/zZ5Y8isivPpi4loytTw=;
 b=YXQoib1cF59dR1Ga68uc3HOYXQPS149MEtMxdda+swZtnY6HhQDt9/fbgprCKLT4yr
 xkRsaBWX7bufF32Md2CRjB86jat7u4T72Ngx6AWxnWONIqPYRtNce8FUZx2wQEjh+FbQ
 Z9I4EiPyRCCiA5ZXaCXpcLxXIl7KlnN6fTHDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=T6YKxmWEz7AOdGW5A6l/US7/zZ5Y8isivPpi4loytTw=;
 b=0lvllOaI5hYVhZe1jzcHoEkdiZdAflTm5nAzCoHyodWrqUBZk/M766PeQahye/N+ZU
 OBHnhs8P4zvU5ZerqC5KhAZ6d9OU4ri/XJqsrvltF3Su4O582Xn43PgEbwDvdFHChO6P
 1oS7WzJ31I7Od6SxaHKfw5UzIgvGpnSNVlx7er2UYPkay+8VvFK21IPIwSJM9o7gX9ia
 ppK+9GsLDveoO7UpXK0Xbzi7+QMZdmpggGUV8krGH+DXS082ZsUmWRoAurY1HY4SNUdH
 wPjbEofIrQlEiLMXFIV1m+UofyyusEqxwoewh4zphr6yfrooNKa31o5vYsYjujlESATd
 QEHQ==
X-Gm-Message-State: AOAM532ulqbgf0vWa+/K+CM92fZM7+278WQgmNZPdZahgMicgd5rkBJv
 q64OxSa1D+LDzjOyJNshnIufVwyJOqXeSYocGCLrMw==
X-Google-Smtp-Source: ABdhPJz/KsMR5cwJXf4h7firlHqcR38NSaLD0e9vVXsj0n4ovrJXx7T2uNws7j4DG1rO95sIaCLrNdWZrYLYo6BuXoA=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr6309701oig.40.1645238631013; Fri, 18
 Feb 2022 18:43:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:43:50 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-7-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-7-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:43:50 -0800
Message-ID: <CAE-0n533mcROZYQ_6SrH4gMhFXjME=1R9oMknsJDcwLUT1LGPQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] pinctrl: qcom: Add SC7280 lpass pin configuration
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:53)
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> new file mode 100644
> index 0000000..5bf30d97
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> + * ALSA SoC platform-machine driver for QTi LPASS
> + */
> +
> +#include <linux/clk.h>

Drop unused include.

> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-lpass-lpi.h"

include ../core.h

> +
> +enum lpass_lpi_functions {
> +       LPI_MUX_dmic1_clk,
> +       LPI_MUX_dmic1_data,
> +       LPI_MUX_dmic2_clk,
> +       LPI_MUX_dmic2_data,
> +       LPI_MUX_dmic3_clk,
> +       LPI_MUX_dmic3_data,
> +       LPI_MUX_i2s1_clk,
> +       LPI_MUX_i2s1_data,
> +       LPI_MUX_i2s1_ws,
> +       LPI_MUX_i2s2_clk,
> +       LPI_MUX_i2s2_data,
> +       LPI_MUX_i2s2_ws,
> +       LPI_MUX_qua_mi2s_data,
> +       LPI_MUX_qua_mi2s_sclk,
> +       LPI_MUX_qua_mi2s_ws,
> +       LPI_MUX_swr_rx_clk,
> +       LPI_MUX_swr_rx_data,
> +       LPI_MUX_swr_tx_clk,
> +       LPI_MUX_swr_tx_data,
> +       LPI_MUX_wsa_swr_clk,
> +       LPI_MUX_wsa_swr_data,
> +       LPI_MUX_gpio,
> +       LPI_MUX__,
> +};
> +
> +static int gpio0_pins[] = { 0 };

const?

> +static int gpio1_pins[] = { 1 };
> +static int gpio2_pins[] = { 2 };
> +static int gpio3_pins[] = { 3 };
> +static int gpio4_pins[] = { 4 };
> +static int gpio5_pins[] = { 5 };
> +static int gpio6_pins[] = { 6 };
> +static int gpio7_pins[] = { 7 };
