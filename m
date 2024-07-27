Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DDD93DEFF
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 13:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C714EE85;
	Sat, 27 Jul 2024 13:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C714EE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722078269;
	bh=ENelbjUMYtttZc5KEREkEeLihVes7V7c0B9aT3qfjr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=our1+uTDP7g9Wo2ok3i9GfnmoKXNvCO0zu1oURxbgoZ6gAUD9J4AUgYOQEdr+Qclw
	 +NM5xh5RXuJuXOscH6ZskxFwII2jRRpJ5zfGfew/Luxas4uWcXGn6MDDXtmo8C7qIQ
	 C+MAzUo83vkmY6nc5Ul6hknFCcQ1yvq2HKVGufes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8C1CF805B4; Sat, 27 Jul 2024 13:03:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8535F80482;
	Sat, 27 Jul 2024 13:03:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79D39F800AE; Sat, 27 Jul 2024 12:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5DDDF801F5
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5DDDF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=By93ypsG
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52efd8807aaso3165960e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077219; x=1722682019;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqpaDDYEK1izIaPS4VXNn8Yq6EehHgLMYxtkn12m9Mo=;
        b=By93ypsG+/Qrg3m3HBvHGt8O1/nHES/3XrksFzQrACXhrbCxWsPJTP1fwwgvdR++JC
         8YlnNgFYF3s1q3MWr2R9dcbIWKnUUt/sHzbq48N0WtnTSdJAOwZjS22Yjbsa2ybQZo16
         YqEp2Yos7c47y4t9S8Mp8KYLtzBiTJf/zMg07BldXWzdTqE7s2Qx8IAizlhcXslXe5Qm
         2DcKZrAdlk0KVgkDP0fryKFF2eyVEgS6hvbjvGtaDAmOIDoZs9qhgGwbGQdVs16zZu5b
         iuBWdMSSekt61ZkoJlP8koe662wu5Ku1fxdqmohbNvZ/poqDy/VSnoDYGkNv3r+mZghL
         zr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077219; x=1722682019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqpaDDYEK1izIaPS4VXNn8Yq6EehHgLMYxtkn12m9Mo=;
        b=qfF/ZsiVFDSXHRqSHoZ29r4W+WrgvSuoP48vIoV6CRWtCZqZYGSM9/M3XkdCrfajHV
         or+LFPUkXrvuX5o3oyGWuW2nEa4RQk2412qUX74dc/z8cEeK4JaYEEXAMFJooInymZi5
         YCIqRiGq1JlZoU4qoCYQKOAl1sh6AkjUrc7tFHt5nGiyWKGii992uYV44CgsxLY+55Jr
         6iZnY6ZoAY61/glbUC1sZZBLyspxDr2NPIaShfZzmPI0IEPlNizJ/LRSgpLjpWvSWUhK
         4vjXBaw0VpUt6AtUFEPGHg8cdqoJPwc9uMzmgMZhvEBZxHxThD7pYLutZt26XTuLXjCI
         bxsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGFrCnaihqAsbi6bpY7WNL+CUvt9VILyGYsXKCBJabLSOveDT+KphqcFxvCbp1ZxtV6WLP+Isqji7KdTRRr71pmSkzML2rrGOKu+U=
X-Gm-Message-State: AOJu0Yzf/8nyQa+ry9h7PMZcegP7V4lom/y6qQ6VoUwp3Kz9/Q9jHXRk
	3iPqfl+vc9HgvYbFubLQ/A6AxLMFMv7vJJGosxES0EmlTrR/5V2z1DQZ52Dr8UA=
X-Google-Smtp-Source: 
 AGHT+IEAA8Vyu/jvBki3y6WhpcWjn+fJcdPYHZX+yGcEKRmJlDSK/lXOf+6qfu7//+lx2sfqwCIwxQ==
X-Received: by 2002:a05:6512:3da2:b0:52f:368:5018 with SMTP id
 2adb3069b0e04-5309b2d38cdmr1397881e87.43.1722077218856;
        Sat, 27 Jul 2024 03:46:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bc402esm737671e87.51.2024.07.27.03.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:46:58 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:46:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ASoC: codecs: wsa884x: Use designator array
 initializers for Soundwire ports
Message-ID: <3gd2qwpsty4owjzlborg5hkiqltpkk4gfzuj2zvxamjgjwvrlk@2x2zhokcfbv4>
References: <20240725-asoc-wsa88xx-port-arrays-v1-0-80a03f440c72@linaro.org>
 <20240725-asoc-wsa88xx-port-arrays-v1-3-80a03f440c72@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725-asoc-wsa88xx-port-arrays-v1-3-80a03f440c72@linaro.org>
Message-ID-Hash: IL5F3C2GJ5JR5AO662OLRIODV5WDP67O
X-Message-ID-Hash: IL5F3C2GJ5JR5AO662OLRIODV5WDP67O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IL5F3C2GJ5JR5AO662OLRIODV5WDP67O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 25, 2024 at 01:23:45PM GMT, Krzysztof Kozlowski wrote:
> Two arrays (with 'struct sdw_dpn_prop' and 'struct sdw_port_config')
> store configuration of Soundwire ports, thus each of their element is
> indexed according to the port number (enum wsa884x_port_ids, e.g.
> WSA884X_PORT_DAC).  Except the indexing, they also store port number
> offset by one in member 'num'.
> 
> Entire code depends on that correlation between array index and port
> number, thus make it explicit by using designators.  The code is
> functionally the same, but more obvious for reading.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 34 ++++++++++++++++++++++------------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
