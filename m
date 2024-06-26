Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C34289177B9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 06:58:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47ADB86E;
	Wed, 26 Jun 2024 06:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47ADB86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719377899;
	bh=MThcRH/5y0Z5+cdx2QcC+ZUQpATsAyR1GoKrsFAGF7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pIyupy52iwsCim3JSrhoN8j9LUI6oo8AXu9YHrg9ucAIRyF+oEVVBz9/zj7rLUvDz
	 N0He+EAlOAIRdapfq6shkdMnug2NeyItf2XIdozjyYWmndXlPwql8vFLu2iHJo1CCz
	 vzl7U1jPFRc13HgsCt/0ATmm1O0AdGTr4zyZghqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69BDBF805F4; Wed, 26 Jun 2024 06:57:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADBBEF805FE;
	Wed, 26 Jun 2024 06:57:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C501CF80423; Wed, 26 Jun 2024 06:54:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37425F800ED
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 06:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37425F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yxR8JYNf
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52cdebf9f53so3664528e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 21:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377657; x=1719982457;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDTuss67Yx7fd7cDafIxcHZxnByw4QHrUKzvfDG2YAY=;
        b=yxR8JYNf3K8KbELB5tiNxcXrFQLXjSvshpKrLx+T6VuabDW1iD35AdxRweJ7ujf2GW
         O7M4ZFr22k587M/HzwUoATAN0AzSEY1hxZAyTNd9iW0cKzD/XENgEyqKnqTTdiyKpWDN
         K7/bUns3PtBRG74vh/P3mJvZo2iy8HwEPKKB0Khi4JXfkFMLkKCm3hp0gmiFVVjiX2bM
         elJWygAMPxCVuVcVKlpSd24iAbKLGJYFNqCXWxPbSamo/JB2magwy433DMH6V/3k7UJi
         kJzEFSRBC5TRskTJT3MriAjpF4l3itOEBdA8Nwu/pBWPXZu+fPN1JkZQFYc1hFOmWtKz
         Da+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377657; x=1719982457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDTuss67Yx7fd7cDafIxcHZxnByw4QHrUKzvfDG2YAY=;
        b=XzLHgIcojaFjOxS71JDfEMaPQUHk6rxS/IlqHXDUYg7RlK259NoT8VFGF/Ggi76bXZ
         ENFFc1DEeE0L0teFl3EHl77VQnTHBRcyTlh34ah10501L7+hD3CUoKyk44zmNA81qPu3
         yotShOwAs840k8bZdRWS9Siv02yif3bslCOAvDT8OhgHABZtOT7t0WPJtQ5N6yjz7HwC
         c4JcTMpcwwSx4nXtvHZOxwRpHxs+5hdhvl5RYfEA0m9DNoIpYedPi+6AfflgD4BtJC1+
         PDVjeWB4BN5llj8hWzQ/jJMZ67p2ueRWXRJ/vRry1Aen4dpeD3gvuEyd+KyEcjrpHZ4R
         uD/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUULr+aVBytBUU1lfcSBl60dpCzkrDAoK9Er/pFs/lFiHJQCaJE66xGeE2PgVr6mWEdIsrMqHP8Y0KPrZRWPr2G0udYLdriPboZXeY=
X-Gm-Message-State: AOJu0Yw8Dcx4DsFeeJrVl5YrDR0xe/dcA3wFe3rpqTOBKSTanns+lEca
	5GfrRyZatFo0bKzZml2n8rxViuv8m/O5idCWEKvtDiezmhHSieAXObGlgRP6gjs=
X-Google-Smtp-Source: 
 AGHT+IH5H9cgOkKO3nvbL83vH3jZYJen4Iv5JetxLRNvEOsW2fJhXlCV5czSrb1aWQsTV8ChH4Ge+g==
X-Received: by 2002:a05:6512:5cf:b0:52c:cb8d:6381 with SMTP id
 2adb3069b0e04-52ce063e3f0mr5993129e87.13.1719377656650;
        Tue, 25 Jun 2024 21:54:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52dd3e25658sm63300e87.131.2024.06.25.21.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:54:16 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:54:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: codecs: lpass-wsa-macro: Add support for newer
 v2.5 version
Message-ID: <pyk6pejxeljab2k6pgnris6u5yxje5kw4kbalo6h2q4ntvjm26@nsokskgdgg6f>
References: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
Message-ID-Hash: 7BCSNJ6TZEWYGNFW2SNFAWNERYNPWHUF
X-Message-ID-Hash: 7BCSNJ6TZEWYGNFW2SNFAWNERYNPWHUF
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BCSNJ6TZEWYGNFW2SNFAWNERYNPWHUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 25, 2024 at 06:58:44PM GMT, Krzysztof Kozlowski wrote:
> Hi,
> 
> LPASS codec v2.5 and newer have differences in registers which we did
> not implement so far.  Lack of proper support is visible during
> playback: on SoCs with v2.6 (e.g. Qualcomm SM8550) only one speaker
> plays.
> 
> Add missing bits for v2.5 and newer codecs.
> 
> This is similar work to already merged:
> https://lore.kernel.org/all/20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org/
> 
> No dependencies.

I didn't check the register values, but the approach look sane

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
