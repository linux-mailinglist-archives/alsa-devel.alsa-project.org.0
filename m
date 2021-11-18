Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10A455247
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 02:37:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B64118CC;
	Thu, 18 Nov 2021 02:36:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B64118CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637199453;
	bh=AhzHSZs+Qa8irjDJBSbiDerC3r5X5aUFn4Yh1dCXuiY=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S0GNZJbef0p22KneXaq+rm9K7C563AtBczY0YBTSCkLpebHnCkeW2q9I5L3ytuQ0b
	 J5GYtOZ4kQhmqv3zPobaNgV93PBweMG/vjs3OmGS+jTnd72v8qF+DAuZXNaejWMZcY
	 qlaPyrgIfGtdBRT6VdJfySte7xUwXtjHUcKHEoT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E73FAF8028B;
	Thu, 18 Nov 2021 02:36:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7D61F8027D; Thu, 18 Nov 2021 02:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84077F80134
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 02:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84077F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fPJFCZrZ"
Received: by mail-ot1-x329.google.com with SMTP id
 g91-20020a9d12e4000000b0055ae68cfc3dso8061579otg.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 17:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AhzHSZs+Qa8irjDJBSbiDerC3r5X5aUFn4Yh1dCXuiY=;
 b=fPJFCZrZDYPW7rI9Lm6fPh6QD9XgZHl/s8q8VHTXo8fvTuTF/mA6Ndahnnbd8JvErR
 oVZwdNm7tdDMQOib5lM5Bw3J+3AU16knFPb1jZjnTc53YrtC3NsHAgsNh9vqiMfE2aab
 YXpfsz+2BW8yaNsheds+mEGYgXxqj2nhxej88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AhzHSZs+Qa8irjDJBSbiDerC3r5X5aUFn4Yh1dCXuiY=;
 b=RfmievynQl57SpwQpvjxzmmEBx5MGiCA4UrfrBHILCUIqXjabfxbLz+yaEyQw8I5AC
 1qqV+Fgq0dC8WV6KRaSQOzl+leZmKp51Ug054kSuyVq6b+U49/yWsK7SFcmaEQGoJa+X
 OUvlQUSlAl0rdttI0hCjSDwBGxib1zNLOMg0+ClcsxBFM5RnyGJlJnQQaEBpGqWAxKGf
 Gt6xCXxuXeA1mr9mjSAxHGZJAS4THc3Yk6eKdleQE2L94WQEO0AeMWfY1FWdGas4NlAs
 yixQkJwTMXyx9frEdYjYjPs9yfw8iZ81a8/p3JTrrsstdosDmLdOMXwKCKk+SCnz82o+
 LySw==
X-Gm-Message-State: AOAM531q6XQtCG2g3yqbx9oWnBf/5POqUpebj0wqsJORgDkQyevEbCxT
 8rvsupvd6q/Jm39sLqcm1royw/lDv1pzNo1Qn55zog==
X-Google-Smtp-Source: ABdhPJxA6UsC92g8SAKBgSzoBtfVLdpNY2c/dKRjkWuxetjJ+zee2Xo61LDyLtogfQRcPKmnnkvJPqcfailm/WkSPBY=
X-Received: by 2002:a9d:70ce:: with SMTP id w14mr17764642otj.77.1637199362910; 
 Wed, 17 Nov 2021 17:36:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Nov 2021 17:36:02 -0800
MIME-Version: 1.0
In-Reply-To: <20211118010453.843286-1-robdclark@gmail.com>
References: <20211118010453.843286-1-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 17 Nov 2021 17:36:02 -0800
Message-ID: <CAE-0n50rwKPLubV3TENkZABUGHjdiQ=fAB2XtH6rkKuF68QK1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: rt5682: Fix crash due to out of scope stack vars
To: Rob Clark <robdclark@gmail.com>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Cc: Rob Clark <robdclark@chromium.org>, Oder Chiou <oder_chiou@realtek.com>,
 linux-arm-msm@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>, linux-kernel@vger.kernel.org
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

Quoting Rob Clark (2021-11-17 17:04:52)
> From: Rob Clark <robdclark@chromium.org>
>
> Move the declaration of temporary arrays to somewhere that won't go out
> of scope before the devm_clk_hw_register() call, lest we be at the whim
> of the compiler for whether those stack variables get overwritten.
>
> Fixes a crash seen with gcc version 11.2.1 20210728 (Red Hat 11.2.1-1)
>
> Fixes: edbd24ea1e5c ("ASoC: rt5682: Drop usage of __clk_get_name()")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
