Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7055BC05
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F6211688;
	Mon, 27 Jun 2022 22:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F6211688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656362496;
	bh=q2zvoDoHLI8vzyBKC6tznqwjhjMUqV3ZFXMuuLWUIXg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IuW4gs0SLdO0jii+2ToThoXSONA1bLlkGIMgylTuASA836i84GLuBz+6IoSlIW/WK
	 f81MzSDFNNDX1howho13hppg8TnMb979Gfg0Kvmv3NHCH8cLVAMhS6lLocGVCT1Eo9
	 +u4twwNFpFNxvR2z4cJ1JxAmE/KinciE1QMBaM4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B97F8028D;
	Mon, 27 Jun 2022 22:40:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E62D4F8028B; Mon, 27 Jun 2022 22:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAFA6F800E9
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAFA6F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="F0+f2j6f"
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-fe023ab520so14413165fac.10
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jmzqCLZEusFvK30GUvwarTPAI/2hAGgafpqukT2uCeY=;
 b=F0+f2j6fH/kSwW8e/OqSf1WkPdi/HOLnWsY5Wc11wwGJIJHoHKiCOiRdy0CBi4xpC/
 UjF8PzFLbSdglDlCkSvxR23w6DYPoR4VC8KvlNg6/+q8nXASFfihtjl1ntPTBtdvm0hp
 GYW7SbFIoQ+kMeMbgcn3KJ6yRldtsLD7RvVe72K27HWOXBi/cgvEqJnn82d7Ikcsntuz
 028Xoy0Q2Xzlfvvt+U8FwqmrZrIrhlL1GME62bwBqNf1FA8+Rz1/h5EJ2CowyRJs9ZPp
 w5xofn+9XZmS2+3Y1W8XMNNk1lyHpBoy5T17Xt6Ut2iQT1WpCXXMG27pNoRSBx4Ic4CC
 jslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jmzqCLZEusFvK30GUvwarTPAI/2hAGgafpqukT2uCeY=;
 b=qKlsEQsfJueNSpf/r0BNmNOviCkuqPIiXIyLvNLSzK8lnjeBOakcIaNJoKABdLBqt4
 ayNRvX4HD1iyoRsiVO/AHoh3AW3F5CKKKD9Qea/ter0vqEtT6j1Tx/xHrL/YgxYxzEE1
 zpaklLaMZeL35T7qkWVshS+jcFbQEjssLDK60bd7PvCwRGwK0SJDd3pH7dj0pUKIcCeM
 dQFVEcABd4KrIcYyitzZ+w2hfSwYt12LV90fL50aBMOl1bYgA788GV7DcCWweBYBe4Id
 Quvw5mfsw6wVWSrBLq5Zf1Q7CDOE5Ztw5+y7vrQ4km7Pv6trVDk1wQt6Z8JZqwDU1kzX
 N7LA==
X-Gm-Message-State: AJIora/omboET8UDwVRgmYVWlJXQMxvadiwTWotqxklYcSP+wbH9Mw7I
 bBDt0iNO3HQhPusrRxUliuFscg==
X-Google-Smtp-Source: AGRyM1t6hiie7pEhqg3xvsIsHHhFpIuSUQyQD0JXZnqL06hesjet/y04wFsLleqR34mUqH2RbK0jUQ==
X-Received: by 2002:a05:6870:f616:b0:f2:dac0:e339 with SMTP id
 ek22-20020a056870f61600b000f2dac0e339mr11702877oab.116.1656362425179; 
 Mon, 27 Jun 2022 13:40:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 c13-20020aca1c0d000000b003351dbf5e36sm5835177oic.43.2022.06.27.13.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 13:40:24 -0700 (PDT)
Date: Mon, 27 Jun 2022 15:40:22 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: qcom: lpass: Fix apq8016 compat string to
 match yaml
Message-ID: <YroVtj4zXXcHygxD@builder.lan>
References: <20220429220349.1142759-1-bryan.odonoghue@linaro.org>
 <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220429220349.1142759-2-bryan.odonoghue@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org, krzk+dt@kernel.org
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

On Fri 29 Apr 17:03 CDT 2022, Bryan O'Donoghue wrote:

Adding the sound maintainers to To/Cc, please advice if you would prefer
Bryan to resubmit the patch with proper recipients.

> The documented yaml compat string for the apq8016 is
> "qcom,apq8016-lpass-cpu" not "qcom,lpass-cpu-apq8016". Looking at the other
> lpass compat strings the general form is "qcom,socnum-lpass-cpu".
> 
> We need to fix both the driver and dts to match.
> 
> Fixes: dc1ebd1811e9 ("ASoC: qcom: Add apq8016 lpass driver support")
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Once this patch is picked up I can merge the dts change.

Regards,
Bjorn

> ---
>  sound/soc/qcom/lpass-apq8016.c | 1 +
>  sound/soc/qcom/lpass-cpu.c     | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 3efa133d1c64..abaf694ee9a3 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -293,6 +293,7 @@ static struct lpass_variant apq8016_data = {
>  
>  static const struct of_device_id apq8016_lpass_cpu_device_id[] __maybe_unused = {
>  	{ .compatible = "qcom,lpass-cpu-apq8016", .data = &apq8016_data },
> +	{ .compatible = "qcom,apq8016-lpass-cpu", .data = &apq8016_data },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, apq8016_lpass_cpu_device_id);
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index e6846ad2b5fa..53f9bf6581d3 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1102,6 +1102,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  	if (!match || !match->data)
>  		return -EINVAL;
>  
> +	if (of_device_is_compatible(dev->of_node, "qcom,lpass-cpu-apq8016")) {
> +		dev_warn(dev, "%s compatible is deprecated\n",
> +			 match->compatible);
> +	}
> +
>  	drvdata->variant = (struct lpass_variant *)match->data;
>  	variant = drvdata->variant;
>  
> -- 
> 2.35.1
> 
