Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C029659007
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 18:55:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C22C4145;
	Thu, 29 Dec 2022 18:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C22C4145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672336502;
	bh=ayTVFPv8VuZpGvaOQ0MSBEsIvGgD+9LIYrBq/0NdOEk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=up7Ua6WjVtnagXLIIr2kOLjN0D14qBUS+ZGX9xxVSBT3wbGcEAXEhwSHpX5u+b7aK
	 pGtYylRd6XnXGOOdqg3GKF/A41ev2LCzecFxKdMn/Hm3ixdaAW1dWrzVaaG8toexJX
	 E/aNNz86YzbW2pXS0D0HYfkPs5uwPMhee9kEpHDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9306EF804F1;
	Thu, 29 Dec 2022 18:54:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2396F804E4; Thu, 29 Dec 2022 18:54:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4839FF802A0
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 18:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4839FF802A0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=prqWLcRX
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 047B9618C8;
 Thu, 29 Dec 2022 17:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63366C433EF;
 Thu, 29 Dec 2022 17:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672336436;
 bh=ayTVFPv8VuZpGvaOQ0MSBEsIvGgD+9LIYrBq/0NdOEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=prqWLcRXvjhWOh7PDzmUDxoTHWjnSs/RS1IuLrM2gmGLX70CJBxW4th4R6zt9XlQS
 6r9aUq5eAbzjbpaiTRXC2WOqTpS2e1Gmg7lUKNK6zFIChHpuQf3tDPb33sJBB0imU2
 5A2T3jYJmYUTE4YHR0V5SNb28GTDFRmbnCr2iCYERrEV12fuSQqM2GADT8SX2a717/
 e90HfOHqLJX8O8GULtXlNFtOHl89PosM0oWpWnnA4gh/uKtSFv7D/MbiTTYl36hSNr
 2Kl/dKp8c2Ji8wHBLZ91Y3/hMvjyXzLymY31VPEspn69UzddojPBlfKBjxTX613kQI
 uPgF+3u7341Mw==
Date: Thu, 29 Dec 2022 11:53:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 2/2] soc: qcom: apr: Make qcom, protection-domain optional
 again
Message-ID: <20221229175353.msas6w2eaunv4gt4@builder.lan>
References: <20221229151648.19839-1-stephan@gerhold.net>
 <20221229151648.19839-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229151648.19839-3-stephan@gerhold.net>
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

On Thu, Dec 29, 2022 at 04:16:48PM +0100, Stephan Gerhold wrote:
> APR should not fail if the service device tree node does not have
> the qcom,protection-domain property, since this functionality does
> not exist on older platforms such as MSM8916 and MSM8996.
> 

Forgot that when I reviewed 6d7860f5750d, but you're right. Sorry about
that.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Ignore -EINVAL (returned when the property does not exist) to fix
> a regression on 6.2-rc1 that prevents audio from working:
> 
>   qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
>     Failed to read second value of qcom,protection-domain
>   qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
>     Failed to add apr 3 svc
> 
> Fixes: 6d7860f5750d ("soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  drivers/soc/qcom/apr.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index cd44f17dad3d..d51abb462ae5 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -461,9 +461,10 @@ static int apr_add_device(struct device *dev, struct device_node *np,
>  		goto out;
>  	}
>  
> +	/* Protection domain is optional, it does not exist on older platforms */
>  	ret = of_property_read_string_index(np, "qcom,protection-domain",
>  					    1, &adev->service_path);
> -	if (ret < 0) {
> +	if (ret < 0 && ret != -EINVAL) {
>  		dev_err(dev, "Failed to read second value of qcom,protection-domain\n");
>  		goto out;
>  	}
> -- 
> 2.39.0
> 
