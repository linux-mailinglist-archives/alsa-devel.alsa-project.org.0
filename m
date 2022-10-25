Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C65360CC44
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 14:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F9815328;
	Tue, 25 Oct 2022 14:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F9815328
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666701884;
	bh=34VsYq4n2RDUur/4vw8PqAd9uQlmkAzoXWzgUKgfGPs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GnG+m2xll2smKvWpB9sfy6dBej82EeMwLCIQB0hkeTYXnxKNqyuoOMlBeRMygt9qw
	 TEhFzlRDa7K4D/+nkfwGWzdEQV89+iHHymkEm0PMo1aCj6cenBYKXyI8TCqwcOuFWI
	 TxozOghcCXgsrwhwXmTA1e4s6IjYqt8S/6bi7Rb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2CBBF8047D;
	Tue, 25 Oct 2022 14:43:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8289BF80448; Tue, 25 Oct 2022 14:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07328F80240
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 14:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07328F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CGWd9EGm"
Received: by mail-wr1-x430.google.com with SMTP id o4so12405479wrq.6
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 05:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h4bB9DG6I4yQg1VaBFFskr0kCoybfjGK9a489xozqbQ=;
 b=CGWd9EGmlJFK+YEPgI0l2hwe3QK0ZhOT+JHvVsiZC12bo+c4Jl/FAYJrdHvAalOpGt
 tllbwPXcjRHsXQblFv5wBCsA+ty066EcfLUUp3vq6jrgpqnCqf5fS8/J1FkAml46w5yQ
 tGseitrCIP8oromfF0eRIfZdWQWi2HtjVV0Dkq9KDifUwNdXpfMbqoiGOSksX7lTAln9
 bLuFQYXiUwWkd/i6dJqmss6GUSSdrz/4sDW9ZpmRhAlNVYZ+yjvTlyCsYz2IfUoCLaTa
 kjMSP2GYVCuZOnYOe03eK2yd8xVrU4sjiIjmnirDbhaLGlIfyZ2JIE6LdJzGBTV9bPVK
 +Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h4bB9DG6I4yQg1VaBFFskr0kCoybfjGK9a489xozqbQ=;
 b=FC72JMvScIiM7527GQvNOn7t3szK41GWCJWat69meH6zZhGdxqPEhr/Pi0X/oFaaYR
 1RcblFLhThcIFX6N1qoIxVKiixFV6auKe+8fjglOSeQ7gAFCj5wdWQ9MwyB1uTqqerVE
 1ZVQeXeqlbPSHm7ILDnZ+oxHojKpN20LSKJO+Wud0sXusBHnvBr+SoJ3Xx38GTfXtjdg
 Azl/qCR0r2KcCyDSskFVO2b2hpBjIgy0hx49kS/h4dV5CSgFqPPMCN5MfS3FLPoEpRda
 11lEnuvleI7B1HUUQyk6LWikj7zp+umLNZFH/GkbxHMPmn6w42BmcYD8kgDqDr/OlMh5
 9Iqg==
X-Gm-Message-State: ACrzQf2atrrikED8VW5H86pB/W91aLq0Gacn7Rr8lZ4UQYgymQ7C8mhA
 PpfrzJMUeJvTiQXO2gEDYw4=
X-Google-Smtp-Source: AMsMyM5SL1IRETz58Y983NAHYtT70ugOevrG0yz5LC3UXysNz92AImLC0KI/69prTy1jTOu7poogHw==
X-Received: by 2002:adf:e985:0:b0:236:6a53:3a16 with SMTP id
 h5-20020adfe985000000b002366a533a16mr8737605wrm.501.1666701827348; 
 Tue, 25 Oct 2022 05:43:47 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 bp4-20020a5d5a84000000b0022e57e66824sm3163700wrb.99.2022.10.25.05.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 05:43:46 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH 4/4] ASoC: rockchip: i2s_tdm: Add support for RK3588
Date: Tue, 25 Oct 2022 14:43:45 +0200
Message-ID: <3478206.uukdV1xfrs@archbook>
In-Reply-To: <20221025124132.399729-5-frattaroli.nicolas@gmail.com>
References: <20221025124132.399729-1-frattaroli.nicolas@gmail.com>
 <20221025124132.399729-5-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Dienstag, 25. Oktober 2022 14:41:32 CEST Nicolas Frattaroli wrote:
> This adds support for the RK3588 SoC to the I2S/TDM driver.
> ---
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 917f17107891..08b90ec5cc80 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -1318,6 +1318,7 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
>  	{ .compatible = "rockchip,rk1808-i2s-tdm", .data = &rk1808_i2s_soc_data },
>  	{ .compatible = "rockchip,rk3308-i2s-tdm", .data = &rk3308_i2s_soc_data },
>  	{ .compatible = "rockchip,rk3568-i2s-tdm", .data = &rk3568_i2s_soc_data },
> +	{ .compatible = "rockchip,rk3588-i2s-tdm" },
>  	{ .compatible = "rockchip,rv1126-i2s-tdm", .data = &rv1126_i2s_soc_data },
>  	{},
>  };
> @@ -1556,7 +1557,7 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
>  	i2s_tdm->dev = &pdev->dev;
>  
>  	of_id = of_match_device(rockchip_i2s_tdm_match, &pdev->dev);
> -	if (!of_id || !of_id->data)
> +	if (!of_id)
>  		return -EINVAL;
>  
>  	spin_lock_init(&i2s_tdm->lock);
> 
Oops, forgot the signoff on this one.
For this purpose:

Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

My apologies.


