Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3587B9BB2
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 10:01:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E27D103A;
	Thu,  5 Oct 2023 10:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E27D103A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492872;
	bh=9dUbRgklvda5FVHHBcOm36dosBKGFjjV2QFj/p5Kqbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F8SH5PI2n86I6XUXZ4FLZUzL1PEFPnKtx2Z128LgFhtZTjfEH2lFNbRr7CJa6Juax
	 tjxGeHgxzGRdP4fUcVtSChcTrO5aJItHC+218ATpcC9qJ8uCZXzGmQMy3KZ5C8MpDE
	 76SvyJhLr+Gpnwzn0XgiQ0Hht8YMvnG5oa+kmGhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACF86F805B1; Thu,  5 Oct 2023 09:54:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 449FAF80551;
	Thu,  5 Oct 2023 09:54:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A99F8047D; Wed,  4 Oct 2023 18:18:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEFA3F80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 18:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEFA3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=e9UENVZQ
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5363227cc80so3967987a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Oct 2023 09:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1696436273; x=1697041073;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IboRMXWE799EUNN9JDL2Tv/P+eapXOiA7kGcWk1PU9o=;
        b=e9UENVZQOr1elonktcL4qwRTa4Lmq1lJx3uYTGTPs+QB30QGwpx0RABKghIM7SiaLR
         0rNGvsEX5zDJ6r2e2MXmbVUkHtdq0M8ljmsF4GTta6KtCUxbO7gGx2NWeUQyaMSXPinH
         fKeUrby+FVjd3L83oBUObsW/d4S5CZiwDMsoQMSD0H7co8LbKUxXRBtk+B5JxsiIX31t
         YL9tI6vt97PNNRLQ9qyi5LUGa+KLiETg/G7NCOmrc6coq/3RmrDrukxMSTYk8pDpFWTQ
         FiWy8Xmypx39Utje05AxBFJzUa4YRLm6AaXaLvz0HtntG07OK+MFzhfMRrJXv8074kK+
         bjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696436273; x=1697041073;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IboRMXWE799EUNN9JDL2Tv/P+eapXOiA7kGcWk1PU9o=;
        b=UbJtUlvXRTyQkjJWlEmtxy4+Xoxnqd7YAW5KPOi4E4LTZFJquNGJ9v1Z7TgX1khZZC
         87r0tnaDqvW62PLFnKKZwOxPb61YNc6GKclPjFBj+Zvals9I6cKykBAEo5D0pLmmswJy
         G0J8gspGJquNZJa7sBuf45oVEu7VvToHGadui67hPSA5e6fpCkOIzsyXjB/qoKGEgbDZ
         rdsw17mWsNb2zTja/7EXhq6MdlFepD+6ZQzLhGyFTp6uEEybju2HLpokLIN7G1hREN20
         ILhOSISFDwp5qaJmM5USCCZCx0K5hrLLPAPNwjFJWBL/q8sk2Pj4wgvstahMAlXi4vYO
         DIVw==
X-Gm-Message-State: AOJu0YwkgD76e6Pv0H9xzhOWV8aG8d+uIIeGqSMg+IpJdefs+Nbbf9Lz
	KpzUvNmbx0zw9mnQw47I4/laYg==
X-Google-Smtp-Source: 
 AGHT+IGxOeqnR4/4kozPd8vGztjp/+DmdrVb7jcdZSkFUd46at+lIJgvhTUzH7MccQN+WduUqYwZjw==
X-Received: by 2002:aa7:c508:0:b0:523:100b:462b with SMTP id
 o8-20020aa7c508000000b00523100b462bmr2617775edq.5.1696436272722;
        Wed, 04 Oct 2023 09:17:52 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.24])
        by smtp.gmail.com with ESMTPSA id
 r17-20020aa7d151000000b005346bebc2a5sm76257edo.86.2023.10.04.09.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 09:17:52 -0700 (PDT)
Message-ID: <72fb244b-e4b8-4eb2-cb20-1d3d37f813ab@tuxon.dev>
Date: Wed, 4 Oct 2023 19:17:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/5] ASoC: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>,
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
 <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LJXDONBUU7XMAYAAXGUFEPNYLHH5LBNC
X-Message-ID-Hash: LJXDONBUU7XMAYAAXGUFEPNYLHH5LBNC
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:54:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJXDONBUU7XMAYAAXGUFEPNYLHH5LBNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 04.10.2023 18:58, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  sound/soc/atmel/atmel_wm8904.c                             | 1 -
>  sound/soc/atmel/mchp-i2s-mcc.c                             | 2 +-
>  sound/soc/atmel/tse850-pcm5142.c                           | 1 -

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev> # for at91
