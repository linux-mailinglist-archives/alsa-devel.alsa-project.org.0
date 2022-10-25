Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5660D517
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 21:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51A084CB4;
	Tue, 25 Oct 2022 21:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51A084CB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666727932;
	bh=DIZ7E5sm0oVhsFi7Syn1ZuCebIsgM//+qsvyda8C3ww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DViXcrHbcrnBSqj84QOPTPVc3V0ME5XQGu1NWRXp8uBCWcsSf1iuvxYO+CcZUO+gl
	 LNnWPhpJrLHLu4Lr6gyuoHXBbbixVMru3KgOF133PBqHu1DIn+CRO8PG6TldxaZ2LU
	 YBc1/xS0w2fVukqhDdzdq2npPPsZpDoqEA5ISNOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99E96F80448;
	Tue, 25 Oct 2022 21:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E4E8F80431; Tue, 25 Oct 2022 21:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 430D8F80100
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 21:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 430D8F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="e+qZj/QT"
Received: by mail-vs1-xe36.google.com with SMTP id 128so12216444vsz.12
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 12:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DIZ7E5sm0oVhsFi7Syn1ZuCebIsgM//+qsvyda8C3ww=;
 b=e+qZj/QT7BhnoLzJRhfbZB8ytdCtnQT+EOebSeFOrEpqlQvGI9ku8p0ouxhXeQC90R
 cRR65HJVboQ0DaJOdu5FN826Twnr/HDNbCNgIR/fazK5GRVLx5K2Caup9By3OEvRc6VL
 XBzcF3L7iVveJmBZAFmITG2HQ4cJGeDC9ZuW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DIZ7E5sm0oVhsFi7Syn1ZuCebIsgM//+qsvyda8C3ww=;
 b=nYziqLnA08JHqARi0OEraxV4LOsIsTV3JT+v9T0jQF6eM8+dp94G5EazgCgX7YfelX
 UlUHZrmhhIhHCywVmM8/HfXKYBaLzTeuz7hmNgb3ZrlH1AefUMEvhAt/2+fGUOQ9rxWt
 fV9FCUxximHBiZyFSREl6DC9yqO6Nmx36MgLZFYOwy65xXwcEsKMyRm6A45VqrnVE+hk
 xNyN6wkN3UTC4JrM1RM2r0U7tLgIsm2wXW7afd2ckotAlVwgfFd56cUbcRPndy2Njdeh
 RU1HrljuNAiLzH7P4Haqe5jX5wnSj4WxOIwozLg3JyRJEF/zFebFJWBpUmrOyrVkgOJv
 k54w==
X-Gm-Message-State: ACrzQf1YnO1RJ3CMp8rJoR0Rykk77bI6Z1De6SCTUqJm36WKGXosCG+D
 TGgc+OHjMPomcIs+rIoJTt/GDBahG71YfA7bb3I2/A==
X-Google-Smtp-Source: AMsMyM68yxjtygGzCNmwCEf3ID4HFVpQ7xTLBDVwuunh8zLtsSitwC+a8tjP/31TtJUhFd+flFlgXTV/pYKdu1XQ+UY=
X-Received: by 2002:a67:f684:0:b0:392:ac17:f9b0 with SMTP id
 n4-20020a67f684000000b00392ac17f9b0mr23400930vso.85.1666727866859; Tue, 25
 Oct 2022 12:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221024220015.1759428-1-nfraprado@collabora.com>
 <20221024220015.1759428-2-nfraprado@collabora.com>
 <b1863393-0b73-ca44-12ae-567982b07f68@collabora.com>
In-Reply-To: <b1863393-0b73-ca44-12ae-567982b07f68@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Oct 2022 12:57:35 -0700
Message-ID: <CAGXv+5HJQYjkQ7Vrggn5oYRYQu6YH8NS4QmfcP16Zk9kbEJNeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: realtek,
 rt5682s: Add #sound-dai-cells
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com
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

On Tue, Oct 25, 2022 at 3:07 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/10/22 00:00, N=C3=ADcolas F. R. A. Prado ha scritto:
> > The rt5682s codec is a DAI provider with two interfaces - AIF1 and AIF2
> > - and therefore should have a #sound-dai-cells property that is equal t=
o
> > 1. Add it.
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> >
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
