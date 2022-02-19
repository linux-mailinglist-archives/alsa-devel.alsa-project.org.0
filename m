Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8C24BC4FD
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:44:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A59D1760;
	Sat, 19 Feb 2022 03:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A59D1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238646;
	bh=UtmLegRwkVr3wWezyzKfAFB4JnMC10QKAFNciSgGel8=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crF4nx/78Eh9Q1PGwgKJTcicIm0aCp1CuV4G4gMTgAYrYOzrVULgCp9WH3QT/ripX
	 fW/4Yyw+sxEVBqwKoYRik9rygN5YNl+X/K+1OR/BJRqALtM2iVdD8EidRCGdC2iqsT
	 JWM+6E3UKTlUV2RFb9HQkorx7OejcTvmJRUow5vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27750F8014B;
	Sat, 19 Feb 2022 03:43:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A970F8016B; Sat, 19 Feb 2022 03:43:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54A81F8016A
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:43:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54A81F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gp+cIOnx"
Received: by mail-oo1-xc2d.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso5849056ooa.4
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=UtmLegRwkVr3wWezyzKfAFB4JnMC10QKAFNciSgGel8=;
 b=gp+cIOnxmQg7Dp1LrEiyItHTBnFsiBoTH+TFr7BWN7cP6hlyyWou26Z7+8zcEGyJ2A
 AjBu6Wq3JamEwfL92rRMKTo7LVZhOsOElFEBmt4PUeKVsbYyub6dYvBg4Kh1nFqHigM4
 deFs0k/av9MBoIE02OhAuN4jGzs4Q8njkTe60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=UtmLegRwkVr3wWezyzKfAFB4JnMC10QKAFNciSgGel8=;
 b=fYUjqfWvqjKzcJs3utWy+nVtepz8T8Kp/GwKM0V1K+Ph91q937VRYyuybN2FudqoyV
 RluvYZZaKnkPm+KIDbFOohjbRj3oJU28QQSoHTKNzbfoy15dr9EFNg2Jq6QYneR26kMJ
 EbvCxpuy8hX/x4fZDRYH3uPwrKIjElmFOkFV5RfaDMpfToGR0gQJpTe2OIL09PcUXX7e
 FV8lPbptndirYa06O8FZALo6If5Sd2kAv5acq+BAt9PjZji08yfFXAEz5b0Ed/m9tbwZ
 2o1mSzyS5+i9Dx5MB8/OjqRZHZysaZ+/f3+xGLCVL26bRCnAQ4tTAwZk5KzAboXM9HGZ
 EePA==
X-Gm-Message-State: AOAM5300bc9KanCrADJAP++eMFy85BUdJTiBl9fzZc4d8lS+qC3m9u+a
 UqabaEmFtkdJfWU1TyWBsLo4e9rVfrsu0wPAUiW8lQ==
X-Google-Smtp-Source: ABdhPJyJRpYWmNIAyLH41NYmoT3dSHWPGOzyrIKyiiCwW0H31OICFyU7NDyFeQSP1l2LdJpQqD2GSgVtwJOSExvYoaQ=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4191267oap.54.1645238589326; Fri, 18
 Feb 2022 18:43:09 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:43:08 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-6-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:43:08 -0800
Message-ID: <CAE-0n53-GRneymVoac=AT6M17aYseS88vM-o1xZxmk8sFQOYhw@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] pinctrl: qcom: Extract chip specific LPASS LPI code
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:52)
> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> new file mode 100644
> index 0000000..27e358e
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
> @@ -0,0 +1,166 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2020 Linaro Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-lpass-lpi.h"

Please include ../core.h here as well for the pin_group definition.
