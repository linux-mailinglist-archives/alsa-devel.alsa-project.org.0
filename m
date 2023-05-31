Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 212BF718F2C
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 01:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D22631F4;
	Thu,  1 Jun 2023 01:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D22631F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685577009;
	bh=ySswBbL09nw6u31OgFqX+0MfIGvwS4yUQTLMIxLH25E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rJYQDNBZ1uyErws6YPYZJRyxZUkl0ICW32SYWpJ1CiBpH/h3k7WW3C0nx+6n+Vn0J
	 on2xDLpevsNO+vVmTkBKng5By81F0k5WUkvu+YWs0QWtZcWX/oVETvw2NDxV6SStGZ
	 mzrC1rspyy1vlJlzt8uDkjpvXTg/4SSjm2BEc+WE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EDA5F80549; Thu,  1 Jun 2023 01:48:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14AFEF80548;
	Thu,  1 Jun 2023 01:48:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0795F80149; Thu,  1 Jun 2023 01:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B066F80132
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 01:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B066F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=WdWPXGLf
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-33bdab7b4caso678725ab.3
        for <alsa-devel@alsa-project.org>;
 Wed, 31 May 2023 16:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685576894; x=1688168894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xl/rPfybuWWRREKP0y1CQScxSYr/byrO3VlKqP/h1s=;
        b=WdWPXGLfqJN3uJzhpy5lBQ1NXyB7nJIH8g3pN2eddplananhwguaQuSE10Z3hC+2HR
         6N9+5FU5552q9H0U6tSDgzyst+KdDy10Jsp3UkHVcFxCU3pa2UbhrX1PdGFgUUYupjaS
         NPyOY3JJIX/hp4TKuQhlP9pBzBLJSy2Ep38uY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685576894; x=1688168894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xl/rPfybuWWRREKP0y1CQScxSYr/byrO3VlKqP/h1s=;
        b=YSUDI97wfQ9aEtiDRFgC9djooc2jsmY599NWayApH2XsYkh8bxOeTEImHcgFUn57w1
         N4GqU87zve51D69z5cSMSCJ72Lj4HuzAcsdIdOD9WmlLr1UgY4XOQCcgEN7FPbWAWvjn
         7ZQNh+91vI8lbrvk6QRpuvP1rbnVpxrqV6H/4aL+nU/VHI+JbcwUXyoFRewJJpNAHZtz
         PrfSKhq2V+Y584uhoFFA48Up8IYBdR+WsnDTlKvGOTDqbo2SAjT116F8EIZY6Oc/FKTq
         9laR8WrepDksDmTncwibo+kDItFZr9rXjIKmqDU6P6f4qnUYtFhr2qJ5Ywjr+UDDru+S
         gycA==
X-Gm-Message-State: AC+VfDwQOCD4d3VVrXwL55vTDQZ7yxzYk7XN6ZouD0VNDOaY0tv6GoWD
	2WFDvLtidQM8O7ujUZVmrgdDIy4WsjVXwq20++g=
X-Google-Smtp-Source: 
 ACHHUZ6RaxHXCdTtVzVa+2yJGrVKbFaYib5tuY1pVt2WMZqBv0POoisTPwerZVTuQQxTlknjRsoW6Q==
X-Received: by 2002:a92:d3c7:0:b0:33a:ee6b:895a with SMTP id
 c7-20020a92d3c7000000b0033aee6b895amr2918763ilh.18.1685576894178;
        Wed, 31 May 2023 16:48:14 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com.
 [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id
 c10-20020a92cf0a000000b0033181097e9esm3468138ilo.51.2023.05.31.16.48.11
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 16:48:13 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-33b398f2ab8so61825ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 31 May 2023 16:48:11 -0700 (PDT)
X-Received: by 2002:a05:6e02:1ca4:b0:33b:7a45:a950 with SMTP id
 x4-20020a056e021ca400b0033b7a45a950mr93109ill.18.1685576890947; Wed, 31 May
 2023 16:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230530072514.22001-1-trevor.wu@mediatek.com>
 <20230530072514.22001-3-trevor.wu@mediatek.com>
In-Reply-To: <20230530072514.22001-3-trevor.wu@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 31 May 2023 16:47:59 -0700
X-Gmail-Original-Message-ID: 
 <CAD=FV=XUKuDVb+B9i31TfyNwGY11MM-q6eJJVkrasj=GGboRcg@mail.gmail.com>
Message-ID: 
 <CAD=FV=XUKuDVb+B9i31TfyNwGY11MM-q6eJJVkrasj=GGboRcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: mediatek: mt8195: fix use-after-free in driver
 remove path
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JP5P44KILSYSXWHEAGOQLVSM5XNHPQHG
X-Message-ID-Hash: JP5P44KILSYSXWHEAGOQLVSM5XNHPQHG
X-MailFrom: dianders@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JP5P44KILSYSXWHEAGOQLVSM5XNHPQHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, May 30, 2023 at 12:25=E2=80=AFAM Trevor Wu <trevor.wu@mediatek.com>=
 wrote:
>
> diff --git a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c b/sound/soc/me=
diatek/mt8195/mt8195-audsys-clk.c
> index e0670e0dbd5b..09bd1a020421 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
> @@ -148,6 +148,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK=
] =3D {
>         GATE_AUD6(CLK_AUD_GASRC19, "aud_gasrc19", "top_asm_h", 19),
>  };
>
> +static void mt8195_audsys_clk_unregister(void *data)
> +{
> +       struct mtk_base_afe *afe =3D (struct mtk_base_afe *)data;

Same as in patch #1, the above cast isn't necessary. Other than that:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
