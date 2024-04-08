Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3AC89CBB5
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 20:30:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6F323D1;
	Mon,  8 Apr 2024 20:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6F323D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712601034;
	bh=nzM23wh9zowee65GrxL/O51+DWEPGKQ69scyyxUr8JM=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F4ok/1L408sVYWFq0Fc4OOuYapl3uTuMBDADmtxiAw3fR+VUoJSi/lDK6Iz9rCn/V
	 7chCu63lbrXx/ExUBTwZyA+4btEF6LyFZkbmce7AdMhq5t9jIBB7RvC8a1gWowRgJB
	 K+BGlSWwZlL1OCNpOk4RL+dW5mR1rYl7mOl8/lMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C5FDF80588; Mon,  8 Apr 2024 20:30:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45C85F8058C;
	Mon,  8 Apr 2024 20:30:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 336C4F8026D; Mon,  8 Apr 2024 20:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70155F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 20:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70155F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JuKLCqcx
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4155819f710so36978975e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Apr 2024 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712600982;
 x=1713205782; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=3y8+lTNdEv9p3qVZZSAL5TYeLEpaLOV40uPPZs1+/rA=;
        b=JuKLCqcxbcVA8b6BlhFHgwh2aPoIzsTCXlS7LHReM8mQxu4TlMLXg6ru0phl7K4cKD
         JLLcJYkl7FW3JQamjdXxjwjJr8jT793+rdc7K73Bbq8OfKr+oy8H3OCCH7SWi10stb/3
         FxpaYKXIoOijNPnd7IaDshQIlBTSvQ/htgG+YZrIEYJUt6vZXGqjH8wBNsUF8n2RH+Yz
         VANpsfPbh0WK6MIAQbRyimRztb2wWwIes2rA5WpSjSNwGbsJgv94J0RwVIhNBUXVjFxq
         vITRVttjpNNIU1vnQVahR9eFD6l5QySO4EeB6+Geyk3PmMiVqR6r8AqeuhkoDz5Tk99d
         9e8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712600982; x=1713205782;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y8+lTNdEv9p3qVZZSAL5TYeLEpaLOV40uPPZs1+/rA=;
        b=qOtsWA5W2KeH557XlGi3Y8A0PM4mHfBFb1VRoqIJuGO6h1meieoXtYHgD7USqF+/na
         xw5y0EVyECYMq3m/00kQskpSPd1bWxgthlqiI5YgAdUIb3snkWyb/pERq8TSK77jaPH1
         D2IAeWxuxO19muLR/I+EJwHGD+HKmBFF+y2scOdg4SXW37GVd1vZAQMzRKaMmey5MFTa
         LPzywrShbRm1AhMy9k6qEZUjVRM8+uV+11hCvBXCcxIIS74Hxn9zg0YL8FsspIRUq/Bz
         h2dIdUGkhAzXD5+Bs1NJ7/tH/aQ1qmMMwMcuAbA8uUk2nZNiq53BMPNTY6ql3xf/daIb
         W+ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNXir8eHRINRIBimEeqU5aAGEEcgC5mePsWoknjMvcmiGXmdsrvTS66LLpt/MLfv+DNsIqLjxnq1nrs+1aTO9+tSO2hoD407E0EVQ=
X-Gm-Message-State: AOJu0YwO3AfYYdeiNdKvXO0uoD+6fisiQGIcBf7p6HChrzMoZ5esZPH0
	DP9brDXEJy2Wacp4w+meEbmkQ+1ulr+EKLrtzk1mrmDNLfBBVw31rd28a6r5Hgs=
X-Google-Smtp-Source: 
 AGHT+IFh8WHFAL+5KwNrKiDCA+QmN0hRuRdo0rWFUNNknNOcm/Yw6c64MqzQj6hHHotqbMcZSl4VIw==
X-Received: by 2002:a05:600c:4683:b0:415:8651:9b8e with SMTP id
 p3-20020a05600c468300b0041586519b8emr8571532wmo.39.1712600981964;
        Mon, 08 Apr 2024 11:29:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90bc:1f0d:aae2:3c66])
        by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b00414807ef8dfsm14255016wmb.5.2024.04.08.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 11:29:41 -0700 (PDT)
References: <20240408164947.30717-1-ddrokosov@salutedevices.com>
 <20240408164947.30717-3-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, lgirdwood@gmail.com, jbrunet@baylibre.com,
 broonie@kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 kernel@salutedevices.com, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/2] ASoC: meson: implement link-name optional
 property in meson card utils
Date: Mon, 08 Apr 2024 20:15:54 +0200
In-reply-to: <20240408164947.30717-3-ddrokosov@salutedevices.com>
Message-ID: <1j1q7fpv1n.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: QHCQD5Q2T2D33C3YWXDJPW222XYAWP2G
X-Message-ID-Hash: QHCQD5Q2T2D33C3YWXDJPW222XYAWP2G
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QHCQD5Q2T2D33C3YWXDJPW222XYAWP2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 08 Apr 2024 at 19:49, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> The 'link-name' property presents an optional DT feature that empowers
> users to customize the name associated with the DAI link and PCM stream.
> This functionality reflects the approach often employed in Qualcomm
> audio cards, providing enhanced flexibility in DAI naming conventions
> for improved system integration and userspace experience.
>
> It allows userspace program to easy determine PCM stream purpose, e.g.:
>     ~ # cat /proc/asound/pcm
>     00-00: speaker (*) :  : playback 1
>     00-01: mics (*) :  : capture 1
>     00-02: loopback (*) :  : capture 1

The example above is exactly what you should not do with link names, at
least with the amlogic audio system.

Userspace pcm, otherwise known as DPCM frontend, are merely that:
frontends. What they do is entirely defined by the routing defined by
the userspace (amixer and friends)

So naming the interface in DT (the FW describing the HW) after what the
the userspace SW could possibly set later on is wrong.

Bottom line: I have mixed feeling about this change. It could allow all
sort of bad names to be set.

The only way it could make sense HW wise is if the only allowed names
where (fr|to)ddr_[abcd], which could help maps the interface and the
kcontrol.

Such restriction should be documented in the binding doc.

>
> The previous naming approach using auto-generated fe or be strings
> continues to be utilized as a fallback.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  sound/soc/meson/meson-card-utils.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
> index ed6c7e2f609c..7bae72905a9b 100644
> --- a/sound/soc/meson/meson-card-utils.c
> +++ b/sound/soc/meson/meson-card-utils.c
> @@ -94,10 +94,14 @@ static int meson_card_set_link_name(struct snd_soc_card *card,
>  				    struct device_node *node,
>  				    const char *prefix)
>  {
> -	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> -				    prefix, node->full_name);
> -	if (!name)
> -		return -ENOMEM;
> +	const char *name;
> +
> +	if (of_property_read_string(node, "link-name", &name)) {
> +		name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
> +				      prefix, node->full_name);
> +		if (!name)
> +			return -ENOMEM;
> +	}
>  
>  	link->name = name;
>  	link->stream_name = name;


-- 
Jerome
