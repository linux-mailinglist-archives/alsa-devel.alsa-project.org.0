Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6391BA54
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 10:47:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952982346;
	Fri, 28 Jun 2024 10:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952982346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719564428;
	bh=Aeqbd8mZF5g0gMvxy8MT2FkZAI51t9W3BeDBDhRYKN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rzwmjYNufwK/W1Kth4S/yhhk9E7xTdnlzYMkk+DC/GaUoa1E24vx+saE4jQzPE9g5
	 hfvia7IaaFdvepwHVvWB/Qf/wM3ci7HtdmdmlrezDdHYVtt2vhD6SLxmfJc39xvTc/
	 ivuYVRZm+y2C7S1d4z+hoaEzXdLZJRIH6NADjFZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 455B6F8059F; Fri, 28 Jun 2024 10:46:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 217B9F80587;
	Fri, 28 Jun 2024 10:46:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1295EF805EA; Fri, 28 Jun 2024 10:42:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30058F8049C
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 10:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30058F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MivHxPAh
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so388065e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jun 2024 01:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563744; x=1720168544;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kW8kDPyCelVzk0XP+f0C1TOEkGrqmmm6HbfYVtTsZyA=;
        b=MivHxPAhoF3w9Od9qf5DD0SJ4iOsSLPBsAbomkga18yz0RO7ZmJ+d15UkQw0KcknyZ
         ZAxwGxzzHg3d9XFvcI6oQTotxrAPAoWhyrInqhndK1xyyF25HceQPObVvoBxjSpdm6If
         5cXcq9UZALkz195NxmTilpHsji6GrKhRcYYh4pE9VjF+kiWwjndcf41gEZlB8dAP/gdw
         edBbIrOWf1g12GloS8hxa5hv/biZ2UqmnSba6RVPQd93ToyB5izhbdHK3vh8ysVuADUs
         QrBtGYz9dxu3ALloe3AtiVRiXjZWLObHLbWqjTlurlFjVVlOx4F8TW0noHN0qbATMarC
         qWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563744; x=1720168544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW8kDPyCelVzk0XP+f0C1TOEkGrqmmm6HbfYVtTsZyA=;
        b=K0e+7ASfKl3pb6dhoc8NNruJplP/B0/eC5qGsDTVPPjZSURz63e0+b4drZhkAvOoiA
         9U+fxNPqo5O89+r/jx9lnuTPg+zwbHPc9JPrIyL2Tne7L0v4GPU5AUM8rHbv0BF9uM1+
         gh4u+gr/Eq20Rqq7f3JdhQXHnjMb/NWfgbiNsAOX9TP2EdMckAXHPU6HnJrO40SqXBNt
         J0bNVpSOUxA6Nwe220f4JyceFiwk41f06x8e1fI56XTzZNmY9lvBXPzCZajmEcbFo7Ve
         u9MjKzUdRIa0KGtSVu/oaDk6uq4uX6rvP8E/RYxd59skmtiz54uqKVXGi0z6jqkMK7dK
         tQkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnsaZVFANxZ1g238Hv7leZQ43If6Jbe6WufUCxT3+hboOKuTnuvvy3urTLqkFkBROq/5Ps1S/yC43Evck+RPDYkYrT8vr19fC6M9I=
X-Gm-Message-State: AOJu0YzqOoqNFenn9s2UYdEWig3aV+NQ2rwMlxcml/NYx0otjGh8Y/ug
	WnOoUnRUG6kprFDSqMHqgLy+0ZitZA21MiXb/ADlGoBvqXC3Z85INbXnrKGLblY=
X-Google-Smtp-Source: 
 AGHT+IHTiAZIPdDFBY86RLx+OqmRRF+qtx5Trn2TYV6LbMTMP6YvfamTxpc4oxDTByLWmHsNlvA5Vw==
X-Received: by 2002:a05:6512:281:b0:52c:e10b:cb36 with SMTP id
 2adb3069b0e04-52ce183add6mr9396478e87.33.1719563744009;
        Fri, 28 Jun 2024 01:35:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab3b37asm209380e87.275.2024.06.28.01.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:35:43 -0700 (PDT)
Date: Fri, 28 Jun 2024 11:35:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ASoC: codecs: lpass-rx-macro: Use unsigned for
 number of widgets
Message-ID: <ojokmx4l5eaeclemszd4esgyfcov4gcqteegh3vqpbk7cdfmgn@yayrzbbaire5>
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-4-ede31891d238@linaro.org>
Message-ID-Hash: 5PBRGDXDLOLMEV3SZNGXMZTV2SIGWWNB
X-Message-ID-Hash: 5PBRGDXDLOLMEV3SZNGXMZTV2SIGWWNB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PBRGDXDLOLMEV3SZNGXMZTV2SIGWWNB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 27, 2024 at 05:23:46PM GMT, Krzysztof Kozlowski wrote:
> Driver uses ARRAY_SIZE() to get number of widgets later passed to
> snd_soc_dapm_new_controls(), which is an 'unsigned int'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
