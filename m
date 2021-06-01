Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A5397770
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Jun 2021 18:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D3C0166F;
	Tue,  1 Jun 2021 18:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D3C0166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622563390;
	bh=RexKHh+1zqFTGVFyskSePguoSr/2ht2pIW4Xfa/3vaY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjYHMzYmaGEcPzhGAbuP6eUBMhhfaRFluSGwGYx8xdpTTpK7tfLbCd2YwD7T+mWD4
	 CimlIeocC3rXYD/6WlEt+nkOu6av4NsFvvq3P7vcft1h5+npEkUgFA1PkZUGrXsoAB
	 xQsPz5+g7sGKv2bGrPCY3fPMGObN7c+1XF5G5L2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B503F80141;
	Tue,  1 Jun 2021 18:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD326F80254; Tue,  1 Jun 2021 18:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9701F800B2
 for <alsa-devel@alsa-project.org>; Tue,  1 Jun 2021 18:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9701F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mMMV4R4H"
Received: by mail-oi1-x22a.google.com with SMTP id u11so15957145oiv.1
 for <alsa-devel@alsa-project.org>; Tue, 01 Jun 2021 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ivRylvAoXWYGi0EX7Wjf2GRwNOYBh6koZn9LtD0Oi0o=;
 b=mMMV4R4HRszVvRwUR34BU3fHfE9s3UWX21Hr5qVyKvNQkEPMtyvT+NnetgjSbY7nzN
 z9z7J+Vgy2hXQy3pEZ5TPVNrTP3R2YOSlXVdWVejfQydgwr6/DFIfNddtZocX+UCMM3w
 DgXEydpN+gflCCpGcM5ZuRmbvpOQM631lPM+8FzhXy83Gw5WyZtXFP7L9B96a/2i1b7U
 40P6xYNMb1GOmbW2abbTVEkaZX7C4+dBaPOrMt1DsbxSnqqzqhoenH3qNmzLBymB+Sbe
 AV7rL1NTA1GUTLzqVMIj+uqYfx1xX0NwigiJBSBrPt0q2QdnHWHir/omT1KGV0wktkFF
 Onvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ivRylvAoXWYGi0EX7Wjf2GRwNOYBh6koZn9LtD0Oi0o=;
 b=a9iClBXalcYrZUIjEXWiQccfcMZjL0Lpe/6BuvULVOkITuidTcJ34mE7NbTrigwkMk
 VcAgmvrRdv+v9KtIYg7omKBLiRti/QTL7u6EBU8qCuTiy07hwjNHKxDYnQyQnyk9eerc
 xAsW8EKbewbGnKj7M93ClxQLXk3uJ7d4ml+LE5dWPra6xhGhlFg6GRWlIzAI/8K4PqXf
 yuj4yzs6t2HAgn28NF4Tukxwip5c8lDxPAqh66bP98ljd2TgEUtwGyPhLTMVuLRT0dO5
 ZmeFbw0x+vOKWRF5t/RcFSoYaCA8DB5OgPKQ2rC7LjiLzJZup1OqV+O2BbN9GanTFved
 IP2A==
X-Gm-Message-State: AOAM531jbNbJgFjTH22bSwmeaWo0HftV4lGvuCgkHFrsRMJkQzHZ/bhI
 hM8Sni/D8ALPE2KAy0G32ztKtg==
X-Google-Smtp-Source: ABdhPJyiEYPb4B5zl9mHjhnZ9gz3r5vQbpvCP9o6iAbqLjQr9URkhGGUDiwBJYlNnBWlsssskP8PoA==
X-Received: by 2002:a54:4e87:: with SMTP id c7mr464614oiy.82.1622563289363;
 Tue, 01 Jun 2021 09:01:29 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l20sm3417058oop.3.2021.06.01.09.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:01:28 -0700 (PDT)
Date: Tue, 1 Jun 2021 11:01:26 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: add label for secondary mi2s
Message-ID: <YLZZ1iEGwkpcQUo7@builder.lan>
References: <20210601022117.4071117-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601022117.4071117-1-judyhsiao@chromium.org>
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

On Mon 31 May 21:21 CDT 2021, Judy Hsiao wrote:

> Adds label for MI2S secondary block to allow follower projects to override
> for the four speaker support which uses I2S SD1 line on gpio52 pin.
> 

That's much better, thank you!

Regards,
Bjorn

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
