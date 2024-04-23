Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 694B88AE4C2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 13:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90D61518;
	Tue, 23 Apr 2024 13:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90D61518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713872977;
	bh=PKSrVVx4eiys/Zj2uIwEfs1FS0teIqUADyfmFNGktlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QljCK3vMfjs8cMz+SjTz+daxcmi7beteq9snnNp+74iH1+B+adXXES1aHboDTDcHp
	 OmPrIT5X+Sz96fvS2J7GWyds/QhBeEiLlS8BvyECSdJm2wxmTkP9zp63AgDpT9G5Nv
	 2TcttH5uQZa3/Dvr2rFAJVS0p4bkw2WaOO6j5Oog=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992B4F805AB; Tue, 23 Apr 2024 13:49:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 376C4F80578;
	Tue, 23 Apr 2024 13:49:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 912CFF80423; Tue, 23 Apr 2024 13:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71E3AF8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 13:48:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E3AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pCLzCIiH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 43797CE0F96;
	Tue, 23 Apr 2024 11:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DAEC116B1;
	Tue, 23 Apr 2024 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713872932;
	bh=PKSrVVx4eiys/Zj2uIwEfs1FS0teIqUADyfmFNGktlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCLzCIiHLeYTsq5I4SX0KH+cSVY797FLaVBH3OUNnmijfVjmeoWbnHB4pWszeUZdM
	 Mi3YFDW+NVSKaxr+FYx8DGyH2G7/wzf8Dp8KqNz0Heo9C1Ub5B5T95js5KtW0gLSNQ
	 CbO1jyCj77sJqL/H/TAPxc+LtNRMVvg06AfyYYyKLgIxpU8X3BsCnrCV2NeX3FLuf2
	 7xTSnOGHyIrFtJxbdnkkBdGT03rJwLneCkuplsU7LO/cyKsLmSZPZZhd/fQx94CHCR
	 /NteoVmT14gWJ1oaDe7/Y9KgZ2d0Set29DMG/SVzCpRfIYF2zmh+Vu6bAXhuqE+Qiy
	 2ThPNWJGnJ5aQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rzEdm-000000005DH-2gfe;
	Tue, 23 Apr 2024 13:48:50 +0200
Date: Tue, 23 Apr 2024 13:48:50 +0200
From: Johan Hovold <johan@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ASoC: qcom: sc8280xp: add Display port Jack
Message-ID: <ZiegIgranmsYg-KL@hovoldconsulting.com>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <20240422134354.89291-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422134354.89291-4-srinivas.kandagatla@linaro.org>
Message-ID-Hash: Z2H3IUPSHV5BOKEAOF4AXLK3SCPCKA3D
X-Message-ID-Hash: Z2H3IUPSHV5BOKEAOF4AXLK3SCPCKA3D
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2H3IUPSHV5BOKEAOF4AXLK3SCPCKA3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 02:43:53PM +0100, Srinivas Kandagatla wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Add support to Display Port Jack events, by making use of common helper

s/to/for/

drop comma

> function.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/sc8280xp.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 878bd50ad4a7..38f97f19add9 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -19,6 +19,7 @@ struct sc8280xp_snd_data {
>  	struct snd_soc_card *card;
>  	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
>  	struct snd_soc_jack jack;
> +	struct snd_soc_jack hdmi_jack[8];

dp_jack

>  	bool jack_setup;
>  };
>  
> @@ -27,6 +28,8 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>  	struct snd_soc_card *card = rtd->card;
> +	struct snd_soc_jack *hdmi_jack  = NULL;

dp_jack

stray whitespace before =

> +	int hdmi_pcm_id = 0;

dp_pcm_id

no need to init

>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
> @@ -41,10 +44,21 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>  		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
>  		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
>  		break;
> +	case DISPLAY_PORT_RX_0:
> +		hdmi_pcm_id = 0;
> +		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
> +		break;
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		hdmi_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
> +		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
> +		break;
>  	default:
>  		break;
>  	}
>  
> +	if (hdmi_jack)
> +		return qcom_snd_dp_jack_setup(rtd, hdmi_jack, hdmi_pcm_id);
> +
>  	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }

Johan
