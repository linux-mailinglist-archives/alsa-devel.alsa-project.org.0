Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67B44D24FD
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 01:31:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16A4C1832;
	Wed,  9 Mar 2022 01:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16A4C1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646785913;
	bh=5+FwWKNG5HUmTA7mIDNuOkdkND7PDVNUHVE26HSYTXY=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGeaOT4gPwvd/FxKqarON1mRlF4vaHXPkD1oWbGr/oJCYDE7f2+hTDBtWnLiy8lkh
	 OCdOomQ+PodRGmYgVr8Xh+MJRPj5UcVnW4yYKBx5MAbM719/e+3C1Jm0z55GZ9WKkG
	 uBn8qInfJbHmfQFfWAtZlB+RDiz0IaoNm1SPyTsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65D9BF8026D;
	Wed,  9 Mar 2022 01:30:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59A9EF8026A; Wed,  9 Mar 2022 01:30:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23DBCF800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 01:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23DBCF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="rzQBJASL"
Received: by mail-wm1-x32f.google.com with SMTP id i66so435630wma.5
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 16:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=53mv2wpGk88zHDCxzChxzDntymhF9ZRIwaSnWXEWls0=;
 b=rzQBJASLVSFLoebUcrNcZ/qIFXaVAAHCd7y7ceunH2pKD3pRp2rjvtVVFyH+qzuRRg
 3yCVc+06J098wGtKO1DlNXNgQCDGtcXOlpIbVbPrTQzzTKGf6MmmCODt24Fjy2WR+S18
 PnnQFWk5jZy8500Ns/JKMLBX933XiJNYCXx97LYo8sRAge4zyvknxIlQ1ZlYyDUYAS1Z
 cDZ7OfyuXrmFRtfeMsUxzn7pA8I0zE6FkB7UaCjdRMw7iTsTiwGFeMmfBbgf1hc6keJ/
 I2Nku8I3q4q6S8DaISQxvAxLB2dpr267zPx0DjIIF7zeiMpIrnnop1qDiZlYuw6bcyPg
 foGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=53mv2wpGk88zHDCxzChxzDntymhF9ZRIwaSnWXEWls0=;
 b=4qZZlYRDIO4Jzx+2HxaJeaAKrPCKhGnukmKpZEYp0BymPCo6Z8GOWcsQRzZ21i49Gs
 2D9qzn/5ZPaysyq3QEgW7ECIKB1kpo+2EDHYwp2yhxheGdPaGzcgsE4BHIhcKmGZH7/5
 ZfYxTxPXtZXEvH5GYAQT5uCe/b06wChXZ3Dk8NCmzHWuqaf4P9inE3QDmTo4TlP5cipt
 olFjDjtTkQwJwPv3y5+K3KrmB8F4/BuOzuEA5pSPHVvd5esz0iUp/GRlBsxg2r6M3JgK
 LnaqT31RUAl7mzhXOvuzzACO7KjhA145ifDsuI+ieqwlk52eFQKLeN3gujcBiQZ8ddMv
 MJNg==
X-Gm-Message-State: AOAM533NVgydwtFWpX0XO116NAZuhSmsBdLNUCrQ++M8PF1snFIziDJL
 pQGfnQX+JoNk5+8WXoj9jwKouA==
X-Google-Smtp-Source: ABdhPJwmzdzw7u2eprVrxG8sP+F9kGB8M3FUlAaULW3JXjLQ/Omv6WsZIKsLtb0lDH72QvCS2qn1zA==
X-Received: by 2002:a05:600c:1908:b0:389:c3ca:9eac with SMTP id
 j8-20020a05600c190800b00389c3ca9eacmr1312123wmq.182.1646785836198; 
 Tue, 08 Mar 2022 16:30:36 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfdd52000000b001f04e9f215fsm263527wrm.53.2022.03.08.16.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 16:30:35 -0800 (PST)
References: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
Date: Wed, 09 Mar 2022 00:42:04 +0100
In-reply-to: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
Message-ID: <1jcziwnf10.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alsa-devel@alsa-project.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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


On Tue 08 Mar 2022 at 20:00, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> On a S905W-based system I get the following error:
> debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!
>
> Turned out that multiple components having the same name triggers this
> error in soc_init_component_debugfs().

Because the component name is directly derived from the dev name

> With the patch the error is
> gone and that's the debugfs entries.
>
> /sys/kernel/debug/asoc/P230-Q200/aiu_acodec:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/aiu_hdmi:c1105400.audio-controller
> /sys/kernel/debug/asoc/P230-Q200/aiu_cpu:c1105400.audio-controller
>
> Because debugfs is affected only, this may not be something for stable.

It is not entirely true that only debugfs is affected, though it is the
only thing really complaining.

I had a similar tweak around debugfs entry when I first submitted the
AIU. There was a discussion around that:

https://patchwork.kernel.org/project/linux-amlogic/patch/20200213155159.3235792-6-jbrunet@baylibre.com/

I proposed a solution which got merged but ended up breaking other cards
because there was some assumptions around what the component name
is: basically the dev_name since there was originally 1:1 mapping
So it had to be reverted.

Full details here:
https://patchwork.kernel.org/project/alsa-devel/patch/20200214134704.342501-1-jbrunet@baylibre.com/

Unfortunately I did not had the time to continue working on it since them

>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  sound/soc/meson/aiu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index d299a70db..c1a2aea5f 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -68,6 +68,20 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
>  
>  	*dai_name = dai->driver->name;

While I don't really mind one way or the other about the prefix itself,
aiu_of_xlate_dai_name() is not the place to tweak it.

This should be done before adding the component, not when parsing the DAI
with DT.

If this is really a problem and Mark is Ok with, what you want to do is
revert commit 024714223323 ("ASoC: meson: aiu: simplify component addition")
>  
> +	switch (component_id) {
> +	case AIU_CPU:
> +		component->debugfs_prefix = "aiu_cpu";
> +		break;
> +	case AIU_HDMI:
> +		component->debugfs_prefix = "aiu_hdmi";
> +		break;
> +	case AIU_ACODEC:
> +		component->debugfs_prefix = "aiu_acodec";
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	return 0;
>  }

