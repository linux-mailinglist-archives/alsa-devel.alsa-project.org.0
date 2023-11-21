Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4AE7F2DC6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 13:54:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F163DF0;
	Tue, 21 Nov 2023 13:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F163DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700571292;
	bh=/LVVlw8gLQB6ZTo1Kr0Z/aF5RSngTPxFRD7QwxrFOpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IxCeGsqmW0aVrVHUr4dhM3sVOEY7safS7hA/+n9agPTN2a/8Dd0i+4v5si5E4NzCQ
	 PBHQf71qkE7av0lnHEaHMRmSq4NGdSDPGdsb0htSLsqnmU0QgcHXKIAs3kKKG69+Xz
	 fySdIpB04vXm5XqzgNIrlHGeDOT7nFGB3lbvDDuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 049C2F80570; Tue, 21 Nov 2023 13:54:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83DFEF8055B;
	Tue, 21 Nov 2023 13:54:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 141D0F802E8; Tue, 21 Nov 2023 13:54:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9299F80246
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 13:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9299F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=KRoS6ryt
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2A2106607314;
	Tue, 21 Nov 2023 12:54:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571250;
	bh=/LVVlw8gLQB6ZTo1Kr0Z/aF5RSngTPxFRD7QwxrFOpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KRoS6ryt/WYniBln8ggcPoFRpSf2hELuGwRk5vEKV57FaSF/OhaMn7pw6HATLUid0
	 t3YnB5WzEoW5hv9xLGA1oov5MuXgkxJCboyVzaIFdZmNXlUDPopGWhi2clWveC5soS
	 sw6x0W7q/qLT74sl0FnT8YQDYzuw5nhJ24a7mAR6oZfz192w6Qg1vw+9LxdxDV80ay
	 SMxxGNOnZWeWM+X9TUqpxfNfR/sp5Hkz9JQqCK4Iy+YOmYdFZKo3HEUo5nQqO4PWMv
	 exCr0IhXGrikqYZMHHAPMrV8gKlCqSQTg+JQZxtm9CVYK3/sJ5iuShaB+5REt/ovtb
	 9xAnW2PErb8Vg==
Message-ID: <c35ef2d8-ab40-484b-9a4c-38f2f3e7d99c@collabora.com>
Date: Tue, 21 Nov 2023 13:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 3/3] drm/bridge: it6505: Add audio support
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, kuninori.morimoto.gx@renesas.com,
 nfraprado@collabora.com
Cc: chunxu.li@mediatek.com, ajye_huang@compal.corp-partner.google.com,
 allen-kh.cheng@mediatek.com, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230730180803.22570-4-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VFUL7ZBYU632GJD5ALYUENE7HT2GZF6T
X-Message-ID-Hash: VFUL7ZBYU632GJD5ALYUENE7HT2GZF6T
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFUL7ZBYU632GJD5ALYUENE7HT2GZF6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 30/07/23 20:08, Jiaxin Yu ha scritto:
> Add audio support for it6505
> 
> 1. Bridge to hdmi-codec to support audio feature. At the same time,
>     the function of automatically detecting audio is removed.
> 2. It is observed that some DP-to-HDMI dongles will get into bad
>     states if sending InfoFrame without audio data. Defer to enable
>     it6505's audio feature when PCM triggers START or RESUME.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Hello Jiaxin,
this patch doesn't apply anymore (and it won't build anymore) upstream.

> ---
>   drivers/gpu/drm/bridge/ite-it6505.c | 81 ++++++++++++++++++++++++++---
>   1 file changed, 75 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 504d51c42f79..1cfcb0731288 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -2162,7 +2162,6 @@ static void it6505_stop_link_train(struct it6505 *it6505)
>   
>   static void it6505_link_train_ok(struct it6505 *it6505)
>   {
> -	struct device *dev = &it6505->client->dev;

This is because this changed to `struct device *dev = it6505->dev;`

>   
>   	it6505->link_state = LINK_OK;
>   	/* disalbe mute enable avi info frame */
> @@ -2170,11 +2169,6 @@ static void it6505_link_train_ok(struct it6505 *it6505)
>   	it6505_set_bits(it6505, REG_INFOFRAME_CTRL,
>   			EN_VID_CTRL_PKT, EN_VID_CTRL_PKT);
>   
> -	if (it6505_audio_input(it6505)) {
> -		DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
> -		it6505_enable_audio(it6505);
> -	}
> -
>   	if (it6505->hdcp_desired)
>   		it6505_start_hdcp(it6505);
>   }
> @@ -2846,6 +2840,45 @@ static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
>   		it6505_disable_audio(it6505);
>   }
>   
> +static int it6505_audio_hw_params(struct device *dev, void *data,
> +				  struct hdmi_codec_daifmt *daifmt,
> +				  struct hdmi_codec_params *params)
> +{
> +	struct it6505 *it6505 = dev_get_drvdata(dev);
> +
> +	return it6505_audio_setup_hw_params(it6505, params);
> +}
> +
> +static int it6505_audio_setup_trigger(struct it6505 *it6505, int cmd)
> +{
> +	struct device *dev = &it6505->client->dev;

...and because you'll have to change this one, and other occurrences of that
as well.

Can you please respin this series?

Thanks,
Angelo


