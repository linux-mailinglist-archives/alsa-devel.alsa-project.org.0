Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE063EE70C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 09:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0CBF9F6;
	Tue, 17 Aug 2021 09:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0CBF9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629184435;
	bh=gLYNp/i0X+lR6+19ICYCGfk4F/BH+/R2xv+QWt/dK0s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMpYfJGESqwLardMfJNFbqbnzyziIrDa1DOsJZSe/ZOW0jpOv8LqRlSrO6EcwmYrS
	 dQ9+MiCf0iDGpFpz8UVJqyDVWJs5QwegT9Zyq5vtKn8eni81dGDs+lfNrQjPC+Ee4b
	 2bB+onhJOzuptfZmaOfhSKVN3py8YgW059tBUTRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DB7AF8026D;
	Tue, 17 Aug 2021 09:12:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7F69F80272; Tue, 17 Aug 2021 09:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46021F80163
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 09:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46021F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="uh/WT0kl"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FW/xpWtM"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 1EB592B008FF;
 Tue, 17 Aug 2021 03:12:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 17 Aug 2021 03:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4/94n/KGPF1vmUxfP+ZmhtXHWFk
 9voOY4f3v9/jT4is=; b=uh/WT0klq5f6AqZrCKiOYaWIVTyNbpINzrtrQWQrLOy
 zn9iPa50CPXgWfj9REM4+u/o6KZ05onXMh9T3ya3y2vnVLlx4S+4OhWCD1SN+2r6
 5Y08YS8DbneXf1/LymasxgzXw9aaACgiTIGVMVaye5OBs2WMxK8vgiEY7b6Js9X2
 rhc38CJMkhgIZruXfdMuLxyh8pJrpAjceQxgFFsEYAxXuZilQmOrcfX+9BVEhSrq
 aqQFGR6tzEQ58PX7Oim1BhRppUIrzGEMO5VRenPl6lPj2LSqIlmJ64xvH2gULD5t
 GYnrq6VN+RSIzJ1X5hedDfkwHoHrRnJoGqs3/LBWobg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4/94n/
 KGPF1vmUxfP+ZmhtXHWFk9voOY4f3v9/jT4is=; b=FW/xpWtMyCM+KWUn6W7Fxp
 uT9cvwaaAGJOdTyVTLjJRwrc78g6+U9CEIqmqh0pznc/DvKBTFROwK9Bf9AH05cw
 g/lM9H4gglFclCvsAMMWUB4HDsEqSCGaOX87fMpX/Fh4LWhlH/PVHACcM621Ox/L
 NgnTdO5E/nV1vWVGmg3sSg1VtePekVqxfLJiEGw1nhh5RBQhsocW1ax61Y1YjIf3
 lN8vOJf56+xoKNIA59JNtyphd/B7eLavR+SNDkuogrN8nBnjpDb9FEVZVAjdq52u
 8Jl2yk07dDQ6HEdhb7fjhKDMYwTayR7Jakw4eHaF+hrb9tEkvN5s7fqduPMD67ag
 ==
X-ME-Sender: <xms:VmEbYUvCTXFq6hn7W8WkhggELcU8eFgT5P9HKdmoNRf6qN3siC9VSQ>
 <xme:VmEbYRc4xYkIJJFhDH_5DuuyPH3b6jx5A5D8cEw7RNf-WH9oZ1SO9atGvaiwWef7T
 zGvcXXLmN0MT4tlJeo>
X-ME-Received: <xmr:VmEbYfzj8XencrovpqpdEYBbZtLYqxQMa2ujcSj3aM_CHhF9cWLfQnidDbbtgb9MU1jx5RLt0VL5C9mnFlf-12kD0mL-AKQu11TH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VmEbYXPmBV6mWP5-J85esk3XJ36M6-cKhgydQ0iqbB1dHgQNC2WxcA>
 <xmx:VmEbYU811r2EH0Kl6q2VHresMHbqqEpk5G77hx_s2xo-ExytQAVHVA>
 <xmx:VmEbYfVI1G-jftzkSLa3CVOKhyhoNnRgAMDS3YpqMXa1FWlvd01NpQ>
 <xmx:WWEbYfVjMOHmKFS77OFi7iU4PjnXMVJbJTw0ZijdYNEuVfLvf20FV6RJy2U>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Aug 2021 03:12:22 -0400 (EDT)
Date: Tue, 17 Aug 2021 09:12:20 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?54+t5rab?= <fengzheng923@gmail.com>
Subject: Re: [PATCH v6 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
Message-ID: <20210817071220.idoxpwzbpemdjqdz@gilmour>
References: <20210711122055.4529-1-fengzheng923@gmail.com>
 <20210715074750.ewbggulc5kast6ez@gilmour>
 <CAE=m61_=XfhtG9Q1r34McWWCUXt1KP67cjZ0ER62+YaGrG+b4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yncixzh4whlvhxud"
Content-Disposition: inline
In-Reply-To: <CAE=m61_=XfhtG9Q1r34McWWCUXt1KP67cjZ0ER62+YaGrG+b4w@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jernej.skrabec@gmail.com,
 lgirdwood@gmail.com, wens@csie.org, Mark Brown <broonie@kernel.org>,
 krzk@kernel.org, p.zabel@pengutronix.de, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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


--yncixzh4whlvhxud
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Aug 01, 2021 at 05:47:46PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> > > +     /* DMIC num is N+1 */
> > > +     regmap_update_bits(host->regmap, SUN50I_DMIC_CH_NUM,
> > > +                        SUN50I_DMIC_CH_NUM_N_MASK,
> > > +                        SUN50I_DMIC_CH_NUM_N(channels - 1));
> > > +     host->chan_en =3D (1 << channels) - 1;
> > > +     regmap_write(host->regmap, SUN50I_DMIC_HPF_CTRL, host->chan_en);
> >
> > Do we need to store the channels bitmask in the main structure? It looks
> > fairly easy to generate, so I guess we could just use a macro
>=20
> I need to store channels bitmask and use it in sun50i_dmic_trigger functi=
on.

But you don't need it outside of hw_params. The channel setup is
typically done in hw_params, not in the trigger hook.

[...]

> > > +     /* Clocks */
> > > +     host->bus_clk =3D devm_clk_get(&pdev->dev, "bus");
> > > +     if (IS_ERR(host->bus_clk))
> > > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->bus_clk),
> > > +                                  "failed to get bus clock.\n");
> > > +
> > > +     host->dmic_clk =3D devm_clk_get(&pdev->dev, "mod");
> > > +     if (IS_ERR(host->dmic_clk))
> > > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->dmic_clk=
),
> > > +                                  "failed to get dmic clock.\n");
> > > +
> > > +     host->dma_params_rx.addr =3D res->start + SUN50I_DMIC_DATA;
> > > +     host->dma_params_rx.maxburst =3D 8;
> > > +
> > > +     platform_set_drvdata(pdev, host);
> > > +
> > > +     host->rst =3D devm_reset_control_get_optional_exclusive(&pdev->=
dev, NULL);
> > > +     if (IS_ERR(host->rst))
> > > +             return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
> > > +                                  "Failed to get reset.\n");
> >
> > Your binding states that the reset is mandatory so you don't need the
> > optional variant.
> >
> > > +     reset_control_deassert(host->rst);
> >
> > Can't this be moved to the runtime_pm hooks?
>=20
> Is this necessary? I see that most of the driver files execute
> reset_control_deassert in the probe function, and reset_control_assert
> in the remove function.

Your driver seems to not rely on the fact that the device remains
powered between each run anyway, so yeah, that way you will completely
power it down.

> >
> > > +     ret =3D devm_snd_soc_register_component(&pdev->dev,
> > > +                             &sun50i_dmic_component, &sun50i_dmic_da=
i, 1);
> >
> > Your second line should be aligned on the opening parenthesis
> >
> > > +     if (ret)
> > > +             return dev_err_probe(&pdev->dev, ret,
> > > +                                  "failed to register component.\n");
> > > +
> > > +     pm_runtime_enable(&pdev->dev);
> > > +     if (!pm_runtime_enabled(&pdev->dev)) {
> > > +             ret =3D sun50i_dmic_runtime_resume(&pdev->dev);
> > > +             if (ret)
> > > +                     goto err_unregister;
> > > +     }
> >
> > We have a depends on PM on some drivers already, so I guess it would
> > just make sense to add one more here instead of dealing with whether
> > runtime_pm is compiled in or not.
>=20
> I don't understand. I am referring to the sun4i-spdif.c file. Which
> driver files should I refer to?

That whole logic is there to enable the device is CONFIG_PM is not
enabled (and thus the calls to pm_runtime_* won't do anything).

Just add a depends on PM to your Kconfig entry, and call
pm_runtime_enable there.

Maxime

--yncixzh4whlvhxud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYRthVAAKCRDj7w1vZxhR
xV5tAQDgo2PFfMG3oI+WJpwKhRvxyNOZwsTG3w/3ZeravzZx4AEA8cAL7Kk9k3li
rT0wIeYDdfx6CDXMjnnGlqzr/0YvlAs=
=VTo/
-----END PGP SIGNATURE-----

--yncixzh4whlvhxud--
