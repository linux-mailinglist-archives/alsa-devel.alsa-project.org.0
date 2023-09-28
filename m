Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933D7B3F1A
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 244B6DF4;
	Sat, 30 Sep 2023 10:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 244B6DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061722;
	bh=yNWrvg9RSxhcL8gRvSU8wZSW9cS1tY0WKMBXB8EEnRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bz068QBLqu4FUFw3LjJWiWVwLPD+VoG5rxpbCS8ZcypX0sgKr80jl38zSKtwAwX+i
	 s+O2I0FnLfSOO5MuQzsNMDLR9630QxhKtOGH26ti9gMVCJ7Epe57z9LoMJwsSZ0AUt
	 5wihWQ02eYiABOceCf9AgGpHW1i35Yf+YgLplXvU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9362AF80602; Sat, 30 Sep 2023 10:12:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A5EF805ED;
	Sat, 30 Sep 2023 10:12:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B95FBF801D5; Thu, 28 Sep 2023 08:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C15FFF800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 08:59:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C15FFF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SlFDTF4g
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-405497850dbso106386045e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 27 Sep 2023 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695884353; x=1696489153;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IxtdkWUQyRUGTWll+i5PkjZHj3/ZutnR3Ko0Ft8Vpf4=;
        b=SlFDTF4gT/7evC5YPP/LRyb9lNCKOZtWdBAXDdUUq2HsVhJlkuciZDmhmz2szHI16M
         DODYWZACOG5z2fInL9dyvVVsepeCUmCxAH9huahuXQ58M4m6SFExyH4GjRtETBrWVAPw
         bW4JYIQLgw3VYQxVuDQqYr5wNGndFVdmp4HrfmNiVH+m1Hze2QNZcsA9WCupiBMT46hQ
         cfn4/rXa7c0sApIMvR8zsBEQR4zP0bH7IcxaTQkkEmd1hR88+XIdyTQbFSDS+4jbqf5q
         5z3IpRIJIG3FBVsGuSISUYrLwHpkphqesDF/gli7yc6uXKgqWw08fxu9Hlda7c8QrAqG
         9Uug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695884353; x=1696489153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxtdkWUQyRUGTWll+i5PkjZHj3/ZutnR3Ko0Ft8Vpf4=;
        b=tOmhHPENnQyPain1caai9prw62KpHDRYMxzuCc86alaFXy2pgykzJZO1ngcEDnmcsZ
         s1AgU+dv3YtmZcfiXlYTcgOgs9tH3Oi4/59xFtJWpuySuwwEY9BPASqb3OrPuvzi63+G
         UG3vCYHTwQvz6o8bhkLcj0Yeuny2hrpWwVPSUSjcWZH6RBgRwDBiefOdJ7Jb3aIP8Y8y
         xCUv/HXLZefrxo2VD5tLPnjWaRlphWINjcmgnTV4q3PTPrIVW/MFlVXccS2S3BKOTpll
         cPYWrgQJYrY1K5XZIKHZBUrT8abisCpqNfDPfj7rvpl+RXsM7QBOFEPW0k2Wjg410nHj
         NN8w==
X-Gm-Message-State: AOJu0Yy7fAtmWCBAD596KM9jn2vJvOAsY2WeXVdMbvwAGVZkJqUgj3is
	kbXXXoRyuQP6qYTYcOhE9J97/g==
X-Google-Smtp-Source: 
 AGHT+IGKeFwM5Om0OMVfRkBh1YdUioiRAuzKQMZJEqVhiuiiZ7tZD589pp+o//kNbzitL+JePrtmtw==
X-Received: by 2002:a05:600c:3b22:b0:406:5303:9be2 with SMTP id
 m34-20020a05600c3b2200b0040653039be2mr304954wms.0.1695884353220;
        Wed, 27 Sep 2023 23:59:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c220400b003fe61c33df5sm6326296wml.3.2023.09.27.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 23:59:12 -0700 (PDT)
Date: Thu, 28 Sep 2023 09:59:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: wangweidong.a@awinic.com
Cc: 13916275206@139.com, alsa-devel@alsa-project.org, arnd@arndb.de,
	broonie@kernel.org, ckeepax@opensource.cirrus.com,
	colin.i.king@gmail.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, doug@schmorgal.com, fido_max@inbox.ru,
	harshit.m.mogalapalli@oracle.com, herve.codina@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com,
	linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
	liweilei@awinic.com, perex@perex.cz, rf@opensource.cirrus.com,
	robh+dt@kernel.org, ryans.lee@analog.com, shumingf@realtek.com,
	tiwai@suse.com, trix@redhat.com, u.kleine-koenig@pengutronix.de,
	yang.lee@linux.alibaba.com, yijiangtao@awinic.com
Subject: Re: [PATCH V5 8/8] ASoC: codecs: Add aw87390 amplifier driver
Message-ID: <71f6bff0-c173-4de2-aed0-38ed2c15ec59@kadam.mountain>
References: <464ada20-072d-48f8-a270-155dfd4a06b9@kadam.mountain>
 <20230928064330.104265-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928064330.104265-1-wangweidong.a@awinic.com>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4ZKD5XZJ3YYXVPMETJ4DRRZSCR3PFKZ4
X-Message-ID-Hash: 4ZKD5XZJ3YYXVPMETJ4DRRZSCR3PFKZ4
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZKD5XZJ3YYXVPMETJ4DRRZSCR3PFKZ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 28, 2023 at 02:43:30PM +0800, wangweidong.a@awinic.com wrote:
> Thank you very much for your review, but I have some questions
> I would like to discuss with you
> 
> > On Wed, Sep 27, 2023 at 08:16:34PM +0800, wangweidong.a@awinic.com wrote:
> >> @@ -668,6 +668,17 @@ config SND_SOC_AW88261
> >>  	  boost converter can be adjusted smartly according to
> >>  	  the input amplitude.
> >>  
> >> +config SND_SOC_AW87390
> >> +	tristate "Soc Audio for awinic aw87390"
> 
> > Capitalize A in Awinic.
> 
> Thank you very much, but our company prefers to 
> use awinic rather than Awinic

Ah.  Fine.  I did Google the company name but hadn't scrolled down
far enough.

regards,
dan carpenter

