Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A2659063
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 19:30:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34ED3844;
	Thu, 29 Dec 2022 19:29:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34ED3844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672338631;
	bh=zpSbcCNK25rUjje8uqqFcgexRmkYeOWXvSLNq8K+unk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aMXriv52OWRDspXJ11Z/pEWbcmN+qO7P2D72tIrmdEeSFXwE0YAsXgRdrFaxusbiY
	 6okPzowDgJLX5VYSwDNLxHqc9XcR/JivjIHmavxgD1S7u+NruR8/1NS+oAM0Cbw0QX
	 GO25SCvkL8QRRdoQZIx3/KSqfNoKw/dR21Wky/DA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0675F804E7;
	Thu, 29 Dec 2022 19:29:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E795F804E7; Thu, 29 Dec 2022 19:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 736AEF80246
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 19:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 736AEF80246
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lCbmrJSG
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48B4A61862;
 Thu, 29 Dec 2022 18:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37D6C433D2;
 Thu, 29 Dec 2022 18:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672338560;
 bh=zpSbcCNK25rUjje8uqqFcgexRmkYeOWXvSLNq8K+unk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lCbmrJSG+11bT6Xk4w5ANPk6tJ9lXJCg/jnPVRQI6Iz5cqMi3EOu6GzdMdJKptvtK
 Fzg/3KfQKl1ncyFvBTFf7lZjxtFrvrQggVe9TKVLyq3Q1PPbrFWMreKzfMMx2IfopG
 kbBcYl4vKRR0ktb+qXv+TIsOr6tEySd+3Q0Ivukg641GnUdsFOp9ZAArZc5wd1FzYK
 KlBjW8+U4EPZCk4B2UiNa7bMHJFzoZo+oZmtbTGNvGNl/P0jqjiIuzP5tca3MNob0Y
 So24ukmCHqhqKNizbasfC9PX+ZZG0j59ygUBo+0WV5O/+VSEPMyXy8EGj3/8IG5p+G
 y9lBkTRhszorg==
Date: Thu, 29 Dec 2022 12:29:17 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: apr: Make
 qcom,protection-domain optional again
Message-ID: <20221229182917.j6wrerqufom3hfx7@builder.lan>
References: <20221229151648.19839-1-stephan@gerhold.net>
 <20221229151648.19839-2-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229151648.19839-2-stephan@gerhold.net>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Dec 29, 2022 at 04:16:47PM +0100, Stephan Gerhold wrote:
> The protection domain functionality exists only in SoCs starting from
> MSM8998 [1], while the APR bindings are also used on older platforms.
> 
> Commit 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to
> shared schema") made the "qcom,protection-domain" required but it
> should remain optional to avoid dtbs_check warnings on older platforms,
> e.g.:
> 
> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb:
>   apr: service@3: 'qcom,protection-domain' is a required property
>   From schema: Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> 
> [1]: https://lore.kernel.org/all/20200312120842.21991-1-sibis@codeaurora.org/
> 
> Fixes: 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to shared schema")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr-services.yaml      | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> index 290555426c39..bdf482db32aa 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> @@ -39,8 +39,8 @@ properties:
>    qcom,protection-domain:
>      $ref: /schemas/types.yaml#/definitions/string-array
>      description: |
> -      Protection domain service name and path for APR service
> -      possible values are::
> +      Protection domain service name and path for APR service (if supported).
> +      Possible values are::
>        "avs/audio", "msm/adsp/audio_pd".
>        "kernel/elf_loader", "msm/modem/wlan_pd".
>        "tms/servreg", "msm/adsp/audio_pd".
> @@ -49,6 +49,5 @@ properties:
>  
>  required:
>    - reg
> -  - qcom,protection-domain
>  
>  additionalProperties: true
> -- 
> 2.39.0
> 
