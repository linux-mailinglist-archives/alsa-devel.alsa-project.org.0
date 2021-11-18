Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBD455248
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 02:37:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC34418F9;
	Thu, 18 Nov 2021 02:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC34418F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637199475;
	bh=9klc8dAWLIAubPklXVyh2fWbEFTP2hyfnLgaBXBCupk=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z/OriWLS0TJV/ELIPHAokEvsO+SX1BGSh47qtAu7evGRXLINuyB42AHtS/c4IYka3
	 l9kB4HVbTw0FKNrlR2mX/cW3f+IONa7hGrEwqzeYCrMSXBdb+ESe61s1rfc+IsR7K6
	 KXKz0P6njimTJ/Y71ml6VdaA1NEW+IdOD0JKJItw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D50D7F804BB;
	Thu, 18 Nov 2021 02:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96EA6F8049C; Thu, 18 Nov 2021 02:36:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11A63F8016C
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 02:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11A63F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gm/ER4di"
Received: by mail-ot1-x32e.google.com with SMTP id
 h12-20020a056830034c00b0055c8458126fso8168836ote.0
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 17:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9klc8dAWLIAubPklXVyh2fWbEFTP2hyfnLgaBXBCupk=;
 b=gm/ER4diKPKHKzcanyuOyKFEAaBC80UL4emy4g9pwIdas+tID4z4DofaLSACBAdJWJ
 6eRAFc9WkfAGEDe7dAvKWPMYK/nsGr8bKEGuynfyPQdM/1DXAxHU3WdSFGUPBq688mE8
 r8dsWUGLcqGMnGoiENXgHzTSocHtwot/CugYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9klc8dAWLIAubPklXVyh2fWbEFTP2hyfnLgaBXBCupk=;
 b=q7F0Ds6DRZzE++SCHoUG5yNnMxE8TKCGhWNlrpVWdXId47++MypbCVdUD50lzdqRUQ
 hrXyDiC2CDbjdiOtM+4Y4CFu0G5AZ5KGAZ+thK/FC0frTtqcRzXBXcebzMQcygSVYBNR
 1co8/3DVpu1n/PD1r3vK/RM4i7mfgsonWOFFJr/9u+j/5navKMhI0vQ42PcthFhRusck
 W/db6mWdk/vs9kQiAVKb75BgtkOkJBK8btLphgypjTy5KPWTHsrRZIPqCrGVyqDf1/Tx
 9ks87f8qI3X02th9zV2cnnQf2ob9H1cfoYBP0jS+ZOzPVTNVZAXPNgrIB/+nKJLaFyl3
 vIAA==
X-Gm-Message-State: AOAM533IED4uxyCQXaIvU6QF3hxxtcDSFY5k3LhHxW3VAtbBn6VlMvrV
 z3TjcDyNDfWO4SyJbfy0QibUsluj/Wmlh0Tc4cdg3g==
X-Google-Smtp-Source: ABdhPJxKd82uGdEAMk68vFffNMn/X25qk2e/DsVmbx5gTcvbt9QWX11Tks6gt8LfLbpB/OZhMEehjVPDGZs8hMou7WU=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr5815934ota.126.1637199388369; 
 Wed, 17 Nov 2021 17:36:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Nov 2021 17:36:28 -0800
MIME-Version: 1.0
In-Reply-To: <20211118010453.843286-2-robdclark@gmail.com>
References: <20211118010453.843286-1-robdclark@gmail.com>
 <20211118010453.843286-2-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 17 Nov 2021 17:36:27 -0800
Message-ID: <CAE-0n52AAfNqYP5MM1CUntkM15ftskuPVRNyCbBdCbp8mFHL2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: rt5682s: Fix crash due to out of scope stack
 vars
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

Quoting Rob Clark (2021-11-17 17:04:53)
> From: Rob Clark <robdclark@chromium.org>
>
> Move the declaration of temporary arrays to somewhere that won't go out
> of scope before the devm_clk_hw_register() call, lest we be at the whim
> of the compiler for whether those stack variables get overwritten.
>
> Fixes a crash seen with gcc version 11.2.1 20210728 (Red Hat 11.2.1-1)
>
> Fixes: bdd229ab26be ("ASoC: rt5682s: Add driver for ALC5682I-VS codec")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
