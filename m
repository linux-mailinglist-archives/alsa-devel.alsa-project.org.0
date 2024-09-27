Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C049885F9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 15:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9100314EB;
	Fri, 27 Sep 2024 15:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9100314EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727442023;
	bh=1xzPtrP9WWBtWHwKXCw5RV2T+tvRkxZEb51Bi1KojTE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kheLGto1ZuFVe5aZarV3/pdj3W52v6jgXS3BI2tg71YSowokttCJ7boQ+WMgI6uIU
	 MTtc2fabwrgwaBmCEmm7pa5ySNjj8z8843Yx0HwEh751KQ+lF8ARWcnyneyEjU1Vwl
	 w2zpbq9LKam4dHkF3M8+k/XX4VnLyiUyZNOVr6VI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56592F805B3; Fri, 27 Sep 2024 14:59:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59E31F805B1;
	Fri, 27 Sep 2024 14:59:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A91C1F802DB; Fri, 27 Sep 2024 14:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01919F80074
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 14:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01919F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CUHuLN+o
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2e0c7eaf159so528370a91.1
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Sep 2024 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727441984; x=1728046784;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=CUHuLN+on8S/wPUhogQattMg0A7jWtZNwKExp4LiG+LcQxFaUxLAL/oblpjB1XmFtF
         czT54qgdv5IzI4Z8ed3PMNFYpwJRn9ybVl4fX9U4dC01KryU2ASXze7A2Posqrz+bfi9
         xhe317dzvfW0QErrYMYSDQ49BdwB1D/DUmk8dEmzt9S20yucYsGkrHPqHg7w3HWFl+3K
         0uRKfg5FGc4Xoxf5Fjl0ic5V789LCbTONd2rkBujRVGeyzgMvEJceYgBhqDjODI8rf5D
         fBRWlY5Kjhpj8iIbvz7QmG/aIX3y8F4Eg8Rr+J2BmY5eqShdmm/jodZJCjGMEDfCt6yl
         NeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441984; x=1728046784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=eg34BmRDAXmMEfzuu36+KRR+3szvNmw8juJ7F10OJJveUx6kaV503VnZ65p0+Hs8yB
         huwWiPFxWjMa5l3d8FKYlIey6DHP2dNbDH18VUHRD7eq/Lgz996pqLonrczF6wqGBVLh
         2z5oRyO2xEn5p2tXDCfFxKXZSr8V0ur4GyHlNIwmANSLB2YvVQE9yNvzRdtJXa1bXqn3
         5nWq7FKBIN8aNUIzl45ju2GrBCxHyNPmGQzOulhsqIgtwgy1FSs+67v97Zx9YJ6KXzIZ
         yltVA0NSjqNi6iX3STa7cvO+SWnWdwPmonzQPV4rE8/fG5ZfZosZB943S6w3bLpKzDOb
         ydJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGNSJfgbx/AScFnqnqZd+2us6Ct6/L0Jy6H5TOBE7yNtNLWTW5iHVbhGxsvgdYXumKrFc7EVqpm9eQ@alsa-project.org
X-Gm-Message-State: AOJu0YyjzO6E/vS8KYTt/3RtP9aWbjtj7h7FrmI5sEY4V0PyGz6GdVR0
	zvtgsg7WErFyOvhkurlFVijMsv1+iLG32btyOrn7MwSgfLqdFngNbS5vrCIwedD7yT5bX/Dp6yh
	V7PNT60Dfir+l8+wcTw78dl/GYdo=
X-Google-Smtp-Source: 
 AGHT+IHCtWkk/m0gIJI4HjMGIxf6HDCRDpOESUdGt/5A/Krn13z9jK+YnLyf6mEmoZB4cokgO5ouczhwAV6HyE5bjfY=
X-Received: by 2002:a17:90b:1896:b0:2de:ec70:837 with SMTP id
 98e67ed59e1d1-2e0b876f84bmr4254037a91.1.1727441983559; Fri, 27 Sep 2024
 05:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be>
 <750d6ac7911aef9a461dca6d07e5c1fab6211ecb.1727438777.git.geert+renesas@glider.be>
 <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
In-Reply-To: <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 07:59:32 -0500
Message-ID: 
 <CAHCN7xKKs9mUvnqZaLE2gCsDau4QtZ706LLoYcS_47-U86-nfA@mail.gmail.com>
Subject: Re: [PATCH treewide 05/11] arm64: dts: renesas: beacon-renesom:
 Switch to mic-det-gpios
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Adrien Grassein <adrien.grassein@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: M3DND3OJKRXQ3ASQY66O4AHJQPU7WQHD
X-Message-ID-Hash: M3DND3OJKRXQ3ASQY66O4AHJQPU7WQHD
X-MailFrom: aford173@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3DND3OJKRXQ3ASQY66O4AHJQPU7WQHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 27, 2024 at 7:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "mic-det-gpio" property by "mic-det-gpios" in
> > Audio Graph Card device nodes.

Thanks!

> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Adam Ford <aford173@gmail.com>

>
> Best regards,
> Krzysztof
>
