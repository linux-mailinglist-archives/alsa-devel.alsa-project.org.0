Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0636CEEC2
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E2A81EF;
	Wed, 29 Mar 2023 18:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E2A81EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106077;
	bh=/BnjmxS7L0+apEiuUwsijqlY5TxC1O4BR+IoVkYGEpU=;
	h=Date:To:Subject:From:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bIM686uWXPMoIaV7DhbXoQY5kASatdyOEakrzQNpoQZtS6BlL8qax15Js6EUsi/8v
	 J+NVuY43UH7ZPmB7Dk8lyCe/gwT9j4f/moWYBRuNzOsoKUc6+JYUfmNvhwq4FEPLWK
	 TOJF/TYOBpFlRFt2XmVOndE5NXV+JSYB6nkRx6TA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9AC9F80563;
	Wed, 29 Mar 2023 18:05:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0E0DF802E8; Fri, 24 Mar 2023 12:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4499AF800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 12:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4499AF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=rByZavlt
Received: by mail-ed1-x52a.google.com with SMTP id o12so6533091edb.9
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1679656938;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRr72t+4UZ9OP3mnlpRJ8YUSEtD1+XLxKD3GEqqnIeE=;
        b=rByZavltipXd6PeR2v95ebI03dIGh+3m2D/LZWooOg5lz5WRzXzg/D3YV9l6c0uKxL
         jmZHyS9y3jTCVpIFONpkVGKNXMgqnEoCtaALhrvBxRcbhy7HZAO65bc/g/LbBuXCXQQq
         I0GAjGQd/+iNmUagoaSY16uUt3vBsSa/WZr3QMIH9KM3NswBASm4ZC0Y4Mn2CONJZed9
         gY6oxtGvKUnV7EMSeoXWDnT23dCbFjxq4MKzORJ1TDHUbU2+aP0X8kol/QZ89GQ3s0Ec
         bcIzag9bxLfvF2eRS7XN3NkjTpxb97uICwhyXyalcsyXQH5rGpou8OAfP+VUeZHyMHz4
         6Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679656938;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HRr72t+4UZ9OP3mnlpRJ8YUSEtD1+XLxKD3GEqqnIeE=;
        b=P22CmCtfYkA8K8vKmzStwJ3bbge1hsVt4tjPSPBZOZUCoZy4FZ2fqdmpJgzt4GNbim
         iBEpy5C8UaQSH9axvYqIWUq1RFfZ9S3iPsPXOqm7uUd63/iXES7AQlnG/nv4cjRDNG/f
         XPWXBRDkCmWauXBCVetIT/NZgu22T5htLJnYKsRABxue08pcF84yQ/8LUbhIIqp88XBx
         n7CPAc0MwL+lHLwRUXMvgjFMhnzDEn+1EoSegXjA+8bVoA/T+FR66FhH+nJnIuk6cZjF
         HUMWQvCp434i88WNjfDwVYpUdBhDujKoxN79iT/74h9LKlQyO9hl6nuE1Th4mZF4sZQl
         hwjg==
X-Gm-Message-State: AAQBX9ckpqgiv9TarAfLSrpQ1pE6xfWcY37+NPABDLyXm/8J+GZsGXbZ
	g/w2hyPxsQuLk90aocDMLMPBvnFnlUakG86AiNDOrQ==
X-Google-Smtp-Source: 
 AKy350bjEB9tApb06Tb8yG8b1P3/ZPV+Lg4I1D0D6bOj4xxx8mW783dZePdsRRnmgNADtBJDf0pU8g==
X-Received: by 2002:a17:906:5288:b0:932:3d1b:b67a with SMTP id
 c8-20020a170906528800b009323d1bb67amr2333180ejm.41.1679656938274;
        Fri, 24 Mar 2023 04:22:18 -0700 (PDT)
Received: from localhost (84-115-214-73.cable.dynamic.surfer.at.
 [84.115.214.73])
        by smtp.gmail.com with ESMTPSA id
 g9-20020a056402320900b004fd219242a5sm10458496eda.7.2023.03.24.04.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 04:22:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Mar 2023 12:22:17 +0100
Message-Id: <CREKOWOABXLP.28VKF824CFB3O@otso>
To: "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
 <broonie@kernel.org>
Subject: Re: [PATCH 5/8] ASoC: codecs: lpass: register mclk after runtime pm
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.14.0
References: <20230209122806.18923-1-srinivas.kandagatla@linaro.org>
 <20230209122806.18923-6-srinivas.kandagatla@linaro.org>
In-Reply-To: <20230209122806.18923-6-srinivas.kandagatla@linaro.org>
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HVVRNY3RF7L7D2ZYXHLI7DQRKL4W33VQ
X-Message-ID-Hash: HVVRNY3RF7L7D2ZYXHLI7DQRKL4W33VQ
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:05:52 +0000
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVVRNY3RF7L7D2ZYXHLI7DQRKL4W33VQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srinivas,

On Thu Feb 9, 2023 at 1:28 PM CET, Srinivas Kandagatla wrote:
> move mclk out registration after runtime pm is enabled so that the
> clk framework can resume the codec if it requires to enable the mclk out.
>
> Fixes: c96baa2949b2 ("ASoC: codecs: wsa-macro: add runtime pm support")
> Fixes: 72ad25eabda0 ("ASoC: codecs: va-macro: add runtime pm support")
> Fixes: 366ff79ed539 ("ASoC: codecs: rx-macro: add runtime pm support")
> Fixes: 1fb83bc5cf64 ("ASoC: codecs: tx-macro: add runtime pm support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

I see the following remoteproc crash with this patch in on
sm6350/sm7225-fairphone-fp4.

To be clear, all the audio parts for that SoC are not upstream (yet) and
there's still many issues to solve so not sure if it's actually my fault.

Anyways, getting this crash after starting adsp.

[   97.212943] qcom_q6v5_pas 3000000.remoteproc: fatal error received: ABT_=
dal.c:287:ABTimeout: AHB Bus hang is detected, Number of bus hang detected =
:=3D 1 , addr0 =3D 0x3370000 , addr1 =3D 0x0!!!
[   97.212995] remoteproc remoteproc0: crash detected in 3000000.remoteproc=
: type fatal error
[   97.213015] remoteproc remoteproc0: handling crash #1 in 3000000.remotep=
roc
[   97.213022] remoteproc remoteproc0: recovering 3000000.remoteproc

This happens just after some clocks on the adsp get disabled, this is
from my own debug prints:
[   97.189097] q6afe_set_lpass_clock: clk_id=3D780, attri=3D1, clk_root=3D0=
, freq=3D0
[   97.189426] q6afe_set_lpass_clock: clk_id=3D781, attri=3D1, clk_root=3D0=
, freq=3D0

And then a couple of seconds later the whole phone just crashes into the
900e mode.

Regards
Luca


> ---
>  sound/soc/codecs/lpass-rx-macro.c  |  8 ++++----
>  sound/soc/codecs/lpass-tx-macro.c  |  8 ++++----
>  sound/soc/codecs/lpass-va-macro.c  | 20 ++++++++++----------
>  sound/soc/codecs/lpass-wsa-macro.c |  9 ++++-----
>  4 files changed, 22 insertions(+), 23 deletions(-)
>
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-r=
x-macro.c
> index a9ef9d5ffcc5..dd6970d5eb8d 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3601,10 +3601,6 @@ static int rx_macro_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		goto err_fsgen;
> =20
> -	ret =3D rx_macro_register_mclk_output(rx);
> -	if (ret)
> -		goto err_clkout;
> -
>  	ret =3D devm_snd_soc_register_component(dev, &rx_macro_component_drv,
>  					      rx_macro_dai,
>  					      ARRAY_SIZE(rx_macro_dai));
> @@ -3618,6 +3614,10 @@ static int rx_macro_probe(struct platform_device *=
pdev)
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> =20
> +	ret =3D rx_macro_register_mclk_output(rx);
> +	if (ret)
> +		goto err_clkout;
> +
>  	return 0;
> =20
>  err_clkout:
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-t=
x-macro.c
> index 2ef62d6edc30..b9475ba55e20 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2036,10 +2036,6 @@ static int tx_macro_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		goto err_fsgen;
> =20
> -	ret =3D tx_macro_register_mclk_output(tx);
> -	if (ret)
> -		goto err_clkout;
> -
>  	ret =3D devm_snd_soc_register_component(dev, &tx_macro_component_drv,
>  					      tx_macro_dai,
>  					      ARRAY_SIZE(tx_macro_dai));
> @@ -2052,6 +2048,10 @@ static int tx_macro_probe(struct platform_device *=
pdev)
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> =20
> +	ret =3D tx_macro_register_mclk_output(tx);
> +	if (ret)
> +		goto err_clkout;
> +
>  	return 0;
> =20
>  err_clkout:
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index b0b6cf29cba3..1623ba78ddb3 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1524,16 +1524,6 @@ static int va_macro_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		goto err_mclk;
> =20
> -	ret =3D va_macro_register_fsgen_output(va);
> -	if (ret)
> -		goto err_clkout;
> -
> -	va->fsgen =3D clk_hw_get_clk(&va->hw, "fsgen");
> -	if (IS_ERR(va->fsgen)) {
> -		ret =3D PTR_ERR(va->fsgen);
> -		goto err_clkout;
> -	}
> -
>  	if (va->has_swr_master) {
>  		/* Set default CLK div to 1 */
>  		regmap_update_bits(va->regmap, CDC_VA_TOP_CSR_SWR_MIC_CTL0,
> @@ -1560,6 +1550,16 @@ static int va_macro_probe(struct platform_device *=
pdev)
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> =20
> +	ret =3D va_macro_register_fsgen_output(va);
> +	if (ret)
> +		goto err_clkout;
> +
> +	va->fsgen =3D clk_hw_get_clk(&va->hw, "fsgen");
> +	if (IS_ERR(va->fsgen)) {
> +		ret =3D PTR_ERR(va->fsgen);
> +		goto err_clkout;
> +	}
> +
>  	return 0;
> =20
>  err_clkout:
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-=
wsa-macro.c
> index 5cfe96f6e430..c0b86d69c72e 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2451,11 +2451,6 @@ static int wsa_macro_probe(struct platform_device =
*pdev)
>  	if (ret)
>  		goto err_fsgen;
> =20
> -	ret =3D wsa_macro_register_mclk_output(wsa);
> -	if (ret)
> -		goto err_clkout;
> -
> -
>  	ret =3D devm_snd_soc_register_component(dev, &wsa_macro_component_drv,
>  					      wsa_macro_dai,
>  					      ARRAY_SIZE(wsa_macro_dai));
> @@ -2468,6 +2463,10 @@ static int wsa_macro_probe(struct platform_device =
*pdev)
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);
> =20
> +	ret =3D wsa_macro_register_mclk_output(wsa);
> +	if (ret)
> +		goto err_clkout;
> +
>  	return 0;
> =20
>  err_clkout:
> --=20
> 2.21.0

