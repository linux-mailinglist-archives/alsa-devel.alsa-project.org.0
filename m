Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C052E539
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 08:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8F1C1749;
	Fri, 20 May 2022 08:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8F1C1749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653029186;
	bh=7Mr5REDjIQbStTsPG0GJXWTg1VHXRdrD7uE6szZSh4U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhotGbai38txjunWrHT3i9kNSigPN4QPHte0SBduTVhT9XQxQH3XouyE2dL42mqsi
	 WnAFQYRDjFz3AGoPKbhcqWg+SrZr0XpRxj8Pk4vZ5Ksbxy6AoeNs751MNGDHvzNEeD
	 pWCXPGha6a9/CA6rni2MVyJGqOVgBTkYLRDHBzGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A3BDF800D2;
	Fri, 20 May 2022 08:45:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BFEEF8019D; Fri, 20 May 2022 08:45:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54979F800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 08:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54979F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O6glMIfz"
Received: by mail-lj1-x22e.google.com with SMTP id m6so8641985ljb.2
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
 b=O6glMIfzZPcKFuiAIfpgKl4vPS6f/5kKRDEsCZ51jhpn2nvRMnbXG5g+EDHeE904nP
 t7HS+b/93itLD8AaEQHAOU/xrWjqGgTNAbPH9jakVpgMQTIhKd99kpg+p8rnNvdIqwdN
 6qoJ6hv6rNLvwFxEXHoFISEMQCRvxYIVNP2Tdx5gjSpfV8JASem8ZyxogIrKo+3noZeo
 On3nePrDC2RBv0fxVZnC2PEjR3MvP9xqKuaD0jO5YVuhsa36Q52R9it54/UTpAk0vFOu
 oN03MNBdr3Uh7nMtz9gRp/Uo5idHLu4wjadR99H/ArdkjYBw/HcmyNp38tQ7XXACXvAn
 7LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AnEwnvhKln/QqudtDrsLeq9rcJ9ha/C6wjXnDVo990k=;
 b=5LAuaIEfMovXy8/zrD0gxu0dBGpAX/gxi979NPQbmnuO77W0zOok5J3WzCw5DZgKZm
 xhZtSQKMIZyewePuBYwHnpyMtOyPicrLSILsMUFhVXmOETRhB3xisGv1Opy4EWNgYJaq
 lcz94WHj2+yBF3mPiePI36xpn3Ddm3AOwLZaOHLaqIRSxoYa1YmYDYmqN+nmpMmgb8oe
 R5DAsoFM1VMRlC2HV8Ro7HLGvj6yTqcdH+l99ztQesKyGNIG0LSxHTugnVvjATDOXb5+
 XWOhvR25IAFjol3/xoLdTFjRa2Wk+1LBnghp4GsM9uCpOZ6FZ976swTCocxiaS44orab
 wTaA==
X-Gm-Message-State: AOAM533Fy+FxvKgZ2Jf8jYM67ISU0LT8N5m7Nx94bvfc4FZyBjxPRBkH
 GDrOdZt2Sfb9+xnTR5f+39Vv8g==
X-Google-Smtp-Source: ABdhPJxU0QeXD6emlDZWLebUbtElcVEEa6zD5/lvXQQQBtACmvvZZjPEOav+NOjy2nN8XnxEigbRJQ==
X-Received: by 2002:a05:651c:158b:b0:250:a056:7e48 with SMTP id
 h11-20020a05651c158b00b00250a0567e48mr4800506ljq.64.1653029116920; 
 Thu, 19 May 2022 23:45:16 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 y22-20020a2e95d6000000b0024f3d1dae8esm197255ljh.22.2022.05.19.23.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 23:45:16 -0700 (PDT)
Message-ID: <cab52964-31d5-a545-9856-b298d3cd3c84@linaro.org>
Date: Fri, 20 May 2022 08:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 46/56] ASoC: samsung: Rename set_fmt_new back to set_fmt
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519154318.2153729-47-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

On 19/05/2022 17:43, Charles Keepax wrote:
> Now the core has been migrated across to the new direct clock
> specification we can move the drivers back to the normal set_fmt
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
