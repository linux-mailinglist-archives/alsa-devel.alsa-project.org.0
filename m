Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF46816AA4
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 11:12:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 023EABC0;
	Mon, 18 Dec 2023 11:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 023EABC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702894351;
	bh=dWVfo0YlGfjE9aDQP2Ly3L2JCb3LpM/ev0NxuURn88c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LaY+JXhf9myEoqEQ9wzf9upUCyOUDJVdjmxKKMcNdA7aEO8pDRxlZxirBVQoaQXgl
	 Uljeg/KIVZNJXQGIiNJOqny4f1gkGUeO1xs192ICcK7X/mnwpAJGxQaH/eSnzjMydJ
	 PiZhics70E3DXlT9NoMrE0iQwczv2E49TwXDbGrI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E0ECF80564; Mon, 18 Dec 2023 11:11:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC42AF80564;
	Mon, 18 Dec 2023 11:11:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05E6EF80425; Mon, 18 Dec 2023 11:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F544F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 11:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F544F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AAp1xamr
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6d5e7664f8dso43999b3a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Dec 2023 02:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702894308; x=1703499108;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWVfo0YlGfjE9aDQP2Ly3L2JCb3LpM/ev0NxuURn88c=;
        b=AAp1xamrP06QUTvMRkibRp3P4c4dJigHB7f1NvJaY5QJ8w7VqvLl86kz/5Pcf3u+2u
         9ReyhzLCrziEO6FQa+Ac8oLcqOY8OowfUsguxDStg9+XyiiR+ME9l8MPbXmDJhHQrPsJ
         kEc6R/XGtpTtwI77wMpW5ihHJ6w5F/99WIdeQrs1MchsRPR9yta8Eu3EfyBx/xceG2kr
         3V/uEOVR2tAbOau68z90KN/916cz/3kqo3d+5SZh8jlh7X7A1v4uBwn4zfEu2AwiKCe4
         JsY+BbsbNdyy0xtlxN+2m7xoiLI6QDKX0Y9iYde/EhRvIHwN7jbPaTHIxe67ljUdoqnT
         AM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702894308; x=1703499108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWVfo0YlGfjE9aDQP2Ly3L2JCb3LpM/ev0NxuURn88c=;
        b=qPskRILglWImkUGL20Y2BASGZqxNr3FYiw7A31DSrnMX7hq8DDouAz9EfK5iBp+blp
         6qbkAEN1/Yxb4RXO+XkpQzZGuQdrdt+QlFWsCH57jUSWYnhN1Mx9ffNSE2ejFIfodm5N
         bjkUJeP6zd7dBpmPyxCJkqM28GDZnvJnWQSk4h0BW/NnByVJ4apOS33oiDvRY2nRKI0/
         H4tRKyrSMs96T1TThCHzwUGBqR2+kGOHzJET2xfShx8hH7LYuQVnMFT3QGFWvHOWC303
         37u1QygXbY1k/zsfsW9WspvhLDp4eh1eHtY1q8ixmu1QO9kZfFDYO7ZTYL4A9vJ7i4Zj
         l6TA==
X-Gm-Message-State: AOJu0YxCGVM+iEN6559erkDsCTKULO3baAJnsQUK5jBlgUuZEkYyck2D
	dTxWVf4M7uv+sqZqxphULmrxShueqGj55kSRGnI=
X-Google-Smtp-Source: 
 AGHT+IFYAnVfFiaPLV3aOQmZxk09vqA3D8C1S99StKDu8dlQoGIILh+9qvsyJUfc1ZciBzGtPeAUAdzf88ItNIDemXY=
X-Received: by 2002:a05:6a00:2288:b0:6cd:e3ef:ce54 with SMTP id
 f8-20020a056a00228800b006cde3efce54mr34661547pfe.0.1702894308316; Mon, 18 Dec
 2023 02:11:48 -0800 (PST)
MIME-Version: 1.0
References: <1702891731-3417-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1702891731-3417-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 18 Dec 2023 07:11:36 -0300
Message-ID: 
 <CAOMZO5CjoXFx4uX7w7My_zSeo_+mhQqhWYH3PNdV6SQOUXTxtg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix channel swap issue on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: EXX2TTEWLK4PB2YPBNNO2BXRKEG6VEXV
X-Message-ID-Hash: EXX2TTEWLK4PB2YPBNNO2BXRKEG6VEXV
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EXX2TTEWLK4PB2YPBNNO2BXRKEG6VEXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 18, 2023 at 7:10=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> When flag mclk_with_tere and mclk_direction_output enabled,
> The SAI transmitter or receiver will be enabled in very early
> stage, that if FSL_SAI_xMR is set by previous case,
> for example previous case is one channel, current case is
> two channels, then current case started with wrong xMR in
> the beginning, then channel swap happen.
>
> The patch is to clear xMR in hw_free() to avoid such
> channel swap issue.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Fixes tag, please.
