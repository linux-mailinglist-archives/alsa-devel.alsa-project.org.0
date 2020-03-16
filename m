Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFC186675
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 09:30:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BD8618A2;
	Mon, 16 Mar 2020 09:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BD8618A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584347404;
	bh=VdLbj8nYuH1xT6bKvgJvpXaU9w9tJ1HcOwynOnHSzcg=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAqvXf86r9CF/E/gUT340yQ6jQQoo8g2ln1XjYC23yeK1pZ8yyPGQjPNURkND0DVH
	 az96sTs1ubk5aDDoHhm96pmRLQN/w9Zu9u2LuYwdTUO7f/9jNe7Lx31+UhsjE2hi41
	 z3OETlePlBGaTI/TPC6uM2Hy9FgJSgGYhETAIu0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D26E9F800CD;
	Mon, 16 Mar 2020 09:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 854E2F8015B; Mon, 16 Mar 2020 09:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B44AF800CD
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 09:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B44AF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="l3Gqhn+/"
Received: by mail-wr1-x443.google.com with SMTP id a25so19992109wrd.0
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 01:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=szWYYRkGahxA61hsmRUJ5tS74K70qXB8+PDKduH3nHs=;
 b=l3Gqhn+/M4Ha0UXVm0T3q6iV8ObxlaoHrtfqnRe+mfq3J/sCzFKJf4x7NlK7oimIwz
 tN1cuQljn0V24A6ikzf7Lh2Z5FZgBuhhcvzzlycmoWTw5AO/wLuLWUbxFwyAxd0Jt38q
 /YbIiOe4knXylQmu+M/SKDnkj5Ce2vCTOSweGQH50Ef2xnZ4js/HFbH2hFYpHx3TALhu
 4wjaB4vv3tSbPvQLG21Ggst/b5DfZRjtQt537OaHLyEY5TqcODhqXaffxWBzdSqdvD78
 jTvX9ZUunrrWo00MZaFdHDpcGEp9sBOUca60V1fbLklrtGD+8Iu+s+9w+fpmj5Vravvv
 5iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=szWYYRkGahxA61hsmRUJ5tS74K70qXB8+PDKduH3nHs=;
 b=rg4PeruuTHtA16b3sutPARiZJUsubxP19Bp7HebMWNLmA55JvBO0hAUCNhNrxal9gc
 WWeJDmdOH6Z7jGI10Psp5yDOUj/CXFAZRcZUDv6yTIi+1SUSiDPCTnNeo/2XS860bLij
 wDudVlg3+rNoUDO+LFYPfpCO9pYeatAymSE1jqQ5CUwdylxAKRCU3HHtvJBeST6k+dhD
 zUbIuuSFaV8wmrK6ErHbvYXX1/tH4Miq7Nva0OU85vWyZE2TlGZK1BMWr5x1P31m2IdC
 ErtakIrWQbDc8S1Ru/r85hplNF+H/XWC3DKkFEu5LmrWy471oLOILCGojjWU5d74y5d4
 pZJg==
X-Gm-Message-State: ANhLgQ0Cbxxi4dYfPwaARGwjk9VGaAs4mIpajfa3OvXvRva49xX4P4WO
 CHATO+yIxl8f3BWkCxIlvDYsAg==
X-Google-Smtp-Source: ADFU+vtF0RfkG0k25HaWGkNvoj16Mvu5LgZ52qoUMhowQkFr4iYwgmRJjGLbQodQSmkECLChCJor9w==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr34558588wrv.245.1584347293228; 
 Mon, 16 Mar 2020 01:28:13 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id k133sm30082169wma.11.2020.03.16.01.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 01:28:12 -0700 (PDT)
References: <20200316023411.1263-1-sashal@kernel.org>
 <20200316023411.1263-8-sashal@kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.4 08/35] ASoC: meson: g12a: add tohdmitx reset
In-reply-to: <20200316023411.1263-8-sashal@kernel.org>
Date: Mon, 16 Mar 2020 09:28:11 +0100
Message-ID: <1ja74gg0v8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>
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


On Mon 16 Mar 2020 at 03:33, Sasha Levin <sashal@kernel.org> wrote:

> From: Jerome Brunet <jbrunet@baylibre.com>
>
> [ Upstream commit 22946f37557e27697aabc8e4f62642bfe4a17fd8 ]
>
> Reset the g12a hdmi codec glue on probe. This ensure a sane startup state.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Link: https://lore.kernel.org/r/20200221121146.1498427-1-jbrunet@baylibre.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Hi Sasha,

The tohdmitx reset property is not in the amlogic g12a DT in v5.4.
Backporting this patch on v5.4 would break the hdmi sound, and probably
the related sound card since the reset is not optional.

Could you please drop this from v5.4 stable ?
It is ok to keep it for v5.5.

Thanks
Jerome

> ---
>  sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
> index 9cfbd343a00c8..8a0db28a6a406 100644
> --- a/sound/soc/meson/g12a-tohdmitx.c
> +++ b/sound/soc/meson/g12a-tohdmitx.c
> @@ -8,6 +8,7 @@
>  #include <linux/module.h>
>  #include <sound/pcm_params.h>
>  #include <linux/regmap.h>
> +#include <linux/reset.h>
>  #include <sound/soc.h>
>  #include <sound/soc-dai.h>
>  
> @@ -378,6 +379,11 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	void __iomem *regs;
>  	struct regmap *map;
> +	int ret;
> +
> +	ret = device_reset(dev);
> +	if (ret)
> +		return ret;
>  
>  	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))

