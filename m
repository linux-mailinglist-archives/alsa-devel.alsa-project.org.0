Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87E7397A2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 08:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B1B822;
	Thu, 22 Jun 2023 08:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B1B822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687416814;
	bh=Y1Co0eUEY/1VztSjV/SOSKw0BAZFidboJOL7RFsEII8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oeOOBZVHFJSm/H937PNl3S0Wi/F0W+MlA9hhqzeFTIB7h4Z4CCkRQ1YRrJxY0x02T
	 l3iQ9uJm7bbDBmTSHT4K7MD0q5ZtUV2OefrIan4NZ3IphrSDArLgGsON2v6lZMEbqe
	 XmFtTT7fUaOzPBXwZewptT8FGROSfzMONEAG/EyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAD9EF8051E; Thu, 22 Jun 2023 08:52:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3C0FF80132;
	Thu, 22 Jun 2023 08:52:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAE0AF80141; Thu, 22 Jun 2023 08:52:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A444F80130
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 08:52:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A444F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D5YUQb9k
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 306A961776;
	Thu, 22 Jun 2023 06:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82197C433C0;
	Thu, 22 Jun 2023 06:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687416750;
	bh=Y1Co0eUEY/1VztSjV/SOSKw0BAZFidboJOL7RFsEII8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5YUQb9kpPtpyQndQqKrrS4y0MpSEWhL4A67w53SKPOVFrst5UzoEEZ9WsbMxgKq4
	 9lbRQv0Da/irkSbwwGdphZMfr4TPz0HE0hMyyv15CPzinaQb9SD/OSPw4mGoG9gwe1
	 jN0yyR7b5aNYnZ20MwdK42YwZGfEivgq8FDjt3VpbEuVfiTijHerZddqdle2ysMfl5
	 ayRFoWFtVf7bZCf6NxALcL9pU+3gvGuyS0LGMNyXINFnG8bo1yuLgHB0hC6DzrEE2v
	 dnosDx8VQVclAJiJzusdXITTmSmHZFUyqa4ks8V5bCkhAl1gte1L7XQEWOVRIK5pdz
	 lJSlLZn/XKGVA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1qCEBH-00073T-Mw; Thu, 22 Jun 2023 08:52:35 +0200
Date: Thu, 22 Jun 2023 08:52:35 +0200
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	steev@kali.org, johan+linaro@kernel.org, quic_bjorande@quicinc.com
Subject: Re: [PATCH] ASoC: qcom: common: add default jack dapm pins
Message-ID: <ZJPvs05sb-aCr3CQ@hovoldconsulting.com>
References: <20230302120327.10823-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302120327.10823-1-srinivas.kandagatla@linaro.org>
Message-ID-Hash: D3PEHUEAMDYHPJVJ57YOQAAANGGFV44N
X-Message-ID-Hash: D3PEHUEAMDYHPJVJ57YOQAAANGGFV44N
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3PEHUEAMDYHPJVJ57YOQAAANGGFV44N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 02, 2023 at 12:03:27PM +0000, Srinivas Kandagatla wrote:
> If the soundcard does not specify the dapm pins, let the common
> code add these pins for jack.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

Looks like this one was lost somewhere.

Any chance we can get this into 6.5 as it's needed for audio on the
Lenovo ThinkPad X13s?

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

>  sound/soc/qcom/common.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index c1f24af17506..555feb845c41 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -8,6 +8,11 @@
>  #include "qdsp6/q6afe.h"
>  #include "common.h"
>  
> +static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
> +};
> +
>  int qcom_snd_parse_of(struct snd_soc_card *card)
>  {
>  	struct device_node *np;
> @@ -169,6 +174,11 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
>  		of_node_put(platform);
>  	}
>  
> +	if (!card->dapm_widgets) {
> +		card->dapm_widgets = qcom_jack_snd_widgets;
> +		card->num_dapm_widgets = ARRAY_SIZE(qcom_jack_snd_widgets);
> +	}
> +
>  	return 0;
>  err:
>  	of_node_put(cpu);
