Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB11672B57
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 23:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0567BDC;
	Wed, 18 Jan 2023 23:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0567BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674081218;
	bh=iR2rhrTSMYK9PDj2icFRUKFemo5k3GYEy4vYgABVWBA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k39jIaIG3MNWSQiD4iZv4AJSmAvmdCQ6IUiEqFmTPy6MQSMTuzkzGtnNMol9b4KTH
	 xjVNU8mmXVCG7bR2b9sev4g0swXth1JEzRULxYQetc92Xi896U2yUso3Q2p9EaEEkK
	 NRciTlGKs0RQJzupVfLlH1pxtLKcMIlxkiv7Dxrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 666F6F8024C;
	Wed, 18 Jan 2023 23:32:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2AE6F8026D; Wed, 18 Jan 2023 23:32:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2651F8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 23:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2651F8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mixoZB3X
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-4bf16baa865so1222887b3.13
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iR2rhrTSMYK9PDj2icFRUKFemo5k3GYEy4vYgABVWBA=;
 b=mixoZB3XxmmwB+248ZOx2zNjqNP3syHPWQOlCKWGblxckFWMjSkBVb8eywGZvwRUBH
 2cwxPpzrbeiHAIZfMqIXhTAdpWS0sYi+8waOYFI+zh2X6q6AqS8hKxWPE5lO17MoE2bx
 u93UNmBAkcQAsb5eRWo2mt0ca4/WXqAUfgOQiHeWj1VqyyIctf5GrACBkukpyVikFrNr
 qFVgR7FFMN2D+FFf+aDQ/I58WFeHnaYgPN+xgfKgxSDuiYDMhBBXSCxILdPU5vPbQN7K
 KxGwEaWV1/Fs0wPKjPnVXFvsK+KXS7oRs1S2ibwZ5/zcr/2rqij2f+S0plYKkBo7VCop
 7H6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iR2rhrTSMYK9PDj2icFRUKFemo5k3GYEy4vYgABVWBA=;
 b=17ogRme6meBO0IWLJ4atkx7aHdCTNdl3DJ8b8UBMykZpH5YnrEeDsMuRBchvI5NR/t
 TI65qLfZC1o94nFxQfNPlAFPK9JPZuTdtUEvqXIA31K8126vzTEdXppRHDf+IXv29Srx
 H92ODxBKIKbI69IMP01hSbWQKuyi7WTQUm3S6Q/IUY/+meme22h5K13I1oOCK9Rwor8j
 raAP7EDaGqCt8H0jmVKvKSl4KsPCifipy4ESUppLH1Yc5BZ12K8X7h0nO/k5WvrRhtlZ
 735BV9Il6IuXTNKffg6tRJ0tVt8qHnEvGTFOumgKoy3/c8c6cEq9UaAySVQTWyDGD4R/
 PP0w==
X-Gm-Message-State: AFqh2kr/TwbdQkUQDphVMJS7488icwt3HppfNqQ0fOxoVR5AJz1H0545
 DIVTqqPKsMpuSeCbJqwuvN+6Y6gQAX+BBrXA/m9jVQ==
X-Google-Smtp-Source: AMrXdXthNU+N2HysXSnoWkZV1WoH8vtXfPtXO05j8luFV1F0xquuRFfbj1CWJAKa2gVJWtkVD+77IuheHg/Ii70YLyw=
X-Received: by 2002:a0d:ce43:0:b0:474:b3f2:8df1 with SMTP id
 q64-20020a0dce43000000b00474b3f28df1mr999564ywd.434.1674081148032; Wed, 18
 Jan 2023 14:32:28 -0800 (PST)
MIME-Version: 1.0
References: <20230118161110.521504-1-arnd@kernel.org>
 <20230118161110.521504-3-arnd@kernel.org>
In-Reply-To: <20230118161110.521504-3-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jan 2023 23:32:14 +0100
Message-ID: <CACRpkdbO9-GioRumc8tOZ_NjUQUQ2JN2R2sJpRou4kbucmEWaQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] ASoC: ux500: remove platform_data support
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 18, 2023 at 5:17 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The platform data definition for ux500 sound devices was removed
> six years ago after the DT conversion was completed, see commit
> 4b483ed0be8b ("ARM: ux500: cut some platform data").
>
> Remove some leftover bits in the ASoC driver and just assume that
> it always gets probed using DT.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
