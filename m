Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1756A98860E
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 15:04:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD2814E8;
	Fri, 27 Sep 2024 15:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD2814E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727442283;
	bh=lMZjaaCr3EBfndkZEzdIumPZ24tnOworlO7tnZ5+lEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m3HT6t6sRB7kq5onZhhYT1WB41k/DzISbQHy7s6p+66kFuj9knVcG9z8zynBrV7XG
	 zPCDI1+ex15ZaK/ipyG7TeuqFmhRfREkd3jKt5gS76mPrYgpAm9NDTJcj6UtqzFkcU
	 r8e79N87Hoy1ZYJ1+8o8H10tmm6NvlWV1NXC+0Ww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A23F8059F; Fri, 27 Sep 2024 15:04:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AED50F805B0;
	Fri, 27 Sep 2024 15:04:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC39BF802DB; Fri, 27 Sep 2024 15:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11328F80107
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 15:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11328F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CX5CIKlo
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2db85775c43so1580100a91.0
        for <alsa-devel@alsa-project.org>;
 Fri, 27 Sep 2024 06:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727442243; x=1728047043;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=CX5CIKlopwWvVuNSVQ46cONt4hNrzjc3FOuq1FWos4Mvubx3mmuVpJotHbX2hlWEqH
         0mcv/ZaF2MPMiSpQUIW6AMU3yesAktuwNZMeKacDj/kwyGL7z0RPOiNwbEejM++P5LgM
         ja168lpzb40cUgx27V0+/sH8QvPTrzMCzHKgnt+haO2vquopGlUGLrMh3hvo9PfPIg4f
         qaFAXvj1tKjEt0hpbXCPUQFDW8Lp+a56j1RSfFSOITOaMZ8T4TNVfKfqZO/2F8Eo6Atv
         +X4jXzAYvu+/gX2Tmk/7O4oH6+DgbJAJ8r2O9Zw/fAz5KesfbFO39cSMsywM4jYRTPfy
         j2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727442243; x=1728047043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLZBoouw/VuTYq1d8wJ2tQsyjB5lc2Ro32qoC8DsyX8=;
        b=wTrTHdGvZTuManqtOhJPPB25u1lZaDbV2wJOPLiMvFSbU5vPoeBq5UdBptFDxS1yli
         HcyYJdRSKy//zOEsJhuhWEc3vheYnNH4RDlKmNrasVGVt9ZJ0tMU8F8+pbnlQ3c+9lPQ
         gp4hIQc5txp6lttX1bK4yEJChnPj69ht0s/HdyAci5Bt3JoQVSRwiDPTPITCbOOmU05v
         olHia4Vfh8L9I5RzjLCLZUnFQKLkxfg04p/Foch0c/PrmTIjDW8UFA4Cs7+6n67VZjxc
         zjaJFLnGXn3X5knJUTUw3DZWsiJrbniFlN/lU1ITTd0VArehxRu67UQseyZVf2arNfjO
         qOLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWNtz1G0nUTMUpQb05rGKJkvSrx851tEgM9av48OxNRxny6iPW5YfdLYIl9mxJyAnw6YjKLcJt3NAt@alsa-project.org
X-Gm-Message-State: AOJu0Ywwx0+55pBW6Y4yA5ApJ+FMseSJ2D/E7SJUyxoXjTZhDqrrdOvh
	CqTxaD3fQHVC/6XkmcQGJUh3cB2AMsx8/Wso3Y1Ao1+jZU0yigMAA2+WFlmOvnIJCyA9XGt4nmW
	t4obCrsyy6Dfy/cNxE7JmwMRyia8=
X-Google-Smtp-Source: 
 AGHT+IFtB7KLDPn+GDWKySAL2J4hNThlacj2FyNRmL5tDSlTqDrYlCCyOxeg5M2NMx4sjqT6GHGIxy0O+b+GZDd+MQM=
X-Received: by 2002:a17:90a:8984:b0:2e0:855b:9b21 with SMTP id
 98e67ed59e1d1-2e09111a9ebmr10387052a91.8.1727442242759; Fri, 27 Sep 2024
 06:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be>
 <7ff1bfb73a6d6fc71f3d751dbb7133b045853f64.1727438777.git.geert+renesas@glider.be>
 <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
In-Reply-To: <00fd0f7d-e05b-4140-9997-b4ffe0fcd8e9@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 08:03:51 -0500
Message-ID: 
 <CAHCN7xKywTnuW9W-5abwpq8txNYhN39G9OX8zJDy_j=fqJFPfg@mail.gmail.com>
Subject: Re: [PATCH treewide 10/11] ARM: dts: nxp: imx: Switch to
 {hp,mic}-det-gpios
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
Message-ID-Hash: KTMJFRPEKEMBTWKV6H2HVGROSF4ZBMEA
X-Message-ID-Hash: KTMJFRPEKEMBTWKV6H2HVGROSF4ZBMEA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTMJFRPEKEMBTWKV6H2HVGROSF4ZBMEA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 27, 2024 at 8:00=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "hp-det-gpio" and "mic-det-gpio" properties by
> > "hp-det-gpios" resp. "mic-det-gpios" in Freescale Generic ASoC Sound
> > Card device nodes.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This has a run-time dependency on "ASoC: fsl-asoc-card: Add missing
> > handling of {hp,mic}-dt-gpios".
>
> Therefore this should wait a cycle. Patch is good, although maybe we
> should keep both properties for backwards compatibility?

I also wonder what the point of the customer fsl-asoc-card is when
used in conjunction with a standard audio codec because the simple
audio card works just fine.  I think they have some special drivers
that need it like their ARC/eARC and HDMI drivers, but I have tested
several NXP boards using a simple sound card and it works fine.

adam
>
> Subject: drop "nxp" prefix.
>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi  | 4 ++--
> >  arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts        | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi       | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 2 +-
> >  arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts         | 2 +-
>
>
> Best regards,
> Krzysztof
>
