Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB0965FB6
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75DA1839;
	Fri, 30 Aug 2024 12:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75DA1839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725015423;
	bh=0yNkwl+K5/f2VBOn0wh/xwNfO68u56iaPDTBCQB+eAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JGRuLJvRzL2fPPUVmzuuyokGRD9wTMShTwp1JvG6N0YVLwb5qrp8VUVHlR6J1s/rF
	 m2gUYo4oV8CirKEwCt2gsxnttZEF1pX4CVTNkZ5GPIc9D2RLUIgqKSN2jbOMcslZkM
	 cDgp3lcmw0WpXZXDMYWr/kKZ/TKGcaPraLUoLBDI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BAB4F805B1; Fri, 30 Aug 2024 12:56:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D89DF805B1;
	Fri, 30 Aug 2024 12:56:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D78F80518; Fri, 30 Aug 2024 12:56:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6C4CF80087
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C4CF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U6lA0A/k
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5334c018913so1500557e87.0
        for <alsa-devel@alsa-project.org>;
 Fri, 30 Aug 2024 03:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725015381; x=1725620181;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0gKyKcoJ3TdGstuho5BLbj3dZPw1dj82Fy+eFXEsXQM=;
        b=U6lA0A/k6nCM+g7h23D9oPfBQ6Q68OLwYyb7DwtD6r9mnWv0W6swWDusUBrlZqYSEs
         y1kT/mQaz3ttSOyffUN0Uq8NH62yIJ2KJ7ywy9rWKzyPHqcwLi/Yf1Ey9F9jBxzVEoFt
         vf5KVzQ0m/xoNBzv5cHJ2kui4dtUg2NjlHG4bCNQ1xzpG0MM3SycjiPXlxmAnL3dVj9W
         t2knXzEN3jZcowyo0a2+C4BMQZBIsEBfXlI0aWv2t21rXkoa+pqK8wPbXjchRHAj0epS
         YjNPShZCq7Cm8jkF3/LZv1ji2c+K+dmryOyRVfNxvMa3v2qm4SZSY/ZbGekBDrODXMgZ
         A3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725015381; x=1725620181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gKyKcoJ3TdGstuho5BLbj3dZPw1dj82Fy+eFXEsXQM=;
        b=TJNwLvFI46dC3yRGYz6DnFXaMVnhzp7lRtY/QiBd99Osb91sp5VKuEpAzW7oHDz0tm
         1EfQku3LQMMDVI2LnlHngV4MBD3Yv5oDK554gy00QkOKd885bpETDKPdUnErCrmpExLr
         GR8kCGsfxn3QQ/yxJmN4+3w5P/edTvYyTz+QDMUNdT5vF1BeB/5ylbwq8lCok4QvdXUO
         8ErraJBqTZ7ne3/OsWuz6mgDkYbtE+2M1hXsXf7cXiWGACGeSRm5BlQxreoBGn6OQsKU
         VKG+F7xRmSCcW8DSlpzdok/sIlzVKdlSps6/CdS531ZFGDenIHde5H7yB5PkKNUrK/Zu
         ONpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9g/3Y7ebE1Ec7/3sdEV7l9gONHxoiF6IdSiMI8ysEeT7Uj/FhWLa5OKL2zeUWhi97To9eLR1aTHnk@alsa-project.org
X-Gm-Message-State: AOJu0YxwCuqBBqwabWty5fGt5mqI2zyHQcEjAVQoIjcBqeGAxjssM2gf
	30zcPjkHUmdFMQTjbJ2IJOKQh4OfPN9x6cQXEqwe/tGFaTcLxsxv+KgwCXgKzGw=
X-Google-Smtp-Source: 
 AGHT+IFhQ6PoGmrOUr14jdbBRUr38XMXRb64j/1OyzzvHshRezk/QL3UWUvUtUOcTCJicKZk+oUx6A==
X-Received: by 2002:a05:6512:2309:b0:52e:98f6:c21f with SMTP id
 2adb3069b0e04-53546b0b111mr1274057e87.16.1725015380724;
        Fri, 30 Aug 2024 03:56:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540827a11sm545340e87.162.2024.08.30.03.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 03:56:20 -0700 (PDT)
Date: Fri, 30 Aug 2024 13:56:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: srinivas.kandagatla@linaro.org, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 amit.pundir@linaro.org
Subject: Re: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
Message-ID: <7tzmorkxuaiztz4vabjvfclv6s5vu2dtlfd6vzlnz66jhg6y2p@msgesiuficec>
References: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
 <0fcd3421-8086-44bc-b24f-7fb2262a675c@nexus-software.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fcd3421-8086-44bc-b24f-7fb2262a675c@nexus-software.ie>
Message-ID-Hash: IFR5NZUMMVJZDUI52XFPAZS534RBQBE3
X-Message-ID-Hash: IFR5NZUMMVJZDUI52XFPAZS534RBQBE3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFR5NZUMMVJZDUI52XFPAZS534RBQBE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 30, 2024 at 09:37:39AM GMT, Bryan O'Donoghue wrote:
> On 16/08/2024 10:12, srinivas.kandagatla@linaro.org wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > sm8250 and sc7280 have lpass codec version 1.0, as these are very old
> > platforms, they do not have a reliable way to get the codec version
> > from core_id registers.
> > 
> > On codec versions below 2.0, even though the core_id registers are
> > available to read, the values of these registers are not unique to be
> > able to determine the version of the codec dynamically.
> > 
> > Add the version info into of_data, so that driver does not need to use
> > core_id registers to get version number for such situations.
> > 
> > Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Seems to be fixing the reset I've been seeing on rb5

Let's hope this patch can find its way into v6.11

> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

-- 
With best wishes
Dmitry
