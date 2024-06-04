Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBAB8FB033
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 12:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4B8B60;
	Tue,  4 Jun 2024 12:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4B8B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717497915;
	bh=yGknayW3QQ0rwaJndYaKwkPne6V5zBr5l3Gf/k6pWH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JG3dp83TgJ5whWtcpM3avKTH/GPXmvUzARyLfWyz5F3o4vnVHJEgudaPQvjY+ZByH
	 lqEX3gyg9skoMRd9G4ERXDPXIOwKnIOHVefPhBJ/ApV+Osfjeo+kTBdPbVFw+jXf1N
	 qkLEol0JVg2qBSyi0sh0HaTQC7Z3E/tRSSUt7zz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51111F8057A; Tue,  4 Jun 2024 12:44:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F23A5F805A1;
	Tue,  4 Jun 2024 12:44:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76752F802DB; Tue,  4 Jun 2024 12:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE189F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 12:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE189F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cFndo4/b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9A21CE0E62;
	Tue,  4 Jun 2024 10:43:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18541C32782;
	Tue,  4 Jun 2024 10:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717497828;
	bh=yGknayW3QQ0rwaJndYaKwkPne6V5zBr5l3Gf/k6pWH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFndo4/bAX4UD1RYY7WGPu4LBwxL7SZEADNtg0GzaMhGV0lJiTDwKfdBS1E9kIinn
	 v3LUDzudl59ZMNzECxCkaKlVdBMjmpJD2UmYY9fMBxBZ+V44GeCF/x6bxVi8lfNwNN
	 lvzWoXSYIK2WYzb6gpf1q2KvDfhdS5fnAbYVkjTMCssTD306r9ggTC6YlVIl7t5D+G
	 FVkCrf1+xyKMBnWyfMp1eWLXMPwnmApXIrh4A0gmpPE8/J1Dga28KgU2f4TB6IFADM
	 lU1dua6PHtWUu2Ok4rU3wOqOB1r7LzhyzfY/ao7Z+URv2we1ke/y0TBq/qoI0OlkrJ
	 lHAGnLmUIzAzA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sERdq-000000002mT-3A19;
	Tue, 04 Jun 2024 12:43:46 +0200
Date: Tue, 4 Jun 2024 12:43:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: x1e80100: Add USB DisplayPort plug support
Message-ID: <Zl7v4hezEYcuCORC@hovoldconsulting.com>
References: <20240604094638.97780-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604094638.97780-1-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: B3B2N7JAAZ4IQV277GGIUQS3UJT4462A
X-Message-ID-Hash: B3B2N7JAAZ4IQV277GGIUQS3UJT4462A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3B2N7JAAZ4IQV277GGIUQS3UJT4462A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 04, 2024 at 11:46:38AM +0200, Krzysztof Kozlowski wrote:
> Add support for handling jack events of USB (DisplayPort).

> Depends on:
> https://lore.kernel.org/all/20240422134354.89291-1-srinivas.kandagatla@linaro.org/
> ---

> @@ -20,12 +20,32 @@ struct x1e80100_snd_data {
>  	struct snd_soc_card *card;
>  	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
>  	struct snd_soc_jack jack;
> +	struct snd_soc_jack hdmi_jack[8];

As I asked Srini, please rename this dp_jack.

>  	bool jack_setup;
>  };
>  
>  static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);

> +	struct snd_soc_jack *hdmi_jack = NULL;
> +	int hdmi_pcm_id = 0;

And use dp_ prefixes here too.

> +
> +	switch (cpu_dai->id) {
> +	case DISPLAY_PORT_RX_0:
> +		hdmi_pcm_id = 0;
> +		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
> +		break;
> +	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
> +		hdmi_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
> +		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (hdmi_jack)
> +		return qcom_snd_dp_jack_setup(rtd, hdmi_jack, hdmi_pcm_id);
>  
>  	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
>  }

Johan
