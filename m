Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958026B49B6
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 16:15:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AECD01662;
	Fri, 10 Mar 2023 16:14:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AECD01662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678461320;
	bh=sgc8sIikzUKf8oaUnbtaXcTY2+rUOaKm8L45dmJWIxw=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rCTkgn3caEr1dQ0G0XdeZfFWHatXJZy/g38Dn2CpY96C1JCOZrWt2p+3YwjcLlEA5
	 1U45MHcybv+AtaVWNNGW0M7xbIcOxTyRCywMC5Kl0MCvfR24knqz80Jj3PifBHZsJu
	 bvZUq/UoThfCXf5rkqYpdzs0AtyKWC3HMy7ntwKc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11BDEF80236;
	Fri, 10 Mar 2023 16:14:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1148F8042F; Fri, 10 Mar 2023 16:14:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 871CCF8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 16:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 871CCF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XsSdofoM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45A48B82302
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4605C433A8
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678461261;
	bh=sgc8sIikzUKf8oaUnbtaXcTY2+rUOaKm8L45dmJWIxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XsSdofoMEl9DiYAK/5ZfZwS39YNneCyCkE2OMaRWREuFbfAKyFkSbPfX7MGZcG4M7
	 JAeBtbixw/gZHCVfI2L/DClYn6pJa7qjBMGz08lE6JrnCEkh0hSOMt43r5/aUqmZSz
	 OH855hrU5l1onGHH6KfbzuDFtdHssh/uoofSzr19FlyR2g9v+q5I70AUu22M+BmnRO
	 b8+zztOPCyBsxmSt4a6CqbzxeWH73JK8u/OCwRnI6XUMFF6eeqPuu0PTriEqEY1Asx
	 1WnD7DVAkpnF8vMtJpiy6LsQrLt/e0y4uqrj2F4+wPGAlLSnraGi8gEAXKDxdBpMdK
	 ELb1vvyozXFrw==
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-536c02c9dfbso102816167b3.11
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 07:14:21 -0800 (PST)
X-Gm-Message-State: AO0yUKVqX08OOJTQTk8RO4gmokA3rgOfrBbLV7Iotw3KsyZQsQhiaK88
	cdgFXBeKsVs/yszZwG6ot9tVGiYyHtFoMK+xIw==
X-Google-Smtp-Source: 
 AK7set9VS13tgdT+DzbUPAyK1hhAFX+2x0Vswnb9c7OreYxCI/2ydgI/cIMuWNP/8hWsvzFznbnbU6n4F1bUdn7w/qM=
X-Received: by 2002:a81:ad5a:0:b0:536:4d58:54b2 with SMTP id
 l26-20020a81ad5a000000b005364d5854b2mr17238450ywk.4.1678461260807; Fri, 10
 Mar 2023 07:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20230310144732.1546328-1-robh@kernel.org>
 <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
In-Reply-To: <a23852d7-c70c-a03c-99fb-b453bdc750a1@linux.intel.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 10 Mar 2023 09:14:08 -0600
X-Gmail-Original-Message-ID: 
 <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
Message-ID: 
 <CAL_Jsq+XBzEMWrz=quxq4TkrejMMFRRvo0UinghmBphtmr=XXw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Use of_property_present() for testing DT property
 presence
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VNDU6DMPAGFE5C4PGEP224ENE64VBPDD
X-Message-ID-Hash: VNDU6DMPAGFE5C4PGEP224ENE64VBPDD
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VNDU6DMPAGFE5C4PGEP224ENE64VBPDD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 10, 2023 at 9:01=E2=80=AFAM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 3/10/2023 3:47 PM, Rob Herring wrote:
> > It is preferred to use typed property access functions (i.e.
> > of_property_read_<type> functions) rather than low-level
> > of_get_property/of_find_property functions for reading properties. As
> > part of this, convert of_get_property/of_find_property calls to the
> > recently added of_property_present() helper when we just want to test
> > for presence of a property and nothing more.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >   sound/soc/codecs/lpass-macro-common.c | 2 +-
> >   sound/soc/generic/audio-graph-card.c  | 2 +-
> >   sound/soc/generic/audio-graph-card2.c | 2 +-
> >   sound/soc/mxs/mxs-sgtl5000.c          | 2 +-
> >   sound/soc/samsung/i2s.c               | 2 +-
> >   sound/soc/sh/fsi.c                    | 2 +-
> >   sound/soc/stm/stm32_i2s.c             | 2 +-
> >   sound/soc/stm/stm32_sai_sub.c         | 4 ++--
> >   sound/soc/tegra/tegra_asoc_machine.c  | 2 +-
> >   9 files changed, 10 insertions(+), 10 deletions(-)
> >
> > diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/l=
pass-macro-common.c
> > index 1b9082d237c1..f54baaad54d4 100644
> > --- a/sound/soc/codecs/lpass-macro-common.c
> > +++ b/sound/soc/codecs/lpass-macro-common.c
> > @@ -16,7 +16,7 @@ struct lpass_macro *lpass_macro_pds_init(struct devic=
e *dev)
> >       struct lpass_macro *l_pds;
> >       int ret;
> >
> > -     if (!of_find_property(dev->of_node, "power-domains", NULL))
> > +     if (!of_property_present(dev->of_node, "power-domains"))
> >               return NULL;
> >
> >       l_pds =3D devm_kzalloc(dev, sizeof(*l_pds), GFP_KERNEL);
> > diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/a=
udio-graph-card.c
> > index 5daa824a4ffc..d788f5f23a8a 100644
> > --- a/sound/soc/generic/audio-graph-card.c
> > +++ b/sound/soc/generic/audio-graph-card.c
> > @@ -78,7 +78,7 @@ static int graph_get_dai_id(struct device_node *ep)
> >                * only of_graph_parse_endpoint().
> >                * We need to check "reg" property
> >                */
> > -             if (of_get_property(ep,   "reg", NULL))
> > +             if (of_property_present(ep,   "reg"))
>
> Bit of nit picking, but any reason, why there are multiple spaces,
> before "reg" here?

Only because there was before and it was a scripted change.

Rob
