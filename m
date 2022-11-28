Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A14D63B4E2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 23:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA5681681;
	Mon, 28 Nov 2022 23:37:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA5681681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669675124;
	bh=nb7jki64PmnJxNyPdriw0SqyRXRWrcPIp7Qgbz3pi6Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HMKMUAvZKrz1BVXR8/p+AhT3TC8624DlQkAZs5jHFRytMAYjzK2o9WtKp1SAwmQlF
	 SwQYi0k4IYz419D2+BtbdzVQjmwvoSsd9gbFgxCcP9JXkg6BsovT1cPS8NIoaY+yPR
	 tUSR2hj69y+2+fAB5uBQO2gM2GHcL9sUUDjyEfNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 748ADF8024C;
	Mon, 28 Nov 2022 23:37:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5820DF8020D; Mon, 28 Nov 2022 23:37:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 760CDF8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 23:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 760CDF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="UsjK72Vp"
Received: by mail-ej1-x632.google.com with SMTP id bj12so29459646ejb.13
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I9zgwrwiRRupONYrnokcwSugSkhgWBhW5gmMgQKjQcE=;
 b=UsjK72VpwTJ9kAjQFKmVLZiTW90apmuKHlQoEdLarfAWLcu4S3UGNA3SYQGshbWjvX
 ReWL12m8/TafA3IMLneHat42cQc+xvDSpucvcTHUBBTcP1tXMQdoaGtirZF7nTRJgoLt
 WhdZ1cdfIJs+iTVmdQt3XTPXQHNBd6gUWxjxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=I9zgwrwiRRupONYrnokcwSugSkhgWBhW5gmMgQKjQcE=;
 b=LWmDb9W2Qmg5gcVJWm58IximfUprfENbjoa2Wshcw3DvgniqAR22N83G9IG5MtFK+Y
 aa5cRdMKeF2k/wt4Az6b9Rw4XlmeGNrS6Y6nGJQXFDGS+CLM2OUxzBYXVnL3ECGzMPlL
 W+y0/gGkSsRCq4uzUhSR9R60IGRPjfyqa9qHALAXjesgesSJLqV9pKIm+nI0AQpiSU+e
 PesZ262Wwm1D4i7JbIvvcCSyNOZrhluHCeVLklhatHF/arKx3T53cDb5doWWXSapVsdf
 4bV4XPGCDS5fwu74asUp8LX0mG+aC88xoEjhldHVmKOqTbXNQt/wqNUhcOdxWQAD727N
 v/5w==
X-Gm-Message-State: ANoB5pkqz+UWYdLL+htXQ0JZs2fVZhRT/YEzyUSKs6UOrgbXdCaNZd+S
 H9swln9e7PmdxMFgIbk7/rOgSOepT43I2E+j
X-Google-Smtp-Source: AA0mqf6V5X4wSRHIKtAxubXICLPbS55I2UuwZU4tMQaV/em/TGa2GGbTwy5MlyLyDgWW6Pg9wbj3TA==
X-Received: by 2002:a17:906:ad8a:b0:7bc:e5ac:c96f with SMTP id
 la10-20020a170906ad8a00b007bce5acc96fmr15176087ejb.433.1669675059188; 
 Mon, 28 Nov 2022 14:37:39 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 q25-20020a17090676d900b007bf24b8f80csm2369255ejn.63.2022.11.28.14.37.37
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 14:37:37 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id d1so19316487wrs.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:37:37 -0800 (PST)
X-Received: by 2002:a5d:4950:0:b0:242:1f80:6cd9 with SMTP id
 r16-20020a5d4950000000b002421f806cd9mr1152821wrs.405.1669675056628; Mon, 28
 Nov 2022 14:37:36 -0800 (PST)
MIME-Version: 1.0
References: <20221128221152.1.Ia805c688ee968fbbec7b93dc10742876fdef8024@changeid>
In-Reply-To: <20221128221152.1.Ia805c688ee968fbbec7b93dc10742876fdef8024@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Nov 2022 14:37:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wi3Oy9kdFfP6WE1wbtSrGxsr_VC8KZQAyTMgW-uMTOWA@mail.gmail.com>
Message-ID: <CAD=FV=Wi3Oy9kdFfP6WE1wbtSrGxsr_VC8KZQAyTMgW-uMTOWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: lpass-sc7180: Drop unnecessary
 initialization in _resume()
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
> The initialization of the variable 'ret' in sc7180_lpass_dev_resume()
> is unnecessary, as it is always assigned a few lines below. Drop the
> initialization.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  sound/soc/qcom/lpass-sc7180.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Not that this needs review, but FWIW:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
