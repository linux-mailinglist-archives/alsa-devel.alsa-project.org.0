Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8665730A8CB
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 14:33:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 087DF1769;
	Mon,  1 Feb 2021 14:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 087DF1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612186438;
	bh=TPczj4dF4jHCDLBFsNX6xRdNimipVS9qgfxBv1zXZIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmS1WsVfAQAWa/76tw9+5kbhjTon1ZAQ1sAPQno8hi8BSBJDrL5N06XKBoY5gaTrA
	 26u2j+uDlkuhVbnXNCczEp9ENYlPi9amzqQhRiBN9wxlYJdy9lc93VSQog2+AlKj8w
	 fAIOuPSbtZXKb07cGg2f+pQcwHwiq3hDLfcYOJ7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C4BF800E9;
	Mon,  1 Feb 2021 14:32:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C60AF80153; Mon,  1 Feb 2021 14:32:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D79A1F800E9
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 14:32:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D79A1F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wyZ43vex"
Received: by mail-ej1-x630.google.com with SMTP id r12so24349503ejb.9
 for <alsa-devel@alsa-project.org>; Mon, 01 Feb 2021 05:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SUydFo1Yzotx0dJ4Xcz97tLTNFlDu1WGwY4qJbgVXXs=;
 b=wyZ43vex9y/L7OURr8uGRzyf57+Hup9CBw9Buo9eC58gaE+WeIPEb8PIF+gCg4cBUg
 r78c01pYMF0J7ZOMvwczmTMXNZnrOvPD0e0SV8BiV0Dg7uhQfcGZGTAHgVU6+sskAZO/
 ikQcHNpiGu6VBuLaF7yq5FJ4EoZv15y1u8NUviPrB/y1fFA/NYF0uNhyCwL899lwXaMo
 VgpNBoYI89Vu1tSmFKjjleUukqquoe0NwbzMKpaAir7v4g4FmvZBuvqnC2SwWbtgWnvs
 DCw8A8vlAGs1yzOtfKV/bR1p3YyW84iZKBCqrxtImm1S8lWJxgFaIq6zKsA9qncl/4QN
 aO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SUydFo1Yzotx0dJ4Xcz97tLTNFlDu1WGwY4qJbgVXXs=;
 b=LIM8UZYwlCQTJL1pL/zTI4ZTn+7aQQLxDvK/gxdkZ4E9TQzuPtucTcZsF0pI8h5ECR
 aMa0H4o1w0CYq9nt2EaW8CsNrK6KjMinAhqe6QP4HxizOhKYejmANYPsYgqM393RGqoV
 +F3PenweL88qneys2eJTKLFe5+2m6V8KM6Sw8bCNXDx24cDqJorpVVNuiqsCcMbERqw3
 2HTEDif8qEzLdD7XXGdY75gBbyyzTYxlqGZzLWQDhDI+kPRN5TvIA3CfczpQuTKwMKVW
 koQaAzJEn0DtlkMhU1GX6zFnDA4sfF1mzwABW29czgla22de6VVnP/4GL+VqO7lDBVwt
 MCgQ==
X-Gm-Message-State: AOAM533mypnGaN6+l0n5jqZYJgnqWi4C3V7WcnBdYXRw1m7wclKfczxu
 WVR1qH9ic/gGLda4LO8pnuJGQeiWend9SiusV2bJaQ==
X-Google-Smtp-Source: ABdhPJzYtumr5qMj0oJ66hU20VJCP1zC7FFpU6A9O7Lh32/0bXXjdYDXapxt84S31R/HCRbQM+NowZkWGOah6C3gA8k=
X-Received: by 2002:a17:906:86cf:: with SMTP id
 j15mr17990890ejy.216.1612186334684; 
 Mon, 01 Feb 2021 05:32:14 -0800 (PST)
MIME-Version: 1.0
References: <20210119044157.3801598-1-jun.nie@linaro.org>
In-Reply-To: <20210119044157.3801598-1-jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 1 Feb 2021 21:32:03 +0800
Message-ID: <CABymUCMX1=w7xWu1NBdtTMzT=2prNEFuVeUn2zONjsC3-ZOAsw@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Add set_jack handler
To: a.hajda@samsung.com, John Stultz <john.stultz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, bogdan.togorean@analog.com
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

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2021=E5=B9=B41=E6=9C=8819=E6=97=A5=E5=
=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=8812:42=E5=86=99=E9=81=93=EF=BC=9A
>
> With commit 55c5cc63ab, the hdmi_codec_set_jack() will report unsupport
> failure if set_jack handler is missing. Add set_jack handler to resolve
> this failure.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../gpu/drm/bridge/adv7511/adv7511_audio.c    | 27 ++++++++++++++-----
>  1 file changed, 20 insertions(+), 7 deletions(-)
>

Does anyone have comments on this patch?

Thanks!
Jun
