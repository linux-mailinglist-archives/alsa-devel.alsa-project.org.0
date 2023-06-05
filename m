Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C3E722803
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:58:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064F9DF6;
	Mon,  5 Jun 2023 15:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064F9DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973497;
	bh=CrJkAK/T23g9lYAHDuUySRBU73UKEcgEVZz7BULtuUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XnMfXfucuHrFBPBmXOv4xpMt9j5+ZzBUbqFWeh1B9tRAvGGSJ2vEkzy9lCmuktyKR
	 gO4I9SHdtzU3yrl6s09uyip4Ap3Z+o9ZFVlxfMwOE2ml/SghWXfBmAKsZyx2zvIK7f
	 s3a8RtpjBFCSkbVa2bgaZCZrpOfCGJzpPqtaeJQE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4447BF80578; Mon,  5 Jun 2023 15:55:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51A37F80578;
	Mon,  5 Jun 2023 15:55:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCABEF80199; Mon,  5 Jun 2023 15:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB6D1F80155
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 15:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB6D1F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=QeU3q9/j
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f61530506aso49038735e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Jun 2023 06:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685971665;
 x=1688563665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKsqJloU0YBMoV3i0X0WKgMs82pe/pvJwGVG1B5dvuQ=;
        b=QeU3q9/jsyk58gL5sa26StZVON3JbuBqt9Nb52eU+8RxPdI6qLMECpE1uKsvUn+FzE
         PSNLLarc31GkgZlUgl1U8ZDIjUjiO5ixz1IJIb5pJselR4t9UI2qCWbIz1bKmc772pJi
         3TlMufzV4+d6M2gOF1/2csgEhQnZeAbH+OqgEVaq9ySSiJ9P1woR9ikC5HkPb0V36HWD
         3tc+xdwssa0LKTyPA1s+2qKg2bFw3fhKJsbX8hQB+uhkVmXbOm9ccc8CFT9W6HPwc0Bq
         69E2MZKnDx152ko8OFpqYDuIS/zpyn5sbJZ0AaJvMTlE3tXLCv/LN61gP9urV6Ly+zJM
         v1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685971665; x=1688563665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKsqJloU0YBMoV3i0X0WKgMs82pe/pvJwGVG1B5dvuQ=;
        b=D9ThzcqPHoOZWaZfYu9bJfRBb+703hst7GtN8cXIkzJnp2FAIgG8sE/uXctdmserj7
         ry7Z0DAsKS2eQTppsltEFj7UEHGSyy2wk5KLvwLqHkXiHz6YjMZjniJu3nCUCfeWOQ0O
         eW2iiSzp9TE7RdevSDOu2kR+kP5xhTYPbNJIAZsSAnCryijLu4N+K7ax4M+slubvMPIV
         D8zQvOSfx7//xswtVLX7CO/D6A8EQ3C4eJcLzUeUBaak90yLNCGENjmVwOWBrX9FoI2n
         1wDsmaXAU7Q966E/bj15fb0TqLoDe5t8bVBSMXWMpDEnGz3eif5XnUwctTqcTJHirsxy
         KYlw==
X-Gm-Message-State: AC+VfDwBRGXrIv9TEscMph6WIDNH7FXf3mp3xG/Jq99L9c5TB7AJ3sjr
	tP8o2iEUvlRDCYZL2gIyaJTIeg==
X-Google-Smtp-Source: 
 ACHHUZ5szxWU0mg13BybwFHk4fZIjbLh1tqAUhrF9z1CMgnFJZCaLz5CiJur6zNPASDwHNrYHI+/xQ==
X-Received: by 2002:adf:fb42:0:b0:306:2ef0:d223 with SMTP id
 c2-20020adffb42000000b003062ef0d223mr6185401wrs.62.1685971664845;
        Mon, 05 Jun 2023 06:27:44 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 n8-20020a5d4c48000000b00301a351a8d6sm9779056wrt.84.2023.06.05.06.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 06:27:44 -0700 (PDT)
Message-ID: <a66c9e7c-3a8b-f32a-7ac2-5717024599a4@baylibre.com>
Date: Mon, 5 Jun 2023 15:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: mt8195: fix use-after-free in
 driver remove path
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
 <20230601033318.10408-3-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230601033318.10408-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GIBKBULOZJQUGYSMF4LEXDUC2QWH4BYM
X-Message-ID-Hash: GIBKBULOZJQUGYSMF4LEXDUC2QWH4BYM
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:55:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIBKBULOZJQUGYSMF4LEXDUC2QWH4BYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/06/2023 05:33, Trevor Wu wrote:
> During mt8195_afe_init_clock(), mt8195_audsys_clk_register() was called
> followed by several other devm functions. At mt8195_afe_deinit_clock()
> located at mt8195_afe_pcm_dev_remove(), mt8195_audsys_clk_unregister()
> was called.
> 
> However, there was an issue with the order in which these functions were
> called. Specifically, the remove callback of platform_driver was called
> before devres released the resource, resulting in a use-after-free issue
> during remove time.
> 
> At probe time, the order of calls was:
> 1. mt8195_audsys_clk_register
> 2. afe_priv->clk = devm_kcalloc
> 3. afe_priv->clk[i] = devm_clk_get
> 
> At remove time, the order of calls was:
> 1. mt8195_audsys_clk_unregister
> 3. free afe_priv->clk[i]
> 2. free afe_priv->clk
> 
> To resolve the problem, we can utilize devm_add_action_or_reset() in
> mt8195_audsys_clk_register() so that the remove order can be changed to
> 3->2->1.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

