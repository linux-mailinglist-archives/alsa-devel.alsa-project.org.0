Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A305BA9BC
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 770A81AA8;
	Fri, 16 Sep 2022 11:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 770A81AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663322179;
	bh=pBZfZnF367uJzd8ea6waz1hCGji3S73heEJwNc2UmTA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hxV8VissvQ0byAWzdlY/zWX38eor8W2K9REiiR0F1xwbrTzPqpMisV1O92G5dWHyH
	 dHlMiz4vkAKi8E0uDuopUhsz96VBGn5wjbhw1/3/AF8kb40Pupklzo4dH8VSI6RQXW
	 hjxpZJUyKHCawo4GtH8uU61ls8pD4KUAqjhBkaAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63573F8055A;
	Fri, 16 Sep 2022 11:53:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E188F80238; Thu, 15 Sep 2022 19:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF49EF8008E
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 19:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF49EF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HSa8lPN+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 844C1B821A0;
 Thu, 15 Sep 2022 17:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7E8C433C1;
 Thu, 15 Sep 2022 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663262619;
 bh=pBZfZnF367uJzd8ea6waz1hCGji3S73heEJwNc2UmTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSa8lPN+3ZKAfu6aW3ra+49E5CpJZnIyMhgQmOLb3RZF9/uSDtJSI2HDqFbS1dJYP
 2jtVRHb7YalMtbsk7ztOEFMDyN3rJjAdINFBiUOhQ2PSqrXTOXFbTRQkddmb917YMe
 Wvp0BjputE7oaVsgn2dcagxnHrEbxVWbSI4A4CX9ObPkHRGd3utO6Ff3bxj9kg9Q/j
 XJ7QtP5+5BHHNIAfzTe+T+ezmiekda0deA03OOeZUBp5vNGBa0qfgsH1j6s+F4e9Nj
 RNVYoaaOHYnFOF0OqQoLL2pTKyI+s9Zzj3ouGtGuU/8G7TDaPU/BEkSksufFRDCatv
 SgJjFlTEk4A3Q==
Date: Thu, 15 Sep 2022 12:23:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 2/4] ASoC: dt-bindings: qcom,sm8250: add compatibles
 for sm8450 and sm8250
Message-ID: <20220915172336.zh3l2kb42uis45ey@builder.lan>
References: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
 <20220915125611.22473-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915125611.22473-3-srinivas.kandagatla@linaro.org>
X-Mailman-Approved-At: Fri, 16 Sep 2022 11:53:36 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@quicinc.com, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org
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

On Thu, Sep 15, 2022 at 01:56:09PM +0100, Srinivas Kandagatla wrote:
> Add compatibles for sm8450 and sm8250xp based soundcards.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index a3a4289f713e..58b9c6463364 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -23,6 +23,8 @@ properties:
>        - qcom,sdm845-sndcard
>        - qcom,sm8250-sndcard
>        - qcom,qrb5165-rb5-sndcard
> +      - qcom,sm8450-sndcard
> +      - qcom,sc8280xp-sndcard

It's nice when these are kept sorted...

Regards,
Bjorn

>  
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> -- 
> 2.21.0
> 
