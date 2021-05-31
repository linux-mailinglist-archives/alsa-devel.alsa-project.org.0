Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B756F3966BA
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 19:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45B3F1657;
	Mon, 31 May 2021 19:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45B3F1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622481438;
	bh=n2iIDAx4YOgopgtGBsssyJR888RGfK+EDhV/OcaSKEY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AVIALszxhNKZ16YhAz/8kDk+ZWv356eqU7CzdoGt8+xormFj9A8n6bjSsPr1ZsaLu
	 6XsgDtPc4dKwSoANB5pnuJ10BorHvNPRkkePNacL1G1QF/0rcV46U1wwPUfuHsLdHz
	 sEqwZqMvzQ7O1QxDC5imZG0VNsPitwk610a44EI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7AB3F80424;
	Mon, 31 May 2021 19:15:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F486F802E2; Mon, 31 May 2021 19:15:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C99F80161
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 19:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C99F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zSw+AuIm"
Received: by mail-oi1-x229.google.com with SMTP id a13so7473909oid.9
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 10:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iUt8SawagKvadLty0R2egCby5GFPDSWF/2fAwCO1WO8=;
 b=zSw+AuImUIvbaG+SENdRXVf75DqA+hNVwWWi02Rgo5PKBhnn9yMiEm/Wg+C3cPO98Z
 5xUYtifNJieL8Ux014tKJTwJw+Ugqddjje4CcWdzLPEjDUsY9WT8cjxDndQ0RQMPTQLU
 JiQocHzymUCqlCZPZ11qsL9jjzDENFRAgi8Odf4Q32o8QZHyilojAHdcuh712E0L0l4d
 hANoZ5AYFTnj5PEsCDDpNeHWiDeA1+/UVQsLk5NFkRTJC20yBf/y14DOFkBHNrrKpnai
 h7/4HVkdWBoc465yU3Rw0ul5KbwaFjkospDokkNum9mGHwkhhYu/6i70QjOledS2Js03
 yipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iUt8SawagKvadLty0R2egCby5GFPDSWF/2fAwCO1WO8=;
 b=UyowUPe6eqHfe4TYo2HcmBBAKOrzoamjrVlUMkyfeKCFpu9ecBbAs600GYtQn48CLU
 gD7ItLLBgrOfUwwMuPgGbYioyFT8pqsXVuMKYfCU6yfBIrcJrVPB4HioFd41tv+uBWhG
 5pwe7HjS4MRHKFce0Ll1E6ftvmP/1HERG9tFcbPKUbZPNIbw/mDduCmMZrRUPhjagr3l
 9+haz3ZxfnpK4Y8GIPQVL8OR9lK3DK8SLerh6KFIyLUWFRNpGmglu19z5ThKL/22rZot
 d5n+zfzEQIHsgXouYEoVES54O6eX9P7XM0pNRUDuzUTZXhJhsL9cAGXU2htzHtCsrnbP
 /tTw==
X-Gm-Message-State: AOAM533Mgu9fSdXM1cSMsoNGeJXzooE3+aU2U1DWe6506SwDbgbzsg6T
 /X1e/heIY5lLijitU8paJppPPw==
X-Google-Smtp-Source: ABdhPJyWIyQ2ftS7+5k7U8g5MCX3+iB3x50iEKcUA40a0tLmIrmfe7c3HX3IfCXL7EIIkaYf3pAmtA==
X-Received: by 2002:a54:4398:: with SMTP id u24mr14750888oiv.81.1622481339198; 
 Mon, 31 May 2021 10:15:39 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id o20sm3155316otl.2.2021.05.31.10.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 10:15:38 -0700 (PDT)
Date: Mon, 31 May 2021 12:15:36 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: add lable for secondary mi2s
Message-ID: <YLUZuP4F1nPWLY5f@builder.lan>
References: <20210531143557.3975917-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531143557.3975917-1-judyhsiao@chromium.org>
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, judyhsiao@google.com, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 cychiang@google.com, Takashi Iwai <tiwai@suse.com>, broonie@kernel.org
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

On Mon 31 May 09:35 CDT 2021, Judy Hsiao wrote:

> Adds lable for secondary mi2s to allow overriding.

"label" and can you please spell out why you need this override?

Regards,
Bjorn

> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293ef56d7..2027914a0bed 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -772,7 +772,7 @@ mi2s@0 {
>  		qcom,capture-sd-lines = <0>;
>  	};
>  
> -	mi2s@1 {
> +	secondary_mi2s: mi2s@1 {
>  		reg = <MI2S_SECONDARY>;
>  		qcom,playback-sd-lines = <0>;
>  	};
> -- 
> 2.32.0.rc0.204.g9fa02ecfa5-goog
> 
