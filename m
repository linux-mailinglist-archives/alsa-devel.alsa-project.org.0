Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E3E15813C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 18:21:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 470341671;
	Mon, 10 Feb 2020 18:20:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 470341671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581355264;
	bh=XWD/NQb9WFYzVdzqAGKVGu9sciiNIGEDoVJog3Xn7Ew=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VifyHYkVrBbksuNZv8IAAXpWrjN710LFehekkEzVadtU8PvBtmYVovOV/0GAjBVhg
	 dYCiebnKTK9onm++z6QI0RjU8mt9bjK+NQSs2Jiu/pXP88RGZvYOpp7JS6Xx322X1s
	 QBL4jeVWQc1xoBNkH26ur8zOtg+kF5u2rnQv1hCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4B6F800E7;
	Mon, 10 Feb 2020 18:19:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E48BF80157; Mon, 10 Feb 2020 18:19:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0743AF800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 18:19:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0743AF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qsYguvM9"
Received: by mail-wm1-x343.google.com with SMTP id q9so57719wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oIl67nxXPIGrGYEprbTExGSvnC9F9nc7bLg95r69g+g=;
 b=qsYguvM9Y7IZ0vTYqRn6gqe315EVNSNAoXvnU7Il/jEgH6OA5Ex79LfWkPnVQ1Tig6
 DZkfDWJBkhH8/OU8nsbgj7EJqhFcfE3b9b6ipz/LgM9JJj0yef4v7RAHWEP2iQQ3gcqR
 9bzcCD5sVgzg+4xYDkJI827X3pNvqolyAEH4cPspelg1J25cUMwhAN8/+2AvU/skRtZ3
 dBZMbs/BE3whHqrgNZ5gqWsTjBcDbhRy6dnr5p2HunPzxpL4XNNICps0BLJQf8iid0pO
 eOZInK/0Wx/uPfqdcgiUcKrxjG+V0jaHO4nPzkYx/qsBiaYaDBwdJVTkIzRYzPBID8Zo
 /fDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oIl67nxXPIGrGYEprbTExGSvnC9F9nc7bLg95r69g+g=;
 b=rdV9jRKayoK4fGGPBYbDtGLkxRZJJrhSBUhd5pTl61mWqa/dnaeoQ6O1CyCO0ca0DR
 BZEW0uk/0nE06yDYHvE4hh6bpivb2hq0tDumqTdnVrCQz29zzRGBDXl02Z5lCAXeXFlZ
 JuDPUmcyaORFihLkVD6dyoRVeKE/MJ5KABst54dKEdsqQ06rqVxq+5VWDZaAitvU5+iv
 1xgslPpFoU8f+6yu9bqZbHLcxajlGa87UbuzrdY8fpy6HMx2DSAtKPSnhIXKwGdg88yf
 7ZFRHb7aZGL6vmvF2aNJuBLHV4L6aOZrThuUPhk5lxCm663T3TYajCqqUyArz2irF/zR
 dx9w==
X-Gm-Message-State: APjAAAUOtmwduEJyTjE6bi5hae8RW9MFMPNPkr1I+KpPEPhqQdjg67Xc
 T3oKEAG4XvTLVmY4+WBluU5Q5/5pvPo=
X-Google-Smtp-Source: APXvYqzV9sO34XJZFw6xpwiuFWll4zkKifzTrTiAxP59oZnDpnnijGr7YApsIerKdCCMbKpzqWygRg==
X-Received: by 2002:a1c:6a16:: with SMTP id f22mr25288wmc.53.1581355157157;
 Mon, 10 Feb 2020 09:19:17 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id o4sm1409882wrx.25.2020.02.10.09.19.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Feb 2020 09:19:16 -0800 (PST)
To: Adam Serbinski <adam@serbinski.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-5-adam@serbinski.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a161cfd8-f1ca-4e1c-65b3-a465053c7d20@linaro.org>
Date: Mon, 10 Feb 2020 17:19:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200209154748.3015-5-adam@serbinski.com>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 4/8] ASoC: qdsp6: q6routing: add pcm
	port routing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 09/02/2020 15:47, Adam Serbinski wrote:
> This patch adds support to PCM_PORT mixers required to
> select path between ASM stream and AFE ports.
> 
> Signed-off-by: Adam Serbinski <adam@serbinski.com>
> CC: Andy Gross <agross@kernel.org>
> CC: Mark Rutland <mark.rutland@arm.com>
> CC: Liam Girdwood <lgirdwood@gmail.com>
> CC: Patrick Lai <plai@codeaurora.org>
> CC: Banajit Goswami <bgoswami@codeaurora.org>
> CC: Jaroslav Kysela <perex@perex.cz>
> CC: Takashi Iwai <tiwai@suse.com>
> CC: alsa-devel@alsa-project.org
> CC: linux-arm-msm@vger.kernel.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   sound/soc/qcom/qdsp6/q6routing.c | 44 ++++++++++++++++++++++++++++++++

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   1 file changed, 44 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 20724102e85a..3a81d2161707 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -67,6 +67,10 @@
>   	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
>   	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
>   	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
> +	{ mix_name, "PRI_PCM_TX", "PRI_PCM_TX" },		\
> +	{ mix_name, "SEC_PCM_TX", "SEC_PCM_TX" },		\
> +	{ mix_name, "TERT_PCM_TX", "TERT_PCM_TX" },		\
> +	{ mix_name, "QUAT_PCM_TX", "QUAT_PCM_TX" },		\
>   	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
>   	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
>   	{ mix_name, "SLIMBUS_2_TX", "SLIMBUS_2_TX" },		\
> @@ -128,6 +132,18 @@
>   	SOC_SINGLE_EXT("QUAT_MI2S_TX", QUATERNARY_MI2S_TX,		\
>   		id, 1, 0, msm_routing_get_audio_mixer,			\
>   		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("PRI_PCM_TX", PRIMARY_PCM_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("SEC_PCM_TX", SECONDARY_PCM_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("TERT_PCM_TX", TERTIARY_PCM_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("QUAT_PCM_TX", QUATERNARY_PCM_TX,		\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
>   	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
>   		id, 1, 0, msm_routing_get_audio_mixer,			\
>   		msm_routing_put_audio_mixer),				\
> @@ -468,6 +484,18 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
>   static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
>   	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
>   
> +static const struct snd_kcontrol_new primary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(PRIMARY_PCM_RX) };
> +
> +static const struct snd_kcontrol_new secondary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(SECONDARY_PCM_RX) };
> +
> +static const struct snd_kcontrol_new tertiary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(TERTIARY_PCM_RX) };
> +
> +static const struct snd_kcontrol_new quaternary_pcm_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(QUATERNARY_PCM_RX) };
> +
>   static const struct snd_kcontrol_new slimbus_rx_mixer_controls[] = {
>   	Q6ROUTING_RX_MIXERS(SLIMBUS_0_RX) };
>   
> @@ -695,6 +723,18 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>   	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>   			   tertiary_mi2s_rx_mixer_controls,
>   			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("PRI_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   primary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(primary_pcm_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("SEC_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   secondary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(secondary_pcm_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("TERT_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   tertiary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(tertiary_pcm_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("QUAT_PCM_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   quaternary_pcm_rx_mixer_controls,
> +			   ARRAY_SIZE(quaternary_pcm_rx_mixer_controls)),
>   	SND_SOC_DAPM_MIXER("PRIMARY_TDM_RX_0 Audio Mixer", SND_SOC_NOPM, 0, 0,
>   				pri_tdm_rx_0_mixer_controls,
>   				ARRAY_SIZE(pri_tdm_rx_0_mixer_controls)),
> @@ -853,6 +893,10 @@ static const struct snd_soc_dapm_route intercon[] = {
>   	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
>   	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
>   	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("PRI_PCM_RX Audio Mixer", "PRI_PCM_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("SEC_PCM_RX Audio Mixer", "SEC_PCM_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("TERT_PCM_RX Audio Mixer", "TERT_PCM_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("QUAT_PCM_RX Audio Mixer", "QUAT_PCM_RX"),
>   	Q6ROUTING_RX_DAPM_ROUTE("PRIMARY_TDM_RX_0 Audio Mixer",
>   				"PRIMARY_TDM_RX_0"),
>   	Q6ROUTING_RX_DAPM_ROUTE("PRIMARY_TDM_RX_1 Audio Mixer",
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
