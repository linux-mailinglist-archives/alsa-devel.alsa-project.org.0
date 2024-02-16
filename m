Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C4857C09
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Feb 2024 12:47:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8793BE72;
	Fri, 16 Feb 2024 12:47:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8793BE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708084070;
	bh=brDqgu+veoHirwdkbKDf0308k8BngHj6rCKvWtbcL88=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D3OMm9bkIiHiblkZiPdhJdLl6yvpGtHMvYFmjsC9GxbSfbGyacqJ5tB1abLl0fcwK
	 Ey5gI5fmf2ySHy6qLRefXrrVW/JkQqEmS+vFL6mu6jC2pAA3473HN5z88dm02d7Vwr
	 JiRnh1zYbe4MZofoVqf5vXCVqY8DUY+rZJEVTa5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59290F8057B; Fri, 16 Feb 2024 12:47:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A533F8056F;
	Fri, 16 Feb 2024 12:47:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62CD0F80238; Fri, 16 Feb 2024 12:47:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D060BF80104
	for <alsa-devel@alsa-project.org>; Fri, 16 Feb 2024 12:47:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D060BF80104
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso689277276.0
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Feb 2024 03:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084023; x=1708688823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQ7tnAKFUkQOj4UEtgJN4h/6u4fraBJnTp0nHjLT6cQ=;
        b=O+I6vFVFTCIPolpeZISJ0AyBXaKbqHHwGCPjDzUHswtgFm3hakzCCTZZDcQYl/E/pL
         RTimV5S/jQNauMP6E7uhieV2iZVPuoEroJMipJWsdO458umUn3z27JFV+GOau83bJ1+Y
         LVmJiBTI3p0cBdzaKLVHc9TWwrBuAyrHsA5iXhz8F1AePeplaTsfwPboljR0RZlG6Uot
         RkK/ogYYT5Q3bJyMS8Fox9oegv3bUD+9/iLm+EfIQGNTLvIb1u4sGKZ9TuV2Kd9t6Atp
         XAiygZxD/mpNdv/TMSKGhmngQByp32dUA4A6ILYq1NesaJbqOIFqbiWZNnbjfg5HglT4
         9pCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ4/mVGoFhwP3P97WscVcvsP5sEHYHW6H8/o4RXqrtleTIRZBT0yJQijp1vrDwc552Y11MNl718BSOo38z/6vB/5Nz5LEx+eAsJ8U=
X-Gm-Message-State: AOJu0YxFqdxBlSuKPzBrZEZ3avyRsqgpOT5lB3DQ657/VEu20qWcWmtZ
	/G1WhR0pUAcQnyQBfNrvvUgi+gQrMdnGVNpgwciCKlWRIhP32PgoHk1v5V8moac=
X-Google-Smtp-Source: 
 AGHT+IGf2qpMJkzVV4nblNTMUvqK2DPNGnSquT1fkK8u2fmsqd08WkiiGpc3eeSUxQukBM4mnYYGLA==
X-Received: by 2002:a25:ae1a:0:b0:dcc:8aaa:3ed3 with SMTP id
 a26-20020a25ae1a000000b00dcc8aaa3ed3mr4302341ybj.16.1708084022651;
        Fri, 16 Feb 2024 03:47:02 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id
 e2-20020a256902000000b00dc6e5ea9152sm283254ybc.29.2024.02.16.03.47.01
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:47:01 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so571288276.1
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Feb 2024 03:47:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+Jp5v4Vegh2uHxy7JBskyOmywrTZuwgBDdYvrYLI39F/9YtbuCDn9sfMP9q5hs8MrXYv16LugQbhgPYEINGQqlNwr5btQVVVoL7Q=
X-Received: by 2002:a5b:708:0:b0:dc6:cc35:35e9 with SMTP id
 g8-20020a5b0708000000b00dc6cc3535e9mr4412013ybq.35.1708084021189; Fri, 16 Feb
 2024 03:47:01 -0800 (PST)
MIME-Version: 1.0
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 12:46:48 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdXzObEqExtJZpUpXLfCWB5fW9ZhekbbotcxcMrN+uj0Ag@mail.gmail.com>
Message-ID: 
 <CAMuHMdXzObEqExtJZpUpXLfCWB5fW9ZhekbbotcxcMrN+uj0Ag@mail.gmail.com>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
	Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
	NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TTKKPN5T2GKGWURHUOYB6YU46SP6OPNR
X-Message-ID-Hash: TTKKPN5T2GKGWURHUOYB6YU46SP6OPNR
X-MailFrom: geert.uytterhoeven@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTKKPN5T2GKGWURHUOYB6YU46SP6OPNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 8, 2024 at 5:37=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  drivers/clk/renesas/r9a06g032-clocks.c        |  2 +-
>  drivers/clk/renesas/renesas-cpg-mssr.c        |  2 +-
>  drivers/clk/renesas/rzg2l-cpg.c               |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
