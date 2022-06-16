Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831E954EB63
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 22:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DA151B01;
	Thu, 16 Jun 2022 22:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DA151B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655412028;
	bh=pmK7hqntMtift0Pd/khpkTdQCSMUI0c+tUiQ8GB6EdQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0B7Ypqsu3ohSqORrGbywVX8ELNoShiBeuxKuE0+28B4zLgRFzWz7QhwSFxZWZfGb
	 oowMrSoTIGOvduVGEyIjmB2Mmca4c64bUbVz+J8JYzPggRCNbzqSEJ+kDfeveyAgB2
	 DtJtYCBLqMVjkhNRiR96RbnwJAww8xuUXprsYMlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A558F800B9;
	Thu, 16 Jun 2022 22:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A5E0F801D8; Thu, 16 Jun 2022 22:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37E7F800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 22:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37E7F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ROZn+y/7"
Received: by mail-pj1-x1030.google.com with SMTP id
 v11-20020a17090a4ecb00b001e2c5b837ccso2806170pjl.3
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 13:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pkTlqBCv4kkUBzXfdE69AlbwDzWnDXPmq1X/ctwZ1RI=;
 b=ROZn+y/7o3WKT8p5stMPNJszpKJne4D3/Za9voE4D9qs7VwnFgZTseD6+HxsBnKHov
 rlTxbyYs4W0Iquvo4qHE70ivqOFlD9BOvwBoC+2PAKOw5Li1rI5SuWzQIMoZoQdgMPQQ
 xeKSWDr237Bfr3p2GiCiYStFm/NkPc/o4cp4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pkTlqBCv4kkUBzXfdE69AlbwDzWnDXPmq1X/ctwZ1RI=;
 b=N83jgB+tXTG4J1pu9yWgRV8q9eHo0LgOI5kv480S2Hs8svcaYAULKBUMsECKI7Pcse
 Q8OGnIvIs3iSOTy65+VHcxnybSA+GE6Jau33HprJsxoAzg5Eoxeb3NhFq8DX2kgU2RAY
 lMjm06rsCPP5FYwJVkc7yNtnjrH3ccoGGOzUWbD0QKKVIy4X7aUfeE6SJHAMFMFPSNop
 jnPWdQzqWAS+g4vyVOVwoX8VZkKvJjlYKtAF/+Z4Uj7evSHdMd9/vRIc6r94uDHqD24P
 qCOOlShfFleTXqHm3Gp+08BRN2sBGIMuGhgFaisHqTnJHY9JUck/xI0wx0c4LRedD+Ro
 ymyg==
X-Gm-Message-State: AJIora+ScDENPPSL2m9WvU9SmO4057cbUYCVJqZTV2RR1AjM5im0wiSx
 NPHLAdBsjLczti+M4rNvYL7KTw==
X-Google-Smtp-Source: AGRyM1uRzdYi2h3WMgzsyG09F2s9/Uo4CiVLNg4n/tohSEwV59gL8BG6VgxVEBMNWkC3PEFczoXGPA==
X-Received: by 2002:a17:902:a609:b0:169:a8b:7c3c with SMTP id
 u9-20020a170902a60900b001690a8b7c3cmr3281133plq.67.1655411957916; 
 Thu, 16 Jun 2022 13:39:17 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4709:a407:1ca6:24ea])
 by smtp.gmail.com with ESMTPSA id
 jh17-20020a170903329100b00168b9093a06sm2038204plb.243.2022.06.16.13.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 13:39:16 -0700 (PDT)
Date: Thu, 16 Jun 2022 13:39:14 -0700
From: Brian Norris <briannorris@chromium.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH v2 3/3] ASoC: dt-bindings: rockchip: Document
 pinctrl-names for i2s
Message-ID: <YquU8hN+9ETu8tB2@google.com>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220616155836.3401420-4-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616155836.3401420-4-judyhsiao@chromium.org>
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Jun 16, 2022 at 03:58:36PM +0000, Judy Hsiao wrote:
> This patch documents pinctrl-names for i2s.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
> index 5ea16b8ef93f..af1069278623 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
> @@ -61,6 +61,13 @@ properties:
>            - const: tx
>            - const: rx
>  
> +  pinctrl-names:
> +    oneOf:
> +      - const: default
> +        - items:

I'm far from a YAML expert, but I think you have the indentation wrong?
You want the "const: default" and the "items:" schema to be on the same
level of indentation, right?

If you haven't already, you might run through the 'make
dt_binding_check' process.

Brian

> +          - const: bclk_on
> +          - const: bclk_off
> +
>    power-domains:
>      maxItems: 1
>  
> -- 
> 2.36.1.476.g0c4daa206d-goog
> 
