Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF876402FA6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 22:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E0D51719;
	Tue,  7 Sep 2021 22:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E0D51719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631046370;
	bh=dNpeJZo/Vt8zTY0ZT5Vlv86c1MhmUpDdRE5XYkW7sDc=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hl/tJyTxhqY5dH8uuBSp1CwTI/TGD5o6OD077WRS+BYNFjaZXVcdyDWHTKPWccN8r
	 dIQ4/loclmZm+xflFUrCiQ7SVNRn3Ba3I66+9KQi2XyQ5uzcV+SZbnc+K6KB7qdss9
	 Yf/SsST+Vt786cLKW0XC0aPfBgIJYCG/sZgr0+Wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3D64F800C7;
	Tue,  7 Sep 2021 22:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0136F80224; Tue,  7 Sep 2021 22:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5993DF80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 22:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5993DF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ac1bVM1O"
Received: by mail-oi1-x22c.google.com with SMTP id bd1so43550oib.5
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 13:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=4Ct+8J2ifge5ggp2gE0gOkYDrnGF9mo4g/Q9D3/pN+8=;
 b=ac1bVM1O6RwhWng54fAfxrFOy+JL/L/5Pvk4SsP5V2lqWqO0tdzymIuJBPYMPLJpVP
 cHg8xhnPO66nLr3qFOBGBwZDK6PcqQOaNdigexv9vf2bORhtfhCk0LPpu8I/WTHaQv5Q
 XEAPWK4jXsRni4pmWsqlLVOcsztF4yHZAjHLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=4Ct+8J2ifge5ggp2gE0gOkYDrnGF9mo4g/Q9D3/pN+8=;
 b=mxnzyPPCs4T1ajWVmXjGpKftgjgNIjSM4IiKTCMZyFN7+LS5E1H4lu3VKA89YDV+p3
 6/B32mOl1E6/CTWzY83UKhF2Hm855a+R6RN1tutYvoDALVij5YABp0vBiawXGYCWzoUd
 oIx3nuImiQ++bRRcQBfjIyTKpeQXN9NXOL8qbL6ZUiSpM6Tayol8E3k/kAL1HB+LFg5j
 zafMm7OY8/FVx2635cj7IQ2YTgDes8RIkJkL1PRLDqzWqwa5qsaZw6hoob7/7t2Jkkt5
 lmNC8yhfDdK5eL0rmVkXt96SypWsTAcQenHtWW4rvpSnUPUoV2QhNL3at90nXEu8gSWO
 rpJg==
X-Gm-Message-State: AOAM533OqOFJJRiFRXdlcjRuBpj7SPw3dWKE9nFNTcgOC+baI4pAKmWE
 ZHn6QfAa1Y4vJNwU+AR3mACVzsJIWcjub7JEhn29Qg==
X-Google-Smtp-Source: ABdhPJw8IBECs6E6HzSClI35bkZHFkQNXFiZIvmvDm6b0kdi+6q7O5NhDowqashx3RMvTC0TSLKHssXO4zHP9hLy0C4=
X-Received: by 2002:aca:2310:: with SMTP id e16mr13313oie.64.1631046283694;
 Tue, 07 Sep 2021 13:24:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Sep 2021 20:24:43 +0000
MIME-Version: 1.0
In-Reply-To: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 7 Sep 2021 20:24:43 +0000
Message-ID: <CAE-0n53Zj3pp4EJ_f_kXhRm3EW=od83UO44qt91P37waEq-z4Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for digital
 codecs
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-09-06 06:27:34)
> Add header defining for lpass internal digital codecs rx,tx and va
> dai node id's.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  include/dt-bindings/sound/qcom,lpass.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
> index 7b0b80b..187af45 100644
> --- a/include/dt-bindings/sound/qcom,lpass.h
> +++ b/include/dt-bindings/sound/qcom,lpass.h
> @@ -10,6 +10,11 @@
>
>  #define LPASS_DP_RX    5
>
> +#define LPASS_CDC_DMA_RX0 6
> +#define LPASS_CDC_DMA_TX3 7
> +#define LPASS_CDC_DMA_VA0 8
> +#define LPASS_MAX_PORTS 9

Do we need LPASS_MAX_PORTS in the binding?
