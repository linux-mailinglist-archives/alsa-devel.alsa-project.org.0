Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5166722802
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:58:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 192C73E7;
	Mon,  5 Jun 2023 15:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 192C73E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973488;
	bh=6KtWOEYwtAGSymqm1szGB9ms53AWVBcPjOqqxUCgyc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CO/2cZ8vy7+hkUPjqPMaILzTN1v7sfpsD+NRj7olQPkujCZib39bNPjsWQlFSsUJn
	 Qx0LsCn+kLwUw56wTjIxrkBXjKuQGXICsdMI7brpq8ZmglXqwMgq3tOLVQMcuFQQnt
	 zoAZKnS1oqtm3dRzFxONCcyfunoRSW+CJTkBgA/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD9C2F805E8; Mon,  5 Jun 2023 15:55:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C14DFF8016C;
	Mon,  5 Jun 2023 15:55:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F3F0F80130; Mon,  5 Jun 2023 15:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD73BF80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 15:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD73BF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=3l13dOF1
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f3b4ed6fdeso5943087e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 05 Jun 2023 06:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685971315;
 x=1688563315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAVo5XJBmcZ1CILHNv8SMdAaagpninriUMxTg11Co/E=;
        b=3l13dOF1IYsdmxWjy4gVBxm9mP0dSRgkbeDydZj89p6KSERrNBrlgUF9ZiLQsu8ZMO
         98veLuKCuihN2OluBxFYHCZOrQHvFcmSWlsu4AI2agA1zTprkYPIrXNNbnXtSsaWkLxH
         O3/l2/5D6iYmYs0L4o5wHlW3ohDgh9t+BqY3w1Hh1fKtmmPh9L791z7SKtOZ74tKd40P
         zxDFG+1ww5fWag616iq03kZ+TIre346llSOCOoHDNPjqa0HsCL1EzkpiszzgoLcIpuiB
         nCJvRpf26t/XE2dsdWozdG/uHYPfL1zXYJbUvG1qNMH2BmuOdX6D5spT+3/m81kMlgoX
         ys7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685971315; x=1688563315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAVo5XJBmcZ1CILHNv8SMdAaagpninriUMxTg11Co/E=;
        b=OYj0V7QrVMNmJpaVvhegmUsvzACtf0lVmlefmiQuONYHnfGcyNvcZD8kye+k9JYm1C
         va9F4nmNkr2/ahkGPh3eT534h7wJGuUnNxdfEwBDBTg9eN3498BEvsLsiyZQ5ZKSLRWE
         lTWA0dRoodZREiqWiVWgUDrNVpkfT/syIXkQZb8sJdaquW0RVqddq/YgvQuwne6Oz0ju
         wT/shEnIPf6y0TsqpCFhCqpxHZSRFmgV79vhpMlY1W7iYH/7kxCKwlSplJaIhsXvf/1D
         PINIYcumVOCt50AYx4GiZKF/SyrbxQ6A9V9u8bANMuHkCNI0AHcGUDUtiacOCG027UF3
         S1aQ==
X-Gm-Message-State: AC+VfDxMWv8pW7juTmQHOXKK3rLf6cHsgUdVlQNiK0R0WH/LWUdDJjmA
	8dtNIsfZyMCTWEzL2xPPC54pCA==
X-Google-Smtp-Source: 
 ACHHUZ7Cp/Uhp6/Wpl9DeYjd1vvYra/v50oGeZW7mP1XrLzgq01OEH+9/gZgXDUd67xf7/rarGL7pw==
X-Received: by 2002:a19:7609:0:b0:4f4:ca61:82ba with SMTP id
 c9-20020a197609000000b004f4ca6182bamr5030485lff.67.1685971315388;
        Mon, 05 Jun 2023 06:21:55 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 l17-20020a1ced11000000b003f4266965fbsm14439285wmh.5.2023.06.05.06.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 06:21:54 -0700 (PDT)
Message-ID: <d94b5f07-aa37-f4ec-252b-ff1a96b89326@baylibre.com>
Date: Mon, 5 Jun 2023 15:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt8188: fix use-after-free in
 driver remove path
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
 <20230601033318.10408-2-trevor.wu@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230601033318.10408-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FA5ECW4VWJPEIZCTVUEKACIGF67YYYB4
X-Message-ID-Hash: FA5ECW4VWJPEIZCTVUEKACIGF67YYYB4
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:55:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FA5ECW4VWJPEIZCTVUEKACIGF67YYYB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/06/2023 05:33, Trevor Wu wrote:
> During mt8188_afe_init_clock(), mt8188_audsys_clk_register() was called
> followed by several other devm functions. The caller of
> mt8188_afe_init_clock() utilized devm_add_action_or_reset() to call
> mt8188_afe_deinit_clock(). However, the order was incorrect, causing a
> use-after-free issue during remove time.
> 
> At probe time, the order of calls was:
> 1. mt8188_audsys_clk_register
> 2. afe_priv->clk = devm_kcalloc
> 3. afe_priv->clk[i] = devm_clk_get
> 
> At remove time, the order of calls was:
> 1. mt8188_audsys_clk_unregister
> 3. free afe_priv->clk[i]
> 2. free afe_priv->clk
> 
> To resolve the problem, it's necessary to move devm_add_action_or_reset()
> to the appropriate position so that the remove order can be 3->2->1.

Sounds good

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

