Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 851E093DF06
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2024 13:05:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFEF8F51;
	Sat, 27 Jul 2024 13:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFEF8F51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722078344;
	bh=68s/AGh0KdHaOGVbq3ybeiL3/h7OccMgD2M7Qinek94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WCbNCkS69JcSU7lqaZIztjsHS+xZYZlPtFBSHA7Cv+aAtYXmgGvwqoGuq953rlynN
	 TbUPAYpDqfp5TOuRV7M25acgYYww251y36JZPNqHk51JruI8b+h0MkadoN7Qg/zHIR
	 TqDVbym6oto4CnEqoLv6RLgpfLE42kG8m2svXSoo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D792F80655; Sat, 27 Jul 2024 13:04:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 89BA0F80651;
	Sat, 27 Jul 2024 13:04:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D04FEF8026D; Sat, 27 Jul 2024 12:55:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06DAEF800AE
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 12:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06DAEF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=crxWX3JW
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so3072416e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722077742; x=1722682542;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSQLqxhvdwaXYSfWwT/zXs0MzmxstO7ywTlJURA+QUQ=;
        b=crxWX3JWrgHXIv83rEcoHDM5kPZkjhHtyljQNAcpzZ9sXRWMrSGU75qIItOBx3K0M5
         xT4Q7quzLZFwQHsV9hd68PLoodPtkPZw4qVQva0j1f1d6BGBH2CHnWtHGzJK0WAcudW3
         Msn7zoyhRQR7NjBACLGCqHkidbgt5WvrtNW3+3b2U+f3feIMbHmODeW11chVWXCy7Lg8
         SGGecS10wtyrdvZSLqnGLjWG3P/FfnJwcYyWs8cM205HzhHq/fa7tiR3CIg5dgu8+r8e
         66ICTVbKVVysQdtaiSvUakNTWRnVmvfG5IHm5DOvSdfgyDhaCqsQ6ZQi9/IbDLfX712x
         rFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077742; x=1722682542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSQLqxhvdwaXYSfWwT/zXs0MzmxstO7ywTlJURA+QUQ=;
        b=MCpufn/w49aP5cjznJgBSDJhQ0xBvNs52LNqe6EESsupAy7d/s9maqWcXchd0umz+9
         MZPgj8O9ErFL1PRGcm6EvDqCd6A7bYm96X9G3Ds8eoPT5IAPEA/ohG+BnokXaGYAH8xN
         M151coMFPGJ3lh+JtDC7S5n0w/kOHBcqJ+8bBZBpovWBNXyz2xuZtVuuQOhTtthWQF9h
         LY6Gfh5NzqVuK9xmntOf4y9ztJFHkLi9K2HoR6CuneyHcheaZop7r/4uOoKeUuj7nzhp
         Y+SqlWogjOIXzbeFUVqWOqeYjpTb7BXjryoqGEi/vEkl7UekcwLPH9YfgSo4drlpKw/R
         Cqlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnp5TrsbHs3xt1NtA5h5K+Ptu0ygZ63rOXwMdbtnl1S6iWESC7C4RD0kwxT9ZyWDO2KvvDiWFiQocypp19yd9QzJlnCqv3mUawias=
X-Gm-Message-State: AOJu0YxwYiBnXNzD66h+MqEihN3VbptjRoXkSYZTIWFENeTQ0YJJQZ34
	iyGgR5Rk08B/l61gQrdOQZw9qgTl1EO3MHhJSg3aGCFYxGidxt3Wz1fsP4vpTBM=
X-Google-Smtp-Source: 
 AGHT+IG/g89VE0vaiUQwCJYmJWWSqhFEML1N3eYG2UploJkfiYPufIYQVcfURtGME0TkGEoamzZuAg==
X-Received: by 2002:a05:6512:2513:b0:52c:b479:902d with SMTP id
 2adb3069b0e04-5309b259c26mr1773343e87.4.1722077742260;
        Sat, 27 Jul 2024 03:55:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c081ddsm736621e87.132.2024.07.27.03.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 03:55:41 -0700 (PDT)
Date: Sat, 27 Jul 2024 13:55:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: codecs: wcd93xx/wsa88xx: Correct Soundwire
 ports mask
Message-ID: <kggm3zlkevqw3lelxukz5lyfch3vd4uxta3gi7kcidacpo7uz2@hlqq73saz27c>
References: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
Message-ID-Hash: YH6N6ICORKNXF4BUC6I3CMV4SZAMVSNM
X-Message-ID-Hash: YH6N6ICORKNXF4BUC6I3CMV4SZAMVSNM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YH6N6ICORKNXF4BUC6I3CMV4SZAMVSNM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 26, 2024 at 04:10:40PM GMT, Krzysztof Kozlowski wrote:
> Hi,
> 
> Incorrect mask of Soundwire ports - one bit too long/big - was passed.
> 
> Theoretically, too wide mask could cause an out of bounds read in
> sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
> driver, e.g. adding incorrect number of ports via
> sdw_stream_add_slave().

Well, granted that sdw_stream_add_slave() crashes on RB3, we know that
the driver is buggy.

> Not adding Cc-stable because I don't think the issue can lead to real
> out-of-bounds read.

-- 
With best wishes
Dmitry
