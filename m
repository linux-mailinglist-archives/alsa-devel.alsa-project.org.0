Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920BAB7ED1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:30:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F9C1614C9;
	Thu, 15 May 2025 09:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F9C1614C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747293721;
	bh=Z0rZwDlBOJabeCJzT7S1mnNOxGO4aa2X5GAQxXZqSbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OuX5sczTZviLkiMy1ZsdTjB1uwHQpXIZJ5edwM5S9FcOcO68/cSGRpGpVVuib+frY
	 CdS5ACp/6ydgA/DyemxBpBXhuy3vhR4VJdpr6+WYyH1HwnQ+pkbkPGW0aOOWIaOpvu
	 oO+eIS0ZcIq9SgPChFdTEZYkDYJ4oActaLaaEM9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14C1CF89797; Sun, 11 May 2025 16:32:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A542F897A3;
	Sun, 11 May 2025 16:32:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 116EFF8E6E6; Thu,  1 May 2025 13:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6C54F8E6DE
	for <alsa-devel@alsa-project.org>; Thu,  1 May 2025 13:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C54F8E6DE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hOgv58Vt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1C54FA48580;
	Thu,  1 May 2025 11:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FFDC4CEE3;
	Thu,  1 May 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746099472;
	bh=Z0rZwDlBOJabeCJzT7S1mnNOxGO4aa2X5GAQxXZqSbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOgv58Vt/VSQjDFB92Q/LRDpc4G1Yavt115Kq0ToiYwJy6WJ6xScbJ1EfxZFgSlZx
	 KtB4W8rCTrJSfLsS1YoIPz1kbSx7vyxDQQBoT5U9NJB6gChwE1tVSeJQKwN8oxJceE
	 JSMW7s9kX9MEdZOHPoENAEpL0HuzQo61OYswK5/HGtfIkMNQZ4jag5IxfIu/HwGh6F
	 VwSNf6A2QYRi2DXpd7vfLvDSpENJqYVq/pICn4/Pf056VheKGkaJgl+EXAeUCe0OjF
	 1iLIAeyOtuNHNqUAFV5npNmecMDbZomfN+fL5iEojACPmefmQQy2FGoHJgAXYG4zhe
	 D4XsQmopVy3ug==
Date: Thu, 1 May 2025 12:37:45 +0100
From: Srinivas Kandagatla <srini@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
Message-ID: <aBNdCRk_fP2q1vxQ@srini-hackbase>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
X-MailFrom: srini@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4LCVXY3Y5EFNFN6CMWKQVPAPCZCNVCLC
X-Message-ID-Hash: 4LCVXY3Y5EFNFN6CMWKQVPAPCZCNVCLC
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LCVXY3Y5EFNFN6CMWKQVPAPCZCNVCLC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
> Sound machine drivers for Qualcomm SoCs can be reused across multiple
> SoCs. But user space ALSA UCM files depend on the card driver name which
> should be set per board/SoC.
> 
> Allow such customization by using driver match data as sound card driver
> name.
> 
> Also while we're already touching these lines, sort the compatibles
> alphabetically.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index b70b2a5031dfbf69024666f8a1049c263efcde0a..e920b413b762c803cfcc4049f35deba828275478 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -16,7 +16,6 @@
>  #include "usb_offload_utils.h"
>  #include "sdw.h"
>  
> -#define DRIVER_NAME		"sm8250"
>  #define MI2S_BCLK_RATE		1536000
>  
>  struct sm8250_snd_data {
> @@ -200,15 +199,15 @@ static int sm8250_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	card->driver_name = DRIVER_NAME;
> +	card->driver_name = of_device_get_match_data(dev);
>  	sm8250_add_be_ops(card);
>  	return devm_snd_soc_register_card(dev, card);
>  }
>  
>  static const struct of_device_id snd_sm8250_dt_match[] = {
> -	{.compatible = "qcom,sm8250-sndcard"},
> -	{.compatible = "qcom,qrb4210-rb2-sndcard"},
> -	{.compatible = "qcom,qrb5165-rb5-sndcard"},
> +	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },

sm4250 for rb2?

> +	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
> +	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
>  	{}
>  };
>  
> 
> -- 
> 2.49.0
> 
