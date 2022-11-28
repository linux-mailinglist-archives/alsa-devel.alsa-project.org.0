Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1775763B4F3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 23:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A09AF167D;
	Mon, 28 Nov 2022 23:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A09AF167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669675787;
	bh=/JEX6XJjg+grXhAXVCDs4O0mDHNdtmJ/61VZgt2CP9c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlqSujNxFsoHdvUi1epcnBQZL6Wn7pL3mUokZU+zVD9vHPu4kviQoBZCDQ8T8BY2C
	 aWnlfTigbxzfmlua87eyyRKLcbpTYOUOUrIBiFopyYi/1EOUeotdAgMiskV6U3OHkh
	 X/7Pyw0srN3/ifWstG5lvv6H6M7YGP4uvZDnzz2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2020DF8024C;
	Mon, 28 Nov 2022 23:48:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69BD7F8020D; Mon, 28 Nov 2022 23:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2054BF8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 23:48:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2054BF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="GgWhcIWN"
Received: by mail-ed1-x535.google.com with SMTP id f7so17469646edc.6
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nu0Wm5f4XHfxhly48FwbjFsVIQyDhi7mw5JYF1qpKxM=;
 b=GgWhcIWNTHiCi5MnZBv6F5qanKIoKqUg59VaTWZbF+LxTGwnaN60sI4Ym7v3ZC2Poe
 BJM91WqGBXpM0eAj8wm8qZgtPK5Ti6o6X/v/Y22uYuhdqJIgmalPTTr5xc73bm+FFbGs
 8c2ok07nrcnNkDxOaDzycUKNfo+Ty/6u69Xls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nu0Wm5f4XHfxhly48FwbjFsVIQyDhi7mw5JYF1qpKxM=;
 b=ycL3650oI7PGiKWGJZWhgs4F1ET06Vqbhj9jnMvYvx8dCXu3cHbU4dpzYIDIGaZy1c
 qabnUEOh7lc3WyJWULJWGt/5vqThWwiOAk3mVyi6t6qVsGrtJySODJcKeNAAIDQ73IGw
 hiAVYcI/R0vxhqjyEeW8VmEjYqbqFFugXTD+Aud5SVN9vCg2zWYVhH1ZoAb9EVzNTJ2U
 PbMvUOeaHwqAiKvwHXx6+HDUDDjhbhYfgoxqTTpQztSNfTBEs+1PPJM1yd+w/J141fD0
 dZOUMJcWG+Rx8U2MM5OHJgEUnt++xBS7CcTm6Yddhdt9V3BLbgjDSBWPJ88JrdoK/xQU
 oWVA==
X-Gm-Message-State: ANoB5pkPFWtpAZSNVh+in78HCitPWz9Ikn2t+Zs0rr9lBK+6YN49qGdu
 NfbcM2HrzGDnprWuYshimS+4wLmAq0d9oRja
X-Google-Smtp-Source: AA0mqf472aTQiyB40rNmobBmtrY7iBq4NEHwjZXzXTgKRijuq8lNuPLctMh8F0Z3bT5ovbPdZBOYVw==
X-Received: by 2002:a05:6402:1caa:b0:467:78ce:5fe6 with SMTP id
 cz10-20020a0564021caa00b0046778ce5fe6mr32998727edb.325.1669675720975; 
 Mon, 28 Nov 2022 14:48:40 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51]) by smtp.gmail.com with ESMTPSA id
 z13-20020a17090655cd00b0077d6f628e14sm5478466ejp.83.2022.11.28.14.48.40
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 14:48:40 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id p16so9625471wmc.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:48:40 -0800 (PST)
X-Received: by 2002:a1c:cc04:0:b0:3cf:7716:8954 with SMTP id
 h4-20020a1ccc04000000b003cf77168954mr39478234wmb.57.1669675719812; Mon, 28
 Nov 2022 14:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20221128221152.1.Ia805c688ee968fbbec7b93dc10742876fdef8024@changeid>
 <20221128221152.2.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
In-Reply-To: <20221128221152.2.I8d1993f41f0da1eac0ecba321678ac489f9c0b9b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Nov 2022 14:48:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uf3JiNf=339ktULYSUjreRU2k_tR2Q=LSNb+u-U4hQ6A@mail.gmail.com>
Message-ID: <CAD=FV=Uf3JiNf=339ktULYSUjreRU2k_tR2Q=LSNb+u-U4hQ6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: qcom: lpass-sc7180: Return 0 instead of 'ret'
 at the end of _resume()
To: Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Judy Hsiao <judyhsiao@google.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Hi,

On Mon, Nov 28, 2022 at 2:12 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> sc7180_lpass_dev_resume() returns 'ret' at the end of the function,
> where 'ret' is always 0. Just return 0 to make it plain obvious that
> this is always the success path.
>
> Also add an empty line between the error handling path and the
> return.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  sound/soc/qcom/lpass-sc7180.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
> index 7a81e609727c..30a28e3152cb 100644
> --- a/sound/soc/qcom/lpass-sc7180.c
> +++ b/sound/soc/qcom/lpass-sc7180.c
> @@ -173,7 +173,8 @@ static int sc7180_lpass_dev_resume(struct device *dev)
>                 dev_err(dev, "sc7180 clk prepare and enable failed\n");
>                 return ret;
>         }
> -       return ret;
> +
> +       return 0;

Yeah, I noticed this too when I was approving your pick. FWIW, I
probably would have written this way, but it's 6 of one and half dozen
of the other:

if (ret)
  dev_err(dev, ...);
return ret;

...but I just dug a tiny bit deeper and actually, there's no need for
the error print here and it's just wasteful. clk_bulk_prepare_enable()
already prints errors for you. So really this whole function could
just be:

struct lpass_data *drvdata = dev_get_drvdata(dev);
return clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);

I guess theoretically one could even go further and look at pm_clk,
but perhaps that's overboard.


-Doug
