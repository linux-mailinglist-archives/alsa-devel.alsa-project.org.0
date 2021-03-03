Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C4432B5F0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 09:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C128718C4;
	Wed,  3 Mar 2021 09:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C128718C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614760280;
	bh=/icnxsq1W3cTC2Wh35uEfjAKzZ2kw827KCd3yoxiXlY=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1C0Av9j5rdQJMoSeuX5aQTlO24mE9YboXOw3e90AOEhsieYVYxvZEAVrbRUGObaN
	 9Ho9j+gSXiLjRrdzMsdQFIpKVe3gqhoS2k58/slJQaSKv0dh6ACl7PBNFVL7GyDFht
	 +YpbeuOCEZDDqJ3Csyz3FNAlicT0t4r14yhaFCFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 216E8F8026A;
	Wed,  3 Mar 2021 09:29:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 091DDF8025E; Wed,  3 Mar 2021 09:28:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11DC6F8012D
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 09:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11DC6F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h2ZFm53/"
Received: by mail-lf1-x132.google.com with SMTP id v5so35723655lft.13
 for <alsa-devel@alsa-project.org>; Wed, 03 Mar 2021 00:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ib2TgD5LoGzEOYOzBLqBPjEaDbQedhA/DCVHfBWRCxM=;
 b=h2ZFm53/uMkUZaIMF16VaaI22yjZ3lsf5bqyAoveT937pPEp2dj85/2eEFzK/+d/uT
 NOkPQRKQZnnf+HmFa4HJeVolycoXP/cFFwI+SbCllFFuvhyU8uJYxVtg1gQSma703P/R
 vBWG4WQvZ6f48lT9u00r6irJUSEcagE5pEoxOikqmUf5z9jKORZ36aKNbzly67hUSB1j
 pji5kRLXK3bHo8CUFnpAM5OfGU10ws2zWaR2aZtTKfbpoi27MhOmhXT7PalZ+bFEG9GR
 n02UkdnTaojXDKznDb65VfgO7SyPj0gC0EWZawtJMtFDfDqqqAFd87vNrFo5ZbW0QJ8E
 n28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ib2TgD5LoGzEOYOzBLqBPjEaDbQedhA/DCVHfBWRCxM=;
 b=UfbeIhwVyWUkPJOzi0S1OsK6IjEfYC6yM9Q35AVFXuN9BqJZqLsEfSGTESwguCZJAV
 190QvK2Vrh2rerlV14TYwGoZ6ZN2ELI9nGz7CNsvYw6YrVngfsKlxzVh4RkJ+mhE2i+Z
 DsgNhhY5P6TivYF/Hamkeg97in1DY27/mEoQqQ82lABt9hM07ywS4Suu8jgu6XjISqLc
 LTEQTMQddaMmt81ti4zq5uZl5kZGyiD+0eyUWR8RX9VsdPiAyh40zrw+xReO4OXqXhV+
 Bydtn8sk5Yua06WcHW4Tv4HgXfTHEumA+21X7/XefaHQKfqFMLe0lS9+Y9fqBvNAiOf2
 4GVw==
X-Gm-Message-State: AOAM533kJ1kAX9piei7p8tWUZWJXq7xez6iwntHh/GjXukSeuu+dF+W3
 WUOQaP7NnXQupQwEwfRM1xs=
X-Google-Smtp-Source: ABdhPJzdo3EZD4OA6XpZETK1794bIMLnAyMAhAQ3I/atDvFI3Ud5c2mLqDPfih8Lyw8AbxoS403cRQ==
X-Received: by 2002:a05:6512:a8e:: with SMTP id
 m14mr4917828lfu.641.1614760125381; 
 Wed, 03 Mar 2021 00:28:45 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id p13sm3161447ljj.49.2021.03.03.00.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:28:44 -0800 (PST)
Subject: Re: [PATCH v1 5/5] ASoC: tegra30: i2s: Add reset control
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
 <20210302112123.24161-6-digetx@gmail.com>
Message-ID: <cbb1f0d4-ddc5-733d-896d-dd76ce01ca69@gmail.com>
Date: Wed, 3 Mar 2021 11:28:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210302112123.24161-6-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

02.03.2021 14:21, Dmitry Osipenko пишет:
> The I2S reset may be asserted at a boot time. Tegra30 I2S driver doesn't
> manage the reset control and currently it happens to work because reset
> is implicitly deasserted by the Tegra AHUB driver, but the reset of I2C
> controller should be synchronous and I2S clock is disabled when AHUB is
> reset. Add reset control to the Tegra30 I2S driver.
> 
> Note that I2S reset was always specified in Tegra30+ device-trees, hence
> DTB ABI changes aren't required. Also note that AHUB touches I2S resets,
> hence AHUB resets are now requested in a released state, allowing both
> drivers to control the I2S resets together.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 14 ++++++++++---
>  sound/soc/tegra/tegra30_i2s.c  | 36 +++++++++++++++++++++++++++++++++-
>  sound/soc/tegra/tegra30_i2s.h  |  1 +
>  3 files changed, 47 insertions(+), 4 deletions(-)

...
> @@ -579,7 +587,7 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	ahub->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
> +	ahub->reset = devm_reset_control_array_get_exclusive_released(&pdev->dev);

Thinking a bit more about this, it looks like we actually want something
like:

	devm_reset_control_array_get_exclusive_released_named()

that will request resets by given names and in a given order, similarly
to devm_clk_bulk_get(). This will be very handy for both Tegra audio and
GPU drivers. I'll prepare a v2 if there are no objections.
