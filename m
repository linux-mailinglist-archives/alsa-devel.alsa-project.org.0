Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BC433F692
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 18:21:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8FEB16D7;
	Wed, 17 Mar 2021 18:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8FEB16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616001707;
	bh=tUY5VAEw/UzSDL7/pa7a/yq3LDL7WLc7x6Ex+yqgnWk=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HtVg7X+sJnN8XK1a21QodCOTAInMB1O/3PjebUGDWiDAgkKOq0+BJNY02YS7RFjU2
	 4QmCDGTNVMJT+119+G1NLmwhrWA/2tNQG9PVDp7DTcpoEALNsPlS72KXTf422e3add
	 S3NCFFVIHMD6V2zdoJt9DubeTzEYRMjsJkJy4/WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F274DF8023C;
	Wed, 17 Mar 2021 18:20:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 493EBF8021C; Wed, 17 Mar 2021 18:20:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A71DDF8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 18:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A71DDF8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OoZX2tiI"
Received: by mail-lf1-x130.google.com with SMTP id m17so84678lfg.0
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 10:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NFi1kFhrUTgn5FvPk8wh5i9n6BvR2USVpUn/9xflTkk=;
 b=OoZX2tiIQyHFy7a/jirVKoULGhIrjwPvuvQYgCktz4ZesxRQIDzLxjYERGMvcaXbl7
 ryx5JZPNhEiujaONPvnTEyRdEh2Ng2lheMKTZRstYdQVPM/2jB3HUccjYkZXVPtkuvCL
 EqfZCMS7EewunrhZM9O7vYe+c200rM1v8egLvPZN2bAYMqGlTxg7Asacma/8LAFUbrts
 IOGgi9jIHiCuEn5jWEstEXVelAIqOj77bkrhQkwwnuj3vQ3N6xqO/u/DKvCK3iEs3TeY
 NKspi5cJRrgqwvKgXLBFsQnrkviRb9cN8vW0kJjjPSRkzLj5itjRAq50N/XjuEgvfjLd
 Zpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NFi1kFhrUTgn5FvPk8wh5i9n6BvR2USVpUn/9xflTkk=;
 b=LV7fLFLk7pGxbQoKi5CG+6w/ilmtBhxZRmUUgmkQbBOcfZPCtidotOi7R5rVanax28
 DmSN2rGML8WnrmFd0836mqWX5xYtg1/6Hx97ZwF052N33Lfr4MrupMrgtFqK188UbokX
 Y255gId3pHz8Y4IvBfEvTTb7LRPXBhRV7HB0V//XUIv3UdQAyUBfFc+ub8dWy+pZpYzp
 p0zyKTqcH+wyTQnfz7kJJ/SdMZgVk0PMgsf+gJZLMCdBnSkB47iVXwO8VVTTBh3Dm9Lu
 nvlCkxAIuJB7kUB5pDy01yj9pdHkMCQr4VQgcBJLeJkxvQwqVSY2I1NlGuQg4lFZdW0r
 Y6fQ==
X-Gm-Message-State: AOAM532cH62+jikeWfkXrtsx618h2ntfWzqt6BWYI/2zG+eWJXiSPZME
 iXeAZuYRCnaGN10ACdl1nnVdQkc9740=
X-Google-Smtp-Source: ABdhPJxMJd14k9yjtgxRwNLmMWFGlgc0PX7nuLmBb8FfvmGKIWsxLnOUuuJIpmAAfPUbW+HjT4CY2A==
X-Received: by 2002:a05:6512:108e:: with SMTP id
 j14mr2741412lfg.364.1616001611659; 
 Wed, 17 Mar 2021 10:20:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id v2sm3576654ljg.89.2021.03.17.10.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Mar 2021 10:20:11 -0700 (PDT)
Subject: Re: [PATCH v5 00/17] Fix reset controls and RPM of NVIDIA Tegra ASoC
 drivers
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
References: <20210314154459.15375-1-digetx@gmail.com>
Message-ID: <be93d088-fefe-77f0-9b8e-9c815cc0d0f0@gmail.com>
Date: Wed, 17 Mar 2021 20:20:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210314154459.15375-1-digetx@gmail.com>
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

14.03.2021 18:44, Dmitry Osipenko пишет:
> Hi,
> 
> This series adds missing hardware reset controls to I2S and AC97 drivers,
> corrects runtime PM usage and drivers probe/remove order. Currently drivers
> happen to work properly because reset is implicitly deasserted by tegra-clk
> driver, but clk driver shouldn't touch the resets and we need to fix it
> because this breaks other Tegra drivers. Previously we fixed the resets of
> the AHUB and HDMI codec drivers, but turned out that we missed the I2C and
> AC97 drivers.
> 
> Thanks to Paul Fertser for testing the pending clk patches and finding
> that audio got broken on Tegra20 AC100 netbook because of the missing I2S
> reset.
....
> Dmitry Osipenko (16):
>   ASoC: tegra20: ac97: Add reset control
>   ASoC: tegra20: i2s: Add reset control
>   ASoC: tegra30: i2s: Restore hardware state on runtime PM resume
>   ASoC: tegra30: ahub: Switch to use reset-bulk API
>   ASoC: tegra20: spdif: Correct driver removal order
>   ASoC: tegra20: spdif: Remove handing of disabled runtime PM
>   ASoC: tegra20: i2s: Add system level suspend-resume callbacks
>   ASoC: tegra20: i2s: Correct driver removal order
>   ASoC: tegra20: i2s: Use devm_clk_get()
>   ASoC: tegra20: i2s: Remove handing of disabled runtime PM
>   ASoC: tegra30: i2s: Correct driver removal order
>   ASoC: tegra30: i2s: Use devm_clk_get()
>   ASoC: tegra30: i2s: Remove handing of disabled runtime PM
>   ASoC: tegra30: ahub: Reset global variable
>   ASoC: tegra30: ahub: Correct suspend-resume callbacks
>   ASoC: tegra30: ahub: Remove handing of disabled runtime PM
> 
> Philipp Zabel (1):
>   reset: Add reset_control_bulk API

Mark / Takashi, I may try to split up this series into two or three
smaller patchsets and then the reset/ patch from Philipp Zabel could be
merged by Philipp himself. I primarily want to have the audio resets
fixed and the reset API extended with reset_control_bulk in 5.13 because
this will unblock other patches. Please let me know what you prefer more.
